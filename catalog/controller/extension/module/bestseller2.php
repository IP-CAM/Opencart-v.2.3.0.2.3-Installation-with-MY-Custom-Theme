<?php
class ControllerExtensionModuleBestSeller2 extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/bestseller');

$this->document->setRobots('noindex,follow');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');
        $data['button_incart'] = $this->language->get('button_incart');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);
        shuffle($results);
		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
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
				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'cart'       => $cart,
					'attribute_groups' => $this->model_catalog_product->getProductAttributes($result['product_id']),
					 //manufac
					'manufacturer'=> $result['manufacturer'],
                    'manufacturers' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id']),
					'logo_image' => $logo_image,
					 //manufac
					'special'     => $special,
					'sku'         => $result['sku'],
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			return $this->load->view('extension/module/bestseller2', $data);
		}
	}
}
