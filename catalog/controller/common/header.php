<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');
		$data['og_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		$data['og_image'] = $this->document->getOgImage();

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');
$data['customer_id'] = $this->customer->getId();
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (!empty($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}
		$data['text_storename'] = $this->language->get('text_storename');
        $data['text_city'] = $this->language->get('text_city');
        $data['text_country'] = $this->language->get('text_country');
        $data['text_address'] = $this->language->get('text_address');
        $data['text_pricerange'] = $this->language->get('text_pricerange');
        $data['label_categories'] = $this->language->get('label_categories');
        $data['label_manufac'] = $this->language->get('label_manufac');
        $data['label_product'] = $this->language->get('label_product');
        $data['label_showall'] = $this->language->get('label_showall');
        $data['label_nores'] = $this->language->get('label_nores'); 
        $data['text_specials'] = $this->language->get('text_specials'); 
        $data['text_bestsellers'] = $this->language->get('text_bestsellers'); 
		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['button_incart'] = $this->language->get('button_incart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));
        $data['text_about'] = $this->language->get('text_about');
        $data['text_delivery'] = $this->language->get('text_delivery');
        $data['text_blog'] = $this->language->get('text_blog');
        $data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
        $data['text_comparetitle'] = $this->language->get('text_comparetitle');
        $data['text_wishlisttitle'] = $this->language->get('text_wishlisttitle');
        $data['text_instagram'] = $this->language->get('text_instagram');

        $data['text_callback'] = $this->language->get('text_callback');
        $data['text_assortimenttitle'] = $this->language->get('text_assortimenttitle');
        $data['text_assortiment'] = $this->language->get('text_assortiment');
        $data['text_singdelivery'] = $this->language->get('text_singdelivery');
        $data['text_singdeliverytitle'] = $this->language->get('text_singdeliverytitle');
        $data['text_singprice'] = $this->language->get('text_singprice');
        $data['text_singpricetitle'] = $this->language->get('text_singpricetitle');

		$data['text_account'] = $this->language->get('text_account');
		$data['firstname'] = $this->customer->getFirstName();
        $data['lastname'] = $this->customer->getLastName();
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_page'] = $this->language->get('text_page');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['about'] = $this->url->link('information/information&information_id=4');
		$data['delivery'] = $this->url->link('information/information&information_id=6');
		$data['blog'] = $this->url->link('newsblog/category&newsblog_path=2');
		$data['compare'] = $this->url->link('product/compare');
		$data['specials'] = $this->url->link('product/special');
		$data['bestsellers'] = $this->url->link('product/bestseller');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['callback'] = $this->url->link('contact-us');
		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}
}
