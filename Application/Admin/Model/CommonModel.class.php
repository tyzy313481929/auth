<?php
namespace Admin\Model;
use Think\Model;

class CommonModel extends Model{


    public function validate($data){
        return array('status' => 'success' , 'data' => 'some thing' );
    }
    public function savedata($data){
        $result = $this->validate($data);
        if($result['status'] == 'success')
        {
            if(isset($data[$this->pk]) && $this -> where(array($this->pk => $data[$this->pk]))->find())
            {

                if($this-> where(array($this->pk => $data[$this->pk])) -> save($data) === false)
                {   
                    $result = array('status' => 'fail', 'data' => '更新失败');
                }
                else
                {   
                    $result = array('status' => 'success', 'data' => '保存成功');
                }
            }
            else
            {

                if($lastinsertid = $this->add($data))
                {   
                    $result = array('status' => 'success', 'data' => '添加成功', 'id' => $lastinsertid);
                }
                else
                {   
                    $result = array('status' => 'fail', 'data' => '添加失败');
                }
            }
        }
        return $result;
    }

}