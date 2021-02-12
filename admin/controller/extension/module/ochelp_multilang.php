<?php
class ControllerExtensionModuleOchelpMultilang extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/ochelp_multilang');

		$this->document->setTitle($this->language->get('heading_main_title'));

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');

		$data['entry_hreflang'] = $this->language->get('entry_hreflang');
		$data['entry_language'] = $this->language->get('entry_language');
		$data['help_hreflang'] = $this->language->get('help_hreflang');

		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_support'] = $this->language->get('tab_support');
		$data['help_support'] = $this->language->get('help_support');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('ochelp_multilang', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		if (isset($this->error['code'])) {
			$data['error_code'] = $this->error['code'];
		} else {
			$data['error_code'] = '';
		}

		if (isset($this->error['language'])) {
			$data['error_language'] = $this->error['language'];
		} else {
			$data['error_language'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], true),
			'separator' => false,
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true),
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/ochelp_multilang', 'token=' . $this->session->data['token'], true),
		);

		$this->load->model('extension/module/ochelp_multilang');

		$data['languages'] = $this->model_extension_module_ochelp_multilang->getLanguages();

		if (isset($this->request->post['ochelp_multilang_code'])) {
			$data['ochelp_multilang_code'] = $this->request->post['ochelp_multilang_code'];
		} elseif ($this->config->get('ochelp_multilang_code')) {
			$data['ochelp_multilang_code'] = $this->config->get('ochelp_multilang_code');
		} else {
			$data['ochelp_multilang_code'] = array();
		}

		if (isset($this->request->post['ochelp_multilang_language'])) {
			$data['ochelp_multilang_language'] = $this->request->post['ochelp_multilang_language'];
		} elseif ($this->config->get('ochelp_multilang_language')) {
			$data['ochelp_multilang_language'] = $this->config->get('ochelp_multilang_language');
		} else {
			$data['ochelp_multilang_language'] = '';
		}

		$data['action'] = $this->url->link('extension/module/ochelp_multilang', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], true);

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/ochelp_multilang', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/ochelp_multilang')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['ochelp_multilang_code'] as $key => $code) {
			if ((utf8_strlen($code) < 2) || (utf8_strlen($code) > 32)) {
				$this->error['code'][$key] = $this->language->get('error_code');
			}
		}

		if (!$this->request->post['ochelp_multilang_language']) {
			$this->error['language'] = $this->language->get('error_language');
		}

		return !$this->error;
	}
}
?>