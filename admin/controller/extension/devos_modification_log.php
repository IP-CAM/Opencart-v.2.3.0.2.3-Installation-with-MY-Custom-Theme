<?php
/*ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);*/
class ControllerExtensionDevosModificationLog extends Controller {
	private $application = 'dml';
	private $version = '1.1';
	public $success_text = '';
	private $error = array();
	var $data = array();
	public function __construct($registry){
		parent::__construct($registry);
		$this->loadModel('extension/devos_modification_log');
		$this->data = $this->loadLanguage('extension/devos_modification_log');

	}
	
	public function index() {
		
		if (isset($this->request->get['id'])) {
			$this->data['dml_row'] = $this->model_extension_devos_modification_log->getLog($this->request->get['id']);
		}else
			$this->data['dml_row'] = $this->model_extension_devos_modification_log->getLastLog();
		$this->data['dml_version'] = $this->model_extension_devos_modification_log->getVersion();
		$this->data['dml_url_update']='http://dev-os.ru/support/lastversion.html';
		$this->data['token'] = $this->session->data['token'];
		$this->response->setOutput($this->load_view('extension/devos_modification_log'));
		
	}
	public function getListLogs(){
		$this->data['dml_list_logs'] = $this->model_extension_devos_modification_log->getListLogs();
		$this->data['token'] = $this->session->data['token'];
		$this->response->setOutput($this->load_view('extension/devos_modification_list_logs'));
	}
	public function clearLogs(){
		$this->model_extension_devos_modification_log->clearLogs();
		$this->index();
	}
	public function download(){
		if (isset($this->request->get['modification_id'])) {
			$modificator = $this->model_extension_devos_modification_log->getTextModification($this->request->get['modification_id']);
			header('Content-type: application/xml');
    		header('Content-Disposition: attachment; filename="'.$modificator['name'].'.xml"');
    		header('Content-Length: ' . strlen($modificator['xml']));
    		echo $modificator['xml'] ;
		}
	}
	//получение данных для редактирования модификатора
	public function editModFile(){
		
		if (isset($this->request->get['modification_id'])) {
			$this->data['modificator'] = $this->model_extension_devos_modification_log->getTextModification($this->request->get['modification_id']);
			$this->response->setOutput($this->load_view('extension/devos_modification_edit'));
		}
		
	}
	//сохранение модификатора
	public function saveModFile(){
		$json=array();
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->model_extension_devos_modification_log->updateModification($_POST);
			$json['result'] = 1;
		}else{
			$json['result'] = 0;
		}
		$this->response->setOutput(json_encode($json));		
	}
	private function loadModel($model){		
		$this->load->model($model);
	}
	private function loadLanguage($language_file){
		if (version_compare(VERSION, '2.2.0', '<=')) 
			return $this->language->load($language_file);
		else
			return $this->load->language($language_file);
		
	}
	private function getUrl($url, $params){
		if (version_compare(VERSION, '2.2.0', '<=')) 
			return $this->url->link($url, $params , 'SSL');
		else
			return $this->url->link($url, $params , true);
	}
	private function load_view($template){
		if (version_compare(VERSION, '2.2.0', '<=')) 
			return $this->load->view($template.'.tpl', $this->data);
		else
			return $this->load->view($template, $this->data);		
	}
}
	