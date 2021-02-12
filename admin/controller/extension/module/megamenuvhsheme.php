<?php
/**
 * @ PHP 5.6
 * @ Decoder version : 1.0.0.4
 * @ Release on : 24.03.2018
 * @ Website    : http://EasyToYou.eu
 *
 * @ Zend guard decoder PHP 5.6
 **/

class ControllerExtensionModuleMegamenuvhsheme extends Controller
{
	private $error = array();
	public $aleksey_20 = false;
	public $aleksey_40 = false;
	public $aleksey_34 = '';
	public $activation_key_expires;
	public $secret_key = 'Y58BnYSeAR8r4FMBaYIButK4';
	public $secret_key_dec = 'Y58BnYSeAR8r4FMBaYIButK4';
	public $aleksey_6 = 'http://validator.waterfilter.in.ua/api.php';
	public $remote_port = 80;
	public $remote_timeout = 20;
	public $local_ua = 'PHP code protect';
	public $aleksey_18 = false;
	public $use_expires = false;
	public $local_key_storage = 'filesystem';
	public $aleksey_5 = './';
	public $aleksey_24 = 'megamenu.php';
	public $local_key_transport_order = 'scf';
	public $local_key_delay_period = 1;
	public $local_key_last;
	public $release_date = '2016-11-18';
	public $user_name = '';
	public $status_messages = array('status_1' => '<span style="color:green;">Лицензия Активна. Спасибо! / License activity. Thank you!</span>', 'status_2' => 'Срок закончился. / The term ended.', 'status_3' => 'Ожидает повторной активации. / Pending re-activation.', 'status_4' => 'License suspended.', 'localhost' => 'Активна на компе / Is active on a computer', 'pending' => 'Ожидает активации. / Awaiting activation', 'download_access_expired' => 'Неверный ключ / Invalid key', 'missing_activation_key' => 'Укажите ключ. / Enter key.', 'could_not_obtain_local_key' => 'Невозможно получить ключ. / Unable to get the key.', 'maximum_delay_period_expired' => 'Ключ истек. / The key has expired.', 'local_key_tampering' => 'Ключ не действителен. / The key is not valid.', 'local_key_invalid_for_location' => 'Неверный ключ / Invalid key', 'missing_license_file' => 'Создайте файл и папки / Create files and folders:<br />', 'license_file_not_writable' => 'Сделайте права для записи 777 / Make the right to record 777<br />', 'invalid_local_key_storage' => 'не могу удалить я ключ, попросите автора модуля(шаблона) / I can not remove the key, ask the author of the module (template)', 'could_not_save_local_key' => 'ключ на могу записать, проверьте права на файл', 'activation_key_string_mismatch' => 'Неверный ключ / Invalid key');
	private $trigger_delay_period;

	public function deactivation()
	{
		$this->db->query('UPDATE ' . DB_PREFIX . 'megamenu_key SET `license_key`=\'\' WHERE `key`=\'local_key\'');
	}

	public function install()
	{
		$this->load->model('extension/module/megamenuvhsheme');
		$this->model_extension_module_megamenuvhsheme->installDB();
	}

	private function licenseValidation()
	{
		$license = true;
		/*
		$this->aleksey_5 = './';
		$this->aleksey_24 = 'megamenu.php';
		$this->aleksey_6 = 'http://validator.waterfilter.in.ua/api.php';
		$query_key = $this->db->query('SELECT `license_key` FROM ' . DB_PREFIX . 'megamenu_key where `key`=\'local_key\'');
		$query_row = $query_key->row;
		$lkey = $query_row['license_key'];
		$url = '';

		if (isset($this->request->get['module_id'])) {
			$url .= '&module_id=' . $this->request->get['module_id'];
		}

		if ($this->aleksey_18 && $this->aleksey_39() && $this->isWindows() && !file_exists($this->aleksey_5 . $this->aleksey_24)) {
			$this->aleksey_20 = true;
		}
		else if (empty($lkey)) {
			$this->activation();
			$this->response->redirect($this->url->link('extension/module/megamenuvhsheme/activation', 'token=' . $this->session->data['token'] . '&sheme=sheme' . $url, true));
		}

		$this->aleksey_34 = $lkey;
		$this->aleksey_38();
		if ($this->aleksey_20 && ($this->secret_key_dec == 'Y58BnYSeAR8r4FMBaYIButK4')) {
			$license = true;
		}
		else {
			$this->response->redirect($this->url->link('extension/module/megamenuvhsheme/activation', 'token=' . $this->session->data['token'] . '&sheme=sheme' . $url, true));
		}
		*/
	}

