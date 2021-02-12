<?php echo $header; ?>
<div class="container">
  <ol class="breadcrumb" itemscope itemtype="https://schema.org/BreadcrumbList">
        <?php $i=0; $count = count($breadcrumbs);
    foreach ($breadcrumbs as $breadcrumb) { ?>
    <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
      <?php if ($i<$count-1) { ?>
        <a href="<?php echo $breadcrumb['href']; ?>" itemprop="item"><?php if ($breadcrumb['image']) { ?>
      <img src="<?php echo $breadcrumb['image']; ?>" width="30" height="30"/> <?php } ?><span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
      <?php } else { ?>
      <?php if ($thumb) { ?>
      <img src="<?php echo $thumb; ?>" width="30" height="30"/><?php } ?><span   itemprop="name"><?php echo $breadcrumb['text']; ?></span>
      <meta itemprop="item" content="<?php echo $breadcrumb['href']; ?>" />
      <?php } ?>
      <meta itemprop="position" content="<?php echo $i+1; ?>" />
    </li>
    <?php if ($i <$count-1) {?>
      <span class="b_sep"></span>
    <?php } ?>
        <?php $i++; } ?>
</ol>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div class="<?php echo $class; ?>">
      <h1><?php echo $heading_title; ?></h1>
<?php echo $content_top; ?>
      <?php if ($thumb || $description) { ?>
      <div class="row about col-sm-12">
         <?php if ($thumb) { ?>
          <ul class="list-unstyled rightimg">
        <img src="<?php echo $thumb; ?>" width="300" height="300" alt="<?php echo $heading_title; ?>" class="img-thumbnail" />
      </ul>
        <?php } ?>
        <?php if ($description) { ?>
        <?php echo $description; ?>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($categories) { ?>
        <div class="subcats row col-sm-12">
      <h3><?php echo $text_refine; ?></h3>
       <?php foreach ($categories as $category) { ?>
      
     <a href="<?php echo $category['href']; ?>" class="col-xs-4 col-sm-2">                        
    <img src="<?php echo $category['image']; ?>" width="100" height="100" alt="<?php echo $category['name']; ?>"/>             
   <?php echo $category['name']; ?>                  
    </a>   
 
      <?php } ?>
  </div>
      <?php } ?>
      <?php if ($articles) { ?>
      <div class="row col-sm-12">
          <h3><?php echo $text_news; ?></h3>
        <?php foreach ($articles as $article) { ?>
            <div class="product-layout product-grid col-lg-2 col-md-2 col-sm-3 col-xs-6">
          <div class="product-thumb">
            <?php if ($article['thumb']) { ?><div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" width="183" height="183" alt="<?php echo $article['name']; ?>" class="img-responsive" /></a></div><?php } ?>
            <div class="caption">
                <h4><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h4>
                <p><?php echo $article['preview']; ?></p>

                <?php if ($article['attributes']) { ?>
                  <h5><?php echo $text_attributes;?></h5>
                  <?php foreach ($article['attributes'] as $attribute_group) { ?>
                    <?php foreach ($attribute_group['attribute'] as $attribute_item) { ?>
                        <b><?php echo $attribute_item['name'];?>:</b> <?php echo $attribute_item['text'];?><br />
                    <?php } ?>
                  <?php } ?>
                <?php } ?>
            </div>

    <button class="btn-primary" onclick="location.href = ('<?php echo $article['href']; ?>');" data-toggle="tooltip" title="<?php echo $text_more; ?>"><?php echo $article['date']; ?> <i class="fa fa-share"></i>  <?php echo $article['viewed']; ?></button>
   
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 col-xs-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 col-xs-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$articles) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php if ($comments_vk) { ?>
      <div class="row">
        <div class="col-md-12">
      <div id="vk_comments"></div>
      <script type="text/javascript">
      VK.init({apiId: <?php echo $comments_vk; ?>, onlyWidgets: true});
      VK.Widgets.Comments("vk_comments", {limit: 10, attach: "*"});
      </script>
        </div>
      </div>
      <?php } ?>

      <?php if ($comments_fb) { ?>
      <div class="row">
        <div class="col-md-12">
            <div id="fb-root"></div>
      <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/ru_RU/sdk.js#xfbml=1&version=v2.10";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>
      <div class="fb-comments" data-href="<?php echo $canonical; ?>" data-width="100%" data-numposts="10"></div>
        </div>
      </div>
      <?php } ?>

      <?php if ($comments_dq) { ?>
      <div class="row">
        <div class="col-md-12">
          <div id="disqus_thread"></div>
      <script>
      var disqus_config = function () {
        this.page.url = "<?php echo $canonical; ?>";
      };

      (function() { // DON'T EDIT BELOW THIS LINE
      var d = document, s = d.createElement('script');
      s.src = 'https://<?php echo $comments_dq; ?>.disqus.com/embed.js';
      s.setAttribute('data-timestamp', +new Date());
      (d.head || d.body).appendChild(s);
      })();
      </script>
      <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
        </div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
   <script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "ImageObject",
"author": "СтройМаркет Плюс",
"thumbnailUrl": "<?php echo $thumb; ?>",
"contentUrl": "<?php echo $thumb; ?>",
"description": "<?php $descr = str_replace('"', '', "$description"); echo strip_tags($descr); ?>",
"name": "<?php echo str_replace('"', '', "$heading_title"); ?>"
}
</script>
<?php echo $footer; ?>