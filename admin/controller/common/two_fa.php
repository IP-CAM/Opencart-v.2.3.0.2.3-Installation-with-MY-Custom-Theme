<?php
class ControllerCommonTwoFA extends Controller {
	protected $error = array();
	
	public function index() {
		$this->load->language('common/two_fa');
		
		if (isset($this->session->data['two_fa'])) {
			$this->response->redirect($this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true));
		}

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->neglect();
		} elseif ($this->request->server['REQUEST_METHOD'] != 'POST') {
			$this->sendCode();
		}
		
		$this->document->setTitle($this->language->get('text_title'));

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['entry_code'] = $this->language->get('entry_code');
		
		$data['button_authenticate'] = $this->language->get('button_authenticate');
		$data['button_resend'] = $this->language->get('button_resend');
		
		$data['resend'] = $this->url->link('common/two_fa/resend', 'token=' . $this->session->data['token'], true);

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			
			unset($this->session->data['success']);
		} else {
			$data['success'] = false;
		}

		$data['action'] = $this->url->link('common/two_fa', 'token=' . $this->session->data['token'], true);

		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('common/two_fa', $data));
	}
	
	public function resend() {
		$this->load->language('common/two_fa');
		
		$this->session->data['success'] = sprintf($this->language->get('text_resent'), $this->config->get('adminsecurity_email'));

		$this->response->redirect($this->url->link('common/two_fa', 'token=' . $this->session->data['token'], true));
	}
	
	protected function sendCode() {
		$this->load->model('user/user');
		$this->load->model('setting/setting');
		$status = $this->config->get('adminsecuritytwofactor_status');
		if ($status == 1) {
		    $this->session->data['two_fa_time'] = time();
			$this->session->data['two_fa_code'] = mt_rand(100000, 999999);
			if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
				$domain = HTTPS_CATALOG;
		    } else {
				$domain = HTTP_CATALOG;
			}
			$user_info = $this->model_user_user->getUser($this->user->getId());
			if ($user_info) {
				$user = $user_info['username'];
			} else {
				$user = '';
			}
			$email = $this->config->get('adminsecuritytwofactor_email');
			$emailsucces = $this->config->get('adminsecuritytwofactor_email_succes');
			$telegram = $this->config->get('adminsecuritytwofactor_telegram');
			$telegram_token = $this->config->get('adminsecuritytwofactor_telegram_key');
			$telegram_chatId = $this->config->get('adminsecuritytwofactor_chat_id');
			$gettelegram = $this->get_telegram();
			$viber = $this->config->get('adminsecuritytwofactor_viber');
			$viber_token = $this->config->get('adminsecuritytwofactor_viber_key');
			$viber_chatId = $this->config->get('adminsecuritytwofactor_chat_id_viber');		
			$ip = $_SERVER['REMOTE_ADDR'];
			$result = @json_decode(file_get_contents("http://www.geoplugin.net/json.gp?ip=".$ip)); 
			$geolocation = $result->geoplugin_countryName . ", " . $result->geoplugin_regionName . ", " . $result->geoplugin_region . ", " . $result->geoplugin_city; 		
			$email_message = sprintf($this->language->get('text_message'), $user, html_entity_decode($domain, ENT_QUOTES, 'UTF-8'), $this->session->data['two_fa_code']);			
			$email_message .= "<hr>";				 
			$email_message .= '<i style="font-size:10px;">' . $this->language->get('text_technical') .'<br>'. $this->language->get('text_website') . $domain."<br>";
			$email_message .= $this->language->get('text_username') . $user . "<br>";
			$email_message .= $this->language->get('text_date') . '<span style="color:#D54E21">'.date("d-m-Y H:i:s").'</span>'."<br>";
			$email_message .= $this->language->get('text_location') . '<span style="color:#D54E21">'.$geolocation.'</span>'."<br>";
			$email_message .= $this->language->get('text_ipaddress') . $_SERVER['REMOTE_ADDR']."<br>";
			$email_message .= $this->language->get('text_browser') . $_SERVER['HTTP_USER_AGENT'] . "</i>";
			$email_message .= "<br><br><div style='font-size:11px;'>" . $this->language->get('text_label') . "</div>";
			$subject = sprintf($this->language->get('text_subject'), $this->config->get('config_name')) . ' (AdminSecurity: GixOC.ru)';
			$message  = '<html dir="ltr" lang="en">' . "\n";
			$message .= '  <head>' . "\n";
			$message .= '    <title>' . $subject . '</title>' . "\n";
			$message .= '    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
			$message .= '  </head>' . "\n";
			$message .= '  <body>' . html_entity_decode($email_message, ENT_QUOTES, 'UTF-8') . '</body>' . "\n";
			$message .= '</html>' . "\n";
			$headers = "From: " . $this->config->get('config_name') . " <" . $this->config->get('config_email') . ">\r\n";
			$headers .= "Content-type: text/html\r\n";
			$telegram_message = sprintf($this->language->get('text_telegram'), $user, html_entity_decode($domain, ENT_QUOTES, 'UTF-8'), $this->session->data['two_fa_code']);
			$telegram_message .= "%0A" . '<i>' . $this->language->get('text_technicaltel') . "%0A"; 
			$telegram_message .= $this->language->get('text_location') . $geolocation . "%0A";
			$telegram_message .= $this->language->get('text_ipaddress') . $_SERVER['REMOTE_ADDR'] . "%0A";
			$telegram_message .= $this->language->get('text_browser') . $_SERVER['HTTP_USER_AGENT'] . '</i>';	
			$viber_message = sprintf($this->language->get('text_viber'), $user,  $this->session->data['two_fa_code'], html_entity_decode($domain, ENT_QUOTES, 'UTF-8'), date("d-m-Y H:i:s"), $ip);			
			if ($emailsucces && $email !=''){
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
				
				$mail->setTo($email);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
				$mail->setSubject($subject);
				$mail->setHtml($message);
				$mail->send();
			}
			if ($telegram_token != '' && $telegram_chatId != '' && $telegram && $gettelegram){
				$fp = fopen("https://api.telegram.org/bot{$telegram_token}/sendMessage?chat_id={$telegram_chatId}&parse_mode=html&text={$telegram_message }","r");
			}
			if ($viber_token != '' && $viber_chatId != '' && $viber){
				$fp = $this->send_message($viber_token, $viber_chatId, $viber_message );
			}
		} else {
			$this->neglect();
		}
	}

	public function get_telegram(){		
		$curl = curl_init('https://telegram.org');
						
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
	
	public function send_message($viber_token, $viber_id, $viber_message) {

		$curl = curl_init('https://chatapi.viber.com/pa/send_message');

	    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
		curl_setopt($curl, CURLOPT_ENCODING, "");
		curl_setopt($curl, CURLOPT_MAXREDIRS, 10);
		curl_setopt($curl, CURLOPT_TIMEOUT, 10);
		curl_setopt($curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
		curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
		curl_setopt($curl, CURLOPT_POSTFIELDS, JSON_encode(array('receiver' => $viber_id,  'min_api_version' => '1', 'sender' =>  ['name' => 'gixoc.ru',  'avatar' => 'https://www.viber.com/app/uploads/viber-logo.png'], 'tracking_data' => 'tracking data', 'type' => 'text', 'text' => $viber_message)));
		curl_setopt($curl, CURLOPT_HTTPHEADER, array("Cache-Control: no-cache", "Content-Type: application/JSON", "X-Viber-Auth-Token: " . $viber_token));	
		$response = curl_exec($curl);	
		curl_close($curl);
	}
	
	public function neglect() {	
		$this->session->data['two_fa'] = true;
		unset($this->session->data['two_fa_time']);
		unset($this->session->data['two_fa_code']);
		$this->response->redirect($this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true));
	}
	
	protected function validate() {
		if (!isset($this->request->post['code']) || $this->request->post['code'] != $this->session->data['two_fa_code'] || ($this->session->data['two_fa_time'] + 300) < time()) {
			$this->error['warning'] = $this->language->get('error_code');
		}
		return !$this->error;
	}
}