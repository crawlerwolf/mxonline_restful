/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : mxonline

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2022-03-04 12:02:12
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

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
INSERT INTO `auth_permission` VALUES ('8', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add user', '6', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('22', 'Can change user', '6', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete user', '6', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('24', 'Can add 轮播图', '7', 'add_banner');
INSERT INTO `auth_permission` VALUES ('25', 'Can change 轮播图', '7', 'change_banner');
INSERT INTO `auth_permission` VALUES ('26', 'Can delete 轮播图', '7', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('27', 'Can add 邮箱验证码', '8', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('28', 'Can change 邮箱验证码', '8', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('29', 'Can delete 邮箱验证码', '8', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('30', 'Can view 轮播图', '7', 'view_banner');
INSERT INTO `auth_permission` VALUES ('31', 'Can view 邮箱验证码', '8', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('32', 'Can view user', '6', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 课程', '9', 'add_course');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 课程', '9', 'change_course');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 课程', '9', 'delete_course');
INSERT INTO `auth_permission` VALUES ('36', 'Can add 课程资源', '10', 'add_courseresource');
INSERT INTO `auth_permission` VALUES ('37', 'Can change 课程资源', '10', 'change_courseresource');
INSERT INTO `auth_permission` VALUES ('38', 'Can delete 课程资源', '10', 'delete_courseresource');
INSERT INTO `auth_permission` VALUES ('39', 'Can add 章节', '11', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('40', 'Can change 章节', '11', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('41', 'Can delete 章节', '11', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('42', 'Can add 视频', '12', 'add_video');
INSERT INTO `auth_permission` VALUES ('43', 'Can change 视频', '12', 'change_video');
INSERT INTO `auth_permission` VALUES ('44', 'Can delete 视频', '12', 'delete_video');
INSERT INTO `auth_permission` VALUES ('45', 'Can view 课程', '9', 'view_course');
INSERT INTO `auth_permission` VALUES ('46', 'Can view 课程资源', '10', 'view_courseresource');
INSERT INTO `auth_permission` VALUES ('47', 'Can view 章节', '11', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 视频', '12', 'view_video');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 城市', '13', 'add_citydict');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 城市', '13', 'change_citydict');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 城市', '13', 'delete_citydict');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 课程机构', '14', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 课程机构', '14', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 课程机构', '14', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 教师', '15', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 教师', '15', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 教师', '15', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('58', 'Can view 城市', '13', 'view_citydict');
INSERT INTO `auth_permission` VALUES ('59', 'Can view 课程机构', '14', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 教师', '15', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 课程评论', '16', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 课程评论', '16', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 课程评论', '16', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('64', 'Can add 用户咨询', '17', 'add_userask');
INSERT INTO `auth_permission` VALUES ('65', 'Can change 用户咨询', '17', 'change_userask');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete 用户咨询', '17', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('67', 'Can add 用户课程', '18', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('68', 'Can change 用户课程', '18', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete 用户课程', '18', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('70', 'Can add 用户收藏', '19', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('71', 'Can change 用户收藏', '19', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('72', 'Can delete 用户收藏', '19', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('73', 'Can add 用户消息', '20', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('74', 'Can change 用户消息', '20', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete 用户消息', '20', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 课程评论', '16', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('77', 'Can view 用户咨询', '17', 'view_userask');
INSERT INTO `auth_permission` VALUES ('78', 'Can view 用户课程', '18', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('79', 'Can view 用户收藏', '19', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 用户消息', '20', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('81', 'Can add Bookmark', '21', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('82', 'Can change Bookmark', '21', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete Bookmark', '21', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('84', 'Can add User Setting', '22', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('85', 'Can change User Setting', '22', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('86', 'Can delete User Setting', '22', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('87', 'Can add User Widget', '23', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('88', 'Can change User Widget', '23', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('89', 'Can delete User Widget', '23', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('90', 'Can add log entry', '24', 'add_log');
INSERT INTO `auth_permission` VALUES ('91', 'Can change log entry', '24', 'change_log');
INSERT INTO `auth_permission` VALUES ('92', 'Can delete log entry', '24', 'delete_log');
INSERT INTO `auth_permission` VALUES ('93', 'Can view Bookmark', '21', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('94', 'Can view log entry', '24', 'view_log');
INSERT INTO `auth_permission` VALUES ('95', 'Can view User Setting', '22', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('96', 'Can view User Widget', '23', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('97', 'Can add captcha store', '25', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('98', 'Can change captcha store', '25', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete captcha store', '25', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('100', 'Can view captcha store', '25', 'view_captchastore');
INSERT INTO `auth_permission` VALUES ('101', 'Can view 轮播课程', '26', 'view_bannercourse');
INSERT INTO `auth_permission` VALUES ('102', 'Can add 轮播课程', '26', 'add_bannercourse');
INSERT INTO `auth_permission` VALUES ('103', 'Can change 轮播课程', '26', 'change_bannercourse');
INSERT INTO `auth_permission` VALUES ('104', 'Can delete 轮播课程', '26', 'delete_bannercourse');

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
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES ('171', 'GQOH', 'gqoh', '2b65f3154b3f5be9a511654a10fdbe8ee6519f3d', '2022-02-22 10:49:01.860094');
INSERT INTO `captcha_captchastore` VALUES ('172', 'CZHL', 'czhl', 'b64f9e7b38f18c5022b092b5fcffedf5e7ecd4bb', '2022-02-22 10:49:10.484065');

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `need_know` varchar(300) NOT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_organizat` (`course_org_id`),
  KEY `courses_course_teacher_id_846fa526_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES ('1', 'Django1', 'Django1', 'Django1', 'cj', '0', '1', '1', 'courses/2019/06/python错误和异常.jpg', '39', '2019-06-13 17:29:00.000000', '1', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('2', 'Django12', 'Django12', 'Django12', 'cj', '0', '1', '0', 'courses/2019/06/python错误和异常_eE72xwp.jpg', '7', '2019-06-19 17:14:00.000000', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('3', 'Django123', 'Django123', 'Django123', 'cj', '0', '1', '0', 'courses/2019/06/python错误和异常_5Cubvv1.jpg', '4', '2019-06-19 17:19:00.000000', '3', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('4', 'python1', 'python1', 'python1', 'zj', '0', '0', '0', 'courses/2019/06/python面向对象.jpg', '6', '2019-06-19 17:20:00.000000', '1', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('5', 'python12', 'python12', 'python12', 'zj', '0', '0', '0', 'courses/2019/06/python面向对象_JFyZ5Px.jpg', '3', '2019-06-19 17:20:00.000000', '2', '后端开发', '', null, '', '', '0');
INSERT INTO `courses_course` VALUES ('6', 'python123', 'python123', 'python123', 'zj', '0', '0', '1', 'courses/2019/06/python面向对象_XUqZGB1.jpg', '6', '2019-06-19 17:20:00.000000', '3', '后端开发', 'python', '3', '*****', 'python 进阶开发', '1');
INSERT INTO `courses_course` VALUES ('7', 'python进阶', 'python进阶', 'python进阶', 'gj', '0', '0', '0', 'courses/2019/06/python文件处理.jpg', '33', '2019-06-19 17:21:00.000000', '1', '后端开发', 'python', '2', '*****', '******', '1');
INSERT INTO `courses_course` VALUES ('8', 'python进阶1', 'python进阶1', 'python进阶1', 'gj', '0', '1', '0', 'courses/2019/06/python文件处理_YAyp2O6.jpg', '20', '2019-06-19 17:21:00.000000', '2', '后端开发', 'python', '1', '*****', '****', '1');
INSERT INTO `courses_course` VALUES ('9', 'python进阶12', 'python进阶12', 'python进阶12', 'gj', '0', '0', '0', 'courses/2019/06/python文件处理_wgi7VIz.jpg', '2', '2019-06-19 17:21:00.000000', '3', '后端开发', 'python', null, '*****', '******', '0');
INSERT INTO `courses_course` VALUES ('10', 'python入门', 'python入门', 'python入门', 'cj', '0', '1', '0', 'courses/2019/06/python错误和异常_fnuO03g.jpg', '125', '2019-06-19 17:22:00.000000', '1', '后端开发', 'python', '1', 'python基数', 'python 进阶开发', '0');
INSERT INTO `courses_course` VALUES ('11', 'python进阶111', 'python进阶111', 'python进阶111', 'cj', '0', '0', '0', '', '1', '2019-07-02 10:16:00.000000', '1', '后端开发', 'python进阶11', '1', 'python进阶111', 'python进阶111', '0');
INSERT INTO `courses_course` VALUES ('12', 'sdafsdafsdafds', 'adfasdfsdafsdaf', '<p>sdfsdafsdafsdaf</p><p><img src=\"/media/courses/ueditor/aobama_20190702131631_360.png\" title=\"\" alt=\"aobama.png\"/> <br/> </p><table><tbody><tr class=\"firstRow\"><td width=\"563\" valign=\"top\" style=\"word-break: break-all;\">sdfadfasdf ds</td></tr></tbody></table><p>2019-07-02<img src=\"http://img.baidu.com/hi/jx2/j_0017.gif\"/>&nbsp;</p>', 'cj', '0', '1', '0', '', '18', '2019-07-02 13:16:00.000000', '1', '后端开发', 'afdsdafsda', '1', 'afsdafsdafsda', 'afsdafsdafsd', '0');

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES ('1', '1234', 'course/resource/2019/06/02.jpg', '2019-06-14 09:13:00.000000', '1');
INSERT INTO `courses_courseresource` VALUES ('2', '课程文件', 'course/resource/2019/06/style_VVc2KN6.css', '2019-06-20 16:03:00.000000', '10');

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES ('2', '第一章  基础知识', '2019-06-20 15:34:00.000000', '10');
INSERT INTO `courses_lesson` VALUES ('3', '第二章 进阶开发', '2019-06-20 15:34:00.000000', '10');
INSERT INTO `courses_lesson` VALUES ('4', '第三章 委任为人', '2019-06-21 11:15:00.000000', '10');
INSERT INTO `courses_lesson` VALUES ('5', '第四章 为人父微软发', '2019-06-21 11:16:00.000000', '10');
INSERT INTO `courses_lesson` VALUES ('6', '第五章 微软为', '2019-06-21 11:17:00.000000', '10');
INSERT INTO `courses_lesson` VALUES ('7', '第六章 微软w', '2019-06-21 11:17:00.000000', '10');

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES ('2', '1.1 hello worde', '2019-06-20 15:38:00.000000', '2', 'http://vjs.zencdn.net/v/oceans.mp4', '0');
INSERT INTO `courses_video` VALUES ('3', '1.2 基础知识', '2019-06-20 15:43:00.000000', '2', 'https://www.baidu.com', '0');
INSERT INTO `courses_video` VALUES ('4', '2.1 test', '2019-06-20 15:44:00.000000', '3', 'https://www.baidu.com', '0');
INSERT INTO `courses_video` VALUES ('5', '2.2 test2', '2019-06-20 15:44:00.000000', '3', 'https://www.baidu.com', '0');
INSERT INTO `courses_video` VALUES ('6', '手动阀', '2019-06-21 11:16:00.000000', '5', 'https://www.baidu.com', '0');
INSERT INTO `courses_video` VALUES ('7', '五十分', '2019-06-21 11:16:00.000000', '4', 'https://www.baidu.com', '0');
INSERT INTO `courses_video` VALUES ('8', '1234', '2019-06-21 11:17:00.000000', '6', 'https://www.baidu.com', '0');
INSERT INTO `courses_video` VALUES ('9', '1234', '2019-06-21 11:17:00.000000', '7', 'https://www.baidu.com', '0');

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
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('25', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('26', 'courses', 'bannercourse');
INSERT INTO `django_content_type` VALUES ('9', 'courses', 'course');
INSERT INTO `django_content_type` VALUES ('10', 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES ('11', 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES ('12', 'courses', 'video');
INSERT INTO `django_content_type` VALUES ('16', 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('17', 'operation', 'userask');
INSERT INTO `django_content_type` VALUES ('18', 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES ('19', 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('20', 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES ('13', 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES ('14', 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('15', 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-06-13 17:25:38.583006');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2019-06-13 17:25:39.625219');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2019-06-13 17:25:44.191022');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2019-06-13 17:25:44.710617');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2019-06-13 17:25:44.743532');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2019-06-13 17:25:44.786416');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2019-06-13 17:25:44.819328');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2019-06-13 17:25:44.857226');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2019-06-13 17:25:44.919061');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2019-06-13 17:25:44.962942');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2019-06-13 17:25:45.001840');
INSERT INTO `django_migrations` VALUES ('12', 'users', '0001_initial', '2019-06-13 17:25:50.124138');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0001_initial', '2019-06-13 17:25:52.242473');
INSERT INTO `django_migrations` VALUES ('14', 'admin', '0002_logentry_remove_auto_add', '2019-06-13 17:25:52.355173');
INSERT INTO `django_migrations` VALUES ('15', 'courses', '0001_initial', '2019-06-13 17:25:55.473831');
INSERT INTO `django_migrations` VALUES ('16', 'operation', '0001_initial', '2019-06-13 17:25:57.743759');
INSERT INTO `django_migrations` VALUES ('17', 'operation', '0002_auto_20190613_1724', '2019-06-13 17:26:04.008007');
INSERT INTO `django_migrations` VALUES ('18', 'organization', '0001_initial', '2019-06-13 17:26:06.656922');
INSERT INTO `django_migrations` VALUES ('19', 'sessions', '0001_initial', '2019-06-13 17:26:07.080786');
INSERT INTO `django_migrations` VALUES ('20', 'xadmin', '0001_initial', '2019-06-13 17:26:11.172842');
INSERT INTO `django_migrations` VALUES ('21', 'xadmin', '0002_log', '2019-06-13 17:26:13.348025');
INSERT INTO `django_migrations` VALUES ('22', 'xadmin', '0003_auto_20160715_0100', '2019-06-13 17:26:14.305465');
INSERT INTO `django_migrations` VALUES ('23', 'captcha', '0001_initial', '2019-06-14 16:03:06.993106');
INSERT INTO `django_migrations` VALUES ('24', 'courses', '0002_auto_20190614_1602', '2019-06-14 16:03:07.040980');
INSERT INTO `django_migrations` VALUES ('25', 'courses', '0003_auto_20190617_0859', '2019-06-17 09:00:06.500847');
INSERT INTO `django_migrations` VALUES ('26', 'operation', '0003_auto_20190617_0859', '2019-06-17 09:00:09.900754');
INSERT INTO `django_migrations` VALUES ('27', 'organization', '0002_auto_20190617_0859', '2019-06-17 09:00:11.549344');
INSERT INTO `django_migrations` VALUES ('28', 'organization', '0003_auto_20190618_1041', '2019-06-18 10:41:55.937426');
INSERT INTO `django_migrations` VALUES ('29', 'organization', '0004_auto_20190618_1331', '2019-06-18 13:32:05.261845');
INSERT INTO `django_migrations` VALUES ('30', 'courses', '0004_course_course_org', '2019-06-19 10:37:31.547488');
INSERT INTO `django_migrations` VALUES ('31', 'organization', '0005_teacher_image', '2019-06-19 12:38:55.150908');
INSERT INTO `django_migrations` VALUES ('32', 'courses', '0005_course_category', '2019-06-20 12:44:46.642714');
INSERT INTO `django_migrations` VALUES ('33', 'courses', '0006_course_tag', '2019-06-20 13:37:00.158138');
INSERT INTO `django_migrations` VALUES ('34', 'courses', '0007_video_url', '2019-06-20 15:38:13.812371');
INSERT INTO `django_migrations` VALUES ('35', 'courses', '0008_video_learn_times', '2019-06-20 16:01:52.216579');
INSERT INTO `django_migrations` VALUES ('36', 'courses', '0009_course_teacher', '2019-06-20 16:17:52.822531');
INSERT INTO `django_migrations` VALUES ('37', 'courses', '0010_auto_20190620_1619', '2019-06-20 16:19:34.088291');
INSERT INTO `django_migrations` VALUES ('38', 'courses', '0011_auto_20190620_1626', '2019-06-20 16:26:30.984305');
INSERT INTO `django_migrations` VALUES ('39', 'organization', '0006_teacher_age', '2019-06-24 17:12:04.315372');
INSERT INTO `django_migrations` VALUES ('40', 'users', '0002_auto_20190627_1505', '2019-06-27 15:05:19.755737');
INSERT INTO `django_migrations` VALUES ('41', 'users', '0003_auto_20190627_1608', '2019-06-27 16:08:53.509217');
INSERT INTO `django_migrations` VALUES ('42', 'users', '0004_auto_20190627_1617', '2019-06-27 16:17:20.054217');
INSERT INTO `django_migrations` VALUES ('43', 'courses', '0012_course_is_banner', '2019-06-28 15:37:22.483675');
INSERT INTO `django_migrations` VALUES ('44', 'users', '0005_auto_20190628_1537', '2019-06-28 15:37:22.562463');
INSERT INTO `django_migrations` VALUES ('45', 'organization', '0007_courseorg_tag', '2019-06-28 16:03:52.316805');
INSERT INTO `django_migrations` VALUES ('46', 'courses', '0013_bannercourse', '2019-07-02 10:19:34.176897');
INSERT INTO `django_migrations` VALUES ('47', 'organization', '0008_auto_20190702_1019', '2019-07-02 10:19:34.350432');
INSERT INTO `django_migrations` VALUES ('48', 'admin', '0003_logentry_add_action_flag_choices', '2020-10-15 11:37:44.764552');
INSERT INTO `django_migrations` VALUES ('49', 'auth', '0010_alter_group_name_max_length', '2020-10-15 11:37:45.965955');
INSERT INTO `django_migrations` VALUES ('50', 'auth', '0011_update_proxy_permissions', '2020-10-15 11:37:46.130544');

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
INSERT INTO `django_session` VALUES ('1cc8wfs5b41jrtsb6adfqpsf54wz4z63', 'MmU0ZGU0N2NjODcxMjA5OWIwN2I3ZDQ5YTM2NDE5MDE4MDQ0ODI1MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjI2ZWIyY2UyNjdmYWMxMTY0NjBiZDBmYzc5OWVjYWI2NTA1YWVkYjQifQ==', '2022-03-17 09:19:21.783904');
INSERT INTO `django_session` VALUES ('ev89ht1i47vm6r3ul8py2e9fkekwmdzy', 'Mjc4MmEzNTMxNjZkZGMwNGQ2YmUwODk2MzNhYzZhNjYyODFiYmVhYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImRhMzAwOWNjOTY3MjQzYjQwMWMyNDdiYTdlZTI2MGExZjI3Y2E1OTUifQ==', '2022-03-11 14:55:29.073711');
INSERT INTO `django_session` VALUES ('hfvxmpfrbnro1nz2vsmufzasxdxoxjvq', '.eJxVjMsOwiAQRf-FtSEz5SG4dN9vIANMpWogKe3K-O_apAvd3nPOfYlA21rC1nkJcxYXgeL0u0VKD647yHeqtyZTq-syR7kr8qBdji3z83q4fweFevnWEYAws7MJzjk5sIMFMEZNxFolT94y-wESgkGjmSblNUbU7C0ZdijeH9YoN18:1nOcbT:_k632PvczDc5TwjaH7QejK2_0e4Xlowpz5RDR9CzUSM', '2022-03-14 17:46:03.585120');
INSERT INTO `django_session` VALUES ('k5rr0m7sxtr8wcw3yk1t4cnudf01c6fn', '.eJxVjDkOwjAUBe_iGlnxktifkp4zRH8TDiBHipMKcXeIlALaNzPvZUbc1jJuTZdxEnM2zpx-N0J-aN2B3LHeZstzXZeJ7K7YgzZ7nUWfl8P9OyjYyrdOKWVF7CMkZJABaIjsOYCXqNI5UggQmJg66QgyQMq-HxyouKC9N-8P6AU3vw:1nPane:Z4vg4C7_otnkNuAdWbPykLmbjUmOw236Jeh2Rcj5XMM', '2022-03-17 10:02:38.145696');
INSERT INTO `django_session` VALUES ('xpfjkphnfulsr5kwhh7xjab75bia4cw2', 'Mjc4MmEzNTMxNjZkZGMwNGQ2YmUwODk2MzNhYzZhNjYyODFiYmVhYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImRhMzAwOWNjOTY3MjQzYjQwMWMyNDdiYTdlZTI2MGExZjI3Y2E1OTUifQ==', '2022-03-11 17:10:20.231684');
INSERT INTO `django_session` VALUES ('z0gd06st9z32lnwotavmw6ll39r4zjd5', 'Mjc4MmEzNTMxNjZkZGMwNGQ2YmUwODk2MzNhYzZhNjYyODFiYmVhYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImRhMzAwOWNjOTY3MjQzYjQwMWMyNDdiYTdlZTI2MGExZjI3Y2E1OTUifQ==', '2022-03-11 13:49:07.577119');

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomm_user_id_f5ff70b3_fk_users_use` (`user_id`),
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------
INSERT INTO `operation_coursecomments` VALUES ('1', '21qwweffgagwfgEAGDGVSDAFG', '2019-06-21 09:46:00.000000', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('8', '134123rGAHgrwabn', '2019-06-21 09:55:00.000000', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('9', '将来收到附近拉水电费就算了咖啡机经过几分动感', '2019-06-21 10:48:23.208583', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('10', '三大傻', '2019-06-21 10:48:50.750356', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('11', '傻大个WEAG', '2019-06-21 10:49:27.705117', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('12', 'WERWE RT', '2019-06-21 10:50:12.018637', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('13', '三大傻', '2019-06-21 10:53:17.071187', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('14', '适当放松的感受到', '2019-06-21 10:54:36.487952', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('15', '道森股份哈弗就是让他他', '2019-06-21 10:55:59.070244', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('16', '手工达人会进入他和人', '2019-06-21 10:56:18.402553', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('17', '大时代感', '2019-06-21 10:57:48.516725', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('18', '是的噶是的噶啥副本官方', '2019-06-21 10:58:17.987994', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('19', '的杀手的阿法狗', '2019-06-21 11:14:08.769061', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('20', '问他问题啊额我', '2019-06-21 11:14:13.943267', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('21', '人噶热阿根廷啊如果啊人噶热', '2019-06-21 11:14:17.555580', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('22', '温热给他热狗热管换热啊和然而', '2019-06-21 11:14:21.264692', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('23', '天热给热热热热', '2019-06-21 11:14:26.942523', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('24', '无人敢惹噶热高热噶热高热爱国哈人', '2019-06-21 11:14:33.015263', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('25', '将来收到附近拉水电费就算了咖啡机经过几分动感', '2019-06-21 11:14:44.115599', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('26', '将来收到附近拉水电费就算了咖啡机经过几分动感', '2019-06-21 11:14:47.832665', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('27', '将来收到附近拉水电费就算了咖啡机经过几分动感\n', '2019-06-21 11:14:51.047073', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('28', '将来收到附近拉水电费就算了咖啡机经过几分动感', '2019-06-21 11:14:54.319329', '10', '1');
INSERT INTO `operation_coursecomments` VALUES ('29', '将来收到附近拉水电费就算了咖啡机经过几分动感', '2019-06-21 11:14:58.328614', '10', '1');

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------
INSERT INTO `operation_userask` VALUES ('1', '1234', '2321123222', 'django1', '2019-06-18 16:02:23.120441');
INSERT INTO `operation_userask` VALUES ('5', '1234', '13845678910', 'deadddf', '2019-06-18 16:16:32.752917');
INSERT INTO `operation_userask` VALUES ('6', '1234', '13845678910', 'deadddf', '2019-06-18 16:16:32.747930');
INSERT INTO `operation_userask` VALUES ('7', '1234', '13945678910', '1334534534', '2019-06-18 16:22:09.258266');
INSERT INTO `operation_userask` VALUES ('8', '1234', '13945678910', '1334534534', '2019-06-18 16:22:09.265248');
INSERT INTO `operation_userask` VALUES ('9', '1234', '18645678910', '213213', '2019-06-18 16:25:53.574339');
INSERT INTO `operation_userask` VALUES ('10', '154080726@qq.com', '13612345678', '问问问v', '2020-10-15 10:55:35.039703');

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES ('1', '2019-06-20 12:54:00.000000', '10', '1');
INSERT INTO `operation_usercourse` VALUES ('6', '2019-06-21 14:18:00.000000', '6', '1');
INSERT INTO `operation_usercourse` VALUES ('7', '2019-06-21 15:53:04.681709', '7', '1');
INSERT INTO `operation_usercourse` VALUES ('9', '2019-06-28 15:07:14.666229', '3', '1');
INSERT INTO `operation_usercourse` VALUES ('10', '2019-06-28 15:07:30.081009', '2', '1');
INSERT INTO `operation_usercourse` VALUES ('11', '2019-06-28 15:10:15.826076', '1', '1');
INSERT INTO `operation_usercourse` VALUES ('12', '2019-07-02 13:28:26.177111', '12', '1');
INSERT INTO `operation_usercourse` VALUES ('13', '2022-02-25 14:09:24.299303', '8', '1');

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES ('42', '2', '2', '2019-06-28 10:40:19.407539', '1');
INSERT INTO `operation_userfavorite` VALUES ('50', '6', '1', '2019-06-28 15:22:10.400157', '1');
INSERT INTO `operation_userfavorite` VALUES ('52', '1', '3', '2019-06-28 17:34:07.800290', '1');
INSERT INTO `operation_userfavorite` VALUES ('53', '1', '1', '2019-07-01 12:40:21.023629', '1');

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------
INSERT INTO `operation_usermessage` VALUES ('1', '1', 'WFWEF EQFGQRE', '1', '2019-06-28 13:08:00.000000');
INSERT INTO `operation_usermessage` VALUES ('2', '1', 'WFWEF EQFGQRE213213213', '1', '2019-06-28 13:37:00.000000');
INSERT INTO `operation_usermessage` VALUES ('3', '1', 'WFWEF EQFGQRE213213213阿发是否', '1', '2019-06-28 13:43:00.000000');
INSERT INTO `operation_usermessage` VALUES ('4', '21', '恭喜你成功注册慕学在线网会员', '1', '2019-06-28 14:51:19.328758');
INSERT INTO `operation_usermessage` VALUES ('5', '22', '恭喜你成功注册慕学在线网会员', '0', '2019-09-06 11:01:37.875923');
INSERT INTO `operation_usermessage` VALUES ('6', '24', '恭喜你成功注册慕学在线网会员', '0', '2020-10-15 11:20:43.663661');

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES ('1', '北京市', '北京市', '2019-06-18 10:18:00.000000');
INSERT INTO `organization_citydict` VALUES ('2', '上海市', '上海市', '2019-06-18 10:18:00.000000');
INSERT INTO `organization_citydict` VALUES ('3', '广州市', '广州市', '2019-06-18 10:18:00.000000');
INSERT INTO `organization_citydict` VALUES ('4', '深圳市', '深圳市', '2019-06-18 10:18:00.000000');
INSERT INTO `organization_citydict` VALUES ('5', '天津市', '天津市', '2019-06-18 10:19:00.000000');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fac_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES ('1', '慕课网', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。\r\n4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', '79', '0', 'Org/2019/06/imooc.png', '北京市', '2019-06-18 10:21:00.000000', '1', 'pxjg', '6', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('2', '慕课网1', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', '6', '0', 'Org/2019/06/imooc_Gn1sRjp.png', '上海市', '2019-06-18 10:32:00.000000', '2', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('3', '慕课网12', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', '0', '0', 'Org/2019/06/imooc_klgAUn5.png', '广州市', '2019-06-18 10:33:00.000000', '3', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('4', '慕课网213', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', '1', '0', 'Org/2019/06/imooc_OO2ykYP.png', '深圳市', '2019-06-18 10:33:00.000000', '4', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('5', '慕课网231', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', '2', '0', 'Org/2019/06/imooc_qEaMov1.png', '天津市', '2019-06-18 10:34:00.000000', '5', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('6', '慕课网1234', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', '3', '0', 'Org/2019/06/imooc_V0TJOyb.png', '北京市', '2019-06-18 10:35:00.000000', '3', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('7', '慕课网5', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', '0', '0', 'Org/2019/06/imooc_Y2Tonsq.png', '广州市', '2019-06-18 10:35:00.000000', '2', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('8', '慕课网6', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', '2', '0', 'Org/2019/06/imooc_klgAUn5_64RURTf.png', '深圳市', '2019-06-18 10:36:00.000000', '3', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('9', '慕课网8', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', '0', '0', 'Org/2019/06/imooc_Gn1sRjp_QSVfLjg.png', '天津市', '2019-06-18 10:36:00.000000', '4', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('10', '慕课网9', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', '2', '0', 'Org/2019/06/imooc_klgAUn5_7HPfoSL.png', '上海市', '2019-06-18 10:36:00.000000', '3', 'pxjg', '0', '0', '全国知名');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fac_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `age` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES ('1', 'test', '5', 'xxx', 'xxx', 'xxx', '75', '1', '2019-06-19 10:27:00.000000', '1', 'teacher/2019/06/aobama.png', null);
INSERT INTO `organization_teacher` VALUES ('2', 'test1', '5', 'xxx', 'xxx', 'xxx', '4', '0', '2019-06-19 10:27:00.000000', '2', 'teacher/2019/06/aobama_CXWwMef.png', null);
INSERT INTO `organization_teacher` VALUES ('3', '1234', '5', 'xxx', 'xxx', 'xxx', '4', '0', '2019-06-19 13:45:00.000000', '1', 'teacher/2019/06/aobama_CXWwMef_IcZ1COt.png', null);

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_banner
-- ----------------------------
INSERT INTO `users_banner` VALUES ('1', 'rwerwerwe', 'banner/2019/06/57a801860001c34b12000460.jpg', 'https://www.baidu.com', '1', '2019-06-28 15:42:00.000000');
INSERT INTO `users_banner` VALUES ('2', 'rwerwerwedfds', 'banner/2019/06/57a801860001c34b12000460_z4Vb8zl.jpg', 'https://www.baidu.com', '2', '2019-06-28 15:43:00.000000');
INSERT INTO `users_banner` VALUES ('3', 'sdfasgasd g', 'banner/2019/06/57aa86a0000145c512000460.jpg', 'https://www.baidu.com', '3', '2019-06-28 15:43:00.000000');
INSERT INTO `users_banner` VALUES ('4', 'dafDSGdgSD', 'banner/2019/06/57aa86a0000145c512000460_GXIBATC.jpg', 'https://www.baidu.com', '4', '2019-06-28 15:43:00.000000');
INSERT INTO `users_banner` VALUES ('5', 'SDAGsbRGe', 'banner/2019/06/57aa86a0000145c512000460_nMwvoQD.jpg', 'https://www.baidu.com', '5', '2019-06-28 15:44:00.000000');

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(30) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES ('1', 'cbXa4cQZEvGrXOx5', 'user@qq.com', 'register', '2019-06-17 11:12:12.228495');
INSERT INTO `users_emailverifyrecord` VALUES ('2', 'mOqucbSiOoykNK2H', '13653303602@163.com', 'register', '2019-06-17 12:56:07.875815');
INSERT INTO `users_emailverifyrecord` VALUES ('3', '7ZG3qwVqsBdvk7PM', '13653303602@163.com', 'register', '2019-06-17 12:58:21.291670');
INSERT INTO `users_emailverifyrecord` VALUES ('4', 'c3mSrIflCokFcdgi', '13653303602@163.com', 'register', '2019-06-17 13:01:08.818373');
INSERT INTO `users_emailverifyrecord` VALUES ('5', 'tAzKnUnjcLheUx2u', '13653303602@163.com', 'register', '2019-06-17 13:33:35.395856');
INSERT INTO `users_emailverifyrecord` VALUES ('6', 'ts6Y1pkxGegKuFXP', '13653303602@163.com', 'register', '2019-06-17 13:44:30.261742');
INSERT INTO `users_emailverifyrecord` VALUES ('7', '2V5MPM51uMejJsfh', '13653303602@163.com', 'forget', '2019-06-17 15:55:11.668331');
INSERT INTO `users_emailverifyrecord` VALUES ('8', 'Kg97dU9aPwFupe91', '13653303602@163.com', 'register', '2019-06-17 16:57:13.412257');
INSERT INTO `users_emailverifyrecord` VALUES ('9', 'R7o1PvyI1POK9HL2', '384499520@qq.com', 'register', '2019-06-17 17:40:49.454342');
INSERT INTO `users_emailverifyrecord` VALUES ('10', '5xksUQW28nBJrPlj', '154080724@qq.com', 'register', '2019-06-26 14:51:26.803645');
INSERT INTO `users_emailverifyrecord` VALUES ('11', 'qrZ6Qe', '154080724@qq.com', 'updata', '2019-06-27 11:29:48.144501');
INSERT INTO `users_emailverifyrecord` VALUES ('12', 'a6GlQs', '154080724@qq.com', 'updata', '2019-06-27 11:31:58.287569');
INSERT INTO `users_emailverifyrecord` VALUES ('13', '3iHOCx', '154080724@qq.com', 'updata', '2019-06-27 11:34:40.678962');
INSERT INTO `users_emailverifyrecord` VALUES ('14', 'QNjSWM', '154080724@qq.com', 'updata', '2019-06-27 13:13:13.729881');
INSERT INTO `users_emailverifyrecord` VALUES ('15', '2joJmL', '154080724@qq.com', 'updata', '2019-06-27 13:19:41.049482');
INSERT INTO `users_emailverifyrecord` VALUES ('16', 'B374OH', '154080724@qq.com', 'updata_email', '2019-06-27 15:06:22.281123');
INSERT INTO `users_emailverifyrecord` VALUES ('24', '746hjSlVdw07Uxb9', '154080724@qq.com', 'register', '2019-06-28 14:49:09.245768');
INSERT INTO `users_emailverifyrecord` VALUES ('29', 'KFZPrOgWk6aO7Bcd', '154080724@qq.com', 'register', '2019-09-06 11:01:37.908834');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$260000$b80hYeQSbpwHV4sQpcGYPx$Vpwp6ETEFkayGB+cOeR59ujbrNz5Dy31ivfFV/yIx+0=', '2022-03-03 10:02:38.097872', '1', 'test', '1234', '', '154080724@qq.com', '1', '1', '2019-06-13 17:28:00.000000', 'test_first', null, 'male', '****', '13612345678', 'image/2019/06/aobama_np2Jduy.png');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
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

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2019-06-13 17:29:35.247440', '127.0.0.1', '1', 'Course object (1)', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2019-06-13 17:31:31.614627', '127.0.0.1', '1', 'Lesson object (1)', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2019-06-14 09:09:46.702309', '127.0.0.1', '1', '1234', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2019-06-14 09:14:08.818250', '127.0.0.1', '1', '1234', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2019-06-18 10:18:21.609569', '127.0.0.1', '1', 'CityDict object (1)', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2019-06-18 10:18:32.113019', '127.0.0.1', '2', 'CityDict object (2)', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2019-06-18 10:18:46.672313', '127.0.0.1', '3', 'CityDict object (3)', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2019-06-18 10:19:02.390262', '127.0.0.1', '4', 'CityDict object (4)', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2019-06-18 10:19:36.090588', '127.0.0.1', '5', 'CityDict object (5)', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2019-06-18 10:26:58.295012', '127.0.0.1', '1', '慕课网', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2019-06-18 10:33:13.227410', '127.0.0.1', '2', '慕课网1', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2019-06-18 10:33:38.177679', '127.0.0.1', '3', '慕课网12', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2019-06-18 10:34:19.674691', '127.0.0.1', '4', '慕课网213', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2019-06-18 10:34:55.341297', '127.0.0.1', '5', '慕课网231', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2019-06-18 10:35:45.417191', '127.0.0.1', '6', '慕课网1234', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2019-06-18 10:36:07.483172', '127.0.0.1', '7', '慕课网5', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2019-06-18 10:36:29.133267', '127.0.0.1', '8', '慕课网6', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2019-06-18 10:36:50.141079', '127.0.0.1', '9', '慕课网8', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2019-06-18 10:37:11.668502', '127.0.0.1', '10', '慕课网9', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2019-06-19 10:27:38.604368', '127.0.0.1', '1', 'test', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2019-06-19 10:28:01.920410', '127.0.0.1', '2', 'test1', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2019-06-19 10:38:22.619373', '127.0.0.1', '1', 'Django1', 'change', '修改 course_org 和 image', '9', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2019-06-19 10:39:46.660191', '127.0.0.1', '1', 'Django1', 'change', '修改 image', '9', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2019-06-19 12:39:29.335689', '127.0.0.1', '2', 'test1', 'change', '修改 image', '15', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2019-06-19 12:44:43.936311', '127.0.0.1', '1', 'test', 'change', '修改 image', '15', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2019-06-19 13:46:15.541682', '127.0.0.1', '3', '1234', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2019-06-19 17:16:24.409747', '127.0.0.1', '2', 'Django12', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2019-06-19 17:17:57.228468', '127.0.0.1', '2', 'Django12', 'change', '修改 course_org 和 image', '9', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2019-06-19 17:19:56.146409', '127.0.0.1', '3', 'Django123', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2019-06-19 17:20:22.888883', '127.0.0.1', '4', 'python1', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2019-06-19 17:20:40.494795', '127.0.0.1', '5', 'python12', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2019-06-19 17:21:01.181465', '127.0.0.1', '6', 'python123', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2019-06-19 17:21:26.005072', '127.0.0.1', '7', 'python进阶', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2019-06-19 17:21:43.080402', '127.0.0.1', '8', 'python进阶1', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2019-06-19 17:21:59.326949', '127.0.0.1', '9', 'python进阶12', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2019-06-19 17:22:43.507784', '127.0.0.1', '10', 'python入门', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2019-06-20 12:54:23.032393', '127.0.0.1', '1', 'UserCourse object (1)', 'create', '已添加。', '18', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2019-06-20 13:45:40.483816', '127.0.0.1', '10', 'python入门', 'change', '修改 image 和 tag', '9', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2019-06-20 13:50:35.277516', '127.0.0.1', '9', 'python进阶12', 'change', '修改 image 和 tag', '9', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2019-06-20 15:34:50.470254', '127.0.0.1', '2', '第一章  基础知识', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2019-06-20 15:34:54.445018', '127.0.0.1', '2', '第一章  基础知识', 'change', '没有字段被修改。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2019-06-20 15:35:08.385581', '127.0.0.1', '3', '第二章 进阶开发', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2019-06-20 15:35:40.200640', '127.0.0.1', null, '', 'delete', '批量删除 1 个 章节', null, '1');
INSERT INTO `xadmin_log` VALUES ('44', '2019-06-20 15:40:13.656025', '127.0.0.1', '2', '1.1 hello worde', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2019-06-20 15:43:49.465070', '127.0.0.1', '3', '1.2 基础知识', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2019-06-20 15:44:19.498749', '127.0.0.1', '4', '2.1 test', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2019-06-20 15:44:38.410629', '127.0.0.1', '5', '2.2 test2', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2019-06-20 16:04:39.054637', '127.0.0.1', '2', '课程文件', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2019-06-20 16:12:23.768064', '127.0.0.1', '2', '课程文件', 'change', '修改 download', '10', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2019-06-20 16:19:52.325513', '127.0.0.1', '10', 'python入门', 'change', '修改 teacher', '9', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2019-06-20 16:28:34.376383', '127.0.0.1', '10', 'python入门', 'change', '修改 teacher_tell 和 need_know', '9', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2019-06-21 09:47:10.787730', '127.0.0.1', '1', 'CourseComments object (1)', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2019-06-21 09:48:51.691067', '127.0.0.1', '3', '', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2019-06-21 09:54:15.727605', '127.0.0.1', '7', 'python入门', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2019-06-21 09:55:19.424408', '127.0.0.1', '8', 'python入门', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2019-06-21 11:16:00.830610', '127.0.0.1', '4', '第三章 委任为人', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('57', '2019-06-21 11:16:12.970135', '127.0.0.1', '5', '第四章 为人父微软发', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('58', '2019-06-21 11:16:33.517261', '127.0.0.1', '6', '手动阀', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2019-06-21 11:16:46.173399', '127.0.0.1', '7', '五十分', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('60', '2019-06-21 11:17:16.067507', '127.0.0.1', '6', '第五章', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2019-06-21 11:17:25.891281', '127.0.0.1', '7', '第六章 微软w', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('62', '2019-06-21 11:17:29.271253', '127.0.0.1', '5', '第四章 为人父微软发', 'change', '没有字段被修改。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('63', '2019-06-21 11:17:35.510573', '127.0.0.1', '6', '第五章 微软为', 'change', '修改 name', '11', '1');
INSERT INTO `xadmin_log` VALUES ('64', '2019-06-21 11:17:49.651753', '127.0.0.1', '8', '1234', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('65', '2019-06-21 11:17:59.182282', '127.0.0.1', '9', '1234', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('66', '2019-06-21 14:17:06.129402', '127.0.0.1', '2', 'UserCourse object (2)', 'create', '已添加。', '18', '1');
INSERT INTO `xadmin_log` VALUES ('67', '2019-06-21 14:17:14.443186', '127.0.0.1', '3', 'UserCourse object (3)', 'create', '已添加。', '18', '1');
INSERT INTO `xadmin_log` VALUES ('68', '2019-06-21 14:17:25.338070', '127.0.0.1', '4', 'UserCourse object (4)', 'create', '已添加。', '18', '1');
INSERT INTO `xadmin_log` VALUES ('69', '2019-06-21 14:17:31.384908', '127.0.0.1', '5', 'UserCourse object (5)', 'create', '已添加。', '18', '1');
INSERT INTO `xadmin_log` VALUES ('70', '2019-06-21 14:18:47.462591', '127.0.0.1', '6', 'UserCourse object (6)', 'create', '已添加。', '18', '1');
INSERT INTO `xadmin_log` VALUES ('71', '2019-06-21 16:41:09.021759', '127.0.0.1', '2', '1.1 hello worde', 'change', '修改 url', '12', '1');
INSERT INTO `xadmin_log` VALUES ('72', '2019-06-21 16:55:48.451300', '127.0.0.1', '2', '1.1 hello worde', 'change', '没有字段被修改。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('73', '2019-06-26 17:02:04.029133', '127.0.0.1', '1', 'minjie', 'change', '修改 last_login，first_name，nick_name，gender，address，mobile 和 image', '6', '1');
INSERT INTO `xadmin_log` VALUES ('74', '2019-06-28 13:09:14.898465', '127.0.0.1', '1', 'UserMessage object (1)', 'create', '已添加。', '20', '1');
INSERT INTO `xadmin_log` VALUES ('75', '2019-06-28 13:37:47.394629', '127.0.0.1', '2', 'UserMessage object (2)', 'create', '已添加。', '20', '1');
INSERT INTO `xadmin_log` VALUES ('76', '2019-06-28 13:43:16.493843', '127.0.0.1', '3', 'UserMessage object (3)', 'create', '已添加。', '20', '1');
INSERT INTO `xadmin_log` VALUES ('77', '2019-06-28 14:20:57.465519', '127.0.0.1', null, '', 'delete', '批量删除 4 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('78', '2019-06-28 14:21:11.701474', '127.0.0.1', '1', 'minjie', 'change', '修改 last_login 和 email', '6', '1');
INSERT INTO `xadmin_log` VALUES ('79', '2019-06-28 14:30:26.569122', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('80', '2019-06-28 14:38:44.419617', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('81', '2019-06-28 14:47:01.947971', '127.0.0.1', null, '', 'delete', '批量删除 3 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('82', '2019-06-28 14:50:45.825686', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('83', '2019-06-28 15:43:25.431977', '127.0.0.1', '1', 'Banner object (1)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('84', '2019-06-28 15:43:36.613588', '127.0.0.1', '2', 'Banner object (2)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('85', '2019-06-28 15:43:48.115597', '127.0.0.1', '3', 'Banner object (3)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('86', '2019-06-28 15:44:04.204344', '127.0.0.1', '4', 'Banner object (4)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('87', '2019-06-28 15:44:13.552361', '127.0.0.1', '5', 'Banner object (5)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('88', '2019-06-28 16:25:22.145494', '127.0.0.1', '10', 'python入门', 'change', '修改 is_banner', '9', '1');
INSERT INTO `xadmin_log` VALUES ('89', '2019-06-28 16:25:41.613475', '127.0.0.1', '9', 'python进阶12', 'change', '修改 is_banner，need_know 和 teacher_tell', '9', '1');
INSERT INTO `xadmin_log` VALUES ('90', '2019-06-28 16:25:54.554192', '127.0.0.1', '8', 'python进阶1', 'change', '修改 is_banner，need_know，teacher，teacher_tell 和 tag', '9', '1');
INSERT INTO `xadmin_log` VALUES ('91', '2019-06-28 16:26:07.083708', '127.0.0.1', '7', 'python进阶', 'change', '修改 is_banner，need_know，teacher，teacher_tell 和 tag', '9', '1');
INSERT INTO `xadmin_log` VALUES ('92', '2019-06-28 16:26:29.109842', '127.0.0.1', '6', 'python123', 'change', '修改 is_banner，need_know，teacher，teacher_tell 和 tag', '9', '1');
INSERT INTO `xadmin_log` VALUES ('93', '2019-07-01 15:51:35.598934', '127.0.0.1', '9', 'python进阶12', 'change', '修改 is_banner', '26', '1');
INSERT INTO `xadmin_log` VALUES ('94', '2019-07-02 09:16:05.013956', '127.0.0.1', '10', 'python入门', 'change', '修改 is_banner', '26', '1');
INSERT INTO `xadmin_log` VALUES ('95', '2019-07-02 10:20:56.948689', '127.0.0.1', '1', '慕课网', 'change', '修改 course_nums', '14', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'site-theme', 'https://bootswatch.com/3/cerulean/bootstrap.min.css', '1');
INSERT INTO `xadmin_usersettings` VALUES ('3', 'users_userprofile_editform_portal', ',,,,|', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
