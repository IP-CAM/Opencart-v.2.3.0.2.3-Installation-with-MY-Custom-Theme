//popupcart
;(function($){var $window=$(window);var options={};var zindexvalues=[];var lastclicked=[];var scrollbarwidth;var bodymarginright=null;var opensuffix='_open';var closesuffix='_close';var stack=[];var transitionsupport=null;var opentimer;var iOS=/(iPad|iPhone|iPod)/g.test(navigator.userAgent);var methods={_init:function(el){var $el=$(el);var options=$el.data('popupoptions');lastclicked[el.id]=false;zindexvalues[el.id]=0;if(!$el.data('popup-initialized')){$el.attr('data-popup-initialized','true');methods._initonce(el)}if(options.autoopen){setTimeout(function(){methods.show(el,0)},0)}},_initonce:function(el){var $el=$(el);var $body=$('body');var $wrapper;var options=$el.data('popupoptions');var css;bodymarginright=parseInt($body.css('margin-right'),10);transitionsupport=document.body.style.webkitTransition!==undefined||document.body.style.MozTransition!==undefined||document.body.style.msTransition!==undefined||document.body.style.OTransition!==undefined||document.body.style.transition!==undefined;if(options.type=='tooltip'){options.background=false;options.scrolllock=false}if(options.backgroundactive){options.background=false;options.blur=false;options.scrolllock=false}if(options.scrolllock){var parent;var child;if(typeof scrollbarwidth==='undefined'){parent=$('<div style="width:50px;height:50px;overflow:auto"><div/></div>').appendTo('body');child=parent.children();scrollbarwidth=child.innerWidth()-child.height(99).innerWidth();parent.remove()}}if(!$el.attr('id')){$el.attr('id','j-popup-'+parseInt((Math.random()*100000000),10))}$el.addClass('popup_content');$body.prepend(el);$el.wrap('<div id="'+el.id+'_wrapper" class="popup_wrapper" />');$wrapper=$('#'+el.id+'_wrapper');$wrapper.css({opacity:0,visibility:'hidden',position:'absolute'});if(iOS){$wrapper.css('cursor','pointer')}if(options.type=='overlay'){$wrapper.css('overflow','auto')}$el.css({opacity:0,visibility:'hidden',display:'inline-block'});if(options.setzindex&&!options.autozindex){$wrapper.css('z-index','100001')}if(!options.outline){$el.css('outline','none')}if(options.transition){$el.css('transition',options.transition);$wrapper.css('transition',options.transition)}$el.attr('aria-hidden',true);if((options.background)&&(!$('#'+el.id+'_background').length)){$body.prepend('<div id="'+el.id+'_background" class="popup_background"></div>');var $background=$('#'+el.id+'_background');$background.css({opacity:0,visibility:'hidden',background:rgba(0, 26, 0, .6),position:'fixed',top:0,right:0,bottom:0,left:0});if(options.setzindex&&!options.autozindex){$background.css('z-index','100000')}if(options.transition){$background.css('transition',options.transition)}}if(options.type=='overlay'){$el.css({textAlign:'left',position:'relative',verticalAlign:'middle'});css={position:'fixed',width:'100%',height:'100%',top:0,left:0,textAlign:'center'};if(options.backgroundactive){css.position='relative';css.height='0';css.overflow='visible'}$wrapper.css(css);$wrapper.append('<div class="popup_align" />');$('.popup_align').css({display:'inline-block',verticalAlign:'middle',height:'100%'})}$el.attr('role','dialog');var openelement=(options.openelement)?options.openelement:('.'+el.id+opensuffix);$(openelement).each(function(i,item){$(item).attr('data-popup-ordinal',i);if(!item.id){$(item).attr('id','open_'+parseInt((Math.random()*100000000),10))}});if(!($el.attr('aria-labelledby')||$el.attr('aria-label'))){$el.attr('aria-labelledby',$(openelement).attr('id'))}if(options.action=='hover'){options.keepfocus=false;$(openelement).on('mouseenter',function(event){methods.show(el,$(this).data('popup-ordinal'))});$(openelement).on('mouseleave',function(event){methods.hide(el)})}else{$(document).on('click',openelement,function(event){event.preventDefault();var ord=$(this).data('popup-ordinal');setTimeout(function(){methods.show(el,ord)},0)})}if(options.closebutton){methods.addclosebutton(el)}if(options.detach){$el.hide().detach()}else{$wrapper.hide()}},show:function(el,ordinal){var $el=$(el);if($el.data('popup-visible'))return;if(!$el.data('popup-initialized')){methods._init(el)}$el.attr('data-popup-initialized','true');var $body=$('body');var options=$el.data('popupoptions');var $wrapper=$('#'+el.id+'_wrapper');var $background=$('#'+el.id+'_background');callback(el,ordinal,options.beforeopen);lastclicked[el.id]=ordinal;setTimeout(function(){stack.push(el.id)},0);if(options.autozindex){var elements=document.getElementsByTagName('*');var len=elements.length;var maxzindex=0;for(var i=0;i<len;i++){var elementzindex=$(elements[i]).css('z-index');if(elementzindex!=='auto'){elementzindex=parseInt(elementzindex,10);if(maxzindex<elementzindex){maxzindex=elementzindex}}}zindexvalues[el.id]=maxzindex;if(options.background){if(zindexvalues[el.id]>0){$('#'+el.id+'_background').css({zIndex:(zindexvalues[el.id]+1)})}}if(zindexvalues[el.id]>0){$wrapper.css({zIndex:(zindexvalues[el.id]+2)})}}if(options.detach){$wrapper.prepend(el);$el.show()}else{$wrapper.show()}opentimer=setTimeout(function(){$wrapper.css({visibility:'visible',opacity:1});$('html').addClass('popup_visible').addClass('popup_visible_'+el.id);$wrapper.addClass('popup_wrapper_visible')},20);if(options.scrolllock){$body.css('overflow','hidden');if($body.height()>$window.height()){$body.css('margin-right',bodymarginright+scrollbarwidth)}}if(options.backgroundactive){$el.css({top:($window.height()-($el.get(0).offsetHeight+parseInt($el.css('margin-top'),10)+parseInt($el.css('margin-bottom'),10)))/2+'px'})}$el.css({'visibility':'visible','opacity':1});if(options.background){$background.css({'visibility':'visible','opacity':options.opacity});setTimeout(function(){$background.css({'opacity':options.opacity})},0)}$el.data('popup-visible',true);methods.reposition(el,ordinal);$el.data('focusedelementbeforepopup',document.activeElement);if(options.keepfocus){$el.attr('tabindex',-1);setTimeout(function(){if(options.focuselement==='closebutton'){$('#'+el.id+' .'+el.id+closesuffix+':first').focus()}else if(options.focuselement){$(options.focuselement).focus()}else{$el.focus()}},options.focusdelay)}$(options.pagecontainer).attr('aria-hidden',true);$el.attr('aria-hidden',false);callback(el,ordinal,options.onopen);if(transitionsupport){$wrapper.one('transitionend',function(){callback(el,ordinal,options.opentransitionend)})}else{callback(el,ordinal,options.opentransitionend)}},hide:function(el){if(opentimer)clearTimeout(opentimer);var $body=$('body');var $el=$(el);var options=$el.data('popupoptions');var $wrapper=$('#'+el.id+'_wrapper');var $background=$('#'+el.id+'_background');$el.data('popup-visible',false);if(stack.length===1){$('html').removeClass('popup_visible').removeClass('popup_visible_'+el.id)}else{if($('html').hasClass('popup_visible_'+el.id)){$('html').removeClass('popup_visible_'+el.id)}}stack.pop();if($wrapper.hasClass('popup_wrapper_visible')){$wrapper.removeClass('popup_wrapper_visible')}if(options.keepfocus){setTimeout(function(){if($($el.data('focusedelementbeforepopup')).is(':visible')){$el.data('focusedelementbeforepopup').focus()}},0)}$wrapper.css({'visibility':'hidden','opacity':0});$el.css({'visibility':'hidden','opacity':0});if(options.background){$background.css({'visibility':'hidden','opacity':0})}$(options.pagecontainer).attr('aria-hidden',false);$el.attr('aria-hidden',true);callback(el,lastclicked[el.id],options.onclose);if(transitionsupport&&$el.css('transition-duration')!=='0s'){$el.one('transitionend',function(e){if(!($el.data('popup-visible'))){if(options.detach){$el.hide().detach()}else{$wrapper.hide()}}if(options.scrolllock){setTimeout(function(){$body.css({overflow:'visible','margin-right':bodymarginright})},10)}callback(el,lastclicked[el.id],options.closetransitionend)})}else{if(options.detach){$el.hide().detach()}else{$wrapper.hide()}if(options.scrolllock){setTimeout(function(){$body.css({overflow:'visible','margin-right':bodymarginright})},10)}callback(el,lastclicked[el.id],options.closetransitionend)}},toggle:function(el,ordinal){if($(el).data('popup-visible')){methods.hide(el)}else{setTimeout(function(){methods.show(el,ordinal)},0)}},reposition:function(el,ordinal){var $el=$(el);var options=$el.data('popupoptions');var $wrapper=$('#'+el.id+'_wrapper');var $background=$('#'+el.id+'_background');ordinal=ordinal||0;if(options.type=='tooltip'){$wrapper.css({'position':'absolute'});var $tooltipanchor;if(options.tooltipanchor){$tooltipanchor=$(options.tooltipanchor)}else if(options.openelement){$tooltipanchor=$(options.openelement).filter('[data-popup-ordinal="'+ordinal+'"]')}else{$tooltipanchor=$('.'+el.id+opensuffix+'[data-popup-ordinal="'+ordinal+'"]')}var linkOffset=$tooltipanchor.offset();if(options.horizontal=='right'){$wrapper.css('left',linkOffset.left+$tooltipanchor.outerWidth()+options.offsetleft)}else if(options.horizontal=='leftedge'){$wrapper.css('left',linkOffset.left+$tooltipanchor.outerWidth()-$tooltipanchor.outerWidth()+options.offsetleft)}else if(options.horizontal=='left'){$wrapper.css('right',$window.width()-linkOffset.left-options.offsetleft)}else if(options.horizontal=='rightedge'){$wrapper.css('right',$window.width()-linkOffset.left-$tooltipanchor.outerWidth()-options.offsetleft)}else{$wrapper.css('left',linkOffset.left+($tooltipanchor.outerWidth()/2)-($el.outerWidth()/2)-parseFloat($el.css('marginLeft'))+options.offsetleft)}if(options.vertical=='bottom'){$wrapper.css('top',linkOffset.top+$tooltipanchor.outerHeight()+options.offsettop)}else if(options.vertical=='bottomedge'){$wrapper.css('top',linkOffset.top+$tooltipanchor.outerHeight()-$el.outerHeight()+options.offsettop)}else if(options.vertical=='top'){$wrapper.css('bottom',$window.height()-linkOffset.top-options.offsettop)}else if(options.vertical=='topedge'){$wrapper.css('bottom',$window.height()-linkOffset.top-$el.outerHeight()-options.offsettop)}else{$wrapper.css('top',linkOffset.top+($tooltipanchor.outerHeight()/2)-($el.outerHeight()/2)-parseFloat($el.css('marginTop'))+options.offsettop)}}else if(options.type=='overlay'){if(options.horizontal){$wrapper.css('text-align',options.horizontal)}else{$wrapper.css('text-align','center')}if(options.vertical){$el.css('vertical-align',options.vertical)}else{$el.css('vertical-align','middle')}}},addclosebutton:function(el){var genericCloseButton;if($(el).data('popupoptions').closebuttonmarkup){genericCloseButton=$(options.closebuttonmarkup).addClass(el.id+'_close')}else{genericCloseButton='<button class="popup_close '+el.id+'_close" title="Close" aria-label="Close"><span aria-hidden="true">?</span></button>'}if($el.data('popup-initialized')){$el.append(genericCloseButton)}}};var callback=function(el,ordinal,func){var options=$(el).data('popupoptions');var openelement=(options.openelement)?options.openelement:('.'+el.id+opensuffix);var elementclicked=$(openelement+'[data-popup-ordinal="'+ordinal+'"]');if(typeof func=='function'){func.call($(el),el,elementclicked)}};$(document).on('keydown',function(event){if(stack.length){var elementId=stack[stack.length-1];var el=document.getElementById(elementId);if($(el).data('popupoptions').escape&&event.keyCode==27){methods.hide(el)}}});$(document).on('click',function(event){if(stack.length){var elementId=stack[stack.length-1];var el=document.getElementById(elementId);var closeButton=($(el).data('popupoptions').closeelement)?$(el).data('popupoptions').closeelement:('.'+el.id+closesuffix);if($(event.target).closest(closeButton).length){event.preventDefault();methods.hide(el)}if($(el).data('popupoptions').blur&&!$(event.target).closest('#'+elementId).length&&event.which!==2&&$(event.target).is(':visible')){methods.hide(el);if($(el).data('popupoptions').type==='overlay'){event.preventDefault()}}}});$(document).on('focusin',function(event){if(stack.length){var elementId=stack[stack.length-1];var el=document.getElementById(elementId);if($(el).data('popupoptions').keepfocus){if(!el.contains(event.target)){event.stopPropagation();el.focus()}}}});$.fn.popup=function(customoptions){return this.each(function(){$el=$(this);if(typeof customoptions==='object'){var opt=$.extend({},$.fn.popup.defaults,customoptions);$el.data('popupoptions',opt);options=$el.data('popupoptions');methods._init(this)}else if(typeof customoptions==='string'){if(!($el.data('popupoptions'))){$el.data('popupoptions',$.fn.popup.defaults);options=$el.data('popupoptions')}methods[customoptions].call(this,this)}else{if(!($el.data('popupoptions'))){$el.data('popupoptions',$.fn.popup.defaults);options=$el.data('popupoptions')}methods._init(this)}})};$.fn.popup.defaults={type:'overlay',autoopen:false,background:true,backgroundactive:false,color:'rgba(0, 26, 0, .6)',horizontal:'center',vertical:'middle',offsettop:0,offsetleft:0,escape:true,blur:true,setzindex:true,autozindex:false,scrolllock:false,closebutton:false,closebuttonmarkup:null,keepfocus:true,focuselement:null,focusdelay:50,outline:false,pagecontainer:null,detach:false,openelement:null,closeelement:null,transition:null,tooltipanchor:null,beforeopen:null,onclose:null,onopen:null,opentransitionend:null,closetransitionend:null}})(jQuery);

