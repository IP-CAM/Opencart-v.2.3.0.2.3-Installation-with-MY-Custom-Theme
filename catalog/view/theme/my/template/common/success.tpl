<?php echo $header; ?>
<div class="container">
   <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
    <li><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a> <?php } else { ?><?php echo $breadcrumb['text']; ?><?php } ?></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?> <?php echo $order_id;?></h1>
      <p class="text-center revealator-zoomin revealator-once"><img src="image/success.png"></p>
	  <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>	  
      </div>
    <?php echo $column_right; ?></div>
<?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>