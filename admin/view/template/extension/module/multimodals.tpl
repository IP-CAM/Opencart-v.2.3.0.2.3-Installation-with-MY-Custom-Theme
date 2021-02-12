<?php echo $header; ?><?php echo $column_left; ?>
    <div id="content">
        <div id="owner-notification" style="display: none;"></div>
    <?php if ($error_warning) { ?>
        <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="">
    <div id="tdw-tpl" >
        <div class="content-left">
            <div class="logo"><?php echo $heading_title; ?></div>
            <div class="tdw-tabs">
                <a href="#tab-list-modals"><?php echo $text_tab_list ?></a>
                <a href="#tab-offers"><?php echo $text_tab_offers ?></a>
                <a href="#tab-fields"><?php echo $text_tab_fields ?></a>
                <a href="#tab-stat" class="hidden"><?php echo $text_tab_stat ?></a>
            </div>
        </div><div class="content-right">
            <div class="heading">
                <h1><?php echo $text_tab_list; ?></h1>
                <div class="buttons">
                    <a href="#" id="save-form"><?php echo $button_save; ?></a>
                    <a href="<?php echo $cancel; ?>"><?php echo $button_cancel; ?></a>
                </div>
                <div class="langs">
                    <?php $cnt = 0; foreach($languages as $language){ ?>
                        <a href="#" <?php if($cnt==0){?>class="active"<?php } ?> data-lang="<?php echo $language['language_id']; ?>"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                    <?php $cnt++; } ?>
                </div>
            </div>
            <div class="content">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                    <div id="tab-list-modals" class="tabs-content">

                        <div class="list-modals">
                            <?php
                                $cntM = 1;
                                foreach($modals as $modal) {
                            ?>
                                    <a href="#" data-target="<?php echo $cntM ?>" <?php if ($cntM == 1) { ?>class="selected"<?php } ?>><?php echo $cntM ?></a>
                            <?php
                                    $cntM++;
                                }
                            ?>
                            <div id="add-modal"><span>+</span> Добавить</div>
                        </div>

                        <?php
                            $cnt = 1;

                            foreach($modals as $modal) {
                                ?>
                                <div class="inner <?php if ($cnt == 1) { ?>active<?php } ?>"
                                     data-target="<?php echo $cnt ?>">
                                    <input class="hidden" name="modals[<?php echo $cnt ?>][id]" value="<?php echo $modal['id'] ?>"/>
                                    <div class="remove-modal"><?php echo $text_remove ?></div>
                                    <div class="form-group">
                                        <div class="left-content">
                                            <label><?php echo $text_status; ?></label>
                                        </div>
                                        <div class="right-content">
                                            <div class="styled-checkbox"><input
                                                    name="modals[<?php echo $cnt ?>][status]" type="checkbox" <?php if($modal['status']){?>checked<?php } ?>
                                                    id="st_window_<?php echo $cnt ?>"/><label for="st_window_<?php echo $cnt ?>"></label></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="left-content">
                                            <label><?php echo $text_title; ?></label>
                                        </div>
                                        <div class="right-content">
                                            <?php foreach ($languages as $language) { ?>
                                                <input type="text" class="_lang" placeholder="<?php echo $language['name'] ?>"
                                                       data-lang="<?php echo $language['language_id']; ?>"
                                                       name="modals[<?php echo $cnt ?>][title][<?php echo $language['language_id']; ?>]"
                                                       value="<?php echo (isset($modal['title'][$language['language_id']])) ? $modal['title'][$language['language_id']] : ''; ?>"/>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="left-content">
                                            <label><?php echo $text_type_modal; ?></label>
                                        </div>
                                        <div class="right-content">
                                            <select name="modals[<?php echo $cnt ?>][type]" class="type_modal">
                                                <option value="default"
                                                        <?php if ($modal['type'] == 'default'){ ?>selected<?php } ?>><?php echo $text_type_modal_default; ?></option>
                                                <option value="form"
                                                        <?php if ($modal['type'] == 'form'){ ?>selected<?php } ?>><?php echo $text_type_modal_form; ?></option>
                                                <option value="offer"
                                                        <?php if ($modal['type'] == 'offer'){ ?>selected<?php } ?>><?php echo $text_type_modal_offer; ?></option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group show_type_form">
                                        <div class="left-content">
                                            <label><?php echo $text_email_send; ?></label>
                                        </div>
                                        <div class="right-content">
                                            <input type="text" name="modals[<?php echo $cnt ?>][email]" value="<?php echo $modal['email']?>"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="left-content">
                                            <label><?php echo $text_show_modal; ?></label>
                                        </div>
                                        <div class="right-content">
                                            <select name="modals[<?php echo $cnt ?>][show_modal]" class="show_modal">
                                                <option value="mouseout"
                                                        <?php if ($modal['show_modal'] == 'mouseout'){ ?>selected<?php } ?>><?php echo $text_show_modal_mouseout; ?></option>
                                                <option value="timeout"
                                                        <?php if ($modal['show_modal'] == 'timeout'){ ?>selected<?php } ?>><?php echo $text_show_modal_timeout; ?></option>
                                                <option value="track_time"
                                                        <?php if ($modal['show_modal'] == 'track_time'){ ?>selected<?php } ?>><?php echo $text_show_modal_track_time; ?></option>
                                                <option value="selector"
                                                        <?php if ($modal['show_modal'] == 'selector'){ ?>selected<?php } ?>><?php echo $text_show_modal_selector; ?></option>
                                                <option value="link"
                                                        <?php if ($modal['show_modal'] == 'link'){ ?>selected<?php } ?>><?php echo $text_show_modal_link; ?></option>
                                            </select>
                                            <br />
                                            <input type="text" class="hidden timeout track_time"
                                                   name="modals[<?php echo $cnt ?>][timeout]"
                                                   value="<?php echo $modal['timeout']; ?>"
                                                   placeholder="<?php echo $text_enter_timeout; ?>"/>
                                            <input type="text" class="hidden selector"
                                                   name="modals[<?php echo $cnt ?>][selector]" value="<?php echo $modal['selector']; ?>"
                                                   placeholder="<?php echo $text_enter_selector; ?>"/>
                                            <input type="text" class="hidden link"
                                                   name="modals[<?php echo $cnt ?>][link]" value="<?php echo $modal['link'];; ?>"
                                                   placeholder="<?php echo $text_enter_link; ?>"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="left-content">
                                            <label><?php echo $text_show_customer_group; ?></label>
                                        </div>
                                        <div class="right-content">
                                            <div class="checkbox-group">
                                                <?php foreach ($customer_groups as $group) { ?>
                                                    <div class="item"><input type="checkbox" name="modals[<?php echo $cnt ?>][customer_groups][]" <?php if(in_array($group['customer_group_id'], $modal['customer_groups'])){?>checked<?php } ?> value="<?php echo $group['customer_group_id'] ?>"> <?php echo $group['name'] ?>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group hide_offers">
                                        <div class="left-content">
                                            <label><?php echo $text_show_layouts; ?></label>
                                        </div>
                                        <div class="right-content">
                                            <input type="checkbox" class="layouts_all"
                                                   name="modals[<?php echo $cnt ?>][all_layouts]"
                                                   <?php if($modal['all_layouts']){?>checked<?php } ?> /> <?php echo $text_all; ?>
                                            <div class="checkbox-group <?php if($modal['all_layouts']){?>hidden<?php } ?>">
                                                <?php foreach ($layouts as $layout) { ?>
                                                    <div class="item"><input type="checkbox"
                                                                             <?php if(in_array($layout['layout_id'], $modal['layouts'])){?>checked<?php } ?>
                                                                             name="modals[<?php echo $cnt ?>][layouts][]"
                                                                             value="<?php echo $layout['layout_id'] ?>"> <?php echo $layout['name'] ?>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="left-content">
                                            <label><?php echo $text_show_categories; ?></label>
                                        </div>
                                        <div class="right-content">
                                            <input type="checkbox" class="categories_all"
                                                   name="modals[<?php echo $cnt ?>][all_categories]"
                                                   <?php if($modal['all_categories']){?>checked<?php } ?> /> <?php echo $text_all; ?>
                                            <div class="checkbox-group <?php if($modal['all_categories']){?>hidden<?php } ?>">
                                                <?php foreach ($categories as $product_categories) { ?>
                                                    <div class="item"><input type="checkbox"
                                                                             name="modals[<?php echo $cnt ?>][categories][]"
                                                                             <?php if(in_array($product_categories['category_id'], $modal['categories'])){?>checked<?php } ?>
                                                                             value="<?php echo $product_categories['category_id'] ?>"> <?php echo $product_categories['name'] ?>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="left-content">
                                            <label><?php echo $text_include_products; ?></label><br/>

                                            <div class="help"><?php echo $text_include_products_help; ?></div>
                                        </div>
                                        <div class="right-content">
                                            <input type="text" class="product-autocomplete"
                                                   placeholder="<?php echo $text_autocomplete_placeholder ?>"/>

                                            <div class="product-group">
                                                <?php foreach($modal['products'] as $idP => $product){?>
                                                    <div><?php echo $product ?>
                                                        <img src="view/image/delete.png" onclick="$(this).parent().remove();" alt="" />
                                                        <input type="hidden" name="modals[<?php echo $cnt ?>][include_products][]" value="<?php echo $idP ?>" /></div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group show_offers">
                                        <div class="left-content">
                                            <label><?php echo $text_discount ?></label>
                                        </div>
                                        <div class="right-content">
                                            <div class="styled-checkbox"><input
                                                    name="modals[<?php echo $cnt ?>][discount]" class="st_discount" type="checkbox" <?php if($modal['discount']){?>checked<?php } ?>
                                                    id="st_discount_<?php echo $cnt ?>"/><label for="st_discount_<?php echo $cnt ?>"></label></div>

                                            <select name="modals[<?php echo $cnt ?>][discount_type]" class="select_discount_type">
                                                <option value="percent" <?php if($modal['discount_type'] == 'percent'){?>selected<?php } ?>><?php echo $text_discount_percent; ?></option>
                                                <option value="sum" <?php if($modal['discount_type'] == 'sum'){?>selected<?php } ?>><?php echo $text_discount_sum; ?></option>
                                            </select>

                                            <div class="discount_type hidden" data-type="percent">
                                                <input type="text" name="modals[<?php echo $cnt ?>][discount_percent]" value="<?php echo $modal['discount_percent']; ?>" placeholder="<?php echo $text_discount_percent; ?>"/>
                                            </div>
                                            <div class="discount_type hidden" data-type="sum">
                                                <input type="text" name="modals[<?php echo $cnt ?>][discount_sum]" value="<?php echo $modal['discount_sum']; ?>" placeholder="<?php echo $text_discount_sum; ?>"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="left-content">
                                            <label><?php echo $text_tries_time ?></label><br />
                                            <div class="help"><?php echo $text_tries_time_help ?></div>
                                        </div>
                                        <div class="right-content">
                                            <input type="text" name="modals[<?php echo $cnt ?>][tries_time]" value="<?php echo $modal['tries_time']; ?>"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="left-content">
                                            <label><?php echo $text_show_period; ?></label>
                                        </div>
                                        <div class="right-content">
                                            <div class="styled-checkbox"><input type="checkbox" <?php if($modal['st_period']){?>checked<?php } ?>
                                                                                name="modals[<?php echo $cnt ?>][st_period]"
                                                                                id="st_period_<?php echo $cnt ?>"/><label
                                                    for="st_period_<?php echo $cnt ?>"></label></div>

                                            <div class="col-sm-3">
                                                <div class="input-group date">
                                                    <input type="text" name="modals[<?php echo $cnt ?>][period][from]" value="<?php echo date('Y-m-d H:i',strtotime($modal['date_from'])) ?>" data-date-format="YYYY-MM-DD HH:mm" class="form-control" />
                                                    <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-sm-1" style="text-align: center"><label> - </label></div>
                                            <div class="col-sm-3">
                                                <div class="input-group date">
                                                    <input type="text" name="modals[<?php echo $cnt ?>][period][to]" value="<?php echo date('Y-m-d H:i',strtotime($modal['date_to'])) ?>" data-date-format="YYYY-MM-DD HH:mm" class="form-control" />
                                                <span class="input-group-btn">
                                                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                </span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="left-content">
                                            <label><?php echo $text_content; ?></label>
                                        </div>
                                        <div class="right-content">
                                            <div class="help show_type_form"><?php echo $text_content_help ?></div>
                                            <?php foreach ($languages as $language) { ?>
                                                <textarea class="_lang summernote"
                                                           id="modal_content_<?php echo $cnt ?>_<?php echo $language['language_id']; ?>"
                                                          name="modals[<?php echo $cnt ?>][content][<?php echo $language['language_id']; ?>]">
                                                    <?php echo (isset($modal['content'][$language['language_id']])) ? $modal['content'][$language['language_id']] : ''; ?>
                                                </textarea>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                        <?php $cnt++;
                            }
                        ?>
                    </div>

                    <div id="tab-offers" class="tabs-content">
                        <div class="inner">
                            <div class="form-group">
                                <div class="left-content">
                                    <label><?php echo $text_delay ?></label><br />
                                    <div class="help"><?php echo $text_help_delay ?></div>
                                </div>
                                <div class="right-content">
                                    <input type="text" name="specialofferoutsite[delay]" value="<?php echo (($delay) ? $delay : 3000) ?>"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="left-content">
                                    <label><?php echo $text_interval ?></label><br />
                                    <div class="help"><?php echo $text_help_interval ?></div>
                                </div>
                                <div class="right-content">
                                    <input type="text" name="specialofferoutsite[interval]" value="<?php echo (($interval) ? $interval : 0) ?>"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="left-content">
                                    <label><?php echo $text_timeout_offers ?></label><br />
                                    <div class="help"><?php echo $text_help_timeout_offers ?></div>
                                </div>
                                <div class="right-content">
                                    <input type="text" name="specialofferoutsite[timeout_offers]" value="<?php echo (($timeout_offers) ? $timeout_offers : 0) ?>"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="left-content">
                                    <label><?php echo $text_exclude_products ?></label>
                                </div>
                                <div class="right-content">
                                    <label><input type="checkbox" name="specialofferoutsite[exclude_special]" <?php if($exclude_special){?>checked<?php } ?> /> <?php echo $text_exclude_special; ?> </label>
                                </div>
                            </div>

                            <div class="form-group low-price">
                                <div class="left-content">
                                    <label><?php echo $text_low_price ?></label><br />
                                    <div class="help"><?php echo $text_random_phrase ?></div>
                                </div>
                                <div class="right-content">
                                    <?php foreach($low_phrases as $phrase){ ?>
                                        <div class="phrase">
                                            <input type="text" name="specialofferoutsite[low_phrases][]" value="<?php echo $phrase ?>"/>
                                            <div class="remove-phrase">x</div>
                                        </div>
                                    <?php } ?>
                                    <a href="#" class="add-phrase" data-type="low"><?php echo $text_add ?></a>
                                </div>
                            </div>
                            <div class="form-group low-price">
                                <div class="left-content">
                                    <label><?php echo $text_high_price ?></label><br />
                                    <div class="help"><?php echo $text_random_phrase ?></div>
                                </div>
                                <div class="right-content">
                                    <?php foreach($high_phrases as $phrase){ ?>
                                        <div class="phrase">
                                            <input type="text" name="specialofferoutsite[high_phrases][]" value="<?php echo $phrase ?>"/>
                                            <div class="remove-phrase">x</div>
                                        </div>
                                    <?php } ?>
                                    <a href="#" class="add-phrase" data-type="high"><?php echo $text_add ?></a>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="left-content">
                                    <label><?php echo $text_off_tries ?></label>
                                </div>
                                <div class="right-content">
                                    <div class="styled-checkbox"><input
                                            name="specialofferoutsite[off_tries]" type="checkbox" <?php if($off_tries){?>checked<?php } ?>
                                            id="st_off_tries"/><label for="st_off_tries"></label></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="left-content">
                                    <label><?php echo $text_offer_order ?></label>
                                </div>
                                <div class="right-content">
                                    <div class="styled-checkbox"><input
                                            name="specialofferoutsite[offer_order_with_cart]" type="checkbox" <?php if($offer_order_with_cart){?>checked<?php } ?>
                                            id="st_offer_order_with_cart"/><label for="st_offer_order_with_cart"></label></div>
                                </div>
                            </div>
                            <div class="form-group hide_order_cart <?php if($offer_order_with_cart){?>hidden<?php } ?>">
                                <div class="left-content">
                                    <label><?php echo $text_checkout ?></label>
                                </div>
                                <div class="right-content">
                                    <label><input type="checkbox" name="specialofferoutsite[checkout_name]" <?php if($checkout_name){?>checked<?php } ?> /> <?php echo $text_checkout_name; ?></label> <br />
                                    <label><input type="checkbox" name="specialofferoutsite[checkout_phone]" <?php if($checkout_phone){?>checked<?php } ?> /> <?php echo $text_checkout_phone; ?></label> <br />
                                    <label><input type="checkbox" name="specialofferoutsite[checkout_email]" <?php if($checkout_email){?>checked<?php } ?> /> <?php echo $text_checkout_email; ?></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="left-content">
                                    <label><?php echo $text_offer_success ?></label>
                                </div>
                                <div class="right-content">
                                    <?php foreach ($languages as $language) { ?>
                                        <textarea class="_lang summernote" name="specialofferoutsite[offer_success][<?php echo $language['language_id']; ?>]" id="sp_offer_success_<?php echo $language['language_id']; ?>"><?php echo (isset($offer_success[$language['language_id']])) ? $offer_success[$language['language_id']] : ''; ?></textarea>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="tab-fields" class="tabs-content">
                        <div class="inner">
                            <div id="list-fields">
                            <?php
                            $cntField = 0;
                            if($fields) {
                                foreach ($fields as $field) {
                                    ?>
                                    <div class="item-field">
                                        <div class="item-field-row">
                                            <?php foreach ($languages as $language) { ?>
                                                <input class="form-control _lang"
                                                       data-lang="<?php echo $language['language_id']; ?>" type="text"
                                                       placeholder="<?php echo $text_name_field; ?> - <?php echo $language['name']; ?>"
                                                       name="specialofferoutsite[fields][<?php echo $cntField ?>][name][<?php echo $language['language_id']; ?>]"
                                                       value="<?php echo (isset($field['name'][$language['language_id']])) ? $field['name'][$language['language_id']] : '' ?>">

                                                <input class="form-control _lang"
                                                       data-lang="<?php echo $language['language_id']; ?>" type="text"
                                                       placeholder="<?php echo $text_placeholder_field; ?> - <?php echo $language['name']; ?>"
                                                       name="specialofferoutsite[fields][<?php echo $cntField ?>][placeholder][<?php echo $language['language_id']; ?>]"
                                                       value="<?php echo (isset($field['placeholder'][$language['language_id']])) ? $field['placeholder'][$language['language_id']] : '' ?>">
                                            <?php } ?>
                                            <div class="name-field"><b>{{field_<?php echo $cntField?>}}</b></div>
                                            <div class="remove-field"><?php echo $text_remove; ?></div>
                                        </div>
                                        <div class="item-field-row">
                                            <select class="form-control choose-type-field"
                                                    name="specialofferoutsite[fields][<?php echo $cntField ?>][type]">
                                                <?php foreach($type_fields as $type) {
                                                    if ($type == $field['type']) {
                                                        ?>
                                                        <option value="<?php echo $type ?>" selected><?php echo $type ?></option>
                                                    <?php } else { ?>
                                                        <option value="<?php echo $type ?>"><?php echo $type ?></option>
                                                    <?php }
                                                }?>
                                            </select>
                                            <?php foreach ($languages as $language) { ?>
                                                <input class="select-options hide-opts form-control _lang" style="width:450px;"
                                                       data-lang="<?php echo $language['language_id']; ?>" type="text"
                                                       placeholder="<?php echo $text_select_options_field; ?> - <?php echo $language['name']; ?>"
                                                       name="specialofferoutsite[fields][<?php echo $cntField ?>][select_options][<?php echo $language['language_id']; ?>]"
                                                       value="<?php echo (isset($field['select_options'][$language['language_id']])) ? $field['select_options'][$language['language_id']] : '' ?>">
                                            <?php } ?>
                                            <input class="phone-valid form-control hidden" style="width:400px;"
                                                   type="text"
                                                   placeholder="<?php echo $text_mask_phone; ?>"
                                                   name="specialofferoutsite[fields][<?php echo $cntField ?>][mask_phone]"
                                                   value="<?php echo (!empty($field['mask_phone'])) ? $field['mask_phone'] : '' ?>">
                                        </div>
                                        <div class="item-field-row">
                                            <label><input type="checkbox"
                                                          name="specialofferoutsite[fields][<?php echo $cntField ?>][required]" <?php if(isset($field['required'])){?>checked<?php } ?>> <?php echo $text_required; ?>
                                            </label>
                                            <?php foreach ($languages as $language) { ?>
                                                <input class="form-control _lang" style="width:450px;"
                                                       data-lang="<?php echo $language['language_id']; ?>" type="text"
                                                       placeholder="<?php echo $text_error_field; ?> - <?php echo $language['name']; ?>"
                                                       name="specialofferoutsite[fields][<?php echo $cntField ?>][error][<?php echo $language['language_id']; ?>]"
                                                       value="<?php echo (isset($field['error'][$language['language_id']])) ? $field['error'][$language['language_id']] : '' ?>">
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <?php
                                    $cntField++;
                                }
                            }?>
                            </div>
                            <div id="add-field">+ <?php echo $text_add_field; ?></div>
                        </div>
                    </div>

                    <div id="tab-stat" class="tabs-content">
                        <div class="inner">

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>
</div>
<script>
    $.fn.tabs = function() {
        var selector = this;

        this.each(function() {
            var obj = $(this);
            $(obj.attr('href')).hide();

            $(obj).click(function() {
                $(selector).removeClass('selected');
                $(selector).each(function(i, element) {
                    $($(element).attr('href')).hide();
                });
                $(this).addClass('selected');
                $($(this).attr('href')).show();

                return false;
            });
        });

        $(this).show()
            .first().click();
    };
</script>
<script type="text/javascript">

    var cntModal = '<?php echo $cnt ?>',
        customerGroups = <?php echo json_encode($customer_groups)?>,
        categories = <?php echo json_encode($categories)?>,
        layouts = <?php echo json_encode($layouts)?>;

    $('.tdw-tabs a').tabs();

    function SNUpdate(){
        jQuery('.summerNote').each( function() {
          $(this).val($(this).summernote('code'));
        });
    }

    $(function(){
        $(document).on("focus",".product-autocomplete",function(e) {
            var elem = $(this);
            elem.parent().find('.dropdown-menu').remove();
            elem.autocomplete({
                'source': function (request, response) {
                    $.ajax({
                        url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
                        dataType: 'json',
                        success: function (json) {
                            response($.map(json, function (item) {
                                return {
                                    label: item['name'],
                                    value: item['product_id']
                                }
                            }));
                        }
                    });
                },
                'select': function (item) {
                    var num_modal = parseInt($('.list-modals a.selected').attr('data-target'));
                    elem.parent().find('.product-group').append('<div>' + item['label'] + ' <a onclick="$(this).parent().remove();" >x</a><input type="hidden" name="modals[' + num_modal + '][include_products][]" value="' + item['value'] + '" /></div>');
                }
            })
        });
    });
    $(document).on('change', '.show_modal', function(){
        var item = $(this),
            val = item.val(),
            $parent = item.parent();

        $parent.find('input').addClass('hidden');
        $parent.find('input.'+val).removeClass('hidden');
    });

    $(document).on('change', '.type_modal', function() {
        var $parent = $(this).closest('.inner');
        $parent.find('.hide_offers').removeClass('hidden');
        $parent.find('.show_offers, .show_type_form').addClass('hidden');

        switch($(this).val()){
            case 'offer':
                $parent.find('.hide_offers').addClass('hidden');
                $parent.find('.show_offers').removeClass('hidden');
                break;
            case 'form':
                $parent.find('.show_type_form').removeClass('hidden');
                break;
        }

    });

    $('#st_offer_order_with_cart').on('click', function(){
        $(this).closest('.inner').find('.hide_order_cart').removeClass('hidden');
        if ( $(this).prop('checked') ) {
            $(this).closest('.inner').find('.hide_order_cart').addClass('hidden');
        }
    });

    $(document).on('change', '.select_discount_type', function(){
        var $parent = $(this).parent();
        $parent.find('.discount_type').addClass('hidden');
        $parent.find('.discount_type[data-type='+$(this).val()+']').removeClass('hidden');
    });
    $(document).on('change', '.st_discount', function(){
        var $input = $(this);
        if($input.prop('checked')){
            $(this).parent().parent().removeClass('disable');
            $('.select_discount_type').trigger('change');
        } else {
            $(this).parent().parent().addClass('disable');
        }
    });


    $('#counteroffer_type').on('change', function(){
        $('.counteroffer_type').addClass('hidden');
        $('.counteroffer_type[data-type='+$(this).val()+']').removeClass('hidden');
    });

    $('.add-phrase').on('click', function(e){
        e.preventDefault();
        var type = $(this).data('type');

        var row = $('<div class="phrase" />').html('<input type="text" name="specialofferoutsite['+type+'_phrases][]" />').append( $('<div class="remove-phrase" />').text('x'));
        $(this).before(row);
    });
    $(document).on('click','.phrase .remove-phrase', function(){
        var $val = $(this).prev().val();
        if($val.length){
            if(!confirm('<?php $text_remove ?> ?')) return;
        }
        $(this).parent().remove();
    });

    $(document).on('click', '.remove', function(e){
        e.preventDefault();
        $(this).parent().remove();
    });

    $('.langs a').on('click', function(e){
        e.preventDefault();
       $(this).addClass('active').siblings().removeClass('active');

        var id_lang = +$(this).attr('data-lang');
        $('._lang').addClass('hidden');
        $('._lang[data-lang='+id_lang +']').removeClass('hidden');

        $("[id^='modal_content_']").next().addClass('hidden');
        $("[id^='modal_content_']").filter('[id$='+id_lang+']').next().removeClass('hidden');

        $("[id^='sp_offer_success_']").next().addClass('hidden');
        $("[id^='sp_offer_success_']").filter('[id$='+id_lang+']').next().removeClass('hidden');

        $("[id^='sp_offer_content_']").next().addClass('hidden');
        $("[id^='sp_offer_content_']").filter('[id$='+id_lang+']').next().removeClass('hidden');
    });

    $(document).on('click', '.layouts_all, .categories_all', function(e){
       if($(this).prop('checked')){
           $(this).next().addClass('hidden');
       } else {
           $(this).next().removeClass('hidden');
       }
    });

    $('#save-form').on('click', function(e){
        e.preventDefault();
        SNUpdate();
        $.ajax({
            url: $('#form').attr('action'),
            type: 'post',
            dataType: 'json',
            data: $('#form').serialize(),
            success: function(res){
                if(res.success){
                    $('#owner-notification').html(res.success).addClass('res-success').show(300);
                    setTimeout(function(){
                        $('#owner-notification').hide(300).removeAttr('class');
                    }, 3000)
                }
                if(res.error){
                    $('#owner-notification').html(res.error).addClass('res-error').show(300);
                    setTimeout(function(){
                        $('#owner-notification').hide(300).removeAttr('class');
                    }, 3000)
                }
            }
        })
    });

    $(document).on('click', '.list-modals > a', function(e) {
        e.preventDefault();

        $(this).addClass('selected').siblings().removeClass('selected');
        $('#tab-list-modals .inner').removeClass('active');
        $('#tab-list-modals .inner[data-target=' + $(this).attr('data-target') + ']').addClass('active');

        $('.langs a.active').trigger('click');
    });

    $('#add-modal').on('click', function(e) {
        $.post('<?php echo $getHtmlModal ?>',{cnt: cntModal}, function(res){
            var response = JSON.parse(res);
            $('#tab-list-modals').append(response.html);
            $('#add-modal').before( $( '<a href="#" data-target="'+cntModal+'">'+cntModal+'</a>' ) );
            cntModal++;

            $('.list-modals > a:last').trigger('click');

            $('.date').datetimepicker({
                pickDate: true,
                pickTime: true
            });
        });

    });

    $(document).on('click', '.remove-modal', function() {
        if(!confirm('<?php echo $text_remove ?> ?')) return;

        var item = $(this),
            id_modal = item.prev().val();

        $.post('<?php echo $remove_action ?>', {id:id_modal}, function(){
            var cnt = item.closest('.inner').attr('data-target');
            item.closest('.inner').remove();
            $('.list-modals a[data-target='+cnt+']').remove();

            $('.list-modals > a:first').trigger('click');
        });
    });

    $(document).on('click', '.remove-field', function() {
        if(!confirm('<?php echo $text_remove ?> ?')) return;
        //$(this).parent().remove();
		$(this).parent().parent().remove();
    });

    var cntField = <?php echo $cntField ?>;
    $('#add-field').on('click', function(){
        var $html = $('<div class="item-field" />');

        var $row = $('<div class="item-field-row" >');

        <?php foreach($languages as $language){ ?>
        $row.append( $('<input class="form-control _lang" data-lang="<?php echo $language['language_id'] ?>" type="text" placeholder="<?php echo $text_name_field.' - '.$language['name'] ?>" name="specialofferoutsite[fields]['+cntField+'][name][<?php echo $language['language_id'] ?>]" />') );
        $row.append( $('<input class="form-control _lang" data-lang="<?php echo $language['language_id'] ?>" type="text" placeholder="<?php echo $text_placeholder_field.' - '.$language['name'] ?>" name="specialofferoutsite[fields]['+cntField+'][placeholder][<?php echo $language['language_id'] ?>]" />') );
        <?php } ?>
        var $short_tag = $('<div class="name-field" />').append( $('<b />').text('{{field_'+cntField+'}}') );
        var $remove = $('<div class="remove-field"><?php echo $text_remove ?></div>');
        $row.append($short_tag, $remove);

        var $sec_row = $('<div class="item-field-row" >');
        var $select = $('<select class="form-control choose-type-field" name="specialofferoutsite[fields]['+cntField+'][type]" />');
        <?php foreach($type_fields as $type) { ?>
        $select.append( $('<option />').attr('value','<?php echo $type ?>').text('<?php echo ucfirst($type) ?>') );
        <?php } ?>
        $sec_row.append($select);

        <?php foreach ($languages as $language) { ?>
        $sec_row.append( $('<input class="select-options hide-opts form-control _lang" style="width:450px;" data-lang="<?php echo $language['language_id'] ?>" type="text" placeholder="<?php echo $text_select_options_field.' - '.$language['name'] ?>" name="specialofferoutsite[fields]['+cntField+'][select_options][<?php echo $language['language_id'] ?>]" />') );
        <?php } ?>
        $sec_row.append( $('<input class="phone-valid form-control hidden" style="width:400px;" type="text" placeholder="<?php echo $text_mask_phone; ?>" name="specialofferoutsite[fields]['+cntField+'][mask_phone]"/>') );


        var $th_row = $('<div class="item-field-row" >');
        var $required = $('<label> <input type="checkbox" name="specialofferoutsite[fields]['+cntField+'][required]" /> <?php echo $text_required ?></label>');
        $th_row.append($required);
        <?php foreach ($languages as $language) { ?>
        $th_row.append( $('<input class="form-control _lang" style="width:450px;" data-lang="<?php echo $language['language_id'] ?>" type="text" placeholder="<?php echo $text_error_field.' - '.$language['name'] ?>" name="specialofferoutsite[fields]['+cntField+'][error][<?php echo $language['language_id'] ?>]" />') );
        <?php } ?>

        $html.append($row, $sec_row, $th_row);

        $('#list-fields').append($html);
        $('.langs a.active').trigger('click');
        cntField++;
    });

    $(document).on('change', '.choose-type-field', function(){
        var $val = $(this).val();

        if($val == 'select'){
            $(this).parent().find('.select-options').removeClass('hide-opts');
        } else {
            $(this).parent().find('.select-options').addClass('hide-opts');
        }

        if($val == 'telephone'){
            $(this).parent().find('.phone-valid').removeClass('hidden');
        } else {
            $(this).parent().find('.phone-valid').addClass('hidden');
        }
    });

   $(document).ready(function(){
       $('.show_modal, .type_modal, .discount_type, .st_discount, .select_discount_type').trigger('change');

       <?php
           foreach($languages as $language){
           $cnt = 1;
               foreach($modals as $modal) { ?>
                    $('#modal_content_<?php echo $cnt; ?>_<?php echo $language['language_id']; ?>').summernote({height: 300});
                <?php $cnt++; } ?>
        $('#sp_offer_success_<?php echo $language['language_id']; ?>').summernote({height: 300});
        <?php }?>

        // Override summernotes image manager
       $('button[data-event=\'showImageDialog\']').attr('data-toggle', 'image').removeAttr('data-event');

       $('.langs a:first').trigger('click');
       $('.choose-type-field').trigger('change');
       $('.date').datetimepicker({
           pickDate: true,
           pickTime: true
       });
    });

</script>

<?php echo $footer; ?>