$(document).ready(function(){
if ($('#button-cart').length) {
if (!localStorage.getItem('pp_button')) {
localStorage.setItem('pp_button', $('#button-cart').html());
                                                     
}
     
}
 
if (!localStorage.getItem('p_button')) {
$('.cart .button, .btn-group .btn, .btn-group .btn-primary, .button-group button').each(function() {
if($(this).attr('onclick') && $(this).attr('onclick').substr(0, 8) == 'cart.add') {
localStorage.setItem('p_button', $(this).html());
      
}    
});
}

$('#button-cart').unbind('click');

$('body').append('<div id="load_cart"></div>');
$('#load_cart').load('index.php?route=extension/module/popupcart', function() {
add_class();
p_array();

carousel();

if($('input[name=\'click_on_cart\']').val() == 1) {
if($('#cart > .heading a').length) {
$('#cart > .heading a').off('click');
}
$('#cart').bind('hover', function (e) {
$('#cart .content').remove();
});
$('#cart').bind('click', function (e) {
e.preventDefault();
$('#cart .content').remove();
$('#cart .dropdown-menu').remove();

$('#popupcart_extended').load('index.php?route=extension/module/popupcart #popupcart_extended > *', function() {
$('#popupcart_extended').popup('show');
carousel();
});
});
}
});
});

