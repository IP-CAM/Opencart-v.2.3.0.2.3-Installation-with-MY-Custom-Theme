<?php
class ModelToolRemarketing extends Model {
	public function sendEcommerce($ecommerce_data) {
		
		if(!$this->isBot()) {
		if (isset($this->request->server['HTTP_CLIENT_IP'])) {
            $ip = $this->request->server['HTTP_CLIENT_IP'];
        } elseif (isset($this->request->server['HTTP_X_FORWARDED_FOR'])) {
            $ip = $this->request->server['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $this->request->server['REMOTE_ADDR'];
        }
		$ecommerce_data['uip'] = $ip;
		if (isset($this->request->server['HTTP_USER_AGENT'])) {
            $ecommerce_data['ua'] = $this->request->server['HTTP_USER_AGENT'];
        }
		if (isset($this->session->data['gclid'])) {
            $ecommerce_data['gclid'] = $this->session->data['gclid'];
        }
		if (isset($this->session->data['dclid'])) {
            $ecommerce_data['dclid'] = $this->session->data['dclid'];
        }
		if (isset($this->session->data['utm_source'])) {
            $ecommerce_data['cs'] = $this->session->data['utm_source'];
        }
		if (isset($this->session->data['utm_medium'])) {
            $ecommerce_data['cm'] = $this->session->data['utm_medium'];
        }
		if (isset($this->session->data['utm_term'])) {
            $ecommerce_data['ck'] = $this->session->data['utm_term'];
        }
		if (isset($this->session->data['utm_content'])) {
            $ecommerce_data['cc'] = $this->session->data['utm_content'];
        }
		if (isset($this->session->data['utm_campaign'])) {
            $ecommerce_data['cn'] = $this->session->data['utm_campaign'];
        }
		$url = 'https://www.google-analytics.com/collect';
		$content = http_build_query($ecommerce_data);
		$content = utf8_encode($content);
		$ch = curl_init();
		if (isset($this->request->server['HTTP_USER_AGENT'])) {
            curl_setopt($ch, CURLOPT_USERAGENT, $this->request->server['HTTP_USER_AGENT']);
        }
		 
	    curl_setopt($ch, CURLOPT_URL, $url);
	    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-type: application/x-www-form-urlencoded'));
	    curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
	    curl_setopt($ch, CURLOPT_POST, true);
	    curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_TIMEOUT, 30);
	    $response = curl_exec($ch);
	    curl_close($ch); 
		}
	}
	
