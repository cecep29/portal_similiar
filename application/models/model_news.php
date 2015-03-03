<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Model_news extends CI_Model {

	
	public function get()
	{
		$query = $this->db->select('a.name,a.id,b.id AS id_url,b.url')->from('similiar_menu a')->join('similiar_url_menu b','a.id=b.menu_id')->get();

		return $query;
	}

	public function get_cat()
	{
		$query = $this->db->select('*')->from('similiar_cat_menu')->get();

		return $query;	
	}

	

	public function get_contens()
	{
		$query = $this->db->select('*')->from('similiar_contens')->get();

		return $query;	
	}
	
	public function get_main_conten()
	{
	$this->db->select('*')
			 ->from('similiar_contens a')
			 ->join('similiar_cat_menu b','a.cat_menu_id = b.id ');
	$query = $this->db->get();
		
	return $query;
	}

	public function get_main($id)
	{
	$this->db->select('*')
			 ->from('similiar_contens a')
			 ->join('similiar_cat_menu b','a.cat_menu_id = b.id ');
			
			if($this->uri->segment(2)=="store_category")
			{
				$this->db->where('a.cat_menu_id',$id);
			}else{
				$this->db->where('a.menu_id',$id);
			}
		
	$query = $this->db->get();
		
	return $query;
	}

	function do_insert_menu()
	{
		$name		= $this->input->post('name');
		//$name    = $this->input->post('url');
		$parent_id 			= $this->input->post('parent_id');
		$tes = "pindah ke table url_menu";
		$data = array(
			'name'	  	 =>	$name,
			'url'		 =>	$tes,
			'parent_id'	 =>	$parent_id,
			);

		$this->db->insert('similiar_menu',$data);
		$id = $this->db->insert_id();

		$url = 'news/view/'.$name.'/'.$id;

		$res = array(
			'menu_id' => $id,
			'url'     => $url
			);
		$this->db->insert('similiar_url_menu',$res);
		
	}
	
	function do_insert_category()
	{
		$name	= $this->input->post('name');
		
		$data = array(
			'name'	=>	$name,
			'date'	=>	date('Y-m-d'),
			'year'	=>	date('Y'),
			);

		$this->db->insert('similiar_cat_menu',$data);
		$id = $this->db->insert_id();	
	}

	function do_insert_contens()
	{
		//$namafile =' ';
		$namafile = $this->upload_file();
		
		echo $menu_id		= $this->input->post('menu_id');
		exit();
		$cat_menu_id    = $this->input->post('cat_menu_id');
		$judul 			= $this->input->post('judul');
		$author 		= $this->input->post('author');
		$contens     	= $this->input->post('contens');
		

		$data = array(
			'menu_id'	  	 =>	$menu_id,
			'cat_menu_id'	 =>	$cat_menu_id,
			'judul'	  		 =>	$judul,
			'date_input' 	 =>	date('Y-m-d'),
			'author' 		 =>	$author,
			'image'	  	 	 =>	$namafile,
			'contens'		 =>	$contens
			);


		$this->db->insert('similiar_contens',$data);
		$id = $this->db->insert_id();
		
	}
	
	function upload_file()
	{

		$namafile =' ';	
		if($_FILES)
		{
			//Jika kondisi ada file
				//Upload file
			$config['upload_path'] = './assets/uploads/images/';
			$config['allowed_types'] = 'jpeg|png|jpg';
			$this->load->library('upload',$config);

			if (!$this->upload->do_upload())
			{
				$error = array('error' => $this->upload->display_errors());
				echo"<pre>";
				 print_r($error);
				 exit();
				echo"</pre";
			}else{

				$datafile=$this->upload->data();
				$namafile = $datafile['file_name'];
			} //end of if upload
		}//end of if $_files

		return $namafile;
	}//function end

	function do_delete($name,$id)
	{
		if($name=="delete_menu")
		{
			$query = $this->db->where('id',$id)->delete('similiar_menu');
		
		}elseif($name=="delete_category")
		{
			$query = $this->db->where('id',$id)->delete('similiar_cat_menu');
		
		}else{
			
			$query = $this->db->where('id',$id)->delete('similiar_contens');
					
		}

		return $query;
	}
	
	function get_show_edit($name,$id)
	{
		if($name=="edit_menu")
		{
			$query = $this->db->select('a.name,a.id,b.id AS id_url,b.url')
							  ->from('similiar_menu a')
							  ->join('similiar_url_menu b','a.id=b.menu_id')
							  ->where('a.id',$id)
							  ->get();
		
		}elseif($name=="edit_category")
		{
			$query = $this->db->select('*')->where('id',$id)->from('similiar_cat_menu')->get();
		
		}else{
			
			$query = $this->db->select('*')->where('id',$id)->from('similiar_contens')->get();
					
		}

		return $query;
	}

	function do_update($name)
	{
		if($name=="update_menu")
		{
			$name 	= $this->input->post('name');
			$id 	= $this->input->post('id');
			$id_url = $this->input->post('id_url');

			$data 	= array('name'=>	$name);

			$url 	= 'news/view/'.$name.'/'.$id;
			$res 	= array('url'     => $url);

			$query 	= $this->db->where('id',$id)->update('similiar_menu',$data);
			$query 	= $this->db->where('id',$id_url)->update('similiar_url_menu',$res);
		
		}elseif($name=="update_category")
		{
			$id		= $this->input->post('id');
			$name	= $this->input->post('name');
		
			$data = array(
							'name'	=>	$name,
							'date'	=>	date('Y-m-d'),
							'year'	=>	date('Y'),
							);

			$query = $this->db->where('id',$id)->update('similiar_cat_menu',$data);
		
		}else{
			
			$id		= $this->input->post('id');
			//$namafile 		= $this->upload_file();
			$menu_id		= $this->input->post('menu_id');
			//$cat_menu_id    = $this->input->post('cat_menu_id');
			$judul 			= $this->input->post('judul');
			$author 		= $this->input->post('author');
			$contens     	= $this->input->post('contens');
		

			$data = array(
							'menu_id'	  	 =>	$menu_id,
							//'cat_menu_id'	 =>	$cat_menu_id,
							'judul'	  		 =>	$judul,
							//'date_input' 	 =>	date('Y-m-d'),
							'author' 		 =>	$author,
							//'image'	  	 	 =>	$namafile,
							'contens'		 =>	$contens
							);

			$query = $this->db->where('id',$id)->update('similiar_contens',$data);
					
		}

		return $query;
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */