<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if ($groups) { ?>
       <?php foreach ($groups as $group) { ?>
        <h2><?php echo $text_hello; ?></b> <?php echo $firstname; ?> <?php echo $lastname; ?></h2>
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ru_RU/sdk.js#xfbml=1&version=v9.0" nonce="gDlQSxtS"></script>  
<div class="text-center" style="height:30px;">
 <div class="fb-like" data-href="https://www.facebook.com/stroymarketplus" data-lazy="true" data-width="" data-layout="standard" data-action="like" data-size="small" data-share="false"></div>
</div>          
        <ul class="account-menu">
        <?php foreach ($group['els'] as $el) { ?>
          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6" >
            <a href="<?php echo $el['url']; ?>"><img src="<?php echo $el['image']; ?>" width="64" height="64" alt="<?php echo $el['name']; ?>" ><div id = "<?php echo $el['id']; ?>"><?php echo $el['name']; ?></div></a>
          </div>
        <?php } ?>
        
            <div class="col-sm-12 col-xs-12 about">
        <h2 class="text-center"><?php echo $text_promocode; ?></h2>
        <p class="text-center"><?php echo $text_promocodedescription; ?></p>
        </div>
        
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
          <p><strong><?php echo $text_findpost; ?></strong></p>
           <div id="np-tracking" class="np-widget-hz np-w-br-12" style="height: 76px; width: 340px;"> <div id="np-first-state"> <div id="np-tracking-logo"></div> <div id="np-title"> <div class="np-h1"> <span class="np-h1-span1"><?php echo $text_otsledit; ?></span> <br> <span class="np-h1-span2"><?php echo $text_posilka; ?></span> </div> </div> <div id="np-input-container"> <div id="np-clear-input"></div> <input id="np-user-input" type="text" name="number" placeholder="<?php echo $text_nomerpost; ?>"> </div> <div id="np-warning-message"></div> <button id="np-submit-tracking" type="button" disabled="" style="background-color: rgb(209, 213, 218); border: 1px solid rgb(196, 196, 196); min-width: 100px; max-width: 110px;"> <span id="np-text-button-tracking"><?php echo $text_findnp; ?></span> <div id="np-load-image-tracking"></div> </button> <div id="np-error-status"></div> </div> <div id="np-second-state"> <div id="np-status-icon"></div> <div id="np-status-message"></div> <div class="np-track-mini-logo"> <div class="np-line-right"></div> <div class="np-line-left"></div> </div> <a href="#" id="np-more"><?php echo $text_podrobney; ?></a> <div id="np-return-button"> <span id="np-return-button-span"><?php echo $text_inshapos; ?></span> </div> </div> </div>
           <script type='text/javascript' id='track' charset='utf-8' data-lang='ru' apiKey='3c1f3432a460eb4b4953b2ae37339544' data-town='city-not-default' data-town-name='undefined' data-town-id='undefined' src='https://apimgmtstorelinmtekiynqw.blob.core.windows.net/content/MediaLibrary/Widget/Tracking/dist/track.min.js'></script>
        </div>
        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
          <p><strong><?php echo $text_raschetdost; ?></strong></p>
        <div id="np-calc-body" class="np-widget-hz np-w-br-12" style="background-color: rgb(255, 255, 255); width: 575px; min-height: 76px;"> <div class="np-calc-wrapper"> <div class="np-calc-logotype"></div> <div class="np-hl"></div> <span id="np-calc-title"> <span class="np-calc-title-span1">Расчёт стоимости</span> <br> <span class="np-calc-title-span2">доставки</span> </span> <div class="np-calc-list"> <div class="np-calc-field" name="dispatch" role="CitySender"> <input type="text" class="np-option-search-item np-option-search-item1" placeholder="Откуда" disabled=""> <div class="np-toggle-options-list"></div> <ul class="np-options-enter-point" role="CitySender"></ul> </div> <div id="np-arrows" name=""></div> <div class="np-calc-field" name="catch" role="CityRecipient"> <input type="text" class="np-option-search-item np-option-search-item2" placeholder="Куда"> <div class="np-toggle-options-list"></div> <ul class="np-options-enter-point" role="CityRecipient"></ul> </div> <div class="np-calc-field" name="weight" role="Weight"> <input type="text" class="np-option-search-item-weight" placeholder="Вес посылки"> </div> </div> <div class="np-line-background"></div> <button id="np-calc-submit" type="button"> <span id="np-text-button"><?php echo $text_raschetbutton; ?></span> <div id="np-load-image"></div> </button> </div> <div id="np-cost-field"> <div class="np-cost-field-container"> <p id="np-cost-number"></p> <span>грн</span> </div> <div class="np-cost-info-container"> <span class="np-cost-info-container-cost">Стоимость доставки</span><br> <div id="np-current-city"></div> <span class="np-current-city-weight">весом</span> <span id="np-current-weight"></span> <span>кг</span> </div> <div class="np-mini-logo"> <div class="np-line-left"></div> <div class="np-line-right"></div> </div> <a id="np-detail-cost" href="https://novaposhta.ua/delivery?utm_source=calc&amp;utm_medium=widget&amp;utm_term=calc&amp;utm_content=widget&amp;utm_campaign=NP" target="_blank">Детальный расчет</a> <button type="button" class="return-button" id="np-cost-return-button">Другая посылка</button> </div> <div id="np-error-field"> <div class="np-status-logo"> <img loading="lazy"  src="https://apimgmtstorelinmtekiynqw.blob.core.windows.net/content/MediaLibrary/Widget/img/not-found.svg" alt="error icon"> </div> <div class="np-error-info-container"> <span class="np-error-info-container-span">Извините!По техническим причинам мы не смогли рассчитать стоимость посылки</span> </div> <div class="np-mini-logo"> <div class="np-line-left"></div> <div class="np-line-right"></div> </div> <button type="button" class="return-button" id="np-error-return-button">Інша посилка</button> </div> </div>
        <script type='text/javascript' id='calc' charset='utf-8' data-lang='ru' apiKey='3c1f3432a460eb4b4953b2ae37339544' data-town='city-default' data-town-name='Харків' data-town-id='db5c88e0-391c-11dd-90d9-001a92567626' src='https://apimgmtstorelinmtekiynqw.blob.core.windows.net/content/MediaLibrary/Widget/Calc/dist/calc.min.js'></script>
        </div>
        </ul>
        <div class="clearfix"></div>
       <?php } ?>
      <?php } ?>
    <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script>
          setTimeout(function(){
                $('.alert').fadeOut() }, 1500);
</script>
<link rel='stylesheet' href='https://apimgmtstorelinmtekiynqw.blob.core.windows.net/content/MediaLibrary/Widget/Tracking/styles/tracking.css' />
<link rel='stylesheet' href='https://apimgmtstorelinmtekiynqw.blob.core.windows.net/content/MediaLibrary/Widget/Calc/styles/calc.css' />
<?php echo $footer; ?> 