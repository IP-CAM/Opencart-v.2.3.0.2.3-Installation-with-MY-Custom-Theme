<<?php echo $header; ?><?php echo $column_left; ?>
<div id="content" class="forms">
    <div class="page-header">
        <div class="container-fluid">
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
                    <table class="multimodal-table">
                        <thead>
                        <tr>
                            <th width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
                            <th class="left"><?php if ($sort == 'name') { ?>
                                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                                <?php } else { ?>
                                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                                <?php } ?></th>
                            <th class="left"><?php echo $column_email ?></th>
                            <th class="left"><?php echo $column_telephone ?></th>
                            <th class="left"><?php echo $column_details ?></th>
                            <th class="left"><?php echo $column_manager_comment ?></th>
                            <th class="right"><?php if ($sort == 'date_add') { ?>
                                    <a href="<?php echo $sort_date_add; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_add; ?></a>
                                <?php } else { ?>
                                    <a href="<?php echo $sort_date_add; ?>"><?php echo $column_date_add; ?></a>
                                <?php } ?></th>
                            <th class="right"><?php echo $column_status; ?></th>
                            <th class="right"><?php echo $column_action; ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if ($requests) { ?>
                            <?php foreach ($requests as $request) { ?>
                                <tr data-request-id="<?php echo $request['request_id']; ?>" class="status_<?php echo $request['status']; ?>">
                                    <td >#<?php echo $request['request_id']; ?></td>
                                    <td class="left"><?php echo $request['name_form']; ?></td>
                                    <td class="left"><?php echo $request['email']; ?></td>
                                    <td class="left"><?php echo $request['telephone']; ?></td>
                                    <td class="left">
                                        <div class="detail-info"><?php
                                            if($request['fields']){
                                                foreach($request['fields'] as $field){ ?>
                                                    <b><?php echo $field['name'] ?>: </b><?php echo $field['value'] ?><br />
                                                <?php }
                                            } ?>
                                            <br />---------------------<br/>
                                            <b><?php echo $text_url ?>: </b><a href="<?php echo $request['url']?>" target="_blank"><?php echo $request['url']?></a><br />
                                            <b>Ip: </b><?php echo $request['ip_address']?>
                                        </div>
                                        <div class="show_more"><?php echo $text_show_more ?></div>
                                        <div class="hide_more"><?php echo $text_hide_more ?></div>
                                    </td>
                                    <td class="left comment">
                                        <span class="text"><?php echo $request['manager_comment']; ?></span><textarea class="manager_comment"><?php echo $request['manager_comment']; ?></textarea>
                                        <div class="cancel-edit"><i class="material-icons">keyboard_backspace</i></div><div class="save"><i class="material-icons">check</i></div>
                                    </td>
                                    <td class="right"><?php echo $request['date_add']; ?></td>
                                    <td class="left"><div class="change-status"><?php echo $request['text_status']; ?></div></td>
                                    <td class="actions">
                                        <div class="remove"><i class="material-icons">delete</i></div>
                                    </td>
                                </tr>
                            <?php } ?>
                        <?php } else { ?>
                            <tr>
                                <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </form>
                <div class="pagination"><?php echo $pagination; ?></div>
            </div>
        </div>
    </div>
</div>
    <script>
        $(document).on('ready', function(){
            $('td.comment').on('click', function(){
                var $row = $(this).closest('tr');
                if(!$row.hasClass('editable')){
                    $row.addClass('editable');
                }
            });

            $(document).on('click', '.save', function(){
                var $row = $(this).closest('tr');

                $.post('<?php echo $save_comment ?>',{
                    request_id:$row.attr('data-request-id'),
                    comment:$row.find('.manager_comment').val()
                });
                $row.removeClass('editable');
                $row.find('.comment .text').html($row.find('.manager_comment').val() );
            });

            $(document).on('click', '.change-status', function(){
                var $row = $(this).closest('tr');

                var status = 1;
                if(!$row.hasClass('status_1')){
                    $row.addClass('status_1').removeClass('status_0');
                    $(this).text('<?php echo $status_1?>');
                } else {
                    $row.addClass('status_0').removeClass('status_1');
                    $(this).text('<?php echo $status_0?>');
                    status = 0;
                }

                $.post('<?php echo $change_status ?>',{
                    request_id:$row.attr('data-request-id'),
                    status:status
                });

            });
            $(document).on('click','.cancel-edit', function(e){
                var $row = $(this).closest('tr');
                $(this).closest('tr').removeClass('editable');
            });
            $(document).on('click','.show_more', function(e){
                var $row = $(this).closest('tr');
                $(this).closest('tr').addClass('show-all');
            });
            $(document).on('click','.hide_more', function(e){
                var $row = $(this).closest('tr');
                $(this).closest('tr').removeClass('show-all');
            });
            $(document).on('click','.remove', function(e){
                if(!confirm('<?php echo $text_remove ?>')) return;

                var $row = $(this).closest('tr');

                $.post('<?php echo $remove ?>',{
                    request_id:$row.attr('data-request-id')
                });
                $row.remove();
            });

        })
    </script>
<?php echo $footer; ?>