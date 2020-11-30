/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : survey

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2020-11-30 18:26:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('10', 'admin', '18b9d67236cb3169b6bf566422e66827', '陈浩繁', '15007056645', '这是主账号');
INSERT INTO `tb_admin` VALUES ('76', '测试1', '18b9d67236cb3169b6bf566422e66827', '测试1', '15007056645', '这是测试\n');
INSERT INTO `tb_admin` VALUES ('90', '用户1', '87fd44ce49b2e0534c63762d2e5b27ce', '测试', '15007056645', '');

-- ----------------------------
-- Table structure for tb_answer_opt
-- ----------------------------
DROP TABLE IF EXISTS `tb_answer_opt`;
CREATE TABLE `tb_answer_opt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `opt_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单选；多选',
  `create_time` datetime DEFAULT NULL,
  `voter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opt_id` (`opt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_answer_opt
-- ----------------------------
INSERT INTO `tb_answer_opt` VALUES ('1', '1', '1', '1', '2', '2020-10-10 14:57:26', 'anao');
INSERT INTO `tb_answer_opt` VALUES ('2', '1', '1', '1', '2', '2020-10-10 14:58:37', 'anao');
INSERT INTO `tb_answer_opt` VALUES ('3', '1', '1', '2', '2', '2020-10-10 14:59:19', '');

-- ----------------------------
-- Table structure for tb_answer_text
-- ----------------------------
DROP TABLE IF EXISTS `tb_answer_text`;
CREATE TABLE `tb_answer_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `voter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_answer_text
-- ----------------------------

-- ----------------------------
-- Table structure for tb_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `renark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(1) unsigned DEFAULT '1' COMMENT '1：单选\r\n2：多选\r\n3：单行\r\n4：多行',
  `required` int(1) unsigned DEFAULT NULL COMMENT '0：非必填\r\n1：必填',
  `check_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'test;number;date',
  `order_style` int(1) unsigned DEFAULT '0' COMMENT '0：顺序\r\n1：随机',
  `show_style` int(1) unsigned DEFAULT '0' COMMENT '1：一列\r\n2：二列\r\n3：三列\r\n4：四列',
  `test` int(1) unsigned DEFAULT '0' COMMENT '0:不测评1：测评',
  `scone` int(3) unsigned DEFAULT NULL,
  `ordeby` int(11) DEFAULT NULL,
  `ccreator` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `survey_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_id` (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES ('1', '问题测试1？', '无', '2', null, null, '0', '0', '0', null, null, null, null, '1');
INSERT INTO `tb_question` VALUES ('2', '问题测试2？', '无', '1', null, null, '0', '0', '0', null, null, null, null, '1');
INSERT INTO `tb_question` VALUES ('3', '问题测试3？', '无', '3', null, null, '0', '0', '0', null, null, null, null, '1');

-- ----------------------------
-- Table structure for tb_question_opt
-- ----------------------------
DROP TABLE IF EXISTS `tb_question_opt`;
CREATE TABLE `tb_question_opt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL,
  `quertion_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单选；多选',
  `opt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderby` int(11) DEFAULT NULL,
  `answer` int(1) unsigned DEFAULT NULL COMMENT '1:是答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_question_opt
-- ----------------------------
INSERT INTO `tb_question_opt` VALUES ('1', '1', '1', '2', '测试1', '1', null);
INSERT INTO `tb_question_opt` VALUES ('2', '1', '1', '2', '测试2', '2', null);
INSERT INTO `tb_question_opt` VALUES ('3', '1', '1', '2', '测试3', '3', null);
INSERT INTO `tb_question_opt` VALUES ('4', '1', '2', '1', '测试1', '1', null);
INSERT INTO `tb_question_opt` VALUES ('5', '1', '2', '1', '测试1', '2', null);
INSERT INTO `tb_question_opt` VALUES ('6', '1', '2', '1', '测试1', '3', null);
INSERT INTO `tb_question_opt` VALUES ('7', '1', '2', '1', '测试1', '4', null);

-- ----------------------------
-- Table structure for tb_survey
-- ----------------------------
DROP TABLE IF EXISTS `tb_survey`;
CREATE TABLE `tb_survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bounds` int(1) unsigned DEFAULT '0' COMMENT '0:不限制\r\n1：限制',
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `rules` int(1) unsigned DEFAULT '0' COMMENT '0:公开\r\n1：密码',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建\r\n执行中\r\n结束',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bgimg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anon` int(1) unsigned DEFAULT '0' COMMENT '0:不匿名\r\n1：匿名',
  `creator` int(11) DEFAULT NULL,
  `creator_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_survey
-- ----------------------------
INSERT INTO `tb_survey` VALUES ('1', '第一份测试', '测试', '0', '2020-10-10', '2020-10-11', '0', '', null, '新建', null, null, '0', '10', '2020-10-15 19:45:53');
INSERT INTO `tb_survey` VALUES ('7', '第二份测试', ' 测试', '0', '2020-10-15', '2020-10-16', '0', null, null, '结束', null, null, '0', '10', '2020-10-15 19:43:51');
INSERT INTO `tb_survey` VALUES ('8', '第三份测试', ' 测试', '0', '2020-10-15', '2020-10-16', '0', '', '', '执行中', '', '', '0', '10', '2020-10-15 19:43:51');
INSERT INTO `tb_survey` VALUES ('12', '测试2', '测试2', '1', '2020-10-17', '2020-10-18', '1', '123456789', null, '新建', null, null, '1', '10', '2020-10-17 22:35:52');
INSERT INTO `tb_survey` VALUES ('16', ' 测试', '测试', '0', '2020-10-18', '2020-10-19', '0', '', null, '新建', null, null, '0', '10', '2020-10-18 15:36:47');
INSERT INTO `tb_survey` VALUES ('17', '测试', '测试', '0', '2020-10-24', '2020-10-29', '0', '', null, '新建', null, null, '0', '10', '2020-10-18 17:46:37');
