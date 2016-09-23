<?php
namespace Admin\Controller;
use Think\Controller;

class AuthGroupController extends CommonController {

	public function __construct() {
			parent::__construct();
			$this->model = D('AuthGroup');
	}



	public function index() {
			$where = array();
			if (I('post.title')) {
				$where['title'] = array('like', '%' . I('post.title') . '%');
			}
			$where['status'] = 1;
			$list = $this->model->where($where)->select();
			I('post.') && $this->assign('post', I('post.'));
			$this->assign('list', $list);
			$this->display();
	}


	/**
	*１.保存用户组名称
	*2.保存用户组成员
	*３.保存用户组权限
	*/
	public function add()
	{
			if (I('post.')) {
					$data['title'] = I('post.title');
					$data['rules'] = implode(',',I('post.rules'));
					$this->model->savedata($data);
			} else {
				  $User = D('User');
					$this->assign('userlist',$User->getUserList());
					$this->assign('node_list',$this->returnNodes());
					$this->display();
			}
	}




	/**
	 * 管理员用户组数据写入/更新
	 * @author 朱亚杰 <zhuyajie@topthink.net>
	 */
	public function writeGroup(){
			if(isset($_POST['rules'])){
					sort($_POST['rules']);
					$_POST['rules']  = implode( ',' , array_unique($_POST['rules']));
			}
			$_POST['module'] =  'admin';
			$_POST['type']   =  AuthGroupModel::TYPE_ADMIN;
			$AuthGroup       =  D('AuthGroup');
			$data = $AuthGroup->create();
			if ( $data ) {
					if ( empty($data['id']) ) {
							$r = $AuthGroup->add();
					}else{
							$r = $AuthGroup->save();
					}
					if($r===false){
							$this->error('操作失败'.$AuthGroup->getError());
					} else{
							$this->success('操作成功!',U('index'));
					}
			}else{
					$this->error('操作失败'.$AuthGroup->getError());
			}
	}


}
