/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : flower

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-12-14 17:49:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `describe` varchar(100) DEFAULT NULL COMMENT '描述',
  `price` double DEFAULT NULL COMMENT '价格',
  `Grade` int(1) DEFAULT NULL COMMENT '品级(1-5颗星)',
  `Invalid` int(1) DEFAULT NULL COMMENT '是否失效(0-有效 1-失效)',
  `creattime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `creatAccount` varchar(255) DEFAULT NULL COMMENT '创建账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
