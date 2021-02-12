<?php
// Heading
$_['heading_title']                = '<a href="https://gixoc.ru">GixOC.ru</a> - <b>Двухфакторная авторизация при входе в админку (E-mail, Telegram, Viber) / Admin Security: Two-Factor Authentication</b>';
$_['text_title']                   = 'GixOC.ru - Двухфакторная авторизация / Admin Security: Two-Factor Authentication';

// Text
$_['text_module']                  = 'Модули';
$_['text_success']                 = 'Настройки сохранены';
$_['text_edit']                    = 'Настройки';

// Entry
$_['entry_status']                 = 'Статус';
$_['entry_auto']                   = 'Получить автоматически';
$_['entry_wait']                   = 'Пожалуйста, подождите...';
//E-mail
$_['entry_email_succes']           = 'Направлять пароль по E-mail ';
$_['entry_email']                  = 'Ваш E-mail ';
//Telegram
$_['entry_telegram']               = 'Направлять пароль по Telegram';
$_['entry_telegram_key']           = 'Telegram Bot Ключ (токен)';
$_['entry_chat_id_place']          = 'Внимание! Сначала обязательно отправьте любое сообщение вашему Telegram Bot';
$_['entry_chat_id']                = 'Ваш Telegram ID ';
$_['entry_get_token']              = 'Как получить Telegram Bot Ключ (токен)';
//Viber
$_['entry_viber']                  = 'Направлять пароль по Viber';
$_['entry_viber_key']              = 'Viber Ключ (токен)';
$_['entry_chat_id_place_viber']    = 'Внимание! Сначала обязательно отправьте любое сообщение вашему Viber Bot!';
$_['entry_chat_id_viber']          = 'Ваш Viber ID ';
$_['entry_get_token_viber']        = 'Как получить Viber Ключ (токен)';
$_['entry_viber_reg']              = 'Зарегистрировать Webhook';
$_['entry_viber_gixoc']            = 'Решение от автора модуля';

// Error
$_['error_telegram']               = ' <b>К сожалению, Telegram не доступен.</b> Скорее всего, серверы вашего хостинг-провайдера расположены на территории Российской Федерации, в которой, по требованию Роскомнадзора, заблокирован Telegram. Советуем Вам использовать метод уведомления по Viber.';
$_['error_telegram1']              = 'Не правильный Telegram Bot API Token!';
//Error Viber
$_['error_viber']                  = ' <b>К сожалению, Viber требует наличия у сайта защищенного соединения.</b> Советуем Вам <a target="_blank" href="http://forum.opencart.pro/topic/5083-%D1%80%D1%83%D0%BA%D0%BE%D0%B2%D0%BE%D0%B4%D1%81%D1%82%D0%B2%D0%BE-%D0%B4%D0%BB%D1%8F-%D0%BF%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%D0%B0-%D0%BD%D0%B0-ssl-https-v20/"> перейти на использование SSL</a>. Ну или вы можете использовать скрипт на сайте автора модуля.';
$_['error_viber1']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 1 - <b>URL веб-ссылки недействителен!</b>  (invalidUrl)</div>';
$_['error_viber2']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 2 - <b>Viber Ключ (токен) пустой или недействителен!</b> (invalidAuthToken)</div>';
$_['error_viber3']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 3 - <b>В самом запросе есть ошибка (отсутствует запятая, скобки и т. д.)</b> (badData)</div>';
$_['error_viber4']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 4 - <b>В запросе отсутствуют некоторые обязательные данные</b> (missingData)</div>';
$_['error_viber5']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 5 - <b>Приемник не зарегистрирован в Viber</b> (receiverNotRegistered)</div>';
$_['error_viber6']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 6 - <b>Получатель не подписан на учетную запись</b> (receiverNotSubscribed)</div>';
$_['error_viber7']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 7 - <b>Учетная запись заблокирована</b> (publicAccountBlocked)</div>';
$_['error_viber8']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 8 - <b>Учетная запись, связанная с токеном, не является учетной записью.</b> (publicAccountNotFound)</div>';
$_['error_viber9']                 = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 9 - <b>Учетная запись приостановлена</b> (publicAccountSuspended)</div>';
$_['error_viber10']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 10 - <b>Webhook не активирован!</b> (webhookNotSet)</div>';
$_['error_viber11']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 11 - <b>Приемник использует устройство или версию Viber, которые не поддерживают учетные записи</b> (receiverNoSuitableDevice)</div>';
$_['error_viber12']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 12 - <b>Нарушение контроля скорости</b> (tooManyRequests)</div>';
$_['error_viber13']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 13 - <b>Максимальная поддерживаемая версия учетной записи всеми устройствами пользователя меньше, чем minApiVersionв сообщении</b> (apiVersionNotSupported)</div>';
$_['error_viber14']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 14 - <b>minApiVersion не совместим с полями сообщений</b> (incompatibleWithVersion)</div>';
$_['error_viber15']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 15 - <b>Учетная запись не авторизована</b> (publicAccountNotAuthorized)</div>';
$_['error_viber16']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 16 - <b>Встроенное сообщение не разрешено</b> (inchatReplyMessageNotAllowed)</div>';
$_['error_viber17']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 17 - <b>Учетная запись не является встроенной</b> (publicAccountIsNotInline)</div>';
$_['error_viber18']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 18 - <b>Не удалось post to public account. У бота отсутствует интерфейс Public Chat</b> (noPublicChat)</div>';
$_['error_viber19']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error 19 - <b>Не удается отправить широковещательное сообщение</b> (cannotSendBroadcast)</div>';
$_['error_viber20']                = '<div class="col-sm-10 alert alert-danger"><i class="fa fa-exclamation-circle"></i> Error other - <b>Неизвестная ошибка</b> (General error)</div>';

$_['error_permission']             = 'У вас нет прав для управления модулем ' . $_['heading_title'] .'!';