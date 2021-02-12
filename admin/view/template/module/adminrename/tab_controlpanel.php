<style>
div.row.rename-panel {
    padding: 20px;
}

div.row.rename-panel h2 {
    margin-bottom: 30px;
}
</style>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-5">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">Rename your admin directory</h3>
              </div>
              <div class="panel-body">
                <div class="row rename-panel">
                    <div class="col-xs-12">
                    	<div class="row">
                        	<div class="col-xs-12">
                            	Current admin directory name: <h2><?php echo $adminDir; ?></h2>
                            </div>
                        </div>
                        <div class="row">
                        	<div class="col-xs-12">Desired admin directory name: </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-6">
                                <input type="text" class="form-control" name="newAdminDir" />                                
                            </div>
                            <div class="col-xs-6">
                            	<button type="submit" class="btn btn-success save-changes"><?php echo $text_rename?></button>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
            </div>
        </div>
        <div class="col-md-7">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">How renaming happens on the backend?</h3>
              </div>
              <div class="panel-body">
                <ol>
                    <li>Initially, the module creates a backup of your current admin config.php file</li>
                    <li>The config.php file is edited</li>
                    <li>The admin directory is renamed</li>
                    <li>Check if vQmod is present</li>
                    <li>If vQmod is found, a backup of the pathReplaces.php file is created</li>
                    <li>The pathReplaces.php file is updated with the correct path replaces</li>
                    <li>Refresh the vQmod cache</li>
                </ol>
                <p><strong>Note*</strong>&nbsp;If any of the steps described above fails, e.g. if there is a permission issue, the changes made before the point of failure will be reverted</p>
              </div>
            </div>
        </div>
    </div>
</div>
