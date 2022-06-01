<?php
defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . 'libraries/RestController.php';
require APPPATH . 'libraries/Format.php';

use chriskacerguis\RestServer\RestController;
    
class Users extends RestController {
    
    public function __construct() {
       parent::__construct();
       $this->load->database();
    }
       
    /**
     * Get All Data from this method.
     * 
     * @param name
     * @return Response
    */
	public function index_get()
	{
        $params = $_REQUEST;
        if(isset($params['name'])){
            $lastname = $params['name'];
            $data = $this->db->get_where("customers", ['lastname' => $lastname])->row_array();
            if(!empty($data)){
                $this->response($data, RestController::HTTP_OK);
            }else{
                $this->response(["Missing required parameter name"], RestController::HTTP_BAD_REQUEST);
            }
        }else{
            $data = $this->db->get("customers")->result();
            $this->response($data, RestController::HTTP_OK);
        }
	}
      
    /**
     * Add New Data from this method.
     *
     * @return Response
    */
    public function index_post()
    {
        $input = $this->input->post();
        $this->db->insert('customers',$input);  
        $this->response([
            "Message" => "HTTP 202 Accepted",
            "Result" => 202
        ], RestController::HTTP_CREATED);
    } 
     
    /**
     * Update Data from this method.
     *
     * @return Response
    */
    public function index_put()
    {
        $params = $_REQUEST;
        if(isset($params['id'])){
            $id = $_GET['id'];
            $input = $this->put();
            $this->db->update('customers',$input,array('id'=>$id));
            $this->response(['Item updated successfully.'], RestController::HTTP_OK);
        }else{
            $this->response(["Missing required parameter id"], RestController::HTTP_BAD_REQUEST);
        }
    }
     
    /**
     * Delete Data from this method.
     *
     * @return Response
    */
    public function index_delete()
    {
        $params = $_REQUEST;
        if(isset($params['id'])){
            $id = $_GET['id'];
            $this->db->delete('customers', array('id'=>$id));       
            $this->response(['Item deleted successfully.'], RestController::HTTP_OK);
        }
        else{
            $this->response(["Missing required parameter id"], RestController::HTTP_BAD_REQUEST);
        }
    }
    	
}