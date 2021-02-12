<?php
class Operation {
    private $callable;
    private $arguments;

    public function __construct($c, $a) {
        $this->callable = $c;
        $this->arguments = $a;
    }

    public function run() {
        return call_user_func_array($this->callable, $this->arguments);
    }
}

class ControllerModuleAdminRename extends Controller {
	private $moduleName = 'AdminRename';
	private $moduleNameSmall = 'adminrename';
	private $moduleData_module = 'adminrename_module';
	private $moduleModel = 'model_module_adminrename';
    private $undo_operations = array();
    private $DIR_APPLICATION = DIR_APPLICATION;
    private $error = array();
	private $version = '2.0.1';
	
    public function index() {
		$data['moduleName'] = $this->moduleName;
		$data['moduleNameSmall'] = $this->moduleNameSmall;
		$data['moduleData_module'] = $this->moduleData_module;
		$data['moduleModel'] = $this->moduleModel;
	 
        $this->load->language('module/'.$this->moduleNameSmall);
        $this->load->model('module/'.$this->moduleNameSmall);
        $this->load->model('setting/store');
        $this->load->model('localisation/language');
        $this->load->model('design/layout');
		
        $this->document->addStyle('view/stylesheet/'.$this->moduleNameSmall.'/'.$this->moduleNameSmall.'.css');
        $this->document->setTitle($this->language->get('heading_title'));

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) { 	
            if (!empty($_POST['OaXRyb1BhY2sgLSBDb21'])) {
                $this->request->post[$this->moduleNameSmall]['LicensedOn'] = $_POST['OaXRyb1BhY2sgLSBDb21'];
            }

            if (!empty($_POST['cHRpbWl6YXRpb24ef4fe'])) {
                $this->request->post[$this->moduleNameSmall]['License'] = json_decode(base64_decode($_POST['cHRpbWl6YXRpb24ef4fe']), true);
            }

            $this->{$this->moduleModel}->editSetting($this->moduleNameSmall, $this->request->post, 0);
            $this->session->data['success'] = $this->language->get('text_success');

            $this->postHandler();
        }

		
		if (isset($this->session->data['success'])) {
            if (!isset($this->error['warning'])) {
                $data['success'] = $this->session->data['success'];
            }
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

        $data['breadcrumbs']   = array();
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/'.$this->moduleNameSmall, 'token=' . $this->session->data['token'], 'SSL'),
        );

        $languageVariables = array(
		    // Main
			'heading_title',
			'error_permission',
			'text_success',
			'text_enabled',
			'text_disabled',
			'button_cancel',
			'save_changes',
			'text_rename',
			'text_default',
			'text_module',
			// Control panel
            'entry_code',
			'entry_code_help',
            'text_content_top', 
            'text_content_bottom',
            'text_column_left', 
            'text_column_right',
            'entry_layout',         
            'entry_position',       
            'entry_status',         
            'entry_sort_order',     
            'entry_layout_options',  
            'entry_position_options',
			'entry_action_options',
            'button_add_module',
            'button_remove',
			// Custom CSS
			'custom_css',
            'custom_css_help',
            'custom_css_placeholder',
			// Module depending
			'wrap_widget',
			'wrap_widget_help',
			'text_products',
			'text_products_help',
			'text_image_dimensions',
			'text_image_dimensions_help',
			'text_pixels',
			'text_panel_name',
			'text_panel_name_help',
			'text_products_small',
			'show_add_to_cart',
			'show_add_to_cart_help'
        );
       
        foreach ($languageVariables as $languageVariable) {
            $data[$languageVariable] = $this->language->get($languageVariable);
        }
		
		$data['heading_title'] .= ' '.$this->version;
		
 
        $data['languages']              = $this->model_localisation_language->getLanguages();
        $data['token']                  = $this->session->data['token'];
        $data['action']                 = $this->url->link('module/'.$this->moduleNameSmall, 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel']                 = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['header']					= $this->load->controller('common/header');
		$data['column_left']			= $this->load->controller('common/column_left');
		$data['footer']					= $this->load->controller('common/footer');
        $data['moduleSettings']         = $this->{$this->moduleModel}->getSetting($this->moduleNameSmall, 0);
        $data['moduleData']             = isset($data['moduleSettings'][$this->moduleNameSmall]) ? $data['moduleSettings'][$this->moduleNameSmall] : array ();

        $this->loadModuleData($data);
		
		$this->response->setOutput($this->load->view('module/'.$this->moduleNameSmall.'.tpl', $data));
    }

    public function renameAdminDir($newDir, $undoable = true) {//this needs to be public because it will be used outside by the undo mechanism
        $current_dir_name = basename($this->DIR_APPLICATION);
        $target = preg_replace('~([\\/])' . $current_dir_name . '([\\/])(?!.*?' . $current_dir_name . ')~', '$1' . $newDir . '$2', $this->DIR_APPLICATION);
        if (!is_dir($target)) {
            if (rename($this->DIR_APPLICATION, $target)) {
                $this->DIR_APPLICATION = $target;
                if ($undoable) {
                    $this->addUndoOperation(array($this, 'renameAdminDir'), $current_dir_name, false);
                }
                return true;
            } else {
                $this->error['warning'] = $this->language->get('error_admin_rename');
            }
        } else {
            $this->error['warning'] = $this->language->get('error_target_exists');
        }
        return false;
    }

