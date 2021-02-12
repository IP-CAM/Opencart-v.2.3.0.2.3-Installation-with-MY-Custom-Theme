$(document).ready(function(){
    $('div.panel-body ul.nav-tabs').append('<li class=""><a href="#tab-dml" data-toggle="tab">Modification Log</a></li>');
    $('div.tab-content').append('<div class="tab-pane" id="tab-dml">');
    $('body').append('<div class="box-list-logs"></div>');
    var params = window.location.search.replace('?','').split('&').reduce(function(p,e){
            var a = e.split('=');
            p[ decodeURIComponent(a[0])] = decodeURIComponent(a[1]);
            return p;
        },
        {}
    );
    $.ajax({
      url: 'index.php?route=extension/devos_modification_log&token='+params['token'],
        dataType: 'html',
        success: function(html) {
          $('#tab-dml').html(html);
        }
      });
    //вызов окна для редактирования файла модификации
    $('.dml_edit_file').click(function(){
      var modification_id = $(this).data('modification_id');
      $.ajax({
        url: 'index.php?route=extension/devos_modification_log/editModFile&modification_id='+modification_id+'&token='+params['token'],
        method: "GET",
        dataType: 'html',
        success: function(data){
          $('.box-list-logs').html(data);
          $('.box-list-logs .modal').modal('show');
        }
      });
    });
    //сохранение отредактированного файла
  $('body').on('click','#dml-save-mod-file',function(){
    $.ajax({
      url: 'index.php?route=extension/devos_modification_log/saveModFile&token='+params['token'],
        dataType: 'json',
        method: 'POST',
        data: $('#dml-form-save-mod-file').serialize(),
        success: function(json) {
          if(json.result == 1){
            $('.alert-success').removeClass('hidden');
          }else{
            $('.alert-error').removeClass('hidden');
          }
        }
      });
  });
  //закрытие модального окна
  $('body').on('click', '.dml-close-modal', function(){
     $('.box-list-logs .modal').modal('hide');
  });

  //проверка активации
  $('body').on('click', '#buttom-dml-license', function(){
    $.ajax({
      url: 'index.php?route=extension/devos_modification_log/setLicense&token='+params['token'],
      dataType: 'html',
      method: 'POST',
      data: 'activate=1',
        success: function(html) {
          $('#tab-dml').html(html);
        }
      });
  });
    
});
