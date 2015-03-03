<div class="col-xs-12" id="fluid-x"> Silakan Masukkan File Keterangan 

</div>
  <div id="fluid-i" class="col-xs-12"><P></P>
  <form class="form-horizontal" role="form" method="post" action="<?php echo base_url()?>sites_panel/insert_contens" enctype="multipart/form-data">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 ">judul</label>
    <div class="col-sm-10">
      <input type="text" name="judul" class="form-control" id="inputEmail3" placeholder="Title">
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 ">author</label>
    <div class="col-sm-10">
      <input type="text" name="author" class="form-control" id="inputEmail3" placeholder="author">
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 ">image</label>
    <div class="col-sm-10">
      <input type="file" name="userfile" />
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 ">Menu</label>
    <div class="col-sm-10">
      <select name="menu_id" class="form-control">
        <?php foreach ($query_menu->result() as $key) 
        {
          echo" <option value='$key->id'>$key->name $key->id</option>";
        }
       ?>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 ">Category</label>
    <div class="col-sm-10">
      <select name="cat_menu_id" class="form-control">
      	<?php foreach ($query_category->result() as $key) 
        {
          echo" <option value='$key->id'>$key->name</option>";
        }
       ?>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 ">Contens</label>
    <div class="col-sm-10">
      <textarea name="contens" class="ckeditor" ></textarea>
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Save</button>
    </div>
  </div>
</form>
  </div>
               