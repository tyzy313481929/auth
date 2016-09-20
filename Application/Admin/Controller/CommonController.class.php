<?php
namespace Admin\Controller;
use Think\Controller;
class CommonController extends Controller{
	public function _initialize(){
	    if(!isset($_SESSION['uid'])){
	    	redirect(U('Login/index'));
	    }
	    $name = MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
	    if(!authcheck($name,$_SESSION['uid'])){
	    	$this->error('you have no auth');
	    }
	}

	final public function getMenus(){
		  $menus = [];
          $where = [
          		'pid'  => 0,
          		'hide' => 0
          ];
          $menus['main']  = M('Menu')->where($where)->order('sort asc')->select();
          $menus['child'] = [];

          foreach ($menus as $key => $item) {
           	# code...
           	    $where['pid']  = $item['id'];
           } 
	}
}



