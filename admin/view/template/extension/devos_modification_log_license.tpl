<?php if(!empty($error_warning)){?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
	<button type="button" class="close" data-dismiss="alert">&times;</button>
</div>
<?php }?>
<?php if(!empty($license)){ ?>
	<div class="col-sm-9"><p><strong><?php echo $dml_lang_license_update_help; ?></strong></p></div>					
<?php } else { ?>				
	<div class="col-sm-9"><p><strong><?php echo $dml_lang_license_help; ?></strong></p></div>
<?php } ?>	
	<div class="col-sm-3">				
		<button type="button" id="buttom-dml-license" title="<?php echo $dml_license_button_save; ?>" class="btn btn-primary" name="activate"><?php echo $dml_license_button_save; ?></button>
	</div>


