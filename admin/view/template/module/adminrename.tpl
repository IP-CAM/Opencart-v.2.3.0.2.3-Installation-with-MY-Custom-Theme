<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
 <div class="page-header">
    <div class="container-fluid">
      <h1><i class="fa fa-eye"></i>&nbsp;<?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
       <?php echo (empty($moduleData['LicensedOn'])) ? base64_decode('ICAgIDxkaXYgY2xhc3M9ImFsZXJ0IGFsZXJ0LWRhbmdlciBmYWRlIGluIj4NCiAgICAgICAgPGJ1dHRvbiB0eXBlPSJidXR0b24iIGNsYXNzPSJjbG9zZSIgZGF0YS1kaXNtaXNzPSJhbGVydCIgYXJpYS1oaWRk    ZW49InRydWUiPsOXPC9idXR0b24+DQogICAgICAgIDxoND5XYXJuaW5nISBVbmxpY2Vuc2VkIHZlcnNpb24gb2YgdGhlIG1vZHVsZSE8L2g0Pg0KICAgICAgICA8cD5Zb3UgYXJlIHJ1bm5pbmcgYW4gdW5saWNlbnNlZCB2ZXJzaW9uIG9mIHRoaXMgbW9kdWxlISBZb3UgbmVlZCB0byBlbnRlciB5b3VyIGxpY2Vuc2U    gY29kZSB0byBlbnN1cmUgcHJvcGVyIGZ1bmN0aW9uaW5nLCBhY2Nlc3MgdG8gc3VwcG9ydCBhbmQgdXBkYXRlcy48L3A+PGRpdiBzdHlsZT0iaGVpZ2h0OjVweDsiPjwvZGl2Pg0KICAgICAgICA8YSBjbGFzcz0iYnRuIGJ0bi1kYW5nZXIiIGhyZWY9ImphdmFzY3JpcHQ6dm9pZCgwKSIgb25jbGljaz0iJCgnYVtocm    VmPSNpc2Vuc2Vfc3VwcG9ydF0nKS50cmlnZ2VyKCdjbGljaycpIj5FbnRlciB5b3VyIGxpY2Vuc2UgY29kZTwvYT4NCiAgICA8L2Rpdj4=') : '' ?>
       <?php if ($error_warning) { ?>
            <div class="alert alert-danger autoSlideUp"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
             <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <?php if ($success) { ?>
            <div class="alert alert-success autoSlideUp"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <script>$('.autoSlideUp').delay(3000).fadeOut(600, function(){ $(this).show().css({'visibility':'hidden'}); }).slideUp(600);</script>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i>&nbsp;<span style="vertical-align:middle;font-weight:bold;">Module settings</span></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form"> 
                    <div class="tabbable">
                        <div class="tab-navigation form-inline">
                            <ul class="nav nav-tabs mainMenuTabs" id="mainTabs">
                                <li><a href="#control_panel" data-toggle="tab"><i class="fa fa-power-off"></i>&nbsp;Control Panel</a></li>
                                <li><a href="#tab_support" data-toggle="tab"><i class="fa fa-power-off"></i>&nbsp;Support</a></li>
                            </ul>
                        </div><!-- /.tab-navigation --> 
                        <div class="tab-content">
                        <?php
                        if (!function_exists('modification_vqmod')) {
                        	function modification_vqmod($file) {
                        		if (class_exists('VQMod')) {
                       				return VQMod::modCheck(modification($file), $file);
                        		} else {
                        			return modification($file);
                       			}
                        	}
                        }
						?>
                            <div id="control_panel" class="tab-pane fade"><?php require_once modification_vqmod(DIR_APPLICATION.'view/template/module/adminrename/tab_controlpanel.php'); ?></div>
                            <div id="tab_support" class="tab-pane fade"><?php require_once modification_vqmod(DIR_APPLICATION.'view/template/module/adminrename/tab_support.php'); ?></div>
                        </div> <!-- /.tab-content --> 
                    </div><!-- /.tabbable -->
                </form>
            </div> 
        </div>
    </div>
</div>
<?php echo $footer; ?>
<script type="text/javascript">
	$('#mainTabs a:first').tab('show'); // Select first tab
	if (window.localStorage && window.localStorage['currentTab']) {
		$('.mainMenuTabs a[href="'+window.localStorage['currentTab']+'"]').tab('show');
	}
	if (window.localStorage && window.localStorage['currentSubTab']) {
		$('a[href="'+window.localStorage['currentSubTab']+'"]').tab('show');
	}
	$('.fadeInOnLoad').css('visibility','visible');
	$('.mainMenuTabs a[data-toggle="tab"]').click(function() {
		if (window.localStorage) {
			window.localStorage['currentTab'] = $(this).attr('href');
		}
	});
	$('a[data-toggle="tab"]:not(.mainMenuTabs a[data-toggle="tab"], .review_tabs a[data-toggle="tab"])').click(function() {
		if (window.localStorage) {
			window.localStorage['currentSubTab'] = $(this).attr('href');
		}
	});
</script>
