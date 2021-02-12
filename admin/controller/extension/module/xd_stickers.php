<?php
class ControllerExtensionModuleXDStickers extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/xd_stickers');
		$this->document->setTitle($this->language->get('heading_name'));
		$this->document->addScript('view/javascript/jquery/colorpicker.js');
		$this->document->addStyle('view/stylesheet/css/colorpicker.css');

		$data['token'] = $this->session->data['token'];

		$this->load->model('setting/setting');
		$this->load->model('extension/module/xd_stickers');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->model_extension_module_xd_stickers->truncateCustomXDStickers();
			if (isset($this->request->post['custom_xd_sticker'])) {
				foreach ($this->request->post['custom_xd_sticker'] as $custom_xd_sticker) {
					$this->model_extension_module_xd_stickers->addCustomXDSticker($custom_xd_sticker);
				}
			}

			$this->model_setting_setting->editSetting('xd_stickers', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		// Heading
		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_name'] = $this->language->get('heading_name');

		// Text
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_topleft'] = $this->language->get('text_topleft');
		$data['text_topright'] = $this->language->get('text_topright');

		//Buttons
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_custom_xd_sticker_add'] = $this->language->get('button_custom_xd_sticker_add');

		// Tab headers
		$data['text_tab_settings'] = $this->language->get('text_tab_settings');
		$data['text_tab_settings_title'] = $this->language->get('text_tab_settings_title');
		$data['text_tab_auto_stickers'] = $this->language->get('text_tab_auto_stickers');

		$data['text_tab_auto_stickers'] = $this->language->get('text_tab_auto_stickers');

		$data['text_tab_sold_title'] = $this->language->get('text_tab_sold_title');
		$data['text_tab_sale_title'] = $this->language->get('text_tab_sale_title');
		$data['text_tab_bestseller_title'] = $this->language->get('text_tab_bestseller_title');
		$data['text_tab_novelty_title'] = $this->language->get('text_tab_novelty_title');
		$data['text_tab_last_title'] = $this->language->get('text_tab_last_title');
		$data['text_tab_freeshipping_title'] = $this->language->get('text_tab_freeshipping_title');

		$data['text_tab_custom'] = $this->language->get('text_tab_custom');
		$data['text_tab_custom_title'] = $this->language->get('text_tab_custom_title');
		$data['text_tab_bulk_custom'] = $this->language->get('text_tab_bulk_custom');
		$data['text_tab_bulk_custom_title'] = $this->language->get('text_tab_bulk_custom_title');

		// Entry
		$data['entry_xd_stickers_status'] = $this->language->get('entry_xd_stickers_status');
		$data['entry_xd_stickers_position'] = $this->language->get('entry_xd_stickers_position');

		$data['entry_sticker_title'] = $this->language->get('entry_sticker_title');
		$data['entry_sticker_text'] = $this->language->get('entry_sticker_text');
		$data['entry_sticker_color'] = $this->language->get('entry_sticker_color');
		$data['entry_sticker_bg'] = $this->language->get('entry_sticker_bg');
		$data['entry_sticker_property'] = $this->language->get('entry_sticker_property');
		$data['entry_sticker_status'] = $this->language->get('entry_sticker_status');

		$data['entry_sticker_bestseller_property'] = $this->language->get('entry_sticker_bestseller_property');
		$data['entry_sticker_novelty_property'] = $this->language->get('entry_sticker_novelty_property');
		$data['entry_sticker_last_property'] = $this->language->get('entry_sticker_last_property');
		$data['entry_sticker_freeshipping_property'] = $this->language->get('entry_sticker_freeshipping_property');

		// Ajax
		$data['text_delete_xd_sticker_success'] = $this->language->get('text_delete_xd_sticker_success');
		$data['text_delete_xd_sticker_error'] = $this->language->get('text_delete_xd_sticker_error');
		$data['text_error_ajax'] = $this->language->get('text_error_ajax');

		// BULK
		$data['entry_bulk_categories'] = $this->language->get('entry_bulk_categories');
		$data['text_all_categories'] = $this->language->get('text_all_categories');
		$data['entry_bulk_manufacturers'] = $this->language->get('entry_bulk_manufacturers');
		$data['text_all_manufacturers'] = $this->language->get('text_all_manufacturers');
		$data['entry_bulk_custom_xd_stickers'] = $this->language->get('entry_bulk_custom_xd_stickers');
		$data['entry_bulk_warning'] = $this->language->get('entry_bulk_warning');
		$data['button_custom_xd_stickers_bulk_delete'] = $this->language->get('button_custom_xd_stickers_bulk_delete');
		$data['button_custom_xd_stickers_bulk'] = $this->language->get('button_custom_xd_stickers_bulk');

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
		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_name'),
				'href' => $this->url->link('extension/module/xd_stickers', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_name'),
				'href' => $this->url->link('extension/module/xd_stickers', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/xd_stickers', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/xd_stickers', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		// Languages
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();

		// Main settings
		if (isset($this->request->post['xd_stickers'])) {
			$data['xd_stickers'] = $this->request->post['xd_stickers'];
		} else {
			$data['xd_stickers'] = $this->config->get('xd_stickers');
		}

		if ($this->config->get('xd_stickers["position"]')) {
			$data['xd_stickers["position"]'] = $this->config->get('xd_stickers["position"]');
		} else {
			$data['xd_stickers["position"]'] = 0;
		}

		if ($this->config->get('xd_stickers["status"]')) {
			$data['xd_stickers["status"]'] = $this->config->get('xd_stickers["status"]');
		} else {
			$data['xd_stickers["status"]'] = 0;
		}

		// CUSTOM stickers
		$data['custom_xd_stickers'] = array();
		$custom_xd_stickers = $this->model_extension_module_xd_stickers->getCustomXDStickers();
		if (empty($custom_xd_stickers)) {
			$custom_xd_stickers = array();
		} else {
			foreach ($custom_xd_stickers as $custom_xd_sticker) {
				$data['custom_xd_stickers'][] = array(
					'xd_sticker_id'	=> $custom_xd_sticker['xd_sticker_id'],
					'name'			=> $custom_xd_sticker['name'],
					'text' 			=> json_decode($custom_xd_sticker['text'], true),
					'bg_color'		=> $custom_xd_sticker['bg_color'],
					'color_color'	=> $custom_xd_sticker['color_color'],
					'status'		=> $custom_xd_sticker['status'],
				);
			}
		}

		// BULK Stickers
        $categories = $this->model_extension_module_xd_stickers->getCategories();
		$data['bulk_manufacturers'] = $this->model_extension_module_xd_stickers->getManufacturers();
		$data['bulk_custom_xd_stickers'] = $this->model_extension_module_xd_stickers->getCustomXDStickers();
        $data['bulk_categories'] = $this->getAllCategories($categories);


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/xd_stickers.tpl', $data));
	}

    public function delete_xd_sticker() {
        $json = array();
		$this->load->language('extension/module/xd_stickers');
        if (!$this->user->hasPermission('modify', 'extension/module/xd_stickers')) {
            $json['error'] = $this->language->get('error_permission');
        } else {
            if (isset($this->request->request['xd_sticker_id'])) {
                $this->load->model('extension/module/xd_stickers');
				$status = $this->model_extension_module_xd_stickers->deleteCustomXDSticker($this->request->request['xd_sticker_id']);
                if ($status) {
					$status = $this->model_extension_module_xd_stickers->deleteCustomXDStickerProduct($this->request->request['xd_sticker_id']);
					if ($status) {
						$json['success'] = $this->language->get('text_delete_xd_sticker_success');
					} else {
						$json['error'] = $this->language->get('text_delete_xd_stickers_error');
					}
                } else {
                    $json['error'] = $this->language->get('text_delete_xd_stickers_error');
                }
            }
        }
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    private function getAllCategories($categories, $parent_id = 0, $parent_name = '') {
        $output = array();

        if (array_key_exists($parent_id, $categories)) {
            if ($parent_name != '') {
                $parent_name .= ' &gt; ';
            }

            foreach ($categories[$parent_id] as $category) {
                $output[$category['category_id']] = array(
                    'category_id' => $category['category_id'],
                    'name' => $parent_name . $category['name']
                );

                $output += $this->getAllCategories($categories, $category['category_id'], $parent_name . $category['name']);
            }
        }

        uasort($output, array(
            $this,
            'sortByName'
        ));

        return $output;
    }

    public function bulkAddCustomXDStickers() {
        $json = array();
		// var_dump($this->request->request);
		$this->load->language('extension/module/xd_stickers');

        if (!$this->user->hasPermission('modify', 'extension/module/xd_stickers')) {
            $json['error'] = $this->language->get('error_permission');
        } else {
			// var_dump($json);
            if ((isset($this->request->request['module_bulk_categories']) || isset($this->request->request['module_bulk_manufacturers'])) && empty($json)) {

                $this->load->model('extension/module/xd_stickers');
                $this->load->language('extension/module/xd_stickers');

                $status = $this->model_extension_module_xd_stickers->updateBulkCustomXDStickerProduct($this->request->request['module_bulk_categories'], $this->request->request['module_bulk_manufacturers'], $this->request->request['module_bulk_custom_xd_stickers']);
				// var_dump($status);
                if ($status) {
                    $json['success'] = $this->language->get('text_bulk_xd_stickers_success');
                } else {
                    $json['error'] = $this->language->get('text_bulk_xd_stickers_error');
                }
            } else {
                $json['error'] = $this->language->get('text_bulk_xd_stickers_error');
            }
        }
		// var_dump($this->response);
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function bulkDeleteCustomXDStickers() {
        $json = array();
		// var_dump($this->request->request);
		$this->load->language('extension/module/xd_stickers');

        if (!$this->user->hasPermission('modify', 'extension/module/xd_stickers')) {
            $json['error'] = $this->language->get('error_permission');
        } else {
            if ((isset($this->request->request['module_bulk_categories']) || isset($this->request->request['module_bulk_manufacturers'])) && empty($json)) {

                $this->load->model('extension/module/xd_stickers');
                $this->load->language('extension/module/xd_stickers');

                $status = $this->model_extension_module_xd_stickers->deleteBulkCustomXDStickerProduct($this->request->request['module_bulk_categories'], $this->request->request['module_bulk_manufacturers'], $this->request->request['module_bulk_custom_xd_stickers']);
				// var_dump($status);
                if ($status) {
                    $json['success'] = $this->language->get('text_bulk_delete_xd_stickers_success');
                } else {
                    $json['error'] = $this->language->get('text_bulk_delete_xd_stickers_error');
                }
            } else {
                $json['error'] = $this->language->get('text_bulk_xd_stickers_error');
            }
        }
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    function sortByName($a, $b) {
        return strcmp($a['name'], $b['name']);
    }

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/xd_stickers')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}
}