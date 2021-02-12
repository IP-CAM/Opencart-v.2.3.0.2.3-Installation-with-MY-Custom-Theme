<?php
class ControllerExtensionModuleBHMbcb extends Controller {
	private $error = array();
	private $main_version = "1";
	private $sub_version = "0";
	public function index() {
		$this->load->language('extension/module/bhm_bcb');
		$this->load->model('localisation/language');
		$this->load->model('extension/module');
		$this->load->model('tool/image');
		$this->document->setTitle($this->language->get('heading_title'));
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('bhm_bcb', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'));
		}
		$text_lang = array(
			'heading_title','button_save','button_cancel','tab_general','tab_about','support_text','support_version','text_enabled','text_disabled','text_edit','text_name','text_name_block',
			'text_type_mapping','text_menu','text_block','text_carousel','text_type_view','text_text','text_img','text_img_text','text_no_image','text_image_thumb','text_quantity',
			'text_all_brand_link','text_all_brand_name','text_type_carousel','text_orientation_carousel','text_vertical','text_horizontal','text_auto_carousel','text_pause_carousel',
			'text_infinite','text_scroll_limit','text_animation_speed','text_scroll','text_width','text_height','text_status','text_style','text_default_theme','text_your_theme','text_in_theme',
			'text_interval_speed','text_style_carousel','help_name_block','help_quantity','help_all_brand_link','help_type_carousel'
		);
		foreach ($text_lang as $lang) {$data[$lang] = $this->language->get($lang);}
		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array('text' => $this->language->get('text_home'),'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'));
		$data['breadcrumbs'][] = array('text' => $this->language->get('text_module'),'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/bhm_bcb',
				'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/bhm_bcb',
				'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}
		if (isset($this->error['warning'])) {$data['error_warning'] = $this->error['warning'];} else {$data['error_warning'] = '';}
		if (isset($this->error['name'])) {$data['error_name'] = $this->error['name'];} else {$data['error_name'] = '';}
		if (isset($this->error['quantity'])) {$data['error_quantity'] = $this->error['quantity'];} else {$data['error_quantity'] = '';}
		if (isset($this->error['scroll_limit'])) {$data['error_scroll_limit'] = $this->error['scroll_limit'];} else {$data['error_scroll_limit'] = '';}
		if (isset($this->error['scroll'])) {$data['error_scroll'] = $this->error['scroll'];} else {$data['error_scroll'] = '';}
		if (isset($this->error['animation_speed'])) {$data['error_animation_speed'] = $this->error['animation_speed'];} else {$data['error_animation_speed'] = '';}
		if (isset($this->error['interval_speed'])) {$data['error_interval_speed'] = $this->error['interval_speed'];} else {$data['error_interval_speed'] = '';}
		if (isset($this->error['width'])) {$data['error_width'] = $this->error['width'];} else {$data['error_width'] = '';}
		if (isset($this->error['height'])) {$data['error_height'] = $this->error['height'];} else {$data['error_height'] = '';}
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/bhm_bcb', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('extension/module/bhm_bcb', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		$data['languages'] = $this->model_localisation_language->getLanguages(array('sort' => 'code'));
		foreach ($data['languages'] as $key => $language) {
			$flag_img = 'view/image/flags/'.$language['image'];
			if (version_compare(VERSION, '2.2', '>=')) {
				$flag_img = 'language/'.$language['code'].'/'.$language['image'];
			}
			if(!is_file($flag_img)){
				$flag_img = 'language/'.$language['code'].'/'.$language['code'].'.png';
				if(!is_file($flag_img)) $flag_img = null;
			}
			$data['languages'][$key]['flag_img'] = $flag_img;
		}
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info['name'])) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		if (isset($this->request->post['name_block'])) {
			$data['name_block'] = $this->request->post['name_block'];
		} elseif (!empty($module_info['name_block'])) {
			$data['name_block'] = $module_info['name_block'];
		} else {
			$data['name_block'] = '';
		}
		if (isset($this->request->post['type_mapping'])) {
			$data['type_mapping'] = $this->request->post['type_mapping'];
		} elseif (!empty($module_info['type_mapping'])) {
			$data['type_mapping'] = $module_info['type_mapping'];
		} else {
			$data['type_mapping'] = 'block';
		}
		if (isset($this->request->post['type_view'])) {
			$data['type_view'] = $this->request->post['type_view'];
		} elseif (!empty($module_info['type_view'])) {
			$data['type_view'] = $module_info['type_view'];
		} else {
			$data['type_view'] = 'img';
		}
		if (isset($this->request->post['no_image'])) {
			$data['no_image'] = $this->request->post['no_image'];
		} elseif (!empty($module_info['no_image'])) {
			$data['no_image'] = $module_info['no_image'];
		} else {
			$data['no_image'] = '0';
		}
		$data['placeholder'] = $this->model_tool_image->resize('catalog/bhm/no_image.png', 100, 100);
		if (isset($this->request->post['no_image_img'])) {
			$data['no_image_img'] = $this->request->post['no_image_img'];
		} elseif (!empty($module_info['no_image_img'])) {
			$data['no_image_img'] = $module_info['no_image_img'];
		} else {
			$data['no_image_img'] = 'catalog/bhm/no_image.png';
		}
		if (isset($this->request->post['no_image_img']) && is_file(DIR_IMAGE . $this->request->post['no_image_img'])) {
			$data['no_image_thumb'] = $this->model_tool_image->resize($this->request->post['no_image_img'], 100, 100);
		} elseif (!empty($data['no_image_img']) && is_file(DIR_IMAGE . $data['no_image_img'])) {
			$data['no_image_thumb'] = $this->model_tool_image->resize($data['no_image_img'], 100, 100);
		} else {
			$data['no_image_thumb'] = $this->model_tool_image->resize('catalog/bhm/no_image.png', 100, 100);
		}
		if (isset($this->request->post['quantity'])) {
			$data['quantity'] = $this->request->post['quantity'];
		} elseif (!empty($module_info['quantity'])) {
			$data['quantity'] = $module_info['quantity'];
		} else {
			$data['quantity'] = '0';
		}
		if (isset($this->request->post['all_brand_link'])) {
			$data['all_brand_link'] = $this->request->post['all_brand_link'];
		} elseif (!empty($module_info['all_brand_link'])) {
			$data['all_brand_link'] = $module_info['all_brand_link'];
		} else {
			$data['all_brand_link'] = 'text';
		}
		if (isset($this->request->post['all_brand_link_image'])) {
			$data['all_brand_link_image'] = $this->request->post['all_brand_link_image'];
		} elseif (!empty($module_info['all_brand_link_image'])) {
			$data['all_brand_link_image'] = $module_info['all_brand_link_image'];
		} else {
			$data['all_brand_link_image'] = 'catalog/bhmno_image.png';
		}
		if (isset($this->request->post['all_brand_link_image']) && is_file(DIR_IMAGE . $this->request->post['all_brand_link_image'])) {
			$data['all_brand_link_thumb'] = $this->model_tool_image->resize($this->request->post['all_brand_link_image'], 100, 100);
		} elseif (!empty($data['all_brand_link_image']) && is_file(DIR_IMAGE . $data['all_brand_link_image'])) {
			$data['all_brand_link_thumb'] = $this->model_tool_image->resize($data['all_brand_link_image'], 100, 100);
		} else {
			$data['all_brand_link_thumb'] = $this->model_tool_image->resize('catalog/bhm/no_image.png', 100, 100);
		}
		if (isset($this->request->post['all_brand_name'])) {
			$data['all_brand_name'] = $this->request->post['all_brand_name'];
		} elseif (!empty($module_info['all_brand_name'])) {
			$data['all_brand_name'] = $module_info['all_brand_name'];
		} else {
			$data['all_brand_name'] = '';
		}
		if (isset($this->request->post['type_carousel'])) {
			$data['type_carousel'] = $this->request->post['type_carousel'];
		} elseif (!empty($module_info['type_carousel'])) {
			$data['type_carousel'] = $module_info['type_carousel'];
		} else {
			$data['type_carousel'] = 'owlCarousel';
		}
		if (isset($this->request->post['orientation_carousel'])) {
			$data['orientation_carousel'] = $this->request->post['orientation_carousel'];
		} elseif (!empty($module_info['orientation_carousel'])) {
			$data['orientation_carousel'] = $module_info['orientation_carousel'];
		} else {
			$data['orientation_carousel'] = 'horizontal';
		}
		if (isset($this->request->post['auto_carousel'])) {
			$data['auto_carousel'] = $this->request->post['auto_carousel'];
		} elseif (!empty($module_info['auto_carousel'])) {
			$data['auto_carousel'] = $module_info['auto_carousel'];
		} else {
			$data['auto_carousel'] = 'true';
		}
		if (isset($this->request->post['infinite'])) {
			$data['infinite'] = $this->request->post['infinite'];
		} elseif (!empty($module_info['infinite'])) {
			$data['infinite'] = $module_info['infinite'];
		} else {
			$data['infinite'] = 'true';
		}
		if (isset($this->request->post['pause_carousel'])) {
			$data['pause_carousel'] = $this->request->post['pause_carousel'];
		} elseif (!empty($module_info['pause_carousel'])) {
			$data['pause_carousel'] = $module_info['pause_carousel'];
		} else {
			$data['pause_carousel'] = 'true';
		}
		if (isset($this->request->post['scroll_limit'])) {
			$data['scroll_limit'] = $this->request->post['scroll_limit'];
		} elseif (!empty($module_info['scroll_limit'])) {
			$data['scroll_limit'] = $module_info['scroll_limit'];
		} else {
			$data['scroll_limit'] = '5';
		}
		if (isset($this->request->post['scroll'])) {
			$data['scroll'] = $this->request->post['scroll'];
		} elseif (!empty($module_info['scroll'])) {
			$data['scroll'] = $module_info['scroll'];
		} else {
			$data['scroll'] = '1';
		}
		if (isset($this->request->post['animation_speed'])) {
			$data['animation_speed'] = $this->request->post['animation_speed'];
		} elseif (!empty($module_info['animation_speed'])) {
			$data['animation_speed'] = $module_info['animation_speed'];
		} else {
			$data['animation_speed'] = '800';
		}
		if (isset($this->request->post['interval_speed'])) {
			$data['interval_speed'] = $this->request->post['interval_speed'];
		} elseif (!empty($module_info['interval_speed'])) {
			$data['interval_speed'] = $module_info['interval_speed'];
		} else {
			$data['interval_speed'] = '3000';
		}
		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info['height'])) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = 200;
		}
		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info['width'])) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = 200;
		}
		if (isset($this->request->post['style'])) {
			$data['style'] = $this->request->post['style'];
		} elseif (!empty($module_info['style'])) {
			$data['style'] = $module_info['style'];
		} else {
			$data['style'] = 'default';
		}
		if (isset($this->request->post['style_carousel'])) {
			$data['style_carousel'] = $this->request->post['style_carousel'];
		} elseif (!empty($module_info['style_carousel'])) {
			$data['style_carousel'] = $module_info['style_carousel'];
		} else {
			$data['style_carousel'] = 'default';
		}
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info['status'])) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '0';
		}
		$data['main_version'] = $this->main_version;
		$data['sub_version'] = $this->sub_version;
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('extension/module/bhm_bcb.tpl', $data));
	}
