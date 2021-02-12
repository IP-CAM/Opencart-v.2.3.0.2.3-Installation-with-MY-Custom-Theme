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
      <?php if ($products) { ?>
          <div id="tags"></div>
            <div class="row">
           <div class="col-sm-12 col-xs-12" id="input-sort">
           <strong><?php echo $text_sort; ?></strong>
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <button class="btn-primary active"><?php echo $sorts['text']; ?></button>
              <?php } else { ?>
              <button onclick="location='<?php echo $sorts['href']; ?>'" class="btn-primary"><?php echo $sorts['text']; ?></button>
              <?php } ?>
              <?php } ?>
             <strong><?php echo $text_limit; ?></strong>           
              <select id="input-limit" class="form-control limit" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
              </select>
            </div>    
            </div>
      <div class="row col-sm-12">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-lg-2 col-md-2 col-sm-3 col-xs-6" data-toggle="tooltip" data-placement="right auto" title="<?php echo $product['name']; ?> <?php if ($product['attribute_groups']) { ?>
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
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" width="196" height="196" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
              <div class="caption rpro">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
               <?php if ($product['manufacturer']) { ?>
                <?php if ($product['logo_image']) { ?>
               <a href="<?php echo $product['manufacturers'] ?>" title="<?php echo $product['manufacturer']; ?>"><img src="<?php echo $product['logo_image']; ?>" width="75" height="50"/></a>
               <?php } else { ?>
               <a href="<?php echo $product['manufacturers'] ?>"><?php echo $product['manufacturer']; ?></a>
               <?php } ?> 
               <?php } ?>
               <?php if ($product['sku']) { ?>
                 <span><?php echo $product['sku']; ?></span>
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
<i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?>
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
        <?php } ?>
      </div>
      <div class="row">
        <input type="hidden" value="<?php echo $text_endlesstext; ?>" id="endlesstext" /> 
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
	  <?php echo $content_top; ?>
      </div>
    <?php echo $column_right; ?></div>
</div>
<div class="container">
<div class="row">
<?php echo $content_bottom; ?>
</div>
</div>
<?php echo $footer; ?>