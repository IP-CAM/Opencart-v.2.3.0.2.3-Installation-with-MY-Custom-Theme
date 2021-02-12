<?php
class ModelCatalogMultimodal extends Model {

    public function insertModal()
    {
        $this->db->query("INSERT INTO " . DB_PREFIX . "multi_modals SET
                `status` = '0',
                `type` = 'default',
                `show_modal` = 'mouseout',
                `timeout` = '0',
                `selector` = '',
                `link` = '',
                `email` = '',
                `all_categories` = '1',
                `all_layouts` = '1',
                `st_period` = '0',
                `customer_groups` = '',
                `categories` = '',
                `layouts` = '',
                `include_products` = '',
                `date_from` = '',
                `date_to` = '',
                `discount` = '',
                `discount_sum` = '',
                `discount_percent` = '',
                `discount_type` = '',
                `tries_time` = '0'
            ");

        return $this->db->getLastId();
    }

    public function removeModal($id_modal)
    {
        $this->db->query("DELETE FROM " . DB_PREFIX . "multi_modals WHERE id = '".(int)$id_modal."' ");
    }

    public function saveModals($data){

        //$this->db->query("DELETE FROM " . DB_PREFIX . "multi_modals");
        $this->db->query("DELETE FROM " . DB_PREFIX . "multi_modal_translate");

        foreach ($data as $keyModal => $dataModal) {
            $status = (isset($dataModal['status'])) ? 1 : 0;

            $all_categories = (isset($dataModal['all_categories'])) ? 1 : 0;
            $all_layouts = (isset($dataModal['all_layouts'])) ? 1 : 0;
            $st_period = (isset($dataModal['st_period'])) ? 1 : 0;

            $discount = (isset($dataModal['discount'])) ? 1 : 0;

            $customer_groups = (isset($dataModal['customer_groups'])) ? $this->db->escape(implode(',',$dataModal['customer_groups'])) : '';
            $categories = (isset($dataModal['categories'])) ? $this->db->escape(implode(',',$dataModal['categories'])) : '';
            $layouts = (isset($dataModal['layouts'])) ? $this->db->escape(implode(',',$dataModal['layouts'])) : '';

            $include_products = (isset($dataModal['include_products'])) ? $this->db->escape(implode(',',$dataModal['include_products'])) : '';

            $date_from = (isset($dataModal['period']['from'])) ? $dataModal['period']['from'] : '';
            $date_to = (isset($dataModal['period']['from'])) ? $dataModal['period']['to'] : '';

            $this->db->query("UPDATE " . DB_PREFIX . "multi_modals SET
                `status` = '". $status ."',
                `type` = '" . $this->db->escape($dataModal['type']) . "',
                `show_modal` = '" . $this->db->escape($dataModal['show_modal']) . "',
                `timeout` = '". (int)$dataModal['timeout'] ."',
                `selector` = '" . $this->db->escape($dataModal['selector']) . "',
                `link` = '" . $this->db->escape($dataModal['link']) . "',
                `email` = '".$this->db->escape($dataModal['email'])."',
                `all_categories` = '". $all_categories ."',
                `all_layouts` = '". $all_layouts ."',
                `st_period` = '".$st_period."',
                `customer_groups` = '" . $this->db->escape($customer_groups) . "',
                `categories` = '" . $this->db->escape($categories) . "',
                `layouts` = '" . $this->db->escape($layouts) . "',
                `include_products` = '" . $this->db->escape($include_products) . "',
                `date_from` = '" . $this->db->escape($date_from) . "',
                `date_to` = '" . $this->db->escape($date_to) . "',
                `discount` = '" . $discount . "',
                `discount_sum` = '" . (int)$dataModal['discount_sum'] . "',
                `discount_percent` = '" . (int)$dataModal['discount_percent'] . "',
                `discount_type` = '" . $this->db->escape($dataModal['discount_type']) . "',
                `tries_time` = '" . (int)$dataModal['tries_time'] . "'
                WHERE id = '" . (int)$dataModal['id'] . "'
            ");

            foreach($dataModal['title'] as $langId => $title){
                $this->db->query("INSERT INTO " . DB_PREFIX . "multi_modal_translate SET
                      `modal_id` = '". (int)$dataModal['id'] ."',
                      `lang_id` = '". (int)$langId ."',
                      `key` = 'title',
                      `description` = '". $this->db->escape($title) ."'
                ");
            }
            foreach($dataModal['content'] as $langId => $content){
                $this->db->query("INSERT INTO " . DB_PREFIX . "multi_modal_translate SET
                      `modal_id` = '". (int)$dataModal['id'] ."',
                      `lang_id` = '". (int)$langId ."',
                      `key` = 'content',
                      `description` = '". $this->db->escape($content) ."'
                ");
            }
        }
    }

    public function getModals() {
        $data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "multi_modals");

        foreach ($query->rows as $result) {
            $titles = array();
            $getTitles = $this->db->query("SELECT lang_id, description FROM " . DB_PREFIX . "multi_modal_translate WHERE `key` = 'title' AND modal_id = '".(int)$result['id']."'");
            foreach($getTitles->rows as $title){
                $titles[$title['lang_id']] = $title['description'];
            }

            $content = array();
            $getContent = $this->db->query("SELECT lang_id, description FROM " . DB_PREFIX . "multi_modal_translate WHERE `key` = 'content' AND modal_id = '".(int)$result['id']."'");
            foreach($getContent->rows as $item){
                $content[$item['lang_id']] = $item['description'];
            }

            $data[$result['id']] = array(
                'id' => $result['id'],
                'type' => $result['type'],
                'show_modal' => $result['show_modal'],
                'selector' => $result['selector'],
                'link' => $result['link'],
                'email' => $result['email'],
                'timeout' => $result['timeout'],
                'discount' => $result['discount'],
                'discount_sum' => $result['discount_sum'],
                'discount_type' => $result['discount_type'],
                'discount_percent' => $result['discount_percent'],
                'tries_time' => $result['tries_time'],
                'all_layouts' => $result['all_layouts'],
                'layouts' => explode(',',$result['layouts']),
                'include_products' => explode(',',$result['include_products']),
                'customer_groups' => explode(',',$result['customer_groups']),
                'all_categories' => $result['all_categories'],
                'categories' => explode(',',$result['categories']),
                'st_period' => $result['st_period'],
                'date_from' => $result['date_from'],
                'title' => $titles,
                'content' => $content,
                'date_to' => $result['date_to'],
                'status' => $result['status']
            );
        }

        return $data;
    }

    public function installTables()
    {
        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "multi_modals` (
             `id` int(11) NOT NULL AUTO_INCREMENT,
             `type` varchar(32) NOT NULL,
             `show_modal` varchar(32) NOT NULL,
             `selector` varchar(255) NOT NULL,
             `timeout` int(6) NOT NULL DEFAULT '0',
             `all_layouts` tinyint(1) NOT NULL DEFAULT '1',
             `layouts` varchar(100) NOT NULL,
             `email` varchar(255) NOT NULL,
             `include_products` text NOT NULL,
             `customer_groups` varchar(100) NOT NULL,
             `all_categories` tinyint(1) NOT NULL DEFAULT '1',
             `categories` text NOT NULL,
             `st_period` tinyint(1) NOT NULL DEFAULT '0',
             `date_from` datetime NOT NULL,
             `date_to` datetime NOT NULL,
             `discount` tinyint(1) NOT NULL DEFAULT '0',
             `discount_type` varchar(32) NOT NULL,
             `discount_percent` int(3) NOT NULL,
             `discount_sum` int(11) NOT NULL,
             `tries_time` int(3) NOT NULL,
             `status` tinyint(1) NOT NULL DEFAULT '1',
             PRIMARY KEY (`id`)
            ) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8");

        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "multi_modal_translate` (
             `id` int(11) NOT NULL AUTO_INCREMENT,
             `modal_id` int(11) NOT NULL,
             `lang_id` int(11) NOT NULL,
             `key` varchar(50) NOT NULL,
             `description` text NOT NULL,
             PRIMARY KEY (`id`)
            ) ENGINE=MyISAM AUTO_INCREMENT=709 DEFAULT CHARSET=utf8");

        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "multi_modals_requests` (
                 `id` int(11) NOT NULL AUTO_INCREMENT,
                 `name_form` varchar(255) NOT NULL,
                 `email` varchar(64) NOT NULL,
                 `telephone` varchar(64) NOT NULL,
                 `fields` text NOT NULL,
                 `url` varchar(255) NOT NULL,
                 `manager_id` int(11) NOT NULL DEFAULT '0',
                 `manager_comment` text NOT NULL,
                 `date_add` timestamp NOT NULL,
                 `ip_address` varchar(20) NOT NULL,
                 `status` tinyint(1) NOT NULL DEFAULT '1',
                 `removed` tinyint(1) NOT NULL DEFAULT '0',
                 PRIMARY KEY (`id`)
                ) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8");
        
        $like = $this->db->query("SHOW COLUMNS FROM ". DB_PREFIX . "multi_modals LIKE 'link' ");
        if(!$like->num_rows){
            $this->db->query("ALTER TABLE ". DB_PREFIX . "multi_modals ADD `link` VARCHAR(100) NOT NULL");
        }
    }

