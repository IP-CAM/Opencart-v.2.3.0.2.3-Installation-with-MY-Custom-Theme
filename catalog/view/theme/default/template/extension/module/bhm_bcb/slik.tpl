<div id="bhm-bcb-content<?php echo $module_bhm_bcb; ?>" class="bhm-bcb-carousel">
	<?php if ($name_block) { ?><div class="title"><?php echo $name_block; ?></div><?php } ?>

	<section class="slicks">
		<?php foreach ($brands as $brand) { ?>
			<div>
				<a href="<?php echo $brand['link']; ?>" title="<?php echo $brand['title']; ?>">
					<img loading="lazy" src="<?php echo $brand['image']; ?>" alt="<?php echo $brand['title']; ?>" class="img-responsive" style="margin: auto;"/>
					<?php if ($type_view == "img_text") {?><div class="brand-name text-center"><?php echo $brand['title']; ?></div><?php } ?>
				</a>
			</div>
		<?php } ?>
  </section>
	
	<?php if($all_brand_link=="text") { ?>
		<div class="all-brand"><a href="<?php echo $all_brands_link; ?>" title="<?php echo $all_brand_name; ?>"><?php echo $all_brand_name; ?></a></div>
	<?php } ?>
</div>
<script type="text/javascript"><!--
    $(document).on('ready', function() {
      $(".slicks").slick({
				autoplay: <?php echo $auto_carousel; ?>,
				<?php if ($auto_carousel=="true") { ?>
					autoplaySpeed: <?php echo $interval_speed; ?>,
					pauseOnHover: <?php echo $pause_carousel; ?>,
				<?php } ?>
				infinite: <?php echo $infinite; ?>,
				speed: <?php echo $animation_speed; ?>,
				mobileFirst: true,
        dots: false,
        vertical: <?php echo $orientation_carousel; ?>,
				verticalSwiping: <?php if ($orientation_carousel=="true") { echo "true"; } else { echo "false"; } ?>,
        lazyLoad: 'progressive',
        slidesToShow: <?php echo $scroll_limit; ?>,
        slidesToScroll: <?php echo $scroll; ?>
      });
    });
</script>
