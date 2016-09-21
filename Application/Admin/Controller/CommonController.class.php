<?php
namespace Admin\Controller;
use Think\Controller;
class CommonController extends Controller{
  protected $model;
  protected $primaryKey;
	public function _initialize(){
	    if(!isset($_SESSION['uid'])){
	    	redirect(U('Login/index'));
	    }
	    $name = MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
	    if(!authcheck($name,$_SESSION['uid'])){
	    	$this->error('you have no auth');
	    }
      $this->assign('menus',$this->getMenus());
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
  
  /**
  *
  */
  public function add(){
    if(I('post.')){
       $result = $this->model->savedata(I('post.'));
       if('success' == $result['status']){
          $this->success('save suceess');
       }else{
          $this->error('save error,pls try again');
       }
    }else{
      $this->display();
    }
    
  }

  public function edit(){
    if(I('post.')){
       $result = $this->model->savedata(I('post.'));
       if('success' == $result['status']){
          $this->success('save suceess');
       }else{
          $this->error('save error,pls try again');
       }
    }else{
      $id  = I('param.id');
      $key = $this->model->getPk();
      $where[$key] = $id;
      $info = $this->model->where($where)->find();
      $this->assign('info',$info); 
      $this->display();
    }
     
  }

}



