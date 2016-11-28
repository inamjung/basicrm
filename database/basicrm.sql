/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : basicrm

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2016-11-28 16:13:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `properties` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`) USING BTREE,
  KEY `idx-auth_item-type` (`type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for clinics
-- ----------------------------
DROP TABLE IF EXISTS `clinics`;
CREATE TABLE `clinics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT 'ความเสี่ยงด้าน',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ความเสี่ยงด้าน';

-- ----------------------------
-- Records of clinics
-- ----------------------------
INSERT INTO `clinics` VALUES ('1', 'ความเสี่ยงทั่วไป');
INSERT INTO `clinics` VALUES ('2', 'ความเสี่ยงด้านคลินิกทั่วไป');
INSERT INTO `clinics` VALUES ('3', 'ความเสี่ยงด้านคลินิกเฉพาะโรค');

-- ----------------------------
-- Table structure for degrees
-- ----------------------------
DROP TABLE IF EXISTS `degrees`;
CREATE TABLE `degrees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'ระดับ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='ระดับ';

-- ----------------------------
-- Records of degrees
-- ----------------------------
INSERT INTO `degrees` VALUES ('1', 'ข้าราชการ');
INSERT INTO `degrees` VALUES ('2', 'ลูกจ้างประจำ');
INSERT INTO `degrees` VALUES ('3', 'พนักงานราชการ');
INSERT INTO `degrees` VALUES ('4', 'พกส(นักเรียนทุน)');
INSERT INTO `degrees` VALUES ('5', 'พกส(ลูกจ้างชั่วคราว)');
INSERT INTO `degrees` VALUES ('6', 'ลูกจ้างเหมาบริการ');
INSERT INTO `degrees` VALUES ('7', 'ลูกจ้างชั่วคราว');

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL COMMENT 'หน่วยงาน',
  `nameeng` varchar(10) DEFAULT NULL COMMENT 'แผนก',
  `group_id` int(11) DEFAULT NULL COMMENT 'กลุ่มงาน',
  `total` int(11) DEFAULT '0',
  `total_Y` int(11) DEFAULT '0',
  `total_N` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='หน่วยงาน';

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', 'ตึกผู้ป่วยใน(IPD)', 'IPD', '3', '0', '0', '0');
INSERT INTO `departments` VALUES ('2', 'ทันตกรรม', 'DENT', '6', '0', '0', '0');
INSERT INTO `departments` VALUES ('3', 'บริหารทั่วไป', 'MANANG', '2', '0', '0', '0');
INSERT INTO `departments` VALUES ('4', 'ผู้ป่วยนอก(OPD)', 'OPD', '3', '0', '0', '0');
INSERT INTO `departments` VALUES ('5', 'ห้องคลอด', 'LR', '3', '0', '0', '0');
INSERT INTO `departments` VALUES ('6', 'คอมพิวเตอร์(IT)', 'IT', '7', '0', '0', '0');
INSERT INTO `departments` VALUES ('7', 'อุบัติเหตุฉุกเฉิน (ER)', 'ER', '3', '0', '0', '0');
INSERT INTO `departments` VALUES ('8', 'เวชระเบียน', 'STAT', '7', '0', '0', '0');
INSERT INTO `departments` VALUES ('9', 'ศูนย์เปล', 'PAE', '3', '0', '0', '0');
INSERT INTO `departments` VALUES ('10', 'ชันสูตร/LAB', 'LAB', '4', '0', '0', '0');
INSERT INTO `departments` VALUES ('11', 'เภสัชกรรม', 'PHAR', '5', '0', '0', '0');
INSERT INTO `departments` VALUES ('13', 'X-Ray', 'XRAY', '4', '0', '0', '0');
INSERT INTO `departments` VALUES ('14', 'แพทย์แผนไทย', 'TTM', '8', '0', '0', '0');
INSERT INTO `departments` VALUES ('15', 'การเงินและบัญชี', 'ACCOUNT', '2', '0', '0', '0');
INSERT INTO `departments` VALUES ('16', 'ธุรการ', 'TURAKAN', '2', '0', '0', '0');
INSERT INTO `departments` VALUES ('17', 'PCU', 'PCU', '8', '0', '0', '0');
INSERT INTO `departments` VALUES ('19', 'คลีนิกเรื้อรัง', 'CLINIC', '3', '0', '0', '0');
INSERT INTO `departments` VALUES ('23', 'ยานพาหนะและรักษาความปลอดภัย', 'CAR', '2', '0', '0', '0');
INSERT INTO `departments` VALUES ('25', 'จ่ายกลาง', 'SUPPLY', '3', '0', '0', '0');
INSERT INTO `departments` VALUES ('26', 'โรงครัว', 'FOOD', '4', '0', '0', '0');
INSERT INTO `departments` VALUES ('27', 'ซักฟอก', 'CLEAN', '3', '0', '0', '0');
INSERT INTO `departments` VALUES ('28', 'องค์กรแพทย์', 'DOCTOR', '1', '0', '0', '0');
INSERT INTO `departments` VALUES ('29', 'ซ่อมบำรุง', 'REPAIR', '2', '0', '0', '0');
INSERT INTO `departments` VALUES ('31', 'บ่อบำบัด', 'POND', '2', '0', '0', '0');
INSERT INTO `departments` VALUES ('33', 'โสตและสื่อ', 'SOD', '7', '0', '0', '0');
INSERT INTO `departments` VALUES ('34', 'ประกันสุขภาพ', 'ICT', '7', '0', '0', '0');
INSERT INTO `departments` VALUES ('35', 'งานการเจ้าหน้าที่', 'PERSON', '2', '0', '0', '0');
INSERT INTO `departments` VALUES ('36', 'ห้องผ่าตัด', 'OPER', '3', '0', '0', '0');
INSERT INTO `departments` VALUES ('37', 'พัสดุและงานสวน', 'PASADU', '2', '0', '0', '0');
INSERT INTO `departments` VALUES ('38', 'กายภาพบำบัด', 'PHYSICAL', '8', '0', '0', '0');
INSERT INTO `departments` VALUES ('39', 'คลังเวชภัณฑ์ไม่ใช่ยา', 'GEN', '3', '0', '0', '0');
INSERT INTO `departments` VALUES ('41', 'ห้องให้คำปรึกษา(COU)', 'COU', '3', '0', '0', '0');
INSERT INTO `departments` VALUES ('44', 'กลุ่มการพยาบาล', 'NURSE', '3', '0', '0', '0');
INSERT INTO `departments` VALUES ('45', 'งานเคหะสถาน(แม่บ้าน)', 'HOUSE', '2', '0', '0', '0');

-- ----------------------------
-- Table structure for departments_risk
-- ----------------------------
DROP TABLE IF EXISTS `departments_risk`;
CREATE TABLE `departments_risk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL COMMENT 'หน่วยงาน',
  `nameeng` varchar(10) DEFAULT NULL COMMENT 'แผนก',
  `group_id` int(11) DEFAULT NULL COMMENT 'กลุ่มงาน',
  `total` int(11) DEFAULT '0',
  `total_Y` int(11) DEFAULT '0',
  `total_N` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='หน่วยงาน';

-- ----------------------------
-- Records of departments_risk
-- ----------------------------
INSERT INTO `departments_risk` VALUES ('1', 'ตึกผู้ป่วยใน(IPD)', 'IPD', '3', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('2', 'ทันตกรรม', 'DENT', '6', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('3', 'บริหารทั่วไป', 'MANANG', '2', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('4', 'ผู้ป่วยนอก(OPD)', 'OPD', '3', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('5', 'ห้องคลอด', 'LR', '3', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('6', 'คอมพิวเตอร์(IT)', 'IT', '7', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('7', 'อุบัติเหตุฉุกเฉิน (ER)', 'ER', '3', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('8', 'เวชระเบียน', 'STAT', '7', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('9', 'ศูนย์เปล', 'PAE', '3', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('10', 'ชันสูตร/LAB', 'LAB', '4', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('11', 'เภสัชกรรม', 'PHAR', '5', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('13', 'X-Ray', 'XRAY', '4', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('14', 'แพทย์แผนไทย', 'TTM', '8', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('15', 'การเงินและบัญชี', 'ACCOUNT', '2', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('16', 'ธุรการ', 'TURAKAN', '2', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('17', 'PCU', 'PCU', '8', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('19', 'คลีนิกเรื้อรัง', 'CLINIC', '3', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('23', 'ยานพาหนะและรักษาความปลอดภัย', 'CAR', '2', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('25', 'จ่ายกลาง', 'SUPPLY', '3', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('26', 'โรงครัว', 'FOOD', '4', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('27', 'ซักฟอก', 'CLEAN', '3', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('28', 'องค์กรแพทย์', 'DOCTOR', '1', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('29', 'ซ่อมบำรุง', 'REPAIR', '2', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('31', 'บ่อบำบัด', 'POND', '2', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('33', 'โสตและสื่อ', 'SOD', '7', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('34', 'ประกันสุขภาพ', 'ICT', '7', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('35', 'งานการเจ้าหน้าที่', 'PERSON', '2', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('36', 'ห้องผ่าตัด', 'OPER', '3', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('37', 'พัสดุและงานสวน', 'PASADU', '2', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('38', 'กายภาพบำบัด', 'PHYSICAL', '8', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('39', 'คลังเวชภัณฑ์ไม่ใช่ยา', 'GEN', '3', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('41', 'ห้องให้คำปรึกษา(COU)', 'COU', '3', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('44', 'กลุ่มการพยาบาล', 'NURSE', '3', '0', '0', '0');
INSERT INTO `departments_risk` VALUES ('45', 'งานเคหะสถาน(แม่บ้าน)', 'HOUSE', '2', '0', '0', '0');

-- ----------------------------
-- Table structure for levels
-- ----------------------------
DROP TABLE IF EXISTS `levels`;
CREATE TABLE `levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL COMMENT 'ระดับความรุนแรง',
  `namecode` varchar(5) DEFAULT NULL COMMENT 'รหัสระดับ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='ระดับความรุนแรง';

