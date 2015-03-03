<div class="col-xs-12" id="fluid-x"> Silakan Masukkan File Keterangan 

</div>
  <div id="fluid-i" class="col-xs-12"><P></P>

  <?php foreach ($query->result() as $key ):?>
  <form class="form-horizontal" role="form" method="post" action="<?php echo base_url()?>sites_panel/update/update_menu" enctype="multipart/form-data">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 ">Name Menu</label>
    <div class="col-sm-10">
      <input type="text" name="name" class="form-control" value="<?php echo $key->name ?>">
      <input type="hidden" name="id" class="form-control" value="<?php echo $key->id ?>">
      <input type="hidden" name="id_url" class="form-control" value="<?php echo $key->id_url ?>">
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
               