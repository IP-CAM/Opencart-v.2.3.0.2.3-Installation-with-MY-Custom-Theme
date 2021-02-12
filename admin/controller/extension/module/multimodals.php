<?php
class ControllerExtensionModuleMultimodals extends Controller {
	private $error = array(); 
	
	public function index() {
		$this->load->model('setting/setting');
		$this->load->model('localisation/language');
		$this->load->model('catalog/multimodal');

		$data = $this->language->load('extension/module/multimodals');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['token'] = $this->session->data['token'];
		$config = $this->config->get('specialofferoutsite');
		$this->document->addStyle('view/stylesheet/multimodals.css');
		$this->document->addStyle('https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&subset=latin,cyrillic');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['image'])) {
			$data['error_image'] = $this->error['image'];
		} else {
			$data['error_image'] = array();
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/module/multimodals', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$data['modals'] = $this->model_catalog_multimodal->getModals();

		$this->load->model('catalog/product');

		foreach($data['modals'] as $keyModal => $modal){
			$data['modals'][$keyModal]['products'] = array();
			foreach($modal['include_products'] as $product_id){
				$product_info = $this->model_catalog_product->getProduct($product_id);
				if($product_info){
					$data['modals'][$keyModal]['products'][$product_id] = $product_info['name'];
				}
			}
		}

		$data['action'] = $this->url->link('extension/module/multimodals/save', 'token=' . $this->session->data['token'], 'SSL');
		$data['remove_action'] = str_replace('&amp;','&',$this->url->link('extension/module/multimodals/remove', 'token=' . $this->session->data['token'], 'SSL'));
		$data['getHtmlModal'] = str_replace('&amp;','&',$this->url->link('extension/module/multimodals/getHtmlModal', 'token=' . $this->session->data['token'], 'SSL'));
		$data['update_tables'] = str_replace('&amp;', '&', $this->url->link('extension/module/multimodals/updateTables', 'token=' . $this->session->data['token'], 'SSL'));

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');
		$data['token'] = $this->session->data['token'];

		$data['languages'] = $this->model_localisation_language->getLanguages();


		$this->load->model('customer/customer_group');
		
		$data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();
		

		$this->document->addScript('view/javascript/summernote/summernote.js');
		$this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
		$this->document->addScript('view/javascript/summernote/opencart.js');
		$this->document->addStyle('view/javascript/summernote/summernote.css');


		$this->load->model('design/layout');
		$data['layouts'] = $this->model_design_layout->getLayouts();

		$this->load->model('catalog/category');
		$data['categories'] = $this->model_catalog_category->getCategories(0);

		$cfg_data = array('timeout_offers','checkout_email','checkout_name','checkout_phone','exclude_special','off_tries','delay','offer_order_with_cart','offer_success','interval','fields');

		foreach ($cfg_data as $item) {
			$data[$item] = (isset($config[$item])) ? $config[$item] : false;
		}
		$cfg_data_type_array = array('low_phrases','high_phrases');
		foreach ($cfg_data_type_array as $item) {
			$data[$item] = (isset($config[$item])) ? $config[$item] : array();
		}

		$data['type_fields'] = array('text','email','telephone','textarea','select');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/multimodals', $data));

	}

	public function getHtmlModal(){
		$json = array();

		$this->load->model('catalog/multimodal');

		$this->load->model('localisation/language');
		$data = $this->language->load('extension/module/multimodals');

		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$this->document->addScript('view/javascript/summernote/summernote.js');
		$this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
		$this->document->addScript('view/javascript/summernote/opencart.js');
		$this->document->addStyle('view/javascript/summernote/summernote.css');


		
	
		$this->load->model('customer/customer_group');
		$data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();
				
		$this->load->model('design/layout');
		$data['layouts'] = $this->model_design_layout->getLayouts();

		$this->load->model('catalog/category');
		$data['categories'] = $this->model_catalog_category->getCategories(0);

		$data['cnt'] = $this->request->post['cnt'];
		
		$data['id_modal'] = $this->model_catalog_multimodal->insertModal();

		$json['html'] = $this->load->view('extension/module/multimodals_page', $data);

		$this->response->setOutput(json_encode($json));
	}

	public function remove(){
		$json = array();

		$this->load->model('catalog/multimodal');

		$this->model_catalog_multimodal->removeModal($this->request->post['id']);

		$json['success'] = true;
		$this->response->setOutput(json_encode($json));
	}

	public function save()
	{
		$json = array();

		$this->load->model('localisation/language');
		$this->language->load('extension/module/multimodals');

		if ($this->request->server['REQUEST_METHOD'] != 'POST') {
			$this->redirect($this->url->link('extension/module/multimidals', 'token=' . $this->session->data['token'] , 'SSL'));
		}

		if($this->validate())	{
			$this->load->model('setting/setting');
			$this->load->model('catalog/multimodal');
			$this->model_catalog_multimodal->saveModals($this->request->post['modals']);

			$this->model_setting_setting->editSetting('specialofferoutsite', $this->request->post);
			$json['success'] = $this->language->get('text_success');
		} else $json['error'] = $this->error;

		$this->response->setOutput(json_encode($json));
	}

	public function updateTables()
	{
		$json = array();

		$this->language->load('extension/module/multimodals');

		$this->load->model('catalog/multimodal');
		$this->model_catalog_multimodal->installTables();
		$json['success'] = $this->language->get('text_success_update');
		$this->response->setOutput(json_encode($json));
	}

	protected function validate() {
		$this->load->model('localisation/language');
		$this->language->load('extension/module/multimodals');

		if (!$this->user->hasPermission('modify', 'extension/module/multimodals')) {
			$this->error = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}

	public function install()
	{
		$this->load->model('catalog/multimodal');
		$this->model_catalog_multimodal->installTables();

		//Enable discount in cart for offers
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('specialoffertotal', array(
			'special_offer_total_status' => 1,
			'special_offer_total_sort_order' => 3
		));
	}

	public function uninstall()
	{
		$this->load->model('catalog/multimodal');
		$this->model_catalog_multimodal->deleteTables();

		//Disable discount in cart for offers
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('specialoffertotal', array(
			'special_offer_total_status' => 0,
			'special_offer_total_sort_order' => 3
		));
	}
}
?>