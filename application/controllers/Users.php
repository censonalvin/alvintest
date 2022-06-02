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
        if(isset($params['id'])){
            $id = $params['id'];
            $data = $this->db->get_where("customers", ['id' => $id])->row_array();
            if(!empty($data)){
                $this->response($data, RestController::HTTP_OK);
            }else{
                $this->response(["Missing required parameter ID"], RestController::HTTP_BAD_REQUEST);
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
         $customers = $this->Main_model->customer_id_checker();
         foreach ($customers as $customer) {
            // var_dump(array_shift($customer));
             $id = $customer->AUTO_INCREMENT;
             $firstName = $this->input->post('firstName',true);
             $lastName = $this->input->post('lastName',true);
             $date = new DateTime("now", new DateTimeZone('Hongkong') );
             $salesID = $id."".$firstName." ".$lastName."". $date->format('Y-m-d H:i:s');

             $input = $this->input->post();
             $input ['salesID'] = $salesID;

             $this->Main_model->customer_post($input);
             if($input > 0) {
                $this->response(["Customer Added Succesfully."], RestController::HTTP_OK);
             }
             else {
                $this->response(['status' => false, 'message' => 'FAILED TO CREATE CUSTOMER'], RestController::HTTP_BAD_REQUEST);
             }
         }
        //  var_dump($customers);

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