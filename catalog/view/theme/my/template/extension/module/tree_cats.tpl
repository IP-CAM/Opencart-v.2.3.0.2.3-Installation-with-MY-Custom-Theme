<?php

function catsToHtml($tree, $active = null){
    $str = '';
    foreach ($tree as $category) {
        $str .= catToTemplate($category, $active);
    }
    return $str;
}

function catToTemplate($category, $active){;
    ob_start();
    require __DIR__ . '/cats_template.tpl';
    return ob_get_clean();
}
$cats = catsToHtml($categories_tree, $active);
?>

<div class="navigation hidden-xs">
<ul class="list-group">
    <?=$cats;?>
</ul>
</div>