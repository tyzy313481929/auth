<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        echo "hello";
    }

    public function test(){
    	$this->show('helloword');
    }
}