<?php
class ControllerExtensionModuleMultimodals extends Controller
{

    private $my_config;
    private $route;
    private $language_id;
    private $htmlFieldsArray;
    private $errors;

    public function __construct($params)
    {
        parent::__construct($params);

        $this->load->model('setting/setting');
        $this->my_config = $this->config->get('specialofferoutsite');

        $this->route = (isset($this->request->get['route'])) ? $this->request->get['route'] : 'common/home';

        $this->language_id = (int)$this->config->get('config_language_id');
		
        $this->load->language('extension/module/multimodals');
    }

    private function _getPathToTemplate($filename) {
       
         return 'extension/module/'.$filename;
    }

    public function index($settings)
    {
        $this->load->model('catalog/multimodal');

        $getModals = $this->model_catalog_multimodal->getModals();

        $data = $this->language->load('module/multimodals');

        $data['modals'] = array();
        $data['modals']['default'] = $data['modals']['form'] = $data['modals']['offer'] = array();
        $data['status_track'] = false;

        foreach($getModals as $idModal => $modal){
            if(!$this->_enabled($idModal, $modal)) continue;

            $data['modals'][$modal['type']][$idModal] = array(
                'title' =>  $modal['title'],
                'content' => html_entity_decode($modal['content'], ENT_QUOTES, 'UTF-8'),
                'show_modal' =>  $modal['show_modal'],
                'selector' => htmlspecialchars_decode($modal['selector']),
                'link' => $modal['link'],
                'timeout' => $modal['timeout'],
                'tries_time' => $modal['tries_time']
            );

            if($modal['show_modal'] == 'track_time') $data['status_track'] = true;

            switch($modal['type']){
                case 'default':
                    if($modal['show_modal']!= 'track_time') $this->_resetCookiesViewModals($idModal, true);
                    break;
                case 'form':
                    if($modal['show_modal']!= 'track_time') $this->_resetCookiesViewModals($idModal, true);
                    $data['modals']['form'][$idModal]['content'] = $modal['content'];
                    break;
                case 'offer':
                    $data['modals']['offer'][$idModal]['discount'] = array(
                        'status' => (int)$modal['discount'],
                        'type' => $modal['discount_type'],
                        'percent' => $modal['discount_percent'],
                        'sum' => $modal['discount_sum']
                    );
                    break;
            }

        }

        $data['default'] = $this->_renderDefault($data);
        $data['forms'] = $this->_renderForm($data);
        if(!empty($data['modals']['offer'])){
            $data['offers'] = $this->_renderOffer($data['modals']['offer']);
        }

        return $this->load->view($this->_getPathToTemplate('multimodal/main.tpl'), $data);
    }

    public function sendFormRequest()
    {
        $json = array();

        if($this->_validateForm()){
            if($this->_sendMailFormRequest()){
                $this->load->model('catalog/multimodal');

                $getModalFields = $this->_getFieldsArrayFromModal($this->request->get['form']);
                $getModal = $this->model_catalog_multimodal->getModalById($this->request->get['form']);

                $formData = array(
                    'name_form' => $getModal['title'],
                    'url' => urldecode($this->request->post['url']),
                    'email' => '',
                    'telephone' => ''
                );

                $fields = array();
                foreach($getModalFields as $keyField => $field){
                    $value = htmlspecialchars($this->request->post['f_modal'][$keyField]);

                    switch($this->my_config['fields'][$keyField]['type']){
                        case 'email':
                            $formData['email'] = $value;
                            break;
                        case 'telephone':
                            $formData['telephone'] = $value;
                            break;
                    }

                    $fields[$keyField] = array(
                        'name' => $getModalFields[$keyField],
                        'value' => $value
                    );
                }
                $formData['fields'] = $fields;
                //$this->__debug_print($formData);

                $this->model_catalog_multimodal->addRequest($formData);
                $json['success'] = $this->language->get('text_success_form_send');
            }
        } else {
            $json['errors'] = $this->errors;
        }

        $this->response->setOutput(json_encode($json));
    }

