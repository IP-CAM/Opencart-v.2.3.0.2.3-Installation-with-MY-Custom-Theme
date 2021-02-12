<?php
class ModelExtensionModuleXDStickers extends Model {
	public function getCustomXDSticker($xd_sticker_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "xd_stickers WHERE xd_sticker_id = '" . (int)$xd_sticker_id . "'");
		return $query->row;
	}

	public function getCustomXDStickersProduct($product_id) {
		$query = $this->db->query("SELECT `xd_sticker_id` FROM " . DB_PREFIX . "xd_stickers_product WHERE product_id = '" . (int)$product_id . "'");
		if ($query) {
			return $query->rows;
		} else {
			return false;
		}
	}

	public function getCustomXDStickers($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "xd_stickers";
		$sort_data = array(
			'name',
			'status'
		);
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY xd_sticker_id";
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
		if ($query) {
			return $query->rows;
		} else {
			return false;
		}
	}
}