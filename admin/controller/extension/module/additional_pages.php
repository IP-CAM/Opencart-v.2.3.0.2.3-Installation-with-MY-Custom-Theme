<?php

require_once(DIR_SYSTEM . 'library/additional_pages/page_name.class.php');

class ControllerExtensionModuleAdditionalPages extends Controller
{
    protected $errors = array();
    protected $module_name;

    public function __construct($registry)
    {
        parent::__construct($registry);

        require_once(DIR_SYSTEM . 'library/additional_pages/page_name.class.php');

        $this->module_name = 'extension/module/additional_pages';

    }

    public function index()
    {
        $data = array();
        $this->load->model('setting/setting');

        $this->loadLang($data);

        $this->document->setTitle($this->language->get('heading_title'));

        $input = $this->request->post;

        if ($this->isPostRequest() && $this->validate($input)) {
            $input['additional_pages_settings'] = $input['settings'];
            $this->model_setting_setting->editSetting('additional_pages', $input);

            $this->session->data['success'] = $this->language->get('success_msg');
            $this->response->redirect($this->url->link($this->module_name, 'token=' . $this->session->data['token'], true));
        }

        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('modules'),
            'href' => $this->getModulesLink()
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link($this->module_name, 'token=' . $this->session->data['token'], true)
        );

        $this->load->model('localisation/language');
        $data['languages'] = $this->model_localisation_language->getLanguages();
        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_description'] = $this->language->get('entry_description');
        $data['entry_meta_title'] = $this->language->get('entry_meta_title');
        $data['entry_meta_description'] = $this->language->get('entry_meta_description');
        $data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
        $data['entry_link'] = $this->language->get('entry_link');

        //CKEditor
        if ($this->config->get('config_editor_default')) {
            $this->document->addScript('view/javascript/ckeditor/ckeditor.js');
            $this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
        }
        $data['ckeditor'] = $this->config->get('config_editor_default');

        # Show Success message
        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        # Show Errors messages
        if (isset($this->session->data['errors'])) {
            $data['errors'] = $this->session->data['errors'];
            unset($this->session->data['errors']);
        } else {
            $data['errors'] = '';
        }

        $data['current_settings'] = $this->config->get('additional_pages_settings');
        $data['module_settings'] = array(
            AdditionalPageName::ALL_PRODUCTS => array('no_limit'),
            AdditionalPageName::BESTSELLERS => array('limit_by'),
            AdditionalPageName::POPULAR => array('limit_by'),
            AdditionalPageName::LATEST => array('limit_by')
        );

        $data['heading_title'] = $this->language->get('heading_title');

        $data['action'] = $this->url->link($this->module_name, 'token=' . $this->session->data['token'], true);
        $data['cancel'] = $this->getModulesLink();
        $data['link_to_support'] = 'http://opencart2x.ru/';

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        
        $this->response->setOutput($this->load->view('extension/module/additional_pages', $data));
       
    }

    public function getModulesLink()
    {
        return $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
    }

    private function isPostRequest()
    {
        return $this->request->server['REQUEST_METHOD'] == 'POST';
    }

    private function validate(&$input)
    {
        if (!$this->user->hasPermission('modify', $this->module_name)) {
            $this->session->data['errors'][] = $this->language->get('error_permission');
            return false;
        }
        return true;
    }

    private function loadLang(&$data)
    {
        $this->load->language('catalog/product');
        $this->load->language('extension/module/additional_pages');
        $data['l'] = $this->language;
    }
}