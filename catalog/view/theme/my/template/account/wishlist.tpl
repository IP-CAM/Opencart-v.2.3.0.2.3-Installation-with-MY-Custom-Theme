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
    <div id="content" class="<?php echo $class; ?> wishlist"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
       <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ru_RU/sdk.js#xfbml=1&version=v9.0" nonce="gDlQSxtS"></script>  
<div class="text-center" style="height:30px;">
 <div class="fb-like" data-href="https://www.facebook.com/stroymarketplus" data-lazy="true" data-width="" data-layout="standard" data-action="like" data-size="small" data-share="false"></div>
</div>
      <?php if ($products) { ?>
      <div class="table-responsive">
        <table class="table table-bordered">
          <thead>
            <tr>
              <td class="text-center"><?php echo $column_image; ?></td>
              <td class="text-center"><?php echo $column_name; ?></td>
			  <td class="text-center"><?php echo $column_sku; ?></td>
              <td class="text-center"><?php echo $column_price; ?></td>
              <td class="text-center"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-center"><?php if ($product['thumb']) { ?>
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" width="250" height="250" alt="<?php echo $product['name']; ?>"/></a>
                <?php } ?></td>
              <td class="text-center"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <p><?php echo $product['description']; ?></p>
              </td>
			  <td class="text-center"><?php echo $product['sku']; ?>
            <?php if ($product['manufacturer']) { ?>
                <?php if ($product['logo_image']) { ?>
               <a href="<?php echo $product['manufacturers'] ?>" title="<?php echo $product['manufacturer']; ?>"><img src="<?php echo $product['logo_image']; ?>" width="150" height="100"/></a>
               <?php } else { ?>
               <a href="<?php echo $product['manufacturers'] ?>"><?php echo $product['manufacturer']; ?></a>
               <?php } ?> 
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
        </td>
              <td class="text-center"><?php if ($product['price']) { ?>
                <div class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
                  <?php } ?>
                </div>
                <?php } ?></td>
              <td class="text-center thumbr">
                <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', $(this).parent().parent().find('.quantity_input').val() );" data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="cartadd btn btn-primary">
                <?php if ($product['cart'] == true) { ?>
<?php echo $button_incart; ?>
<?php } else { ?>
<i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?>
<?php } ?></button>
              <div class="number">
         <input type="text" name="quantity" min="1" value="1" class="quantity_input maininp"/>
              <div class="number_controls number_controlsjs">
              <button type="button" class="nc-plus">+</button>
              <button type="button" class="nc-minus">-</button>  
            </div>
        </div>
         <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fas fa-balance-scale"></i></button>
                <a href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-times"></i></a></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      <?php } else { ?>
      <p class="successs"><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>