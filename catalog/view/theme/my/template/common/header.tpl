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
<meta name="robots" content="noindex,nofollow" />
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
<meta name="theme-color" content="#00CC52">
<link rel="preload" href="/catalog/view/theme/my/webfonts/fa-regular-400.woff2" as="font" type="font/woff2" crossorigin>
<link rel="preload" href="/catalog/view/theme/my/webfonts/mem5YaGs126MiZpBA-UN7rgOVuhpOqc.woff2" as="font" type="font/woff2" crossorigin>
<link rel="preload" href="/catalog/view/theme/my/webfonts/mem8YaGs126MiZpBA-UFUZ0bbck.woff2" as="font" type="font/woff2" crossorigin>
<link rel="preload" href="/catalog/view/theme/my/webfonts/mem8YaGs126MiZpBA-UFVZ0b.woff2" as="font" type="font/woff2" crossorigin>
<link rel="preload" href="/catalog/view/theme/my/webfonts/mem5YaGs126MiZpBA-UN7rgOUuhp.woff2" as="font" type="font/woff2" crossorigin>
<link rel="preload" href="/catalog/view/theme/my/webfonts/fa-solid-900.woff2" as="font" type="font/woff2" crossorigin>
<link rel="stylesheet" type="text/css" href="/catalog/view/theme/my/stylesheet/style.mini.css">
<?php foreach ($styles as $style) { ?>
<link type="text/css" rel="<?php echo $style['rel']; ?>" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php if ($logged) { ?>
<input type="hidden" value="<?php echo $customer_id; ?>" id="userid" />
<?php } else { ?>
<input type="hidden" value="0" id="userid" />
<?php } ?>
<input type="hidden" value="<?php echo $button_incart; ?>" id="incart" />
<input type="hidden" value="<?php echo $label_categories; ?>" id="label_categories" /> 
<input type="hidden" value="<?php echo $label_manufac; ?>" id="label_manufac" /> 
<input type="hidden" value="<?php echo $label_product; ?>" id="label_product" /> 
<input type="hidden" value="<?php echo $label_showall; ?>" id="label_showall" /> 
<input type="hidden" value="<?php echo $label_nores; ?>" id="label_nores" /> 
<script type="text/javascript" src="/catalog/view/javascript/main.mini.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">

<header>
  <div class="container">
    <div class="row">
	  <div class="col-sm-12 col-xs-12 text-center"> 
	  <div id="logo">
          <?php if ($logo) { ?>
            <?php if ($home == $og_url) { ?>
              <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" width="1200" height="143" alt="<?php echo $name; ?>" class="img-responsive" />
            <?php } else { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" width="1200" height="143" alt="<?php echo $name; ?>" class="img-responsive" /></a>
            <?php } ?>
          <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div> 
<ul class="nav navbarves text-center">
    <li><a href="viber://chat?number=380950417331" class="hidden-xs" title="Viber" rel="nofollow"><img src="/image/viber.png" width="18" height="18"/></a></li>
     <li><a href="viber://add?number=380950417331" class="hidden-lg hidden-sm hidden-md" rel="nofollow"><img src="/image/viber.png" width="18" height="18"/></a></li>
     <li><a href="https://www.instagram.com/vesyuniversal" target="_blank" title="<?php echo $text_instagram; ?>"><img src="/image/instagram.png" width="18" height="18"></a></li>
<li data-toggle="tooltip" data-placement="right auto" title="<?php echo $text_callback; ?>"><a href="tel:+380950417331" rel="nofollow" class="telephone"><i class="fas fa-mobile-alt"></i> 095 041 73 31</a></li>
<li data-toggle="tooltip" data-placement="right auto" title="<?php echo $text_callback; ?>"><a href="tel:+380935321415" rel="nofollow" class="telephone"><i class="fas fa-mobile-alt"></i> 093 532 14 15</a></li>
<li data-toggle="tooltip" data-placement="right auto" title="<?php echo $text_callback; ?>"><a href="tel:+380684482962" rel="nofollow" class="telephone"><i class="fas fa-mobile-alt"></i> 068 448 29 62</a></li>
        <li><a href="<?php echo $about; ?>"><?php echo $text_about; ?></a></li>
        <li><a href="<?php echo $delivery; ?>"><?php echo $text_delivery; ?></a></li>
        <li><a href="<?php echo $blog; ?>"><?php echo $text_blog; ?></a></li>
        <li><?php echo $language; ?></li>     
    </ul>
      </div>
    </div>
  </div>
</header>