var cart = {
'add': function(product_id, quantity, flag) {
if (!$('input[name=\'product_id\']').length) {
var quantity = typeof(quantity) != 'undefined' ? quantity : 1;
var options = $('#option_'+product_id+' input[type=\'text\'], #option_'+product_id+' input[type=\'radio\']:checked, #option_'+product_id+' input[type=\'checkbox\']:checked, #option_'+product_id+' select, #option_'+product_id+' textarea');
if (options.length) {
var data = options.serialize() + '&product_id=' + product_id + '&quantity=' + quantity;
} else {
var data = 'product_id=' + product_id + '&quantity=' + quantity;
}
} else {
var quantity = typeof(quantity) != 'undefined' ? quantity : 1;
var options = $('#product input[type=\'text\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea');
if (options.length) {
var data = options.serialize() + '&product_id=' + product_id + '&quantity=' + quantity;
} else {
var data = 'product_id=' + product_id + '&quantity=' + quantity;
}
}

$.ajax({
url: 'index.php?route=checkout/cart/add',
type: 'post',
data: data,
dataType: 'json',
success: function(json) {
$('.success, .warning, .attention, .information, .error').remove();
   
if (json['redirect'] && $('input[name=\'product_id\']').val() != product_id) {
location = json['redirect'];
}
   

if (json['redirect'] && !options.length) {
location = json['redirect'];
}

if (json['redirect'] && flag) {
location = json['redirect'];
}

if (json['error']) {
if (json['error']['option']) {
for (i in json['error']['option']) {
$('#option-' + i).after($('<span class="error">' + json['error']['option'][i] + '</span>').fadeIn().delay('2000').fadeOut());
$('#input-option' + i).after($('<span class="error">' + json['error']['option'][i] + '</span>').fadeIn().delay('2000').fadeOut());
}
}
}

   
if (json['success']) {
$('#cart').load('index.php?route=common/cart/info #cart > *');
$('#content').parent().before('<div class="alert alert-success"> <button type="button" class="close" data-dismiss="alert">&times;</button> ' + json['success'] + '</div><div id="maskMenuHC"></div>');
setTimeout(function(){
                $('.alert').fadeOut() }, 1500);
$('#popupcart_extended').load('index.php?route=extension/module/popupcart #popupcart_extended > *', function() {
if($('input[name=\'addtocart_logic\']').val() == 1) {
$('#popupcart_extended').popup('show');
}
carousel();
});
if (options.length) {
replace_button(product_id, 1);
} else {
replace_button(product_id, 0);
}

}
}
});
},
'remove': function(key) {
$.ajax({
url: 'index.php?route=checkout/cart/remove',
type: 'post',
data: 'key=' + key,
dataType: 'json',
beforeSend: function() {
$('#cart > button').button('loading');
},
complete: function() {
$('#cart > button').button('reset');
},
success: function(json) {
setTimeout(function () {
$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
}, 100);

$('#popupcart_extended').load('index.php?route=extension/module/popupcart #popupcart_extended > *', function() {
carousel();
});

if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
location = 'index.php?route=checkout/cart';
} else {
$('#cart > ul').load('index.php?route=common/cart/info ul li');
}
}
});
}
}
 

