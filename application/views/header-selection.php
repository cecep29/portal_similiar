<!-- Main component for a primary marketing message or call to action -->
<?php $row= $query->row()?>
      <div class="jumbotron">
        <h1><?php echo $row->judul ?></h1>
        <p><?php echo substr($row->contens,0,300) ?></p>
        <p>
          <a class="btn btn-xs btn-primary" href="#" role="button">view more &raquo;</a>
        </p>
      </div>