    public function restoreConfig($config) {//this needs to be public because it will be used outside by the undo mechanism
        $conf_file = $this->DIR_APPLICATION . "config.php";
        if (file_exists($conf_file)) {
            file_put_contents($conf_file, $config);
        }
    }
	
	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'module/'.$this->moduleNameSmall)) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if(!empty($this->request->post['newAdminDir']) && !preg_match('/^[A-Za-z0-9_-]+$/', $this->request->post['newAdminDir'])){
			$this->error['warning'] = $this->language->get('error_validation');
		}
		return !$this->error;
	}

    private function postHandler() {
        $newAdminDir = !empty($this->request->post['newAdminDir']) ? $this->request->post['newAdminDir'] : '';
        if (!empty($newAdminDir)) {
            if (
                $this->updateConfig($newAdminDir) &&//this operation MUST go before renaming the admin dir, so we can have access to the config file, otherwise the value of DIR_APPLICATION will point to a non-existing location
                $this->renameAdminDir($newAdminDir) &&
                $this->managePathReplaces($newAdminDir)
            ) {
                $this->session->data['success'] = sprintf($this->language->get("text_rename_success"), $newAdminDir);
                $this->response->redirect($this->urlRewrite($this->url->link('module/adminrename', 'token=' . $this->session->data['token'], 'SSL')));
            } else {
                $this->undo();
            }
        }
    }

    private function urlRewrite($url) {
        return str_replace('/'.basename(DIR_APPLICATION).'/', '/'.basename($this->DIR_APPLICATION).'/', $url);
    }

    private function updateConfig($newDir) {
        $conf_file = $this->DIR_APPLICATION . "config.php";
        if ($this->backupFile($conf_file)) {
            $config = file_get_contents($conf_file);

            $cd = basename($this->DIR_APPLICATION);
            $new_config = preg_replace('/((?:DIR_|SERVER).*?)([\\/])' . $cd . '([\\/])(?!.*?' . $cd . ')/', '$1$2' . $newDir . '$3', $config);
            if (file_put_contents($conf_file, $new_config) !== false) {
                $this->addUndoOperation(array($this, 'restoreConfig'), $config);
                return true;
            } else {
                $this->error['warning'] = $this->language->get('error_config_update');
                return false;
            }
        } else {
            $this->error['warning'] = $this->language->get('error_config_backup');
        }
        return false;
    }

    private function managePathReplaces($newDir) {
        $replaces = array();
        $replaces_file = dirname($this->DIR_APPLICATION) . DIRECTORY_SEPARATOR . 'vqmod' . DIRECTORY_SEPARATOR . 'pathReplaces.php';
        
        if (file_exists($replaces_file)) {
            if ($this->backupFile($replaces_file)) {
                include $replaces_file;
                if (!empty($replaces)) {
                    foreach ($replaces as $k=>$v) {
                        if (strpos($v[0], '^admin') !== false) {
                            unset($replaces[$k]);
                        }
                    }
                }

                if ($newDir !== 'admin') {
                    $replaces[] = array('~^admin\b~', $newDir);
                }
                $lines = array_map('trim', file($replaces_file));
                $before_replaces = true;
                $between_replaces = false;
                $after_replaces = false;
                $new_entries_added = false;
                $new_lines = array();
                foreach ($lines as $line) {//The code in this block should stay exacly in this order, although being weird
                    if (strpos($line, '// END REPLACES //') !== false) {
                        $between_replaces = false;
                        $after_replaces = true;
                    }

                    if ($before_replaces || $after_replaces) {
                        $new_lines[] = $line;
                    }

                    if (strpos($line, '// START REPLACES //') !== false) {
                        $before_replaces = false;
                        $between_replaces = true;
                        foreach ($replaces as $replace) {
                            $new_lines[] = '$replaces[] = array(\'~^admin\b~\', \''.$newDir.'\');';
                        }
                    }
                }
                $new_content = implode("\n", $new_lines);
                if (file_put_contents($replaces_file, $new_content) !== false) {
                    unlink(dirname($replaces_file) . DIRECTORY_SEPARATOR . 'mods.cache');
                    unlink(dirname($replaces_file) . DIRECTORY_SEPARATOR . 'checked.cache');
                    return true;
                } else {
                    $this->error['warning'] = $this->language->get('error_pathreplaces_update');
                }
            } else {
                $this->error['warning'] = $this->language->get('error_pathreplaces_backup');
            }
        } else {
            return true;
        }
        return true;
    }

    private function backupFile($file) {
        if (file_exists($file)) {
            $backup_file = $file.".bak_adminrename";
            if (file_exists($backup_file)) return true;
            else if (copy($file, $backup_file) && md5_file($file) == md5_file($backup_file)) return true;
        }

        return false;
    }

    private function addUndoOperation() {
        if (func_num_args()) {
            $args = func_get_args();
            $callable = array_shift($args);
            if (is_callable($callable)) {
                $this->undo_operations[] = new Operation($callable, $args);
            }
        }
    }

    public function undo() {
        while(NULL !== ($operation = array_pop($this->undo_operations))) {
            $operation->run();
        }
    }

    private function loadModuleData(&$data) {
        $data['adminDir'] = basename(DIR_APPLICATION);
    }
}
