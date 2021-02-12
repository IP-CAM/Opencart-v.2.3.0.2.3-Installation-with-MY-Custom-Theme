var idsModalTrackTime = {};

function closeAllPopups(){
    $('.popup_content').each(function(){
        $('#'+ $(this).attr('id') ).popup('hide');
    })
}
function openWithTimeout(idModal, time, type){
    if(typeof window.openModal === 'undefined'){
        clearTimeout(window.openModal);
    }
    window.openModal = setTimeout(function(){
        closeAllPopups();
        $('#popup-'+type+'-'+idModal).popup('show');
        if(type=='offer') setTimeout(function() { $('#offer-your-price').focus() }, 500);
    }, time * 1000);
}
function openMouseOut(idModal, type) {
    var openedModalStatus;
    $(document).mouseleave(function () {
        if (!openedModalStatus) {
            closeAllPopups();
            openedModalStatus = 1;
            $('#popup-' + type + '-' + idModal).popup('show');
            if (type == 'offer')  setTimeout(function () {
                $('#offer-your-price').focus()
            }, 500);
        }
    });
}
function trackTime(){
    window.mm_track_time = getCookie('__track_time') || 0;
    window.track_time = setInterval(function() {
        window.mm_track_time++;
        setCookie('__track_time', window.mm_track_time);
    }, 1000);
}

function openWithTimeTrack(){

    /** if all modals opened - clear interval **/
    if(Object.keys(idsModalTrackTime).length === 0) {
        clearInterval(window.intervalTrackFunc);
        return;
    }

    var setTime = Math.floor( (new Date().getTime()/ 1000) + (7 * 86400) );

    loop1:
    for(var modal in idsModalTrackTime) {

        var openTime = idsModalTrackTime[modal],
            partsModalId = modal.split('-');

        if (window.mm_track_time <= openTime) continue;

        /** each cookie opened modals - add current - save **/
        var dataToCookie = [],
            getData = getCookie('__vmow');

        if (getData) {
            var parseCookie = decodeURIComponent(getData).split(';');

            for (var i = 0; i < parseCookie.length; i++) {
                var parts = parseCookie[i].split(',');
                dataToCookie.push(parseCookie[i]);

                if (parts[0] == partsModalId[1]) {
                    delete idsModalTrackTime[modal];
                    continue loop1; /** if isset - continue **/
                }
            }
        }

        dataToCookie.push(partsModalId[1] + ',' + setTime);
        setCookie('__vmow', encodeURIComponent(dataToCookie.join(';')));

        closeAllPopups();

        $('#popup-' + modal).popup('show');
        if (partsModalId[0] == 'offer') setTimeout(function () {
            $('#offer-your-price').focus()
        }, 500);
        delete idsModalTrackTime[modal];
    }
}

function sendFormRequest(idModal){

    var $form = $('#modal-form-'+idModal),
        data = $form.serializeArray();

    data.push({name: 'url',value: encodeURIComponent(location.href)});

    $form.find('.error').remove();
    $.ajax({
        url: 'index.php?route=extension/module/multimodals/sendFormRequest&form='+idModal,
        dataType: 'json',
        type: 'post',
        data: data,
        success: function(res){
            if(res.errors){
                for(var i in res.errors){
                    $form.find('[name="f_modal['+i+']"]').after( $('<span class="error" />').text(res.errors[i]) );
                }
            }
            if(res.success){
                $form.html(res.success);
                setTimeout(function(){
                    $('#popup-form-'+idModal).popup('hide');
                },5000);
            }
        }
    })
}
function roundNumber(num){
    return (Math.round(parseFloat( num )*100)/100);
}

/** Wotk with cookie  **/
function setCookie(name, value, expire){
    var time = expire || (7 * 24 * 60 * 60); /** 1 week by default  **/
    var date = new Date(new Date().getTime() + time * 1000);
    document.cookie = name+"="+value+"; path=/; domain=."+location.host+"; expires="+date.toUTCString();
}
function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length == 2) return parts.pop().split(";").shift();
}
function deleteCookie(name) {
    setCookie(name, "", -1);
}

$(document).ready( function(){
    $('.btn-send-modal-form').on('click', function(e){
        e.preventDefault();
        sendFormRequest($(this).attr('data-id-form'));
    });
    $('#selected-offer-options .heading-options').on('click', function(){
        if($(this).next().hasClass('opened')){
            $(this).removeClass('opened').next().removeClass('opened');
        } else {
            $(this).addClass('opened').next().addClass('opened');
        }
    });
});
