<?php

namespace Admin\Model;
use Think\Model;

/**
 * 行为模型
 * @author huajie <banhuajie@163.com>
 */

class AuthGroupModel extends CommonModel {


    public function validate($data){
        if(empty($data['title'])){
            return array('status' => 'fail' , 'data' => '用户组名称不能为空' );
        }else{
            $where['title'] = $data['title'];
            $data[$this->pk] && $where['id'] = array('neq',$data[$this->pk]);
            if($this->where($where)->find()){
                return array('status' => 'fail' , 'data' => '用户组名称重复　' );
            }
        }
        return array('status' => 'success' , 'data' => 'greate' );
    }

}
