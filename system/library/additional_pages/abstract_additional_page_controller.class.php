<?php

require_once(DIR_SYSTEM . 'library/additional_pages/page_name.class.php');

class AbstractAdditionalPageController extends Controller
{
    public $url_params = '';

    protected $module_name;
    protected $data;

    public function __construct($registry)
    {
        parent::__construct($registry);

        $this->module_name = 'product/' . $this->page_name;
        $settings = array();
        if ($this->config->get('additional_pages_settings')){
            $settings = $this->config->get('additional_pages_settings');
        }
        //$this->log->write($this->config->get('additional_pages_settings'));

        $this->loadLanguage();
        $this->loadModels();

        $this->document->setTitle($settings[$this->page_name][$this->config->get('config_language_id')]['meta_title']);

        $this->document->setRobots('noindex,follow');

        $this->document->setDescription($settings[$this->page_name][$this->config->get('config_language_id')]['meta_description']);
        $this->document->setKeywords($settings[$this->page_name][$this->config->get('config_language_id')]['meta_keyword']);

        $this->url_params = $this->getAllUrlParams();

        $data = array();
        $data['breadcrumbs'] = $this->getBreadcrumbs();

        $data['heading_title'] = $settings[$this->page_name][$this->config->get('config_language_id')]['name'];
        $data['description'] = html_entity_decode($settings[$this->page_name][$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8');

        $data['text_empty'] = $this->language->get('text_empty');
        $data['text_quantity'] = $this->language->get('text_quantity');
        $data['text_manufacturer'] = $this->language->get('text_manufacturer');
        $data['text_model'] = $this->language->get('text_model');
        $data['text_price'] = $this->language->get('text_price');
        $data['text_tax'] = $this->language->get('text_tax');
        $data['text_points'] = $this->language->get('text_points');
        $data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
        $data['text_sort'] = $this->language->get('text_sort');
        $data['text_limit'] = $this->language->get('text_limit');
        $data['button_cart'] = $this->language->get('button_cart');
        $data['button_wishlist'] = $this->language->get('button_wishlist');
        $data['button_compare'] = $this->language->get('button_compare');
        $data['button_list'] = $this->language->get('button_list');
        $data['button_grid'] = $this->language->get('button_grid');
        $data['button_continue'] = $this->language->get('button_continue');		
        $data['text_endlesstext'] = $this->language->get('text_endlesstext');
		$data['text_empty'] = $this->language->get('text_empty');	
        $data['button_incart'] = $this->language->get('button_incart');
	

        $data['compare'] = $this->url->link('product/compare');

        $this->data = $data;
    }

    protected function loadLanguage()
    {
        $this->load->language($this->module_name);
    }

    protected function loadModels()
    {
        $this->load->model('module/additional_pages');
        $this->load->model('catalog/product');
        $this->load->model('tool/image');
    }

    protected function loadPageElements(&$data)
    {
        $data['continue'] = $this->url->link('common/home');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');

        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
    }

    public function getFilterData($default_sort = 'p.date_added', $default_order = 'DESC')
    {
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = $default_sort;
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = $default_order;
        }

        $page = $this->getCurrentPageNumber();
        $limit = $this->getCurrentLimit();

        $filter_data = array(
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $limit,
            'limit' => $limit
        );
        return $filter_data;
    }

    protected function getCurrentPageNumber()
    {
        $page_num = 1;
        if (isset($this->request->get['page'])) {
            $page_num = $this->request->get['page'];
        }
        return $page_num;
    }

    protected function getCurrentLimit()
    {
        $limit = $this->getConfigProductLimit();

        if (isset($this->request->get['limit'])) {
            $lim = $this->request->get['limit'];
            if ($lim == '15' || $lim == '25' || $lim == '50' || $lim == '75' || $lim == '100') {
                $limit = (int)$this->request->get['limit'];
            }
        }
        return $limit;
    }

    protected function getConfigProductLimit()
    {
        if (version_compare(VERSION, '2.2.0.0', '>=')) {
            return $this->config->get($this->config->get('config_theme') . '_product_limit');
        }
        return $this->config->get('config_product_limit');
    }

    protected function getConfigProductDescriptionLength()
    {
        if (version_compare(VERSION, '2.2.0.0', '>=')) {
            return $this->config->get($this->config->get('config_theme') . '_product_description_length');
        }
        return $this->config->get('config_product_description_length');
    }

    /**
     * @return string $url_params (concatenated GET parameters)
     */
    protected function getAllUrlParams()
    {
        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }
        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }
        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        if (isset($this->request->get['limit'])) {
            $url .= '&limit=' . $this->request->get['limit'];
        }

