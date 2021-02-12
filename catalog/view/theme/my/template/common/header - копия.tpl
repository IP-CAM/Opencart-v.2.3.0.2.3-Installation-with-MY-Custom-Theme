<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title;  ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css">
<link href="catalog/view/theme/my/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4 col-xs-6">
        <div id="logo">
          <?php if ($logo) { ?>
            <?php if ($home == $og_url) { ?>
              <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
            <?php } else { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
            <?php } ?>
          <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>	 
      </div>
      <div class="col-sm-8 col-xs-6">
    <div class="col-sm-3 hidden-xs">
     <div class="single-support"  data-toggle="tooltip" data-placement="bottom" title="Мы официальные диллеры лучших производителей по всем направлениям инструментов для ремонта авто и дома, строительных материалов, и промышленных товаров для обеспечения оптовых и розничных клиентов">
      <i class="fas fa-check-double"></i>
      <div class="support-text">
        <h3>Широкий ассортимент</h3>
      </div>
    </div>
    </div>
    <div class="col-sm-3 hidden-xs">
    <div class="single-support"  data-toggle="tooltip" data-placement="bottom" title="Обеспечиваем регулярные отправки почтовыми службами по всей Украине оптом и в розницу. От 4000 доставка бесплатная!">
      <i class="fas fa-shipping-fast"></i>
      <div class="support-text">
        <h3>Быстрая доставка</h3>
      </div>
    </div>
    </div>
    <div class="col-sm-3 hidden-xs">
      <div class="single-support"  data-toggle="tooltip" data-placement="bottom" title="У нас установлена минимальная цена от производителей, а для зарегестрированных покупателей предусмотрена система накопительной скидки. Оптовым клиентам есть специальный прайс, запрашивайте у менеджера.">
        <i class="fas fa-comment-dollar"></i>
        <div class="support-text">
        <h3>Скидки и бонусы</h3>
        </div>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="single-support"  data-toggle="tooltip" data-placement="bottom" title="Оставте заявку и менеджер свяжется с Вами в ближайшее время">
      <i class="fas fa-mobile-alt"></i>
      <div class="support-text">
      <h3>Звоните! </br>066 505 15 81</h3>
    </div>
    </div>
    </div>
    </div>
   	  <div class="col-sm-8 hidden-xs hidden-sm">
   <img src="image/ban2.png" alt="Стройматериалы оптом и в розницу" class="img-responsive" />
    </div>
	  <div class="col-sm-5 col-xs-9">	  	  
	  <?php echo $search; ?>
      </div>
      <div class="col-sm-3 col-xs-3"><?php echo $cart; ?></div>
    </div>
  </div>
</header>
<?php echo $menuvh;?>