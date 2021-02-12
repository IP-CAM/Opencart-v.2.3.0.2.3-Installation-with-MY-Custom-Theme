<?php
class ModelExtensionDevosModificationLog extends Model {
	private $application = 'dml';
	private $version = '1.1';

	public function getVersion(){
		return $this->version;
	}
	public function getApplication(){
		return $this->application;
	}

	public function parseLog($log){
		$parse_log = array();
		$modification_number = 0;
		$file_number = 0;
		$search_number = 0;
		$lines_number = 0;
		$count_found = 0;
		$count_success = 0;
		$count_abort = 0;
		foreach ($log as $rows) {
			
			//начало модуля MOD
			//$modification_number = count($parse_log);
			if(strpos($rows,'MOD') === 0){
				$modification_number++;
				$parse_log[$modification_number] = array(
					'modification' => trim(substr($rows, 4)),
					'files' => array(),
					'count_found'=>0,
					'count_success'=>0,
					'count_abort' => 0
				);
				continue;
			}
			//если файл не найден FILE_NOT_FOUND
			if(strpos($rows,'FILE_NOT_FOUND') === 0){
				$file_number++;
				$parse_log[$modification_number]['count_found']++;
				$parse_log[$modification_number]['files'][$file_number] = array(
					'file' => trim(substr($rows, 15)),
					'search' => array(),
					'type' => 'FILE_NOT_FOUND',
					'count_found'=>0,
					'count_success'=>0,
					'count_abort' => 0
				);	
				continue;
			}
			//начало файла FILE
			//$file_number = count($parse_log[$modification_number]['files']);
			if(strpos($rows,'FILE:') === 0 || strpos($rows,PHP_EOL .'FILE:') === 0){
				$file_number++;
				$parse_log[$modification_number]['files'][$file_number] = array(
					'file' => trim(str_replace('FILE:','',$rows)),
					'search' => array(),
					'type' => 'FILE',
					'count_found'=>0,
					'count_success'=>0,
					'count_abort' => 0
				);	
				continue;
			}
			//обработка строки REGEX
			//$search_number = count($parse_log[$modification_number]['files'][$file_number]['search']);
			if(strpos($rows,'REGEX') === 0){
				$search_number++;
				$parse_log[$modification_number]['files'][$file_number]['search'][$search_number] = array(
					'string' => trim(substr($rows, 6)),
					'type' => 'REGEX',
					'lines' => array(),
					'count_found' => 0,
					'count_abort' => 0,
					'count_success' => 0
				);
				continue;
			}
			//обработка строки CODE
			//$search_number = count($parse_log[$modification_number]['files'][$file_number]['search']);
			if(strpos($rows,'CODE') === 0){
				$search_number++;
				if(!isset($parse_log[$modification_number]['files'][$file_number])){
					$file_number++;
					$parse_log[$modification_number]['files'][$file_number] = array(
					'file' => 'FILE NOT EXISTS',
					'search' => array(),
					'type' => 'FILE',
					'count_found'=>0,
					'count_success'=>0,
					'count_abort' => 0
					);
				}
				$parse_log[$modification_number]['files'][$file_number]['search'][$search_number] = array(
					'string' => trim(substr($rows, 5)),
					'type' => 'CODE',
					'lines' => array(),
					'count_found' => 0,
					'count_abort' => 0,
					'count_success' => 0,
					'found' => 0

				);
				continue;
			}
			//обработка строки LINE
			//$lines_number = count($parse_log[$modification_number]['files'][$file_number]['search'][$search_number]['lines']);
			if(strpos($rows,'LINE') === 0){
				/*if(!isset($parse_log[$modification_number]['files'][$file_number]['count_success'])){
					echo "<pre>";
				var_dump($parse_log);
				exit;}*/
				$lines_number++;
				$parse_log[$modification_number]['files'][$file_number]['search'][$search_number]['lines'][] = trim(substr($rows, 5));
				$parse_log[$modification_number]['count_success']++;
				
				$parse_log[$modification_number]['files'][$file_number]['count_success']++;
				$parse_log[$modification_number]['files'][$file_number]['search'][$search_number]['count_success']++;
				$count_success++;
				continue;
			}
			
			if(strpos($rows,'ABORTING!') === 0 || strpos($rows,'NOT FOUND - ABORTING!') === 0){
				//$parse_log[$modification_number]['files'][$file_number]['search'][$search_number]['aborting']++;
				$parse_log[$modification_number]['count_abort']++;
				
				$parse_log[$modification_number]['files'][$file_number]['count_abort']++;
				$parse_log[$modification_number]['files'][$file_number]['search'][$search_number]['count_abort']++;
				$count_abort++;
				continue;
			}
			if(strpos($rows,'NOT FOUND - OPERATION SKIPPED!') === 0){
				//$parse_log[$modification_number]['files'][$file_number]['search'][$search_number]['found']++;
				$parse_log[$modification_number]['count_found']++;
				$parse_log[$modification_number]['files'][$file_number]['count_found']++;
				$parse_log[$modification_number]['files'][$file_number]['search'][$search_number]['count_found']++;
				$count_found++;
				continue;
			}
			if(strpos($rows,'NOT FOUND!') === 0 || strpos($rows,'NOT FOUND - OPERATIONS ABORTED!') === 0){
				//$parse_log[$modification_number]['files'][$file_number]['search'][$search_number]['found']++;
				$parse_log[$modification_number]['count_found']++;
				$parse_log[$modification_number]['files'][$file_number]['count_found']++;
				$parse_log[$modification_number]['files'][$file_number]['search'][$search_number]['count_found']++;
				$count_found++;
				continue;
			}
		}
		$sql = "INSERT INTO " . DB_PREFIX . "dml_logs SET date_log=NOW(), statistic ='".$this->db->escape(serialize(array('count_success'=>$count_success, 'count_found' => $count_found, 'count_abort' => $count_abort)))."', logs = '".$this->db->escape(serialize($parse_log))."'";
		$this->db->query($sql);
	}
	
