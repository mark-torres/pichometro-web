<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pichometros extends CI_Controller {
	private $response;

	public function __construct() {
		parent::__construct();
		// API default values
		$this->response = array(
			'success' => false,
			'message' => "Nothing done"
		);
		if (!empty($_POST)) {
			$this->response['post'] = $_POST;
		}
	}

	private function write_response() {
		header("Content-Type: application/json");
		die(json_encode($this->response));
	}

	// - - - - - - - - - - - - - -

	public function create() {
		$this->write_response();
	}

	public function save() {
		$this->write_response();
	}

	public function delete() {
		$this->write_response();
	}

	public function show() {
		$this->write_response();
	}

}