	public function sendFacebook($facebook_data, $order_info = false) {
		
		if(!$this->isBot()) {
			$data = [];
			
			$data['event_name'] = $facebook_data['event_name'];
			$data['event_time'] = $data['event_id'] = time();
			
			$data['event_source_url'] = rtrim(HTTP_SERVER, '/') . $this->request->server['REQUEST_URI'];
			
			if (isset($facebook_data['url'])) {
				$data['event_source_url'] = $facebook_data['url'];		
			}
			$data['custom_data'] = $facebook_data['custom_data'];
			
			
		if (isset($this->request->server['HTTP_CLIENT_IP'])) {
            $ip = $this->request->server['HTTP_CLIENT_IP'];
        } elseif (isset($this->request->server['HTTP_X_FORWARDED_FOR'])) {
            $ip = $this->request->server['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $this->request->server['REMOTE_ADDR'];
        }
		
		$ua = '';
		
		if (isset($this->request->server['HTTP_USER_AGENT'])) {
            $ua = $this->request->server['HTTP_USER_AGENT'];
        }
		
		$data['user_data'] = [
			'client_ip_address' => $ip,
			'client_user_agent' => $ua
		];
		
		if (isset($this->session->data['fbc'])) {
			$data['user_data']['fbc'] = $this->session->data['fbc'];
		}
		
		if (isset($this->session->data['fbp'])) {
			$data['user_data']['fbp'] = $this->session->data['fbp'];
		}
		
		if ($this->customer->isLogged()) {
			if ($this->customer->getEmail()) {
				$data['user_data']['em'] = hash('sha256', $this->customer->getEmail());
			}
			if ($this->customer->getFirstName()) {
				$data['user_data']['fn'] = hash('sha256', mb_strtolower($this->customer->getFirstName()));
			}
			if ($this->customer->getLastName()) {
				$data['user_data']['ln'] = hash('sha256', mb_strtolower($this->customer->getLastName()));
			}
			if ($this->customer->getTelephone()) {
				$data['user_data']['ph'] = hash('sha256', preg_replace("/[^0-9]/", '', $this->customer->getTelephone()));
			}
			
			$data['user_data']['external_id'] = hash('sha256', $this->customer->isLogged());
		}
		
		if ($order_info) {
			if ($order_info['email']) {
				$data['user_data']['em'] = hash('sha256', $order_info['email']);
			}
			if ($order_info['firstname']) {
				$data['user_data']['fn'] = hash('sha256', mb_strtolower($order_info['firstname']));
			}
			if ($order_info['lastname']) {
				$data['user_data']['ln'] = hash('sha256', mb_strtolower($order_info['lastname']));
			}
			if ($order_info['telephone']) {
				$data['user_data']['ph'] = hash('sha256', preg_replace("/[^0-9]/", '', $order_info['telephone']));
			}
		}
		
		if (isset($facebook_data['time']) && $facebook_data['time']) {
			$data['event_time'] = $data['event_id'] = $facebook_data['time'];
		}

		$fb_data['data'] = [json_encode($data)]; 
		$fb_data['test_event_code'] = 'TEST92172'; // YOUR TEST EVENT CODE
		 
		$fb_send_data = http_build_query($fb_data); 
		$fb_send_data = utf8_encode($fb_send_data);

		$url = 'https://graph.facebook.com/v8.0/' . $this->config->get('remarketing_facebook_identifier') . '/events?access_token=' . $this->config->get('remarketing_facebook_token');
		$ch = curl_init();
		if (isset($this->request->server['HTTP_USER_AGENT'])) {
            curl_setopt($ch, CURLOPT_USERAGENT, $this->request->server['HTTP_USER_AGENT']);
        }
		
	    curl_setopt($ch, CURLOPT_URL, $url);
	    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-type: application/x-www-form-urlencoded'));
	    curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
	    curl_setopt($ch, CURLOPT_POST, true);
	    curl_setopt($ch, CURLOPT_POSTFIELDS, $fb_send_data);
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_TIMEOUT, 30);
	    $response = curl_exec($ch); 
		
	    curl_close($ch); 
		}
	}
	
	public function sendEcommerceImpressions($products, $heading_title = 'Not Set') {
		$this->load->model('catalog/product');
		$uuid = (isset($this->session->data['uuid']) && $this->session->data['uuid']) ? $this->session->data['uuid'] : sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',  mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),  mt_rand( 0, 0xffff ),  mt_rand( 0, 0x0fff ) | 0x4000,  mt_rand( 0, 0x3fff ) | 0x8000,  mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ));		
		$ecommerce_data = [
			'v'   => 1,
			'tid' => $this->config->get('remarketing_ecommerce_analytics_id'),
			'cid' => $uuid,
			't'   => 'event',
			'ec'  => 'Enhanced Ecommerce',
			'ea'  => 'Product Impressions',
			'ni'  => 1,
			'cu'  => $this->config->get('remarketing_ecommerce_currency')
		];
		if ($this->customer->isLogged()) {
			$ecommerce_data['uid'] = $this->customer->isLogged();
			unset($ecommerce_data['cid']);
		}
		$i = 1;
		if ($products) {
			$ecommerce_data['il1nm'] = $heading_title;
			foreach ($products as $product) {
				$ecommerce_data['il1pi' . $i . 'nm'] = $product['name'];
				$ecommerce_data['il1pi' . $i . 'id'] = $product['id'];
				$ecommerce_data['il1pi' . $i . 'pr'] = $product['price'];
				$ecommerce_data['il1pi' . $i . 'br'] = $product['brand'];
				$ecommerce_data['il1pi' . $i . 'ca'] = $product['category'];
				$ecommerce_data['il1pi' . $i . 'ps'] = $i;
				$i++;
			}
		}
		
		$this->sendEcommerce($ecommerce_data);
		//$this->fastSend($ecommerce_data);
	}
	
