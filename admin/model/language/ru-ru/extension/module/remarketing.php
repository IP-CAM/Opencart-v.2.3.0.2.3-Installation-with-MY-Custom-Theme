<?php
// Heading
$_['heading_title']    = '<span style="color:red; font-weight:bold;"><i class="fa fa-rocket"></i> SP</span> Remarketing All in One + Ecommerce - v3.9';

// Text
$_['text_extension']    = 'Модули';
$_['text_success']      = 'Настройки модуля обновлены!';
$_['text_edit']         = 'Редактирование модуля';
$_['text_id']   	   	= 'ID товара';
$_['text_model']        = 'Модель';
$_['text_events']       = 'События';
$_['text_identifier']   = 'Идентификатор товара';
$_['text_google_remarketing']        = 'Ремаркетинг Google';
$_['text_facebook_remarketing']        = 'Ремаркетинг Facebook';
$_['text_mytarget_remarketing']        = 'Ремаркетинг Mytarget';
$_['text_vk_remarketing']        = 'Ретаргетинг VK';
$_['text_ecommerce']        = 'Ecommerce Google и Яндекс';
$_['text_ecommerce_ga4']        = 'Ecommerce Google GA4';
$_['text_ecommerce_measurement']        = 'Ecommerce - Measurement Protocol';
$_['text_counters']        = 'Счетчики';
$_['text_to_be_continued']        = 'Скоро будет еще что-то интересное';
$_['text_instruction']        = 'Возможности модуля и документация';
$_['text_help']        = 'Помощь и поддержка';
$_['text_summary']        = 'Сводка'; 
$_['text_diagnostics']    = 'Диагностика'; 
$_['text_check_config']    = 'Сводка'; 
$_['text_check_install']    = 'Диагностика установки модификатора'; 
$_['text_help_link']    = 'Ссылка на документацию'; 

