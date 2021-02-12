 <?php if ($heading_title) { ?>
<h3><?php echo $heading_title; ?></h3>
<?php } ?>
<div class="row" id="carousel-news">
  <?php foreach ($articles as $article) { ?>
  <div class="product-layout col-sm-12">
    <div class="news-thumb transition">
      <?php if ($article['thumb']) { ?>
      <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" width="277" height="277" title="<?php echo $article['name']; ?>" class="img-responsive" /></a></div>
      <?php } ?>
      <div class="caption-news">
        <h4><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h4>
        <?php echo $article['preview']; ?>
      </div>
      <div class="button-group">
		<button onclick="location.href = ('<?php echo $article['href']; ?>');" data-toggle="tooltip" title="<?php echo $text_more; ?>"><?php echo $article['date']; ?> <i class="fa fa-share"></i>	<?php echo $article['viewed']; ?></button>
	  </div>
    </div>
  </div>
  <?php } ?>
</div>
<script type="text/javascript">
 $('#carousel-news').owlCarousel({
        items: 1,
        autoPlay: 7000,
        stopOnHover: true,
        navigation: true,
        navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
        pagination: true,
        itemsMobile: [479, 2],
        itemsTablet: [1024, 1]
    });
</script>