-- ----------------------------
-- Records of levels
-- ----------------------------
INSERT INTO `levels` VALUES ('1', '1-อุบัติการณ์ที่ยังไม่เกิด/เกิดขึ้นแต่ยังไม่ถึงตัวผู้ป่วย  แต่อาจก่อให้เกิดผลกระทบต่อองค์กร (1-3,000 บาท )', '01');
INSERT INTO `levels` VALUES ('2', '2-อุบัติการณ์รุนแรงน้อยถึงปานกลาง เกิดขึ้นนแล้วมีผลต่อผู้ป่วย/ องค์กร แต่ยังไม่อันตรายสามารถแก้ไขได้เอง ( 3,001-6,000 บาท )', '02');
INSERT INTO `levels` VALUES ('3', '3-อุบัติการณ์รุนแรงมาก มีผลกระทบต่อผู้ป่วย/ องค์กร ทำให้ต้องเฝ้าระวัง/ให้การรักษาเพิ่มเติม/ ทำให้เสียชื่อเสียง ( 6,001 - 9,000 บาท)', '03');
INSERT INTO `levels` VALUES ('4', '4-อุบัติการณ์ที่ก่อให้เกิดความเสียหายต่อทรัพย์สินหรือชื่อเสียง รพ.อย่างรุนแรง ไม่สามารถแก้ไขได้/ ฟ้องร้อง (  > 10,000 บาท )', '04');
INSERT INTO `levels` VALUES ('5', 'A-เหตุการณ์หรือความคลาดเคลื่อนที่ยังไม่เกิดขึ้น แต่มีโอกาศก่อให้เกิดผลกระทบต่อองค์กร (เกือบพลาด)', 'A');
INSERT INTO `levels` VALUES ('6', 'B-มีอุบัติการณ์เกิดขี้น ยังไม่ถึงตัวบุคคล ไม่เสียหายต่อผู้ป่วย เจ้าหน้าที่ ทรัพย์สิน ชื่อเสียง', 'B');
INSERT INTO `levels` VALUES ('7', 'C-มีอุบัติการณ์เกิดขี้น ถึงตัวบุคคล ไม่เสียหายต่อผู้ป่วย เจ้าหน้าที่ ทรัพย์สิน ชื่อเสียง', 'C');
INSERT INTO `levels` VALUES ('8', 'D-มีอุบัติการณ์เกิดขี้น ถึงตัวบุคคล ไม่เสียหายต่อผู้ป่วย แต่ต้องติดตามเฝ้าระวัง/ดูแลอาการต่อเนื่อง', 'D');
INSERT INTO `levels` VALUES ('9', 'E-มีอุบัติการณ์เกิดขี้น เสียหายต่อผู้ป่วยชั่วคราว ต้องดูแลรักษาเพิ่มเติม', 'E');
INSERT INTO `levels` VALUES ('10', 'F-มีอุบัติการณ์เกิดขี้น เสียหายต่อผู้ป่วย ต้องนอนโรงพยาบาลนานขึ้น / Refer', 'F');
INSERT INTO `levels` VALUES ('11', 'G-มีอุบัติการณ์เกิดขี้น เสียหายต่อผู้ป่วยเกิดความพิการ อันตรายถาวร', 'G');
INSERT INTO `levels` VALUES ('12', 'H-มีอุบัติการณ์เกิดขี้น ผู้ป่วยเกือบเสียชีวิต ต้องช่วย CPR', 'H');
INSERT INTO `levels` VALUES ('13', 'I-มีอุบัติการณ์เกิดขี้น ผู้ป่วยเสียชีวิต', 'I');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration
-- ----------------------------

-- ----------------------------
-- Table structure for positions
-- ----------------------------
DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT 'ตำแหน่ง',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='กลุ่มตำแหน่ง';

