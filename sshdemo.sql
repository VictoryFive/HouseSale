/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50151
Source Host           : localhost:3306
Source Database       : sshdemo

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2018-06-21 16:51:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_buyer
-- ----------------------------
DROP TABLE IF EXISTS `t_buyer`;
CREATE TABLE `t_buyer` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(255) NOT NULL,
  `b_password` varchar(255) NOT NULL,
  `b_username` varchar(255) NOT NULL,
  `b_age` int(11) NOT NULL,
  `b_telephone` varchar(255) NOT NULL,
  `b_gender` varchar(255) NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_buyer
-- ----------------------------
INSERT INTO `t_buyer` VALUES ('1', '周大生', '123', '123', '70', '15263985632', '男');
INSERT INTO `t_buyer` VALUES ('2', '黄渤', '123', '123', '59', '15263985632', '男');
INSERT INTO `t_buyer` VALUES ('3', '王野牛', '1', '1', '35', '15263985632', '男');

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_name` varchar(255) NOT NULL,
  `h_distric` varchar(255) NOT NULL,
  `h_area` double(255,0) NOT NULL,
  `h_type` varchar(255) NOT NULL,
  `h_RB` varchar(255) NOT NULL,
  `h_money` double(255,0) NOT NULL,
  `h_design` varchar(255) NOT NULL,
  `h_x` double(255,10) NOT NULL,
  `h_y` double(255,10) NOT NULL,
  `s_id` int(11) NOT NULL,
  `h_province` varchar(255) NOT NULL,
  `h_city` varchar(255) NOT NULL,
  `h_date` varchar(255) NOT NULL,
  `h_info` varchar(255) NOT NULL,
  `h_houseType` varchar(255) DEFAULT NULL,
  `h_url` varchar(255) NOT NULL,
  PRIMARY KEY (`h_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES ('1', '海尔东城国际北区', '崂山区', '85', '2室二厅', '租', '2920', '靠近地铁', '120.4699460000', '36.1056400000', '0', '', '', '4', '', '住宅', '/images/11.jpg');
