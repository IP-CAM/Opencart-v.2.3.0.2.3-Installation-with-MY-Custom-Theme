<?php
class ControllerExtensionModuleadminsecuritytwofactor extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/adminsecuritytwofactor');

		$this->document->setTitle($this->language->get('text_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('adminsecuritytwofactor', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
	
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_fail'] = $this->language->get('entry_fail');
		$data['entry_failholder'] = $this->language->get('entry_failholder');
		$data['entry_success'] = $this->language->get('entry_success');
		$data['entry_successholder'] = $this->language->get('entry_successholder');
		$data['entry_auto'] = $this->language->get('entry_auto');
		$data['entry_wait'] = $this->language->get('entry_wait');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_email_succes'] = $this->language->get('entry_email_succes');
		$data['entry_telegram'] = $this->language->get('entry_telegram');
		$data['entry_telegram_key'] = $this->language->get('entry_telegram_key');
		$data['entry_chat_id'] = $this->language->get('entry_chat_id');
		$data['entry_chat_id_place'] = $this->language->get('entry_chat_id_place');
		$data['entry_get_token'] = $this->language->get('entry_get_token');
		$data['error_telegram'] = $this->language->get('error_telegram');
		$data['entry_viber'] = $this->language->get('entry_viber');	
		$data['entry_viber_key'] = $this->language->get('entry_viber_key');
		$data['entry_chat_id_viber'] = $this->language->get('entry_chat_id_viber');
		$data['entry_chat_id_place_viber'] = $this->language->get('entry_chat_id_place_viber');
		$data['entry_get_token_viber'] = $this->language->get('entry_get_token_viber');	
		$data['entry_viber_reg'] = $this->language->get('entry_viber_reg');	
		$data['entry_viber_gixoc'] = $this->language->get('entry_viber_gixoc');
		$data['error_viber'] = $this->language->get('error_viber');
		
		$data['gixoc_viber'] = 'https://gixoc.ru/viber.php';
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_approve'] = $this->language->get('button_approve');
								
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['adminsecuritytwofactor_email'])) {
			$data['error_adminsecuritytwofactor_email'] = $this->error['adminsecuritytwofactor_email'];
		} else {
			$data['error_adminsecuritytwofactor_email'] = '';
		}

		if (isset($this->error['adminsecuritytwofactor_telegram'])) {
			$data['error_adminsecuritytwofactor_telegram'] = $this->error['adminsecuritytwofactor_telegram'];
		} else {
			$data['error_adminsecuritytwofactor_telegram'] = '';
		}		

		if (isset($this->error['adminsecuritytwofactor_telegram_key'])) {
			$data['error_adminsecuritytwofactor_telegram_key'] = $this->error['adminsecuritytwofactor_telegram_key'];
		} else {
			$data['error_adminsecuritytwofactor_telegram_key'] = '';
		}
		
		if (isset($this->error['adminsecuritytwofactor_chat_id'])) {
			$data['error_adminsecuritytwofactor_chat_id'] = $this->error['adminsecuritytwofactor_chat_id'];
		} else {
			$data['error_adminsecuritytwofactor_chat_id'] = '';
		}

		if (isset($this->error['adminsecuritytwofactor_viber'])) {
			$data['error_adminsecuritytwofactor_viber'] = $this->error['adminsecuritytwofactor_viber'];
		} else {
			$data['error_adminsecuritytwofactor_viber'] = '';
		}		

		if (isset($this->error['adminsecuritytwofactor_viber_key'])) {
			$data['error_adminsecuritytwofactor_viber_key'] = $this->error['adminsecuritytwofactor_viber_key'];
		} else {
			$data['error_adminsecuritytwofactor_viber_key'] = '';
		}
		
		if (isset($this->error['adminsecuritytwofactor_chat_id_viber'])) {
			$data['error_adminsecuritytwofactor_chat_id_viber'] = $this->error['adminsecuritytwofactor_chat_id_viber'];
		} else {
			$data['error_adminsecuritytwofactor_chat_id_viber'] = '';
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_title'),
			'href' => $this->url->link('extension/module/adminsecuritytwofactor', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/adminsecuritytwofactor', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['adminsecuritytwofactor_status'])) {
			$data['adminsecuritytwofactor_status'] = $this->request->post['adminsecuritytwofactor_status'];
		} else {
			$data['adminsecuritytwofactor_status'] = $this->config->get('adminsecuritytwofactor_status');
		}		

		if (isset($this->request->post['adminsecuritytwofactor_email'])) {
			$data['adminsecuritytwofactor_email'] = $this->request->post['adminsecuritytwofactor_email'];
		}  else {
			$data['adminsecuritytwofactor_email'] = $this->config->get('adminsecuritytwofactor_email');
		}
		
		if (isset($this->request->post['adminsecuritytwofactor_email_succes'])) {
			$data['adminsecuritytwofactor_email_succes'] = $this->request->post['adminsecuritytwofactor_email_succes'];
		}  else {
			$data['adminsecuritytwofactor_email_succes'] = $this->config->get('adminsecuritytwofactor_email_succes');
		}
		
		if (isset($this->request->post['adminsecuritytwofactor_telegram'])) {
			$data['adminsecuritytwofactor_telegram'] = $this->request->post['adminsecuritytwofactor_telegram'];
		}  else {
			$data['adminsecuritytwofactor_telegram'] = $this->config->get('adminsecuritytwofactor_telegram');
		}
		
		if (isset($this->request->post['adminsecuritytwofactor_telegram_key'])) {
			$data['adminsecuritytwofactor_telegram_key'] = $this->request->post['adminsecuritytwofactor_telegram_key'];
		}  else {
			$data['adminsecuritytwofactor_telegram_key'] = $this->config->get('adminsecuritytwofactor_telegram_key');
		}
		
		if (isset($this->request->post['adminsecuritytwofactor_chat_id'])) {
			$data['adminsecuritytwofactor_chat_id'] = $this->request->post['adminsecuritytwofactor_chat_id'];
		} elseif ($this->config->get('adminsecuritytwofactor_chat_id') != '') {
			$data['adminsecuritytwofactor_chat_id'] = $this->config->get('adminsecuritytwofactor_chat_id');
		} else {
			$data['adminsecuritytwofactor_chat_id'] = '';
		}

		if (isset($this->request->post['adminsecuritytwofactor_viber'])) {
			$data['adminsecuritytwofactor_viber'] = $this->request->post['adminsecuritytwofactor_viber'];
		}  else {
			$data['adminsecuritytwofactor_viber'] = $this->config->get('adminsecuritytwofactor_viber');
		}
		
		if (isset($this->request->post['adminsecuritytwofactor_viber_key'])) {
			$data['adminsecuritytwofactor_viber_key'] = $this->request->post['adminsecuritytwofactor_viber_key'];
		}  else {
			$data['adminsecuritytwofactor_viber_key'] = $this->config->get('adminsecuritytwofactor_viber_key');
		}
		
		if ($this->config->get('adminsecuritytwofactor_chat_id_viber') != '') {
			$data['adminsecuritytwofactor_chat_id_viber'] = $this->config->get('adminsecuritytwofactor_chat_id_viber');
		} elseif ($this->config->get('adminsecuritytwofactor_chat_id_viber') != '') {
			$data['adminsecuritytwofactor_chat_id_viber'] = $this->config->get('adminsecuritytwofactor_chat_id_viber');
		} else {
			$data['adminsecuritytwofactor_chat_id_viber'] = '';
		}	
		
		if (($data['adminsecuritytwofactor_viber_key'] != '') && ($this->get_webhook_info($data['adminsecuritytwofactor_viber_key']) != '')) {
			$data['viber_webhook'] = true;
		} else {
			$data['viber_webhook'] = false;
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$data['domain'] = HTTPS_CATALOG . 'index.php';
			$data['ssl'] = true;
		} else {
			$data['domain'] = '';
			$data['ssl'] = false;
		}
	
		$data['token'] = $this->session->data['token'];
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$data['get_telegram'] = $this->check_url('https://telegram.org');
		
		$data['get_gixoc'] = $this->check_url($data['gixoc_viber']);

		$this->response->setOutput($this->load->view('extension/module/adminsecuritytwofactor', $data));
	}

	public function check_url($url){		
		$curl = curl_init($url);

		curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 10);
		curl_setopt($curl, CURLOPT_HEADER, true);
		curl_setopt($curl, CURLOPT_NOBODY, true);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);

		$response = curl_exec($curl);
		
		curl_close($curl);
		
		if ($response) return true;
		return false;
	}
	
	public function get_account_telegram(){
		$this->load->language('extension/module/adminsecuritytwofactor');
		$json = array();		
		if (isset($this->request->get['telegram_token']) /*&& $this->get_telegram()*/) {
			$telegram_token = $this->request->get['telegram_token'];
			$obj = @json_decode(@file_get_contents("https://api.telegram.org/bot{$telegram_token}/getUpdates"));//->result[0]->message->chat->id;
			
			if ((isset($obj)) && ($obj->ok)) {
				if (isset($obj->result[0]->message->chat->id)) {
					$json['status'] = 'ok';
					$json['value'] = $obj->result[0]->message->chat->id;
				} else {
					$json['status'] = 'no';
					$json['value'] = $this->language->get('entry_chat_id_place');
				};
			} else {
				$json['status'] = 'no';
				$json['value'] = $this->language->get('error_telegram1');
			}
		} else {
			$json['status'] = 'no';
			$json['value'] = $this->language->get('error_telegram1');
		}	
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}	
	
	public function get_account_viber(){
		$this->load->language('extension/module/adminsecuritytwofactor');
		$json = array();
		if (isset($this->request->get['viber_token'])) {
			$viber_token = $this->request->get['viber_token'];
		
			$curl = curl_init('https://chatapi.viber.com/pa/get_account_info');
						
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
			curl_setopt($curl, CURLOPT_TIMEOUT, 10);
			curl_setopt($curl, CURLOPT_HTTPHEADER, array("Cache-Control: no-cache", "Content-Type: application/JSON", "X-Viber-Auth-Token: " . $viber_token));
				
			$response = curl_exec($curl);
		
			curl_close($curl);
		
			$obj = @json_decode($response, true);
			
			if ((isset($obj)) && ($obj['status'] == '0')){
				$json['status'] = '0';
				$json['value'] = $obj['members'][0]['id'];
			} else {
				$json['status'] = $obj['status'];
				$json['value'] = $this->viber_errors($obj['status']);
			};
			
		} else {
			$json['status'] = $obj['status'];
			$json['value'] = $this->viber_errors($obj['status']);
		}			
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function get_webhook_info($viber_token){
		
		$curl = curl_init('https://chatapi.viber.com/pa/get_account_info');

		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
		curl_setopt($curl, CURLOPT_TIMEOUT, 10);
		curl_setopt($curl, CURLOPT_HTTPHEADER, array("Cache-Control: no-cache", "Content-Type: application/JSON", "X-Viber-Auth-Token: " . $viber_token));

		$response = curl_exec($curl);
		
		curl_close($curl);
		
		$obj = @json_decode($response, true);

		if (isset($obj['webhook'])) {
			return $obj['webhook'];
		} else {
			return '';
		}	
	}	
	
	public function get_set_webhook(){
		$json = array();
		
		if (isset($this->request->get['viber_token']) && isset($this->request->get['domain'])) {
			$viber_token = $this->request->get['viber_token'];
		
			$domain = $this->request->get['domain'];
			
			$curl = curl_init('https://chatapi.viber.com/pa/set_webhook');
						
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
			curl_setopt($curl, CURLOPT_TIMEOUT, 10);
			curl_setopt($curl, CURLOPT_POSTFIELDS, "{ \r\n \"url\": \"" . $domain . "\",\r\n \"event_types\":[\r\n \"conversation_started\"\r\n ]\r\n}");

			curl_setopt($curl, CURLOPT_HTTPHEADER, array("Cache-Control: no-cache", "Content-Type: application/JSON", "X-Viber-Auth-Token: " . $viber_token));
				
			$response = curl_exec($curl);
		
			curl_close($curl);
		
			$obj = @json_decode($response, true);
	
			if (isset($obj['status'])){
				$json['status'] = $obj['status'];
				$json['value'] = $this->viber_errors($obj['status']);
			} else {
				$json['status'] = '98';
				$json['value'] = $this->viber_errors('98');
			};
		} else {
			$json['status'] = '99';
			$json['value'] = $this->viber_errors('99');
		}	
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}		

	public function viber_errors($status){
		$this->load->language('extension/module/adminsecuritytwofactor');
		
		for ($i = 1; $i <= 20; $i++) {
			if ($i == $status) {
				return $this->language->get('error_viber' . $i);
			}
		}		
		return $this->language->get('error_viber20');
	}	

	public function install(){
		$this->load->model('setting/setting');
		$setting = array(
			'adminsecuritytwofactor_status' => '0',
			'adminsecuritytwofactor_email_succes' => '0',
			'adminsecuritytwofactor_email' => '',
			'adminsecuritytwofactor_telegram' => '0',
			'adminsecuritytwofactor_telegram_key' => '',
			'adminsecuritytwofactor_chat_id' => '',
			'adminsecuritytwofactor_viber' => '0',
			'adminsecuritytwofactor_viber_key' => '',
			'adminsecuritytwofactor_chat_id_viber' => ''
		);
		$this->model_setting_setting->editSetting('adminsecuritytwofactor', $setting, 0);
	}

	public function uninstall(){
		$this->load->model('setting/setting');
		$this->model_setting_setting->deleteSetting('adminsecuritytwofactor');
	}	

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/adminsecuritytwofactor')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}