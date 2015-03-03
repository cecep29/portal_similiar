  <?php if($this->session->flashdata('error')) { ?> 

         		
			<div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>Gagal!</strong> <?php echo $this->session->flashdata('error')?> </div>
			
            <?php } ?>
            
            <?php if($this->session->flashdata('info')) { ?> 

            
			
			<div class="alert alert-info alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <strong>Informasi!</strong> <?php echo $this->session->flashdata('info')?> </div>
                  
			
            <?php } ?>
            
            <?php if($this->session->flashdata('success')) { ?> 

             			
			<div class="alert alert-success alert-dismissable">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <strong>Sukses!</strong> <?php echo $this->session->flashdata('success')?> </div>
			
            <?php } ?>
            
            <?php if($this->session->flashdata('warning')) { ?> 

           		
			 <div class="alert alert-warning alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <strong>Peringatan!</strong> <?php echo $this->session->flashdata('warning')?> </div>
			
            <?php } ?>