<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class News extends CI_Controller {
	public function __construct() {

	parent::__construct(); 
	$this->load->model('model_news');

	}
	
	public function index()
	{
		$data['query_menu'] = $this->model_news->get();
		$data['query_category'] = $this->model_news->get_cat();
		$data['query'] = $this->model_news->get_main_conten();

		
		$this->load->view('header',$data);
		$this->load->view('header-selection',$data);
		$this->load->view('browse',$data);
		$this->load->view('footer',$data);
		
	}

	public function view()
	{
		$id = $this->uri->segment(4);
		$data['query_menu'] = $this->model_news->get();
		$data['query_category'] = $this->model_news->get_cat();
		$data['query'] = $this->model_news->get_main($id);

		
		$this->load->view('header',$data);
		$this->load->view('browse',$data);
		$this->load->view('footer',$data);
		
	}
	public function store_category($id)
	{
		$data['query_menu'] = $this->model_news->get();
		$data['query_category'] = $this->model_news->get_cat();
		$data['query'] = $this->model_news->get_main($id);

		
		$this->load->view('header',$data);
		$this->load->view('browse',$data);
		$this->load->view('footer',$data);
		
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */