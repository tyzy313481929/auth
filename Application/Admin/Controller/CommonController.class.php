<?php

namespace Admin\Controller;

use Think\Controller;

class CommonController extends Controller
{
    protected $model;
    protected $primaryKey;
    public function _initialize()
    {
        if (!isset($_SESSION['uid'])) {
            redirect(U('Login/index'));
        }
        $name = MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
        if (!authcheck($name, $_SESSION['uid'])) {
            $this->error('you have no auth');
        }
        $this->assign('menus', $this->getMenus());
    }

    final public function getMenus()
    {
        $menulist = [];
        $where = [
            'pid' => 0,
            'hide' => 0,
        ];
        $father = M('Menu')->where($where)->order('sort asc')->select();
        $where['pid'] = array('gt', 0);
        $child = M('Menu')->where($where)->order('sort asc')->select();
        foreach ($father as $key => $item) {
            $menulist[$item['id']]['father'] = $item;
            foreach ($child as $cey => $citem) {
                if ($item['id'] == $citem['pid']) {
                    $menulist[$item['id']]['child'][] = $citem;
                }
            }
        }

        return $menulist;
    }


		/**
		 * 返回后台节点数据
		 * @param boolean $tree    是否返回多维数组结构(生成菜单时用到),为false返回一维数组(生成权限节点时用到)
		 * @retrun array
		 *
		 * 注意,返回的主菜单节点数组中有'controller'元素,以供区分子节点和主节点
		 *
		 * @author 朱亚杰 <xcoolcc@gmail.com>
		 */
		final protected function returnNodes($tree = true){
				static $tree_nodes = array();
				if ( $tree && !empty($tree_nodes[(int)$tree]) ) {
						return $tree_nodes[$tree];
				}
				if((int)$tree){
						$list = M('Menu')->field('id,pid,title,url,tip,hide')->order('sort asc')->select();
						foreach ($list as $key => $value) {
								if( stripos($value['url'],MODULE_NAME)!==0 ){
										$list[$key]['url'] = MODULE_NAME.'/'.$value['url'];
								}
						}
						$nodes = list_to_tree($list,$pk='id',$pid='pid',$child='operator',$root=0);
						foreach ($nodes as $key => $value) {
								if(!empty($value['operator'])){
										$nodes[$key]['child'] = $value['operator'];
										unset($nodes[$key]['operator']);
								}
						}
				}else{
						$nodes = M('Menu')->field('title,url,tip,pid')->order('sort asc')->select();
						foreach ($nodes as $key => $value) {
								if( stripos($value['url'],MODULE_NAME)!==0 ){
										$nodes[$key]['url'] = MODULE_NAME.'/'.$value['url'];
								}
						}
				}
				$tree_nodes[(int)$tree]   = $nodes;
				return $nodes;
		}

	  /**
		*
		*/
    public function add()
    {
        if (I('post.')) {
            $result = $this->model->savedata(I('post.'));
            if ('success' == $result['status']) {
                $this->success('保存成功，正在跳转', U('index'));
            } else {
                $this->error($result['data']);
            }
        } else {
            $this->display();
        }
    }

    public function edit()
    {
        if (I('post.')) {
            $result = $this->model->savedata(I('post.'));
            if ('success' == $result['status']) {
                $this->success('保存成功，正在跳转', U('index'));
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

    public function delete($id = '')
    {
        if (IS_GET) {
            $uid = $this->model->where(array(
                'id' => intval($id),
            ))->setField('status', 0);
            if (false != $uid) {
                //注册成功
                $this->success('删除成功！', U('index'));
            } else {
                //注册失败，显示错误信息
                $this->error($this->showRegError($uid));
            }
        } else {
            $this->error('信息缺失，请重试');
        }
    }
}
