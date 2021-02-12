<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
  <div class="col-sm-12">
     <h1><?php echo $heading_title; ?></h1>

</div>
    <div class="col-sm-6">
    <?php echo $column_rightt; ?></div>
    <?php if ($column_left && $column_rightt) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_rightt) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            
      <?php echo $description; ?>
      <?php echo $content_bottom; ?>
      </div>
	</div>
</div>
<div itemscope itemtype="http://schema.org/NewsArticle" style="display:none;position:absolute;opacity:0;left:-9999px;bottom:-9999px;">
          <meta itemscope itemprop="mainEntityOfPage"  itemType="https://schema.org/WebPage" itemid="<?php echo $og_url; ?>"/>
          <meta itemprop="headline" content="<?php echo $heading_title; ?>" />
          <div itemprop="author" itemscope itemtype="https://schema.org/Person"><meta itemprop="name" content="<?php echo $author; ?>" /></div>
           <meta itemprop="description" content="<?php $descr = str_replace('"', '', "$description"); echo strip_tags($descr); ?>">
           <div itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
               <link itemprop="contentUrl" href="<?php echo $logo; ?>" />
               <link itemprop="url" href="<?php echo $logo; ?>">
               <meta itemprop="width" content="<?php echo $image_width; ?>">
               <meta itemprop="height" content="<?php echo $image_height; ?>">
            </div>
            <div itemprop="publisher" itemscope itemtype="https://schema.org/Organization">               
                <meta itemprop="telephone" content="<?php echo $telephone; ?>" />
                <div itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
                    <link itemprop="url" href="<?php echo $logo; ?>">
                    <link itemprop="contentUrl" href="<?php echo $logo; ?>" />
                </div>
                <meta itemprop="name" content="<?php echo $store_name; ?>" />
            </div>
            <meta itemprop="datePublished" content="<?php echo $date_published; ?>" />
            <meta itemprop="dateModified" content="<?php echo $date_published; ?>" />
        </div>
<?php echo $footer; ?>