<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends CommonController  {
    public function index(){
    	$cate=M('cate')->select();
    	$this->assign('cate',$cate);
        $this->display();
    }
}