	public function index()
	{
		$this->load->model('extension/module/megamenuvhsheme');
		$this->load->language('extension/module/megamenuvhsheme');
		$this->document->addStyle('view/stylesheet/style_megamenu.css');
		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('megamenuvhsheme', $this->request->post);
			}
			else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$this->getList();
	}

	public function openModal()
	{
		$this->load->language('extension/module/megamenuvhsheme');
		$data['token'] = $this->session->data['token'];
		$data['button_save'] = $this->language->get('button_save');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['text_menu_sheme_type1'] = $this->language->get('text_menu_sheme_type1');
		$data['text_menu_sheme_type2'] = $this->language->get('text_menu_sheme_type2');
		$data['ns_text_type'] = $this->language->get('ns_text_type');

		if (isset($this->request->get['mm_sheme_id'])) {
			$this->load->model('extension/module/megamenuvhsheme');
			$data['mm_sheme_id'] = $this->request->get['mm_sheme_id'];
			$data['infomenu'] = $this->model_extension_module_megamenuvhsheme->getMenuNameType($this->request->get['mm_sheme_id']);
			$this->response->setOutput($this->load->view('extension/module/megamenu/editmenu', $data));
		}
		else {
			$this->response->setOutput($this->load->view('extension/module/megamenu/addmenu', $data));
		}
	}

	public function addMenuSheme()
	{
		$this->load->language('extension/module/megamenuvhsheme');
		$this->load->model('extension/module/megamenuvhsheme');
		$this->load->model('localisation/language');
		$json = array();

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatePopup()) {
			if ((utf8_strlen($this->request->post['name']) < 3) || (64 < utf8_strlen($this->request->post['name']))) {
				$json['warning'] = $this->language->get('error_namemenu');
				return $this->response->setOutput(json_encode($json));
			}

			$this->model_extension_module_megamenuvhsheme->addListMenuName($this->request->post);
			$json['success'] = $this->language->get('text_success');
			return $this->response->setOutput(json_encode($json));
		}

		$json['warning'] = $this->error;
		return $this->response->setOutput(json_encode($json));
	}

	public function editMenuSheme()
	{
		$this->load->language('extension/module/megamenuvhsheme');
		$this->load->model('extension/module/megamenuvhsheme');
		$this->load->model('localisation/language');
		$json = array();

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatePopup()) {
			if ((utf8_strlen($this->request->post['name']) < 3) || (64 < utf8_strlen($this->request->post['name']))) {
				$json['warning'] = $this->language->get('error_namemenu');
				return $this->response->setOutput(json_encode($json));
			}

			$this->model_extension_module_megamenuvhsheme->editListMenuName($this->request->post);
			$json['success'] = $this->language->get('text_success');
			return $this->response->setOutput(json_encode($json));
		}

		$json['warning'] = $this->error;
		return $this->response->setOutput(json_encode($json));
	}

	public function deleteMenu()
	{
		$this->load->language('extension/module/megamenuvhsheme');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('extension/module/megamenuvhsheme');

		if (isset($this->request->post['selected']) && $this->validateMenu()) {
			foreach ($this->request->post['selected'] as $mm_sheme_id) {
				$this->model_extension_module_megamenuvhsheme->deleteMenu($mm_sheme_id);
			}

			$url = '';

			if (isset($this->request->get['module_id'])) {
				$url .= '&module_id=' . $this->request->get['module_id'];
			}

			if (isset($this->request->get['type'])) {
				$url .= '&type=' . $this->request->get['type'];
			}

			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module/megamenuvhsheme/getMenu', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getMenu();
	}

	public function getMenu()
	{
		$this->licenseValidation();
		$this->load->model('extension/module/megamenuvhsheme');
		$this->load->language('extension/module/megamenuvhsheme');
		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		}
		else {
			$data['success'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		}
		else {
			$data['error_warning'] = '';
		}

		$url = '';

		if (isset($this->request->get['module_id'])) {
			$url .= '&module_id=' . $this->request->get['module_id'];
		}

		if (isset($this->request->get['type'])) {
			$url .= '&type=' . $this->request->get['type'];
		}

		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array('text' => $this->language->get('text_home'), 'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'));
		$data['breadcrumbs'][] = array('text' => $this->language->get('text_module'), 'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'));
		$data['breadcrumbs'][] = array('text' => $this->language->get('heading_title'), 'href' => $this->url->link('extension/module/megamenuvhsheme/getMenu', 'token=' . $this->session->data['token'] . $url, 'SSL'));

		if (!isset($this->request->get['module_id'])) {
			$data['cancel'] = $this->url->link('extension/module/megamenuvhsheme', 'token=' . $this->session->data['token'] . '&type=module', true);
		}
		else {
			$data['cancel'] = $this->url->link('extension/module/megamenuvhsheme', 'token=' . $this->session->data['token'] . '&type=module' . '&module_id=' . $this->request->get['module_id'], true);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['delete'] = $this->url->link('extension/module/megamenuvhsheme/deleteMenu', 'token=' . $this->session->data['token'] . '&type=module', true);
		}
		else {
			$data['delete'] = $this->url->link('extension/module/megamenuvhsheme/deleteMenu', 'token=' . $this->session->data['token'] . '&type=module' . '&module_id=' . $this->request->get['module_id'], true);
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array) $this->request->post['selected'];
		}
		else {
			$data['selected'] = array();
		}

		$data['results'] = array();
		$results = $this->model_extension_module_megamenuvhsheme->getListMenuName();

		foreach ($results as $result) {
			if ($result['menu_sheme_type'] == '1') {
				$menu_sheme_type = $this->language->get('text_menu_sheme_type1');
			}
			else {
				$menu_sheme_type = $this->language->get('text_menu_sheme_type2');
			}

			$data['results'][] = array('mm_sheme_id' => $result['mm_sheme_id'], 'name' => $result['name'], 'menu_sheme_type' => $menu_sheme_type, 'edit' => $this->url->link('extension/module/megamenuvhsheme/listMenu', 'token=' . $this->session->data['token'] . '&mm_sheme_id=' . $result['mm_sheme_id'] . '&menu_sheme_type=' . $result['menu_sheme_type'] . $url, true));
		}

		$data['token'] = $this->session->data['token'];
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit_list_Item'] = $this->language->get('text_edit_list_Item');
		$data['text_add'] = $this->language->get('text_add');
		$data['column_name'] = $this->language->get('column_name');
		$data['column_action'] = $this->language->get('column_action');
		$data['ns_text_type'] = $this->language->get('ns_text_type');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('extension/module/megamenu/megamenuvhsheme_menu', $data));
	}

	public function listMenu()
	{
		$this->licenseValidation();
		$this->document->addStyle('view/stylesheet/style_megamenu.css');
		$this->load->model('extension/module/megamenuvhsheme');
		$this->load->language('extension/module/megamenuvhsheme');
		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		}
		else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		}
		else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array) $this->request->post['selected'];
		}
		else {
			$data['selected'] = array();
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		}
		else {
			$sort = 'sort_menu';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		}
		else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		}
		else {
			$page = 1;
		}

		if (isset($this->request->get['mm_sheme_id'])) {
			$mm_sheme_id = $this->request->get['mm_sheme_id'];
		}
		else {
			$mm_sheme_id = 0;
		}

		$url = '';

		if (isset($this->request->get['module_id'])) {
			$url .= '&module_id=' . $this->request->get['module_id'];
		}

		if (isset($this->request->get['type'])) {
			$url .= '&type=' . $this->request->get['type'];
		}

		if (isset($this->request->get['mm_sheme_id'])) {
			$url .= '&mm_sheme_id=' . $this->request->get['mm_sheme_id'];
		}

		if (isset($this->request->get['menu_sheme_type'])) {
			$url .= '&menu_sheme_type=' . $this->request->get['menu_sheme_type'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array('text' => $this->language->get('text_home'), 'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'));
		$data['breadcrumbs'][] = array('text' => $this->language->get('text_module'), 'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'));
		$data['breadcrumbs'][] = array('text' => $this->language->get('heading_title'), 'href' => $this->url->link('extension/module/megamenuvhsheme/listMenu', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		$data['token'] = $this->session->data['token'];
		$data['add'] = $this->url->link('extension/module/megamenuvhsheme/addItem', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (!isset($this->request->get['module_id'])) {
			$data['cancel'] = $this->url->link('extension/module/megamenuvhsheme/getMenu', 'token=' . $this->session->data['token'] . '&type=module', true);
		}
		else {
			$data['cancel'] = $this->url->link('extension/module/megamenuvhsheme/getMenu', 'token=' . $this->session->data['token'] . '&type=module' . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['delete'] = $this->url->link('extension/module/megamenuvhsheme/deleteItem', 'token=' . $this->session->data['token'] . $url, true);
		$data['lang_id'] = $this->config->get('config_language_id');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit_setting'] = $this->language->get('text_edit_setting');
		$data['text_edit_list_Item'] = $this->language->get('text_edit_list_Item');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_main_vertical_menu'] = $this->language->get('text_main_vertical_menu');
		$data['text_main_horizontal_menu'] = $this->language->get('text_main_horizontal_menu');
		$data['text_full_screen_menu'] = $this->language->get('text_full_screen_menu');
		$data['text_full_screen_layout'] = $this->language->get('text_full_screen_layout');
		$data['text_home_page'] = $this->language->get('text_home_page');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['entry_megamenu_status'] = $this->language->get('entry_megamenu_status');
		$data['entry_menu_selection'] = $this->language->get('entry_menu_selection');
		$data['entry_fixed_panel_top'] = $this->language->get('entry_fixed_panel_top');
		$data['entry_type_mobile_menu'] = $this->language->get('entry_type_mobile_menu');
		$data['text_category_add_auto_description'] = $this->language->get('text_category_add_auto_description');
		$data['text_category_add_auto'] = $this->language->get('text_category_add_auto');
		$data['text_creating_categories'] = $this->language->get('text_creating_categories');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['column_title'] = $this->language->get('column_title');
		$data['column_link'] = $this->language->get('column_link');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');
		$data['column_type'] = $this->language->get('column_type');
		$data['column_sticker'] = $this->language->get('column_sticker');

		if (isset($this->request->post['megamenu_setting'])) {
			$data['megamenu_setting'] = $this->request->post['megamenu_setting'];
		}
		else {
			$data['megamenu_setting'] = $this->config->get('megamenu_setting');
		}

		$data['list_menu_results'] = array();
		$filter_data = array('sort' => $sort, 'mm_sheme_id' => $mm_sheme_id, 'order' => $order);
		$data['mm_sheme_id'] = $mm_sheme_id;
		$results = $this->model_extension_module_megamenuvhsheme->getListMenu($filter_data);

		foreach ($results as $result) {
			$data['list_menu_results'][] = array('megamenu_id' => $result['megamenu_id'], 'namemenu' => json_decode($result['namemenu'], true), 'sticker_parent' => json_decode($result['sticker_parent'], true), 'spbg' => $result['sticker_parent_bg'], 'spctext' => $result['spctext'], 'link' => json_decode($result['link'], true), 'menu_type' => $this->language->get('ns_text_type_' . $result['menu_type']), 'status' => $result['status'] ? $this->language->get('text_enabled_icon') : $this->language->get('text_disabled_icon'), 'sort_menu' => $result['sort_menu'], 'edit' => $this->url->link('extension/module/megamenuvhsheme/editItem', 'token=' . $this->session->data['token'] . '&megamenu_id=' . $result['megamenu_id'] . $url, true));
		}

		$url = '';

		if (isset($this->request->get['module_id'])) {
			$url .= '&module_id=' . $this->request->get['module_id'];
		}

		if (isset($this->request->get['type'])) {
			$url .= '&type=' . $this->request->get['type'];
		}

		if (isset($this->request->get['mm_sheme_id'])) {
			$url .= '&mm_sheme_id=' . $this->request->get['mm_sheme_id'];
		}

		if (isset($this->request->get['menu_sheme_type'])) {
			$url .= '&menu_sheme_type=' . $this->request->get['menu_sheme_type'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		}
		else {
			$url .= '&order=ASC';
		}

		$data['sort_menu_type'] = $this->url->link('extension/module/megamenuvhsheme', 'token=' . $this->session->data['token'] . '&sort=menu_type' . $url, true);
		$data['sort_status'] = $this->url->link('extension/module/megamenuvhsheme/listMenu', 'token=' . $this->session->data['token'] . '&sort=status' . $url, true);
		$data['sort_menu'] = $this->url->link('extension/module/megamenuvhsheme/listMenu', 'token=' . $this->session->data['token'] . '&sort=sort_menu' . $url, true);
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('extension/module/megamenu/listmenu', $data));
	}

	public function getList()
	{
		$this->licenseValidation();

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		}
		else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		}
		else {
			$data['error_name'] = '';
		}

		if (isset($this->error['menu'])) {
			$data['error_menu'] = $this->error['menu'];
		}
		else {
			$data['error_menu'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		}
		else {
			$data['success'] = '';
		}

		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array('text' => $this->language->get('text_home'), 'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'));
		$data['breadcrumbs'][] = array('text' => $this->language->get('text_module'), 'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'));
		$data['breadcrumbs'][] = array('text' => $this->language->get('heading_title'), 'href' => $this->url->link('extension/module/megamenuvhsheme', 'token=' . $this->session->data['token'], 'SSL'));

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/megamenuvhsheme', 'token=' . $this->session->data['token'], true);
		}
		else {
			$data['action'] = $this->url->link('extension/module/megamenuvhsheme', 'token=' . $this->session->data['token'] . '&type=module' . '&module_id=' . $this->request->get['module_id'], true);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['create_menu'] = $this->url->link('extension/module/megamenuvhsheme/getMenu', 'token=' . $this->session->data['token'], true);
		}
		else {
			$data['create_menu'] = $this->url->link('extension/module/megamenuvhsheme/getMenu', 'token=' . $this->session->data['token'] . '&type=module' . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		$data['token'] = $this->session->data['token'];
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit_setting'] = $this->language->get('text_edit_setting');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_create_menu'] = $this->language->get('text_create_menu');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['entry_megamenu_status'] = $this->language->get('entry_megamenu_status');
		$data['entry_menu_mask'] = $this->language->get('entry_menu_mask');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_menu'] = $this->language->get('entry_menu');
		$data['text_select'] = $this->language->get('text_select');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		$data['megamenushems'] = $this->model_extension_module_megamenuvhsheme->getListMenuName();

		if (isset($this->request->post['mm_sheme_id'])) {
			$data['mm_sheme_id'] = $this->request->post['name'];
		}
		else if (!empty($module_info['mm_sheme_id'])) {
			$data['mm_sheme_id'] = $module_info['mm_sheme_id'];
		}
		else {
			$data['mm_sheme_id'] = '';
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		}
		else if (!empty($module_info['name'])) {
			$data['name'] = $module_info['name'];
		}
		else {
			$data['name'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		}
		else if (!empty($module_info['status'])) {
			$data['status'] = $module_info['status'];
		}
		else {
			$data['status'] = '';
		}

		if (isset($this->request->post['sheme_menu_mask'])) {
			$data['sheme_menu_mask'] = $this->request->post['sheme_menu_mask'];
		}
		else if (!empty($module_info['sheme_menu_mask'])) {
			$data['sheme_menu_mask'] = $module_info['sheme_menu_mask'];
		}
		else {
			$data['sheme_menu_mask'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('extension/module/megamenuvhsheme', $data));
	}

	public function getForm()
	{
		$this->licenseValidation();
		$this->document->addStyle('view/stylesheet/style_megamenu.css');
		$this->document->addScript('view/javascript/jscolor/jscolor.js');

		if ($this->config->get('config_editor_default')) {
			$this->document->addScript('view/javascript/ckeditor/ckeditor.js');
			$this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
		}
		else {
			$this->document->addScript('view/javascript/summernote/summernote.js');
			$this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
			$this->document->addScript('view/javascript/summernote/opencart.js');
			$this->document->addStyle('view/javascript/summernote/summernote.css');
		}

		$this->load->language('extension/module/megamenuvhsheme');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['text_edit_form'] = $this->language->get('text_edit_form');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_add'] = $this->language->get('text_add');
		$data['text_delete'] = $this->language->get('text_delete');
		$data['ns_text_add_html'] = $this->language->get('ns_text_add_html');
		$data['ns_text_menu_name'] = $this->language->get('ns_text_menu_name');
		$data['ns_text_additional_menu'] = $this->language->get('ns_text_additional_menu');
		$data['ns_text_menu_link'] = $this->language->get('ns_text_menu_link');
		$data['ns_text_type'] = $this->language->get('ns_text_type');
		$data['ns_text_status'] = $this->language->get('ns_text_status');
		$data['ns_text_sticker_parent'] = $this->language->get('ns_text_sticker_parent');
		$data['ns_text_sticker_parent_bg'] = $this->language->get('ns_text_sticker_parent_bg');
		$data['ns_text_sticker_parent_color'] = $this->language->get('ns_text_sticker_parent_color');
		$data['ns_text_sort_menu'] = $this->language->get('ns_text_sort_menu');
		$data['ns_text_thumb'] = $this->language->get('ns_text_thumb');
		$data['ns_text_thumb_hover'] = $this->language->get('ns_text_thumb_hover');
		$data['ns_text_type_category'] = $this->language->get('ns_text_type_category');
		$data['ns_text_type_html'] = $this->language->get('ns_text_type_html');
		$data['ns_text_type_manufacturer'] = $this->language->get('ns_text_type_manufacturer');
		$data['ns_text_type_information'] = $this->language->get('ns_text_type_information');
		$data['ns_text_type_product'] = $this->language->get('ns_text_type_product');
		$data['ns_text_type_freelink'] = $this->language->get('ns_text_type_freelink');
		$data['ns_text_type_link'] = $this->language->get('ns_text_type_link');
		$data['ns_text_manufacturer'] = $this->language->get('ns_text_manufacturer');
		$data['ns_type_dropdown_list'] = $this->language->get('ns_type_dropdown_list');
		$data['ns_type_manuf_image'] = $this->language->get('ns_type_manuf_image');
		$data['ns_type_manuf_alphabet_image'] = $this->language->get('ns_type_manuf_alphabet_image');
		$data['ns_text_information'] = $this->language->get('ns_text_information');
		$data['ns_text_product_width'] = $this->language->get('ns_text_product_width');
		$data['ns_text_product_height'] = $this->language->get('ns_text_product_height');
		$data['ns_text_product'] = $this->language->get('ns_text_product');
		$data['ns_text_html_description'] = $this->language->get('ns_text_html_description');
		$data['ns_type_dropdown_simple'] = $this->language->get('ns_type_dropdown_simple');
		$data['ns_type_dropdown_full'] = $this->language->get('ns_type_dropdown_full');
		$data['ns_type_dropdown_full_image'] = $this->language->get('ns_type_dropdown_full_image');
		$data['ns_show_sub_categories'] = $this->language->get('ns_show_sub_categories');
		$data['ns_text_category'] = $this->language->get('ns_text_category');
		$data['ns_text_link_options'] = $this->language->get('ns_text_link_options');
		$data['column_3level'] = $this->language->get('column_3level');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		}
		else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['namemenu'])) {
			$data['error_namemenu'] = $this->error['namemenu'];
		}
		else {
			$data['error_namemenu'] = array();
		}

		if (isset($this->error['link'])) {
			$data['error_link'] = $this->error['link'];
		}
		else {
			$data['error_link'] = array();
		}

		if (isset($this->error['menu_type'])) {
			$data['error_menu_type'] = $this->error['menu_type'];
		}
		else {
			$data['error_menu_type'] = '';
		}

		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array('text' => $this->language->get('text_home'), 'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'), 'separator' => false);
		$url = '';

		if (isset($this->request->get['mm_sheme_id'])) {
			$url .= '&mm_sheme_id=' . $this->request->get['mm_sheme_id'];
		}

		if (isset($this->request->get['module_id'])) {
			$url .= '&module_id=' . $this->request->get['module_id'];
		}

		if (isset($this->request->get['type'])) {
			$url .= '&type=' . $this->request->get['type'];
		}

		if (!isset($this->request->get['megamenu_id'])) {
			$data['breadcrumbs'][] = array('text' => $this->language->get('heading_title'), 'href' => $this->url->link('extension/module/megamenuvhsheme/addItemMenu', 'token=' . $this->session->data['token'] . $url, 'SSL'), 'separator' => ' :: ');
		}
		else {
			$data['breadcrumbs'][] = array('text' => $this->language->get('heading_title'), 'href' => $this->url->link('extension/module/megamenuvhsheme/editItem', 'token=' . $this->session->data['token'] . '&megamenu_id=' . $this->request->get['megamenu_id'] . $url, true), 'separator' => ' :: ');
		}

		$data['token'] = $this->session->data['token'];

		if (!isset($this->request->get['megamenu_id'])) {
			$data['action'] = $this->url->link('extension/module/megamenuvhsheme/addItem', 'token=' . $this->session->data['token'] . $url, true);
		}
		else {
			$data['action'] = $this->url->link('extension/module/megamenuvhsheme/editItem', 'token=' . $this->session->data['token'] . '&megamenu_id=' . $this->request->get['megamenu_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('extension/module/megamenuvhsheme/listMenu', 'token=' . $this->session->data['token'] . $url, true);
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$this->load->model('tool/image');
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		$menuvh_info = array();

		if (isset($this->request->get['megamenu_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$menuvh_info = $this->model_extension_module_megamenuvhsheme->getItem($this->request->get['megamenu_id']);
		}

		if (!empty($menuvh_info['freelinks_setting'])) {
			$data['sfl'] = json_decode($menuvh_info['freelinks_setting'], true);
		}
		else {
			$data['sfl'] = '';
		}

		if (isset($data['sfl']['freelink_item'])) {
			$freelink_items = $data['sfl']['freelink_item'];
		}
		else {
			$freelink_items = array();
		}

		$data['freelink_items'] = array();

		foreach ($freelink_items as $key => $res_freelink) {
			foreach ($res_freelink as $banner_item) {
				if (is_file(DIR_IMAGE . $banner_item['image'])) {
					$image = $banner_item['image'];
					$thumb = $banner_item['image'];
				}
				else {
					$image = '';
					$thumb = 'no_image.png';
				}

				if (!empty($banner_item['subcat'])) {
					$subcat = $banner_item['subcat'];
				}
				else {
					$subcat = array();
				}

				$data['freelink_items'][$key][] = array('image' => $image, 'thumb' => $this->model_tool_image->resize($thumb, 100, 100), 'title' => $banner_item['title'], 'link' => $banner_item['link'], 'sort' => $banner_item['sort'], 'subcat' => $subcat);
			}
		}

		if (!empty($menuvh_info['use_add_html'])) {
			$data['use_add_html'] = json_decode($menuvh_info['use_add_html'], true);
		}
		else {
			$data['use_add_html'] = '0';
		}

		if (!empty($menuvh_info['add_html'])) {
			$data['add_html'] = json_decode($menuvh_info['add_html'], true);
		}
		else {
			$data['add_html'] = '';
		}

		if (isset($this->request->post['menuvh']['namemenu'])) {
			$data['menuvh']['namemenu'] = $this->request->post['menuvh']['namemenu'];
		}
		else if (!empty($menuvh_info['namemenu'])) {
			$data['menuvh']['namemenu'] = json_decode($menuvh_info['namemenu'], true);
		}
		else {
			$data['menuvh']['namemenu'] = '';
		}

		if (isset($this->request->post['menuvh']['additional_menu'])) {
			$data['menuvh']['additional_menu'] = $this->request->post['menuvh']['additional_menu'];
		}
		else if (!empty($menuvh_info['additional_menu'])) {
			$data['menuvh']['additional_menu'] = $menuvh_info['additional_menu'];
		}
		else {
			$data['menuvh']['additional_menu'] = '';
		}

		if (isset($this->request->post['menuvh']['link'])) {
			$data['menuvh']['link'] = $this->request->post['menuvh']['link'];
		}
		else if (!empty($menuvh_info['link'])) {
			$data['menuvh']['link'] = json_decode($menuvh_info['link'], true);
		}
		else {
			$data['menuvh']['link'] = '';
		}

		if (isset($this->request->post['menuvh']['menu_type'])) {
			$data['menuvh']['menu_type'] = $this->request->post['menuvh']['menu_type'];
		}
		else if (!empty($menuvh_info['menu_type'])) {
			$data['menuvh']['menu_type'] = $menuvh_info['menu_type'];
		}
		else {
			$data['menuvh']['menu_type'] = '';
		}

		if (isset($this->request->post['menuvh']['status'])) {
			$data['menuvh']['status'] = $this->request->post['menuvh']['status'];
		}
		else if (!empty($menuvh_info['status'])) {
			$data['menuvh']['status'] = $menuvh_info['status'];
		}
		else {
			$data['menuvh']['status'] = '0';
		}

		if (isset($this->request->post['menuvh']['sticker_parent'])) {
			$data['menuvh']['sticker_parent'] = $this->request->post['menuvh']['sticker_parent'];
		}
		else if (!empty($menuvh_info['sticker_parent'])) {
			$data['menuvh']['sticker_parent'] = json_decode($menuvh_info['sticker_parent'], true);
		}
		else {
			$data['menuvh']['sticker_parent'] = '';
		}

		if (!empty($menuvh_info['sticker_parent_bg'])) {
			$data['menuvh']['sticker_parent_bg'] = $menuvh_info['sticker_parent_bg'];
		}
		else {
			$data['menuvh']['sticker_parent_bg'] = '';
		}

		if (!empty($menuvh_info['spctext'])) {
			$data['menuvh']['spctext'] = $menuvh_info['spctext'];
		}
		else {
			$data['menuvh']['spctext'] = '';
		}

		if (isset($this->request->post['menuvh']['sort_menu'])) {
			$data['menuvh']['sort_menu'] = $this->request->post['menuvh']['sort_menu'];
		}
		else if (!empty($menuvh_info['sort_menu'])) {
			$data['menuvh']['sort_menu'] = $menuvh_info['sort_menu'];
		}
		else {
			$data['menuvh']['sort_menu'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['menuvh']['image'])) {
			$data['menuvh']['image'] = $this->request->post['menuvh']['image'];
		}
		else if (!empty($menuvh_info['image'])) {
			$data['menuvh']['image'] = $menuvh_info['image'];
		}
		else {
			$data['menuvh']['image'] = '';
		}

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['menuvh']['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		}
		else if (!empty($menuvh_info) && is_file(DIR_IMAGE . $menuvh_info['image'])) {
			$data['menuvh']['thumb'] = $this->model_tool_image->resize($menuvh_info['image'], 100, 100);
		}
		else {
			$data['menuvh']['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if (isset($this->request->post['menuvh']['image_hover'])) {
			$data['menuvh']['image_hover'] = $this->request->post['menuvh']['image_hover'];
		}
		else if (!empty($menuvh_info['image_hover'])) {
			$data['menuvh']['image_hover'] = $menuvh_info['image_hover'];
		}
		else {
			$data['menuvh']['image_hover'] = '';
		}

		if (isset($this->request->post['image_hover']) && is_file(DIR_IMAGE . $this->request->post['image_hover'])) {
			$data['menuvh']['thumb_hover'] = $this->model_tool_image->resize($this->request->post['image_hover'], 100, 100);
		}
		else if (!empty($menuvh_info) && is_file(DIR_IMAGE . $menuvh_info['image_hover'])) {
			$data['menuvh']['thumb_hover'] = $this->model_tool_image->resize($menuvh_info['image_hover'], 100, 100);
		}
		else {
			$data['menuvh']['thumb_hover'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if (!empty($menuvh_info['informations_list'])) {
			$data['menuvh']['informations_sel_id'] = json_decode($menuvh_info['informations_list'], true);
		}
		else {
			$data['menuvh']['informations_sel_id'] = array();
		}

		if (!empty($menuvh_info['html_setting'])) {
			$data['html_block'] = json_decode($menuvh_info['html_setting'], true);
		}
		else {
			$data['html_block'] = '';
		}

		if (!empty($menuvh_info['manufacturers_setting'])) {
			$manufacturers_setting = json_decode($menuvh_info['manufacturers_setting'], true);
		}
		else {
			$manufacturers_setting = array();
		}

		if (!empty($manufacturers_setting['manufacturers_list'])) {
			$data['manufacturers_sel_id'] = $manufacturers_setting['manufacturers_list'];
		}
		else {
			$data['manufacturers_sel_id'] = array();
		}

		if (!empty($manufacturers_setting['type_manuf'])) {
			$data['type_manuf'] = $manufacturers_setting['type_manuf'];
		}
		else {
			$data['type_manuf'] = 'type_image';
		}

		if (!empty($menuvh_info['link_setting'])) {
			$data['use_target_blank'] = $menuvh_info['link_setting'];
		}
		else {
			$data['use_target_blank'] = '0';
		}

		$this->load->model('catalog/category');

		if (!empty($menuvh_info['category_setting'])) {
			$category_setting = json_decode($menuvh_info['category_setting'], true);
		}
		else {
			$category_setting = array();
		}

		if (!empty($category_setting['variant_category'])) {
			$data['variant_category'] = $category_setting['variant_category'];
		}
		else {
			$data['variant_category'] = 'simple';
		}

		if (!empty($category_setting['show_sub_category'])) {
			$data['show_sub_category'] = $category_setting['show_sub_category'];
		}
		else {
			$data['show_sub_category'] = '0';
		}

		if (!empty($category_setting['category_img_width'])) {
			$data['category_img_width'] = $category_setting['category_img_width'];
		}
		else {
			$data['category_img_width'] = '50';
		}

		if (!empty($category_setting['category_img_height'])) {
			$data['category_img_height'] = $category_setting['category_img_height'];
		}
		else {
			$data['category_img_height'] = '50';
		}

		$data['category_list_sel'] = array();

		if (!empty($category_setting['category_list'])) {
			foreach ($category_setting['category_list'] as $category_id) {
				$category = $this->model_catalog_category->getCategory((int) $category_id);

				if (isset($category['category_id'])) {
					$data['category_list_sel'][] = array('category_id' => $category['category_id'], 'name' => $category['path'] . ' > ' . $category['name']);
				}
			}
		}

		$this->load->model('catalog/product');

		if (!empty($menuvh_info['products_setting'])) {
			$products_setting = json_decode($menuvh_info['products_setting'], true);
		}
		else {
			$products_setting = array();
		}

		if (!empty($products_setting['product_width'])) {
			$data['product_width'] = $products_setting['product_width'];
		}
		else {
			$data['product_width'] = '50';
		}

		if (!empty($products_setting['product_height'])) {
			$data['product_height'] = $products_setting['product_height'];
		}
		else {
			$data['product_height'] = '50';
		}

		$data['products_list_sel'] = array();

		if (!empty($products_setting['products_list'])) {
			foreach ($products_setting['products_list'] as $product_id) {
				$product = $this->model_catalog_product->getProduct((int) $product_id);

				if (isset($product['product_id'])) {
					$data['products_list_sel'][] = array('product_id' => $product['product_id'], 'name' => $product['name']);
				}
			}
		}

		$this->load->model('catalog/manufacturer');
		$this->load->model('catalog/information');
		$data['manufacturers_list'] = array();
		$results_m = $this->model_catalog_manufacturer->getManufacturers(array('start' => 0, 'limit' => 999999, 'sort' => 'name'));

		foreach ($results_m as $result) {
			$data['manufacturers_list'][] = array('manufacturer_id' => $result['manufacturer_id'], 'name' => $result['name']);
		}

		$data['informations_list'] = array();
		$results_i = $this->model_catalog_information->getInformations(array('start' => 0, 'limit' => 999999, 'sort' => 'title'));

		foreach ($results_i as $result) {
			$data['informations_list'][] = array('information_id' => $result['information_id'], 'title' => $result['title']);
		}

		if (isset($this->request->get['menu_sheme_type'])) {
			$data['menu_sheme_type'] = $this->request->get['menu_sheme_type'];
		}
		else {
			$data['menu_sheme_type'] = '2';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('extension/module/megamenu/megamenuvhsheme_form', $data));
	}

	public function popupTypeMenu()
	{
		$this->load->language('extension/module/megamenuvhsheme');
		$data['lang_id'] = $this->config->get('config_language_id');
		$data['token'] = $this->session->data['token'];
		$data['button_save'] = $this->language->get('button_save');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_edit_setting'] = $this->language->get('text_edit_setting');
		$data['ns_text_add_html'] = $this->language->get('ns_text_add_html');
		$data['ns_text_type'] = $this->language->get('ns_text_type');
		$data['ns_text_type_category'] = $this->language->get('ns_text_type_category');
		$data['ns_text_type_html'] = $this->language->get('ns_text_type_html');
		$data['ns_text_type_manufacturer'] = $this->language->get('ns_text_type_manufacturer');
		$data['ns_text_type_information'] = $this->language->get('ns_text_type_information');
		$data['ns_text_type_product'] = $this->language->get('ns_text_type_product');
		$data['ns_text_type_freelink'] = $this->language->get('ns_text_type_freelink');
		$data['ns_text_type_link'] = $this->language->get('ns_text_type_link');
		$data['ns_text_manufacturer'] = $this->language->get('ns_text_manufacturer');
		$data['ns_type_dropdown_list'] = $this->language->get('ns_type_dropdown_list');
		$data['ns_type_manuf_image'] = $this->language->get('ns_type_manuf_image');
		$data['ns_type_manuf_alphabet_image'] = $this->language->get('ns_type_manuf_alphabet_image');
		$data['ns_text_information'] = $this->language->get('ns_text_information');
		$data['ns_text_product_width'] = $this->language->get('ns_text_product_width');
		$data['ns_text_product_height'] = $this->language->get('ns_text_product_height');
		$data['ns_text_product'] = $this->language->get('ns_text_product');
		$data['ns_text_html_description'] = $this->language->get('ns_text_html_description');
		$data['ns_type_dropdown_simple'] = $this->language->get('ns_type_dropdown_simple');
		$data['ns_type_dropdown_full'] = $this->language->get('ns_type_dropdown_full');
		$data['ns_type_dropdown_full_image'] = $this->language->get('ns_type_dropdown_full_image');
		$data['ns_show_sub_categories'] = $this->language->get('ns_show_sub_categories');
		$data['ns_text_category'] = $this->language->get('ns_text_category');
		$data['ns_text_link_options'] = $this->language->get('ns_text_link_options');
		$data['column_3level'] = $this->language->get('column_3level');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['ns_text_thumb'] = $this->language->get('ns_text_thumb');
		$data['ns_text_menu_name'] = $this->language->get('ns_text_menu_name');
		$data['text_add'] = $this->language->get('text_add');
		$data['ns_text_sort_menu'] = $this->language->get('ns_text_sort_menu');
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$this->load->model('tool/image');
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->get['sheme'])) {
			$data['sheme'] = $this->request->get['sheme'];
		}

		if (isset($this->request->get['megamenu_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$this->load->model('extension/module/megamenuvhsheme');
			$menuvh_info = array();
			$menuvh_info = $this->model_extension_module_megamenuvhsheme->getItem($this->request->get['megamenu_id']);

			if (!empty($menuvh_info['freelinks_setting'])) {
				$data['sfl'] = json_decode($menuvh_info['freelinks_setting'], true);
			}
			else {
				$data['sfl'] = '';
			}

			if (isset($data['sfl']['freelink_item'])) {
				$freelink_items = $data['sfl']['freelink_item'];
			}
			else {
				$freelink_items = array();
			}

			$data['freelink_items'] = array();

			foreach ($freelink_items as $key => $res_freelink) {
				foreach ($res_freelink as $banner_item) {
					if (is_file(DIR_IMAGE . $banner_item['image'])) {
						$image = $banner_item['image'];
						$thumb = $banner_item['image'];
					}
					else {
						$image = '';
						$thumb = 'no_image.png';
					}

					if (!empty($banner_item['subcat'])) {
						$subcat = $banner_item['subcat'];
					}
					else {
						$subcat = array();
					}

					$data['freelink_items'][$key][] = array('image' => $image, 'thumb' => $this->model_tool_image->resize($thumb, 100, 100), 'title' => $banner_item['title'], 'link' => $banner_item['link'], 'sort' => $banner_item['sort'], 'subcat' => $subcat);
				}
			}

			if (!empty($menuvh_info['namemenu'])) {
				$data['namemenu'] = json_decode($menuvh_info['namemenu'], true);
			}
			else {
				$data['namemenu'] = '0';
			}

			if (!empty($menuvh_info['use_add_html'])) {
				$data['use_add_html'] = json_decode($menuvh_info['use_add_html'], true);
			}
			else {
				$data['use_add_html'] = '0';
			}

			if (!empty($menuvh_info['add_html'])) {
				$data['add_html'] = json_decode($menuvh_info['add_html'], true);
			}
			else {
				$data['add_html'] = '';
			}

			if (!empty($menuvh_info['link'])) {
				$data['menuvh']['link'] = json_decode($menuvh_info['link'], true);
			}
			else {
				$data['menuvh']['link'] = '';
			}

			if (!empty($menuvh_info['menu_type'])) {
				$data['menuvh']['menu_type'] = $menuvh_info['menu_type'];
			}
			else {
				$data['menuvh']['menu_type'] = '';
			}

			if (!empty($menuvh_info['status'])) {
				$data['menuvh']['status'] = $menuvh_info['status'];
			}
			else {
				$data['menuvh']['status'] = '0';
			}

			if (!empty($menuvh_info['sticker_parent'])) {
				$data['menuvh']['sticker_parent'] = json_decode($menuvh_info['sticker_parent'], true);
			}
			else {
				$data['menuvh']['sticker_parent'] = '';
			}

			if (!empty($menuvh_info['sticker_parent_bg'])) {
				$data['menuvh']['sticker_parent_bg'] = $menuvh_info['sticker_parent_bg'];
			}
			else {
				$data['menuvh']['sticker_parent_bg'] = '';
			}

			if (!empty($menuvh_info['spctext'])) {
				$data['menuvh']['spctext'] = $menuvh_info['spctext'];
			}
			else {
				$data['menuvh']['spctext'] = '';
			}

			if (!empty($menuvh_info['informations_list'])) {
				$data['menuvh']['informations_sel_id'] = json_decode($menuvh_info['informations_list'], true);
			}
			else {
				$data['menuvh']['informations_sel_id'] = array();
			}

			if (!empty($menuvh_info['html_setting'])) {
				$data['html_block'] = json_decode($menuvh_info['html_setting'], true);
			}
			else {
				$data['html_block'] = '';
			}

			if (!empty($menuvh_info['manufacturers_setting'])) {
				$manufacturers_setting = json_decode($menuvh_info['manufacturers_setting'], true);
			}
			else {
				$manufacturers_setting = array();
			}

			if (!empty($manufacturers_setting['manufacturers_list'])) {
				$data['manufacturers_sel_id'] = $manufacturers_setting['manufacturers_list'];
			}
			else {
				$data['manufacturers_sel_id'] = array();
			}

			if (!empty($manufacturers_setting['type_manuf'])) {
				$data['type_manuf'] = $manufacturers_setting['type_manuf'];
			}
			else {
				$data['type_manuf'] = 'type_image';
			}

			if (!empty($menuvh_info['link_setting'])) {
				$data['use_target_blank'] = $menuvh_info['link_setting'];
			}
			else {
				$data['use_target_blank'] = '0';
			}

			$this->load->model('catalog/category');

			if (!empty($menuvh_info['category_setting'])) {
				$category_setting = json_decode($menuvh_info['category_setting'], true);
			}
			else {
				$category_setting = array();
			}

			if (!empty($category_setting['variant_category'])) {
				$data['variant_category'] = $category_setting['variant_category'];
			}
			else {
				$data['variant_category'] = 'simple';
			}

			if (!empty($category_setting['show_sub_category'])) {
				$data['show_sub_category'] = $category_setting['show_sub_category'];
			}
			else {
				$data['show_sub_category'] = '0';
			}

			if (!empty($category_setting['category_img_width'])) {
				$data['category_img_width'] = $category_setting['category_img_width'];
			}
			else {
				$data['category_img_width'] = '50';
			}

			if (!empty($category_setting['category_img_height'])) {
				$data['category_img_height'] = $category_setting['category_img_height'];
			}
			else {
				$data['category_img_height'] = '50';
			}

			$data['category_list_sel'] = array();

			if (!empty($category_setting['category_list'])) {
				foreach ($category_setting['category_list'] as $category_id) {
					$category = $this->model_catalog_category->getCategory((int) $category_id);

					if (isset($category['category_id'])) {
						$data['category_list_sel'][] = array('category_id' => $category['category_id'], 'name' => $category['path'] . ' > ' . $category['name']);
					}
				}
			}

			$this->load->model('catalog/product');

			if (!empty($menuvh_info['products_setting'])) {
				$products_setting = json_decode($menuvh_info['products_setting'], true);
			}
			else {
				$products_setting = array();
			}

			if (!empty($products_setting['product_width'])) {
				$data['product_width'] = $products_setting['product_width'];
			}
			else {
				$data['product_width'] = '50';
			}

			if (!empty($products_setting['product_height'])) {
				$data['product_height'] = $products_setting['product_height'];
			}
			else {
				$data['product_height'] = '50';
			}

			$data['products_list_sel'] = array();

			if (!empty($products_setting['products_list'])) {
				foreach ($products_setting['products_list'] as $product_id) {
					$product = $this->model_catalog_product->getProduct((int) $product_id);

					if (isset($product['product_id'])) {
						$data['products_list_sel'][] = array('product_id' => $product['product_id'], 'name' => $product['name']);
					}
				}
			}

			$this->load->model('catalog/manufacturer');
			$this->load->model('catalog/information');
			$data['manufacturers_list'] = array();
			$results_m = $this->model_catalog_manufacturer->getManufacturers(array('start' => 0, 'limit' => 999999, 'sort' => 'name'));

			foreach ($results_m as $result) {
				$data['manufacturers_list'][] = array('manufacturer_id' => $result['manufacturer_id'], 'name' => $result['name']);
			}

			$data['informations_list'] = array();
			$results_i = $this->model_catalog_information->getInformations(array('start' => 0, 'limit' => 999999, 'sort' => 'title'));

			foreach ($results_i as $result) {
				$data['informations_list'][] = array('information_id' => $result['information_id'], 'title' => $result['title']);
			}

			$data['megamenu_id'] = $this->request->get['megamenu_id'];
		}

		$this->response->setOutput($this->load->view('extension/module/megamenu/mm_popup_type_menu', $data));
	}

	public function saveTypeMenu()
	{
		$this->load->language('extension/module/megamenuvhsheme');
		$this->load->model('extension/module/megamenuvhsheme');
		$json = array();

		if (isset($this->request->get['megamenu_id'])) {
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateFormTypeMenu()) {
				$this->model_extension_module_megamenuvhsheme->saveTypeMenu($this->request->get['megamenu_id'], $this->request->post['menuvh']);
				$json['success'] = $this->language->get('text_success');
				return $this->response->setOutput(json_encode($json));
			}

			$json['warning'] = $this->error;
			return $this->response->setOutput(json_encode($json));
		}

		$json['warning'] = $this->language->get('error_warning');
		return $this->response->setOutput(json_encode($json));
	}

	public function popupLink()
	{
		$this->load->language('extension/module/megamenuvhsheme');
		$data['token'] = $this->session->data['token'];
		$data['ns_text_menu_link'] = $this->language->get('ns_text_menu_link');
		$data['button_save'] = $this->language->get('button_save');
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->get['megamenu_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$this->load->model('extension/module/megamenuvhsheme');
			$menuvh_info = array();
			$menuvh_info = $this->model_extension_module_megamenuvhsheme->getItem($this->request->get['megamenu_id']);

			if (!empty($menuvh_info['link'])) {
				$data['menuvh']['link'] = json_decode($menuvh_info['link'], true);
			}
			else {
				$data['menuvh']['link'] = '';
			}

			if (isset($this->request->get['sheme'])) {
				$data['sheme'] = $this->request->get['sheme'];
			}

			$data['megamenu_id'] = $this->request->get['megamenu_id'];
		}

		$this->response->setOutput($this->load->view('extension/module/megamenu/mm_popup_link', $data));
	}

	public function saveLinkMenu()
	{
		$this->load->language('extension/module/megamenuvhsheme');
		$this->load->model('extension/module/megamenuvhsheme');
		$json = array();

		if (isset($this->request->get['megamenu_id'])) {
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatePopup()) {
				$this->model_extension_module_megamenuvhsheme->saveLinkMenu($this->request->get['megamenu_id'], $this->request->post['menuvh']);
				$json['success'] = $this->language->get('text_success');
				return $this->response->setOutput(json_encode($json));
			}

			$json['warning'] = $this->error;
			return $this->response->setOutput(json_encode($json));
		}

		$json['warning'] = $this->language->get('error_warning');
		return $this->response->setOutput(json_encode($json));
	}

	public function popupSticker()
	{
		$this->load->language('extension/module/megamenuvhsheme');
		$data['token'] = $this->session->data['token'];
		$data['ns_setting_sticker'] = $this->language->get('ns_setting_sticker');
		$data['ns_text_sticker_parent'] = $this->language->get('ns_text_sticker_parent');
		$data['ns_text_sticker_parent_bg'] = $this->language->get('ns_text_sticker_parent_bg');
		$data['ns_text_sticker_parent_color'] = $this->language->get('ns_text_sticker_parent_color');
		$data['button_save'] = $this->language->get('button_save');
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->get['sheme'])) {
			$data['sheme'] = $this->request->get['sheme'];
		}

		if (isset($this->request->get['megamenu_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$this->load->model('extension/module/megamenuvhsheme');
			$menuvh_info = array();
			$menuvh_info = $this->model_extension_module_megamenuvhsheme->getItem($this->request->get['megamenu_id']);

			if (!empty($menuvh_info['sticker_parent'])) {
				$data['menuvh']['sticker_parent'] = json_decode($menuvh_info['sticker_parent'], true);
			}
			else {
				$data['menuvh']['sticker_parent'] = '';
			}

			if (!empty($menuvh_info['sticker_parent_bg'])) {
				$data['menuvh']['sticker_parent_bg'] = $menuvh_info['sticker_parent_bg'];
			}
			else {
				$data['menuvh']['sticker_parent_bg'] = '';
			}

			if (!empty($menuvh_info['spctext'])) {
				$data['menuvh']['spctext'] = $menuvh_info['spctext'];
			}
			else {
				$data['menuvh']['spctext'] = '';
			}

			$data['megamenu_id'] = $this->request->get['megamenu_id'];
		}

		$this->response->setOutput($this->load->view('extension/module/megamenu/mm_popup_sticker', $data));
	}

	public function saveStickerMenu()
	{
		$this->load->language('extension/module/megamenuvhsheme');
		$this->load->model('extension/module/megamenuvhsheme');
		$json = array();

		if (isset($this->request->get['megamenu_id'])) {
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatePopup()) {
				$this->model_extension_module_megamenuvhsheme->saveStickerMenu($this->request->get['megamenu_id'], $this->request->post['menuvh']);
				$json['success'] = $this->language->get('text_success');
				return $this->response->setOutput(json_encode($json));
			}

			$json['warning'] = $this->error;
			return $this->response->setOutput(json_encode($json));
		}

		$json['warning'] = $this->language->get('error_warning');
		return $this->response->setOutput(json_encode($json));
	}

	protected function validatePopup()
	{
		if (!$this->user->hasPermission('modify', 'extension/module/megamenuvhsheme')) {
			$this->error = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function popupNameItem()
	{
		$this->load->language('extension/module/megamenuvhsheme');
		$data['token'] = $this->session->data['token'];
		$data['ns_text_menu_name'] = $this->language->get('ns_text_menu_name');
		$data['button_save'] = $this->language->get('button_save');
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->get['sheme'])) {
			$data['sheme'] = $this->request->get['sheme'];
		}

		if (isset($this->request->get['megamenu_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$this->load->model('extension/module/megamenuvhsheme');
			$menuvh_info = array();
			$menuvh_info = $this->model_extension_module_megamenuvhsheme->getItem($this->request->get['megamenu_id']);

			if (!empty($menuvh_info['namemenu'])) {
				$data['menuvh']['namemenu'] = json_decode($menuvh_info['namemenu'], true);
			}
			else {
				$data['menuvh']['namemenu'] = '';
			}

			$data['megamenu_id'] = $this->request->get['megamenu_id'];
		}

		$this->response->setOutput($this->load->view('extension/module/megamenu/mm_popup_name_item', $data));
	}

	public function saveNameItem()
	{
		$this->load->language('extension/module/megamenuvhsheme');
		$this->load->model('extension/module/megamenuvhsheme');
		$json = array();

		if (isset($this->request->get['megamenu_id'])) {
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatePopupNameItem()) {
				$this->model_extension_module_megamenuvhsheme->saveNameItem($this->request->get['megamenu_id'], $this->request->post['menuvh']);
				$json['success'] = $this->language->get('text_success');
				return $this->response->setOutput(json_encode($json));
			}

			$json['warning'] = $this->error;
			return $this->response->setOutput(json_encode($json));
		}

		$json['warning'] = $this->language->get('error_warning');
		return $this->response->setOutput(json_encode($json));
	}

	protected function validatePopupNameItem()
	{
		if (!$this->user->hasPermission('modify', 'extension/module/megamenuvhsheme')) {
			$this->error = $this->language->get('error_permission');
		}

		foreach ($this->request->post['menuvh']['namemenu'] as $language_id => $value) {
			if ((utf8_strlen($value) < 3) || (64 < utf8_strlen($value))) {
				$this->error = $this->language->get('error_namemenu');
			}
		}

		return !$this->error;
	}

	protected function validateFormTypeMenu()
	{
		if (!$this->user->hasPermission('modify', 'extension/module/megamenuvhsheme')) {
			$this->error = $this->language->get('error_permission');
		}

		if (isset($this->request->post['menuvh']['menu_type']) && ($this->request->post['menuvh']['menu_type'] == '0')) {
			$this->error = $this->language->get('error_menu_type');
		}

		return !$this->error;
	}

	public function addItem()
	{
		$this->load->language('extension/module/megamenuvhsheme');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('extension/module/megamenuvhsheme');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_extension_module_megamenuvhsheme->addItem($this->request->get['mm_sheme_id'], $this->request->post['menuvh']);
			$this->session->data['success'] = $this->language->get('text_success');
			$url = '';

			if (isset($this->request->get['module_id'])) {
				$url .= '&module_id=' . $this->request->get['module_id'];
			}

			if (isset($this->request->get['type'])) {
				$url .= '&type=' . $this->request->get['type'];
			}

			if (isset($this->request->get['mm_sheme_id'])) {
				$url .= '&mm_sheme_id=' . $this->request->get['mm_sheme_id'];
			}

			if (isset($this->request->get['menu_sheme_type'])) {
				$url .= '&menu_sheme_type=' . $this->request->get['menu_sheme_type'];
			}

			$this->response->redirect($this->url->link('extension/module/megamenuvhsheme/listMenu', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function editItem()
	{
		$this->load->language('extension/module/megamenuvhsheme');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('extension/module/megamenuvhsheme');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_extension_module_megamenuvhsheme->editItem($this->request->get['megamenu_id'], $this->request->post['menuvh']);
			$this->session->data['success'] = $this->language->get('text_success');
			$url = '';

			if (isset($this->request->get['module_id'])) {
				$url .= '&module_id=' . $this->request->get['module_id'];
			}

			if (isset($this->request->get['type'])) {
				$url .= '&type=' . $this->request->get['type'];
			}

			if (isset($this->request->get['mm_sheme_id'])) {
				$url .= '&mm_sheme_id=' . $this->request->get['mm_sheme_id'];
			}

			if (isset($this->request->get['menu_sheme_type'])) {
				$url .= '&menu_sheme_type=' . $this->request->get['menu_sheme_type'];
			}

			$this->response->redirect($this->url->link('extension/module/megamenuvhsheme/listMenu', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function deleteItem()
	{
		$this->document->addStyle('view/stylesheet/style_megamenu.css');
		$this->document->addScript('view/javascript/jscolor/jscolor.js');
		$this->load->language('extension/module/megamenuvhsheme');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('extension/module/megamenuvhsheme');

		if (isset($this->request->post['selected']) && $this->validateMenu()) {
			foreach ($this->request->post['selected'] as $megamenu_id) {
				$this->model_extension_module_megamenuvhsheme->deleteItem($megamenu_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');
			$url = '';

			if (isset($this->request->get['module_id'])) {
				$url .= '&module_id=' . $this->request->get['module_id'];
			}

			if (isset($this->request->get['type'])) {
				$url .= '&type=' . $this->request->get['type'];
			}

			if (isset($this->request->get['mm_sheme_id'])) {
				$url .= '&mm_sheme_id=' . $this->request->get['mm_sheme_id'];
			}

			$this->response->redirect($this->url->link('extension/module/megamenuvhsheme', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function validateMenu()
	{
		if (!$this->user->hasPermission('modify', 'extension/module/megamenuvhsheme')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validate()
	{
		if (!$this->user->hasPermission('modify', 'extension/module/megamenuvhsheme')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (isset($this->request->post['mm_sheme_id']) && ($this->request->post['mm_sheme_id'] == '0')) {
			$this->error['menu'] = $this->language->get('error_menu');
		}

		return !$this->error;
	}

	protected function validateForm()
	{
		if (!$this->user->hasPermission('modify', 'extension/module/megamenuvhsheme')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['menuvh']['namemenu'] as $language_id => $value) {
			if ((utf8_strlen($value) < 3) || (64 < utf8_strlen($value))) {
				$this->error['namemenu'][$language_id] = $this->language->get('error_namemenu');
			}
		}

		if (isset($this->request->post['menuvh']['menu_type']) && ($this->request->post['menuvh']['menu_type'] == 'link')) {
			foreach ($this->request->post['menuvh']['link'] as $language_id => $value) {
				if (empty($value)) {
					$this->error['link'][$language_id] = $this->language->get('error_link');
				}
			}
		}

		if (isset($this->request->post['menuvh']['menu_type']) && ($this->request->post['menuvh']['menu_type'] == '0')) {
			$this->error['menu_type'] = $this->language->get('error_menu_type');
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	public function changeStatus()
	{
		$data['token'] = $this->session->data['token'];
		$this->load->model('extension/module/megamenuvhsheme');
		$this->load->language('extension/module/megamenuvhsheme');
		$output = '';

		if (isset($this->request->get['object_id']) && $this->validatePopup()) {
			$get_request = explode('-', $this->request->get['object_id']);

			if (count($get_request) == 2) {
				$column_name = $get_request[0];
				$tabs_ns_id = $get_request[1];
				$result = $this->model_extension_module_megamenuvhsheme->getItem($tabs_ns_id);

				if ($result[$column_name]) {
					$this->model_extension_module_megamenuvhsheme->changeStatus($tabs_ns_id, 0);
				}
				else {
					$this->model_extension_module_megamenuvhsheme->changeStatus($tabs_ns_id, 1);
				}

				$result = $this->model_extension_module_megamenuvhsheme->getItem($tabs_ns_id);
				$output['success'] = $result[$column_name] ? $this->language->get('text_enabled_icon') : $this->language->get('text_disabled_icon');
			}
		}
		else {
			$output['error'] = $this->error;
		}

		return $this->response->setOutput(json_encode($output));
	}

	public function getCategoryDescriptions($category_id)
	{
		$category_description_data = array();
		$query = $this->db->query('SELECT * FROM ' . DB_PREFIX . 'category_description WHERE category_id = \'' . (int) $category_id . '\'');

		foreach ($query->rows as $result) {
			$category_description_data[$result['language_id']] = $result['name'];
		}

		return $category_description_data;
	}

	public function getCategories($parent_id = 0)
	{
		$query = $this->db->query('SELECT *,(SELECT keyword FROM ' . DB_PREFIX . 'url_alias WHERE query = \'category_id=' . (int) $parent_id . '\') AS keyword FROM ' . DB_PREFIX . 'category c ' . "\n\t\t" . 'LEFT JOIN ' . DB_PREFIX . 'category_description cd ON (c.category_id = cd.category_id) ' . "\n\t\t" . 'LEFT JOIN ' . DB_PREFIX . 'category_to_store c2s ON (c.category_id = c2s.category_id) ' . "\n\t\t" . 'WHERE c.parent_id = \'' . (int) $parent_id . '\' ' . "\n\t\t" . 'AND cd.language_id = \'' . (int) $this->config->get('config_language_id') . '\' ' . "\n\t\t" . 'AND c2s.store_id = \'' . (int) $this->config->get('config_store_id') . '\'  ' . "\n\t\t" . 'AND c.status = \'1\' ORDER BY c.sort_order');
		return $query->rows;
	}

	public function getCategoriesUrlAlias($category_id)
	{
		$category_description_data = array();
		$query = $this->db->query('SELECT keyword FROM ' . DB_PREFIX . 'url_alias WHERE query = \'category_id=' . (int) $category_id . '\'');
		return $query->row;
	}

	public function autocategoryadd()
	{
		$json = array();
		$this->load->language('extension/module/megamenuvhsheme');
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();

		if (isset($this->request->get['autocategoryadd']) && ($this->request->get['autocategoryadd'] != '') && $this->validatePopup()) {
			$category_auto = $this->getCategories(0);

			foreach ($category_auto as $category) {
				$children_data = array();
				$category_parent_name_data = array();

				if ($category['category_id']) {
					$category_parent_name = $this->getCategoryDescriptions($category['category_id']);
					$category_url_alias = $this->getCategoriesUrlAlias($category['category_id']);

					if (isset($category_url_alias['keyword'])) {
						foreach ($languages as $language) {
							$category_url_alias_keyword[$language['language_id']] = $category_url_alias['keyword'];
						}
					}
					else {
						$category_url_alias_keyword = '';
					}

					$children = $this->getCategories($category['category_id']);

					foreach ($children as $key => $child) {
						$children_data[$key] = $child['category_id'];
					}
				}

				$category_setting = array('variant_category' => 'simple', 'show_sub_category' => '1', 'category_img_width' => '50', 'category_img_height' => '50', 'category_list' => $children_data);
				$categories_data_all[] = array('category_id' => $category['category_id'], 'keyword' => $category_url_alias_keyword, 'name' => $category_parent_name, 'category_setting' => $category_setting);
			}

			$data['config_menu_items_new'] = array();

			foreach ($categories_data_all as $key => $category) {
				$data['config_menu_items_new'][] = array('namemenu' => $category['name'], 'additional_menu' => 'left', 'link' => $category['keyword'], 'menu_type' => 'category', 'status' => '1', 'sticker_parent' => '', 'sticker_parent_bg' => '', 'spctext' => '', 'sort_menu' => $key, 'image' => '', 'image_hover' => '', 'informations_list' => '', 'manufacturers_setting' => '', 'products_setting' => '', 'link_setting' => '', 'category_setting' => $category['category_setting'], 'html_setting' => '', 'freelinks_setting' => '', 'use_add_html' => '0', 'add_html' => '');
			}

			$this->load->model('extension/module/megamenuvhsheme');
			$this->model_extension_module_megamenuvhsheme->createsItem($this->request->get['mm_sheme_id'], $data['config_menu_items_new']);
			$json['success'] = $this->language->get('text_success');
			$this->session->data['success'] = $this->language->get('text_success');
		}
		else {
			$json['warning'] = $this->error;
		}

		return $this->response->setOutput(json_encode($json));
	}

	public function activation()
	{
		$this->load->model('extension/module/megamenuvhsheme');
		$this->load->language('extension/module/megamenuvhsheme');
		$data['heading_title_activation'] = $this->language->get('heading_title_activation');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['add_activation_key'] = $this->language->get('add_activation_key');
		$data['activated_btn'] = $this->language->get('activated_btn');
		$data['btn_deactivation'] = $this->language->get('btn_deactivation');
		$data['enter_deactivation_key'] = $this->language->get('enter_deactivation_key');
		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array('text' => $this->language->get('text_home'), 'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'), 'separator' => false);
		$url = '';

		if (isset($this->request->get['module_id'])) {
			$url .= '&module_id=' . $this->request->get['module_id'];
		}

		if (isset($this->request->get['sheme'])) {
			$data['sheme'] = 'sheme';
		}

		$data['breadcrumbs'][] = array('text' => $this->language->get('heading_title'), 'href' => $this->url->link('extension/module/megamenuvhsheme/activation', 'token=' . $this->session->data['token'] . $url, 'SSL'), 'separator' => ' :: ');
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$data['token'] = $this->session->data['token'];
		$data['action'] = $this->url->link('extension/module/megamenuvhsheme/activation', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		$data['heading_title_activation'] = $this->language->get('heading_title_activation');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateActivation($this->request->post['license_key'])) {
			$key = $this->request->post['license_key'];
			$this->session->data['success'] = $this->language->get('the_module_is_activated');
			$this->db->query('UPDATE ' . DB_PREFIX . 'megamenu_key SET `license_key`=\'\' WHERE `key`=\'local_key\'');
			$this->db->query('UPDATE ' . DB_PREFIX . 'megamenu_key SET `license_key`=\'' . $key . '\' where `key`=\'local_key\'');
			$this->response->redirect($this->url->link('extension/module/megamenuvhsheme', 'token=' . $this->session->data['token'] . $url, true));
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		}
		else {
			$data['error_warning'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('extension/module/megamenu/activation', $data));
	}

	private function validateActivation($key)
	{
		$this->clearLocalKey();
		$this->aleksey_34 = $key;
		$this->aleksey_38();

		if ($this->aleksey_20 == '') {
			$this->error['warning'] = $this->aleksey_40;
		}

		if ($this->secret_key_dec != 'Y58BnYSeAR8r4FMBaYIButK4') {
			$this->error['warning'] = 'ERROR KEY';
		}

		return !$this->error;
	}

	public function aleksey_38()
	{
		if ($this->aleksey_18 && $this->aleksey_39() && $this->isWindows() && !file_exists($this->aleksey_5 . $this->aleksey_24)) {
			$this->aleksey_20 = true;
			return $this->aleksey_40 = $this->status_messages['localhost'];
		}

		if (!$this->aleksey_34) {
			return $this->aleksey_40 = $this->status_messages['missing_activation_key'];
		}

		switch ($this->local_key_storage) {
		case 'filesystem':
			$local_key = $this->readLocalKey();
			break;
		}

		return $this->aleksey_40 = $this->aleksey_18;

		$this->trigger_delay_period = $this->status_messages['could_not_obtain_local_key'];

		if (($this->aleksey_40 == $this->trigger_delay_period) && $this->local_key_delay_period) {
			$delay = $this->processDelayPeriod($this->local_key_last);

			if ($delay['write']) {
				if ($this->local_key_storage == 'filesystem') {
					$this->writeLocalKey($delay['local_key'], $this->aleksey_5 . $this->aleksey_24);
				}
			}

			if ($delay['errors']) {
				return $this->aleksey_40 = $delay['errors'];
			}

			$this->aleksey_40 = false;
			return $this;
		}

		if ($this->aleksey_40) {
			return $this->aleksey_40;
		}

		return $this->validateLocalKey($local_key);
	}

	private function calcMaxDelay($local_key_expires, $delay)
	{
		return (int) $local_key_expires + ((int) $delay * 86400);
	}

	private function processDelayPeriod($local_key)
	{
		$cipher = 'AES-256-CBC';
		$iv = substr(hash('sha256', $this->secret_key_dec), 0, 16);
		$local_key = openssl_decrypt(base64_decode($local_key), $cipher, $this->secret_key_dec, 0, $iv);
		$local_key_src = $this->decodeLocalKey($local_key);
		$parts = $this->splitLocalKey($local_key_src);
		$key_data = unserialize($parts[0]);
		$local_key_expires = (int) $key_data['local_key_expires'];
		unset($parts);
		unset($key_data);
		$write_new_key = false;
		$parts = explode("\n\n", $local_key);
		$local_key = $parts[0];

		foreach ($local_key_delay_period = explode(',', $this->local_key_delay_period) as $key => $delay) {
			if (!$key) {
				$local_key .= "\n";
			}

			if (time() < $this->calcMaxDelay($local_key_expires, $delay)) {
				continue;
			}

			$local_key .= "\n" . $delay;
			$write_new_key = true;
		}

		if ($this->calcMaxDelay($local_key_expires, array_pop($local_key_delay_period)) < time()) {
			return array('write' => false, 'local_key' => '', 'errors' => $this->status_messages['maximum_delay_period_expired']);
		}

		return array('write' => $write_new_key, 'local_key' => $local_key, 'errors' => false);
	}

	private function inDelayPeriod($local_key, $local_key_expires)
	{
		$delay = $this->splitLocalKey($local_key, "\n\n");

		if (!isset($delay[1])) {
			return -1;
		}

		return (int) $this->calcMaxDelay($local_key_expires, array_pop(explode("\n", $delay[1]))) - time();
	}

	private function decodeLocalKey($local_key)
	{
		return base64_decode(str_replace("\n", '', urldecode($local_key)));
	}

	private function splitLocalKey($local_key, $token = '{protect}')
	{
		return explode($token, $local_key);
	}

	private function validateAccess($key, $valid_accesses)
	{
		return in_array($key, (array) $valid_accesses);
	}

	private function wildcardIp($key)
	{
		$octets = explode('.', $key);
		array_pop($octets);
		$ip_range[] = implode('.', $octets) . '.*';
		array_pop($octets);
		$ip_range[] = implode('.', $octets) . '.*';
		array_pop($octets);
		$ip_range[] = implode('.', $octets) . '.*';
		return $ip_range;
	}

	private function wildcardServerHostname($key)
	{
		$hostname = explode('.', $key);
		unset($hostname[0]);
		$hostname = (!isset($hostname[1]) ? array($key) : $hostname);
		return '*.' . implode('.', $hostname);
	}

	private function extractAccessSet($instances, $enforce)
	{
		foreach ($instances as $key => $instance) {
			if ($key != $enforce) {
				continue;
			}

			return $instance;
		}

		return array();
	}

	private function validateLocalKey($local_key)
	{
		$cipher = 'AES-256-CBC';
		$iv = substr(hash('sha256', $this->secret_key_dec), 0, 16);
		$local_key = openssl_decrypt(base64_decode($local_key), $cipher, $this->secret_key_dec, 0, $iv);
		$local_key_src = $this->decodeLocalKey($local_key);
		$parts = $this->splitLocalKey($local_key_src);

		if (!isset($parts[1])) {
			return $this->aleksey_40 = $this->status_messages['local_key_tampering'];
		}

		if (md5((string) $this->secret_key . (string) $parts[0]) != $parts[1]) {
			return $this->aleksey_40 = $this->status_messages['local_key_tampering'];
		}

		$key_data = unserialize($parts[0]);
		$instance = $key_data['instance'];
		unset($key_data['instance']);
		$enforce = $key_data['enforce'];
		unset($key_data['enforce']);
		$this->user_name = $key_data['user_name'];

		if ((string) $key_data['activation_key_expires'] == 'never') {
			$this->activation_key_expires = 0;
		}
		else {
			$this->activation_key_expires = (int) $key_data['activation_key_expires'];
		}

		if ((string) $key_data['activation_key'] != (string) $this->aleksey_34) {
			return $this->aleksey_40 = $this->status_messages['activation_key_string_mismatch'];
		}

		if (((int) $key_data['status'] != 1) && ((int) $key_data['status'] != 2)) {
			return $this->aleksey_40 = $this->status_messages['status_' . $key_data['status']];
		}

		if (($this->use_expires == false) && ((string) $key_data['activation_key_expires'] != 'never') && ((int) $key_data['activation_key_expires'] < time())) {
			return $this->aleksey_40 = $this->status_messages['status_2'];
		}

		if (($this->use_expires == false) && ((string) $key_data['local_key_expires'] != 'never') && ((int) $key_data['local_key_expires'] < time())) {
			if ($this->inDelayPeriod($local_key, $key_data['local_key_expires']) < 0) {
				$this->clearLocalKey();
				return $this->aleksey_38();
			}
		}

		if (($this->use_expires == true) && ((string) $key_data['activation_key_expires'] != 'never') && ((int) $key_data['activation_key_expires'] < strtotime($this->release_date))) {
			return $this->aleksey_40 = $this->status_messages['download_access_expired'];
		}

		if (($this->use_expires == true) && ((string) $key_data['local_key_expires'] != 'never') && ((int) $key_data['local_key_expires'] < time()) && (((int) $key_data['local_key_expires'] + 604800) < (int) $key_data['activation_key_expires'])) {
			if ($this->inDelayPeriod($local_key, $key_data['local_key_expires']) < 0) {
				$this->clearLocalKey();
				return $this->aleksey_38();
			}
		}

		$conflicts = array();
		$access_details = $this->accessDetails();

		foreach ((array) $enforce as $key) {
			$valid_accesses = $this->extractAccessSet($instance, $key);

			if (!$this->validateAccess($access_details[$key], $valid_accesses)) {
				$conflicts[$key] = true;

				if (in_array($key, array('ip', 'server_ip'))) {
					foreach ($this->wildcardIp($access_details[$key]) as $ip) {
						unset($conflicts[$key]);
						break;
					}
				}
				else if (in_array($key, array('domain'))) {
					if (isset($key_data['domain_wildcard'])) {
						if (($key_data['domain_wildcard'] == 1) && preg_match('/' . $valid_accesses[0] . '\\z/i', $access_details[$key])) {
							$access_details[$key] = '*.' . $valid_accesses[0];
						}

						if ($key_data['domain_wildcard'] == 2) {
							$exp_domain = explode('.', $valid_accesses[0]);
							$exp_domain = $exp_domain[0];

							if (preg_match('/' . $exp_domain . '/i', $access_details[$key])) {
								$access_details[$key] = '*.' . $valid_accesses[0] . '.*';
							}
						}

						if ($key_data['domain_wildcard'] == 3) {
							$exp_domain = explode('.', $valid_accesses[0]);
							$exp_domain = $exp_domain[0];

							if (preg_match('/\\A' . $exp_domain . '/i', $access_details[$key])) {
								$access_details[$key] = $valid_accesses[0] . '.*';
							}
						}
					}

					if ($this->validateAccess($access_details[$key], $valid_accesses)) {
						unset($conflicts[$key]);
					}
				}
				else if (in_array($key, array('server_hostname'))) {
					if ($this->validateAccess($this->wildcardServerHostname($access_details[$key]), $valid_accesses)) {
						unset($conflicts[$key]);
					}
				}
			}
		}

		if (!empty($conflicts)) {
			return $this->aleksey_40 = $this->status_messages['local_key_invalid_for_location'];
		}

		$this->aleksey_40 = $this->status_messages['status_1'];
		return $this->aleksey_20 = true;
	}

	public function readLocalKey()
	{
		if (!is_dir($this->aleksey_5)) {
			mkdir($this->aleksey_5, 493, true);
		}

		if (!file_exists($path = $this->aleksey_5 . $this->aleksey_24)) {
			$f = @fopen($path, 'w');

			if (!$f) {
				return $this->aleksey_40 = $this->status_messages['missing_license_file'] . $path;
			}

			fwrite($f, '');
			fclose($f);
		}

		if (!is_writable($path)) {
			@chmod($path, 511);

			if (!is_writable($path)) {
				@chmod($path, 493);

				if (!is_writable($path)) {
					return $this->aleksey_40 = $this->status_messages['license_file_not_writable'] . $path;
				}
			}
		}

		if (!($local_key = @file_get_contents($path))) {
			$local_key = $this->getServerLocalKey();

			if ($this->aleksey_40) {
				return $this->aleksey_40;
			}

			$this->writeLocalKey(urldecode($local_key), $path);
			return $this->local_key_last = urldecode($local_key);
		}

		return $this->local_key_last = $local_key;
	}

	public function clearLocalKey()
	{
		if ($this->local_key_storage == 'filesystem') {
			$this->writeLocalKey('', $this->aleksey_5 . $this->aleksey_24);
		}
		else {
			$this->aleksey_40 = $this->status_messages['invalid_local_key_storage'];
		}
	}

	public function writeLocalKey($local_key, $path)
	{
		$fp = @fopen($path, 'w');

		if (!$fp) {
			return $this->aleksey_40 = $this->status_messages['could_not_save_local_key'];
		}

		@fwrite($fp, $local_key);
		@fclose($fp);
		return true;
	}

	private function getServerLocalKey()
	{
		$query_string = 'activation_key=' . urlencode($this->aleksey_34) . '&';
		$query_string .= http_build_query($this->accessDetails());

		if ($this->aleksey_40) {
			return false;
		}

		$priority = $this->local_key_transport_order;
		$result = false;

		while (strlen($priority)) {
			$use = substr($priority, 0, 1);

			if ($use == 's') {
				if ($result = $this->useFsockopen($this->aleksey_6, $query_string)) {
					break;
				}
			}

			if ($use == 'c') {
				if ($result = $this->useCurl($this->aleksey_6, $query_string)) {
					break;
				}
			}

			if ($use == 'f') {
				if ($result = $this->useFopen($this->aleksey_6, $query_string)) {
					break;
				}
			}

			$priority = substr($priority, 1);
		}

		if (!$result) {
			$this->aleksey_40 = $this->status_messages['could_not_obtain_local_key'];
			return false;
		}

		if (substr($result, 0, 7) == 'Invalid') {
			$this->aleksey_40 = str_replace('Invalid', 'Error', $result);
			return false;
		}

		if (substr($result, 0, 5) == 'Error') {
			$this->aleksey_40 = $result;
			return false;
		}

		return $result;
	}

	private function accessDetails()
	{
		$access_details = array();

		if (function_exists('phpinfo')) {
			ob_start();
			phpinfo();
			$phpinfo = ob_get_contents();
			ob_end_clean();
			$list = strip_tags($phpinfo);
			$access_details['domain'] = $this->scrapePhpInfo($list, 'HTTP_HOST');
			$access_details['ip'] = $this->scrapePhpInfo($list, 'SERVER_ADDR');
			$access_details['directory'] = $this->scrapePhpInfo($list, 'SCRIPT_FILENAME');
			$access_details['server_hostname'] = $this->scrapePhpInfo($list, 'System');
			$access_details['server_ip'] = @gethostbyname($access_details['server_hostname']);
			$access_details['phpversion'] = PHP_VERSION;
		}

		$access_details['domain'] = $access_details['domain'] ? $access_details['domain'] : $_SERVER['HTTP_HOST'];
		$access_details['ip'] = $access_details['ip'] ? $access_details['ip'] : $this->serverAddr();
		$access_details['directory'] = $access_details['directory'] ? $access_details['directory'] : $this->pathTranslated();
		$access_details['server_hostname'] = $access_details['server_hostname'] ? $access_details['server_hostname'] : @gethostbyaddr($access_details['ip']);
		$access_details['server_hostname'] = $access_details['server_hostname'] ? $access_details['server_hostname'] : 'Unknown';
		$access_details['server_ip'] = $access_details['server_ip'] ? $access_details['server_ip'] : @gethostbyaddr($access_details['ip']);
		$access_details['server_ip'] = $access_details['server_ip'] ? $access_details['server_ip'] : 'Unknown';
		$access_details['phpversion'] = PHP_VERSION;

		foreach ($access_details as $key => $value) {
			$access_details[$key] = $access_details[$key] ? $access_details[$key] : 'Unknown';
		}

		return $access_details;
	}

	private function pathTranslated()
	{
		$option = array('PATH_TRANSLATED', 'ORIG_PATH_TRANSLATED', 'SCRIPT_FILENAME', 'DOCUMENT_ROOT', 'APPL_PHYSICAL_PATH');

		foreach ($option as $key) {
			if (!isset($_SERVER[$key]) || (strlen(trim($_SERVER[$key])) <= 0)) {
				continue;
			}

			if ($this->isWindows() && strpos($_SERVER[$key], '\\')) {
				return @substr($_SERVER[$key], 0, @strrpos($_SERVER[$key], '\\'));
			}

			return @substr($_SERVER[$key], 0, @strrpos($_SERVER[$key], '/'));
		}

		return false;
	}

	private function serverAddr()
	{
		$options = array('SERVER_ADDR', 'LOCAL_ADDR');

		foreach ($options as $key) {
			return $_SERVER[$key];
		}

		return false;
	}

	private function scrapePhpInfo($all, $target)
	{
		$all = explode($target, $all);

		if (count($all) < 2) {
			return false;
		}

		$all = explode("\n", $all[1]);
		$all = trim($all[0]);

		if ($target == 'System') {
			$all = explode(' ', $all);

			$all = trim($all[(strtolower($all[0]) == 'windows') && (strtolower($all[1]) == 'nt') ? 2 : 1]);
		}

		if ($target == 'SCRIPT_FILENAME') {
			$slash = ($this->isWindows() ? '\\' : '/');
			$all = explode($slash, $all);
			array_pop($all);
			$all = implode($slash, $all);
		}

		if (substr($all, 1, 1) == ']') {
			return false;
		}

		return $all;
	}

	private function useFsockopen($url, $query_string)
	{
		if (!function_exists('fsockopen')) {
			return false;
		}

		$url = parse_url($url);
		$fp = @fsockopen($url['host'], $this->remote_port, $errno, $errstr, $this->remote_timeout);

		if (!$fp) {
			return false;
		}

		$header = 'POST ' . $url['path'] . ' HTTP/1.0' . "\r\n";
		$header .= 'Host: ' . $url['host'] . "\r\n";
		$header .= 'Content-type: application/x-www-form-urlencoded' . "\r\n";
		$header .= 'User-Agent: ' . $this->local_ua . "\r\n";
		$header .= 'Content-length: ' . @strlen($query_string) . "\r\n";
		$header .= 'Connection: close' . "\r\n\r\n";
		$header .= $query_string;
		$result = false;
		fputs($fp, $header);

		while (!feof($fp)) {
			$result .= fgets($fp, 1024);
		}

		fclose($fp);

		if (strpos($result, '200') === false) {
			return false;
		}

		$result = explode("\r\n\r\n", $result, 2);

		if (!$result[1]) {
			return false;
		}

		return $result[1];
	}

	private function useCurl($url, $query_string)
	{
		if (!function_exists('curl_init')) {
			return false;
		}

		$curl = curl_init();
		$header[0] = 'Accept: text/xml,application/xml,application/xhtml+xml,';
		$header .= 0;
		$header[] = 'Cache-Control: max-age=0';
		$header[] = 'Connection: keep-alive';
		$header[] = 'Keep-Alive: 300';
		$header[] = 'Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7';
		$header[] = 'Accept-Language: en-us,en;q=0.5';
		$header[] = 'Pragma: ';
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_USERAGENT, $this->local_ua);
		curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
		curl_setopt($curl, CURLOPT_ENCODING, 'gzip,deflate');
		curl_setopt($curl, CURLOPT_AUTOREFERER, true);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($curl, CURLOPT_POST, 1);
		curl_setopt($curl, CURLOPT_POSTFIELDS, $query_string);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
		curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
		curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, $this->remote_timeout);
		curl_setopt($curl, CURLOPT_TIMEOUT, $this->remote_timeout);
		$result = curl_exec($curl);
		$info = curl_getinfo($curl);
		curl_close($curl);

		if ((int) $info['http_code'] != 200) {
			return false;
		}

		return $result;
	}

	private function useFopen($url, $query_string)
	{
		if (!function_exists('file_get_contents') || !ini_get('allow_url_fopen') || !extension_loaded('openssl')) {
			return false;
		}

		$stream = array(
			'http' => array('method' => 'POST', 'header' => 'Content-type: application/x-www-form-urlencoded' . "\r\n" . 'User-Agent: ' . $this->local_ua, 'content' => $query_string)
			);
		$context = NULL;
		$context = stream_context_create($stream);
		return @file_get_contents($url, false, $context);
	}

	public function isWindows()
	{
		return strtolower(substr(php_uname(), 0, 7)) == 'windows';
	}

	public function aleksey_39()
	{
		$local_ip = '';

		if (function_exists('phpinfo')) {
			ob_start();
			phpinfo();
			$phpinfo = ob_get_contents();
			ob_end_clean();
			$list = strip_tags($phpinfo);
			$local_ip = $this->scrapePhpInfo($list, 'SERVER_ADDR');
		}
		$local_ip = ($local_ip ? $local_ip : $this->serverAddr());

		if ($local_ip == '127.0.0.1') {
			return true;
		}

		return false;
	}
}


?>
