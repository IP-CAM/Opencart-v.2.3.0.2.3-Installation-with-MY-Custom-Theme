<?php
// Heading
$_['heading_title']                = '<a href="https://gixoc.ru">GixOC.ru</a> - <b>Admin Security: Two-Factor Authentication / Двухфакторная авторизация при входе в админку (E-mail, Telegram, Viber)</b>';
$_['text_title']                   = 'GixOC.ru - Admin Security: Two-Factor Authentication / Двухфакторная авторизация';

// Text
$_['text_module']                  = 'Modules';
$_['text_success']                 = 'Settings saved';
$_['text_edit']                    = 'Settings';

// Entry
$_['entry_status']                 = 'Status';
$_['entry_auto']                   = 'Get automatically';
$_['entry_wait']                   = 'Please wait...';
//E-mail
$_['entry_email_succes']           = 'Send password to E-mail';
$_['entry_email']                  = 'E-mail ';
//Telegram
$_['entry_telegram']               = 'Send password to Telegram';
$_['entry_telegram_key']           = 'Telegram Bot API Token ';
$_['entry_chat_id_place']          = 'Enter your chat id (keep it empty, it will be filled automatically)';
$_['entry_chat_id']                = 'Your Telegram ID ';
$_['entry_get_token']              = 'Get your Telegram Token';
//Viber
$_['entry_viber']                  = 'Send message to Viber';
$_['entry_viber_key']              = 'Viber Bot API Token';
$_['entry_chat_id_place_viber']    = 'Enter your chat id (keep it empty, it will be filled automatically)';
$_['entry_chat_id_viber']          = 'Your Viber ID ';
$_['entry_get_token_viber']        = 'Get your Viber Token';
$_['entry_viber_reg']              = 'Install Webhook';
$_['entry_viber_gixoc']            = 'The decision from the author of the module';

// Error
$_['error_telegram']               = ' <b>Sorry, Telegram is not available.</b> Most likely, the servers of your hosting provider are located in the Russian Federation, where, at the request of Roskomnadzor, Telegram is blocked. We advise you to use the Viber notification method.';
$_['error_telegram1']              = 'The authentication Telegram Bot API Token is not valid!';
$_['error_viber']                  = ' <b>Sorry, Viber requires a secure connection to the site.</b> We advise you <a target="_blank" href="http://forum.opencart.pro/topic/5083-%D1%80%D1%83%D0%BA%D0%BE%D0%B2%D0%BE%D0%B4%D1%81%D1%82%D0%B2%D0%BE-%D0%B4%D0%BB%D1%8F-%D0%BF%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%D0%B0-%D0%BD%D0%B0-ssl-https-v20/"> to switch to SSL</a>. Or you can use the script on the website of the author of the module.';
$_['error_viber1']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 1 - <b>The webhook URL is not valid</b> (invalidUrl)</div>';
$_['error_viber2']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 2 - <b>The authentication token is not valid</b> (invalidAuthToken)</div>';
$_['error_viber3']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 3 - <b>There is an error in the request itself</b> (missing comma, brackets, etc.) (badData)</div>';
$_['error_viber4']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 4 - <b>Some mandatory data is missing</b> (missingData)</div>';
$_['error_viber5']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 5 - <b>The receiver is not registered to Viber</b> (receiverNotRegistered)</div>';
$_['error_viber6']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 6 - <b>The receiver is not subscribed to the account</b> (receiverNotSubscribed)</div>';
$_['error_viber7']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 7 - <b>The account is blocked</b> (publicAccountBlocked)</div>';
$_['error_viber8']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 8 - <b>The account associated with the token is not a account</b> (publicAccountNotFound)</div>';
$_['error_viber9']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 9 - <b>The account is suspended</b> (publicAccountSuspended)</div>';
$_['error_viber10']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 10 - <b>No webhook was set for the account</b> (webhookNotSet)</div>';
$_['error_viber11']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 11 - <b>The receiver is using a device or a Viber version that don’t support accounts</b> (receiverNoSuitableDevice)</div>';
$_['error_viber12']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 12 - <b>Rate control breach</b> (tooManyRequests)</div>';
$_['error_viber13']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 13 - <b>Maximum supported account version by all user’s devices is less than the minApiVersion in the message</b> (apiVersionNotSupported)</div>';
$_['error_viber14']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 14 - <b>minApiVersion is not compatible to the message fields</b> (incompatibleWithVersion)</div>';
$_['error_viber15']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 15 - <b>The account is not authorized</b> (publicAccountNotAuthorized)</div>';
$_['error_viber16']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 16 - <b>Inline message not allowed</b> (inchatReplyMessageNotAllowed)</div>';
$_['error_viber17']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 17 - <b>The account is not inline</b> (publicAccountIsNotInline)</div>';
$_['error_viber18']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 18 - <b>Failed to post to public account. The bot is missing a Public Chat interface</b> (noPublicChat)</div>';
$_['error_viber19']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 19 - <b>Cannot send broadcast message</b> (cannotSendBroadcast)</div>';
$_['error_viber20']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error other - <b>General error</b> (General error)</div>';

$_['error_permission']             = 'Warning: You do not have permission to modify module ' . $_['heading_title'] .'!';