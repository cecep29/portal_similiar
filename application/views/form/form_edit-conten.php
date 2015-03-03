<div class="col-xs-12" id="fluid-x"> Silakan Masukkan File Keterangan 

</div>
  <div id="fluid-i" class="col-xs-12"><P></P>
  <?php foreach ($query->result() as $key ):?>
  <form class="form-horizontal" role="form" method="post" action="<?php echo base_url()?>sites_panel/update/update_contens" enctype="multipart/form-data">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 ">judul</label>
    <div class="col-sm-10">
      <input type="text" name="judul" class="form-control" value="<?php echo $key->judul ?>" >
      <input type="hidden" name="id" class="form-control" value="<?php echo $key->id ?>" >
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 ">author</label>
    <div class="col-sm-10">
      <input type="text" name="author" class="form-control" value="<?php echo $key->author ?>">
    </div>
  </div>

  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 ">Contens</label>
    <div class="col-sm-10">
      <textarea name="contens" class="ckeditor" ><?php echo $key->contens ?></textarea>
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 ">Menu</label>
    <div class="col-sm-10">
      <select name="menu_id" class="form-control">
      <option><?php echo  $key->menu_id ?></option>
        <?php foreach ($query_menu->result() as $key) 
        {
          echo" <option value='$key->id'>$key->name $key->id</option>";
        }
       ?>
      </select>
    </div>
  </div>
  
 
  <?php endforeach; ?>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Update</button>
    </div>
  </div>
</form>
  </div>
               