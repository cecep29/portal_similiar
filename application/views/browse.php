
<div class="row">
<div class="col-sm-12">
      <div class="col-sm-8">
<?php foreach ($query->result() as $key):?>
	   <div class="blog-post">
            <h2 class="blog-post-title"><?php echo ucwords($key->judul)?></h2>
            <div class="glyphicon glyphicon-calendar blog-post-meta">&nbsp;<?php echo $key->date_input?></div>&nbsp;
            <div class="glyphicon glyphicon-book blog-post-meta">&nbsp;<?php echo $key->name?></div>&nbsp;
            <div class="glyphicon glyphicon-user blog-post-meta">&nbsp;<?php echo $key->author?></div>
            <p><?php echo $key->contens ?></p>
         </div>
<?php endforeach; ?>
      </div>
      