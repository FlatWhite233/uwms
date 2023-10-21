/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : uwms

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 19/10/2021 19:05:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` bigint(20) NOT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `admin_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `person_id` bigint(20) NOT NULL,
  `person_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `person_gender` int(11) NULL DEFAULT NULL,
  `person_birth` datetime NULL DEFAULT NULL,
  `person_death` datetime NULL DEFAULT NULL,
  `person_remain_life` int(11) NULL DEFAULT NULL,
  `person_is_dead` int(11) NULL DEFAULT NULL,
  `person_dead_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `person_hobby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `person_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`person_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Triggers structure for table person
-- ----------------------------
DROP TRIGGER IF EXISTS `cal_remain_life_before_insert`;
delimiter ;;
CREATE TRIGGER `cal_remain_life_before_insert` BEFORE INSERT ON `person` FOR EACH ROW SET new.person_remain_life = TIMESTAMPDIFF(DAY, NOW(), new.person_death)
;
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table person
-- ----------------------------
DROP TRIGGER IF EXISTS `check_is_dead_before_insert`;
delimiter ;;
CREATE TRIGGER `check_is_dead_before_insert` BEFORE INSERT ON `person` FOR EACH ROW IF (new.person_remain_life <= 0)
THEN SET new.person_is_dead = 1;
ELSEIF (new.person_remain_life > 0)
THEN SET new.person_is_dead = 0;
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table person
-- ----------------------------
DROP TRIGGER IF EXISTS `cal_remain_life_before_update`;
delimiter ;;
CREATE TRIGGER `cal_remain_life_before_update` BEFORE UPDATE ON `person` FOR EACH ROW SET new.person_remain_life = TIMESTAMPDIFF(DAY, NOW(), new.person_death)
;
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table person
-- ----------------------------
DROP TRIGGER IF EXISTS `check_is_dead_before_update`;
delimiter ;;
CREATE TRIGGER `check_is_dead_before_update` BEFORE UPDATE ON `person` FOR EACH ROW IF (new.person_remain_life <= 0)
THEN SET new.person_is_dead = 1;
ELSEIF (new.person_remain_life > 0)
THEN SET new.person_is_dead = 0;
END IF
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