        return $url;
    }

    public function getBreadcrumbs()
    {
        $breadcrumbs = array();

        $breadcrumbs[] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
        );
        $breadcrumbs[] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link($this->module_name, $this->url_params),
        );

        return $breadcrumbs;
    }

    public function getLimits()
    {
        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $possibleLimits = array_unique(array($this->getConfigProductLimit(), 60, 90));

        sort($possibleLimits);

        $limits = array();
        foreach ($possibleLimits as $value) {
            $limits[] = array(
                'text' => $value,
                'value' => $value,
                'href' => $this->url->link($this->module_name, $url . '&limit=' . $value),
            );
        }

        return $limits;
    }


    public function getProductsResults(&$results)
    {
        $products = array();
        foreach ($results as &$result) {
            $products[] = $this->getProductInfo($result);
        }

        return $products;
    }

    protected function getProductInfo(&$result)
    {
        $config_img_width = $this->config->get('config_image_product_width');
        $config_img_height = $this->config->get('config_image_product_height');
        $config_customer_price = $this->config->get('config_customer_price');
        $config_tax = $this->config->get('config_tax');
        $config_review_status = $this->config->get('config_review_status');

        if (version_compare(VERSION, '2.2.0.0', '>=')) {
            $config_theme = $this->config->get('config_theme');

            $config_img_width = $this->config->get($config_theme . '_image_product_width');
            $config_img_height = $this->config->get($config_theme . '_image_product_height');
        }

        if ($result['image']) {
            $image = $this->model_tool_image->resize($result['image'], $config_img_width, $config_img_height);
        } else {
            $image = $this->model_tool_image->resize('placeholder.png', $config_img_width, $config_img_height);
        }

        if (($config_customer_price && $this->customer->isLogged()) || !$config_customer_price) {
            $price = $this->formatPrice($result['price'], $result['tax_class_id'], $config_tax);
        } else {
            $price = false;
        }

        if ((float)$result['special']) {
            $special = $this->formatPrice((float)$result['special'], $result['tax_class_id'], $config_tax);
        } else {
            $special = false;
        }

        if ($this->config->get('config_tax')) {
            $tax = $this->formatPriceForTax((float)$result['special'] ? $result['special'] : $result['price']);
        } else {
            $tax = false;
        }

        if ($config_review_status) {
            $rating = (int)$result['rating'];
        } else {
            $rating = false;
        }
  //manufac
				$this->load->model('catalog/manufacturer');
                $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($result['manufacturer_id']);
                $logo_image = $this->model_tool_image->resize($manufacturer_info['image'], 150, 100);
                //manufac
                $cart = false;
        foreach ($this->cart->getProducts() as $product) {
            if ($product['product_id'] == $result['product_id']) {
                $cart = true;
                break;
            }
        }
              // XD Stickers start
$this->load->model('setting/setting');
$xd_stickers = $this->config->get('xd_stickers');
$current_language_id = $this->config->get('config_language_id');
$product_xd_stickers = array();
if ($xd_stickers['status']) {
if ($xd_stickers['sold']['status'] == '1') {
if ($result['quantity'] <= 0) {
$product_xd_stickers[] = array(
'id'			=> 'xd_sticker_sold',
'text'			=> $xd_stickers['sold']['text'][$current_language_id]
);
}
}
if ($xd_stickers['sale']['status'] == '1') {
if ((float)$result['special']) {
$product_xd_stickers[] = array(
'id'			=> 'xd_sticker_sale',
'text'			=> $xd_stickers['sale']['text'][$current_language_id]
);
}
}
if ($xd_stickers['bestseller']['status'] == '1') {
$bestsellers = $this->model_catalog_product->getBestSellerProducts((int)$xd_stickers['bestseller']['property']);
foreach ($bestsellers as $bestseller) {
if ($bestseller['product_id'] == $result['product_id']) {
$product_xd_stickers[] = array(
'id'			=> 'xd_sticker_bestseller',
'text'			=> $xd_stickers['bestseller']['text'][$current_language_id]
);
}
}
}
if ($xd_stickers['novelty']['status'] == '1') {
if ((strtotime($result['date_added']) + intval($xd_stickers['novelty']['property']) * 24 * 3600) > time()) {
$product_xd_stickers[] = array(
'id'			=> 'xd_sticker_novelty',
'text'			=> $xd_stickers['novelty']['text'][$current_language_id]
);
}
}
if ($xd_stickers['last']['status'] == '1') {
if ($result['quantity'] <= intval($xd_stickers['last']['property']) && $result['quantity'] > 0) {
$product_xd_stickers[] = array(
'id'			=> 'xd_sticker_last',
'text'			=> $xd_stickers['last']['text'][$current_language_id]
);
}
}

// CUSTOM stickers
$this->load->model('extension/module/xd_stickers');
$custom_xd_stickers_id = $this->model_extension_module_xd_stickers->getCustomXDStickersProduct($result['product_id']);
if (!empty($custom_xd_stickers_id)) {
foreach ($custom_xd_stickers_id as $custom_xd_sticker_id) {
$custom_xd_sticker = $this->model_extension_module_xd_stickers->getCustomXDSticker($custom_xd_sticker_id['xd_sticker_id']);
$custom_xd_sticker_text = json_decode($custom_xd_sticker['text'], true);
// var_dump($custom_xd_sticker);
if ($custom_xd_sticker['status'] == '1') {
$custom_sticker_class = 'xd_sticker_' . $custom_xd_sticker_id['xd_sticker_id'];
$product_xd_stickers[] = array(
'id'			=> $custom_sticker_class,
'text'			=> $custom_xd_sticker_text[$current_language_id]
);
}
}
}
}
// XD Stickers end
        return array(
            'product_id' => $result['product_id'],
            'thumb' => $image,
            'timer' => @$result['timer'],
            'name' => $result['name'],
            'product_xd_stickers'  => $product_xd_stickers,
			'sku'         => $result['sku'],
				'cart'       => $cart,
				'attribute_groups' => $this->model_catalog_product->getProductAttributes($result['product_id']),
					 //manufac
					'manufacturer'=> $result['manufacturer'],
                    'manufacturers' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id']),
					'logo_image' => $logo_image,
					 //manufac
            'description' => utf8_substr(
                    strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')),
                    0,
                    $this->getConfigProductDescriptionLength()
                ) . '..',
            'price' => $price,
            'special' => $special,
            'tax' => $tax,
            'minimum' => $result['minimum'] > 0 ? $result['minimum'] : 1,
            'rating' => $rating,
            'href' => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $this->url_params),
        );
    }

    protected function formatPrice($price, $tax_class_id, $config_tax)
    {
        if (version_compare(VERSION, '2.2.0.0', '>=')) {
            $price = $this->currency->format(
                $this->tax->calculate($price, $tax_class_id, $config_tax),
                $this->session->data['currency']
            );
        } else {
            $price = $this->currency->format($this->tax->calculate($price, $tax_class_id, $config_tax));
        }
        return $price;
    }

    protected function formatPriceForTax($price)
    {
        if (version_compare(VERSION, '2.2.0.0', '>=')) {
            return $this->currency->format($price, $this->session->data['currency']);
        }
        return $this->currency->format($price);
    }

    protected function applyPagination(&$data, $product_total, $page, $limit)
    {
        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['limit'])) {
            $url .= '&limit=' . $this->request->get['limit'];
        }

        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
        $pagination->limit = $limit;
        $pagination->url = $this->url->link($this->module_name, $url . '&page={page}');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'),
            ($product_total)
                ? (($page - 1) * $limit) + 1
                : 0,
            ((($page - 1) * $limit) > ($product_total - $limit))
                ? $product_total
                : ((($page - 1) * $limit) + $limit),
            $product_total,
            ceil($product_total / $limit));

        // http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
        if ($page == 1) {
            $this->document->addLink($this->url->link($this->module_name, '', 'SSL'), 'canonical');
        } elseif ($page == 2) {
            $this->document->addLink($this->url->link($this->module_name, '', 'SSL'), 'prev');
        } else {
            $this->document->addLink($this->url->link($this->module_name, 'page=' . ($page - 1), 'SSL'), 'prev');
        }

        if ($limit && ceil($product_total / $limit) > $page) {
            $this->document->addLink($this->url->link($this->module_name, 'page=' . ($page + 1), 'SSL'), 'next');
        }
    }

    protected function appendSortBy(&$sorts, &$other_url_params, $text, $field, $order_type)
    {
        $sorts[] = array(
            'text' => $text,
            'value' => sprintf('%s-%s', $field, $order_type),
            'href' => $this->url->link($this->module_name, sprintf('sort=%s&order=%s%s', $field, $order_type, $other_url_params))
        );
    }

    protected function setOutput(&$data)
    {
        if (version_compare(VERSION, '2.2.0.0', '>=')) {
            $this->response->setOutput($this->load->view('product/special', $data));

        } else {
            $template = $this->config->get('config_template');

            if (file_exists(DIR_TEMPLATE . $template . '/template/product/special.tpl')) {
                return $this->response->setOutput($this->load->view($template . '/template/product/special.tpl', $data));
            }
            return $this->response->setOutput($this->load->view('default/template/product/special.tpl', $data));
        }


    }
}
