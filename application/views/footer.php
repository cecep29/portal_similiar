<?php if($this->uri->segment(1)=="news"):
  echo"
        <div class='col-sm-4'>
          <div class='list-group'>
            <a href='#'' class='list-group-item active'>
              <h4 class='list-group-item-heading'>Category</h4>
            </a>";?>
            <?php foreach ($query_category->result() as $res):?>
            <a href="<?php echo base_url()?>news/store_category/<?php echo $res->id ?>" class="list-group-item"><?php echo $res->name ?></a>
              <?php endforeach;?>
              <?php echo"
          </div>
          <div class='list-group'>
        	  <a href='#'' class='list-group-item active'>
        	    <h4 class='list-group-item-heading'>Archives Title</h4>
        	  </a>";?>
        	   <?php foreach ($query->result() as $res):?>
            <div class="bs-docs-sidebar hidden-print" role="complementary">
              <ul class="nav bs-docs-sidenav">
                <li>
                  <a href="<?php echo base_url()?>news/store_category/<?php echo $res->id ?>" class="list-group-item dropdown-toggle" data-toggle="dropdown"><?php echo $res->judul ?></a> 
                  
                </li>
              </ul>
            </div>
            <?php endforeach;?>
            </div>
              <?php echo"
        	</div>
      	</div>
      </div>
    </div> <!-- /container -->";
   endif; 
?>
    <div class="blog-footer">
      <p>Copyright @2015 by <a href="https://github/nanang-suparno.com">Similiar production</a>.</p>
      <p>
        <a href="#">Back to top</a>
      </p>
    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<?php echo base_url()?>assets/bootstrap/js/jquery.min.js"></script>
    <script src="<?php echo base_url()?>assets/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/ckeditor/config.js"></script>     
  </body>
</html>