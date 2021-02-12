<div class="inner" data-target="<?php echo $cnt ?>">
    <input class="hidden" name="modals[<?php echo $cnt ?>][id]" value="<?php echo $id_modal ?>"/>
    <div class="remove-modal"><?php echo $text_remove ?></div>
    <div class="form-group">
        <div class="left-content">
            <label><?php echo $text_status; ?></label>
        </div>
        <div class="right-content">
            <div class="styled-checkbox"><input name="modals[<?php echo $cnt ?>][status]" type="checkbox" id="st_window_<?php echo $cnt ?>"/><label for="st_window_<?php echo $cnt ?>"></label></div>
        </div>
    </div>
    <div class="form-group">
        <div class="left-content">
            <label><?php echo $text_title; ?></label>
        </div>
        <div class="right-content">
            <?php $cntL = 0; foreach ($languages as $language) { ?>
                <input type="text" class="_lang" data-lang="<?php echo $language['language_id']; ?>" placeholder="<?php echo $language['name'] ?>" name="modals[<?php echo $cnt ?>][title][<?php echo $language['language_id']; ?>]"/>
            <?php $cntL++; } ?>
        </div>
    </div>
    <div class="form-group">
        <div class="left-content">
            <label><?php echo $text_type_modal; ?></label>
        </div>
        <div class="right-content">
            <select name="modals[<?php echo $cnt ?>][type]" class="type_modal">
                <option value="default" selected><?php echo $text_type_modal_default; ?></option>
                <option value="form"><?php echo $text_type_modal_form; ?></option>
                <option value="offer"><?php echo $text_type_modal_offer; ?></option>
            </select>
        </div>
    </div>
    <div class="form-group show_type_form hidden">
        <div class="left-content">
            <label><?php echo $text_email_send; ?></label>
        </div>
        <div class="right-content">
            <input type="text" name="modals[<?php echo $cnt ?>][email]"/>
        </div>
    </div>
    <div class="form-group">
        <div class="left-content">
            <label><?php echo $text_show_modal; ?></label>
        </div>
        <div class="right-content">
            <select name="modals[<?php echo $cnt ?>][show_modal]" class="show_modal">
                <option value="mouseout" selected><?php echo $text_show_modal_mouseout; ?></option>
                <option value="timeout"><?php echo $text_show_modal_timeout; ?></option>
                <option value="track_time"><?php echo $text_show_modal_track_time; ?></option>
                <option value="selector"><?php echo $text_show_modal_selector; ?></option>
            </select>
            <br />
            <input type="text" class="hidden timeout" name="modals[<?php echo $cnt ?>][timeout]" placeholder="<?php echo $text_enter_timeout; ?>"/>
            <input type="text" class="hidden timeout track_time" name="modals[<?php echo $cnt ?>][track_time]" placeholder="<?php echo $text_show_modal_track_time; ?>"/>
            <input type="text" class="hidden selector" name="modals[<?php echo $cnt ?>][selector]" placeholder="<?php echo $text_enter_selector; ?>"/>
            <input type="text" class="hidden link" name="modals[<?php echo $cnt ?>][link]" placeholder="<?php echo $text_enter_link; ?>"/>
        </div>
    </div>
    <div class="form-group">
        <div class="left-content">
            <label><?php echo $text_show_customer_group; ?></label>
        </div>
        <div class="right-content">
            <div class="checkbox-group">
                <?php foreach ($customer_groups as $group) { ?>
                    <div class="item"><input type="checkbox" name="modals[<?php echo $cnt ?>][customer_groups][]" value="<?php echo $group['customer_group_id'] ?>"> <?php echo $group['name'] ?></div>
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
                   name="modals[<?php echo $cnt ?>][all_layouts]" checked/> <?php echo $text_all; ?>
            <div class="checkbox-group hidden">
                <?php foreach ($layouts as $layout) { ?>
                    <div class="item"><input type="checkbox" name="modals[<?php echo $cnt ?>][layouts][]" value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></div>
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
                   name="modals[<?php echo $cnt ?>][all_categories]" checked /> <?php echo $text_all; ?>
            <div class="checkbox-group hidden">
                <?php foreach ($categories as $product_categories) { ?>
                    <div class="item"><input type="checkbox" name="modals[<?php echo $cnt ?>][categories][]" value="<?php echo $product_categories['category_id'] ?>"> <?php echo $product_categories['name'] ?></div>
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
            <input type="text" class="product-autocomplete" placeholder="<?php echo $text_autocomplete_placeholder ?>"/>
            <div class="product-group"></div>
        </div>
    </div>
    <div class="form-group show_offers hidden">
        <div class="left-content">
            <label><?php echo $text_discount ?></label>
        </div>
        <div class="right-content disable">
            <div class="styled-checkbox"><input
                    name="modals[<?php echo $cnt ?>][discount]" class="st_discount" type="checkbox"
                    id="st_discount_<?php echo $cnt ?>"/><label for="st_discount_<?php echo $cnt ?>"></label></div>

            <select name="modals[<?php echo $cnt ?>][discount_type]" class="select_discount_type">
                <option value="percent"><?php echo $text_discount_percent; ?></option>
                <option value="sum"><?php echo $text_discount_sum; ?></option>
            </select>

            <div class="discount_type hidden" data-type="percent">
                <input type="text" name="modals[<?php echo $cnt ?>][discount_percent]" placeholder="<?php echo $text_discount_percent; ?>"/>
            </div>
            <div class="discount_type hidden" data-type="sum">
                <input type="text" name="modals[<?php echo $cnt ?>][discount_sum]" placeholder="<?php echo $text_discount_sum; ?>"/>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="left-content">
            <label><?php echo $text_tries_time ?></label><br />
            <div class="help"><?php echo $text_tries_time_help ?></div>
        </div>
        <div class="right-content">
            <input type="text" name="modals[<?php echo $cnt ?>][tries_time]"/>
        </div>
    </div>

    <div class="form-group">
        <div class="left-content">
            <label><?php echo $text_show_period; ?></label>
        </div>
        <div class="right-content">
            <div class="styled-checkbox"><input type="checkbox" name="modals[<?php echo $cnt ?>][st_period]" id="st_period_<?php echo $cnt; ?>"/><label for="st_period_<?php echo $cnt; ?>"></label></div>

            <div class="col-sm-3">
                <div class="input-group date">
                    <input type="text" name="modals[<?php echo $cnt ?>][period][from]" data-date-format="YYYY-MM-DD HH:mm" class="form-control" />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span>
                </div>
            </div>
            <div class="col-sm-1" style="text-align: center"><label> - </label></div>
            <div class="col-sm-3">
                <div class="input-group date">
                    <input type="text" name="modals[<?php echo $cnt ?>][period][to]" data-date-format="YYYY-MM-DD HH:mm" class="form-control" />
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
            <div class="help show_type_form hidden"><?php echo $text_content_help ?></div>
            <?php foreach ($languages as $language) { ?>
                <textarea class="_lang summernote" id="modal_content_<?php echo $cnt ?>_<?php echo $language['language_id']; ?>"
                          name="modals[<?php echo $cnt ?>][content][<?php echo $language['language_id']; ?>]"></textarea>
                <script>
                    $('#modal_content_<?php echo $cnt ?>_<?php echo $language['language_id']; ?>').summernote({height: 300});
                    // Override summernotes image manager
                    $('button[data-event=\'showImageDialog\']').attr('data-toggle', 'image').removeAttr('data-event');
                </script>
            <?php } ?>
        </div>
    </div>
</div>