function updateCart(product_id, key, flag) {

var input = $('input[name=\'' + key + '\']');
 

if(flag == '+') {
 
input.val(parseFloat(input.val())+1);
    
}

if(flag == '-') {
input.val(parseFloat(input.val())-1);
}

if (qnty == '') return;

var qnty = parseFloat(input.val());

$.ajax({
type: 'post',
data: 'quantity['+key+']='+qnty,
url: 'index.php?route=checkout/cart/edit',
dataType: 'html',
success: function(data) {
$('#popupcart_extended').load('index.php?route=extension/module/popupcart #popupcart_extended > *', function() {
carousel();
});
$('#cart').load('index.php?route=common/cart/info #cart > *');
if (!qnty) {
restore_button(product_id);
}
}
});
}

function add_class() {
var p_id = $('input[name=\"product_id\"]').val();
var p_q = "$('input[name=\"quantity\"]').val()";
$('#button-cart').addClass(p_id).attr('onclick', 'cart.add(\''+p_id+'\', '+p_q+');');

$('.cart .button, .btn-group .btn, .btn-group .btn-primary, .button-group button').each(function() {
if(($(this).attr('onclick') && $(this).attr('onclick').substr(0, 9) == 'addToCart') || ($(this).attr('onclick') && $(this).attr('onclick').substr(0, 8) == 'cart.add')) {
var p_id = $(this).attr('onclick').substr(8, 14);
var p_class = p_id.match(/(\d+)/g);
$(this).addClass(''+p_class);
}
});
}
   
 

