<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller {

	public function index()
	{
		$this->load->view('welcome_message');
	}
	public function cpanel(){
		$this->load->view('form/form_login');
	}
	
	public function cek_login()
	{
		$this->load->model('model_login');
		$query = $this->model_login->do_login();
		if($query)
		{
			$this->session->set_flashdata('success', 'Login Sukses ');
			redirect(base_url('sites_panel/'));
		}else{
			$this->session->set_flashdata('error','Username atau Password salah !');
			redirect('site_panel/');
		}
	}

	function logout()
	{
        $this->session->sess_destroy();
		$this->session->set_flashdata('info', 'User Logout');
        redirect('/');
     }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */