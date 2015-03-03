<?php echo $this->load->view('alert') ?>
<div>
	<div class="pull-right">
	<?php if($this->uri->segment(2)=="contens"){
				echo"
		<a href='".base_url('sites_panel/input/addcontens')."' class='btn btn-success'>Add New</a>";
	}elseif($this->uri->segment(2)=="category"){
		echo"
		<a href='".base_url('sites_panel/input/addcategory')."' class='btn btn-success'>Add New</a>";
	}else{
		echo"
		<a href='".base_url('sites_panel/input/addmenu')."' class='btn btn-success'>Add New</a>";
	}?>
	</div>
	<br/><br/>
	<table class="table table-bordered">
		<tr class="info">
			<td>No</td>
			<?php if($this->uri->segment(2)=="contens"){
				echo"
					<td>judul</td>
					<td>author</td>
					<td>contens</td>";
			}else{
				echo"
					<td>Name</td>";
			}?>
			<td>Action</td>
		</tr>

		<?php $no=1; foreach ($query->result() as $key ):?>
		<tr>
				<td width="10"><?php echo $no?></td>
				<?php if($this->uri->segment(2)=="contens"){
					echo"
						<td>".$key->judul."</td>
						<td>".$key->author."</td>
						<td>".substr($key->contens,0,200)."</td>";
				}else{
					echo"
						<td>".$key->name."</td>";
				} ?>

				<td width="200">
					<?php if($this->uri->segment(2)=="menu"){
						echo"
						<a href='".base_url('sites_panel/edit/edit_menu/'.$key->id.'')."' class='btn btn-warning'>Edit</a>"; 
					}elseif($this->uri->segment(2)=="contens"){
						echo"
						<a href='".base_url('sites_panel/edit/edit_contens/'.$key->id.'')."' class='btn btn-warning'>Edit</a>"; 
					}else{
						echo"
						<a href='".base_url('sites_panel/edit/edit_category/'.$key->id.'')."' class='btn btn-warning'>Edit</a>"; 
					} ?>
					<!---untuk menu delete-->
					<?php if($this->uri->segment(2)=="menu"){
						echo"
						<a href='".base_url('sites_panel/delete/delete_menu/'.$key->id.'')."' class='btn btn-info' onclick=\"return confirm('Are you sure remove')\" >Delete</a>"; 
					}elseif($this->uri->segment(2)=="contens"){
						echo"
						<a href='".base_url('sites_panel/delete/delete_contens/'.$key->id.'')."' class='btn btn-info' onclick=\"return confirm('Are you sure remove')\">Delete</a>"; 
					}else{
						echo"
						<a href='".base_url('sites_panel/delete/delete_category/'.$key->id.'')."' class='btn btn-info' onclick=\"return confirm('Are you sure remove')\">Delete</a>"; 
					} ?>
					
				</td>
		</tr>
		<?php $no++;endforeach;?>
	</table>
</div>