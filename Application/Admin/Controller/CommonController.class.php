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
		  $menulist = [];
          $where = [
          		'pid'  => 0,
          		'hide' => 0
          ];
          $father = M('Menu')->where($where)->order('sort asc')->select();
          $where['pid'] = array('gt',0);
          $child  = M('Menu')->where($where)->order('sort asc')->select();
          foreach ($father as $key => $item) {
           	    $menulist[$item['id']]['father'] = $item; 
           	    foreach ($child as $cey => $citem) {
           	    	if($item['id']  == $citem ['pid']){
           	    		$menulist[$item['id']]['child'][] = $citem;
           	    	}
           	    }
           } 
           return $menulist;
	}
}



