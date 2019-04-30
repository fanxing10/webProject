/*
Navicat MySQL Data Transfer

Source Server         : first
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : mysql2

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2019-04-30 17:13:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for expert
-- ----------------------------
DROP TABLE IF EXISTS `expert`;
CREATE TABLE `expert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `idNum` varchar(20) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `nation` varchar(32) DEFAULT NULL,
  `birth` varchar(8) DEFAULT NULL,
  `unit` varchar(64) NOT NULL,
  `department` varchar(64) NOT NULL,
  `subject` varchar(64) DEFAULT NULL,
  `job` varchar(64) DEFAULT NULL,
  `researchArea` varchar(64) NOT NULL,
  `industryCategory` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phoneNum` varchar(15) NOT NULL,
  `address` varchar(64) DEFAULT NULL,
  `mainSuccess` varchar(64) DEFAULT NULL,
  `honor` varchar(64) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expert
-- ----------------------------
INSERT INTO `expert` VALUES ('1', 'zhx', '111', '111', '男', '彝族', '2018-3', '万桥有限公司', '研发', '1', 'student', '1', '信息类', '1684842107@qq.com', '18393816009', '111', '11111', '111111111', '1');
INSERT INTO `expert` VALUES ('2', 'herry', '11', '11', '女', '哈萨克族', '2018-8', '2', '2', '计算机', '2', '2', '信息类', '2', '2', '18393816009', '2', '兰大本部校区雪上公寓', '1');
INSERT INTO `expert` VALUES ('3', '马克', '100', '100', '男', '蒙古族', '2019-4', 'q', 'w', '计算机', 'q', 'q', 'qeqweq', 'q', '111111111', 'q', 'q', 'q', '1');
INSERT INTO `expert` VALUES ('4', 'zzx', '620123199530108212', '620123199530108212', '男', '回族', '1980-4', '111', '信息院', '计算机', '学生', 'q', '信息类', 'q', 'q', 'q', '1684842107@qq.com', '张苏滩', '1');
INSERT INTO `expert` VALUES ('5', 'Jerry', '620123199530108212', '620123199530108212', '男', '彝族', '2019-4', '111', '研发', 'subject', 'yes', 'q', 'q', 'q', 'æ ', 'q', '1684842107@qq.com', 'q', '1');
INSERT INTO `expert` VALUES ('6', '傻子', '3333', '3333', '女', '土族', '2019-4', '33', '33', '33', '33', '33', '33', '33', '33', '33', '1684842107@qq.ocm', '33', '1');
INSERT INTO `expert` VALUES ('7', 'hsy', '620123199530108212', '620123199530108212', '女', '蒙古族', '2018-5', '万桥有限公司', '信息院', '计算机', '学生', '深度学习', '信息类', '1684842107@qq.com', '18393816009', '兰大本部校区雪上公寓', '无', 'www', '1');
INSERT INTO `expert` VALUES ('8', 'your name', '620123199530108212', '620123199530108212', '男', '苗族', '2019-4', '111', 'jobaa', 'subejec', 'yes', 'q', 'q', '1684842107@qq.com', 'q', '', 'q', '无', '1');
INSERT INTO `expert` VALUES ('9', 'your name', '620123199530108212', '620123199530108212', '男', '苗族', '2019-4', '111', 'jobaa', 'subejec', 'yes', 'q', 'q', '1684842107@qq.com', 'q', '', 'q', '无', '1');
