<?php
class ModelExtensionShippingCs extends Model {
	function getQuote($address) {
		$this->load->language('extension/shipping/cs');
		$this->load->model('setting/setting');
 		$custom_shippings = $this->model_setting_setting->getSetting('cs');

		$method_data = array();
		$status = $this->config->get('cs_status');
			$quote_data = array();
			if(!empty($custom_shippings['cs'])){
			foreach($custom_shippings['cs'] as $key => $custom_shipping){
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$custom_shipping['cs_geo_zone_id'] . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$custom_shipping['cs_geo_zone_id']) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}
		if ($status) {
			$total_shipping = $this->cart->getSubTotal();
			if ($total_shipping > $custom_shipping['allcost']) {
				$cost = $custom_shipping['newcost'];
			}
			else {
				$cost = $custom_shipping['cost'];
			}
			  $quote_data['cs_'.$key] = array(
				  'code'         => 'cs.cs_'.$key,
				  'title'        => $custom_shipping['shipping_description'][(int)$this->config->get('config_language_id')]['name'],
				  'cost'         => $cost,
				  'tax_class_id' => $custom_shipping['cs_tax_class_id'],
				  'text'         => $this->currency->format($this->tax->calculate($custom_shipping['cost'], 		$custom_shipping['cs_tax_class_id'], 		$this->config->get('config_tax')), $this->session->data['currency'])
			  );
			}
		}
	}
	$titlearray = $this->config->get('cs_group_shipping'); 
			$method_data = array(
				'code'       => 'cs',
				'title'      => $titlearray[(int)$this->config->get('config_language_id')]['shipping_name'],
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('cs_sort_order'),
				'error'      => false
			);

		return $method_data;
	}
}