function restore_button(product_id) {
if($('.'+product_id).attr('id') == 'button-cart') {
$('.'+product_id).attr('onclick', 'cart.add(\''+ product_id +'\');').html(localStorage.getItem('pp_button')).removeClass('in_cart');
} else {
$('.'+product_id).attr('onclick', 'cart.add(\''+ product_id +'\');').html(localStorage.getItem('p_button')).removeClass('in_cart');
}
}

//popupcart

#popupcart_extended {
    display:none;
    overflow:hidden;
    font-size:14px;
    border-radius:6px;
    box-shadow: 0 0 15px #32CD32;
    background-color: #FFF;
    padding:7px;
width:620px;
    transform: translateX(0) translateY(-20%);
    -o-transform: translateX(0) translateY(-20%);
    -moz-transform: translateX(0) translateY(-20%);
    -webkit-transform: translateX(0) translateY(-20%);
    transition: all ease-in-out .2s;
}

.popup_visible #popupcart_extended {
transform: translateX(0) translateY(0%);
-o-transform: translateX(0) translateY(0%);
-moz-transform: translateX(0) translateY(0%);
-webkit-transform: translateX(0) translateY(0%);
transition: all ease-in-out .2s;
}

#popupcart_extended .head {
font-size:1.2em;
font-weight:600;
background: linear-gradient(to bottom, #0b3b17, #2E8B57);
color: #FFF;
margin:-15px -15px 0;
padding:13px 15px 15px;
border-bottom:solid 1px #0b3b17;
border-radius:6px 6px 0 0;
text-align: center;
}
#popupcart_extended .head .fa-times{opacity: 1.0;float:right;cursor:pointer;padding:5px;margin:-1px -4px 0 0 ;color:#fff;}
#popupcart_extended .head .fa-times:hover{color:#DC143C;}
#popupcart_extended .popupcart_info {max-height:370px;min-height:60px;margin-bottom:5px;overflow-y:auto;}
#popupcart_extended .popupcart_info table{width:100%;max-width:100%;padding:0;margin:0;border-collapse:collapse;border:none;}
#popupcart_extended .popupcart_info tr{border-collapse:collapse;}
#popupcart_extended .popupcart_info tr:first-child{border-collapse:collapse;}

