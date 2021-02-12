<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="settings-form" class="btn btn-primary"
                data-toggle="tooltip" title="<?php echo $l->get('button_save'); ?>">
          <i class="fa fa-save"></i>
        </button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $l->get('button_cancel'); ?>"
           class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h2><?php echo $heading_title; ?></h2>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>

  <div class="container-fluid">
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>

    <?php if ($errors) { ?>
    <?php foreach ($errors as $error) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php } ?>
    <?php if(version_compare(VERSION, '2.3.0.0', '>=') == true) { ?>
      <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
      <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
      <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $l->get('edit_module_settings'); ?></h3>
      </div>
      <div class="panel-body">
        <ul class="nav nav-tabs">
          <?php $i = 0; ?>
            <?php foreach ($module_settings as $page_name => $setting_names) { ?>
              <li class="<?php echo ($i == 0 ? 'active' : ''); ?>">
                <a href="#tab-<?php echo $page_name; ?>" data-toggle="tab"><?php echo $l->get($page_name); ?></a>
              </li>
            <?php $i++; ?>
          <?php } ?>
        </ul>
            <form action="<?php echo $action; ?>" method="post" class="form-horizontal" id="settings-form">
              <div class="tab-content">    
                    <?php $i = 0; ?>
                    <?php foreach ($module_settings as $page_name => $setting_names) { ?>
                    <div id="tab-<?php echo $page_name; ?>" class="tab-pane <?php echo ($i == 0 ? 'active' : ''); ?>">
                      <div class="col-sm-12 bordered-tab">
                        <?php foreach ($setting_names as $setting_name) { ?>
                          <?php $setting_value = @$current_settings[$page_name][$setting_name]; ?>
                          <div class="form-group">
                            <ul class="nav nav-tabs" id="language-<?php echo $page_name; ?>">
                              <?php foreach ($languages as $language) { ?>
                              <li><a href="#language<?php echo $language['language_id']; ?>-<?php echo $page_name; ?>" data-toggle="tab"><img src="<?php echo version_compare(VERSION, '2.2.0', '>=') ? "language/{$language['code']}/{$language['code']}.png" : "view/image/flags/{$language['image']}"; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                              <?php } ?>
                            </ul>
                            <div class="tab-content">
                              <?php foreach ($languages as $language) { ?>
                              <div class="tab-pane" id="language<?php echo $language['language_id']; ?>-<?php echo $page_name; ?>">
                                <div class="form-group">
                                  <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>-<?php echo $page_name; ?>"><?php echo $entry_name; ?></label>
                                  <div class="col-sm-10">
                                    <input type="text" name="settings[<?php echo $page_name; ?>][<?php echo $language['language_id']; ?>][name]" value="<?php echo @$current_settings[$page_name][$language['language_id']]['name']; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>-<?php echo $page_name; ?>" class="form-control" />
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>-<?php echo $page_name; ?>"><?php echo $entry_description; ?></label>
                                  <div class="col-sm-10">
                                    <textarea name="settings[<?php echo $page_name; ?>][<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>-<?php echo $page_name; ?>" class="form-control summernote"><?php echo @$current_settings[$page_name][$language['language_id']]['description']; ?></textarea>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>-<?php echo $page_name; ?>"><?php echo $entry_meta_title; ?></label>
                                  <div class="col-sm-10">
                                    <input type="text" name="settings[<?php echo $page_name; ?>][<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo @$current_settings[$page_name][$language['language_id']]['meta_title']; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>-<?php echo $page_name; ?>" class="form-control" />
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>-<?php echo $page_name; ?>"><?php echo $entry_meta_description; ?></label>
                                  <div class="col-sm-10">
                                    <textarea name="settings[<?php echo $page_name; ?>][<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>-<?php echo $page_name; ?>" class="form-control"><?php echo @$current_settings[$page_name][$language['language_id']]['meta_description']; ?></textarea>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>-<?php echo $page_name; ?>"><?php echo $entry_meta_keyword; ?></label>
                                  <div class="col-sm-10">
                                    <textarea name="settings[<?php echo $page_name; ?>][<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>-<?php echo $page_name; ?>" class="form-control"><?php echo @$current_settings[$page_name][$language['language_id']]['meta_keyword']; ?></textarea>
                                  </div>
                                </div>
                              </div>
                              <?php } ?>
                            </div>
                          </div>
                          <?php if ($setting_name == 'limit_by') { ?>
                            <?php $setting_key = "settings[$page_name][$setting_name]"; ?>
                            <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $l->get('restrict_products_display_by'); ?>:</label>
                              <div class="col-sm-10">
                              <div class="radio clearfix">
                                <label class="col-sm-3">
                                  <input type="radio" name="<?php echo $setting_key; ?>" value=""
                                         <?php echo ($setting_value == "" ? 'checked' : ''); ?> >
                                  <?php echo $l->get('do_not_restrict'); ?>
                                </label>
                              </div>
                              <div class="radio clearfix">
                                <label class="col-sm-3">
                                  <input type="radio" name="<?php echo $setting_key; ?>" value="quantity" class="pull-left"
                                         <?php echo ($setting_value == "quantity" ? 'checked' : ''); ?> >
                                  <?php echo $l->get('by_quantity'); ?>
                                </label>
                                <div class="col-sm-5">
                                  <div class="input-group">
                                    <input type="number" name="settings[<?php echo $page_name; ?>][max_quantity]"
                                           value="<?php echo @$current_settings[$page_name]['max_quantity']; ?>"
                                           class="form-control text-center">
                                    <span class="input-group-addon"><?php echo $l->get('max_products_quantity'); ?></span>
                                  </div>
                                </div>
                              </div>
                              <div class="radio clearfix">
                                <label class="col-sm-3">
                                  <input type="radio" name="<?php echo $setting_key; ?>" value="last_months" class="pull-left"
                                         <?php echo ($setting_value == "last_months" ? 'checked' : ''); ?> >
                                  <?php echo $l->get('by_last_x_months'); ?>
                                </label>
                                <div class="col-sm-5">
                                  <div class="input-group">
                                    <input type="number" name="settings[<?php echo $page_name; ?>][last_x_months]"
                                           value="<?php echo @$current_settings[$page_name]['last_x_months']; ?>"
                                           class="form-control text-center">
                                    <span class="input-group-addon"><?php echo $l->get('months'); ?></span>
                                  </div>
                                </div>
                              </div>
                              </div>
                            </div>
                          <?php } ?>

                          <div class="form-group">
                            <label class="col-sm-2 control-label"><?php echo $entry_link; ?>:</label>
                            <div class="col-sm-10">
                              <a style="display:block;padding-top:9px;" href="<?php echo HTTPS_CATALOG; ?>index.php?route=product/<?php echo str_replace('-','',$page_name); ?>" target="_blank"><?php echo HTTPS_CATALOG; ?>index.php?route=product/<?php echo str_replace('-','',$page_name); ?></a>
                            </div>
                          </div>

                          <script type="text/javascript"><!--
                          <?php foreach ($languages as $language) { ?>
                            <?php if (isset($ckeditor)) { ?>
                              ckeditorInit('input-description<?php echo $language['language_id']; ?>-<?php echo $page_name; ?>', getURLVar('token'));
                            <?php } else { ?>
                              <?php if (version_compare(VERSION, '2.2.0.0', '<') == true) { ?>
                              $('#input-description<?php echo $language['language_id']; ?>-<?php echo $page_name; ?>').summernote({
                                height: 250,
                                toolbar: [
                                  ['style', ['style']], // no style button
                                  ['style', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
                                  ['fontsize', ['fontsize']],
                                ['fontname', ['fontname']],
                                  ['color', ['color']],
                                  ['para', ['ul', 'ol', 'paragraph']],
                                  ['height', ['height']], 
                                ['table', ['table']], // no table button
                                  ['insert', ['picture', 'link', 'video', 'hr']], // no insert buttons
                                ['codeview', ['fullscreen', 'codeview']] //no help button
                                ]
                              });
                            <?php } ?>
                            <?php } ?>
                          <?php } ?>
                          //--></script> 
                          <script type="text/javascript"><!--
                          $('#language-<?php echo $page_name; ?> a:first').tab('show');
                          //--></script>
                        <?php } ?>
                      </div>

                      <?php $i++; ?>
                    </div>
                    <?php } ?>
                  </div>
            </form>
            <div class="clearfix"></div>
          <div style="background: #20acda;color: #ffffff;font-size: 125%;padding: 10px;border-color: #1978ab;border-radius: 3px;margin-top: 20px;">Еще больше модулей и шаблонов для Opencart 2.x <a style="color: #fffc00;" href="https://opencart2x.ru/">на нашем сайте</a>!</div>
      </div>
    </div>
  </div>
</div>

<style>
  .bordered-tab {
    border: 1px solid #ddd;
    padding-left: 25px;
  }
</style>
<?php echo $footer; ?>
