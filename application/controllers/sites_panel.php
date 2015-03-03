<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Sites_panel extends CI_Controller {

	public function __construct() 
	{

	  parent::__construct(); 
	  
		$this->load->model('model_news');
		/* session untuk ckeditor*/
		session_start();
		$_SESSION['base_url'] = base_url();
		$_SESSION['ses_kcfinder']=array();
		$_SESSION['ses_kcfinder']['disabled'] = false;
		$_SESSION['ses_kcfinder']['uploadURL'] = base_url("assets/uploads");
		//end ckeditor

		$this->name =  $this->session->userdata('name');
	    	
			/* pengecekan, apakah sudah ada yang login atau belum */
			if (($this->name =='') || (!isset ($this->name)))
			{
				redirect('home/cpanel');
			}else{
				base_url("sites_panel/");	
			}//end if	

	}

	public function index()
	{
		$data['name'] = $this->session->userdata('name');
		$data['query'] = $this->model_news->get();
		$this->load->view('header',$data);
		$this->load->view('sites_panel/browse',$data);
		$this->load->view('footer');
	}

	public function category()
	{
		$data['name'] = $this->session->userdata('name');
		$data['query'] = $this->model_news->get_cat();
		$this->load->view('header',$data);
		$this->load->view('sites_panel/browse',$data);
		$this->load->view('footer');
	}

	public function contens()//tampil menu contens
	{
		$data['name'] = $this->session->userdata('name');
		$data['query'] = $this->model_news->get_contens();
		$this->load->view('header',$data);
		$this->load->view('sites_panel/browse',$data);
		$this->load->view('footer');
	}

	public function input($name)
	{
		if($name=="addcategory")
		{

		$data['name'] = $this->session->userdata('name');
		$conten = "form/form_add-cat";

		}elseif ($name=="addcontens"){

		$data['name'] = $this->session->userdata('name');

		$data['query_menu'] = $this->model_news->get();
		$data['query_category'] = $this->model_news->get_cat();
		$conten ="form/form_add-conten";
		
		}elseif($name=="addmenu"){
		
		$data['name'] = $this->session->userdata('name');
		
		$conten = "form/form_add-menu";
		}

		$this->load->view('header',$data);
		$this->load->view($conten,$data);
		$this->load->view('footer');
	}

	
	public function insert_menu(){

		$this->model_news->do_insert_menu();
		$res = array('info' => "insert menu has been success ");
		$this->session->set_flashdata($res);
		
		redirect('sites_panel/menu');
	}

	public function insert_category(){

		$this->model_news->do_insert_category();
		$res = array('info' => "insert category has been success ");
		$this->session->set_flashdata($res);
		
		redirect('sites_panel/category');
	}

	public function insert_contens(){

		$this->model_news->do_insert_contens();
		$res = array('info' => "insert article has been success ");
		$this->session->set_flashdata($res);
		
		redirect('sites_panel/contens');
	}

	public function edit($name,$id)
	{
		
		if($name=="edit_menu")
		{
			$data['name'] = $this->session->userdata('name');
			$data['query'] = $this->model_news->get_show_edit($name,$id);
			
			$this->load->view('header',$data);
			$this->load->view('form/form_edit-menu',$data);
			$this->load->view('footer');
		
		}elseif($name=="edit_category"){

			$data['name'] = $this->session->userdata('name');
			$data['query'] = $this->model_news->get_show_edit($name,$id);
			
			$this->load->view('header',$data);
			$this->load->view('form/form_edit-cat',$data);
			$this->load->view('footer');

		}else{

			$data['name'] = $this->session->userdata('name');
			$data['query_menu'] = $this->model_news->get();
			$data['query_category'] = $this->model_news->get_cat();
			$data['query'] = $this->model_news->get_show_edit($name,$id);
			
			$this->load->view('header',$data);
			$this->load->view('form/form_edit-conten',$data);
			$this->load->view('footer');
					
		}
		
	}
	
	public function update($name)
	{
		$this->model_news->do_update($name);
		$res = array('info' => "anda berhasil mengupdate data ");
		$this->session->set_flashdata($res);

		if($name=="update_menu")
		{
			redirect('sites_panel/menu');
		
		}elseif($name=="update_category")
		{
			redirect('sites_panel/category');
		
		}else{
			
			redirect('sites_panel/contens');
					
		}
		
	}

	public function delete($name,$id)
	{
		$this->model_news->do_delete($name,$id);
		$res = array('info' => "anda berhasil menghapus data ");
		$this->session->set_flashdata($res);

		if($name=="delete_menu")
		{
			redirect('sites_panel/menu');
		
		}elseif($name=="delete_category")
		{
			redirect('sites_panel/category');
		
		}else{
			
			redirect('sites_panel/contens');
					
		}
		
	}

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */