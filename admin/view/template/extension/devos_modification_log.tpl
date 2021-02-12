<div class="row">
  <div class="col-md-8">
    <h3><?php echo $dml_text_header_log;?> <?php echo $dml_row['date_log']?> <button class="btn btn-default" id="view-list-logs" onclick="loadListLogs();"><?php echo $dml_button_view_list_logs;?></button> <button class="btn btn-default" id="view-list-logs" onclick="clearLogs();"><?php echo $dml_button_clear_list_logs;?></button></h3>
  </div>
  <div class="col-md-4">
    <div class="pull-right">
      <span><?php echo $dml_lang_this_version.$dml_version;?></span>
      <span style="font-weight:bold;" id="last-version-text"></span>
      <a class="btn btn-default box-button" href="http://dev-os.ru/documentation/module-modification-log.html" target="_blank"><i class="fa fa-file"></i> <?php echo $dml_lang_url_documentation;?></a>
    </div>
  </div>
</div>
<hr>

<?php if(empty($dml_row['logs'])){?>
<div class="row">
  <?php echo $dml_text_empty_logs;?>
</div>  
<?php }else{?>  
<div class="row">
  <div class="col-md-4">
    <ul class="nav nav-pills nav-stacked">
    <?php foreach($dml_row['logs'] as $module_key =>$log_module){?>
      <li class="<?php echo ($module_key == 1)?'active':'';?>">
        <a href="#module-<?php echo $module_key;?>" data-toggle="tab">
        <?php echo $log_module['modification'];?>
        <?php if($log_module['count_success']>0){?>
          <span class="label label-success pull-right" data-toggle="tooltip" data-original-title="<?php echo $dml_text_count_success;?>"><?php echo $log_module['count_success'];?></span>
        <?php }?>
        <?php if($log_module['count_found']>0){?>
          <span class="label label-warning pull-right" data-toggle="tooltip" data-original-title="<?php echo $dml_text_count_found;?>"><?php echo $log_module['count_found'];?></span>
        <?php }?>
        <?php if($log_module['count_abort']>0){?>
          <span class="label label-danger pull-right" data-toggle="tooltip" data-original-title="<?php echo $dml_text_count_abort;?>"><?php echo $log_module['count_abort'];?></span>
        <?php }?>
        </a>
      </li>
      <?php }?>
    </ul>
  </div>
  <div class="col-md-8">  
    <div class="tab-content">
    <?php foreach($dml_row['logs'] as $module_key =>$log_module){?>
      <div id="module-<?php echo $module_key;?>" class="tab-pane <?php echo ($module_key == 1)?'active':'';?>">
        <table class="table table-responsive">
          <tbody>
            <?php foreach($log_module['files'] as $file_keu => $file){?>
            <tr class="active">
              <td>
                <?php if($file['type'] == 'FILE_NOT_FOUND'){?>
                  <strong><?php echo $dml_text_file_not_found?></strong>
                <?php }else{?>
                  <strong><?php echo $dml_text_file?></strong>
                <?php } ?>
                <?php echo $file['file']; ?>
                 <a class="pull-right" style="margin-left: 10px;cursor:pointer;" onclick="$('#file-<?php echo $file_keu;?>').toggle();return false;"><?php echo $dml_text_more;?></a>
                <?php if($file['count_success']>0){?>
                  <span class="label label-success pull-right" data-toggle="tooltip" data-original-title="<?php echo $dml_text_count_success;?>"><?php echo $file['count_success'];?></span>
                <?php }?>
                <?php if($file['count_found']>0){?>
                  <span class="label label-warning pull-right" data-toggle="tooltip" data-original-title="<?php echo $dml_text_count_found;?>"><?php echo $file['count_found'];?></span>
                <?php }?>
                <?php if($file['count_abort']>0){?>
                  <span class="label label-danger pull-right" data-toggle="tooltip" data-original-title="<?php echo $dml_text_count_abort;?>"><?php echo $file['count_abort'];?></span>
                <?php }?>
              </td>
            </tr>
            <tr id="file-<?php echo $file_keu;?>" style="display:none;">  
              <td>
                <table class="table table-responsive">
                  <thead>
                    <tr>
                      <th><?php echo $dml_text_type_search;?></th>
                      <th><?php echo $dml_text_search_row;?></th>
                      <th><?php echo $dml_text_search_result;?></th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach($file['search'] as $search_row){?>
                    <tr>
                      <td><?php echo $search_row['type'];?></td>
                      <td><code><?php echo htmlentities($search_row['string']);?></code></td>
                      <td>
                        <?php echo $dml_text_statistic;?>
                        <?php if($search_row['count_abort']>0){?>
                          <span class="label label-danger" data-toggle="tooltip" data-original-title="<?php echo $dml_text_count_abort;?>"><?php echo $search_row['count_abort'];?></span>
                        <?php }?>                        
                        <?php if($search_row['count_found']>0){?>
                          <span class="label label-warning" data-toggle="tooltip" data-original-title="<?php echo $dml_text_count_found;?>"><?php echo $search_row['count_found'];?></span>
                        <?php }?>
                        <?php if($search_row['count_success']>0){?>
                          <span class="label label-success" data-toggle="tooltip" data-original-title="<?php echo $dml_text_count_success;?>"><?php echo $search_row['count_success'];?></span>
                        <?php }?>
                        <br>
                        <?php echo $dml_text_rows;?><?php echo implode(', ',$search_row['lines']);?>  
                      </td>
                    </tr>
                    <?php }?>
                  </tbody>
                </table>
              </td>
            </tr>
            <?php }?>
          </tbody>
        </table>
      </div>
    <?php }?>
    </div>
  </div>
</div>
<?php }?> 

<script>
function loadListLogs(){
  $.ajax({
    url: 'index.php?route=extension/devos_modification_log/getListLogs&token=<?php echo $token;?>',
    method: "GET",
    dataType: 'html',
    success: function(data){
      $('.box-list-logs').html(data);
      $('.box-list-logs .modal').modal('show');
    }
  });
}
function clearLogs(){
  if(confirm('Удалить')){
    $.ajax({
      url: 'index.php?route=extension/devos_modification_log/clearLogs&token=<?php echo $token;?>',
      method: "GET",
      dataType: 'html',
      success: function(html){
        $('#tab-dml').html(html);
      }
    });
  }
}
  $(window).ready(function(){

    var dml_version ='<?php echo $dml_version;?>';
    var dml_lang_new_version = '<?php echo $dml_lang_new_version;?>';
    var dml_lang_update_error = '<?php echo $dml_lang_update_error;?>';
    var dml_lang_last_version = '<?php echo $dml_lang_last_version;?>';
    $.ajax({
      url: '<?php echo $dml_url_update;?>',
      method: "POST",
      data: "product=dml&version="+dml_version,
      dataType: 'json',
      success: function(data){
        if(Number(data.last_version) > Number(dml_version)){
          $('#last-version-text').html(dml_lang_new_version + data.last_version);
        }else{
          $('#last-version-text').html(dml_lang_last_version);
          
        }
      },
      error: function(data){
        if(Number(data.last_version) > Number(dml_version)){
          $('#last-version-text').html(dml_lang_update_error);
        }
      }
    });

  });
</script> 