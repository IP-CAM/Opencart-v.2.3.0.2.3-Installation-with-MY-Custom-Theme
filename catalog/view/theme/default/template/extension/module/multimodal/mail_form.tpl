<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title><?php echo $text_subject_form; ?></title>
</head>
<body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;">
<p><?php echo date('Y-m-d H:i:s')?></p>
<p><?php echo $url ?></p>
<?php foreach($fields as $key => $field){ ?>
    <b><?php echo $all_fields[$key] ?>: </b> <?php echo $field ?><br />
<?php } ?>
</div>
</body>
</html>
