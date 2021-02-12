<?php
class ControllerCommonMenuvh extends Controller {
	public function index() {
		$megamenu_setting = $this->config->get('megamenu_setting');
		
		if($megamenu_setting['status']=='1'){
			
			$this->load->language('common/header');
			$data['text_category'] = $this->language->get('text_category');	
			$this->load->model('module/nsmenu');
			$data['hmenu_type'] = $megamenu_setting['horizontal_menu_width'];
			$data['type_mobile_menu'] = $megamenu_setting['type_mobile_menu'];
			$data['main_menu_mask'] = $megamenu_setting['main_menu_mask'];
			$data['config_main_menu_selection'] = $megamenu_setting['main_menu_selection'];
			$data['config_fixed_panel_top'] = $megamenu_setting['fixed_panel_top'];
			$data['lang_id'] = $this->config->get('config_language_id');
			$data['language'] = $this->load->controller('common/language');
			$data['search'] = $this->load->controller('common/search');
		    $data['cart'] = $this->load->controller('common/cart');
			$data['items']=array();
			$data['additional']=array();
			if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

			$data['og_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
				$data['home'] = $this->url->link('common/home');
					if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}
	
			// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (!empty($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));
        $data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_about'] = $this->language->get('text_about');
        $data['text_delivery'] = $this->language->get('text_delivery');
        $data['text_blog'] = $this->language->get('text_blog');
        $data['text_remont'] = $this->language->get('text_remont');
         $data['text_specials'] = $this->language->get('text_specials'); 
        $data['text_bestsellers'] = $this->language->get('text_bestsellers'); 
        $data['firstname'] = $this->customer->getFirstName();
        $data['lastname'] = $this->customer->getLastName();
         $data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
        $data['text_comparetitle'] = $this->language->get('text_comparetitle');
        $data['text_instagram'] = $this->language->get('text_instagram');
        $data['about'] = $this->url->link('information/information&information_id=4');
		$data['delivery'] = $this->url->link('information/information&information_id=6');
		$data['blog'] = $this->url->link('newsblog/category&newsblog_path=1');
		$data['specials'] = $this->url->link('product/special');
		$data['bestsellers'] = $this->url->link('product/bestseller');
        $data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['language'] = $this->load->controller('common/language');
		$data['compare'] = $this->url->link('product/compare');
		$data['text_wishlisttitle'] = $this->language->get('text_wishlisttitle');
		$data['shopping_cart'] = $this->url->link('checkout/cart');

			$menu_items_cache = $this->cache->get('mmheader.' . (int)$this->config->get('config_language_id').'.'. (int)$this->config->get('config_store_id'));
					
				if (!empty($menu_items_cache)) {
					$data['items'] = $menu_items_cache;
					$config_menu_item = $this->model_module_nsmenu->getItemsMenu();
					if(!empty($config_menu_item)) {
						$menu_items = $config_menu_item;
					} else {
						$menu_items = array();
					}		
					
					foreach($menu_items as $datamenu){
						if($datamenu['additional_menu']=='additional' && $datamenu['status'] !='0')	{
							$data['additional'][] = 'additional';
						}			
					}
					
					$data['megamenu_status']=true;		
				} else {
					$config_menu_item = $this->model_module_nsmenu->getItemsMenu();
					
					if(!empty($config_menu_item)) {
						$menu_items = $config_menu_item;
					} else {
						$menu_items = array();
					}
					
					foreach($menu_items as $datamenu){
						if($datamenu['additional_menu']=="additional" && $datamenu['status'] !='0')	{
							$data['additional'][] = 'additional';
						}
						if($datamenu['menu_type']=="link" && $datamenu['status'] !='0')	{
							$data['items'][]=$this->model_module_nsmenu->MegaMenuTypeLink($datamenu);
						}
						if($datamenu['menu_type']=="information" && $datamenu['status'] !='0')	{
							$data['items'][]=$this->model_module_nsmenu->MegaMenuTypeInformation($datamenu);
						}
						if($datamenu['menu_type']=="manufacturer" && $datamenu['status'] !='0')	{
							$data['items'][]=$this->model_module_nsmenu->MegaMenuTypeManufacturer($datamenu);
						}
						if($datamenu['menu_type']=="product" && $datamenu['status'] !='0'){
							$data['items'][]=$this->model_module_nsmenu->MegaMenuTypeProduct($datamenu);
						}
						if($datamenu['menu_type']=="category" && $datamenu['status'] !='0')	{
							$data['items'][] = $this->model_module_nsmenu->MegaMenuTypeCategory($datamenu);
						}
						if($datamenu['menu_type']=="html" && $datamenu['status'] !='0')	{
							$data['items'][]=$this->model_module_nsmenu->MegaMenuTypeHtml($datamenu);
						}
						if($datamenu['menu_type']=="freelink" && $datamenu['status'] !='0')	{
							$data['items'][]=$this->model_module_nsmenu->MegaMenuTypeFreeLink($datamenu);
						}
					}
					
					$menu_items_cache = $data['items'];	
					$this->cache->set('mmheader.' . (int)$this->config->get('config_language_id') . '.'. (int)$this->config->get('config_store_id'), $menu_items_cache);		
					$data['megamenu_status']=true;
				
				}		
			} else { 
				$data['megamenu_status']=false;
			}

		return $this->load->view('common/menuvh', $data);
	}
}
