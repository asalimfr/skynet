<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Utilisateurs extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		$this->load->helper('url');

		$this->load->library('grocery_CRUD');
	}

	public function _layout_output($output = null)
	{
		$this->load->view('admin_layout.php',$output);
	}

	public function offices()
	{
		$output = $this->grocery_crud->render();

		$this->_example_output($output);
	}

	public function index()
	{
		$this->_example_output((object)array('output' => '' , 'js_files' => array() , 'css_files' => array()));
	}
	
	
	public function manageUtilisateurs()
	{
		try{
			$crud = new grocery_CRUD();
	
			$crud->set_theme('datatables');
			$crud->set_table('aauth_users');
			$crud->set_subject('Utilisateurs');
			
			$crud->columns('name','email','pass');
	
			$output = $crud->render();
	
			$this->_layout_output($output);
	
		}catch(Exception $e){
			show_error($e->getMessage().' --- '.$e->getTraceAsString());
		}
	}
	

}