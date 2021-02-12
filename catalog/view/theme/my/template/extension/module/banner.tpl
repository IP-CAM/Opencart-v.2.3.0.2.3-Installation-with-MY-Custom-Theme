<div id="banner0" class="owl-carousel hidden-xs">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" width="260" height="350" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
  <script type="text/javascript">
	$('#banner0').owlCarousel({
	items: 6,
	autoPlay: 8000,
	singleItem: true,
	navigation: false,
	pagination: false,
	transitionStyle: 'fade'
    });
</script>
</div>

