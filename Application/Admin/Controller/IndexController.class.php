<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends CommonController  {
    public function index(){
    	$cate=M('cate')->select();
    	
    	$this->assign('menus',$this->getMenus());
    	$this->assign('cate',$cate);
        $this->display();
    }
}