    private function _renderDefault($data)
    {
        return $this->load->view($this->_getPathToTemplate('multimodal/default.tpl'), $data);
    }

    private function _checkIntervalSuccessfulOffers()
    {
        if($this->my_config['timeout_offers'] === '0') return true;

        //Config interval successful offers
        if(isset($_COOKIE['__cfg_int_sfoff'])){
            $timeDiff = time() -  $_COOKIE['__cfg_int_sfoff'];
            if($timeDiff < ($this->my_config['timeout_offers'] * 86400)) return false;
        }

        return true;
    }

    private function _checkIntervalViewOffers()
    {
        if($this->my_config['interval'] === '0') return true;

        //Config interval views offers
        if(isset($_COOKIE['__cfgnitoff'])){
            $data = explode(',',$_COOKIE['__cfgnitoff']);    //Last viewed product id , count views,
            if($data[0] == $this->request->get['product_id']) return false;

            if($data[1] <= $this->my_config['interval']){
                setcookie('__cfgnitoff', ($this->request->get['product_id'].','.(++$data[1])), time() + 7 * 86400, '/', ".".$_SERVER['HTTP_HOST']);
                return false;
            } else {
                setcookie('__cfgnitoff', ($this->request->get['product_id'].',0'), time() + 7 * 86400, '/', ".".$_SERVER['HTTP_HOST']);
                return true;
            }
        } else {
            setcookie('__cfgnitoff', $this->request->get['product_id'].',1', time() + 7 * 86400, '/', ".".$_SERVER['HTTP_HOST']);
            return false;
        }
    }

