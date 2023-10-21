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

 Date: 19/10/2021 19:16:35
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
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1450419539744518145, 'root', '63a9f0ea7bb98050796b649e85481845', '2021-10-19 19:12:20', NULL);

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
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES (1450419541313187842, '勺子乙', 1, '2021-10-19 19:12:21', '2021-10-19 19:12:21', 0, 1, '出生夭折', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541313187843, '勺子乙', 1, '2021-10-19 19:12:21', '2022-10-19 19:12:21', 365, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541376102401, '勺子乙', 1, '2021-10-19 19:12:21', '2024-10-19 19:12:21', 1096, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541376102402, '勺子乙', 1, '2021-10-19 19:12:21', '2027-10-19 19:12:21', 2191, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541376102403, '勺子乙', 1, '2021-10-19 19:12:21', '2031-10-19 19:12:21', 3652, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541443211266, '勺子乙', 1, '2021-10-19 19:12:21', '2036-10-19 19:12:21', 5479, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541443211267, '勺子乙', 1, '2021-10-19 19:12:21', '2042-10-19 19:12:21', 7670, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541443211268, '勺子乙', 1, '2021-10-19 19:12:21', '2049-10-19 19:12:21', 10227, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541569040386, '勺子乙', 1, '2021-10-19 19:12:21', '2057-10-19 19:12:21', 13149, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541569040387, '勺子乙', 1, '2021-10-19 19:12:21', '2066-10-19 19:12:21', 16436, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541569040388, '勺子乙', 1, '2021-10-19 19:12:21', '2076-10-19 19:12:21', 20089, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541640343554, '勺子乙', 1, '2021-10-19 19:12:21', '2087-10-19 19:12:21', 24106, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541640343555, '勺子乙', 1, '2021-10-19 19:12:21', '2099-10-19 19:12:21', 28489, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541694869505, '勺子乙', 1, '2021-10-19 19:12:21', '2112-10-19 19:12:21', 33237, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541694869506, '勺子乙', 1, '2021-10-19 19:12:21', '2126-10-19 19:12:21', 38350, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541694869507, '勺子乙', 1, '2021-10-19 19:12:21', '2141-10-19 19:12:21', 43829, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541757784066, '勺子乙', 1, '2021-10-19 19:12:21', '2157-10-19 19:12:21', 49673, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541820698626, '勺子乙', 1, '2021-10-19 19:12:21', '2174-10-19 19:12:21', 55882, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541820698627, '勺子乙', 1, '2021-10-19 19:12:21', '2192-10-19 19:12:21', 62457, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541820698628, '勺子乙', 1, '2021-10-19 19:12:21', '2211-10-19 19:12:21', 69395, 0, '还没死', 'Chess', '地狱一层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541820698629, '勺子丙', 0, '2021-10-19 19:12:21', '2211-10-19 19:12:21', 69395, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541887807489, '勺子丙', 0, '2021-10-19 19:12:21', '2210-10-19 19:12:21', 69030, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541887807490, '勺子丙', 0, '2021-10-19 19:12:21', '2208-10-19 19:12:21', 68300, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541887807491, '勺子丙', 0, '2021-10-19 19:12:21', '2205-10-19 19:12:21', 67204, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541954916353, '勺子丙', 0, '2021-10-19 19:12:21', '2201-10-19 19:12:21', 65743, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541954916354, '勺子丙', 0, '2021-10-19 19:12:21', '2196-10-19 19:12:21', 63918, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541954916355, '勺子丙', 0, '2021-10-19 19:12:21', '2190-10-19 19:12:21', 61726, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419541954916356, '勺子丙', 0, '2021-10-19 19:12:21', '2183-10-19 19:12:21', 59169, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419542017830913, '勺子丙', 0, '2021-10-19 19:12:21', '2175-10-19 19:12:21', 56247, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419542017830914, '勺子丙', 0, '2021-10-19 19:12:21', '2166-10-19 19:12:21', 52960, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419542017830915, '勺子丙', 0, '2021-10-19 19:12:21', '2156-10-19 19:12:21', 49308, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419542080745473, '勺子丙', 0, '2021-10-19 19:12:21', '2145-10-19 19:12:21', 45290, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419542080745474, '勺子丙', 0, '2021-10-19 19:12:21', '2133-10-19 19:12:21', 40907, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419542080745475, '勺子丙', 0, '2021-10-19 19:12:21', '2120-10-19 19:12:21', 36159, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419542080745476, '勺子丙', 0, '2021-10-19 19:12:21', '2106-10-19 19:12:21', 31045, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419542143660034, '勺子丙', 0, '2021-10-19 19:12:21', '2091-10-19 19:12:21', 25567, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419542143660035, '勺子丙', 0, '2021-10-19 19:12:21', '2075-10-19 19:12:21', 19723, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419542143660036, '勺子丙', 0, '2021-10-19 19:12:21', '2058-10-19 19:12:21', 13514, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419542206574593, '勺子丙', 0, '2021-10-19 19:12:21', '2040-10-19 19:12:21', 6940, 0, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419542206574594, '勺子丙', 0, '2021-10-19 19:12:21', '2021-10-19 19:12:21', 0, 1, '吃饭噎死', 'Music', '地狱二层1号街', '2021-10-19 19:12:21', NULL);
INSERT INTO `person` VALUES (1450419616013631489, '测试计算阳寿', 1, '2021-10-19 19:12:39', '2041-10-19 19:12:39', 7305, 0, NULL, 'Chess', '地狱一层1号街', '2021-10-19 19:12:39', NULL);
INSERT INTO `person` VALUES (1450419617821376513, '测试计算阳寿', 1, '2021-10-19 19:12:39', '2041-10-19 19:12:39', 7305, 0, NULL, 'Chess', '地狱一层1号街', '2021-10-19 19:12:39', NULL);
INSERT INTO `person` VALUES (1450419617884291074, '测试计算阳寿', 1, '2021-10-19 19:12:39', '2041-10-19 19:12:39', 7305, 0, NULL, 'Chess', '地狱一层1号街', '2021-10-19 19:12:39', NULL);
INSERT INTO `person` VALUES (1450419617947205633, '测试判断是否死亡', 1, '2021-10-19 19:12:39', '2020-10-19 19:12:39', -365, 1, '吃饭噎死的', 'Chess', '地狱一层1号街', '2021-10-19 19:12:39', NULL);
INSERT INTO `person` VALUES (1450419618010120194, '测试判断是否死亡', 1, '2021-10-19 19:12:39', '2020-10-19 19:12:39', -365, 1, '吃饭噎死的', 'Chess', '地狱一层1号街', '2021-10-19 19:12:39', NULL);
INSERT INTO `person` VALUES (1450419618010120195, '测试判断是否死亡', 1, '2021-10-19 19:12:39', '2020-10-19 19:12:39', -365, 1, '吃饭噎死的', 'Chess', '地狱一层1号街', '2021-10-19 19:12:39', NULL);
INSERT INTO `person` VALUES (1450419618077229057, '测试夭折', 1, '2021-10-19 19:12:39', '2021-10-19 19:12:39', 0, 1, '出生夭折', 'Chess', '地狱一层1号街', '2021-10-19 19:12:39', NULL);
INSERT INTO `person` VALUES (1450419618077229058, '测试夭折', 1, '2021-10-19 19:12:39', '2021-10-19 19:12:39', 0, 1, '出生夭折', 'Chess', '地狱一层1号街', '2021-10-19 19:12:39', NULL);
INSERT INTO `person` VALUES (1450419618144337921, '测试夭折', 1, '2021-10-19 19:12:39', '2021-10-19 19:12:39', 0, 1, '出生夭折', 'Chess', '地狱一层1号街', '2021-10-19 19:12:39', NULL);
INSERT INTO `person` VALUES (1450419618207252481, 'AAA', 1, '2021-10-19 19:12:39', '2021-10-19 19:12:39', 0, 1, '出生夭折', 'Chess', '地狱一层1号街', '2021-10-19 19:12:39', NULL);

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
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1450419542273683458, 'root', '63a9f0ea7bb98050796b649e85481845', 'root@underworld.com', '2021-10-19 19:12:21', NULL);

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
