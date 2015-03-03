<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="portal berita">
    <meta name="author" content="Nanang-similiar">
	<title>portal_similiar</title>
  <link href="<?php echo base_url()?>assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="<?php echo base_url()?>assets/bootstrap/css/style.css" rel="stylesheet">
    
	
</head>
<body>

	<div class="container">
	  <div class="page-header">
  <h1>WELCOME TO PORTAL SIMILIAR <small>hot news the year</small></h1>
</div>

      <!-- Static navbar -->
      <div class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Portal Similiar</a>
          </div>
          <?php if($this->uri->segment(1)=="sites_panel"){
          echo"
          <div class='navbar-collapse collapse'>
            <ul class='nav navbar-nav nav-tabs'>
               <li><a href='".base_url('sites_panel/')."'>Menu</a></li>
               <li><a href='".base_url('sites_panel/category')."'>Category Menu</a></li>
               <li><a href='".base_url('sites_panel/contens')."'>Contens</a></li>
           </ul>
            <ul class='nav navbar-nav navbar-right'>
              <li class='dropdown'>
                <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Hy, ".ucwords($name)." <b class='caret'></b></a>
                <ul class='dropdown-menu'>
                  <li><a href='".base_url('sites_panel/change')."'>Change Password</a></li>
                  <li><a href='".base_url('home/logout')."'>Logout</a></li>
                </ul>
               </li>
            </ul>
          </div><!--/.nav-collapse -->";
          }else{
            echo"
          <div class='navbar-collapse collapse'>
            <ul class='nav navbar-nav nav-tabs'>

               <li><a href='".base_url('news/')."'>Home</a></li>";?>

               <?php foreach ($query_menu->result() as $key):?>
			           <li><a href="<?php echo base_url()?><?php echo $key->url ?>"><?php echo $key->name ?></a></li>
		          <?php endforeach; ?>
              <?php echo"
			     </ul>
          
          </div><!--/.nav-collapse -->";
        }?>
        </div><!--/.container-fluid -->
      </div>

      