	public function getLastLog(){
		$sql = "SELECT * FROM " . DB_PREFIX . "dml_logs ORDER BY date_log DESC LIMIT 1";
		$query = $this->db->query($sql);
		if(isset($query->rows[0])){
			return array(
				'statistic' => unserialize($query->rows[0]['statistic']),
				'logs' => unserialize($query->rows[0]['logs']),
				'date_log' => $query->rows[0]['date_log']
				);
		}else
			array();
	}
	public function getLog($id){
		$sql = "SELECT * FROM " . DB_PREFIX . "dml_logs WHERE id=".(int)$id." ORDER BY date_log DESC LIMIT 1";
		$query = $this->db->query($sql);
		if(isset($query->rows[0])){
			return array(
				'statistic' => unserialize($query->rows[0]['statistic']),
				'logs' => unserialize($query->rows[0]['logs']),
				'date_log' => $query->rows[0]['date_log']
				);
		}else
			array();
	}
	public function getListLogs(){
		$sql = "SELECT id, date_log, statistic FROM " . DB_PREFIX . "dml_logs ORDER BY date_log DESC";
		$query = $this->db->query($sql);
		foreach ($query->rows as $key => $value) {
			$query->rows[$key]['statistic'] = unserialize($query->rows[$key]['statistic']);
		}
		return $query->rows;
	}
	public function clearLogs(){
		$sql = "DELETE FROM " . DB_PREFIX . "dml_logs WHERE 1";
		$this->db->query($sql);		
	}
	public function getTextModification($modification_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "modification WHERE modification_id=".(int)$modification_id;
		$query = $this->db->query($sql);
		if(isset($query->rows[0])){
			return $query->rows[0];
		}else
			array();
	}
	public function updateModification($data) {
		$this->db->query("UPDATE " . DB_PREFIX . "modification SET name = '" . $this->db->escape($data['name']) . "', xml = '" . $this->db->escape($data['xml']) . "' WHERE modification_id=".(int)$data['modification_id']);
	}
}