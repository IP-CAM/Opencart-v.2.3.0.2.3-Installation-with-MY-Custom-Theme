<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link href="view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="all" />
<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="all" />
</head>
<body>
<div class="container">
  <?php foreach ($orders as $order) { ?>
  <div style="page-break-after: always;">
    <h1>Накладная №<?php echo $order['order_id']; ?> от <?php echo $order['date_added']; ?></h1>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td><?php echo $text_order_detail; ?></td>
		  <td><b>Покупатель:</b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td style="width: 50%;"><address>
          <img src="image/stroymarketplus.png" width="120px" class="img-responsive">
            <strong><?php echo $order['store_name']; ?></strong><br />
            <?php echo $order['store_address']; ?>
            </address>
            <b><?php echo $text_telephone; ?></b> <?php echo $order['store_telephone']; ?><br />
            <?php if ($order['store_fax']) { ?>
            <b><?php echo $text_fax; ?></b> <?php echo $order['store_fax']; ?><br />
            <?php } ?>
            <b><?php echo $text_email; ?></b> <?php echo $order['store_email']; ?><br />
            <b><?php echo $text_website; ?></b> <a href="<?php echo $order['store_url']; ?>"><?php echo $order['store_url']; ?></a></td>
		  <td style="width: 50%;"><address>
		  <?php echo $order['shipping_address']; ?>
		  <br/>
		  <b><?php echo $order['telephone']; ?></b><br/>
		  </address>
		  <?php echo $order['email']; ?><br/>
		   <b><?php echo $text_payment_method; ?></b> <?php echo $order['payment_method']; ?><br />
           <?php if ($order['shipping_method']) { ?>
           <b><?php echo $text_shipping_method; ?></b> <?php echo $order['shipping_method']; ?><br />
           <?php } ?>
		  </td>	
        </tr>
      </tbody>
    </table>
    <table class="table table-bordered">
      <thead>
        <tr>
        <td>№</td>
          <td><b><?php echo $column_product; ?></b></td>
           <td><b><?php echo $column_manufacturer; ?></b></td>
          <td><b><?php echo $column_model; ?></b></td>
           <td><b><?php echo $text_sku; ?></b></td>
          <td class="text-right"><b><?php echo $column_quantity; ?></b></td>
          <td class="text-right"><b><?php echo $column_price; ?></b></td>
          <td class="text-right"><b><?php echo $column_total; ?></b></td>
        </tr>
      </thead>
      <tbody>
        <?php $i = 1; foreach ($order['product'] as $product) { ?>
        <tr>
        <td><?= $i ?></td>
          <td><?php echo $product['name']; ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
            <?php } ?></td>
          <td><?php echo $product['manufacturer_name']; ?></td>
          <td><?php echo $product['model']; ?></td>
          <td><?php echo $product['sku']; ?></td>
          <td class="text-right"><?php echo $product['quantity']; ?></td>
          <td class="text-right"><?php echo $product['price']; ?></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
        </tr>
        <?php $i++; ?>
        <?php } ?>
        <?php foreach ($order['voucher'] as $voucher) { ?>
        <tr>
          <td><?php echo $voucher['description']; ?></td>
          <td></td>
          <td class="text-right">1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
        </tr>
        <?php } ?>
        <?php foreach ($order['total'] as $total) { ?>
        <tr>
          <td class="text-right" colspan="7"><b><?php echo $total['title']; ?></b></td>
          <td class="text-right"><strong><?php echo $total['text']; ?></strong></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
    <?php if ($order['comment']) { ?>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td><b><?php echo $text_comment; ?></b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><?php echo $order['comment']; ?></td>
        </tr>
      </tbody>
    </table>
    <?php } ?>
  </div>
  <?php } ?>
</div>
</body>
</html>