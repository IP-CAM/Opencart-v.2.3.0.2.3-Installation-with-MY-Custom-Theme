<?php foreach($modals['default'] as $id => $modal){ ?>
    <div id="popup-default-<?php echo $id ?>" class="multi-modal-content">
        <button class="popup-default-<?php echo $id ?>_close popup-close">x</button>
        <div class="popup-heading"><?php echo $modal['title'] ?></div>
        <div class="popup-content"><?php echo $modal['content'] ?></div>
    </div>
<?php } ?>
<?php if(!empty($modals['default'])){ ?>
    <script>
        $(document).ready(function() {
            <?php foreach($modals['default'] as $id => $modal){ ?>
            $('#popup-default-<?php echo $id ?>').popup();
            <?php
            switch($modal['show_modal']){
                  case 'selector':
            ?>
            $(document).on('click', '<?php echo $modal['selector']?>', function (e) {
                e.preventDefault();
                $('#popup-default-<?php echo $id ?>').popup('show');
            });
            <?php
                break;
                case 'link':
             ?>
            $(document).on('click', 'a[href="<?php echo $modal['link']?>"]', function (e) {
                e.preventDefault();
                $('#popup-default-<?php echo $id ?>').popup('show');
            });
            <?php
                break;
                case 'timeout':
             ?>
            openWithTimeout(<?php echo $id ?>,<?php echo $modal['timeout'] ?>, 'default');
            <?php
                break;
                case 'track_time':
             ?>
            idsModalTrackTime['default-<?php echo $id ?>'] = <?php echo $modal['timeout'] ?>;
            <?php
                break;
                case 'mouseout':
             ?>
            openMouseOut(<?php echo $id ?>, 'default');
            <?php break;
            }
        ?>
            <?php } ?>
        })
    </script>
<?php } ?>
