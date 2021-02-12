<?php
class ControllerExtensionModuleBHMbcb extends Controller {
	public function index($setting) {
		static $module_bhm_bcb = 0;
		$this->load->language('extension/module/bhm_bcb');
		$this->load->model('catalog/manufacturer');
		$this->load->model('tool/image');
		if (version_compare(VERSION, '2.2.0.0') >= 0) {$dir_theme = $this->config->get('theme_default_directory');} else {$dir_theme = $this->config->get('config_template');}
		$data['name_block'] = $setting['name_block'][$this->config->get('config_language_id')];
		$type_mapping = $setting['type_mapping'];
		$data['all_brand_link'] = $setting['all_brand_link'];
		$data['brands'] = array();
		$getData = array();
		if ($data['all_brand_link'] != 'none') {
			if ($data['all_brand_link'] == 'img' || $data['all_brand_link'] == 'img_text') {
				$data['all_brand_link_image'] = $this->model_tool_image->resize($setting['all_brand_link_image'], $setting['width'], $setting['height']);
			}
			if (empty($setting['all_brand_name'][$this->config->get('config_language_id')])) {
				$data['all_brand_name'] = $this->language->get('text_all_brand_name');
			} else {
				$data['all_brand_name'] = $setting['all_brand_name'][$this->config->get('config_language_id')];
			}
			$data['all_brands_link'] = $this->url->link('product/manufacturer');
		}
		if ($type_mapping=='menu') {
			$theme_file = $type_mapping;
			if ($setting['quantity'] != 0) {$getData['limit'] = $setting['quantity'];$getData['start'] ="0";}
			$results = $this->model_catalog_manufacturer->getManufacturers($getData);
			if ($setting['style'] == "default") {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/bhm_bcb/menu.css');
			} else if ($setting['style'] == "your_theme") {
				if (file_exists(DIR_TEMPLATE . $dir_theme . '/stylesheet/bhm_bcb/menu.css')) {
					$this->document->addStyle('catalog/view/theme/' . $dir_theme . '/stylesheet/bhm_bcb/menu.css');
				} else {
					$this->document->addStyle('catalog/view/theme/default/stylesheet/bhm_bcb/menu.css');
				}
			}
			foreach ($results as $result) {
				$data['brands'][] = array(
					'manufacturer_id' => $result['manufacturer_id'],
					'title' => $result['name'],
					'link' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id']),
				);
			}
		} else {
			$data['type_view'] = $setting['type_view'];
			if ($type_mapping=='block') {
				if ($setting['quantity'] != 0) {$getData['limit'] = $setting['quantity'];$getData['start'] ="0";}
				$results = $this->model_catalog_manufacturer->getManufacturers($getData);
				$theme_file = $type_mapping;
			} else {
				$results = $this->model_catalog_manufacturer->getManufacturers();
//Общий стилевой файл

				$type_carousel = $setting['type_carousel'];
				$data['auto_carousel'] = $setting['auto_carousel'];
				if ($setting['auto_carousel']=="true") {
					$data['pause_carousel'] = $setting['pause_carousel'];
					$data['interval_speed'] = $setting['interval_speed'];
				}
				$data['orientation_carousel'] = $setting['orientation_carousel'];
				$data['infinite'] = $setting['infinite'];
				$data['scroll_limit'] = $setting['scroll_limit'];
				$data['animation_speed'] = $setting['animation_speed'];
//bxSlider
				if ($type_carousel == "bxSlider") {
					$theme_file = "bx_slider";
					$data['width'] = $setting['width'];
					$data['scroll'] = $setting['scroll'];
					$this->document->addScript('catalog/view/javascript/jquery/jquery.bxslider.min.js');
					if (file_exists(DIR_TEMPLATE . $dir_theme . '/stylesheet/bxslider/jquery.bxslider.min.css')) {
						$this->document->addStyle('catalog/view/theme/' . $dir_theme . '/stylesheet/bxslider/jquery.bxslider.min.css');
					} else {
						$this->document->addStyle('catalog/view/theme/default/stylesheet/bxslider/jquery.bxslider.min.css');
					}
//Slik
				} else if ($type_carousel == "Slik") {
					$theme_file = "slik";
					$data['scroll'] = $setting['scroll'];
					if ($data['orientation_carousel']=="vertical") { $data['orientation_carousel'] = "true"; } else { $data['orientation_carousel'] = "false"; }
					$this->document->addScript('catalog/view/javascript/jquery/slick.min.js');
					$this->document->addStyle('catalog/view/theme/default/stylesheet/slik/slick-theme.css');
					$this->document->addStyle('catalog/view/theme/default/stylesheet/slik/slick.css');
//OWL carousel
				} else {
					$theme_file = "owl_carousel";
					 shuffle($results);
				}
			}
			foreach ($results as $result) {
				if ($setting['no_image'] == '1') {if (!is_file(DIR_IMAGE . $result['image'])) {$result['image'] = $setting['no_image_img'];}}
				if (is_file(DIR_IMAGE . $result['image'])) {
					$data['brands'][] = array(
						'manufacturer_id' => $result['manufacturer_id'],
						'title' => $result['name'],
						'link' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id']),
						'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
					);
				}
			}
		}
		$data['module_bhm_bcb'] = $module_bhm_bcb++;
		if (version_compare(VERSION, '2.2.0.0') >= 0) {
			return $this->load->view('extension/module/bhm_bcb/'.$theme_file.'.tpl', $data);
		} else {
			if (file_exists(DIR_TEMPLATE . $dir_theme . '/template/extension/module/bhm_bcb/'.$theme_file.'.tpl')) {
				return $this->load->view($dir_theme . '/template/extension/module/bhm_bcb/'.$theme_file.'.tpl', $data);
			} else {
				return $this->load->view('default/template/extension/module/bhm_bcb/'.$theme_file.'.tpl', $data);
			}
		}
	}
}
