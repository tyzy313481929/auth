-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: auth1
-- ------------------------------------------------------
-- Server version	5.7.15-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `think_auth_group`
--

DROP TABLE IF EXISTS `think_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `think_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `think_auth_group`
--

LOCK TABLES `think_auth_group` WRITE;
/*!40000 ALTER TABLE `think_auth_group` DISABLE KEYS */;
INSERT INTO `think_auth_group` VALUES (1,'管理员',1,'1,2,3,4'),(2,'编辑',1,'1,2,3,4,5,6'),(3,'法务部门',1,'1,15');
/*!40000 ALTER TABLE `think_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `think_auth_group_access`
--

DROP TABLE IF EXISTS `think_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `think_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `think_auth_group_access`
--

LOCK TABLES `think_auth_group_access` WRITE;
/*!40000 ALTER TABLE `think_auth_group_access` DISABLE KEYS */;
INSERT INTO `think_auth_group_access` VALUES (9,1),(10,1),(10,2),(11,3);
/*!40000 ALTER TABLE `think_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `think_auth_rule`
--

DROP TABLE IF EXISTS `think_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `think_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `think_auth_rule`
--

LOCK TABLES `think_auth_rule` WRITE;
/*!40000 ALTER TABLE `think_auth_rule` DISABLE KEYS */;
INSERT INTO `think_auth_rule` VALUES (1,'Admin/Index/index','后台首页',1,1,''),(2,'Admin/Auth/index','权限管理',1,1,''),(3,'Admin/Auth/addCate','添加栏目',1,1,''),(4,'Admin/Auth/addGroup','添加用户组',1,1,''),(5,'Admin/Auth/groupList','用户组列表',1,1,''),(6,'Admin/Auth/addRule','添加权限',1,1,''),(8,'Admin/Auth/userList','用户列表',1,1,''),(9,'Admin/Auth/addUser','添加用户',1,1,''),(10,'Admin/Auth/addCateHandle','添加栏目表单处理',1,1,''),(11,'Admin/Auth/addGroupHandle','添加用户组表单处理',1,1,''),(12,'Admin/Auth/addRuleHandle','添加权限表单处理',1,1,''),(13,'Admin/Auth/setRuleHandle','更新权限表单处理',1,1,''),(14,'Admin/Auth/addUserHandle','添加用户表单处理',1,1,''),(15,'testfawu','测试法务',1,1,'');
/*!40000 ALTER TABLE `think_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `think_cate`
--

DROP TABLE IF EXISTS `think_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `think_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catename` char(20) NOT NULL DEFAULT '',
  `alink` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `think_cate`
--

LOCK TABLES `think_cate` WRITE;
/*!40000 ALTER TABLE `think_cate` DISABLE KEYS */;
INSERT INTO `think_cate` VALUES (1,'添加栏目','Auth/addCate'),(2,'添加用户组','Auth/addGroup'),(3,'用户组列表','Auth/groupList'),(4,'添加权限','Auth/addRule'),(8,'用户列表','Auth/userList'),(7,'添加用户','Auth/addUser'),(10,'fawu','fawu/'),(11,'法务','fawu1');
/*!40000 ALTER TABLE `think_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `think_menu`
--

DROP TABLE IF EXISTS `think_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `think_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `css` varchar(45) DEFAULT NULL COMMENT '菜单所用的css',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `think_menu`
--

LOCK TABLES `think_menu` WRITE;
/*!40000 ALTER TABLE `think_menu` DISABLE KEYS */;
INSERT INTO `think_menu` VALUES (1,'首页',0,1,'Index/index',0,'','',0,'fa fa-home'),(2,'内容',0,2,'Article/mydocument',0,'','',0,'fa fa-edit'),(3,'文档列表',2,0,'article/index',0,'','内容',0,''),(4,'新增',3,0,'article/add',0,'','',0,NULL),(5,'编辑',3,0,'article/edit',0,'','',0,NULL),(6,'改变状态',3,0,'article/setStatus',0,'','',0,NULL),(7,'保存',3,0,'article/update',0,'','',0,NULL),(8,'保存草稿',3,0,'article/autoSave',0,'','',0,NULL),(9,'移动',3,0,'article/move',0,'','',0,NULL),(10,'复制',3,0,'article/copy',0,'','',0,NULL),(11,'粘贴',3,0,'article/paste',0,'','',0,NULL),(12,'导入',3,0,'article/batchOperate',0,'','',0,NULL),(13,'回收站',2,0,'article/recycle',0,'','内容',0,NULL),(14,'还原',13,0,'article/permit',0,'','',0,NULL),(15,'清空',13,0,'article/clear',0,'','',0,NULL),(16,'用户',0,3,'User/index',0,'','',0,'fa fa-desktop'),(17,'用户信息',16,0,'User/index',0,'','用户管理',0,NULL),(18,'新增用户',17,0,'User/add',0,'添加新用户','',0,NULL),(19,'用户行为',16,0,'User/action',0,'','行为管理',0,NULL),(20,'新增用户行为',19,0,'User/addaction',0,'','',0,NULL),(21,'编辑用户行为',19,0,'User/editaction',0,'','',0,NULL),(22,'保存用户行为',19,0,'User/saveAction',0,'\"用户->用户行为\"保存编辑和新增的用户行为','',0,NULL),(23,'变更行为状态',19,0,'User/setStatus',0,'\"用户->用户行为\"中的启用,禁用和删除权限','',0,NULL),(24,'禁用会员',19,0,'User/changeStatus?method=forbidUser',0,'\"用户->用户信息\"中的禁用','',0,NULL),(25,'启用会员',19,0,'User/changeStatus?method=resumeUser',0,'\"用户->用户信息\"中的启用','',0,NULL),(26,'删除会员',19,0,'User/changeStatus?method=deleteUser',0,'\"用户->用户信息\"中的删除','',0,NULL),(27,'权限管理',16,0,'AuthManager/index',0,'','用户管理',0,NULL),(28,'删除',27,0,'AuthManager/changeStatus?method=deleteGroup',0,'删除用户组','',0,NULL),(29,'禁用',27,0,'AuthManager/changeStatus?method=forbidGroup',0,'禁用用户组','',0,NULL),(30,'恢复',27,0,'AuthManager/changeStatus?method=resumeGroup',0,'恢复已禁用的用户组','',0,NULL),(31,'新增',27,0,'AuthManager/createGroup',0,'创建新的用户组','',0,NULL),(32,'编辑',27,0,'AuthManager/editGroup',0,'编辑用户组名称和描述','',0,NULL),(33,'保存用户组',27,0,'AuthManager/writeGroup',0,'新增和编辑用户组的\"保存\"按钮','',0,NULL),(34,'授权',27,0,'AuthManager/group',0,'\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组','',0,NULL),(35,'访问授权',27,0,'AuthManager/access',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮','',0,NULL),(36,'成员授权',27,0,'AuthManager/user',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮','',0,NULL),(37,'解除授权',27,0,'AuthManager/removeFromGroup',0,'\"成员授权\"列表页内的解除授权操作按钮','',0,NULL),(38,'保存成员授权',27,0,'AuthManager/addToGroup',0,'\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)','',0,NULL),(39,'分类授权',27,0,'AuthManager/category',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮','',0,NULL),(40,'保存分类授权',27,0,'AuthManager/addToCategory',0,'\"分类授权\"页面的\"保存\"按钮','',0,NULL),(41,'模型授权',27,0,'AuthManager/modelauth',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮','',0,NULL),(42,'保存模型授权',27,0,'AuthManager/addToModel',0,'\"分类授权\"页面的\"保存\"按钮','',0,NULL),(43,'扩展',0,7,'Addons/index',0,'','',0,'fa fa-table'),(44,'插件管理',43,1,'Addons/index',0,'','扩展',0,NULL),(45,'创建',44,0,'Addons/create',0,'服务器上创建插件结构向导','',0,NULL),(46,'检测创建',44,0,'Addons/checkForm',0,'检测插件是否可以创建','',0,NULL),(47,'预览',44,0,'Addons/preview',0,'预览插件定义类文件','',0,NULL),(48,'快速生成插件',44,0,'Addons/build',0,'开始生成插件结构','',0,NULL),(49,'设置',44,0,'Addons/config',0,'设置插件配置','',0,NULL),(50,'禁用',44,0,'Addons/disable',0,'禁用插件','',0,NULL),(51,'启用',44,0,'Addons/enable',0,'启用插件','',0,NULL),(52,'安装',44,0,'Addons/install',0,'安装插件','',0,NULL),(53,'卸载',44,0,'Addons/uninstall',0,'卸载插件','',0,NULL),(54,'更新配置',44,0,'Addons/saveconfig',0,'更新插件配置处理','',0,NULL),(55,'插件后台列表',44,0,'Addons/adminList',0,'','',0,NULL),(56,'URL方式访问插件',44,0,'Addons/execute',0,'控制是否有权限通过url访问插件控制器方法','',0,NULL),(57,'钩子管理',43,2,'Addons/hooks',0,'','扩展',0,NULL),(58,'模型管理',68,3,'Model/index',0,'','系统设置',0,NULL),(59,'新增',58,0,'model/add',0,'','',0,NULL),(60,'编辑',58,0,'model/edit',0,'','',0,NULL),(61,'改变状态',58,0,'model/setStatus',0,'','',0,NULL),(62,'保存数据',58,0,'model/update',0,'','',0,NULL),(63,'属性管理',68,0,'Attribute/index',0,'网站属性配置。','',0,NULL),(64,'新增',63,0,'Attribute/add',0,'','',0,NULL),(65,'编辑',63,0,'Attribute/edit',0,'','',0,NULL),(66,'改变状态',63,0,'Attribute/setStatus',0,'','',0,NULL),(67,'保存数据',63,0,'Attribute/update',0,'','',0,NULL),(68,'系统',0,4,'Config/group',0,'','',0,'fa fa-clone'),(69,'网站设置',68,1,'Config/group',0,'','系统设置',0,NULL),(70,'配置管理',68,4,'Config/index',0,'','系统设置',0,NULL),(71,'编辑',70,0,'Config/edit',0,'新增编辑和保存配置','',0,NULL),(72,'删除',70,0,'Config/del',0,'删除配置','',0,NULL),(73,'新增',70,0,'Config/add',0,'新增配置','',0,NULL),(74,'保存',70,0,'Config/save',0,'保存配置','',0,NULL),(75,'菜单管理',68,5,'Menu/index',0,'','系统设置',0,NULL),(76,'导航管理',68,6,'Channel/index',0,'','系统设置',0,NULL),(77,'新增',76,0,'Channel/add',0,'','',0,NULL),(78,'编辑',76,0,'Channel/edit',0,'','',0,NULL),(79,'删除',76,0,'Channel/del',0,'','',0,NULL),(80,'分类管理',68,2,'Category/index',0,'','系统设置',0,NULL),(81,'编辑',80,0,'Category/edit',0,'编辑和保存栏目分类','',0,NULL),(82,'新增',80,0,'Category/add',0,'新增栏目分类','',0,NULL),(83,'删除',80,0,'Category/remove',0,'删除栏目分类','',0,NULL),(84,'移动',80,0,'Category/operate/type/move',0,'移动栏目分类','',0,NULL),(85,'合并',80,0,'Category/operate/type/merge',0,'合并栏目分类','',0,NULL),(86,'备份数据库',68,0,'Database/index?type=export',0,'','数据备份',0,NULL),(87,'备份',86,0,'Database/export',0,'备份数据库','',0,NULL),(88,'优化表',86,0,'Database/optimize',0,'优化数据表','',0,NULL),(89,'修复表',86,0,'Database/repair',0,'修复数据表','',0,NULL),(90,'还原数据库',68,0,'Database/index?type=import',0,'','数据备份',0,NULL),(91,'恢复',90,0,'Database/import',0,'数据库恢复','',0,NULL),(92,'删除',90,0,'Database/del',0,'删除备份文件','',0,NULL),(93,'其他',0,5,'other',0,'','',0,'fa fa-bug'),(96,'新增',75,0,'Menu/add',0,'','系统设置',0,NULL),(98,'编辑',75,0,'Menu/edit',0,'','',0,NULL),(104,'下载管理',102,0,'Think/lists?model=download',0,'','',0,NULL),(105,'配置管理',102,0,'Think/lists?model=config',0,'','',0,NULL),(106,'行为日志',16,0,'Action/actionlog',0,'','行为管理',0,NULL),(108,'修改密码',16,0,'User/updatePassword',0,'','',0,NULL),(109,'修改昵称',16,0,'User/updateNickname',0,'','',0,NULL),(110,'查看行为日志',106,0,'action/edit',0,'','',0,NULL),(112,'新增数据',58,0,'think/add',0,'','',0,NULL),(113,'编辑数据',58,0,'think/edit',0,'','',0,NULL),(114,'导入',75,0,'Menu/import',0,'','',0,NULL),(115,'生成',58,0,'Model/generate',0,'','',0,NULL),(116,'新增钩子',57,0,'Addons/addHook',0,'','',0,NULL),(117,'编辑钩子',57,0,'Addons/edithook',0,'','',0,NULL),(118,'文档排序',3,0,'Article/sort',0,'','',0,NULL),(119,'排序',70,0,'Config/sort',0,'','',0,NULL),(120,'排序',75,0,'Menu/sort',0,'','',0,NULL),(121,'排序',76,0,'Channel/sort',0,'','',0,NULL);
/*!40000 ALTER TABLE `think_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `think_user`
--

DROP TABLE IF EXISTS `think_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `think_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `think_user`
--

LOCK TABLES `think_user` WRITE;
/*!40000 ALTER TABLE `think_user` DISABLE KEYS */;
INSERT INTO `think_user` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3'),(10,'test1','5a105e8b9d40e1329780d62ea2265d8a'),(9,'test','098f6bcd4621d373cade4e832627b4f6'),(11,'fawu1','e5cc0b15494754f94c581aa249d8f46d');
/*!40000 ALTER TABLE `think_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-21 11:50:59
