<div class="h4">
<div class="panel-group">
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Какого типа приходят уведомления</a>
</h4>
</div>
<div id="collapseOne" class="panel-collapse collapse">
<div class="panel-body">
<b>Уведомления приходят от стандартного функционала:</b>
<li class="page-header">1. При получении нового заказа - при любом статусе (поддерживается заказы от модуля Simple).</li>
<li class="page-header">2. При регистрации нового покупателя (поддерживается также упрощенная регистрация от модуля Simple).</li>
<li class="page-header">3. При регистрации нового партнера.</li>
<li class="page-header">4. При получении нового отзыва к товару.</li>
<li class="page-header">5. При запросе нового возврата.</li>
<li class="page-header">6. Также можно получать уведомление при смене статуса заказа. Уведомление приходит про оформлении нового заказа и смене статуса в админке, при смене статуса платежными модулями, при условии использовании ими стандартного функционала.</li>
<b>Уведомления НЕ приходят от модулей типа "обратный звонок", "быстрый заказ" и т.д. <a style="color: red;" target="_blank" href="tg://resolve?domain=GixOC_NotificationsBot">(решается в рамках платной поддержки!)</a> </b>
</div>
</div>
</div>
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Не приходят уведомления</a>
</h4>
</div>
<div id="collapseTwo" class="panel-collapse collapse">
<div class="panel-body">
<b>Уведомления приходят, если:</b>
<li class="page-header">1. Включен модуль.</li>
<li class="page-header">2. Заполнен Bot Ключ (токен) для месседжера.</li>
<li class="page-header">3. Введен ID пользователя.</li>
<li class="page-header">4. Установлен чекбокс на уведомлении.</li>
<li class="page-header">5. Упомянуты в списке выше.</li>
<li class="page-header">6. <u>Нет конфликтов с другими модулями</u> - <a style="color: red;" target="_blank" href="tg://resolve?domain=GixOC_NotificationsBot">решается в рамках платной поддержки!</a></li>
</div>
</div>
</div>
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">При получении нового заказа приходит 2 уведомления</a>
</h4>
</div>
<div id="collapseThree" class="panel-collapse collapse">
<div class="panel-body">
Функционал уведомлений о смене статуса заказа дублирует функционал уведомлений о получении нового заказа. Решение: отключите уведомления о новом заказе.
</div>
</div>
</div>
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Сообщения в Telegram не приходят, в логах ошибка "Bad Request: chat not found(error code = 400)"</a>
</h4>
</div>
<div id="collapseFour" class="panel-collapse collapse">
<div class="panel-body">
Эта ошибка означает, что бот не может найти чат с данным пользователем.<br>
1. Если Вы получали ID пользователя в Telegram через стороннего бота, обязательно проверьте, отправили ли Вы сообщение своему боту.<br>
2. Проверьте ID пользователя в Telegram в настройках, возможно при копировании добавили лишние символы.<br>
3. Проверьте, не удалил ли пользователь чат с ботом в Telegram.
</div>
</div>
</div>
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">Сообщения в Viber не приходят, в логах ошибка "notSubscribed(error code = 6)"</a>
</h4>
</div>
<div id="collapseFive" class="panel-collapse collapse">
<div class="panel-body">
Эта ошибка означает, что бот не может найти чат с данным пользователем.<br>
1. Проверьте ID пользователя в Viber в настройках, возможно при копировании добавили лишние символы.<br>
2. Проверьте, не удалил ли пользователь чат с ботом в Viber.
</div>
</div>
</div>
</div>
</div>
<?php if (isset($help_thanks)) echo $help_thanks; ?>