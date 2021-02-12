<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title><?php echo $text_subject_form; ?></title>
</head>
<body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;">
<p><a href="<?php echo $link ?>"><?php echo $name ?></a></p>
<?php if(isset($checkout_name)){?>
    <p><b><?php echo $text_name ?>:</b> <?php echo $checkout_name ?></p>
<?php } ?>
<?php if(isset($checkout_phone)){?>
    <p><b><?php echo $text_phone ?>:</b> <?php echo $checkout_phone ?></p>
<?php } ?>
<?php if(isset($checkout_email)){?>
    <p><b><?php echo $text_email ?>:</b> <?php echo $checkout_email ?></p>
<?php } ?>
<p><b><?php echo $text_offer ?>:</b> <?php echo $offer ?></p>

</body>
</html>
