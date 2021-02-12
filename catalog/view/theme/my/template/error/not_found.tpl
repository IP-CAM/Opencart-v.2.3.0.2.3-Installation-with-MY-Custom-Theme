<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <h1><?php echo $heading_title; ?></h1>
<p class="text-center"><img src="image/catalog/banners/404.jpg" alt="<?php echo $heading_title; ?>" width="800" height="534" class="img-responsive" style="display: inline-block;"/></p>
 <div class="buttons clearfix" style="position: absolute;bottom: 8%;left: 20%;">
        <div class="text-center"><a href="<?php echo $continue; ?>" class="btn btn-primary">На главную</a></div>
      </div>
  </div>
    <?php echo $column_right; ?></div>
    <?php echo $content_top; ?>
	<?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>
