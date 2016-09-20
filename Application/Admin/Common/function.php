<?php
/**
 * 函数库
 */


        /**
      * 检查权限
      * @param name string|array  需要验证的规则列表,支持逗号分隔的权限规则或索引数组
      * @param uid  int           认证用户的id
      * @param string mode        执行check的模式
      * @param relation string    如果为 'or' 表示满足任一条规则即通过验证;如果为 'and'则表示需满足所有规则才能通过验证
      * @return boolean           通过验证返回true;失败返回false
     */
        function authcheck($name, $uid, $type=1, $mode='url', $relation='or'){
                if(!in_array($uid,C('ADMINISTRATOR'))){
                $auth=new \Think\Auth();
                return $auth->check($name, $uid, $type, $mode, $relation)?true:false;
            }else{
                return true;
            }
        }

?>
