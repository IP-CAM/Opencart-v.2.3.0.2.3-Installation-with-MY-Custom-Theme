<?php foreach($modals['form'] as $id => $modal){ ?>
    <div id="popup-form-<?php echo $id ?>" class="popup-type-form multi-modal-content">
        <button class="popup-form-<?php echo $id ?>_close popup-close">x</button>
        <div class="popup-heading"><?php echo $modal['title'] ?></div>
        <form id="modal-form-<?php echo $id ?>">
            <div class="popup-content"><?php echo $modal['content'] ?></div>
            <div class="buttons">
                <div class="pull-right">
                    <a class="btn btn-primary" onclick="$('#popup-form-<?php echo $id ?>').popup('hide');return false;"><?php echo $text_cancel ?></a>
                    <a type="submit" class="btn btn-primary btn-send-modal-form" data-id-form="<?php echo $id ?>"><?php echo $text_send ?></a>
                </div>
            </div>
        </form>
    </div>
<?php } ?>
<?php if(!empty($modals['form'])){ ?>
<script>
<?php foreach($modals['form'] as $id => $modal){ ?>
    $('#popup-form-<?php echo $id ?>').popup();
    <?php
    switch($modal['show_modal']){
        case 'selector':
            ?>
            $(document).on('click', '<?php echo $modal['selector']?>', function (e) {
                e.preventDefault();
                $('#popup-form-<?php echo $id ?>').popup('show');
            });
            <?php
            break;
        case 'timeout':
            ?>
            openWithTimeout(<?php echo $id ?>,<?php echo $modal['timeout'] ?>, 'form');
            <?php
                break;
        case 'track_time':
             ?>
            idsModalTrackTime['default-<?php echo $id ?>'] = <?php echo $modal['timeout'] ?>;
            <?php break;
        case 'mouseout':
            ?>
            openMouseOut(<?php echo $id ?>, 'form');

            <?php break;
            case 'link':
                ?>
            $(document).on('click', 'a[href="<?php echo $modal['link']?>"]', function (e) {
                e.preventDefault();
                $('#popup-form-<?php echo $id ?>').popup('show');
            });
        <?php break;
}
?>
<?php } ?>
if( $('.validate-mask').length) {
    var s = document.createElement("script");
    s.type = "text/javascript";
    s.src = "catalog/view/javascript/jquery/multimodals/jquery.maskedinput.min.js";
    $("body").append(s);
    $('.validate-mask').each(function(){
        $(this).mask( $(this).attr('data-mask'));
    })
}
</script>
<?php } ?>