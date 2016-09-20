<?php
return array(
        //数据库配置 采用PDO方式
        'DB_TYPE'=>'mysqli',
        'DB_USER'=>'root',
        'DB_PWD'=>'123456',
        'DB_PREFIX'=>'think_',
        'DB_DSN'=>'mysql:host=localhost;dbname=auth1;charset=utf8',

        //权限验证设置
        'AUTH_CONFIG'=>array(
        'AUTH_ON' => true, //认证开关
        'AUTH_TYPE' => 1, // 认证方式，1为时时认证；2为登录认证。
        'AUTH_GROUP' => 'think_auth_group', //用户组数据表名
        'AUTH_GROUP_ACCESS' => 'think_auth_group_access', //用户组明细表
        'AUTH_RULE' => 'think_auth_rule', //权限规则表
        'AUTH_USER' => 'think_user'//用户信息表
    ),
    //超级管理员id,拥有全部权限,只要用户uid在这个角色组里的,就跳出认证.可以设置多个值,如array('1','2','3')
    'ADMINISTRATOR'=>array('1'),
    'LAYOUT_ON'    => true
);
