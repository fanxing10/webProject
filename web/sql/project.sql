/*
Navicat MySQL Data Transfer

Source Server         : first
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : mysql2

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2019-04-30 17:13:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(30) NOT NULL,
  `applyer` varchar(30) NOT NULL,
  `landlinePhone` varchar(15) NOT NULL,
  `mobilePhone` varchar(30) NOT NULL,
  `appleTime` datetime NOT NULL,
  `money` int(8) NOT NULL,
  `moneyGiven` int(11) DEFAULT NULL,
  `moment` varchar(30) NOT NULL,
  `promaryCoverage` longtext,
  `email` varchar(21) DEFAULT NULL,
  `status` varchar(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '临时项目', 'zhx', '110', '18393816009', '2019-04-18 10:51:49', '100', '100', '运行阶段', 'hahahahhah', '1684842107@qq.com', '1');
INSERT INTO `project` VALUES ('2', '22', 'zfsss', '22', '22', '2019-04-24 17:38:53', '22', '222', '运行阶段', 'www.runnoob.com', '22', '1');
INSERT INTO `project` VALUES ('3', '222', '22', '222', '222', '2019-04-24 17:40:55', '22', '22', '项目结束', 'www.runnoob.com', '222', '1');
INSERT INTO `project` VALUES ('4', '222', '22', '222', '119', '2019-04-24 17:41:24', '22', '22', '启动阶段', 'www.baidu.com', '222', '1');
INSERT INTO `project` VALUES ('5', '23', '3232', '32323', '323', '2019-04-25 16:37:45', '2323', '2323', '启动阶段', '32323', '232', '1');
INSERT INTO `project` VALUES ('6', '333', '333', '333', '333', '2019-04-25 16:51:44', '333', '333', '论证阶段', '3333', '333', '1');
INSERT INTO `project` VALUES ('7', '临时项目2', 'zhx', '931882563', '18393816009', '2019-04-29 09:37:14', '1000', '100', '启动阶段', 'hahahahhah', '1684842107@qq.com', '1');
INSERT INTO `project` VALUES ('8', 'linshi', 'zhx', '931882563', '18393816009', '2019-04-29 09:38:28', '1000', '100', '论证阶段', 'hahahahhah', '1684842107@qq.com', '1');
INSERT INTO `project` VALUES ('9', '临时项目1', 'zhx', '931882563', '18393816009', '2019-04-29 10:11:37', '1000', '100', '论证阶段', 'hahahahhah', '1684842107@qq.com', '1');
INSERT INTO `project` VALUES ('10', '临时项目', 'zhx', '222', '18393816009', '2019-04-30 14:06:10', '1000', '22', '启动阶段', 'www.runnoob.com', '1684842107@qq.com', '1');
INSERT INTO `project` VALUES ('11', '临时项目', 'zhx', 'zz', 'zz', '2019-04-30 14:07:37', '22', '33', '论证阶段', 'zz', 'zz', '1');