	public function sendEcommerceCart($ecommerce_data) {
		$this->sendEcommerce($ecommerce_data);
	}
	
	public function sendEcommerceDetails($product, $impressions, $heading_title = 'Not Set') {
		$this->load->model('catalog/product');
			$product_info = $product['products'];
			
			$uuid = (isset($this->session->data['uuid']) && $this->session->data['uuid']) ? $this->session->data['uuid'] : sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',  mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),  mt_rand( 0, 0xffff ),  mt_rand( 0, 0x0fff ) | 0x4000,  mt_rand( 0, 0x3fff ) | 0x8000,  mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ));		
				$ecommerce_data = [
					'v' => 1,
					'tid'   => $this->config->get('remarketing_ecommerce_analytics_id'),
					'cid'   => $uuid,
					't'     => 'event',
					'ec'    => 'Enhanced Ecommerce',
					'ea'    => 'Product Details',
					'ni'    => 1,
					'cu'    => $this->config->get('remarketing_ecommerce_currency'),
					'pa'    => 'detail',
					'pal'   => $heading_title,
					'pr1nm' => $product_info['name'],
					'pr1br' => $product_info['brand'],
					'pr1id' => $product_info['id'],
					'pr1pr' => $product_info['price'],
					'pr1ca' => $product_info['category']
				];
				if ($this->customer->isLogged()) {
					$ecommerce_data['uid'] = $this->customer->isLogged();
					unset($ecommerce_data['cid']);
				}
		
				if ($impressions) {
					$ecommerce_data['il1nm'] = 'Featured';
					foreach ($impressions as $product){
						$ecommerce_data['il1pi' . $product['position'] . 'nm'] = $product['name'];
						$ecommerce_data['il1pi' . $product['position'] . 'id'] = $product['id'];
						$ecommerce_data['il1pi' . $product['position'] . 'pr'] = $product['price'];
						$ecommerce_data['il1pi' . $product['position'] . 'br'] = $product['brand'];
						$ecommerce_data['il1pi' . $product['position'] . 'ca'] = $product['category'];
						$ecommerce_data['il1pi' . $product['position'] . 'ps'] = $product['position'];
					}
				}
				
				$this->sendEcommerce($ecommerce_data);
	}
	
	public function sendMeasurementClick($product, $heading_title = 'Not Set') {
		$product_info = $product;
		$uuid = (isset($this->session->data['uuid']) && $this->session->data['uuid']) ? $this->session->data['uuid'] : sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',  mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),  mt_rand( 0, 0xffff ),  mt_rand( 0, 0x0fff ) | 0x4000,  mt_rand( 0, 0x3fff ) | 0x8000,  mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ));		
			$ecommerce_data = [
				'v'     => 1,
				'tid'   => $this->config->get('remarketing_ecommerce_analytics_id'),
				'cid'   => $uuid,
				't'     => 'event',
				'ec'    => 'Enhanced Ecommerce',
				'ea'    => 'Product Clicks',
				'ni'    => 1,
				'cu'    => $this->config->get('remarketing_ecommerce_currency'),
				'pa'    => 'click',
				'pal'   => $heading_title,
				'pr1nm' => $product_info['name'],
				'pr1br' => $product_info['brand'],
				'pr1id' => $product_info['id'],
				'pr1pr' => $product_info['price'],
				'pr1ca' => $product_info['category']
			];
			if ($this->customer->isLogged()) {
				$ecommerce_data['uid'] = $this->customer->isLogged();
				unset($ecommerce_data['cid']);
			}
			
			$this->sendEcommerce($ecommerce_data);
	}
	
	private function fastSend($ecommerce_data) {
		$url = 'https://www.google-analytics.com/collect';
		$http_data = http_build_query($ecommerce_data);
		$http_data = utf8_encode($http_data);
	
		$context = stream_context_create([
			"http" => [
				'method'  => 'POST',
				'protocol_version' => '1.1',
				'header'  => [
				"Content-type: application/x-www-form-urlencoded\r\n",
				"Content-Length: 0",
				],
				'content' => $http_data
			]
		]);
		
		try {
			file_get_contents($url, 0, $context);
		} catch(Exception $e){
        // Тсс
		}
	}
	