INSERT INTO `t_house` VALUES ('2', '海信东城国际北区', '市北区', '110', '2室二厅', '租', '3200', '高铁沿线', '0.0000000000', '0.0000000000', '0', '', '', '5', '', '别墅', '/images/10.jpg');
INSERT INTO `t_house` VALUES ('3', '京东东城国际北区', '市南区', '140', '3室二厅', '租', '4500', '地处海滨', '0.0000000000', '0.0000000000', '0', '', '', '12', '', '商业', '/images/9.jpg');
INSERT INTO `t_house` VALUES ('4', '天猫东城国际北区', '城阳区', '60', '1室一厅', '租', '1800', '中心商业区', '0.0000000000', '0.0000000000', '0', '', '', '10', '', '写字楼', '/images/7.jpg');
INSERT INTO `t_house` VALUES ('5', '淘宝东城国际北区', '黄岛区', '48', '1室一厅', '租', '1000', '地段繁华', '0.0000000000', '0.0000000000', '0', '', '', '8', '', '底商', '/images/8.jpg');
INSERT INTO `t_house` VALUES ('6', 'vivo东城国际北区', '胶州区', '125', '3室二厅', '租', '3000', '依山傍水', '0.0000000000', '0.0000000000', '0', '', '', '6', '', '住宅', '/images/11.jpg');
INSERT INTO `t_house` VALUES ('7', 'oppo东城国际北区', '平度区', '155', '4室二厅', '租', '4900', '靠近地铁', '0.0000000000', '0.0000000000', '0', '', '', '7', '', '别墅', '/images/10.jpg');
INSERT INTO `t_house` VALUES ('8', '小米东城国际北区', '李沧区', '202', '5室四厅', '租', '5500', '高铁沿线', '0.0000000000', '0.0000000000', '0', '', '', '8', '', '商业', '/images/9.jpg');
INSERT INTO `t_house` VALUES ('9', '锤子东城国际北区', '即墨区', '50', '1室一厅', '租', '1320', '地处海滨', '0.0000000000', '0.0000000000', '0', '', '', '11', '', '写字楼', '/images/7.jpg');
INSERT INTO `t_house` VALUES ('10', '华为东城国际北区', '莱西区', '103', '2室一厅', '二手', '110', '中心商业区', '0.0000000000', '0.0000000000', '0', '', '', '2015.5.2', '', '底商', '/images/11.jpg');
INSERT INTO `t_house` VALUES ('11', '海尔东城国际北区', '崂山区', '85', '2室二厅', '二手', '102', '地段繁华', '120.4699460000', '36.1056400000', '0', '', '', '2015.5.2', '', '住宅', '/images/10.jpg');
INSERT INTO `t_house` VALUES ('12', '海信东城国际北区', '市北区', '110', '2室二厅', '二手', '168', '靠近地铁', '0.0000000000', '0.0000000000', '0', '', '', '2015.5.2', '', '别墅', '/images/9.jpg');
INSERT INTO `t_house` VALUES ('13', '京东东城国际北区', '市南区', '140', '3室二厅', '二手', '260', '高铁沿线', '0.0000000000', '0.0000000000', '0', '', '', '2015.5.2', '', '商业', '/images/7.jpg');
INSERT INTO `t_house` VALUES ('14', '天猫东城国际北区', '城阳区', '60', '1室一厅', '二手', '100', '地处海滨', '0.0000000000', '0.0000000000', '0', '', '', '2015.5.2', '', '写字楼', '/images/11.jpg');
INSERT INTO `t_house` VALUES ('15', '淘宝东城国际北区', '黄岛区', '48', '1室一厅', '二手', '75', '中心商业区', '0.0000000000', '0.0000000000', '0', '', '', '2015.5.2', '', '底商', '/images/10.jpg');
INSERT INTO `t_house` VALUES ('16', 'vivo东城国际北区', '胶州区', '125', '3室二厅', '二手', '189', '地段繁华', '0.0000000000', '0.0000000000', '0', '', '', '2015.5.2', '', '住宅', '/images/9.jpg');
INSERT INTO `t_house` VALUES ('17', 'oppo东城国际北区', '平度区', '155', '4室二厅', '二手', '325', '靠近地铁', '0.0000000000', '0.0000000000', '0', '', '', '2015.5.2', '', '别墅', '/images/7.jpg');
INSERT INTO `t_house` VALUES ('18', '小米东城国际北区', '李沧区', '202', '5室四厅', '二手', '520', '海滨圣府', '0.0000000000', '0.0000000000', '0', '', '', '2015.5.2', '', '商业', '/images/11.jpg');
INSERT INTO `t_house` VALUES ('19', '锤子东城国际北区', '即墨区', '50', '1室一厅', '二手', '95', '高铁沿线', '0.0000000000', '0.0000000000', '0', '', '', '2018.5.2', '', '写字楼', '/images/10.jpg');
INSERT INTO `t_house` VALUES ('20', '华为东城国际北区', '莱西区', '103', '2室二厅', '二手', '116', '地处海滨', '0.0000000000', '0.0000000000', '0', '', '', '2018.5.2', '', '底商', '/images/9.jpg');
INSERT INTO `t_house` VALUES ('21', '海尔东城国际北区', '崂山区', '85', '2室一厅', '新', '102', '中心商业区', '120.4699460000', '36.1056400000', '0', '', '', '12000', '', '住宅', '/images/7.jpg');
INSERT INTO `t_house` VALUES ('22', '海信东城国际北区', '市北区', '110', '2室二厅', '新', '168', '地段繁华', '0.0000000000', '0.0000000000', '0', '', '', '15000', '', '别墅', '/images/11.jpg');
INSERT INTO `t_house` VALUES ('23', '京东东城国际北区', '市南区', '140', '5室三厅', '新', '260', '海滨圣府', '0.0000000000', '0.0000000000', '0', '', '', '18000', '', '商业', '/images/10.jpg');
INSERT INTO `t_house` VALUES ('24', '天猫东城国际北区', '城阳区', '60', '1室一厅', '新', '100', '高铁沿线', '0.0000000000', '0.0000000000', '0', '', '', '16666', '', '写字楼', '/images/9.jpg');
INSERT INTO `t_house` VALUES ('25', '淘宝东城国际北区', '黄岛区', '48', '1室一厅', '新', '75', '地处海滨', '0.0000000000', '0.0000000000', '0', '', '', '15625', '', '底商', '/images/7.jpg');
INSERT INTO `t_house` VALUES ('26', 'vivo东城国际北区', '胶州区', '125', '3室二厅', '新', '189', '中心商业区', '0.0000000000', '0.0000000000', '0', '', '', '15520', '', '住宅', '/images/11.jpg');
INSERT INTO `t_house` VALUES ('27', 'oppo东城国际北区', '平度区', '155', '4室二厅', '新', '325', '地段繁华', '0.0000000000', '0.0000000000', '0', '', '', '20000', '', '别墅', '/images/10.jpg');
INSERT INTO `t_house` VALUES ('28', '小米东城国际北区', '李沧区', '202', '5室四厅', '新', '520', '靠近地铁', '0.0000000000', '0.0000000000', '0', '', '', '25700', '', '商业', '/images/9.jpg');
INSERT INTO `t_house` VALUES ('29', '锤子东城国际北区', '即墨区', '50', '1室一厅', '新', '95', '靠近地铁', '0.0000000000', '0.0000000000', '0', '', '', '19000', '', '写字楼', '/images/7.jpg');
INSERT INTO `t_house` VALUES ('30', '华为东城国际北区', '莱西区', '103', '2室二厅', '新', '110', '靠近地铁', '0.0000000000', '0.0000000000', '0', '', '', '11260', '', '底商', '/images/11.jpg');
INSERT INTO `t_house` VALUES ('31', '华为东城国际北区', '莱西区', '103', '2室二厅', '新', '116', '靠近地铁', '0.0000000000', '0.0000000000', '0', '', '', '10000', '', '住宅', '/images/10.jpg');
INSERT INTO `t_house` VALUES ('33', '水木清华', '黄岛区', '550', '2室1厅', '二手', '5000', '地处海滨', '120.0000000000', '36.0000000000', '1', '山东省', '青岛市', '2018/6/12', '1111', null, '/images/5/6/847f912b06514f3cae25d12ad76bf2a1_10.jpg');
INSERT INTO `t_house` VALUES ('38', '111', '李沧区', '200', '3室1厅', '二手', '2000', '高铁沿线', '120.4219220000', '36.1466900000', '3', '山东省', '青岛市', '2018/6/12', '55555', null, '/images/5/6/a590ea32ff9d4e438cbfa35ea0e86413_10.jpg');
INSERT INTO `t_house` VALUES ('39', '宝龙国际社区', '崂山区', '150', '3室1厅', '二手', '200', '高铁沿线', '120.4357200000', '36.1445920000', '2', '山东省', '青岛市', '2018/6/21', '南北通透，冬暖夏凉，适合中产阶级购买居住', null, '/images/5/6/db5d9521e33042a0baca2e5e3defa4ec_10.jpg');
INSERT INTO `t_house` VALUES ('40', '万科魅力之城', '市南区', '160', '3室2厅', '二手', '350', '地段繁华', '120.3788030000', '36.0914120000', '2', '山东省', '青岛市', '2018/6/21', '南北通透，冬暖夏凉，适合中产阶级购买居住', null, '/images/5/6/507069fe58ee465b86d4ce9a732a4190_10.jpg');
INSERT INTO `t_house` VALUES ('41', '颐山园树', '市北区', '120', '3室1厅', '二手', '250', '依山傍水', '120.3885770000', '36.0965450000', '2', '山东省', '青岛市', '2018/6/21', '南北通透，冬暖夏凉，适合中产阶级购买居住', null, '/images/5/6/3ebd6b75e2d64e838af6d820178422bb_10.jpg');

