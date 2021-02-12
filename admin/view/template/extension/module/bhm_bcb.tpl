<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h2><?php echo $heading_title; ?></h2>
			<ul class="breadcrumb"><?php foreach ($breadcrumbs as $breadcrumb) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li><?php } ?></ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading"><h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3></div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-banner" class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
						<li><a href="#tab-about" data-toggle="tab"><?php echo $tab_about; ?></a></li>
					</ul>
					<div class="tab-content">
						<div id="tab-general" class="tab-pane active">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-name"><?php echo $text_name; ?>:</label>
								<div class="col-sm-10">
									<input id="input-name" class="form-control" type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $text_name; ?>"/>
									<?php if ($error_name) { ?><div class="text-danger"><?php echo $error_name; ?></div><?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-name-block">
									<span data-toggle="tooltip" title="<?php echo $help_name_block; ?>"><?php echo $text_name_block; ?>:</span>
								</label>
								<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="<?php echo $language['flag_img']; ?>" title="<?php echo $language['name']; ?>"/></span>
											<input type="text" name="name_block[<?php echo $language['language_id']; ?>]" value="<?php echo isset($name_block[$language['language_id']]) ? $name_block[$language['language_id']] : ''; ?>" placeholder="<?php echo $text_name_block; ?>" class="form-control"/>
										</div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-type-mapping"><?php echo $text_type_mapping; ?>:</label>
								<div class="col-sm-4">
									<select id="input-type-mapping" class="form-control" name="type_mapping" onChange="SelectedTypeMapping(this)">
										<?php if ($type_mapping=="menu") { ?>
											<option value="menu" selected="selected"><?php echo $text_menu; ?></option>
											<option value="block"><?php echo $text_block; ?></option>
											<option value="carousel"><?php echo $text_carousel; ?></option>
										<?php } else if ($type_mapping=="block") { ?>
											<option value="menu"><?php echo $text_menu; ?></option>
											<option value="block" selected="selected"><?php echo $text_block; ?></option>
											<option value="carousel"><?php echo $text_carousel; ?></option>
										<?php } else { ?>
											<option value="menu"><?php echo $text_menu; ?></option>
											<option value="block"><?php echo $text_block; ?></option>
											<option value="carousel" selected="selected"><?php echo $text_carousel; ?></option>
										<?php } ?>
									</select>
								</div>
								<label id="label-type-view" class="col-sm-2 control-label" for="input-type-view"><?php echo $text_type_view; ?>:</label>
								<div id="input-type-view" class="col-sm-4">
									<select id="select-type-view" class="form-control" name="type_view" onChange="SelectedTypeView(this)">
										<option value="img" <?php if ($type_view=="img") { ?>selected="selected"<?php } ?>><?php echo $text_img; ?></option>
										<option value="img_text" <?php if ($type_view=="img_text") { ?>selected="selected"<?php } ?>><?php echo $text_img_text; ?></option>
									</select>
								</div>
							</div>
							<div id="no-image" class="form-group">
								<label class="col-sm-3 control-label" for="input-no-image"><?php echo $text_no_image; ?>:</label>
								<div class="col-sm-3">
									<select name="no_image" id="input-no-image" class="form-control" onChange="SelectedNoImage(this)">
										<?php if ($no_image) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
								<label id="label-no-image-thumb" class="col-sm-3 control-label" for="input-no-image-thumb"><?php echo $text_image_thumb; ?>:</label>
								<div id="form-no-image-thumb" class="col-sm-3">
									<a href="" data-toggle="image" class="img-thumbnail" id="input-no-image-thumb">
										<img src="<?php echo $no_image_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" style="width: 29px;"/>
									</a>
									<input type="hidden" name="no_image_img" value="<?php echo $no_image_img; ?>" id="input-no-image-img"/>
								</div>
							</div>
							<div class="form-group" id="form-input-quantity">
								<label class="col-sm-3 control-label" for="input-quantity">
									<span data-toggle="tooltip" title="<?php echo $help_quantity; ?>"><?php echo $text_quantity; ?>:</span>
								</label>
								<div class="col-sm-3">
									<input type="text" name="quantity" value="<?php echo $quantity; ?>" id="input-quantity" class="form-control" />
									<?php if ($error_quantity) { ?><div class="text-danger"><?php echo $error_quantity; ?></div><?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="input-all-brand-link">
									<span data-toggle="tooltip" title="<?php echo $help_all_brand_link; ?>"><?php echo $text_all_brand_link; ?>:</span>
								</label>
								<div class="col-sm-3">
									<select name="all_brand_link" id="input-all-brand-link" class="form-control" onChange="SelectedAllBrand(this)">
										<option value="none" <?php if ($all_brand_link=="none") { ?>selected="selected"<?php } ?>><?php echo $text_disabled; ?></option>
										<option value="text" <?php if ($all_brand_link=="text") { ?>selected="selected"<?php } ?>><?php echo $text_text; ?></option>
										<option value="img" <?php if ($all_brand_link=="img") { ?>selected="selected"<?php } ?>><?php echo $text_img; ?></option>
										<option value="img_text" <?php if ($all_brand_link=="img_text") { ?>selected="selected"<?php } ?>><?php echo $text_img_text; ?></option>
									</select>
								</div>
								<label id="label-all-brand-link-thumb" class="col-sm-3 control-label" for="input-image"><?php echo $text_image_thumb; ?>:</label>
								<div id="form-all-brand-link-thumb" class="col-sm-3">
									<a href="" data-toggle="image" class="img-thumbnail" id="input-all-brand-link-thumb">
										<img src="<?php echo $all_brand_link_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" style="width: 29px;"/>
									</a>
									<input type="hidden" name="all_brand_link_image" value="<?php echo $all_brand_link_image; ?>" id="input-all-brand-link-img" />
								</div>
							</div>
							<div class="form-group" id="form-all-brand-name">
								<label class="col-sm-2 control-label" for="input-all-brand-name"><?php echo $text_all_brand_name; ?>:</label>
								<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="<?php echo $language['flag_img']; ?>" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="all_brand_name[<?php echo $language['language_id']; ?>]" value="<?php echo isset($all_brand_name[$language['language_id']]) ? $all_brand_name[$language['language_id']] : ''; ?>" placeholder="<?php echo $text_all_brand_name; ?>" class="form-control" id="input-all-brand-name<?php echo $language['language_id']; ?>"/>
										</div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group" id="type-carousel">
								<label class="col-sm-2 control-label" for="input-type-carousel">
									<span data-toggle="tooltip" title="<?php echo $help_type_carousel; ?>"><?php echo $text_type_carousel; ?>:</span>
								</label>
								<div class="col-sm-4">
									<select name="type_carousel" id="input-type-carousel" class="form-control"  onChange="SelectedCarousel(this)">
										<option value="owlCarousel" <?php if ($type_carousel=="owlCarousel") { ?>selected="selected"<?php } ?>>owlCarousel</option>
										<option value="bxSlider" <?php if ($type_carousel=="bxSlider") { ?>selected="selected"<?php } ?>>bxSlider</option>
										<option value="Slik" <?php if ($type_carousel=="Slik") { ?>selected="selected"<?php } ?>>Slik</option>
									</select>
								</div>
								<label class="col-sm-2 control-label" for="input-orientation-carousel"><?php echo $text_orientation_carousel; ?>:</label>
								<div class="col-sm-4">
									<select name="orientation_carousel" id="input-orientation-carousel" class="form-control">
										<?php if ($orientation_carousel=="vertical") { ?>
											<option value="vertical" selected="selected"><?php echo $text_vertical; ?></option>
											<option value="horizontal"><?php echo $text_horizontal; ?></option>
										<?php } else { ?>
											<option value="vertical"><?php echo $text_vertical; ?></option>
											<option value="horizontal" selected="selected"><?php echo $text_horizontal; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group" id="config-carousel-1">
								<label class="col-sm-2 control-label" for="input-auto-carousel"><?php echo $text_auto_carousel; ?>:</label>
								<div class="col-sm-2">
									<select name="auto_carousel" id="input-auto-carousel" class="form-control" onChange="SelectedAutoCarousel(this)">
										<?php if ($auto_carousel=="true") { ?>
											<option value="true" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="false"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
											<option value="true"><?php echo $text_enabled; ?></option>
											<option value="false" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
								<label class="col-sm-2 control-label" for="input-infinite"><?php echo $text_infinite; ?>:</label>
								<div class="col-sm-2">
									<select name="infinite" id="input-infinite" class="form-control" >
										<?php if ($infinite=="true") { ?>
											<option value="true" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="false"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
											<option value="true"><?php echo $text_enabled; ?></option>
											<option value="false" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
								<label class="col-sm-2 control-label" id="label-pause-carousel" for="input-pause-carousel"><?php echo $text_pause_carousel; ?>:</label>
								<div class="col-sm-2">
									<select name="pause_carousel" id="input-pause-carousel" class="form-control" >
										<?php if ($pause_carousel=="true") { ?>
											<option value="true" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="false"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
											<option value="true"><?php echo $text_enabled; ?></option>
											<option value="false" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group" id="form-scroll-limit">
								<label class="col-sm-2 control-label" for="input-scroll-limit"><?php echo $text_scroll_limit; ?>:</label>
								<div class="col-sm-4">
									<input type="text" name="scroll_limit" value="<?php echo $scroll_limit; ?>" id="input-scroll-limit" class="form-control" />
									<?php if ($error_scroll_limit) { ?><div class="text-danger"><?php echo $error_scroll_limit; ?></div><?php } ?>
								</div>
							</div>
							<div class="form-group" id="scroll">
								<label class="col-sm-2 control-label" for="input-scroll"><?php echo $text_scroll; ?>:</label>
								<div class="col-sm-4">
									<input type="text" name="scroll" value="<?php echo $scroll; ?>" id="input-scroll" class="form-control" />
									<?php if ($error_scroll) { ?><div class="text-danger"><?php echo $error_scroll; ?></div><?php } ?>
								</div>
							</div>
							<div class="form-group" id="form-animation-speed">
								<label class="col-sm-2 control-label" for="input-animation-speed"><?php echo $text_animation_speed; ?>:</label>
								<div class="col-sm-4">
									<input type="text" name="animation_speed" value="<?php echo $animation_speed; ?>" id="input-animation-speed" class="form-control" />
									<?php if ($error_animation_speed) { ?><div class="text-danger"><?php echo $error_animation_speed; ?></div><?php } ?>
								</div>
							</div>
							<div class="form-group" id="form-interval-speed">
								<label class="col-sm-2 control-label" for="input-interval-speed"><?php echo $text_interval_speed; ?>:</label>
								<div class="col-sm-4">
									<input type="text" name="interval_speed" value="<?php echo $interval_speed; ?>" id="input-interval-speed" class="form-control" />
									<?php if ($error_interval_speed) { ?><div class="text-danger"><?php echo $error_interval_speed; ?></div><?php } ?>
								</div>
							</div>
							<div class="form-group" id="form-width">
								<label class="col-sm-2 control-label" for="input-width"><?php echo $text_width; ?>:</label>
								<div class="col-sm-4">
									<input type="text" name="width" value="<?php echo $width; ?>" id="input-width" class="form-control" />
									<?php if ($error_width) { ?><div class="text-danger"><?php echo $error_width; ?></div><?php } ?>
								</div>
							</div>
							<div class="form-group" id="form-height">
								<label class="col-sm-2 control-label" for="input-height"><?php echo $text_height; ?>:</label>
								<div class="col-sm-4">
									<input type="text" name="height" value="<?php echo $height; ?>" id="input-height" class="form-control" />
									<?php if ($error_height) { ?>	<div class="text-danger"><?php echo $error_height; ?></div><?php } ?>
								</div>
							</div>
<div style="display: none;">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="input-style"><?php echo $text_style; ?>:</label>
								<div class="col-sm-9">
									<select name="style" id="input-style" class="form-control">
										<option value="default" <?php if ($style=="default") { ?>selected="selected"<?php } ?>><?php echo $text_default_theme; ?></option>
										<option value="your_theme" <?php if ($style=="your_theme") { ?>selected="selected"<?php } ?>><?php echo $text_your_theme; ?></option>
										<option value="in_theme" <?php if ($style=="in_theme") { ?>selected="selected"<?php } ?>><?php echo $text_in_theme; ?></option>
									</select>
								</div>
							</div>

							<div class="form-group" id="form-style-carousel">
								<label class="col-sm-3 control-label" for="input-style-carousel"><?php echo $text_style_carousel; ?>:</label>
								<div class="col-sm-9">
									<select name="style_carousel" id="input-style-carousel" class="form-control">
										<option value="default" <?php if ($style_carousel=="default") { ?>selected="selected"<?php } ?>><?php echo $text_default_theme; ?></option>
										<option value="your_theme" <?php if ($style_carousel=="your_theme") { ?>selected="selected"<?php } ?>><?php echo $text_your_theme; ?></option>
										<option value="in_theme" <?php if ($style_carousel=="in_theme") { ?>selected="selected"<?php } ?>><?php echo $text_in_theme; ?></option>
									</select>
								</div>
							</div>
</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-status"><?php echo $text_status; ?>:</label>
								<div class="col-sm-10">
									<select name="status" id="input-status" class="form-control">
										<?php if ($status) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
						</div>
						<div id="tab-about" class="tab-pane">
							<?php echo $support_version; ?> <b><?php echo $main_version; ?>.<?php echo $sub_version; ?></b> <br />
							<?php echo $support_text; ?>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
<!-- On Load Page //-->
	window.onload = function() {
		var mapping = document.getElementById("input-type-mapping");
		SelectedTypeMapping(mapping);
	}
<!-- Показывать производителей без лого //-->
	function SelectedNoImage(a) {
		var label = a.value;
		if (label=="1") {
			$("#input-no-image-img").prop('disabled', false);
			document.getElementById("label-no-image-thumb").style.display='block';
			document.getElementById("form-no-image-thumb").style.display='block';
		} else {
			$("#input-no-image-img").prop('disabled', true);
			document.getElementById("label-no-image-thumb").style.display='none';
			document.getElementById("form-no-image-thumb").style.display='none';
		}
	}
<!-- Ссылка на страницу "Все производители" //-->
	function SelectedAllBrand(a) {
		var label = a.value;
		if (label=="text") {
			document.getElementById("label-all-brand-link-thumb").style.display='none';
			document.getElementById("form-all-brand-link-thumb").style.display='none';
			document.getElementById("form-all-brand-name").style.display='block';
			$("#input-all-brand-link-img").prop('disabled', true);
			$("#input-all-brand-link-thumb").prop('style', 'pointer-events: none;');
			<?php foreach ($languages as $language) { ?>
				$('#input-all-brand-name<?php echo $language['language_id']; ?>').prop('disabled', false);
			<?php } ?>
		} else if (label=="img") {
			document.getElementById("label-all-brand-link-thumb").style.display='block';
			document.getElementById("form-all-brand-link-thumb").style.display='block';
			document.getElementById("form-all-brand-name").style.display='block';
			$("#input-all-brand-link-img").prop('disabled', false);
			$("#input-all-brand-link-thumb").prop('style', false);
			<?php foreach ($languages as $language) { ?>
				$('#input-all-brand-name<?php echo $language['language_id']; ?>').prop('disabled', false);
			<?php } ?>
		} else if (label=="img_text") {
			document.getElementById("label-all-brand-link-thumb").style.display='block';
			document.getElementById("form-all-brand-link-thumb").style.display='block';
			document.getElementById("form-all-brand-name").style.display='block';
			$("#input-all-brand-link-img").prop('disabled', false);
			$("#input-all-brand-link-thumb").prop('style', false);
			<?php foreach ($languages as $language) { ?>
				$('#input-all-brand-name<?php echo $language['language_id']; ?>').prop('disabled', false);
			<?php } ?>
		} else {
			document.getElementById("label-all-brand-link-thumb").style.display='none';
			document.getElementById("form-all-brand-link-thumb").style.display='none';
			document.getElementById("form-all-brand-name").style.display='none';
			$("#input-all-brand-link-img").prop('disabled', true);
			$("#input-all-brand-link-thumb").prop('style', 'pointer-events: none;');
			<?php foreach ($languages as $language) { ?>
				$('#input-all-brand-name<?php echo $language['language_id']; ?>').prop('disabled', 'disabled');
			<?php } ?>
		}
	}
<!-- Показывать как //-->
	function SelectedTypeView(a) {
		var label = a.value;
		var all_brand_link = document.getElementById("input-all-brand-link");
		var all_brand_link_value = all_brand_link.value;
		if (label=="img") {
			if (all_brand_link_value=="img_text") {
				document.getElementById("input-all-brand-link").value = "none";
			}
			$("#input-all-brand-link option[value='img']").attr('disabled', false);
			$("#input-all-brand-link option[value='img_text']").attr('disabled', true);
		} else {
			if (all_brand_link_value=="img") {
				document.getElementById("input-all-brand-link").value = "none";
			}
			$("#input-all-brand-link option[value='img']").attr('disabled', true);
			$("#input-all-brand-link option[value='img_text']").attr('disabled', false);
		}
		SelectedAllBrand(all_brand_link);
	}
<!-- //-->
	function SelectedTypeMapping(a) {
		var label = a.value;
		var type_view = document.getElementById("input-type-view");
		var no_image = document.getElementById("input-no-image");
		var all_brand_link = document.getElementById("input-all-brand-link");
		var all_brand_link_value = all_brand_link.value;
		var type_view = document.getElementById("select-type-view");
		var carousel = document.getElementById("input-type-carousel");
		if (label=="menu" || label=="block") {
			if (label=="menu") {
				$("#select-type-view").prop('disabled', true);
				document.getElementById("label-type-view").style.display='none';
				document.getElementById("input-type-view").style.display='none';
				document.getElementById("no-image").style.display='none';
				$("#input-no-image").prop('disabled', true);
				SelectedNoImage(0);
				if (all_brand_link_value=="img_text" || all_brand_link_value=="img") {
					document.getElementById("input-all-brand-link").value = "none";
				}
				$("#input-all-brand-link option[value='img']").attr('disabled', true);
				$("#input-all-brand-link option[value='img_text']").attr('disabled', true);
				SelectedAllBrand(all_brand_link);
				document.getElementById("form-width").style.display='none';
				$("#input-width").prop('disabled', true);
				document.getElementById("form-height").style.display='none';
				$("#input-height").prop('disabled', true);
			} else if (label=="block") {
				$("#select-type-view").prop('disabled', false);
				document.getElementById("label-type-view").style.display='block';
				document.getElementById("input-type-view").style.display='block';
				document.getElementById("no-image").style.display='block';
				$("#input-no-image").prop('disabled', false);
				SelectedNoImage(no_image);
				SelectedTypeView(type_view);
				document.getElementById("form-width").style.display='block';
				$("#input-width").prop('disabled', false);
				document.getElementById("form-height").style.display='block';
				$("#input-height").prop('disabled', false);
			}
			$("#input-quantity").prop('disabled', false);
			document.getElementById("form-input-quantity").style.display='block';
			document.getElementById("type-carousel").style.display='none';
			$("#input-type-carousel").prop('disabled', true);
			$("#input-orientation-carousel").prop('disabled', true);
			document.getElementById("config-carousel-1").style.display='none';
			$("#input-auto-carousel").prop('disabled', true);
			$("#input-infinite").prop('disabled', true);
			$("#input-pause-carousel").prop('disabled', true);
			document.getElementById("form-scroll-limit").style.display='none';
			$("#input-scroll-limit").prop('disabled', true);
			document.getElementById("form-animation-speed").style.display='none';
			$("#input-animation-speed").prop('disabled', true);
			document.getElementById("form-interval-speed").style.display='none';
			$("#input-interval-speed").prop('disabled', true);
			document.getElementById("scroll").style.display='none';
			$("#input-scroll").prop('disabled', true);
			document.getElementById("form-style-carousel").style.display='none';
			$("#input-style-carousel").prop('disabled', true);
		} else {
			$("#select-type-view").prop('disabled', false);
			document.getElementById("label-type-view").style.display='block';
			document.getElementById("input-type-view").style.display='block';
			document.getElementById("no-image").style.display='block';
			$("#input-no-image").prop('disabled', false);
			SelectedNoImage(no_image);
			$("#input-quantity").prop('disabled', true);
			document.getElementById("form-input-quantity").style.display='none';
			SelectedTypeView(type_view);
			document.getElementById("type-carousel").style.display='block';
			$("#input-type-carousel").prop('disabled', false);
			$("#input-orientation-carousel").prop('disabled', false);
			document.getElementById("config-carousel-1").style.display='block';
			$("#input-auto-carousel").prop('disabled', false);
			$("#input-infinite").prop('disabled', false);
			document.getElementById("form-scroll-limit").style.display='block';
			$("#input-scroll-limit").prop('disabled', false);
			document.getElementById("form-animation-speed").style.display='block';
			$("#input-animation-speed").prop('disabled', false);
			document.getElementById("form-interval-speed").style.display='block';
			$("#input-interval-speed").prop('disabled', false);
			document.getElementById("scroll").style.display='block';
			$("#input-scroll").prop('disabled', false);
			document.getElementById("form-width").style.display='block';
			$("#input-width").prop('disabled', false);
			document.getElementById("form-height").style.display='block';
			$("#input-height").prop('disabled', false);
			document.getElementById("form-style-carousel").style.display='block';
			$("#input-style-carousel").prop('disabled', false);
			SelectedCarousel(carousel);
		}
	}
	function SelectedCarousel(a) {
		var label = a.value;
		var auto_carousel = document.getElementById("input-auto-carousel");
		if (label == 'owlCarousel') {
			document.getElementById("input-orientation-carousel").value = "horizontal";
			$("#input-orientation-carousel option[value='vertical']").attr('disabled', true);
			document.getElementById("scroll").style.display='none';
			$("#input-scroll").prop('disabled', true);
		} else {
			$("#input-orientation-carousel option[value='vertical']").attr('disabled', false);
			document.getElementById("scroll").style.display='block';
			$("#input-scroll").prop('disabled', false);
		}
		SelectedAutoCarousel(auto_carousel);
	}
	function SelectedAutoCarousel(a) {
		var label = a.value;
		if (label=='true') { 
			$("#input-pause-carousel").prop('disabled', false);
			document.getElementById("label-pause-carousel").style.display='block';
			document.getElementById("input-pause-carousel").style.display='block';
			$("#input-interval-speed").prop('disabled', false);
			document.getElementById("form-interval-speed").style.display='block';
		} else {
			$("#input-pause-carousel").prop('disabled', true);
			document.getElementById("label-pause-carousel").style.display='none';
			document.getElementById("input-pause-carousel").style.display='none';
			$("#input-interval-speed").prop('disabled', true);
			document.getElementById("form-interval-speed").style.display='none';
		}
	}
		
</script>

<?php echo $footer; ?>
