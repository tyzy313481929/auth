<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 行为模型
 * @author huajie <banhuajie@163.com>
 */

class UserModel extends CommonModel {

    public function validate($data){
        if(empty($data['username'])){
            return array('status' => 'fail' , 'data' => 'the username is empty' );
        }else{
            $where['username'] = $data['username'];
            $data[$this->pk] && $where['id'] = array('neq',$data[$this->pk]);
            if($this->where($where)->find()){
                return array('status' => 'fail' , 'data' => 'the username is repeat' );
            }
        }
        return array('status' => 'success' , 'data' => 'greate' );
    }


    /**
    *获取用户列表
    */
    public function getUserList(){
         return $this->where(array('status' => 1))->select();
    }

}
