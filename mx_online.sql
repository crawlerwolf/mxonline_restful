/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : mx_online

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2022-03-08 11:34:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authtoken_token
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authtoken_token
-- ----------------------------
INSERT INTO `authtoken_token` VALUES ('817e57b3b7b87085bbfafe868b277f1f2266d590', '2022-03-03 15:24:59.743124', '1');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 课程', '6', 'add_course');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 课程', '6', 'change_course');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 课程', '6', 'delete_course');
INSERT INTO `auth_permission` VALUES ('24', 'Can view 课程', '6', 'view_course');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 章节', '7', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 章节', '7', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 章节', '7', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 章节', '7', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('29', 'Can add 视频', '8', 'add_video');
INSERT INTO `auth_permission` VALUES ('30', 'Can change 视频', '8', 'change_video');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete 视频', '8', 'delete_video');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 视频', '8', 'view_video');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 课程资源', '9', 'add_courseresource');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 课程资源', '9', 'change_courseresource');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 课程资源', '9', 'delete_courseresource');
INSERT INTO `auth_permission` VALUES ('36', 'Can view 课程资源', '9', 'view_courseresource');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 轮播课程', '10', 'add_bannercourse');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 轮播课程', '10', 'change_bannercourse');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 轮播课程', '10', 'delete_bannercourse');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 轮播课程', '10', 'view_bannercourse');
INSERT INTO `auth_permission` VALUES ('41', 'Can add 课程评论', '11', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('42', 'Can change 课程评论', '11', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete 课程评论', '11', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 课程评论', '11', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 用户咨询', '12', 'add_userask');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 用户咨询', '12', 'change_userask');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 用户咨询', '12', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 用户咨询', '12', 'view_userask');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 用户课程', '13', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 用户课程', '13', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 用户课程', '13', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('52', 'Can view 用户课程', '13', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('53', 'Can add 用户收藏', '14', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('54', 'Can change 用户收藏', '14', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete 用户收藏', '14', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 用户收藏', '14', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 用户消息', '15', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 用户消息', '15', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 用户消息', '15', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 用户消息', '15', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 城市', '16', 'add_citydict');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 城市', '16', 'change_citydict');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 城市', '16', 'delete_citydict');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 城市', '16', 'view_citydict');
INSERT INTO `auth_permission` VALUES ('65', 'Can add 课程机构', '17', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('66', 'Can change 课程机构', '17', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete 课程机构', '17', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 课程机构', '17', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('69', 'Can add 教师', '18', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('70', 'Can change 教师', '18', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete 教师', '18', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 教师', '18', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('73', 'Can add 轮播图', '19', 'add_banner');
INSERT INTO `auth_permission` VALUES ('74', 'Can change 轮播图', '19', 'change_banner');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete 轮播图', '19', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 轮播图', '19', 'view_banner');
INSERT INTO `auth_permission` VALUES ('77', 'Can add 邮箱验证码', '20', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('78', 'Can change 邮箱验证码', '20', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete 邮箱验证码', '20', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 邮箱验证码', '20', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('81', 'Can add user', '21', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('82', 'Can change user', '21', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete user', '21', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('84', 'Can view user', '21', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('85', 'Can add captcha store', '22', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('86', 'Can change captcha store', '22', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete captcha store', '22', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('88', 'Can view captcha store', '22', 'view_captchastore');
INSERT INTO `auth_permission` VALUES ('89', 'Can add Token', '23', 'add_token');
INSERT INTO `auth_permission` VALUES ('90', 'Can change Token', '23', 'change_token');
INSERT INTO `auth_permission` VALUES ('91', 'Can delete Token', '23', 'delete_token');
INSERT INTO `auth_permission` VALUES ('92', 'Can view Token', '23', 'view_token');
INSERT INTO `auth_permission` VALUES ('93', 'Can add token', '24', 'add_tokenproxy');
INSERT INTO `auth_permission` VALUES ('94', 'Can change token', '24', 'change_tokenproxy');
INSERT INTO `auth_permission` VALUES ('95', 'Can delete token', '24', 'delete_tokenproxy');
INSERT INTO `auth_permission` VALUES ('96', 'Can view token', '24', 'view_tokenproxy');
INSERT INTO `auth_permission` VALUES ('97', 'Can add association', '25', 'add_association');
INSERT INTO `auth_permission` VALUES ('98', 'Can change association', '25', 'change_association');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete association', '25', 'delete_association');
INSERT INTO `auth_permission` VALUES ('100', 'Can view association', '25', 'view_association');
INSERT INTO `auth_permission` VALUES ('101', 'Can add code', '26', 'add_code');
INSERT INTO `auth_permission` VALUES ('102', 'Can change code', '26', 'change_code');
INSERT INTO `auth_permission` VALUES ('103', 'Can delete code', '26', 'delete_code');
INSERT INTO `auth_permission` VALUES ('104', 'Can view code', '26', 'view_code');
INSERT INTO `auth_permission` VALUES ('105', 'Can add nonce', '27', 'add_nonce');
INSERT INTO `auth_permission` VALUES ('106', 'Can change nonce', '27', 'change_nonce');
INSERT INTO `auth_permission` VALUES ('107', 'Can delete nonce', '27', 'delete_nonce');
INSERT INTO `auth_permission` VALUES ('108', 'Can view nonce', '27', 'view_nonce');
INSERT INTO `auth_permission` VALUES ('109', 'Can add user social auth', '28', 'add_usersocialauth');
INSERT INTO `auth_permission` VALUES ('110', 'Can change user social auth', '28', 'change_usersocialauth');
INSERT INTO `auth_permission` VALUES ('111', 'Can delete user social auth', '28', 'delete_usersocialauth');
INSERT INTO `auth_permission` VALUES ('112', 'Can view user social auth', '28', 'view_usersocialauth');
INSERT INTO `auth_permission` VALUES ('113', 'Can add partial', '29', 'add_partial');
INSERT INTO `auth_permission` VALUES ('114', 'Can change partial', '29', 'change_partial');
INSERT INTO `auth_permission` VALUES ('115', 'Can delete partial', '29', 'delete_partial');
INSERT INTO `auth_permission` VALUES ('116', 'Can view partial', '29', 'view_partial');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES ('1', 'PJUN', 'pjun', '30c103cc6533b3ba33eaeb45b7893f1990b5b83d', '2022-03-01 13:07:06.837673');
INSERT INTO `captcha_captchastore` VALUES ('2', 'OJNI', 'ojni', 'd50833dc0349196b1a4fc552dff33c3cf953f5e9', '2022-03-01 13:39:52.840850');
INSERT INTO `captcha_captchastore` VALUES ('3', 'SSLB', 'sslb', '8c4161f145c681e4ae4331d0130c67220b8a77fd', '2022-03-01 13:40:10.258726');
INSERT INTO `captcha_captchastore` VALUES ('4', 'RSCM', 'rscm', '30ca75a19fd0ed5ca0954fff1da1779d280ec38b', '2022-03-01 13:41:06.843127');
INSERT INTO `captcha_captchastore` VALUES ('5', 'APBT', 'apbt', '4f4e324bb9133c49f2fb7cfd1bcfa36e9999c712', '2022-03-01 13:41:41.116727');
INSERT INTO `captcha_captchastore` VALUES ('6', 'JFLC', 'jflc', '25c2b4e230701a4bc833d0982b3d8e8e5b983bbc', '2022-03-01 13:41:49.579693');
INSERT INTO `captcha_captchastore` VALUES ('7', 'CWPH', 'cwph', '13f1b4a7d060e7a10d3d54a364fac7dd84f5e33e', '2022-03-01 13:43:19.716507');
INSERT INTO `captcha_captchastore` VALUES ('8', 'XVGS', 'xvgs', '3a5bd6d13bc69ae4e5c8166c9250678122ed6ba6', '2022-03-01 13:43:54.727250');
INSERT INTO `captcha_captchastore` VALUES ('9', 'RSVW', 'rsvw', 'a892d91200ceb31c8f84e448199667930f131665', '2022-03-01 13:44:37.043058');
INSERT INTO `captcha_captchastore` VALUES ('10', 'HJTJ', 'hjtj', 'f16dd918188ac80c7f192ee6104d07b69b90dde2', '2022-03-01 13:44:59.164021');
INSERT INTO `captcha_captchastore` VALUES ('11', 'UHLQ', 'uhlq', '876701749c039f1da24842743b0995c7d47d34c2', '2022-03-01 13:45:06.212795');
INSERT INTO `captcha_captchastore` VALUES ('12', 'DARA', 'dara', '694be57fec19d4c579f948e7e5abf6469511755c', '2022-03-01 13:45:11.012826');
INSERT INTO `captcha_captchastore` VALUES ('13', 'SLGV', 'slgv', 'c6acf625a8ce99626d370115fafb01430746a8cd', '2022-03-01 14:54:29.018653');
INSERT INTO `captcha_captchastore` VALUES ('14', 'TKHG', 'tkhg', '9c8e569f14d159e5a09bbb2ca7efeaddcb654b50', '2022-03-01 15:06:13.855394');
INSERT INTO `captcha_captchastore` VALUES ('15', 'KVBZ', 'kvbz', 'd3a558d2798afa5b477f0862716a966417716f14', '2022-03-01 15:06:25.569456');
INSERT INTO `captcha_captchastore` VALUES ('16', 'DWZR', 'dwzr', '9a25fcc9cd39985dc58265cd23664cd1b0cc550d', '2022-03-01 15:07:20.408481');
INSERT INTO `captcha_captchastore` VALUES ('17', 'MUKK', 'mukk', 'da07caa1e3e2563d0f49ce27d18963003ac3616d', '2022-03-01 15:07:57.465567');
INSERT INTO `captcha_captchastore` VALUES ('18', 'QBEA', 'qbea', '580fd89abdb639655ee225ec9fb6d8827df73e2c', '2022-03-01 15:14:25.483062');
INSERT INTO `captcha_captchastore` VALUES ('19', 'DHEM', 'dhem', 'dcd5da2780f11b4279bd934058e973dbea25c285', '2022-03-01 15:14:53.898543');
INSERT INTO `captcha_captchastore` VALUES ('20', 'MMJA', 'mmja', '50ee06549662cc3ca5be4dc4e5415cc629c3c3e7', '2022-03-01 15:16:30.501908');
INSERT INTO `captcha_captchastore` VALUES ('21', 'SOVL', 'sovl', '20f3b0a625e6467a169e261a3da0c30e3476ee25', '2022-03-01 15:17:40.692533');
INSERT INTO `captcha_captchastore` VALUES ('22', 'ISTC', 'istc', 'da09c76dcaae53141a087ebc7805ad2324af5292', '2022-03-01 15:18:01.334154');
INSERT INTO `captcha_captchastore` VALUES ('23', 'VGOD', 'vgod', '8127a5f35122a79f865d47d42dda1e3b45fcb9e9', '2022-03-01 15:18:04.869237');
INSERT INTO `captcha_captchastore` VALUES ('24', 'RZKD', 'rzkd', '3d9394fc08078f235cba2ea4ac4daf372ef7b057', '2022-03-01 15:20:52.288877');
INSERT INTO `captcha_captchastore` VALUES ('25', 'XBAG', 'xbag', '27e0ba8e564fd1f28c1c92c4d1f8e6f918da91c4', '2022-03-01 15:20:56.015249');
INSERT INTO `captcha_captchastore` VALUES ('26', 'QAJZ', 'qajz', 'f85c672f2ee6e6fae7ec4a1fa466c26ba3d88424', '2022-03-01 15:22:24.148836');
INSERT INTO `captcha_captchastore` VALUES ('27', 'FDGP', 'fdgp', 'cc1e4011ee7d3601378becd7b4c83d54face3314', '2022-03-01 15:24:22.683089');
INSERT INTO `captcha_captchastore` VALUES ('28', 'HJZW', 'hjzw', 'ea16873866c9e14b21908e21627e33ac2b43af57', '2022-03-01 15:25:57.532594');
INSERT INTO `captcha_captchastore` VALUES ('29', 'BYVB', 'byvb', '3f3cd213ecba8637ffbfb8c3195066116217b973', '2022-03-01 15:26:21.176370');
INSERT INTO `captcha_captchastore` VALUES ('30', 'OAMG', 'oamg', 'b181e6aaedcc7c88aaddcd0c32c65b8ae5adbf1b', '2022-03-01 15:26:40.722893');
INSERT INTO `captcha_captchastore` VALUES ('31', 'XXSE', 'xxse', '022452ff9e23d1dbfd64728edcf8aae78a8bd299', '2022-03-01 15:27:02.339556');
INSERT INTO `captcha_captchastore` VALUES ('32', 'NNOV', 'nnov', '95d05c59f45973d07009bbd80607c18f56d6d6a6', '2022-03-01 15:27:44.568484');
INSERT INTO `captcha_captchastore` VALUES ('33', 'HEJJ', 'hejj', 'e0475753b3b0cdc38128698a9485331933f2b915', '2022-03-01 15:28:01.946344');
INSERT INTO `captcha_captchastore` VALUES ('34', 'IWIH', 'iwih', 'abca2b054a800ab09f79c7441e6bbd37c469b927', '2022-03-01 15:28:38.483542');
INSERT INTO `captcha_captchastore` VALUES ('35', 'MKAN', 'mkan', '5233ef2cbc78ab7ec680d863c23c1655b866ae6b', '2022-03-01 15:30:02.845264');
INSERT INTO `captcha_captchastore` VALUES ('36', 'UENB', 'uenb', '7962b73b159e439b0885448414358161b85fc26d', '2022-03-01 15:30:20.186980');
INSERT INTO `captcha_captchastore` VALUES ('37', 'DRWS', 'drws', '04e3f5f040a5e0f196858c6d25617dcce691966a', '2022-03-01 15:30:50.891253');
INSERT INTO `captcha_captchastore` VALUES ('38', 'QROB', 'qrob', 'ef875cd84c11d532c1c9667fedd23e4e94061191', '2022-03-01 15:47:05.996880');
INSERT INTO `captcha_captchastore` VALUES ('39', 'TIWF', 'tiwf', 'b6788a1afd225fccfe035dfd8f10a582e70b4ac3', '2022-03-01 15:47:53.882783');
INSERT INTO `captcha_captchastore` VALUES ('40', 'NXBE', 'nxbe', 'cbc200508d29dc2657b2a4cee3cabe7db7cc62ef', '2022-03-01 15:48:38.933380');
INSERT INTO `captcha_captchastore` VALUES ('41', 'LJSN', 'ljsn', 'e4b65374716357bb17128cd14959b7aad7d9dab5', '2022-03-01 15:49:41.240825');
INSERT INTO `captcha_captchastore` VALUES ('42', 'IUAT', 'iuat', '2c57cd068b594018910d3acf08084f262c96a1fb', '2022-03-01 15:50:03.574827');
INSERT INTO `captcha_captchastore` VALUES ('43', 'QXPC', 'qxpc', 'a9922c9cc6138d90e34804ef67546c58bfd2ab45', '2022-03-01 15:50:44.396812');
INSERT INTO `captcha_captchastore` VALUES ('44', 'OSII', 'osii', '0b2625954ad28364204696bedde9879639d45d1e', '2022-03-01 15:51:20.901502');
INSERT INTO `captcha_captchastore` VALUES ('45', 'CXYT', 'cxyt', '60d3f4c789911719a6656be32e3a1c7d777d7ce5', '2022-03-01 15:54:04.190615');
INSERT INTO `captcha_captchastore` VALUES ('46', 'GYKZ', 'gykz', 'a9a08fb26d7051ac0e4c18d680797425a2231148', '2022-03-01 16:00:22.430980');
INSERT INTO `captcha_captchastore` VALUES ('47', 'BSFD', 'bsfd', '9af4bb98cad431ba785d121c21eabeb9fc1ec8c6', '2022-03-01 16:01:00.779329');
INSERT INTO `captcha_captchastore` VALUES ('48', 'XIRH', 'xirh', '72352e6e012fb44cd8c24eb5406c31bf7b68ee9b', '2022-03-01 16:01:56.380607');
INSERT INTO `captcha_captchastore` VALUES ('49', 'WXQW', 'wxqw', '94051b310c4ad49345d8cd9c3efe672a8c03196b', '2022-03-01 16:02:16.987045');
INSERT INTO `captcha_captchastore` VALUES ('50', 'PUDF', 'pudf', '3f20ab51e509c02a30ef97c6d0970adbbccc76a6', '2022-03-01 16:04:40.719929');
INSERT INTO `captcha_captchastore` VALUES ('51', 'UZSU', 'uzsu', '56d47f76c6015b426596641d8b4e1fdfc42233cd', '2022-03-01 16:05:26.901728');
INSERT INTO `captcha_captchastore` VALUES ('52', 'SOWS', 'sows', 'e6e5bb8be3ede1665eeb51380e2241032e613e43', '2022-03-01 16:14:27.455184');
INSERT INTO `captcha_captchastore` VALUES ('53', 'GTFH', 'gtfh', 'ec912114cddf366584d056e9de852a6452262c88', '2022-03-01 16:14:43.801392');
INSERT INTO `captcha_captchastore` VALUES ('54', 'JRSR', 'jrsr', '86138736a3652008f0fd2aa1849586c5bf6f88ea', '2022-03-01 16:14:49.000599');
INSERT INTO `captcha_captchastore` VALUES ('55', 'QFFT', 'qfft', '052837b5a6980eb6bf428726741c2c1cb6bd4d65', '2022-03-01 16:15:25.862442');
INSERT INTO `captcha_captchastore` VALUES ('56', 'WUZE', 'wuze', 'e5c51a58e9f9660d3e595399961f0d1d35436a5f', '2022-03-01 16:15:33.515320');
INSERT INTO `captcha_captchastore` VALUES ('57', 'UKFR', 'ukfr', '7552d106884bf406180d51da11cddd0ca2eb52ff', '2022-03-01 16:17:43.044320');
INSERT INTO `captcha_captchastore` VALUES ('58', 'NYRU', 'nyru', 'f9721a07083c72b98f198442a1d2e5ab0f85dd12', '2022-03-01 16:18:19.942656');
INSERT INTO `captcha_captchastore` VALUES ('59', 'VHQO', 'vhqo', 'a9157bc279dcb14eb0c710bee3fcf1d6414d6b4a', '2022-03-01 16:20:55.154306');
INSERT INTO `captcha_captchastore` VALUES ('60', 'WXUN', 'wxun', '1bbd3e534ae8e8587d25621dae55fca9183687e1', '2022-03-01 16:21:14.523216');
INSERT INTO `captcha_captchastore` VALUES ('61', 'RRMR', 'rrmr', 'b7b437551d72c44092c9d19ea5b94460946d5660', '2022-03-01 16:21:53.826093');
INSERT INTO `captcha_captchastore` VALUES ('62', 'OWPF', 'owpf', 'bab4c192fe7493b550bd0ec77a4052cfabaef00d', '2022-03-01 16:33:32.915238');
INSERT INTO `captcha_captchastore` VALUES ('63', 'GECB', 'gecb', 'fd7ddc4e4272e4a3359466594e296d255d4c9d44', '2022-03-01 20:44:23.314715');
INSERT INTO `captcha_captchastore` VALUES ('64', 'YYLP', 'yylp', '30af483f921e9454043f758324f283b2f8a3e826', '2022-03-02 09:21:56.950837');
INSERT INTO `captcha_captchastore` VALUES ('65', 'GCOS', 'gcos', '9d0915eaa1404570bfd76f64eba441f57b6177da', '2022-03-02 09:22:13.859201');
INSERT INTO `captcha_captchastore` VALUES ('66', 'DBSP', 'dbsp', '1780308d258ceca487b34b37e1d77bb5e37ab549', '2022-03-02 09:22:16.621338');
INSERT INTO `captcha_captchastore` VALUES ('67', 'TCCB', 'tccb', '1f715fcafec0d97921feb60e63f784e051e57c55', '2022-03-02 09:26:27.538590');
INSERT INTO `captcha_captchastore` VALUES ('68', 'NRZL', 'nrzl', 'fb8b7917c146e75dfeb6a6ecfe38ecc58d0d30a6', '2022-03-02 09:27:54.427730');
INSERT INTO `captcha_captchastore` VALUES ('69', 'GEUN', 'geun', 'b2a541a313698e4072c83ca321a49a69806285c9', '2022-03-02 09:28:52.459272');
INSERT INTO `captcha_captchastore` VALUES ('70', 'ZQRI', 'zqri', '6a3f759208b68c7684f6b276a46650776bd4f46f', '2022-03-02 09:30:54.070551');
INSERT INTO `captcha_captchastore` VALUES ('71', 'YJST', 'yjst', 'f2454487c12c38484a1b3f33f7d197f402f61d41', '2022-03-02 09:32:00.737768');
INSERT INTO `captcha_captchastore` VALUES ('72', 'JXOU', 'jxou', '4b006572303a718d28f4a40e4313fe5d40898efa', '2022-03-02 09:37:31.275710');
INSERT INTO `captcha_captchastore` VALUES ('73', 'FPCY', 'fpcy', '628671205058c081c43e5e5c801ab76b6ca13bb7', '2022-03-02 09:40:08.857470');
INSERT INTO `captcha_captchastore` VALUES ('74', 'RIOC', 'rioc', 'd6ef03487e46d8dbacffb09f03514bfbd826c26a', '2022-03-02 09:42:58.580514');
INSERT INTO `captcha_captchastore` VALUES ('75', 'EORD', 'eord', '856be7f832a30fea5d7bb48a2cdb5e8631190a00', '2022-03-02 09:43:52.091123');
INSERT INTO `captcha_captchastore` VALUES ('76', 'SPIJ', 'spij', 'fb72ccbbbd7e2a70811edc43de3bae2d09820d8e', '2022-03-02 09:44:15.064946');
INSERT INTO `captcha_captchastore` VALUES ('77', 'NBBX', 'nbbx', 'dbd4eb0e54b095d902965cada8f4b70aa951e7c2', '2022-03-02 09:45:25.896965');
INSERT INTO `captcha_captchastore` VALUES ('78', 'IWKP', 'iwkp', 'e30e74c84c9eec8759b06f59fd393394f15d4bf5', '2022-03-02 09:45:48.761653');
INSERT INTO `captcha_captchastore` VALUES ('79', 'QXPA', 'qxpa', '1df3b35a9d82feccf48d585edc20400ab6014ee5', '2022-03-02 09:46:11.775913');
INSERT INTO `captcha_captchastore` VALUES ('80', 'QJEH', 'qjeh', 'c07f813c0a8a539d1cba30482ce71f0fc138ebfb', '2022-03-02 09:46:51.597084');
INSERT INTO `captcha_captchastore` VALUES ('81', 'AWDT', 'awdt', '62e7eda36aeef72b3bb994a7f6f3e76dc8c9ed4e', '2022-03-02 09:50:57.262250');
INSERT INTO `captcha_captchastore` VALUES ('82', 'JOZK', 'jozk', 'bcc65aa63d9bd24ea3013cac69dcf2235fcdc680', '2022-03-02 09:51:23.821397');
INSERT INTO `captcha_captchastore` VALUES ('83', 'ONBK', 'onbk', 'aa9adf6ee8dc3433065e96054e304ac479e22fbb', '2022-03-02 17:08:13.349474');
INSERT INTO `captcha_captchastore` VALUES ('84', 'RUBD', 'rubd', '65a95aa479ae42b1e211611ca3c3299769098bde', '2022-03-02 17:49:07.979170');
INSERT INTO `captcha_captchastore` VALUES ('85', 'SVLR', 'svlr', '74e3cfa0c490b3aa6953ffc7e6e578c4e8684c97', '2022-03-03 15:04:55.496476');
INSERT INTO `captcha_captchastore` VALUES ('86', 'GMZK', 'gmzk', '977ba35a985d915d9bc4677d88b1933a0bdeb858', '2022-03-03 15:05:32.326850');
INSERT INTO `captcha_captchastore` VALUES ('87', 'IDTF', 'idtf', '4d0479125e889902773ec3040eebe45aee63eb74', '2022-03-03 15:09:18.939800');
INSERT INTO `captcha_captchastore` VALUES ('88', 'FEWB', 'fewb', '82129abb716a75ecae43c25528b18c81e88e0481', '2022-03-03 15:10:13.526478');
INSERT INTO `captcha_captchastore` VALUES ('89', 'LBJQ', 'lbjq', '6754eb2ada3620d018fd93e32af7d135777c5ea8', '2022-03-03 15:10:31.567956');
INSERT INTO `captcha_captchastore` VALUES ('90', 'QGTS', 'qgts', 'b7c5c88f291bc78e15595df8c2bd7d00c1859da6', '2022-03-03 15:11:04.000702');
INSERT INTO `captcha_captchastore` VALUES ('91', 'FMLM', 'fmlm', '2013dbd4fe05649499c5168bec1425e4782f9226', '2022-03-03 15:11:24.489070');
INSERT INTO `captcha_captchastore` VALUES ('92', 'PFIP', 'pfip', '36b67591bb2a9d40f423dfa64e8c2d60c4ca57c5', '2022-03-03 15:11:44.385164');
INSERT INTO `captcha_captchastore` VALUES ('93', 'DOHT', 'doht', 'c030b11a6ceac93ab511f9b3c64f65b2e842512a', '2022-03-03 15:11:52.075130');
INSERT INTO `captcha_captchastore` VALUES ('94', 'LPTB', 'lptb', 'a959766db56753361ac33588ee62f95eb004b399', '2022-03-07 16:09:32.810613');
INSERT INTO `captcha_captchastore` VALUES ('95', 'NZAR', 'nzar', 'bf4548bcc29c5a333d6c3ea22b5be1b180f8e364', '2022-03-07 16:10:39.041705');

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  `degree` varchar(2) NOT NULL,
  `need_know` varchar(300) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `click_nums` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` bigint(20) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_organizat` (`course_org_id`),
  KEY `courses_course_teacher_id_846fa526_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES ('1', 'java', 'java测试', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/></p>', '0', 'cj', '测试', '120', '1', '0', '测试', 'courses/2022/02/01_mid.jpg', '4', '后端开发', 'spring', '2022-02-22 13:38:00.000000', '1', '1');
INSERT INTO `courses_course` VALUES ('2', '开发', '开发', '<p>开发</p>', '0', 'cj', '开发', '0', '0', '0', '测试', '', '0', '后端开发', 'spring', '2022-02-22 17:21:00.000000', '1', '1');

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES ('1', 'ziyuan', 'course/resource/2022/02/aobama.png', '2022-02-25 14:44:00.000000', '1');
INSERT INTO `courses_courseresource` VALUES ('2', '2', 'course/resource/2022/02/57aa86a0000145c512000460.jpg', '2022-02-25 14:44:00.000000', '1');
INSERT INTO `courses_courseresource` VALUES ('3', '2', 'course/resource/2022/02/aobama_9JFUAT9.png', '2022-02-25 14:45:00.000000', '2');

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES ('1', 'java测试', '2022-02-22 13:38:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('2', '开发', '2022-02-22 17:21:00.000000', '2');
INSERT INTO `courses_lesson` VALUES ('3', '1', '2022-02-25 14:42:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('4', '2', '2022-02-25 14:42:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('5', '3', '2022-02-25 14:43:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('6', '1', '2022-02-25 14:43:00.000000', '2');
INSERT INTO `courses_lesson` VALUES ('7', '2', '2022-02-25 14:44:00.000000', '2');

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES ('1', '111', 'https://www.baidu.com', '0', '2022-02-25 14:42:00.000000', '3');
INSERT INTO `courses_video` VALUES ('2', '222', 'https://www.baidu.com', '0', '2022-02-25 14:42:00.000000', '4');
INSERT INTO `courses_video` VALUES ('3', '333', 'https://www.baidu.com', '0', '2022-02-25 14:43:00.000000', '5');
INSERT INTO `courses_video` VALUES ('4', '111', 'https://www.baidu.com', '0', '2022-02-25 14:43:00.000000', '6');
INSERT INTO `courses_video` VALUES ('5', '222', 'https://www.baidu.com', '0', '2022-02-25 14:44:00.000000', '7');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2022-02-22 13:44:47.031630', '1', 'java', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"\\u7ae0\\u8282\", \"object\": \"java\\u6d4b\\u8bd5\"}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2022-02-22 17:22:58.429877', '2', '开发', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"\\u7ae0\\u8282\", \"object\": \"\\u5f00\\u53d1\"}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2022-02-23 15:20:27.423100', '7', 'teacher1', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2022-02-23 15:20:59.081840', '8', 'teacher2', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2022-02-23 15:21:18.888925', '9', 'teacher3', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2022-02-23 15:21:32.025004', '10', 'teacher4', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2022-02-25 14:42:59.624735', '3', '1', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"\\u89c6\\u9891\", \"object\": \"111\"}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2022-02-25 14:43:13.916791', '4', '2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"\\u89c6\\u9891\", \"object\": \"222\"}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2022-02-25 14:43:27.651535', '5', '3', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"\\u89c6\\u9891\", \"object\": \"333\"}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2022-02-25 14:44:02.343667', '6', '1', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"\\u89c6\\u9891\", \"object\": \"111\"}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2022-02-25 14:44:14.898388', '7', '2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"\\u89c6\\u9891\", \"object\": \"222\"}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2022-02-25 14:44:52.753841', '1', 'ziyuan', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2022-02-25 14:45:04.657547', '2', '2', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2022-02-25 14:45:17.365526', '3', '2', '1', '[{\"added\": {}}]', '9', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('23', 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES ('24', 'authtoken', 'tokenproxy');
INSERT INTO `django_content_type` VALUES ('22', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('10', 'courses', 'bannercourse');
INSERT INTO `django_content_type` VALUES ('6', 'courses', 'course');
INSERT INTO `django_content_type` VALUES ('9', 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES ('7', 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES ('8', 'courses', 'video');
INSERT INTO `django_content_type` VALUES ('11', 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('12', 'operation', 'userask');
INSERT INTO `django_content_type` VALUES ('13', 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES ('14', 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('15', 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES ('16', 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES ('17', 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('18', 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('25', 'social_django', 'association');
INSERT INTO `django_content_type` VALUES ('26', 'social_django', 'code');
INSERT INTO `django_content_type` VALUES ('27', 'social_django', 'nonce');
INSERT INTO `django_content_type` VALUES ('29', 'social_django', 'partial');
INSERT INTO `django_content_type` VALUES ('28', 'social_django', 'usersocialauth');
INSERT INTO `django_content_type` VALUES ('19', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('20', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('21', 'users', 'userprofile');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2022-02-21 15:27:36.391082');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2022-02-21 15:27:37.284129');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2022-02-21 15:27:41.626391');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2022-02-21 15:27:42.484297');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2022-02-21 15:27:42.556521');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2022-02-21 15:27:42.628745');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2022-02-21 15:27:42.686328');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2022-02-21 15:27:42.791739');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2022-02-21 15:27:42.853235');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2022-02-21 15:27:43.051395');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2022-02-21 15:27:43.112862');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0010_alter_group_name_max_length', '2022-02-21 15:27:43.909267');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0011_update_proxy_permissions', '2022-02-21 15:27:43.954192');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0012_alter_user_first_name_max_length', '2022-02-21 15:27:44.015652');
INSERT INTO `django_migrations` VALUES ('15', 'users', '0001_initial', '2022-02-21 15:27:51.591422');
INSERT INTO `django_migrations` VALUES ('16', 'admin', '0001_initial', '2022-02-21 15:27:53.653755');
INSERT INTO `django_migrations` VALUES ('17', 'admin', '0002_logentry_remove_auto_add', '2022-02-21 15:27:53.707406');
INSERT INTO `django_migrations` VALUES ('18', 'admin', '0003_logentry_add_action_flag_choices', '2022-02-21 15:27:53.818701');
INSERT INTO `django_migrations` VALUES ('19', 'organization', '0001_initial', '2022-02-21 15:27:56.442178');
INSERT INTO `django_migrations` VALUES ('20', 'courses', '0001_initial', '2022-02-21 15:28:04.802657');
INSERT INTO `django_migrations` VALUES ('21', 'operation', '0001_initial', '2022-02-21 15:28:07.095299');
INSERT INTO `django_migrations` VALUES ('22', 'operation', '0002_initial', '2022-02-21 15:28:12.961101');
INSERT INTO `django_migrations` VALUES ('23', 'sessions', '0001_initial', '2022-02-21 15:28:13.755572');
INSERT INTO `django_migrations` VALUES ('24', 'organization', '0002_remove_courseorg_course_nums', '2022-02-25 10:53:52.835509');
INSERT INTO `django_migrations` VALUES ('25', 'captcha', '0001_initial', '2022-03-01 10:03:24.995328');
INSERT INTO `django_migrations` VALUES ('26', 'authtoken', '0001_initial', '2022-03-03 12:40:24.392107');
INSERT INTO `django_migrations` VALUES ('27', 'authtoken', '0002_auto_20160226_1747', '2022-03-03 12:40:24.512156');
INSERT INTO `django_migrations` VALUES ('28', 'authtoken', '0003_tokenproxy', '2022-03-03 12:40:24.570716');
INSERT INTO `django_migrations` VALUES ('29', 'default', '0001_initial', '2022-03-07 15:29:43.447577');
INSERT INTO `django_migrations` VALUES ('30', 'social_auth', '0001_initial', '2022-03-07 15:29:43.492475');
INSERT INTO `django_migrations` VALUES ('31', 'default', '0002_add_related_name', '2022-03-07 15:29:43.616427');
INSERT INTO `django_migrations` VALUES ('32', 'social_auth', '0002_add_related_name', '2022-03-07 15:29:43.725771');
INSERT INTO `django_migrations` VALUES ('33', 'default', '0003_alter_email_max_length', '2022-03-07 15:29:45.459170');
INSERT INTO `django_migrations` VALUES ('34', 'social_auth', '0003_alter_email_max_length', '2022-03-07 15:29:45.525534');
INSERT INTO `django_migrations` VALUES ('35', 'default', '0004_auto_20160423_0400', '2022-03-07 15:29:45.637743');
INSERT INTO `django_migrations` VALUES ('36', 'social_auth', '0004_auto_20160423_0400', '2022-03-07 15:29:45.691424');
INSERT INTO `django_migrations` VALUES ('37', 'social_auth', '0005_auto_20160727_2333', '2022-03-07 15:29:46.403910');
INSERT INTO `django_migrations` VALUES ('38', 'social_django', '0006_partial', '2022-03-07 15:29:47.617091');
INSERT INTO `django_migrations` VALUES ('39', 'social_django', '0007_code_timestamp', '2022-03-07 15:29:48.600932');
INSERT INTO `django_migrations` VALUES ('40', 'social_django', '0008_partial_timestamp', '2022-03-07 15:29:49.453941');
INSERT INTO `django_migrations` VALUES ('41', 'social_django', '0009_auto_20191118_0520', '2022-03-07 15:29:51.045812');
INSERT INTO `django_migrations` VALUES ('42', 'social_django', '0010_uid_db_index', '2022-03-07 15:29:52.064766');
INSERT INTO `django_migrations` VALUES ('43', 'social_django', '0004_auto_20160423_0400', '2022-03-07 15:29:52.177984');
INSERT INTO `django_migrations` VALUES ('44', 'social_django', '0003_alter_email_max_length', '2022-03-07 15:29:52.290261');
INSERT INTO `django_migrations` VALUES ('45', 'social_django', '0001_initial', '2022-03-07 15:29:52.433733');
INSERT INTO `django_migrations` VALUES ('46', 'social_django', '0005_auto_20160727_2333', '2022-03-07 15:29:52.640612');
INSERT INTO `django_migrations` VALUES ('47', 'social_django', '0002_add_related_name', '2022-03-07 15:29:52.724576');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0atf4v3e9i7up2amy1f8zg7e1ce1q0tw', '.eJxVjMsOwiAQRf-FtSEwZabg0r3fQHhK1UBS2pXx35WkC92ec-59Mev2rdi9p9UukZ2ZZKdf5l14pDpEvLt6azy0uq2L5yPhh-382mJ6Xo7276C4Xr5rUggkZi00BuEnQwLQgcJILs054uBKmExICsAkAKmzTJ5wIjFJxd4fnTQ18Q:1nR9G7:oSua3NMiVwLHGuHcp_rcWUEpoPan3oiDW5OOx7ISc18', '2022-03-21 17:02:27.006060');
INSERT INTO `django_session` VALUES ('13j2h3o1j504y7mqdo0x1z4p3mbe7djk', 'e30:1nR7Qw:a9gxoRLp5e2TB0_OkWxPQZwOkAfvY6jpm756moMLIuM', '2022-03-21 15:05:30.174515');
INSERT INTO `django_session` VALUES ('2j6i0ayjxb4bsrt4io4fo0r6fyhg648o', 'e30:1nR7QW:WLxeZVku2oNN0Naa66jUEjT1j717fLwT0TIsHKxG3jU', '2022-03-21 15:05:04.985157');
INSERT INTO `django_session` VALUES ('7ym39236nv64qa3a2ct2avhnczfdglak', '.eJxVjMsOwiAQRf-FtSEwZabg0r3fQHhK1UBS2pXx35WkC92ec-59Mev2rdi9p9UukZ2ZZKdf5l14pDpEvLt6azy0uq2L5yPhh-382mJ6Xo7276C4Xr5rUggkZi00BuEnQwLQgcJILs054uBKmExICsAkAKmzTJ5wIjFJxd4fnTQ18Q:1nPaNI:1Es8-5REE-25ZwRNAotyTvZvRx4wd9lIXK_xPDAQg2k', '2022-03-17 09:35:24.547390');
INSERT INTO `django_session` VALUES ('9dnn6wh75akqx6x5xxngeyliv1n6y4rp', '.eJxVjMsOwiAQRf-FtSEwZabg0r3fQHhK1UBS2pXx35WkC92ec-59Mev2rdi9p9UukZ2ZZKdf5l14pDpEvLt6azy0uq2L5yPhh-382mJ6Xo7276C4Xr5rUggkZi00BuEnQwLQgcJILs054uBKmExICsAkAKmzTJ5wIjFJxd4fnTQ18Q:1nPM0q:xTiWiD90o410HWL1zT4WUdRWkSQLRnJHNhYR9XnweeQ', '2022-03-16 18:15:16.364671');
INSERT INTO `django_session` VALUES ('9lws60sy1nj5qk33amc9vbhgi906u4rt', '.eJxVjDsOwjAQBe_iGlm2119Kes5gbdYbHECOFCcV4u4QKQW0b2beS2Tc1pq3zkueijgLLU6_24D04LaDcsd2myXNbV2mQe6KPGiX17nw83K4fwcVe_3WYJwHdhqK8oygiwEKcdRM0QYAazzZQKNOCZ1K1hmIgWwCiMqBj0W8P7IqNi8:1nMNsf:khz-c6PBzUna2IAZ4LK9dD4SK436zm0XQJJ7GcHvv9Y', '2022-03-08 13:38:33.564180');
INSERT INTO `django_session` VALUES ('a9ifgdyvgx941xchh07o43pkflu4y84o', '.eJxVjDsOwjAQBe_iGlm2119Kes5gbdYbHECOFCcV4u4QKQW0b2beS2Tc1pq3zkueijgLLU6_24D04LaDcsd2myXNbV2mQe6KPGiX17nw83K4fwcVe_3WYJwHdhqK8oygiwEKcdRM0QYAazzZQKNOCZ1K1hmIgWwCiMqBj0W8P7IqNi8:1nNVoU:jpyeTn1P1yiFBi20fR4jwBukhdCNbTIT0Sjo4hE9JOU', '2022-03-11 16:18:54.602963');
INSERT INTO `django_session` VALUES ('adfw7jr1zv9wlqdvo6l0qyg879k3qsr7', 'e30:1nR7Oi:Nn59D_wwAWGxbcYEvzsZuHpiKpdO4DmMguUpzyRWaR8', '2022-03-21 15:03:12.378850');
INSERT INTO `django_session` VALUES ('b0vhm3q000jgmkn5ncb5khtbgzpkrtkf', '.eJxVjDsOwjAQBe_iGlm2119Kes5gbdYbHECOFCcV4u4QKQW0b2beS2Tc1pq3zkueijgLLU6_24D04LaDcsd2myXNbV2mQe6KPGiX17nw83K4fwcVe_3WYJwHdhqK8oygiwEKcdRM0QYAazzZQKNOCZ1K1hmIgWwCiMqBj0W8P7IqNi8:1nM38j:SiTkmvUQQTZVfnyicz0A83ZXq1tESNEplkic88RvpFs', '2022-03-07 15:29:45.949231');
INSERT INTO `django_session` VALUES ('b3vtfw441qmwbetugkp4050oqkzp3ny1', '.eJxVjDsOwjAQBe_iGlm2119Kes5gbdYbHECOFCcV4u4QKQW0b2beS2Tc1pq3zkueijgLLU6_24D04LaDcsd2myXNbV2mQe6KPGiX17nw83K4fwcVe_3WYJwHdhqK8oygiwEKcdRM0QYAazzZQKNOCZ1K1hmIgWwCiMqBj0W8P7IqNi8:1nOZln:fZiX9L15Yigp-cQBlOHsz72P_iwXX6feX4Iwty1I79M', '2022-03-14 14:44:31.207213');
INSERT INTO `django_session` VALUES ('g0vtof2vusbznvdea1ngbpmo5akojtp7', '.eJyrViosjC8uSSxJVbJScktLD8tzL8_wdrEwLPdzKwkpCilIdy3JrMwzMS8IcXVR0lEqT82syMyD64j0Sgp3cfJPczcoCclPyi3JDYjITg1xKve1NPL0dio2gehIyodryLRw9sv0KyuqNA6LCA61zDHPCU31jDI2KczP80zMNM1XqgUATc0xXA:1nR8VY:-hZe5fdqqNwoxBvHbQjholACREUldmKYkpLgmk6CXPw', '2022-03-21 16:14:20.056679');
INSERT INTO `django_session` VALUES ('heyr4eqhu4mc7f7zlcykcflp06m03pdg', '.eJxVjDsOwjAQBe_iGlm2119Kes5gbdYbHECOFCcV4u4QKQW0b2beS2Tc1pq3zkueijgLLU6_24D04LaDcsd2myXNbV2mQe6KPGiX17nw83K4fwcVe_3WYJwHdhqK8oygiwEKcdRM0QYAazzZQKNOCZ1K1hmIgWwCiMqBj0W8P7IqNi8:1nOaQK:G8zYbjcWUW0zvCNTNFgKVBwfx3g2OBmfxss4xheCWtY', '2022-03-14 15:26:24.481610');
INSERT INTO `django_session` VALUES ('l60gmsojwd8hp3tiap6mx4dtoga162lm', 'e30:1nR7Oi:Nn59D_wwAWGxbcYEvzsZuHpiKpdO4DmMguUpzyRWaR8', '2022-03-21 15:03:12.365185');
INSERT INTO `django_session` VALUES ('qbury8m8edd4jd1zb0ejsnk0vdbax0wg', '.eJxVjDsOwjAQBe_iGlm2119Kes5gbdYbHECOFCcV4u4QKQW0b2beS2Tc1pq3zkueijgLLU6_24D04LaDcsd2myXNbV2mQe6KPGiX17nw83K4fwcVe_3WYJwHdhqK8oygiwEKcdRM0QYAazzZQKNOCZ1K1hmIgWwCiMqBj0W8P7IqNi8:1nN6lP:3f5AiqakMmD1GD9MWKjJHxWGKgP0BW_yvPGwkFwtxQI', '2022-03-10 13:34:03.015755');
INSERT INTO `django_session` VALUES ('rkyqs08em76onrr9ti0zujyz063htr2s', '.eJxVjDsOwjAQBe_iGlm2119Kes5gbdYbHECOFCcV4u4QKQW0b2beS2Tc1pq3zkueijgLLU6_24D04LaDcsd2myXNbV2mQe6KPGiX17nw83K4fwcVe_3WYJwHdhqK8oygiwEKcdRM0QYAazzZQKNOCZ1K1hmIgWwCiMqBj0W8P7IqNi8:1nMlNr:Fm9XZHaRyQ_7g0bubeDW-MtHSBdK4PtSxo4MTs0hwkU', '2022-03-09 14:44:19.968190');
INSERT INTO `django_session` VALUES ('tu41mi64kugp88p1c8gzp628suoinr4v', '.eJxVjDsOwjAQBe_iGlm2119Kes5gbdYbHECOFCcV4u4QKQW0b2beS2Tc1pq3zkueijgLLU6_24D04LaDcsd2myXNbV2mQe6KPGiX17nw83K4fwcVe_3WYJwHdhqK8oygiwEKcdRM0QYAazzZQKNOCZ1K1hmIgWwCiMqBj0W8P7IqNi8:1nOYUa:YK2ZSEAf3MkbP4zRax0xma7wbQUx8d7cHNIC_ny1OCk', '2022-03-14 13:22:40.813074');
INSERT INTO `django_session` VALUES ('u6gyl87t81sufaau972g82qmk40igaf0', '.eJxVjDsOwjAQBe_iGlm2119Kes5gbdYbHECOFCcV4u4QKQW0b2beS2Tc1pq3zkueijgLLU6_24D04LaDcsd2myXNbV2mQe6KPGiX17nw83K4fwcVe_3WYJwHdhqK8oygiwEKcdRM0QYAazzZQKNOCZ1K1hmIgWwCiMqBj0W8P7IqNi8:1nMRMl:DGbSPfmhKzr8OgcDM6yBbVLE-z57MYPjekKkapnbrwg', '2022-03-08 17:21:51.751897');

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomm_user_id_f5ff70b3_fk_users_use` (`user_id`),
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------
INSERT INTO `operation_coursecomments` VALUES ('1', '1', '2022-02-28 15:26:34.882924', '1', '1');

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------
INSERT INTO `operation_userask` VALUES ('1', '孙文隆', '13612345678', '士大夫', '2022-02-28 13:44:08.516355');
INSERT INTO `operation_userask` VALUES ('2', '孙文隆', '13612345678', '士大夫', '2022-02-28 13:44:26.989904');
INSERT INTO `operation_userask` VALUES ('3', '孙文隆', '17199741420', '士大夫', '2022-02-28 13:49:03.771441');
INSERT INTO `operation_userask` VALUES ('4', '孙文隆', '17199741420', '士大夫1', '2022-02-28 13:51:56.300952');
INSERT INTO `operation_userask` VALUES ('5', '孙文隆', '17199741420', '士大夫1', '2022-02-28 13:52:55.914340');
INSERT INTO `operation_userask` VALUES ('6', '孙文隆', '17199741420', '士大夫1', '2022-02-28 13:52:57.647730');
INSERT INTO `operation_userask` VALUES ('7', '孙文隆', '17199741420', '士大夫1', '2022-02-28 13:52:58.513477');
INSERT INTO `operation_userask` VALUES ('8', '孙文隆', '17199741420', '士大夫1', '2022-02-28 13:52:59.131262');
INSERT INTO `operation_userask` VALUES ('9', '孙文隆', '17199741420', '士大夫1', '2022-02-28 13:54:22.152519');
INSERT INTO `operation_userask` VALUES ('10', '孙文隆', '17199741420', '士大夫1', '2022-02-28 13:55:59.811511');
INSERT INTO `operation_userask` VALUES ('11', '孙文隆', '17199741420', '士大夫1', '2022-02-28 13:56:01.939207');
INSERT INTO `operation_userask` VALUES ('12', '孙文隆', '17199741420', '士大夫1', '2022-02-28 13:56:02.533625');
INSERT INTO `operation_userask` VALUES ('13', '孙文隆', '17199741420', '士大夫1', '2022-02-28 13:56:02.974775');
INSERT INTO `operation_userask` VALUES ('14', '孙文隆', '17199741420', '士大夫1', '2022-02-28 13:56:03.298800');

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES ('1', '2022-02-28 14:14:14.988605', '1', '1');

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES ('1', '北京', '北京', '2022-02-22 09:43:21.537115');
INSERT INTO `organization_citydict` VALUES ('2', '天津', '天津', '2022-02-22 09:45:44.814066');
INSERT INTO `organization_citydict` VALUES ('3', '上海', '上海', '2022-02-22 09:46:37.827903');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `tag` varchar(10) NOT NULL,
  `category` varchar(20) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fac_nums` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `address` varchar(150) NOT NULL,
  `students` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES ('1', '测试机构', '测试机构', '测试', 'pxjg', '30', '0', 'Org/2022/02/bjdx.jpg', '北京海淀', '0', '2022-02-22 09:47:43.460486', '1');
INSERT INTO `organization_courseorg` VALUES ('2', '测试机构1', '测试机构1', '测试1', 'pxjg', '2', '0', 'Org/2022/02/imooc.png', '天津', '0', '2022-02-22 09:48:31.297551', '2');
INSERT INTO `organization_courseorg` VALUES ('3', '测试机构2', '测试机构2', '测试2', 'gx', '1', '0', 'Org/2022/02/njdx.jpg', '上海', '0', '2022-02-22 09:49:19.450841', '3');
INSERT INTO `organization_courseorg` VALUES ('4', '测试机构3', '测试机构3', '测试3', 'gr', '1', '0', 'Org/2022/02/qhdx-logo.png', '北京海淀', '0', '2022-02-22 09:50:29.578948', '1');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` varchar(10) DEFAULT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `click_nums` int(11) NOT NULL,
  `fac_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES ('1', '测试', '', '2', '测试', '测试', '测试', '', '20', '0', '2022-02-22 09:51:04.287731', '1');
INSERT INTO `organization_teacher` VALUES ('2', '测试1', '', '2', '测试1', '测试1', '测试1', 'teacher/2022/02/aobama.png', '3', '0', '2022-02-22 09:51:31.316339', '2');
INSERT INTO `organization_teacher` VALUES ('3', '测试3', '', '4', '测试3', '测试3', '测试3', 'teacher/2022/02/aobama_Q2cV5H5.png', '3', '0', '2022-02-22 09:51:53.971402', '3');
INSERT INTO `organization_teacher` VALUES ('4', '测试3', '', '4', '测试3', '测试3', '测试3', '', '0', '0', '2022-02-22 09:51:58.279498', '4');
INSERT INTO `organization_teacher` VALUES ('5', '测试3', '', '4', '测试3', '测试3', '测试3', '', '0', '0', '2022-02-22 09:52:04.306345', '2');
INSERT INTO `organization_teacher` VALUES ('6', '测试3', '', '5', '测试3', '测试3', '测试3', '', '2', '0', '2022-02-22 09:52:12.111479', '1');
INSERT INTO `organization_teacher` VALUES ('7', 'teacher1', '1', '1', '1', '1', '1', '', '0', '0', '2022-02-23 15:19:00.000000', '1');
INSERT INTO `organization_teacher` VALUES ('8', 'teacher2', '2', '2', '2', '2', '2', '', '0', '0', '2022-02-23 15:20:00.000000', '1');
INSERT INTO `organization_teacher` VALUES ('9', 'teacher3', '3', '3', '3', '3', '3', '', '0', '0', '2022-02-23 15:20:00.000000', '1');
INSERT INTO `organization_teacher` VALUES ('10', 'teacher4', '4', '4', '4', '4', '4', '', '0', '0', '2022-02-23 15:21:00.000000', '1');

-- ----------------------------
-- Table structure for social_auth_association
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_association`;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_association
-- ----------------------------

-- ----------------------------
-- Table structure for social_auth_code
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_code`;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_code
-- ----------------------------

-- ----------------------------
-- Table structure for social_auth_nonce
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_nonce`;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_nonce
-- ----------------------------

-- ----------------------------
-- Table structure for social_auth_partial
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_partial`;
CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_partial
-- ----------------------------

-- ----------------------------
-- Table structure for social_auth_usersocialauth
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_usersocialauth`;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersoci_user_id_17d28448_fk_users_use` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersoci_user_id_17d28448_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_usersocialauth
-- ----------------------------

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_banner
-- ----------------------------

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(30) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birday` varchar(10) DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$260000$k8wsOyAJYp9QYgXbMO9HI2$FO0JJkKsF0dDhOZuy2ZnIs4DA7H8tj1a0w3DWqNlEMU=', '2022-03-07 17:02:26.946506', '1', 'admin', '', '', 'admin@qq.com', '1', '1', '2022-02-21 15:28:54.488265', '', '', 'female', '', '', 'image/default.png');
INSERT INTO `users_userprofile` VALUES ('2', 'pbkdf2_sha256$260000$O8hLGgSWUz6ENdFJQcm4B2$B4fHsDMECjaP/YeLOQnC3PvEYT/VysnY+RwbNF6avhs=', null, '0', 'demo', '', '', '154080796@qq.com', '0', '1', '2022-03-02 17:08:40.866147', 'demo', '', 'female', '北京海淀', '', 'image/default.png');
INSERT INTO `users_userprofile` VALUES ('3', 'pbkdf2_sha256$260000$uZpfsrNMAohw1gZAkA5tot$g3iBsee18uZRz//8uocApRw9nJ/clOwj/87CinKGCmU=', null, '0', 'demo1', '', '', '154056724@qq.com', '0', '1', '2022-03-02 17:11:58.592211', 'demo', '', 'female', '', '', 'image/default.png');
INSERT INTO `users_userprofile` VALUES ('4', 'pbkdf2_sha256$260000$E9TEbzAEJILtQZU1EsItHU$DGbb1NMBnGJMe3un0KwBDdfn4fH2Kv3aKPT8/tUcnPA=', null, '0', 'demo2', '', '', '154236724@qq.com', '0', '0', '2022-03-02 17:49:08.078703', 'demo', '', 'female', '', '', 'image/default.png');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userprofile_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userprofile_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------
