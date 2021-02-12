<div id="bhm-bcb-content<?php echo $module_bhm_bcb; ?>" class="bhm-bcb-carousel">
	<?php if ($name_block) { ?><div class="title"><?php echo $name_block; ?></div><?php } ?>
	<ul class="bxslider<?php echo $module_bhm_bcb; ?>">
		<?php foreach ($brands as $brand) { ?>
			<li>
				<a href="<?php echo $brand['link']; ?>" title="<?php echo $brand['title']; ?>">
					<img src="<?php echo $brand['image']; ?>" alt="<?php echo $brand['title']; ?>" class="img-responsive" style="margin: auto;"/>
					<?php if ($type_view == "img_text") {?><div class="brand-name text-center"><?php echo $brand['title']; ?></div><?php } ?>
				</a>
			</li>
		<?php } ?>
		<?php if($all_brand_link=="img" || $all_brand_link=="img_text" ) { ?>
			<li>
				<a href="<?php echo $all_brands_link; ?>" title="<?php echo $all_brand_name; ?>">
					<img src="<?php echo $all_brand_link_image; ?>" alt="<?php echo $all_brand_name; ?>" class="img-responsive" />
					<?php if ($all_brand_link == "img_text") {?><div class="brand-name text-center"><?php echo $all_brand_name; ?></div><?php } ?>
				</a>
			</li>
		<?php } ?>
	</ul>
	<?php if($all_brand_link=="text") { ?>
		<div class="all-brand"><a href="<?php echo $all_brands_link; ?>" title="<?php echo $all_brand_name; ?>"><?php echo $all_brand_name; ?></a></div>
	<?php } ?>
</div>
<script type="text/javascript"><!--
	$(document).ready(function(){
		$('.bxslider<?php echo $module_bhm_bcb; ?>').bxSlider({
			mode: '<?php echo $orientation_carousel; ?>',
			slideMargin: 10,
			auto: <?php echo $auto_carousel; ?>,
			<?php if ($auto_carousel=="true") { ?>
				autoHover: <?php echo $pause_carousel; ?>,
			<?php } ?>
			infiniteLoop: <?php echo $infinite; ?>,
			<?php if ($orientation_carousel=='horizontal') { ?>
				slideWidth: <?php echo $width; ?>,
				minSlides: 2,
				maxSlides: <?php echo $scroll_limit; ?>,
			<?php } else { ?>
				minSlides: <?php echo $scroll_limit; ?>,
			<?php } ?>
			moveSlides: <?php echo $scroll; ?>,
			speed: <?php echo $animation_speed; ?>,
			pager: false
		});
	});
</script>