    public function deleteTables()
    {
        $this->db->queery("DROP TABLE `" . DB_PREFIX . "multi_modal_translate`");
        $this->db->queery("DROP TABLE `" . DB_PREFIX . "multi_modals`");
        $this->db->queery("DROP TABLE `" . DB_PREFIX . "multi_modals_requests`");
    }

    public function getTotalRequests()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "multi_modals_requests WHERE removed != 1");

        return $query->row['total'];
    }

    public function getRequests($data = array())
    {
        $returnData = array();

        $sql = "SELECT * FROM " . DB_PREFIX . "multi_modals_requests WHERE removed != 1 ";

        $sort_data = array(
            'name_form',
            'date_add',
            'status'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY date_add";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }


        $query = $this->db->query($sql);
        foreach ($query->rows as $row) {
            $returnData[] = array(
                'id' => $row['id'],
                'name_form' => $row['name_form'],
                'email' => $row['email'],
                'telephone' => $row['telephone'],
                'fields' => unserialize($row['fields']),
                'url' => urldecode($row['url']),
                'manager_id' => $row['manager_id'],
                'manager_comment' => $row['manager_comment'],
                'date_add' => $row['date_add'],
                'ip_address' => $row['ip_address'],
                'status' => $row['status']
            );

        }

        return $returnData;
    }

    public function changeStatus($id, $status)
    {
        $this->db->query("UPDATE " . DB_PREFIX . "multi_modals_requests SET `status` = '". (int)$status ."' WHERE id = '". (int)$id ."' LIMIT 1");
    }

    public function saveComment($id, $comment)
    {
        $this->db->query("UPDATE " . DB_PREFIX . "multi_modals_requests SET `manager_comment` = '". $this->db->escape($comment) ."' WHERE id = '". (int)$id ."' LIMIT 1");
    }

    public function removeRequest($id)
    {
        $this->db->query("UPDATE " . DB_PREFIX . "multi_modals_requests SET `removed` = '1' WHERE id = '". (int)$id ."' LIMIT 1");
    }
}
?>