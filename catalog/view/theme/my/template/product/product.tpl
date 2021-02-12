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
  <div class="row"> 
       <div class="col-sm-5">
	   <div class="thumbr">
          <?php if ($thumb || $images) { ?>
            <!-- XD stickers start --> 
            <?php if (!empty($xd_stickers)) { ?> <div class="xd_stickers_wrapper"> <?php foreach($xd_stickers as $xd_sticker) { ?> <div class="xd_stickers <?php echo $xd_sticker['id']; ?>"> <?php echo $xd_sticker['text']; ?> 
            </div> <?php } ?> 
            <div class="xd_stickers">
              <img src="https://vesyuniversal.com/image/catalog/d_quickcheckout/payment/privatbank_paymentparts_pp.webp" width="45" height="45" alt="Оплата частями" title="<?php echo $text_paypartstitle; ?>" data-toggle="tooltip" data-placement="right auto"></div>          
            <div class="xd_stickers">
              <img src="https://vesyuniversal.com/image/catalog/d_quickcheckout/payment/privatbank_paymentparts_ii.webp" width="45" height="45" title="<?php echo $text_rassrochtitle; ?>" data-toggle="tooltip" data-placement="right auto" alt="Мгновенная рассрочка"></div>
              </div> <?php } else { ?>
              <div class="xd_stickers_wrapper">     
              <div class="xd_stickers"><img src="https://vesyuniversal.com/image/catalog/d_quickcheckout/payment/privatbank_paymentparts_pp.webp" width="45" height="45" alt="Оплата частями" title="<?php echo $text_paypartstitle; ?>" data-toggle="tooltip" data-placement="right auto"></div>          
            <div class="xd_stickers"><img src="https://vesyuniversal.com/image/catalog/d_quickcheckout/payment/privatbank_paymentparts_ii.webp" width="45" height="45" title="<?php echo $text_rassrochtitle; ?>" data-toggle="tooltip" data-placement="right auto" alt="Мгновенная рассрочка"></div>
          </div>
          <?php } ?> 
          <!-- XD stickers end -->
           <ul class="thumbnails">

            <li class="owl-carousel" id="carousel-product">
            <?php if ($thumb) { ?>
            <a class="thumbnail" href="<?php echo $popup; ?>"><img src="<?php echo $thumb; ?>" width="300" height="300" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>      
                  
            <?php } ?> 
                <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <a class="thumbnail" href="<?php echo $image['popup']; ?>"> <img src="<?php echo $image['thumb']; ?>" width="300" height="300" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
            <?php } ?>
            <?php } ?> 
            </li>  
          </ul>
		
          <script type="text/javascript">
             $('#carousel-product').owlCarousel({
        items: 1,
        autoPlay: 6000,
        stopOnHover: true,
        navigation: true,
        navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
        itemsMobile : [479, 1],
        itemsTablet : [768, 1],
        itemsTablet: [1024, 1],
        pagination: true
    });
  </script>
          <?php } ?>
            <?php if ($review_status) { ?>
          <div class="rating">
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
          </div>
          <?php } ?>  
		  		<div class="butthumb">						      																																		  
          	<div id="product">
		     <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fas fa-balance-scale"></i></button>
          <button type="button" data-toggle="tooltip" class="btn btn-inverse wishlistadd" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button> 
		   <div class="number">
         <input type="text" name="quantity" min="<?php echo $minimum; ?>" value="<?php echo $minimum; ?>" id="input-quantity" class="quantity_input maininp"/>
              <div class="number_controls number_controlsjs">
              <button type="button" class="nc-plus">+</button>
              <button type="button" class="nc-minus">-</button>  
            </div>
			  </div>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary cartadd button-cartr">
