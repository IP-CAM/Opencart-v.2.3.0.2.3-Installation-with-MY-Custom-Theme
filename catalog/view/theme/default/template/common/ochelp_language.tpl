<?php if (count($languages) > 1) { ?>
		<button class="btn-link dropdown-toggle ochelp_multilang" data-toggle="dropdown">
			<?php foreach ($languages as $language) { ?>
			<?php if ($language['code'] == $code) { ?>
			<img src="catalog/language/uk-ua/uk-ua.png" widht="16" height="11" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
			<?php } ?>
			<?php } ?>
			<span> <?php echo $text_language; ?></span><i class="fa fa-caret-down hidden-xs"></i></button>
		<ul id="ochelp_multilang" class="dropdown-menu pull-right">
			<?php foreach ($languages as $language) { ?>
			<li><a data-href="<?php echo $language['href_lang']; ?>" class="btn btn-link btn-block" href="<?php echo $language['href']; ?>">
			<?php echo $language['name']; ?></a></li>
			<?php } ?>
		</ul>
	<script>
		$('#ochelp_multilang a').each(function(e){
			$(this).attr('href', $(this).attr('data-href'));
		});
	</script>
<?php } ?>