<div id="bhm-bcb-content<?php echo $module_bhm_bcb; ?>" class="bhm-bcb-menu">
	<?php if ($name_block) { ?><div class="title"><?php echo $name_block; ?></div><?php } ?>
	<div class="list-group">
		<?php foreach ($brands as $brand) { ?>
			<a href="<?php echo $brand['link']; ?>" title="<?php echo $brand['title']; ?>" class="list-group-item"><?php echo $brand['title']; ?></a>
		<?php } ?>
		<?php if($all_brand_link == "text") { ?>
			<a href="<?php echo $all_brands_link; ?>" title="<?php echo $all_brand_name; ?>" class="list-group-item"><?php echo $all_brand_name; ?></a>
		<?php } ?>
	</div>
</div>
