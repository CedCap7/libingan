/*
 Navicat Premium Data Transfer

 Source Server         : cemetery
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : dccms

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 29/04/2025 13:10:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application`  (
  `Client_ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `MiddleName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `LastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Date_Applied` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Client_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES (2, 'Arturo', 'Sanglitan', 'Capuyan', NULL, NULL, 'P-13, Hagkol', 'cedrickcap7@gmail.com', '2025-04-16 11:27:43', '1');
INSERT INTO `application` VALUES (3, 'Cedrick', 'Bulanadi', 'Capuyan', 'Male', '09943234955', 'P-13, Hagkol', 'cedrickcap7@gmail.com', '2025-04-16 07:08:49', '0');
INSERT INTO `application` VALUES (4, 'Simon Alexander', 'Mangornong', 'Mulligan', 'Male', '9934239423', 'Maramag', 'mulligansimon32@gmail.com', '2025-04-28 21:44:31', '1');
INSERT INTO `application` VALUES (5, 'Rosette', NULL, 'Ayunar', 'Female', '34234243242', 'Don Carlos', 'ayunarrosette0101@gmail.com', '2025-04-28 21:58:49', '1');

-- ----------------------------
-- Table structure for beneficiaries
-- ----------------------------
DROP TABLE IF EXISTS `beneficiaries`;
CREATE TABLE `beneficiaries`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `Beneficiary_ID` int NULL DEFAULT NULL,
  `Deceased_ID` int NULL DEFAULT NULL,
  `Client_ID` int NULL DEFAULT NULL,
  `FullName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `date_created` datetime NULL DEFAULT NULL,
  `Order` int NULL DEFAULT NULL,
  `Contact` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of beneficiaries
-- ----------------------------
INSERT INTO `beneficiaries` VALUES (4, 1, 69, 55, 'Elladle', '2025-04-28 23:54:27', 2, '231231233', '1');
INSERT INTO `beneficiaries` VALUES (5, 3, 69, 55, 'John', '2025-04-28 23:54:49', 1, '213213122', '1');
INSERT INTO `beneficiaries` VALUES (6, NULL, 77, 74, 'Simon Alexander Mulligan', '2025-04-29 08:09:31', 1, '09943234955', NULL);
INSERT INTO `beneficiaries` VALUES (7, NULL, 77, 74, 'Eddi Mark Bryan Doverte', '2025-04-29 08:09:31', 2, '09089596784', NULL);

-- ----------------------------
-- Table structure for burial plot
-- ----------------------------
DROP TABLE IF EXISTS `burial plot`;
CREATE TABLE `burial plot`  (
  `Plot_ID` int NOT NULL,
  `Plot_No` int NULL DEFAULT NULL,
  `Section` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Availability_Status` bit(1) NULL DEFAULT NULL,
  `Purchase_Date` date NULL DEFAULT NULL,
  `Purchase_Price` decimal(10, 2) NULL DEFAULT NULL,
  `Deceased_ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`Plot_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of burial plot
-- ----------------------------

-- ----------------------------
-- Table structure for burial_plot
-- ----------------------------
DROP TABLE IF EXISTS `burial_plot`;
CREATE TABLE `burial_plot`  (
  `Plot_ID` int NOT NULL,
  `Plot_No` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `Section` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `Availability_Status` bit(1) NULL DEFAULT NULL,
  `Purchase_Date` date NULL DEFAULT NULL,
  `Purchase_Price` decimal(10, 0) NULL DEFAULT NULL,
  `Deceased_ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`Plot_ID`) USING BTREE,
  INDEX `FK_burial_plot_Deceased_ID`(`Deceased_ID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of burial_plot
-- ----------------------------

-- ----------------------------
-- Table structure for cemetery staff
-- ----------------------------
DROP TABLE IF EXISTS `cemetery staff`;
CREATE TABLE `cemetery staff`  (
  `Staff_ID` int NOT NULL,
  `Fname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Lname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Contact_Information` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cemetery staff
-- ----------------------------

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `Client_ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `MiddleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `LastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Ext` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Mobile` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Relationship_to_Deceased` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Date_Registered` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Client_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES (55, 'Cedrick', 'Bulanadi', 'Capuyan', NULL, 'Male', '09943234955', 'Mother', 'Purok 6, North Poblacion, Maramag, Bukidnon', 'cedrickcap7@gmail.com', '2025-04-29 01:47:23', '1');
INSERT INTO `client` VALUES (56, 'Justine Mae', 'Jondonero', 'Benales', '', 'Female', '0994578324', NULL, 'Dologon, Bukidnon', 'justine@gmail.com', '2025-04-06 13:22:14', '1');
INSERT INTO `client` VALUES (57, 'Mevelyn', 'Dahan', 'Mique', '', 'Female', '0945438923', NULL, 'Tuban Village, Maramag, Bukidnon', 'meveyln@gmail.com', '2025-04-06 13:22:14', '1');
INSERT INTO `client` VALUES (58, 'Maricel', '', 'Wilson', '', 'Female', '0983478923', NULL, 'Purok 10, South Poblacion, Maramag, Bukidnon', 'wilson@gmail.com', '2025-04-06 13:22:15', '1');
INSERT INTO `client` VALUES (59, 'Cedrikc', 'Bulanadi', 'Capuyan', NULL, 'Male', '+639943234955', NULL, 'Bukidnon', 'example@example.com', '2025-04-06 13:22:15', '1');
INSERT INTO `client` VALUES (68, 'Jose', 'Protacio', 'Rizal', 'Jr.', 'Male', '093273897', NULL, 'daskdjalskddjlakdjs', 'example@example.com', '2025-04-06 13:22:16', '1');
INSERT INTO `client` VALUES (69, 'Ced', 'Bul', 'Cap', NULL, 'Male', '098776543243', NULL, 'sfsfhsdfseresvfaf', 'cedrickcap7@gmail.com', '2025-04-16 11:32:06', '1');
INSERT INTO `client` VALUES (70, 'Arturo', 'Sanglitan', 'Capuyan', NULL, NULL, NULL, NULL, 'P-13, Hagkol', 'cedrickcap7@gmail.com', '2025-04-16 11:32:07', '1');
INSERT INTO `client` VALUES (72, 'Elladle', 'Salvan', 'Mandal', '', 'Female', '09943234955', NULL, '32agfew;kadsf', 'cedrickcap7@gmail.com', '2025-04-27 19:02:40', '1');
INSERT INTO `client` VALUES (73, 'Simon Alexander', 'Mangornong', 'Mulligan', NULL, 'Male', '9934239423', NULL, 'Maramag', 'mulligansimon32@gmail.com', '2025-04-28 21:46:43', '1');
INSERT INTO `client` VALUES (74, 'Rosette', NULL, 'Ayunar', NULL, 'Female', '34234243242', NULL, 'Don Carlos', 'ayunarrosette0101@gmail.com', '2025-04-28 22:00:28', '1');

-- ----------------------------
-- Table structure for client_to_deceased_transactions
-- ----------------------------
DROP TABLE IF EXISTS `client_to_deceased_transactions`;
CREATE TABLE `client_to_deceased_transactions`  (
  `Client_ID` int NOT NULL,
  `Deceased_ID` int NOT NULL AUTO_INCREMENT,
  `Relationship_Client_to_Deceased` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `Balance` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `Transaction_ID` int NULL DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Client_ID`, `Deceased_ID`) USING BTREE,
  INDEX `FK_client_to_deceased_transactions_Deceased_ID`(`Deceased_ID` ASC) USING BTREE,
  INDEX `FK_client_to_deceased_transactions_Transaction_ID`(`Transaction_ID` ASC) USING BTREE,
  CONSTRAINT `FK_client_to_deceased_transactions_Transaction_ID` FOREIGN KEY (`Transaction_ID`) REFERENCES `transaction` (`Transaction_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of client_to_deceased_transactions
-- ----------------------------

-- ----------------------------
-- Table structure for deceased
-- ----------------------------
DROP TABLE IF EXISTS `deceased`;
CREATE TABLE `deceased`  (
  `Deceased_ID` int NOT NULL AUTO_INCREMENT,
  `Client_ID` int NULL DEFAULT NULL,
  `Plot_ID` int NULL DEFAULT NULL,
  `Level` int NULL DEFAULT NULL,
  `FirstName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `LastName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `MiddleName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Ext` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DateOfBirth` datetime NULL DEFAULT NULL,
  `DateOfDeath` datetime NULL DEFAULT NULL,
  `Interment` datetime NULL DEFAULT NULL,
  `Gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Nationality` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Religion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Relationship` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `deceased_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Deceased_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of deceased
-- ----------------------------
INSERT INTO `deceased` VALUES (1, NULL, 2, NULL, 'John', 'Smith', 'Robert', 'Sr.', '1945-05-12 00:00:00', '2022-11-23 00:00:00', NULL, 'Male', 'American', 'Catholic', 'Spouse, Son', NULL);
INSERT INTO `deceased` VALUES (2, NULL, 12, NULL, 'Emily', 'Johnson', 'Grace', NULL, '1938-08-30 00:00:00', '2023-02-15 00:00:00', NULL, 'Female', 'Canadian', 'Protestant', 'Husband, Daughter', NULL);
INSERT INTO `deceased` VALUES (3, NULL, 3, NULL, 'Miguel', 'Garcia', 'Alejandro', 'Jr.', '1960-03-17 00:00:00', '2023-07-02 00:00:00', NULL, 'Male', 'Mexican', 'Catholic', 'Spouse, Son', NULL);
INSERT INTO `deceased` VALUES (4, NULL, 3, NULL, 'Patricia', 'Wilson', 'Anne', NULL, '1952-11-05 00:00:00', '2023-04-18 00:00:00', NULL, 'Female', 'British', 'Anglican', 'Husband, Daughter', 'Remaining');
INSERT INTO `deceased` VALUES (5, NULL, 1, NULL, 'Raj', 'Patel', 'Kumar', NULL, '1940-06-25 00:00:00', '2022-09-08 00:00:00', NULL, 'Male', 'Indian', 'Hindu', 'Spouse, Son', 'Renewal');
INSERT INTO `deceased` VALUES (6, NULL, 1, NULL, 'Linh', 'Nguyen', 'Thi', NULL, '1955-02-14 00:00:00', '2023-05-20 00:00:00', NULL, 'Female', 'Vietnamese', 'Buddhist', 'Husband, Daughter', NULL);
INSERT INTO `deceased` VALUES (7, NULL, 2, NULL, 'David', 'Brown', 'Michael', 'III', '1932-09-30 00:00:00', '2023-01-05 00:00:00', '2023-01-09 00:00:00', 'Male', 'Australian', 'Presbyterian', 'Spouse, Son', 'Pending');
INSERT INTO `deceased` VALUES (8, NULL, 2, NULL, 'Ji-Yeon', 'Kim', NULL, NULL, '1948-07-22 00:00:00', '2023-08-14 00:00:00', '2023-08-17 00:00:00', 'Female', 'South Korean', 'Christian', 'Husband, Daughter', 'Relocated');
INSERT INTO `deceased` VALUES (9, NULL, 3, NULL, 'Carlos', 'Rodriguez', 'Eduardo', NULL, '1950-04-18 00:00:00', '2022-12-01 00:00:00', '2022-12-05 00:00:00', 'Male', 'Colombian', 'Catholic', 'Spouse, Daughter', NULL);
INSERT INTO `deceased` VALUES (10, NULL, 4, NULL, 'Anna', 'Müller', 'Elisabeth', NULL, '1942-10-15 00:00:00', '2023-03-25 00:00:00', '2023-03-29 00:00:00', 'Female', 'German', 'Lutheran', 'Husband, Son', 'Remaining');
INSERT INTO `deceased` VALUES (11, NULL, 1, NULL, 'Wei', 'Chen', NULL, NULL, '1937-01-28 00:00:00', '2023-06-10 00:00:00', '2023-06-14 00:00:00', 'Male', 'Chinese', 'Taoist', 'Spouse, Son', NULL);
INSERT INTO `deceased` VALUES (12, NULL, 2, NULL, 'Elizabeth', 'Williams', 'Jane', NULL, '1958-12-05 00:00:00', '2022-10-12 00:00:00', '2022-10-15 00:00:00', 'Female', 'American', 'Episcopalian', 'Husband, Son', 'Pending');
INSERT INTO `deceased` VALUES (13, NULL, 3, NULL, 'Hiroshi', 'Nakamura', NULL, NULL, '1943-08-07 00:00:00', '2023-02-28 00:00:00', '2023-03-04 00:00:00', 'Male', 'Japanese', 'Buddhist', 'Spouse, Son', 'Pending');
INSERT INTO `deceased` VALUES (14, NULL, 3, NULL, 'Sophie', 'Dubois', 'Marie', NULL, '1950-05-19 00:00:00', '2022-11-15 00:00:00', '2022-11-19 00:00:00', 'Female', 'French', 'Catholic', 'Husband, Daughter', NULL);
INSERT INTO `deceased` VALUES (15, NULL, 4, NULL, 'Marco', 'Santos', 'Antonio', NULL, '1935-03-25 00:00:00', '2023-07-30 00:00:00', '2023-08-03 00:00:00', 'Male', 'Brazilian', 'Catholic', 'Spouse, Son', NULL);
INSERT INTO `deceased` VALUES (69, 55, 2174, 2, 'Rosette', 'Ayunar', 'Cuyan', NULL, '2024-10-01 00:00:00', '2010-02-01 00:00:00', '2010-02-11 00:00:00', 'Female', NULL, 'SDA', 'Spouse, Son', 'Remaining');
INSERT INTO `deceased` VALUES (70, 55, 2174, 1, 'Simon Alexander', 'Mulligan', 'Mangornong', NULL, '2024-10-01 16:01:55', '2024-10-16 16:01:55', '2024-10-30 16:01:55', 'Male', NULL, NULL, NULL, 'Remaining');
INSERT INTO `deceased` VALUES (71, 68, 1257, 0, 'Marilag', 'Rizal', 'Protacio', NULL, '1964-02-21 16:01:55', '2021-07-14 16:01:55', '2021-08-26 16:01:55', 'Female', NULL, NULL, 'Wife', NULL);
INSERT INTO `deceased` VALUES (72, 57, 19, 1, 'Bernie', 'Robles', NULL, NULL, '2024-10-24 16:01:55', '2024-10-30 16:01:55', '2024-10-30 16:01:55', 'Male', NULL, NULL, 'Cousin', NULL);
INSERT INTO `deceased` VALUES (73, 58, 2155, 0, 'Cedrick', 'Capuyan', 'Bulanadi', NULL, '2003-02-07 00:00:00', '2020-09-08 00:00:00', '2020-09-12 00:00:00', 'Male', NULL, 'Iglesia Ni Cristo', 'Friend', NULL);
INSERT INTO `deceased` VALUES (74, 57, NULL, NULL, 'Efren', 'Valenciano', NULL, NULL, '1990-12-24 00:00:00', '2022-08-20 00:00:00', '2022-08-26 00:00:00', 'Male', NULL, 'Iglesia Ni Cristo', 'Girlfriend', NULL);
INSERT INTO `deceased` VALUES (75, 68, 2483, 0, 'Elladle', 'Mandal', 'Salvan', NULL, '1990-08-01 00:00:00', '2010-10-02 00:00:00', '2010-10-10 00:00:00', 'Female', NULL, 'Iglesia Ni Cristo', NULL, 'Remaining');
INSERT INTO `deceased` VALUES (76, 73, 411, 3, 'Arram', 'Pamisa', NULL, NULL, '2003-01-01 00:00:00', '2005-10-01 00:00:00', NULL, 'Male', NULL, NULL, NULL, NULL);
INSERT INTO `deceased` VALUES (77, 74, 2490, 0, 'Cedrick', 'Capuyan', 'Bulanadi', NULL, '2003-02-07 00:00:00', '2024-09-01 00:00:00', NULL, 'Male', NULL, 'Iglesia Ni Cristo', 'Classmate', NULL);

-- ----------------------------
-- Table structure for financial account
-- ----------------------------
DROP TABLE IF EXISTS `financial account`;
CREATE TABLE `financial account`  (
  `Account_ID` int NOT NULL,
  `Client_ID` int NOT NULL,
  `Total_Balance` decimal(10, 2) NULL DEFAULT NULL,
  `LastTransaction_Date` date NULL DEFAULT NULL,
  `Transaction_History` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Account_ID`, `Client_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of financial account
-- ----------------------------

-- ----------------------------
-- Table structure for grave marker
-- ----------------------------
DROP TABLE IF EXISTS `grave marker`;
CREATE TABLE `grave marker`  (
  `Marker_ID` int NOT NULL,
  `Inscription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Installation_Date` date NULL DEFAULT NULL,
  `Location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Deceased_ID` int NOT NULL,
  `Plot_ID` int NOT NULL,
  PRIMARY KEY (`Marker_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grave marker
-- ----------------------------

-- ----------------------------
-- Table structure for grave_marker
-- ----------------------------
DROP TABLE IF EXISTS `grave_marker`;
CREATE TABLE `grave_marker`  (
  `Marker_ID` int NOT NULL,
  `Inscription` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `Deceased_ID` int NULL DEFAULT NULL,
  `Plot_ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`Marker_ID`) USING BTREE,
  INDEX `FK_grave_marker_Deceased_ID`(`Deceased_ID` ASC) USING BTREE,
  INDEX `FK_grave_marker_Plot_ID`(`Plot_ID` ASC) USING BTREE,
  CONSTRAINT `FK_grave_marker_Plot_ID` FOREIGN KEY (`Plot_ID`) REFERENCES `burial_plot` (`Plot_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grave_marker
-- ----------------------------

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location`  (
  `id` int NOT NULL,
  `block` varchar(30) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `section` varchar(30) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `row` varchar(30) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `plot` varchar(30) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES (1, '1', '1', '2', '1', '3');
INSERT INTO `location` VALUES (2, '1', '1', '1', '1', '3');
INSERT INTO `location` VALUES (3, '1', '3', '2', '1', '3');
INSERT INTO `location` VALUES (4, '1', '3', '1', '1', '3');
INSERT INTO `location` VALUES (5, '1', '5', '2', '1', '3');
INSERT INTO `location` VALUES (6, '1', '5', '1', '1', '3');
INSERT INTO `location` VALUES (7, '2', '1', '2', '1', '3');
INSERT INTO `location` VALUES (8, '2', '1', '1', '1', '3');
INSERT INTO `location` VALUES (9, '2', '3', '2', '1', '3');
INSERT INTO `location` VALUES (10, '2', '3', '1', '1', '3');
INSERT INTO `location` VALUES (11, '2', '5', '2', '1', '3');
INSERT INTO `location` VALUES (12, '2', '5', '1', '1', '3');
INSERT INTO `location` VALUES (13, '4', '1', '2', '1', '3');
INSERT INTO `location` VALUES (14, '4', '1', '1', '1', '3');
INSERT INTO `location` VALUES (15, '1', '1', '2', '2', '3');
INSERT INTO `location` VALUES (16, '1', '1', '1', '2', '3');
INSERT INTO `location` VALUES (17, '1', '3', '2', '2', '3');
INSERT INTO `location` VALUES (18, '1', '3', '1', '2', '3');
INSERT INTO `location` VALUES (19, '1', '5', '2', '2', '3');
INSERT INTO `location` VALUES (20, '1', '5', '1', '2', '3');
INSERT INTO `location` VALUES (21, '2', '1', '2', '2', '3');
INSERT INTO `location` VALUES (22, '2', '1', '1', '2', '3');
INSERT INTO `location` VALUES (23, '2', '3', '2', '2', '3');
INSERT INTO `location` VALUES (24, '2', '3', '1', '2', '3');
INSERT INTO `location` VALUES (25, '2', '5', '2', '2', '3');
INSERT INTO `location` VALUES (26, '2', '5', '1', '2', '3');
INSERT INTO `location` VALUES (27, '4', '1', '2', '2', '3');
INSERT INTO `location` VALUES (28, '4', '1', '1', '2', '3');
INSERT INTO `location` VALUES (29, '1', '1', '2', '3', '3');
INSERT INTO `location` VALUES (30, '1', '1', '1', '3', '3');
INSERT INTO `location` VALUES (31, '1', '3', '2', '3', '3');
INSERT INTO `location` VALUES (32, '1', '3', '1', '3', '3');
INSERT INTO `location` VALUES (33, '1', '5', '2', '3', '3');
INSERT INTO `location` VALUES (34, '1', '5', '1', '3', '3');
INSERT INTO `location` VALUES (35, '2', '1', '2', '3', '3');
INSERT INTO `location` VALUES (36, '2', '1', '1', '3', '3');
INSERT INTO `location` VALUES (37, '2', '3', '2', '3', '3');
INSERT INTO `location` VALUES (38, '2', '3', '1', '3', '3');
INSERT INTO `location` VALUES (39, '2', '5', '2', '3', '3');
INSERT INTO `location` VALUES (40, '2', '5', '1', '3', '3');
INSERT INTO `location` VALUES (41, '4', '1', '2', '3', '3');
INSERT INTO `location` VALUES (42, '4', '1', '1', '3', '3');
INSERT INTO `location` VALUES (43, '1', '1', '2', '4', '3');
INSERT INTO `location` VALUES (44, '1', '1', '1', '4', '3');
INSERT INTO `location` VALUES (45, '1', '3', '2', '4', '3');
INSERT INTO `location` VALUES (46, '1', '3', '1', '4', '3');
INSERT INTO `location` VALUES (47, '1', '5', '2', '4', '3');
INSERT INTO `location` VALUES (48, '1', '5', '1', '4', '3');
INSERT INTO `location` VALUES (49, '2', '1', '2', '4', '3');
INSERT INTO `location` VALUES (50, '2', '1', '1', '4', '3');
INSERT INTO `location` VALUES (51, '2', '3', '2', '4', '3');
INSERT INTO `location` VALUES (52, '2', '3', '1', '4', '3');
INSERT INTO `location` VALUES (53, '2', '5', '2', '4', '3');
INSERT INTO `location` VALUES (54, '2', '5', '1', '4', '3');
INSERT INTO `location` VALUES (55, '4', '1', '2', '4', '3');
INSERT INTO `location` VALUES (56, '4', '1', '1', '4', '3');
INSERT INTO `location` VALUES (57, '1', '1', '2', '5', '3');
INSERT INTO `location` VALUES (58, '1', '1', '1', '5', '3');
INSERT INTO `location` VALUES (59, '1', '3', '2', '5', '3');
INSERT INTO `location` VALUES (60, '1', '3', '1', '5', '3');
INSERT INTO `location` VALUES (61, '1', '5', '2', '5', '3');
INSERT INTO `location` VALUES (62, '1', '5', '1', '5', '3');
INSERT INTO `location` VALUES (63, '2', '1', '2', '5', '3');
INSERT INTO `location` VALUES (64, '2', '1', '1', '5', '3');
INSERT INTO `location` VALUES (65, '2', '3', '2', '5', '3');
INSERT INTO `location` VALUES (66, '2', '3', '1', '5', '3');
INSERT INTO `location` VALUES (67, '2', '5', '2', '5', '3');
INSERT INTO `location` VALUES (68, '2', '5', '1', '5', '3');
INSERT INTO `location` VALUES (69, '4', '1', '2', '5', '3');
INSERT INTO `location` VALUES (70, '4', '1', '1', '5', '3');
INSERT INTO `location` VALUES (71, '1', '1', '2', '6', '3');
INSERT INTO `location` VALUES (72, '1', '1', '1', '6', '3');
INSERT INTO `location` VALUES (73, '1', '3', '2', '6', '3');
INSERT INTO `location` VALUES (74, '1', '3', '1', '6', '3');
INSERT INTO `location` VALUES (75, '1', '5', '2', '6', '3');
INSERT INTO `location` VALUES (76, '1', '5', '1', '6', '3');
INSERT INTO `location` VALUES (77, '2', '1', '2', '6', '3');
INSERT INTO `location` VALUES (78, '2', '1', '1', '6', '3');
INSERT INTO `location` VALUES (79, '2', '3', '2', '6', '3');
INSERT INTO `location` VALUES (80, '2', '3', '1', '6', '3');
INSERT INTO `location` VALUES (81, '2', '5', '2', '6', '3');
INSERT INTO `location` VALUES (82, '2', '5', '1', '6', '3');
INSERT INTO `location` VALUES (83, '4', '1', '2', '6', '3');
INSERT INTO `location` VALUES (84, '4', '1', '1', '6', '3');
INSERT INTO `location` VALUES (85, '1', '1', '2', '7', '3');
INSERT INTO `location` VALUES (86, '1', '1', '1', '7', '3');
INSERT INTO `location` VALUES (87, '1', '3', '2', '7', '3');
INSERT INTO `location` VALUES (88, '1', '3', '1', '7', '3');
INSERT INTO `location` VALUES (89, '1', '5', '2', '7', '3');
INSERT INTO `location` VALUES (90, '1', '5', '1', '7', '3');
INSERT INTO `location` VALUES (91, '2', '1', '2', '7', '3');
INSERT INTO `location` VALUES (92, '2', '1', '1', '7', '3');
INSERT INTO `location` VALUES (93, '2', '3', '2', '7', '3');
INSERT INTO `location` VALUES (94, '2', '3', '1', '7', '3');
INSERT INTO `location` VALUES (95, '2', '5', '2', '7', '3');
INSERT INTO `location` VALUES (96, '2', '5', '1', '7', '3');
INSERT INTO `location` VALUES (97, '4', '1', '2', '7', '3');
INSERT INTO `location` VALUES (98, '4', '1', '1', '7', '3');
INSERT INTO `location` VALUES (99, '1', '1', '2', '8', '3');
INSERT INTO `location` VALUES (100, '1', '1', '1', '8', '3');
INSERT INTO `location` VALUES (101, '1', '3', '2', '8', '3');
INSERT INTO `location` VALUES (102, '1', '3', '1', '8', '3');
INSERT INTO `location` VALUES (103, '1', '5', '2', '8', '3');
INSERT INTO `location` VALUES (104, '1', '5', '1', '8', '3');
INSERT INTO `location` VALUES (105, '2', '1', '2', '8', '3');
INSERT INTO `location` VALUES (106, '2', '1', '1', '8', '3');
INSERT INTO `location` VALUES (107, '2', '3', '2', '8', '3');
INSERT INTO `location` VALUES (108, '2', '3', '1', '8', '3');
INSERT INTO `location` VALUES (109, '2', '5', '2', '8', '3');
INSERT INTO `location` VALUES (110, '2', '5', '1', '8', '3');
INSERT INTO `location` VALUES (111, '4', '1', '2', '8', '3');
INSERT INTO `location` VALUES (112, '4', '1', '1', '8', '3');
INSERT INTO `location` VALUES (113, '1', '1', '2', '9', '3');
INSERT INTO `location` VALUES (114, '1', '1', '1', '9', '3');
INSERT INTO `location` VALUES (115, '1', '3', '2', '9', '3');
INSERT INTO `location` VALUES (116, '1', '3', '1', '9', '3');
INSERT INTO `location` VALUES (117, '1', '5', '2', '9', '3');
INSERT INTO `location` VALUES (118, '1', '5', '1', '9', '3');
INSERT INTO `location` VALUES (119, '2', '1', '2', '9', '3');
INSERT INTO `location` VALUES (120, '2', '1', '1', '9', '3');
INSERT INTO `location` VALUES (121, '2', '3', '2', '9', '3');
INSERT INTO `location` VALUES (122, '2', '3', '1', '9', '3');
INSERT INTO `location` VALUES (123, '2', '5', '2', '9', '3');
INSERT INTO `location` VALUES (124, '2', '5', '1', '9', '3');
INSERT INTO `location` VALUES (125, '4', '1', '2', '9', '3');
INSERT INTO `location` VALUES (126, '4', '1', '1', '9', '3');
INSERT INTO `location` VALUES (127, '1', '1', '2', '10', '3');
INSERT INTO `location` VALUES (128, '1', '1', '1', '10', '3');
INSERT INTO `location` VALUES (129, '1', '3', '2', '10', '3');
INSERT INTO `location` VALUES (130, '1', '3', '1', '10', '3');
INSERT INTO `location` VALUES (131, '1', '5', '2', '10', '3');
INSERT INTO `location` VALUES (132, '1', '5', '1', '10', '3');
INSERT INTO `location` VALUES (133, '2', '1', '2', '10', '3');
INSERT INTO `location` VALUES (134, '2', '1', '1', '10', '3');
INSERT INTO `location` VALUES (135, '2', '3', '2', '10', '3');
INSERT INTO `location` VALUES (136, '2', '3', '1', '10', '3');
INSERT INTO `location` VALUES (137, '2', '5', '2', '10', '3');
INSERT INTO `location` VALUES (138, '2', '5', '1', '10', '3');
INSERT INTO `location` VALUES (139, '4', '1', '2', '10', '3');
INSERT INTO `location` VALUES (140, '4', '1', '1', '10', '3');
INSERT INTO `location` VALUES (141, '1', '1', '2', '11', '3');
INSERT INTO `location` VALUES (142, '1', '1', '1', '11', '3');
INSERT INTO `location` VALUES (143, '1', '3', '2', '11', '3');
INSERT INTO `location` VALUES (144, '1', '3', '1', '11', '3');
INSERT INTO `location` VALUES (145, '1', '5', '2', '11', '3');
INSERT INTO `location` VALUES (146, '1', '5', '1', '11', '3');
INSERT INTO `location` VALUES (147, '2', '1', '2', '11', '3');
INSERT INTO `location` VALUES (148, '2', '1', '1', '11', '3');
INSERT INTO `location` VALUES (149, '2', '3', '2', '11', '3');
INSERT INTO `location` VALUES (150, '2', '3', '1', '11', '3');
INSERT INTO `location` VALUES (151, '2', '5', '2', '11', '3');
INSERT INTO `location` VALUES (152, '2', '5', '1', '11', '3');
INSERT INTO `location` VALUES (153, '4', '1', '2', '11', '3');
INSERT INTO `location` VALUES (154, '4', '1', '1', '11', '3');
INSERT INTO `location` VALUES (155, '1', '1', '2', '12', '3');
INSERT INTO `location` VALUES (156, '1', '1', '1', NULL, '3');
INSERT INTO `location` VALUES (157, '1', '3', '2', '12', '3');
INSERT INTO `location` VALUES (158, '1', '3', '1', '12', '3');
INSERT INTO `location` VALUES (159, '1', '5', '2', '12', '3');
INSERT INTO `location` VALUES (160, '1', '5', '1', '12', '3');
INSERT INTO `location` VALUES (161, '2', '1', '2', '12', '3');
INSERT INTO `location` VALUES (162, '2', '1', '1', '12', '3');
INSERT INTO `location` VALUES (163, '2', '3', '2', '12', '3');
INSERT INTO `location` VALUES (164, '2', '3', '1', '12', '3');
INSERT INTO `location` VALUES (165, '2', '5', '2', '12', '3');
INSERT INTO `location` VALUES (166, '2', '5', '1', '12', '3');
INSERT INTO `location` VALUES (167, '4', '1', '2', '12', '3');
INSERT INTO `location` VALUES (168, '4', '1', '1', '12', '3');
INSERT INTO `location` VALUES (169, '1', '1', '2', '13', '3');
INSERT INTO `location` VALUES (170, '1', '1', '1', '13', '3');
INSERT INTO `location` VALUES (171, '1', '3', '2', '13', '3');
INSERT INTO `location` VALUES (172, '1', '3', '1', '13', '3');
INSERT INTO `location` VALUES (173, '1', '5', '2', '13', '3');
INSERT INTO `location` VALUES (174, '1', '5', '1', '13', '3');
INSERT INTO `location` VALUES (175, '2', '1', '2', '13', '3');
INSERT INTO `location` VALUES (176, '2', '1', '1', '13', '3');
INSERT INTO `location` VALUES (177, '2', '3', '2', '13', '3');
INSERT INTO `location` VALUES (178, '2', '3', '1', '13', '3');
INSERT INTO `location` VALUES (179, '2', '5', '2', '13', '3');
INSERT INTO `location` VALUES (180, '2', '5', '1', '13', '3');
INSERT INTO `location` VALUES (181, '4', '1', '2', '13', '3');
INSERT INTO `location` VALUES (182, '4', '1', '1', '13', '3');
INSERT INTO `location` VALUES (183, '1', '1', '2', '14', '3');
INSERT INTO `location` VALUES (184, '1', '1', '1', '14', '3');
INSERT INTO `location` VALUES (185, '1', '3', '2', '14', '3');
INSERT INTO `location` VALUES (186, '1', '3', '1', '14', '3');
INSERT INTO `location` VALUES (187, '1', '5', '2', '14', '3');
INSERT INTO `location` VALUES (188, '1', '5', '1', '14', '3');
INSERT INTO `location` VALUES (189, '2', '1', '2', '14', '3');
INSERT INTO `location` VALUES (190, '2', '1', '1', '14', '3');
INSERT INTO `location` VALUES (191, '2', '3', '2', '14', '3');
INSERT INTO `location` VALUES (192, '2', '3', '1', '14', '3');
INSERT INTO `location` VALUES (193, '2', '5', '2', '14', '3');
INSERT INTO `location` VALUES (194, '2', '5', '1', '14', '3');
INSERT INTO `location` VALUES (195, '4', '1', '2', '14', '3');
INSERT INTO `location` VALUES (196, '4', '1', '1', '14', '3');
INSERT INTO `location` VALUES (197, '1', '1', '2', '15', '3');
INSERT INTO `location` VALUES (198, '1', '1', '1', '15', '3');
INSERT INTO `location` VALUES (199, '1', '3', '2', '15', '3');
INSERT INTO `location` VALUES (200, '1', '3', '1', '15', '3');
INSERT INTO `location` VALUES (201, '1', '5', '2', '15', '3');
INSERT INTO `location` VALUES (202, '1', '5', '1', '15', '3');
INSERT INTO `location` VALUES (203, '2', '1', '2', '15', '3');
INSERT INTO `location` VALUES (204, '2', '1', '1', '15', '3');
INSERT INTO `location` VALUES (205, '2', '3', '2', '15', '3');
INSERT INTO `location` VALUES (206, '2', '3', '1', '15', '3');
INSERT INTO `location` VALUES (207, '2', '5', '2', '15', '3');
INSERT INTO `location` VALUES (208, '2', '5', '1', '15', '3');
INSERT INTO `location` VALUES (209, '4', '1', '2', '15', '3');
INSERT INTO `location` VALUES (210, '4', '1', '1', '15', '3');
INSERT INTO `location` VALUES (211, '1', '1', '2', '16', '3');
INSERT INTO `location` VALUES (212, '1', '1', '1', '16', '3');
INSERT INTO `location` VALUES (213, '1', '3', '2', '16', '3');
INSERT INTO `location` VALUES (214, '1', '3', '1', '16', '3');
INSERT INTO `location` VALUES (215, '1', '5', '2', '16', '3');
INSERT INTO `location` VALUES (216, '1', '5', '1', '16', '3');
INSERT INTO `location` VALUES (217, '2', '1', '2', '16', '3');
INSERT INTO `location` VALUES (218, '2', '1', '1', '16', '3');
INSERT INTO `location` VALUES (219, '2', '3', '2', '16', '3');
INSERT INTO `location` VALUES (220, '2', '3', '1', '16', '3');
INSERT INTO `location` VALUES (221, '2', '5', '2', '16', '3');
INSERT INTO `location` VALUES (222, '2', '5', '1', '16', '3');
INSERT INTO `location` VALUES (223, '4', '1', '2', '16', '3');
INSERT INTO `location` VALUES (224, '4', '1', '1', '16', '3');
INSERT INTO `location` VALUES (225, '1', '1', '2', '17', '3');
INSERT INTO `location` VALUES (226, '1', '1', '1', '17', '3');
INSERT INTO `location` VALUES (227, '1', '3', '2', '17', '3');
INSERT INTO `location` VALUES (228, '1', '3', '1', '17', '3');
INSERT INTO `location` VALUES (229, '1', '5', '2', '17', '3');
INSERT INTO `location` VALUES (230, '1', '5', '1', '17', '3');
INSERT INTO `location` VALUES (231, '2', '1', '2', '17', '3');
INSERT INTO `location` VALUES (232, '2', '1', '1', '17', '3');
INSERT INTO `location` VALUES (233, '2', '3', '2', '17', '3');
INSERT INTO `location` VALUES (234, '2', '3', '1', '17', '3');
INSERT INTO `location` VALUES (235, '2', '5', '2', '17', '3');
INSERT INTO `location` VALUES (236, '2', '5', '1', '17', '3');
INSERT INTO `location` VALUES (237, '4', '1', '2', '17', '3');
INSERT INTO `location` VALUES (238, '4', '1', '1', '17', '3');
INSERT INTO `location` VALUES (239, '1', '1', '2', '18', '3');
INSERT INTO `location` VALUES (240, '1', '1', '1', '18', '3');
INSERT INTO `location` VALUES (241, '1', '3', '2', '18', '3');
INSERT INTO `location` VALUES (242, '1', '3', '1', '18', '3');
INSERT INTO `location` VALUES (243, '1', '5', '2', '18', '3');
INSERT INTO `location` VALUES (244, '1', '5', '1', '18', '3');
INSERT INTO `location` VALUES (245, '2', '1', '2', '18', '3');
INSERT INTO `location` VALUES (246, '2', '1', '1', '18', '3');
INSERT INTO `location` VALUES (247, '2', '3', '2', '18', '3');
INSERT INTO `location` VALUES (248, '2', '3', '1', '18', '3');
INSERT INTO `location` VALUES (249, '2', '5', '2', '18', '3');
INSERT INTO `location` VALUES (250, '2', '5', '1', '18', '3');
INSERT INTO `location` VALUES (251, '4', '1', '2', '18', '3');
INSERT INTO `location` VALUES (252, '4', '1', '1', '18', '3');
INSERT INTO `location` VALUES (253, '1', '1', '2', '19', '3');
INSERT INTO `location` VALUES (254, '1', '1', '1', '19', '3');
INSERT INTO `location` VALUES (255, '1', '3', '2', '19', '3');
INSERT INTO `location` VALUES (256, '1', '3', '1', '19', '3');
INSERT INTO `location` VALUES (257, '1', '5', '2', '19', '3');
INSERT INTO `location` VALUES (258, '1', '5', '1', '19', '3');
INSERT INTO `location` VALUES (259, '2', '1', '2', '19', '3');
INSERT INTO `location` VALUES (260, '2', '1', '1', '19', '3');
INSERT INTO `location` VALUES (261, '2', '3', '2', '19', '3');
INSERT INTO `location` VALUES (262, '2', '3', '1', '19', '3');
INSERT INTO `location` VALUES (263, '2', '5', '2', '19', '3');
INSERT INTO `location` VALUES (264, '2', '5', '1', '19', '3');
INSERT INTO `location` VALUES (265, '4', '1', '2', '19', '3');
INSERT INTO `location` VALUES (266, '4', '1', '1', '19', '3');
INSERT INTO `location` VALUES (267, '1', '1', '2', '20', '3');
INSERT INTO `location` VALUES (268, '1', '1', '1', '20', '3');
INSERT INTO `location` VALUES (269, '1', '3', '2', '20', '3');
INSERT INTO `location` VALUES (270, '1', '3', '1', '20', '3');
INSERT INTO `location` VALUES (271, '1', '5', '2', '20', '3');
INSERT INTO `location` VALUES (272, '1', '5', '1', '20', '3');
INSERT INTO `location` VALUES (273, '2', '1', '2', '20', '3');
INSERT INTO `location` VALUES (274, '2', '1', '1', '20', '3');
INSERT INTO `location` VALUES (275, '2', '3', '2', '20', '3');
INSERT INTO `location` VALUES (276, '2', '3', '1', '20', '3');
INSERT INTO `location` VALUES (277, '2', '5', '2', '20', '3');
INSERT INTO `location` VALUES (278, '2', '5', '1', '20', '3');
INSERT INTO `location` VALUES (279, '4', '1', '2', '20', '3');
INSERT INTO `location` VALUES (280, '4', '1', '1', '20', '3');
INSERT INTO `location` VALUES (281, '1', '1', '2', '21', '3');
INSERT INTO `location` VALUES (282, '1', '1', '1', '21', '3');
INSERT INTO `location` VALUES (283, '1', '3', '2', '21', '3');
INSERT INTO `location` VALUES (284, '1', '3', '1', '21', '3');
INSERT INTO `location` VALUES (285, '1', '5', '2', '21', '3');
INSERT INTO `location` VALUES (286, '1', '5', '1', '21', '3');
INSERT INTO `location` VALUES (287, '2', '1', '2', '21', '3');
INSERT INTO `location` VALUES (288, '2', '1', '1', '21', '3');
INSERT INTO `location` VALUES (289, '2', '3', '2', '21', '3');
INSERT INTO `location` VALUES (290, '2', '3', '1', '21', '3');
INSERT INTO `location` VALUES (291, '2', '5', '2', '21', '3');
INSERT INTO `location` VALUES (292, '2', '5', '1', '21', '3');
INSERT INTO `location` VALUES (293, '4', '1', '2', '21', '3');
INSERT INTO `location` VALUES (294, '4', '1', '1', '21', '3');
INSERT INTO `location` VALUES (295, '1', '1', '2', '22', '3');
INSERT INTO `location` VALUES (296, '1', '1', '1', '22', '3');
INSERT INTO `location` VALUES (297, '1', '3', '2', '22', '3');
INSERT INTO `location` VALUES (298, '1', '3', '1', '22', '3');
INSERT INTO `location` VALUES (299, '1', '5', '2', '22', '3');
INSERT INTO `location` VALUES (300, '1', '5', '1', '22', '3');
INSERT INTO `location` VALUES (301, '2', '1', '2', '22', '3');
INSERT INTO `location` VALUES (302, '2', '1', '1', '22', '3');
INSERT INTO `location` VALUES (303, '2', '3', '2', '22', '3');
INSERT INTO `location` VALUES (304, '2', '3', '1', '22', '3');
INSERT INTO `location` VALUES (305, '2', '5', '2', '22', '3');
INSERT INTO `location` VALUES (306, '2', '5', '1', '22', '3');
INSERT INTO `location` VALUES (307, '4', '1', '2', '22', '3');
INSERT INTO `location` VALUES (308, '4', '1', '1', '22', '3');
INSERT INTO `location` VALUES (309, '1', '1', '2', '23', '3');
INSERT INTO `location` VALUES (310, '1', '1', '1', '23', '3');
INSERT INTO `location` VALUES (311, '1', '3', '2', '23', '3');
INSERT INTO `location` VALUES (312, '1', '3', '1', '23', '3');
INSERT INTO `location` VALUES (313, '1', '5', '2', '23', '3');
INSERT INTO `location` VALUES (314, '1', '5', '1', '23', '3');
INSERT INTO `location` VALUES (315, '2', '1', '2', '23', '3');
INSERT INTO `location` VALUES (316, '2', '1', '1', '23', '3');
INSERT INTO `location` VALUES (317, '2', '3', '2', '23', '3');
INSERT INTO `location` VALUES (318, '2', '3', '1', '23', '3');
INSERT INTO `location` VALUES (319, '2', '5', '2', '23', '3');
INSERT INTO `location` VALUES (320, '2', '5', '1', '23', '3');
INSERT INTO `location` VALUES (321, '4', '1', '2', '23', '3');
INSERT INTO `location` VALUES (322, '4', '1', '1', '23', '3');
INSERT INTO `location` VALUES (323, '1', '1', '2', '24', '3');
INSERT INTO `location` VALUES (324, '1', '1', '1', '24', '3');
INSERT INTO `location` VALUES (325, '1', '3', '2', '24', '3');
INSERT INTO `location` VALUES (326, '1', '3', '1', '24', '3');
INSERT INTO `location` VALUES (327, '1', '5', '2', '24', '3');
INSERT INTO `location` VALUES (328, '1', '5', '1', '24', '3');
INSERT INTO `location` VALUES (329, '2', '1', '2', '24', '3');
INSERT INTO `location` VALUES (330, '2', '1', '1', '24', '3');
INSERT INTO `location` VALUES (331, '2', '3', '2', '24', '3');
INSERT INTO `location` VALUES (332, '2', '3', '1', '24', '3');
INSERT INTO `location` VALUES (333, '2', '5', '2', '24', '3');
INSERT INTO `location` VALUES (334, '2', '5', '1', '24', '3');
INSERT INTO `location` VALUES (335, '4', '1', '2', '24', '3');
INSERT INTO `location` VALUES (336, '4', '1', '1', '24', '3');
INSERT INTO `location` VALUES (337, '1', '1', '2', '25', '3');
INSERT INTO `location` VALUES (338, '1', '1', '1', '25', '3');
INSERT INTO `location` VALUES (339, '1', '3', '2', '25', '3');
INSERT INTO `location` VALUES (340, '1', '3', '1', '25', '3');
INSERT INTO `location` VALUES (341, '1', '5', '2', '25', '3');
INSERT INTO `location` VALUES (342, '1', '5', '1', '25', '3');
INSERT INTO `location` VALUES (343, '2', '1', '2', '25', '3');
INSERT INTO `location` VALUES (344, '2', '1', '1', '25', '3');
INSERT INTO `location` VALUES (345, '2', '3', '2', '25', '3');
INSERT INTO `location` VALUES (346, '2', '3', '1', '25', '3');
INSERT INTO `location` VALUES (347, '2', '5', '2', '25', '3');
INSERT INTO `location` VALUES (348, '2', '5', '1', '25', '3');
INSERT INTO `location` VALUES (349, '4', '1', '2', '25', '3');
INSERT INTO `location` VALUES (350, '4', '1', '1', '25', '3');
INSERT INTO `location` VALUES (351, '1', '1', '2', '26', '3');
INSERT INTO `location` VALUES (352, '1', '1', '1', '26', '3');
INSERT INTO `location` VALUES (353, '1', '3', '2', '26', '3');
INSERT INTO `location` VALUES (354, '1', '3', '1', '26', '3');
INSERT INTO `location` VALUES (355, '1', '5', '2', '26', '3');
INSERT INTO `location` VALUES (356, '1', '5', '1', '26', '3');
INSERT INTO `location` VALUES (357, '2', '1', '2', '26', '3');
INSERT INTO `location` VALUES (358, '2', '1', '1', '26', '3');
INSERT INTO `location` VALUES (359, '2', '3', '2', '26', '3');
INSERT INTO `location` VALUES (360, '2', '3', '1', '26', '3');
INSERT INTO `location` VALUES (361, '2', '5', '2', '26', '3');
INSERT INTO `location` VALUES (362, '2', '5', '1', '26', '3');
INSERT INTO `location` VALUES (363, '4', '1', '2', '26', '3');
INSERT INTO `location` VALUES (364, '4', '1', '1', '26', '3');
INSERT INTO `location` VALUES (365, '1', '1', '2', '27', '3');
INSERT INTO `location` VALUES (366, '1', '1', '1', '27', '3');
INSERT INTO `location` VALUES (367, '1', '3', '2', '27', '3');
INSERT INTO `location` VALUES (368, '1', '3', '1', '27', '3');
INSERT INTO `location` VALUES (369, '1', '5', '2', '27', '3');
INSERT INTO `location` VALUES (370, '1', '5', '1', '27', '3');
INSERT INTO `location` VALUES (371, '2', '1', '2', '27', '3');
INSERT INTO `location` VALUES (372, '2', '1', '1', '27', '3');
INSERT INTO `location` VALUES (373, '2', '3', '2', '27', '3');
INSERT INTO `location` VALUES (374, '2', '3', '1', '27', '3');
INSERT INTO `location` VALUES (375, '2', '5', '2', '27', '3');
INSERT INTO `location` VALUES (376, '2', '5', '1', '27', '3');
INSERT INTO `location` VALUES (377, '4', '1', '2', '27', '3');
INSERT INTO `location` VALUES (378, '4', '1', '1', '27', '3');
INSERT INTO `location` VALUES (379, '1', '1', '2', '28', '3');
INSERT INTO `location` VALUES (380, '1', '1', '1', '28', '3');
INSERT INTO `location` VALUES (381, '1', '3', '2', '28', '3');
INSERT INTO `location` VALUES (382, '1', '3', '1', '28', '3');
INSERT INTO `location` VALUES (383, '1', '5', '2', '28', '3');
INSERT INTO `location` VALUES (384, '1', '5', '1', '28', '3');
INSERT INTO `location` VALUES (385, '2', '1', '2', '28', '3');
INSERT INTO `location` VALUES (386, '2', '1', '1', '28', '3');
INSERT INTO `location` VALUES (387, '2', '3', '2', '28', '3');
INSERT INTO `location` VALUES (388, '2', '3', '1', '28', '3');
INSERT INTO `location` VALUES (389, '2', '5', '2', '28', '3');
INSERT INTO `location` VALUES (390, '2', '5', '1', '28', '3');
INSERT INTO `location` VALUES (391, '4', '1', '2', '28', '3');
INSERT INTO `location` VALUES (392, '4', '1', '1', '28', '3');
INSERT INTO `location` VALUES (393, '1', '1', '2', '29', '3');
INSERT INTO `location` VALUES (394, '1', '1', '1', '29', '3');
INSERT INTO `location` VALUES (395, '1', '3', '2', '29', '3');
INSERT INTO `location` VALUES (396, '1', '3', '1', '29', '3');
INSERT INTO `location` VALUES (397, '1', '5', '2', '29', '3');
INSERT INTO `location` VALUES (398, '1', '5', '1', '29', '3');
INSERT INTO `location` VALUES (399, '2', '1', '2', '29', '3');
INSERT INTO `location` VALUES (400, '2', '1', '1', '29', '3');
INSERT INTO `location` VALUES (401, '2', '3', '2', '29', '3');
INSERT INTO `location` VALUES (402, '2', '3', '1', '29', '3');
INSERT INTO `location` VALUES (403, '2', '5', '2', '29', '3');
INSERT INTO `location` VALUES (404, '2', '5', '1', '29', '3');
INSERT INTO `location` VALUES (405, '4', '1', '2', '29', '3');
INSERT INTO `location` VALUES (406, '4', '1', '1', '29', '3');
INSERT INTO `location` VALUES (407, '1', '2', '2', '1', '3');
INSERT INTO `location` VALUES (408, '1', '2', '1', '1', '3');
INSERT INTO `location` VALUES (409, '1', '4', '2', '1', '3');
INSERT INTO `location` VALUES (410, '1', '4', '1', '1', '3');
INSERT INTO `location` VALUES (411, '1', '6', '2', '1', '3');
INSERT INTO `location` VALUES (412, '1', '6', '1', '1', '3');
INSERT INTO `location` VALUES (413, '2', '2', '2', '1', '3');
INSERT INTO `location` VALUES (414, '2', '2', '1', '1', '3');
INSERT INTO `location` VALUES (415, '2', '4', '2', '1', '3');
INSERT INTO `location` VALUES (416, '2', '4', '1', '1', '3');
INSERT INTO `location` VALUES (417, '3', '1', '2', '30', '3');
INSERT INTO `location` VALUES (418, '3', '1', '2', '1', '3');
INSERT INTO `location` VALUES (419, '3', '1', '1', '1', '3');
INSERT INTO `location` VALUES (420, '1', '2', '2', '2', '3');
INSERT INTO `location` VALUES (421, '1', '2', '1', '2', '3');
INSERT INTO `location` VALUES (422, '1', '4', '2', '2', '3');
INSERT INTO `location` VALUES (423, '1', '4', '1', '2', '3');
INSERT INTO `location` VALUES (424, '1', '6', '2', '2', '3');
INSERT INTO `location` VALUES (425, '1', '6', '1', '2', '3');
INSERT INTO `location` VALUES (426, '2', '2', '2', '2', '3');
INSERT INTO `location` VALUES (427, '2', '2', '1', '2', '3');
INSERT INTO `location` VALUES (428, '2', '4', '2', '2', '3');
INSERT INTO `location` VALUES (429, '2', '4', '1', '2', '3');
INSERT INTO `location` VALUES (430, '3', '1', '2', '2', '3');
INSERT INTO `location` VALUES (431, '3', '1', '1', '2', '3');
INSERT INTO `location` VALUES (432, '1', '2', '2', '3', '3');
INSERT INTO `location` VALUES (433, '1', '2', '1', '3', '3');
INSERT INTO `location` VALUES (434, '1', '4', '2', '3', '3');
INSERT INTO `location` VALUES (435, '1', '4', '1', '3', '3');
INSERT INTO `location` VALUES (436, '1', '6', '2', '3', '3');
INSERT INTO `location` VALUES (437, '1', '6', '1', '3', '3');
INSERT INTO `location` VALUES (438, '2', '2', '2', '3', '3');
INSERT INTO `location` VALUES (439, '2', '2', '1', '3', '3');
INSERT INTO `location` VALUES (440, '2', '4', '2', '3', '3');
INSERT INTO `location` VALUES (441, '2', '4', '1', '3', '3');
INSERT INTO `location` VALUES (442, '3', '1', '2', '3', '3');
INSERT INTO `location` VALUES (443, '3', '1', '1', '3', '3');
INSERT INTO `location` VALUES (444, '1', '2', '2', '4', '3');
INSERT INTO `location` VALUES (445, '1', '2', '1', '4', '3');
INSERT INTO `location` VALUES (446, '1', '4', '2', '4', '3');
INSERT INTO `location` VALUES (447, '1', '4', '1', '4', '3');
INSERT INTO `location` VALUES (448, '1', '6', '2', '4', '3');
INSERT INTO `location` VALUES (449, '1', '6', '1', '4', '3');
INSERT INTO `location` VALUES (450, '2', '2', '2', '4', '3');
INSERT INTO `location` VALUES (451, '2', '2', '1', '4', '3');
INSERT INTO `location` VALUES (452, '2', '4', '2', '4', '3');
INSERT INTO `location` VALUES (453, '2', '4', '1', '4', '3');
INSERT INTO `location` VALUES (454, '3', '1', '2', '4', '3');
INSERT INTO `location` VALUES (455, '3', '1', '1', '4', '3');
INSERT INTO `location` VALUES (456, '1', '2', '2', '5', '3');
INSERT INTO `location` VALUES (457, '1', '2', '1', '5', '3');
INSERT INTO `location` VALUES (458, '1', '4', '2', '5', '3');
INSERT INTO `location` VALUES (459, '1', '4', '1', '5', '3');
INSERT INTO `location` VALUES (460, '1', '6', '2', '5', '3');
INSERT INTO `location` VALUES (461, '1', '6', '1', '5', '3');
INSERT INTO `location` VALUES (462, '2', '2', '2', '5', '3');
INSERT INTO `location` VALUES (463, '2', '2', '1', '5', '3');
INSERT INTO `location` VALUES (464, '2', '4', '2', '5', '3');
INSERT INTO `location` VALUES (465, '2', '4', '1', '5', '3');
INSERT INTO `location` VALUES (466, '3', '1', '2', '5', '3');
INSERT INTO `location` VALUES (467, '3', '1', '1', '5', '3');
INSERT INTO `location` VALUES (468, '1', '2', '2', '6', '3');
INSERT INTO `location` VALUES (469, '1', '2', '1', '6', '3');
INSERT INTO `location` VALUES (470, '1', '4', '2', '6', '3');
INSERT INTO `location` VALUES (471, '1', '4', '1', '6', '3');
INSERT INTO `location` VALUES (472, '1', '6', '2', '6', '3');
INSERT INTO `location` VALUES (473, '1', '6', '1', '6', '3');
INSERT INTO `location` VALUES (474, '2', '2', '2', '6', '3');
INSERT INTO `location` VALUES (475, '2', '2', '1', '6', '3');
INSERT INTO `location` VALUES (476, '2', '4', '2', '6', '3');
INSERT INTO `location` VALUES (477, '2', '4', '1', '6', '3');
INSERT INTO `location` VALUES (478, '3', '1', '2', '6', '3');
INSERT INTO `location` VALUES (479, '3', '1', '1', '6', '3');
INSERT INTO `location` VALUES (480, '1', '2', '2', '7', '3');
INSERT INTO `location` VALUES (481, '1', '2', '1', '7', '3');
INSERT INTO `location` VALUES (482, '1', '4', '2', '7', '3');
INSERT INTO `location` VALUES (483, '1', '4', '1', '7', '3');
INSERT INTO `location` VALUES (484, '1', '6', '2', '7', '3');
INSERT INTO `location` VALUES (485, '1', '6', '1', '7', '3');
INSERT INTO `location` VALUES (486, '2', '2', '2', '7', '3');
INSERT INTO `location` VALUES (487, '2', '2', '1', '7', '3');
INSERT INTO `location` VALUES (488, '2', '4', '2', '7', '3');
INSERT INTO `location` VALUES (489, '2', '4', '1', '7', '3');
INSERT INTO `location` VALUES (490, '3', '1', '2', '7', '3');
INSERT INTO `location` VALUES (491, '3', '1', '1', '7', '3');
INSERT INTO `location` VALUES (492, '1', '2', '2', '8', '3');
INSERT INTO `location` VALUES (493, '1', '2', '1', '8', '3');
INSERT INTO `location` VALUES (494, '1', '4', '2', '8', '3');
INSERT INTO `location` VALUES (495, '1', '4', '1', '8', '3');
INSERT INTO `location` VALUES (496, '1', '6', '2', '8', '3');
INSERT INTO `location` VALUES (497, '1', '6', '1', '8', '3');
INSERT INTO `location` VALUES (498, '2', '2', '2', '8', '3');
INSERT INTO `location` VALUES (499, '2', '2', '1', '8', '3');
INSERT INTO `location` VALUES (500, '2', '4', '2', '8', '3');
INSERT INTO `location` VALUES (501, '2', '4', '1', '8', '3');
INSERT INTO `location` VALUES (502, '3', '1', '2', '8', '3');
INSERT INTO `location` VALUES (503, '3', '1', '1', '8', '3');
INSERT INTO `location` VALUES (504, '1', '2', '2', '9', '3');
INSERT INTO `location` VALUES (505, '1', '2', '1', '9', '3');
INSERT INTO `location` VALUES (506, '1', '4', '2', '9', '3');
INSERT INTO `location` VALUES (507, '1', '4', '1', '9', '3');
INSERT INTO `location` VALUES (508, '1', '6', '2', '9', '3');
INSERT INTO `location` VALUES (509, '1', '6', '1', '9', '3');
INSERT INTO `location` VALUES (510, '2', '2', '2', '9', '3');
INSERT INTO `location` VALUES (511, '2', '2', '1', '9', '3');
INSERT INTO `location` VALUES (512, '2', '4', '2', '9', '3');
INSERT INTO `location` VALUES (513, '2', '4', '1', '9', '3');
INSERT INTO `location` VALUES (514, '3', '1', '2', '9', '3');
INSERT INTO `location` VALUES (515, '3', '1', '1', '9', '3');
INSERT INTO `location` VALUES (516, '1', '2', '2', '10', '3');
INSERT INTO `location` VALUES (517, '1', '2', '1', '10', '3');
INSERT INTO `location` VALUES (518, '1', '4', '2', '10', '3');
INSERT INTO `location` VALUES (519, '1', '4', '1', '10', '3');
INSERT INTO `location` VALUES (520, '1', '6', '2', '10', '3');
INSERT INTO `location` VALUES (521, '1', '6', '1', '10', '3');
INSERT INTO `location` VALUES (522, '2', '2', '2', '10', '3');
INSERT INTO `location` VALUES (523, '2', '2', '1', '10', '3');
INSERT INTO `location` VALUES (524, '2', '4', '2', '10', '3');
INSERT INTO `location` VALUES (525, '2', '4', '1', '10', '3');
INSERT INTO `location` VALUES (526, '3', '1', '2', '10', '3');
INSERT INTO `location` VALUES (527, '3', '1', '1', '10', '3');
INSERT INTO `location` VALUES (528, '1', '2', '2', '11', '3');
INSERT INTO `location` VALUES (529, '1', '2', '1', '11', '3');
INSERT INTO `location` VALUES (530, '1', '4', '2', '11', '3');
INSERT INTO `location` VALUES (531, '1', '4', '1', '11', '3');
INSERT INTO `location` VALUES (532, '1', '6', '2', '11', '3');
INSERT INTO `location` VALUES (533, '1', '6', '1', '11', '3');
INSERT INTO `location` VALUES (534, '2', '2', '2', '11', '3');
INSERT INTO `location` VALUES (535, '2', '2', '1', '11', '3');
INSERT INTO `location` VALUES (536, '2', '4', '2', '11', '3');
INSERT INTO `location` VALUES (537, '2', '4', '1', '11', '3');
INSERT INTO `location` VALUES (538, '3', '1', '2', '11', '3');
INSERT INTO `location` VALUES (539, '3', '1', '1', '11', '3');
INSERT INTO `location` VALUES (540, '1', '2', '2', '12', '3');
INSERT INTO `location` VALUES (541, '1', '2', '1', '12', '3');
INSERT INTO `location` VALUES (542, '1', '4', '2', '12', '3');
INSERT INTO `location` VALUES (543, '1', '4', '1', '12', '3');
INSERT INTO `location` VALUES (544, '1', '6', '2', '12', '3');
INSERT INTO `location` VALUES (545, '1', '6', '1', '12', '3');
INSERT INTO `location` VALUES (546, '2', '2', '2', '12', '3');
INSERT INTO `location` VALUES (547, '2', '2', '1', '12', '3');
INSERT INTO `location` VALUES (548, '2', '4', '2', '12', '3');
INSERT INTO `location` VALUES (549, '2', '4', '1', '12', '3');
INSERT INTO `location` VALUES (550, '3', '1', '2', '12', '3');
INSERT INTO `location` VALUES (551, '3', '1', '1', '12', '3');
INSERT INTO `location` VALUES (552, '1', '2', '2', '13', '3');
INSERT INTO `location` VALUES (553, '1', '2', '1', '13', '3');
INSERT INTO `location` VALUES (554, '1', '4', '2', '13', '3');
INSERT INTO `location` VALUES (555, '1', '4', '1', '13', '3');
INSERT INTO `location` VALUES (556, '1', '6', '2', '13', '3');
INSERT INTO `location` VALUES (557, '1', '6', '1', '13', '3');
INSERT INTO `location` VALUES (558, '2', '2', '2', '13', '3');
INSERT INTO `location` VALUES (559, '2', '2', '1', '13', '3');
INSERT INTO `location` VALUES (560, '2', '4', '2', '13', '3');
INSERT INTO `location` VALUES (561, '2', '4', '1', '13', '3');
INSERT INTO `location` VALUES (562, '3', '1', '2', '13', '3');
INSERT INTO `location` VALUES (563, '3', '1', '1', '13', '3');
INSERT INTO `location` VALUES (564, '1', '2', '2', '14', '3');
INSERT INTO `location` VALUES (565, '1', '2', '1', '14', '3');
INSERT INTO `location` VALUES (566, '1', '4', '2', '14', '3');
INSERT INTO `location` VALUES (567, '1', '4', '1', '14', '3');
INSERT INTO `location` VALUES (568, '1', '6', '2', '14', '3');
INSERT INTO `location` VALUES (569, '1', '6', '1', '14', '3');
INSERT INTO `location` VALUES (570, '2', '2', '2', '14', '3');
INSERT INTO `location` VALUES (571, '2', '2', '1', '14', '3');
INSERT INTO `location` VALUES (572, '2', '4', '2', '14', '3');
INSERT INTO `location` VALUES (573, '2', '4', '1', '14', '3');
INSERT INTO `location` VALUES (574, '3', '1', '2', '14', '3');
INSERT INTO `location` VALUES (575, '3', '1', '1', '14', '3');
INSERT INTO `location` VALUES (576, '1', '2', '2', '15', '3');
INSERT INTO `location` VALUES (577, '1', '2', '1', '15', '3');
INSERT INTO `location` VALUES (578, '1', '4', '2', '15', '3');
INSERT INTO `location` VALUES (579, '1', '4', '1', '15', '3');
INSERT INTO `location` VALUES (580, '1', '6', '2', '15', '3');
INSERT INTO `location` VALUES (581, '1', '6', '1', '15', '3');
INSERT INTO `location` VALUES (582, '2', '2', '2', '15', '3');
INSERT INTO `location` VALUES (583, '2', '2', '1', '15', '3');
INSERT INTO `location` VALUES (584, '2', '4', '2', '15', '3');
INSERT INTO `location` VALUES (585, '2', '4', '1', '15', '3');
INSERT INTO `location` VALUES (586, '3', '1', '2', '15', '3');
INSERT INTO `location` VALUES (587, '3', '1', '1', '15', '3');
INSERT INTO `location` VALUES (588, '1', '2', '2', '16', '3');
INSERT INTO `location` VALUES (589, '1', '2', '1', '16', '3');
INSERT INTO `location` VALUES (590, '1', '4', '2', '16', '3');
INSERT INTO `location` VALUES (591, '1', '4', '1', '16', '3');
INSERT INTO `location` VALUES (592, '1', '6', '2', '16', '3');
INSERT INTO `location` VALUES (593, '1', '6', '1', '16', '3');
INSERT INTO `location` VALUES (594, '2', '2', '2', '16', '3');
INSERT INTO `location` VALUES (595, '2', '2', '1', '16', '3');
INSERT INTO `location` VALUES (596, '2', '4', '2', '16', '3');
INSERT INTO `location` VALUES (597, '2', '4', '1', '16', '3');
INSERT INTO `location` VALUES (598, '3', '1', '2', '16', '3');
INSERT INTO `location` VALUES (599, '3', '1', '1', '16', '3');
INSERT INTO `location` VALUES (600, '1', '2', '2', '17', '3');
INSERT INTO `location` VALUES (601, '1', '2', '1', '17', '3');
INSERT INTO `location` VALUES (602, '1', '4', '2', '17', '3');
INSERT INTO `location` VALUES (603, '1', '4', '1', '17', '3');
INSERT INTO `location` VALUES (604, '1', '6', '2', '17', '3');
INSERT INTO `location` VALUES (605, '1', '6', '1', '17', '3');
INSERT INTO `location` VALUES (606, '2', '2', '2', '17', '3');
INSERT INTO `location` VALUES (607, '2', '2', '1', '17', '3');
INSERT INTO `location` VALUES (608, '2', '4', '2', '17', '3');
INSERT INTO `location` VALUES (609, '2', '4', '1', '17', '3');
INSERT INTO `location` VALUES (610, '3', '1', '2', '17', '3');
INSERT INTO `location` VALUES (611, '3', '1', '1', '17', '3');
INSERT INTO `location` VALUES (612, '1', '2', '2', '18', '3');
INSERT INTO `location` VALUES (613, '1', '2', '1', '18', '3');
INSERT INTO `location` VALUES (614, '1', '4', '2', '18', '3');
INSERT INTO `location` VALUES (615, '1', '4', '1', '18', '3');
INSERT INTO `location` VALUES (616, '1', '6', '2', '18', '3');
INSERT INTO `location` VALUES (617, '1', '6', '1', '18', '3');
INSERT INTO `location` VALUES (618, '2', '2', '2', '18', '3');
INSERT INTO `location` VALUES (619, '2', '2', '1', '18', '3');
INSERT INTO `location` VALUES (620, '2', '4', '2', '18', '3');
INSERT INTO `location` VALUES (621, '2', '4', '1', '18', '3');
INSERT INTO `location` VALUES (622, '3', '1', '2', '18', '3');
INSERT INTO `location` VALUES (623, '3', '1', '1', '18', '3');
INSERT INTO `location` VALUES (624, '1', '2', '2', '19', '3');
INSERT INTO `location` VALUES (625, '1', '2', '1', '19', '3');
INSERT INTO `location` VALUES (626, '1', '4', '2', '19', '3');
INSERT INTO `location` VALUES (627, '1', '4', '1', '19', '3');
INSERT INTO `location` VALUES (628, '1', '6', '2', '19', '3');
INSERT INTO `location` VALUES (629, '1', '6', '1', '19', '3');
INSERT INTO `location` VALUES (630, '2', '2', '2', '19', '3');
INSERT INTO `location` VALUES (631, '2', '2', '1', '19', '3');
INSERT INTO `location` VALUES (632, '2', '4', '2', '19', '3');
INSERT INTO `location` VALUES (633, '2', '4', '1', '19', '3');
INSERT INTO `location` VALUES (634, '3', '1', '2', '19', '3');
INSERT INTO `location` VALUES (635, '3', '1', '1', '19', '3');
INSERT INTO `location` VALUES (636, '1', '2', '2', '20', '3');
INSERT INTO `location` VALUES (637, '1', '2', '1', '20', '3');
INSERT INTO `location` VALUES (638, '1', '4', '2', '20', '3');
INSERT INTO `location` VALUES (639, '1', '4', '1', '20', '3');
INSERT INTO `location` VALUES (640, '1', '6', '2', '20', '3');
INSERT INTO `location` VALUES (641, '1', '6', '1', '20', '3');
INSERT INTO `location` VALUES (642, '2', '2', '2', '20', '3');
INSERT INTO `location` VALUES (643, '2', '2', '1', '20', '3');
INSERT INTO `location` VALUES (644, '2', '4', '2', '20', '3');
INSERT INTO `location` VALUES (645, '2', '4', '1', '20', '3');
INSERT INTO `location` VALUES (646, '3', '1', '2', '20', '3');
INSERT INTO `location` VALUES (647, '3', '1', '1', '20', '3');
INSERT INTO `location` VALUES (648, '1', '2', '2', '21', '3');
INSERT INTO `location` VALUES (649, '1', '2', '1', '21', '3');
INSERT INTO `location` VALUES (650, '1', '4', '2', '21', '3');
INSERT INTO `location` VALUES (651, '1', '4', '1', '21', '3');
INSERT INTO `location` VALUES (652, '1', '6', '2', '21', '3');
INSERT INTO `location` VALUES (653, '1', '6', '1', '21', '3');
INSERT INTO `location` VALUES (654, '2', '2', '2', '21', '3');
INSERT INTO `location` VALUES (655, '2', '2', '1', '21', '3');
INSERT INTO `location` VALUES (656, '2', '4', '2', '21', '3');
INSERT INTO `location` VALUES (657, '2', '4', '1', '21', '3');
INSERT INTO `location` VALUES (658, '3', '1', '2', '21', '3');
INSERT INTO `location` VALUES (659, '3', '1', '1', '21', '3');
INSERT INTO `location` VALUES (660, '1', '2', '2', '22', '3');
INSERT INTO `location` VALUES (661, '1', '2', '1', '22', '3');
INSERT INTO `location` VALUES (662, '1', '4', '2', '22', '3');
INSERT INTO `location` VALUES (663, '1', '4', '1', '22', '3');
INSERT INTO `location` VALUES (664, '1', '6', '2', '22', '3');
INSERT INTO `location` VALUES (665, '1', '6', '1', '22', '3');
INSERT INTO `location` VALUES (666, '2', '2', '2', '22', '3');
INSERT INTO `location` VALUES (667, '2', '2', '1', '22', '3');
INSERT INTO `location` VALUES (668, '2', '4', '2', '22', '3');
INSERT INTO `location` VALUES (669, '2', '4', '1', '22', '3');
INSERT INTO `location` VALUES (670, '3', '1', '2', '22', '3');
INSERT INTO `location` VALUES (671, '3', '1', '1', '22', '3');
INSERT INTO `location` VALUES (672, '1', '2', '2', '23', '3');
INSERT INTO `location` VALUES (673, '1', '2', '1', '23', '3');
INSERT INTO `location` VALUES (674, '1', '4', '2', '23', '3');
INSERT INTO `location` VALUES (675, '1', '4', '1', '23', '3');
INSERT INTO `location` VALUES (676, '1', '6', '2', '23', '3');
INSERT INTO `location` VALUES (677, '1', '6', '1', '23', '3');
INSERT INTO `location` VALUES (678, '2', '2', '2', '23', '3');
INSERT INTO `location` VALUES (679, '2', '2', '1', '23', '3');
INSERT INTO `location` VALUES (680, '2', '4', '2', '23', '3');
INSERT INTO `location` VALUES (681, '2', '4', '1', '23', '3');
INSERT INTO `location` VALUES (682, '3', '1', '2', '23', '3');
INSERT INTO `location` VALUES (683, '3', '1', '1', '23', '3');
INSERT INTO `location` VALUES (684, '1', '2', '2', '24', '3');
INSERT INTO `location` VALUES (685, '1', '2', '1', '24', '3');
INSERT INTO `location` VALUES (686, '1', '4', '2', '24', '3');
INSERT INTO `location` VALUES (687, '1', '4', '1', '24', '3');
INSERT INTO `location` VALUES (688, '1', '6', '2', '24', '3');
INSERT INTO `location` VALUES (689, '1', '6', '1', '24', '3');
INSERT INTO `location` VALUES (690, '2', '2', '2', '24', '3');
INSERT INTO `location` VALUES (691, '2', '2', '1', '24', '3');
INSERT INTO `location` VALUES (692, '2', '4', '2', '24', '3');
INSERT INTO `location` VALUES (693, '2', '4', '1', '24', '3');
INSERT INTO `location` VALUES (694, '3', '1', '2', '24', '3');
INSERT INTO `location` VALUES (695, '3', '1', '1', '24', '3');
INSERT INTO `location` VALUES (696, '1', '2', '2', '25', '3');
INSERT INTO `location` VALUES (697, '1', '2', '1', '25', '3');
INSERT INTO `location` VALUES (698, '1', '4', '2', '25', '3');
INSERT INTO `location` VALUES (699, '1', '4', '1', '25', '3');
INSERT INTO `location` VALUES (700, '1', '6', '2', '25', '3');
INSERT INTO `location` VALUES (701, '1', '6', '1', '25', '3');
INSERT INTO `location` VALUES (702, '2', '2', '2', '25', '3');
INSERT INTO `location` VALUES (703, '2', '2', '1', '25', '3');
INSERT INTO `location` VALUES (704, '2', '4', '2', '25', '3');
INSERT INTO `location` VALUES (705, '2', '4', '1', '25', '3');
INSERT INTO `location` VALUES (706, '3', '1', '2', '25', '3');
INSERT INTO `location` VALUES (707, '3', '1', '1', '25', '3');
INSERT INTO `location` VALUES (708, '1', '2', '2', '26', '3');
INSERT INTO `location` VALUES (709, '1', '2', '1', '26', '3');
INSERT INTO `location` VALUES (710, '1', '4', '2', '26', '3');
INSERT INTO `location` VALUES (711, '1', '4', '1', '26', '3');
INSERT INTO `location` VALUES (712, '1', '6', '2', '26', '3');
INSERT INTO `location` VALUES (713, '1', '6', '1', '26', '3');
INSERT INTO `location` VALUES (714, '2', '2', '2', '26', '3');
INSERT INTO `location` VALUES (715, '2', '2', '1', '26', '3');
INSERT INTO `location` VALUES (716, '2', '4', '2', '26', '3');
INSERT INTO `location` VALUES (717, '2', '4', '1', '26', '3');
INSERT INTO `location` VALUES (718, '3', '1', '2', '26', '3');
INSERT INTO `location` VALUES (719, '3', '1', '1', '26', '3');
INSERT INTO `location` VALUES (720, '1', '2', '2', '27', '3');
INSERT INTO `location` VALUES (721, '1', '2', '1', '27', '3');
INSERT INTO `location` VALUES (722, '1', '4', '2', '27', '3');
INSERT INTO `location` VALUES (723, '1', '4', '1', '27', '3');
INSERT INTO `location` VALUES (724, '1', '6', '2', '27', '3');
INSERT INTO `location` VALUES (725, '1', '6', '1', '27', '3');
INSERT INTO `location` VALUES (726, '2', '2', '2', '27', '3');
INSERT INTO `location` VALUES (727, '2', '2', '1', '27', '3');
INSERT INTO `location` VALUES (728, '2', '4', '2', '27', '3');
INSERT INTO `location` VALUES (729, '2', '4', '1', '27', '3');
INSERT INTO `location` VALUES (730, '3', '1', '2', '27', '3');
INSERT INTO `location` VALUES (731, '3', '1', '1', '27', '3');
INSERT INTO `location` VALUES (732, '1', '2', '2', '28', '3');
INSERT INTO `location` VALUES (733, '1', '2', '1', '28', '3');
INSERT INTO `location` VALUES (734, '1', '4', '2', '28', '3');
INSERT INTO `location` VALUES (735, '1', '4', '1', '28', '3');
INSERT INTO `location` VALUES (736, '1', '6', '2', '28', '3');
INSERT INTO `location` VALUES (737, '1', '6', '1', '28', '3');
INSERT INTO `location` VALUES (738, '2', '2', '2', '28', '3');
INSERT INTO `location` VALUES (739, '2', '2', '1', '28', '3');
INSERT INTO `location` VALUES (740, '2', '4', '2', '28', '3');
INSERT INTO `location` VALUES (741, '2', '4', '1', '28', '3');
INSERT INTO `location` VALUES (742, '3', '1', '2', '28', '3');
INSERT INTO `location` VALUES (743, '3', '1', '1', '28', '3');
INSERT INTO `location` VALUES (744, '1', '2', '2', '29', '3');
INSERT INTO `location` VALUES (745, '1', '2', '1', '29', '3');
INSERT INTO `location` VALUES (746, '1', '4', '2', '29', '3');
INSERT INTO `location` VALUES (747, '1', '4', '1', '29', '3');
INSERT INTO `location` VALUES (748, '1', '6', '2', '29', '3');
INSERT INTO `location` VALUES (749, '1', '6', '1', '29', '3');
INSERT INTO `location` VALUES (750, '2', '2', '2', '29', '3');
INSERT INTO `location` VALUES (751, '2', '2', '1', '29', '3');
INSERT INTO `location` VALUES (752, '2', '4', '2', '29', '3');
INSERT INTO `location` VALUES (753, '2', '4', '1', '29', '3');
INSERT INTO `location` VALUES (754, '3', '1', '2', '29', '3');
INSERT INTO `location` VALUES (755, '3', '1', '1', '29', '3');
INSERT INTO `location` VALUES (756, '3', '1', '1', '30', '3');
INSERT INTO `location` VALUES (757, '3', '1', '2', '31', '3');
INSERT INTO `location` VALUES (758, '3', '1', '1', '31', '3');
INSERT INTO `location` VALUES (759, '3', '1', '2', '32', '3');
INSERT INTO `location` VALUES (760, '3', '1', '1', '32', '3');
INSERT INTO `location` VALUES (761, '3', '1', '2', '33', '3');
INSERT INTO `location` VALUES (762, '3', '1', '1', '33', '3');
INSERT INTO `location` VALUES (763, '3', '1', '2', '34', '3');
INSERT INTO `location` VALUES (764, '3', '1', '1', '34', '3');
INSERT INTO `location` VALUES (765, '3', '1', '2', '35', '3');
INSERT INTO `location` VALUES (766, '3', '1', '1', '35', '3');
INSERT INTO `location` VALUES (767, '3', '1', '2', '36', '3');
INSERT INTO `location` VALUES (768, '3', '1', '1', '36', '3');
INSERT INTO `location` VALUES (769, '3', '1', '2', '37', '3');
INSERT INTO `location` VALUES (770, '3', '1', '1', '37', '3');
INSERT INTO `location` VALUES (771, '3', '1', '2', '38', '3');
INSERT INTO `location` VALUES (772, '3', '1', '1', '38', '3');
INSERT INTO `location` VALUES (773, '3', '1', '2', '39', '3');
INSERT INTO `location` VALUES (774, '3', '1', '1', '39', '3');
INSERT INTO `location` VALUES (775, '3', '1', '2', '40', '3');
INSERT INTO `location` VALUES (776, '3', '1', '1', '40', '3');
INSERT INTO `location` VALUES (777, '3', '1', '2', '41', '3');
INSERT INTO `location` VALUES (778, '3', '1', '1', '41', '3');
INSERT INTO `location` VALUES (779, '3', '1', '2', '42', '3');
INSERT INTO `location` VALUES (780, '3', '1', '1', '42', '3');
INSERT INTO `location` VALUES (781, '3', '1', '2', '43', '3');
INSERT INTO `location` VALUES (782, '3', '1', '1', '43', '3');
INSERT INTO `location` VALUES (783, '3', '1', '2', '44', '3');
INSERT INTO `location` VALUES (784, '3', '1', '1', '44', '3');
INSERT INTO `location` VALUES (785, '3', '1', '2', '45', '3');
INSERT INTO `location` VALUES (786, '3', '1', '1', '45', '3');
INSERT INTO `location` VALUES (787, '3', '1', '2', '46', '3');
INSERT INTO `location` VALUES (788, '3', '1', '1', '46', '3');
INSERT INTO `location` VALUES (789, '3', '1', '2', '47', '3');
INSERT INTO `location` VALUES (790, '3', '1', '1', '47', '3');
INSERT INTO `location` VALUES (791, '3', '1', '2', '48', '3');
INSERT INTO `location` VALUES (792, '3', '1', '1', '48', '3');
INSERT INTO `location` VALUES (793, '3', '1', '2', '49', '3');
INSERT INTO `location` VALUES (794, '3', '1', '1', '49', '3');
INSERT INTO `location` VALUES (795, '3', '1', '2', '50', '3');
INSERT INTO `location` VALUES (796, '3', '1', '1', '50', '3');
INSERT INTO `location` VALUES (797, '3', '1', '2', '51', '3');
INSERT INTO `location` VALUES (798, '3', '1', '1', '51', '3');
INSERT INTO `location` VALUES (799, '3', '1', '2', '52', '3');
INSERT INTO `location` VALUES (800, '3', '1', '1', '52', '3');
INSERT INTO `location` VALUES (801, '3', '1', '2', '53', '3');
INSERT INTO `location` VALUES (802, '3', '1', '1', '53', '3');
INSERT INTO `location` VALUES (803, '12', '5', '4', '2', '4');
INSERT INTO `location` VALUES (804, '12', '5', '4', '1', '4');
INSERT INTO `location` VALUES (805, '12', '5', '3', '4', '4');
INSERT INTO `location` VALUES (806, '12', '5', '3', '3', '4');
INSERT INTO `location` VALUES (807, '12', '5', '3', '2', '4');
INSERT INTO `location` VALUES (808, '12', '5', '3', '1', '4');
INSERT INTO `location` VALUES (809, '12', '5', '2', '11', '4');
INSERT INTO `location` VALUES (810, '12', '5', '2', '7', '4');
INSERT INTO `location` VALUES (811, '12', '5', '2', '12', '4');
INSERT INTO `location` VALUES (812, '12', '5', '2', '8', '4');
INSERT INTO `location` VALUES (813, '12', '5', '2', '13', '4');
INSERT INTO `location` VALUES (814, '12', '5', '2', '14', '4');
INSERT INTO `location` VALUES (815, '12', '5', '2', '9', '4');
INSERT INTO `location` VALUES (816, '12', '5', '2', '10', '4');
INSERT INTO `location` VALUES (817, '12', '5', '2', '6', '4');
INSERT INTO `location` VALUES (818, '12', '5', '2', '15', '4');
INSERT INTO `location` VALUES (819, '12', '5', '2', '5', '4');
INSERT INTO `location` VALUES (820, '12', '5', '2', '4', '4');
INSERT INTO `location` VALUES (821, '12', '5', '2', '3', '4');
INSERT INTO `location` VALUES (822, '12', '5', '2', '2', '4');
INSERT INTO `location` VALUES (823, '12', '5', '2', '1', '4');
INSERT INTO `location` VALUES (824, '12', '5', '1', '11', '4');
INSERT INTO `location` VALUES (825, '12', '5', '1', '7', '4');
INSERT INTO `location` VALUES (826, '12', '5', '1', '12', '4');
INSERT INTO `location` VALUES (827, '12', '5', '1', '8', '4');
INSERT INTO `location` VALUES (828, '12', '5', '1', '13', '4');
INSERT INTO `location` VALUES (829, '12', '5', '1', '14', '4');
INSERT INTO `location` VALUES (830, '12', '5', '1', '9', '4');
INSERT INTO `location` VALUES (831, '12', '5', '1', '10', '4');
INSERT INTO `location` VALUES (832, '12', '5', '1', '6', '4');
INSERT INTO `location` VALUES (833, '12', '5', '1', '15', '4');
INSERT INTO `location` VALUES (834, '12', '5', '1', '5', '4');
INSERT INTO `location` VALUES (835, '11', '1', '4', '8', '4');
INSERT INTO `location` VALUES (836, '11', '1', '4', '12', '4');
INSERT INTO `location` VALUES (837, '11', '1', '4', '3', '4');
INSERT INTO `location` VALUES (838, '11', '1', '4', '7', '4');
INSERT INTO `location` VALUES (839, '11', '1', '4', '11', '4');
INSERT INTO `location` VALUES (840, '11', '1', '4', '6', '4');
INSERT INTO `location` VALUES (841, '11', '1', '4', '5', '4');
INSERT INTO `location` VALUES (842, '11', '1', '4', '10', '4');
INSERT INTO `location` VALUES (843, '11', '1', '4', '9', '4');
INSERT INTO `location` VALUES (844, '11', '1', '4', '13', '4');
INSERT INTO `location` VALUES (845, '11', '1', '4', '4', '4');
INSERT INTO `location` VALUES (846, '11', '1', '4', '14', '4');
INSERT INTO `location` VALUES (847, '11', '1', '4', '15', '4');
INSERT INTO `location` VALUES (848, '11', '4', '4', '8', '4');
INSERT INTO `location` VALUES (849, '11', '4', '4', '12', '4');
INSERT INTO `location` VALUES (850, '11', '4', '4', '3', '4');
INSERT INTO `location` VALUES (851, '11', '4', '4', '7', '4');
INSERT INTO `location` VALUES (852, '11', '4', '4', '11', '4');
INSERT INTO `location` VALUES (853, '11', '4', '4', '6', '4');
INSERT INTO `location` VALUES (854, '11', '4', '4', '5', '4');
INSERT INTO `location` VALUES (855, '11', '4', '4', '10', '4');
INSERT INTO `location` VALUES (856, '11', '4', '4', '9', '4');
INSERT INTO `location` VALUES (857, '11', '4', '4', '13', '4');
INSERT INTO `location` VALUES (858, '11', '4', '4', '4', '4');
INSERT INTO `location` VALUES (859, '12', '5', '1', '4', '4');
INSERT INTO `location` VALUES (860, '12', '5', '1', '3', '4');
INSERT INTO `location` VALUES (861, '12', '5', '1', '2', '4');
INSERT INTO `location` VALUES (862, '12', '5', '1', '1', '4');
INSERT INTO `location` VALUES (863, '12', '6', '1', '12', '4');
INSERT INTO `location` VALUES (864, '12', '6', '1', '8', '4');
INSERT INTO `location` VALUES (865, '12', '6', '1', '17', '4');
INSERT INTO `location` VALUES (866, '12', '6', '1', '13', '4');
INSERT INTO `location` VALUES (867, '12', '6', '1', '9', '4');
INSERT INTO `location` VALUES (868, '12', '6', '1', '14', '4');
INSERT INTO `location` VALUES (869, '12', '6', '1', '15', '4');
INSERT INTO `location` VALUES (870, '12', '6', '1', '10', '4');
INSERT INTO `location` VALUES (871, '12', '6', '1', '11', '4');
INSERT INTO `location` VALUES (872, '11', '5', '1', '8', '4');
INSERT INTO `location` VALUES (873, '11', '5', '2', '8', '4');
INSERT INTO `location` VALUES (874, '11', '5', '1', '12', '4');
INSERT INTO `location` VALUES (875, '11', '5', '2', '12', '4');
INSERT INTO `location` VALUES (876, '11', '5', '1', '3', '4');
INSERT INTO `location` VALUES (877, '11', '5', '2', '3', '4');
INSERT INTO `location` VALUES (878, '11', '5', '1', '7', '4');
INSERT INTO `location` VALUES (879, '11', '5', '2', '7', '4');
INSERT INTO `location` VALUES (880, '11', '5', '1', '11', '4');
INSERT INTO `location` VALUES (881, '11', '5', '2', '11', '4');
INSERT INTO `location` VALUES (882, '11', '5', '1', '2', '4');
INSERT INTO `location` VALUES (883, '11', '5', '2', '2', '4');
INSERT INTO `location` VALUES (884, '11', '5', '1', '1', '4');
INSERT INTO `location` VALUES (885, '11', '5', '2', '1', '4');
INSERT INTO `location` VALUES (886, '11', '5', '1', '6', '4');
INSERT INTO `location` VALUES (887, '11', '5', '2', '6', '4');
INSERT INTO `location` VALUES (888, '11', '5', '1', '5', '4');
INSERT INTO `location` VALUES (889, '11', '5', '2', '5', '4');
INSERT INTO `location` VALUES (890, '11', '5', '1', '10', '4');
INSERT INTO `location` VALUES (891, '11', '5', '2', '10', '4');
INSERT INTO `location` VALUES (892, '11', '5', '1', '9', '4');
INSERT INTO `location` VALUES (893, '11', '5', '2', '9', '4');
INSERT INTO `location` VALUES (894, '11', '5', '1', '13', '4');
INSERT INTO `location` VALUES (895, '11', '5', '2', '13', '4');
INSERT INTO `location` VALUES (896, '11', '5', '1', '4', '4');
INSERT INTO `location` VALUES (897, '11', '5', '2', '4', '4');
INSERT INTO `location` VALUES (898, '11', '5', '2', '14', '4');
INSERT INTO `location` VALUES (899, '11', '5', '2', '15', '4');
INSERT INTO `location` VALUES (900, '11', '3', '2', '8', '4');
INSERT INTO `location` VALUES (901, '11', '3', '3', '8', '4');
INSERT INTO `location` VALUES (902, '11', '3', '4', '8', '4');
INSERT INTO `location` VALUES (903, '11', '3', '2', '3', '4');
INSERT INTO `location` VALUES (904, '11', '3', '2', '4', '4');
INSERT INTO `location` VALUES (905, '11', '3', '3', '4', '4');
INSERT INTO `location` VALUES (906, '11', '3', '4', '4', '4');
INSERT INTO `location` VALUES (907, '11', '3', '2', '13', '4');
INSERT INTO `location` VALUES (908, '11', '3', '3', '13', '4');
INSERT INTO `location` VALUES (909, '11', '3', '4', '13', '4');
INSERT INTO `location` VALUES (910, '11', '3', '2', '9', '4');
INSERT INTO `location` VALUES (911, '11', '3', '3', '9', '4');
INSERT INTO `location` VALUES (912, '11', '3', '4', '9', '4');
INSERT INTO `location` VALUES (913, '11', '3', '2', '5', '4');
INSERT INTO `location` VALUES (914, '11', '3', '3', '5', '4');
INSERT INTO `location` VALUES (915, '11', '3', '4', '5', '4');
INSERT INTO `location` VALUES (916, '11', '3', '2', '10', '4');
INSERT INTO `location` VALUES (917, '11', '3', '3', '10', '4');
INSERT INTO `location` VALUES (918, '11', '3', '4', '10', '4');
INSERT INTO `location` VALUES (919, '11', '3', '3', '11', '4');
INSERT INTO `location` VALUES (920, '11', '3', '4', '11', '4');
INSERT INTO `location` VALUES (921, '11', '3', '2', '6', '4');
INSERT INTO `location` VALUES (922, '11', '3', '3', '6', '4');
INSERT INTO `location` VALUES (923, '11', '3', '4', '6', '4');
INSERT INTO `location` VALUES (924, '11', '3', '3', '7', '4');
INSERT INTO `location` VALUES (925, '11', '3', '4', '7', '4');
INSERT INTO `location` VALUES (926, '11', '3', '3', '3', '4');
INSERT INTO `location` VALUES (927, '11', '3', '4', '3', '4');
INSERT INTO `location` VALUES (928, '11', '3', '2', '11', '4');
INSERT INTO `location` VALUES (929, '11', '3', '2', '12', '4');
INSERT INTO `location` VALUES (930, '11', '3', '3', '12', '4');
INSERT INTO `location` VALUES (931, '11', '3', '4', '12', '4');
INSERT INTO `location` VALUES (932, '11', '3', '2', '7', '4');
INSERT INTO `location` VALUES (933, '11', '3', '3', '2', '4');
INSERT INTO `location` VALUES (934, '11', '3', '4', '2', '4');
INSERT INTO `location` VALUES (935, '11', '3', '3', '1', '4');
INSERT INTO `location` VALUES (936, '11', '3', '4', '1', '4');
INSERT INTO `location` VALUES (937, '11', '3', '1', '8', '4');
INSERT INTO `location` VALUES (938, '11', '3', '1', '3', '4');
INSERT INTO `location` VALUES (939, '11', '3', '1', '4', '4');
INSERT INTO `location` VALUES (940, '11', '3', '1', '13', '4');
INSERT INTO `location` VALUES (941, '11', '3', '1', '9', '4');
INSERT INTO `location` VALUES (942, '11', '3', '1', '5', '4');
INSERT INTO `location` VALUES (943, '11', '3', '1', '10', '4');
INSERT INTO `location` VALUES (944, '11', '3', '1', '6', '4');
INSERT INTO `location` VALUES (945, '11', '3', '1', '11', '4');
INSERT INTO `location` VALUES (946, '11', '3', '1', '12', '4');
INSERT INTO `location` VALUES (947, '11', '3', '1', '7', '4');
INSERT INTO `location` VALUES (948, '11', '3', '1', '2', '4');
INSERT INTO `location` VALUES (949, '11', '6', '3', '8', '4');
INSERT INTO `location` VALUES (950, '11', '6', '3', '13', '4');
INSERT INTO `location` VALUES (951, '11', '6', '3', '9', '4');
INSERT INTO `location` VALUES (952, '11', '6', '3', '10', '4');
INSERT INTO `location` VALUES (953, '11', '6', '3', '11', '4');
INSERT INTO `location` VALUES (954, '11', '6', '3', '12', '4');
INSERT INTO `location` VALUES (955, '11', '6', '2', '14', '4');
INSERT INTO `location` VALUES (956, '11', '6', '2', '12', '4');
INSERT INTO `location` VALUES (957, '11', '6', '2', '13', '4');
INSERT INTO `location` VALUES (958, '12', '3', '1', '9', '4');
INSERT INTO `location` VALUES (959, '12', '3', '1', '13', '4');
INSERT INTO `location` VALUES (960, '12', '3', '1', '4', '4');
INSERT INTO `location` VALUES (961, '12', '3', '1', '8', '4');
INSERT INTO `location` VALUES (962, '12', '3', '1', '12', '4');
INSERT INTO `location` VALUES (963, '12', '3', '1', '7', '4');
INSERT INTO `location` VALUES (964, '12', '3', '1', '6', '4');
INSERT INTO `location` VALUES (965, '12', '3', '1', '11', '4');
INSERT INTO `location` VALUES (966, '12', '3', '1', '10', '4');
INSERT INTO `location` VALUES (967, '12', '3', '1', '14', '4');
INSERT INTO `location` VALUES (968, '12', '3', '1', '5', '4');
INSERT INTO `location` VALUES (969, '12', '3', '1', '15', '4');
INSERT INTO `location` VALUES (970, '12', '3', '1', '16', '4');
INSERT INTO `location` VALUES (971, '12', '3', '2', '9', '4');
INSERT INTO `location` VALUES (972, '12', '3', '2', '13', '4');
INSERT INTO `location` VALUES (973, '12', '3', '2', '8', '4');
INSERT INTO `location` VALUES (974, '12', '3', '2', '12', '4');
INSERT INTO `location` VALUES (975, '12', '3', '2', '11', '4');
INSERT INTO `location` VALUES (976, '12', '3', '2', '10', '4');
INSERT INTO `location` VALUES (977, '12', '3', '2', '14', '4');
INSERT INTO `location` VALUES (978, '12', '3', '2', '15', '4');
INSERT INTO `location` VALUES (979, '12', '3', '2', '16', '4');
INSERT INTO `location` VALUES (980, '12', '3', '3', '13', '4');
INSERT INTO `location` VALUES (981, '12', '3', '3', '12', '4');
INSERT INTO `location` VALUES (982, '12', '3', '3', '11', '4');
INSERT INTO `location` VALUES (983, '12', '3', '3', '14', '4');
INSERT INTO `location` VALUES (984, '12', '3', '3', '15', '4');
INSERT INTO `location` VALUES (985, '12', '3', '3', '16', '4');
INSERT INTO `location` VALUES (986, '12', '3', '4', '14', '4');
INSERT INTO `location` VALUES (987, '12', '3', '4', '15', '4');
INSERT INTO `location` VALUES (988, '12', '3', '4', '16', '4');
INSERT INTO `location` VALUES (989, '12', '3', '1', '17', '4');
INSERT INTO `location` VALUES (990, '12', '3', '2', '17', '4');
INSERT INTO `location` VALUES (991, '12', '3', '3', '17', '4');
INSERT INTO `location` VALUES (992, '12', '3', '4', '17', '4');
INSERT INTO `location` VALUES (993, '12', '4', '4', '6', '4');
INSERT INTO `location` VALUES (994, '12', '4', '4', '10', '4');
INSERT INTO `location` VALUES (995, '12', '4', '4', '1', '4');
INSERT INTO `location` VALUES (996, '12', '4', '4', '5', '4');
INSERT INTO `location` VALUES (997, '12', '4', '4', '9', '4');
INSERT INTO `location` VALUES (998, '12', '4', '4', '4', '4');
INSERT INTO `location` VALUES (999, '12', '4', '4', '3', '4');
INSERT INTO `location` VALUES (1000, '12', '4', '4', '8', '4');
INSERT INTO `location` VALUES (1001, '12', '4', '4', '7', '4');
INSERT INTO `location` VALUES (1002, '12', '4', '4', '11', '4');
INSERT INTO `location` VALUES (1003, '12', '4', '4', '2', '4');
INSERT INTO `location` VALUES (1004, '12', '4', '4', '12', '4');
INSERT INTO `location` VALUES (1005, '12', '4', '4', '13', '4');
INSERT INTO `location` VALUES (1006, '12', '4', '4', '14', '4');
INSERT INTO `location` VALUES (1007, '12', '4', '4', '15', '4');
INSERT INTO `location` VALUES (1008, '12', '4', '4', '16', '4');
INSERT INTO `location` VALUES (1009, '12', '4', '3', '6', '4');
INSERT INTO `location` VALUES (1010, '12', '4', '3', '10', '4');
INSERT INTO `location` VALUES (1011, '12', '4', '3', '1', '4');
INSERT INTO `location` VALUES (1012, '12', '4', '3', '5', '4');
INSERT INTO `location` VALUES (1013, '12', '4', '3', '9', '4');
INSERT INTO `location` VALUES (1014, '12', '4', '3', '4', '4');
INSERT INTO `location` VALUES (1015, '12', '4', '3', '3', '4');
INSERT INTO `location` VALUES (1016, '12', '4', '3', '8', '4');
INSERT INTO `location` VALUES (1017, '12', '4', '3', '7', '4');
INSERT INTO `location` VALUES (1018, '12', '4', '3', '11', '4');
INSERT INTO `location` VALUES (1019, '12', '4', '3', '2', '4');
INSERT INTO `location` VALUES (1020, '12', '4', '3', '12', '4');
INSERT INTO `location` VALUES (1021, '12', '4', '3', '13', '4');
INSERT INTO `location` VALUES (1022, '12', '4', '3', '14', '4');
INSERT INTO `location` VALUES (1023, '12', '4', '3', '15', '4');
INSERT INTO `location` VALUES (1024, '12', '4', '2', '6', '4');
INSERT INTO `location` VALUES (1025, '12', '4', '2', '10', '4');
INSERT INTO `location` VALUES (1026, '12', '4', '2', '1', '4');
INSERT INTO `location` VALUES (1027, '12', '4', '2', '5', '4');
INSERT INTO `location` VALUES (1028, '12', '4', '2', '9', '4');
INSERT INTO `location` VALUES (1029, '12', '4', '2', '4', '4');
INSERT INTO `location` VALUES (1030, '12', '4', '2', '3', '4');
INSERT INTO `location` VALUES (1031, '12', '4', '2', '8', '4');
INSERT INTO `location` VALUES (1032, '12', '4', '2', '7', '4');
INSERT INTO `location` VALUES (1033, '12', '4', '2', '11', '4');
INSERT INTO `location` VALUES (1034, '12', '4', '2', '2', '4');
INSERT INTO `location` VALUES (1035, '12', '4', '2', '12', '4');
INSERT INTO `location` VALUES (1036, '12', '4', '2', '13', '4');
INSERT INTO `location` VALUES (1037, '12', '4', '2', '14', '4');
INSERT INTO `location` VALUES (1038, '12', '4', '2', '15', '4');
INSERT INTO `location` VALUES (1039, '12', '4', '1', '6', '4');
INSERT INTO `location` VALUES (1040, '12', '4', '1', '10', '4');
INSERT INTO `location` VALUES (1041, '12', '4', '1', '1', '4');
INSERT INTO `location` VALUES (1042, '12', '4', '1', '5', '4');
INSERT INTO `location` VALUES (1043, '12', '4', '1', '9', '4');
INSERT INTO `location` VALUES (1044, '12', '4', '1', '4', '4');
INSERT INTO `location` VALUES (1045, '12', '4', '1', '3', '4');
INSERT INTO `location` VALUES (1046, '12', '4', '1', '8', '4');
INSERT INTO `location` VALUES (1047, '12', '4', '1', '7', '4');
INSERT INTO `location` VALUES (1048, '12', '4', '1', '11', '4');
INSERT INTO `location` VALUES (1049, '12', '4', '1', '2', '4');
INSERT INTO `location` VALUES (1050, '12', '4', '1', '12', '4');
INSERT INTO `location` VALUES (1051, '12', '4', '1', '13', '4');
INSERT INTO `location` VALUES (1052, '12', '4', '1', '14', '4');
INSERT INTO `location` VALUES (1053, '12', '4', '1', '15', '4');
INSERT INTO `location` VALUES (1054, '12', '4', '1', '16', '4');
INSERT INTO `location` VALUES (1055, '12', '7', '1', '6', '4');
INSERT INTO `location` VALUES (1056, '12', '7', '1', '10', '4');
INSERT INTO `location` VALUES (1057, '12', '7', '1', '1', '4');
INSERT INTO `location` VALUES (1058, '12', '7', '1', '5', '4');
INSERT INTO `location` VALUES (1059, '12', '7', '1', '9', '4');
INSERT INTO `location` VALUES (1060, '12', '7', '1', '4', '4');
INSERT INTO `location` VALUES (1061, '12', '7', '1', '3', '4');
INSERT INTO `location` VALUES (1062, '12', '7', '1', '8', '4');
INSERT INTO `location` VALUES (1063, '12', '7', '1', '7', '4');
INSERT INTO `location` VALUES (1064, '12', '7', '1', '11', '4');
INSERT INTO `location` VALUES (1065, '12', '7', '1', '2', '4');
INSERT INTO `location` VALUES (1066, '12', '7', '1', '12', '4');
INSERT INTO `location` VALUES (1067, '12', '7', '1', '13', '4');
INSERT INTO `location` VALUES (1068, '12', '7', '1', '14', '4');
INSERT INTO `location` VALUES (1069, '12', '7', '1', '15', '4');
INSERT INTO `location` VALUES (1070, '12', '7', '1', '16', '4');
INSERT INTO `location` VALUES (1071, '12', '7', '2', '6', '4');
INSERT INTO `location` VALUES (1072, '12', '7', '2', '10', '4');
INSERT INTO `location` VALUES (1073, '12', '7', '2', '1', '4');
INSERT INTO `location` VALUES (1074, '12', '7', '2', '5', '4');
INSERT INTO `location` VALUES (1075, '12', '7', '2', '9', '4');
INSERT INTO `location` VALUES (1076, '12', '7', '2', '4', '4');
INSERT INTO `location` VALUES (1077, '12', '7', '2', '3', '4');
INSERT INTO `location` VALUES (1078, '12', '7', '2', '8', '4');
INSERT INTO `location` VALUES (1079, '12', '7', '2', '7', '4');
INSERT INTO `location` VALUES (1080, '12', '7', '2', '11', '4');
INSERT INTO `location` VALUES (1081, '12', '7', '2', '2', '4');
INSERT INTO `location` VALUES (1082, '12', '7', '2', '12', '4');
INSERT INTO `location` VALUES (1083, '12', '7', '2', '13', '4');
INSERT INTO `location` VALUES (1084, '12', '7', '2', '14', '4');
INSERT INTO `location` VALUES (1085, '12', '7', '2', '15', '4');
INSERT INTO `location` VALUES (1086, '12', '7', '2', '16', '4');
INSERT INTO `location` VALUES (1087, '12', '7', '1', '17', '4');
INSERT INTO `location` VALUES (1088, '12', '7', '2', '17', '4');
INSERT INTO `location` VALUES (1089, '12', '6', '1', '7', '4');
INSERT INTO `location` VALUES (1090, '12', '6', '1', '16', '4');
INSERT INTO `location` VALUES (1091, '12', '6', '1', '6', '4');
INSERT INTO `location` VALUES (1092, '12', '6', '1', '5', '4');
INSERT INTO `location` VALUES (1093, '12', '6', '1', '4', '4');
INSERT INTO `location` VALUES (1094, '12', '6', '1', '3', '4');
INSERT INTO `location` VALUES (1095, '12', '6', '1', '2', '4');
INSERT INTO `location` VALUES (1096, '12', '6', '2', '12', '4');
INSERT INTO `location` VALUES (1097, '12', '6', '2', '8', '4');
INSERT INTO `location` VALUES (1098, '12', '6', '2', '17', '4');
INSERT INTO `location` VALUES (1099, '12', '6', '2', '13', '4');
INSERT INTO `location` VALUES (1100, '12', '6', '2', '9', '4');
INSERT INTO `location` VALUES (1101, '12', '6', '2', '14', '4');
INSERT INTO `location` VALUES (1102, '12', '6', '2', '15', '4');
INSERT INTO `location` VALUES (1103, '12', '6', '2', '10', '4');
INSERT INTO `location` VALUES (1104, '12', '6', '2', '11', '4');
INSERT INTO `location` VALUES (1105, '12', '6', '2', '7', '4');
INSERT INTO `location` VALUES (1106, '12', '6', '2', '16', '4');
INSERT INTO `location` VALUES (1107, '12', '6', '2', '6', '4');
INSERT INTO `location` VALUES (1108, '12', '6', '2', '5', '4');
INSERT INTO `location` VALUES (1109, '12', '6', '2', '4', '4');
INSERT INTO `location` VALUES (1110, '12', '6', '2', '3', '4');
INSERT INTO `location` VALUES (1111, '12', '6', '2', '2', '4');
INSERT INTO `location` VALUES (1112, '12', '6', '1', '1', '4');
INSERT INTO `location` VALUES (1113, '12', '6', '2', '1', '4');
INSERT INTO `location` VALUES (1114, '12', '2', '3', '12', '4');
INSERT INTO `location` VALUES (1115, '12', '2', '3', '8', '4');
INSERT INTO `location` VALUES (1116, '12', '2', '3', '17', '4');
INSERT INTO `location` VALUES (1117, '12', '2', '3', '13', '4');
INSERT INTO `location` VALUES (1118, '12', '2', '3', '9', '4');
INSERT INTO `location` VALUES (1119, '12', '2', '3', '14', '4');
INSERT INTO `location` VALUES (1120, '12', '2', '3', '15', '4');
INSERT INTO `location` VALUES (1121, '12', '2', '3', '10', '4');
INSERT INTO `location` VALUES (1122, '12', '2', '3', '11', '4');
INSERT INTO `location` VALUES (1123, '12', '2', '3', '7', '4');
INSERT INTO `location` VALUES (1124, '12', '2', '3', '16', '4');
INSERT INTO `location` VALUES (1125, '12', '2', '3', '6', '4');
INSERT INTO `location` VALUES (1126, '12', '2', '3', '5', '4');
INSERT INTO `location` VALUES (1127, '12', '2', '3', '4', '4');
INSERT INTO `location` VALUES (1128, '12', '2', '3', '3', '4');
INSERT INTO `location` VALUES (1129, '12', '2', '3', '2', '4');
INSERT INTO `location` VALUES (1130, '12', '2', '4', '12', '4');
INSERT INTO `location` VALUES (1131, '12', '2', '4', '8', '4');
INSERT INTO `location` VALUES (1132, '12', '2', '4', '17', '4');
INSERT INTO `location` VALUES (1133, '12', '2', '4', '13', '4');
INSERT INTO `location` VALUES (1134, '12', '2', '4', '9', '4');
INSERT INTO `location` VALUES (1135, '12', '2', '4', '14', '4');
INSERT INTO `location` VALUES (1136, '12', '2', '4', '15', '4');
INSERT INTO `location` VALUES (1137, '12', '2', '4', '10', '4');
INSERT INTO `location` VALUES (1138, '12', '2', '4', '11', '4');
INSERT INTO `location` VALUES (1139, '12', '2', '4', '7', '4');
INSERT INTO `location` VALUES (1140, '12', '2', '4', '16', '4');
INSERT INTO `location` VALUES (1141, '12', '2', '4', '6', '4');
INSERT INTO `location` VALUES (1142, '12', '2', '4', '5', '4');
INSERT INTO `location` VALUES (1143, '12', '2', '4', '4', '4');
INSERT INTO `location` VALUES (1144, '12', '2', '4', '3', '4');
INSERT INTO `location` VALUES (1145, '12', '2', '4', '2', '4');
INSERT INTO `location` VALUES (1146, '12', '2', '3', '1', '4');
INSERT INTO `location` VALUES (1147, '12', '2', '4', '1', '4');
INSERT INTO `location` VALUES (1148, '12', '2', '1', '12', '4');
INSERT INTO `location` VALUES (1149, '12', '2', '1', '8', '4');
INSERT INTO `location` VALUES (1150, '12', '2', '1', '17', '4');
INSERT INTO `location` VALUES (1151, '12', '2', '1', '13', '4');
INSERT INTO `location` VALUES (1152, '12', '2', '1', '9', '4');
INSERT INTO `location` VALUES (1153, '12', '2', '1', '14', '4');
INSERT INTO `location` VALUES (1154, '12', '2', '1', '15', '4');
INSERT INTO `location` VALUES (1155, '12', '2', '1', '10', '4');
INSERT INTO `location` VALUES (1156, '12', '2', '1', '11', '4');
INSERT INTO `location` VALUES (1157, '12', '2', '1', '7', '4');
INSERT INTO `location` VALUES (1158, '12', '2', '1', '16', '4');
INSERT INTO `location` VALUES (1159, '12', '2', '1', '6', '4');
INSERT INTO `location` VALUES (1160, '12', '2', '1', '5', '4');
INSERT INTO `location` VALUES (1161, '12', '2', '1', '4', '4');
INSERT INTO `location` VALUES (1162, '12', '2', '1', '3', '4');
INSERT INTO `location` VALUES (1163, '12', '2', '1', '2', '4');
INSERT INTO `location` VALUES (1164, '12', '2', '2', '12', '4');
INSERT INTO `location` VALUES (1165, '12', '2', '2', '8', '4');
INSERT INTO `location` VALUES (1166, '12', '2', '2', '17', '4');
INSERT INTO `location` VALUES (1167, '12', '2', '2', '13', '4');
INSERT INTO `location` VALUES (1168, '12', '2', '2', '9', '4');
INSERT INTO `location` VALUES (1169, '12', '2', '2', '14', '4');
INSERT INTO `location` VALUES (1170, '12', '2', '2', '15', '4');
INSERT INTO `location` VALUES (1171, '12', '2', '2', '10', '4');
INSERT INTO `location` VALUES (1172, '12', '2', '2', '11', '4');
INSERT INTO `location` VALUES (1173, '12', '2', '2', '7', '4');
INSERT INTO `location` VALUES (1174, '12', '2', '2', '16', '4');
INSERT INTO `location` VALUES (1175, '12', '2', '2', '6', '4');
INSERT INTO `location` VALUES (1176, '12', '2', '2', '5', '4');
INSERT INTO `location` VALUES (1177, '12', '2', '2', '4', '4');
INSERT INTO `location` VALUES (1178, '12', '2', '2', '3', '4');
INSERT INTO `location` VALUES (1179, '12', '2', '2', '2', '4');
INSERT INTO `location` VALUES (1180, '12', '2', '1', '1', '4');
INSERT INTO `location` VALUES (1181, '12', '2', '2', '1', '4');
INSERT INTO `location` VALUES (1182, '12', '1', '1', '12', '4');
INSERT INTO `location` VALUES (1183, '12', '1', '1', '8', '4');
INSERT INTO `location` VALUES (1184, '12', '1', '1', '13', '4');
INSERT INTO `location` VALUES (1185, '12', '1', '1', '9', '4');
INSERT INTO `location` VALUES (1186, '12', '1', '1', '14', '4');
INSERT INTO `location` VALUES (1187, '12', '1', '1', '15', '4');
INSERT INTO `location` VALUES (1188, '12', '1', '1', '10', '4');
INSERT INTO `location` VALUES (1189, '12', '1', '1', '11', '4');
INSERT INTO `location` VALUES (1190, '12', '1', '1', '7', '4');
INSERT INTO `location` VALUES (1191, '12', '1', '1', '6', '4');
INSERT INTO `location` VALUES (1192, '12', '1', '1', '5', '4');
INSERT INTO `location` VALUES (1193, '12', '1', '1', '4', '4');
INSERT INTO `location` VALUES (1194, '12', '1', '1', '3', '4');
INSERT INTO `location` VALUES (1195, '12', '1', '1', '2', '4');
INSERT INTO `location` VALUES (1196, '12', '1', '1', '1', '4');
INSERT INTO `location` VALUES (1197, '12', '1', '2', '12', '4');
INSERT INTO `location` VALUES (1198, '12', '1', '2', '8', '4');
INSERT INTO `location` VALUES (1199, '12', '1', '2', '9', '4');
INSERT INTO `location` VALUES (1200, '12', '1', '2', '10', '4');
INSERT INTO `location` VALUES (1201, '12', '1', '2', '11', '4');
INSERT INTO `location` VALUES (1202, '12', '1', '2', '7', '4');
INSERT INTO `location` VALUES (1203, '12', '1', '2', '6', '4');
INSERT INTO `location` VALUES (1204, '12', '1', '2', '5', '4');
INSERT INTO `location` VALUES (1205, '12', '1', '2', '4', '4');
INSERT INTO `location` VALUES (1206, '12', '1', '2', '3', '4');
INSERT INTO `location` VALUES (1207, '12', '1', '2', '2', '4');
INSERT INTO `location` VALUES (1208, '12', '1', '2', '1', '4');
INSERT INTO `location` VALUES (1209, '12', '1', '3', '8', '4');
INSERT INTO `location` VALUES (1210, '12', '1', '3', '9', '4');
INSERT INTO `location` VALUES (1211, '12', '1', '3', '7', '4');
INSERT INTO `location` VALUES (1212, '12', '1', '3', '6', '4');
INSERT INTO `location` VALUES (1213, '12', '1', '3', '5', '4');
INSERT INTO `location` VALUES (1214, '12', '1', '3', '4', '4');
INSERT INTO `location` VALUES (1215, '12', '1', '3', '3', '4');
INSERT INTO `location` VALUES (1216, '12', '1', '3', '2', '4');
INSERT INTO `location` VALUES (1217, '12', '1', '3', '1', '4');
INSERT INTO `location` VALUES (1218, '12', '1', '4', '5', '4');
INSERT INTO `location` VALUES (1219, '12', '1', '4', '4', '4');
INSERT INTO `location` VALUES (1220, '12', '1', '4', '3', '4');
INSERT INTO `location` VALUES (1221, '12', '1', '4', '2', '4');
INSERT INTO `location` VALUES (1222, '12', '1', '4', '1', '4');
INSERT INTO `location` VALUES (1223, '12', '1', '5', '2', '4');
INSERT INTO `location` VALUES (1224, '12', '1', '5', '1', '4');
INSERT INTO `location` VALUES (1225, '10', '5', '4', '8', '4');
INSERT INTO `location` VALUES (1226, '10', '5', '3', '8', '4');
INSERT INTO `location` VALUES (1227, '10', '5', '2', '8', '4');
INSERT INTO `location` VALUES (1228, '10', '5', '4', '13', '4');
INSERT INTO `location` VALUES (1229, '10', '5', '4', '12', '4');
INSERT INTO `location` VALUES (1230, '10', '5', '3', '12', '4');
INSERT INTO `location` VALUES (1231, '10', '5', '2', '12', '4');
INSERT INTO `location` VALUES (1232, '10', '5', '4', '3', '4');
INSERT INTO `location` VALUES (1233, '10', '5', '3', '3', '4');
INSERT INTO `location` VALUES (1234, '10', '5', '2', '3', '4');
INSERT INTO `location` VALUES (1235, '10', '5', '4', '7', '4');
INSERT INTO `location` VALUES (1236, '10', '5', '3', '7', '4');
INSERT INTO `location` VALUES (1237, '10', '5', '2', '7', '4');
INSERT INTO `location` VALUES (1238, '10', '5', '4', '11', '4');
INSERT INTO `location` VALUES (1239, '10', '5', '3', '11', '4');
INSERT INTO `location` VALUES (1240, '10', '5', '2', '11', '4');
INSERT INTO `location` VALUES (1241, '10', '5', '4', '2', '4');
INSERT INTO `location` VALUES (1242, '10', '5', '3', '2', '4');
INSERT INTO `location` VALUES (1243, '10', '5', '2', '2', '4');
INSERT INTO `location` VALUES (1244, '10', '5', '3', '1', '4');
INSERT INTO `location` VALUES (1245, '10', '5', '2', '1', '4');
INSERT INTO `location` VALUES (1246, '10', '5', '4', '6', '4');
INSERT INTO `location` VALUES (1247, '10', '5', '3', '6', '4');
INSERT INTO `location` VALUES (1248, '10', '5', '2', '6', '4');
INSERT INTO `location` VALUES (1249, '10', '5', '3', '5', '4');
INSERT INTO `location` VALUES (1250, '10', '5', '2', '5', '4');
INSERT INTO `location` VALUES (1251, '10', '5', '4', '10', '4');
INSERT INTO `location` VALUES (1252, '10', '5', '3', '10', '4');
INSERT INTO `location` VALUES (1253, '10', '5', '2', '10', '4');
INSERT INTO `location` VALUES (1254, '10', '5', '3', '9', '4');
INSERT INTO `location` VALUES (1255, '10', '5', '2', '9', '4');
INSERT INTO `location` VALUES (1256, '10', '5', '3', '13', '4');
INSERT INTO `location` VALUES (1257, '10', '5', '4', '1', '4');
INSERT INTO `location` VALUES (1258, '10', '5', '2', '13', '4');
INSERT INTO `location` VALUES (1259, '10', '5', '4', '5', '4');
INSERT INTO `location` VALUES (1260, '10', '5', '4', '4', '4');
INSERT INTO `location` VALUES (1261, '10', '5', '3', '4', '4');
INSERT INTO `location` VALUES (1262, '10', '5', '2', '4', '4');
INSERT INTO `location` VALUES (1263, '10', '5', '4', '9', '4');
INSERT INTO `location` VALUES (1264, '10', '5', '4', '15', '4');
INSERT INTO `location` VALUES (1265, '10', '5', '4', '14', '4');
INSERT INTO `location` VALUES (1266, '10', '5', '3', '14', '4');
INSERT INTO `location` VALUES (1267, '10', '5', '2', '14', '4');
INSERT INTO `location` VALUES (1268, '10', '5', '3', '15', '4');
INSERT INTO `location` VALUES (1269, '10', '5', '2', '15', '4');
INSERT INTO `location` VALUES (1270, '10', '6', '1', '12', '4');
INSERT INTO `location` VALUES (1271, '10', '6', '1', '6', '4');
INSERT INTO `location` VALUES (1272, '10', '6', '1', '13', '4');
INSERT INTO `location` VALUES (1273, '10', '6', '1', '7', '4');
INSERT INTO `location` VALUES (1274, '10', '6', '1', '8', '4');
INSERT INTO `location` VALUES (1275, '10', '6', '1', '2', '4');
INSERT INTO `location` VALUES (1276, '10', '6', '1', '9', '4');
INSERT INTO `location` VALUES (1277, '10', '6', '1', '3', '4');
INSERT INTO `location` VALUES (1278, '7', '1', '1', '1', '4');
INSERT INTO `location` VALUES (1279, '7', '1', '1', '1', '4');
INSERT INTO `location` VALUES (1280, '7', '1', '1', '1', '4');
INSERT INTO `location` VALUES (1281, '7', '1', '1', '1', '4');
INSERT INTO `location` VALUES (1282, '8', '3', '1', '1', '4');
INSERT INTO `location` VALUES (1283, '8', '3', '1', '1', '4');
INSERT INTO `location` VALUES (1284, '8', '3', '1', '1', '4');
INSERT INTO `location` VALUES (1285, '8', '2', '1', '1', '4');
INSERT INTO `location` VALUES (1286, '8', '2', '1', '1', '4');
INSERT INTO `location` VALUES (1287, '8', '2', '1', '1', '4');
INSERT INTO `location` VALUES (1288, '8', '2', '1', '1', '4');
INSERT INTO `location` VALUES (1289, '9', '3', '2', '5', '4');
INSERT INTO `location` VALUES (1290, '9', '3', '1', '5', '4');
INSERT INTO `location` VALUES (1291, '9', '3', '4', '1', '4');
INSERT INTO `location` VALUES (1292, '9', '3', '3', '1', '4');
INSERT INTO `location` VALUES (1293, '9', '3', '2', '1', '4');
INSERT INTO `location` VALUES (1294, '9', '3', '1', '1', '4');
INSERT INTO `location` VALUES (1295, '9', '3', '4', '14', '4');
INSERT INTO `location` VALUES (1296, '9', '3', '1', '14', '4');
INSERT INTO `location` VALUES (1297, '9', '3', '4', '10', '4');
INSERT INTO `location` VALUES (1298, '9', '3', '3', '10', '4');
INSERT INTO `location` VALUES (1299, '9', '3', '2', '10', '4');
INSERT INTO `location` VALUES (1300, '9', '3', '1', '10', '4');
INSERT INTO `location` VALUES (1301, '9', '3', '4', '6', '4');
INSERT INTO `location` VALUES (1302, '9', '3', '1', '11', '4');
INSERT INTO `location` VALUES (1303, '9', '3', '3', '6', '4');
INSERT INTO `location` VALUES (1304, '9', '3', '2', '6', '4');
INSERT INTO `location` VALUES (1305, '9', '3', '1', '6', '4');
INSERT INTO `location` VALUES (1306, '9', '3', '4', '2', '4');
INSERT INTO `location` VALUES (1307, '9', '3', '1', '7', '4');
INSERT INTO `location` VALUES (1308, '9', '3', '3', '2', '4');
INSERT INTO `location` VALUES (1309, '9', '3', '2', '2', '4');
INSERT INTO `location` VALUES (1310, '9', '3', '1', '2', '4');
INSERT INTO `location` VALUES (1311, '9', '3', '1', '3', '4');
INSERT INTO `location` VALUES (1312, '9', '3', '4', '11', '4');
INSERT INTO `location` VALUES (1313, '9', '3', '3', '11', '4');
INSERT INTO `location` VALUES (1314, '9', '3', '2', '11', '4');
INSERT INTO `location` VALUES (1315, '9', '3', '3', '12', '4');
INSERT INTO `location` VALUES (1316, '9', '3', '2', '12', '4');
INSERT INTO `location` VALUES (1317, '9', '3', '4', '7', '4');
INSERT INTO `location` VALUES (1318, '9', '3', '1', '12', '4');
INSERT INTO `location` VALUES (1319, '9', '3', '3', '7', '4');
INSERT INTO `location` VALUES (1320, '9', '3', '2', '7', '4');
INSERT INTO `location` VALUES (1321, '9', '3', '3', '8', '4');
INSERT INTO `location` VALUES (1322, '9', '3', '2', '8', '4');
INSERT INTO `location` VALUES (1323, '9', '3', '4', '3', '4');
INSERT INTO `location` VALUES (1324, '9', '3', '1', '8', '4');
INSERT INTO `location` VALUES (1325, '9', '3', '3', '3', '4');
INSERT INTO `location` VALUES (1326, '9', '3', '2', '3', '4');
INSERT INTO `location` VALUES (1327, '9', '3', '3', '4', '4');
INSERT INTO `location` VALUES (1328, '9', '3', '2', '4', '4');
INSERT INTO `location` VALUES (1329, '9', '3', '1', '4', '4');
INSERT INTO `location` VALUES (1330, '9', '3', '4', '12', '4');
INSERT INTO `location` VALUES (1331, '9', '3', '4', '13', '4');
INSERT INTO `location` VALUES (1332, '9', '3', '3', '13', '4');
INSERT INTO `location` VALUES (1333, '9', '3', '2', '13', '4');
INSERT INTO `location` VALUES (1334, '9', '3', '4', '8', '4');
INSERT INTO `location` VALUES (1335, '9', '3', '1', '13', '4');
INSERT INTO `location` VALUES (1336, '9', '3', '4', '9', '4');
INSERT INTO `location` VALUES (1337, '9', '3', '3', '9', '4');
INSERT INTO `location` VALUES (1338, '9', '3', '2', '9', '4');
INSERT INTO `location` VALUES (1339, '9', '3', '4', '4', '4');
INSERT INTO `location` VALUES (1340, '9', '3', '1', '9', '4');
INSERT INTO `location` VALUES (1341, '9', '3', '4', '5', '4');
INSERT INTO `location` VALUES (1342, '9', '3', '3', '5', '4');
INSERT INTO `location` VALUES (1343, '9', '4', '2', '11', '4');
INSERT INTO `location` VALUES (1344, '9', '4', '1', '11', '4');
INSERT INTO `location` VALUES (1345, '9', '4', '4', '2', '4');
INSERT INTO `location` VALUES (1346, '9', '4', '3', '2', '4');
INSERT INTO `location` VALUES (1347, '9', '4', '2', '2', '4');
INSERT INTO `location` VALUES (1348, '9', '4', '1', '2', '4');
INSERT INTO `location` VALUES (1349, '9', '4', '4', '6', '4');
INSERT INTO `location` VALUES (1350, '9', '4', '1', '1', '4');
INSERT INTO `location` VALUES (1351, '9', '4', '3', '6', '4');
INSERT INTO `location` VALUES (1352, '9', '4', '2', '6', '4');
INSERT INTO `location` VALUES (1353, '9', '4', '1', '6', '4');
INSERT INTO `location` VALUES (1354, '9', '4', '4', '10', '4');
INSERT INTO `location` VALUES (1355, '9', '4', '1', '5', '4');
INSERT INTO `location` VALUES (1356, '9', '4', '3', '10', '4');
INSERT INTO `location` VALUES (1357, '9', '4', '2', '10', '4');
INSERT INTO `location` VALUES (1358, '9', '4', '1', '10', '4');
INSERT INTO `location` VALUES (1359, '9', '4', '4', '14', '4');
INSERT INTO `location` VALUES (1360, '9', '4', '1', '9', '4');
INSERT INTO `location` VALUES (1361, '9', '4', '1', '14', '4');
INSERT INTO `location` VALUES (1362, '9', '4', '4', '1', '4');
INSERT INTO `location` VALUES (1363, '9', '4', '3', '1', '4');
INSERT INTO `location` VALUES (1364, '9', '4', '1', '13', '4');
INSERT INTO `location` VALUES (1365, '9', '4', '2', '1', '4');
INSERT INTO `location` VALUES (1366, '9', '4', '4', '5', '4');
INSERT INTO `location` VALUES (1367, '9', '4', '3', '5', '4');
INSERT INTO `location` VALUES (1368, '9', '4', '2', '5', '4');
INSERT INTO `location` VALUES (1369, '9', '4', '3', '4', '4');
INSERT INTO `location` VALUES (1370, '9', '4', '2', '4', '4');
INSERT INTO `location` VALUES (1371, '9', '4', '4', '9', '4');
INSERT INTO `location` VALUES (1372, '9', '4', '1', '4', '4');
INSERT INTO `location` VALUES (1373, '9', '4', '3', '9', '4');
INSERT INTO `location` VALUES (1374, '9', '4', '2', '9', '4');
INSERT INTO `location` VALUES (1375, '9', '4', '3', '8', '4');
INSERT INTO `location` VALUES (1376, '9', '4', '2', '8', '4');
INSERT INTO `location` VALUES (1377, '9', '4', '4', '13', '4');
INSERT INTO `location` VALUES (1378, '9', '4', '1', '8', '4');
INSERT INTO `location` VALUES (1379, '9', '4', '3', '13', '4');
INSERT INTO `location` VALUES (1380, '9', '4', '2', '13', '4');
INSERT INTO `location` VALUES (1381, '9', '4', '3', '12', '4');
INSERT INTO `location` VALUES (1382, '9', '4', '2', '12', '4');
INSERT INTO `location` VALUES (1383, '9', '4', '1', '12', '4');
INSERT INTO `location` VALUES (1384, '9', '4', '4', '4', '4');
INSERT INTO `location` VALUES (1385, '9', '4', '4', '3', '4');
INSERT INTO `location` VALUES (1386, '9', '4', '3', '3', '4');
INSERT INTO `location` VALUES (1387, '9', '4', '2', '3', '4');
INSERT INTO `location` VALUES (1388, '9', '4', '4', '8', '4');
INSERT INTO `location` VALUES (1389, '9', '4', '1', '3', '4');
INSERT INTO `location` VALUES (1390, '9', '4', '4', '7', '4');
INSERT INTO `location` VALUES (1391, '9', '4', '3', '7', '4');
INSERT INTO `location` VALUES (1392, '9', '4', '2', '7', '4');
INSERT INTO `location` VALUES (1393, '9', '4', '4', '12', '4');
INSERT INTO `location` VALUES (1394, '9', '4', '1', '7', '4');
INSERT INTO `location` VALUES (1395, '9', '4', '4', '11', '4');
INSERT INTO `location` VALUES (1396, '9', '4', '3', '11', '4');
INSERT INTO `location` VALUES (1397, '9', '2', '2', '11', '4');
INSERT INTO `location` VALUES (1398, '9', '2', '1', '11', '4');
INSERT INTO `location` VALUES (1399, '9', '2', '4', '15', '4');
INSERT INTO `location` VALUES (1400, '9', '2', '3', '15', '4');
INSERT INTO `location` VALUES (1401, '9', '2', '2', '15', '4');
INSERT INTO `location` VALUES (1402, '9', '2', '1', '15', '4');
INSERT INTO `location` VALUES (1403, '9', '2', '4', '2', '4');
INSERT INTO `location` VALUES (1404, '9', '2', '3', '2', '4');
INSERT INTO `location` VALUES (1405, '9', '2', '2', '2', '4');
INSERT INTO `location` VALUES (1406, '9', '2', '1', '2', '4');
INSERT INTO `location` VALUES (1407, '9', '2', '4', '6', '4');
INSERT INTO `location` VALUES (1408, '9', '2', '1', '1', '4');
INSERT INTO `location` VALUES (1409, '9', '2', '3', '6', '4');
INSERT INTO `location` VALUES (1410, '9', '2', '2', '6', '4');
INSERT INTO `location` VALUES (1411, '9', '2', '1', '6', '4');
INSERT INTO `location` VALUES (1412, '9', '2', '4', '10', '4');
INSERT INTO `location` VALUES (1413, '9', '2', '1', '5', '4');
INSERT INTO `location` VALUES (1414, '9', '2', '3', '10', '4');
INSERT INTO `location` VALUES (1415, '9', '2', '2', '10', '4');
INSERT INTO `location` VALUES (1416, '9', '2', '1', '10', '4');
INSERT INTO `location` VALUES (1417, '9', '2', '4', '14', '4');
INSERT INTO `location` VALUES (1418, '9', '2', '1', '9', '4');
INSERT INTO `location` VALUES (1419, '9', '2', '3', '14', '4');
INSERT INTO `location` VALUES (1420, '9', '2', '2', '14', '4');
INSERT INTO `location` VALUES (1421, '9', '2', '1', '14', '4');
INSERT INTO `location` VALUES (1422, '9', '2', '4', '1', '4');
INSERT INTO `location` VALUES (1423, '9', '2', '3', '1', '4');
INSERT INTO `location` VALUES (1424, '9', '2', '1', '13', '4');
INSERT INTO `location` VALUES (1425, '9', '2', '2', '1', '4');
INSERT INTO `location` VALUES (1426, '9', '2', '4', '5', '4');
INSERT INTO `location` VALUES (1427, '9', '2', '3', '5', '4');
INSERT INTO `location` VALUES (1428, '9', '2', '2', '5', '4');
INSERT INTO `location` VALUES (1429, '9', '2', '3', '4', '4');
INSERT INTO `location` VALUES (1430, '9', '2', '2', '4', '4');
INSERT INTO `location` VALUES (1431, '9', '2', '4', '9', '4');
INSERT INTO `location` VALUES (1432, '9', '2', '1', '4', '4');
INSERT INTO `location` VALUES (1433, '9', '2', '3', '9', '4');
INSERT INTO `location` VALUES (1434, '9', '2', '2', '9', '4');
INSERT INTO `location` VALUES (1435, '9', '2', '3', '8', '4');
INSERT INTO `location` VALUES (1436, '9', '2', '2', '8', '4');
INSERT INTO `location` VALUES (1437, '9', '2', '4', '13', '4');
INSERT INTO `location` VALUES (1438, '9', '2', '1', '8', '4');
INSERT INTO `location` VALUES (1439, '9', '2', '3', '13', '4');
INSERT INTO `location` VALUES (1440, '9', '2', '2', '13', '4');
INSERT INTO `location` VALUES (1441, '9', '2', '3', '12', '4');
INSERT INTO `location` VALUES (1442, '9', '2', '2', '12', '4');
INSERT INTO `location` VALUES (1443, '9', '2', '1', '12', '4');
INSERT INTO `location` VALUES (1444, '9', '2', '4', '4', '4');
INSERT INTO `location` VALUES (1445, '9', '2', '4', '3', '4');
INSERT INTO `location` VALUES (1446, '9', '2', '3', '3', '4');
INSERT INTO `location` VALUES (1447, '9', '2', '2', '3', '4');
INSERT INTO `location` VALUES (1448, '9', '2', '4', '8', '4');
INSERT INTO `location` VALUES (1449, '9', '2', '1', '3', '4');
INSERT INTO `location` VALUES (1450, '9', '2', '4', '7', '4');
INSERT INTO `location` VALUES (1451, '9', '2', '3', '7', '4');
INSERT INTO `location` VALUES (1452, '9', '2', '2', '7', '4');
INSERT INTO `location` VALUES (1453, '9', '2', '4', '12', '4');
INSERT INTO `location` VALUES (1454, '9', '2', '1', '7', '4');
INSERT INTO `location` VALUES (1455, '9', '2', '4', '11', '4');
INSERT INTO `location` VALUES (1456, '9', '2', '3', '11', '4');
INSERT INTO `location` VALUES (1457, '9', '5', '2', '5', '4');
INSERT INTO `location` VALUES (1458, '9', '5', '1', '5', '4');
INSERT INTO `location` VALUES (1459, '9', '5', '4', '1', '4');
INSERT INTO `location` VALUES (1460, '9', '5', '3', '1', '4');
INSERT INTO `location` VALUES (1461, '9', '5', '2', '1', '4');
INSERT INTO `location` VALUES (1462, '9', '5', '1', '1', '4');
INSERT INTO `location` VALUES (1463, '9', '5', '4', '14', '4');
INSERT INTO `location` VALUES (1464, '9', '5', '3', '14', '4');
INSERT INTO `location` VALUES (1465, '9', '5', '2', '14', '4');
INSERT INTO `location` VALUES (1466, '9', '5', '1', '14', '4');
INSERT INTO `location` VALUES (1467, '9', '5', '4', '10', '4');
INSERT INTO `location` VALUES (1468, '9', '5', '1', '15', '4');
INSERT INTO `location` VALUES (1469, '9', '5', '3', '10', '4');
INSERT INTO `location` VALUES (1470, '9', '5', '2', '10', '4');
INSERT INTO `location` VALUES (1471, '9', '5', '1', '10', '4');
INSERT INTO `location` VALUES (1472, '9', '5', '4', '6', '4');
INSERT INTO `location` VALUES (1473, '9', '5', '1', '11', '4');
INSERT INTO `location` VALUES (1474, '9', '5', '3', '6', '4');
INSERT INTO `location` VALUES (1475, '9', '5', '2', '6', '4');
INSERT INTO `location` VALUES (1476, '9', '5', '1', '6', '4');
INSERT INTO `location` VALUES (1477, '9', '5', '4', '2', '4');
INSERT INTO `location` VALUES (1478, '9', '5', '1', '7', '4');
INSERT INTO `location` VALUES (1479, '9', '5', '3', '2', '4');
INSERT INTO `location` VALUES (1480, '9', '5', '2', '2', '4');
INSERT INTO `location` VALUES (1481, '9', '5', '1', '2', '4');
INSERT INTO `location` VALUES (1482, '9', '5', '4', '15', '4');
INSERT INTO `location` VALUES (1483, '9', '5', '3', '15', '4');
INSERT INTO `location` VALUES (1484, '9', '5', '1', '3', '4');
INSERT INTO `location` VALUES (1485, '9', '5', '2', '15', '4');
INSERT INTO `location` VALUES (1486, '9', '5', '4', '11', '4');
INSERT INTO `location` VALUES (1487, '9', '5', '3', '11', '4');
INSERT INTO `location` VALUES (1488, '9', '5', '2', '11', '4');
INSERT INTO `location` VALUES (1489, '9', '5', '3', '12', '4');
INSERT INTO `location` VALUES (1490, '9', '5', '2', '12', '4');
INSERT INTO `location` VALUES (1491, '9', '5', '4', '7', '4');
INSERT INTO `location` VALUES (1492, '9', '5', '1', '12', '4');
INSERT INTO `location` VALUES (1493, '9', '5', '3', '7', '4');
INSERT INTO `location` VALUES (1494, '9', '5', '2', '7', '4');
INSERT INTO `location` VALUES (1495, '9', '5', '3', '8', '4');
INSERT INTO `location` VALUES (1496, '9', '5', '2', '8', '4');
INSERT INTO `location` VALUES (1497, '9', '5', '4', '3', '4');
INSERT INTO `location` VALUES (1498, '9', '5', '1', '8', '4');
INSERT INTO `location` VALUES (1499, '9', '5', '3', '3', '4');
INSERT INTO `location` VALUES (1500, '9', '5', '2', '3', '4');
INSERT INTO `location` VALUES (1501, '9', '5', '3', '4', '4');
INSERT INTO `location` VALUES (1502, '9', '5', '2', '4', '4');
INSERT INTO `location` VALUES (1503, '9', '5', '1', '4', '4');
INSERT INTO `location` VALUES (1504, '9', '5', '4', '12', '4');
INSERT INTO `location` VALUES (1505, '9', '5', '4', '13', '4');
INSERT INTO `location` VALUES (1506, '9', '5', '3', '13', '4');
INSERT INTO `location` VALUES (1507, '9', '5', '2', '13', '4');
INSERT INTO `location` VALUES (1508, '9', '5', '4', '8', '4');
INSERT INTO `location` VALUES (1509, '9', '5', '1', '13', '4');
INSERT INTO `location` VALUES (1510, '9', '5', '4', '9', '4');
INSERT INTO `location` VALUES (1511, '9', '5', '3', '9', '4');
INSERT INTO `location` VALUES (1512, '9', '5', '2', '9', '4');
INSERT INTO `location` VALUES (1513, '9', '5', '4', '4', '4');
INSERT INTO `location` VALUES (1514, '9', '5', '1', '9', '4');
INSERT INTO `location` VALUES (1515, '9', '5', '4', '5', '4');
INSERT INTO `location` VALUES (1516, '9', '5', '3', '5', '4');
INSERT INTO `location` VALUES (1517, '9', '6', '3', '10', '4');
INSERT INTO `location` VALUES (1518, '9', '6', '2', '10', '4');
INSERT INTO `location` VALUES (1519, '9', '6', '3', '9', '4');
INSERT INTO `location` VALUES (1520, '9', '6', '3', '12', '4');
INSERT INTO `location` VALUES (1521, '9', '6', '1', '10', '4');
INSERT INTO `location` VALUES (1522, '9', '6', '2', '9', '4');
INSERT INTO `location` VALUES (1523, '9', '6', '2', '6', '4');
INSERT INTO `location` VALUES (1524, '9', '6', '2', '12', '4');
INSERT INTO `location` VALUES (1525, '9', '6', '1', '3', '4');
INSERT INTO `location` VALUES (1526, '9', '6', '1', '9', '4');
INSERT INTO `location` VALUES (1527, '9', '6', '1', '6', '4');
INSERT INTO `location` VALUES (1528, '9', '6', '2', '5', '4');
INSERT INTO `location` VALUES (1529, '9', '6', '1', '12', '4');
INSERT INTO `location` VALUES (1530, '9', '6', '2', '8', '4');
INSERT INTO `location` VALUES (1531, '9', '6', '1', '5', '4');
INSERT INTO `location` VALUES (1532, '9', '6', '1', '8', '4');
INSERT INTO `location` VALUES (1533, '9', '6', '1', '1', '4');
INSERT INTO `location` VALUES (1534, '9', '6', '1', '4', '4');
INSERT INTO `location` VALUES (1535, '9', '6', '4', '12', '4');
INSERT INTO `location` VALUES (1536, '9', '6', '4', '11', '4');
INSERT INTO `location` VALUES (1537, '9', '6', '3', '8', '4');
INSERT INTO `location` VALUES (1538, '9', '6', '3', '11', '4');
INSERT INTO `location` VALUES (1539, '9', '6', '2', '11', '4');
INSERT INTO `location` VALUES (1540, '9', '6', '2', '7', '4');
INSERT INTO `location` VALUES (1541, '9', '6', '2', '4', '4');
INSERT INTO `location` VALUES (1542, '9', '6', '1', '11', '4');
INSERT INTO `location` VALUES (1543, '9', '6', '1', '7', '4');
INSERT INTO `location` VALUES (1544, '9', '6', '1', '2', '4');
INSERT INTO `location` VALUES (1545, '10', '3', '1', '2', '4');
INSERT INTO `location` VALUES (1546, '10', '3', '1', '3', '4');
INSERT INTO `location` VALUES (1547, '10', '3', '1', '4', '4');
INSERT INTO `location` VALUES (1548, '10', '3', '1', '10', '4');
INSERT INTO `location` VALUES (1549, '10', '3', '1', '11', '4');
INSERT INTO `location` VALUES (1550, '10', '3', '1', '5', '4');
INSERT INTO `location` VALUES (1551, '10', '3', '1', '12', '4');
INSERT INTO `location` VALUES (1552, '10', '3', '1', '13', '4');
INSERT INTO `location` VALUES (1553, '10', '3', '1', '6', '4');
INSERT INTO `location` VALUES (1554, '10', '3', '1', '7', '4');
INSERT INTO `location` VALUES (1555, '10', '3', '1', '8', '4');
INSERT INTO `location` VALUES (1556, '10', '3', '1', '9', '4');
INSERT INTO `location` VALUES (1557, '10', '1', '2', '4', '4');
INSERT INTO `location` VALUES (1558, '10', '1', '1', '4', '4');
INSERT INTO `location` VALUES (1559, '10', '1', '3', '9', '4');
INSERT INTO `location` VALUES (1560, '10', '1', '2', '9', '4');
INSERT INTO `location` VALUES (1561, '10', '1', '1', '9', '4');
INSERT INTO `location` VALUES (1562, '10', '1', '2', '8', '4');
INSERT INTO `location` VALUES (1563, '10', '1', '1', '8', '4');
INSERT INTO `location` VALUES (1564, '10', '1', '3', '13', '4');
INSERT INTO `location` VALUES (1565, '10', '1', '2', '13', '4');
INSERT INTO `location` VALUES (1566, '10', '1', '1', '13', '4');
INSERT INTO `location` VALUES (1567, '10', '1', '2', '12', '4');
INSERT INTO `location` VALUES (1568, '10', '1', '1', '12', '4');
INSERT INTO `location` VALUES (1569, '10', '1', '3', '4', '4');
INSERT INTO `location` VALUES (1570, '10', '1', '3', '3', '4');
INSERT INTO `location` VALUES (1571, '10', '1', '2', '3', '4');
INSERT INTO `location` VALUES (1572, '10', '1', '1', '3', '4');
INSERT INTO `location` VALUES (1573, '10', '1', '3', '8', '4');
INSERT INTO `location` VALUES (1574, '10', '1', '3', '7', '4');
INSERT INTO `location` VALUES (1575, '10', '1', '2', '7', '4');
INSERT INTO `location` VALUES (1576, '10', '1', '1', '7', '4');
INSERT INTO `location` VALUES (1577, '10', '1', '3', '12', '4');
INSERT INTO `location` VALUES (1578, '10', '1', '3', '11', '4');
INSERT INTO `location` VALUES (1579, '10', '1', '2', '11', '4');
INSERT INTO `location` VALUES (1580, '10', '1', '1', '11', '4');
INSERT INTO `location` VALUES (1581, '10', '1', '3', '2', '4');
INSERT INTO `location` VALUES (1582, '10', '1', '2', '2', '4');
INSERT INTO `location` VALUES (1583, '10', '1', '1', '2', '4');
INSERT INTO `location` VALUES (1584, '10', '1', '3', '6', '4');
INSERT INTO `location` VALUES (1585, '10', '1', '2', '6', '4');
INSERT INTO `location` VALUES (1586, '10', '1', '1', '6', '4');
INSERT INTO `location` VALUES (1587, '10', '1', '3', '10', '4');
INSERT INTO `location` VALUES (1588, '10', '1', '2', '10', '4');
INSERT INTO `location` VALUES (1589, '10', '1', '1', '10', '4');
INSERT INTO `location` VALUES (1590, '10', '1', '3', '1', '4');
INSERT INTO `location` VALUES (1591, '10', '1', '2', '1', '4');
INSERT INTO `location` VALUES (1592, '10', '1', '1', '1', '4');
INSERT INTO `location` VALUES (1593, '10', '1', '3', '5', '4');
INSERT INTO `location` VALUES (1594, '10', '1', '2', '5', '4');
INSERT INTO `location` VALUES (1595, '10', '1', '1', '5', '4');
INSERT INTO `location` VALUES (1596, '10', '1', '2', '15', '4');
INSERT INTO `location` VALUES (1597, '10', '1', '1', '15', '4');
INSERT INTO `location` VALUES (1598, '10', '1', '2', '14', '4');
INSERT INTO `location` VALUES (1599, '10', '1', '1', '14', '4');
INSERT INTO `location` VALUES (1600, '10', '4', '1', '2', '4');
INSERT INTO `location` VALUES (1601, '10', '4', '1', '8', '4');
INSERT INTO `location` VALUES (1602, '10', '4', '1', '1', '4');
INSERT INTO `location` VALUES (1603, '10', '4', '1', '7', '4');
INSERT INTO `location` VALUES (1604, '10', '4', '1', '6', '4');
INSERT INTO `location` VALUES (1605, '10', '4', '1', '12', '4');
INSERT INTO `location` VALUES (1606, '10', '4', '1', '5', '4');
INSERT INTO `location` VALUES (1607, '10', '4', '1', '11', '4');
INSERT INTO `location` VALUES (1608, '10', '4', '1', '4', '4');
INSERT INTO `location` VALUES (1609, '10', '4', '1', '10', '4');
INSERT INTO `location` VALUES (1610, '10', '4', '1', '9', '4');
INSERT INTO `location` VALUES (1611, '10', '4', '1', '13', '4');
INSERT INTO `location` VALUES (1612, '10', '4', '1', '3', '4');
INSERT INTO `location` VALUES (1613, '10', '5', '1', '2', '4');
INSERT INTO `location` VALUES (1614, '10', '5', '1', '8', '4');
INSERT INTO `location` VALUES (1615, '10', '5', '1', '1', '4');
INSERT INTO `location` VALUES (1616, '10', '5', '1', '7', '4');
INSERT INTO `location` VALUES (1617, '10', '5', '1', '6', '4');
INSERT INTO `location` VALUES (1618, '10', '5', '1', '12', '4');
INSERT INTO `location` VALUES (1619, '10', '5', '1', '5', '4');
INSERT INTO `location` VALUES (1620, '10', '5', '1', '11', '4');
INSERT INTO `location` VALUES (1621, '10', '5', '1', '4', '4');
INSERT INTO `location` VALUES (1622, '10', '5', '1', '10', '4');
INSERT INTO `location` VALUES (1623, '10', '5', '1', '9', '4');
INSERT INTO `location` VALUES (1624, '10', '5', '1', '13', '4');
INSERT INTO `location` VALUES (1625, '10', '5', '1', '3', '4');
INSERT INTO `location` VALUES (1626, '11', '4', '2', '8', '4');
INSERT INTO `location` VALUES (1627, '11', '4', '3', '8', '4');
INSERT INTO `location` VALUES (1628, '12', '5', '3', '11', '4');
INSERT INTO `location` VALUES (1629, '11', '4', '2', '13', '4');
INSERT INTO `location` VALUES (1630, '11', '4', '2', '12', '4');
INSERT INTO `location` VALUES (1631, '11', '4', '3', '12', '4');
INSERT INTO `location` VALUES (1632, '12', '5', '3', '7', '4');
INSERT INTO `location` VALUES (1633, '11', '4', '2', '3', '4');
INSERT INTO `location` VALUES (1634, '11', '4', '3', '3', '4');
INSERT INTO `location` VALUES (1635, '12', '5', '1', '16', '4');
INSERT INTO `location` VALUES (1636, '11', '4', '2', '7', '4');
INSERT INTO `location` VALUES (1637, '11', '4', '3', '7', '4');
INSERT INTO `location` VALUES (1638, '12', '5', '3', '12', '4');
INSERT INTO `location` VALUES (1639, '11', '4', '2', '11', '4');
INSERT INTO `location` VALUES (1640, '11', '4', '3', '11', '4');
INSERT INTO `location` VALUES (1641, '12', '5', '3', '8', '4');
INSERT INTO `location` VALUES (1642, '11', '4', '2', '2', '4');
INSERT INTO `location` VALUES (1643, '11', '4', '3', '2', '4');
INSERT INTO `location` VALUES (1644, '11', '4', '4', '2', '4');
INSERT INTO `location` VALUES (1645, '11', '4', '3', '1', '4');
INSERT INTO `location` VALUES (1646, '11', '4', '4', '1', '4');
INSERT INTO `location` VALUES (1647, '11', '4', '2', '6', '4');
INSERT INTO `location` VALUES (1648, '11', '4', '3', '6', '4');
INSERT INTO `location` VALUES (1649, '12', '5', '3', '13', '4');
INSERT INTO `location` VALUES (1650, '11', '4', '3', '5', '4');
INSERT INTO `location` VALUES (1651, '12', '5', '3', '14', '4');
INSERT INTO `location` VALUES (1652, '11', '4', '2', '10', '4');
INSERT INTO `location` VALUES (1653, '11', '4', '3', '10', '4');
INSERT INTO `location` VALUES (1654, '12', '5', '3', '9', '4');
INSERT INTO `location` VALUES (1655, '11', '4', '3', '9', '4');
INSERT INTO `location` VALUES (1656, '12', '5', '3', '10', '4');
INSERT INTO `location` VALUES (1657, '11', '4', '3', '13', '4');
INSERT INTO `location` VALUES (1658, '11', '4', '2', '1', '4');
INSERT INTO `location` VALUES (1659, '12', '5', '3', '6', '4');
INSERT INTO `location` VALUES (1660, '11', '4', '2', '5', '4');
INSERT INTO `location` VALUES (1661, '11', '4', '2', '4', '4');
INSERT INTO `location` VALUES (1662, '11', '4', '3', '4', '4');
INSERT INTO `location` VALUES (1663, '12', '5', '3', '15', '4');
INSERT INTO `location` VALUES (1664, '11', '4', '2', '9', '4');
INSERT INTO `location` VALUES (1665, '11', '3', '2', '1', '4');
INSERT INTO `location` VALUES (1666, '11', '3', '2', '2', '4');
INSERT INTO `location` VALUES (1667, '11', '5', '1', '14', '4');
INSERT INTO `location` VALUES (1668, '12', '5', '3', '5', '4');
INSERT INTO `location` VALUES (1669, '11', '5', '1', '15', '4');
INSERT INTO `location` VALUES (1670, '12', '5', '4', '3', '4');
INSERT INTO `location` VALUES (1671, '11', '4', '1', '2', '4');
INSERT INTO `location` VALUES (1672, '11', '4', '1', '8', '4');
INSERT INTO `location` VALUES (1673, '11', '4', '1', '1', '4');
INSERT INTO `location` VALUES (1674, '11', '4', '1', '7', '4');
INSERT INTO `location` VALUES (1675, '11', '4', '1', '6', '4');
INSERT INTO `location` VALUES (1676, '11', '4', '1', '12', '4');
INSERT INTO `location` VALUES (1677, '11', '4', '1', '5', '4');
INSERT INTO `location` VALUES (1678, '11', '4', '1', '11', '4');
INSERT INTO `location` VALUES (1679, '11', '4', '1', '4', '4');
INSERT INTO `location` VALUES (1680, '11', '4', '1', '10', '4');
INSERT INTO `location` VALUES (1681, '11', '4', '1', '9', '4');
INSERT INTO `location` VALUES (1682, '11', '4', '1', '13', '4');
INSERT INTO `location` VALUES (1683, '11', '4', '1', '3', '4');
INSERT INTO `location` VALUES (1684, '11', '1', '2', '8', '4');
INSERT INTO `location` VALUES (1685, '11', '1', '3', '8', '4');
INSERT INTO `location` VALUES (1686, '12', '5', '4', '11', '4');
INSERT INTO `location` VALUES (1687, '11', '1', '2', '13', '4');
INSERT INTO `location` VALUES (1688, '11', '1', '2', '12', '4');
INSERT INTO `location` VALUES (1689, '11', '1', '3', '12', '4');
INSERT INTO `location` VALUES (1690, '12', '5', '4', '7', '4');
INSERT INTO `location` VALUES (1691, '11', '1', '2', '3', '4');
INSERT INTO `location` VALUES (1692, '11', '1', '3', '3', '4');
INSERT INTO `location` VALUES (1693, '12', '5', '4', '16', '4');
INSERT INTO `location` VALUES (1694, '11', '1', '2', '7', '4');
INSERT INTO `location` VALUES (1695, '11', '1', '3', '7', '4');
INSERT INTO `location` VALUES (1696, '12', '5', '4', '12', '4');
INSERT INTO `location` VALUES (1697, '11', '1', '2', '11', '4');
INSERT INTO `location` VALUES (1698, '11', '1', '3', '11', '4');
INSERT INTO `location` VALUES (1699, '12', '5', '4', '8', '4');
INSERT INTO `location` VALUES (1700, '11', '1', '2', '2', '4');
INSERT INTO `location` VALUES (1701, '11', '1', '3', '2', '4');
INSERT INTO `location` VALUES (1702, '11', '1', '4', '2', '4');
INSERT INTO `location` VALUES (1703, '11', '1', '3', '1', '4');
INSERT INTO `location` VALUES (1704, '11', '1', '4', '1', '4');
INSERT INTO `location` VALUES (1705, '11', '1', '2', '6', '4');
INSERT INTO `location` VALUES (1706, '11', '1', '3', '6', '4');
INSERT INTO `location` VALUES (1707, '12', '5', '4', '13', '4');
INSERT INTO `location` VALUES (1708, '11', '1', '3', '5', '4');
INSERT INTO `location` VALUES (1709, '12', '5', '4', '14', '4');
INSERT INTO `location` VALUES (1710, '11', '1', '2', '10', '4');
INSERT INTO `location` VALUES (1711, '11', '1', '3', '10', '4');
INSERT INTO `location` VALUES (1712, '12', '5', '4', '9', '4');
INSERT INTO `location` VALUES (1713, '11', '1', '3', '9', '4');
INSERT INTO `location` VALUES (1714, '12', '5', '4', '10', '4');
INSERT INTO `location` VALUES (1715, '11', '1', '3', '13', '4');
INSERT INTO `location` VALUES (1716, '11', '1', '2', '1', '4');
INSERT INTO `location` VALUES (1717, '12', '5', '4', '6', '4');
INSERT INTO `location` VALUES (1718, '11', '1', '2', '5', '4');
INSERT INTO `location` VALUES (1719, '11', '1', '2', '4', '4');
INSERT INTO `location` VALUES (1720, '11', '1', '3', '4', '4');
INSERT INTO `location` VALUES (1721, '12', '5', '4', '15', '4');
INSERT INTO `location` VALUES (1722, '11', '1', '2', '9', '4');
INSERT INTO `location` VALUES (1723, '11', '1', '2', '15', '4');
INSERT INTO `location` VALUES (1724, '11', '1', '2', '14', '4');
INSERT INTO `location` VALUES (1725, '11', '1', '3', '14', '4');
INSERT INTO `location` VALUES (1726, '12', '5', '4', '5', '4');
INSERT INTO `location` VALUES (1727, '11', '1', '3', '15', '4');
INSERT INTO `location` VALUES (1728, '12', '5', '4', '4', '4');
INSERT INTO `location` VALUES (1729, '11', '1', '1', '2', '4');
INSERT INTO `location` VALUES (1730, '11', '1', '1', '8', '4');
INSERT INTO `location` VALUES (1731, '11', '1', '1', '1', '4');
INSERT INTO `location` VALUES (1732, '11', '1', '1', '7', '4');
INSERT INTO `location` VALUES (1733, '11', '1', '1', '6', '4');
INSERT INTO `location` VALUES (1734, '11', '1', '1', '12', '4');
INSERT INTO `location` VALUES (1735, '11', '1', '1', '5', '4');
INSERT INTO `location` VALUES (1736, '11', '1', '1', '11', '4');
INSERT INTO `location` VALUES (1737, '11', '1', '1', '4', '4');
INSERT INTO `location` VALUES (1738, '11', '1', '1', '10', '4');
INSERT INTO `location` VALUES (1739, '11', '1', '1', '9', '4');
INSERT INTO `location` VALUES (1740, '11', '1', '1', '13', '4');
INSERT INTO `location` VALUES (1741, '11', '1', '1', '3', '4');
INSERT INTO `location` VALUES (1742, '11', '5', '3', '2', '4');
INSERT INTO `location` VALUES (1743, '11', '5', '3', '8', '4');
INSERT INTO `location` VALUES (1744, '11', '5', '3', '1', '4');
INSERT INTO `location` VALUES (1745, '11', '5', '3', '7', '4');
INSERT INTO `location` VALUES (1746, '11', '5', '3', '6', '4');
INSERT INTO `location` VALUES (1747, '11', '5', '3', '12', '4');
INSERT INTO `location` VALUES (1748, '11', '5', '3', '5', '4');
INSERT INTO `location` VALUES (1749, '11', '5', '3', '11', '4');
INSERT INTO `location` VALUES (1750, '11', '5', '3', '4', '4');
INSERT INTO `location` VALUES (1751, '11', '5', '3', '10', '4');
INSERT INTO `location` VALUES (1752, '11', '5', '3', '9', '4');
INSERT INTO `location` VALUES (1753, '11', '5', '3', '13', '4');
INSERT INTO `location` VALUES (1754, '11', '5', '3', '3', '4');
INSERT INTO `location` VALUES (1755, '11', '2', '2', '8', '4');
INSERT INTO `location` VALUES (1756, '11', '2', '3', '8', '4');
INSERT INTO `location` VALUES (1757, '11', '2', '4', '8', '4');
INSERT INTO `location` VALUES (1758, '11', '2', '2', '3', '4');
INSERT INTO `location` VALUES (1759, '11', '2', '2', '4', '4');
INSERT INTO `location` VALUES (1760, '11', '2', '3', '4', '4');
INSERT INTO `location` VALUES (1761, '11', '2', '4', '4', '4');
INSERT INTO `location` VALUES (1762, '11', '2', '2', '13', '4');
INSERT INTO `location` VALUES (1763, '11', '2', '3', '13', '4');
INSERT INTO `location` VALUES (1764, '11', '2', '4', '13', '4');
INSERT INTO `location` VALUES (1765, '11', '2', '2', '9', '4');
INSERT INTO `location` VALUES (1766, '11', '2', '3', '9', '4');
INSERT INTO `location` VALUES (1767, '11', '2', '4', '9', '4');
INSERT INTO `location` VALUES (1768, '11', '2', '2', '5', '4');
INSERT INTO `location` VALUES (1769, '11', '2', '3', '5', '4');
INSERT INTO `location` VALUES (1770, '11', '2', '4', '5', '4');
INSERT INTO `location` VALUES (1771, '11', '2', '2', '14', '4');
INSERT INTO `location` VALUES (1772, '11', '2', '3', '14', '4');
INSERT INTO `location` VALUES (1773, '11', '2', '4', '14', '4');
INSERT INTO `location` VALUES (1774, '11', '2', '3', '15', '4');
INSERT INTO `location` VALUES (1775, '11', '2', '4', '15', '4');
INSERT INTO `location` VALUES (1776, '11', '2', '2', '10', '4');
INSERT INTO `location` VALUES (1777, '11', '2', '3', '10', '4');
INSERT INTO `location` VALUES (1778, '11', '2', '4', '10', '4');
INSERT INTO `location` VALUES (1779, '11', '2', '3', '11', '4');
INSERT INTO `location` VALUES (1780, '11', '2', '4', '11', '4');
INSERT INTO `location` VALUES (1781, '11', '2', '2', '6', '4');
INSERT INTO `location` VALUES (1782, '11', '2', '3', '6', '4');
INSERT INTO `location` VALUES (1783, '11', '2', '4', '6', '4');
INSERT INTO `location` VALUES (1784, '11', '2', '3', '7', '4');
INSERT INTO `location` VALUES (1785, '11', '2', '4', '7', '4');
INSERT INTO `location` VALUES (1786, '11', '2', '3', '3', '4');
INSERT INTO `location` VALUES (1787, '11', '2', '2', '15', '4');
INSERT INTO `location` VALUES (1788, '11', '2', '4', '3', '4');
INSERT INTO `location` VALUES (1789, '11', '2', '2', '11', '4');
INSERT INTO `location` VALUES (1790, '11', '2', '2', '12', '4');
INSERT INTO `location` VALUES (1791, '11', '2', '3', '12', '4');
INSERT INTO `location` VALUES (1792, '11', '2', '4', '12', '4');
INSERT INTO `location` VALUES (1793, '11', '2', '2', '7', '4');
INSERT INTO `location` VALUES (1794, '11', '2', '2', '1', '4');
INSERT INTO `location` VALUES (1795, '11', '2', '2', '2', '4');
INSERT INTO `location` VALUES (1796, '11', '2', '3', '2', '4');
INSERT INTO `location` VALUES (1797, '11', '2', '4', '2', '4');
INSERT INTO `location` VALUES (1798, '11', '2', '3', '1', '4');
INSERT INTO `location` VALUES (1799, '11', '2', '4', '1', '4');
INSERT INTO `location` VALUES (1800, '11', '2', '1', '12', '4');
INSERT INTO `location` VALUES (1801, '11', '2', '1', '6', '4');
INSERT INTO `location` VALUES (1802, '11', '2', '1', '13', '4');
INSERT INTO `location` VALUES (1803, '11', '2', '1', '7', '4');
INSERT INTO `location` VALUES (1804, '11', '2', '1', '8', '4');
INSERT INTO `location` VALUES (1805, '11', '2', '1', '2', '4');
INSERT INTO `location` VALUES (1806, '11', '2', '1', '9', '4');
INSERT INTO `location` VALUES (1807, '11', '2', '1', '3', '4');
INSERT INTO `location` VALUES (1808, '11', '2', '1', '10', '4');
INSERT INTO `location` VALUES (1809, '11', '2', '1', '4', '4');
INSERT INTO `location` VALUES (1810, '11', '2', '1', '5', '4');
INSERT INTO `location` VALUES (1811, '11', '2', '1', '1', '4');
INSERT INTO `location` VALUES (1812, '11', '2', '1', '11', '4');
INSERT INTO `location` VALUES (1813, '10', '6', '1', '10', '4');
INSERT INTO `location` VALUES (1814, '10', '6', '1', '4', '4');
INSERT INTO `location` VALUES (1815, '10', '6', '1', '5', '4');
INSERT INTO `location` VALUES (1816, '10', '6', '1', '1', '4');
INSERT INTO `location` VALUES (1817, '10', '6', '1', '11', '4');
INSERT INTO `location` VALUES (1818, '10', '6', '4', '6', '4');
INSERT INTO `location` VALUES (1819, '10', '6', '3', '6', '4');
INSERT INTO `location` VALUES (1820, '10', '6', '2', '6', '4');
INSERT INTO `location` VALUES (1821, '10', '6', '4', '1', '4');
INSERT INTO `location` VALUES (1822, '10', '6', '4', '2', '4');
INSERT INTO `location` VALUES (1823, '10', '6', '3', '2', '4');
INSERT INTO `location` VALUES (1824, '10', '6', '2', '2', '4');
INSERT INTO `location` VALUES (1825, '10', '6', '4', '11', '4');
INSERT INTO `location` VALUES (1826, '10', '6', '3', '11', '4');
INSERT INTO `location` VALUES (1827, '10', '6', '2', '11', '4');
INSERT INTO `location` VALUES (1828, '10', '6', '4', '7', '4');
INSERT INTO `location` VALUES (1829, '10', '6', '3', '7', '4');
INSERT INTO `location` VALUES (1830, '10', '6', '2', '7', '4');
INSERT INTO `location` VALUES (1831, '10', '6', '4', '3', '4');
INSERT INTO `location` VALUES (1832, '10', '6', '3', '3', '4');
INSERT INTO `location` VALUES (1833, '10', '6', '2', '3', '4');
INSERT INTO `location` VALUES (1834, '10', '6', '4', '12', '4');
INSERT INTO `location` VALUES (1835, '10', '6', '3', '12', '4');
INSERT INTO `location` VALUES (1836, '10', '6', '2', '12', '4');
INSERT INTO `location` VALUES (1837, '10', '6', '3', '13', '4');
INSERT INTO `location` VALUES (1838, '10', '6', '2', '13', '4');
INSERT INTO `location` VALUES (1839, '10', '6', '4', '8', '4');
INSERT INTO `location` VALUES (1840, '10', '6', '3', '8', '4');
INSERT INTO `location` VALUES (1841, '10', '6', '2', '8', '4');
INSERT INTO `location` VALUES (1842, '10', '6', '3', '9', '4');
INSERT INTO `location` VALUES (1843, '10', '6', '2', '9', '4');
INSERT INTO `location` VALUES (1844, '10', '6', '4', '4', '4');
INSERT INTO `location` VALUES (1845, '10', '6', '3', '4', '4');
INSERT INTO `location` VALUES (1846, '10', '6', '2', '4', '4');
INSERT INTO `location` VALUES (1847, '10', '6', '3', '5', '4');
INSERT INTO `location` VALUES (1848, '10', '6', '2', '5', '4');
INSERT INTO `location` VALUES (1849, '10', '6', '3', '1', '4');
INSERT INTO `location` VALUES (1850, '10', '6', '4', '13', '4');
INSERT INTO `location` VALUES (1851, '10', '6', '2', '1', '4');
INSERT INTO `location` VALUES (1852, '10', '6', '4', '9', '4');
INSERT INTO `location` VALUES (1853, '10', '6', '4', '10', '4');
INSERT INTO `location` VALUES (1854, '10', '6', '3', '10', '4');
INSERT INTO `location` VALUES (1855, '10', '6', '2', '10', '4');
INSERT INTO `location` VALUES (1856, '10', '6', '4', '5', '4');
INSERT INTO `location` VALUES (1857, '10', '6', '4', '14', '4');
INSERT INTO `location` VALUES (1858, '10', '6', '3', '14', '4');
INSERT INTO `location` VALUES (1859, '10', '6', '2', '14', '4');
INSERT INTO `location` VALUES (1860, '10', '6', '3', '15', '4');
INSERT INTO `location` VALUES (1861, '10', '6', '2', '15', '4');
INSERT INTO `location` VALUES (1862, '10', '6', '4', '15', '4');
INSERT INTO `location` VALUES (1863, '7', '8', '1', '1', '4');
INSERT INTO `location` VALUES (1864, '7', '8', '1', '1', '4');
INSERT INTO `location` VALUES (1865, '7', '8', '1', '1', '4');
INSERT INTO `location` VALUES (1866, '7', '8', '1', '1', '4');
INSERT INTO `location` VALUES (1867, '8', '1', '1', '1', '4');
INSERT INTO `location` VALUES (1868, '8', '1', '2', '1', '4');
INSERT INTO `location` VALUES (1869, '8', '1', '3', '1', '4');
INSERT INTO `location` VALUES (1870, '10', '3', '2', '1', '4');
INSERT INTO `location` VALUES (1871, '10', '3', '3', '1', '4');
INSERT INTO `location` VALUES (1872, '10', '3', '4', '1', '4');
INSERT INTO `location` VALUES (1873, '9', '30', '1', '15', '4');
INSERT INTO `location` VALUES (1874, '9', '30', '2', '15', '4');
INSERT INTO `location` VALUES (1875, '9', '30', '3', '15', '4');
INSERT INTO `location` VALUES (1876, '9', '30', '4', '15', '4');
INSERT INTO `location` VALUES (1878, '8', '1', '1', '2', '4');
INSERT INTO `location` VALUES (1879, '8', '1', '2', '2', '4');
INSERT INTO `location` VALUES (1880, '8', '1', '3', '2', '4');
INSERT INTO `location` VALUES (1881, '10', '3', '2', '2', '4');
INSERT INTO `location` VALUES (1882, '10', '3', '3', '2', '4');
INSERT INTO `location` VALUES (1883, '10', '3', '4', '2', '4');
INSERT INTO `location` VALUES (1884, '9', '30', '1', '14', '4');
INSERT INTO `location` VALUES (1885, '9', '30', '2', '14', '4');
INSERT INTO `location` VALUES (1886, '9', '30', '3', '14', '4');
INSERT INTO `location` VALUES (1887, '9', '30', '4', '14', '4');
INSERT INTO `location` VALUES (1888, '8', '1', '4', '1', '4');
INSERT INTO `location` VALUES (1889, '8', '1', '1', '3', '4');
INSERT INTO `location` VALUES (1890, '8', '1', '2', '3', '4');
INSERT INTO `location` VALUES (1891, '8', '1', '3', '3', '4');
INSERT INTO `location` VALUES (1892, '10', '3', '2', '3', '4');
INSERT INTO `location` VALUES (1893, '10', '3', '3', '3', '4');
INSERT INTO `location` VALUES (1894, '10', '3', '4', '3', '4');
INSERT INTO `location` VALUES (1895, '9', '30', '1', '13', '4');
INSERT INTO `location` VALUES (1896, '9', '30', '2', '13', '4');
INSERT INTO `location` VALUES (1897, '9', '30', '3', '13', '4');
INSERT INTO `location` VALUES (1898, '9', '30', '4', '13', '4');
INSERT INTO `location` VALUES (1899, '8', '1', '4', '2', '4');
INSERT INTO `location` VALUES (1900, '8', '1', '4', '1', '4');
INSERT INTO `location` VALUES (1901, '8', '1', '1', '4', '4');
INSERT INTO `location` VALUES (1902, '8', '1', '2', '4', '4');
INSERT INTO `location` VALUES (1903, '8', '1', '3', '4', '4');
INSERT INTO `location` VALUES (1904, '10', '3', '2', '4', '4');
INSERT INTO `location` VALUES (1905, '10', '3', '3', '4', '4');
INSERT INTO `location` VALUES (1906, '10', '3', '4', '4', '4');
INSERT INTO `location` VALUES (1907, '9', '30', '1', '12', '4');
INSERT INTO `location` VALUES (1908, '9', '30', '2', '12', '4');
INSERT INTO `location` VALUES (1909, '9', '30', '3', '12', '4');
INSERT INTO `location` VALUES (1910, '9', '30', '4', '12', '4');
INSERT INTO `location` VALUES (1911, '7', '7', '3', '1', '4');
INSERT INTO `location` VALUES (1912, '8', '1', '4', '3', '4');
INSERT INTO `location` VALUES (1913, '8', '1', '4', '2', '4');
INSERT INTO `location` VALUES (1914, '8', '1', '1', '5', '4');
INSERT INTO `location` VALUES (1915, '8', '1', '2', '5', '4');
INSERT INTO `location` VALUES (1916, '8', '1', '3', '5', '4');
INSERT INTO `location` VALUES (1917, '10', '3', '2', '5', '4');
INSERT INTO `location` VALUES (1918, '10', '3', '3', '5', '4');
INSERT INTO `location` VALUES (1919, '10', '3', '4', '5', '4');
INSERT INTO `location` VALUES (1920, '9', '30', '1', '11', '4');
INSERT INTO `location` VALUES (1921, '9', '30', '2', '11', '4');
INSERT INTO `location` VALUES (1922, '9', '30', '3', '11', '4');
INSERT INTO `location` VALUES (1923, '9', '30', '4', '11', '4');
INSERT INTO `location` VALUES (1924, '7', '7', '3', '2', '4');
INSERT INTO `location` VALUES (1925, '8', '1', '4', '4', '4');
INSERT INTO `location` VALUES (1926, '8', '1', '4', '3', '4');
INSERT INTO `location` VALUES (1927, '8', '1', '1', '6', '4');
INSERT INTO `location` VALUES (1928, '8', '1', '2', '6', '4');
INSERT INTO `location` VALUES (1929, '8', '1', '3', '6', '4');
INSERT INTO `location` VALUES (1930, '10', '3', '2', '6', '4');
INSERT INTO `location` VALUES (1931, '10', '3', '3', '6', '4');
INSERT INTO `location` VALUES (1932, '10', '3', '4', '6', '4');
INSERT INTO `location` VALUES (1933, '9', '30', '1', '10', '4');
INSERT INTO `location` VALUES (1934, '9', '30', '2', '10', '4');
INSERT INTO `location` VALUES (1935, '9', '30', '3', '10', '4');
INSERT INTO `location` VALUES (1936, '9', '30', '4', '10', '4');
INSERT INTO `location` VALUES (1937, '7', '7', '3', '3', '4');
INSERT INTO `location` VALUES (1938, '8', '1', '4', '5', '4');
INSERT INTO `location` VALUES (1939, '8', '1', '4', '4', '4');
INSERT INTO `location` VALUES (1940, '8', '1', '1', '7', '4');
INSERT INTO `location` VALUES (1941, '8', '1', '2', '7', '4');
INSERT INTO `location` VALUES (1942, '8', '1', '3', '7', '4');
INSERT INTO `location` VALUES (1943, '10', '3', '2', '7', '4');
INSERT INTO `location` VALUES (1944, '10', '3', '3', '7', '4');
INSERT INTO `location` VALUES (1945, '10', '3', '4', '7', '4');
INSERT INTO `location` VALUES (1946, '9', '30', '1', '9', '4');
INSERT INTO `location` VALUES (1947, '9', '30', '2', '9', '4');
INSERT INTO `location` VALUES (1948, '9', '30', '3', '9', '4');
INSERT INTO `location` VALUES (1949, '9', '30', '4', '9', '4');
INSERT INTO `location` VALUES (1950, '7', '7', '3', '4', '4');
INSERT INTO `location` VALUES (1951, '8', '1', '4', '6', '4');
INSERT INTO `location` VALUES (1952, '8', '1', '4', '5', '4');
INSERT INTO `location` VALUES (1953, '8', '1', '1', '8', '4');
INSERT INTO `location` VALUES (1954, '8', '1', '2', '8', '4');
INSERT INTO `location` VALUES (1955, '8', '1', '3', '8', '4');
INSERT INTO `location` VALUES (1956, '10', '3', '2', '8', '4');
INSERT INTO `location` VALUES (1957, '10', '3', '3', '8', '4');
INSERT INTO `location` VALUES (1958, '10', '3', '4', '8', '4');
INSERT INTO `location` VALUES (1959, '9', '30', '1', '8', '4');
INSERT INTO `location` VALUES (1960, '9', '30', '2', '8', '4');
INSERT INTO `location` VALUES (1961, '9', '30', '3', '8', '4');
INSERT INTO `location` VALUES (1962, '9', '30', '4', '8', '4');
INSERT INTO `location` VALUES (1963, '7', '7', '3', '5', '4');
INSERT INTO `location` VALUES (1964, '8', '1', '4', '7', '4');
INSERT INTO `location` VALUES (1965, '8', '1', '4', '6', '4');
INSERT INTO `location` VALUES (1966, '8', '1', '1', '9', '4');
INSERT INTO `location` VALUES (1967, '8', '1', '2', '9', '4');
INSERT INTO `location` VALUES (1968, '8', '1', '3', '9', '4');
INSERT INTO `location` VALUES (1969, '10', '3', '2', '9', '4');
INSERT INTO `location` VALUES (1970, '10', '3', '3', '9', '4');
INSERT INTO `location` VALUES (1971, '10', '3', '4', '9', '4');
INSERT INTO `location` VALUES (1972, '9', '30', '1', '7', '4');
INSERT INTO `location` VALUES (1973, '9', '30', '2', '7', '4');
INSERT INTO `location` VALUES (1974, '9', '30', '3', '7', '4');
INSERT INTO `location` VALUES (1975, '9', '30', '4', '7', '4');
INSERT INTO `location` VALUES (1976, '7', '7', '3', '6', '4');
INSERT INTO `location` VALUES (1978, '8', '1', '4', '7', '4');
INSERT INTO `location` VALUES (1979, '8', '1', '1', '10', '4');
INSERT INTO `location` VALUES (1980, '8', '1', '2', '10', '4');
INSERT INTO `location` VALUES (1981, '8', '1', '3', '10', '4');
INSERT INTO `location` VALUES (1982, '10', '3', '2', '10', '4');
INSERT INTO `location` VALUES (1983, '10', '3', '3', '10', '4');
INSERT INTO `location` VALUES (1984, '10', '3', '4', '10', '4');
INSERT INTO `location` VALUES (1985, '9', '30', '1', '6', '4');
INSERT INTO `location` VALUES (1986, '9', '30', '2', '6', '4');
INSERT INTO `location` VALUES (1987, '9', '30', '3', '6', '4');
INSERT INTO `location` VALUES (1988, '9', '30', '4', '6', '4');
INSERT INTO `location` VALUES (1989, '7', '7', '3', '7', '4');
INSERT INTO `location` VALUES (1990, '8', '1', '1', '1', '4');
INSERT INTO `location` VALUES (1991, '8', '1', '4', '8', '4');
INSERT INTO `location` VALUES (1992, '8', '1', '1', '11', '4');
INSERT INTO `location` VALUES (1993, '8', '1', '2', '11', '4');
INSERT INTO `location` VALUES (1994, '8', '1', '3', '11', '4');
INSERT INTO `location` VALUES (1995, '10', '3', '2', '11', '4');
INSERT INTO `location` VALUES (1996, '10', '3', '3', '11', '4');
INSERT INTO `location` VALUES (1997, '10', '3', '4', '11', '4');
INSERT INTO `location` VALUES (1998, '9', '30', '1', '5', '4');
INSERT INTO `location` VALUES (1999, '9', '30', '2', '5', '4');
INSERT INTO `location` VALUES (2000, '9', '30', '3', '5', '4');
INSERT INTO `location` VALUES (2001, '9', '30', '4', '5', '4');
INSERT INTO `location` VALUES (2003, '8', '1', '1', '2', '4');
INSERT INTO `location` VALUES (2004, '8', '1', '4', '14', '4');
INSERT INTO `location` VALUES (2005, '8', '1', '1', '12', '4');
INSERT INTO `location` VALUES (2006, '8', '1', '2', '12', '4');
INSERT INTO `location` VALUES (2007, '8', '1', '3', '12', '4');
INSERT INTO `location` VALUES (2008, '10', '3', '2', '12', '4');
INSERT INTO `location` VALUES (2009, '10', '3', '3', '12', '4');
INSERT INTO `location` VALUES (2010, '10', '3', '4', '12', '4');
INSERT INTO `location` VALUES (2011, '9', '30', '1', '4', '4');
INSERT INTO `location` VALUES (2012, '9', '30', '2', '4', '4');
INSERT INTO `location` VALUES (2013, '9', '30', '3', '4', '4');
INSERT INTO `location` VALUES (2014, '9', '30', '4', '4', '4');
INSERT INTO `location` VALUES (2015, '7', '7', '2', '1', '4');
INSERT INTO `location` VALUES (2016, '8', '1', '1', '3', '4');
INSERT INTO `location` VALUES (2017, '8', '1', '4', '15', '4');
INSERT INTO `location` VALUES (2018, '8', '1', '1', '13', '4');
INSERT INTO `location` VALUES (2019, '8', '1', '2', '13', '4');
INSERT INTO `location` VALUES (2020, '8', '1', '3', '13', '4');
INSERT INTO `location` VALUES (2021, '10', '3', '2', '13', '4');
INSERT INTO `location` VALUES (2022, '10', '3', '3', '13', '4');
INSERT INTO `location` VALUES (2023, '10', '3', '4', '13', '4');
INSERT INTO `location` VALUES (2024, '9', '30', '1', '3', '4');
INSERT INTO `location` VALUES (2025, '9', '30', '2', '3', '4');
INSERT INTO `location` VALUES (2026, '9', '30', '3', '3', '4');
INSERT INTO `location` VALUES (2027, '9', '30', '4', '3', '4');
INSERT INTO `location` VALUES (2028, '7', '7', '2', '2', '4');
INSERT INTO `location` VALUES (2029, '8', '1', '1', '4', '4');
INSERT INTO `location` VALUES (2030, '8', '1', '4', NULL, '4');
INSERT INTO `location` VALUES (2031, '8', '1', '1', '14', '4');
INSERT INTO `location` VALUES (2032, '8', '1', '2', '14', '4');
INSERT INTO `location` VALUES (2033, '8', '1', '3', '14', '4');
INSERT INTO `location` VALUES (2034, '10', '4', '2', '13', '4');
INSERT INTO `location` VALUES (2035, '10', '4', '3', '13', '4');
INSERT INTO `location` VALUES (2036, '10', '4', '4', '13', '4');
INSERT INTO `location` VALUES (2037, '9', '30', '1', '2', '4');
INSERT INTO `location` VALUES (2038, '9', '30', '2', '2', '4');
INSERT INTO `location` VALUES (2039, '9', '30', '3', '2', '4');
INSERT INTO `location` VALUES (2040, '9', '30', '4', '2', '4');
INSERT INTO `location` VALUES (2041, '7', '7', '2', '3', '4');
INSERT INTO `location` VALUES (2042, '8', '1', '1', '5', '4');
INSERT INTO `location` VALUES (2043, '8', '1', '4', '17', '4');
INSERT INTO `location` VALUES (2044, '8', '1', '1', '15', '4');
INSERT INTO `location` VALUES (2045, '8', '1', '2', '15', '4');
INSERT INTO `location` VALUES (2046, '8', '1', '3', '15', '4');
INSERT INTO `location` VALUES (2047, '10', '4', '2', '12', '4');
INSERT INTO `location` VALUES (2048, '10', '4', '3', '12', '4');
INSERT INTO `location` VALUES (2049, '10', '4', '4', '12', '4');
INSERT INTO `location` VALUES (2050, '9', '30', '1', '1', '4');
INSERT INTO `location` VALUES (2051, '9', '30', '2', '1', '4');
INSERT INTO `location` VALUES (2052, '9', '30', '3', '1', '4');
INSERT INTO `location` VALUES (2053, '9', '30', '4', '1', '4');
INSERT INTO `location` VALUES (2054, '7', '7', '2', '4', '4');
INSERT INTO `location` VALUES (2055, '8', '1', '1', '6', '4');
INSERT INTO `location` VALUES (2057, '8', '1', '1', NULL, '4');
INSERT INTO `location` VALUES (2058, '8', '1', '2', NULL, '4');
INSERT INTO `location` VALUES (2059, '8', '1', '3', NULL, '4');
INSERT INTO `location` VALUES (2060, '10', '4', '2', '11', '4');
INSERT INTO `location` VALUES (2061, '10', '4', '3', '11', '4');
INSERT INTO `location` VALUES (2062, '10', '4', '4', '11', '4');
INSERT INTO `location` VALUES (2063, '9', '7', '1', '1', '4');
INSERT INTO `location` VALUES (2064, '9', '7', '2', '1', '4');
INSERT INTO `location` VALUES (2065, '9', '7', '3', '1', '4');
INSERT INTO `location` VALUES (2066, '9', '7', '4', '1', '4');
INSERT INTO `location` VALUES (2067, '7', '7', '2', '5', '4');
INSERT INTO `location` VALUES (2068, '8', '1', '1', '7', '4');
INSERT INTO `location` VALUES (2071, '8', '1', '1', '17', '4');
INSERT INTO `location` VALUES (2072, '8', '1', '2', '17', '4');
INSERT INTO `location` VALUES (2073, '8', '1', '3', '17', '4');
INSERT INTO `location` VALUES (2074, '10', '4', '2', '10', '4');
INSERT INTO `location` VALUES (2075, '10', '4', '3', '10', '4');
INSERT INTO `location` VALUES (2076, '10', '4', '4', '10', '4');
INSERT INTO `location` VALUES (2077, '9', '7', '1', '2', '4');
INSERT INTO `location` VALUES (2078, '9', '7', '2', '2', '4');
INSERT INTO `location` VALUES (2079, '9', '7', '3', '2', '4');
INSERT INTO `location` VALUES (2080, '9', '7', '4', '2', '4');
INSERT INTO `location` VALUES (2081, '7', '7', '2', '6', '4');
INSERT INTO `location` VALUES (2082, '8', '1', '1', '8', '4');
INSERT INTO `location` VALUES (2083, '8', '1', '2', '1', '4');
INSERT INTO `location` VALUES (2084, '8', '1', '3', '1', '4');
INSERT INTO `location` VALUES (2088, '10', '4', '2', '9', '4');
INSERT INTO `location` VALUES (2089, '10', '4', '3', '9', '4');
INSERT INTO `location` VALUES (2090, '10', '4', '4', '9', '4');
INSERT INTO `location` VALUES (2091, '9', '7', '1', '10', '4');
INSERT INTO `location` VALUES (2092, '9', '7', '1', '3', '4');
INSERT INTO `location` VALUES (2093, '9', '7', '2', '3', '4');
INSERT INTO `location` VALUES (2094, '9', '7', '3', '3', '4');
INSERT INTO `location` VALUES (2096, '8', '1', '1', '9', '4');
INSERT INTO `location` VALUES (2097, '8', '1', '2', '2', '4');
INSERT INTO `location` VALUES (2098, '8', '1', '3', '2', '4');
INSERT INTO `location` VALUES (2099, '10', '4', '2', '8', '4');
INSERT INTO `location` VALUES (2100, '10', '4', '3', '8', '4');
INSERT INTO `location` VALUES (2101, '10', '4', '4', '8', '4');
INSERT INTO `location` VALUES (2102, '9', '7', '1', '11', '4');
INSERT INTO `location` VALUES (2103, '9', '7', '1', '4', '4');
INSERT INTO `location` VALUES (2104, '9', '7', '2', '4', '4');
INSERT INTO `location` VALUES (2105, '9', '7', '3', '4', '4');
INSERT INTO `location` VALUES (2106, '7', '7', '4', '3', '4');
INSERT INTO `location` VALUES (2107, '8', '1', '2', '3', '4');
INSERT INTO `location` VALUES (2108, '8', '1', '3', '3', '4');
INSERT INTO `location` VALUES (2109, '10', '4', '2', '7', '4');
INSERT INTO `location` VALUES (2110, '10', '4', '3', '7', '4');
INSERT INTO `location` VALUES (2111, '10', '4', '4', '7', '4');
INSERT INTO `location` VALUES (2112, '9', '7', '1', '12', '4');
INSERT INTO `location` VALUES (2113, '9', '7', '1', '5', '4');
INSERT INTO `location` VALUES (2114, '9', '7', '2', '5', '4');
INSERT INTO `location` VALUES (2115, '9', '7', '3', '5', '4');
INSERT INTO `location` VALUES (2116, '7', '7', '1', '1', '4');
INSERT INTO `location` VALUES (2117, '7', '7', '4', '4', '4');
INSERT INTO `location` VALUES (2118, '8', '1', '2', '4', '4');
INSERT INTO `location` VALUES (2119, '8', '1', '3', '4', '4');
INSERT INTO `location` VALUES (2120, '10', '4', '2', '6', '4');
INSERT INTO `location` VALUES (2121, '10', '4', '3', '6', '4');
INSERT INTO `location` VALUES (2122, '10', '4', '4', '6', '4');
INSERT INTO `location` VALUES (2123, '10', '2', '3', '10', '4');
INSERT INTO `location` VALUES (2124, '9', '7', '1', '6', '4');
INSERT INTO `location` VALUES (2125, '9', '7', '2', '6', '4');
INSERT INTO `location` VALUES (2126, '7', '7', '1', '2', '4');
INSERT INTO `location` VALUES (2127, '7', '7', '4', '5', '4');
INSERT INTO `location` VALUES (2128, '8', '1', '2', '5', '4');
INSERT INTO `location` VALUES (2129, '8', '1', '3', '5', '4');
INSERT INTO `location` VALUES (2130, '10', '4', '2', '5', '4');
INSERT INTO `location` VALUES (2131, '10', '4', '3', '5', '4');
INSERT INTO `location` VALUES (2132, '10', '4', '4', '5', '4');
INSERT INTO `location` VALUES (2133, '10', '2', '3', '11', '4');
INSERT INTO `location` VALUES (2134, '9', '7', '1', '7', '4');
INSERT INTO `location` VALUES (2135, '9', '7', '2', '7', '4');
INSERT INTO `location` VALUES (2136, '7', '7', '1', '3', '4');
INSERT INTO `location` VALUES (2137, '7', '7', '4', '6', '4');
INSERT INTO `location` VALUES (2138, '8', '1', '2', '6', '4');
INSERT INTO `location` VALUES (2139, '8', '1', '3', '6', '4');
INSERT INTO `location` VALUES (2140, '10', '4', '2', '4', '4');
INSERT INTO `location` VALUES (2141, '10', '4', '3', '4', '4');
INSERT INTO `location` VALUES (2142, '10', '4', '4', '4', '4');
INSERT INTO `location` VALUES (2143, '10', '2', '2', '12', '4');
INSERT INTO `location` VALUES (2144, '10', '2', '3', '12', '4');
INSERT INTO `location` VALUES (2145, '9', '7', '1', '8', '4');
INSERT INTO `location` VALUES (2146, '9', '7', '2', '8', '4');
INSERT INTO `location` VALUES (2147, '7', '7', '1', '4', '4');
INSERT INTO `location` VALUES (2148, '7', '7', '4', '7', '4');
INSERT INTO `location` VALUES (2149, '8', '1', '2', '7', '4');
INSERT INTO `location` VALUES (2150, '8', '1', '3', '7', '4');
INSERT INTO `location` VALUES (2151, '10', '4', '2', '3', '4');
INSERT INTO `location` VALUES (2152, '10', '4', '3', '3', '4');
INSERT INTO `location` VALUES (2153, '10', '4', '4', '3', '4');
INSERT INTO `location` VALUES (2154, '10', '2', '2', '13', '4');
INSERT INTO `location` VALUES (2155, '10', '2', '3', '13', '4');
INSERT INTO `location` VALUES (2156, '9', '7', '1', '9', '4');
INSERT INTO `location` VALUES (2157, '9', '7', '2', '9', '4');
INSERT INTO `location` VALUES (2158, '7', '7', '1', '5', '4');
INSERT INTO `location` VALUES (2159, '7', '7', '4', '8', '4');
INSERT INTO `location` VALUES (2160, '8', '1', '2', '8', '4');
INSERT INTO `location` VALUES (2161, '8', '1', '3', '8', '4');
INSERT INTO `location` VALUES (2162, '10', '4', '2', '2', '4');
INSERT INTO `location` VALUES (2163, '10', '4', '3', '2', '4');
INSERT INTO `location` VALUES (2164, '10', '4', '4', '2', '4');
INSERT INTO `location` VALUES (2165, '10', '2', '2', '14', '4');
INSERT INTO `location` VALUES (2168, '8', '1', '2', '9', '4');
INSERT INTO `location` VALUES (2169, '8', '1', '3', '9', '4');
INSERT INTO `location` VALUES (2170, '10', '4', '2', '1', '4');
INSERT INTO `location` VALUES (2171, '10', '4', '3', '1', '4');
INSERT INTO `location` VALUES (2172, '10', '4', '4', '1', '4');
INSERT INTO `location` VALUES (2173, '10', '2', '2', '15', '4');
INSERT INTO `location` VALUES (2174, '1', '1', '1', '1', '1');
INSERT INTO `location` VALUES (2175, '1', '1', '1', '2', '1');
INSERT INTO `location` VALUES (2176, '1', '1', '1', '3', '1');
INSERT INTO `location` VALUES (2177, '1', '1', '1', '4', '1');
INSERT INTO `location` VALUES (2178, '1', '1', '1', '5', '1');
INSERT INTO `location` VALUES (2179, '1', '1', '1', '6', '1');
INSERT INTO `location` VALUES (2180, '1', '1', '1', '7', '1');
INSERT INTO `location` VALUES (2181, '1', '1', '1', '8', '1');
INSERT INTO `location` VALUES (2182, '1', '1', '1', '9', '1');
INSERT INTO `location` VALUES (2183, '1', '1', '1', '10', '1');
INSERT INTO `location` VALUES (2184, '1', '1', '1', '11', '1');
INSERT INTO `location` VALUES (2185, '1', '1', '1', '12', '1');
INSERT INTO `location` VALUES (2186, '1', '1', '1', '13', '1');
INSERT INTO `location` VALUES (2187, '1', '1', '1', '14', '1');
INSERT INTO `location` VALUES (2188, '1', '1', '1', '15', '1');
INSERT INTO `location` VALUES (2189, '1', '1', '1', '16', '1');
INSERT INTO `location` VALUES (2190, '1', '1', '1', '17', '1');
INSERT INTO `location` VALUES (2191, '1', '1', '1', '18', '1');
INSERT INTO `location` VALUES (2192, '1', '1', '1', '19', '1');
INSERT INTO `location` VALUES (2193, '1', '1', '1', '20', '1');
INSERT INTO `location` VALUES (2194, '1', '1', '1', '21', '1');
INSERT INTO `location` VALUES (2195, '1', '1', '1', '22', '1');
INSERT INTO `location` VALUES (2196, '1', '1', '1', '23', '1');
INSERT INTO `location` VALUES (2197, '1', '1', '1', '24', '1');
INSERT INTO `location` VALUES (2198, '1', '1', '1', '25', '1');
INSERT INTO `location` VALUES (2199, '1', '1', '1', '26', '1');
INSERT INTO `location` VALUES (2200, '1', '1', '1', '27', '1');
INSERT INTO `location` VALUES (2201, '1', '1', '1', '28', '1');
INSERT INTO `location` VALUES (2202, '1', '1', '1', '29', '1');
INSERT INTO `location` VALUES (2203, '1', '1', '1', '30', '1');
INSERT INTO `location` VALUES (2204, '1', '1', '1', '31', '1');
INSERT INTO `location` VALUES (2205, '1', '1', '1', '32', '1');
INSERT INTO `location` VALUES (2206, '1', '1', '1', '33', '1');
INSERT INTO `location` VALUES (2207, '1', '1', '1', '34', '1');
INSERT INTO `location` VALUES (2208, '1', '1', '1', '35', '1');
INSERT INTO `location` VALUES (2209, '1', '1', '1', '36', '1');
INSERT INTO `location` VALUES (2210, '1', '1', '1', '37', '1');
INSERT INTO `location` VALUES (2211, '1', '1', '1', '38', '1');
INSERT INTO `location` VALUES (2212, '1', '1', '1', '39', '1');
INSERT INTO `location` VALUES (2213, '1', '1', '1', '40', '1');
INSERT INTO `location` VALUES (2214, '1', '1', '1', '41', '1');
INSERT INTO `location` VALUES (2215, '1', '1', '1', '42', '1');
INSERT INTO `location` VALUES (2216, '1', '1', '1', '43', '1');
INSERT INTO `location` VALUES (2217, '1', '1', '1', '44', '1');
INSERT INTO `location` VALUES (2218, '1', '1', '1', '45', '1');
INSERT INTO `location` VALUES (2219, '1', '1', '1', '46', '1');
INSERT INTO `location` VALUES (2220, '1', '1', '1', '47', '1');
INSERT INTO `location` VALUES (2221, '1', '1', '1', '48', '1');
INSERT INTO `location` VALUES (2222, '1', '1', '1', '49', '1');
INSERT INTO `location` VALUES (2223, '1', '1', '1', '50', '1');
INSERT INTO `location` VALUES (2224, '1', '1', '1', '51', '1');
INSERT INTO `location` VALUES (2225, '1', '1', '1', '52', '1');
INSERT INTO `location` VALUES (2226, '1', '1', '1', '53', '1');
INSERT INTO `location` VALUES (2227, '1', '1', '1', '54', '1');
INSERT INTO `location` VALUES (2228, '1', '1', '1', '55', '1');
INSERT INTO `location` VALUES (2229, '1', '1', '1', '56', '1');
INSERT INTO `location` VALUES (2230, '1', '1', '1', '57', '1');
INSERT INTO `location` VALUES (2231, '1', '1', '1', '58', '1');
INSERT INTO `location` VALUES (2232, '1', '1', '1', '59', '1');
INSERT INTO `location` VALUES (2233, '1', '1', '1', '60', '1');
INSERT INTO `location` VALUES (2234, '1', '1', '1', '61', '1');
INSERT INTO `location` VALUES (2235, '1', '1', '1', '62', '1');
INSERT INTO `location` VALUES (2236, '1', '1', '1', '63', '1');
INSERT INTO `location` VALUES (2237, '1', '1', '1', '64', '1');
INSERT INTO `location` VALUES (2238, '1', '1', '1', '65', '1');
INSERT INTO `location` VALUES (2239, '1', '1', '1', '66', '1');
INSERT INTO `location` VALUES (2240, '1', '1', '1', '67', '1');
INSERT INTO `location` VALUES (2241, '1', '1', '1', '68', '1');
INSERT INTO `location` VALUES (2242, '1', '1', '1', '69', '1');
INSERT INTO `location` VALUES (2243, '1', '1', '1', '70', '1');
INSERT INTO `location` VALUES (2244, '1', '1', '1', '71', '1');
INSERT INTO `location` VALUES (2245, '1', '1', '1', '72', '1');
INSERT INTO `location` VALUES (2246, '1', '1', '1', '73', '1');
INSERT INTO `location` VALUES (2247, '1', '1', '1', '74', '1');
INSERT INTO `location` VALUES (2248, '1', '1', '1', '75', '1');
INSERT INTO `location` VALUES (2249, '1', '1', '1', '76', '1');
INSERT INTO `location` VALUES (2250, '1', '1', '1', '77', '1');
INSERT INTO `location` VALUES (2251, '1', '1', '1', '78', '1');
INSERT INTO `location` VALUES (2252, '1', '1', '1', '79', '1');
INSERT INTO `location` VALUES (2253, '1', '1', '1', '80', '1');
INSERT INTO `location` VALUES (2254, '1', '1', '1', '81', '1');
INSERT INTO `location` VALUES (2255, '1', '1', '1', '82', '1');
INSERT INTO `location` VALUES (2256, '1', '1', '1', '83', '1');
INSERT INTO `location` VALUES (2257, '1', '1', '1', '84', '1');
INSERT INTO `location` VALUES (2258, '1', '1', '1', '85', '1');
INSERT INTO `location` VALUES (2259, '1', '1', '1', '86', '1');
INSERT INTO `location` VALUES (2260, '1', '1', '1', '87', '1');
INSERT INTO `location` VALUES (2261, '1', '1', '1', '88', '1');
INSERT INTO `location` VALUES (2262, '1', '1', '1', '89', '1');
INSERT INTO `location` VALUES (2263, '1', '1', '1', '90', '1');
INSERT INTO `location` VALUES (2264, '1', '1', '1', '91', '1');
INSERT INTO `location` VALUES (2265, '1', '1', '1', '92', '1');
INSERT INTO `location` VALUES (2266, '1', '1', '1', '93', '1');
INSERT INTO `location` VALUES (2267, '1', '1', '1', '94', '1');
INSERT INTO `location` VALUES (2268, '1', '1', '1', '95', '1');
INSERT INTO `location` VALUES (2269, '1', '1', '1', '96', '1');
INSERT INTO `location` VALUES (2270, '1', '1', '1', '97', '1');
INSERT INTO `location` VALUES (2271, '1', '1', '1', '98', '1');
INSERT INTO `location` VALUES (2272, '1', '1', '1', '99', '1');
INSERT INTO `location` VALUES (2273, '1', '1', '1', '100', '1');
INSERT INTO `location` VALUES (2274, '1', '1', '1', '101', '1');
INSERT INTO `location` VALUES (2275, '1', '1', '1', '102', '1');
INSERT INTO `location` VALUES (2276, '1', '1', '1', '103', '1');
INSERT INTO `location` VALUES (2277, '1', '1', '1', '104', '1');
INSERT INTO `location` VALUES (2278, '1', '1', '1', '105', '1');
INSERT INTO `location` VALUES (2279, '1', '1', '1', '106', '1');
INSERT INTO `location` VALUES (2280, '1', '1', '1', '107', '1');
INSERT INTO `location` VALUES (2281, '1', '1', '1', '108', '1');
INSERT INTO `location` VALUES (2282, '1', '1', '1', '109', '1');
INSERT INTO `location` VALUES (2283, '1', '1', '1', '110', '1');
INSERT INTO `location` VALUES (2284, '1', '1', '1', '111', '1');
INSERT INTO `location` VALUES (2285, '1', '1', '1', '112', '1');
INSERT INTO `location` VALUES (2286, '1', '1', '1', '113', '1');
INSERT INTO `location` VALUES (2287, '1', '1', '1', '114', '1');
INSERT INTO `location` VALUES (2288, '1', '1', '1', '115', '1');
INSERT INTO `location` VALUES (2289, '1', '1', '1', '116', '1');
INSERT INTO `location` VALUES (2290, '1', '1', '1', '117', '1');
INSERT INTO `location` VALUES (2291, '1', '1', '1', '118', '1');
INSERT INTO `location` VALUES (2292, '1', '1', '1', '119', '1');
INSERT INTO `location` VALUES (2293, '1', '1', '1', '120', '1');
INSERT INTO `location` VALUES (2294, '1', '1', '1', '121', '1');
INSERT INTO `location` VALUES (2295, '1', '1', '1', '122', '1');
INSERT INTO `location` VALUES (2296, '1', '1', '1', '123', '1');
INSERT INTO `location` VALUES (2297, '1', '1', '1', '124', '1');
INSERT INTO `location` VALUES (2298, '1', '1', '1', '125', '1');
INSERT INTO `location` VALUES (2299, '1', '1', '1', '126', '1');
INSERT INTO `location` VALUES (2300, '1', '1', '1', '127', '1');
INSERT INTO `location` VALUES (2301, '1', '1', '1', '128', '1');
INSERT INTO `location` VALUES (2302, '1', '1', '1', '129', '1');
INSERT INTO `location` VALUES (2303, '1', '1', '1', '130', '1');
INSERT INTO `location` VALUES (2304, '1', '1', '1', '131', '1');
INSERT INTO `location` VALUES (2305, '1', '1', '1', '132', '1');
INSERT INTO `location` VALUES (2306, '1', '1', '1', '133', '1');
INSERT INTO `location` VALUES (2307, '1', '1', '1', '134', '1');
INSERT INTO `location` VALUES (2308, '1', '1', '1', '135', '1');
INSERT INTO `location` VALUES (2309, '1', '1', '1', '136', '1');
INSERT INTO `location` VALUES (2310, '1', '1', '1', '137', '1');
INSERT INTO `location` VALUES (2311, '1', '1', '1', '138', '1');
INSERT INTO `location` VALUES (2312, '1', '1', '1', '139', '1');
INSERT INTO `location` VALUES (2313, '1', '1', '1', '140', '1');
INSERT INTO `location` VALUES (2314, '1', '1', '1', '141', '1');
INSERT INTO `location` VALUES (2315, '1', '1', '1', '142', '1');
INSERT INTO `location` VALUES (2316, '1', '1', '1', '143', '1');
INSERT INTO `location` VALUES (2317, '1', '1', '1', '144', '1');
INSERT INTO `location` VALUES (2318, '1', '1', '1', '145', '1');
INSERT INTO `location` VALUES (2319, '1', '1', '1', '146', '1');
INSERT INTO `location` VALUES (2320, '1', '1', '1', '147', '1');
INSERT INTO `location` VALUES (2321, '1', '1', '1', '148', '1');
INSERT INTO `location` VALUES (2322, '1', '1', '1', '149', '1');
INSERT INTO `location` VALUES (2323, '1', '1', '1', '150', '1');
INSERT INTO `location` VALUES (2324, '1', '1', '1', '151', '1');
INSERT INTO `location` VALUES (2325, '1', '1', '1', '152', '1');
INSERT INTO `location` VALUES (2326, '1', '1', '1', '153', '1');
INSERT INTO `location` VALUES (2327, '1', '1', '1', '154', '1');
INSERT INTO `location` VALUES (2328, '1', '1', '1', '155', '1');
INSERT INTO `location` VALUES (2329, '1', '1', '1', '156', '1');
INSERT INTO `location` VALUES (2330, '1', '1', '1', '157', '1');
INSERT INTO `location` VALUES (2331, '1', '1', '1', '158', '1');
INSERT INTO `location` VALUES (2332, '1', '1', '1', '159', '1');
INSERT INTO `location` VALUES (2333, '1', '1', '1', '160', '1');
INSERT INTO `location` VALUES (2334, '1', '1', '1', '161', '1');
INSERT INTO `location` VALUES (2335, '1', '1', '1', '162', '1');
INSERT INTO `location` VALUES (2336, '1', '1', '1', '163', '1');
INSERT INTO `location` VALUES (2337, '1', '1', '1', '164', '1');
INSERT INTO `location` VALUES (2338, '1', '1', '1', '165', '1');
INSERT INTO `location` VALUES (2339, '1', '1', '1', '166', '1');
INSERT INTO `location` VALUES (2340, '1', '1', '1', '167', '1');
INSERT INTO `location` VALUES (2341, '1', '1', '1', '168', '1');
INSERT INTO `location` VALUES (2342, '1', '1', '1', '169', '1');
INSERT INTO `location` VALUES (2343, '1', '1', '1', '170', '1');
INSERT INTO `location` VALUES (2344, '1', '1', '1', '171', '1');
INSERT INTO `location` VALUES (2345, '1', '1', '1', '172', '1');
INSERT INTO `location` VALUES (2346, '1', '1', '1', '173', '1');
INSERT INTO `location` VALUES (2347, '1', '1', '1', '174', '1');
INSERT INTO `location` VALUES (2348, '1', '1', '1', '175', '1');
INSERT INTO `location` VALUES (2349, '1', '1', '1', '176', '1');
INSERT INTO `location` VALUES (2350, '1', '1', '1', '177', '1');
INSERT INTO `location` VALUES (2351, '1', '1', '1', '178', '1');
INSERT INTO `location` VALUES (2352, '1', '1', '1', '179', '1');
INSERT INTO `location` VALUES (2353, '1', '1', '1', '180', '1');
INSERT INTO `location` VALUES (2354, '1', '1', '1', '181', '1');
INSERT INTO `location` VALUES (2355, '1', '1', '1', '182', '1');
INSERT INTO `location` VALUES (2356, '1', '1', '1', '183', '1');
INSERT INTO `location` VALUES (2357, '1', '1', '1', '184', '1');
INSERT INTO `location` VALUES (2358, '1', '1', '1', '185', '1');
INSERT INTO `location` VALUES (2359, '1', '1', '1', '186', '1');
INSERT INTO `location` VALUES (2360, '1', '1', '1', '187', '1');
INSERT INTO `location` VALUES (2361, '1', '1', '1', '188', '1');
INSERT INTO `location` VALUES (2362, '1', '1', '1', '189', '1');
INSERT INTO `location` VALUES (2363, '1', '1', '1', '190', '1');
INSERT INTO `location` VALUES (2364, '1', '1', '1', '191', '1');
INSERT INTO `location` VALUES (2365, '1', '1', '1', '192', '1');
INSERT INTO `location` VALUES (2366, '1', '1', '1', '193', '1');
INSERT INTO `location` VALUES (2367, '1', '1', '1', '194', '1');
INSERT INTO `location` VALUES (2368, '1', '1', '1', '195', '1');
INSERT INTO `location` VALUES (2369, '1', '1', '1', '196', '1');
INSERT INTO `location` VALUES (2370, '1', '1', '1', '197', '1');
INSERT INTO `location` VALUES (2371, '1', '1', '1', '198', '1');
INSERT INTO `location` VALUES (2372, '1', '1', '1', '199', '1');
INSERT INTO `location` VALUES (2373, '1', '1', '1', '200', '1');
INSERT INTO `location` VALUES (2374, '1', '1', '1', '201', '1');
INSERT INTO `location` VALUES (2375, '1', '1', '1', '202', '1');
INSERT INTO `location` VALUES (2376, '1', '1', '1', '203', '1');
INSERT INTO `location` VALUES (2377, '1', '1', '1', '204', '1');
INSERT INTO `location` VALUES (2378, '1', '1', '1', '205', '1');
INSERT INTO `location` VALUES (2379, '1', '1', '1', '206', '1');
INSERT INTO `location` VALUES (2380, '1', '1', '1', '207', '1');
INSERT INTO `location` VALUES (2381, '1', '1', '1', '208', '1');
INSERT INTO `location` VALUES (2382, '1', '1', '1', '209', '1');
INSERT INTO `location` VALUES (2383, '1', '1', '1', '210', '1');
INSERT INTO `location` VALUES (2384, '1', '1', '1', '211', '1');
INSERT INTO `location` VALUES (2385, '1', '1', '1', '212', '1');
INSERT INTO `location` VALUES (2386, '1', '1', '1', '213', '1');
INSERT INTO `location` VALUES (2387, '1', '1', '1', '214', '1');
INSERT INTO `location` VALUES (2388, '1', '1', '1', '215', '1');
INSERT INTO `location` VALUES (2389, '1', '1', '1', '216', '1');
INSERT INTO `location` VALUES (2390, '1', '1', '1', '217', '1');
INSERT INTO `location` VALUES (2391, '1', '1', '1', '218', '1');
INSERT INTO `location` VALUES (2392, '1', '1', '1', '219', '1');
INSERT INTO `location` VALUES (2393, '1', '1', '1', '220', '1');
INSERT INTO `location` VALUES (2394, '1', '1', '1', '221', '1');
INSERT INTO `location` VALUES (2395, '1', '1', '1', '222', '1');
INSERT INTO `location` VALUES (2396, '1', '1', '1', '223', '1');
INSERT INTO `location` VALUES (2397, '1', '1', '1', '224', '1');
INSERT INTO `location` VALUES (2398, '1', '1', '1', '225', '1');
INSERT INTO `location` VALUES (2399, '1', '1', '1', '226', '1');
INSERT INTO `location` VALUES (2400, '1', '1', '1', '227', '1');
INSERT INTO `location` VALUES (2401, '1', '1', '1', '228', '1');
INSERT INTO `location` VALUES (2402, '1', '1', '1', '229', '1');
INSERT INTO `location` VALUES (2403, '1', '1', '1', '230', '1');
INSERT INTO `location` VALUES (2404, '1', '1', '1', '231', '1');
INSERT INTO `location` VALUES (2405, '1', '1', '1', '232', '1');
INSERT INTO `location` VALUES (2406, '1', '1', '1', '233', '1');
INSERT INTO `location` VALUES (2407, '1', '1', '1', '234', '1');
INSERT INTO `location` VALUES (2408, '1', '1', '1', '235', '1');
INSERT INTO `location` VALUES (2409, '1', '1', '1', '236', '1');
INSERT INTO `location` VALUES (2410, '1', '1', '1', '237', '1');
INSERT INTO `location` VALUES (2411, '1', '1', '1', '238', '1');
INSERT INTO `location` VALUES (2412, '1', '1', '1', '239', '1');
INSERT INTO `location` VALUES (2413, '1', '1', '1', '240', '1');
INSERT INTO `location` VALUES (2414, '1', '1', '1', '241', '1');
INSERT INTO `location` VALUES (2415, '1', '1', '1', '242', '1');
INSERT INTO `location` VALUES (2416, '1', '1', '1', '243', '1');
INSERT INTO `location` VALUES (2417, '1', '1', '1', '244', '1');
INSERT INTO `location` VALUES (2418, '1', '1', '1', '245', '1');
INSERT INTO `location` VALUES (2419, '1', '1', '1', '246', '1');
INSERT INTO `location` VALUES (2420, '1', '1', '1', '247', '1');
INSERT INTO `location` VALUES (2421, '1', '1', '1', '248', '1');
INSERT INTO `location` VALUES (2422, '1', '1', '1', '249', '1');
INSERT INTO `location` VALUES (2423, '1', '1', '1', '250', '1');
INSERT INTO `location` VALUES (2424, '1', '1', '1', '251', '1');
INSERT INTO `location` VALUES (2425, '1', '1', '1', '252', '1');
INSERT INTO `location` VALUES (2426, '1', '1', '1', '253', '1');
INSERT INTO `location` VALUES (2427, '1', '1', '1', '254', '1');
INSERT INTO `location` VALUES (2428, '1', '1', '1', '255', '1');
INSERT INTO `location` VALUES (2429, '1', '1', '1', '256', '1');
INSERT INTO `location` VALUES (2430, '1', '1', '1', '257', '1');
INSERT INTO `location` VALUES (2431, '1', '1', '1', '258', '1');
INSERT INTO `location` VALUES (2432, '1', '1', '1', '259', '1');
INSERT INTO `location` VALUES (2433, '1', '1', '1', '260', '1');
INSERT INTO `location` VALUES (2434, '1', '1', '1', '261', '1');
INSERT INTO `location` VALUES (2435, '1', '1', '1', '262', '1');
INSERT INTO `location` VALUES (2436, '1', '1', '1', '263', '1');
INSERT INTO `location` VALUES (2437, '1', '1', '1', '264', '1');
INSERT INTO `location` VALUES (2438, '1', '1', '1', '265', '1');
INSERT INTO `location` VALUES (2439, '1', '1', '1', '266', '1');
INSERT INTO `location` VALUES (2440, '1', '1', '1', '267', '1');
INSERT INTO `location` VALUES (2441, '1', '1', '1', '268', '1');
INSERT INTO `location` VALUES (2442, '1', '1', '1', '269', '1');
INSERT INTO `location` VALUES (2443, '1', '1', '1', '270', '1');
INSERT INTO `location` VALUES (2444, '1', '1', '1', '271', '1');
INSERT INTO `location` VALUES (2445, '1', '1', '1', '272', '1');
INSERT INTO `location` VALUES (2446, '1', '1', '1', '273', '1');
INSERT INTO `location` VALUES (2447, '1', '1', '1', '274', '1');
INSERT INTO `location` VALUES (2448, '1', '1', '1', '275', '1');
INSERT INTO `location` VALUES (2449, '1', '1', '1', '276', '1');
INSERT INTO `location` VALUES (2450, '1', '1', '1', '277', '1');
INSERT INTO `location` VALUES (2451, '1', '1', '1', '278', '1');
INSERT INTO `location` VALUES (2452, '1', '1', '1', '279', '1');
INSERT INTO `location` VALUES (2453, '1', '1', '1', '280', '1');
INSERT INTO `location` VALUES (2454, '1', '1', '1', '281', '1');
INSERT INTO `location` VALUES (2455, '1', '1', '1', '282', '1');
INSERT INTO `location` VALUES (2456, '1', '1', '1', '283', '1');
INSERT INTO `location` VALUES (2457, '1', '1', '1', '284', '1');
INSERT INTO `location` VALUES (2458, '1', '1', '1', '285', '1');
INSERT INTO `location` VALUES (2459, '1', '1', '1', '286', '1');
INSERT INTO `location` VALUES (2460, '1', '1', '1', '287', '1');
INSERT INTO `location` VALUES (2461, '1', '1', '1', '288', '1');
INSERT INTO `location` VALUES (2462, '1', '1', '1', '289', '1');
INSERT INTO `location` VALUES (2463, '1', '1', '1', '290', '1');
INSERT INTO `location` VALUES (2464, '1', '1', '1', '291', '1');
INSERT INTO `location` VALUES (2465, '1', '1', '1', '292', '1');
INSERT INTO `location` VALUES (2466, '1', '1', '1', '293', '1');
INSERT INTO `location` VALUES (2467, '1', '1', '1', '294', '1');
INSERT INTO `location` VALUES (2468, '1', '1', '1', '295', '1');
INSERT INTO `location` VALUES (2469, 'Side', '2', '1', '22', '2');
INSERT INTO `location` VALUES (2470, 'Side', '2', '1', '21', '2');
INSERT INTO `location` VALUES (2471, 'Side', '2', '1', '20', '2');
INSERT INTO `location` VALUES (2472, 'Side', '2', '1', '19', '2');
INSERT INTO `location` VALUES (2473, 'Side', '2', '1', '18', '2');
INSERT INTO `location` VALUES (2474, 'Side', '2', '1', '17', '2');
INSERT INTO `location` VALUES (2475, 'Side', '2', '1', '16', '2');
INSERT INTO `location` VALUES (2476, 'Side', '2', '1', '15', '2');
INSERT INTO `location` VALUES (2477, 'Side', '2', '1', '14', '2');
INSERT INTO `location` VALUES (2478, 'Side', '2', '1', '13', '2');
INSERT INTO `location` VALUES (2479, 'Side', '2', '1', '12', '2');
INSERT INTO `location` VALUES (2480, 'Side', '2', '1', '11', '2');
INSERT INTO `location` VALUES (2481, 'Side', '2', '1', '10', '2');
INSERT INTO `location` VALUES (2482, 'Side', '2', '1', '9', '2');
INSERT INTO `location` VALUES (2483, 'Side', '2', '1', '8', '2');
INSERT INTO `location` VALUES (2484, 'Side', '2', '1', '7', '2');
INSERT INTO `location` VALUES (2485, 'Side', '2', '1', '6', '2');
INSERT INTO `location` VALUES (2486, 'Side', '2', '1', '5', '2');
INSERT INTO `location` VALUES (2487, 'Side', '2', '1', '4', '2');
INSERT INTO `location` VALUES (2488, 'Side', '2', '1', '3', '2');
INSERT INTO `location` VALUES (2489, 'Side', '2', '1', '2', '2');
INSERT INTO `location` VALUES (2490, 'Side', '2', '1', '1', '2');
INSERT INTO `location` VALUES (2491, 'Front', '1', '1', '89', '2');
INSERT INTO `location` VALUES (2492, 'Front', '1', '1', '90', '2');
INSERT INTO `location` VALUES (2493, 'Front', '1', '1', '91', '2');
INSERT INTO `location` VALUES (2494, 'Front', '2', '1', '73', '2');
INSERT INTO `location` VALUES (2495, 'Front', '2', '1', '74', '2');
INSERT INTO `location` VALUES (2496, 'Front', '2', '1', '75', '2');
INSERT INTO `location` VALUES (2497, 'Front', '2', '1', '76', '2');
INSERT INTO `location` VALUES (2498, 'Front', '2', '1', '77', '2');
INSERT INTO `location` VALUES (2499, 'Front', '2', '1', '78', '2');
INSERT INTO `location` VALUES (2500, 'Front', '2', '1', '79', '2');
INSERT INTO `location` VALUES (2501, 'Front', '2', '1', '80', '2');
INSERT INTO `location` VALUES (2502, 'Front', '2', '1', '81', '2');
INSERT INTO `location` VALUES (2503, 'Front', '2', '1', '82', '2');
INSERT INTO `location` VALUES (2504, 'Front', '2', '1', '83', '2');
INSERT INTO `location` VALUES (2505, 'Front', '2', '1', '84', '2');
INSERT INTO `location` VALUES (2506, 'Front', '2', '1', '85', '2');
INSERT INTO `location` VALUES (2507, 'Front', '2', '1', '86', '2');
INSERT INTO `location` VALUES (2508, 'Front', '2', '1', '87', '2');
INSERT INTO `location` VALUES (2509, 'Front', '2', '1', '88', '2');
INSERT INTO `location` VALUES (2510, 'Back', '1', '1', '51', '2');
INSERT INTO `location` VALUES (2514, 'Back', '1', '1', '50', '2');
INSERT INTO `location` VALUES (2516, 'Back', '1', '1', '45', '2');
INSERT INTO `location` VALUES (2517, 'Back', '1', '1', '44', '2');
INSERT INTO `location` VALUES (2518, 'Back', '1', '1', '48', '2');
INSERT INTO `location` VALUES (2522, 'Back', '1', '1', '43', '2');
INSERT INTO `location` VALUES (2523, 'Back', '1', '1', '47', '2');
INSERT INTO `location` VALUES (2525, 'Back', '1', '1', '42', '2');
INSERT INTO `location` VALUES (2526, 'Back', '1', '1', '41', '2');
INSERT INTO `location` VALUES (2527, 'Back', '1', '1', '40', '2');
INSERT INTO `location` VALUES (2528, 'Back', '1', '1', '39', '2');
INSERT INTO `location` VALUES (2529, 'Back', '1', '1', '38', '2');
INSERT INTO `location` VALUES (2530, 'Back', '1', '1', '37', '2');
INSERT INTO `location` VALUES (2531, 'Back', '1', '1', '36', '2');
INSERT INTO `location` VALUES (2532, 'Back', '1', '1', '35', '2');
INSERT INTO `location` VALUES (2533, 'Back', '1', '1', '34', '2');
INSERT INTO `location` VALUES (2534, 'Back', '1', '1', '33', '2');
INSERT INTO `location` VALUES (2535, 'Back', '1', '1', '46', '2');
INSERT INTO `location` VALUES (2536, 'Back', '1', '1', '32', '2');
INSERT INTO `location` VALUES (2537, 'Back', '1', '1', '31', '2');
INSERT INTO `location` VALUES (2538, 'Back', '1', '1', '30', '2');
INSERT INTO `location` VALUES (2539, 'Back', '1', '1', '29', '2');
INSERT INTO `location` VALUES (2540, 'Back', '1', '1', '28', '2');
INSERT INTO `location` VALUES (2541, 'Back', '1', '1', '27', '2');
INSERT INTO `location` VALUES (2542, 'Back', '1', '1', '26', '2');
INSERT INTO `location` VALUES (2543, 'Back', '1', '1', '25', '2');
INSERT INTO `location` VALUES (2544, 'Back', '1', '1', '24', '2');
INSERT INTO `location` VALUES (2547, 'Front', '1', '1', '92', '2');
INSERT INTO `location` VALUES (2548, 'Front', '1', '1', '93', '2');
INSERT INTO `location` VALUES (2549, 'Front', '1', '1', '94', '2');
INSERT INTO `location` VALUES (2550, 'Front', '1', '1', '95', '2');
INSERT INTO `location` VALUES (2551, 'Front', '1', '1', '96', '2');
INSERT INTO `location` VALUES (2552, 'Front', '1', '1', '97', '2');
INSERT INTO `location` VALUES (2553, 'Front', '1', '1', '98', '2');
INSERT INTO `location` VALUES (2554, 'Front', '1', '1', '99', '2');
INSERT INTO `location` VALUES (2555, 'Front', '1', '1', '100', '2');
INSERT INTO `location` VALUES (2556, 'Front', '1', '1', '101', '2');
INSERT INTO `location` VALUES (2557, 'Front', '1', '1', '102', '2');
INSERT INTO `location` VALUES (2558, 'Front', '1', '1', '103', '2');
INSERT INTO `location` VALUES (2575, 'Side', '1', '1', '52', '2');
INSERT INTO `location` VALUES (2576, 'Side', '1', '1', '53', '2');
INSERT INTO `location` VALUES (2577, 'Side', '1', '1', '54', '2');
INSERT INTO `location` VALUES (2578, 'Side', '1', '1', '55', '2');
INSERT INTO `location` VALUES (2579, 'Side', '1', '1', '56', '2');
INSERT INTO `location` VALUES (2580, 'Side', '1', '1', '57', '2');
INSERT INTO `location` VALUES (2581, 'Side', '1', '1', '58', '2');
INSERT INTO `location` VALUES (2582, 'Side', '1', '1', '59', '2');
INSERT INTO `location` VALUES (2583, 'Side', '1', '1', '60', '2');
INSERT INTO `location` VALUES (2584, 'Side', '1', '1', '61', '2');
INSERT INTO `location` VALUES (2585, 'Side', '1', '1', '62', '2');
INSERT INTO `location` VALUES (2586, 'Side', '1', '1', '63', '2');
INSERT INTO `location` VALUES (2587, 'Side', '1', '1', '64', '2');
INSERT INTO `location` VALUES (2588, 'Side', '1', '1', '65', '2');
INSERT INTO `location` VALUES (2589, 'Side', '1', '1', '66', '2');
INSERT INTO `location` VALUES (2590, 'Side', '1', '1', '67', '2');
INSERT INTO `location` VALUES (2591, 'Side', '1', '1', '68', '2');
INSERT INTO `location` VALUES (2592, 'Side', '1', '1', '69', '2');
INSERT INTO `location` VALUES (2593, 'Side', '1', '1', '70', '2');
INSERT INTO `location` VALUES (2594, 'Side', '1', '1', '71', '2');
INSERT INTO `location` VALUES (2595, 'Side', '1', '1', '72', '2');
INSERT INTO `location` VALUES (2596, 'Back', '1', '1', '49', '2');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------

-- ----------------------------
-- Table structure for package
-- ----------------------------
DROP TABLE IF EXISTS `package`;
CREATE TABLE `package`  (
  `p_id` int NOT NULL,
  `package_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  PRIMARY KEY (`p_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of package
-- ----------------------------
INSERT INTO `package` VALUES (1, 'Apartment', 1400.00, 'Apartment', NULL);
INSERT INTO `package` VALUES (2, 'Family Lawn Lot', 100000.00, 'Family Lawn Lot', NULL);
INSERT INTO `package` VALUES (3, 'Bone Niche', 8000.00, 'Bone Niche', NULL);
INSERT INTO `package` VALUES (4, 'Private', 20000.00, 'Private', NULL);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `Payment_ID` int NOT NULL AUTO_INCREMENT,
  `Client_ID` int NULL DEFAULT NULL,
  `Reservation_ID` int NULL DEFAULT NULL,
  `total_Paid` int NULL DEFAULT NULL,
  `total_Amount` int NULL DEFAULT NULL,
  `Payment_Status` int NULL DEFAULT NULL,
  `Payment_Date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Payment_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (3, 55, 40, 1400, 1400, 0, '2025-04-11 10:25:16');
INSERT INTO `payment` VALUES (4, 55, 41, 8000, 8000, 1, NULL);
INSERT INTO `payment` VALUES (5, 55, 42, 1400, 1400, 0, '2025-04-15 10:49:02');
INSERT INTO `payment` VALUES (6, 56, 43, 1400, 1400, 0, '2025-04-11 10:32:20');
INSERT INTO `payment` VALUES (7, 56, 44, 8000, 8000, 1, NULL);
INSERT INTO `payment` VALUES (8, 57, 45, 4500, 8000, 0, NULL);
INSERT INTO `payment` VALUES (9, 58, 46, 5000, 20000, 0, NULL);
INSERT INTO `payment` VALUES (10, 58, 47, 1400, 1400, 1, NULL);
INSERT INTO `payment` VALUES (11, 57, 48, 25000, 100000, 0, NULL);
INSERT INTO `payment` VALUES (12, 68, 49, 4000, 20000, 0, NULL);
INSERT INTO `payment` VALUES (13, 59, 50, 600, 1400, 0, '2025-04-11 10:33:03');
INSERT INTO `payment` VALUES (14, 58, 51, 5000, 20000, 0, NULL);
INSERT INTO `payment` VALUES (15, 55, 52, 100000, 100000, 0, '2025-04-28 21:53:18');
INSERT INTO `payment` VALUES (16, 58, 53, 30000, 200000, 0, NULL);
INSERT INTO `payment` VALUES (17, 70, 54, 50000, 100000, 0, NULL);
INSERT INTO `payment` VALUES (18, 68, 55, 30000, 100000, 0, NULL);
INSERT INTO `payment` VALUES (19, 70, 56, 7000, 8000, 0, NULL);
INSERT INTO `payment` VALUES (20, 73, 57, 1500, 8000, 0, '2025-04-28 22:10:00');
INSERT INTO `payment` VALUES (21, 74, 58, 1000, 1400, 0, NULL);
INSERT INTO `payment` VALUES (22, NULL, 60, NULL, 100000, 0, '2025-04-29 08:21:17');
INSERT INTO `payment` VALUES (23, 74, 61, 50000, 100000, 0, '2025-04-29 08:37:53');

-- ----------------------------
-- Table structure for plot_reservation
-- ----------------------------
DROP TABLE IF EXISTS `plot_reservation`;
CREATE TABLE `plot_reservation`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `reservation_id` int NOT NULL,
  `plot_id` int NOT NULL,
  `level` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reservation_id`(`reservation_id` ASC) USING BTREE,
  INDEX `plot_id`(`plot_id` ASC) USING BTREE,
  CONSTRAINT `plot_reservation_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`Reservation_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `plot_reservation_ibfk_2` FOREIGN KEY (`plot_id`) REFERENCES `location` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plot_reservation
-- ----------------------------
INSERT INTO `plot_reservation` VALUES (29, 38, 1, 1);
INSERT INTO `plot_reservation` VALUES (30, 39, 407, 1);
INSERT INTO `plot_reservation` VALUES (31, 40, 2174, 2);
INSERT INTO `plot_reservation` VALUES (32, 41, 409, 1);
INSERT INTO `plot_reservation` VALUES (33, 42, 2174, 1);
INSERT INTO `plot_reservation` VALUES (34, 43, 2178, 2);
INSERT INTO `plot_reservation` VALUES (35, 44, 411, 1);
INSERT INTO `plot_reservation` VALUES (36, 45, 19, 1);
INSERT INTO `plot_reservation` VALUES (37, 46, 2044, 0);
INSERT INTO `plot_reservation` VALUES (38, 47, 2323, 1);
INSERT INTO `plot_reservation` VALUES (39, 48, 2469, 0);
INSERT INTO `plot_reservation` VALUES (40, 49, 1257, 0);
INSERT INTO `plot_reservation` VALUES (41, 50, 2175, 4);
INSERT INTO `plot_reservation` VALUES (42, 51, 2155, 0);
INSERT INTO `plot_reservation` VALUES (43, 52, 2490, 0);
INSERT INTO `plot_reservation` VALUES (44, 53, 2469, 0);
INSERT INTO `plot_reservation` VALUES (45, 53, 2470, 0);
INSERT INTO `plot_reservation` VALUES (46, 54, 2476, 0);
INSERT INTO `plot_reservation` VALUES (47, 55, 2483, 0);
INSERT INTO `plot_reservation` VALUES (48, 56, 407, 1);
INSERT INTO `plot_reservation` VALUES (49, 57, 411, 3);
INSERT INTO `plot_reservation` VALUES (50, 58, 2272, 1);
INSERT INTO `plot_reservation` VALUES (51, 60, 2510, 0);
INSERT INTO `plot_reservation` VALUES (52, 61, 2490, 0);

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation`  (
  `Reservation_ID` int NOT NULL AUTO_INCREMENT,
  `Client_ID` int NULL DEFAULT NULL,
  `p_id` int NULL DEFAULT NULL,
  `Reservation_Date` datetime NULL DEFAULT NULL,
  `Status` int NULL DEFAULT NULL,
  `Quantity` int NULL DEFAULT NULL,
  PRIMARY KEY (`Reservation_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES (38, 55, 3, '2024-12-13 00:10:50', 0, 1);
INSERT INTO `reservation` VALUES (39, 55, 3, '2024-12-13 00:23:01', 0, 1);
INSERT INTO `reservation` VALUES (40, 55, 1, '2024-12-13 00:28:15', 1, 1);
INSERT INTO `reservation` VALUES (41, 55, 3, '2024-12-13 07:55:37', 0, 1);
INSERT INTO `reservation` VALUES (42, 55, 1, '2024-12-13 08:00:39', 1, 1);
INSERT INTO `reservation` VALUES (43, 56, 1, '2024-12-13 15:58:27', 0, 1);
INSERT INTO `reservation` VALUES (44, 56, 3, '2024-12-13 15:59:50', 0, 1);
INSERT INTO `reservation` VALUES (45, 57, 3, '2024-12-13 16:00:59', 1, 1);
INSERT INTO `reservation` VALUES (46, 58, 4, '2024-12-13 16:02:34', 0, 1);
INSERT INTO `reservation` VALUES (47, 58, 1, '2024-12-13 16:03:49', 0, 1);
INSERT INTO `reservation` VALUES (48, 57, 2, '2024-12-13 16:05:00', 0, 1);
INSERT INTO `reservation` VALUES (49, 68, 4, '2025-03-24 22:04:14', 1, 1);
INSERT INTO `reservation` VALUES (50, 59, 1, '2025-04-05 17:07:25', 0, 1);
INSERT INTO `reservation` VALUES (51, 58, 4, '2025-04-05 23:36:30', 1, 1);
INSERT INTO `reservation` VALUES (52, 55, 2, '2025-04-27 14:22:21', 0, 1);
INSERT INTO `reservation` VALUES (53, 58, 2, '2025-04-27 17:07:55', 0, 2);
INSERT INTO `reservation` VALUES (54, 70, 2, '2025-04-27 18:13:57', 0, 1);
INSERT INTO `reservation` VALUES (55, 68, 2483, '2025-04-27 18:42:08', 1, 1);
INSERT INTO `reservation` VALUES (56, 70, 407, '2025-04-27 23:08:56', 0, 1);
INSERT INTO `reservation` VALUES (57, 73, 411, '2025-04-28 22:07:48', 1, 1);
INSERT INTO `reservation` VALUES (58, 74, 2272, '2025-04-28 22:15:56', 0, 1);
INSERT INTO `reservation` VALUES (60, 74, 2, '2025-04-29 08:21:17', 1, 1);
INSERT INTO `reservation` VALUES (61, 74, 2, '2025-04-29 08:37:53', 1, 1);

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('FeEpmfbrUVrAWk1rjwWUGJkKvbWHDJ7hoKj9ZmwV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoick11SzRQSDFmYlB5VHFQWUlGYW1JdTBzVXBrVkJlbDd0MnVPODJWOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9tYXAudGVzdC9tYXA/dHlwZT1sYXdubG90cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745892323);
INSERT INTO `sessions` VALUES ('SQCmmI0pFx2VsGyrCCeGdo7UFdvg2U6v7kggJXoE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2twRGp4cVJjdmdjRUtoRkpIWnhhbUpsM2Y5VnV5RmFDS01qV1paQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTU6Imh0dHA6Ly9tYXAudGVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745852536);
INSERT INTO `sessions` VALUES ('wFD9XQ2oYBjIJt0YhSb2QSiE8h4g9SksLO69RTGl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXJUc1lkYzRMNlNTUlNSWnFuSGlWVWloU3RuM0JtWTE3bG5pSURkMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTU6Imh0dHA6Ly9tYXAudGVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745768097);
INSERT INTO `sessions` VALUES ('xjvLKMEHV1VFN6J01RxNlpkGl33z8ATOmo9rZsHR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWh3STdRdGVKZG1hMEJFRGRDemdzNjA1N0ZrdFlWYXdOR25ad0dWMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTU6Imh0dHA6Ly9tYXAudGVzdCI7fX0=', 1745850510);

-- ----------------------------
-- Table structure for stewards
-- ----------------------------
DROP TABLE IF EXISTS `stewards`;
CREATE TABLE `stewards`  (
  `user_id` int NOT NULL,
  `plot_id` int NOT NULL,
  PRIMARY KEY (`user_id`, `plot_id`) USING BTREE,
  INDEX `FK_stewards_plot_id`(`plot_id` ASC) USING BTREE,
  CONSTRAINT `FK_stewards_plot_id` FOREIGN KEY (`plot_id`) REFERENCES `burial_plot` (`Plot_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_stewards_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stewards
-- ----------------------------

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
  `Transaction_ID` int NOT NULL,
  `Date` datetime NULL DEFAULT NULL,
  `Amount` decimal(10, 2) NULL DEFAULT NULL,
  `Client_ID` int NOT NULL,
  `Type_ID` int NOT NULL,
  `Deceased_ID` int NOT NULL,
  PRIMARY KEY (`Transaction_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaction
-- ----------------------------
INSERT INTO `transaction` VALUES (1, '2025-04-11 10:19:16', 300.00, 55, 3, 0);
INSERT INTO `transaction` VALUES (2, '2025-04-11 10:25:16', 100.00, 55, 3, 0);
INSERT INTO `transaction` VALUES (3, '2025-04-11 10:32:20', 400.00, 56, 3, 0);
INSERT INTO `transaction` VALUES (4, '2025-04-11 10:33:03', 600.00, 59, 3, 0);
INSERT INTO `transaction` VALUES (5, '2025-04-11 10:33:35', 800.00, 55, 3, 0);
INSERT INTO `transaction` VALUES (6, '2025-04-15 10:49:02', 100.00, 55, 3, 0);
INSERT INTO `transaction` VALUES (7, '2025-04-28 21:53:18', 50000.00, 55, 3, 0);
INSERT INTO `transaction` VALUES (8, '2025-04-28 22:10:00', 500.00, 73, 3, 0);

-- ----------------------------
-- Table structure for transaction type
-- ----------------------------
DROP TABLE IF EXISTS `transaction type`;
CREATE TABLE `transaction type`  (
  `Type_ID` int NOT NULL,
  `Type_Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Type_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaction type
-- ----------------------------

-- ----------------------------
-- Table structure for transaction_type
-- ----------------------------
DROP TABLE IF EXISTS `transaction_type`;
CREATE TABLE `transaction_type`  (
  `Type_ID` int NOT NULL,
  `Type_Name` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Type_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaction_type
-- ----------------------------
INSERT INTO `transaction_type` VALUES (1, 'Lot');
INSERT INTO `transaction_type` VALUES (2, 'Apartment');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL,
  `F_name` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `M_name` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `L_name` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `Username` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `User_TypeID` int NULL DEFAULT NULL,
  `Contact_info` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `FK_user_User_TypeID`(`User_TypeID` ASC) USING BTREE,
  CONSTRAINT `FK_user_User_TypeID` FOREIGN KEY (`User_TypeID`) REFERENCES `user_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 'admin', 'admin', 'admin', 1, '09943234955', NULL);

-- ----------------------------
-- Table structure for user_type
-- ----------------------------
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_type
-- ----------------------------
INSERT INTO `user_type` VALUES (1, 'admin');
INSERT INTO `user_type` VALUES (2, 'user');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