-- ----------------------------
-- Records of positions
-- ----------------------------
INSERT INTO `positions` VALUES ('1', 'พยาบาลวิชาชีพ');
INSERT INTO `positions` VALUES ('2', 'จพ.ทันตสาธารณสุข');
INSERT INTO `positions` VALUES ('3', 'จพ.ธุรการ');
INSERT INTO `positions` VALUES ('4', 'ทันตแพทย์');
INSERT INTO `positions` VALUES ('5', 'นักวิชาการสาธารณสุข');
INSERT INTO `positions` VALUES ('6', 'นายแพทย์');
INSERT INTO `positions` VALUES ('7', 'เภสัชกร');
INSERT INTO `positions` VALUES ('8', 'จพ.โสตทัศนศึกษา');
INSERT INTO `positions` VALUES ('9', 'จพ.เภสัชกรรม');
INSERT INTO `positions` VALUES ('10', 'จพ.สาธารณสุขชุมชน');
INSERT INTO `positions` VALUES ('11', 'จพ.เวชกิจฉุกเฉิน');
INSERT INTO `positions` VALUES ('12', 'จพ.การเงินและบัญชี');
INSERT INTO `positions` VALUES ('13', 'จพ.เวชสถิติ');
INSERT INTO `positions` VALUES ('14', 'พนักงานช่วยเหลือคนไข้');
INSERT INTO `positions` VALUES ('15', 'นักกายภาพบำบัด');
INSERT INTO `positions` VALUES ('16', 'นักแพทย์แผนไทย');
INSERT INTO `positions` VALUES ('17', 'จนท.บันทึกข้อมูล');
INSERT INTO `positions` VALUES ('18', 'พนักงานเปล');
INSERT INTO `positions` VALUES ('19', 'นักเทคนิคการแพทย์');
INSERT INTO `positions` VALUES ('20', 'จพ.รังสีการแพทย์');
INSERT INTO `positions` VALUES ('21', 'นักวิชาการคอมพิวเตอร์');
INSERT INTO `positions` VALUES ('22', 'พนักงานขับรถยนต์');
INSERT INTO `positions` VALUES ('23', 'พนักงานทำความสะอาด');
INSERT INTO `positions` VALUES ('24', 'พนักงานรักษาความปลอดภัย');
INSERT INTO `positions` VALUES ('25', 'พนักงานสถิติ');
INSERT INTO `positions` VALUES ('26', 'จพง.เผยแพร่และประชาสัมพันธ์');
INSERT INTO `positions` VALUES ('27', 'ช่างไฟฟ้าและอิเล็กทรอนิกส์');
INSERT INTO `positions` VALUES ('28', 'พนักงานห้องบัตร');
INSERT INTO `positions` VALUES ('29', 'พนักงานธุรการ');
INSERT INTO `positions` VALUES ('30', 'คนครัว');
INSERT INTO `positions` VALUES ('31', 'นักการภารโรง');
INSERT INTO `positions` VALUES ('32', 'จพ.งานสิทธิบัตร');
INSERT INTO `positions` VALUES ('33', 'จพ.พัสดุ');
INSERT INTO `positions` VALUES ('34', 'นักวิชาการการเงินและบัญชี');
INSERT INTO `positions` VALUES ('35', 'พนักงานบริการ');
INSERT INTO `positions` VALUES ('36', 'จพ.วิทยาศาสตร์การแพทย์');
INSERT INTO `positions` VALUES ('37', 'คนงาน');
INSERT INTO `positions` VALUES ('38', 'พนักงานทั่วไป');
INSERT INTO `positions` VALUES ('39', 'พนักงานพยาบาล');
INSERT INTO `positions` VALUES ('40', 'พนักงานช่วยการพยาบาล');
INSERT INTO `positions` VALUES ('41', 'ผู้ช่วยแพทย์แผนไทย');
INSERT INTO `positions` VALUES ('42', 'พนักงานห้องผ่าตัด');
INSERT INTO `positions` VALUES ('43', 'พนักงานบริการอัดสำเนา');
INSERT INTO `positions` VALUES ('44', 'นักวิชาการพัสดุ');
INSERT INTO `positions` VALUES ('45', 'พนักงานห้องยา');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('1', null, null, null, null, null, null, null);
INSERT INTO `profile` VALUES ('2', null, null, null, null, null, null, null);
INSERT INTO `profile` VALUES ('3', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for programes
-- ----------------------------
DROP TABLE IF EXISTS `programes`;
CREATE TABLE `programes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'โปรแกรมความเสี่ยง',
  `clinic_id` int(11) NOT NULL COMMENT 'คลินิก',
  PRIMARY KEY (`id`),
  KEY `fk_programes_clinics1_idx` (`clinic_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='โปรแกรมความเสี่ยง';

-- ----------------------------
-- Records of programes
-- ----------------------------
INSERT INTO `programes` VALUES ('1', '1.โปรแกรมด้านสิ่งแวดล้อม อาชีวอนามัยและความปลอดภัย ', '1');
INSERT INTO `programes` VALUES ('2', '2.โปรแกรมด้านการเงินและบัญชี', '1');
INSERT INTO `programes` VALUES ('3', '3.โปรแกรมด้านเวชระเบียนและงานประกันสุขภาพ', '1');
INSERT INTO `programes` VALUES ('4', '4.โปรแกรมด้านการจัดการความเสี่ยง', '1');
INSERT INTO `programes` VALUES ('5', '5.โปรแกรมด้านเครื่องมือและอุปกรณ์', '1');
INSERT INTO `programes` VALUES ('6', '6.โปรแกรมด้านสิทธิผู้ป่วยและจริยธรรมองค์กร', '1');
INSERT INTO `programes` VALUES ('7', '7.โปรแกรมด้านเทคโนโลยีสารสนเทศ ', '1');
INSERT INTO `programes` VALUES ('9', '9.โปรแกรมด้านการใช้ยา', '2');
INSERT INTO `programes` VALUES ('10', '10.โปรแกรมด้านการเฝ้าระวังป้องกันและควบคุมการติดเชื้อ', '2');
INSERT INTO `programes` VALUES ('11', '11.โปรแกรมด้านคลินิก', '2');
INSERT INTO `programes` VALUES ('12', '12.PCT อายุรกรรม STEMI', '3');
INSERT INTO `programes` VALUES ('13', '13.PCT อายุรกรรม DM', '3');
INSERT INTO `programes` VALUES ('14', '14.PCT อายุรกรรม Stroke', '3');
INSERT INTO `programes` VALUES ('16', '15.PCT อายุรกรรม HT', '3');
INSERT INTO `programes` VALUES ('17', '16.PCT อายุรกรรม CKD', '3');
INSERT INTO `programes` VALUES ('18', '17.PCT อายุรกรรม Sepsis', '3');
INSERT INTO `programes` VALUES ('19', '18. PCT สูติกรรม', '3');

-- ----------------------------
-- Table structure for riskreports
-- ----------------------------
DROP TABLE IF EXISTS `riskreports`;
CREATE TABLE `riskreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL COMMENT 'วันที่เกิด',
  `clinic_id` int(11) DEFAULT NULL COMMENT 'คลินิก',
  `programe_id` int(11) DEFAULT NULL COMMENT 'โปรแกรม',
  `risktype_id` int(11) DEFAULT NULL COMMENT 'รายการ',
  `name` mediumtext COMMENT 'เหตุการณ์',
  `description` mediumtext COMMENT 'สาเหตุ',
  `namecode` varchar(5) NOT NULL COMMENT 'ระดับความรุนแรง',
  `sufferer` varchar(20) DEFAULT NULL COMMENT 'ผู้เสียหาย',
  `edit` varchar(6) DEFAULT NULL COMMENT 'การแก้ไขเบื้องต้น',
  `user_id_report` int(11) NOT NULL COMMENT 'ผู้แจ้ง',
  `department_id` int(11) NOT NULL COMMENT 'หน่วยงานที่แจ้ง',
  `department_id_risk` int(11) NOT NULL COMMENT 'พื้นที่เกิด',
  `edit_begin` mediumtext COMMENT 'แก้ไขเบื้องต้น',
  `money` decimal(11,2) DEFAULT NULL COMMENT 'ค่าใช้จ่าย',
  `moneydetail` varchar(500) DEFAULT NULL COMMENT 'รายการค่าใช้จ่าย',
  `how` varchar(20) DEFAULT NULL COMMENT 'แหล่งที่มา',
  `review` smallint(6) DEFAULT '0' COMMENT 'การทบทวน',
  `reviewdate` date DEFAULT NULL COMMENT 'วันที่ทบทวน',
  `reviewdetail` mediumtext COMMENT 'รายละเอียดที่ทบทวน',
  `reviewteam` varchar(255) DEFAULT NULL COMMENT 'ผู้ร่วมทบทวน',
  `approve` smallint(6) DEFAULT NULL COMMENT 'APPROVE',
  `qaapprove` smallint(6) DEFAULT NULL COMMENT 'ทีมรับทราบ',
  `review_in` varchar(20) DEFAULT NULL COMMENT 'วิธีการแก้ไข/ทบทวน',
  `review_by` varchar(255) DEFAULT NULL COMMENT 'ข้อสั่งการเพื่อแก้ไข/ทบทวนความเสี่ยง',
  `review_dateline` date DEFAULT NULL COMMENT 'กำหนด ทบทวน/แก้ไขภายใน',
  `qateam` varchar(6) DEFAULT NULL COMMENT 'ทีมคร่อม',
  `username` varchar(255) NOT NULL COMMENT 'ผู้บันทึก',
  `covenant` varchar(255) DEFAULT NULL COMMENT 'เอกสาร',
  `docs` text COMMENT 'เอกสา/รูปอ้างอิง',
  `ref` varchar(50) DEFAULT NULL COMMENT 'หลายเลข referent สำหรับอัพโหลดไฟล์ ajax',
  `complete` smallint(6) DEFAULT NULL COMMENT 'COMPLETE',
  `createDate` date DEFAULT NULL COMMENT 'วันที่บันทึก',
  `updateDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_riskreports_user_details2_idx` (`user_id_report`) USING BTREE,
  KEY `fk_riskreports_levels1_idx` (`namecode`) USING BTREE,
  KEY `fk_riskreports_clinics1_idx` (`clinic_id`) USING BTREE,
  KEY `fk_riskreports_programes1_idx` (`programe_id`) USING BTREE,
  KEY `fk_riskreports_risktypes1_idx` (`risktype_id`) USING BTREE,
  KEY `fk_riskreports_departments1_idx` (`department_id_risk`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='บันทึกความเสี่ยง';

-- ----------------------------
-- Records of riskreports
-- ----------------------------
INSERT INTO `riskreports` VALUES ('1', '2016-11-27', '1', '2', '836', 'dfgdfg', 'dfgdfg', '03', 'ผู้ป่วย', 'ได้', '1', '3', '2', 'hjkhj', '5.00', '', 'โปรแกรม', '1', null, '', '', null, null, '', '', null, '', '1', null, null, null, null, null, '2016-11-27 14:09:16');
INSERT INTO `riskreports` VALUES ('2', '2016-11-26', '3', '13', '983', 'rr11', 'rr', 'A', '', 'ไม่ได้', '2', '2', '2', '', null, '', 'โปรแกรม', '0', null, '', '', '0', '0', '', '', null, '', '1', null, null, null, '0', null, '2016-11-27 20:22:07');
INSERT INTO `riskreports` VALUES ('3', '2016-11-23', '2', '10', '958', 'oo', 'oo', '03', 'เจ้าหน้าที่', 'ไม่ได้', '2', '2', '3', '', null, '', 'โปรแกรม', '0', null, '', '', '0', '0', '', '', null, '', '1', null, null, null, '0', '2016-11-27', '2016-11-27 21:05:50');
INSERT INTO `riskreports` VALUES ('4', '2016-11-21', null, null, null, 'hosxpใช้งานไม่ได้', 'ไฟดับ', '02', 'ผู้ป่วย', 'ได้', '1', '6', '6', '', null, '', 'โปรแกรม', '0', null, '', '', '0', '0', null, null, null, null, 'user', null, null, null, '0', '2016-11-27', null);

-- ----------------------------
-- Table structure for risktypes
-- ----------------------------
DROP TABLE IF EXISTS `risktypes`;
CREATE TABLE `risktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL COMMENT 'รายการความเสี่ยง',
  `programe_id` int(11) NOT NULL COMMENT 'โปรแกรม',
  PRIMARY KEY (`id`),
  KEY `fk_risktypes_programes1_idx` (`programe_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1162 DEFAULT CHARSET=utf8 COMMENT='รายการความเสี่ยง';

-- ----------------------------
-- Records of risktypes
-- ----------------------------
INSERT INTO `risktypes` VALUES ('312', 'amp ยาเสพติดสูญหาย Pethidine', '9');
INSERT INTO `risktypes` VALUES ('313', 'amp ยาเสพติดสูญหาย Morphine', '9');
INSERT INTO `risktypes` VALUES ('314', 'ให้ยาไม่ระบุชื่อคนไข้/ไม่ติดป้าย/สติ๊กเกอร์ยา/การ์ดยา', '9');
INSERT INTO `risktypes` VALUES ('315', 'ไม่ลอกยาลง Med Sheet', '9');
INSERT INTO `risktypes` VALUES ('316', 'ไม่บันทึกการให้ยา', '9');
INSERT INTO `risktypes` VALUES ('317', 'การให้ยาที่เกิดปฏิกิริยาต่อกัน', '9');
INSERT INTO `risktypes` VALUES ('318', 'ยาเสื่อมสภาพ/ยาหมดอายุ/เตรียมยาไว้นานเกินไป', '9');
INSERT INTO `risktypes` VALUES ('319', 'ขาดการติดตามผลหรืออาการผิดปกติหลังให้ยา', '9');
INSERT INTO `risktypes` VALUES ('320', 'การเตรียมยาไม่เหมาะสม เช่น ตัวทำละลายไม่เหมาะสม/ผิดชนิด', '9');
INSERT INTO `risktypes` VALUES ('322', 'การให้ยาผิดเทคนิค', '9');
INSERT INTO `risktypes` VALUES ('985', 'ลอกคำสั่งการใช้ยาเกินคำสั่งแพทย์', '9');
INSERT INTO `risktypes` VALUES ('383', 'การให้ยาผิดรูปแบบ', '9');
INSERT INTO `risktypes` VALUES ('384', 'การให้ยามากครั้งกว่าที่สั่ง', '9');
INSERT INTO `risktypes` VALUES ('385', 'ให้ยาที่ไม่ได้สั่ง เช่น Off แล้วยังให้', '9');
INSERT INTO `risktypes` VALUES ('386', 'ให้ยาผิดคน', '9');
INSERT INTO `risktypes` VALUES ('387', 'ให้ยาผิดเวลา', '9');
INSERT INTO `risktypes` VALUES ('388', 'ให้ยาผิดขนาด', '9');
INSERT INTO `risktypes` VALUES ('389', 'ให้ยาผิดชนิด', '9');
INSERT INTO `risktypes` VALUES ('390', 'ลืมให้ยา', '9');
INSERT INTO `risktypes` VALUES ('391', 'จ่ายยาเกิน', '9');
INSERT INTO `risktypes` VALUES ('392', 'จ่ายยาผิดคน', '9');
INSERT INTO `risktypes` VALUES ('393', 'จ่ายยาผิดชนิด', '9');
INSERT INTO `risktypes` VALUES ('394', 'จ่ายยาไม่ครบจำนวน', '9');
INSERT INTO `risktypes` VALUES ('396', 'จัดยาผิดคน', '9');
INSERT INTO `risktypes` VALUES ('397', 'จัดยาผิดชนิด', '9');
INSERT INTO `risktypes` VALUES ('399', 'จัดยาพิมพ์ซองยาไม่ครบ/ไม่ปริ้นสติีกเกอร์', '9');
INSERT INTO `risktypes` VALUES ('400', 'สั่งยาผิดจำนวน', '9');
INSERT INTO `risktypes` VALUES ('402', 'สั่งยาผิดวิธีใช้', '9');
INSERT INTO `risktypes` VALUES ('403', 'สั่งยาผิดรูปแบบยา', '9');
INSERT INTO `risktypes` VALUES ('404', 'สังยาผิดความแรง', '9');
INSERT INTO `risktypes` VALUES ('405', 'สั่งยาผิดชนิด', '9');
INSERT INTO `risktypes` VALUES ('407', 'สั่งยาไม่ระบุจำนวน', '9');
INSERT INTO `risktypes` VALUES ('408', 'สังยาไม่ระบุวิธีใช้', '9');
INSERT INTO `risktypes` VALUES ('409', 'สั่งยาไม่ระบุความแรง', '9');
INSERT INTO `risktypes` VALUES ('410', 'สั่งยาในขนาดต่ำเกินไป', '9');
INSERT INTO `risktypes` VALUES ('411', 'สั่งยาในขนาดสูงเกินไป', '9');
INSERT INTO `risktypes` VALUES ('412', 'สั่งยาโดยไม่มีข้อบ่งชี้', '9');
INSERT INTO `risktypes` VALUES ('413', 'สั่งยาโดยมีข้อห้ามใช้', '9');
INSERT INTO `risktypes` VALUES ('414', 'สั่งยาที่ผู้ป่วยมีประวัติแพ้', '9');
INSERT INTO `risktypes` VALUES ('415', 'สั่งยาที่เกิดปฏิกิริยาต่อกัน', '9');
INSERT INTO `risktypes` VALUES ('416', 'ห้องยาทำ Copyorder หาย', '9');
INSERT INTO `risktypes` VALUES ('417', 'จัดยาผิดขนาด', '9');
INSERT INTO `risktypes` VALUES ('418', 'ไม่จัดยา', '9');
INSERT INTO `risktypes` VALUES ('420', 'On Lock/ให้ I.V ไม่ติด I.V สีรุ้ง', '9');
INSERT INTO `risktypes` VALUES ('421', 'ยา/เวชภัณฑ์ ไม่พอจ่าย (หมด Stock)', '9');
INSERT INTO `risktypes` VALUES ('423', 'ไม่ได้รับยาตามแผนการรักษา', '9');
INSERT INTO `risktypes` VALUES ('424', 'Copy Order ไม่ชัดเจน', '9');
INSERT INTO `risktypes` VALUES ('984', 'คัดแยกขยะติดเชื้อไม่ถูกต้อง', '10');
INSERT INTO `risktypes` VALUES ('426', 'Copy Order ติด Sticker ผิดคน/ส่ง Copy Order ผิดคน', '9');
INSERT INTO `risktypes` VALUES ('427', 'ไม่ได้ทำ/ไม่ได้ตรวจสอบ/ไม่ได้แจ้งแพทย์ ในระบบ Drug Reconcile', '9');
INSERT INTO `risktypes` VALUES ('428', 'ลอกคำสั่งการใช้ยาผิดคน', '9');
INSERT INTO `risktypes` VALUES ('429', 'จัดยาผิดเวลา', '9');
INSERT INTO `risktypes` VALUES ('986', 'พบขยะติดเชื้อหล่นที่พื้น', '10');
INSERT INTO `risktypes` VALUES ('432', 'ไม่ระบุชื่อผู้ป่วย/เขียนชื่อผู้ป่วยผิดคน ผิดเตียง ในใบสั่งยา/copy odder', '9');
INSERT INTO `risktypes` VALUES ('433', 'จ่ายยาไม่ติดสติ๊กเกอร์ชื่อยา', '9');
INSERT INTO `risktypes` VALUES ('434', 'ลอกคำสั่งใช้ยาผิดชนิด', '9');
INSERT INTO `risktypes` VALUES ('435', 'ลอกคำสั่งใช้ยาผิดขนาด', '9');
INSERT INTO `risktypes` VALUES ('436', 'ลอกคำสั่งใช้ยาผิดวิธีใช้', '9');
INSERT INTO `risktypes` VALUES ('437', 'จัดยาผิดรูปแบบยา', '9');
INSERT INTO `risktypes` VALUES ('438', 'จัดยาไม่ครบรายการ', '9');
INSERT INTO `risktypes` VALUES ('439', 'จัดยาที่แพทย์สั่ง Off ', '9');
INSERT INTO `risktypes` VALUES ('441', 'สั่งยาเดิมไม่ครบรายการ', '9');
INSERT INTO `risktypes` VALUES ('442', 'รายการยาในใบสั่งยา/สมุดประจำตัว ไม่ตรงกับรายการในระบบ HOSxp', '9');
INSERT INTO `risktypes` VALUES ('443', 'ลอกคำสั่งการใช้ยาผิดจำนวน', '9');
INSERT INTO `risktypes` VALUES ('834', 'Lab-การระบุสิ่งส่งตรวจผิด/ไม่ได้ระบุ', '11');
INSERT INTO `risktypes` VALUES ('835', 'เอกสารการเงินผิดพลาด/ไม่ครบ', '2');
INSERT INTO `risktypes` VALUES ('836', 'จ่ายเงินผิด/ซ้ำซ้อน', '2');
INSERT INTO `risktypes` VALUES ('837', 'เครื่องปั่นไฟฟ้าสำรองไม่ทำงาน', '1');
INSERT INTO `risktypes` VALUES ('838', 'Lab-รายงานล่าช้า', '11');
INSERT INTO `risktypes` VALUES ('839', 'lab-ตรวจรายการไม่ครบ/ไม่ถูก/เกิน', '11');
INSERT INTO `risktypes` VALUES ('988', 'ส่งผ้าไม่ครบ/ไม่พร้อมใช้', '10');
INSERT INTO `risktypes` VALUES ('841', 'วัสดุหรือเวชภัณ์ไม่มี/ไม่พร้อมใช้/ชำรุด', '11');
INSERT INTO `risktypes` VALUES ('842', 'Opd Scan ไม่ครบ/หาย', '3');
INSERT INTO `risktypes` VALUES ('843', 'LAB บันทึกผลผิด/ไม่ครบ', '11');
INSERT INTO `risktypes` VALUES ('949', 'คัดกรองล่าช้า/ผิดพลาด', '12');
INSERT INTO `risktypes` VALUES ('844', 'ระบบผลิตและจ่ายน้ำปะปาชำรุด/ผิดปกติ', '1');
INSERT INTO `risktypes` VALUES ('845', 'สิทธิ์การรักษาผิด', '3');
INSERT INTO `risktypes` VALUES ('862', 'ข้อมูลผู้ป่วยไม่เป็นความลับหรือตามระเบียบ', '6');
INSERT INTO `risktypes` VALUES ('847', 'Lab Aert ไม่รายงาน/ไม่ถูกต้อง/ล่าช้า', '11');
INSERT INTO `risktypes` VALUES ('848', 'ระบบ Hoxp มีปัญหาเวลา Print', '7');
INSERT INTO `risktypes` VALUES ('849', 'Lab-รายงานผลผิด/สลับ/ไม่มีผล', '11');
INSERT INTO `risktypes` VALUES ('850', 'อุปกรณ์คอมพิวเตอร์เสื่อมสภาพ/ชำรุด', '7');
INSERT INTO `risktypes` VALUES ('851', 'Lab นอกไม่บันทึก/สูญหาย/ไม่scan/ล่าช้า', '11');
INSERT INTO `risktypes` VALUES ('852', 'บันทึกค่ารักษาผิด/ไม่บันทึก', '3');
INSERT INTO `risktypes` VALUES ('853', 'film X-ray/CT scan เสี่ยงต่อการสูญหาย/หาย', '3');
INSERT INTO `risktypes` VALUES ('854', 'บันทึกVital signไม่ครบ/ผิด', '11');
INSERT INTO `risktypes` VALUES ('855', 'การรับรู้หนี้ผิด/ล่าช้า/ไม่ครบ', '2');
INSERT INTO `risktypes` VALUES ('856', 'ไม่ปฏิบัติตามแนวทางCPG', '11');
INSERT INTO `risktypes` VALUES ('857', 'Lab error/ค่าไม่ตรงกัน/ได้ตรวจซ้ำ', '11');
INSERT INTO `risktypes` VALUES ('858', 'Visitส่งผิดแผนก', '3');
INSERT INTO `risktypes` VALUES ('1067', 'โภชนากร รายชื่อผู้ป่วยรับอาหารซ้ำกัน', '11');
INSERT INTO `risktypes` VALUES ('859', 'นัดผู้ป่วยผิด/นัดไม่ครบ/ลงรายละเอียดไม่ครบ', '11');
INSERT INTO `risktypes` VALUES ('860', 'จัดหาพัสดุหรือเครื่องมือหรืออุปกรณ์ล่าช้า', '5');
INSERT INTO `risktypes` VALUES ('861', 'Lab สั่งรายการตรวจไม่ครบ/ผิด', '11');
INSERT INTO `risktypes` VALUES ('863', 'x-ray การสั่งfilmผิด/สลับ/ไม่ครบ', '11');
INSERT INTO `risktypes` VALUES ('864', 'ชื่อสกุลหรือข้อมูลผู้รับบริการผิด/ไม่ครบ', '3');
INSERT INTO `risktypes` VALUES ('865', 'ขยะติดเชื้อไม่มีที่ทิ้ง/ชำรุด', '10');
INSERT INTO `risktypes` VALUES ('866', 'ผู้ป่วยมาผิดนัด/ขาดนัด', '11');
INSERT INTO `risktypes` VALUES ('867', 'ใบสั่งยาเสี่ยงต่อการสูญหาย', '3');
INSERT INTO `risktypes` VALUES ('868', 'ใบเสร็จผิด/ไม่ครบ/ไม่สมบูรณ์', '2');
INSERT INTO `risktypes` VALUES ('869', 'ผู้ป่วยหนี/ออกนอกบริเณที่สมควร', '11');
INSERT INTO `risktypes` VALUES ('870', 'บันทึกรายการรักษาหรือการให้บริการในระบบHosXPผิด/ไม่ครบ/ไม่บันทึก', '3');
INSERT INTO `risktypes` VALUES ('871', 'ความเข้าใจผิดกันระหว่างเจ้าหน้าที่', '6');
INSERT INTO `risktypes` VALUES ('872', 'ทรัพทย์สินเสียหายจากตัดหญ้าหรือทำสวน', '1');
INSERT INTO `risktypes` VALUES ('873', 'การคัดแยกของแหลมคมไม่ถูกต้อง', '10');
INSERT INTO `risktypes` VALUES ('874', 'oxegenหมด/ไม่เพียงพอ/ไม่พร้อมใช้', '1');
INSERT INTO `risktypes` VALUES ('875', 'ระบบจราจรไม่สะดวก/การจอดรถผิดระเบียบ', '1');
INSERT INTO `risktypes` VALUES ('876', 'บริเวณรับบริการไม่สะอาด/สกปรก/ไม่น่าใช้', '1');
INSERT INTO `risktypes` VALUES ('877', 'หลังคาหรือฝ้าเพดานรั่ว/ชำรุด', '1');
INSERT INTO `risktypes` VALUES ('878', 'แสงสว่างไม่เหมาะสม/ไม่เพียงพอ', '1');
INSERT INTO `risktypes` VALUES ('879', 'แอร์รั่ว/น้ำหยด/ชำรุด/ไม่เย็น', '1');
INSERT INTO `risktypes` VALUES ('880', 'ระบบท่อระบายและขนส่งน้ำเสียชำรุด/เกิดปัญหา', '1');
INSERT INTO `risktypes` VALUES ('881', 'ธุรการ-หนังสือในระบบสารบัญออนไลน์ล่าช้า/สูญหาย', '7');
INSERT INTO `risktypes` VALUES ('883', 'เครื่องมือตรวจวัด/วินิจฉัย ชำรุด/ไม่พร้อมใช้', '5');
INSERT INTO `risktypes` VALUES ('884', 'คัดกรองส่งผู้รับบริการไม่ถูกแผนก/ฝ่าย', '11');
INSERT INTO `risktypes` VALUES ('885', 'ระบบHosXPทำงานคลาดเคลื่อน', '7');
INSERT INTO `risktypes` VALUES ('886', 'ผู้ป่วยDM admit ด้วย Hypoglycemia', '13');
INSERT INTO `risktypes` VALUES ('887', 'เด็กเสียชีวิตในครรภ์', '19');
INSERT INTO `risktypes` VALUES ('888', 'เครื่องใช้ชำรุด/รั่วซึม', '1');
INSERT INTO `risktypes` VALUES ('889', 'ส่งหลักฐานการเงินล่าช้า', '2');
INSERT INTO `risktypes` VALUES ('890', 'ระบบงานไม่พร้อมให้บริการ', '11');
INSERT INTO `risktypes` VALUES ('891', 'เครื่องมือทั่วไปไม่พร้อมใช้/ชำรุด', '5');
INSERT INTO `risktypes` VALUES ('892', 'ห้องประชุมไม่เรียบร้อย/ไม่พร้อมใช้', '1');
INSERT INTO `risktypes` VALUES ('893', 'Lab-ไม่มีเลือด/ไม่พอ', '11');
INSERT INTO `risktypes` VALUES ('894', 'ของแหลมมีคมทิ่มตำ', '10');
INSERT INTO `risktypes` VALUES ('895', 'ชาร์ทผู้ป่วยในส่งสรุปไม่ตรงกับแพทย์', '3');
INSERT INTO `risktypes` VALUES ('896', 'ใบสรุปผู้ป่วยในสรุปการวินิจฉัย/การรักษา/หัตถการ', '3');
INSERT INTO `risktypes` VALUES ('897', 'สอบถามหรือบันทึกประวัติการรักษาผิด/ไม่ครบ', '11');
INSERT INTO `risktypes` VALUES ('898', 'ผู้ป่วยติดเชื้อหลังทำหัตการ/ผ่าตัด', '10');
INSERT INTO `risktypes` VALUES ('817', 'จัดยาผิดจำนวน', '9');
INSERT INTO `risktypes` VALUES ('832', 'ทำยาหาย/ทำยาแตก/ขอยาเพิ่ม', '9');
INSERT INTO `risktypes` VALUES ('899', 'พัสดุ-วัสดุหรือพัสดุไม่ตรงตามความต้องการ', '2');
INSERT INTO `risktypes` VALUES ('900', 'เก็บเงินค่ารักษาตามสิทธิ์ผิด/ไม่ได้เก็บเงิน', '3');
INSERT INTO `risktypes` VALUES ('901', 'รถพยาบาลไม่พร้อมใช้/ชำรุด', '1');
INSERT INTO `risktypes` VALUES ('902', 'ผู้ป่วยไม่ได้รับบริการตามสิทธิ์', '6');
INSERT INTO `risktypes` VALUES ('903', 'รถบริการมาล่าช้า/ไม่มา', '1');
INSERT INTO `risktypes` VALUES ('904', 'เครื่องป้องกันเช่นถุงมือ ไม่พร้อมใช้/ชำรุด', '10');
INSERT INTO `risktypes` VALUES ('906', 'x-ray ล่าช้า', '11');
INSERT INTO `risktypes` VALUES ('907', 'เจ้าหน้ามาปฏิบัติงานล่าช้า', '6');
INSERT INTO `risktypes` VALUES ('908', 'รถบริการเกิดอุบัติเหตุ', '1');
INSERT INTO `risktypes` VALUES ('909', 'อาหารผู้ป่วยในข้อมูลจำนวนไม่ตรงกับจำนวนผู้ป่วยจริง', '11');
INSERT INTO `risktypes` VALUES ('910', 'ให้บริการผู้ป่วยไม่ทัน/รอคอยบริการนาน', '6');
INSERT INTO `risktypes` VALUES ('911', 'สัมผัสสารคัดหลั่ง', '10');
INSERT INTO `risktypes` VALUES ('912', 'เครื่องมือติดไปกับผ้า', '10');
INSERT INTO `risktypes` VALUES ('913', 'อุปกรณ์ใน set sterile ไม่พร้อมใช้', '10');
INSERT INTO `risktypes` VALUES ('914', 'มีสิ่งแปลกปลอมในset sterile', '10');
INSERT INTO `risktypes` VALUES ('915', 'แยกผ้าไม่ถูกต้อง', '10');
INSERT INTO `risktypes` VALUES ('916', 'ปัญหาเกี่ยวกับการใช้งานุปกรณ์เสริมคอมพิวเตอร์', '7');
INSERT INTO `risktypes` VALUES ('917', 'สัญญาณอินเตอร์เน็ตใช้งานไม่ได้ชั่วขณะ', '7');
INSERT INTO `risktypes` VALUES ('918', 'เกิดปัญหาเกี่ยวกับโปรแกรมเสริมที่ใช้ร่วมกับHosxp', '7');
INSERT INTO `risktypes` VALUES ('919', 'ระบบเครื่องแม่ข่ายใช้งานไม่ได้ชั่วขณะ', '7');
INSERT INTO `risktypes` VALUES ('920', 'ปัญหาเกี่ยวกับโปรแกรมออนไลน์ที่งานไอทีเขียนใช้งานเอง', '7');
INSERT INTO `risktypes` VALUES ('921', 'เจ้าหน้าที่ไม่อยู่จุดให้บริการผู้ป่วย', '6');
INSERT INTO `risktypes` VALUES ('922', 'เจ้าหน้าที่ไม่ปฏิบัติตามระเบียบวินัย', '6');
INSERT INTO `risktypes` VALUES ('923', 'ผู้ป่วยไม่ได้รับบริการตามแผนการรักษา', '6');
INSERT INTO `risktypes` VALUES ('924', 'ผู้ป่วยปฏิบัติตัวไม่ถูกต้องตามคำแนะนำของเจ้าหน้าที่                                       ', '6');
INSERT INTO `risktypes` VALUES ('925', 'ผู้ป่วยไม่พึงพอใจบริการ', '6');
INSERT INTO `risktypes` VALUES ('926', 'เจ้าหน้าที่ไม่ปฏิบัติตามแนวทางที่กำหนด', '6');
INSERT INTO `risktypes` VALUES ('927', 'ผุ้ป่วยปฏิเสธแผนการรักษาของแพทย์(ไม่ฉีดยา)', '6');
INSERT INTO `risktypes` VALUES ('928', 'เจ้าหน้าที่ไม่ตรวจสอบ วัสดุหมดอายุ', '6');
INSERT INTO `risktypes` VALUES ('987', 'พบของปราศจากเชื้อหมดอายุในหน่วยงาน', '10');
INSERT INTO `risktypes` VALUES ('930', 'สัญญาณชีพผิดปกติหรือเปลี่ยนแปลงขณะทำหัตถการ', '11');
INSERT INTO `risktypes` VALUES ('931', 'หัตถการมีภาวะแทรกซ้อนที่ไม่ใช่การติดเชื้อ', '10');
INSERT INTO `risktypes` VALUES ('932', 'เสี่ยงต่อการได้รับบาดเจ็บหรือของมีคมทิ่มตำ', '10');
INSERT INTO `risktypes` VALUES ('933', 'heplock ไม่ได้เอาออก/ไม่ได้เปลี่ยน', '10');
INSERT INTO `risktypes` VALUES ('934', 'LAB เลือดไม่ตรง/ระบุข้อมูลผิดหรือไม่ครบ', '11');
INSERT INTO `risktypes` VALUES ('935', 'การประสานงานหน่วยงานภายนอกผิดพลาด', '6');
INSERT INTO `risktypes` VALUES ('936', 'ข้อมูลในชาร์ทผู้ป่วยสลับ/ไม่ครบ/ไม่ถูกต้อง', '3');
INSERT INTO `risktypes` VALUES ('937', 'บันทึกข้อมูลน้ำหนักส่วนสูงผู้ป่วยผิด', '3');
INSERT INTO `risktypes` VALUES ('938', 'ส่งผู้ป่วยรับการตรวจวินิจฉัยหรือหัตถการผิดคน', '11');
INSERT INTO `risktypes` VALUES ('939', 'ประเมินการเคลื่อนย้ายไม่เหมาะสม', '11');
INSERT INTO `risktypes` VALUES ('940', 'ตกเลือดหลังคลอด', '19');
INSERT INTO `risktypes` VALUES ('941', 'ผู้ป่วยตกเตียง', '11');
INSERT INTO `risktypes` VALUES ('942', 'รกค้าง(no PPH)', '19');
INSERT INTO `risktypes` VALUES ('943', 'เจ็บครรภ์คลอกก่อนกำหนด', '19');
INSERT INTO `risktypes` VALUES ('944', 'เด็กแรกเกิดน้ำหนักต่ำกว่าเกณฑ์', '19');
INSERT INTO `risktypes` VALUES ('945', 'ANC ไม่ครบ/ไม่ถูกต้อง', '19');
INSERT INTO `risktypes` VALUES ('946', 'เสี่ยงต่อภาวะHypoglycemia', '13');
INSERT INTO `risktypes` VALUES ('948', 'LAB การเก็บสิ่งส่งตรวจไม่ถูกต้อง', '11');
INSERT INTO `risktypes` VALUES ('950', 'ผู้ปวยมีอาการวิกฤติระหว่างรอตรวจ', '11');
INSERT INTO `risktypes` VALUES ('951', 'อาหาร-จ่ายผิด/ไม่ครบ', '11');
INSERT INTO `risktypes` VALUES ('952', 'อาหาร-สั่งอาหารผิด/ไม่ครบ', '11');
INSERT INTO `risktypes` VALUES ('953', 'ผู้ป่วยเสียชีวิตก่อนมาถึง รพ.', '11');
INSERT INTO `risktypes` VALUES ('954', 'refer ผิดแผนก/ผิดวัน/ผิดสถานบริการ', '11');
INSERT INTO `risktypes` VALUES ('955', 'X-ray ถ่ายผิดท่า/ไม่ถ่าย/ไม่ชัด', '11');
INSERT INTO `risktypes` VALUES ('956', 'foley ของผู้ป่วยตัน/ชำรุด/ใช้การไม่ได้', '10');
INSERT INTO `risktypes` VALUES ('957', 'foley ไม่ได้เปลี่ยนตามกำหนด', '9');
INSERT INTO `risktypes` VALUES ('958', 'foley ไม่ได้เปลี่ยนตามกำหนด', '10');
INSERT INTO `risktypes` VALUES ('959', 'สมุดประจำตัว บันทึกผิด/ไม่บันทึก', '3');
INSERT INTO `risktypes` VALUES ('960', 'refer คนไข้ผู้ป่วยในได้refer', '11');
INSERT INTO `risktypes` VALUES ('961', 'ใบนัด ผิด/ไม่ครบ', '3');
INSERT INTO `risktypes` VALUES ('962', 'ใบrefer หาย/ผิด/ลงรายละเอีดไม่่ครบ', '3');
INSERT INTO `risktypes` VALUES ('963', 'ลงวินิจฉัยผิด/ไม่ครบ/สลับ/ไม่ได้ลง', '3');
INSERT INTO `risktypes` VALUES ('964', 'ประวัติการรักษาในHosxpหาย', '3');
INSERT INTO `risktypes` VALUES ('965', 'ชาร์ทผู้ป่วยในหาย/หาล่าช้า', '3');
INSERT INTO `risktypes` VALUES ('966', 'ผู้ป่วยไม่เข้าใจสิทธิ์การรักษา', '3');
INSERT INTO `risktypes` VALUES ('967', 'ใบนำส่ง ผิด/สลับ/ไม่ครบถ้วน/ไม่พร้อมใช้', '3');
INSERT INTO `risktypes` VALUES ('968', 'เครื่องมือช่วยชีวิตชำรุด/ไม่พร้อมใช้', '5');
INSERT INTO `risktypes` VALUES ('969', 'เครื่องมือเพื่อรักษาชำรุด/ไม่พร้อมใช้', '5');
INSERT INTO `risktypes` VALUES ('970', 'เครื่องมือสนับสนุนทางการแพทย์ชำรุด/ไม่พร้อมใช', '5');
INSERT INTO `risktypes` VALUES ('971', 'เครื่องมือเพื่อรักษาไม่เพียงพอ', '5');
INSERT INTO `risktypes` VALUES ('972', 'เครื่องมือสนับสนุนทางการแพทย์ไม่เพียงพอ', '5');
INSERT INTO `risktypes` VALUES ('973', 'เครื่องมือทั่วไปไม่เพียงพอ', '5');
INSERT INTO `risktypes` VALUES ('974', 'เครื่องมือตรวจวัด/วินิจฉัยไม่เพียงพอ', '5');
INSERT INTO `risktypes` VALUES ('975', 'เครื่องมือช่วยชีวิตไม่เพียงพอ', '5');
INSERT INTO `risktypes` VALUES ('976', 'เครื่องมือตรวจวัด/วินิจฉัยไม่ได้ตรวจสอบหรือเก็บบำรุงรักษา', '5');
INSERT INTO `risktypes` VALUES ('977', 'เครื่องมือทั่วไปไม่ได้ตรวจสอบหรือเก็บบำรุงรักษา', '5');
INSERT INTO `risktypes` VALUES ('978', 'เครื่องมือเพื่อรักษา ไม่ได้ตรวจสอบหรือเก็บบำรุงรักษา', '5');
INSERT INTO `risktypes` VALUES ('979', 'เครื่องมือสนับสนุนทางการแพทย์ ไม่ได้ตรวจสอบหรือเก็บบำรุงรักษา', '5');
INSERT INTO `risktypes` VALUES ('980', 'เครื่องมือช่วยชีวิต ไม่ได้ตรวจสอบหรือเก็บบำรุงรักษา', '5');
INSERT INTO `risktypes` VALUES ('981', 'วัสดุทางการแพทย์ไม่พร้อมใช้/ชำรุด', '5');
INSERT INTO `risktypes` VALUES ('982', 'แยกผู้ป่วยทางเดินหายใจไม่เหมาะสม', '10');
INSERT INTO `risktypes` VALUES ('983', 'ระดับน้ำตาลFBS>400', '13');
INSERT INTO `risktypes` VALUES ('989', 'ถังขยะไม่พร้อมใช้/ไม่สะอาด/ไม่ใส่ถุงรองรับขยะ', '10');
INSERT INTO `risktypes` VALUES ('990', 'ส่งผ้าผิดแผนก', '10');
INSERT INTO `risktypes` VALUES ('991', 'พบสารคัดหลัง/เลือด หยดที่พื้น', '10');
INSERT INTO `risktypes` VALUES ('992', 'เครื่องมือทางการแพทย์หล่นลงพื้น', '10');
INSERT INTO `risktypes` VALUES ('993', 'เก็บของsterileไม่ถูกต้อง/ไม่เก็บตามหลักFI-FO', '10');
INSERT INTO `risktypes` VALUES ('994', 'ละเมิดหลักปลอดเชื้อ/ไม่ปฏิบัติตาม WI', '10');
INSERT INTO `risktypes` VALUES ('995', 'จนท.ละเลยไม่ปฏิบัติตาม WI', '10');
INSERT INTO `risktypes` VALUES ('996', 'พบขยะติดเชื้อหล่นที่พื้น/อยู่ผิดที่', '10');
INSERT INTO `risktypes` VALUES ('997', 'แยก/ทิ้งขยะไม่ถูกต้อง', '10');
INSERT INTO `risktypes` VALUES ('998', 'set sterileระบุชื่อไม่ตรง/ระบุวันเดือนปีไม่ถูก', '10');
INSERT INTO `risktypes` VALUES ('999', 'สั่งยาผิดคน', '9');
INSERT INTO `risktypes` VALUES ('1000', 'จ่ายยาผิดวิธีใช้', '9');
INSERT INTO `risktypes` VALUES ('1001', 'จ่ายยาผิดจำนวน', '9');
INSERT INTO `risktypes` VALUES ('1002', 'จ่ายยาผิดขนาด', '9');
INSERT INTO `risktypes` VALUES ('1003', 'จ่ายยาไม่ครบรายการ', '9');
INSERT INTO `risktypes` VALUES ('1004', 'ไม่ทำตามระบบเฝ้าระวังการแพ้ยา', '9');
INSERT INTO `risktypes` VALUES ('1005', 'ไม่ทำตามระบบการขอใช้ยาเสพติด/ยาเร่งด่วน', '9');
INSERT INTO `risktypes` VALUES ('1006', 'HosXP บันทึกประวัติผิด/ไม่ครบ', '3');
INSERT INTO `risktypes` VALUES ('1007', 'ผู้ป่วยคุ้มคลั่ง/โวยวาย', '11');
INSERT INTO `risktypes` VALUES ('1008', 'โรคระบาดไม่ได้รับการสอบสวน/ควบคุม', '11');
INSERT INTO `risktypes` VALUES ('1009', 'ผู้ป่วยเสียชีวิต', '11');
INSERT INTO `risktypes` VALUES ('1010', 'ผู้ป่วยเสียชีวิตก่อนถึงโรงพยาบาล', '11');
INSERT INTO `risktypes` VALUES ('1011', 'ผู้ป่วยไม่ได้รับการรักษาหรือตรวจวินิจฉัยตามแผนการรักษา', '11');
INSERT INTO `risktypes` VALUES ('1012', 'มีสิ่งแปลกปลอมในกล่องถุงมือ/กล่องmask', '10');
INSERT INTO `risktypes` VALUES ('1013', 'ตรวจสอบประสิทธิภาพการทำปราศจากเชื้อในเครื่องมือไม่ผ่าน', '10');
INSERT INTO `risktypes` VALUES ('1014', 'บุคลากรถูกของมีคมทิ่มตำ', '10');
INSERT INTO `risktypes` VALUES ('1015', 'บุคลากรสัมผัสเลือด/สารคัดหลั่ง', '10');
INSERT INTO `risktypes` VALUES ('1016', 'ใช้ PPE ไม่เหมาะสม/ไม่ได้ใส่ PPE', '10');
INSERT INTO `risktypes` VALUES ('1017', 'ผ้ายางปูเตียงไม่พร้อมใช้', '10');
INSERT INTO `risktypes` VALUES ('1018', 'เครื่องผ้าไม่เพียงพอ/ไม่พร้อมใช้', '10');
INSERT INTO `risktypes` VALUES ('1019', 'การเข้าและเข้าถึง', '11');
INSERT INTO `risktypes` VALUES ('1020', 'การประเมินผู้ป่วย', '11');
INSERT INTO `risktypes` VALUES ('1021', 'ไม่อยู่ในการแผนเงินบำรุง/ขออนุมัตินอกแผนเงินบำรุง', '2');
INSERT INTO `risktypes` VALUES ('1022', 'ผู้ป่วยarrestก่อนมาถึงโรงพยาบาล', '11');
INSERT INTO `risktypes` VALUES ('1023', 'ผู้ป่วยดึง ET-tube', '11');
INSERT INTO `risktypes` VALUES ('1024', 'ทรัพย์สินผู้รับบริการสูญหายหรือเสียหาย', '1');
INSERT INTO `risktypes` VALUES ('1025', 'ไฟฟ้าดับเกิน 7 วินาที', '1');
INSERT INTO `risktypes` VALUES ('1026', 'ไม่ปิดเครื่องใช้ไฟฟ้าหลังใช้เสร็จ', '1');
INSERT INTO `risktypes` VALUES ('1027', 'ไฟฟ้ารั่วหรือช็อต', '1');
INSERT INTO `risktypes` VALUES ('1028', 'ผู้ป่วยมีอาการเจ็บหรือปวดจากหัตถการ', '11');
INSERT INTO `risktypes` VALUES ('1029', 'รถบริการชำรุด/ไม่พร้อมใช้', '1');
INSERT INTO `risktypes` VALUES ('1030', 'หลอดไฟชำรุด/แตก', '1');
INSERT INTO `risktypes` VALUES ('1031', 'เลือด มีอาการผิดปกติขณะให้เลือด', '11');
INSERT INTO `risktypes` VALUES ('1032', 'ผู้ป่วยดึงสาย IV', '11');
INSERT INTO `risktypes` VALUES ('1033', 'วัสดุทางการแพทย์ไม่เพียงพอ', '5');
INSERT INTO `risktypes` VALUES ('1034', 'โภชนากร ติดผิด/ไม่ติดป้ายอาหารประจำเตียง', '11');
INSERT INTO `risktypes` VALUES ('1035', 'บุคคลภายนอกก่อเหตุไม่สงบในโรงพยาบาล', '1');
INSERT INTO `risktypes` VALUES ('1036', 'โต๊ะหรือเก้าอี้ชำรุด', '1');
INSERT INTO `risktypes` VALUES ('1037', 'โทรทัศน์ชำรุด', '1');
INSERT INTO `risktypes` VALUES ('1038', 'ติดป้ายข้อมือผิดคน/ไม่ติด', '11');
INSERT INTO `risktypes` VALUES ('1039', 'โภชนากร สั่งอาหารผิด/ไม่สั่ง/สลับ', '11');
INSERT INTO `risktypes` VALUES ('1040', 'EKG ไม่ได้ตรวจ/ตรวจช้า', '11');
INSERT INTO `risktypes` VALUES ('1041', 'รถบริการ ใช้งานเกินระยะซ่อมบำรุงแต่ยังไม่เสียหาย', '1');
INSERT INTO `risktypes` VALUES ('1042', 'รถพยาบาล ใช้งานเกินระยะซ่อมบำรุงแต่ยังไม่เสียหาย', '1');
INSERT INTO `risktypes` VALUES ('1043', 'revisit', '11');
INSERT INTO `risktypes` VALUES ('1044', 'Admin-error ผู้ป่วยนอก', '9');
INSERT INTO `risktypes` VALUES ('1045', 'OPD เรียงคิวตรวจ/ผิด/สลับ/คิวเร่งด่วนผิด', '11');
INSERT INTO `risktypes` VALUES ('1046', 'ผู้ป่วยขาดการรักษา', '11');
INSERT INTO `risktypes` VALUES ('1047', 'ใบรับรองแพทย์ผิด/ไม่ครบ', '3');
INSERT INTO `risktypes` VALUES ('1048', 'การชำระหนี้ผิดพลาด', '2');
INSERT INTO `risktypes` VALUES ('1049', 'สถานการณ์การเงินยังอยู่ในขั้นวิกฤต', '2');
INSERT INTO `risktypes` VALUES ('1051', 'เครื่องคอมพิวเตอร์/อุปกรณ์ต่อพ่วงไม่พร้อมใช้งาน', '7');
INSERT INTO `risktypes` VALUES ('1052', 'ชาร์ทผู้ป่วยในauditล่าช้า', '3');
INSERT INTO `risktypes` VALUES ('1053', 'ไม่แจ้งเกิด/ล่าช้า', '3');
INSERT INTO `risktypes` VALUES ('1054', 'visit ไม่ได้เปิด', '3');
INSERT INTO `risktypes` VALUES ('1055', 'ใบสั่งยาหาย', '3');
INSERT INTO `risktypes` VALUES ('1056', 'ค้นเอกสารแฟ้มประวัติการรักษาไม่พบ', '3');
INSERT INTO `risktypes` VALUES ('1057', 'บัตรนัดหาย', '3');
INSERT INTO `risktypes` VALUES ('1058', 'สลับสมุดประจำตัว', '3');
INSERT INTO `risktypes` VALUES ('1059', 'เสียงดังรบกวนการทำงาน/มลภาวะทางเสียง', '1');
INSERT INTO `risktypes` VALUES ('1060', 'รับคำสั่งการรักษาแพทย์ผิด', '11');
INSERT INTO `risktypes` VALUES ('1061', 'ไฟฟ้าตกไม่พอใช้', '1');
INSERT INTO `risktypes` VALUES ('1062', 'ช่วยทำหัตถการไม่ได้ ช้า', '11');
INSERT INTO `risktypes` VALUES ('1063', 'กริ่งเตือนภัยดังแต่ไม่พบเหตุ', '1');
INSERT INTO `risktypes` VALUES ('1064', 'พบสิ่งปฏิกูลบนบริเวณบริการ', '1');
INSERT INTO `risktypes` VALUES ('1065', 'พบขยะในร่องระบายน้ำ', '1');
INSERT INTO `risktypes` VALUES ('1066', 'สายไฟ ท่อ ป้าย ไม่เป็นระเบียบเสี่ยงต่อการสะดุดหกล้ม', '1');
INSERT INTO `risktypes` VALUES ('1068', 'OPD card เสี่ยงต่อการสูญหาย', '3');
INSERT INTO `risktypes` VALUES ('1069', 'บันทึกประวัติการรักษาหรือหัตถการผิด', '3');
INSERT INTO `risktypes` VALUES ('1070', 'ทันตกรรม มีอาการผิดปกติหลังอุดฟัน', '11');
INSERT INTO `risktypes` VALUES ('1071', 'ผู้ป่วยมาตามนัดแต่ไม่ได้รับบริการ', '6');
INSERT INTO `risktypes` VALUES ('1072', 'ทันตกรรม Sealant ไม่เหมาะสม/หลุด', '11');
INSERT INTO `risktypes` VALUES ('1073', 'รถพยาบาลมาช้ากว่าเวลาที่กำหนด', '1');
INSERT INTO `risktypes` VALUES ('1074', 'oxygen สัญญาณเตือนอ็อกซิเจนต่ำไม่ทำงาน', '1');
INSERT INTO `risktypes` VALUES ('1075', 'ผู้ป่วยจิตเวชหนีจากตึกผู้ป่วย', '11');
INSERT INTO `risktypes` VALUES ('1076', 'สัญญาณเรียกพยาบาลไม่ทำงาน ชำรุด', '1');
INSERT INTO `risktypes` VALUES ('1077', 'เตียงผู้ป่วยหรือห้องพิเศษไม่ได้เตรียมหลังD/C', '1');
INSERT INTO `risktypes` VALUES ('1078', 'ผ้าห่มไม่พอ', '5');
INSERT INTO `risktypes` VALUES ('1079', 'ผ้าปูเตียงไม่พอ', '5');
INSERT INTO `risktypes` VALUES ('1080', 'พื้นมีน้ำขังหรือเปียก', '1');
INSERT INTO `risktypes` VALUES ('1081', 'x-ray ผู้ป่วยไม่ได้มาตรวจตามแพทย์สั่ง', '11');
INSERT INTO `risktypes` VALUES ('1082', 'ยาน ยางรถยนต์หมดสภาพใช้งาน', '1');
INSERT INTO `risktypes` VALUES ('1083', 'ปัญหาเกี่ยวกับระบบเครือข่าย', '7');
INSERT INTO `risktypes` VALUES ('1084', 'ซ่อมบำรุง ซ่อมซ้ำภายใน 1 เดือน', '1');
INSERT INTO `risktypes` VALUES ('1085', 'พัดลมชำรุด', '1');
INSERT INTO `risktypes` VALUES ('1086', 'ไม่มีป้าบบอกทางภายในตึก', '1');
INSERT INTO `risktypes` VALUES ('1087', 'ระบบบ่อบำบัดขัดข้อง', '1');
INSERT INTO `risktypes` VALUES ('1088', 'ฝนตก ถนนลื่น เสี่ยงต่ออุบัติเหตุ', '1');
INSERT INTO `risktypes` VALUES ('1089', 'โทรศัพท์ภายในชำรุด', '1');
INSERT INTO `risktypes` VALUES ('1090', 'อุปกรณ์เสี่ยงต่อการตกหล่น', '1');
INSERT INTO `risktypes` VALUES ('1091', 'ปลั๊กไฟไม่เพียงพอ', '1');
INSERT INTO `risktypes` VALUES ('1092', 'เตียงชำรุด', '5');
INSERT INTO `risktypes` VALUES ('1093', 'เตียงคนไข้ไม่พอ', '5');
INSERT INTO `risktypes` VALUES ('1094', 'ระบบกระจายเสียงขัดข้อง', '1');
INSERT INTO `risktypes` VALUES ('1095', 'ไฟฟ้าดับเฉพาะตึก', '1');
INSERT INTO `risktypes` VALUES ('1096', 'ต้นไม้เกี่ยวสายไฟ เสี่ยงต่อสายไฟขาด', '1');
INSERT INTO `risktypes` VALUES ('1097', 'บ่อบำบัด ลูกลอยไม่ทำงาน', '1');
INSERT INTO `risktypes` VALUES ('1098', 'บ่อบำบัด เครื่องสูบน้ำไม่ทำงาน', '1');
INSERT INTO `risktypes` VALUES ('1099', 'ไฟส่องสว่างฉุกเฉินไม่ทำงาน', '1');
INSERT INTO `risktypes` VALUES ('1100', 'เปลเข็นชำรุด', '5');
INSERT INTO `risktypes` VALUES ('1101', 'ผู้ป่วยหรือผู้ให้บริการลื่นล้ม', '1');
INSERT INTO `risktypes` VALUES ('1102', 'สุนัขจะกัดระหว่างทำงาน', '1');
INSERT INTO `risktypes` VALUES ('1103', 'ท่อปะปาแตก', '1');
INSERT INTO `risktypes` VALUES ('1104', 'คอมเพสเซอร์แอร์เสีย', '1');
INSERT INTO `risktypes` VALUES ('1105', 'ยาน รถพยาบาลไม่พอใช้', '1');
INSERT INTO `risktypes` VALUES ('1106', 'สายไฟขาด', '1');
INSERT INTO `risktypes` VALUES ('1107', 'ท่อน้ำเสียหรือชักโคกอุดตัน', '1');
INSERT INTO `risktypes` VALUES ('1108', 'นาฬิกาชำรุด', '5');
INSERT INTO `risktypes` VALUES ('1109', 'ราวม่านชำรุด', '1');
INSERT INTO `risktypes` VALUES ('1110', 'อ่างล้างมือชำรุด', '1');
INSERT INTO `risktypes` VALUES ('1111', 'งานสวน ตัดหญ่าหินกระเด็น', '1');
INSERT INTO `risktypes` VALUES ('1112', 'มีคนสูบบุหรี่ในโรงพยาบาล', '1');
INSERT INTO `risktypes` VALUES ('1113', 'หน้าต่างชำรุด', '1');
INSERT INTO `risktypes` VALUES ('1114', 'จักรยานยนต์ไม่สวมหมวกนิรภัย', '1');
INSERT INTO `risktypes` VALUES ('1115', 'ตู้กดน้ำไม่มีน้ำ', '1');
INSERT INTO `risktypes` VALUES ('1116', 'พบลูกน้ำยุง', '1');
INSERT INTO `risktypes` VALUES ('1117', 'พบหลุมเสี่ยงต่อการตกหรือล้ม', '1');
INSERT INTO `risktypes` VALUES ('1118', 'รั้วเสียหาย', '1');
INSERT INTO `risktypes` VALUES ('1119', 'บ่อบำบัด ผลตรวจน้ำไม่ผ่าน', '1');
INSERT INTO `risktypes` VALUES ('1120', 'หน้าต่าง ไม่ปิดไม่ล็อค', '1');
INSERT INTO `risktypes` VALUES ('1121', 'บ่อบำบัด น้ำเข้าเกินระบบ', '1');
INSERT INTO `risktypes` VALUES ('1122', 'เดินชนกระจก', '1');
INSERT INTO `risktypes` VALUES ('1123', 'ห้องน้ำมีกลิ่นเหม็น', '1');
INSERT INTO `risktypes` VALUES ('1124', 'ประตูชำรุด', '1');
INSERT INTO `risktypes` VALUES ('1125', 'ประตู ไม่ปิด ไม่ได้ล็อค', '1');
INSERT INTO `risktypes` VALUES ('1126', 'รางน้ำชำรุด รั่ว', '1');
INSERT INTO `risktypes` VALUES ('1127', 'ปลั๊กไฟชำรุด', '1');
INSERT INTO `risktypes` VALUES ('1128', 'ก็อกน้ำชำรุด', '1');
INSERT INTO `risktypes` VALUES ('1129', 'ยาน เปลผู้ป่วยในรถชำรุด', '1');
INSERT INTO `risktypes` VALUES ('1130', 'ไม่ปิดน้ำหลังใช้เสร็จ', '1');
INSERT INTO `risktypes` VALUES ('1131', 'ทันตกรรม มีภาวะแทรกซ้อนหลังถอนฟัน', '11');
INSERT INTO `risktypes` VALUES ('1132', 'เจ้าหน้าที่ไม่อยู่แต่ไม่ได้แจ้งเลื่อนนัดผู้รับบริการ', '6');
INSERT INTO `risktypes` VALUES ('1134', 'เจ้าหน้าที่ไม่เพียงพอต่อการให้บริการ', '6');
INSERT INTO `risktypes` VALUES ('1135', 'ผู้ป่วยรอรับบริการนาน', '6');
INSERT INTO `risktypes` VALUES ('1136', 'เจ้าหน้าที่เปลี่ยนเวรไม่ได้ขออนุญาตหรือแก้ตารางเวร', '6');
INSERT INTO `risktypes` VALUES ('1137', 'ไม่มีตารางเวร', '6');
INSERT INTO `risktypes` VALUES ('1138', 'ผู้ป่วยปฏิเสธการรักษา', '11');
INSERT INTO `risktypes` VALUES ('1139', 'ผู้ป่วยหนีกลับ', '11');
INSERT INTO `risktypes` VALUES ('1140', 'ไม่มีเจ้าหน้าที่ปฏิบัติงาน', '6');
INSERT INTO `risktypes` VALUES ('1141', 'ผู้ป่วยไม่เข้าใจหรือไม่ทราบแผนการรักษา', '6');
INSERT INTO `risktypes` VALUES ('1142', 'เสี่ยงต่อการโดยมิจฉาชีพล่อลวงองค์กร', '6');
INSERT INTO `risktypes` VALUES ('1143', 'ติดต่อรายงานเคสแพทย์ไม่ได้', '6');
INSERT INTO `risktypes` VALUES ('1144', 'มีเคสเร่งด่วนทำให้การให้บริการล่าช้า', '6');
INSERT INTO `risktypes` VALUES ('1145', 'ติดต่อเจ้าหน้าที่มาปฏิบัติงานไม่ได้', '6');
INSERT INTO `risktypes` VALUES ('1146', 'ผู้มารับบริการมีปริมาณมากหน่วยให้บริการไม่สามารถให้บริการได้', '6');
INSERT INTO `risktypes` VALUES ('1147', 'โภชนากร อาหารไม่พอจ่ายตามชนิดอาหาร', '11');
INSERT INTO `risktypes` VALUES ('1148', 'โภชนากร ผู้ป่วยไม่ได้รับอาหาร', '11');
INSERT INTO `risktypes` VALUES ('1149', 'โภชนากร เศษอาหารติดข้างในเครื่องครัว', '11');
INSERT INTO `risktypes` VALUES ('1150', 'โภชนากร จ่ายอาหารผิดโรค', '11');
INSERT INTO `risktypes` VALUES ('1151', 'โภชนากร จ่ายอาหารสลับเตียง', '11');
INSERT INTO `risktypes` VALUES ('1152', 'PGS ไม่มี HN ผู้ป่วย', '3');
INSERT INTO `risktypes` VALUES ('1153', 'NST ไม่รายงานผล NST ', '11');
INSERT INTO `risktypes` VALUES ('1154', 'เสาน้ำเกลือไม่พอ', '5');
INSERT INTO `risktypes` VALUES ('1155', 'ผู้ป่วยไม่ได้รับยา', '11');
INSERT INTO `risktypes` VALUES ('1156', 'แผนไทย-มีอาการพกช้ำจากการนวด', '11');
INSERT INTO `risktypes` VALUES ('1157', 'แผนไทย-มีอาการ Burn จากการประคบ', '11');
INSERT INTO `risktypes` VALUES ('1158', 'คลีนิกพิเศษ DM- ผู้ป่วยมีภาวะน้ำตาลต่ำ', '11');
INSERT INTO `risktypes` VALUES ('1159', 'ผู้ใช้งาน-ปัญหาที่เกิดจากความไม่เข้าใจเกี่ยวกับโปรแกรม', '7');
INSERT INTO `risktypes` VALUES ('1160', 'ผู้ใช้งาน-ปัญหาที่เกิดจากความไม่เข้าใจเกี่ยวกับอุปกรณ์คอมพิวเตอร์', '7');
INSERT INTO `risktypes` VALUES ('1161', 'ระบบไฟฟ้า-เครื่องสำรองไฟUPSเสื่อมสภาพ', '7');

-- ----------------------------
-- Table structure for social_account
-- ----------------------------
DROP TABLE IF EXISTS `social_account`;
CREATE TABLE `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `data` text,
  `code` varchar(32) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`) USING BTREE,
  UNIQUE KEY `account_unique_code` (`code`) USING BTREE,
  KEY `fk_user_account` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of social_account
-- ----------------------------

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('1', '4-ye_9HE921HvcYx-RF4R8JMn9qJRrtR', '1480231930', '0');
INSERT INTO `token` VALUES ('2', 'Avqaqhd0800w0yukNyQ5lHzkj3Z5Xkbn', '1480231958', '0');
INSERT INTO `token` VALUES ('3', 'cwrs58AlA0kTiMWLrB8yMx54Q-2PRgmc', '1480231988', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_sent_at` int(11) DEFAULT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recovery_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recovery_sent_at` int(11) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registered_from` int(11) DEFAULT NULL,
  `logged_in_from` int(11) DEFAULT NULL,
  `logged_in_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL COMMENT 'หน่วยงาน',
  `role` char(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ROLE',
  `position_id` int(11) DEFAULT NULL COMMENT 'ตำแหน่ง',
  `degree_id` int(11) DEFAULT NULL COMMENT 'ระดับ',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อ-สกุล',
  `depname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อหน่วยงาน',
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'รูปประจำตัว',
  `status` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`) USING BTREE,
  UNIQUE KEY `user_unique_email` (`email`) USING BTREE,
  UNIQUE KEY `user_confirmation` (`id`,`confirmation_token`) USING BTREE,
  UNIQUE KEY `user_recovery` (`id`,`recovery_token`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin@localhost.com', '$2y$12$NJr11U735Bu5lOLIgwNLI.aUhCkzbb4xkH38l3XN5yNKOsB1u1fNO', 'qaBLUbk-U7Slw9erP-R0YDSWKcZXeTOH', null, null, null, null, null, null, null, null, null, null, '1480231929', '1480231929', '::1', '6', '20', '9', '1', 'ไอน้ำ เรืองโพน', 'คอมพิวเตอร์(IT)', '3.jpg', null, null);
INSERT INTO `user` VALUES ('2', 'editor', 'editor@localhost.com', '$2y$12$cnYFD5Z0265sefxcQ0RKCO/EU8Q/eh4.gnj0EkZFKUsWrN0UTHiI2', 'ML1npHCHVSwWRqliAAHbaXJEBevLu7R-', null, null, null, null, null, null, null, null, null, null, '1480231957', '1480231957', '::1', '2', '30', '5', '3', 'editor editor', 'ทันตกรรม', null, null, null);
INSERT INTO `user` VALUES ('3', 'user', 'user@localhost.com', '$2y$12$zBA2leaXQ/LYJXVeeB1LdepxzgmhQ0qSs/IIkfhA4im33N0mjEx5y', '1lMV0eLFNcQRxj-CFPuacTuiQDiw81AL', null, null, null, null, null, null, null, null, null, null, '1480231987', '1480231987', '::1', '6', '10', '2', '5', 'User user', 'คอมพิวเตอร์(IT)', 'u.jpg', null, null);
