<?php
namespace Admin\Controller;
use Think\Controller;

class UserController extends CommonController {

	public function __construct() {
		parent::__construct();
		$this->model = D('User');
	}
	public function index() {
		$where = array();
		if (I('post.username')) {
			$where['username'] = array('like', '%' . I('post.username') . '%');
		}
		$where['status'] = 1;
		$list = $this->model->where($where)->select();
		I('post.') && $this->assign('post', I('post.'));
		$this->assign('list', $list);
		$this->display();
	}

	public function add() {
		if (I('post.')) {
			$data = I('post.');
			$data['password'] = md5(data['password']);
			$result = $this->model->savedata($data);
			if ('success' == $result['status']) {
				$this->success('save suceess', U('index'));
			} else {
				$this->error($result['data']);
			}
		} else {
			$this->display();
		}
	}

	/**
	 */
	public function edit() {
		if (I('post.')) {
			$user = I('post.');
			if (empty($user['password'])) {
				unset($user['password']);
			} else {
				$user['password'] = md5($user['password']);
			}

			$result = $this->model->savedata($user);
			if ('success' == $result['status']) {
				$this->success('save suceess', U('index'));
			} else {
				$this->error($result['data']);
			}
		} else {
			$id = I('param.id');
			$key = $this->model->getPk();
			$where[$key] = $id;
			$info = $this->model->where($where)->find();
			$this->assign('info', $info);
			$this->display();
		}

	}

	/**
	 * 修改昵称初始化
	 * @author huajie <banhuajie@163.com>
	 */
	public function updateNickname() {
		$nickname = M('Member')->getFieldByUid(UID, 'nickname');
		$this->assign('nickname', $nickname);
		$this->meta_title = '修改昵称';
		$this->display();
	}

	/**
	 * 修改昵称提交
	 * @author huajie <banhuajie@163.com>
	 */
	public function submitNickname() {
		//获取参数
		$nickname = I('post.nickname');
		$password = I('post.password');
		empty($nickname) && $this->error('请输入昵称');
		empty($password) && $this->error('请输入密码');

		//密码验证
		$User = new UserApi();
		$uid = $User->login(UID, $password, 4);
		($uid == -2) && $this->error('密码不正确');

		$Member = D('Member');
		$data = $Member->create(array('nickname' => $nickname));
		if (!$data) {
			$this->error($Member->getError());
		}

		$res = $Member->where(array('uid' => $uid))->save($data);

		if ($res) {
			$user = session('user_auth');
			$user['username'] = $data['nickname'];
			session('user_auth', $user);
			session('user_auth_sign', data_auth_sign($user));
			$this->success('修改昵称成功！');
		} else {
			$this->error('修改昵称失败！');
		}
	}

	/**
	 * 修改密码初始化
	 * @author huajie <banhuajie@163.com>
	 */
	public function updatePassword() {
		$this->meta_title = '修改密码';
		$this->display();
	}

	/**
	 * 修改密码提交
	 * @author huajie <banhuajie@163.com>
	 */
	public function submitPassword() {
		//获取参数
		$password = I('post.old');
		empty($password) && $this->error('请输入原密码');
		$data['password'] = I('post.password');
		empty($data['password']) && $this->error('请输入新密码');
		$repassword = I('post.repassword');
		empty($repassword) && $this->error('请输入确认密码');

		if ($data['password'] !== $repassword) {
			$this->error('您输入的新密码与确认密码不一致');
		}

		$Api = new UserApi();
		$res = $Api->updateInfo(UID, $password, $data);
		if ($res['status']) {
			$this->success('修改密码成功！');
		} else {
			$this->error($res['info']);
		}
	}

	/**
	 * 获取用户注册错误信息
	 * @param  integer $code 错误编码
	 * @return string        错误信息
	 */
	private function showRegError($code = 0) {
		switch ($code) {
		case -1:$error = '用户名长度必须在16个字符以内！';
			break;
		case -2:$error = '用户名被禁止注册！';
			break;
		case -3:$error = '用户名被占用！';
			break;
		case -4:$error = '密码长度必须在6-30个字符之间！';
			break;
		case -5:$error = '邮箱格式不正确！';
			break;
		case -6:$error = '邮箱长度必须在1-32个字符之间！';
			break;
		case -7:$error = '邮箱被禁止注册！';
			break;
		case -8:$error = '邮箱被占用！';
			break;
		case -9:$error = '手机格式不正确！';
			break;
		case -10:$error = '手机被禁止注册！';
			break;
		case -11:$error = '手机号被占用！';
			break;
		default:$error = '未知错误';
		}
		return $error;
	}

}
