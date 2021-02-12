<?php if($status_track){?>
    <script>
        trackTime();
        window.intervalTrackFunc = setInterval(function(){
            openWithTimeTrack();
        },1000);
    </script>
<?php } ?>
<?php echo $default; ?>
<?php echo $forms; ?>
<?php echo (isset($offers)) ? $offers : ''; ?>
