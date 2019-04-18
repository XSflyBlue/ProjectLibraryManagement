/*
Navicat MySQL Data Transfer

Source Server         : localMysql
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : db_plm

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-06-03 22:03:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for help_info
-- ----------------------------
DROP TABLE IF EXISTS `help_info`;
CREATE TABLE `help_info` (
  `H_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '帮助ID',
  `H_TITLE` varchar(20) DEFAULT NULL COMMENT '帮助主题',
  `H_TYPE` varchar(10) DEFAULT NULL COMMENT '帮助类型',
  `H_CONTENT` varchar(255) DEFAULT NULL COMMENT '帮助内容',
  PRIMARY KEY (`H_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of help_info
-- ----------------------------
INSERT INTO `help_info` VALUES ('2', '帮助2', '哈哈哈', '使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用使用');
INSERT INTO `help_info` VALUES ('3', '帮助3', '呵呵额', '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容');
INSERT INTO `help_info` VALUES ('4', '帮助4', '呵呵额', '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容');
INSERT INTO `help_info` VALUES ('5', '帮助5', '呵呵额', '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容');
INSERT INTO `help_info` VALUES ('6', '帮助6', '呵呵额', '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容');
INSERT INTO `help_info` VALUES ('7', '帮助7', '呵呵额', '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容');
INSERT INTO `help_info` VALUES ('8', '帮助8', '呵呵额', '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容');
INSERT INTO `help_info` VALUES ('9', '帮助9', '呵呵额', '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容');
INSERT INTO `help_info` VALUES ('10', '帮助10', '呵呵额', '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容');
INSERT INTO `help_info` VALUES ('11', '帮助11', '呵呵额', '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容');
INSERT INTO `help_info` VALUES ('12', '帮助12', '呵呵额', '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容');
INSERT INTO `help_info` VALUES ('13', '帮助1', '个人中心', '系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图系统提供不同类型的个人中心视图');

-- ----------------------------
-- Table structure for links_info
-- ----------------------------
DROP TABLE IF EXISTS `links_info`;
CREATE TABLE `links_info` (
  `LI_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '站点ID',
  `LI_NAME` varchar(30) DEFAULT NULL COMMENT '站点名称',
  `LI_URL` varchar(50) DEFAULT NULL COMMENT '站点地址',
  PRIMARY KEY (`LI_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of links_info
-- ----------------------------
INSERT INTO `links_info` VALUES ('1', '重庆邮电大学', 'http://www.cqupt.edu.cn');
INSERT INTO `links_info` VALUES ('2', '教务在线', 'http://jwzx.cqupt.edu.cn');
INSERT INTO `links_info` VALUES ('3', '信息门户', 'http://isportal.cqupt.edu.cn');
INSERT INTO `links_info` VALUES ('4', '信息公开', 'http://xxgk.cqupt.edu.cn');
INSERT INTO `links_info` VALUES ('5', '研究生在线', 'http://gs.cqupt.edu.cn');
INSERT INTO `links_info` VALUES ('6', '图书馆', 'http://tsg.cqupt.edu.cn/ShangYeYd_Library');
INSERT INTO `links_info` VALUES ('7', '学术期刊', 'http://journal.cqupt.edu.cn/jcuptnse/index.aspx');
INSERT INTO `links_info` VALUES ('8', '红岩网校', 'http://hongyan.cqupt.edu.cn');
INSERT INTO `links_info` VALUES ('9', '后勤服务', 'http://cyhq.cqupt.edu.cn');
INSERT INTO `links_info` VALUES ('10', '邮件系统', 'https://mail.cqupt.edu.cn');
INSERT INTO `links_info` VALUES ('11', '校友联谊会', 'http://xylyh.cqupt.edu.cn');

-- ----------------------------
-- Table structure for message_info
-- ----------------------------
DROP TABLE IF EXISTS `message_info`;
CREATE TABLE `message_info` (
  `M_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '站内信ID',
  `M_TITLE` varchar(20) DEFAULT NULL COMMENT '站内信标题',
  `M_CONTENT` varchar(150) DEFAULT NULL COMMENT '站内信内容',
  `SEND_TIME` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`M_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_info
-- ----------------------------

-- ----------------------------
-- Table structure for opinion_info
-- ----------------------------
DROP TABLE IF EXISTS `opinion_info`;
CREATE TABLE `opinion_info` (
  `O_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目过程审核记录ID',
  `PPI_ID` int(11) DEFAULT NULL COMMENT '项目过程信息_ID',
  `O_U_TYPE` int(11) DEFAULT NULL COMMENT '验收人员类型',
  `O_CONTENT` varchar(255) DEFAULT NULL COMMENT '项目审核意见',
  `O_TIME` date DEFAULT NULL COMMENT '项目审核时间',
  `O_STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`O_ID`),
  KEY `FK_process_check` (`PPI_ID`),
  CONSTRAINT `FK_process_check` FOREIGN KEY (`PPI_ID`) REFERENCES `project_process_info` (`PPI_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of opinion_info
-- ----------------------------
INSERT INTO `opinion_info` VALUES ('1', '2', '0', '2333333333333333333333333333333333333333333333333', '2018-05-31', '0');
INSERT INTO `opinion_info` VALUES ('11', '1', '0', '66666666666666666666666666666666666666666666666666666666666666', '2018-05-31', '0');
INSERT INTO `opinion_info` VALUES ('15', '18', '0', '4566666666666666666666666666666666666666666666666666666666666', '2018-05-31', '0');
INSERT INTO `opinion_info` VALUES ('16', '1', '2', '23333333333333333333333333333333333333333333333333333333', '2018-05-31', '0');
INSERT INTO `opinion_info` VALUES ('18', '16', '0', 'ERGHDSF HDGHFGHJGJGHFJFGHJGH', '2018-05-31', '0');
INSERT INTO `opinion_info` VALUES ('20', '16', '2', '的幸福感和法国红酒盖饭就分工和', '2018-05-31', '0');
INSERT INTO `opinion_info` VALUES ('22', '20', '2', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈或或或或或', '2018-05-31', '0');

-- ----------------------------
-- Table structure for post_info
-- ----------------------------
DROP TABLE IF EXISTS `post_info`;
CREATE TABLE `post_info` (
  `PI_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `U_ID` int(11) DEFAULT NULL COMMENT '用户ID',
  `PI_TITLE` varchar(30) DEFAULT NULL COMMENT '公告标题',
  `PI_CONTENT` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `HAS_ACCESSORY` int(11) DEFAULT NULL COMMENT '有无附件',
  `POST_TIME` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  `POST_EDIT_TIME` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`PI_ID`),
  KEY `FK_post_user` (`U_ID`),
  CONSTRAINT `FK_post_user` FOREIGN KEY (`U_ID`) REFERENCES `user_info` (`U_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_info
-- ----------------------------
INSERT INTO `post_info` VALUES ('1', '5', '第一个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('2', '5', '第2个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('3', '5', '第3个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('4', '5', '第4个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('5', '5', '第5个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('6', '5', '第6个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('7', '5', '第7个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('8', '5', '第8个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('9', '5', '第9个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('10', '5', '第10个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('11', '5', '第11个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('12', '5', '第12个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('13', '5', '第13个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('14', '5', '第14个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('15', '5', '第15个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('16', '5', '第16个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('17', '5', '第17个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('18', '5', '第18个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('19', '5', '第19个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');
INSERT INTO `post_info` VALUES ('20', '5', '第20个公告', '啦啦啦啦啦啦啦啦啦啦啦啦啦', '0', '2018-05-06 20:55:34', '2018-05-06 20:55:43');

-- ----------------------------
-- Table structure for project_base
-- ----------------------------
DROP TABLE IF EXISTS `project_base`;
CREATE TABLE `project_base` (
  `PB_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `PP_ID` int(11) DEFAULT NULL COMMENT '项目安排ID',
  `PB_CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `PB_EDIT_TIME` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `PB_NAME` varchar(30) DEFAULT NULL COMMENT '项目名称',
  `PB_LEVEL` int(11) DEFAULT NULL COMMENT '项目级别',
  `PB_TYPE` int(11) DEFAULT NULL COMMENT '项目类型',
  `SUBJECT_TYPE` int(11) DEFAULT NULL COMMENT '项目学科类别',
  `PSI_BRIEF` varchar(500) DEFAULT NULL COMMENT '项目简介',
  `PSI_REASON` varchar(1000) DEFAULT NULL COMMENT '申请理由',
  `PSI_CONTENT` varchar(2000) DEFAULT NULL COMMENT '项目方案',
  `PSI_FEATURE` varchar(1000) DEFAULT NULL COMMENT '项目特色与创新点',
  `PSI_PLAN` varchar(1000) DEFAULT NULL COMMENT '项目进度安排',
  `PSI_RESULT` varchar(1000) DEFAULT NULL COMMENT '项目完成预期成果',
  `F_CONTENT` varchar(2000) DEFAULT NULL COMMENT '预算内容',
  `F_OPINION` varchar(255) DEFAULT NULL COMMENT '预算审核意见',
  `F_OPINION_TIME` date DEFAULT NULL COMMENT '预算审核时间',
  `PB_STATUS` int(11) DEFAULT NULL COMMENT '项目状态',
  `PSI_O_STATUS` int(11) DEFAULT NULL COMMENT '项目立项审核状态',
  `PMI_TIME` date DEFAULT NULL COMMENT '项目中期时间',
  `PMI_O_STATUS` int(11) DEFAULT NULL COMMENT '项目中期审核状态',
  `PEI_TIME` date DEFAULT NULL COMMENT '项目验收时间',
  `PEI_O_STATUS` int(11) DEFAULT NULL COMMENT '项目验收审核状态',
  `POI_TIME` date DEFAULT NULL COMMENT '项目其他情况申请时间',
  `POI_O_STATUS` int(11) DEFAULT NULL COMMENT '项目其他情况审核状态',
  `F_STATUS` int(11) DEFAULT NULL COMMENT '项目经费状态',
  `WS_STATUS` int(11) DEFAULT NULL COMMENT '项目日志状态',
  PRIMARY KEY (`PB_ID`),
  UNIQUE KEY `onlyproject` (`PB_NAME`,`PB_LEVEL`,`PB_TYPE`,`SUBJECT_TYPE`) USING BTREE,
  KEY `FK_plan_project` (`PP_ID`),
  CONSTRAINT `FK_plan_project` FOREIGN KEY (`PP_ID`) REFERENCES `project_plan` (`PP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_base
-- ----------------------------
INSERT INTO `project_base` VALUES ('1', '1', '2018-05-01 15:44:07', '2018-05-14 15:44:12', '第一个项目', '0', '0', '0', '这是第一个项目', '这是申请理由', '这是项目方案', '这是项目特色', '这是项目进度安排', '这是项目预期', '这是预算内容', '', '0002-11-30', '5', '17', '2018-05-31', '27', '2018-05-31', '37', '2018-05-31', '43', '1', '1');
INSERT INTO `project_base` VALUES ('2', '2', '2018-05-01 11:35:08', '2018-05-09 11:35:16', '第二个项目', '1', '1', '1', '这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目这是第二个项目', '这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由这是申请理由', '这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案', '这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案这是项目方案', '这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排这是项目进度安排', '这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期这是项目预期', '这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条预算这是一条', '这是预算审核信息', '2018-05-30', '1', '13', null, '21', null, '31', null, '41', '2', '2');
INSERT INTO `project_base` VALUES ('9', '2', '2018-05-29 16:07:15', '2018-05-29 00:00:00', '第三个项目', '1', '0', '1', '这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介', '这是一个申请理由这是一个申请理由这是一个申请理由这是一个申请理由这是一个申请理由这是一个申请理由这是一个申请理由这是一个申请理由这是一个申请理由这是一个申请理由这是一个申请理由这是一个申请理由这是一个申请理由这是一个申请理由这是一个申请理由这是一个申请理由这是', '这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案这是一个方案', '这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色这是特色', '这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排这是项目安排', '这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期这是预期', null, null, null, '1', '11', null, null, null, null, null, null, '0', '2');
INSERT INTO `project_base` VALUES ('10', '4', '2018-06-03 18:18:19', '2018-06-03 18:18:19', '第四个项目', '0', '0', '0', '第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介第四个项目简介', '第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由第四个项目申请理由', '第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案第四个项目方案', '第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色第四个项目特色', '第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度第四个项目进度', '第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期第四个项目预期', null, null, null, '1', '10', null, null, null, null, null, null, '0', '2');

-- ----------------------------
-- Table structure for project_plan
-- ----------------------------
DROP TABLE IF EXISTS `project_plan`;
CREATE TABLE `project_plan` (
  `PP_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目安排表ID',
  `PP_NAME` varchar(20) DEFAULT NULL COMMENT '项目计划名字',
  `PP_YEAR` varchar(5) DEFAULT NULL COMMENT '年度',
  `PP_START_TIME` date DEFAULT NULL COMMENT '立项时间',
  `PP_MID_TIME` date DEFAULT NULL COMMENT '中期时间',
  `PP_END_TIME` date DEFAULT NULL COMMENT '验收时间',
  `STU_NUM` int(11) DEFAULT NULL COMMENT '学生人数限制',
  `ACCEPT_TIME` date DEFAULT NULL COMMENT '学生入学时间限制',
  `TU_STU_NUM` int(11) DEFAULT NULL COMMENT '导师指导人数限制',
  PRIMARY KEY (`PP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_plan
-- ----------------------------
INSERT INTO `project_plan` VALUES ('1', '第一个计划', '2018', '2018-05-01', '2018-06-08', '2018-06-30', '3', '2014-09-01', '3');
INSERT INTO `project_plan` VALUES ('2', '第二个计划', '2018', '2018-05-01', '2018-06-14', '2018-08-01', '4', '2014-09-01', '5');
INSERT INTO `project_plan` VALUES ('3', '第三个计划', '2019', '2019-01-01', '2019-03-01', '2019-06-01', '3', '2015-09-01', '6');
INSERT INTO `project_plan` VALUES ('4', '第四个计划', '2018', '2018-05-24', '2018-05-26', '2018-05-31', '3', '2015-09-01', '3');
INSERT INTO `project_plan` VALUES ('5', '第五个计划', '2018', '2018-05-27', '2018-05-30', '2018-05-31', '4', '2015-09-01', '8');

-- ----------------------------
-- Table structure for project_process_info
-- ----------------------------
DROP TABLE IF EXISTS `project_process_info`;
CREATE TABLE `project_process_info` (
  `PPI_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目过程信息_ID',
  `PB_ID` int(11) DEFAULT NULL COMMENT '项目ID',
  `PPI_CREATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `PPI_EDIT_TIME` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `PPI_TYPE` int(11) DEFAULT NULL COMMENT '项目过程类型',
  `PMI_CONTENT` varchar(2000) DEFAULT NULL COMMENT '项目执行情况',
  `PMI_ISSUE` varchar(1000) DEFAULT NULL COMMENT '问题及解决方法',
  `PEI_LEVEL` int(11) DEFAULT NULL COMMENT '验收等级',
  `PEI_MISSION` varchar(1000) DEFAULT NULL COMMENT '成员分工任务',
  `PEI_OPOINION` varchar(500) DEFAULT NULL COMMENT '体会、问题或建议',
  `POI_TYPE` int(11) DEFAULT NULL COMMENT '申请类型',
  `POI_CONTENT` varchar(2000) DEFAULT NULL COMMENT '申请原因',
  PRIMARY KEY (`PPI_ID`),
  KEY `FK_project_processinfo` (`PB_ID`),
  CONSTRAINT `FK_project_processinfo` FOREIGN KEY (`PB_ID`) REFERENCES `project_base` (`PB_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_process_info
-- ----------------------------
INSERT INTO `project_process_info` VALUES ('1', '1', '2018-05-01 15:55:02', '2018-05-01 15:55:07', '1', '', null, null, null, null, null, null);
INSERT INTO `project_process_info` VALUES ('2', '2', '2018-05-01 11:47:40', '2018-05-09 11:47:44', '1', null, null, null, null, null, null, null);
INSERT INTO `project_process_info` VALUES ('13', '9', '2018-05-29 16:07:15', '2018-05-29 16:07:15', '1', null, null, null, null, null, null, null);
INSERT INTO `project_process_info` VALUES ('16', '1', '2018-05-29 17:54:37', '2018-05-29 17:54:37', '2', '项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况项目执行情况', '问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法问题及解决方法', null, null, null, null, null);
INSERT INTO `project_process_info` VALUES ('18', '1', '2018-05-29 22:25:45', '2018-05-29 00:00:00', '4', null, null, null, null, null, '1', '2333333333333333333333333333333333333333333333333333333333333333333333');
INSERT INTO `project_process_info` VALUES ('20', '1', '2018-05-29 22:30:12', '2018-05-29 22:30:12', '3', '执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况执行情况', null, '-1', '分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务分工任务', '体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议体会、问题或建议', null, null);
INSERT INTO `project_process_info` VALUES ('21', '10', '2018-06-03 18:18:19', '2018-06-03 18:18:19', '1', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for project_user
-- ----------------------------
DROP TABLE IF EXISTS `project_user`;
CREATE TABLE `project_user` (
  `PU_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目人员关联表id',
  `U_ID` int(11) DEFAULT NULL COMMENT '用户ID',
  `PB_ID` int(11) DEFAULT NULL COMMENT '项目ID',
  `U_TYPE` int(11) DEFAULT NULL COMMENT '用户类型',
  PRIMARY KEY (`PU_ID`),
  UNIQUE KEY `onlyprojectuser` (`U_ID`,`PB_ID`,`U_TYPE`) USING BTREE,
  KEY `FK_table_project` (`PB_ID`),
  CONSTRAINT `FK_table_project` FOREIGN KEY (`PB_ID`) REFERENCES `project_base` (`PB_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_table_user` FOREIGN KEY (`U_ID`) REFERENCES `user_info` (`U_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_user
-- ----------------------------
INSERT INTO `project_user` VALUES ('1', '2', '1', '0');
INSERT INTO `project_user` VALUES ('5', '2', '2', '1');
INSERT INTO `project_user` VALUES ('26', '2', '9', '0');
INSERT INTO `project_user` VALUES ('2', '3', '1', '1');
INSERT INTO `project_user` VALUES ('6', '3', '2', '0');
INSERT INTO `project_user` VALUES ('3', '4', '1', '2');
INSERT INTO `project_user` VALUES ('7', '4', '2', '2');
INSERT INTO `project_user` VALUES ('28', '4', '9', '2');
INSERT INTO `project_user` VALUES ('4', '6', '1', '1');
INSERT INTO `project_user` VALUES ('8', '6', '2', '1');
INSERT INTO `project_user` VALUES ('15', '16', '1', '1');
INSERT INTO `project_user` VALUES ('27', '16', '9', '1');
INSERT INTO `project_user` VALUES ('32', '17', '9', '3');
INSERT INTO `project_user` VALUES ('33', '18', '10', '0');

-- ----------------------------
-- Table structure for site_file_info
-- ----------------------------
DROP TABLE IF EXISTS `site_file_info`;
CREATE TABLE `site_file_info` (
  `SF_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '站点文件ID',
  `SF_TYPE` int(11) DEFAULT NULL COMMENT '站点文件类型',
  `SF_FROM` int(11) DEFAULT NULL COMMENT '文件归属',
  `RELATED_ID` int(11) DEFAULT NULL COMMENT '关联id',
  `SF_NAME` varchar(200) DEFAULT NULL COMMENT '站点文件名',
  `SF_SIZE` int(11) DEFAULT NULL COMMENT '站点文件大小',
  `SF_PATH` varchar(200) DEFAULT NULL COMMENT '站点文件路径',
  `SF_BRIEF` varchar(100) DEFAULT NULL COMMENT '站点文件简介',
  `UP_TIME` date DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`SF_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of site_file_info
-- ----------------------------
INSERT INTO `site_file_info` VALUES ('3', '0', '0', '0', '576e28cd-089b-4e11-baf1-74ed54ee162a_信息对抗 专业的认识及学习规划.docx', '19', 'D:\\WorkSpace\\eclipse workspace\\JAEE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\ProjectLibraryManagement\\WEB-INF\\upload\\9\\10', 'test', '2018-06-03');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `U_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `U_NAME` varchar(20) DEFAULT NULL COMMENT '用户名',
  `U_REALNAME` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `Email` varchar(40) DEFAULT NULL COMMENT '邮箱',
  `U_PASSWORD` varchar(35) DEFAULT NULL COMMENT '密码',
  `GENDER` int(11) DEFAULT NULL COMMENT '性别',
  `COLLEGE` varchar(20) DEFAULT NULL COMMENT '学院',
  `MAJOR` varchar(20) DEFAULT NULL COMMENT '专业',
  `TEL` varchar(15) DEFAULT NULL COMMENT '联系方式',
  `ADMISSION_DATE` date DEFAULT NULL COMMENT '入校时间（学生）',
  `JOB_TITLE` varchar(5) DEFAULT NULL COMMENT '职称（老师）',
  `ROLE` int(11) DEFAULT NULL COMMENT '用户角色',
  `STATUS` int(11) DEFAULT NULL COMMENT '用户状态',
  `U_CODE` varchar(20) DEFAULT NULL COMMENT '用户具体编号（学号/工号）',
  `VALIDATA_CODE` varchar(36) DEFAULT NULL COMMENT '重置信息码',
  `OUT_DATE` bigint(20) DEFAULT NULL COMMENT '信息码过期时间',
  PRIMARY KEY (`U_ID`),
  UNIQUE KEY `onlyuser` (`U_ID`,`U_NAME`,`Email`,`U_CODE`) USING BTREE COMMENT '确定用户唯一'
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('2', 'student1', '小米', 'xsflyblue@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '软件工程', '软件工程', '13899998888', '2014-09-01', null, '5', '1', '2014214666', null, null);
INSERT INTO `user_info` VALUES ('3', 'student2', '小明', 'xsflyblue@foxmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0', '软件工程', '软件工程', '13899998888', '2014-09-01', null, '5', '1', '2014214555', null, null);
INSERT INTO `user_info` VALUES ('4', 'teacher1', '李华', 'xsflyblue@sohu.com', 'c33367701511b4f6020ec61ded352059', '0', '软件工程', '软件工程', '13899998888', null, '教授', '4', '1', 't555666777', 'cb841067-100e-4a6d-b4c4-c184ea486b21', '1525536234000');
INSERT INTO `user_info` VALUES ('5', 'admin1', 'admin1', '838797517@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '0', null, null, '', null, null, '0', '1', 'admin1', null, null);
INSERT INTO `user_info` VALUES ('6', 'student3', '小亮', 'p838797517@hotmail.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '软件工程', '软件工程', '13899998888', '2014-09-01', null, '5', '0', '2014214777', null, null);
INSERT INTO `user_info` VALUES ('7', 'manager1', 'manager1', null, 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, null, null, null, '1', '1', 'manager1', null, null);
INSERT INTO `user_info` VALUES ('8', 'manager2', 'manager2', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '软件工程', null, null, null, null, '2', '1', 'manager2', null, null);
INSERT INTO `user_info` VALUES ('16', 'student5', '小丽', 'xsflyblue@outlook.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '软件工程', '软件工程', '13877779999', '2014-09-01', null, '5', '1', '2014214778', null, null);
INSERT INTO `user_info` VALUES ('17', 'expert1', '专家1', null, 'e10adc3949ba59abbe56e057f20f883e', '0', null, null, '15877776666', null, '教授', '3', '1', 'e000001', null, null);
INSERT INTO `user_info` VALUES ('18', 'student4', '小明', '', 'e10adc3949ba59abbe56e057f20f883e', '0', '计算机科学与技术学院', '', '13889008880', '2015-09-01', null, '5', '1', '2014555777', null, null);
INSERT INTO `user_info` VALUES ('19', 'teacher2', '李明', '', 'e10adc3949ba59abbe56e057f20f883e', '0', '计算机科学与技术学院', null, '13666667777', null, '讲师', '4', '1', 't777778888', null, null);
INSERT INTO `user_info` VALUES ('20', 'expert2', '黄敏', '', 'e10adc3949ba59abbe56e057f20f883e', '1', '计算机科学与技术学院', null, '', null, '教授', '3', '1', null, null, null);

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户_站内信ID',
  `M_ID` int(11) DEFAULT NULL COMMENT '站内信ID',
  `U_ID` int(11) DEFAULT NULL COMMENT '用户ID',
  `UM_TYPE` int(11) DEFAULT NULL COMMENT '站内信用户身份',
  `UM_STATUS` int(11) DEFAULT NULL COMMENT '站内信状态',
  PRIMARY KEY (`UM_ID`),
  KEY `FK_table_message` (`M_ID`),
  KEY `FK_user_message` (`U_ID`),
  CONSTRAINT `FK_table_message` FOREIGN KEY (`M_ID`) REFERENCES `message_info` (`M_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_message` FOREIGN KEY (`U_ID`) REFERENCES `user_info` (`U_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_message
-- ----------------------------

-- ----------------------------
-- Table structure for weekly_info
-- ----------------------------
DROP TABLE IF EXISTS `weekly_info`;
CREATE TABLE `weekly_info` (
  `W_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '周报记录ID',
  `PB_ID` int(11) DEFAULT NULL COMMENT '项目ID',
  `W_START_TIME` date DEFAULT NULL COMMENT '周报开始时间',
  `W_END_TIME` date DEFAULT NULL COMMENT '周报结束时间',
  `W_THIS_WEEK` varchar(255) DEFAULT NULL COMMENT '本周工作情况',
  `W_NEXT_WEEK` varchar(255) DEFAULT NULL COMMENT '下周工作计划',
  `W_STATUS` int(11) DEFAULT NULL COMMENT '周报状态',
  `W_OPINION` varchar(100) DEFAULT NULL COMMENT '周报审核意见',
  PRIMARY KEY (`W_ID`),
  KEY `FK_project_weekly` (`PB_ID`),
  CONSTRAINT `FK_project_weekly` FOREIGN KEY (`PB_ID`) REFERENCES `project_base` (`PB_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weekly_info
-- ----------------------------
INSERT INTO `weekly_info` VALUES ('1', '1', '2018-05-01', '2018-05-07', '任务1', '计划1', '2', '不错不错不错不错不错不错不错不错不错不错不错不错不错不错不错不错不错不错不错不错');
INSERT INTO `weekly_info` VALUES ('2', '1', '2018-05-08', '2018-05-14', '任务2', '计划2', '1', '');
INSERT INTO `weekly_info` VALUES ('3', '1', '2018-05-15', '2018-05-22', '任务33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333', '计划6666666666666666666666666666666666666666666666666666666666666666666667777777777777777777777777777777777777777777', '3', '这是几个字这是几个字这是几个字这是几个字这是几个字这是几个字这是几个字这是几个字这是几个字这是几个字');
INSERT INTO `weekly_info` VALUES ('11', '1', '2018-05-19', '2018-05-26', 'ghnxfgxngf', 'xgbngfnxfgn', '1', null);
INSERT INTO `weekly_info` VALUES ('12', '1', '2018-05-27', '2018-06-02', 'DFHXDFHDXFH', 'FGJGHKHJKJLKL;JK', '1', null);
INSERT INTO `weekly_info` VALUES ('14', '1', '2018-05-27', '2018-05-28', '付电话费改', '东方红分割成结构化', '1', null);
INSERT INTO `weekly_info` VALUES ('15', '1', '2018-06-03', '2018-06-09', '付电话费改', '东方红分割成结构化', '1', null);

-- ----------------------------
-- View structure for message_view
-- ----------------------------
DROP VIEW IF EXISTS `message_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `message_view` AS select `message_info`.`M_TITLE` AS `M_TITLE`,`message_info`.`M_CONTENT` AS `M_CONTENT`,`message_info`.`SEND_TIME` AS `SEND_TIME`,`user_message`.`UM_STATUS` AS `UM_STATUS`,`user_message`.`UM_TYPE` AS `UM_TYPE`,`user_info`.`U_REALNAME` AS `U_REALNAME`,`user_info`.`ROLE` AS `ROLE`,`user_info`.`U_NAME` AS `U_NAME`,`user_info`.`Email` AS `Email`,`user_info`.`U_ID` AS `U_ID`,`message_info`.`M_ID` AS `M_ID` from ((`user_info` join `user_message` on((`user_message`.`U_ID` = `user_info`.`U_ID`))) join `message_info` on((`user_message`.`M_ID` = `message_info`.`M_ID`))) order by `message_info`.`SEND_TIME` desc ;

-- ----------------------------
-- View structure for post_view
-- ----------------------------
DROP VIEW IF EXISTS `post_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `post_view` AS select `post_info`.`PI_TITLE` AS `PI_TITLE`,`post_info`.`PI_CONTENT` AS `PI_CONTENT`,`post_info`.`HAS_ACCESSORY` AS `HAS_ACCESSORY`,`post_info`.`POST_TIME` AS `POST_TIME`,`post_info`.`POST_EDIT_TIME` AS `POST_EDIT_TIME`,`user_info`.`U_NAME` AS `U_NAME`,`user_info`.`U_REALNAME` AS `U_REALNAME`,`user_info`.`ROLE` AS `ROLE`,`post_info`.`PI_ID` AS `PI_ID`,`user_info`.`U_ID` AS `U_ID` from (`post_info` join `user_info` on((`post_info`.`U_ID` = `user_info`.`U_ID`))) order by `post_info`.`POST_EDIT_TIME` desc ;

-- ----------------------------
-- View structure for project_base_view
-- ----------------------------
DROP VIEW IF EXISTS `project_base_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_base_view` AS select `project_base`.`PB_ID` AS `PB_ID`,`user_info`.`U_ID` AS `U_ID`,`user_info`.`U_NAME` AS `U_NAME`,`user_info`.`U_REALNAME` AS `U_REALNAME`,`project_base`.`PB_CREATE_TIME` AS `PB_CREATE_TIME`,`project_base`.`PB_EDIT_TIME` AS `PB_EDIT_TIME`,`project_base`.`PB_NAME` AS `PB_NAME`,`project_base`.`PB_LEVEL` AS `PB_LEVEL`,`project_base`.`PB_TYPE` AS `PB_TYPE`,`project_base`.`SUBJECT_TYPE` AS `SUBJECT_TYPE`,`project_base`.`PSI_BRIEF` AS `PSI_BRIEF`,`project_base`.`POI_O_STATUS` AS `POI_O_STATUS`,`project_base`.`PEI_O_STATUS` AS `PEI_O_STATUS`,`project_base`.`PMI_O_STATUS` AS `PMI_O_STATUS`,`project_base`.`PEI_TIME` AS `PEI_TIME`,`project_base`.`POI_TIME` AS `POI_TIME`,`project_base`.`PMI_TIME` AS `PMI_TIME`,`project_base`.`PSI_O_STATUS` AS `PSI_O_STATUS`,`project_base`.`PB_STATUS` AS `PB_STATUS`,`project_base`.`F_STATUS` AS `F_STATUS`,`project_base`.`WS_STATUS` AS `WS_STATUS`,`project_user`.`U_TYPE` AS `U_TYPE`,`user_info`.`Email` AS `Email`,`user_info`.`GENDER` AS `GENDER`,`user_info`.`COLLEGE` AS `COLLEGE`,`user_info`.`MAJOR` AS `MAJOR`,`user_info`.`TEL` AS `TEL`,`user_info`.`ADMISSION_DATE` AS `ADMISSION_DATE`,`user_info`.`JOB_TITLE` AS `JOB_TITLE`,`user_info`.`ROLE` AS `ROLE`,`user_info`.`U_CODE` AS `U_CODE`,`project_user`.`PU_ID` AS `PU_ID`,`project_base`.`PP_ID` AS `PP_ID` from ((`project_user` join `user_info` on((`project_user`.`U_ID` = `user_info`.`U_ID`))) join `project_base` on((`project_user`.`PB_ID` = `project_base`.`PB_ID`))) order by `project_base`.`PB_EDIT_TIME` desc ;

-- ----------------------------
-- View structure for project_end_view
-- ----------------------------
DROP VIEW IF EXISTS `project_end_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_end_view` AS select `project_base`.`PB_ID` AS `PB_ID`,`project_base`.`PB_NAME` AS `PB_NAME`,`project_process_info`.`PPI_ID` AS `PPI_ID`,`project_process_info`.`PPI_CREATE_TIME` AS `PPI_CREATE_TIME`,`project_process_info`.`PPI_EDIT_TIME` AS `PPI_EDIT_TIME`,`project_process_info`.`PPI_TYPE` AS `PPI_TYPE`,`project_process_info`.`PEI_MISSION` AS `PEI_MISSION`,`project_process_info`.`PEI_OPOINION` AS `PEI_OPOINION`,`project_process_info`.`PEI_LEVEL` AS `PEI_LEVEL`,`project_process_info`.`PMI_CONTENT` AS `PMI_CONTENT`,`project_base`.`PB_TYPE` AS `PB_TYPE`,`project_base`.`PB_LEVEL` AS `PB_LEVEL`,`project_base`.`SUBJECT_TYPE` AS `SUBJECT_TYPE`,`project_user`.`U_ID` AS `U_ID`,`project_user`.`U_TYPE` AS `U_TYPE`,`project_base`.`WS_STATUS` AS `WS_STATUS`,`project_base`.`F_STATUS` AS `F_STATUS`,`project_base`.`PEI_O_STATUS` AS `PEI_O_STATUS`,`project_base`.`PMI_O_STATUS` AS `PMI_O_STATUS`,`project_base`.`PSI_O_STATUS` AS `PSI_O_STATUS`,`project_base`.`PB_STATUS` AS `PB_STATUS` from ((`project_base` join `project_process_info` on((`project_process_info`.`PB_ID` = `project_base`.`PB_ID`))) join `project_user` on((`project_user`.`PB_ID` = `project_base`.`PB_ID`))) where (`project_process_info`.`PPI_TYPE` = 3) ;

-- ----------------------------
-- View structure for project_funds_view
-- ----------------------------
DROP VIEW IF EXISTS `project_funds_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_funds_view` AS select `project_user`.`PU_ID` AS `PU_ID`,`project_user`.`U_TYPE` AS `U_TYPE`,`project_base`.`PB_ID` AS `PB_ID`,`project_base`.`F_CONTENT` AS `F_CONTENT`,`project_base`.`F_OPINION` AS `F_OPINION`,`project_base`.`F_OPINION_TIME` AS `F_OPINION_TIME`,`project_base`.`F_STATUS` AS `F_STATUS`,`user_info`.`U_ID` AS `U_ID`,`project_base`.`PB_NAME` AS `PB_NAME`,`project_base`.`PB_LEVEL` AS `PB_LEVEL`,`project_base`.`PB_TYPE` AS `PB_TYPE`,`project_base`.`SUBJECT_TYPE` AS `SUBJECT_TYPE`,`project_base`.`PB_EDIT_TIME` AS `PB_EDIT_TIME`,`project_base`.`PB_CREATE_TIME` AS `PB_CREATE_TIME`,`user_info`.`COLLEGE` AS `COLLEGE`,`user_info`.`MAJOR` AS `MAJOR` from ((`user_info` join `project_user` on((`project_user`.`U_ID` = `user_info`.`U_ID`))) join `project_base` on((`project_user`.`PB_ID` = `project_base`.`PB_ID`))) ;

-- ----------------------------
-- View structure for project_mid_view
-- ----------------------------
DROP VIEW IF EXISTS `project_mid_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_mid_view` AS select `project_process_info`.`PPI_ID` AS `PPI_ID`,`project_process_info`.`PPI_CREATE_TIME` AS `PPI_CREATE_TIME`,`project_process_info`.`PPI_EDIT_TIME` AS `PPI_EDIT_TIME`,`project_process_info`.`PPI_TYPE` AS `PPI_TYPE`,`project_process_info`.`PMI_CONTENT` AS `PMI_CONTENT`,`project_process_info`.`PMI_ISSUE` AS `PMI_ISSUE`,`project_base`.`PB_ID` AS `PB_ID`,`project_base`.`PB_NAME` AS `PB_NAME`,`project_base`.`PB_LEVEL` AS `PB_LEVEL`,`project_base`.`PB_TYPE` AS `PB_TYPE`,`project_base`.`SUBJECT_TYPE` AS `SUBJECT_TYPE`,`project_user`.`U_ID` AS `U_ID`,`project_user`.`U_TYPE` AS `U_TYPE`,`project_base`.`PMI_O_STATUS` AS `PMI_O_STATUS`,`project_base`.`PSI_O_STATUS` AS `PSI_O_STATUS`,`project_base`.`PB_STATUS` AS `PB_STATUS` from ((`project_base` join `project_process_info` on((`project_process_info`.`PB_ID` = `project_base`.`PB_ID`))) join `project_user` on((`project_user`.`PB_ID` = `project_base`.`PB_ID`))) where (`project_process_info`.`PPI_TYPE` = 2) ;

-- ----------------------------
-- View structure for project_other_view
-- ----------------------------
DROP VIEW IF EXISTS `project_other_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_other_view` AS select `project_base`.`PB_ID` AS `PB_ID`,`project_base`.`PB_NAME` AS `PB_NAME`,`project_process_info`.`PPI_CREATE_TIME` AS `PPI_CREATE_TIME`,`project_process_info`.`PPI_EDIT_TIME` AS `PPI_EDIT_TIME`,`project_process_info`.`PPI_ID` AS `PPI_ID`,`project_process_info`.`PPI_TYPE` AS `PPI_TYPE`,`project_process_info`.`POI_TYPE` AS `POI_TYPE`,`project_process_info`.`POI_CONTENT` AS `POI_CONTENT`,`project_user`.`U_ID` AS `U_ID`,`project_user`.`U_TYPE` AS `U_TYPE`,`project_base`.`POI_O_STATUS` AS `POI_O_STATUS` from ((`project_base` join `project_process_info` on((`project_process_info`.`PB_ID` = `project_base`.`PB_ID`))) join `project_user` on((`project_user`.`PB_ID` = `project_base`.`PB_ID`))) where (`project_process_info`.`PPI_TYPE` = 4) ;

-- ----------------------------
-- View structure for project_plan_view
-- ----------------------------
DROP VIEW IF EXISTS `project_plan_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_plan_view` AS select `project_base`.`PB_ID` AS `PB_ID`,`project_plan`.`PP_ID` AS `PP_ID`,`project_plan`.`PP_NAME` AS `PP_NAME`,`project_plan`.`PP_YEAR` AS `PP_YEAR`,`project_plan`.`PP_START_TIME` AS `PP_START_TIME`,`project_plan`.`PP_MID_TIME` AS `PP_MID_TIME`,`project_plan`.`PP_END_TIME` AS `PP_END_TIME`,`project_plan`.`STU_NUM` AS `STU_NUM`,`project_plan`.`ACCEPT_TIME` AS `ACCEPT_TIME`,`project_plan`.`TU_STU_NUM` AS `TU_STU_NUM`,`project_base`.`PB_CREATE_TIME` AS `PB_CREATE_TIME`,`project_base`.`PB_EDIT_TIME` AS `PB_EDIT_TIME`,`project_base`.`PB_NAME` AS `PB_NAME`,`project_base`.`PB_LEVEL` AS `PB_LEVEL`,`project_base`.`PB_TYPE` AS `PB_TYPE`,`project_base`.`SUBJECT_TYPE` AS `SUBJECT_TYPE`,`project_base`.`PSI_BRIEF` AS `PSI_BRIEF`,`project_base`.`WS_STATUS` AS `WS_STATUS`,`project_base`.`F_STATUS` AS `F_STATUS`,`project_base`.`POI_O_STATUS` AS `POI_O_STATUS`,`project_base`.`POI_TIME` AS `POI_TIME`,`project_base`.`PEI_O_STATUS` AS `PEI_O_STATUS`,`project_base`.`PEI_TIME` AS `PEI_TIME`,`project_base`.`PMI_O_STATUS` AS `PMI_O_STATUS`,`project_base`.`PMI_TIME` AS `PMI_TIME`,`project_base`.`PSI_O_STATUS` AS `PSI_O_STATUS`,`project_base`.`PB_STATUS` AS `PB_STATUS` from (`project_base` join `project_plan` on((`project_base`.`PP_ID` = `project_plan`.`PP_ID`))) ;

-- ----------------------------
-- View structure for project_start_view
-- ----------------------------
DROP VIEW IF EXISTS `project_start_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_start_view` AS select `project_base`.`PB_ID` AS `PB_ID`,`project_process_info`.`PPI_ID` AS `PPI_ID`,`project_process_info`.`PPI_CREATE_TIME` AS `PPI_CREATE_TIME`,`project_process_info`.`PPI_EDIT_TIME` AS `PPI_EDIT_TIME`,`project_process_info`.`PPI_TYPE` AS `PPI_TYPE`,`project_base`.`PB_CREATE_TIME` AS `PB_CREATE_TIME`,`project_base`.`PB_EDIT_TIME` AS `PB_EDIT_TIME`,`project_base`.`PB_NAME` AS `PB_NAME`,`project_base`.`PB_LEVEL` AS `PB_LEVEL`,`project_base`.`PB_TYPE` AS `PB_TYPE`,`project_base`.`SUBJECT_TYPE` AS `SUBJECT_TYPE`,`project_base`.`PSI_BRIEF` AS `PSI_BRIEF`,`project_base`.`PSI_REASON` AS `PSI_REASON`,`project_base`.`PSI_CONTENT` AS `PSI_CONTENT`,`project_base`.`PSI_FEATURE` AS `PSI_FEATURE`,`project_base`.`PSI_PLAN` AS `PSI_PLAN`,`project_base`.`PSI_RESULT` AS `PSI_RESULT`,`project_user`.`U_ID` AS `U_ID`,`project_user`.`U_TYPE` AS `U_TYPE`,`project_base`.`PSI_O_STATUS` AS `PSI_O_STATUS` from ((`project_base` join `project_process_info` on((`project_process_info`.`PB_ID` = `project_base`.`PB_ID`))) join `project_user` on((`project_user`.`PB_ID` = `project_base`.`PB_ID`))) where (`project_process_info`.`PPI_TYPE` = 1) ;

-- ----------------------------
-- View structure for weekly_view
-- ----------------------------
DROP VIEW IF EXISTS `weekly_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `weekly_view` AS select `project_base`.`PB_ID` AS `PB_ID`,`weekly_info`.`W_ID` AS `W_ID`,`weekly_info`.`W_START_TIME` AS `W_START_TIME`,`weekly_info`.`W_END_TIME` AS `W_END_TIME`,`weekly_info`.`W_THIS_WEEK` AS `W_THIS_WEEK`,`weekly_info`.`W_NEXT_WEEK` AS `W_NEXT_WEEK`,`weekly_info`.`W_STATUS` AS `W_STATUS`,`weekly_info`.`W_OPINION` AS `W_OPINION`,`project_base`.`PB_CREATE_TIME` AS `PB_CREATE_TIME`,`project_base`.`PB_EDIT_TIME` AS `PB_EDIT_TIME`,`project_base`.`PB_NAME` AS `PB_NAME`,`project_base`.`PB_LEVEL` AS `PB_LEVEL`,`project_base`.`PB_TYPE` AS `PB_TYPE`,`project_base`.`SUBJECT_TYPE` AS `SUBJECT_TYPE`,`project_base`.`WS_STATUS` AS `WS_STATUS`,`project_user`.`U_ID` AS `U_ID`,`project_user`.`U_TYPE` AS `U_TYPE` from ((`weekly_info` join `project_base` on((`weekly_info`.`PB_ID` = `project_base`.`PB_ID`))) join `project_user` on((`project_user`.`PB_ID` = `project_base`.`PB_ID`))) ;

-- ----------------------------
-- Procedure structure for addendprocess
-- ----------------------------
DROP PROCEDURE IF EXISTS `addendprocess`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addendprocess`(IN `pbid` int,IN `content` varchar(2000),IN `level` int,IN `mission` varchar(1000),IN `opoinion` varchar(500),OUT `flag` int)
BEGIN
  DECLARE EXIT HANDLER  
  FOR 1452  
  SET flag=0;

  DECLARE EXIT HANDLER  
  FOR 1062  
  SET flag=0;

  INSERT project_process_info(
  PB_ID,PPI_CREATE_TIME,PPI_EDIT_TIME
  ,PPI_TYPE,PMI_CONTENT
  ,PEI_LEVEL,PEI_MISSION,PEI_OPOINION)
  VALUES(
  pbid,CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP()
  ,3,content
  ,level,mission,opoinion);

  UPDATE project_base SET project_base.PEI_O_STATUS=31,project_base.PB_STATUS=3
  WHERE  project_base.PB_ID = pbid;
  SET flag=1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addmidprocess
-- ----------------------------
DROP PROCEDURE IF EXISTS `addmidprocess`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addmidprocess`(IN `pbid` int,IN `content` varchar(2000),IN `issue` varchar(1000),OUT `flag` int)
BEGIN
  DECLARE EXIT HANDLER  
  FOR 1452  
  SET flag=0;

  DECLARE EXIT HANDLER  
  FOR 1062  
  SET flag=0;

  INSERT project_process_info(
  PB_ID,PPI_CREATE_TIME,PPI_EDIT_TIME
  ,PPI_TYPE,PMI_CONTENT,PMI_ISSUE)
  VALUES(
  pbid,CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP()
  ,2,content,issue);

  UPDATE project_base SET project_base.PMI_O_STATUS=21,project_base.PB_STATUS=2
  WHERE  project_base.PB_ID = pbid;
  SET flag=1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addopinion
-- ----------------------------
DROP PROCEDURE IF EXISTS `addopinion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addopinion`(IN `pppid` int,IN `utype` int,IN `content` varchar(255),IN `status` int,OUT `flag` int)
BEGIN
  DECLARE pid int;
  DECLARE pstatus int;
  DECLARE pptype int;

  DECLARE EXIT HANDLER  
  FOR 1452  
  SET flag=0;

  DECLARE EXIT HANDLER  
  FOR 1062  
  SET flag=0;

  INSERT opinion_info(
  PPI_ID,O_U_TYPE,O_CONTENT,O_TIME,O_STATUS)
  VALUES(
  pppid,utype,content,CURRENT_DATE(),status);

  SELECT project_process_info.PB_ID,project_process_info.PPI_TYPE INTO pid,pptype 
  FROM project_process_info WHERE project_process_info.PPI_ID=pppid LIMIT 1;

  IF pptype=1 THEN
     IF status=0 THEN
         IF utype=0 THEN
              SET pstatus=13;
         ELSEIF utype=1 THEN
              SET pstatus=15;
         ELSEIF utype=2 THEN
              SET pstatus=17;
         ELSEIF utype=3 THEN
              SET pstatus=19;
         END IF;
     ELSEIF status=1 THEN
         IF utype=0 THEN
              SET pstatus=12;
         ELSEIF utype=1 THEN
              SET pstatus=18;
         ELSEIF utype=2 THEN
              SET pstatus=14;
         ELSEIF utype=3 THEN
              SET pstatus=16;
         END IF;
     END IF;

     UPDATE project_base SET project_base.PSI_O_STATUS = pstatus
     WHERE  project_base.PB_ID=pid;
  ELSEIF pptype=2 THEN
     IF status=0 THEN
         IF utype=0 THEN
              SET pstatus=23;
         ELSEIF utype=1 THEN
              SET pstatus=25;
         ELSEIF utype=2 THEN
              SET pstatus=27;
         ELSEIF utype=3 THEN
              SET pstatus=29;
         END IF;
     ELSEIF status=1 THEN
         IF utype=0 THEN
              SET pstatus=22;
         ELSEIF utype=1 THEN
              SET pstatus=28;
         ELSEIF utype=2 THEN
              SET pstatus=24;
         ELSEIF utype=3 THEN
              SET pstatus=26;
         END IF;
     END IF;

     UPDATE project_base SET project_base.PMI_O_STATUS = pstatus,PMI_TIME = CURRENT_DATE()
     WHERE  project_base.PB_ID=pid;
  ELSEIF pptype=3 THEN
     IF status=0 THEN
         IF utype=0 THEN
              SET pstatus=33;
         ELSEIF utype=1 THEN
              SET pstatus=35;
         ELSEIF utype=2 THEN
              SET pstatus=37;
         ELSEIF utype=3 THEN
              SET pstatus=39;
         END IF;
     ELSEIF status=1 THEN
         IF utype=0 THEN
              SET pstatus=32;
         ELSEIF utype=1 THEN
              SET pstatus=38;
         ELSEIF utype=2 THEN
              SET pstatus=34;
         ELSEIF utype=3 THEN
              SET pstatus=36;
         END IF;
     END IF;
     IF pstatus=39 THEN 
         UPDATE project_base SET project_base.PB_STATUS=0,project_base.PEI_O_STATUS = pstatus,PEI_TIME = CURRENT_DATE()
         WHERE  project_base.PB_ID=pid;
     ELSE
         UPDATE project_base SET project_base.PEI_O_STATUS = pstatus,PEI_TIME = CURRENT_DATE()
         WHERE  project_base.PB_ID=pid;
     END IF;  
  ELSEIF pptype=4 THEN
     IF status=0 THEN
         IF utype=0 THEN
              SET pstatus=43;
         ELSEIF utype=1 THEN
              SET pstatus=45;
         ELSEIF utype=2 THEN
              SET pstatus=47;
         ELSEIF utype=3 THEN
              SET pstatus=49;
         END IF;
     ELSEIF status=1 THEN
         IF utype=0 THEN
              SET pstatus=42;
         ELSEIF utype=1 THEN
              SET pstatus=48;
         ELSEIF utype=2 THEN
              SET pstatus=44;
         ELSEIF utype=3 THEN
              SET pstatus=46;
         END IF;
     END IF;
     UPDATE project_base SET project_base.POI_O_STATUS = pstatus,POI_TIME = CURRENT_DATE()
     WHERE  project_base.PB_ID=pid;
  END IF;
  
  SET flag=1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addotherprocess
-- ----------------------------
DROP PROCEDURE IF EXISTS `addotherprocess`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addotherprocess`(IN `pbid` int,IN `poitype` int,IN `content` varchar(2000),OUT `flag` int)
BEGIN
  DECLARE EXIT HANDLER  
  FOR 1452  
  SET flag=0;

  DECLARE EXIT HANDLER  
  FOR 1062  
  SET flag=0;

  INSERT project_process_info(
  PB_ID,PPI_CREATE_TIME,PPI_EDIT_TIME
  ,PPI_TYPE
  ,POI_TYPE,POI_CONTENT)
  VALUES(
  pbid,CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP()
  ,4
  ,poitype,content);

  UPDATE project_base SET project_base.POI_O_STATUS=41,project_base.PB_STATUS=4
  WHERE  project_base.PB_ID = pbid;
  SET flag=1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addproject
-- ----------------------------
DROP PROCEDURE IF EXISTS `addproject`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addproject`(IN `ppid` int,IN `name` varchar(30),IN `level` int,IN `type` int,IN `subject` int,IN `breif` varchar(500),IN `reason` varchar(1000),IN `content` varchar(2000),IN `fearure` varchar(1000),IN `plan` varchar(1000),IN `result` varchar(1000),OUT `pb_id` int,OUT `flag` int)
BEGIN
  DECLARE EXIT HANDLER  
  FOR 1452  
  SET flag=0;

  DECLARE EXIT HANDLER  
  FOR 1062  
  SET flag=0;
 
  INSERT
  INTO project_base(
  PP_ID,PB_CREATE_TIME,PB_EDIT_TIME,PB_NAME,PB_LEVEL,PB_TYPE,SUBJECT_TYPE
  ,PSI_BRIEF,PSI_REASON,PSI_CONTENT,PSI_FEATURE,PSI_PLAN,PSI_RESULT
  ,PB_STATUS,PSI_O_STATUS,PMI_TIME,PMI_O_STATUS,PEI_TIME,PEI_O_STATUS,POI_TIME,POI_O_STATUS
  ,F_STATUS,WS_STATUS)
  VALUES(
  ppid,CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP(),name,level,type,subject
  ,breif,reason,content,fearure,plan,result
  ,'1', '10', null, null, null, null, null, null
  ,0,2
  );

  SET pb_id = LAST_INSERT_ID();

  INSERT
  INTO project_process_info(PB_ID,PPI_CREATE_TIME,PPI_EDIT_TIME,PPI_TYPE)
  VALUES(pb_id,CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP(),1);

  SET flag=1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addprojectuser
-- ----------------------------
DROP PROCEDURE IF EXISTS `addprojectuser`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addprojectuser`(IN `pbid` int,IN `ucode` varchar(20),IN `utype` int,OUT `flag` int)
BEGIN
  DECLARE id varchar(20);
  DECLARE C int;

	DECLARE EXIT HANDLER  
  FOR 1452  
  SET flag=0;

  DECLARE EXIT HANDLER  
  FOR 1062  
  SET flag=0;

  SELECT U_ID INTO id FROM user_info WHERE user_info.U_CODE=ucode;
  IF id > 0 && id <> NULL THEN
     SET flag=0;
  ELSE
     IF utype=0 THEN
         SELECT COUNT(*) INTO C FROM project_user WHERE PB_ID=pbid AND U_TYPE=0;
         IF C<1 THEN
              INSERT project_user(U_ID,PB_ID,U_TYPE)
              VALUES(id,pbid,utype);
              SET flag=1;
         ELSE
              SET flag=0;
         END IF;
     ELSEIF utype=2 THEN
         SELECT COUNT(*) INTO C FROM project_user WHERE PB_ID=pbid AND U_TYPE=2;
         IF C<1 THEN
              INSERT project_user(U_ID,PB_ID,U_TYPE)
              VALUES(id,pbid,utype);
              SET flag=1;
         ELSE
              SET flag=0;
         END IF;
     ELSEIF utype=3 THEN
         SELECT COUNT(*) INTO C FROM project_user WHERE PB_ID=pbid AND U_TYPE=3;
         IF C<1 THEN
              INSERT project_user(U_ID,PB_ID,U_TYPE)
              VALUES(id,pbid,utype);
              SET flag=1;
         ELSE
              SET flag=0;
         END IF;
     ELSE
         INSERT project_user(U_ID,PB_ID,U_TYPE)
         VALUES(id,pbid,utype);
         SET flag=1;
     END IF;
  END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for editopinion
-- ----------------------------
DROP PROCEDURE IF EXISTS `editopinion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editopinion`(IN `oid` int,IN `pppid` int,IN `utype` int,IN `content` varchar(255),IN `status` int,OUT `flag` int)
BEGIN
  DECLARE pid int;
  DECLARE pstatus int;
  DECLARE pptype int;

  DECLARE EXIT HANDLER  
  FOR 1452  
  SET flag=0;

  DECLARE EXIT HANDLER  
  FOR 1062  
  SET flag=0;

  UPDATE opinion_info SET O_CONTENT=content,O_TIME=CURRENT_DATE(),O_STATUS=status
  WHERE opinion_info.O_ID = oid;

  SELECT project_process_info.PB_ID,project_process_info.PPI_TYPE INTO pid,pptype 
  FROM project_process_info WHERE project_process_info.PPI_ID=pppid LIMIT 1;

  IF pptype=1 THEN
     IF status=0 THEN
         IF utype=0 THEN
              SET pstatus=13;
         ELSEIF utype=1 THEN
              SET pstatus=15;
         ELSEIF utype=2 THEN
              SET pstatus=17;
         ELSEIF utype=3 THEN
              SET pstatus=19;
         END IF;
     ELSEIF status=1 THEN
         IF utype=0 THEN
              SET pstatus=12;
         ELSEIF utype=1 THEN
              SET pstatus=18;
         ELSEIF utype=2 THEN
              SET pstatus=14;
         ELSEIF utype=3 THEN
              SET pstatus=16;
         END IF;
     END IF;

     UPDATE project_base SET project_base.PSI_O_STATUS = pstatus
     WHERE  project_base.PB_ID=pid;
  ELSEIF pptype=2 THEN
     IF status=0 THEN
         IF utype=0 THEN
              SET pstatus=23;
         ELSEIF utype=1 THEN
              SET pstatus=25;
         ELSEIF utype=2 THEN
              SET pstatus=27;
         ELSEIF utype=3 THEN
              SET pstatus=29;
         END IF;
     ELSEIF status=1 THEN
         IF utype=0 THEN
              SET pstatus=22;
         ELSEIF utype=1 THEN
              SET pstatus=28;
         ELSEIF utype=2 THEN
              SET pstatus=24;
         ELSEIF utype=3 THEN
              SET pstatus=26;
         END IF;
     END IF;

     UPDATE project_base SET project_base.PMI_O_STATUS = pstatus,PMI_TIME = CURRENT_DATE()
     WHERE  project_base.PB_ID=pid;
  ELSEIF pptype=3 THEN
     IF status=0 THEN
         IF utype=0 THEN
              SET pstatus=33;
         ELSEIF utype=1 THEN
              SET pstatus=35;
         ELSEIF utype=2 THEN
              SET pstatus=37;
         ELSEIF utype=3 THEN
              SET pstatus=39;
         END IF;
     ELSEIF status=1 THEN
         IF utype=0 THEN
              SET pstatus=32;
         ELSEIF utype=1 THEN
              SET pstatus=38;
         ELSEIF utype=2 THEN
              SET pstatus=34;
         ELSEIF utype=3 THEN
              SET pstatus=36;
         END IF;
     END IF;
     IF pstatus=39 THEN 
         UPDATE project_base SET project_base.PB_STATUS=0,project_base.PEI_O_STATUS = pstatus,PEI_TIME = CURRENT_DATE()
         WHERE  project_base.PB_ID=pid;
     ELSE
         UPDATE project_base SET project_base.PEI_O_STATUS = pstatus,PEI_TIME = CURRENT_DATE()
         WHERE  project_base.PB_ID=pid;
     END IF;  

  ELSEIF pptype=4 THEN
     IF status=0 THEN
         IF utype=0 THEN
              SET pstatus=43;
         ELSEIF utype=1 THEN
              SET pstatus=45;
         ELSEIF utype=2 THEN
              SET pstatus=47;
         ELSEIF utype=3 THEN
              SET pstatus=49;
         END IF;
     ELSEIF status=1 THEN
         IF utype=0 THEN
              SET pstatus=42;
         ELSEIF utype=1 THEN
              SET pstatus=48;
         ELSEIF utype=2 THEN
              SET pstatus=44;
         ELSEIF utype=3 THEN
              SET pstatus=46;
         END IF;
     END IF;
     UPDATE project_base SET project_base.POI_O_STATUS = pstatus,POI_TIME = CURRENT_DATE()
     WHERE  project_base.PB_ID=pid;
  END IF;
  
  SET flag=1;
END
;;
DELIMITER ;
