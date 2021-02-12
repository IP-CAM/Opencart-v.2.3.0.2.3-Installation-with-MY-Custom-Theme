<?php
$_['heading_title']               = 'Фильтр товаров OCFilter';

// Tabs
$_['tab_general']           			= 'Основное';
$_['tab_option']           				= 'Опции';
$_['tab_price_filtering']         = 'Фильтр по цене';
$_['tab_copy']           					= 'Копирование фильтров';
$_['tab_other']                   = 'Другое';

// Button
$_['button_apply']                = 'Применить';
$_['button_copy']                 = 'Копировать';

// Text
$_['text_edit']      					    = 'Настройки фильтра товаров OCFilter';
$_['text_select']      					  = '-- Выберите --';
$_['text_selected']      					= 'Выбрано';
$_['text_success']                = 'Вы успешно обновили настройки модуля &laquo;Фильтр товаров OCFilter&raquo;!';
$_['text_stock_by_status_id']     = 'По статусу склада';
$_['text_stock_by_quantity']      = 'По количеству';
$_['text_options']              	= 'фильтров';
$_['text_values']              	  = 'значений фильтра';
$_['text_auto']                   = 'Автоматически';
$_['text_loading']              	= '<i class=\'fa fa-refresh fa-spin\'></i> Загрузка..';
$_['text_complete']               = '<i class=\'fa fa-check\'></i> Готово';
$_['text_filter_list']            = 'Фильтры';
$_['text_filter_page_list']       = 'SEO Страницы';
$_['text_faq']                    = 'FAQ';

// Entry
$_['entry_status']                = 'Статус';
$_['entry_sub_category']          = 'Использовать подкатегории';
$_['entry_sitemap']               = 'Sitemap посадочных страниц фильтра';
$_['entry_sitemap_link']          = 'Ссылка на Sitemap';
$_['entry_search_button']         = 'Фильтровать по кнопке';
$_['entry_show_price']            = 'Фильтр по цене';
$_['entry_show_counter']          = 'Показывать счетчик товаров';
$_['entry_show_diagram']          = 'Показывать ценовую диаграмму';
$_['entry_show_selected']         = 'Показывать выбранные параметры';
$_['entry_consider_discount']     = 'Учитывать скидочную цену';
$_['entry_consider_special']      = 'Учитывать специальную цену';
$_['entry_consider_option']       = 'Учитывать цену опций товара';
$_['entry_manual_price']      		= 'Ручной ввод цены';
$_['entry_show_first_limit']      = 'Показывать только первые';
$_['entry_hide_empty_values']     = 'Скрывать неактивные значения';
$_['entry_manufacturer']          = 'Фильтр по производителям';
$_['entry_type']     							= 'Тип';
$_['entry_stock_status']          = 'Фильтр по наличию на складе';
$_['entry_stock_status_method']   = 'Метод';
$_['entry_stock_out_value']   		= 'Показывать значение &laquo;Нет в наличии&raquo;';

$_['entry_copy_type']             = 'Тип скопированных фильтров';
$_['entry_copy_update_keyword']   = 'Обновить SEO псевдонимы фильтров';
$_['entry_copy_status']           = 'Статус скопированных фильтров';
$_['entry_copy_category']         = 'Привязать фильтры к категориям';
$_['entry_copy_clear_filter']     = 'Очистить существующие фильтры OCFilter';
$_['entry_copy_attribute']        = 'Копировать атрибуты';
$_['entry_copy_filter']           = 'Копировать стандартные фильтры';
$_['entry_copy_option']           = 'Копировать опции товаров';
$_['entry_copy_attribute_separator']     = 'Разделитель атрибутов';

// Nav
$_['nav_copy_filter']            = 'Настройки результирующих фильтров <small>которые появятся после копирования</small>';
$_['nav_copy_source']            = 'Источники фильтров';
$_['nav_copy_other']            = 'Другое';

// Help
$_['help_status']                = 'Включает или выключает модуль фильтра в категории.';
$_['help_sub_category']          = 'Позволяет выводить фильтры и товары в родительских категориях.<br /><strong>Внимание!</strong> Включение этого режима может замедлить работу каталога.<br />Рекомендуем использовать фильтры только в последних дочерних категориях.';
$_['help_copy_status_auto']      = 'В автоматическом режиме статус для новых фильтров будет назначаться в зависимости от их количества и связей.<br />Отключены будут те фильтры, у которых более 100 значений, у которых нет значений или они не привязаны к товарам либо категориям.';
$_['help_search_button']         = 'Позволяет сначала выбрать необходимые фильтры, затем произвести поиск товаров.';
$_['help_show_price']            = 'Отображает диапазон цен в текущей категории с возможностью фильтра. Если отключено, то ценовая диаграмма выводиться не будет.';
$_['help_show_diagram']          = 'Графически показывает количество товаров текущего значения ценового диапазона.';
$_['help_show_counter']          = 'Отображает количество товаров для каждого значения.<br />На скорость загрузки страницы этот параметр не влияет.';
$_['help_show_selected']         = 'Отображает блок выбранных параметров с возможностью исключения их из запроса.';
$_['help_consider_discount']     = 'Позволяет фильтровать товары не только по статической цене, но и по скидкам.';
$_['help_consider_special']      = 'Позволяет учитывать специальную цену.';
$_['help_consider_option']       = 'Диапазон цен расширится до границ цен указанных в опциях.<br />При фильтрации эти цены будут также учтены.';
$_['help_manual_price']      		 = 'Позволяет вводить цены в отдельные поля. Блок полей появляется при наведении на шкалу диапазона цен.';
$_['help_show_options_limit']    = 'Укажите лимит количества фильтров, которые будут выводиться в модуле фильтра товаров. Чтобы выводить все фильтры, укажите 0.';
$_['help_show_values_limit']     = 'Укажите лимит количества значений, которые будут выводиться в модуле фильтра товаров для каждой опции. Чтобы выводить все значения, укажите 0.';
$_['help_hide_empty_values']     = 'Полностью скрывает неактивные значения фильтров. В случае, если будут скрыты все значения - скрывается и сам фильтр.';
$_['help_manufacturer']          = 'Позволяет фильтровать товары по производителям текущей категории.';
$_['help_stock_status']          = 'Даёт возможность фильтровать товары по наличию на складе.';
$_['help_copy_category']         = 'При выборе этой опции все существующие связи фильтров OCFilter с категориями будут обновлены.';

// Error
$_['error_permission']            = 'Внимание: у вас нет прав для редактирования этого модуля!';
$_['error_copy_type']             = 'Пожалуйста, укажите тип будущих фильтров';


?>