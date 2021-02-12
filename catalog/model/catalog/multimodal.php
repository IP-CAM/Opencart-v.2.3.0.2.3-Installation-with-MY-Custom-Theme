<?php
class ModelCatalogMultimodal extends Model {

    public function getModals() {
        $data = array();

        $query = $this->db->query("SELECT m.*,
        (SELECT description FROM " . DB_PREFIX . "multi_modal_translate WHERE `key` = 'title' AND modal_id = m.id AND lang_id = '".(int)$this->config->get('config_language_id')."') AS title,
        (SELECT description FROM " . DB_PREFIX . "multi_modal_translate WHERE `key` = 'content' AND modal_id = m.id AND lang_id = '".(int)$this->config->get('config_language_id')."') AS content
        FROM " . DB_PREFIX . "multi_modals m WHERE m.status = 1");

        foreach ($query->rows as $result) {
            $data[$result['id']] = array(
                'type' => $result['type'],
                'title' => $result['title'],
                'content' => $result['content'],
                'show_modal' => $result['show_modal'],
                'selector' => $result['selector'],
                'link' => $result['link'],
                'timeout' => $result['timeout'],
                'discount' => $result['discount'],
                'discount_sum' => $result['discount_sum'],
                'discount_type' => $result['discount_type'],
                'discount_percent' => $result['discount_percent'],
                'tries_time' => $result['tries_time'],
                'all_layouts' => $result['all_layouts'],
                'layouts' => (!empty($result['layouts'])) ? explode(',',$result['layouts'])  : array(),
                'include_products' => (!empty($result['include_products'])) ? explode(',',$result['include_products'])  : array(),
                'customer_groups' => (!empty($result['customer_groups'])) ? explode(',',$result['customer_groups']) : array(),
                'all_categories' => $result['all_categories'],
                'categories' => (!empty($result['categories'])) ? explode(',',$result['categories'])  : array(),
                'st_period' => $result['st_period'],
                'date_from' => $result['date_from'],
                'date_to' => $result['date_to']
            );
        }

        return $data;
    }

    public function getModalById($id)
    {
        $result = $this->db->query("SELECT m.*,
        (SELECT description FROM " . DB_PREFIX . "multi_modal_translate WHERE `key` = 'title' AND modal_id = m.id AND lang_id = '".(int)$this->config->get('config_language_id')."') AS title,
        (SELECT description FROM " . DB_PREFIX . "multi_modal_translate WHERE `key` = 'content' AND modal_id = m.id AND lang_id = '".(int)$this->config->get('config_language_id')."') AS content
        FROM " . DB_PREFIX . "multi_modals m WHERE m.status = 1 AND id = '".(int)$id."'  ");

        return ($result->rows) ? $result->row : null;
    }

    public function getOptionPrice($price, $product_id, $product_option_id, $option_value)
    {
        $option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

        if ($option_query->num_rows) {
            if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio' || $option_query->row['type'] == 'image') {
                $option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$option_value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

                if ($option_value_query->num_rows) {
                    if ($option_value_query->row['price_prefix'] == '+') {
                        $price += $option_value_query->row['price'];
                    } elseif ($option_value_query->row['price_prefix'] == '-') {
                        $price -= $option_value_query->row['price'];
                    }
                }
            } elseif ($option_query->row['type'] == 'checkbox' && is_array($option_value)) {
                foreach ($option_value as $product_option_value_id) {
                    $option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

                    if ($option_value_query->num_rows) {
                        if ($option_value_query->row['price_prefix'] == '+') {
                            $price += $option_value_query->row['price'];
                        } elseif ($option_value_query->row['price_prefix'] == '-') {
                            $price -= $option_value_query->row['price'];
                        }
                    }
                }
            }
        }
    }

    public function addRequest($data)
    {
        $this->db->query("INSERT INTO " . DB_PREFIX . "multi_modals_requests SET
                name_form = '" . $this->db->escape($data['name_form']) . "',
                email = '" . $this->db->escape($data['email']) . "',
                telephone = '" . $this->db->escape($data['telephone']) . "',
                fields = '" . $this->db->escape(serialize($data['fields'])) . "',
                url = '" . $this->db->escape($data['url']) . "',
                date_add = '" . date('Y-m-d H:i:s') . "',
                ip_address = '" . $this->db->escape($_SERVER['REMOTE_ADDR']) . "'
            ");
    }

    public function addOffer($data)
    {
        //very soon
    }
}
?>