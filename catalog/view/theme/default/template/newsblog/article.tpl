<?php echo $header; ?>
<div class="container">
 <ol class="breadcrumb" itemscope itemtype="https://schema.org/BreadcrumbList">
        <?php $i=0; $count = count($breadcrumbs);
    foreach ($breadcrumbs as $breadcrumb) { ?>
    <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
      <?php if ($i<$count-1) { ?>
        <a href="<?php echo $breadcrumb['href']; ?>" itemprop="item"><?php if ($breadcrumb['image']) { ?>
      <img src="<?php echo $breadcrumb['image']; ?>" width="60" height="30"/> <?php } ?><span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
      <?php } else { ?>
      <?php if ($thumb) { ?>
      <img src="<?php echo $thumb; ?>" width="30" height="30"/><?php } ?><span itemprop="name"><?php echo $breadcrumb['text']; ?></span>
      <meta itemprop="item" content="<?php echo $breadcrumb['href']; ?>" />
      <?php } ?>
      <meta itemprop="position" content="<?php echo $i+1; ?>" />
    </li>
    <?php if ($i <$count-1) {?>
      <span class="b_sep"></span>
    <?php } ?>
        <?php $i++; } ?>
</ol>
  <div class="row">
    <div id="content" class="col-sm-12 about"><?php echo $content_top; ?>
      <div class="row">
        <div class="col-sm-12" itemprop="articleBody">
          <h1><?php echo $heading_title; ?></h1>
            
            <div class="hidden"><?php echo $preview;?></div>
            
            
          <?php if ($thumb || $images) { ?>
            <ul class="thumbnails rightimg">
               <?php if ($images) { ?>
              <?php foreach ($images as $image) { ?>
              <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" width="66" height="66" alt="<?php echo $heading_title; ?>" /></a></li>
              <?php } ?>
              <?php } ?>
              <?php if ($thumb) { ?>
              <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" width="400" height="400" alt="<?php echo $heading_title; ?>" /></a></li>
              <?php } ?>
           
            </ul>
            <?php } ?>

            <?php if ($attributes) { ?>
            <h5><?php echo $text_attributes;?></h5>
              <?php foreach ($attributes as $attribute_group) { ?>
                  <?php foreach ($attribute_group['attribute'] as $attribute_item) { ?>
                      <b><?php echo $attribute_item['name'];?>:</b> <?php echo $attribute_item['text'];?><br />
                  <?php } ?>
              <?php } ?>
            <?php } ?>
          <?php echo $description; ?>
            <?php echo $column_left; ?>
        </div>

  
      </div>

      <?php if ($articles) { ?>
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php foreach ($articles as $article) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" class="img-responsive" /></a></div>
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
          </div>
        </div>
        <?php } ?>
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
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      </div>
        <?php if ($products) { ?>
           <div class="col-sm-12">
      <h3><?php echo $text_related_products; ?></h3>
    <div id="feature-carousel" class="row">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout">
    <div class="product-thumb transition">
      <div class="image">
      <!-- XD stickers start -->
            <?php if (!empty($product['product_xd_stickers'])) { ?>
            <div class="xd_stickers_wrapper">
              <?php foreach($product['product_xd_stickers'] as $xd_sticker) { ?>
                <div class="xd_stickers <?php echo $xd_sticker['id']; ?>">
                  <?php echo $xd_sticker['text']; ?>
                </div>
              <?php } ?>
            </div>
            <?php } ?>
            <!-- XD stickers end -->
      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" width="200" height="200" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption rpro">
        <h4><a href="<?php echo $product['href']; ?>" data-toggle="tooltip" data-placement="auto right" title="<?php echo $product['name']; ?> <?php echo $product['description']; ?>"><?php echo $product['name']; ?></a></h4>
        <?php if ($product['manufacturer']) { ?>
                <?php if ($product['logo_image']) { ?>
               <a href="<?php echo $product['manufacturers'] ?>" title="<?php echo $product['manufacturer']; ?>"><img src="<?php echo $product['logo_image']; ?>" width="75" height="50"/></a>
               <?php } else { ?>
               <a href="<?php echo $product['manufacturers'] ?>"><?php echo $product['manufacturer']; ?></a>
               <?php } ?> 
               <?php } ?> 
 <?php if ($product['sku']) { ?>
                <?php echo $product['sku']; ?>
                <?php } ?>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
             <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
         <div class="button-group">
            <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"class="compareadd"><i class="fas fa-balance-scale"></i></button><button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" class="wishadd" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button><button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', $(this).parent().parent().find('.quantity_input').val() );" class="cartadd"><?php if ($product['cart'] == true) { ?>
<?php echo $button_incart; ?>
<?php } else { ?>
<?php echo $button_cart; ?>
<?php } ?></button>
            <div class="number">
              <div class="number_controlsjs">
                <button type="button" class="nc-minus">-</button><input type="text" name="quantity" min="1" value="1" class="quantity_input"/><button type="button" class="nc-plus">+</button>
              </div>
            </div>
          </div>
    </div>
  </div>
  <?php } ?>
</div>
<script type="text/javascript">
      $('#feature-carousel').owlCarousel({
        items: 6,
        autoPlay: 7000,
        stopOnHover: true,
        navigation: true,
        navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
        pagination: true,
        itemsMobile : [479, 2],
        itemsTablet : [768, 4]
    });
</script>
      <?php } ?>
      </div>
    <?php echo $content_bottom; ?>
    <?php echo $column_right; ?></div>
</div>

<script type="text/javascript"><!--
$(document).ready(function() {
  $('.thumbnails').magnificPopup({
    type:'image',
    delegate: 'a',
    gallery: {
      enabled:true
    }
  });
});
//--></script>
<script type="application/ld+json">
{
    "@context": "http://schema.org",
    "@type": "Article",
    "mainEntityOfPage": {
        "@type": "WebPage",
        "@id": "<?php echo $canonical; ?>"
    },
    "headline": "<?php echo $heading_title; ?>",
    "image": {
        "@type": "ImageObject",
        "url": "<?php echo $popup; ?>",
        "width": 150,
        "height": 150
    },
    "url": "<?php echo $canonical; ?>",
    "datePublished": "<?php $pattern = '/(\d)[^\d]{1}(\d)/';
$replace = '\1-\2'; echo preg_replace($pattern,$replace,$date); ?>",
    "dateModified": "<?php $pattern = '/(\d)[^\d]{1}(\d)/';
$replace = '\1-\2'; echo preg_replace($pattern,$replace,$date_modified); ?>",
    "author": {
        "@type": "Person",
        "name": "Весы Универсал"
    },
    "publisher": {
        "@type": "Organization",
        "name": "https://vesyuniversal.com",
        "logo": {
            "@type": "ImageObject",
            "url": "<?php echo $logo; ?>",
            "width": 258,
            "height": 144
        }
    },
   "description": "<?php $descr = str_replace('"', '', "$description"); echo strip_tags($descr); ?>"
}
</script>
   <script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "ImageObject",
"author": "Весы Универсал",
"thumbnailUrl": "<?php echo $thumb; ?>",
"contentUrl": "<?php echo $thumb; ?>",
"description": "<?php $descr = str_replace('"', '', "$description"); echo strip_tags($descr); ?>",
"name": "<?php echo str_replace('"', '', "$heading_title"); ?>"
}
</script>
<?php echo $footer; ?>