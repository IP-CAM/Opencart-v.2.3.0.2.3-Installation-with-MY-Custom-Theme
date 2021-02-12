<div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title"><?php echo $dml_text_modal_title; ?></h4>
      </div>
      <div class="modal-body">
<div class="row">
  <div class="col-md-12">
  <?php if(empty($dml_list_logs)){?>
  <?php echo $dml_text_empty_list_logs;?>
  <?php }else{?>
    <table class="table table-responsive table-hover">
      <thead>
        <tr>
          <th><?php echo $dml_text_date_time_log;?></th>
          <th><?php echo $dml_text_statistic;?></th>
        </tr>
      </thead>
      <tbody>
      <?php foreach($dml_list_logs as $log){?>
        <tr style="cursor:pointer;" onclick="loadLog(<?php echo $log['id'];?>);">
          <td><?php echo $log['date_log'];?></td>
          <td>
            <?php if($log['statistic']['count_success']>0){?>
              <span class="label label-success pull-right" data-toggle="tooltip" data-original-title="<?php echo $dml_text_count_success;?>"><?php echo $log['statistic']['count_success'];?></span>
            <?php }?>
            <?php if($log['statistic']['count_found']>0){?>
              <span class="label label-warning pull-right" data-toggle="tooltip" data-original-title="<?php echo $dml_text_count_found;?>"><?php echo $log['statistic']['count_found'];?></span>
            <?php }?>
            <?php if($log['statistic']['count_abort']>0){?>
              <span class="label label-danger pull-right" data-toggle="tooltip" data-original-title="<?php echo $dml_text_count_abort;?>"><?php echo $log['statistic']['count_abort'];?></span>
            <?php }?>
          </td>
        </tr>
      </tbody>
      <?php }?>
    </table>
  <?php }?>  
  </div>
</div>
      </div>
    </div>
  </div>
</div>
<script>
function loadLog(id){
  $('.box-list-logs .modal').modal('toggle');

  $.ajax({
      url: 'index.php',
        dataType: 'html',
        data: 'route=extension/devos_modification_log&token=<?php echo $token;?>&id='+id,
        success: function(html) {          
          
          $('#tab-dml').html(html);

        }
      });
}
  
</script> 