    private function _renderOffer($offersArray = array())
    {
        $data = array();
        //$this->__debug_print($offersArray);
        $product_info = $this->model_catalog_product->getProduct($this->request->get['product_id']);
        if ($product_info && $product_info['quantity']) {
            if($this->_checkIntervalViewOffers() && $this->_checkIntervalSuccessfulOffers()){
                $this->load->model('catalog/product');

                //1 product = 1 offer
                $modal = reset($offersArray);
                $data = $this->load->language('extension/module/multimodals');
                $data['offer']['id_modal'] = key($offersArray);
                $data['offer']['title'] = $modal['title'];
                $data['offer']['content'] = $modal['content'];
                $data['offer']['show_modal'] = $modal['show_modal'];
                $data['offer']['timeout'] = $modal['timeout'];
                $data['offer']['selector'] = $modal['selector'];
$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
$data['product_name'] = $product_info['name'];	
                $data['delay'] = $this->my_config['delay'];

                $data['product_id'] = $this->request->get['product_id'];

                if($product_info['special'] > 0 && isset($this->my_config['exclude_special'])) return false;

                $data['price'] = ($product_info['special'] > 0) ? $product_info['special'] : $product_info['price'];
				
                $data['formatted_price'] =  $this->currency->format($this->tax->calculate($data['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

                if($this->my_config){
                    foreach($this->my_config as $key => $conf){
                        $data[$key] = $conf;
                    }
                }

                $data['minimum_price'] = 0;
                if(isset($modal['discount'])){
                    $data['minimum_price'] = $this->_getMinOfferPrice($data['offer']['id_modal'], $data['price']);
                }

                $data['currency_symbol'] = ($this->currency->getSymbolLeft($this->config->get('config_currency')) != '') ? $this->currency->getSymbolLeft($this->config->get('config_currency')) : $this->currency->getSymbolRight($this->config->get('config_currency'));

                if( $getProductCookie = $this->_isset_product_in_tries($this->request->get['product_id'])){
                    $data['hide_try'] = true;
                    $data['get_offer'] = $this->currency->format($this->tax->calculate($getProductCookie[1], 0, $this->config->get('config_tax')), $this->session->data['currency']);
                }
                if( isset($this->my_config['off_tries']) ){
                    $data['hide_try'] = true;
                    $data['off_tries'] = true;
                    $data['get_offer'] = $this->currency->format($this->tax->calculate($data['minimum_price'], 0, $this->config->get('config_tax')), $this->session->data['currency']);
                }

                $this->load->model('tool/image');
                $data['options'] = array();

				foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
					$product_option_value_data = array();

					foreach ($option['product_option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
								$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
							} else {
								$price = false;
							}

							$product_option_value_data[] = array(
								'product_option_value_id' => $option_value['product_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'image'                   => $option_value['image'] ? $this->model_tool_image->resize($option_value['image'], 50, 50) : '',
								'price'                   => $price,
								'price_prefix'            => $option_value['price_prefix']
							);
						}
					}

					$data['options'][] = array(
						'product_option_id'    => $option['product_option_id'],
						'product_option_value' => $product_option_value_data,
						'option_id'            => $option['option_id'],
						'name'                 => $option['name'],
						'type'                 => $option['type'],
						'value'                => $option['value'],
						'required'             => $option['required']
					);
				}
			
                //$this->__debug_print($data['options']);
                $data['link_send_offer'] =  str_replace('amp;','',$this->url->link('extension/module/multimodals/sendOffer', '', 'SSL'));
                $data['link_send_offer_with_cart'] =  str_replace('amp;','',$this->url->link('extension/module/multimodals/sendOfferWithCart', 'form='.$data['offer']['id_modal'], 'SSL'));
                $data['link_get_price'] =  str_replace('amp;','',$this->url->link('extension/module/multimodals/getPriceOffer', 'id_modal='.$data['offer']['id_modal'], 'SSL'));
                $data['link_try'] =  str_replace('amp;','',$this->url->link('extension/module/multimodals/makeTry', '', 'SSL'));

                $data['checkout'] =  str_replace('amp;','',$this->url->link('checkout/checkout', '', 'SSL'));
                $this->_resetCookiesViewModals($data['offer']['id_modal'], true);
            }
        }
        return $this->load->view($this->_getPathToTemplate('multimodal/offer.tpl'), $data);
    }

    /** Get price offer with options */
    public function getPriceOffer()
    {
        $json = array();
        if(!empty($this->request->post['offer_option'])){
            $this->load->model('catalog/multimodal');
            $this->load->model('catalog/product');

            $json['max_price'] = 0;

			 //*****************
			 
            foreach ($this->request->post['offer_option'] as $product_option_id => $option_value) {
                $this->model_catalog_multimodal->getOptionPrice($json['max_price'], $this->request->post['offer_product_id'], $product_option_id, $option_value);
            }

            $product_info = $this->model_catalog_product->getProduct($this->request->post['offer_product_id']);
            $product_price = ($product_info['special'] > 0) ? $product_info['special'] : $product_info['price'];
            $json['max_price'] += $product_price;
            $json['max_price_format'] = $this->currency->format( $json['max_price'], $this->session->data['currency']);

            $json['min_price'] = $this->_getMinOfferPrice($this->request->get['id_modal'], $json['max_price']);
        }
        $this->response->setOutput(json_encode($json));
    }

    /**
     * Get minimum available price for offer
     */
    private function _getMinOfferPrice($idModal, $price)
    {
        $returnPrice = 0;

        $this->load->model('catalog/multimodal');
        $getModal = $this->model_catalog_multimodal->getModalById($idModal);

        if(!$getModal['discount']) return $returnPrice;

        switch($getModal['discount_type']){
            case 'percent':
                $returnPrice = ($price / 100) * $getModal['discount_percent'];
                break;
            case 'sum':
                foreach(explode(',',$getModal['discount_sum']) as $step){
                    $discount = explode(':',$step);
                    if($price < $discount[0]){
                        $returnPrice = $price - $discount[1];
                        break;
                    }
                }
                break;
            default:
                break;
        }

        return $returnPrice;
    }

    /** Make offer */
    public function makeTry(){
        $json = array();
		
        if ($this->_isset_product_in_tries(empty($this->request->post['offer_product_id']))){
		//if ($this->_isset_product_in_tries($this->request->post['offer_product_id'])){
			return false;
		}

        $this->load->model('catalog/product');
        $this->load->model('catalog/multimodal');

        $getModal = $this->model_catalog_multimodal->getModalById($this->request->post['id_modal']);
        $product_info = $this->model_catalog_product->getProduct($this->request->post['offer_product_id']);

        $get_max_price = ($product_info['special'] > 0) ? $product_info['special'] : $product_info['price'];
        $option = array();
        //Check required option

        if(!empty($this->request->post['offer_option'])){

            $this->load->language('checkout/cart');

            $product_options = $this->model_catalog_product->getProductOptions($this->request->post['offer_product_id']);

            if (isset($this->request->post['offer_option'])) {
                $option = array_filter($this->request->post['offer_option']);
            } else {
                $option = array();
            }

            foreach ($product_options as $product_option) {
                if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
                    $json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
                }
            }
            if(isset($json['error'])){
                $json['error_text'] = $this->language->get('error_required_options');
                $this->response->setOutput(json_encode($json));
                //return false;
            }
			
            foreach ($this->request->post['offer_option'] as $product_option_id => $option_value) {
                $this->model_catalog_multimodal->getOptionPrice($get_max_price, $this->request->post['offer_product_id'], $product_option_id, $option_value);
            }
        }

        $get_min_price = $this->_getMinOfferPrice($this->request->post['id_modal'], $get_max_price);

        $try_products = (isset($_COOKIE['try_products'])) ? explode(',', $_COOKIE['try_products']) : array();

        $offerPrice = floatval($this->request->post['offer_value']);

        if( ($get_min_price <= $offerPrice) && ($offerPrice <= $get_max_price) ){
            $try_products[] = $this->request->post['offer_product_id'].':'.$offerPrice;

            $timeDays = ($getModal['tries_time'] > 0) ? $getModal['tries_time'] : 7;
            $time = time() + $timeDays * 86400;

            setcookie('try_products', implode(',', $try_products), $time, '/', ".".$_SERVER['HTTP_HOST']);
            $json['success'] =  $this->currency->format($this->tax->calculate($this->request->post['offer_value'], 0, $this->config->get('config_tax')), $this->session->data['currency']);

            //Checkout with default cart
            if(isset($this->my_config['offer_order_with_cart'])){
                $this->cart->add($this->request->post['offer_product_id'],1,$option);
                $this->_rememberBoughtProduct($this->request->post['offer_product_id'], $timeDays);
            }
        } else if($get_min_price > $offerPrice) {
            $json['low_price'] = $this->language->get('text_low_price');
            if(isset($this->my_config['low_phrases']) && !empty($this->my_config['low_phrases'])){
                $json['low_price'] = $this->my_config['low_phrases'][array_rand($this->my_config['low_phrases'])];
            }
        } else if($get_max_price < $offerPrice) {
            $json['high_price'] = $this->language->get('text_high_price');
            if(isset($this->my_config['high_phrases']) && !empty($this->my_config['high_phrases'])){
                $json['high_price'] = $this->my_config['high_phrases'][array_rand($this->my_config['high_phrases'])];
            }
        }

        $this->response->setOutput(json_encode($json));
    }

    /** Send quick offer */
    public function sendOffer(){
        $json = array();

        if(!$errors = $this->_validate()) {
            $offer = 0;

            $this->load->model('catalog/product');
            $this->load->model('catalog/multimodal');

            $getModal = $this->model_catalog_multimodal->getModalById($this->request->post['id_modal']);
            $product_info = $this->model_catalog_product->getProduct($this->request->post['sp_of_form_product_id']);

            $try_products = array();

            if (isset($this->my_config['off_tries'])) {
                $price = ($product_info['special'] > 0) ? $product_info['special'] : $product_info['price'];
                $offer = $this->_getMinOfferPrice($this->request->post['id_modal'], $price);
            } else {
                $try_products = explode(',', $_COOKIE['try_products']);
                foreach ($try_products as $key => $product) {
                    $get_parts = explode(':', $product);

                    if ($get_parts[0] == $this->request->post['sp_of_form_product_id']) {
                        unset($try_products[$key]);
                        $offer = $this->currency->format($this->tax->calculate($get_parts[1], 0, $this->config->get('config_tax')), $this->session->data['currency']);
                        break;
                    }
                }
            }

            $timeDays = ($getModal['tries_time'] > 0) ? $getModal['tries_time'] : 7;
            $time = time() + $timeDays * 86400;
            setcookie('try_products', implode(',', $try_products), $time, '/', "." . $_SERVER['HTTP_HOST']);
            $this->_rememberBoughtProduct($this->request->post['sp_of_form_product_id'], $timeDays);

            $this->_send_admin_mail(array(
                    'offer' => $offer,
                    'product_name' => $product_info['name'],
                    'link_product' => $this->url->link('product/product', '&product_id=' . $this->request->post['sp_of_form_product_id'])
                )
            );

            $offer_success = $this->my_config['offer_success'];
            $json['success'] = html_entity_decode($offer_success[$this->language_id], ENT_NOQUOTES, 'UTF-8');
            if ($this->my_config['timeout_offers']) {
                setcookie('__cfg_int_sfoff', time(), time() + $this->my_config['timeout_offers'] * 86400, '/', "." . $_SERVER['HTTP_HOST']);
            }
        }
        else $json['errors'] = $errors;

        $this->response->setOutput(json_encode($json));
    }

    /** Send offer with cart */
    public function sendOfferWithCart(){
        $json = array();
        if ( $this->request->server['REQUEST_METHOD'] == 'POST' ) {
            $this->load->model('catalog/multimodal');
            $this->load->model('catalog/product');

            $getModal = $this->model_catalog_multimodal->getModalById($this->request->get['form']);
            $product_info = $this->model_catalog_product->getProduct($this->request->post['sp_of_form_product_id']);

            $price = ($product_info['special'] > 0) ? $product_info['special'] : $product_info['price'];
            $offer = $this->_getMinOfferPrice($this->request->get['form'], $price);

            $timeDays = ($getModal['tries_time'] > 0) ? $getModal['tries_time'] : 7;
            $time = time() + $timeDays * 86400;

            $try_products = (isset($_COOKIE['try_products'])) ? explode(',', $_COOKIE['try_products']) : array();
            $try_products[] = $this->request->post['sp_of_form_product_id'].':'.$offer;
            setcookie('try_products', implode(',', $try_products), $time, '/', ".".$_SERVER['HTTP_HOST']);

            $this->cart->add($this->request->post['sp_of_form_product_id']);
            $this->_rememberBoughtProduct($this->request->post['sp_of_form_product_id'], $timeDays);

            $offer_success = $this->config->get('offer_success');

            $json['success'] = html_entity_decode($offer_success[$this->language_id], ENT_NOQUOTES, 'UTF-8');
            if($this->my_config['timeout_offers']){
                setcookie('__cfg_int_sfoff', time(), time() + $this->my_config['timeout_offers'] * 86400, '/', ".".$_SERVER['HTTP_HOST']);
            }
        }
        $this->response->setOutput(json_encode($json));
    }

    private function _rememberBoughtProduct($id, $cntDays)
    {
        $products = (isset($_COOKIE['bought_pds'])) ? explode(',',$_COOKIE['bought_pds']) : array();
        $products[] = $id;
        setCookie('bought_pds', implode(',', $products), time() + $cntDays * 86400, '/', ".".$_SERVER['HTTP_HOST']);
    }

    private function _validate()
    {
        $errors = array();

        if(isset($this->my_config['checkout_name'])){
            if(!isset($this->request->post['sp_of_form_name']) || empty($this->request->post['sp_of_form_name'])){
                $errors['name'] = 'name';
            }
        }

        if(isset($this->my_config['checkout_phone'])){
            if(!isset($this->request->post['sp_of_form_phone']) || empty($this->request->post['sp_of_form_phone'])){
                $errors['phone'] = 'phone';
            }
        }

        if(isset($this->my_config['checkout_email'])){
            if(!isset($this->request->post['sp_of_form_email']) || empty($this->request->post['sp_of_form_email']) || !filter_var($this->request->post['sp_of_form_email'], FILTER_VALIDATE_EMAIL) ){
                $errors['email'] = 'email';
            }
        }

        return (!empty($errors)) ? $errors : false;
    }

    private function _isset_product_in_tries($product_id)
    {
        if(isset($_COOKIE['try_products'])){
            foreach( explode(',', $_COOKIE['try_products']) as $product){
                $get_parts = explode(':', $product);
                if($get_parts[0] == $product_id) return $get_parts;
            }
        }

        return false;
    }

    private function _send_admin_mail($sendData)
    {
        $setFrom = (isset($this->request->post['sp_of_form_email'])) ? $this->request->post['sp_of_form_email'] : $this->config->get('config_email');
        $setSender = (isset($this->request->post['sp_of_form_name'])) ? $this->request->post['sp_of_form_name'] : $this->config->get('config_email');

        // HTML Mail
        $data = $this->language->load('module/multimodals');

        $data['name'] = $sendData['product_name'];
        $data['link'] = $sendData['link_product'];
        if(isset($this->my_config['checkout_name'])) {
            $data['checkout_name'] = html_entity_decode($this->request->post['sp_of_form_name'], ENT_NOQUOTES, 'UTF-8');
        }
        if(isset($this->my_config['checkout_phone'])) {
            $data['checkout_phone'] = html_entity_decode($this->request->post['sp_of_form_phone'], ENT_NOQUOTES, 'UTF-8');
        }
        if(isset($this->my_config['checkout_email'])) {
            $data['checkout_email'] = html_entity_decode($this->request->post['sp_of_form_email'], ENT_NOQUOTES, 'UTF-8');
        }
        $data['offer'] = $sendData['offer'];

        $html = $this->load->view($this->_getPathToTemplate('multimodal/mail_offer.tpl'), $data);

        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

        $mail->setTo($this->config->get('config_email'));
        $mail->setFrom($setFrom);
        $mail->setSender($setSender);
        $mail->setSubject(html_entity_decode($this->language->get('text_mail_subject'), ENT_QUOTES, 'UTF-8'));
        $mail->setHtml($html);
        $mail->setText(html_entity_decode($html, ENT_QUOTES, 'UTF-8'));
        $mail->send();
    }

    private function _renderForm($data)
    {
        foreach($data['modals']['form'] as $idModal => $modal){
            //$this->__debug_print($modal['content']);
            $contentReplaced = strtr($modal['content'], $this->_getHtmlFieldsArray());
            $data['modals']['form'][$idModal]['content'] = html_entity_decode($contentReplaced, ENT_QUOTES, 'UTF-8');
        }
		//$this->__debug_print($getConfig);
        return $this->load->view($this->_getPathToTemplate('multimodal/form.tpl'), $data);
    }

    private function _getFieldsArrayFromModal($idModal)
    {
        $returnFieldsArray = array();

        $this->load->model('catalog/multimodal');
        $getModal = $this->model_catalog_multimodal->getModalById($idModal);

        $getAllFields = $this->my_config['fields'];
        foreach($getAllFields as $key => $field){
            if(strpos($getModal['content'], '{{field_'.$key.'}}') !== false){
                $returnFieldsArray[$key] = $field['name'][$this->language_id];
            }
        }

        return $returnFieldsArray;
    }

    private function _getHtmlFieldsArray()
    {
        if($this->htmlFieldsArray) return $this->htmlFieldsArray;

        $getAllFields = $this->my_config['fields'];
        foreach($getAllFields as $key => $field){
            $this->htmlFieldsArray['{{field_'.$key.'}}'] = $this->_getFieldToHtmlElement($key, $field);
        }

        return $this->htmlFieldsArray;
    }

    private function _getFieldToHtmlElement($id, $element)
    {
        switch($element['type']){
            case 'text':
                return '<input type="text" name="f_modal['.$id.']" placeholder="'.$element['placeholder'][$this->language_id].'" />';
            case 'email':
                return '<input type="email" name="f_modal['.$id.']" placeholder="'.$element['placeholder'][$this->language_id].'"/>';
            case 'telephone':
                return '<input type="tel" class="validate-mask" data-mask="'.$element['mask_phone'].'"  name="f_modal['.$id.']" placeholder="'.$element['placeholder'][$this->language_id].'"/>';
            case 'checkbox':
                return '<input type="checkbox" name="f_modal['.$id.']" />';
            case 'date':
                return '<input type="date" name="f_modal['.$id.']" placeholder="'.$element['placeholder'][$this->language_id].'"/>';
            case 'textarea':
                return '<textarea name="f_modal['.$id.']" placeholder="'.$element['placeholder'][$this->language_id].'"></textarea>';
            case 'select':
                //$this->__debug_print($element);
                $select = '<select name="f_modal['.$id.']">';
                foreach( explode(';',$element['select_options'][$this->language_id]) as $option){
                    $select .= '<option>'.$option.'</option>';
                }
                $select .= '</select>';
                return $select;
            default:
                return '';
        }
    }

    private function _parseCookiesViewModals(){
        $data = array();

        if(isset($_COOKIE['__vmow'])){
            $dataOpens = explode(';',$_COOKIE['__vmow']);
            foreach($dataOpens as $item){
                $getData = explode(',',$item);
                $data[$getData[0]] = $getData[1];
            }
        }
        return $data;
    }

    private function _resetCookiesViewModals($id = false, $addNew = false){
        $dataToCookie = array();
        if(isset($_COOKIE['__vmow'])){
            $getCookies = $this->_parseCookiesViewModals();
            foreach($getCookies as $idItem => $date){
                if($id && !$addNew && (in_array($id, $getCookies)) ) continue;
                $dataToCookie[] = $idItem.','.$date;
            }
            if( $addNew && (!in_array($id, $getCookies)) ) $dataToCookie[] = $id.','.time();
        } else if($addNew) {
            $dataToCookie[] = $id.','.time();
        }

        setCookie('__vmow',implode(';',$dataToCookie), time() + 7 * 86400, '/', ".".$_SERVER['HTTP_HOST']);
    }

    public function _enabled($id, $modal)
    {
        //if the modal is already open
        if( $modal['tries_time'] && ($modal['show_modal'] != 'selector') && isset($_COOKIE['__vmow'])){
            $getCookies = $this->_parseCookiesViewModals();
            foreach($getCookies as $idModal => $timeView){
                if($idModal == $id){
                    $lastDateOpen = date('Y-m-d',$timeView);
                    if($lastDateOpen < date('Y-m-d')){
                        $dStart = new DateTime($lastDateOpen);
                        $dEnd = new DateTime(date('Y-m-d'));
                        $dDiff = $dStart->diff($dEnd);
                        $dDiff->format('%R');
                        if($dDiff->days >= $modal['tries_time']){
                            $this->_resetCookiesViewModals($id);
                        } else {
                            return false;
                        }
                    } else return false;
                }
            }
        }
        //Date period
        $today = date('Y-m-d H:i:s');
        if($modal['st_period']){
            if( ($today <= $modal['date_from'] ) || ($today >= $modal['date_to']) ) return false;
        }

        //If criteria products not empty - check current id product in list
        if(isset($this->request->get['product_id'])){
            if( !empty($modal['include_products']) && !in_array($this->request->get['product_id'], $modal['include_products']) ) return false;
        }
        //Type offer
        if( $modal['type'] == 'offer'){
            //Check product route
            if( ($this->route != 'product/product') && !isset($this->request->get['product_id']) ) return false;

            //If this product bought
            if(isset($_COOKIE['bought_pds'])){
                $bought_products = explode(',',$_COOKIE['bought_pds']);
                if(in_array($this->request->get['product_id'], $bought_products)) return false;
            }
        } else { // Default type or form

            // Layout
            if(!$modal['all_layouts']){
                $this->load->model('design/layout');
                $getLayout = $this->model_design_layout->getLayout($this->route);
                if( !in_array($getLayout, $modal['layouts'])) return false;
            }

            //Customer group
            $customerGroup = $this->customer->getGroupId();
            if( empty($modal['customer_groups'])) return false;

            if( $customerGroup && !in_array($customerGroup, $modal['customer_groups']) ) return false;
        }
        
        //Check category
        if(!$modal['all_categories'] && empty($modal['include_products'])){

            $this->load->model('catalog/product');
            $getCategories = $this->model_catalog_product->getCategories($this->request->get['product_id']);
            $flag = false;
            foreach($getCategories as $category){
                if( in_array($category['category_id'], $modal['categories'])) $flag = true;
            }
            if(!$flag) return false;
        }

        return true;
    }

    private function _validateForm()
    {
        $getAllFields = $this->my_config['fields'];

        foreach($this->request->post['f_modal'] as $idField => $field){

            if(isset($getAllFields[$idField]['required']) && empty($field)){
                $this->errors[$idField] = $getAllFields[$idField]['error'][$this->language_id];
            }

            switch($getAllFields[$idField]['type']){
                case 'email':
                    if(!filter_var($field, FILTER_VALIDATE_EMAIL)) {
                        $this->errors[$idField] = $this->language->get('text_error_email');
                    }
                    break;
                case 'telephone':
                    if($getAllFields[$idField]['mask_phone']) {
                        $pattern = '/^';
                        foreach (str_split($getAllFields[$idField]['mask_phone']) as $char) {
                            $pattern .= '[' . str_replace('9', '0-9', $char) . ']';
                        }
                        $pattern .= '*$/';
                        if (!preg_match($pattern, $field)) {
                            $this->errors[$idField] = $this->language->get('not_correct_phone');
                        }
                    }
                    break;
            }
        }

        return (!$this->errors) ? true : false;
    }

    private function _sendMailFormRequest()
    {
        // HTML Mail

        $data = $this->language->load('module/multimodals');
        $getModalFields = $this->_getFieldsArrayFromModal($this->request->get['form']);

        $this->load->model('catalog/multimodal');
        $getModal = $this->model_catalog_multimodal->getModalById($this->request->get['form']);

        foreach($getModalFields as $keyField => $field){
            $data['fields'][$keyField] = html_entity_decode($this->request->post['f_modal'][$keyField], ENT_NOQUOTES, 'UTF-8');
        }
        $to = (!empty($getModal['email'])) ? trim($getModal['email']) : $this->config->get('config_email');
        //$this->__debug_print($getModalFields);

        $data['all_fields'] = $getModalFields;
        $data['url'] = urldecode($this->request->post['url']);

        $html = $this->load->view($this->_getPathToTemplate('multimodal/mail_form.tpl'), $data);

        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

        $mail->setTo($to);
        $mail->setFrom($this->config->get('config_email'));
        $mail->setSender($this->config->get('config_name'));
        $mail->setSubject(html_entity_decode($getModal['title'].' - '.$data['text_subject_form'], ENT_QUOTES, 'UTF-8'));
        $mail->setHtml($html);
        $mail->setText(html_entity_decode(strip_tags($html), ENT_QUOTES, 'UTF-8'));
        $mail->send();

        return true;
    }

    private function __debug_print($array)
    {
        if(isset($_COOKIE['_debug'])){
            echo '<pre>';
            print_r($array);
            var_dump($array);
            die;
        }
    }


}