	public function getQuickOrderOpen($product_info) {
		$json = [];
		if ($product_info) {
		$this->load->model('catalog/product'); 
		$categories = $this->model_catalog_product->getProductCategories($product_info['product_id']);
		$json['remarketing'] = [];
		$json['remarketing']['google_product_id'] = $this->config->get('remarketing_google_id') == 'id' ? $product_info['product_id'] : $product_info['model'];
		$json['remarketing']['google_identifier'] = $this->config->get('remarketing_google_identifier');
		$json['remarketing']['google_ads_identifier'] = $this->config->get('remarketing_google_ads_identifier');
		$json['remarketing']['google_ads_identifier_cart'] = $this->config->get('remarketing_google_ads_identifier_cart');
		$json['remarketing']['facebook_product_id'] = $this->config->get('remarketing_facebook_id') == 'id' ? $product_info['product_id'] : $product_info['model'];
		$json['remarketing']['mytarget_product_id'] = $this->config->get('remarketing_mytarget_id') == 'id' ? $product_info['product_id'] : $product_info['model'];
		$json['remarketing']['vk_product_id'] = $this->config->get('remarketing_vk_id') == 'id' ? $product_info['product_id'] : $product_info['model'];
		$json['remarketing']['vk_identifier'] = $this->config->get('remarketing_vk_identifier');
		$json['remarketing']['ecommerce_product_id'] = $this->config->get('remarketing_ecommerce_id') == 'id' ? $product_info['product_id'] : $product_info['model'];
		$json['remarketing']['ecommerce_ga4_product_id'] = $this->config->get('remarketing_ecommerce_ga4_id') == 'id' ? $product_info['product_id'] : $product_info['model'];
		$json['remarketing']['ecommerce_status'] = $this->config->get('remarketing_ecommerce_status');
		$json['remarketing']['ecommerce_ga4_status'] = $this->config->get('remarketing_ecommerce_ga4_status');
		$json['remarketing']['google_status'] = $this->config->get('remarketing_google_status');
		$json['remarketing']['facebook_status'] = $this->config->get('remarketing_facebook_status');
		$json['remarketing']['vk_status'] = $this->config->get('remarketing_vk_status');
		$json['remarketing']['quantity'] = 1;
		$json['remarketing']['price'] = $this->currency->format(($product_info['special'] ? $product_info['special'] : $product_info['price']), $this->session->data['currency'], '', false);
		$json['remarketing']['google_price'] = $this->currency->format(($product_info['special'] ? $product_info['special'] : $product_info['price']), $this->config->get('remarketing_google_currency'), '', false);
		$json['remarketing']['facebook_price'] = $this->currency->format(($product_info['special'] ? $product_info['special'] : $product_info['price']), $this->config->get('remarketing_facebook_currency'), '', false);
		$json['remarketing']['ecommerce_price'] = $this->currency->format(($product_info['special'] ? $product_info['special'] : $product_info['price']), $this->config->get('remarketing_ecommerce_currency'), '', false);
		$json['remarketing']['brand'] = addslashes($product_info['manufacturer']);
		$json['remarketing']['name'] = addslashes($product_info['name']);
		$json['remarketing']['category'] = addslashes($categories);
		$json['remarketing']['currency'] = $this->session->data['currency'];
		$json['remarketing']['google_currency'] = $this->config->get('remarketing_google_currency');
		$json['remarketing']['facebook_currency'] = $this->config->get('remarketing_facebook_currency');
		$json['remarketing']['ecommerce_currency'] = $this->config->get('remarketing_ecommerce_currency');
		$json['remarketing']['time'] = time();
		//options todo			
		
		if ($this->config->get('remarketing_ecommerce_measurement_status')) {
			$uuid = (isset($this->session->data['uuid']) && $this->session->data['uuid']) ? $this->session->data['uuid'] : sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',  mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),  mt_rand( 0, 0xffff ),  mt_rand( 0, 0x0fff ) | 0x4000,  mt_rand( 0, 0x3fff ) | 0x8000,  mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ));		
			$ecommerce_data = [
				'v'     => 1,
				'tid'   => $this->config->get('remarketing_ecommerce_analytics_id'),
				'cid'   => $uuid,
				't'     => 'event',
				'ec'    => 'Enhanced Ecommerce',
				'ea'    => 'Adding a Product to a Shopping Cart',
				'ni'    => 1,
				'cu'    => $this->config->get('remarketing_ecommerce_currency'),
				'pa'    => 'add',
				'pr1nm' => $product_info['name'],
				'pr1id' => ($this->config->get('remarketing_ecommerce_measurement_id') == 'id') ? $product_info['product_id'] : $product_info['model'],
				'pr1pr' => $json['remarketing']['ecommerce_price'],
				'pr1ca' => $categories,
				'pr1qt' => 1
			];
			
			$this->sendEcommerce($ecommerce_data);
		}
		
		if ($this->config->get('remarketing_facebook_server_side') && $this->config->get('remarketing_facebook_token')) {
			$facebook_data['event_name'] = 'AddToCart';
			$facebook_data['custom_data'] = [
				'value' => $json['remarketing']['facebook_price'],
				'currency' => $this->config->get('remarketing_facebook_currency'),
				'content_ids' => [
					$json['remarketing']['facebook_product_id']
				],
				'content_name'     => addslashes($product_info['name']),
				'content_category' => $categories,
				'content_type'     => 'product',
				'opt_out'          => false
			];
			
			$this->sendFacebook($facebook_data);
		}
		}
		return $json; 
    }
	