<?php if ($product_to_cart == true) { ?>
<i class="fas fa-check-double"></i> <?php echo $button_incart; ?>
<?php } else { ?>
<i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?>
<?php } ?>
</button>    
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
            <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
          </div>  
			 <?php if ($manufacturer) { ?>
            <?php if($manufacturers_img) { ?>
            <a href="<?php echo $manufacturers; ?>"><?php echo ($manufacturers_img) ? '<img src="'.$manufacturers_img.'" width="150" height="100" title="'.$manufacturer.'" />' : '' ;?></a>
            <?php } else { ?>
           <?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a>
           <?php } ?>
            <?php } ?>						
			  <?php if ($price) { ?>
            <?php if (!$special) { ?>
              <span class="prprice"><?php echo $price; ?></span>
               <h5 class="hidden visible-xs torg"><?php echo $text_torg; ?></h5> 
                   <p><strong><?php echo $text_model; ?> <?php echo $model; ?></strong></p>
            <?php } else { ?>
            <span class="prprice-old"><?php echo $price; ?></span>
                <span class="prprice"><?php echo $special; ?></span>   
                    <p><strong><?php echo $text_model; ?> <?php echo $model; ?></strong></p>
            <?php } ?>
            <?php if ($tax) { ?>
            <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
            <?php } ?>
          
            <?php if ($discounts) { ?>
            <li>
              <hr>
            </li>
            <?php foreach ($discounts as $discount) { ?>
            <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
            <?php } ?>
            <?php } ?>       
          <?php } ?>		  
			       	   	
   <h3 class="hidden-xs"><?php echo $heading_title; ?></h3>		  
			</div>		
	</div>		  
        </div>
  
  <div class="col-sm-7">
    <div class="col-sm-8">
  <h1 class="producttitle"><?php echo $heading_title; ?></h1>
                       <?php if ($attribute_groups) { ?>
            <div id="tab-specification">
              <ul class="list-unstyled attribute">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <li>
                 <strong><?php echo $attribute_group['name']; ?></strong>
                </li>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <li itemprop="additionalProperty" itemscope itemtype="https://schema.org/PropertyValue">
                    <span itemprop="name"><strong><?php echo $attribute['name']; ?>:</strong> </span>
                    <span itemprop="value"> <?php echo $attribute['text']; ?></span>
                  </li>
                  <?php } ?>
                <?php } ?>
              </ul>
            </div>
            <?php } ?>
             
  </div>
    <div class="col-sm-4">
     <ul class="list-unstyled hidden-xs">
			<li><strong><?php echo $text_model; ?> <?php echo $model; ?></strong></li>										 
		     <?php if ($manufacturer) { ?>
            <?php if($manufacturers_img) { ?>
            <li><a href="<?php echo $manufacturers; ?>"><?php echo ($manufacturers_img) ? '<img src="'.$manufacturers_img.'" width="150" height="100" title="'.$manufacturer.'" />' : '' ;?></a>
          </li>
            <?php } else { ?>
           <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a>
         </li>
           <?php } ?>
            <?php } ?>      
              <?php if ($price) { ?>
<li>
            <?php if (!$special) { ?>
             <span class="prprice"><?php echo $price; ?></span>
              <h5 class="torg"><?php echo $text_torg; ?></h5> 																																																						 					
            <?php } else { ?>
			<span class="prprice"><?php echo $special; ?></span>
            <span class="prprice-old"><?php echo $price; ?></span>
            <?php } ?>
            </li>
			<li>
			<div class="buyme" id="product">	
<button type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary cartadd button-cartr">
<?php if ($product_to_cart == true) { ?>
<?php echo $button_incart; ?>
<?php } else { ?>
<?php echo $button_cart; ?>
<?php } ?>
</button> 
<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" /> 																																																	
</div>	
			</li>
            <?php if ($tax) { ?>
            <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
            <?php } ?>
    
            <?php if ($discounts) { ?>
            <li>
              <hr>
            </li>
            <?php foreach ($discounts as $discount) { ?>
            <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
            <?php } ?>
            <?php } ?>
        
          <?php } ?>
		  
          </ul>
		  </div>
  </div>
  <div class="col-sm-5">
		</div>
    <div class="col-sm-7">
		<ul class="nav nav-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab"><i class="far fa-file-alt"></i> <?php echo $tab_description; ?></a></li>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><i class="far fa-star"></i> <?php echo $tab_review; ?></a></li>
             <?php if ($review_status) { ?>
          <li class="rating">
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
          </li>
          <?php } ?>
            <?php } ?>
          </ul>
		       <div class="tab-content">
            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
				
                <div id="review"></div>
																																																																																																																																																																				

                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                  </div>
                </div>
				          <div class="form-group required">
                  <div class="col-sm-12">
                  <label class="control-label"><?php echo $entry_rating; ?></label>
                 <div class="stars-rating">
                 <input name="rating" id="s_rating" value="0" type="hidden">
                 <div class="wrap" data-rate="0">
                 <span title="Ужасно" data-rate="1"></span>
                <span title="Плохо" data-rate="2"></span>
                <span title="Нормально" data-rate="3"></span>
               <span title="Хорошо" data-rate="4"></span>
               <span title="Супер" data-rate="5"></span>
               </div>
              </div>
           </div>
          </div>
                <div class="form-group">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                  </div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
  <?php echo $column_leftt; ?>

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
		<div class="col-sm-5">
		</div>
		<div class="col-sm-7"> 
		    <?php echo $column_rightt; ?>
		        <?php if ($products) { ?>
      <h3><?php echo $text_related; ?></h3>
	 <div class="col-sm-12">
     <div class="row">
<?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>


        <div class="product-layout product-grid col-sm-4 col-md-3 col-xs-6" data-toggle="tooltip" data-placement="right auto" title="<?php echo $product['name']; ?> <?php if ($product['attribute_groups']) { ?>
<?php foreach ($product['attribute_groups'] as $attribute_group) { ?>
<?php echo $attribute_group['name']; ?> :
<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
<?php echo $attribute['name']; ?>: <?php echo $attribute['text']; ?>;    
<?php } ?>
<?php } ?>
<?php } ?>">
    <div class="product-thumb">
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
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" width="166" height="166" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption rpro">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <?php if ($product['manufacturer']) { ?>
                <?php if ($product['logo_image']) { ?>
               <a href="<?php echo $product['manufacturers'] ?>" title="<?php echo $product['manufacturer']; ?>"><img width="75" height="50" src="<?php echo $product['logo_image']; ?>"/></a>
               <?php } else { ?>
               <a href="<?php echo $product['manufacturers'] ?>"><?php echo $product['manufacturer']; ?></a>
               <?php } ?> 
               <?php } ?> 
                <span class="hidden-md hidden-sm"> <?php if ($product['sku']) { ?></span>
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
            <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"class="compareadd"><i class="fas fa-balance-scale"></i></button><button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" class="wishadd wishlistadd" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button><button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', $(this).parent().parent().find('.quantity_input').val() );" data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="cartadd">
																																	   
																		   
              <?php if ($product['cart'] == true) { ?>
<?php echo $button_incart; ?>
<?php } else { ?>
<i class="fa fa-shopping-cart hidden-sm hidden-md"></i><?php echo $button_cart; ?>
<?php } ?>
            </button>
            <div class="number">
              <div class="number_controlsjs">
                <button type="button" class="nc-minus">-</button><input type="text" name="quantity" min="<?php echo $product['minimum']; ?>" value="<?php echo $product['minimum']; ?>" class="quantity_input"/><button type="button" class="nc-plus">+</button>
              </div>
            </div>
          </div>											
    </div>				
        </div>
        <?php if (($column_leftt && $column_right) && (($i+1) % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_leftt || $column_right) && (($i+1) % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif (($i+1) % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
	  </div>
      <?php } ?>
	  <?php echo $content_top; ?>


		</div>

	</div>
</div>

<div class="container">
<div class="tags">
<p><?php echo $text_seo; ?> <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
   <span> <?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a> <?php } else { ?><?php echo $breadcrumb['text']; ?><?php } ?>,</span>
    <?php } ?> <?php echo $text_seo2; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a>. </p>
  </div>
  <?php echo $content_bottom; ?>
</div>
<script type="application/ld+json">
    {
      "@context": "https://schema.org/",
      "@type": "Product",
      "name": "<?php echo str_replace('"', '', "$heading_title"); ?>",
      "url": "<?php echo $share; ?>",
      "image": "<?php echo $popup; ?>",
      "description": "<?php $descr = str_replace('"', '', "$description"); echo strip_tags($descr); ?>",
      "category": "<?php echo $breadcrumbs[1]['text']; ?>",
      "sku": "<?php echo $sku; ?>",   
      "brand": {
      "@type": "Thing",
      "name": "<?php echo $manufacturer; ?>"
      },
    <?php if ($reviews > 0){ ?>
      "aggregateRating": {
      "@type": "AggregateRating",
      "ratingValue": "<?php echo $rating; ?>",
      "reviewCount": "<?php echo $review_count; ?>"
      }, 
    <?php } ?>
    
      "offers": {
      "@type": "Offer",
      "url": "<?php echo $share; ?>",
      "priceCurrency": "UAH",
      "price": "<?php if (!$special) {echo preg_replace('/[\$\£\€\R\грн\RM,]|<[^>]*>|\s+|р\./u', '', $price);} else {echo preg_replace('/[\$\£\€\R\грн\RM,]|<[^>]*>|\s+|р\./u', '', $special);} ?>",
      "priceValidUntil": "<?php echo date('Y-m-d', strtotime('+ 1 year')); ?>",
      "itemCondition": "https://schema.org/NewCondition",
      "availability": "https://schema.org/<?php 
      $stock = preg_replace('/^\bВ\sналичии\b/ui', 'InStock', $stock);
      $stock = preg_replace('/^\bНа\sскладе\b/ui', 'InStock', $stock);
      $stock = preg_replace('/^\bНет\b\s\bв\s\bналичии\b/ui', 'OutOfStock', $stock);
      $stock = preg_replace('/^\bСкоро\b\s\bожидается\b/ui', 'LimitedAvailability', $stock);
      $stock = preg_replace('/^\bОжидание\b 2-3 \bдня\b/ui', 'PreSale', $stock);
      $stock = preg_replace('/^\bПредзаказ\b/ui', 'InStock', $stock);
      echo $stock;
      ?>",
      
      "seller": {
        "@type": "Organization",
        "name": "Весы Универсал",
        "url": "https://vesyuniversal.com"
      }
      }
    }
    </script>
    <script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "ImageObject",
"author": "Весы Универсал",
"thumbnailUrl": "<?php echo $thumb; ?>",
"contentUrl": "<?php echo $popup; ?>",
"description": "<?php $descr = str_replace('"', '', "$description"); echo strip_tags($descr); ?>",
"name": "<?php echo str_replace('"', '', "$heading_title"); ?>"
}
</script>
<?php echo $footer; ?>
<script type="text/javascript">
  if(document.documentElement.clientWidth > 767) {
(function(){
var a = document.querySelector('.thumbr'), b = null, P = 0;  // если ноль заменить на число, то блок будет прилипать до того, как верхний край окна браузера дойдёт до верхнего края элемента. Может быть отрицательным числом
window.addEventListener('scroll', Ascroll, false);
document.body.addEventListener('scroll', Ascroll, false);
function Ascroll() {
  if (b == null) {
    var Sa = getComputedStyle(a, ''), s = '';
    for (var i = 0; i < Sa.length; i++) {
      if (Sa[i].indexOf('overflow') == 0 || Sa[i].indexOf('padding') == 0 || Sa[i].indexOf('border') == 0 || Sa[i].indexOf('outline') == 0 || Sa[i].indexOf('box-shadow') == 0 || Sa[i].indexOf('background') == 0) {
        s += Sa[i] + ': ' +Sa.getPropertyValue(Sa[i]) + '; '
      }
    }
    b = document.createElement('div');
    b.style.cssText = s + ' box-sizing: border-box; width: ' + a.offsetWidth + 'px;';
    a.insertBefore(b, a.firstChild);
    var l = a.childNodes.length;
    for (var i = 1; i < l; i++) {
      b.appendChild(a.childNodes[1]);
    }
    a.style.height = b.getBoundingClientRect().height + 'px';
    a.style.padding = '0';
    a.style.border = '0';
  }
  var Ra = a.getBoundingClientRect(),
      R = Math.round(Ra.top + b.getBoundingClientRect().height - document.querySelector('.tags').getBoundingClientRect().top + 0);  // селектор блока, при достижении верхнего края которого нужно открепить прилипающий элемент;  Math.round() только для IE; если ноль заменить на число, то блок будет прилипать до того, как нижний край элемента дойдёт до футера
  if ((Ra.top - P) <= 0) {
    if ((Ra.top - P) <= R) {
      b.className = 'stop';
      b.style.top = - R +'px';
    } else {
      b.className = 'fix';
      b.style.top = P + '125px';
    }
  } else {
    b.className = '';
    b.style.top = '';
  }
  window.addEventListener('resize', function() {
    a.children[0].style.width = getComputedStyle(a, '').width
  }, false);
}
})()
 }
 $('.button-cartr').on('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-cart').button('loading');
    },
    complete: function() {
      $('#button-cart').button('reset');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();
      $('.form-group').removeClass('has-error');

      if (json['error']) {
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            var element = $('#input-option' + i.replace('_', '-'));

            if (element.parent().hasClass('input-group')) {
              element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            } else {
              element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            }
          }
        }

        if (json['error']['recurring']) {
          $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
        }

        // Highlight any found errors
        $('.text-danger').parent().addClass('has-error');
      }

      if (json['success']) {
        $('.breadcrumb').after('<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">&times;</button>' + json['success'] + '</div>');

        $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

        $('#cart > ul').load('index.php?route=common/cart/info ul li');
          setTimeout(function(){
            $('.alert').fadeOut() }, 1500);
      }
    },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
  });
});


$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
  $.ajax({
    url: 'index.php?route=product/product/getRecurringDescription',
    type: 'post',
    data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
    dataType: 'json',
    beforeSend: function() {
      $('#recurring-description').html('');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();

      if (json['success']) {
        $('#recurring-description').html(json['success']);
      }
    }
  });
});
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
				$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
			}
			setTimeout(function(){
            $('.alert').fadeOut() }, 6000);
		}
	});
    grecaptcha.reset();
});
$(document).ready(function() {
  $('.thumbnails').magnificPopup({
    type:'image',
    delegate: 'a',
    gallery: {
      enabled:true
    }
  });
});
</script>