#popupcart_extended .popupcart_info tr:first-child td{
vertical-align:middle;
height:20px;
min-height:20px;
color:#001a00;
font-size:0.8em;
padding:6px 10px 7px;
text-align: center;
}

#popupcart_extended .popupcart_info .hr {height:0px !important;min-height:0px !important;}

#popupcart_extended .popupcart_info .hr td{
height:0px !important;
min-height:0px !important;
border-top:solid 1px #e2e2e2;
border-bottom:solid 1px #fff;
}

#popupcart_extended .popupcart_info td {
vertical-align:middle;
border-collapse: collapse;
padding:0 10px;
height:80px;
min-height:80px;
box-sizing: border-box;
}

#popupcart_extended .popupcart_info tr:first-child .image{
overflow: hidden;
text-align:center;
padding:0;
text-overflow: ellipsis;
}

#popupcart_extended .popupcart_info .image {
width:64px;
max-width:80px;
vertical-align:middle;
text-align:center;
padding:0;
}

#popupcart_extended .popupcart_info .name {
min-width:130px;
line-height:1.0em;
padding-left:15px !important;
text-align: center;
}

#popupcart_extended .popupcart_info .name a {
font-size:0.9em;
line-height:1.5em;
  font-weight: 600;
}

#popupcart_extended .popupcart_info small {
font-size:0.7em;
}

