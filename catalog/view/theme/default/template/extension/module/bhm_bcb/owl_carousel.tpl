<div id="#bhm-bcb-carousel0" class="bhm-bcb-carousel col-sm-12 col-xs-12">
	<?php if ($name_block) { ?><div class="title"><?php echo $name_block; ?></div><?php } ?>
	<div id="bhm-bcb-carousel<?php echo $module_bhm_bcb; ?>" class="owl-carousel">
		<?php foreach ($brands as $brand) { ?>
			<div class="item text-center">
				<a href="<?php echo $brand['link']; ?>" title="<?php echo $brand['title']; ?>">
					<img loading="lazy" src="<?php echo $brand['image']; ?>" width="150" height="100" alt="<?php echo $brand['title']; ?>" class="img-responsive"/>
					<?php if ($type_view == "img_text") {?><div class="brand-name"><?php echo $brand['title']; ?></div><?php } ?>
				</a>
			</div>
		<?php } ?>
		<?php if($all_brand_link=="img" || $all_brand_link=="img_text" ) { ?>
			<div class="item text-center">
				<a href="<?php echo $all_brands_link; ?>" title="<?php echo $all_brand_name; ?>">
					<img loading="lazy" src="<?php echo $all_brand_link_image; ?>" alt="<?php echo $all_brand_name; ?>" class="img-responsive"/>
					<?php if ($all_brand_link == "img_text") {?><div class="brand-name"><?php echo $all_brand_name; ?></div><?php } ?>
				</a>
			</div>
		<?php } ?>
	</div>
	<?php if($all_brand_link=="text") { ?>
		<button class="all-brand btn-inverse" onclick="location.href='<?php echo $all_brands_link; ?>'"><?php echo $all_brand_name; ?></button>
	<?php } ?>
	  <script type="text/javascript">
$('#bhm-bcb-carousel0').owlCarousel({
	items: 6,
	autoPlay: 6000,
	stopOnHover : true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
	pagination: false,
	itemsMobile : [479, 2],
  itemsTablet : [768, 5]
});
</script>
</div>