$_['text_help_google']        = '<div style="color:red; font-size:20px; font-weight:bold;">Инструкция</div><br>
<b> Где взять AW-CONVERSION_ID?</b><br>
Инструкция - <a href="https://support.google.com/google-ads/answer/6095821?hl=ru" target="_blank"> ссылка</a><br>
Читаем, находим в примере - gtag(\'config\', \'AW-CONVERSION_ID\') - берем код для своего аккаунта<br><br>
<b> Где взять AW-CONVERSION_ID/AW-CONVERSION_LABEL?</b><br>
Инструкция - <a href="https://support.google.com/google-ads/answer/6095821?hl=ru" target="_blank"> ссылка</a><br>
Читаем, находим в примере -  gtag(\'event\', \'conversion\', {\'send_to\': \'AW-CONVERSION_ID/AW-CONVERSION_LABEL\', - берем код для своего аккаунта<br><br>
'; 
$_['text_help_facebook']        = '<div style="color:red; font-size:20px; font-weight:bold;">Инструкция</div><br>
<b> Где взять ID пикселя Facebook?</b><br>
Инструкция - <a href="https://www.facebook.com/business/help/952192354843755?id=1205376682832142" target="_blank"> ссылка</a><br>
Ищем в коде для вставки на сайт -   fbq(\'init\', \'<b>111111111111111111</b>\'); - это он<br><br>
'; 

// Entry
$_['entry_status']     = 'Статус';
$_['entry_feed_status']     = 'Статус простого фида';
$_['entry_feed_link']     = 'Ссылка на фид';
$_['entry_google_identifier']     = 'Идентификатор Google Adwords (AW-CONVERSION_ID)';
$_['entry_google_ads_identifier']     = 'Идентификатор конверсии Google Adwords для оформления заказа<br>
(AW-CONVERSION_ID/AW-CONVERSION_LABEL)'; 
$_['entry_google_ads_identifier_cart']     = 'Идентификатор конверсии Google Adwords для добавления в корзину<br>
(AW-CONVERSION_ID/AW-CONVERSION_LABEL)';
$_['entry_google_ads_identifier_cart_page']     = 'Идентификатор конверсии Google Adwords для открытия корзины<br>
(AW-CONVERSION_ID/AW-CONVERSION_LABEL)';
$_['entry_facebook_identifier']     = 'ID пикселя Facebook ';
$_['entry_facebook_token']     = 'Маркер доступа для Consversions API';
$_['entry_mytarget_identifier']     = '№ списка в Mytarget (обычно 1) ';
$_['entry_vk_identifier']     = '№ списка в VK (обычно 1) '; 
$_['entry_google_code']     = 'Код Adwords (если еще не установлен)';
$_['entry_facebook_code']   = 'Код пикселя Facebook (если еще не установлен)';
$_['entry_server_side']   = 'Включить Server Side (отправка событий с сервера)';
$_['entry_mytarget_code']   = 'Код счетчика Mail.ru (если еще не установлен)';
$_['entry_currency']   = 'Валюта';
$_['entry_google_merchant_identifier']   = 'ID Google Merchant';
$_['entry_reviews_date']   = 'Прибавить дней к текущей дате';
$_['entry_reviews_country']   = 'Страна доставки (RU, UA)';
$_['entry_events_cart']   = 'Javascript cобытие открытия корзины';
$_['entry_events_cart_add']   = 'Javascript событие добавления товара в корзину';
$_['entry_events_purchase']   = 'Javascript событие оформления заказа<br>Можно использовать переменные: {order_id} и {order_total}';
$_['entry_events_wishlist']   = 'Javascript событие добавления в закладки';
$_['entry_ecommerce_selector']   = 'Javascript селектор карточки товара (например, .product-thumb)';
$_['entry_ecommerce_analytics_id']   = 'ID Google Analytics (UA-XXXXXXXXX)';
$_['entry_refund_status']   = 'Статус заказа для отправки Refund (возврат)';
$_['entry_counter1']   = 'Счетчики в хэдере';
$_['entry_counter2']   = 'Счетчики после открывающегося body';
$_['entry_counter3']   = 'Счетчики в подвале';
 
// Error
$_['error_permission'] = 'У вас нет прав для управления этим модулем!';

$_['text_credits']        = '
<b>Спасибо за покупку моего модуля!</b><br>
<div class="text-credits">
Если вам необходима поддержка, доработка этого модуля либо какого другого - обращайтесь, буду рад помочь.<br><br>
Связаться со мной можно следующими способами:<br>
1. Личное сообщение на opencartforum - <a href="https://opencartforum.com/profile/678128-spectre/" target="_blank" style="display: inline-block;border-radius: 2px;padding: 1px 5px;font-size: 90%;color: #fff;text-decoration: none !important;background: #3d6594;">@spectre</a><br>
2. Электронная почта - <a href="mailto:job@freelancer.od.ua">job@freelancer.od.ua</a><br><br>

Если хотите поблагодарить или угостить пивом когда читаете эту страницу:<br>
1. Яндекс-Деньги - 41001189848733<br>
2. QIWI - SPECTREAV<br>
3. Приватбанк - 5168742228748467<br><br>

<b style="font-size:18px;color:red;">Удачных продаж! <i class="fa fa-hand-peace-o"></i></b>
</div>
';
$_['text_google_reviews']        = 'Отзывы в Google Merchant';
$_['text_events_help']        = ' <b>Важно!</b><p>Здесь можно добавить события для метрики, VK и тп.</p>
<p>Например, yaCounterXXXXXX.reachGoal("addtocart") или gtag("event", "cart_add", {"event_category": "Cart"});</p>
<p>Рекомендую проверять подобным образом:<br>
 if (typeof yaCounterXXXXXX != \'undefined\') { yaCounterXXXXXX.reachGoal("addtocart") }</p>
 <p>sсriрt /sсriрt писать не надо!</p>
 ';
 $_['text_instructions']        = '';