-- ----------------------------
-- Table structure for t_liker
-- ----------------------------
DROP TABLE IF EXISTS `t_liker`;
CREATE TABLE `t_liker` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NOT NULL,
  `h_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  `b_name` varchar(255) NOT NULL,
  `b_telephone` varchar(255) NOT NULL,
  `b_message` varchar(255) NOT NULL,
  `b_gender` varchar(255) NOT NULL,
  `h_url` varchar(255) NOT NULL,
  `h_name` varchar(255) NOT NULL,
  `h_RB` varchar(255) NOT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_liker
-- ----------------------------
INSERT INTO `t_liker` VALUES ('1', '1', '1', '1', '王数', '13853256198', '785263911@qq.com', 'male', '/images/9,jpg', '海尔东城国际北区', '租');
INSERT INTO `t_liker` VALUES ('2', '1', '1', '1', '周国华', '15263985632', '785263911@qq.com', 'male', '/images/10,jpg', '海信国际社区', '租');
INSERT INTO `t_liker` VALUES ('3', '1', '1', '1', '刘莎', '13954826539', '1015523362@qq.com', 'female', '/images/11.jpg', '水木清园', '租');

-- ----------------------------
-- Table structure for t_saler
-- ----------------------------
DROP TABLE IF EXISTS `t_saler`;
CREATE TABLE `t_saler` (
  `s_id` int(255) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(255) NOT NULL,
  `s_password` varchar(255) NOT NULL,
  `s_username` varchar(255) NOT NULL,
  `s_age` int(255) NOT NULL,
  `s_telephone` varchar(255) NOT NULL,
  `s_gender` varchar(255) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_saler
-- ----------------------------
INSERT INTO `t_saler` VALUES ('1', '章子怡', '123', '123', '70', '15263985632', '男');
INSERT INTO `t_saler` VALUES ('2', '张合', '1', '123', '59', '15263985632', '男');
INSERT INTO `t_saler` VALUES ('3', '李觏', '1', '1', '35', '15263985632', '男');
