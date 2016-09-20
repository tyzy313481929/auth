<?php
namespace Admin\Controller;
use Think\Controller;

class LoginController extends Controller{
	public function index(){
		$this->display();
	}

	public function login(){
		if(!IS_POST){
			$this->error('invalid request');
		}

		$username = I('post.username');
		$password = I('post.password','','md5');

		$rs = M('user')->where(['username' => $username])->find();
		
		if(!$rs || $rs['password'] != $password){
			$this->error('the password is wrong,pls try again');
		}

		session('uid',$rs['id']);
		session('username',$rs['username']);
		redirect(U('Index/index'),1,'login successful');
	}
}