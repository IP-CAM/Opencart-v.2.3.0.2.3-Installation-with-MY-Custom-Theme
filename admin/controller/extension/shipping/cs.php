<?php
class ControllerExtensionShippingCs extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/shipping/cs');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('cs', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_none'] = $this->language->get('text_none');

		$data['entry_shipping_title'] = $this->language->get('entry_shipping_title');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_cost'] = $this->language->get('entry_cost');
		$data['entry_allcost'] = $this->language->get('entry_allcost');
		$data['entry_newcost'] = $this->language->get('entry_newcost');
		$data['entry_tax_class'] = $this->language->get('entry_tax_class');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_remove'] = $this->language->get('button_remove');
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
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/shipping/cs', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/shipping/cs', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true);

		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['cs'])) {
			$data['multiple_shippings']['cs'] = $this->request->post['cs'];
		} else {
			$data['multiple_shippings'] = $this->model_setting_setting->getSetting('cs');
		}

		$this->load->model('localisation/tax_class');

		$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();


		//Error
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}
		
		if (isset($this->error['shipping_option'])) {
			$data['error_shipping_option'] = $this->error['shipping_option'];
		} else {
			$data['error_shipping_option'] = array();
		}
		
		if (isset($this->request->post['cs_group_shipping'])) {
			$data['cs_group_shipping'] = $this->request->post['cs_group_shipping'];
		} else {
			$data['cs_group_shipping'] = $this->config->get('cs_group_shipping');
		}

		if (isset($this->request->post['cs_status'])) {
			$data['cs_status'] = $this->request->post['cs_status'];
		} else {
			$data['cs_status'] = $this->config->get('cs_status');
		}

		if (isset($this->request->post['cs_sort_order'])) {
			$data['cs_sort_order'] = $this->request->post['cs_sort_order'];
		} else {
			$data['cs_sort_order'] = $this->config->get('cs_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/shipping/cs', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/shipping/cs')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		foreach ($this->request->post['cs_group_shipping'] as $language_id => $value) {
			if ((utf8_strlen($value['shipping_name']) < 1) || (utf8_strlen($value['shipping_name']) > 64)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}
		}
		
		if (isset($this->request->post['cs'])) {
			foreach ($this->request->post['cs'] as $shipping_id => $shipping) { 
				foreach ($shipping['shipping_description'] as $language_id => $shipping_description) {
					if ((utf8_strlen($shipping_description['name']) < 1) || (utf8_strlen($shipping_description['name']) > 64)) {
						$this->error['shipping_option'][$shipping_id][$language_id] = $this->language->get('error_shipping_option');
					}
				}
			}
		}
		return !$this->error;
	}
}