	public function getQuickOrderSuccess($order_id) {
		$json['remarketing'] = [];
		$this->load->model('catalog/product'); 
		$order_info = $this->getOrderRemarketing($order_id);
		if ($order_info) {
			$json['remarketing'] = [];
			
			$json['remarketing']['google_products'] = [];
			$json['remarketing']['facebook_products'] = [];
			$json['remarketing']['mytarget_products'] = [];
			$json['remarketing']['vk_products'] = [];
			$json['remarketing']['ecommerce_products'] = [];
			if ($order_info['products']) {
				$i = 1;
				foreach ($order_info['products'] as $product) {
					$json['remarketing']['google_products'][] = [
						'id' => $this->config->get('remarketing_google_id') == 'id' ? $product['product_id'] : $product['model'],
						'google_business_vertical' => 'retail'
					];
					$json['remarketing']['facebook_products'][] = [
						'id' => $this->config->get('remarketing_facebook_id') == 'id' ? $product['product_id'] : $product['model'],
						'price' => $product['facebook_price'],
						'quantity' => $product['quantity']
					];
					$json['remarketing']['mytarget_products'][] = [
						'id' => $this->config->get('remarketing_mytarget_id') == 'id' ? $product['product_id'] : $product['model'],
						'price' => $product['price'],
					];
					$json['remarketing']['vk_products'][] = [
						'id' => $this->config->get('remarketing_vk_id') == 'id' ? $product['product_id'] : $product['model'],
						'price' => $product['price'],
					];
					$json['remarketing']['ecommerce_products'][] = [
						'name' => $product['name'],
						'id' => $this->config->get('remarketing_ecommerce_id') == 'id' ? $product['product_id'] : $product['model'],
						'price' => $product['ecommerce_price'],
						'quantity' => $product['quantity'],
						'category' => $this->model_catalog_product->getProductCategories($product['product_id']),
						'brand' => $this->model_catalog_product->getProduct($product['product_id'])['manufacturer']
					];
					$json['remarketing']['ecommerce_ga4_products'][] = [
						'item_name' => $product['name'],
						'item_id' => $this->config->get('remarketing_ecommerce_ga4_id') == 'id' ? $product['product_id'] : $product['model'],
						'price' => $product['ecommerce_price'],
						'quantity' => $product['quantity'],
						'index' => $i,
						'item_list_name' => addslashes($product['category']),
						'item_category' => addslashes($product['category']),
						'item_brand' => (isset($product['product_info']['manufacturer']) && $product['product_info']['manufacturer']) ? $product['product_info']['manufacturer'] : '',
						'affiliation' => $order_info['store_name']
					];
					$i++;
				}
			}
			
			$json['remarketing']['google_identifier'] = $this->config->get('remarketing_google_identifier');
			$json['remarketing']['google_ads_identifier'] = $this->config->get('remarketing_google_ads_identifier');
			$json['remarketing']['google_ads_identifier_cart'] = $this->config->get('remarketing_google_ads_identifier_cart');
			$json['remarketing']['vk_identifier'] = $this->config->get('remarketing_vk_identifier');
			$json['remarketing']['ecommerce_status'] = $this->config->get('remarketing_ecommerce_status');
			$json['remarketing']['ecommerce_ga4_status'] = $this->config->get('remarketing_ecommerce_ga4_status');
			$json['remarketing']['google_status'] = $this->config->get('remarketing_google_status');
			$json['remarketing']['facebook_status'] = $this->config->get('remarketing_facebook_status');
			$json['remarketing']['vk_status'] = $this->config->get('remarketing_vk_status');
			$json['remarketing']['order_info'] = $order_info;
			$json['remarketing']['total'] = $order_info;
			$json['remarketing']['num_items'] = count($order_info['products']);
			$json['remarketing']['currency'] = $this->session->data['currency'];
			$json['remarketing']['google_currency'] = $this->config->get('remarketing_google_currency');
			$json['remarketing']['facebook_currency'] = $this->config->get('remarketing_facebook_currency');
			$json['remarketing']['ecommerce_currency'] = $this->config->get('remarketing_ecommerce_currency');
			
			$json['remarketing']['time'] = time();
			if ($this->config->get('remarketing_ecommerce_measurement_status')) {
				$uuid = (isset($this->session->data['uuid']) && $this->session->data['uuid']) ? $this->session->data['uuid'] : sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',  mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),  mt_rand( 0, 0xffff ),  mt_rand( 0, 0x0fff ) | 0x4000,  mt_rand( 0, 0x3fff ) | 0x8000,  mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ));		
				$ecommerce_data = [
					'v'   => 1,
					'tid' => $this->config->get('remarketing_ecommerce_analytics_id'),
					'cid' => $uuid,
					't'   => 'event',
					'ti'  => $order_info['order_id'],
					'ta'  => $order_info['store_name'],
					'ts'  => $order_info['shipping'],
					'tr'  => $order_info['ecommerce_total'],
					'ec'  => 'Enhanced Ecommerce',
					'ea'  => 'Purchase', 
					'ni'  => 1,
					'cu'  => $this->config->get('remarketing_ecommerce_currency'),
					'pa'  => 'purchase'
				]; 
		
				if ($this->customer->isLogged()) {
					$ecommerce_data['uid'] = $this->customer->isLogged();
					unset($ecommerce_data['cid']);
				}
	
				$i = 1;
				if ($order_info['products']) {
					foreach ($order_info['products'] as $product){
						$ecommerce_data['pr' . $i .'nm'] = $product['name'];
						$ecommerce_data['pr' . $i .'id'] = ($this->config->get('remarketing_ecommerce_measurement_id') == 'id') ? $product['product_id'] : $product['model'];
						$ecommerce_data['pr' . $i .'pr'] = $product['ecommerce_price'];
						$ecommerce_data['pr' . $i .'br'] = $this->model_catalog_product->getProduct($product['product_id'])['manufacturer'];
						$ecommerce_data['pr' . $i .'ca'] = $this->model_catalog_product->getProductCategories($product['product_id']);
						$ecommerce_data['pr' . $i .'qt'] = $product['quantity'];
						$i++;
					}
				}
				
				$this->sendEcommerce($ecommerce_data);
			}
				
			if ($this->config->get('remarketing_facebook_server_side') && $this->config->get('remarketing_facebook_token')) {
				$facebook_data['event_name'] = 'Purchase';
				$products = [];
				if ($order_info['products']) {
				foreach ($order_info['products'] as $product) {
					$fb_products[] = [
						'id'         => ($this->config->get('remarketing_facebook_id') == 'id' ? $product['product_id'] : $product['model']),
						'quantity'   => $product['quantity'],
						'item_price' => $product['facebook_price']
					];
				}
				}
				$facebook_data['custom_data'] = [
					'value'        => $order_info['facebook_total'],
					'currency'     => $this->config->get('remarketing_facebook_currency'),
					'contents'     => $fb_products,
					'content_type' => 'product',
					'opt_out'      => false
				];
				
				$this->sendFacebook($facebook_data);
			}
		}
		
		return $json['remarketing'];
    }

	
	public function isBot() {
		if (isset($this->request->server['HTTP_USER_AGENT'])){
			if (preg_match('/abacho|accona|AddThis|AdsBot|ahoy|AhrefsBot|AISearchBot|alexa|altavista|anthill|appie|applebot|arale|araneo|AraybOt|ariadne|arks|aspseek|ATN_Worldwide|Atomz|baiduspider|baidu|bbot|bingbot|bing|Bjaaland|BlackWidow|BotLink|bot|boxseabot|bspider|calif|CCBot|ChinaClaw|christcrawler|CMC\/0\.01|combine|confuzzledbot|contaxe|CoolBot|cosmos|crawler|crawlpaper|crawl|curl|cusco|cyberspyder|cydralspider|dataprovider|digger|DIIbot|DotBot|downloadexpress|DragonBot|DuckDuckBot|dwcp|EasouSpider|ebiness|ecollector|elfinbot|esculapio|ESI|esther|eStyle|Ezooms|facebookexternalhit|facebook|facebot|fastcrawler|FatBot|FDSE|FELIX IDE|fetch|fido|find|Firefly|fouineur|Freecrawl|froogle|gammaSpider|gazz|gcreep|geona|Getterrobo-Plus|get|girafabot|golem|googlebot|\-google|grabber|GrabNet|griffon|Gromit|gulliver|gulper|hambot|havIndex|hotwired|htdig|HTTrack|ia_archiver|iajabot|IDBot|Informant|InfoSeek|InfoSpiders|INGRID\/0\.1|inktomi|inspectorwww|Internet Cruiser Robot|irobot|Iron33|JBot|jcrawler|Jeeves|jobo|KDD\-Explorer|KIT\-Fireball|ko_yappo_robot|label\-grabber|larbin|legs|libwww-perl|linkedin|Linkidator|linkwalker|Lockon|logo_gif_crawler|Lycos|m2e|majesticsEO|marvin|mattie|mediafox|mediapartners|MerzScope|MindCrawler|MJ12bot|mod_pagespeed|moget|Motor|msnbot|muncher|muninn|MuscatFerret|MwdSearch|NationalDirectory|naverbot|NEC\-MeshExplorer|NetcraftSurveyAgent|NetScoop|NetSeer|newscan\-online|nil|none|Nutch|ObjectsSearch|Occam|openstat.ru\/Bot|packrat|pageboy|ParaSite|patric|pegasus|perlcrawler|phpdig|piltdownman|Pimptrain|pingdom|pinterest|pjspider|PlumtreeWebAccessor|PortalBSpider|psbot|rambler|Raven|RHCS|RixBot|roadrunner|Robbie|robi|RoboCrawl|robofox|Scooter|Scrubby|Search\-AU|searchprocess|search|SemrushBot|Senrigan|seznambot|Shagseeker|sharp\-info\-agent|sift|SimBot|Site Valet|SiteSucker|skymob|SLCrawler\/2\.0|slurp|snooper|solbot|speedy|spider_monkey|SpiderBot\/1\.0|spiderline|spider|suke|tach_bw|TechBOT|TechnoratiSnoop|templeton|teoma|titin|topiclink|twitterbot|twitter|UdmSearch|Ukonline|UnwindFetchor|URL_Spider_SQL|urlck|urlresolver|Valkyrie libwww\-perl|verticrawl|Victoria|void\-bot|Voyager|VWbot_K|wapspider|WebBandit\/1\.0|webcatcher|WebCopier|WebFindBot|WebLeacher|WebMechanic|WebMoose|webquest|webreaper|webspider|webs|WebWalker|WebZip|wget|whowhere|winona|wlm|WOLP|woriobot|WWWC|XGET|xing|yahoo|YandexBot|YandexMobileBot|yandex|yeti|Zeus/i', $this->request->server['HTTP_USER_AGENT'])) {
				return true; 
			}
		}
		return false;

	}
	
