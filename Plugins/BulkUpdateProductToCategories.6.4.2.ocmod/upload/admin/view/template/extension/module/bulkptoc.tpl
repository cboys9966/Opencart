<!-- <copyright file="bulkptoc.tpl" company="Sharley's Web Development"> 
 Copyright (c) 2015 All Right Reserved, http://sharleys.co.uk/ 

 This source is subject to the Sharley's Web Development and GPL Licenses. 
 Please see the license.txt file for more information. 
 All other rights reserved. 
 
 THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY  
 KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE 
 IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A 
 PARTICULAR PURPOSE. 
 
 </copyright> 
 <author>Kamen Sharlandjiev</author> 
 <email>support@sharleys.co.uk</email> 
 <date>12/08/2015</date>--> 

<?php echo $header; ?><?php echo $column_left; ?>   
<div id="content"> 
  <div class="page-header">    
    <div class="container-fluid">     
    <?php if ($error_warning) { ?>     
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>    
      <button type="button" class="close" data-dismiss="alert">&times;</button>  
    </div>    
    <?php } ?>       
    <?php if ($success) { ?>    
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?> 
      <button type="button" class="close" data-dismiss="alert">&times;</button>  
    </div>    
    <?php } ?>       
       
      <div class="pull-right"> 
        <button type="submit" form="form-ppexpress" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button> 
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
     </div>
      <h1><?php echo $heading_title; ?></h1>  
      <ul class="breadcrumb">  
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>   
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>    
        <?php } ?>   
      </ul>   
    </div>    
  </div>      
  <div class="container-fluid">       
    <?php if (isset($error['error_warning'])) { ?>   
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['error_warning']; ?>  
      <button type="button" class="close" data-dismiss="alert">&times;</button>  
    </div>    
    <?php } ?>       
    <div class="panel panel-default"> 
      <div class="panel-heading">     
        <h3 class="panel-title"><i class="fa fa-pencil"></i>Module settings</h3>   
      </div>  
      <div class="panel-body"> 
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-bulkptoc" class="form-horizontal">  
          <ul class="nav nav-tabs">   
            <li class="active">
              <a href="#tab_general" data-toggle="tab">
              <?php echo $tab_general; ?></a>
            </li>       
            <li >
              <a href="#tab_help" data-toggle="tab">
              <?php echo $tab_help; ?></a>
            </li>       
          </ul>      
          <div class="tab-content">   
            <div class="tab-pane active" id="tab_general">      
              <h3><?php echo $tab_general_legend; ?></h3>   
              <div class="form-group "> 
               <label class="col-sm-2 control-label" for="input-bulkptoc_status">
               <?php if (isset($help_status)) {?>
                  <span data-toggle="tooltip" title="<?php echo $help_status; ?>"><?php echo addslashes($entry_status); ?></span>
                <?php } else {?>
                  <?php echo $entry_status; ?>
                <?php }?>
               </label>
                <div class="col-sm-2"> 
                  <select name="bulkptoc_status" id="input-bulkptoc_status" class="form-control " > 
                    <option value="0" <?php if(isset($bulkptoc_status) && ('0' == $bulkptoc_status)) { echo ' selected';} ?>>Disabled</option> 
                    <option value="1" <?php if(isset($bulkptoc_status) && ('1' == $bulkptoc_status)) { echo ' selected';} ?>>Enabled</option> 
                    <?php if (isset($status_all_values) && is_array($status_all_values)) { ?>
                      <?php foreach ($status_all_values as $key =>$val) {?>
                        <option value="<?php echo $key;?>" <?php if (($key == $bulkptoc_status)) { echo ' selected';} ?>><?php echo $val;?></option> 
                      <?php } ?>
                    <?php  } ?>
                  </select> 
                </div> 
              </div>     
            </div>   
            <div class="tab-pane " id="tab_help">      
              <h3><?php echo $tab_help_legend; ?></h3>   
      			  <div class="panel panel-default"> 
      			    <div class="panel-heading"><h4 class="panel-title"><?php echo $entry_test_about;?></h4></div> 
      			    <div class="panel-body"><strong>Bulk Update Product To Categories</strong> is another great module developed by <a href="http://sharleys.co.uk/" target="_blank">Sharley's Web Development</a></div> 
      			  </div> 
      			  <div class="panel panel-default"> 
      			    <div class="panel-heading"><h4 class="panel-title"><?php echo $entry_test_support;?></h4></div> 
      			    <div class="panel-body"><a href="mailto: support@sharleys.co.uk?subject=Bulk Update Product To Categories support on <?php echo HTTP_CATALOG;?>" class="btn btn-success"> <i class="fa fa-life-ring fa-lg"></i> Contact Us</a>   <a href="http://on.fb.me/1inp4Ik" target="_blank" class="btn btn-primary"> <i class="fa fa-thumbs-up"></i> Follow us on Facebook</a></div> 
      			  </div> 
      			  <div class="panel panel-default"> 
      			    <div class="panel-heading"><h4 class="panel-title"><?php echo $entry_test_vote_for_us;?></h4></div> 
      			    <div class="panel-body">Please give as your vote & comment on <a href="http://bit.ly/1vHShWu" target="_blank">Opencart Extension Store</a></div> 
      			  </div> 
            </div>   
          </div>     
        </form>      
      </div>  
    </div>    
  </div>      
<?php echo $footer; ?> 
