<?php if(isset($offer) && $offer['id_modal']){ ?>
<div id="popup-offer-<?php echo $offer['id_modal'] ?>" class="multi-modal-content">
    <button class="popup-offer-<?php echo $offer['id_modal'] ?>_close popup-close">x</button>
    <div class="popup-heading"><?php echo $offer['title'] ?></div>
    <div class="popup-content offer-content">
        <div id="modal-offer" class="<?php if(isset($hide_try)){ ?>hide_start_step<?php } ?>">
            <div id="start_step">
                <div class="wait-offer"><?php echo $text_preload_text ?></div>
                <div class="inner-body">
                    <?php echo $offer['content'] ?>
                </div>
                <div class="tries">
                    <form id="offer-form-data">
                    <div class="offer-block">
                        <input type="text" id="offer-your-price" name="offer_value" />
                        <div id="offer-discount-response" style="display:none"></div>
                        <div class="owner-discount-bar">
                            <div id="offer-discount-bar-active" style="width: 0;"></div>
                            <div id="offer-discount-bar"><span><?php echo $text_bar ?></span></div>
                        </div>
                    </div>
                        <input type="hidden" name="id_modal" value="<?php echo $offer['id_modal'] ?>"/>
                        <input type="hidden" name="offer_product_id" value="<?php echo $product_id ?>"/>
                        <?php if($options){ ?>
                            <div id="selected-offer-options">
                                <div class="heading-options"><?php echo $text_change_options ?></div>
                                <div class="short-preview-options">
                                    <div class="result-select-options"></div>
                                    <?php foreach ($options as $option) { ?>
                                        <?php if ($option['type'] == 'select') { ?>
                                            <div id="offer-option-<?php echo $option['product_option_id']; ?>" data-type="select" class="offer-option <?php if ($option['required']) { ?>opt-required<?php } ?>">
                                                <div class="offer-name-option">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <?php echo $option['name']; ?>:
                                                </div>
                                                <select name="offer_option[<?php echo $option['product_option_id']; ?>]">
                                                    <?php if (!$option['required']) { ?>
                                                        <option value=""><?php echo $text_select; ?></option>
                                                    <?php } ?>
                                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                        <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                            <?php if ($option_value['price']) { ?>
                                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                            <?php } ?>
                                                        </option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'radio') { ?>
                                            <div id="offer-option-<?php echo $option['product_option_id']; ?>" data-type="radio" class="offer-option <?php if ($option['required']) { ?>opt-required<?php } ?>">
                                                <div class="offer-name-option">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <?php echo $option['name']; ?>:
                                                </div>
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                    <div class="offer-opt-group-radio">
                                                        <input type="radio" style="display: none" name="offer_option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="offer-option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                        <label for="offer-option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                            <?php if ($option_value['price']) { ?>
                                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                            <?php } ?>
                                                        </label>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'checkbox') { ?>
                                            <div id="offer-option-<?php echo $option['product_option_id']; ?>" data-type="checkbox" class="offer-option <?php if ($option['required']) { ?>opt-required<?php } ?>">
                                                <div class="offer-name-option">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <?php echo $option['name']; ?>:
                                                </div>
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                    <div class="offer-opt-group-checkbox">
                                                        <input type="checkbox" style="display: none" name="offer_option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="offer-option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                        <label for="offer-option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                            <?php if ($option_value['price']) { ?>
                                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                            <?php } ?>
                                                        </label>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'image') { ?>
                                            <div id="offer-option-<?php echo $option['product_option_id']; ?>" data-type="image" class="offer-option <?php if ($option['required']) { ?>opt-required<?php } ?>">
                                                <div class="offer-name-option">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <?php echo $option['name']; ?>:
                                                </div>
                                                <div class="offer-option-image">
                                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                        <div class="offer-image-item">
                                                            <input type="radio" style="display: none;" name="offer_option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="offer-option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                            <label for="offer-option-value-<?php echo $option_value['product_option_value_id']; ?>">
                                                                <img src="<?php echo $option_value['image']; ?>" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />
                                                            </label>
                                                        </div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'text') { ?>
                                            <div id="offer-option-<?php echo $option['product_option_id']; ?>" class="offer-option">
                                                <div class="offer-name-option">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <?php echo $option['name']; ?>:
                                                </div>
                                                <input type="text" name="offer_option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'textarea') { ?>
                                            <div id="offer-option-<?php echo $option['product_option_id']; ?>" class="offer-option">
                                                <?php if ($option['required']) { ?>
                                                    <span class="required">*</span>
                                                <?php } ?>
                                                <b><?php echo $option['name']; ?>:</b><br />
                                                <textarea name="offer_option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'file') { ?>
                                            <div id="offer-option-<?php echo $option['product_option_id']; ?>" class="offer-option">
                                                <div class="offer-name-option">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <?php echo $option['name']; ?>:
                                                </div>
                                                <input type="button" value="<?php echo $button_upload; ?>" id="offer-button-option-<?php echo $option['product_option_id']; ?>" class="button">
                                                <input type="hidden" name="offer_option[<?php echo $option['product_option_id']; ?>]" value="" />
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'date') { ?>
                                            <div id="offer-option-<?php echo $option['product_option_id']; ?>" class="offer-option">
                                                <div class="offer-name-option">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <?php echo $option['name']; ?>:
                                                </div>
                                                <input type="text" name="offer_option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="offer-date" />
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'datetime') { ?>
                                            <div id="offer-option-<?php echo $option['product_option_id']; ?>" class="offer-option">
                                                <div class="offer-name-option">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <?php echo $option['name']; ?>:
                                                </div>
                                                <input type="text" name="offer_option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="offer-datetime" />
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'time') { ?>
                                            <div id="offer-option-<?php echo $option['product_option_id']; ?>" class="offer-option">
                                                <div class="offer-name-option">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <?php echo $option['name']; ?>:
                                                </div>
                                                <input type="text" name="offer_option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="offer-time" />
                                            </div>
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                            </div>
                        <?php } ?>
                    </form>
                    <div class="result-offer">
                        <div class="left-side">
                            <div class="side-title"><?php echo $text_left_side_title ?></div>
                            <span class="price-start"><?php echo $formatted_price ?></span>
                        </div>
                        <div class="right-side">
                            <div class="side-title"><?php echo $text_right_side_title ?></div>
                            <span id="economy">----- (--%)</span>
                        </div>
                    </div>
                    <div id="makeOffer"><?php echo $text_make_offer ?></div>
                </div>
            </div>
            <div id="form-success-sp_offer">
                <div class="heading">
                    <h2><?php echo (isset($off_tries)) ? $offer['title'] : $text_title_form ?></h2>
                </div>
                <div class="inner-body text">
                    <?php echo (isset($off_tries)) ? $text_content_off_tries : html_entity_decode($text_text_form, ENT_QUOTES, 'UTF-8'); ?>
                </div>
                <div class="inner-body">
                    <div id="send-special-order">
                        <div id="your-prise-offer"><?php echo (isset($get_offer)) ? $get_offer : ''; ?></div>
                        <input type="hidden" name="id_modal" value="<?php echo $offer['id_modal'] ?>">
                        <input type="hidden" name="sp_of_form_product_id" value="<?php echo $product_id ?>">
                        <?php if(!isset($offer_order_with_cart)){ ?>
                            <?php if(isset($checkout_name)) { ?>
                                <div class="form-group">
                                    <input type="text" name="sp_of_form_name" placeholder="<?php echo $text_name ?>" />
                                </div>
                            <?php } ?>
                            <?php if(isset($checkout_phone)) { ?>
                                <div class="form-group">
                                    <input type="text" name="sp_of_form_phone" placeholder="<?php echo $text_phone ?>" />
                                </div>
                            <?php } ?>
                            <?php if(isset($checkout_email)) { ?>
                                <div class="form-group">
                                    <input type="text" name="sp_of_form_email" placeholder="<?php echo $text_email ?>" />
                                </div>
                            <?php } ?>
                        <?php } ?>
                        	<div class="text-center">
						<img src="<?php echo $thumb; ?>" width="150" height="150" title="<?php echo $product_name; ?>" alt="<?php echo $product_name; ?>" />
						</div>
                    </div>
                    <?php if(isset($off_tries) && isset($offer_order_with_cart)){ ?>
					<div class="text-center">
                        <button class="btn btn-primary" id="sendOfferWithCart"><?php echo $text_sendOffer ?></button>
						</div>
                    <?php } else { ?>
                        <div id="sendOffer" class="sendOffer"><?php echo $text_sendOffer ?></div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>
    <script>
        $(document).ready(function() {
            $('#popup-offer-<?php echo $offer['id_modal'] ?>').popup();
            <?php
                switch($offer['show_modal']){
                      case 'selector':
                ?>
                $(document).on('click', '<?php echo $offer['selector']?>', function (e) {
                    e.preventDefault();
                    $('#popup-offer-<?php echo $offer['id_modal'] ?>').popup('show');
                });
                <?php
                    break;
                     case 'link':
                    ?>
                    $(document).on('click',  'a[href="<?php echo $offer['link']?>"]', function (e) {
                        e.preventDefault();
                        $('#popup-offer-<?php echo $offer['id_modal'] ?>').popup('show');
                        if(type=='offer') setTimeout(function() { $('#offer-your-price').focus() }, 500);
                    });
            <?php
                 break;
                    case 'timeout':
                 ?>
                openWithTimeout(<?php echo $offer['id_modal'] ?>,<?php echo $offer['timeout'] ?>, 'offer');
                <?php
                    break;
            case 'track_time':
                 ?>
                idsModalTrackTime['default-<?php echo $id ?>'] = <?php echo $modal['timeout'] ?>;
                <?php
                    break;
                    case 'mouseout':
                 ?>
                openMouseOut(<?php echo $offer['id_modal'] ?>, 'offer');
                <?php break;
                }
            ?>

            var start_price = roundNumber('<?php echo $price ?>'),
                min_price = roundNumber('<?php echo $minimum_price ?>'),
                symbol = '<?php echo $currency_symbol ?>',
                opened_popup,
                $bar = $('#offer-discount-bar-active'),
                $economy = $('#economy'),
                $economy_null = $economy.html();

            function getPriceOffer(){
                $.ajax({
                    url: '<?php echo $link_get_price ?>',
                    type: 'post',
                    dataType: 'json',
                    data: $('#offer-form-data input[type=\'hidden\'], #selected-offer-options input[type=\'radio\']:checked, #selected-offer-options input[type=\'checkbox\']:checked, #selected-offer-options select'),
                    success: function(res){
                        if(res.min_price && res.max_price){
                            start_price = roundNumber(res.max_price);
                            min_price = roundNumber(res.min_price);

                            $('.result-offer .price-start').html(res.max_price_format);
                            $('#offer-your-price').trigger('keyup');
                        }
                    }
                })
            }

            $('#offer-your-price').on('keyup', function(){

                $('#offer-your-price').removeClass('low');
                $('#offer-discount-response').hide();
                $('.result-offer').css('opacity',1);

                var $val = roundNumber($(this).val());
                if( $val >= min_price && $val <= start_price ){
                    var $get_economy = start_price - $val,
                        $get_percent = ($get_economy/start_price * 100).toFixed(2);

                    $get_economy = Math.round($get_economy) + symbol + ' (' + parseFloat($get_percent).toFixed(2) + '%)';
                    $economy.html( $get_economy);

                    var range = start_price - min_price,
                        range_2 = $val - min_price;

                    $('#offer-your-price').removeClass('low');

                    $bar.stop().animate({
                        width: ( range_2 / range * 100) + '%'
                    }, 500);
                    //$bar.css('width', 'rect(0px, '+ $get_percent / 300 * 100 +'px, 15px, 0px)')
                } else {
                    $economy.html($economy_null);
                    $bar.stop().animate({
                        width: '0'
                    }, 500);
                    //$bar.css('clip', 'rect(0px, 0px, 15px, 0px)')
                }
            });

            $('#makeOffer').on('click', function(){
                var $val = roundNumber($('#offer-your-price').val());

                $('#offer-your-price').removeClass('low');
                $('#offer-discount-response').hide();
                $('.result-offer').css('opacity',1);

                $.ajax({
                    url: '<?php echo $link_try ?>',
                    type: 'POST',
                    dataType: 'json',
                    cache: false,
                    data: $('#offer-your-price, #offer-form-data input[type=\'hidden\'], #offer-form-data input[type=\'radio\']:checked, #offer-form-data input[type=\'checkbox\']:checked, #offer-form-data select'),
                    success: function(res){
                        if(res.error){
                            if (res.error.option) {
                                $('#selected-offer-options .short-preview-options, #selected-offer-options .heading-options').addClass('opened');
                                for (i in res.error.option) {
                                    $('#offer-option-' + i).before('<span class="error">' + res.error.option[i] + '</span>');
                                }
                                $('#offer-discount-response').html( res.error_text ).show();
                                return false;
                            }
                        }
                        if(!res.error) {
                            $('#offer-your-price').removeClass('low');
                            $('#offer-discount-response').hide();
                            $('.result-offer').css('opacity', 1);
                        }
                        if(res.low_price){
                            //$('.result-offer').css('opacity',0);
                            $('#offer-your-price').addClass('low');
                            $('#offer-discount-response').html( res.low_price).show();
                            return false;
                        }
                        if(res.high_price){
                            //$('.result-offer').css('opacity',0);
                            $('#offer-your-price').addClass('low');
                            $('#offer-discount-response').html( res.high_price).show();
                            return false;
                        }
                        $('.wait-offer').addClass('active');

                        setTimeout(function(){
                            $('.wait-offer').removeClass('active');
                            if(res.success){
                                $('#your-prise-offer').html(res.success);
                                $('#modal-offer').addClass('hide_start_step');
                            }
                        }, <?php echo (isset($delay) ? $delay : 3000) ?>);
                    }
                });
            });

            $('#sendOfferWithCart').on('click', function(){
                $.ajax({
                    url: '<?php echo $link_send_offer_with_cart ?>',
                    type: 'POST',
                    dataType: 'json',
                    data: $('#send-special-order input'),
                    success: function(res){
                        location.href = '<?php echo $checkout ?>';
                    }
                });
            });

            $('#sendOffer').on('click', function(){
                $('#send-special-order .input_error').removeClass('input_error');
                <?php if(isset($offer_order_with_cart)){ ?>
                    location.href = '<?php echo $checkout ?>';
                <?php } else { ?>
                    $.ajax({
                        url: '<?php echo $link_send_offer ?>',
                        type: 'POST',
                        dataType: 'json',
                        data: $('#send-special-order input'),
                        success: function(res){
                            if(res.errors){
                                for(var i in res.errors){
                                    $('[name=sp_of_form_'+i+']').addClass('input_error');
                                }
                            }
                            if(res.success){
                                $('#modal-offer').html(res.success);
                            }
                        }
                    });
                <?php } ?>
            });

            //Enable default required select options
            <?php if($options){ ?>
            $('#selected-offer-options input, #selected-offer-options select').on('change', function(){
                getPriceOffer();
            });
            $('.offer-option.opt-required').each(function(){
                $(this).find('input:first').prop('checked', true);
            });
            getPriceOffer();
            <?php } ?>

            $('.offer-date').datetimepicker({
                pickTime: false
            });

            $('.offer-datetime').datetimepicker({
                pickDate: true,
                pickTime: true
            });
            $('.offer-time').datetimepicker({
                pickTime: true
            });
        })
    </script>
<?php } ?>