	public function getOrderRemarketing($order_id) {
		
        $order_query = $this->db->query("SELECT o.order_id, o.firstname, o.lastname, o.email, o.telephone, o.store_name, o.language_id, o.currency_code, o.currency_value, o.total, o.email FROM `" . DB_PREFIX . "order` o WHERE o.order_id = '" . (int)$order_id . "'");
        if ($order_query->num_rows) {
            $language_id = $order_query->row['language_id'];
          
            $order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
            foreach ($order_product_query->rows as $product) {
                $option_data = '';
                $order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$product['order_product_id'] . "'");
                foreach ($order_option_query->rows as $option) {
                    if ($option['type'] != 'file') {
                        $option_data .= $option['name'] . ': ' . (utf8_strlen($option['value']) > 20 ? utf8_substr($option['value'], 0, 20) . '..' : $option['value']) . ' - ';
                    }
                }
                $option_data = rtrim($option_data, ' - ');
                $category_data = '';
                $category_query = $this->db->query("SELECT cd.name FROM `" . DB_PREFIX . "product_to_category` pc INNER JOIN `" . DB_PREFIX . "category_description` cd ON pc.category_id = cd.category_id WHERE pc.product_id = '" . (int)$product['product_id'] . "' AND cd.language_id = '" . (int)$language_id . "'");
                $i = 0;
                foreach ($category_query->rows as $category) {
                    $i++;
                    if ($i <= 5) {
                        $category_data .= $category['name'] . '/';
                    }
                }
                $category_data = rtrim($category_data, '/');
                if ($option_data) {
                    $name = $product['name'] . ' - ' . $option_data;
                } else {
                    $name = $product['name'];
                }

				$product_info = $this->model_catalog_product->getProduct($product['product_id']);
				
                $products[] = array(
                    'name'            => $name,
                    'product_id'      => $product['product_id'],
                    'product_info'    => $product_info,
                    'sku'             => $product['model'],
                    'model'           => $product['model'],
                    'category'        => $category_data,
                    'price'           => $this->currency->format($product['price'], $this->session->data['currency'], '', false),
                    'google_price'    => $this->currency->format($product['price'], $this->config->get('remarketing_google_currency'), '', false),
                    'facebook_price'  => $this->currency->format($product['price'], $this->config->get('remarketing_facebook_currency'), '', false),
                    'ecommerce_price' => $this->currency->format($product['price'], $this->config->get('remarketing_ecommerce_currency'), '', false),
                    'quantity'        => $product['quantity']
                );
            }
			
			$shipping_query = $this->db->query("SELECT value FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' AND code = 'shipping'");
			if ($shipping_query->rows) {
				$shipping = $shipping_query->row['value'];
			} else {
				$shipping = 0;
			}

			$coupon_query = $this->db->query("SELECT title FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' AND code = 'coupon'");
			if ($coupon_query->rows) {
				$coupon = $coupon_query->row['title'];
			} else {
				$coupon = false;
			}

			
			
            return array(
                'order_id'        => $order_query->row['order_id'],
                'store_name'      => $order_query->row['store_name'],
                'email'           => $order_query->row['email'],
                'telephone'       => $order_query->row['telephone'],
                'firstname'       => $order_query->row['firstname'],
                'lastname'        => $order_query->row['lastname'],
                'products'        => $products,
                'total'           => $order_query->row['total'], 
                'default_total'   => $this->currency->format($order_query->row['total'], $this->session->data['currency'], '', false),
                'google_total'    => $this->currency->format($order_query->row['total'], $this->config->get('remarketing_google_currency'), '', false),
                'facebook_total'  => $this->currency->format($order_query->row['total'], $this->config->get('remarketing_facebook_currency'), '', false),
                'ecommerce_total' => $this->currency->format($order_query->row['total'], $this->config->get('remarketing_ecommerce_currency'), '', false),
				'shipping'        => $shipping, 
				'coupon'          => $coupon, 
                'email'           => $order_query->row['email'],
                'currency_code'   => $order_query->row['currency_code']
            );
        } else {
            return false;
        }  
    }
}