/*
	public function check_version() {
		$url = @fopen("http://oc.byhelp.info/last-release/bhm_bcb", "r");
		 if ($url) {
			while (!feof($url)) {
				$data_ver = explode(",", fgets($url, 999));
				$version = $data_ver[0];
				$code = $data_ver[1];
				$chenges = $data_ver[3];
			}
			fclose($url);
			if ($this->version != $version) {
			}
		}	else {
		}
	}
*/
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/bhm_bcb')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		if ($this->request->post['type_mapping'] == 'block' || $this->request->post['type_mapping'] == 'menu') {
			if (utf8_strlen($this->request->post['quantity']) < 1) {
				$this->error['quantity'] = $this->language->get('error_quantity');
			} else if (!is_numeric($this->request->post['quantity'])) {
				$this->error['quantity'] = $this->language->get('error_only_number');
			}
		}
		if ($this->request->post['type_mapping'] != 'menu') {
			if (!$this->request->post['width']) {
				$this->error['width'] = $this->language->get('error_width');
			} else if (!is_numeric($this->request->post['width'])) {
				$this->error['width'] = $this->language->get('error_only_number');
			}
			if (!$this->request->post['height']) {
				$this->error['height'] = $this->language->get('error_height');
			} else if (!is_numeric($this->request->post['height'])) {
				$this->error['height'] = $this->language->get('error_only_number');
			}
		}
		if ($this->request->post['type_mapping'] == 'carousel') {
			if (!$this->request->post['scroll_limit']) {
				$this->error['scroll_limit'] = $this->language->get('error_scroll_limit');
			} else if (!is_numeric($this->request->post['scroll_limit'])) {
				$this->error['scroll_limit'] = $this->language->get('error_only_number');
			}
			if ($this->request->post['type_carousel']!='owlCarousel') {
				if (!$this->request->post['scroll']) {
					$this->error['scroll'] = $this->language->get('error_scroll');
				} else if (!is_numeric($this->request->post['scroll'])) {
					$this->error['scroll'] = $this->language->get('error_only_number');
				}
			}
			if ($this->request->post['auto_carousel']=="true") {
				if (!$this->request->post['interval_speed']) {
					$this->error['interval_speed'] = $this->language->get('error_interval_speed');
				} else if (!is_numeric($this->request->post['interval_speed'])) {
					$this->error['interval_speed'] = $this->language->get('error_only_number');
				}
			}
			if (!$this->request->post['animation_speed']) {
				$this->error['animation_speed'] = $this->language->get('error_animation_speed');
			} else if (!is_numeric($this->request->post['animation_speed'])) {
				$this->error['animation_speed'] = $this->language->get('error_only_number');
			}
		}
		return !$this->error;
	}
}
