<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-buyoneclick" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1 style="display:block;"><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div id="xd_stickers_block" class="container-fluid">
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
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#tab_settings"><?php echo $text_tab_settings; ?></a></li>
				<li><a data-toggle="tab" href="#tab_auto_stickers"><?php echo $text_tab_auto_stickers; ?></a></li>
				<li><a data-toggle="tab" href="#tab_custom"><?php echo $text_tab_custom; ?></a></li>
				<li><a data-toggle="tab" href="#tab_bulk_custom"><?php echo $text_tab_bulk_custom; ?></a></li>
			</ul>
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-html" class="form-horizontal">
				<div class="tab-content">
					<div class="tab-pane active" id="tab_settings">
						<div class="lead well well-sm text-info">
							<strong><?php echo $text_tab_settings_title; ?></strong>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<div class="form-group">
									<label class="col-sm-4 control-label"><?php echo $entry_xd_stickers_position; ?></label>
									<div class="col-sm-8">
										<select name="xd_stickers[position]" class="form-control">
											<?php if ($xd_stickers['position']) { ?>
												<option value="1" selected="selected"><?php echo $text_topright; ?></option>
												<option value="0"><?php echo $text_topleft; ?></option>
											<?php } else { ?>
												<option value="1"><?php echo $text_topright; ?></option>
												<option value="0" selected="selected"><?php echo $text_topleft; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label"><?php echo $entry_xd_stickers_status; ?></label>
									<div class="col-sm-8">
										<select name="xd_stickers[status]" class="form-control">
											<?php if ($xd_stickers['status']) { ?>
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
						</div>
					</div>
					<div class="tab-pane" id="tab_auto_stickers">
						<div class="h2 text-info" style="margin-bottom:0;">
							<strong><?php echo $text_tab_sold_title; ?></strong>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<table id="xd_stickers_sold" class="table table-striped table-bordered">
									<thead>
										<tr>
											<td class="text-left" style="width: 25%;"><?php echo $entry_sticker_text; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_color; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_bg; ?></td>
											<td class="text-left" style="width: 20%;"></td>
											<td class="text-right" style="width: 15%;"><?php echo $entry_sticker_status; ?></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-left" style="width: 25%;">
												<?php foreach ($languages as $language) { ?>
													<div class="input-group pull-left">
														<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
														<input type="text" name="xd_stickers[sold][text][<?php echo $language['language_id']; ?>]" value="<?php echo isset($xd_stickers['sold']['text'][$language['language_id']]) ? $xd_stickers['sold']['text'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_sticker_text; ?>" class="form-control" />
													</div>
												<?php } ?>
											</td>
											<td class="text-left" style="width: 20%;">
												<div class="color_input">
													<div class="input-group">
														<span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style="color:<?php echo $xd_stickers['sold']['color']; ?>;"></i></span>
														<input type="text" name="xd_stickers[sold][color]" value="<?php echo isset($xd_stickers['sold']['color']) ? $xd_stickers['sold']['color'] : ''; ?>" class="form-control col-xs-8" />
													</div>
												</div>
											</td>
											<td class="text-left" style="width: 20%;">
												<div class="color_input">
													<div class="input-group">
														<span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style="color:<?php echo $xd_stickers['sold']['bg']?>;"></i></span>
														<input type="text" name="xd_stickers[sold][bg]" value="<?php echo isset($xd_stickers['sold']['bg']) ? $xd_stickers['sold']['bg'] : ''; ?>" class="form-control col-xs-8" />
													</div>
												</div>
											</td>
											<td>
											</td>
											<td class="text-right" style="width: 15%;">
												<select name="xd_stickers[sold][status]" class="form-control">
													<?php if ($xd_stickers['sold']['status']) { ?>
														<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
														<option value="0"><?php echo $text_disabled; ?></option>
													<?php } else { ?>
														<option value="1"><?php echo $text_enabled; ?></option>
														<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
													<?php } ?>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="h2 text-info" style="margin-bottom:0;">
							<strong><?php echo $text_tab_sale_title; ?></strong>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<table id="xd_stickers_sale" class="table table-striped table-bordered">
									<thead>
										<tr>
											<td class="text-left" style="width: 25%;"><?php echo $entry_sticker_text; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_color; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_bg; ?></td>
											<td class="text-left" style="width: 20%;"></td>
											<td class="text-right" style="width: 15%;"><?php echo $entry_sticker_status; ?></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-left" style="width: 25%;">
												<?php foreach ($languages as $language) { ?>
													<div class="input-group pull-left">
														<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
														<input type="text" name="xd_stickers[sale][text][<?php echo $language['language_id']; ?>]" value="<?php echo isset($xd_stickers['sale']['text'][$language['language_id']]) ? $xd_stickers['sale']['text'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_sticker_text; ?>" class="form-control" />
													</div>
												<?php } ?>
											</td>
											<td class="text-left" style="width: 20%;">
												<div class="color_input">
													<div class="input-group">
														<span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style="color:<?php echo $xd_stickers['sale']['color']; ?>;"></i></span>
														<input type="text" name="xd_stickers[sale][color]" value="<?php echo isset($xd_stickers['sale']['color']) ? $xd_stickers['sale']['color'] : ''; ?>" class="form-control col-xs-8" />
													</div>
												</div>
											</td>
											<td class="text-left" style="width: 20%;">
												<div class="color_input">
													<div class="input-group">
														<span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style="color:<?php echo $xd_stickers['sale']['bg']?>;"></i></span>
														<input type="text" name="xd_stickers[sale][bg]" value="<?php echo isset($xd_stickers['sale']['bg']) ? $xd_stickers['sale']['bg'] : ''; ?>" class="form-control col-xs-8" />
													</div>
												</div>
											</td>
											<td>
											</td>
											<td class="text-right" style="width: 15%;">
												<select name="xd_stickers[sale][status]" class="form-control">
													<?php if ($xd_stickers['sale']['status']) { ?>
														<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
														<option value="0"><?php echo $text_disabled; ?></option>
													<?php } else { ?>
														<option value="1"><?php echo $text_enabled; ?></option>
														<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
													<?php } ?>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="h2 text-info" style="margin-bottom:0;">
							<strong><?php echo $text_tab_bestseller_title; ?></strong>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<table id="xd_stickers_bestseller" class="table table-striped table-bordered">
									<thead>
										<tr>
											<td class="text-left" style="width: 25%;"><?php echo $entry_sticker_text; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_color; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_bg; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_bestseller_property; ?></td>
											<td class="text-right" style="width: 15%;"><?php echo $entry_sticker_status; ?></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-left" style="width: 25%;">
												<?php foreach ($languages as $language) { ?>
													<div class="input-group pull-left">
														<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
														<input type="text" name="xd_stickers[bestseller][text][<?php echo $language['language_id']; ?>]" value="<?php echo isset($xd_stickers['bestseller']['text'][$language['language_id']]) ? $xd_stickers['bestseller']['text'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_sticker_text; ?>" class="form-control" />
													</div>
												<?php } ?>
											</td>
											<td class="text-left" style="width: 20%;">
												<div class="color_input">
													<div class="input-group">
														<span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style="color:<?php echo $xd_stickers['bestseller']['color']; ?>;"></i></span>
														<input type="text" name="xd_stickers[bestseller][color]" value="<?php echo isset($xd_stickers['bestseller']['color']) ? $xd_stickers['bestseller']['color'] : ''; ?>" class="form-control col-xs-8" />
													</div>
												</div>
											</td>
											<td class="text-left" style="width: 20%;">
												<div class="color_input">
													<div class="input-group">
														<span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style="color:<?php echo $xd_stickers['bestseller']['bg']?>;"></i></span>
														<input type="text" name="xd_stickers[bestseller][bg]" value="<?php echo isset($xd_stickers['bestseller']['bg']) ? $xd_stickers['bestseller']['bg'] : ''; ?>" class="form-control col-xs-8" />
													</div>
												</div>
											</td>
											<td class="text-left" style="width: 20%;">
												<input type="text" name="xd_stickers[bestseller][property]" value="<?php echo isset($xd_stickers['bestseller']['property']) ? $xd_stickers['bestseller']['property'] : ''; ?>" class="form-control" />
											</td>
											<td class="text-right" style="width: 15%;">
												<select name="xd_stickers[bestseller][status]" class="form-control">
													<?php if ($xd_stickers['bestseller']['status']) { ?>
														<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
														<option value="0"><?php echo $text_disabled; ?></option>
													<?php } else { ?>
														<option value="1"><?php echo $text_enabled; ?></option>
														<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
													<?php } ?>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="h2 text-info" style="margin-bottom:0;">
							<strong><?php echo $text_tab_novelty_title; ?></strong>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<table id="xd_stickers_novelty" class="table table-striped table-bordered">
									<thead>
										<tr>
											<td class="text-left" style="width: 25%;"><?php echo $entry_sticker_text; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_color; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_bg; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_novelty_property; ?></td>
											<td class="text-right" style="width: 15%;"><?php echo $entry_sticker_status; ?></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-left" style="width: 25%;">
												<?php foreach ($languages as $language) { ?>
													<div class="input-group pull-left">
														<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
														<input type="text" name="xd_stickers[novelty][text][<?php echo $language['language_id']; ?>]" value="<?php echo isset($xd_stickers['novelty']['text'][$language['language_id']]) ? $xd_stickers['novelty']['text'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_sticker_text; ?>" class="form-control" />
													</div>
												<?php } ?>
											</td>
											<td class="text-left" style="width: 20%;">
												<div class="color_input">
													<div class="input-group">
														<span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style="color:<?php echo $xd_stickers['novelty']['color']; ?>;"></i></span>
														<input type="text" name="xd_stickers[novelty][color]" value="<?php echo isset($xd_stickers['novelty']['color']) ? $xd_stickers['novelty']['color'] : ''; ?>" class="form-control col-xs-8" />
													</div>
												</div>
											</td>
											<td class="text-left" style="width: 20%;">
												<div class="color_input">
													<div class="input-group">
														<span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style="color:<?php echo $xd_stickers['novelty']['bg']?>;"></i></span>
														<input type="text" name="xd_stickers[novelty][bg]" value="<?php echo isset($xd_stickers['novelty']['bg']) ? $xd_stickers['novelty']['bg'] : ''; ?>" class="form-control col-xs-8" />
													</div>
												</div>
											</td>
											<td class="text-left" style="width: 20%;">
												<input type="text" name="xd_stickers[novelty][property]" value="<?php echo isset($xd_stickers['novelty']['property']) ? $xd_stickers['novelty']['property'] : ''; ?>" class="form-control" />
											</td>
											<td class="text-right" style="width: 15%;">
												<select name="xd_stickers[novelty][status]" class="form-control">
													<?php if ($xd_stickers['novelty']['status']) { ?>
														<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
														<option value="0"><?php echo $text_disabled; ?></option>
													<?php } else { ?>
														<option value="1"><?php echo $text_enabled; ?></option>
														<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
													<?php } ?>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="h2 text-info" style="margin-bottom:0;">
							<strong><?php echo $text_tab_last_title; ?></strong>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<table id="xd_stickers_last" class="table table-striped table-bordered">
									<thead>
										<tr>
											<td class="text-left" style="width: 25%;"><?php echo $entry_sticker_text; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_color; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_bg; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_last_property; ?></td>
											<td class="text-right" style="width: 15%;"><?php echo $entry_sticker_status; ?></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-left" style="width: 25%;">
												<?php foreach ($languages as $language) { ?>
													<div class="input-group pull-left">
														<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
														<input type="text" name="xd_stickers[last][text][<?php echo $language['language_id']; ?>]" value="<?php echo isset($xd_stickers['last']['text'][$language['language_id']]) ? $xd_stickers['last']['text'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_sticker_text; ?>" class="form-control" />
													</div>
												<?php } ?>
											</td>
											<td class="text-left" style="width: 20%;">
												<div class="color_input">
													<div class="input-group">
														<span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style="color:<?php echo $xd_stickers['last']['color']; ?>;"></i></span>
														<input type="text" name="xd_stickers[last][color]" value="<?php echo isset($xd_stickers['last']['color']) ? $xd_stickers['last']['color'] : ''; ?>" class="form-control col-xs-8" />
													</div>
												</div>
											</td>
											<td class="text-left" style="width: 20%;">
												<div class="color_input">
													<div class="input-group">
														<span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style="color:<?php echo $xd_stickers['last']['bg']?>;"></i></span>
														<input type="text" name="xd_stickers[last][bg]" value="<?php echo isset($xd_stickers['last']['bg']) ? $xd_stickers['last']['bg'] : ''; ?>" class="form-control col-xs-8" />
													</div>
												</div>
											</td>
											<td class="text-left" style="width: 20%;">
												<input type="text" name="xd_stickers[last][property]" value="<?php echo isset($xd_stickers['last']['property']) ? $xd_stickers['last']['property'] : ''; ?>" class="form-control" />
											</td>
											<td class="text-right" style="width: 15%;">
												<select name="xd_stickers[last][status]" class="form-control">
													<?php if ($xd_stickers['last']['status']) { ?>
														<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
														<option value="0"><?php echo $text_disabled; ?></option>
													<?php } else { ?>
														<option value="1"><?php echo $text_enabled; ?></option>
														<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
													<?php } ?>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="h2 text-info" style="margin-bottom:0;">
							<strong><?php echo $text_tab_freeshipping_title; ?></strong>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<table id="xd_stickers_freeshipping" class="table table-striped table-bordered">
									<thead>
										<tr>
											<td class="text-left" style="width: 25%;"><?php echo $entry_sticker_text; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_color; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_bg; ?></td>
											<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_freeshipping_property; ?></td>
											<td class="text-right" style="width: 15%;"><?php echo $entry_sticker_status; ?></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-left" style="width: 25%;">
												<?php foreach ($languages as $language) { ?>
													<div class="input-group pull-left">
														<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
														<input type="text" name="xd_stickers[freeshipping][text][<?php echo $language['language_id']; ?>]" value="<?php echo isset($xd_stickers['freeshipping']['text'][$language['language_id']]) ? $xd_stickers['freeshipping']['text'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_sticker_text; ?>" class="form-control" />
													</div>
												<?php } ?>
											</td>
											<td class="text-left" style="width: 20%;">
												<div class="color_input">
													<div class="input-group">
														<span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style="color:<?php echo $xd_stickers['freeshipping']['color']; ?>;"></i></span>
														<input type="text" name="xd_stickers[freeshipping][color]" value="<?php echo isset($xd_stickers['freeshipping']['color']) ? $xd_stickers['freeshipping']['color'] : ''; ?>" class="form-control col-xs-8" />
													</div>
												</div>
											</td>
											<td class="text-left" style="width: 20%;">
												<div class="color_input">
													<div class="input-group">
														<span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style="color:<?php echo $xd_stickers['freeshipping']['bg']?>;"></i></span>
														<input type="text" name="xd_stickers[freeshipping][bg]" value="<?php echo isset($xd_stickers['freeshipping']['bg']) ? $xd_stickers['freeshipping']['bg'] : ''; ?>" class="form-control col-xs-8" />
													</div>
												</div>
											</td>
											<td class="text-left" style="width: 20%;">
												<input type="text" name="xd_stickers[freeshipping][property]" value="<?php echo isset($xd_stickers['freeshipping']['property']) ? $xd_stickers['freeshipping']['property'] : ''; ?>" class="form-control" />
											</td>
											<td class="text-right" style="width: 15%;">
												<select name="xd_stickers[freeshipping][status]" class="form-control">
													<?php if ($xd_stickers['freeshipping']['status']) { ?>
														<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
														<option value="0"><?php echo $text_disabled; ?></option>
													<?php } else { ?>
														<option value="1"><?php echo $text_enabled; ?></option>
														<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
													<?php } ?>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tab_custom">
						<div class="h2 text-info" style="margin-bottom:0;">
							<strong><?php echo $text_tab_custom_title; ?></strong>
						</div>
						<div class="form-group">
							<div class="col-sm-12">

									<table id="xd_stickers_custom" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_title; ?></td>
												<td class="text-left" style="width: 25%;"><?php echo $entry_sticker_text; ?></td>
												<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_color; ?></td>
												<td class="text-left" style="width: 20%;"><?php echo $entry_sticker_bg; ?></td>
												<td class="text-right" style="width: 10%;"><?php echo $entry_sticker_status; ?></td>
												<td class="text-right" style="width: 5%;"></td>
											</tr>
										</thead>
										<tbody>
											<?php $custom_xd_sticker['xd_sticker_id'] = 0; ?>
											<?php foreach ($custom_xd_stickers as $custom_xd_sticker) { ?>
												<tr id="custom_xd_sticker-row<?php echo $custom_xd_sticker['xd_sticker_id']; ?>">
													<td class="hidden"><input type="hidden" name="custom_xd_sticker[<?php echo $custom_xd_sticker['xd_sticker_id']; ?>][xd_sticker_id]" value="<?php echo $custom_xd_sticker['xd_sticker_id']; ?>" class="hidden" /></td>
													<td class="text-left" style="width: 20%;">
														<input type="text" name="custom_xd_sticker[<?php echo $custom_xd_sticker['xd_sticker_id']; ?>][name]" value="<?php echo $custom_xd_sticker['name']; ?>" placeholder="<?php echo $entry_custom_xd_stickers_title; ?>" class="form-control" />
													</td>
													<td class="text-left" style="width: 25%;">
														<?php foreach ($languages as $language) { ?>
															<div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
																<input type="text" name="custom_xd_sticker[<?php echo $custom_xd_sticker['xd_sticker_id']; ?>][text][<?php echo $language['language_id']; ?>]" value="<?php echo isset($custom_xd_sticker['text'][$language['language_id']]) ? $custom_xd_sticker['text'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_sticker_text; ?>" class="form-control" />
															</div>
														<?php } ?>
													</td>
													<td class="text-left" style="width: 20%;">
														<div class="color_input">
															<div class="input-group">
																<span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style="color:<?php echo $custom_xd_sticker['color_color']; ?>;"></i></span>
																<input type="text" value="<?php echo $custom_xd_sticker['color_color']; ?>" class="form-control" name="custom_xd_sticker[<?php echo $custom_xd_sticker['xd_sticker_id']; ?>][color_color]" />
															</div>
														</div>
													</td>
													<td class="text-left" style="width: 20%;">
														<div class="color_input">
															<div class="input-group">
																<span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style="color:<?php echo $custom_xd_sticker['bg_color']; ?>;"></i></span>
																<input type="text" value="<?php echo $custom_xd_sticker['bg_color']; ?>" class="form-control" name="custom_xd_sticker[<?php echo $custom_xd_sticker['xd_sticker_id']; ?>][bg_color]" />
															</div>
														</div>
													</td>
													<td class="text-right" style="width: 10%;">
														<select name="custom_xd_sticker[<?php echo $custom_xd_sticker['xd_sticker_id']; ?>][status]" class="form-control">
															<?php if ($custom_xd_sticker['status']) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
															<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
															<?php } ?>
														</select>
													</td>
													<td class="text-right" style="width: 5%;">
														<button type="button" onclick="removeCustomXDSticker(<?php echo $custom_xd_sticker['xd_sticker_id']; ?>)" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger">
															<i class="fa fa-minus-circle"></i>
														</button>
													</td>
												</tr>
											<?php $custom_xd_sticker['xd_sticker_id']++; ?>
											<?php } ?>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="5"></td>
												<td class="text-right">
													<button type="button" onclick="addCustomXDSticker();" data-toggle="tooltip" title="<?php echo $button_custom_xd_sticker_add; ?>" class="btn btn-primary">
														<i class="fa fa-plus-circle"></i>
													</button>
												</td>
											</tr>
										</tfoot>
									</table>

							</div>
						</div>
					</div>
					<div class="tab-pane" id="tab_bulk_custom">
						<div class="h2 text-info" style="margin-bottom:0;">
							<strong><?php echo $text_tab_bulk_custom_title; ?></strong>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-bulk_categories"><?php echo $entry_bulk_categories; ?></label>
							<div class="col-sm-10">
								<select name="module_bulk_categories" id="input-bulk_categories" class="form-control">
									<option value="0"><?php echo $text_all_categories; ?></option>
									<?php foreach ($bulk_categories as $bulk_category) { ?>
										<option value="<?php echo $bulk_category['category_id']; ?>"><?php echo $bulk_category['name']; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-bulk_manufacturers"><?php echo $entry_bulk_manufacturers; ?></label>
							<div class="col-sm-10">
								<select name="module_bulk_manufacturers" id="input-bulk_manufacturers" class="form-control">
									<option value="0"><?php echo $text_all_manufacturers; ?></option>
									<?php foreach ($bulk_manufacturers as $bulk_manufacturer) { ?>
										<option value="<?php echo $bulk_manufacturer['manufacturer_id']; ?>"><?php echo $bulk_manufacturer['name']; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-bulk_custom_xd_stickers"><?php echo $entry_bulk_custom_xd_stickers; ?></label>
							<div class="col-sm-10">
								<select name="module_bulk_custom_xd_stickers" id="input-bulk_custom_xd_stickers" class="form-control">
									<?php foreach ($bulk_custom_xd_stickers as $bulk_custom_xd_sticker) { ?>
										<option value="<?php echo $bulk_custom_xd_sticker['xd_sticker_id']; ?>"><?php echo $bulk_custom_xd_sticker['name']; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-6 text-right">
								<label class="control-label text-warning"><strong><?php echo $entry_bulk_warning; ?></strong></label>
							</div>
							<div class="col-sm-3 text-right">
								<button type="button" class="btn btn-danger" onclick="bulkDeleteCustomXDStickers();"><?php echo $button_custom_xd_stickers_bulk_delete; ?></button>
							</div>							
							<div class="col-sm-3 text-right">
								<button type="button" class="btn btn-success" onclick="bulkAddCustomXDStickers();"><?php echo $button_custom_xd_stickers_bulk; ?></button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$('.color_input input').ColorPicker({
			onChange: function (hsb, hex, rgb, el) {
				$(el).val("#" +hex);
				$(el).parent().find('.fa').css("color", "#" + hex);
				// console.log(hex);
			},
			onShow: function (colpkr) {
				$(colpkr).show();
				return false;
			},
			onHide: function (colpkr) {
				$(colpkr).hide();
				return false;
			}
		});
	});
</script>
<script type="text/javascript"><!--
	var custom_xd_sticker_row = <?php echo $custom_xd_sticker['xd_sticker_id']; ?>;

	function addCustomXDSticker() {
		// console.log($('#xd_stickers_custom tbody tr:last td.hidden > input').val());
		var last_xd_sticker_id = parseInt($('#xd_stickers_custom tbody tr:last td.hidden > input').val()) + 1;
		html  = '<tr id="custom_xd_sticker-row' + custom_xd_sticker_row + '">';
		html += '  <td class="hidden"><input type="hidden" name="custom_xd_sticker[' + custom_xd_sticker_row + '][xd_sticker_id]" value="' + last_xd_sticker_id + '" class="hidden" /></td>';
		html += '  <td class="text-left" style="width: 20%;"><input type="text" name="custom_xd_sticker[' + custom_xd_sticker_row + '][name]" value="" placeholder="<?php echo $entry_sticker_title; ?>" class="form-control" /></td>';
		html += '  <td class="text-left" style="width: 25%;">';
		<?php foreach ($languages as $language) { ?>
		html += '  <div class="input-group pull-left">';
		html += '  <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span><input type="text" name="custom_xd_sticker[' + custom_xd_sticker_row + '][text][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_sticker_text; ?>" class="form-control" />';
		html += '  </div>';
		<?php } ?>
		html += '  </td>';
		html += '  <td class="text-left color_input" style="width: 20%;"><div class="input-group"><span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style=""></i></span><input type="text" name="custom_xd_sticker[' + custom_xd_sticker_row + '][color_color]" value="" placeholder="<?php echo $entry_sticker_color; ?>" class="form-control" /></div></td>';
		html += '  <td class="text-left color_input" style="width: 20%;"><div class="input-group"><span class="input-group-addon" style="border-bottom-right-radius:0; border-top-right-radius:0; padding: 4px 8px;"><i class="fa fa-circle fa-2x fa-fw" aria-hidden="true" style=""></i></span><input type="text" name="custom_xd_sticker[' + custom_xd_sticker_row + '][bg_color]" value="" placeholder="<?php echo $entry_sticker_bg; ?>" class="form-control" /></div></td>';
		html += '  <td class="text-right" style="width: 10%;"><select name="custom_xd_sticker[' + custom_xd_sticker_row + '][status]" class="form-control"><option value="1"><?php echo $text_enabled; ?></option><option value="0" selected="selected"><?php echo $text_disabled; ?></option></select></td>';
		html += '  <td class="text-right" style="width: 5%;"><button type="button" onclick="removeCustomXDSticker(' + custom_xd_sticker_row  + ');" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
		html += '</tr>';

		$('#xd_stickers_custom tbody').append(html);

		$('.color_input input').ColorPicker({
			onChange: function (hsb, hex, rgb, el) {
				$(el).val("#" +hex);
				$(el).parent().find('.fa').css("color", "#" + hex);
				// console.log(hex);
			},
			onShow: function (colpkr) {
				$(colpkr).show();
				return false;
			},
			onHide: function (colpkr) {
				$(colpkr).hide();
				return false;
			}
		});

		custom_xd_sticker_row++;
	}

	function removeCustomXDSticker(xd_sticker_id) {
		var for_post = {};
		for_post.xd_sticker_id = xd_sticker_id;
		remove_row = '#custom_xd_sticker-row' + xd_sticker_id;
		$.ajax({
			url: 'index.php?route=extension/module/xd_stickers/delete_xd_sticker&token=<?php echo $token; ?>',
			type: 'post',
			data: for_post,
			dataType: 'json',
			beforeSend: function() {
				$('#xd_stickers_block .alert').remove();
			},
			complete: function() {
			},
			success: function(json) {
				console.log('AJAX SUCCESS!!!');
				if (json['success']) {
					$('#xd_stickers_block').prepend('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> '+json['success']+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					$(remove_row).remove();
				}
				if (json['error']) {
					$('#xd_stickers_block').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '+json['error']+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				$('#xd_stickers_block').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $text_error_ajax; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}

	function bulkAddCustomXDStickers() {
		var for_post = {};
		for_post.module_bulk_categories = $('#input-bulk_categories').val();
		for_post.module_bulk_manufacturers = $('#input-bulk_manufacturers').val();
		for_post.module_bulk_custom_xd_stickers = $('#input-bulk_custom_xd_stickers').val();
		$.ajax({
			url: 'index.php?route=extension/module/xd_stickers/bulkAddCustomXDStickers&token=<?php echo $token; ?>',
			type: 'post',
			data: for_post,
			dataType: 'json',
			beforeSend: function() {
				$('#xd_stickers_block .alert').remove();
			},
			complete: function() {
			},
			success: function(json) {
				console.log(json);
				if (json['success']) {
					$('#xd_stickers_block').prepend('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> '+json['success']+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				if (json['error']) {
					$('#xd_stickers_block').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '+json['error']+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				$('#xd_stickers_block').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $text_error_ajax; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				console.log("thrownError: " + thrownError + "\r\n xhr.status: " + xhr.status + "\r\n xhr.statusText: " + xhr.statusText + "\r\n xhr.responseText: " + xhr.responseText);
			}
		});
	}
	
	function bulkDeleteCustomXDStickers() {
		var for_post = {};
		for_post.module_bulk_categories = $('#input-bulk_categories').val();
		for_post.module_bulk_manufacturers = $('#input-bulk_manufacturers').val();
		for_post.module_bulk_custom_xd_stickers = $('#input-bulk_custom_xd_stickers').val();	
		$.ajax({
			url: 'index.php?route=extension/module/xd_stickers/bulkDeleteCustomXDStickers&token=<?php echo $token; ?>',
			type: 'post',
			data: for_post,
			dataType: 'json',
			beforeSend: function() {
				$('#xd_stickers_block .alert').remove();
			},
			complete: function() {
			},
			success: function(json) {
				console.log(json);
				if (json['success']) {
					$('#xd_stickers_block').prepend('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> '+json['success']+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				if (json['error']) {
					$('#xd_stickers_block').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '+json['error']+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				$('#xd_stickers_block').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $text_error_ajax; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				console.log("thrownError: " + thrownError + "\r\n xhr.status: " + xhr.status + "\r\n xhr.statusText: " + xhr.statusText + "\r\n xhr.responseText: " + xhr.responseText);
			}
		});
	}	
//--></script>
<?php echo $footer; ?>