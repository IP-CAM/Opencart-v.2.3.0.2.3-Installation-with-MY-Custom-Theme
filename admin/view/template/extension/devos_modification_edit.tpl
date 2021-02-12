<div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title"><?php echo $dml_text_edit_modificator; ?> <strong><?php echo $modificator['name'];?></strong></h4>        
      </div>
      <div class="modal-body">
      <div class="alert alert-success hidden"><?php echo $dml_lang_text_success_save;?></div>
        <div class="alert alert-danger hidden"><?php echo $dml_lang_text_error_save;?></div>
        <div class="row">
          <div class="col-md-12">
            <form id="dml-form-save-mod-file">
              <input type="hidden" name="modification_id" value="<?php echo $modificator['modification_id'];?>">
              <div class="form-group">
                <label for="inputEmail"></label>
                <input type="text" class="form-control" name="name" value="<?php echo $modificator['name'];?>">
              </div>
              <div class="form-group">
                <label for="inputPassword"><?php echo $dml_text_modificator_xml; ?></label>
                <textarea name="xml" class="form-control" rows="15"><?php echo $modificator['xml'];?></textarea>
              </div>
              <div class="form-group text-right">
                <button type="button" class="btn btn-default dml-close-modal"><?php echo $dml_lang_text_cancel;?></button>
                <button type="button" class="btn btn-success" id="dml-save-mod-file"><?php echo $dml_lang_text_save;?></button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
