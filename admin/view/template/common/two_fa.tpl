<?php echo $header; ?>
<div id="content">
  <div class="container-fluid"><br /><br />
    <div class="row">
      <div class="col-sm-offset-4 col-sm-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h1 class="panel-title"><i class="fa fa-shield"></i> <?php echo $heading_title; ?></h1>
          </div>
          <div class="panel-body">
            <?php if ($success) { ?>
            <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
              <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <?php } ?>
            <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
              <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <?php } ?>
			<p><?php echo $entry_code; ?></p>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <div class="input-group"><span class="input-group-addon"><i class="fa fa-shield"></i></span>
                  <input type="code" name="code" value="" id="input-code" class="form-control" placeholder="<?php echo $entry_code; ?>" autocomplete="off" />
                </div>
              </div>
			  <div class="pull-left">
                <a href="<?php echo $resend; ?>" class="btn btn-danger"><?php echo $button_resend; ?></a>
              </div>			  
              <div class="pull-right">
                <button type="submit" class="btn btn-primary"><i class="fa fa-key"></i> <?php echo $button_authenticate; ?></button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>