#popupcart_extended .popupcart_info .image img {
width:64px !important;
max-width:64px !important;
height:auto;
border:solid 1px #e2e2e2;
border-radius:3px;
padding:4px;
background:#fff;
outline: 0;
  box-sizing: border-box;
  cursor:pointer;
  margin:0;
}

#popupcart_extended .popupcart_info .brand {
text-align:center;
font-size:0.9em;
}

#popupcart_extended .popupcart_info .quantity {
width:82px;
min-width:82px;
padding:0 5px;
text-align:center;
}

#popupcart_extended .popupcart_info .quantity input[type='text'] {
display:inline-block;
vertical-align:top;
text-align:center;
width:40px !important;
height:31px !important;
padding:1px 0px 0px !important;
border:solid 1px #0b3b17;
border-right:none;
border-radius:3px 0 0 3px;
box-shadow:inset 0px 1px 1px #ddd;
color: #0b3b17;
line-height:normal !important;
font-size:12px !important;
}

#popupcart_extended .popupcart_info .quantity span {display:inline-block;margin:0 0 0 -4px;border:solid 1px #0b3b17; border-radius:0 3px 3px 0;}
#popupcart_extended .popupcart_info span .fa {display:block;color:#001a00;padding:4px 8px 0;background:#FFD700;
font-size:8px;
cursor:pointer;
}
#popupcart_extended .popupcart_info .fa:hover{background:#32CD32;}

#popupcart_extended .popupcart_info .fa-plus{height:14px;border-radius:0 3px 0 0;}
#popupcart_extended .popupcart_info .fa-minus{height:15px;border-top:solid 1px #0b3b17;border-radius:0 0 3px 0;}


#popupcart_extended .popupcart_info .price {
width:100px;
font-size:14px;
text-align:center;
}

#popupcart_extended .popupcart_info .remove {
width:2px;
min-width:0px;
padding:0 3px 0 0;
text-align:right;
}

#popupcart_extended .popupcart_info .remove i{
cursor:pointer;
color: #DC143C;
}

#popupcart_extended .popupcart_info .remove i:hover{color:#001a00;background: none;}

#popupcart_extended #cart-total {
display:none !important;
}

#popupcart_extended .checkout {
display:none !important;
}

#popupcart_extended .popupcart_total{
overflow:auto;
border-bottom:solid 1px #e2e2e2;
line-height:23px;
min-height:35px;
padding:2px 0 10px;
color: #32CD32;
font-weight: 600;
}

#popupcart_extended .popupcart_total table{
float:right;
}

#popupcart_extended .popupcart_total td{
display:none;
border:none;
text-align:right;
}

#popupcart_extended .popupcart_total td + td{
padding:0 0 0 10px;
text-align:left;
}

#popupcart_extended .popupcart_total tr:last-child td{
display:table-cell;
font-size:1.0em !important;
}

#popupcart_extended .continue {
text-decoration:none;
border-bottom:dashed 1px;
display:block;
float:left;
margin-top:5px;
line-height:normal;
}

#popupcart_extended .popupcart_buttons {
border-top:solid 1px #fff;
padding:16px 0 2px;
text-align:center;
overflow:auto;
}

#popupcart_extended .popupcart_buttons a, #popupcart_extended .popupcart_buttons .button{
line-height:0.5em;
}

#popupcart_extended .popupcart_buttons :first-child {
display:block;
float:left;
}

#popupcart_extended .popupcart_buttons :last-child {
display:block;
float:right;
}

#popupcart_extended .empty {
padding-top:15px;
font-weight:700;
text-align:center;
}

#button-cart2{
margin-left:15px;
}

