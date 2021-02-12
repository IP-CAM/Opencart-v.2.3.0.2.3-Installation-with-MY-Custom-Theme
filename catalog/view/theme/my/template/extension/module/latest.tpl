<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout product-grid col-lg-2 col-md-2 col-sm-3 col-xs-6" data-toggle="tooltip" data-placement="right auto" title="<?php echo $product['name']; ?> <?php echo $product['description']; ?>">
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
                <h4 itemprop="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
         <?php if ($product['sku']) { ?>
                <?php echo $product['sku']; ?>
                <?php } ?>

                <?php if ($product['manufacturer']) { ?>
                <?php if ($product['logo_image']) { ?>
               <a href="<?php echo $product['manufacturers'] ?>" title="<?php echo $product['manufacturer']; ?>"><img src="<?php echo $product['logo_image']; ?>" width="75" height="50"/></a>
               <?php } else { ?>
               <a href="<?php echo $product['manufacturers'] ?>"><?php echo $product['manufacturer']; ?></a>
               <?php } ?> 
               <?php } ?> 
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </p>
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
            <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"class="compareadd"><i class="fas fa-balance-scale"></i></button><button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" class="wishadd" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button><button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', $(this).parent().parent().find('.quantity_input').val() );" class="cartadd"><i class="fa fa-shopping-cart"></i></button>
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
