<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-remarketing" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-remarketing" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_status" id="input-status" class="form-control">
                <?php if ($remarketing_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
		  <ul class="nav nav-tabs">
		    <li class="active"><a href="#tab-diagnostics" data-toggle="tab" class="diag"><i class="fa fa-gears"></i> <?php echo $text_diagnostics; ?> <i class="fa fa-flash"></i></a></li>
            <li><a href="#tab-google" data-toggle="tab" <?php if ($remarketing_google_status) { ?>class="enabled"<?php } ?>><i class="fa fa-google"></i> <?php echo $text_google_remarketing; ?></a></li>
            <li><a href="#tab-facebook" data-toggle="tab" <?php if ($remarketing_facebook_status) { ?>class="enabled"<?php } ?>><i class="fa fa-facebook"></i> <?php echo $text_facebook_remarketing; ?></a></li>
			<li><a href="#tab-ecommerce" data-toggle="tab" <?php if ($remarketing_ecommerce_status) { ?>class="enabled"<?php } ?>><i class="fa fa-money"></i> <?php echo $text_ecommerce; ?></a></li>
			<li><a href="#tab-google-reviews" data-toggle="tab" <?php if ($remarketing_reviews_status) { ?>class="enabled"<?php } ?>><i class="fa fa-google"></i> <?php echo $text_google_reviews; ?></a></li>
            <li><a href="#tab-events" data-toggle="tab"><i class="fa fa-bullhorn"></i> <?php echo $text_events; ?></a></li>
            <li><a href="#tab-counters" data-toggle="tab"><i class="fa fa-tachometer"></i> <?php echo $text_counters; ?></a></li>
            <li><a href="#tab-mytarget" data-toggle="tab" <?php if ($remarketing_mytarget_status) { ?>class="enabled"<?php } ?>><i class="fa fa-check"></i> <?php echo $text_mytarget_remarketing; ?></a></li>
            <li><a href="#tab-vk" data-toggle="tab" <?php if ($remarketing_vk_status) { ?>class="enabled"<?php } ?>><i class="fa fa-vk"></i> <?php echo $text_vk_remarketing; ?></a></li>
            <li><a href="#tab-instruction" data-toggle="tab"><i class="fa fa-files-o"></i> <?php echo $text_instruction; ?></a></li>
            <li><a href="#tab-help" data-toggle="tab"><i class="fa fa-life-ring"></i> <?php echo $text_help; ?></a></li>
          </ul>
		  <div class="tab-content">
            <div class="tab-pane" id="tab-google">
			<div class="">
            <div class="col-sm-12 control-label text-left" style="text-align:left;"><?php echo $text_help_google; ?></div>
            </div> 
			<legend><?php echo $text_google_remarketing; ?></legend>
			<div class="help-link"><a href="https://support.google.com/google-ads/answer/7305793?hl=ru" target="_blank"><?php echo $text_help_link; ?> Google</a></div>
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_google_status" id="input-status" class="form-control">
                <?php if ($remarketing_google_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div> 
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_google_identifier"><?php echo $entry_google_identifier; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="remarketing_google_identifier" value="<?php echo $remarketing_google_identifier; ?>" id="input-remarketing_google_identifier" class="form-control" />
                  </div>
			  </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_google_ads_identifier"><?php echo $entry_google_ads_identifier; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="remarketing_google_ads_identifier" value="<?php echo $remarketing_google_ads_identifier; ?>" id="input-remarketing_google_ads_identifier" class="form-control" />
                  </div>
		  </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_google_ads_identifier_cart"><?php echo $entry_google_ads_identifier_cart; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="remarketing_google_ads_identifier_cart" value="<?php echo $remarketing_google_ads_identifier_cart; ?>" id="input-remarketing_google_ads_identifier_cart_page" class="form-control" />
            </div>
		  </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_google_ads_identifier_cart_page"><?php echo $entry_google_ads_identifier_cart_page; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="remarketing_google_ads_identifier_cart_page" value="<?php echo $remarketing_google_ads_identifier_cart_page; ?>" id="input-remarketing_google_ads_identifier_cart_page" class="form-control" />
            </div>
		  </div>
		  <div class="form-group">
		  <label class="col-sm-2 control-label" for="input-currency"><?php echo $entry_currency; ?></label>
				<div class="col-sm-10">
			<select name="remarketing_google_currency" class="form-control">
				<?php foreach ($currencies as $currency) { ?>
				<?php if ($currency['code'] == $remarketing_google_currency) { ?>
				<option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo '(' . $currency['code'] . ') ' . $currency['title']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $currency['code']; ?>"><?php echo '(' . $currency['code'] . ') ' . $currency['title']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		 </div>
		 </div>
		    <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $text_identifier; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_google_id" id="input-status" class="form-control">
                <?php if ($remarketing_google_id == 'id') { ?>
                <option value="id" selected="selected"><?php echo $text_id; ?></option>
                <option value="model"><?php echo $text_model; ?></option>
                <?php } elseif ($remarketing_google_id == 'model')  { ?>
                <option value="id"><?php echo $text_id; ?></option>
                <option value="model" selected="selected"><?php echo $text_model; ?></option>
                <?php } else { ?>
				<option value="id" selected="selected"><?php echo $text_id; ?></option>
                <option value="model"><?php echo $text_model; ?></option>
				<?php } ?>
              </select>
            </div>
          </div> 
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_feed_status; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_google_feed_status" id="input-status" class="form-control">
                <?php if ($remarketing_google_feed_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select><br>
			  <a href="<?php echo HTTPS_CATALOG . 'index.php?route=extension/feed/google_lite';?>" target="_blank"><?php echo $entry_feed_link; ?></a>
            </div>
          </div> 
			</div>
            <div class="tab-pane" id="tab-facebook">
			<div class="">
            <div class="col-sm-12 control-label text-left" style="text-align:left;"><?php echo $text_help_facebook; ?></div>
            </div> 
			<legend><?php echo $text_facebook_remarketing; ?></legend>
			<div class="help-link"><a href="https://developers.facebook.com/docs/facebook-pixel/reference" target="_blank"><?php echo $text_help_link; ?> Facebook</a></div>
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_facebook_status" id="input-status" class="form-control">
                <?php if ($remarketing_facebook_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div> 
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_facebook_identifier"><?php echo $entry_facebook_identifier; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="remarketing_facebook_identifier" value="<?php echo $remarketing_facebook_identifier; ?>" id="input-remarketing_facebook_identifier" class="form-control" />
                  </div>
			</div>
		    <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $text_identifier; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_facebook_id" id="input-status" class="form-control">
                <?php if ($remarketing_facebook_id == 'id') { ?>
                <option value="id" selected="selected"><?php echo $text_id; ?></option>
                <option value="model"><?php echo $text_model; ?></option>
                <?php } elseif ($remarketing_facebook_id == 'model')  { ?>
                <option value="id"><?php echo $text_id; ?></option>
                <option value="model" selected="selected"><?php echo $text_model; ?></option>
                <?php } else { ?>
				<option value="id" selected="selected"><?php echo $text_id; ?></option>
                <option value="model"><?php echo $text_model; ?></option>
				<?php } ?>
              </select>
            </div>
          </div> 
		 <div class="form-group">
		  <label class="col-sm-2 control-label" for="input-currency"><?php echo $entry_currency; ?></label>
		  <div class="col-sm-10">
			<select name="remarketing_facebook_currency" class="form-control">
				<?php foreach ($currencies as $currency) { ?>
				<?php if ($currency['code'] == $remarketing_facebook_currency) { ?>
				<option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo '(' . $currency['code'] . ') ' . $currency['title']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $currency['code']; ?>"><?php echo '(' . $currency['code'] . ') ' . $currency['title']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		 </div>
		 </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-server-side"><?php echo $entry_server_side; ?></label>
            <div class="col-sm-10"> 
              <select name="remarketing_facebook_server_side" id="input-server-side" class="form-control">
                <?php if ($remarketing_facebook_server_side) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div> 
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_facebook_token"><?php echo $entry_facebook_token; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="remarketing_facebook_token" value="<?php echo $remarketing_facebook_token; ?>" id="input-remarketing_facebook_token" class="form-control" />
                  </div>
		  </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_feed_status; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_facebook_feed_status" id="input-status" class="form-control">
                <?php if ($remarketing_facebook_feed_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select><br>
			  <a href="<?php echo HTTPS_CATALOG . 'index.php?route=extension/feed/facebook_lite';?>" target="_blank"><?php echo $entry_feed_link; ?></a>
            </div>
          </div> 
		  </div>
          <div class="tab-pane" id="tab-mytarget">
          <legend><?php echo $text_mytarget_remarketing; ?></legend>
		  <div class="help-link"><a href="https://target.my.com/help/advertisers/remarketing/ru" target="_blank"><?php echo $text_help_link; ?> MyTarget</a></div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_mytarget_status" id="input-status" class="form-control">
                <?php if ($remarketing_mytarget_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div> 
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_mytarget_identifier"><?php echo $entry_mytarget_identifier; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="remarketing_mytarget_identifier" value="<?php echo $remarketing_mytarget_identifier; ?>" id="input-remarketing_mytarget_identifier" class="form-control" />
                  </div>
				  </div>
		    <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $text_identifier; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_mytarget_id" id="input-status" class="form-control">
                <?php if ($remarketing_mytarget_id == 'id') { ?>
                <option value="id" selected="selected"><?php echo $text_id; ?></option>
                <option value="model"><?php echo $text_model; ?></option>
                <?php } elseif ($remarketing_mytarget_id == 'model')  { ?>
                <option value="id"><?php echo $text_id; ?></option>
                <option value="model" selected="selected"><?php echo $text_model; ?></option>
                <?php } else { ?>
				<option value="id" selected="selected"><?php echo $text_id; ?></option>
                <option value="model"><?php echo $text_model; ?></option>
				<?php } ?>
              </select>
            </div>
          </div> 
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_feed_status; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_yandex_feed_status" id="input-status" class="form-control">
                <?php if ($remarketing_yandex_feed_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select><br>
			  <a href="<?php echo HTTPS_CATALOG . 'index.php?route=extension/feed/yandex_lite';?>" target="_blank"><?php echo $entry_feed_link; ?></a>
            </div>
          </div> 
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-currency"><?php echo $entry_currency; ?></label>
				<div class="col-sm-10">
				<select name="remarketing_yml_currency" class="form-control">
				<?php foreach ($currencies as $currency) { ?>
				<?php if ($currency['code'] == $remarketing_yml_currency) { ?>
				<option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo '(' . $currency['code'] . ') ' . $currency['title']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $currency['code']; ?>"><?php echo '(' . $currency['code'] . ') ' . $currency['title']; ?></option>
				<?php } ?>
				<?php } ?>
				</select>
				</div>
			</div>
		  </div>
          <div class="tab-pane" id="tab-vk">
          <legend><?php echo $text_vk_remarketing; ?></legend>
	   	  <div class="help-link"><a href="https://vk.com/faq12164" target="_blank"><?php echo $text_help_link; ?> Vkontakte</a></div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_vk_status" id="input-status" class="form-control">
                <?php if ($remarketing_vk_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div> 
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_vk_identifier"><?php echo $entry_vk_identifier; ?></label>
               <div class="col-sm-10">
                    <input type="text" name="remarketing_vk_identifier" value="<?php echo $remarketing_vk_identifier; ?>" id="input-remarketing_vk_identifier" class="form-control" />
               </div>
			</div>
		    <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $text_identifier; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_vk_id" id="input-status" class="form-control">
                <?php if ($remarketing_vk_id == 'id') { ?>
                <option value="id" selected="selected"><?php echo $text_id; ?></option>
                <option value="model"><?php echo $text_model; ?></option>
                <?php } elseif ($remarketing_vk_id == 'model')  { ?>
                <option value="id"><?php echo $text_id; ?></option>
                <option value="model" selected="selected"><?php echo $text_model; ?></option>
                <?php } else { ?>
				<option value="id" selected="selected"><?php echo $text_id; ?></option>
                <option value="model"><?php echo $text_model; ?></option>
				<?php } ?>
              </select>
            </div>
          </div> 
		  </div>
		  <div class="tab-pane" id="tab-google-reviews">
          <legend><?php echo $text_google_reviews; ?></legend>
		  <div class="help-link"><a href="https://support.google.com/merchants/answer/7106244" target="_blank"><?php echo $text_help_link; ?> Google</a></div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_reviews_status" id="input-status" class="form-control">
                <?php if ($remarketing_reviews_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div> 
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_google_merchant_identifier"><?php echo $entry_google_merchant_identifier; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="remarketing_google_merchant_identifier" value="<?php echo $remarketing_google_merchant_identifier; ?>" id="input-remarketing_google_merchant_identifier" class="form-control" />
                  </div>
			</div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_reviews_country"><?php echo $entry_reviews_country; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="remarketing_reviews_country" value="<?php echo $remarketing_reviews_country; ?>" id="input-remarketing_reviews_country" class="form-control" />
                  </div>
			</div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_reviews_date"><?php echo $entry_reviews_date; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="remarketing_reviews_date" value="<?php echo $remarketing_reviews_date; ?>" id="input-remarketing_reviews_date" class="form-control" />
                  </div>
			</div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_feed_status; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_reviews_feed_status" id="input-status" class="form-control">
                <?php if ($remarketing_reviews_feed_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
			  <br>
			  <a href="<?php echo HTTPS_CATALOG . 'index.php?route=extension/feed/google_reviews';?>" target="_blank"><?php echo $entry_feed_link; ?></a>
            </div>
          </div> 
		  </div>
		  <div class="tab-pane" id="tab-events">
          <legend><?php echo $text_events; ?></legend>
		  <div class="form-group">
			   <div class="col-sm-2"></div>
               <div class="col-sm-10">
				  <?php echo $text_events_help;?>
               </div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label" for="input-remarketing_events_cart"><?php echo $entry_events_cart; ?></label>
               <div class="col-sm-10">
				    <textarea name="remarketing_events_cart" rows="5" id="input-remarketing_events_cart" class="form-control"><?php echo $remarketing_events_cart; ?></textarea>
               </div>
			</div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_events_cart_add"><?php echo $entry_events_cart_add; ?></label>
               <div class="col-sm-10">
				    <textarea name="remarketing_events_cart_add" rows="5" id="input-remarketing_events_cart_add" class="form-control"><?php echo $remarketing_events_cart_add; ?></textarea>
               </div>
		  </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_events_purchase"><?php echo $entry_events_purchase; ?></label>
               <div class="col-sm-10">
				    <textarea name="remarketing_events_purchase" rows="5" id="input-remarketing_events_purchase" class="form-control"><?php echo $remarketing_events_purchase; ?></textarea>
               </div>
		  </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_events_wishlist"><?php echo $entry_events_wishlist; ?></label>
               <div class="col-sm-10">
				    <textarea name="remarketing_events_wishlist" rows="5" id="input-remarketing_events_wishlist" class="form-control"><?php echo $remarketing_events_wishlist; ?></textarea>
               </div>
		  </div>
		  </div>
		  <div class="tab-pane" id="tab-ecommerce">
		  <div class="form-group">
		  <label class="col-sm-2 control-label" for="input-currency"><?php echo $entry_currency; ?></label>
		  <div class="col-sm-10">
			<select name="remarketing_ecommerce_currency" class="form-control">
				<?php foreach ($currencies as $currency) { ?>
				<?php if ($currency['code'] == $remarketing_ecommerce_currency) { ?>
				<option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo '(' . $currency['code'] . ') ' . $currency['title']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $currency['code']; ?>"><?php echo '(' . $currency['code'] . ') ' . $currency['title']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		 </div>
		 </div>
          <legend><?php echo $text_ecommerce; ?></legend>
		  <div class="help-link"><a href="https://netpeak.net/ru/blog/kak-nastroit-rasshirennuyu-elektronnuyu-torgovlyu-s-pomoshch-yu-google-tag-manager/" target="_blank"><?php echo $text_help_link; ?> Google</a></div>
		  <div class="help-link"><a href="https://yandex.ru/support/metrica/data/e-commerce.html" target="_blank"><?php echo $text_help_link; ?> Yandex</a></div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_ecommerce_status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_ecommerce_status" id="input-remarketing_ecommerce_status" class="form-control">
                <?php if ($remarketing_ecommerce_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div> 
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_ecommerce_id"><?php echo $text_identifier; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_ecommerce_id" id="input-remarketing_ecommerce_id" class="form-control">
                <?php if ($remarketing_ecommerce_id == 'id') { ?>
                <option value="id" selected="selected"><?php echo $text_id; ?></option>
                <option value="model"><?php echo $text_model; ?></option>
                <?php } elseif ($remarketing_ecommerce_id == 'model')  { ?>
                <option value="id"><?php echo $text_id; ?></option>
                <option value="model" selected="selected"><?php echo $text_model; ?></option>
                <?php } else { ?>
				<option value="id" selected="selected"><?php echo $text_id; ?></option>
                <option value="model"><?php echo $text_model; ?></option>
				<?php } ?>
              </select>
            </div>
          </div> 
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_ecommerce_selector"><?php echo $entry_ecommerce_selector; ?></label>
               <div class="col-sm-10">
                  <input type="text" name="remarketing_ecommerce_selector" value="<?php echo $remarketing_ecommerce_selector; ?>" id="input-remarketing_ecommerce_selector" class="form-control" />
               </div>
			</div>
			<legend><?php echo $text_ecommerce_ga4; ?></legend>
			<div class="help-link"><a href="https://developers.google.com/analytics/devguides/collection/ga4/ecommerce" target="_blank"><?php echo $text_help_link; ?> Google</a></div>
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_ecommerce_ga4_status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_ecommerce_ga4_status" id="input-remarketing_ecommerce_ga4_status" class="form-control">
                <?php if ($remarketing_ecommerce_ga4_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div> 
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_ecommerce_ga4_id"><?php echo $text_identifier; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_ecommerce_ga4_id" id="input-remarketing_ecommerce_ga4_id" class="form-control">
                <?php if ($remarketing_ecommerce_ga4_id == 'id') { ?>
                <option value="id" selected="selected"><?php echo $text_id; ?></option>
                <option value="model"><?php echo $text_model; ?></option>
                <?php } elseif ($remarketing_ecommerce_ga4_id == 'model')  { ?>
                <option value="id"><?php echo $text_id; ?></option>
                <option value="model" selected="selected"><?php echo $text_model; ?></option>
                <?php } else { ?>
				<option value="id" selected="selected"><?php echo $text_id; ?></option>
                <option value="model"><?php echo $text_model; ?></option>
				<?php } ?>
              </select>
            </div>
          </div> 
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_ecommerce_ga4_selector"><?php echo $entry_ecommerce_selector; ?></label>
               <div class="col-sm-10">
                  <input type="text" name="remarketing_ecommerce_ga4_selector" value="<?php echo $remarketing_ecommerce_ga4_selector; ?>" id="input-remarketing_ecommerce_selector" class="form-control" />
               </div>
			</div>
          <legend><?php echo $text_ecommerce_measurement; ?></legend>
		  <div class="help-link"><a href="https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide?hl=ru" target="_blank"><?php echo $text_help_link; ?> Google</a></div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_ecommerce_measurement_status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_ecommerce_measurement_status" id="input-remarketing_ecommerce_measurement_status" class="form-control">
                <?php if ($remarketing_ecommerce_measurement_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div> 
          </div> 
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_ecommerce_measurement_id"><?php echo $text_identifier; ?></label>
            <div class="col-sm-10">
              <select name="remarketing_ecommerce_measurement_id" id="input-remarketing_ecommerce_measurement_id" class="form-control">
                <?php if ($remarketing_ecommerce_measurement_id == 'id') { ?>
                <option value="id" selected="selected"><?php echo $text_id; ?></option>
                <option value="model"><?php echo $text_model; ?></option>
                <?php } elseif ($remarketing_ecommerce_measurement_id == 'model')  { ?>
                <option value="id"><?php echo $text_id; ?></option>
                <option value="model" selected="selected"><?php echo $text_model; ?></option>
                <?php } else { ?>
				<option value="id" selected="selected"><?php echo $text_id; ?></option>
                <option value="model"><?php echo $text_model; ?></option>
				<?php } ?>
              </select>
            </div>
          </div> 
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_ecommerce_measurement_selector"><?php echo $entry_ecommerce_selector; ?></label>
               <div class="col-sm-10">
                  <input type="text" name="remarketing_ecommerce_measurement_selector" value="<?php echo $remarketing_ecommerce_measurement_selector; ?>" id="input-remarketing_ecommerce_measurement_selector" class="form-control" />
               </div>
			</div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_ecommerce_analytics_id"><?php echo $entry_ecommerce_analytics_id; ?></label>
               <div class="col-sm-10">
                  <input type="text" name="remarketing_ecommerce_analytics_id" value="<?php echo $remarketing_ecommerce_analytics_id; ?>" id="input-remarketing_ecommerce_analytics_id" class="form-control" />
               </div>
			</div>
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_refund_status"><?php echo $entry_refund_status; ?></label>
               <div class="col-sm-10">
                 <div class="well well-sm" style="height: 150px; overflow: auto;">
                   <?php foreach ($order_statuses as $order_status) { ?>
                   <div class="checkbox">
                     <label>
                       <?php if (in_array($order_status['order_status_id'], $remarketing_refund_status)) { ?>
                       <input type="checkbox" name="remarketing_refund_status[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
                       <?php echo $order_status['name']; ?>
                       <?php } else { ?>
                       <input type="checkbox" name="remarketing_refund_status[]" value="<?php echo $order_status['order_status_id']; ?>" />
                       <?php echo $order_status['name']; ?>
                       <?php } ?>
                     </label>
                   </div>
                   <?php } ?>
                 </div>
               </div>
             </div>
		  </div>
		  <div class="tab-pane" id="tab-counters">
		   <legend><?php echo $text_counters; ?></legend>
		   <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_counter1"><?php echo $entry_counter1; ?></label>
               <div class="col-sm-10">
				    <textarea name="remarketing_counter1" rows="10" id="input-remarketing_counter1" class="form-control"><?php echo $remarketing_counter1; ?></textarea>
               </div>
		   </div>
		   <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_counter2"><?php echo $entry_counter2; ?></label>
               <div class="col-sm-10">
				    <textarea name="remarketing_counter2" rows="10" id="input-remarketing_counter2" class="form-control"><?php echo $remarketing_counter2; ?></textarea>
               </div>
		   </div>
		   <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarketing_counter3"><?php echo $entry_counter3; ?></label>
               <div class="col-sm-10">
				    <textarea name="remarketing_counter3" rows="10" id="input-remarketing_counter3" class="form-control"><?php echo $remarketing_counter3; ?></textarea>
               </div>
		   </div>
		  </div>
		  <div class="tab-pane active" id="tab-diagnostics">
		   <legend><?php echo $text_check_config; ?></legend>
		   <div>
           <div class="col-sm-12 config-summary"><?php echo $check_config; ?></div>
		   </div>
		   <legend><?php echo $text_check_install; ?></legend>
		   <div>
           <div class="col-sm-12"><?php echo $check_install; ?></div>
		   </div>
		  </div> 
		  <div class="tab-pane" id="tab-instruction">
		   <legend><?php echo $text_instruction; ?></legend>
		   <iframe src="https://mega.freelancer.od.ua/remarketing<?php echo !$ru ? '_en' : ''; ?>.html?version=<?php echo $version; ?>&domain=<?php echo $domain; ?>" style="top:0; left:0; bottom:0; right:0; width:100%; height:600px; border:none; margin:0; padding:0; overflow:hidden; z-index:999999;"></iframe>
		  </div>
		  <div class="tab-pane" id="tab-help">
		   <legend><?php echo $text_help; ?></legend>
		   <?php echo $text_credits; ?>
		  </div>
		  </div>
        </form>
      </div>
    </div>
  </div>
</div>
<style>
.config-summary span {
	font-size:20px;
	color:#0043ff;
	font-weight:bold;
}
.summary-heading {
	font-size:20px;
	color:green;
	margin-bottom: 15px;
}
.enabled, .enabled:hover {
	background: #c7ffc7 !important;
}
.diag, .diag:hover{
    background: #00b9ff !important;
    color: #fff !important;
}
legend {
	font-size:30px;
	margin-top:15px;
}
.help-link{
	font-size: 22px;
}
.help-link a{
	color: red;
}
</style>
<?php echo $footer; ?>