#popupcart_extended #related {position:relative;overflow:hidden;margin:15px -24px -18px;padding:0 20px 15px;box-shadow: inset 0 1px 13px #32CD32}
#popupcart_extended #related .related_product{background:none;box-shadow: 0 0 0;margin:0;}
#popupcart_extended #related .heading{color: #DC143C;text-align:center;font-size:1.2em;font-weight:600;border-bottom:solid 1px #f8f8f8;box-shadow: inset 0 -1px 0 #d5d5d5;padding:0 0 10px;margin:10px 5px 12px;}
#popupcart_extended .owl-wrapper-outer, #popupcart_extended .owl-wrapper {padding:0;margin:0;background:transparent;border:none;box-shadow: 0 0 0;}
#popupcart_extended #related .owl-controls {height:auto;}
#popupcart_extended #related .owl-buttons {position:absolute;top:-42px;right:5px;}
#popupcart_extended #related .owl-buttons > div {position:relative;display:inline-block;left:auto;right:auto;width:20px;text-align:center;padding:0px 0 0 1px;margin:0;line-height:1.2em;font-size:1.1em;font-weight:600;color:#fff;border:solid 1px #ccc;background:#2E8B57;border-radius:4px;opacity:1;}
#popupcart_extended #related .owl-buttons > div:hover{background:#32CD32;color:#001a00;}
#popupcart_extended #related .owl-buttons > div:active {background:#FFD700;}
#popupcart_extended #related .owl-buttons > div + div {margin:0 0 0 10px}
#popupcart_extended #related .owl-pagination {position:absolute;top:-38px;right:80px; font-size:0.8em;display:none;}
#popupcart_extended #related .owl-pagination > div {display:inline-block;margin:0 0 0 8px;padding:0 4px;border-radius:100%;color:#888;}
#popupcart_extended #related .owl-pagination > div:hover {background:#ddd;}
#popupcart_extended #related .owl-pagination > div.active {background:#ddd;}
#popupcart_extended #related .owl-item {}
#popupcart_extended #related .owl-item + .owl-item {}
#popupcart_extended #related .owl-item > div {margin:0 5px;padding:10px;border:solid 1px #ddd;border-radius:4px;background:#f5f5f5;box-shadow: inset 0 1px 0 #fff;}
#popupcart_extended #related .owl-item > div > div {border:solid 0px;display:inline-block;vertical-align:top;}
#popupcart_extended #related .owl-item > div > div + div {margin:0px 0px 0 0;width:163px;}
#popupcart_extended #related .image {margin:0 7px 0 0;}
#popupcart_extended #related .image img {width:82px;height:auto;border: solid 1px #e2e2e2;border-radius:4px;padding:5px;background:#fff;}
#popupcart_extended #related .name {min-height:40px;white-space:pre-line;line-height:1.0em;}
#popupcart_extended #related .name a{font-size:0.9em;white-space:pre-line;}
#popupcart_extended #related .price {margin:0 10px 6px 0;font-size:1.0em;line-height:1.0em;color:#32CD32;}
#popupcart_extended #related .price .price-old{text-decoration:line-through;color:#f00;}
#popupcart_extended #related .cart {margin:0;}
#popupcart_extended #related .cart .button {line-height:0px;margin:-1px 0 0;padding: 3px 14px 4px;}

@media (max-width:650px){
#popupcart_extended  {width:95%;}
#popupcart_extended .cont.button {display:none}
#popupcart_extended .popupcart_info .name {padding-left:5px !important;}
#popupcart_extended .popupcart_info .quantity {width:60px;min-width:auto;padding:0 5px;}
#popupcart_extended .popupcart_info {margin:0 -12px 5px}
#popupcart_extended .popupcart_info .quantity {width:50px;min-width:auto;padding:0 5px;}
#popupcart_extended .popupcart_info .quantity input {border-radius:3px !important;border:solid 1px #ccc !important;}
#popupcart_extended .image, #popupcart_extended .popupcart_info .sku, #popupcart_extended .popupcart_info .brand, #popupcart_extended .popupcart_info .quantity span, #popupcart_extended .popupcart_buttons :first-child {display:none}
#popupcart_extended .popupcart_buttons {margin:0 -5px}
}

@media (max-width:500px){
#popupcart_extended .popupcart_info {margin:0 -10px 5px}
#popupcart_extended .popupcart_info .quantity {width:60px;min-width:auto;padding:0 5px;}
}

@media (max-width:400px){
#popupcart_extended .popupcart_info {margin:0 -12px 5px}
#popupcart_extended .popupcart_info .quantity {width:50px;min-width:auto;padding:0 5px;}
}					 
