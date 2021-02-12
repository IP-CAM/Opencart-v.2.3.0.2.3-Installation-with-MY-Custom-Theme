<?php
class ControllerExtensionModuleadminsecurityrecaptcha extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/adminsecurityrecaptcha');

		$this->document->setTitle($this->language->get('text_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('adminsecurityrecaptcha', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		
		$data['text_success'] = $this->language->get('text_success');
		$data['text_extension'] = $this->language->get('text_extension');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_info_captcha'] = $this->language->get('text_info_captcha');
		
		$data['entry_status'] = $this->language->get('entry_status');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
				
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_title'),
			'href' => $this->url->link('extension/module/adminsecurityrecaptcha', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/adminsecurityrecaptcha', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		if (isset($this->request->post['adminsecurityrecaptcha_status'])) {
			$data['adminsecurityrecaptcha_status'] = $this->request->post['adminsecurityrecaptcha_status'];
		} else {
			$data['adminsecurityrecaptcha_status'] = $this->config->get('adminsecurityrecaptcha_status');
		}		

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/adminsecurityrecaptcha', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/adminsecurityrecaptcha')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}