<div id="bhm-bcb-content<?php echo $module_bhm_bcb; ?>" class="bhm-bcb-block">
	<?php if ($name_block) { ?><div class="title"><?php echo $name_block; ?></div><?php } ?>
	<div class="block">
		<?php foreach ($brands as $brand) { ?>
			<div class="item">
				<a href="<?php echo $brand['link']; ?>" title="<?php echo $brand['title']; ?>">
					<?php if ($type_view == "img" || $type_view == "img_text") {?>
						<img loading="lazy" src="<?php echo $brand['image']; ?>" alt="<?php echo $brand['title']; ?>" width="150" height="100" class="img-responsive"/>
					<?php } ?>
					<?php if ($type_view == "img_text") {?><div class="brand-name"><strong><?php echo $brand['title']; ?></strong></div><?php } ?>
				</a>
			</div>
		<?php } ?>
		<?php if($all_brand_link=="img" || $all_brand_link=="img_text" ) { ?>
			<div class="item">
				<a href="<?php echo $all_brands_link; ?>" title="<?php echo $all_brand_name; ?>">
					<img loading="lazy" src="<?php echo $all_brand_link_image; ?>" alt="<?php echo $all_brand_name; ?>" class="img-responsive"/>
					<?php if ($all_brand_link == "img_text") {?><div class="brand-name"><?php echo $all_brand_name; ?></div><?php } ?>
				</a>
			</div>
		<?php } ?>
	</div>
	<?php if($all_brand_link=="text") { ?>
		<div class="all-brand"><a href="<?php echo $all_brands_link; ?>" title="<?php echo $all_brand_name; ?>"><?php echo $all_brand_name; ?></a></div>
	<?php } ?>
</div>
