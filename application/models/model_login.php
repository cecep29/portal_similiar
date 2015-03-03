<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Model_login extends CI_Model {
 
  function do_login()
  { 
    $username = $this->input->post('username');
    $password = $this->input->post('password');
    $hash =  password_hash($password, PASSWORD_BCRYPT);

        $sql = $this->db->from('similiar_account')
              ->select('*')
              ->where('username',$username)
              ->where('password_origin',password_verify($hash,PASSWORD_BCRYPT))
          ->get();

        foreach ($sql->result() as $row) {
          $fullname =$row->name;
          
        if($sql->num_rows() > 0)
        {
          
          $this->session->set_userdata('name',$fullname);
          
          return true;

        }else{

           return false;
        }
       
    }
  }
}