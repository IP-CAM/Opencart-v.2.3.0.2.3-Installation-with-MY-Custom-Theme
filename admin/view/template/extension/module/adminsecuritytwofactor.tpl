<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-adminsecuritytwofactor" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i><?php echo $text_edit; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-adminsecuritytwofactor" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
						<div class="col-sm-10">
							<select name="adminsecuritytwofactor_status" id="input-status" class="form-control">
							<?php if ($adminsecuritytwofactor_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
							</select>
						</div>	
					</div>
					<fieldset>
						<legend>E-mail</legend>
						<div class="form-group">
							<label class="col-sm-2 control-label" for=""><?php echo $entry_email_succes; ?></label>
							<div class="col-sm-10">
								<label class="radio-inline">
								<?php if ($adminsecuritytwofactor_email_succes) { ?>
									<input type="radio" name="adminsecuritytwofactor_email_succes" value="1" checked="checked" />
									<?php echo $text_yes; ?>
								<?php } else { ?>
									<input type="radio" name="adminsecuritytwofactor_email_succes" value="1" />
									<?php echo $text_yes; ?>
								<?php } ?>
								</label>
								<label class="radio-inline">
								<?php if (!$adminsecuritytwofactor_email_succes) { ?>
									<input type="radio" name="adminsecuritytwofactor_email_succes" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="adminsecuritytwofactor_email_succes" value="0" />
									<?php echo $text_no; ?>
								<?php } ?>
								</label>
								<?php if ($error_adminsecuritytwofactor_telegram) { ?>
								<div class="text-danger"><?php echo $error_adminsecuritytwofactor_telegram; ?></div>
								<?php } ?>
							</div>
				    	</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
							<div class="col-sm-10">
								<input type="text" name="adminsecuritytwofactor_email" value="<?php echo $adminsecuritytwofactor_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
								<?php if ($error_adminsecuritytwofactor_email) { ?>
								<div class="text-danger"><?php echo $error_adminsecuritytwofactor_email; ?></div>
								<?php } ?>
							</div>
						</div>
					</fieldset>
					<fieldset>
						<legend>Telegram</legend>
						<?php if ($get_telegram) { ?>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_telegram; ?></label>
							<div class="col-sm-10">
								<label class="radio-inline">
								<?php if ($adminsecuritytwofactor_telegram) { ?>
									<input type="radio" name="adminsecuritytwofactor_telegram" value="1" checked="checked" />
									<?php echo $text_yes; ?>
								<?php } else { ?>
									<input type="radio" name="adminsecuritytwofactor_telegram" value="1" />
									<?php echo $text_yes; ?>
								<?php } ?>
								</label>
								<label class="radio-inline">
								<?php if (!$adminsecuritytwofactor_telegram) { ?>
									<input type="radio" name="adminsecuritytwofactor_telegram" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="adminsecuritytwofactor_telegram" value="0" />
									<?php echo $text_no; ?>
								<?php } ?>
								</label>
								<?php if ($error_adminsecuritytwofactor_telegram) { ?>
								<div class="text-danger"><?php echo $error_adminsecuritytwofactor_telegram; ?></div>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-telegram"><?php echo $entry_telegram_key; ?></label>
							<div class="col-sm-10">
								<input type="text" name="adminsecuritytwofactor_telegram_key" value="<?php echo $adminsecuritytwofactor_telegram_key; ?>" placeholder="<?php echo $entry_telegram_key; ?>" id="input-telegram_key" class="form-control" />
								<?php if ($error_adminsecuritytwofactor_telegram_key) { ?>
								<div class="text-danger"><?php echo $error_adminsecuritytwofactor_telegram_key; ?></div>
								<?php } ?>
								<a target="_blank" href="https://gixoc.ru/blog/get_bot_telegram/"><h5 style="text-align:center;color:red;"><?php echo $entry_get_token; ?></h5></a>
							</div>
						</div>
						<div class="form-group" id="telegram_id">
							<label class="col-sm-2 control-label" for="input-telegram"><?php echo $entry_chat_id; ?></label>
							<div class="col-sm-7">
								<input type="text" name="adminsecuritytwofactor_chat_id" value="<?php echo $adminsecuritytwofactor_chat_id; ?>" placeholder="<?php echo $entry_chat_id; ?>" id="input-chat_id" class="form-control" />
								<?php if ($error_adminsecuritytwofactor_chat_id) { ?>
								<div class="text-danger"><?php echo $error_adminsecuritytwofactor_chat_id; ?></div>
								<?php } ?>
							</div>
							<div class="col-sm-2">
								<a id="telegram_account_info" data-toggle="tooltip" title="<?php echo $entry_chat_id_place; ?>" class="btn btn-primary"><?php echo $entry_auto; ?></a>							
							</div>
						</div>
						<?php } else {?>
						<label class="col-sm-2 control-label"><?php echo $entry_telegram; ?></label>
						<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_telegram; ?></div>
						<?php } ?>
					</fieldset>
					<fieldset>
						<legend>Viber</legend>
							<div id="viber_no_ssl" style="display: <?php if (!$ssl && !$viber_webhook) { ?>block;<?php } else { ?>none; <?php } ?>">
								<label class="col-sm-2 control-label"><?php echo $entry_viber; ?></label>
								<div class="col-sm-7 alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_viber; ?></div>
								<div class="col-sm-2" id="viber_gixoc">
									<a data-toggle="tooltip" class="btn btn-primary" <?php if (!$get_gixoc) { ?> disabled <?php } ?>><?php echo $entry_viber_gixoc; ?></a>
								</div>
							</div>
						
						<div id="viber_ssl" style="display: <?php if (!$ssl && !$viber_webhook) { ?>none;<?php } else { ?>block; <?php } ?>">
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_viber; ?></label>
							<div class="col-sm-10">
								<label class="radio-inline">
								<?php if ($adminsecuritytwofactor_viber) { ?>
									<input type="radio" name="adminsecuritytwofactor_viber" value="1" checked="checked" />
									<?php echo $text_yes; ?>
								<?php } else { ?>
									<input type="radio" name="adminsecuritytwofactor_viber" value="1" />
									<?php echo $text_yes; ?>
								<?php } ?>
								</label>
								<label class="radio-inline">
								<?php if (!$adminsecuritytwofactor_viber) { ?>
									<input type="radio" name="adminsecuritytwofactor_viber" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="adminsecuritytwofactor_viber" value="0" />
									<?php echo $text_no; ?>
								<?php } ?>
								</label>
								<?php if ($error_adminsecuritytwofactor_viber) { ?>
								<div class="text-danger"><?php echo $error_adminsecuritytwofactor_viber; ?></div>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-viber"><?php echo $entry_viber_key; ?></label>
							<div class="col-sm-10">
								<input type="text" name="adminsecuritytwofactor_viber_key" value="<?php echo $adminsecuritytwofactor_viber_key; ?>" placeholder="<?php echo $entry_viber_key; ?>" id="input-viber_key" class="form-control" />
								<?php if ($error_adminsecuritytwofactor_viber_key) { ?>
								<div class="text-danger"><?php echo $error_adminsecuritytwofactor_viber_key; ?></div>
								<?php } ?>
								<a target="_blank" href="https://gixoc.ru/blog/get_bot_viber/"><h5 style="text-align:center;"><?php echo $entry_get_token_viber; ?></h5></a>
							</div>
						</div>
						<div class="form-group" id="viber_webhook" style="display: <?php if (!$viber_webhook && $ssl) { ?>block;<?php } else { ?>none;<?php } ?>">
							<label class="col-sm-2 control-label" for="input-viber"><?php echo $button_approve; ?></label>
							<div class="col-sm-2">
								<a data-toggle="tooltip" class="btn btn-primary"><?php echo $entry_viber_reg; ?></a>
							</div>
						</div>
						<div class="form-group" id="viber_webhook_gixoc" style="display: <?php if (!$viber_webhook && !$ssl) { ?>block;<?php } else { ?>none;<?php } ?>">
							<label class="col-sm-2 control-label" for="input-viber"><?php echo $button_approve; ?></label>
							<div class="col-sm-2">
								<a data-toggle="tooltip" class="btn btn-primary"><?php echo $entry_viber_reg; ?></a>
							</div>
						</div>
						<div class="form-group" id="viber_id" style="display: <?php if ($viber_webhook) { ?>block;<?php } else { ?>none; <?php } ?>">
							<label class="col-sm-2 control-label" for="input-viber"><?php echo $entry_chat_id_viber; ?></label>
							<div class="col-sm-7">
								<input readonly type="text" name="adminsecuritytwofactor_chat_id_viber" value="<?php echo $adminsecuritytwofactor_chat_id_viber; ?>" placeholder="<?php echo $entry_chat_id_viber; ?>" id="input-chat_id_viber" class="form-control" />
								<?php if ($error_adminsecuritytwofactor_chat_id_viber) { ?>
								<div class="text-danger"><?php echo $error_adminsecuritytwofactor_chat_id_viber; ?></div>
								<?php } ?>
							</div>
							<div class="col-sm-2">
								<a id="viber_account_info" data-toggle="tooltip" title="<?php echo $entry_chat_id_place_viber; ?>" class="btn btn-primary"><?php echo $entry_auto; ?></a>
							</div>
						</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>	
	</div>
</div>
<div data-backdrop="static" id="ModalBox" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title"><?php echo $entry_wait; ?></h4>
		</div>  
      <div class="modal-body">       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_cancel; ?></button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#telegram_id').on('click', '.btn-primary', function(e) {
	key = $('#input-telegram_key').val();
	$(".modal-body").html('');
	$("#ModalBox").modal('show');
	$.ajax({
		url: 'index.php?route=extension/module/adminsecuritytwofactor/get_account_telegram&token=' + '<?php echo $token; ?>' + '&telegram_token=' + key,
		dataType: 'json',
		success: function(json) {
			if ((json['status']) == "ok") {
				$("#ModalBox").modal('hide');
				$('#input-chat_id').attr("value", json['value']);
			} 
			else {
				$(".modal-body").html(json['value']);
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}	
	});
});
$('#viber_webhook').on('click', '.btn-primary', function(e) {
	key = $('#input-viber_key').val();
	$(".modal-body").html('');
	$("#ModalBox").modal('show');
	$.ajax({	
		url: 'index.php?route=extension/module/adminsecuritytwofactor/get_set_webhook&token=' + '<?php echo $token; ?>' + '&viber_token=' + key + '&domain=' + '<?php echo $domain; ?>',
		dataType: 'json',
		success: function(json) {
			if ((json['status']) == "0") {
				$("#ModalBox").modal('hide');
				$("#viber_webhook").css("display", "none");
				$("#viber_id").css("display", "block");
			} 
			else {
				$(".modal-body").html(json['value']);
			}
		},			
		error: function(xhr, ajaxOptions, thrownError) {
			$("#ModalBox").modal('hide');
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);		
		}
	});
});
$('#viber_webhook_gixoc').on('click', '.btn-primary', function(e) {
	key = $('#input-viber_key').val();
	$(".modal-body").html('');
	$("#ModalBox").modal('show');
	$.ajax({	
		url: 'index.php?route=extension/module/adminsecuritytwofactor/get_set_webhook&token=' + '<?php echo $token; ?>' + '&viber_token=' + key + '&domain=' + '<?php echo $gixoc_viber; ?>',
		dataType: 'json',
		success: function(json) {
			if ((json['status']) == "0") {
				$("#ModalBox").modal('hide');
				$("#viber_webhook_gixoc").css("display", "none");
				$("#viber_id").css("display", "block");
			} 
			else {
				$(".modal-body").html(json['value']);
			}
		},			
		error: function(xhr, ajaxOptions, thrownError) {
			$("#ModalBox").modal('hide');
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);		
		}
	});
});
$('#viber_no_ssl').on('click', '.btn-primary', function(e) {
	$("#viber_no_ssl").css("display", "none");
	$("#viber_ssl").css("display", "block");	
});
$('#viber_id').on('click', '.btn-primary', function(e) {
	key = $('#input-viber_key').val();
	$(".modal-body").html('');
	$("#ModalBox").modal('show');
	$.ajax({
		url: 'index.php?route=extension/module/adminsecuritytwofactor/get_account_viber&token=' + '<?php echo $token; ?>' + '&viber_token=' + key,
		dataType: 'json',
		success: function(json) {
			if ((json['status']) == "0") {
				$("#ModalBox").modal('hide');
				$('#input-chat_id_viber').attr("value", json['value']);
			} 
			else {
				$(".modal-body").html(json['value']);
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}	
	});
});
//--></script>
<?php echo $footer; ?>