<?php

// <copyright file="bulkptoc.php" company="Sharley's Web Development"> 
// Copyright (c) 2015 All Right Reserved, http://sharleys.co.uk/ 
//
// This source is subject to the Sharley's Web Development and GPL Licenses. 
// Please see the license.txt file for more information. 
// All other rights reserved. 
// 
// THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY  
// KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE 
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A 
// PARTICULAR PURPOSE. 
// 
// </copyright> 
// <author>Kamen Sharlandjiev</author> 
// <email>support@sharleys.co.uk</email> 
// <date>12/08/2015</date> 

class ControllerExtensionModuleBulkptoc extends Controller {
 private $error = array();

 public function index() {
 	$this->load->language("extension/module/bulkptoc");

 	$this->document->setTitle($this->language->get("heading_title")); 

 	$this->load->model("setting/setting");  

 	if (($this->request->server["REQUEST_METHOD"] == "POST") && $this->validate()) { 
 		$this->model_setting_setting->editSetting('bulkptoc', $this->request->post);   

 		$this->session->data["success"] = $this->language->get("text_success"); 

 		$this->response->redirect($this->url->link('extension/extension', "token=" . $this->session->data["token"], "SSL"));
 	}

 $this->load->model('localisation/order_status'); 
 	$data["heading_title"] = $this->language->get("heading_title"); 

 //commons 
 	$data["button_save"] = $this->language->get("button_save");
 	$data["button_cancel"] = $this->language->get("button_cancel");
 	$data["text_enabled"] = $this->language->get("text_enabled");   
 	$data["text_disabled"] = $this->language->get("text_disabled"); 
 	$data["success"] = $this->language->get("text_disabled"); 
 	$data["text_module"] = $this->language->get("text_module"); 
 	$data["tab_general"] = $this->language->get("tab_general");
 	$data["tab_general_legend"] = $this->language->get("tab_general_legend");
 	$data["entry_status"] = $this->language->get("entry_status");   
 	$data["placeholder_status"] ='';   
 	$data["tab_help"] = $this->language->get("tab_help");
 	$data["tab_help_legend"] = $this->language->get("tab_help_legend");
 	$data["entry_test_about"] = $this->language->get("entry_test_about");   
 	$data["placeholder_test_about"] ='';   
 	$data["entry_test_support"] = $this->language->get("entry_test_support");   
 	$data["placeholder_test_support"] ='';   
 	$data["entry_test_vote_for_us"] = $this->language->get("entry_test_vote_for_us");   
 	$data["placeholder_test_vote_for_us"] ='';   

 	if (isset($this->error["warning"])) {
 		$data["error_warning"] = $this->error["warning"];   
 	} else {  
 		$data["error_warning"] = "";
 	}

 	$data["breadcrumbs"] = array(); 

 	$data["breadcrumbs"][] = array( 
 		"text" => $this->language->get("text_home"),   
 		"href" => $this->url->link("common/dashboard", "token=" . $this->session->data["token"], "SSL")   
 	);

 	$data["breadcrumbs"][] = array( 
 		"text" => $this->language->get("text_module"), 
 		"href" => $this->url->link('extension/extension', "token=" . $this->session->data["token"], "SSL")   
 	);

 	if (!isset($this->request->get["module_id"])) {
 		$data["breadcrumbs"][] = array( 
 			"text" => $this->language->get("heading_title"),  
 			"href" => $this->url->link("extension/module/bulkptoc", "token=" . $this->session->data["token"], "SSL")  
 		);  
 	} else {  
 		$data["breadcrumbs"][] = array( 
 			"text" => $this->language->get("heading_title"),  
 			"href" => $this->url->link("extension/module/bulkptoc", "token=" . $this->session->data["token"] . "&module_id=" . $this->request->get["module_id"], "SSL")
 		);  
 	}

		$data['action'] = $this->url->link('extension/module/bulkptoc', 'token=' . $this->session->data['token'], 'SSL');       
		         
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'); 
  
		if (isset($this->error['warning'])) {    
			$data['error_warning'] = $this->error['warning'];           
		} else { 
			$data['error_warning'] = '';           
		}        
  
		if (isset($this->session->data['error_warning'])) { 
			$data['error_warning'] = $this->session->data['error_warning'];        
  
			unset($this->session->data['error_warning']);     
		} else { 
			$data['error_warning'] = '';           
		}        
		         
		if (isset($this->session->data['success'])) {       
			$data['success'] = $this->session->data['success'];         
  
			unset($this->session->data['success']);           
		} else { 
			$data['success'] = '';      
		}          
 	$data["token"] = $this->session->data["token"];  

	if (isset($this->request->post['bulkptoc_status'])) {
		$data['bulkptoc_status'] = $this->request->post['bulkptoc_status'];
	} else {
		$data['bulkptoc_status'] = $this->config->get('bulkptoc_status');
	}      
 	$data["header"] = $this->load->controller("common/header");
 	$data["column_left"] = $this->load->controller("common/column_left");   
 	$data["footer"] = $this->load->controller("common/footer");

 	$this->response->setOutput($this->load->view("extension/module/bulkptoc.tpl", $data));
 }  

 protected function validate() {

 	return !$this->error;
 }
}
