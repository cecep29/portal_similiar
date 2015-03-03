<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="nanang">
    <title>Similiar Production</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url()?>asset/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url()?>assets/bootstrap/css/bootstrap.css">
	<style type="text/css">
		input[type=text], input[type=password]{
	
				width: 280px;
				border: 5px;
				-moz-border-radius: 1px;
				-webkit-border-radius: 1px;
				padding: 1em;
				margin: 0 0 1em 0em;
			}
		.row{
			margin: 0px 0px 0px 0px;
	 		padding: 120px 130px 230px 300px;
	 		}
	 	#login{
	 		background:#0BAEFA;border: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px; padding-bottom:20px;
	 	}
	</style>
  </head>
  <body>
    <div class="container" >
		<div class="row">
		<?php $this->load->view('alert');?>
			<div class="col-sm-8" id="login">
				<div class="col-sm-12"><center><h4><b>Administrator Log In</b></h4></center></div>
				<form method="post" action="<?php echo base_url()?>home/cek_login">
				<label class="col-sm-1">Username</label>
				<input class="col-sm-4" type="text" name="username" placeholder=" Your Username" required autofocus>
				<label class="col-sm-1">Password</label>
				<input class="col-sm-4" type="password" name="password" placeholder=" Your Password" required>
				<input type="submit" class="btn btn-primary col-sm-offset-3 col-sm-6">
				</form>
			</div>		  	  
		</div>	
	</div>
  </body>
</html>
