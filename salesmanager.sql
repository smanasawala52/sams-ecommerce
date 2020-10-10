-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: salesmanager
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `id` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CODE` varchar(100) NOT NULL,
  `DEFAULT_CATALOG` bit(1) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK32mubpubtaqu30n34bwl7xiis` (`MERCHANT_ID`,`CODE`),
  CONSTRAINT `FKranq0rweb0r6j31j565ak51g8` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_entry`
--

DROP TABLE IF EXISTS `catalog_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_entry` (
  `id` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `CATALOG_ID` bigint NOT NULL,
  `CATEGORY_ID` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK5q8159i414r299kia2w9re90k` (`CATEGORY_ID`,`CATALOG_ID`),
  KEY `FKqp2j48hb3vodovb8gn2o4gox` (`CATALOG_ID`),
  CONSTRAINT `FK374wks7em54d0oghju0earttl` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`),
  CONSTRAINT `FKqp2j48hb3vodovb8gn2o4gox` FOREIGN KEY (`CATALOG_ID`) REFERENCES `catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_entry`
--

LOCK TABLES `catalog_entry` WRITE;
/*!40000 ALTER TABLE `catalog_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CATEGORY_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CATEGORY_IMAGE` varchar(100) DEFAULT NULL,
  `CATEGORY_STATUS` bit(1) DEFAULT NULL,
  `CODE` varchar(100) NOT NULL,
  `DEPTH` int DEFAULT NULL,
  `FEATURED` bit(1) DEFAULT NULL,
  `LINEAGE` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  UNIQUE KEY `UK3mq9i6qmgquvoieslx39pej6x` (`MERCHANT_ID`,`CODE`),
  KEY `FKn3kekntr7pm8g9v8ask698ato` (`PARENT_ID`),
  CONSTRAINT `FK8a09asq5fcx0a88i4m8nsixy` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKn3kekntr7pm8g9v8ask698ato` FOREIGN KEY (`PARENT_ID`) REFERENCES `category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'2020-10-10 15:22:52','2020-10-10 15:22:52','admin@sams.com',NULL,_binary '\0','footwear',0,_binary '\0','/1/',0,_binary '',1,NULL),(2,'2020-10-10 16:46:30','2020-10-10 16:46:30','admin@sams.com',NULL,_binary '\0','sports-shoes',1,_binary '\0','/1//2/',1,_binary '',1,1),(50,'2020-10-10 16:12:27','2020-10-10 16:12:27','admin@sams.com',NULL,_binary '\0','beachbags',1,_binary '\0','/51//50/',0,_binary '',1,51),(51,'2020-10-10 16:11:45','2020-10-10 16:11:45','admin@sams.com',NULL,_binary '\0','bags',0,_binary '\0','/51/',0,_binary '',1,NULL),(52,'2020-10-10 16:47:38','2020-10-10 16:47:38','admin@sams.com',NULL,_binary '\0','handbags',1,_binary '\0','/51//52/',0,_binary '',1,51);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_description`
--

DROP TABLE IF EXISTS `category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `CATEGORY_HIGHLIGHT` varchar(255) DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) DEFAULT NULL,
  `META_KEYWORDS` varchar(255) DEFAULT NULL,
  `META_TITLE` varchar(120) DEFAULT NULL,
  `SEF_URL` varchar(120) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CATEGORY_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKbuesqq6cyx7e5hy3mf30cfieq` (`CATEGORY_ID`,`LANGUAGE_ID`),
  KEY `FKl4j5boteutpu1p8f67kydpnmd` (`LANGUAGE_ID`),
  CONSTRAINT `FKa58u7d0ydfgref1iaux5efyov` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`),
  CONSTRAINT `FKl4j5boteutpu1p8f67kydpnmd` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_description`
--

LOCK TABLES `category_description` WRITE;
/*!40000 ALTER TABLE `category_description` DISABLE KEYS */;
INSERT INTO `category_description` VALUES (1,'2020-10-10 15:22:52','2020-10-10 15:22:52',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	Footwear</h2>\r\n<p style=\"font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; font-variant-numeric: normal; font-variant-east-asian: normal; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	THIS IS A LIST OF OUR FAVORITE footweAR</p>\r\n','Footwear',NULL,'Footwear','Footwear','Footwear','Footwear','footwear',1,1),(2,'2020-10-10 15:22:52','2020-10-10 15:22:52',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	الأحذية</h2>\r\n<p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	هذه قائمة بأحذيةنا المفضلة</p>\r\n','الأحذية',NULL,'الأحذية','الأحذية','الأحذية','الأحذية','الأحذية',2,1),(3,'2020-10-10 16:46:30','2020-10-10 16:46:30',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	Sports Shoes</h2>\r\n<p style=\"font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; font-variant-numeric: normal; font-variant-east-asian: normal; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	strenuous physical activity</p>\r\n','Sports Shoes',NULL,'Sports Shoes','Sports Shoes','sports-shoes','Sports Shoes','sports-shoes',1,2),(4,'2020-10-10 15:23:26','2020-10-10 15:23:26',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	حذاء رياضي</h2>\r\n<p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	نشاط بدني شاق</p>\r\n','حذاء رياضي',NULL,'حذاء رياضي','حذاء رياضي','حذاء رياضي','حذاء رياضي','حذاء رياضي',2,2),(5,'2020-10-10 16:12:27','2020-10-10 16:12:27',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	حقائب الشاطئ</h2>\r\n<p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	الحقائب على الشاطئ</p>\r\n','حقائب الشاطئ',NULL,'beach-bags','حقائب الشاطئ','حقائب الشاطئ','حقائب الشاطئ','beach-bags',2,50),(6,'2020-10-10 16:12:27','2020-10-10 16:12:27',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	Beach bags</h2>\r\n<p style=\"font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; font-variant-numeric: normal; font-variant-east-asian: normal; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	Bags on Beach</p>\r\n','Beach bags',NULL,'Beach bags','Beach bags','Beach bags','Beach bags','beach-bags',1,50),(7,'2020-10-10 16:11:45','2020-10-10 16:11:45',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	Bags</h2>\r\n<p style=\"font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; font-variant-numeric: normal; font-variant-east-asian: normal; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	Bags COLLECtion</p>\r\n','Bags',NULL,'bags','Bags','Bags','Bags','bags',1,51),(8,'2020-10-10 16:11:45','2020-10-10 16:11:45',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	أكياس</h2>\r\n<p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	أكياس أكياس</p>\r\n','أكياس',NULL,'bags','أكياس','bags','أكياس','bags',2,51),(9,'2020-10-10 16:13:50','2020-10-10 16:13:50',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	حقائب اليد</h2>\r\n<p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	حقائب اليدحقائب اليد</p>\r\n','حقائب اليد',NULL,'handbags','حقائب اليد','حقائب اليد','حقائب اليد','handbags',2,52),(10,'2020-10-10 16:47:38','2020-10-10 16:47:38',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	Handbags</h2>\r\n<p style=\"font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; font-variant-numeric: normal; font-variant-east-asian: normal; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	Handbags collection</p>\r\n','Handbags',NULL,'','Handbags','Handbags','Handbags','handbags',1,52),(11,'2020-10-10 15:22:52','2020-10-10 15:22:52',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	الأحذية</h2>\r\n<p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	هذه قائمة بأحذيةنا المفضلة</p>\r\n','الأحذية',NULL,'الأحذية','الأحذية','الأحذية','الأحذية','الأحذية',4,1),(12,'2020-10-10 16:46:30','2020-10-10 16:46:30',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	حذاء رياضي</h2>\r\n<p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	نشاط بدني شاق</p>\r\n','حذاء رياضي',NULL,'sports-shoes','حذاء رياضي','حذاء رياضي','حذاء رياضي','sports-shoes',4,2),(15,'2020-10-10 16:11:45','2020-10-10 16:11:45',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	أكياس</h2>\r\n<p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	أكياس أكياس</p>\r\n','أكياس',NULL,'bags','','','أكياس','bags',4,51),(16,'2020-10-10 16:12:27','2020-10-10 16:12:27',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	حقائب الشاطئ</h2>\r\n<p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	الحقائب على الشاطئ</p>\r\n','حقائب الشاطئ',NULL,'','','','حقائب الشاطئ','beach-bags',4,50),(19,'2020-10-10 16:47:38','2020-10-10 16:47:38',NULL,'<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; text-align: center; font-weight: 400; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">\r\n	حقائب اليد</h2>\r\n<p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em; text-align: center; background-color: rgb(255, 255, 255);\">\r\n	حقائب اليدحقائب اليد</p>\r\n','حقائب اليد',NULL,'handbag','handbags','handbags','حقائب اليد','handbags',4,52);
/*!40000 ALTER TABLE `category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `CONTENT_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CODE` varchar(100) NOT NULL,
  `CONTENT_POSITION` varchar(10) DEFAULT NULL,
  `CONTENT_TYPE` varchar(10) DEFAULT NULL,
  `LINK_TO_MENU` bit(1) DEFAULT NULL,
  `PRODUCT_GROUP` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CONTENT_ID`),
  UNIQUE KEY `UKt1v2ld0mrwviquqourql4uub0` (`MERCHANT_ID`,`CODE`),
  KEY `CODE_IDX` (`CODE`),
  CONSTRAINT `FKfmoi0fkjbtfty3o8fs94t11r1` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,NULL,NULL,NULL,'LANDING_PAGE',NULL,'SECTION',_binary '\0',NULL,0,_binary '',1),(150,NULL,NULL,NULL,'aboutus',NULL,'PAGE',_binary '',',,',0,_binary '',1),(151,NULL,NULL,NULL,'agreement','LEFT','BOX',_binary '\0',NULL,0,_binary '',1),(152,NULL,NULL,NULL,'bannerImage','LEFT','BOX',_binary '\0',NULL,0,_binary '',1),(153,NULL,NULL,NULL,'footerImage','LEFT','BOX',_binary '\0',NULL,0,_binary '',1);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_description`
--

DROP TABLE IF EXISTS `content_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) DEFAULT NULL,
  `META_KEYWORDS` varchar(255) DEFAULT NULL,
  `META_TITLE` varchar(255) DEFAULT NULL,
  `SEF_URL` varchar(120) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CONTENT_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKn0w5r7ctbp88r4rvk7ayklofm` (`CONTENT_ID`,`LANGUAGE_ID`),
  KEY `FK47yxf681u0rfw2kvarhqb0r3v` (`LANGUAGE_ID`),
  CONSTRAINT `FK47yxf681u0rfw2kvarhqb0r3v` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKk7fabfxn2flvcofwwpyg5sys` FOREIGN KEY (`CONTENT_ID`) REFERENCES `content` (`CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_description`
--

LOCK TABLES `content_description` WRITE;
/*!40000 ALTER TABLE `content_description` DISABLE KEYS */;
INSERT INTO `content_description` VALUES (1,'2020-10-06 10:53:20','2020-10-10 15:10:58',NULL,'<div class=\"my-featured-title\" style=\"background: rgb(255, 255, 255); padding: 20px;\">\r\n	<div class=\"ilt\" style=\"text-align: center;\">\r\n		<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; letter-spacing: 0px; font-weight: 400; color: rgb(34, 34, 34);\">\r\n			Featured items</h2>\r\n		<p style=\"font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; font-variant-numeric: normal; font-variant-east-asian: normal; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em;\">\r\n			THIS IS A LIST OF OUR FAVORITE FINDINGS</p>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n','Online Shopping!','Online Shopping!','Shop for electronics, apparels & more using our app Free shipping & COD.','Online Shopping in India,online Shopping store,Online Shopping Site,Buy Online,Shop Online,Online Shopping,',NULL,NULL,1,1),(2,'2020-10-06 10:53:20','2020-10-09 15:34:19',NULL,'<div class=\"my-featured-title\" style=\"background: rgb(255, 255, 255); padding: 20px;\">\r\n	<div class=\"ilt\" style=\"text-align: center;\">\r\n		<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; letter-spacing: 0px; font-weight: 400; color: rgb(34, 34, 34);\">\r\n			السلع المعروضة</h2>\r\n		<p style=\"font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; font-variant-numeric: normal; font-variant-east-asian: normal; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em;\">\r\n			هذه قائمة بالنتائج المفضلة لدينا</p>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n','التسوق عبر الانترنت!','التسوق عبر الانترنت!','تسوق لشراء الإلكترونيات والملابس والمزيد باستخدام تطبيق Flipkart ، الشحن المجاني وسداد الدفع عند الاستلام.','التسوق عبر الإنترنت في الهند ، متجر التسوق عبر الإنترنت ، موقع التسوق عبر الإنترنت ، الشراء عبر الإنترنت ، التسوق عبر الإنترنت ، التسوق عبر الإنترنت ،',NULL,NULL,2,1),(11,'2020-10-10 15:10:58','2020-10-10 15:10:58',NULL,'<div class=\"my-featured-title\" style=\"background: rgb(255, 255, 255); padding: 20px;\">\r\n	<div class=\"ilt\" style=\"text-align: center;\">\r\n		<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; letter-spacing: 0px; font-weight: 400; color: rgb(34, 34, 34);\">\r\n			السلع المعروضة</h2>\r\n		<p style=\"font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; font-variant-numeric: normal; font-variant-east-asian: normal; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em;\">\r\n			هذه قائمة بالنتائج المفضلة لدينا</p>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n','التسوق عبر الانترنت!',NULL,'تسوق لشراء الإلكترونيات والملابس والمزيد باستخدام تطبيق ، الشحن المجاني وسداد الدفع عند الاستلام.','التسوق عبر الإنترنت في الهند ، متجر التسوق عبر الإنترنت ، موقع التسوق عبر الإنترنت ، الشراء عبر الإنترنت ، التسوق عبر الإنترنت ، التسوق عبر الإنترنت ،',NULL,NULL,4,1),(12,'2020-10-10 15:15:11','2020-10-10 15:15:11',NULL,'<div class=\"my-featured-title\" style=\"background: rgb(255, 255, 255); padding: 20px;\">\r\n	<div class=\"ilt\" style=\"text-align: center;\">\r\n		<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; letter-spacing: 0px; font-weight: 400; color: rgb(34, 34, 34);\">\r\n			About Us</h2>\r\n		<p style=\"font-family: &quot;Lucida Grande&quot;, Tahoma; font-size: 12px; font-weight: lighter; font-variant-numeric: normal; font-variant-east-asian: normal; text-transform: uppercase; color: rgb(102, 102, 102); margin-top: 10px; letter-spacing: 0.3em;\">\r\n			Quality of products, Great service and Excellent Customer satisfaction.</p>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<span style=\"font-family:courier new,courier,monospace;\">WRexim has been delivering results since we opened in 2015. Our goal is to provide both a superior customer experience and tremendous value for our customers. It&rsquo;s all about customer&rsquo;s satisfaction.</span></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<span style=\"font-family:courier new,courier,monospace;\">WRexim has over great experience in Trophy, Prize, Cups, Medals, Award and Plaques Industry and is passionate about exceeding your expectations.</span></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<span style=\"font-family:courier new,courier,monospace;\">WRexim, Prize, Cups, Medals, Award, Gifts and Plaques is professional, timely, with the best quality and prices in town. We continue to go above and beyond to help School | College | Corporate | Clubs | Sports with theirexceptional customer service.</span></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<span style=\"font-family:courier new,courier,monospace;\">We always try to impressed our customers with the quality of product and the level service we offered. WRexim will be your trophy shop for life. Our customers have and always will highly recommend of us.</span></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<span style=\"font-family:courier new,courier,monospace;\">We have a very customer friendly staff which is helpful and always go the extra mile. We have always helped our customers &ldquo;in a pinch&ldquo;!</span></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<span style=\"font-family:courier new,courier,monospace;\">Our friendly staff are always willing to offer suggestions and help to customers to create beautiful custom trophies and awards. We are quick, efficient and always make our customers happy with the end product. WRexim is always in pursuit of excellence in providing a range of corporate custom made gifts item.</span></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<span style=\"font-family:courier new,courier,monospace;\">We have also, always provided high quality awards and top notch customer service to our sports programs customers. Our staff do a wonderful job and we look forward to working with our customers again.</span></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<span style=\"font-family:courier new,courier,monospace;\">We comes through for soccer club. Our Customers have ordered items at the last minute numerous times and we always delivers. The products are amazing quality and completed professionally by WRexim. Our customers would never use any other business for their award needs. Doing business with WRexim is a pleasure experience for our Customers.</span></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<span style=\"font-family:courier new,courier,monospace;\">Our local Cub customers have used WRexim for their awards needs for years now. From Plaques to Trophies to Name Plates, WRexim has it all. We offer Great Service and Great Selection!</span></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<span style=\"font-family:courier new,courier,monospace;\">WRexim is working towards to win an award of excellence. The customer service, workmanship, creativity, turnaround time and quality are tops! We have been utilized for award event associated with local youth sports programs, local elementary school, local PTA unit, State PTA awards, local high-school booster and personal engraved items. Every job treated with Platinum Service no matter how big or small. We have worked within every budget given. We have given No reason for our customers to go anywhere else by providing very high customer service.</span></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<span style=\"font-family:courier new,courier,monospace;\">We have consistently exceeded our customers expectations at EVERY TURN &ndash; from quality of product, to delivery time, to friendly and professional staff.</span></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<span style=\"font-family:courier new,courier,monospace;\">We Thank all our valued customers. We are grateful for the pleasure of serving our customers and meeting their Trophy, Prize, Cups, Medals, Award and Plaques needs.</span></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<span style=\"font-family:courier new,courier,monospace;\">We love our customers and welcome your feedback and suggestions.</span></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<span style=\"font-family:courier new,courier,monospace;\">Please visit us at Contact Us also can mail us at kasim.trophy@gmail.com</span></div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n','About Us',NULL,'About Us','About Us','About Us','about-us',1,150),(13,'2020-10-10 15:15:11','2020-10-10 15:15:11',NULL,'','',NULL,'','','','',2,150),(14,'2020-10-10 15:15:11','2020-10-10 15:15:11',NULL,'\r\n\r\n<div class=\"my-featured-title\" style=\"background: rgb(255, 255, 255); padding: 20px;\">\r\n	<div class=\"ilt\" style=\"text-align: center;\">\r\n		<h2 style=\"font-family: Georgia, &quot;Times New Roman&quot;, Times, serif; font-size: 36px; margin-top: 5px; margin-bottom: 0px; letter-spacing: 0px; font-weight: 400; color: rgb(34, 34, 34);\">\r\n			<span style=\"font-size:20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Lucida Grande&quot;, Tahoma; font-weight: lighter; letter-spacing: 0.3em; text-transform: uppercase;\">معلومات عنا</span></span></h2>\r\n		<p>\r\n			&nbsp;</p>\r\n		<div>\r\n			جودة المنتجات وخدمة رائعة ورضا العملاء الممتاز.</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			حققت WRexim نتائج منذ افتتاحنا في عام 2015. هدفنا هو تقديم تجربة عملاء فائقة وقيمة هائلة لعملائنا. الأمر كله يتعلق بإرضاء العميل.</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			يتمتع WRexim بخبرة كبيرة في مجال الكؤوس والجوائز والكؤوس والميداليات والجوائز وصناعة اللوحات وهو متحمس لتجاوز توقعاتك.</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			WRexim والجائزة والأكواب والميداليات والجوائز والهدايا واللوحات احترافية وفي الوقت المناسب وبأفضل جودة وأسعار في المدينة. نواصل الذهاب إلى أبعد الحدود لمساعدة المدرسة | الكلية | الشركة | نوادي | الرياضة مع خدمة العملاء الحسية.</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			نحاول دائمًا إثارة إعجاب عملائنا بجودة المنتج ومستوى الخدمة الذي قدمناه. سيكون WRexim متجرك التذكاري مدى الحياة. عملاؤنا يوصون بنا بشدة وسيظلون دائمًا.</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			لدينا فريق عمل ودود للغاية للعملاء وهو أمر مفيد ودائمًا ما يبذل جهدًا إضافيًا. لقد ساعدنا دائمًا عملائنا &quot;في السؤال&quot;!</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			موظفونا الودودون على استعداد دائمًا لتقديم الاقتراحات ومساعدة العملاء على إنشاء الجوائز والجوائز المخصصة الجميلة. نحن سريعون وفعالون ونجعل عملائنا دائمًا سعداء بالمنتج النهائي. تسعى WRexim دائمًا لتحقيق التميز في تقديم مجموعة من عناصر الهدايا المخصصة للشركات.</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			لقد قدمنا ​​دائمًا جوائز عالية الجودة وخدمة عملاء من الدرجة الأولى لعملاء برامجنا الرياضية. يقوم موظفونا بعمل رائع ونتطلع إلى العمل مع عملائنا مرة أخرى.</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			نأتي إلى نادي كرة القدم. لقد طلب عملاؤنا العناصر في اللحظة الأخيرة عدة مرات ونقوم دائمًا بالتوصيل. المنتجات ذات جودة مذهلة وتم الانتهاء منها بشكل احترافي بواسطة WRexim. لن يستخدم عملاؤنا أبدًا أي عمل آخر لتلبية احتياجات الجوائز الخاصة بهم. يعد التعامل مع WRexim تجربة ممتعة لعملائنا.</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			استخدم عملاؤنا المحليون الشبل WRexim لتلبية احتياجات جوائزهم لسنوات حتى الآن. من اللوحات إلى الجوائز إلى لوحات الأسماء ، يحتوي WRexim على كل شيء. نحن نقدم خدمة رائعة واختيار رائع!</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			تعمل WRexim من أجل الفوز بجائزة التميز. خدمة العملاء ، والاتقان ، والإبداع ، ووقت التسليم ، والجودة هي الأفضل! لقد تم استخدامنا في حدث الجوائز المرتبط ببرامج الرياضات الشبابية المحلية ، والمدرسة الابتدائية المحلية ، ووحدة PTA المحلية ، وجوائز الدولة لـ PTA ، ومحفز المدرسة الثانوية المحلية ، والعناصر المنقوشة الشخصية. يتم التعامل مع كل وظيفة مع الخدمة البلاتينية مهما كانت كبيرة أو صغيرة. لقد عملنا في حدود كل ميزانية. لم نعطِ سببًا لعملائنا للذهاب إلى أي مكان آخر من خلال تقديم خدمة عملاء عالية جدًا.</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			لقد تجاوزنا باستمرار توقعات عملائنا في كل منعطف - من جودة المنتج إلى وقت التسليم إلى الموظفين الودودين والمهنيين.</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			نشكر جميع عملائنا الكرام. نحن ممتنون لسرور خدمة عملائنا وتلبية احتياجاتهم من الكؤوس والجوائز والكؤوس والميداليات والجوائز والدروع.</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			نحن نحب عملائنا ونرحب بآرائكم واقتراحاتكم.</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			يرجى زيارتنا على اتصل بنا كما يمكن مراسلتنا على</div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n','معلومات عنا',NULL,'معلومات عنا','معلومات عنا','معلومات عنا','معلومات عنا',4,150),(15,'2020-10-10 15:19:23','2020-10-10 15:19:23',NULL,'<div>\r\n	TERMS AND CONDITIONS OF SALE</div>\r\n<div>\r\n	These General Terms and Conditions of Sale for Products (&ldquo;Sales Terms&rdquo;) apply to the sale of products (&ldquo;products&rdquo;) by WREXIM Tech. (&quot;WREXIM&quot;) to the customer (&ldquo;you&rdquo; or &ldquo;Customer&rdquo;). WREXIMs Tech offer to sell products to Customer and WREXIM Tech acknowledgment of any purchase order or another Customer document (&ldquo;Order&rdquo;) is expressly limited to and expressly conditioned on Customer&rsquo;s acceptance of these Sales Terms. The applicability of terms contained in the Customer&rsquo;s Order is limited to the identification and the number of products ordered. Unless agreed to by Customer and WREXIM Tech in a separate written contract, Global objects to and rejects all other Customer terms, in any form, that are different from or additional to these Sales Terms.</div>','agreement',NULL,NULL,NULL,NULL,NULL,1,151),(16,'2020-10-10 15:19:23','2020-10-10 15:19:23',NULL,'','',NULL,NULL,NULL,NULL,NULL,2,151),(17,'2020-10-10 15:19:23','2020-10-10 15:19:23',NULL,'<div>\r\n	شروط وأحكام البيع</div>\r\n<div>\r\n	تنطبق الشروط والأحكام العامة لبيع المنتجات (&quot;شروط المبيعات&quot;) على بيع المنتجات (&quot;المنتجات&quot;) بواسطة WREXIM Tech. (&quot;WREXIM&quot;) للعميل (&quot;أنت&quot; أو &quot;العميل&quot;). تعرض WREXIMs Tech بيع المنتجات إلى العميل ويقتصر إقرار WREXIM Tech على أي طلب شراء أو مستند آخر للعميل (&quot;الطلب&quot;) صراحةً على قبول العميل لشروط المبيعات هذه ومشروطًا به صراحةً. تقتصر إمكانية تطبيق الشروط الواردة في طلب العميل على تحديد عدد المنتجات المطلوبة. ما لم يتفق عليه العميل و WREXIM Tech في عقد مكتوب منفصل ، تعترض WREXIM على وترفض جميع شروط العميل الأخرى ، بأي شكل من الأشكال ، التي تختلف عن شروط المبيعات هذه أو الإضافية لها.</div>\r\n\r\n','agreement',NULL,NULL,NULL,NULL,NULL,4,151),(18,'2020-10-10 15:20:04','2020-10-10 15:20:04',NULL,'<section id=\"home-banner\" style=\"margin-top:0px !important;\">\r\n	<article>\r\n		<div class=\"image-content\">\r\n			<img alt=\"text\" src=\"/static/files/DEFAULT/IMAGE/banner-resized.jpg\" /></div>\r\n	</article>\r\n</section>','bannerImage',NULL,NULL,NULL,NULL,NULL,1,152),(19,'2020-10-10 15:20:04','2020-10-10 15:20:04',NULL,'','',NULL,NULL,NULL,NULL,NULL,2,152),(20,'2020-10-10 15:20:04','2020-10-10 15:20:04',NULL,'<section id=\"home-banner\" style=\"margin-top:0px !important;\">\r\n	<article>\r\n		<div class=\"image-content\">\r\n			<img alt=\"text\" src=\"/static/files/DEFAULT/IMAGE/banner-resized.jpg\" /></div>\r\n	</article>\r\n</section>','bannerImage',NULL,NULL,NULL,NULL,NULL,4,152),(21,'2020-10-10 15:20:41','2020-10-10 15:20:41',NULL,'<p>\r\n	<img alt=\"footer\" src=\"/static/files/DEFAULT/IMAGE/bag-picture-text.jpg\" /></p>','footerImage',NULL,NULL,NULL,NULL,NULL,1,153),(22,'2020-10-10 15:20:41','2020-10-10 15:20:41',NULL,'','',NULL,NULL,NULL,NULL,NULL,2,153),(23,'2020-10-10 15:20:41','2020-10-10 15:20:41',NULL,'<p>\r\n	<img alt=\"footer\" src=\"/static/files/DEFAULT/IMAGE/bag-picture-text.jpg\" /></p>','footerImage',NULL,NULL,NULL,NULL,NULL,4,153);
/*!40000 ALTER TABLE `content_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `COUNTRY_ID` int NOT NULL,
  `COUNTRY_ISOCODE` varchar(255) NOT NULL,
  `COUNTRY_SUPPORTED` bit(1) DEFAULT NULL,
  `GEOZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_ID`),
  UNIQUE KEY `UK_dqb99v22pt27v0tgeqo958e6x` (`COUNTRY_ISOCODE`),
  KEY `FKd2q9e14kh1j6tm1gpbct2xwws` (`GEOZONE_ID`),
  CONSTRAINT `FKd2q9e14kh1j6tm1gpbct2xwws` FOREIGN KEY (`GEOZONE_ID`) REFERENCES `geozone` (`GEOZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'AL',_binary '',NULL),(2,'DZ',_binary '',NULL),(3,'AR',_binary '',NULL),(4,'AU',_binary '',NULL),(5,'AT',_binary '',NULL),(6,'BH',_binary '',NULL),(7,'BY',_binary '',NULL),(8,'BE',_binary '',NULL),(9,'BO',_binary '',NULL),(10,'BA',_binary '',NULL),(11,'BR',_binary '',NULL),(12,'BG',_binary '',NULL),(13,'CA',_binary '',NULL),(14,'CL',_binary '',NULL),(15,'CN',_binary '',NULL),(16,'CO',_binary '',NULL),(17,'CR',_binary '',NULL),(18,'HR',_binary '',NULL),(19,'CU',_binary '',NULL),(20,'CY',_binary '',NULL),(21,'CZ',_binary '',NULL),(22,'DK',_binary '',NULL),(23,'DO',_binary '',NULL),(24,'EC',_binary '',NULL),(25,'EG',_binary '',NULL),(26,'SV',_binary '',NULL),(27,'EE',_binary '',NULL),(28,'FI',_binary '',NULL),(29,'FR',_binary '',NULL),(30,'DE',_binary '',NULL),(31,'GR',_binary '',NULL),(32,'GT',_binary '',NULL),(33,'HN',_binary '',NULL),(34,'HK',_binary '',NULL),(35,'HU',_binary '',NULL),(36,'IS',_binary '',NULL),(37,'IN',_binary '',NULL),(38,'ID',_binary '',NULL),(39,'IQ',_binary '',NULL),(40,'IE',_binary '',NULL),(41,'IL',_binary '',NULL),(42,'IT',_binary '',NULL),(43,'JP',_binary '',NULL),(44,'JO',_binary '',NULL),(45,'KR',_binary '',NULL),(46,'KW',_binary '',NULL),(47,'LV',_binary '',NULL),(48,'LB',_binary '',NULL),(49,'LY',_binary '',NULL),(50,'LT',_binary '',NULL),(51,'LU',_binary '',NULL),(52,'MK',_binary '',NULL),(53,'MY',_binary '',NULL),(54,'MT',_binary '',NULL),(55,'MX',_binary '',NULL),(56,'ME',_binary '',NULL),(57,'MA',_binary '',NULL),(58,'NL',_binary '',NULL),(59,'NZ',_binary '',NULL),(60,'NI',_binary '',NULL),(61,'NO',_binary '',NULL),(62,'OM',_binary '',NULL),(63,'PA',_binary '',NULL),(64,'PY',_binary '',NULL),(65,'PE',_binary '',NULL),(66,'PH',_binary '',NULL),(67,'PL',_binary '',NULL),(68,'PT',_binary '',NULL),(69,'PR',_binary '',NULL),(70,'QA',_binary '',NULL),(71,'RO',_binary '',NULL),(72,'RU',_binary '',NULL),(73,'SA',_binary '',NULL),(74,'RS',_binary '',NULL),(75,'SG',_binary '',NULL),(76,'SK',_binary '',NULL),(77,'SI',_binary '',NULL),(78,'ZA',_binary '',NULL),(79,'ES',_binary '',NULL),(80,'SD',_binary '',NULL),(81,'SE',_binary '',NULL),(82,'CH',_binary '',NULL),(83,'SY',_binary '',NULL),(84,'TW',_binary '',NULL),(85,'TH',_binary '',NULL),(86,'TN',_binary '',NULL),(87,'TR',_binary '',NULL),(88,'UA',_binary '',NULL),(89,'AE',_binary '',NULL),(90,'GB',_binary '',NULL),(91,'US',_binary '',NULL),(92,'UY',_binary '',NULL),(93,'VE',_binary '',NULL),(94,'VN',_binary '',NULL),(95,'YE',_binary '',NULL);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_description`
--

DROP TABLE IF EXISTS `country_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `COUNTRY_ID` int NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKt7nshki1rbp6157ed0v6cx4y4` (`COUNTRY_ID`,`LANGUAGE_ID`),
  KEY `FKersrbjot9p9nfukxfd2l27c7t` (`LANGUAGE_ID`),
  CONSTRAINT `FKersrbjot9p9nfukxfd2l27c7t` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKkd2sy7q97wr2ahvyiiqc4txji` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_description`
--

LOCK TABLES `country_description` WRITE;
/*!40000 ALTER TABLE `country_description` DISABLE KEYS */;
INSERT INTO `country_description` VALUES (1,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Albania',NULL,1,1),(2,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Albanie',NULL,2,1),(3,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Albania',NULL,3,1),(4,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Algeria',NULL,1,2),(5,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Algérie',NULL,2,2),(6,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Argelia',NULL,3,2),(7,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Argentina',NULL,1,3),(8,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Argentine',NULL,2,3),(9,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Argentina',NULL,3,3),(10,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Australia',NULL,1,4),(11,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Australie',NULL,2,4),(12,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Australia',NULL,3,4),(13,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Austria',NULL,1,5),(14,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Autriche',NULL,2,5),(15,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Austria',NULL,3,5),(16,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Bahrain',NULL,1,6),(17,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Bahreïn',NULL,2,6),(18,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Bahráin',NULL,3,6),(19,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Belarus',NULL,1,7),(20,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Biélo-Russie',NULL,2,7),(21,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Bielorrusia',NULL,3,7),(22,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Belgium',NULL,1,8),(23,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Belgique',NULL,2,8),(24,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Bélgica',NULL,3,8),(25,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Bolivia',NULL,1,9),(26,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Bolivie',NULL,2,9),(27,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Bolivia',NULL,3,9),(28,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Bosnia and Herzegovina',NULL,1,10),(29,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Bosnie-Herzégovine',NULL,2,10),(30,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Bosnia y Hercegovina',NULL,3,10),(31,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Brazil',NULL,1,11),(32,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Brésil',NULL,2,11),(33,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Brasil',NULL,3,11),(34,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Bulgaria',NULL,1,12),(35,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Bulgarie',NULL,2,12),(36,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Bulgaria',NULL,3,12),(37,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Canada',NULL,1,13),(38,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,NULL,'Canada',NULL,2,13),(39,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Canadá',NULL,3,13),(40,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Chile',NULL,1,14),(41,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Chili',NULL,2,14),(42,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Chile',NULL,3,14),(43,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'China',NULL,1,15),(44,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Chine',NULL,2,15),(45,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'China',NULL,3,15),(46,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Colombia',NULL,1,16),(47,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Colombie',NULL,2,16),(48,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Colombia',NULL,3,16),(49,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Costa Rica',NULL,1,17),(50,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Costa Rica',NULL,2,17),(51,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Costa Rica',NULL,3,17),(52,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Croatia',NULL,1,18),(53,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Croatie',NULL,2,18),(54,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Croacia',NULL,3,18),(55,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Cuba',NULL,1,19),(56,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Cuba',NULL,2,19),(57,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Cuba',NULL,3,19),(58,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Cyprus',NULL,1,20),(59,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Chypre',NULL,2,20),(60,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Chipre',NULL,3,20),(61,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Czech Republic',NULL,1,21),(62,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'République Tchèque',NULL,2,21),(63,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Chequia',NULL,3,21),(64,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Denmark',NULL,1,22),(65,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Danemark',NULL,2,22),(66,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Dinamarca',NULL,3,22),(67,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Dominican Republic',NULL,1,23),(68,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'République Dominicaine',NULL,2,23),(69,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'República Dominicana',NULL,3,23),(70,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Ecuador',NULL,1,24),(71,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Equateur',NULL,2,24),(72,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Ecuador',NULL,3,24),(73,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Egypt',NULL,1,25),(74,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Egypte',NULL,2,25),(75,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Egipto',NULL,3,25),(76,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'El Salvador',NULL,1,26),(77,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'El Salvador',NULL,2,26),(78,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'El Salvador',NULL,3,26),(79,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Estonia',NULL,1,27),(80,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Estonie',NULL,2,27),(81,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Estonia',NULL,3,27),(82,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Finland',NULL,1,28),(83,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Finlande',NULL,2,28),(84,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Finlandia',NULL,3,28),(85,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'France',NULL,1,29),(86,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'France',NULL,2,29),(87,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Francia',NULL,3,29),(88,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Germany',NULL,1,30),(89,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Allemagne',NULL,2,30),(90,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Alemania',NULL,3,30),(91,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Greece',NULL,1,31),(92,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Grèce',NULL,2,31),(93,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Grecia',NULL,3,31),(94,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Guatemala',NULL,1,32),(95,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Guatemala',NULL,2,32),(96,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Guatemala',NULL,3,32),(97,'2020-10-06 10:41:04','2020-10-06 10:41:04',NULL,NULL,'Honduras',NULL,1,33),(98,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Honduras',NULL,2,33),(99,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Honduras',NULL,3,33),(100,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Hong Kong',NULL,1,34),(101,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Hong-Kong',NULL,2,34),(102,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Hong Kong',NULL,3,34),(103,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Hungary',NULL,1,35),(104,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Hongrie',NULL,2,35),(105,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Hungría',NULL,3,35),(106,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Iceland',NULL,1,36),(107,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Islande',NULL,2,36),(108,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Islandia',NULL,3,36),(109,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'India',NULL,1,37),(110,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Inde',NULL,2,37),(111,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'India',NULL,3,37),(112,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Indonesia',NULL,1,38),(113,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Indonésie',NULL,2,38),(114,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Indonesia',NULL,3,38),(115,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Iraq',NULL,1,39),(116,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Irak',NULL,2,39),(117,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Iraq',NULL,3,39),(118,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Ireland',NULL,1,40),(119,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Irlande',NULL,2,40),(120,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Irlanda',NULL,3,40),(121,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Israel',NULL,1,41),(122,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Israël',NULL,2,41),(123,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Israel',NULL,3,41),(124,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Italy',NULL,1,42),(125,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Italie',NULL,2,42),(126,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Italia',NULL,3,42),(127,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Japan',NULL,1,43),(128,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Japon',NULL,2,43),(129,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Japón',NULL,3,43),(130,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Jordan',NULL,1,44),(131,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Jordanie',NULL,2,44),(132,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Jordania',NULL,3,44),(133,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'South Korea',NULL,1,45),(134,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Corée du Sud',NULL,2,45),(135,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Corea del Sur',NULL,3,45),(136,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Kuwait',NULL,1,46),(137,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Koweit',NULL,2,46),(138,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Kuwait',NULL,3,46),(139,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Latvia',NULL,1,47),(140,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Lettonie',NULL,2,47),(141,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Letonia',NULL,3,47),(142,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Lebanon',NULL,1,48),(143,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Liban',NULL,2,48),(144,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Líbano',NULL,3,48),(145,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Libya',NULL,1,49),(146,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Libye',NULL,2,49),(147,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Libia',NULL,3,49),(148,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Lithuania',NULL,1,50),(149,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Lithuanie',NULL,2,50),(150,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Lituania',NULL,3,50),(151,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Luxembourg',NULL,1,51),(152,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Luxembourg',NULL,2,51),(153,'2020-10-06 10:41:05','2020-10-06 10:41:05',NULL,NULL,'Luxemburgo',NULL,3,51),(154,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Macedonia',NULL,1,52),(155,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Macédoine',NULL,2,52),(156,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Macedonia',NULL,3,52),(157,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Malaysia',NULL,1,53),(158,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Malaisie',NULL,2,53),(159,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Malasia',NULL,3,53),(160,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Malta',NULL,1,54),(161,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Malte',NULL,2,54),(162,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Malta',NULL,3,54),(163,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Mexico',NULL,1,55),(164,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Mexique',NULL,2,55),(165,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'México',NULL,3,55),(166,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Montenegro',NULL,1,56),(167,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Monténégro',NULL,2,56),(168,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Montenegro',NULL,3,56),(169,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Morocco',NULL,1,57),(170,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Maroc',NULL,2,57),(171,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Marruecos',NULL,3,57),(172,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Netherlands',NULL,1,58),(173,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Pays-Bas',NULL,2,58),(174,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Holanda',NULL,3,58),(175,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'New Zealand',NULL,1,59),(176,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Nouvelle-Zélande',NULL,2,59),(177,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Nueva Zelanda',NULL,3,59),(178,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Nicaragua',NULL,1,60),(179,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Nicaragua',NULL,2,60),(180,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Nicaragua',NULL,3,60),(181,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Norway',NULL,1,61),(182,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Norvège',NULL,2,61),(183,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Noruega',NULL,3,61),(184,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Oman',NULL,1,62),(185,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Oman',NULL,2,62),(186,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Omán',NULL,3,62),(187,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Panama',NULL,1,63),(188,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Panama',NULL,2,63),(189,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Panamá',NULL,3,63),(190,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Paraguay',NULL,1,64),(191,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Paraguay',NULL,2,64),(192,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Paraguay',NULL,3,64),(193,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Peru',NULL,1,65),(194,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Pérou',NULL,2,65),(195,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Perú',NULL,3,65),(196,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Philippines',NULL,1,66),(197,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Philippines',NULL,2,66),(198,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Filipinas',NULL,3,66),(199,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Poland',NULL,1,67),(200,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Pologne',NULL,2,67),(201,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Polonia',NULL,3,67),(202,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Portugal',NULL,1,68),(203,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Portugal',NULL,2,68),(204,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Portugal',NULL,3,68),(205,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Puerto Rico',NULL,1,69),(206,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Porto Rico',NULL,2,69),(207,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Puerto Rico',NULL,3,69),(208,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Qatar',NULL,1,70),(209,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Qatar',NULL,2,70),(210,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Qatar',NULL,3,70),(211,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Romania',NULL,1,71),(212,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Roumanie',NULL,2,71),(213,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Rumania',NULL,3,71),(214,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Russia',NULL,1,72),(215,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Russie',NULL,2,72),(216,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Rusia',NULL,3,72),(217,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Saudi Arabia',NULL,1,73),(218,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Arabie Saoudite',NULL,2,73),(219,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Arabia Saudita',NULL,3,73),(220,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Serbia',NULL,1,74),(221,'2020-10-06 10:41:06','2020-10-06 10:41:06',NULL,NULL,'Serbie',NULL,2,74),(222,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Serbia',NULL,3,74),(223,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Singapore',NULL,1,75),(224,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Singapour',NULL,2,75),(225,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Singapur',NULL,3,75),(226,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Slovakia',NULL,1,76),(227,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Slovaquie',NULL,2,76),(228,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Eslovaquia',NULL,3,76),(229,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Slovenia',NULL,1,77),(230,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Slovénie',NULL,2,77),(231,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Eslovenia',NULL,3,77),(232,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'South Africa',NULL,1,78),(233,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Afrique du Sud',NULL,2,78),(234,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Sudáfrica',NULL,3,78),(235,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Spain',NULL,1,79),(236,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Espagne',NULL,2,79),(237,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'España',NULL,3,79),(238,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Sudan',NULL,1,80),(239,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Soudan',NULL,2,80),(240,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Sudán',NULL,3,80),(241,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Sweden',NULL,1,81),(242,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Suède',NULL,2,81),(243,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Suecia',NULL,3,81),(244,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Switzerland',NULL,1,82),(245,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Suisse',NULL,2,82),(246,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Suiza',NULL,3,82),(247,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Syria',NULL,1,83),(248,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Syrie',NULL,2,83),(249,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Siria',NULL,3,83),(250,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Taiwan',NULL,1,84),(251,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Taiwan',NULL,2,84),(252,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Taiwán',NULL,3,84),(253,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Thailand',NULL,1,85),(254,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Thaïlande',NULL,2,85),(255,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Tailandia',NULL,3,85),(256,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Tunisia',NULL,1,86),(257,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Tunisie',NULL,2,86),(258,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Túnez',NULL,3,86),(259,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Turkey',NULL,1,87),(260,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Turquie',NULL,2,87),(261,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Turquía',NULL,3,87),(262,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Ukraine',NULL,1,88),(263,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Ukraine',NULL,2,88),(264,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Ucrania',NULL,3,88),(265,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'United Arab Emirates',NULL,1,89),(266,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Emirats Arabes Unis',NULL,2,89),(267,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Emiratos Árabes Unidos',NULL,3,89),(268,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'United Kingdom',NULL,1,90),(269,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Royaume-Uni',NULL,2,90),(270,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'Reino Unido',NULL,3,90),(271,'2020-10-06 10:41:07','2020-10-06 10:41:07',NULL,NULL,'United States',NULL,1,91),(272,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Etats-Unis',NULL,2,91),(273,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Estados Unidos',NULL,3,91),(274,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Uruguay',NULL,1,92),(275,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Uruguay',NULL,2,92),(276,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Uruguay',NULL,3,92),(277,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Venezuela',NULL,1,93),(278,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Vénézuela',NULL,2,93),(279,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Venezuela',NULL,3,93),(280,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Vietnam',NULL,1,94),(281,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Vietnam',NULL,2,94),(282,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Vietnam',NULL,3,94),(283,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Yemen',NULL,1,95),(284,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Yémen',NULL,2,95),(285,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Yemen',NULL,3,95);
/*!40000 ALTER TABLE `country_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `CURRENCY_ID` bigint NOT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `CURRENCY_CURRENCY_CODE` varchar(255) NOT NULL,
  `CURRENCY_NAME` varchar(255) DEFAULT NULL,
  `CURRENCY_SUPPORTED` bit(1) DEFAULT NULL,
  PRIMARY KEY (`CURRENCY_ID`),
  UNIQUE KEY `UK_m7ku15ekud52vp67ry73a36te` (`CURRENCY_CURRENCY_CODE`),
  UNIQUE KEY `UK_1ubr7n96hjajamtggqp090a4x` (`CURRENCY_CODE`),
  UNIQUE KEY `UK_7r1k69cbk5giewqr5c9r4v6f` (`CURRENCY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'FJD','FJD','FJD',_binary ''),(2,'MXN','MXN','MXN',_binary ''),(3,'STD','STD','STD',_binary ''),(4,'LVL','LVL','LVL',_binary ''),(5,'SCR','SCR','SCR',_binary ''),(6,'CDF','CDF','CDF',_binary ''),(7,'BBD','BBD','BBD',_binary ''),(8,'GTQ','GTQ','GTQ',_binary ''),(9,'CLP','CLP','CLP',_binary ''),(10,'HNL','HNL','HNL',_binary ''),(11,'UGX','UGX','UGX',_binary ''),(12,'ZAR','ZAR','ZAR',_binary ''),(13,'MXV','MXV','MXV',_binary ''),(14,'TND','TND','TND',_binary ''),(15,'BSD','BSD','BSD',_binary ''),(16,'SLL','SLL','SLL',_binary ''),(17,'SDG','SDG','SDG',_binary ''),(18,'IQD','IQD','IQD',_binary ''),(19,'CUP','CUP','CUP',_binary ''),(20,'GMD','GMD','GMD',_binary ''),(21,'TWD','TWD','TWD',_binary ''),(22,'RSD','RSD','RSD',_binary ''),(23,'DOP','DOP','DOP',_binary ''),(24,'KMF','KMF','KMF',_binary ''),(25,'MYR','MYR','MYR',_binary ''),(26,'FKP','FKP','FKP',_binary ''),(27,'XOF','XOF','XOF',_binary ''),(28,'GEL','GEL','GEL',_binary ''),(29,'UYU','UYU','UYU',_binary ''),(30,'MAD','MAD','MAD',_binary ''),(31,'CVE','CVE','CVE',_binary ''),(32,'AZN','AZN','AZN',_binary ''),(33,'OMR','OMR','OMR',_binary ''),(34,'PGK','PGK','PGK',_binary ''),(35,'KES','KES','KES',_binary ''),(36,'SEK','SEK','SEK',_binary ''),(37,'BTN','BTN','BTN',_binary ''),(38,'UAH','UAH','UAH',_binary ''),(39,'GNF','GNF','GNF',_binary ''),(40,'ERN','ERN','ERN',_binary ''),(41,'MZN','MZN','MZN',_binary ''),(42,'SVC','SVC','SVC',_binary ''),(43,'ARS','ARS','ARS',_binary ''),(44,'QAR','QAR','QAR',_binary ''),(45,'IRR','IRR','IRR',_binary ''),(46,'MRO','MRO','MRO',_binary ''),(47,'CNY','CNY','CNY',_binary ''),(48,'XPF','XPF','XPF',_binary ''),(49,'THB','THB','THB',_binary ''),(50,'UZS','UZS','UZS',_binary ''),(51,'BDT','BDT','BDT',_binary ''),(52,'LYD','LYD','LYD',_binary ''),(53,'BMD','BMD','BMD',_binary ''),(54,'KWD','KWD','KWD',_binary ''),(55,'PHP','PHP','PHP',_binary ''),(56,'RUB','RUB','RUB',_binary ''),(57,'PYG','PYG','PYG',_binary ''),(58,'ISK','ISK','ISK',_binary ''),(59,'JMD','JMD','JMD',_binary ''),(60,'COP','COP','COP',_binary ''),(61,'USD','USD','USD',_binary ''),(62,'MKD','MKD','MKD',_binary ''),(63,'DZD','DZD','DZD',_binary ''),(64,'PAB','PAB','PAB',_binary ''),(65,'SGD','SGD','SGD',_binary ''),(66,'ETB','ETB','ETB',_binary ''),(67,'KGS','KGS','KGS',_binary ''),(68,'SOS','SOS','SOS',_binary ''),(69,'VUV','VUV','VUV',_binary ''),(70,'VEF','VEF','VEF',_binary ''),(71,'LAK','LAK','LAK',_binary ''),(72,'BND','BND','BND',_binary ''),(73,'ZMK','ZMK','ZMK',_binary ''),(74,'XAF','XAF','XAF',_binary ''),(75,'LRD','LRD','LRD',_binary ''),(76,'HRK','HRK','HRK',_binary ''),(77,'CHF','CHF','CHF',_binary ''),(78,'ALL','ALL','ALL',_binary ''),(79,'DJF','DJF','DJF',_binary ''),(80,'TZS','TZS','TZS',_binary ''),(81,'VND','VND','VND',_binary ''),(82,'AUD','AUD','AUD',_binary ''),(83,'ILS','ILS','ILS',_binary ''),(84,'GHS','GHS','GHS',_binary ''),(85,'GYD','GYD','GYD',_binary ''),(86,'KPW','KPW','KPW',_binary ''),(87,'BOB','BOB','BOB',_binary ''),(88,'KHR','KHR','KHR',_binary ''),(89,'MDL','MDL','MDL',_binary ''),(90,'IDR','IDR','IDR',_binary ''),(91,'KYD','KYD','KYD',_binary ''),(92,'AMD','AMD','AMD',_binary ''),(93,'BWP','BWP','BWP',_binary ''),(94,'SHP','SHP','SHP',_binary ''),(95,'TRY','TRY','TRY',_binary ''),(96,'LBP','LBP','LBP',_binary ''),(97,'TJS','TJS','TJS',_binary ''),(98,'JOD','JOD','JOD',_binary ''),(99,'HKD','HKD','HKD',_binary ''),(100,'RWF','RWF','RWF',_binary ''),(101,'AED','AED','AED',_binary ''),(102,'EUR','EUR','EUR',_binary ''),(103,'LSL','LSL','LSL',_binary ''),(104,'DKK','DKK','DKK',_binary ''),(105,'CAD','CAD','CAD',_binary ''),(106,'BOV','BOV','BOV',_binary ''),(107,'BGN','BGN','BGN',_binary ''),(108,'MMK','MMK','MMK',_binary ''),(109,'NOK','NOK','NOK',_binary ''),(110,'MUR','MUR','MUR',_binary ''),(111,'SYP','SYP','SYP',_binary ''),(112,'GIP','GIP','GIP',_binary ''),(113,'RON','RON','RON',_binary ''),(114,'LKR','LKR','LKR',_binary ''),(115,'NGN','NGN','NGN',_binary ''),(116,'CRC','CRC','CRC',_binary ''),(117,'CZK','CZK','CZK',_binary ''),(118,'PKR','PKR','PKR',_binary ''),(119,'XCD','XCD','XCD',_binary ''),(120,'ANG','ANG','ANG',_binary ''),(121,'HTG','HTG','HTG',_binary ''),(122,'BHD','BHD','BHD',_binary ''),(123,'KZT','KZT','KZT',_binary ''),(124,'SRD','SRD','SRD',_binary ''),(125,'SZL','SZL','SZL',_binary ''),(126,'LTL','LTL','LTL',_binary ''),(127,'SAR','SAR','SAR',_binary ''),(128,'TTD','TTD','TTD',_binary ''),(129,'YER','YER','YER',_binary ''),(130,'MVR','MVR','MVR',_binary ''),(131,'AFN','AFN','AFN',_binary ''),(132,'INR','INR','INR',_binary ''),(133,'AWG','AWG','AWG',_binary ''),(134,'KRW','KRW','KRW',_binary ''),(135,'NPR','NPR','NPR',_binary ''),(136,'JPY','JPY','JPY',_binary ''),(137,'MNT','MNT','MNT',_binary ''),(138,'AOA','AOA','AOA',_binary ''),(139,'PLN','PLN','PLN',_binary ''),(140,'GBP','GBP','GBP',_binary ''),(141,'SBD','SBD','SBD',_binary ''),(142,'HUF','HUF','HUF',_binary ''),(143,'BYR','BYR','BYR',_binary ''),(144,'BIF','BIF','BIF',_binary ''),(145,'MWK','MWK','MWK',_binary ''),(146,'MGA','MGA','MGA',_binary ''),(147,'XDR','XDR','XDR',_binary ''),(148,'BZD','BZD','BZD',_binary ''),(149,'BAM','BAM','BAM',_binary ''),(150,'EGP','EGP','EGP',_binary ''),(151,'MOP','MOP','MOP',_binary ''),(152,'NAD','NAD','NAD',_binary ''),(153,'NIO','NIO','NIO',_binary ''),(154,'PEN','PEN','PEN',_binary ''),(155,'NZD','NZD','NZD',_binary ''),(156,'WST','WST','WST',_binary ''),(157,'CLF','CLF','CLF',_binary ''),(158,'BRL','BRL','BRL',_binary '');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CUSTOMER_ID` bigint NOT NULL,
  `CUSTOMER_ANONYMOUS` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `BILLING_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `BILLING_CITY` varchar(100) DEFAULT NULL,
  `BILLING_COMPANY` varchar(100) DEFAULT NULL,
  `BILLING_FIRST_NAME` varchar(64) NOT NULL,
  `BILLING_LAST_NAME` varchar(64) NOT NULL,
  `LATITUDE` varchar(100) DEFAULT NULL,
  `LONGITUDE` varchar(100) DEFAULT NULL,
  `BILLING_POSTCODE` varchar(20) DEFAULT NULL,
  `BILLING_STATE` varchar(100) DEFAULT NULL,
  `BILLING_TELEPHONE` varchar(32) DEFAULT NULL,
  `CUSTOMER_COMPANY` varchar(100) DEFAULT NULL,
  `REVIEW_AVG` decimal(19,2) DEFAULT NULL,
  `REVIEW_COUNT` int DEFAULT NULL,
  `CUSTOMER_DOB` datetime DEFAULT NULL,
  `DELIVERY_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `DELIVERY_CITY` varchar(100) DEFAULT NULL,
  `DELIVERY_COMPANY` varchar(100) DEFAULT NULL,
  `DELIVERY_FIRST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_LAST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_POSTCODE` varchar(20) DEFAULT NULL,
  `DELIVERY_STATE` varchar(100) DEFAULT NULL,
  `DELIVERY_TELEPHONE` varchar(32) DEFAULT NULL,
  `CUSTOMER_EMAIL_ADDRESS` varchar(96) NOT NULL,
  `CUSTOMER_GENDER` varchar(1) DEFAULT NULL,
  `CUSTOMER_NICK` varchar(96) DEFAULT NULL,
  `CUSTOMER_PASSWORD` varchar(60) DEFAULT NULL,
  `PROVIDER` varchar(255) DEFAULT NULL,
  `BILLING_COUNTRY_ID` int NOT NULL,
  `BILLING_ZONE_ID` bigint DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `DELIVERY_COUNTRY_ID` int DEFAULT NULL,
  `DELIVERY_ZONE_ID` bigint DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  UNIQUE KEY `UKapr0m3g0lqgdjgtc2m8dmk267` (`MERCHANT_ID`,`CUSTOMER_EMAIL_ADDRESS`),
  KEY `FK5pas8t9mknk4kkin55t4v300l` (`BILLING_COUNTRY_ID`),
  KEY `FKp0xcpa3i2mgdr0kq43xiibx40` (`BILLING_ZONE_ID`),
  KEY `FKdgjqmj04qt89gmfloo4ofojcw` (`LANGUAGE_ID`),
  KEY `FKbxyooiceli2ko29bupdye6jgn` (`DELIVERY_COUNTRY_ID`),
  KEY `FK3k21jw28bbx043c2mnhevg9w4` (`DELIVERY_ZONE_ID`),
  CONSTRAINT `FK3k21jw28bbx043c2mnhevg9w4` FOREIGN KEY (`DELIVERY_ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FK5pas8t9mknk4kkin55t4v300l` FOREIGN KEY (`BILLING_COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FK8122nrpakxu3umk1od4v0xxoa` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKbxyooiceli2ko29bupdye6jgn` FOREIGN KEY (`DELIVERY_COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FKdgjqmj04qt89gmfloo4ofojcw` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKp0xcpa3i2mgdr0kq43xiibx40` FOREIGN KEY (`BILLING_ZONE_ID`) REFERENCES `zone` (`ZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,_binary '\0',NULL,'2020-10-10 11:39:46',NULL,'138, Azad Road,','MUMBAI','','Shabbir','Manasawala',NULL,NULL,'400057','','09987232350',NULL,0.00,0,NULL,'138, Azad Road,','MUMBAI','','Shabbir','Manasawala','400057','','09987232350','shabbir.manasawala52@gmail.com','M','jJMjAk','$2a$10$pvpQhH8p3DRya1ncbN/6kO.WuBageUaa.4O1JDJhQ6aCMoaJHyyGe',NULL,37,206,1,37,206,1),(4,_binary '\0',NULL,'2020-10-10 11:44:17',NULL,'138, Azad Road,','MUMBAI','','Shabbir','Manasawala',NULL,NULL,'400057','','9987232350',NULL,0.00,0,NULL,'138, Azad Road,','MUMBAI','','Shabbir','Manasawala','400057','','9987232350','1shabbir.manasawala52@gmail.com','M','Qzzsba','$2a$10$Toe/bcpGrKk7kHRPumDbQOFNRdo4/Rfcaw1NpqRHcySex/6hUUHNO',NULL,37,206,1,37,206,1),(7,_binary '\0',NULL,'2020-10-10 11:53:33',NULL,'138, Azad Road,','MUMBAI','','Shabbir','Manasawala',NULL,NULL,'400057','','09987232350',NULL,0.00,0,NULL,'138, Azad Road,','MUMBAI','','Shabbir','Manasawala','400057','','09987232350','2shabbir.manasawala52@gmail.com','M','oAAIkz','$2a$10$nJpK7xtea/7x.SdjcTzVH.v9MPRcDxIaw/SOomVIMbquNfxH7pQB.',NULL,37,206,1,37,206,1),(8,_binary '\0',NULL,'2020-10-10 12:10:25',NULL,'138, Azad Road,','MUMBAI','','Shabbir','Manasawala',NULL,NULL,'400057','','09987232350',NULL,0.00,0,NULL,'138, Azad Road,','MUMBAI','','Shabbir','Manasawala','400057','','09987232350','kasim.trophy@gmail.com','M','kasim.trophy@gmail.com','$2a$10$Y84.M.gBwTUYsf.b/5uIkOS2epXQpQcNIfq9XMjN6dSi59EfPiBom',NULL,37,206,1,37,206,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_attribute`
--

DROP TABLE IF EXISTS `customer_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_attribute` (
  `CUSTOMER_ATTRIBUTE_ID` bigint NOT NULL,
  `CUSTOMER_ATTR_TXT_VAL` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint NOT NULL,
  `OPTION_ID` bigint NOT NULL,
  `OPTION_VALUE_ID` bigint NOT NULL,
  PRIMARY KEY (`CUSTOMER_ATTRIBUTE_ID`),
  UNIQUE KEY `UK46kbpre88yh963gewm3kmdni1` (`OPTION_ID`,`CUSTOMER_ID`),
  KEY `FKc3318o13i2bpxkci1bh52we5a` (`CUSTOMER_ID`),
  KEY `FK9fl7iexvdeeeoch9fh35o5vw4` (`OPTION_VALUE_ID`),
  CONSTRAINT `FK4xugs9yd9w4o3sw11fisb8tj5` FOREIGN KEY (`OPTION_ID`) REFERENCES `customer_option` (`CUSTOMER_OPTION_ID`),
  CONSTRAINT `FK9fl7iexvdeeeoch9fh35o5vw4` FOREIGN KEY (`OPTION_VALUE_ID`) REFERENCES `customer_option_value` (`CUSTOMER_OPTION_VALUE_ID`),
  CONSTRAINT `FKc3318o13i2bpxkci1bh52we5a` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_attribute`
--

LOCK TABLES `customer_attribute` WRITE;
/*!40000 ALTER TABLE `customer_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_group` (
  `CUSTOMER_ID` bigint NOT NULL,
  `GROUP_ID` int NOT NULL,
  KEY `FKgrr5v89l1m9sl2qol62bbctq4` (`GROUP_ID`),
  KEY `FK257h3e27f4ujw08doqtq46hho` (`CUSTOMER_ID`),
  CONSTRAINT `FK257h3e27f4ujw08doqtq46hho` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKgrr5v89l1m9sl2qol62bbctq4` FOREIGN KEY (`GROUP_ID`) REFERENCES `sm_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_group`
--

LOCK TABLES `customer_group` WRITE;
/*!40000 ALTER TABLE `customer_group` DISABLE KEYS */;
INSERT INTO `customer_group` VALUES (1,8),(4,8),(7,8),(8,8);
/*!40000 ALTER TABLE `customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_opt_val_description`
--

DROP TABLE IF EXISTS `customer_opt_val_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_opt_val_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CUSTOMER_OPT_VAL_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKge7f2t1d31r87wnk09h9u1tnv` (`CUSTOMER_OPT_VAL_ID`,`LANGUAGE_ID`),
  KEY `FK6rfssi3qfx4pswicxrfb18c1` (`LANGUAGE_ID`),
  CONSTRAINT `FK6rfssi3qfx4pswicxrfb18c1` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKhwrs6fyqk6vh11yvcflu42yef` FOREIGN KEY (`CUSTOMER_OPT_VAL_ID`) REFERENCES `customer_option_value` (`CUSTOMER_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_opt_val_description`
--

LOCK TABLES `customer_opt_val_description` WRITE;
/*!40000 ALTER TABLE `customer_opt_val_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_opt_val_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_optin`
--

DROP TABLE IF EXISTS `customer_optin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_optin` (
  `CUSTOMER_OPTIN_ID` bigint NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `FIRST` varchar(255) DEFAULT NULL,
  `LAST` varchar(255) DEFAULT NULL,
  `OPTIN_DATE` datetime DEFAULT NULL,
  `VALUE` longtext,
  `MERCHANT_ID` int NOT NULL,
  `OPTIN_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_OPTIN_ID`),
  UNIQUE KEY `UKc4fnyu0pvxxtrbko10rm1jqyw` (`EMAIL`,`OPTIN_ID`),
  KEY `FKk5v94dvhsgibaw89hv4m8o5yw` (`MERCHANT_ID`),
  KEY `FK7qym878m07cwvs4foe68lvqjt` (`OPTIN_ID`),
  CONSTRAINT `FK7qym878m07cwvs4foe68lvqjt` FOREIGN KEY (`OPTIN_ID`) REFERENCES `optin` (`OPTIN_ID`),
  CONSTRAINT `FKk5v94dvhsgibaw89hv4m8o5yw` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_optin`
--

LOCK TABLES `customer_optin` WRITE;
/*!40000 ALTER TABLE `customer_optin` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_optin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_option`
--

DROP TABLE IF EXISTS `customer_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_option` (
  `CUSTOMER_OPTION_ID` bigint NOT NULL,
  `CUSTOMER_OPT_ACTIVE` bit(1) DEFAULT NULL,
  `CUSTOMER_OPT_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_OPTION_TYPE` varchar(10) DEFAULT NULL,
  `CUSTOMER_OPT_PUBLIC` bit(1) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CUSTOMER_OPTION_ID`),
  UNIQUE KEY `UKrov34a6g4dhhiqukvhp1ggm0u` (`MERCHANT_ID`,`CUSTOMER_OPT_CODE`),
  KEY `CUST_OPT_CODE_IDX` (`CUSTOMER_OPT_CODE`),
  CONSTRAINT `FKcmqnh0rn2hukdfowean5tdy8k` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_option`
--

LOCK TABLES `customer_option` WRITE;
/*!40000 ALTER TABLE `customer_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_option_desc`
--

DROP TABLE IF EXISTS `customer_option_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_option_desc` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `CUSTOMER_OPTION_COMMENT` longtext,
  `LANGUAGE_ID` int NOT NULL,
  `CUSTOMER_OPTION_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UK6ovl4t1ciag1wubtcebaoo7vi` (`CUSTOMER_OPTION_ID`,`LANGUAGE_ID`),
  KEY `FKm4iu7v9db17wk2a03xqbqdlfa` (`LANGUAGE_ID`),
  CONSTRAINT `FKc2yiucjbw0wjha8ww7a01qfeo` FOREIGN KEY (`CUSTOMER_OPTION_ID`) REFERENCES `customer_option` (`CUSTOMER_OPTION_ID`),
  CONSTRAINT `FKm4iu7v9db17wk2a03xqbqdlfa` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_option_desc`
--

LOCK TABLES `customer_option_desc` WRITE;
/*!40000 ALTER TABLE `customer_option_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_option_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_option_set`
--

DROP TABLE IF EXISTS `customer_option_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_option_set` (
  `CUSTOMER_OPTIONSET_ID` bigint NOT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `CUSTOMER_OPTION_ID` bigint NOT NULL,
  `CUSTOMER_OPTION_VALUE_ID` bigint NOT NULL,
  PRIMARY KEY (`CUSTOMER_OPTIONSET_ID`),
  UNIQUE KEY `UK4peli2ritnnq2xqpyq188srm6` (`CUSTOMER_OPTION_ID`,`CUSTOMER_OPTION_VALUE_ID`),
  KEY `FKj9vnvyh6hhhftjbcsymgiodm9` (`CUSTOMER_OPTION_VALUE_ID`),
  CONSTRAINT `FK1y5qtsuabhpwft3dyhqrgmtb4` FOREIGN KEY (`CUSTOMER_OPTION_ID`) REFERENCES `customer_option` (`CUSTOMER_OPTION_ID`),
  CONSTRAINT `FKj9vnvyh6hhhftjbcsymgiodm9` FOREIGN KEY (`CUSTOMER_OPTION_VALUE_ID`) REFERENCES `customer_option_value` (`CUSTOMER_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_option_set`
--

LOCK TABLES `customer_option_set` WRITE;
/*!40000 ALTER TABLE `customer_option_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_option_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_option_value`
--

DROP TABLE IF EXISTS `customer_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_option_value` (
  `CUSTOMER_OPTION_VALUE_ID` bigint NOT NULL,
  `CUSTOMER_OPT_VAL_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_OPT_VAL_IMAGE` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CUSTOMER_OPTION_VALUE_ID`),
  UNIQUE KEY `UKcb1fmv71nrx7m1rlx1ff5qvdt` (`MERCHANT_ID`,`CUSTOMER_OPT_VAL_CODE`),
  KEY `CUST_OPT_VAL_CODE_IDX` (`CUSTOMER_OPT_VAL_CODE`),
  CONSTRAINT `FKho87ssg5rnvwauj3y690a96g6` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_option_value`
--

LOCK TABLES `customer_option_value` WRITE;
/*!40000 ALTER TABLE `customer_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_review`
--

DROP TABLE IF EXISTS `customer_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_review` (
  `CUSTOMER_REVIEW_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `REVIEW_DATE` datetime DEFAULT NULL,
  `REVIEWS_RATING` double DEFAULT NULL,
  `REVIEWS_READ` bigint DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  `CUSTOMERS_ID` bigint DEFAULT NULL,
  `REVIEWED_CUSTOMER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_REVIEW_ID`),
  UNIQUE KEY `UK2momthbfrtgico2yyod8w18pk` (`CUSTOMERS_ID`,`REVIEWED_CUSTOMER_ID`),
  KEY `FK7pmqdk9od2af7cl6alx82fkek` (`REVIEWED_CUSTOMER_ID`),
  CONSTRAINT `FK7pmqdk9od2af7cl6alx82fkek` FOREIGN KEY (`REVIEWED_CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKayt6tbxp7d4g1qyg8crw2n73p` FOREIGN KEY (`CUSTOMERS_ID`) REFERENCES `customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_review`
--

LOCK TABLES `customer_review` WRITE;
/*!40000 ALTER TABLE `customer_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_review_description`
--

DROP TABLE IF EXISTS `customer_review_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_review_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CUSTOMER_REVIEW_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UK1va9q0nhoe3wli25ktpmouvyh` (`CUSTOMER_REVIEW_ID`,`LANGUAGE_ID`),
  KEY `FK5pkgrlk32uqaxkrbve5mws1hj` (`LANGUAGE_ID`),
  CONSTRAINT `FK5pkgrlk32uqaxkrbve5mws1hj` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKhf88oagf6t62k28afn8uaijc7` FOREIGN KEY (`CUSTOMER_REVIEW_ID`) REFERENCES `customer_review` (`CUSTOMER_REVIEW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_review_description`
--

LOCK TABLES `customer_review_description` WRITE;
/*!40000 ALTER TABLE `customer_review_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_review_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_history`
--

DROP TABLE IF EXISTS `file_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_history` (
  `FILE_HISTORY_ID` bigint NOT NULL,
  `ACCOUNTED_DATE` datetime DEFAULT NULL,
  `DATE_ADDED` datetime NOT NULL,
  `DATE_DELETED` datetime DEFAULT NULL,
  `DOWNLOAD_COUNT` int NOT NULL,
  `FILE_ID` bigint DEFAULT NULL,
  `FILESIZE` int NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`FILE_HISTORY_ID`),
  UNIQUE KEY `UKav35sb3v4nxq8v1n1rkxufir` (`MERCHANT_ID`,`FILE_ID`),
  CONSTRAINT `FK2k8h4penkjlbtc23vamwyek2g` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_history`
--

LOCK TABLES `file_history` WRITE;
/*!40000 ALTER TABLE `file_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geozone`
--

DROP TABLE IF EXISTS `geozone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geozone` (
  `GEOZONE_ID` bigint NOT NULL,
  `GEOZONE_CODE` varchar(255) DEFAULT NULL,
  `GEOZONE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`GEOZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geozone`
--

LOCK TABLES `geozone` WRITE;
/*!40000 ALTER TABLE `geozone` DISABLE KEYS */;
/*!40000 ALTER TABLE `geozone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geozone_description`
--

DROP TABLE IF EXISTS `geozone_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geozone_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `GEOZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKsoq8o99w3c8ys3ntamt5i4mat` (`GEOZONE_ID`,`LANGUAGE_ID`),
  KEY `FK1t2hp628edebe5d6co2whbla9` (`LANGUAGE_ID`),
  CONSTRAINT `FK1t2hp628edebe5d6co2whbla9` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKn82te2yb2st4hk2qlhl8ileb9` FOREIGN KEY (`GEOZONE_ID`) REFERENCES `geozone` (`GEOZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geozone_description`
--

LOCK TABLES `geozone_description` WRITE;
/*!40000 ALTER TABLE `geozone_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `geozone_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `LANGUAGE_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CODE` varchar(255) NOT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  PRIMARY KEY (`LANGUAGE_ID`),
  KEY `CODE_IDX2` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'en',NULL),(2,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'fr',NULL),(3,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'es',NULL),(4,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'ar',NULL),(5,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'ru',NULL);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `MANUFACTURER_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CODE` varchar(100) NOT NULL,
  `MANUFACTURER_IMAGE` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`MANUFACTURER_ID`),
  UNIQUE KEY `UK6brqfdkga7jc78n8dh3v595y3` (`MERCHANT_ID`,`CODE`),
  CONSTRAINT `FKhswph4nthrqwffjekccudsrt2` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'DEFAULT',NULL,0,1),(2,'2020-10-06 11:04:38','2020-10-06 11:04:38',NULL,'global',NULL,0,1),(50,'2020-10-10 11:00:55','2020-10-10 11:00:55',NULL,'vintage',NULL,0,1),(51,'2020-10-10 11:01:34','2020-10-10 11:01:34',NULL,'Retro',NULL,0,1),(52,'2020-10-10 11:01:53','2020-10-10 11:01:53',NULL,'Nike',NULL,0,1),(53,'2020-10-10 11:02:16','2020-10-10 11:02:16',NULL,'Reebok',NULL,0,1);
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer_description`
--

DROP TABLE IF EXISTS `manufacturer_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `DATE_LAST_CLICK` datetime DEFAULT NULL,
  `MANUFACTURERS_URL` varchar(255) DEFAULT NULL,
  `URL_CLICKED` int DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `MANUFACTURER_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKlpv09p83sc887clxe04nroup6` (`MANUFACTURER_ID`,`LANGUAGE_ID`),
  KEY `FK20t33wr4tp1kt1uyw7s8a3afl` (`LANGUAGE_ID`),
  CONSTRAINT `FK20t33wr4tp1kt1uyw7s8a3afl` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKre4iys57n5cfbgpg3qqgewtrh` FOREIGN KEY (`MANUFACTURER_ID`) REFERENCES `manufacturer` (`MANUFACTURER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer_description`
--

LOCK TABLES `manufacturer_description` WRITE;
/*!40000 ALTER TABLE `manufacturer_description` DISABLE KEYS */;
INSERT INTO `manufacturer_description` VALUES (1,'2020-10-10 16:29:18','2020-10-10 16:29:18',NULL,'<p>\r\n	DEFAULT</p>\r\n','DEFAULT','',NULL,'',NULL,1,1),(2,'2020-10-06 11:04:38','2020-10-06 11:04:38',NULL,'<p>\r\n	العالمية الصناعية</p>\r\n','العالمية الصناعية','العالمية الصناعية',NULL,'اعية',NULL,2,2),(3,'2020-10-10 16:29:40','2020-10-10 16:29:40',NULL,'<p>\r\n	Global Industrial</p>\r\n','Global Industrial','Global Industrial',NULL,'global-industrial',NULL,1,2),(4,'2020-10-10 11:00:55','2020-10-10 11:00:55',NULL,'','Vintage','Vintage',NULL,'vintage',NULL,2,50),(5,'2020-10-10 16:30:43','2020-10-10 16:30:43',NULL,'<p>\r\n	Vintage</p>\r\n','Vintage','Vintage',NULL,'vintage',NULL,1,50),(6,'2020-10-10 16:30:29','2020-10-10 16:30:29',NULL,'<p>\r\n	Retro</p>\r\n','Retro','Retro',NULL,'retro',NULL,1,51),(7,'2020-10-10 11:01:34','2020-10-10 11:01:34',NULL,'','Retro','Retro',NULL,'retro',NULL,2,51),(8,'2020-10-10 11:01:53','2020-10-10 11:01:53',NULL,'','Nike','Nike',NULL,'nike',NULL,2,52),(9,'2020-10-10 16:29:56','2020-10-10 16:29:56',NULL,'<p>\r\n	Nike</p>\r\n','Nike','Nike',NULL,'nike',NULL,1,52),(10,'2020-10-10 16:30:13','2020-10-10 16:30:13',NULL,'<p>\r\n	Reebok</p>\r\n','Reebok','Reebok',NULL,'reebok',NULL,1,53),(11,'2020-10-10 11:02:16','2020-10-10 11:02:16',NULL,'','Reebok','Reebok',NULL,'reebok',NULL,2,53),(12,'2020-10-10 16:29:18','2020-10-10 16:29:18',NULL,'<p>\r\n	DEFAULT</p>\r\n','DEFAULT','DEFAULT',NULL,'default',NULL,4,1),(13,'2020-10-10 16:29:40','2020-10-10 16:29:40',NULL,'<p>\r\n	Global Industrial</p>\r\n','Global Industrial','Global Industrial',NULL,'global-industrial',NULL,4,2),(14,'2020-10-10 16:29:56','2020-10-10 16:29:56',NULL,'<p>\r\n	Nike</p>\r\n','Nike','Nike',NULL,'nike',NULL,4,52),(15,'2020-10-10 16:30:13','2020-10-10 16:30:13',NULL,'<p>\r\n	Reebok</p>\r\n','Reebok','Reebok',NULL,'reebok',NULL,4,53),(16,'2020-10-10 16:30:29','2020-10-10 16:30:29',NULL,'<p>\r\n	Retro</p>\r\n','Retro','Retro',NULL,'retro',NULL,4,51),(17,'2020-10-10 16:30:43','2020-10-10 16:30:43',NULL,'<p>\r\n	Vintage</p>\r\n','Vintage','Vintage',NULL,'vintage',NULL,4,50);
/*!40000 ALTER TABLE `manufacturer_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_configuration`
--

DROP TABLE IF EXISTS `merchant_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_configuration` (
  `MERCHANT_CONFIG_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CONFIG_KEY` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` longtext,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`MERCHANT_CONFIG_ID`),
  UNIQUE KEY `UKj0c3h8onw3m6hjcr3yylst9fb` (`MERCHANT_ID`,`CONFIG_KEY`),
  CONSTRAINT `FKf9bkgf0ysbp5fo9j69shm0pri` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_configuration`
--

LOCK TABLES `merchant_configuration` WRITE;
/*!40000 ALTER TABLE `merchant_configuration` DISABLE KEYS */;
INSERT INTO `merchant_configuration` VALUES (1,_binary '\0','2020-10-06 10:41:23','2020-10-06 16:35:32',NULL,'CONFIG','CONFIG','{\"allowPurchaseItems\":true,\"displayContactUs\":true,\"displayCustomerAgreement\":true,\"defaultSearchConfigPath\":{},\"displayCustomerSection\":true,\"displayAddToCartOnFeaturedItems\":true,\"displayPagesMenu\":true,\"testMode\":false,\"displayStoreAddress\":true,\"displaySearchBox\":true,\"debugMode\":false,\"useDefaultSearchConfig\":{\"en\":true}}',1),(2,_binary '\0','2020-10-06 15:13:48','2020-10-10 11:38:54',NULL,'PAYMENT','INTEGRATION','df02614ab6600db0eb4d78e2c4df5574ce172c6d7f959eddfac2dd2de680dec3adf3483aea96b37f23df2033b89a0c828d51359acdbfbbf2cb8be89aa7bf06402ac17fe884bb140e7cd89ccdd00d2ec46980dcc6406e6ce29d51d4b4f4ea701896c661e6cf8ed9d6ec5c3051f3f8134277caccb06e5b08941bfbef7b4e1db1330cc4d868b948500e34e8b49459b65c9ac786fdf382517dbe0934425cf984b4beebe6f771df671a92399edf027892805303e45bc552ea23c642c953be258d2194db31ad219a30a107cd10f19a9a56e0c241917eae3fb989db1e3d88054739648e1ca539b15455f868f49857dd920b6b48f11f672c3485c9e5048b2a960e939676a8610bf79262f4cca80ad96f2b113b8c0ffbefba2d02306bc7fd3f0591bdd2417044de88c7a3c10981f8d1973eea0cbc4135ee1631d773c7d5059fc19bf609e8d47a3f8db79916c9604ff04fb115b48e8bc6b4b29e648738e40e474f244a5503cef079f43bf2e998d5cb9eff9435b3f50e70d8c6e0584bbca944b4980e2cb07cd2c9a198dca4099d239a3374086064bad57bdd553463c57fa6f3eee49ed0649acb910b37034e164f9e6bae2fccc213560b365507ccb9cb31ddd4c00a977e947628b377b95483e9063b5728eab2b55a322a420f17b6e772fc8e417e3e36802b6b9e93f8e1915ebf2c05835b7b662faf4cd660d68dc16c048a0f368df0f74b2594963b457a02dd2fedf1890e551378a3603c0d67fbb34dfb8b5f5a2131e2110d0ab3888a88e578086228d5e159eec8017ad5e384fa208f37ca05fa50696c54498ae0f1aa66ca6007f438ddeea1912527506dc1f6f150380105b87efdb03b000e386e3f35e5ac20e7c05b9e7a6c868b8181aa748f97454558745262f40c35ccf69e1f42ff5f6c30c914d5dcf90bb4e821bec081d0412c7a27568d66de8db741c83cc4468a4f5035ddb3eb864400ba1f5c7366ff5c645fd24e838adcd27e0a39e8731ad97392634592f087e3ba04063e6cca88c2ca20dcf66e533f295328a9c427aa83c7d0bfef33cb8daf950452dc891cd0214a3a3e543192b5146cfe3a8df9528f6295c4f0b8a49df6d0d93234388930d465a9f31dede47f3e61a7683977666a1b',1),(3,_binary '\0','2020-10-06 15:26:37','2020-10-09 18:10:24',NULL,'SHIPPING','INTEGRATION','df02614ab6600db0eb4d78e2c4df5574aa0324c2285e18aba55dd89532de92912fd89c537fc918dfce28875cd4694d36f31b98883738108ba44c465de95f7391469496fe157f67c530c809e75af5d772ad559678f7cd55d35e94d5ec6b334f8057e5ab98610acb97bc9c56e7e2197d1f19406b2821e4a80724ac48e53934f24970d6cb66a992d0541749e99a6dca54f91f46f7135af6e7a53e335348c2daa06b749d096c6b917a70d4384f2ff4615925df87591300c8f04855a698e72c809a0e121d22397108baf13d07d38df7f970531863078bc96aef8ba38fefd0927c6b39b708eca55ed98fa37c58146fb241af2c9304412e870663c43f50fa6e2beafee3e4d5ca6c6cac622e0735b5c7e1c6a691ff6b3a34782395e205ca0bd02f7ac38b29ed9b0404c93851c28960136c7edb397c5b2020c301a70d1b2b9dca51d8eeb0dd2ea89c711628efbc1cf2358d2245a848ed38ce8d416586a80460efb5c57948ce4301817fd1406e517fd2e3aeda338221f73a894827dca2efd74747ef0a9b243a5fe9d21b07fa679dc2e579804ec70cf811a9d31a491bfcf219ea15a264a0294a7bba9efe52e9eb0007bc1903892f46a94df10307f10c728234c8e4668846be1a4d1bbd2e1be5c8913fe8e40b9dd5cdfc5377e7c3013c97e592234062722a23',1),(4,_binary '\0','2020-10-06 15:27:38','2020-10-10 01:21:45',NULL,'SHIPPING_CONFIG','INTEGRATION','{\"boxLength\":0,\"orderTotalFreeShipping\":null,\"shipBaseType\":\"SHIPPING\",\"shipOptionPriceType\":\"ALL\",\"maxWeight\":0.0,\"boxHeight\":0,\"packages\":[],\"taxOnShipping\":false,\"shipPackageType\":\"ITEM\",\"freeShippingEnabled\":false,\"boxWeight\":0.0,\"shipType\":\"INTERNATIONAL\",\"boxWidth\":0,\"handlingFees\":50.00,\"shipDescription\":\"SHORT_DESCRIPTION\"}',1),(5,_binary '\0','2020-10-06 15:49:01','2020-10-10 11:34:39',NULL,'weightBased','INTEGRATION','{\"moduleCode\":\"weightBased\",\"active\":true,\"regions\":[{\"customRegionName\":\"Western India\",\"countries\":[]},{\"customRegionName\":\"Central India\",\"countries\":[\"IN\"],\"quoteItems\":[{\"price\":125.00,\"maximumWeight\":100},{\"price\":225.00,\"maximumWeight\":200}]},{\"customRegionName\":\"Southern India\",\"countries\":[\"IN\"],\"quoteItems\":[{\"price\":75.00,\"maximumWeight\":100},{\"price\":175.00,\"maximumWeight\":200}]},{\"customRegionName\":\"Northen India\",\"countries\":[\"IN\"],\"quoteItems\":[{\"price\":25.00,\"maximumWeight\":100},{\"price\":125.00,\"maximumWeight\":200}]},{\"customRegionName\":\"Maharashtra\",\"countries\":[]},{\"customRegionName\":\"IN\",\"countries\":[]},{\"customRegionName\":\"SA\",\"countries\":[\"SA\"],\"quoteItems\":[{\"price\":50.00,\"maximumWeight\":9},{\"price\":100.00,\"maximumWeight\":100}]},{\"customRegionName\":\"INDIA\",\"countries\":[]}]}',1),(50,_binary '\0','2020-10-10 11:46:04','2020-10-10 11:46:04',NULL,'google_analytics_url','SOCIAL','UA-509123',1),(51,_binary '\0','2020-10-09 18:09:14','2020-10-09 18:09:32',NULL,'SUPPORTED_CNTR','INTEGRATION','[\"IN\",\"SA\"]',1),(100,_binary '\0','2020-10-10 11:46:04','2020-10-10 11:46:04',NULL,'facebook_page_url','SOCIAL','https://www.facebook.com/',1),(101,_binary '\0','2020-10-10 11:46:04','2020-10-10 11:46:04',NULL,'instagram','SOCIAL','https://www.instagram.com/',1);
/*!40000 ALTER TABLE `merchant_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_language`
--

DROP TABLE IF EXISTS `merchant_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_language` (
  `stores_MERCHANT_ID` int NOT NULL,
  `languages_LANGUAGE_ID` int NOT NULL,
  KEY `FKjwy0pjijh1qmcoivq50o2jgec` (`languages_LANGUAGE_ID`),
  KEY `FKiisj0tmoujv6n3iqmytvo39kn` (`stores_MERCHANT_ID`),
  CONSTRAINT `FKiisj0tmoujv6n3iqmytvo39kn` FOREIGN KEY (`stores_MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKjwy0pjijh1qmcoivq50o2jgec` FOREIGN KEY (`languages_LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_language`
--

LOCK TABLES `merchant_language` WRITE;
/*!40000 ALTER TABLE `merchant_language` DISABLE KEYS */;
INSERT INTO `merchant_language` VALUES (1,1),(1,4);
/*!40000 ALTER TABLE `merchant_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_log`
--

DROP TABLE IF EXISTS `merchant_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_log` (
  `MERCHANT_LOG_ID` bigint NOT NULL,
  `LOG` longtext,
  `MODULE` varchar(25) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`MERCHANT_LOG_ID`),
  KEY `FKto727b9r68qrtn2vvdqdvd4ic` (`MERCHANT_ID`),
  CONSTRAINT `FKto727b9r68qrtn2vvdqdvd4ic` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_log`
--

LOCK TABLES `merchant_log` WRITE;
/*!40000 ALTER TABLE `merchant_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_store`
--

DROP TABLE IF EXISTS `merchant_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_store` (
  `MERCHANT_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `STORE_CODE` varchar(100) NOT NULL,
  `CONTINUESHOPPINGURL` varchar(150) DEFAULT NULL,
  `CURRENCY_FORMAT_NATIONAL` bit(1) DEFAULT NULL,
  `DOMAIN_NAME` varchar(80) DEFAULT NULL,
  `IN_BUSINESS_SINCE` date DEFAULT NULL,
  `INVOICE_TEMPLATE` varchar(25) DEFAULT NULL,
  `IS_RETAILER` bit(1) DEFAULT NULL,
  `SEIZEUNITCODE` varchar(5) DEFAULT NULL,
  `STORE_EMAIL` varchar(60) NOT NULL,
  `STORE_LOGO` varchar(100) DEFAULT NULL,
  `STORE_TEMPLATE` varchar(25) DEFAULT NULL,
  `STORE_ADDRESS` varchar(255) DEFAULT NULL,
  `STORE_CITY` varchar(100) DEFAULT NULL,
  `STORE_NAME` varchar(100) NOT NULL,
  `STORE_PHONE` varchar(50) DEFAULT NULL,
  `STORE_POSTAL_CODE` varchar(15) DEFAULT NULL,
  `STORE_STATE_PROV` varchar(100) DEFAULT NULL,
  `USE_CACHE` bit(1) DEFAULT NULL,
  `WEIGHTUNITCODE` varchar(5) DEFAULT NULL,
  `COUNTRY_ID` int NOT NULL,
  `CURRENCY_ID` bigint NOT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`MERCHANT_ID`),
  UNIQUE KEY `UK_4pvtsnqv4nlao8725n9ldpguf` (`STORE_CODE`),
  KEY `FK2gn7vpkd9x832urw7c6jlawnn` (`COUNTRY_ID`),
  KEY `FK63hlw9wp1k1x3f5tke7t2us7s` (`CURRENCY_ID`),
  KEY `FKdnemo9tl8tjhkxko83psvkv19` (`LANGUAGE_ID`),
  KEY `FKgkoele515h76u39b9defibkm9` (`PARENT_ID`),
  KEY `FK5o24aky9161jyofyxmg0g53vv` (`ZONE_ID`),
  CONSTRAINT `FK2gn7vpkd9x832urw7c6jlawnn` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FK5o24aky9161jyofyxmg0g53vv` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FK63hlw9wp1k1x3f5tke7t2us7s` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `currency` (`CURRENCY_ID`),
  CONSTRAINT `FKdnemo9tl8tjhkxko83psvkv19` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKgkoele515h76u39b9defibkm9` FOREIGN KEY (`PARENT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_store`
--

LOCK TABLES `merchant_store` WRITE;
/*!40000 ALTER TABLE `merchant_store` DISABLE KEYS */;
INSERT INTO `merchant_store` VALUES (1,NULL,NULL,NULL,'DEFAULT',NULL,_binary '','localhost:9193','2020-10-01',NULL,_binary '\0','IN','admin@wreximtech.com','chrome_YaE5LadEai.png','december','1234 Street address','Mumbai','WRexim Tech','123-1231-123','400057','',_binary '','KG',37,132,1,NULL,206);
/*!40000 ALTER TABLE `merchant_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchantstore`
--

DROP TABLE IF EXISTS `merchantstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantstore` (
  `MERCHANT_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `STORE_CODE` varchar(100) NOT NULL,
  `CONTINUESHOPPINGURL` varchar(150) DEFAULT NULL,
  `CURRENCY_FORMAT_NATIONAL` bit(1) DEFAULT NULL,
  `DOMAIN_NAME` varchar(80) DEFAULT NULL,
  `IN_BUSINESS_SINCE` date DEFAULT NULL,
  `INVOICE_TEMPLATE` varchar(25) DEFAULT NULL,
  `IS_RETAILER` bit(1) DEFAULT NULL,
  `SEIZEUNITCODE` varchar(5) DEFAULT NULL,
  `STORE_EMAIL` varchar(60) NOT NULL,
  `STORE_LOGO` varchar(100) DEFAULT NULL,
  `STORE_TEMPLATE` varchar(25) DEFAULT NULL,
  `STORE_ADDRESS` varchar(255) DEFAULT NULL,
  `STORE_CITY` varchar(100) DEFAULT NULL,
  `STORE_NAME` varchar(100) NOT NULL,
  `STORE_PHONE` varchar(50) DEFAULT NULL,
  `STORE_POSTAL_CODE` varchar(15) DEFAULT NULL,
  `STORE_STATE_PROV` varchar(100) DEFAULT NULL,
  `USE_CACHE` bit(1) DEFAULT NULL,
  `WEIGHTUNITCODE` varchar(5) DEFAULT NULL,
  `COUNTRY_ID` int NOT NULL,
  `CURRENCY_ID` bigint NOT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantstore`
--

LOCK TABLES `merchantstore` WRITE;
/*!40000 ALTER TABLE `merchantstore` DISABLE KEYS */;
INSERT INTO `merchantstore` VALUES (1,NULL,NULL,NULL,'DEFAULT',NULL,NULL,'localhost:9192','2020-10-06',NULL,_binary '\0','IN','john@test.com',NULL,'december','1234 Street address','My city','Default store','888-888-8888','H2H-2H2',NULL,_binary '\0','L',37,105,1,NULL,9);
/*!40000 ALTER TABLE `merchantstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_configuration`
--

DROP TABLE IF EXISTS `module_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_configuration` (
  `MODULE_CONF_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CODE` varchar(255) NOT NULL,
  `DETAILS` longtext,
  `CONFIGURATION` longtext,
  `CUSTOM_IND` bit(1) DEFAULT NULL,
  `IMAGE` varchar(255) DEFAULT NULL,
  `MODULE` varchar(255) DEFAULT NULL,
  `REGIONS` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MODULE_CONF_ID`),
  KEY `MODULE_CONFIGURATION_MODULE` (`MODULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_configuration`
--

LOCK TABLES `module_configuration` WRITE;
/*!40000 ALTER TABLE `module_configuration` DISABLE KEYS */;
INSERT INTO `module_configuration` VALUES (1,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'usps',NULL,'[{\"scheme\":\"http\",\"host\":\"testing.shippingapis.com\",\"port\":\"80\",\"uri\":\"/ShippingAPI.dll\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"http\",\"host\":\"production.shippingapis.com\",\"port\":\"80\",\"uri\":\"/ShippingAPI.dll\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','usps.jpg','SHIPPING','[\"US\"]',NULL),(2,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'canadapost',NULL,'[{\"scheme\":\"https\",\"host\":\"ct.soa-gw.canadapost.ca\",\"port\":\"443\",\"uri\":\"/rs/ship/price\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"soa-gw.canadapost.ca\",\"port\":\"443\",\"uri\":\"/rs/ship/price\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','canadapost.jpg','SHIPPING','[\"CA\"]',NULL),(3,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'ups','{\"01\":\"UPS Next Day Air\",\"02\":\"UPS Second Day Air\",\"03\":\"UPS Ground\",\"07\":\"UPS Worldwide Express\",\"08\":\"UPS Worldwide Expedited\",\"11\":\"UPS Standard\",\"12\":\"UPS Three-Day Select\",\"13\":\"UPS Next Day Air Saver\",\"14\":\"UPS Next Day Air Early A.M.\",\"54\":\"UPS Worldwide Express Plus\",\"59\":\"UPS Second Day Air A.M.\",\"69\":\"UPS Saver\"}','[{\"scheme\":\"https\",\"host\":\"wwwcie.ups.com\",\"port\":\"443\",\"uri\":\"/ups.app/xml/Rate\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"onlinetools.ups.com\",\"port\":\"443\",\"uri\":\"/xml/Rate\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','ups.jpg','SHIPPING','[\"US\",\"CA\",\"FR\",\"GB\"]',NULL),(4,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'weightBased',NULL,NULL,_binary '',NULL,'SHIPPING','[\"*\"]',NULL),(5,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'customQuotesRules',NULL,NULL,_binary '\0',NULL,'SHIPPING','[\"*\"]',NULL),(6,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'priceByDistance',NULL,NULL,_binary '\0',NULL,'SHIPPING','[\"*\"]',NULL),(7,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'storePickUp',NULL,NULL,_binary '\0',NULL,'SHIPPING','[\"*\"]',NULL),(8,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'moneyorder',NULL,NULL,_binary '\0','moneyorder.gif','PAYMENT','[\"*\"]','moneyorder'),(9,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'paypal-express-checkout',NULL,'[{\"scheme\":\"\",\"host\":\"\",\"port\":\"\",\"uri\":\"\",\"env\":\"TEST\",\"config1\":\"https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=\",\"config2\":null},{\"scheme\":\"\",\"host\":\"\",\"port\":\"\",\"uri\":\"\",\"env\":\"PROD\",\"config1\":\"https://www.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=\",\"config2\":null}]',_binary '\0','icon-paypal.png','PAYMENT','[\"*\"]','paypal'),(10,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'beanstream',NULL,'[{\"scheme\":\"https\",\"host\":\"www.beanstream.com\",\"port\":\"443\",\"uri\":\"/scripts/process_transaction.asp\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"www.beanstream.com\",\"port\":\"443\",\"uri\":\"/scripts/process_transaction.asp\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','beanstream.gif','PAYMENT','[\"US\",\"CA\",\"GB\"]','creditcard'),(11,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'stripe',NULL,'[{\"scheme\":\"https\",\"host\":\"www.stripe.com\",\"port\":\"443\",\"uri\":\"/\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"www.stripe.com\",\"port\":\"443\",\"uri\":\"/\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','stripe.png','PAYMENT','[\"US\",\"CA\",\"GB\",\"AU\",\"FI\",\"DK\",\"IE\",\"NO\",\"SE\",\"ES\",\"PT\"]','creditcard'),(12,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'stripe3',NULL,'[{\"scheme\":\"https\",\"host\":\"www.stripe.com\",\"port\":\"443\",\"uri\":\"/\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"www.stripe.com\",\"port\":\"443\",\"uri\":\"/\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','stripe.png','PAYMENT','[\"US\",\"CA\",\"GB\",\"AU\",\"FI\",\"DK\",\"IE\",\"NO\",\"SE\",\"ES\",\"PT\"]','creditcard'),(13,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'braintree',NULL,'[{\"scheme\":\"https\",\"host\":\"NOTREQUIRED\",\"port\":\"NOTREQUIRED\",\"uri\":\"NOTREQUIRED\",\"env\":\"TEST\",\"config1\":null,\"config2\":null},{\"scheme\":\"https\",\"host\":\"NOTREQUIRED\",\"port\":\"NOTREQUIRED\",\"uri\":\"NOTREQUIRED\",\"env\":\"PROD\",\"config1\":null,\"config2\":null}]',_binary '\0','braintree.jpg','PAYMENT','[\"US\",\"CA\",\"GB\",\"AU\",\"FI\",\"DK\",\"IE\",\"NO\",\"SE\",\"AL\",\"AD\",\"AT\",\"BY\",\"BE\",\"BG\",\"HY\",\"CY\",\"CZ\",\"FR\",\"GR\",\"IS\",\"IE\",\"IM\",\"IT\",\"PL\",\"LU\",\"CH\",\"RS\",\"SG\",\"MY\",\"HK\",\"NZ\"]','creditcard');
/*!40000 ALTER TABLE `module_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myguests`
--

DROP TABLE IF EXISTS `myguests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myguests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myguests`
--

LOCK TABLES `myguests` WRITE;
/*!40000 ALTER TABLE `myguests` DISABLE KEYS */;
/*!40000 ALTER TABLE `myguests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optin`
--

DROP TABLE IF EXISTS `optin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `optin` (
  `OPTIN_ID` bigint NOT NULL,
  `CODE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`OPTIN_ID`),
  UNIQUE KEY `UKmanlx6siq6ddf14cud40k8gw6` (`MERCHANT_ID`,`CODE`),
  CONSTRAINT `FK37xvfo4the20avv7f1e1771fh` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optin`
--

LOCK TABLES `optin` WRITE;
/*!40000 ALTER TABLE `optin` DISABLE KEYS */;
INSERT INTO `optin` VALUES (1,'NEWSLETTER',NULL,NULL,'NEWSLETTER',NULL,1);
/*!40000 ALTER TABLE `optin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_account`
--

DROP TABLE IF EXISTS `order_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_account` (
  `ORDER_ACCOUNT_ID` bigint NOT NULL,
  `ORDER_ACCOUNT_BILL_DAY` int NOT NULL,
  `ORDER_ACCOUNT_END_DATE` date DEFAULT NULL,
  `ORDER_ACCOUNT_START_DATE` date NOT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ACCOUNT_ID`),
  KEY `FKi6l5isodh81m5hy8ua06hx73n` (`ORDER_ID`),
  CONSTRAINT `FKi6l5isodh81m5hy8ua06hx73n` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_account`
--

LOCK TABLES `order_account` WRITE;
/*!40000 ALTER TABLE `order_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_account_product`
--

DROP TABLE IF EXISTS `order_account_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_account_product` (
  `ORDER_ACCOUNT_PRODUCT_ID` bigint NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_ACCNT_DT` date DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_END_DT` date DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_EOT` datetime DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_L_ST_DT` datetime DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_L_TRX_ST` int NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_PM_FR_TY` int NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_ST_DT` date NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_STATUS` int NOT NULL,
  `ORDER_ACCOUNT_ID` bigint NOT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ACCOUNT_PRODUCT_ID`),
  KEY `FK7oxc8ygov7vd2ajt185jhiwts` (`ORDER_ACCOUNT_ID`),
  KEY `FK5kiyyb8ekqi9bfowytww8atcx` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FK5kiyyb8ekqi9bfowytww8atcx` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `order_product` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FK7oxc8ygov7vd2ajt185jhiwts` FOREIGN KEY (`ORDER_ACCOUNT_ID`) REFERENCES `order_account` (`ORDER_ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_account_product`
--

LOCK TABLES `order_account_product` WRITE;
/*!40000 ALTER TABLE `order_account_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_account_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_attribute`
--

DROP TABLE IF EXISTS `order_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_attribute` (
  `ORDER_ATTRIBUTE_ID` bigint NOT NULL,
  `IDENTIFIER` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ATTRIBUTE_ID`),
  KEY `FK4nw5yrtgb4in6leve76bmdnua` (`ORDER_ID`),
  CONSTRAINT `FK4nw5yrtgb4in6leve76bmdnua` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_attribute`
--

LOCK TABLES `order_attribute` WRITE;
/*!40000 ALTER TABLE `order_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  `ONETIME_CHARGE` decimal(19,2) NOT NULL,
  `PRODUCT_NAME` varchar(64) NOT NULL,
  `PRODUCT_QUANTITY` int DEFAULT NULL,
  `PRODUCT_SKU` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_ID`),
  KEY `FKf0sghmn59s14cxrjtrvkvi5yk` (`ORDER_ID`),
  CONSTRAINT `FKf0sghmn59s14cxrjtrvkvi5yk` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,74.00,'حقيبة يد كلاسيكية أنيقة',49,'NK019',1),(2,49.00,'Multi use hand bag vintage bag',1,'NK028',2),(3,74.00,'حقيبة يد كلاسيكية أنيقة',1,'NK019',3),(4,1000.00,'Men\'s Sports Shoes Walking Shoes For Men',1,'SHOFBM672S6KJ58Y',3),(5,60.00,'Vintage courier bag',1,'NK022',3),(6,49.00,'Multi use hand bag vintage bag',1,'NK028',4);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product_attribute`
--

DROP TABLE IF EXISTS `order_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_attribute` (
  `ORDER_PRODUCT_ATTRIBUTE_ID` bigint NOT NULL,
  `PRODUCT_ATTRIBUTE_IS_FREE` bit(1) NOT NULL,
  `PRODUCT_ATTRIBUTE_NAME` varchar(255) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_PRICE` decimal(15,4) NOT NULL,
  `PRODUCT_ATTRIBUTE_VAL_NAME` varchar(255) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_WEIGHT` decimal(15,4) DEFAULT NULL,
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  `PRODUCT_OPTION_VALUE_ID` bigint NOT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_ATTRIBUTE_ID`),
  KEY `FK7j86rvwaysbok1nuofrnmhmkx` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FK7j86rvwaysbok1nuofrnmhmkx` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `order_product` (`ORDER_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_attribute`
--

LOCK TABLES `order_product_attribute` WRITE;
/*!40000 ALTER TABLE `order_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product_download`
--

DROP TABLE IF EXISTS `order_product_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_download` (
  `ORDER_PRODUCT_DOWNLOAD_ID` bigint NOT NULL,
  `DOWNLOAD_COUNT` int NOT NULL,
  `DOWNLOAD_MAXDAYS` int NOT NULL,
  `ORDER_PRODUCT_FILENAME` varchar(255) NOT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_DOWNLOAD_ID`),
  KEY `FKstrda0eweharld63j8pxa2o2r` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FKstrda0eweharld63j8pxa2o2r` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `order_product` (`ORDER_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_download`
--

LOCK TABLES `order_product_download` WRITE;
/*!40000 ALTER TABLE `order_product_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product_price`
--

DROP TABLE IF EXISTS `order_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_price` (
  `ORDER_PRODUCT_PRICE_ID` bigint NOT NULL,
  `DEFAULT_PRICE` bit(1) NOT NULL,
  `PRODUCT_PRICE` decimal(19,2) NOT NULL,
  `PRODUCT_PRICE_CODE` varchar(64) NOT NULL,
  `PRODUCT_PRICE_NAME` varchar(255) DEFAULT NULL,
  `PRODUCT_PRICE_SPECIAL` decimal(19,2) DEFAULT NULL,
  `PRD_PRICE_SPECIAL_END_DT` datetime DEFAULT NULL,
  `PRD_PRICE_SPECIAL_ST_DT` datetime DEFAULT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_PRICE_ID`),
  KEY `FKnkukiqxrieonyulercgnh857s` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FKnkukiqxrieonyulercgnh857s` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `order_product` (`ORDER_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_price`
--

LOCK TABLES `order_product_price` WRITE;
/*!40000 ALTER TABLE `order_product_price` DISABLE KEYS */;
INSERT INTO `order_product_price` VALUES (1,_binary '',74.00,'base','DEFAULT',74.00,NULL,NULL,1),(2,_binary '',49.00,'base','DEFAULT',49.00,NULL,NULL,2),(3,_binary '',74.00,'base','DEFAULT',74.00,NULL,NULL,3),(4,_binary '',1000.00,'base','',NULL,NULL,NULL,4),(5,_binary '',60.00,'base','DEFAULT',NULL,NULL,NULL,5),(6,_binary '',49.00,'base','DEFAULT',49.00,NULL,NULL,6);
/*!40000 ALTER TABLE `order_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status_history`
--

DROP TABLE IF EXISTS `order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status_history` (
  `ORDER_STATUS_HISTORY_ID` bigint NOT NULL,
  `COMMENTS` longtext,
  `CUSTOMER_NOTIFIED` int DEFAULT NULL,
  `DATE_ADDED` datetime NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_STATUS_HISTORY_ID`),
  KEY `FKmhghgf1xy3o0npsp8xkj6wyvq` (`ORDER_ID`),
  CONSTRAINT `FKmhghgf1xy3o0npsp8xkj6wyvq` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_history`
--

LOCK TABLES `order_status_history` WRITE;
/*!40000 ALTER TABLE `order_status_history` DISABLE KEYS */;
INSERT INTO `order_status_history` VALUES (1,NULL,NULL,'2020-10-10 11:44:17','ORDERED',1),(2,NULL,NULL,'2020-10-10 11:53:34','ORDERED',2),(3,'Test order',NULL,'2020-10-10 11:56:04','ORDERED',3),(4,NULL,NULL,'2020-10-10 12:10:25','ORDERED',4);
/*!40000 ALTER TABLE `order_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_total`
--

DROP TABLE IF EXISTS `order_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_total` (
  `ORDER_ACCOUNT_ID` bigint NOT NULL,
  `MODULE` varchar(60) DEFAULT NULL,
  `CODE` varchar(255) NOT NULL,
  `ORDER_TOTAL_TYPE` varchar(255) DEFAULT NULL,
  `ORDER_VALUE_TYPE` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int NOT NULL,
  `TEXT` longtext,
  `TITLE` varchar(255) DEFAULT NULL,
  `VALUE` decimal(15,4) NOT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ACCOUNT_ID`),
  KEY `FK1tfvgk5smm80efdcc8uop4he3` (`ORDER_ID`),
  CONSTRAINT `FK1tfvgk5smm80efdcc8uop4he3` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_total`
--

LOCK TABLES `order_total` WRITE;
/*!40000 ALTER TABLE `order_total` DISABLE KEYS */;
INSERT INTO `order_total` VALUES (1,'subtotal','order.total.subtotal','SUBTOTAL','ONE_TIME',5,NULL,'subtotal',3626.0000,1),(2,'shipping','order.total.shipping','SHIPPING','ONE_TIME',100,NULL,'shipping',25.0000,1),(3,'handling','order.total.handling','HANDLING','ONE_TIME',120,NULL,'handling',50.0000,1),(4,'tax','GST','TAX','ONE_TIME',200,'GST','tax',666.1800,1),(5,'total','order.total.total','TOTAL','ONE_TIME',500,NULL,'total',4367.1800,1),(6,'subtotal','order.total.subtotal','SUBTOTAL','ONE_TIME',5,NULL,'subtotal',49.0000,2),(7,'shipping','order.total.shipping','SHIPPING','ONE_TIME',100,NULL,'shipping',25.0000,2),(8,'handling','order.total.handling','HANDLING','ONE_TIME',120,NULL,'handling',50.0000,2),(9,'tax','GST','TAX','ONE_TIME',200,'GST','tax',22.3200,2),(10,'total','order.total.total','TOTAL','ONE_TIME',500,NULL,'total',146.3200,2),(11,'subtotal','order.total.subtotal','SUBTOTAL','ONE_TIME',5,NULL,'subtotal',107.2000,3),(12,NULL,'order.total.discount','SUBTOTAL','ONE_TIME',10,'Bam0530','subtotal',14.8000,3),(13,NULL,'order.total.discount','SUBTOTAL','ONE_TIME',11,'Buy 1 get 1 free.','subtotal',1000.0000,3),(14,NULL,'order.total.discount','SUBTOTAL','ONE_TIME',12,'Bam0530','subtotal',12.0000,3),(15,'shipping','order.total.shipping','SHIPPING','ONE_TIME',100,NULL,'shipping',25.0000,3),(16,'handling','order.total.handling','HANDLING','ONE_TIME',120,NULL,'handling',50.0000,3),(17,'total','order.total.total','TOTAL','ONE_TIME',500,NULL,'total',182.2000,3),(18,'subtotal','order.total.subtotal','SUBTOTAL','ONE_TIME',5,NULL,'subtotal',39.2000,4),(19,NULL,'order.total.discount','SUBTOTAL','ONE_TIME',10,'Bam0530','subtotal',9.8000,4),(20,'shipping','order.total.shipping','SHIPPING','ONE_TIME',100,NULL,'shipping',25.0000,4),(21,'handling','order.total.handling','HANDLING','ONE_TIME',120,NULL,'handling',50.0000,4),(22,'tax','GST','TAX','ONE_TIME',200,'GST','tax',22.3200,4),(23,'total','order.total.total','TOTAL','ONE_TIME',500,NULL,'total',136.5200,4);
/*!40000 ALTER TABLE `order_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ORDER_ID` bigint NOT NULL,
  `BILLING_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `BILLING_CITY` varchar(100) DEFAULT NULL,
  `BILLING_COMPANY` varchar(100) DEFAULT NULL,
  `BILLING_FIRST_NAME` varchar(64) NOT NULL,
  `BILLING_LAST_NAME` varchar(64) NOT NULL,
  `LATITUDE` varchar(100) DEFAULT NULL,
  `LONGITUDE` varchar(100) DEFAULT NULL,
  `BILLING_POSTCODE` varchar(20) DEFAULT NULL,
  `BILLING_STATE` varchar(100) DEFAULT NULL,
  `BILLING_TELEPHONE` varchar(32) DEFAULT NULL,
  `CHANNEL` varchar(255) DEFAULT NULL,
  `CONFIRMED_ADDRESS` bit(1) DEFAULT NULL,
  `CARD_TYPE` varchar(255) DEFAULT NULL,
  `CC_CVV` varchar(255) DEFAULT NULL,
  `CC_EXPIRES` varchar(255) DEFAULT NULL,
  `CC_NUMBER` varchar(255) DEFAULT NULL,
  `CC_OWNER` varchar(255) DEFAULT NULL,
  `CURRENCY_VALUE` decimal(19,2) DEFAULT NULL,
  `CUSTOMER_AGREED` bit(1) DEFAULT NULL,
  `CUSTOMER_EMAIL_ADDRESS` varchar(50) NOT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `DATE_PURCHASED` date DEFAULT NULL,
  `DELIVERY_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `DELIVERY_CITY` varchar(100) DEFAULT NULL,
  `DELIVERY_COMPANY` varchar(100) DEFAULT NULL,
  `DELIVERY_FIRST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_LAST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_POSTCODE` varchar(20) DEFAULT NULL,
  `DELIVERY_STATE` varchar(100) DEFAULT NULL,
  `DELIVERY_TELEPHONE` varchar(32) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LOCALE` varchar(255) DEFAULT NULL,
  `ORDER_DATE_FINISHED` datetime DEFAULT NULL,
  `ORDER_TYPE` varchar(255) DEFAULT NULL,
  `PAYMENT_MODULE_CODE` varchar(255) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) DEFAULT NULL,
  `SHIPPING_MODULE_CODE` varchar(255) DEFAULT NULL,
  `CART_CODE` varchar(255) DEFAULT NULL,
  `ORDER_STATUS` varchar(255) DEFAULT NULL,
  `ORDER_TOTAL` decimal(19,2) DEFAULT NULL,
  `BILLING_COUNTRY_ID` int NOT NULL,
  `BILLING_ZONE_ID` bigint DEFAULT NULL,
  `CURRENCY_ID` bigint DEFAULT NULL,
  `DELIVERY_COUNTRY_ID` int DEFAULT NULL,
  `DELIVERY_ZONE_ID` bigint DEFAULT NULL,
  `MERCHANTID` int DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `FKipesu5tupnriahutgle6xu9ed` (`BILLING_COUNTRY_ID`),
  KEY `FKit6ti99mv5uvuxqskhurv3y59` (`BILLING_ZONE_ID`),
  KEY `FKfusivmw6q3gjxnmp47n9s74qi` (`CURRENCY_ID`),
  KEY `FKnlx97vjyorunxglhy5bird06c` (`DELIVERY_COUNTRY_ID`),
  KEY `FKn9uvjl8105fsly4doo8rqnv5b` (`DELIVERY_ZONE_ID`),
  KEY `FKaodv5ffayq8x50q311o2y8m1` (`MERCHANTID`),
  CONSTRAINT `FKaodv5ffayq8x50q311o2y8m1` FOREIGN KEY (`MERCHANTID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKfusivmw6q3gjxnmp47n9s74qi` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `currency` (`CURRENCY_ID`),
  CONSTRAINT `FKipesu5tupnriahutgle6xu9ed` FOREIGN KEY (`BILLING_COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FKit6ti99mv5uvuxqskhurv3y59` FOREIGN KEY (`BILLING_ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FKn9uvjl8105fsly4doo8rqnv5b` FOREIGN KEY (`DELIVERY_ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FKnlx97vjyorunxglhy5bird06c` FOREIGN KEY (`DELIVERY_COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'138, Azad Road,','MUMBAI','','Shabbir','Manasawala',NULL,NULL,'400057','','9987232350',NULL,_binary '\0',NULL,NULL,NULL,NULL,NULL,1.00,_binary '','1shabbir.manasawala52@gmail.com',4,'2020-10-10','138, Azad Road,','MUMBAI','','Shabbir','Manasawala','400057','','9987232350','0:0:0:0:0:0:0:1',NULL,'en_US',NULL,'ORDER','moneyorder','MONEYORDER','weightBased','c1f8b04993e74a3abcc0fed186a43b42','ORDERED',4367.18,37,206,132,37,206,1),(2,'138, Azad Road,','MUMBAI','','Shabbir','Manasawala',NULL,NULL,'400057','','09987232350',NULL,_binary '\0',NULL,NULL,NULL,NULL,NULL,1.00,_binary '','2shabbir.manasawala52@gmail.com',7,'2020-10-10','138, Azad Road,','MUMBAI','','Shabbir','Manasawala','400057','','09987232350','0:0:0:0:0:0:0:1',NULL,'en_US',NULL,'ORDER','moneyorder','MONEYORDER','weightBased','e5e2eccefd84483292c6c1654f5cb398','ORDERED',146.32,37,206,132,37,206,1),(3,'138, Azad Road,','MUMBAI','Kasim ','Shabbir','Manasawala',NULL,NULL,'400057','Maharashtra','9987232350',NULL,_binary '\0',NULL,NULL,NULL,NULL,NULL,1.00,_binary '','kasim.trophy@gmail.com',8,'2020-10-10','138, Azad Road,','MUMBAI','Kasim ','Shabbir','Manasawala','400057','Maharashtra','9987232350','0:0:0:0:0:0:0:1',NULL,'en_US',NULL,'ORDER','moneyorder','MONEYORDER','weightBased','a258d2ad1ed64689aa1bf8e59763428c','ORDERED',182.20,37,NULL,132,37,NULL,1),(4,'138, Azad Road,','MUMBAI','','Shabbir','Manasawala',NULL,NULL,'400057','','09987232350',NULL,_binary '\0',NULL,NULL,NULL,NULL,NULL,1.00,_binary '','kasim.trophy@gmail.com',8,'2020-10-10','138, Azad Road,','MUMBAI','','Shabbir','Manasawala','400057','','09987232350','0:0:0:0:0:0:0:1',NULL,'en_US',NULL,'ORDER','moneyorder','MONEYORDER','weightBased','529520dede534ec7b54c09cd5316302a','ORDERED',136.52,37,206,132,37,206,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `PERMISSION_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `PERMISSION_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PERMISSION_ID`),
  UNIQUE KEY `UK_ss26hgwetkj8ms5y5jn2co4j3` (`PERMISSION_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'AUTH'),(2,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'SUPERADMIN'),(3,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'ADMIN'),(4,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'PRODUCTS'),(5,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'ORDER'),(6,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'CONTENT'),(7,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'STORE'),(8,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'TAX'),(9,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'PAYMENT'),(10,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'CUSTOMER'),(11,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'SHIPPING'),(12,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'AUTH_CUSTOMER');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_group`
--

DROP TABLE IF EXISTS `permission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_group` (
  `GROUP_ID` int NOT NULL,
  `PERMISSION_ID` int NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`PERMISSION_ID`),
  KEY `FK77ly3khyuu40odly02d351s84` (`PERMISSION_ID`),
  CONSTRAINT `FK77ly3khyuu40odly02d351s84` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`PERMISSION_ID`),
  CONSTRAINT `FKr7ylutdgqp1nrlbhjwit6y17g` FOREIGN KEY (`GROUP_ID`) REFERENCES `sm_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_group`
--

LOCK TABLES `permission_group` WRITE;
/*!40000 ALTER TABLE `permission_group` DISABLE KEYS */;
INSERT INTO `permission_group` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(1,2),(1,3),(2,3),(3,3),(1,4),(2,4),(3,4),(5,4),(1,5),(2,5),(3,5),(6,5),(1,6),(2,6),(3,6),(4,6),(7,6),(1,7),(2,7),(3,7),(4,7),(1,8),(2,8),(3,8),(4,8),(1,9),(2,9),(3,9),(4,9),(1,10),(2,10),(3,10),(4,10),(1,11),(2,11),(3,11),(4,11),(8,12);
/*!40000 ALTER TABLE `permission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `PRODUCT_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `AVAILABLE` tinyint(1) NOT NULL DEFAULT '1',
  `COND` int DEFAULT NULL,
  `DATE_AVAILABLE` datetime DEFAULT NULL,
  `PREORDER` tinyint(1) NOT NULL DEFAULT '0',
  `PRODUCT_HEIGHT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_FREE` tinyint(1) NOT NULL DEFAULT '0',
  `PRODUCT_LENGTH` decimal(19,2) DEFAULT NULL,
  `QUANTITY_ORDERED` int DEFAULT NULL,
  `REVIEW_AVG` decimal(19,2) DEFAULT NULL,
  `REVIEW_COUNT` int DEFAULT NULL,
  `PRODUCT_SHIP` tinyint(1) NOT NULL DEFAULT '0',
  `PRODUCT_VIRTUAL` tinyint(1) NOT NULL DEFAULT '0',
  `PRODUCT_WEIGHT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_WIDTH` decimal(19,2) DEFAULT NULL,
  `REF_SKU` varchar(255) DEFAULT NULL,
  `RENTAL_DURATION` int DEFAULT NULL,
  `RENTAL_PERIOD` int DEFAULT NULL,
  `RENTAL_STATUS` int DEFAULT NULL,
  `SKU` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MANUFACTURER_ID` bigint DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `TAX_CLASS_ID` bigint DEFAULT NULL,
  `PRODUCT_TYPE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  UNIQUE KEY `UKs8ofsn9pehdrstjg52j5qabxh` (`MERCHANT_ID`,`SKU`),
  KEY `FKra5mmrdxn3ci86hod7q1u3vu9` (`MANUFACTURER_ID`),
  KEY `FKqtt5f0aht5h7ough5rbkkcb33` (`CUSTOMER_ID`),
  KEY `FKb8oqtc3j8sqo0t8xdrne7pg69` (`TAX_CLASS_ID`),
  KEY `FKeiirvj8eu40h103fth8es1mt0` (`PRODUCT_TYPE_ID`),
  CONSTRAINT `FKb8oqtc3j8sqo0t8xdrne7pg69` FOREIGN KEY (`TAX_CLASS_ID`) REFERENCES `tax_class` (`TAX_CLASS_ID`),
  CONSTRAINT `FKeiirvj8eu40h103fth8es1mt0` FOREIGN KEY (`PRODUCT_TYPE_ID`) REFERENCES `product_type` (`PRODUCT_TYPE_ID`),
  CONSTRAINT `FKhhoq1nd9e0i4m7rt8gkh7d67h` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKqtt5f0aht5h7ough5rbkkcb33` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKra5mmrdxn3ci86hod7q1u3vu9` FOREIGN KEY (`MANUFACTURER_ID`) REFERENCES `manufacturer` (`MANUFACTURER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2020-10-06 11:30:05','2020-10-10 15:01:35',NULL,1,NULL,'2020-10-06 00:00:00',0,10.00,0,10.00,NULL,NULL,NULL,1,0,10.00,10.00,'SHOFBM672S6KJ58Y',NULL,NULL,NULL,'SHOFBM672S6KJ58Y',0,2,1,NULL,1,1),(50,'2020-10-10 11:09:35','2020-10-10 11:43:27',NULL,1,NULL,'2020-10-10 00:00:00',0,17.00,0,5.00,NULL,NULL,NULL,1,0,2.00,28.00,'NK019',NULL,NULL,NULL,'NK019',0,50,1,NULL,1,1),(51,'2020-10-10 11:18:18','2020-10-10 11:55:40',NULL,1,NULL,'2020-10-10 00:00:00',0,18.00,0,10.00,NULL,NULL,NULL,1,0,2.00,22.00,'NK022',NULL,NULL,NULL,'NK022',0,50,1,NULL,1,1),(52,'2020-10-10 11:49:40','2020-10-10 12:09:58',NULL,1,NULL,'2020-10-10 00:00:00',0,18.00,0,5.00,NULL,NULL,NULL,1,0,1.00,29.00,'NK028',NULL,NULL,NULL,'NK028',2,50,1,NULL,1,1),(100,'2020-10-10 16:51:25','2020-10-10 16:54:10',NULL,1,NULL,'2020-10-10 00:00:00',0,20.00,0,40.00,NULL,NULL,NULL,1,0,1.00,30.00,'NK071',NULL,NULL,NULL,'NK071',0,51,1,NULL,1,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute`
--

DROP TABLE IF EXISTS `product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute` (
  `PRODUCT_ATTRIBUTE_ID` bigint NOT NULL,
  `PRODUCT_ATTRIBUTE_DEFAULT` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_DISCOUNTED` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_FOR_DISP` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_REQUIRED` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_FREE` bit(1) DEFAULT NULL,
  `PRODUCT_ATRIBUTE_PRICE` decimal(19,2) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_WEIGHT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_SORT_ORD` int DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  `OPTION_ID` bigint NOT NULL,
  `OPTION_VALUE_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_ATTRIBUTE_ID`),
  UNIQUE KEY `UKo0c6cfxcfejwfa2877gfgpuco` (`OPTION_ID`,`OPTION_VALUE_ID`,`PRODUCT_ID`),
  KEY `FKml3nvemdjya159a7669qt1gjd` (`PRODUCT_ID`),
  KEY `FK3rleultg9fn2dxruefbb18d5t` (`OPTION_VALUE_ID`),
  CONSTRAINT `FK2st60u9twmvvaowwn88mt3lrx` FOREIGN KEY (`OPTION_ID`) REFERENCES `product_option` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK3rleultg9fn2dxruefbb18d5t` FOREIGN KEY (`OPTION_VALUE_ID`) REFERENCES `product_option_value` (`PRODUCT_OPTION_VALUE_ID`),
  CONSTRAINT `FKml3nvemdjya159a7669qt1gjd` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute`
--

LOCK TABLES `product_attribute` WRITE;
/*!40000 ALTER TABLE `product_attribute` DISABLE KEYS */;
INSERT INTO `product_attribute` VALUES (7,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',0.00,0.00,0,1,1,9),(100,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',600.00,0.00,0,1,2,102),(101,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',700.00,0.00,1,1,2,103),(102,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',500.00,0.00,0,1,4,107),(103,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',600.00,0.00,1,1,4,106),(104,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',0.00,0.00,0,50,4,107),(105,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',0.00,0.00,0,51,4,110),(106,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',0.00,0.00,0,52,4,107),(107,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',0.00,0.00,0,100,4,110);
/*!40000 ALTER TABLE `product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_availability`
--

DROP TABLE IF EXISTS `product_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_availability` (
  `PRODUCT_AVAIL_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `AVAILABLE` bit(1) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `DATE_AVAILABLE` date DEFAULT NULL,
  `FREE_SHIPPING` bit(1) DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  `QUANTITY_ORD_MAX` int DEFAULT NULL,
  `QUANTITY_ORD_MIN` int DEFAULT NULL,
  `STATUS` bit(1) DEFAULT NULL,
  `REGION` varchar(255) DEFAULT NULL,
  `REGION_VARIANT` varchar(255) DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_AVAIL_ID`),
  KEY `FKmjs1xqdsgji88j5uduj83bntl` (`MERCHANT_ID`),
  KEY `FK5sbh4dx25pmjcqx958hr9ys8h` (`PRODUCT_ID`),
  CONSTRAINT `FK5sbh4dx25pmjcqx958hr9ys8h` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  CONSTRAINT `FKmjs1xqdsgji88j5uduj83bntl` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_availability`
--

LOCK TABLES `product_availability` WRITE;
/*!40000 ALTER TABLE `product_availability` DISABLE KEYS */;
INSERT INTO `product_availability` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',1000,10000,100,_binary '','*',NULL,NULL,1),(50,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',14950,10,1,_binary '','*',NULL,NULL,50),(51,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',2499,10,1,_binary '','*',NULL,NULL,51),(52,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',98,20,10,_binary '','*',NULL,NULL,52),(100,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',20,10,1,_binary '','*',NULL,NULL,100);
/*!40000 ALTER TABLE `product_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `PRODUCT_ID` bigint NOT NULL,
  `CATEGORY_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`,`CATEGORY_ID`),
  KEY `FK3xw1sbaa29r534jvedimdd7md` (`CATEGORY_ID`),
  CONSTRAINT `FK3xw1sbaa29r534jvedimdd7md` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`),
  CONSTRAINT `FKa7245ly271mb0crlhxwhhppsq` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,1),(1,2),(51,50),(52,50),(100,50),(50,52),(52,52);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_description`
--

DROP TABLE IF EXISTS `product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) DEFAULT NULL,
  `META_KEYWORDS` varchar(255) DEFAULT NULL,
  `META_TITLE` varchar(255) DEFAULT NULL,
  `DOWNLOAD_LNK` varchar(255) DEFAULT NULL,
  `PRODUCT_HIGHLIGHT` varchar(255) DEFAULT NULL,
  `SEF_URL` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKq4dnkx5b776ayqas2h4rr2d8q` (`PRODUCT_ID`,`LANGUAGE_ID`),
  KEY `PRODUCT_DESCRIPTION_SEF_URL` (`SEF_URL`),
  KEY `FK6esjdaa6vu2t5vjin788a8og6` (`LANGUAGE_ID`),
  CONSTRAINT `FK6esjdaa6vu2t5vjin788a8og6` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKm46yjcu59q79qrokgglwq2ove` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_description`
--

LOCK TABLES `product_description` WRITE;
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;
INSERT INTO `product_description` VALUES (1,'2020-10-10 17:33:05','2020-10-10 17:33:05',NULL,'<p>\r\n	<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px; background-color: rgb(255, 255, 255);\">Men&#39;s Sports Shoes Walking Shoes For Men - (White, Black) (Small, Medium, Large)</span></p>\r\n','Men\'s Sports Shoes Walking Shoes For Men',NULL,'Men\'s Sports Shoes Walking Shoes For Men','white,shoes,','Men\'s Sports Shoes Walking Shoes For Men','','Men\'s Sports Shoes Walking Shoes For Men','mens-sports-shoes-walking-shoes-for-men',1,1),(2,'2020-10-10 16:14:37','2020-10-10 16:14:37',NULL,'<p>\r\n	أحذية رياضية رجالية أحذية المشي للرجال</p>\r\n','أحذية رياضية رجالية أحذية المشي للرجال',NULL,'أحذية رياضية رجالية أحذية المشي للرجال','','أحذية رياضية رجالية أحذية المشي للرجال','','أحذية رياضية رجالية أحذية المشي للرجال','أحذية رياضية رجالية أحذية المشي للرجال',2,1),(3,'2020-10-10 15:22:17','2020-10-10 15:22:17',NULL,'<p>\r\n	Vintage chic handbag with leather bands</p>\r\n','Vintage chic handbag',NULL,'Vintage chic handbag','white,handbags,vintage,','Vintage chic handbag','','Vintage chic handbag','vintage-chic-handbag',1,50),(4,'2020-10-10 15:22:17','2020-10-10 15:22:17',NULL,'<p>\r\n	حقيبة يد كلاسيكية أنيقة مع عصابات جلدية</p>\r\n','حقيبة يد كلاسيكية أنيقة',NULL,'حقيبة يد كلاسيكية أنيقة','','حقيبة يد كلاسيكية أنيقة','','حقيبة يد كلاسيكية أنيقة','حقيبة يد كلاسيكية أنيقة',2,50),(5,'2020-10-10 16:17:00','2020-10-10 16:17:00',NULL,'<p>\r\n	حقيبة ساعي خمر</p>\r\n','حقيبة ساعي خمر',NULL,'حقيبة ساعي خمر','','حقيبة ساعي خمر','','حقيبة ساعي خمر','حقيبة ساعي خمر',2,51),(6,'2020-10-10 16:17:00','2020-10-10 16:17:00',NULL,'<p>\r\n	Vintage courier bag</p>\r\n','Vintage courier bag',NULL,'Vintage courier bag','Vintage courier bag,','Vintage courier bag','','Vintage courier bag','vintage-courier-bag',1,51),(7,'2020-10-10 17:02:25','2020-10-10 17:02:25',NULL,'<p>\r\n	Multi use hand bag vintage bag</p>\r\n','Multi use hand bag vintage bag',NULL,'Multi use hand bag vintage bag','Multi use hand bag vintage bag,','Multi use hand bag vintage bag','','Multi use hand bag vintage bag','multi-use-hand-bag-vintage-bag',1,52),(8,'2020-10-10 16:16:23','2020-10-10 16:16:23',NULL,'<p>\r\n	متعددة الاستخدامات حقيبة يد خمر حقيبة</p>\r\n','متعددة الاستخدامات حقيبة يد خمر حقيبة',NULL,'متعددة الاستخدامات حقيبة يد خمر حقيبة','','متعددة الاستخدامات حقيبة يد خمر حقيبة','','متعددة الاستخدامات حقيبة يد خمر حقيبة','متعددة الاستخدامات حقيبة يد خمر حقيبة',2,52),(9,'2020-10-10 15:22:17','2020-10-10 15:22:17',NULL,'<p>\r\n	حقيبة يد كلاسيكية أنيقة مع عصابات جلدية</p>\r\n','حقيبة يد كلاسيكية أنيقة مع عصابات جلدية',NULL,'حقيبة يد كلاسيكية أنيقة مع عصابات جلدية','','حقيبة يد كلاسيكية أنيقة مع عصابات جلدية','','حقيبة يد كلاسيكية أنيقة مع عصابات جلدية','حقيبة يد كلاسيكية أنيقة مع عصابات جلدية',4,50),(10,'2020-10-10 17:33:05','2020-10-10 17:33:05',NULL,'<p>\r\n	أحذية رياضية رجالية أحذية المشي للرجال</p>\r\n','أحذية رياضية رجالية أحذية المشي للرجال',NULL,'','','أحذية رياضية رجالية أحذية المشي للرجال','','','mens-sports-shoes-walking-shoes-for-men',4,1),(11,'2020-10-10 17:02:25','2020-10-10 17:02:25',NULL,'<p>\r\n	متعددة الاستخدامات حقيبة يد خمر حقيبة</p>\r\n','متعددة الاستخدامات حقيبة يد خمر حقيبة',NULL,'','','متعددة الاستخدامات حقيبة يد خمر حقيبة','','','multi-use-hand-bag-vintage-bag',4,52),(12,'2020-10-10 16:17:00','2020-10-10 16:17:00',NULL,'<p>\r\n	<span style=\"font-family: arial, helvetica, sans-serif;\">​</span>حقيبة ساعي خمر</p>\r\n','​حقيبة ساعي خمر',NULL,'','','​حقيبة ساعي خمر','','','',4,51),(13,'2020-10-10 16:54:10','2020-10-10 16:54:10',NULL,'<p>\r\n	حقيبة ريترو ستايل بحزام جلدي</p>\r\n','حقيبة ريترو ستايل',NULL,'','','حقيبة ريترو ستايل بحزام جلدي','','','',4,100),(14,'2020-10-10 16:54:10','2020-10-10 16:54:10',NULL,'<p>\r\n	Retro style bag with leather stripe</p>\r\n','Retro style bag',NULL,'','','Retro style bag with leather stripe','','','retro-style-bag',1,100);
/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_digital`
--

DROP TABLE IF EXISTS `product_digital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_digital` (
  `PRODUCT_DIGITAL_ID` bigint NOT NULL,
  `FILE_NAME` varchar(255) NOT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_DIGITAL_ID`),
  UNIQUE KEY `UKjuk1qgkh9v5w7ghvb18krwo8v` (`PRODUCT_ID`,`FILE_NAME`),
  CONSTRAINT `FK47fmb5cg68pws7k26txyl1il6` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_digital`
--

LOCK TABLES `product_digital` WRITE;
/*!40000 ALTER TABLE `product_digital` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_digital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `PRODUCT_IMAGE_ID` bigint NOT NULL,
  `DEFAULT_IMAGE` bit(1) DEFAULT NULL,
  `IMAGE_CROP` bit(1) DEFAULT NULL,
  `IMAGE_TYPE` int DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(255) DEFAULT NULL,
  `PRODUCT_IMAGE_URL` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_IMAGE_ID`),
  KEY `FKgab836d8rxqg8vv55nm02r65i` (`PRODUCT_ID`),
  CONSTRAINT `FKgab836d8rxqg8vv55nm02r65i` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (2,_binary '\0',_binary '\0',0,'p1i1_small.jpg',NULL,1),(3,_binary '\0',_binary '\0',0,'p1i2.jpg',NULL,1),(4,_binary '\0',_binary '\0',0,'p1i3.jpg',NULL,1),(5,_binary '\0',_binary '\0',0,'p2i1.jpg',NULL,1),(6,_binary '\0',_binary '\0',0,'p2i1_small.jpg',NULL,1),(7,_binary '\0',_binary '\0',0,'p2i2.jpg',NULL,1),(8,_binary '\0',_binary '\0',0,'p2i3.jpg',NULL,1),(50,_binary '',_binary '\0',0,'p1i1.jpg',NULL,1),(100,_binary '',_binary '\0',0,'chrome_eKWzKIBo2w.png',NULL,50),(101,_binary '',_binary '\0',0,'chrome_WzXgiK5YtB.png',NULL,51),(102,_binary '',_binary '\0',0,'chrome_e1Pj5XbXvh.png',NULL,52),(103,_binary '\0',_binary '\0',0,'chrome_dsVH3gjm6j.png',NULL,52),(104,_binary '\0',_binary '\0',0,'chrome_GnT6M9w5cQ.png',NULL,52),(105,_binary '\0',_binary '\0',0,'chrome_wH4Ees6x9R.png',NULL,52),(151,_binary '',_binary '\0',0,'chrome_GnT6M9w5cQ.png',NULL,100);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image_description`
--

DROP TABLE IF EXISTS `product_image_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `ALT_TAG` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_IMAGE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKn7yhdj6ccydgf201gibb882cd` (`PRODUCT_IMAGE_ID`,`LANGUAGE_ID`),
  KEY `FKlhdnpki4sf98wev0pcj2bvnih` (`LANGUAGE_ID`),
  CONSTRAINT `FK1dhldo18nj9l2y6qympgucynq` FOREIGN KEY (`PRODUCT_IMAGE_ID`) REFERENCES `product_image` (`PRODUCT_IMAGE_ID`),
  CONSTRAINT `FKlhdnpki4sf98wev0pcj2bvnih` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image_description`
--

LOCK TABLES `product_image_description` WRITE;
/*!40000 ALTER TABLE `product_image_description` DISABLE KEYS */;
INSERT INTO `product_image_description` VALUES (3,'2020-10-09 17:38:42','2020-10-09 17:38:42',NULL,NULL,'p1i1.jpg',NULL,NULL,1,50),(4,'2020-10-09 17:38:42','2020-10-09 17:38:42',NULL,NULL,'p1i1.jpg',NULL,NULL,2,50),(5,'2020-10-10 11:09:35','2020-10-10 11:09:35',NULL,NULL,'chrome_eKWzKIBo2w.png',NULL,NULL,1,100),(6,'2020-10-10 11:09:35','2020-10-10 11:09:35',NULL,NULL,'chrome_eKWzKIBo2w.png',NULL,NULL,2,100),(7,'2020-10-10 11:18:18','2020-10-10 11:18:18',NULL,NULL,'chrome_WzXgiK5YtB.png',NULL,NULL,1,101),(8,'2020-10-10 11:18:18','2020-10-10 11:18:18',NULL,NULL,'chrome_WzXgiK5YtB.png',NULL,NULL,2,101),(9,'2020-10-10 11:49:41','2020-10-10 11:49:41',NULL,NULL,'chrome_e1Pj5XbXvh.png',NULL,NULL,1,102),(10,'2020-10-10 11:49:41','2020-10-10 11:49:41',NULL,NULL,'chrome_e1Pj5XbXvh.png',NULL,NULL,2,102);
/*!40000 ALTER TABLE `product_image_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_opt_set_opt_value`
--

DROP TABLE IF EXISTS `product_opt_set_opt_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_opt_set_opt_value` (
  `ProductOptionSet_PRODUCT_OPTION_SET_ID` bigint NOT NULL,
  `values_PRODUCT_OPTION_VALUE_ID` bigint NOT NULL,
  KEY `FK9dwatblxwc64a5la3bb7qnwd8` (`values_PRODUCT_OPTION_VALUE_ID`),
  KEY `FK3u6iyag8x8w9tkt7sqcoibjq6` (`ProductOptionSet_PRODUCT_OPTION_SET_ID`),
  CONSTRAINT `FK3u6iyag8x8w9tkt7sqcoibjq6` FOREIGN KEY (`ProductOptionSet_PRODUCT_OPTION_SET_ID`) REFERENCES `product_option_set` (`PRODUCT_OPTION_SET_ID`),
  CONSTRAINT `FK9dwatblxwc64a5la3bb7qnwd8` FOREIGN KEY (`values_PRODUCT_OPTION_VALUE_ID`) REFERENCES `product_option_value` (`PRODUCT_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_opt_set_opt_value`
--

LOCK TABLES `product_opt_set_opt_value` WRITE;
/*!40000 ALTER TABLE `product_opt_set_opt_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_opt_set_opt_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_opt_set_prd_type`
--

DROP TABLE IF EXISTS `product_opt_set_prd_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_opt_set_prd_type` (
  `ProductOptionSet_PRODUCT_OPTION_SET_ID` bigint NOT NULL,
  `productTypes_PRODUCT_TYPE_ID` bigint NOT NULL,
  PRIMARY KEY (`ProductOptionSet_PRODUCT_OPTION_SET_ID`,`productTypes_PRODUCT_TYPE_ID`),
  KEY `FKiem30u1enm0p25i7t53jganf4` (`productTypes_PRODUCT_TYPE_ID`),
  CONSTRAINT `FK4655h91s0eiinonako9n4h9ha` FOREIGN KEY (`ProductOptionSet_PRODUCT_OPTION_SET_ID`) REFERENCES `product_option_set` (`PRODUCT_OPTION_SET_ID`),
  CONSTRAINT `FKiem30u1enm0p25i7t53jganf4` FOREIGN KEY (`productTypes_PRODUCT_TYPE_ID`) REFERENCES `product_type` (`PRODUCT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_opt_set_prd_type`
--

LOCK TABLES `product_opt_set_prd_type` WRITE;
/*!40000 ALTER TABLE `product_opt_set_prd_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_opt_set_prd_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option`
--

DROP TABLE IF EXISTS `product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option` (
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  `PRODUCT_OPTION_CODE` varchar(255) DEFAULT NULL,
  `PRODUCT_OPTION_SORT_ORD` int DEFAULT NULL,
  `PRODUCT_OPTION_TYPE` varchar(10) DEFAULT NULL,
  `PRODUCT_OPTION_READ` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_ID`),
  UNIQUE KEY `UKhfcw5oi9ulljlog1b7ns1r9tu` (`MERCHANT_ID`,`PRODUCT_OPTION_CODE`),
  KEY `PRD_OPTION_CODE_IDX` (`PRODUCT_OPTION_CODE`),
  CONSTRAINT `FKp8cski5t5f5m4et4fw0uilcgu` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option`
--

LOCK TABLES `product_option` WRITE;
/*!40000 ALTER TABLE `product_option` DISABLE KEYS */;
INSERT INTO `product_option` VALUES (1,' brand',NULL,'select',_binary '\0',1),(2,'size',NULL,'radio',_binary '\0',1),(4,'color',NULL,'radio',_binary '\0',1);
/*!40000 ALTER TABLE `product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_desc`
--

DROP TABLE IF EXISTS `product_option_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option_desc` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `PRODUCT_OPTION_COMMENT` longtext,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKmkcm8isyyyqbjd1yyb8mrpkuw` (`PRODUCT_OPTION_ID`,`LANGUAGE_ID`),
  KEY `FK8fiwk5o1gbn2r2u8529yaf9xt` (`LANGUAGE_ID`),
  CONSTRAINT `FK8fiwk5o1gbn2r2u8529yaf9xt` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKgjqmfofile4hwv867irsnvuc0` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `product_option` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_desc`
--

LOCK TABLES `product_option_desc` WRITE;
/*!40000 ALTER TABLE `product_option_desc` DISABLE KEYS */;
INSERT INTO `product_option_desc` VALUES (1,'2020-10-10 16:57:46','2020-10-10 16:57:46',NULL,NULL,'Brand',NULL,NULL,1,1),(4,'2020-10-10 16:58:56','2020-10-10 16:58:56',NULL,NULL,'Size',NULL,NULL,1,2),(8,'2020-10-10 16:58:22','2020-10-10 16:58:22',NULL,NULL,'Color',NULL,NULL,1,4),(9,'2020-10-10 16:57:46','2020-10-10 16:57:46',NULL,NULL,'الماركة',NULL,NULL,4,1),(11,'2020-10-10 16:58:22','2020-10-10 16:58:22',NULL,NULL,'اللون',NULL,NULL,4,4),(12,'2020-10-10 16:58:56','2020-10-10 16:58:56',NULL,NULL,'بحجم',NULL,NULL,4,2);
/*!40000 ALTER TABLE `product_option_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_set`
--

DROP TABLE IF EXISTS `product_option_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option_set` (
  `PRODUCT_OPTION_SET_ID` bigint NOT NULL,
  `PRODUCT_OPTION_SET_CODE` varchar(255) DEFAULT NULL,
  `PRODUCT_OPTION_SET_DISP` bit(1) DEFAULT NULL,
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_SET_ID`),
  UNIQUE KEY `UKk1qq8j685uj17bylgnkra1n5f` (`MERCHANT_ID`,`PRODUCT_OPTION_SET_CODE`),
  KEY `FK4njy17416fn86muojmtbav1d0` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK4njy17416fn86muojmtbav1d0` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `product_option` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK8d5vylmhvmckmframdehgwqau` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_set`
--

LOCK TABLES `product_option_set` WRITE;
/*!40000 ALTER TABLE `product_option_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_value`
--

DROP TABLE IF EXISTS `product_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option_value` (
  `PRODUCT_OPTION_VALUE_ID` bigint NOT NULL,
  `PRODUCT_OPTION_VAL_CODE` varchar(255) DEFAULT NULL,
  `PRODUCT_OPT_FOR_DISP` bit(1) DEFAULT NULL,
  `PRODUCT_OPT_VAL_IMAGE` varchar(255) DEFAULT NULL,
  `PRODUCT_OPT_VAL_SORT_ORD` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_VALUE_ID`),
  UNIQUE KEY `UKixbpi4hxrhljh935c3xfvnvsh` (`MERCHANT_ID`,`PRODUCT_OPTION_VAL_CODE`),
  KEY `PRD_OPTION_VAL_CODE_IDX` (`PRODUCT_OPTION_VAL_CODE`),
  CONSTRAINT `FKnd3nw0mamlk8bkxo8ad5m85pq` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_value`
--

LOCK TABLES `product_option_value` WRITE;
/*!40000 ALTER TABLE `product_option_value` DISABLE KEYS */;
INSERT INTO `product_option_value` VALUES (9,'nike',_binary '\0','',NULL,1),(102,'small',_binary '\0','',NULL,1),(103,'medium',_binary '\0','',NULL,1),(104,'large',_binary '\0','',NULL,1),(105,'xlarge',_binary '\0','',NULL,1),(106,'black',_binary '\0','',NULL,1),(107,'white',_binary '\0','',NULL,1),(108,'red',_binary '\0','',NULL,1),(109,'green',_binary '\0','',NULL,1),(110,'brown',_binary '\0','',NULL,1);
/*!40000 ALTER TABLE `product_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_value_description`
--

DROP TABLE IF EXISTS `product_option_value_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option_value_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_OPTION_VALUE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKasgc60ot1wy0uho96n0j8429p` (`PRODUCT_OPTION_VALUE_ID`,`LANGUAGE_ID`),
  KEY `FK19mnby7atlt85exlypxdxhacx` (`LANGUAGE_ID`),
  CONSTRAINT `FK19mnby7atlt85exlypxdxhacx` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKqttc6b79yp2s1hyrhg4thag6s` FOREIGN KEY (`PRODUCT_OPTION_VALUE_ID`) REFERENCES `product_option_value` (`PRODUCT_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_value_description`
--

LOCK TABLES `product_option_value_description` WRITE;
/*!40000 ALTER TABLE `product_option_value_description` DISABLE KEYS */;
INSERT INTO `product_option_value_description` VALUES (17,'2020-10-10 17:06:12','2020-10-10 17:06:12',NULL,NULL,'Nike',NULL,1,9),(18,'2020-10-10 17:06:12','2020-10-10 17:06:12',NULL,NULL,'نايك',NULL,4,9),(27,'2020-10-10 17:13:06','2020-10-10 17:13:06',NULL,NULL,'Small',NULL,1,102),(28,'2020-10-10 17:13:06','2020-10-10 17:13:06',NULL,NULL,'Small',NULL,4,102),(29,'2020-10-10 17:13:46','2020-10-10 17:13:46',NULL,NULL,'Medium',NULL,4,103),(30,'2020-10-10 17:13:46','2020-10-10 17:13:46',NULL,NULL,'Medium',NULL,1,103),(31,'2020-10-10 17:14:05','2020-10-10 17:14:05',NULL,NULL,'Large',NULL,1,104),(32,'2020-10-10 17:14:05','2020-10-10 17:14:05',NULL,NULL,'Large',NULL,4,104),(33,'2020-10-10 17:14:28','2020-10-10 17:14:28',NULL,NULL,'XL',NULL,4,105),(34,'2020-10-10 17:14:28','2020-10-10 17:14:28',NULL,NULL,'XL',NULL,1,105),(35,'2020-10-10 17:15:05','2020-10-10 17:15:05',NULL,NULL,'Black',NULL,1,106),(36,'2020-10-10 17:15:05','2020-10-10 17:15:05',NULL,NULL,'Black',NULL,4,106),(37,'2020-10-10 17:15:25','2020-10-10 17:15:25',NULL,NULL,'White',NULL,4,107),(38,'2020-10-10 17:15:25','2020-10-10 17:15:25',NULL,NULL,'White',NULL,1,107),(39,'2020-10-10 17:15:39','2020-10-10 17:15:39',NULL,NULL,'Red',NULL,1,108),(40,'2020-10-10 17:15:39','2020-10-10 17:15:39',NULL,NULL,'Red',NULL,4,108),(41,'2020-10-10 17:15:54','2020-10-10 17:15:54',NULL,NULL,'Green',NULL,1,109),(42,'2020-10-10 17:15:54','2020-10-10 17:15:54',NULL,NULL,'Green',NULL,4,109),(43,'2020-10-10 17:16:08','2020-10-10 17:16:08',NULL,NULL,'Brown',NULL,1,110),(44,'2020-10-10 17:16:08','2020-10-10 17:16:08',NULL,NULL,'Brown',NULL,4,110);
/*!40000 ALTER TABLE `product_option_value_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price`
--

DROP TABLE IF EXISTS `product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price` (
  `PRODUCT_PRICE_ID` bigint NOT NULL,
  `PRODUCT_PRICE_CODE` varchar(255) NOT NULL,
  `DEFAULT_PRICE` bit(1) DEFAULT NULL,
  `PRODUCT_PRICE_AMOUNT` decimal(19,2) NOT NULL,
  `PRODUCT_PRICE_SPECIAL_AMOUNT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_PRICE_SPECIAL_END_DATE` date DEFAULT NULL,
  `PRODUCT_PRICE_SPECIAL_ST_DATE` date DEFAULT NULL,
  `PRODUCT_PRICE_TYPE` varchar(20) DEFAULT NULL,
  `PRODUCT_AVAIL_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_PRICE_ID`),
  KEY `FK1dic7jnnk1qikgvwcrf4dw12r` (`PRODUCT_AVAIL_ID`),
  CONSTRAINT `FK1dic7jnnk1qikgvwcrf4dw12r` FOREIGN KEY (`PRODUCT_AVAIL_ID`) REFERENCES `product_availability` (`PRODUCT_AVAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price`
--

LOCK TABLES `product_price` WRITE;
/*!40000 ALTER TABLE `product_price` DISABLE KEYS */;
INSERT INTO `product_price` VALUES (2,'base',_binary '',1000.00,NULL,NULL,NULL,'ONE_TIME',1),(50,'base',_binary '',82.00,74.00,NULL,NULL,'ONE_TIME',50),(51,'base',_binary '',60.00,NULL,NULL,NULL,'ONE_TIME',51),(52,'base',_binary '',65.00,49.00,NULL,NULL,'ONE_TIME',52),(100,'base',_binary '',48.00,NULL,NULL,NULL,'ONE_TIME',100);
/*!40000 ALTER TABLE `product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price_description`
--

DROP TABLE IF EXISTS `product_price_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `PRICE_APPENDER` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_PRICE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKfrsw8d41sxxogvxxoyd8nwaxu` (`PRODUCT_PRICE_ID`,`LANGUAGE_ID`),
  KEY `FK7bmbrjr8ar5icwdpt8myj6gei` (`LANGUAGE_ID`),
  CONSTRAINT `FK7bmbrjr8ar5icwdpt8myj6gei` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKbwxw861ipjsct606j3dagdjsf` FOREIGN KEY (`PRODUCT_PRICE_ID`) REFERENCES `product_price` (`PRODUCT_PRICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price_description`
--

LOCK TABLES `product_price_description` WRITE;
/*!40000 ALTER TABLE `product_price_description` DISABLE KEYS */;
INSERT INTO `product_price_description` VALUES (3,'2020-10-06 15:08:32','2020-10-06 15:08:32',NULL,NULL,'',NULL,'',1,2),(4,'2020-10-06 15:08:32','2020-10-06 15:08:32',NULL,NULL,'',NULL,'',2,2),(5,'2020-10-10 11:10:11','2020-10-10 11:10:11',NULL,NULL,'DEFAULT',NULL,'',2,50),(6,'2020-10-10 11:10:11','2020-10-10 11:10:11',NULL,NULL,'DEFAULT',NULL,'',1,50),(7,'2020-10-10 11:18:18','2020-10-10 11:18:18',NULL,NULL,'DEFAULT',NULL,NULL,2,51),(8,'2020-10-10 11:18:18','2020-10-10 11:18:18',NULL,NULL,'DEFAULT',NULL,NULL,1,51),(9,'2020-10-10 11:50:01','2020-10-10 11:50:01',NULL,NULL,'DEFAULT',NULL,'',1,52),(10,'2020-10-10 11:50:01','2020-10-10 11:50:01',NULL,NULL,'DEFAULT',NULL,'',2,52),(11,'2020-10-10 16:51:25','2020-10-10 16:51:25',NULL,NULL,'DEFAULT',NULL,NULL,1,100),(12,'2020-10-10 16:51:25','2020-10-10 16:51:25',NULL,NULL,'DEFAULT',NULL,NULL,4,100);
/*!40000 ALTER TABLE `product_price_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_relationship`
--

DROP TABLE IF EXISTS `product_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_relationship` (
  `PRODUCT_RELATIONSHIP_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  `RELATED_PRODUCT_ID` bigint DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_RELATIONSHIP_ID`),
  KEY `FKso3cvinykac5wdwu1tjgfotor` (`PRODUCT_ID`),
  KEY `FKfskwtawyt85g9h6761fa69ya5` (`RELATED_PRODUCT_ID`),
  KEY `FKnprvswtbgrm6bjfq3cbdl3qsm` (`MERCHANT_ID`),
  CONSTRAINT `FKfskwtawyt85g9h6761fa69ya5` FOREIGN KEY (`RELATED_PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  CONSTRAINT `FKnprvswtbgrm6bjfq3cbdl3qsm` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKso3cvinykac5wdwu1tjgfotor` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_relationship`
--

LOCK TABLES `product_relationship` WRITE;
/*!40000 ALTER TABLE `product_relationship` DISABLE KEYS */;
INSERT INTO `product_relationship` VALUES (1,_binary '','FEATURED_ITEM',NULL,1,1),(50,_binary '','FEATURED_ITEM',NULL,50,1),(51,_binary '','FEATURED_ITEM',NULL,51,1),(52,_binary '','RELATED_ITEM',51,50,1);
/*!40000 ALTER TABLE `product_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review`
--

DROP TABLE IF EXISTS `product_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review` (
  `PRODUCT_REVIEW_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `REVIEW_DATE` datetime DEFAULT NULL,
  `REVIEWS_RATING` double DEFAULT NULL,
  `REVIEWS_READ` bigint DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  `CUSTOMERS_ID` bigint DEFAULT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_REVIEW_ID`),
  UNIQUE KEY `UK9ew5idgdbk8a77534hbnhd4yb` (`CUSTOMERS_ID`,`PRODUCT_ID`),
  KEY `FKbfi8de7kxultg1vevq6jc1hn7` (`PRODUCT_ID`),
  CONSTRAINT `FK7tm0jrt0hiugo3ep49t3subou` FOREIGN KEY (`CUSTOMERS_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKbfi8de7kxultg1vevq6jc1hn7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review`
--

LOCK TABLES `product_review` WRITE;
/*!40000 ALTER TABLE `product_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review_description`
--

DROP TABLE IF EXISTS `product_review_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_REVIEW_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKqno5wjdtcj8pm3ykkkh7t4rxj` (`PRODUCT_REVIEW_ID`,`LANGUAGE_ID`),
  KEY `FK7byc5jsf5bm4lk674ac44e50m` (`LANGUAGE_ID`),
  CONSTRAINT `FK7byc5jsf5bm4lk674ac44e50m` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKmjivhigdcxmytndlpjuhf4o25` FOREIGN KEY (`PRODUCT_REVIEW_ID`) REFERENCES `product_review` (`PRODUCT_REVIEW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review_description`
--

LOCK TABLES `product_review_description` WRITE;
/*!40000 ALTER TABLE `product_review_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_review_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type` (
  `PRODUCT_TYPE_ID` bigint NOT NULL,
  `PRD_TYPE_ADD_TO_CART` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `PRD_TYPE_CODE` varchar(255) DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_TYPE_ID`),
  KEY `FKswkvtaq4om2di6x8cd4m22ofn` (`MERCHANT_ID`),
  CONSTRAINT `FKswkvtaq4om2di6x8cd4m22ofn` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,NULL,'2020-10-06 10:41:22','2020-10-06 10:41:22',NULL,'GENERAL',NULL);
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type_description`
--

DROP TABLE IF EXISTS `product_type_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_TYPE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKbnra4lwqjkju4yh04824sw6be` (`PRODUCT_TYPE_ID`,`LANGUAGE_ID`),
  KEY `FK81q74whco5y9fd51aa330hlc0` (`LANGUAGE_ID`),
  CONSTRAINT `FK81q74whco5y9fd51aa330hlc0` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKpwc89ulk7c9asbp2nfy2t4x2j` FOREIGN KEY (`PRODUCT_TYPE_ID`) REFERENCES `product_type` (`PRODUCT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type_description`
--

LOCK TABLES `product_type_description` WRITE;
/*!40000 ALTER TABLE `product_type_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_type_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant`
--

DROP TABLE IF EXISTS `product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variant` (
  `PRODUCT_VARIANT_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `PRODUCT_AQUANTITY` int DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_ID` bigint NOT NULL,
  `PRODUCT_AVAIL_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_VARIANT_ID`),
  KEY `FKb1p1mgaa76xdqmx029cabgc1s` (`PRODUCT_ATTRIBUTE_ID`),
  KEY `FKnaa1t3g2d6lt3f13yy0gg9t4o` (`PRODUCT_AVAIL_ID`),
  CONSTRAINT `FKb1p1mgaa76xdqmx029cabgc1s` FOREIGN KEY (`PRODUCT_ATTRIBUTE_ID`) REFERENCES `product_attribute` (`PRODUCT_ATTRIBUTE_ID`),
  CONSTRAINT `FKnaa1t3g2d6lt3f13yy0gg9t4o` FOREIGN KEY (`PRODUCT_AVAIL_ID`) REFERENCES `product_availability` (`PRODUCT_AVAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant`
--

LOCK TABLES `product_variant` WRITE;
/*!40000 ALTER TABLE `product_variant` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shiping_origin`
--

DROP TABLE IF EXISTS `shiping_origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shiping_origin` (
  `SHIP_ORIGIN_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `POSTCODE` varchar(20) DEFAULT NULL,
  `STATE` varchar(100) DEFAULT NULL,
  `COUNTRY_ID` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  `ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`SHIP_ORIGIN_ID`),
  KEY `FKpqig59usqvs9h0dw4lm8rv7yy` (`COUNTRY_ID`),
  KEY `FKp0dbwsv3sdsp57ex7j5k9b0oq` (`MERCHANT_ID`),
  KEY `FK6k73f1n18kr7mqp708aiwq047` (`ZONE_ID`),
  CONSTRAINT `FK6k73f1n18kr7mqp708aiwq047` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FKp0dbwsv3sdsp57ex7j5k9b0oq` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKpqig59usqvs9h0dw4lm8rv7yy` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shiping_origin`
--

LOCK TABLES `shiping_origin` WRITE;
/*!40000 ALTER TABLE `shiping_origin` DISABLE KEYS */;
INSERT INTO `shiping_origin` VALUES (1,_binary '','138, Azad Road,','MUMBAI','400057','',37,1,206);
/*!40000 ALTER TABLE `shiping_origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_quote`
--

DROP TABLE IF EXISTS `shipping_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_quote` (
  `SHIPPING_QUOTE_ID` bigint NOT NULL,
  `CART_ID` bigint DEFAULT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `DELIVERY_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `DELIVERY_CITY` varchar(100) DEFAULT NULL,
  `DELIVERY_COMPANY` varchar(100) DEFAULT NULL,
  `DELIVERY_FIRST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_LAST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_POSTCODE` varchar(20) DEFAULT NULL,
  `DELIVERY_STATE` varchar(100) DEFAULT NULL,
  `DELIVERY_TELEPHONE` varchar(32) DEFAULT NULL,
  `SHIPPING_NUMBER_DAYS` int DEFAULT NULL,
  `FREE_SHIPPING` bit(1) DEFAULT NULL,
  `QUOTE_HANDLING` decimal(19,2) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `MODULE` varchar(255) NOT NULL,
  `OPTION_CODE` varchar(255) DEFAULT NULL,
  `OPTION_DELIVERY_DATE` datetime DEFAULT NULL,
  `OPTION_NAME` varchar(255) DEFAULT NULL,
  `OPTION_SHIPPING_DATE` datetime DEFAULT NULL,
  `ORDER_ID` bigint DEFAULT NULL,
  `QUOTE_PRICE` decimal(19,2) DEFAULT NULL,
  `QUOTE_DATE` datetime DEFAULT NULL,
  `DELIVERY_COUNTRY_ID` int DEFAULT NULL,
  `DELIVERY_ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`SHIPPING_QUOTE_ID`),
  KEY `FK9vb7tbjl8ivygdiqw883fewx7` (`DELIVERY_COUNTRY_ID`),
  KEY `FKiioesp0vl6x4om1jeajj4uy1t` (`DELIVERY_ZONE_ID`),
  CONSTRAINT `FK9vb7tbjl8ivygdiqw883fewx7` FOREIGN KEY (`DELIVERY_COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FKiioesp0vl6x4om1jeajj4uy1t` FOREIGN KEY (`DELIVERY_ZONE_ID`) REFERENCES `zone` (`ZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_quote`
--

LOCK TABLES `shipping_quote` WRITE;
/*!40000 ALTER TABLE `shipping_quote` DISABLE KEYS */;
INSERT INTO `shipping_quote` VALUES (1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-09 18:12:57',NULL,0.00,'2020-10-09 18:12:57',37,206),(2,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-09 18:17:12',NULL,0.00,'2020-10-09 18:17:12',37,206),(3,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-09 18:17:12',NULL,0.00,'2020-10-09 18:17:12',37,206),(4,1,NULL,'138, Azad Road,','MUMBAI','test',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-09 18:20:20',NULL,0.00,'2020-10-09 18:20:20',37,198),(5,1,NULL,'138, Azad Road,','MUMBAI','test',NULL,NULL,'40005','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-09 18:21:27',NULL,0.00,'2020-10-09 18:21:27',37,198),(6,1,NULL,'138, Azad Road,','MUMBAI','test',NULL,NULL,'4000','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-09 18:21:27',NULL,0.00,'2020-10-09 18:21:27',37,198),(7,1,NULL,'138, Azad Road,','MUMBAI','test',NULL,NULL,'40004','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-09 18:21:30',NULL,0.00,'2020-10-09 18:21:30',37,198),(8,1,NULL,'138, Azad Road,','MUMBAI','test',NULL,NULL,'400049','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-09 18:21:31',NULL,0.00,'2020-10-09 18:21:31',37,198),(9,1,NULL,'138, Azad Road,','MUMBAI','test',NULL,NULL,'400049','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-09 19:32:35',NULL,0.00,'2020-10-09 19:32:35',37,198),(50,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 01:21:07',NULL,0.00,'2020-10-10 01:21:07',37,206),(51,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 01:21:53',NULL,0.00,'2020-10-10 01:21:53',37,206),(52,200,NULL,'','','',NULL,NULL,'','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 01:22:07',NULL,0.00,'2020-10-10 01:22:07',73,206),(53,200,NULL,'','','',NULL,NULL,'','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 01:22:23',NULL,0.00,'2020-10-10 01:22:23',37,206),(54,200,NULL,'','','',NULL,NULL,'','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 01:22:30',NULL,0.00,'2020-10-10 01:22:30',73,206),(55,200,NULL,'','','',NULL,NULL,'','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 01:22:47',NULL,0.00,'2020-10-10 01:22:47',37,206),(56,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 01:24:47',NULL,0.00,'2020-10-10 01:24:47',37,206),(57,200,NULL,'','','',NULL,NULL,'','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 01:24:59',NULL,0.00,'2020-10-10 01:24:59',73,206),(58,200,NULL,'','','',NULL,NULL,'','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 01:25:09',NULL,0.00,'2020-10-10 01:25:09',37,206),(100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:22:13',NULL,0.00,'2020-10-10 11:22:13',37,206),(101,1,NULL,'','','',NULL,NULL,'','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:24:26',NULL,0.00,'2020-10-10 11:24:26',73,206),(102,1,NULL,'','','',NULL,NULL,'','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:24:34',NULL,0.00,'2020-10-10 11:24:34',37,206),(103,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:25:57',NULL,0.00,'2020-10-10 11:25:57',37,206),(104,1,NULL,'','','',NULL,NULL,'','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:26:07',NULL,0.00,'2020-10-10 11:26:07',73,206),(105,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:30:55',NULL,0.00,'2020-10-10 11:30:55',37,206),(106,1,NULL,'','','',NULL,NULL,'','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:31:06',NULL,0.00,'2020-10-10 11:31:06',73,206),(107,1,NULL,'','','',NULL,NULL,'','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:31:10',NULL,0.00,'2020-10-10 11:31:10',37,206),(108,1,NULL,'','','',NULL,NULL,'4','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:31:16',NULL,25.00,'2020-10-10 11:31:16',37,206),(109,1,NULL,'','','',NULL,NULL,'4','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:31:16',NULL,0.00,'2020-10-10 11:31:16',37,206),(110,1,NULL,'','','',NULL,NULL,'40','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:31:16',NULL,25.00,'2020-10-10 11:31:16',37,206),(111,1,NULL,'','','',NULL,NULL,'40','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:31:16',NULL,0.00,'2020-10-10 11:31:16',37,206),(112,1,NULL,'','','',NULL,NULL,'400','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:31:16',NULL,25.00,'2020-10-10 11:31:16',37,206),(113,1,NULL,'','','',NULL,NULL,'400','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:31:16',NULL,0.00,'2020-10-10 11:31:16',37,206),(114,1,NULL,'','','',NULL,NULL,'4000','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:31:16',NULL,25.00,'2020-10-10 11:31:16',37,206),(115,1,NULL,'','','',NULL,NULL,'4000','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:31:16',NULL,0.00,'2020-10-10 11:31:16',37,206),(116,1,NULL,'','','',NULL,NULL,'40005','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:31:18',NULL,25.00,'2020-10-10 11:31:18',37,206),(117,1,NULL,'','','',NULL,NULL,'40005','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:31:18',NULL,0.00,'2020-10-10 11:31:18',37,206),(118,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:31:18',NULL,25.00,'2020-10-10 11:31:18',37,206),(119,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:31:18',NULL,0.00,'2020-10-10 11:31:18',37,206),(120,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:31:20',NULL,25.00,'2020-10-10 11:31:20',37,206),(121,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:31:20',NULL,0.00,'2020-10-10 11:31:20',37,206),(122,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:32:26',NULL,0.00,'2020-10-10 11:32:26',37,206),(123,1,NULL,'','','',NULL,NULL,'4','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:32:34',NULL,25.00,'2020-10-10 11:32:34',37,206),(124,1,NULL,'','','',NULL,NULL,'4','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:32:34',NULL,0.00,'2020-10-10 11:32:34',37,206),(125,1,NULL,'','','',NULL,NULL,'40','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:32:34',NULL,25.00,'2020-10-10 11:32:34',37,206),(126,1,NULL,'','','',NULL,NULL,'40','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:32:34',NULL,0.00,'2020-10-10 11:32:34',37,206),(127,1,NULL,'','','',NULL,NULL,'400','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:32:34',NULL,25.00,'2020-10-10 11:32:34',37,206),(128,1,NULL,'','','',NULL,NULL,'400','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:32:34',NULL,0.00,'2020-10-10 11:32:34',37,206),(129,1,NULL,'','','',NULL,NULL,'400','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:32:49',NULL,25.00,'2020-10-10 11:32:49',37,206),(130,1,NULL,'','','',NULL,NULL,'400','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:32:49',NULL,0.00,'2020-10-10 11:32:49',37,206),(131,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:33:04',NULL,0.00,'2020-10-10 11:33:04',37,206),(132,1,NULL,'','','',NULL,NULL,'4','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:33:11',NULL,0.00,'2020-10-10 11:33:11',37,206),(133,1,NULL,'','','',NULL,NULL,'40','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:33:11',NULL,0.00,'2020-10-10 11:33:11',37,206),(134,1,NULL,'','','',NULL,NULL,'400','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:33:11',NULL,0.00,'2020-10-10 11:33:11',37,206),(135,1,NULL,'','','',NULL,NULL,'400','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:33:16',NULL,0.00,'2020-10-10 11:33:16',37,206),(136,1,NULL,'','','',NULL,NULL,'4000','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:33:20',NULL,0.00,'2020-10-10 11:33:20',37,206),(137,1,NULL,'','','',NULL,NULL,'40005','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:33:21',NULL,0.00,'2020-10-10 11:33:21',37,206),(138,1,NULL,'','','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:33:21',NULL,0.00,'2020-10-10 11:33:21',37,206),(139,1,NULL,'','','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:33:23',NULL,0.00,'2020-10-10 11:33:23',37,206),(140,1,NULL,'','','',NULL,NULL,'40005','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:34:43',NULL,125.00,'2020-10-10 11:34:43',37,206),(141,1,NULL,'','','',NULL,NULL,'40005','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:34:43',NULL,0.00,'2020-10-10 11:34:43',37,206),(142,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:34:48',NULL,125.00,'2020-10-10 11:34:48',37,206),(143,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:34:48',NULL,0.00,'2020-10-10 11:34:48',37,206),(144,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:34:55',NULL,125.00,'2020-10-10 11:34:55',37,206),(145,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:34:55',NULL,0.00,'2020-10-10 11:34:55',37,206),(146,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:35:06',NULL,0.00,'2020-10-10 11:35:06',37,206),(147,1,NULL,'','','',NULL,NULL,'40005','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:35:14',NULL,125.00,'2020-10-10 11:35:14',37,206),(148,1,NULL,'','','',NULL,NULL,'40005','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:35:14',NULL,0.00,'2020-10-10 11:35:14',37,206),(149,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:35:16',NULL,125.00,'2020-10-10 11:35:16',37,206),(150,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:35:16',NULL,0.00,'2020-10-10 11:35:16',37,206),(151,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:35:22',NULL,125.00,'2020-10-10 11:35:22',37,206),(152,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:35:22',NULL,0.00,'2020-10-10 11:35:22',37,206),(153,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:35:26',NULL,125.00,'2020-10-10 11:35:26',37,206),(154,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:35:26',NULL,0.00,'2020-10-10 11:35:26',37,206),(155,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:35:30',NULL,125.00,'2020-10-10 11:35:30',37,206),(156,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:35:30',NULL,0.00,'2020-10-10 11:35:30',37,206),(157,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:35:55',NULL,0.00,'2020-10-10 11:35:55',37,206),(158,1,NULL,'','','',NULL,NULL,'4','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:36:02',NULL,25.00,'2020-10-10 11:36:02',37,206),(159,1,NULL,'','','',NULL,NULL,'4','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:36:02',NULL,0.00,'2020-10-10 11:36:02',37,206),(160,1,NULL,'','','',NULL,NULL,'40','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:36:02',NULL,25.00,'2020-10-10 11:36:02',37,206),(161,1,NULL,'','','',NULL,NULL,'40','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:36:02',NULL,0.00,'2020-10-10 11:36:02',37,206),(162,1,NULL,'','','',NULL,NULL,'400','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:36:02',NULL,25.00,'2020-10-10 11:36:02',37,206),(163,1,NULL,'','','',NULL,NULL,'400','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:36:02',NULL,0.00,'2020-10-10 11:36:02',37,206),(164,1,NULL,'','','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:36:05',NULL,25.00,'2020-10-10 11:36:05',37,206),(165,1,NULL,'','','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:36:05',NULL,25.00,'2020-10-10 11:36:05',37,206),(166,1,NULL,'','','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:36:05',NULL,0.00,'2020-10-10 11:36:05',37,206),(167,1,NULL,'','','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:36:05',NULL,0.00,'2020-10-10 11:36:05',37,206),(168,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:36:08',NULL,25.00,'2020-10-10 11:36:08',37,206),(169,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:36:08',NULL,0.00,'2020-10-10 11:36:08',37,206),(170,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:36:15',NULL,25.00,'2020-10-10 11:36:15',37,206),(171,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:36:15',NULL,0.00,'2020-10-10 11:36:15',37,206),(172,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:36:17',NULL,25.00,'2020-10-10 11:36:17',37,206),(173,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:36:17',NULL,0.00,'2020-10-10 11:36:17',37,206),(174,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:36:18',NULL,25.00,'2020-10-10 11:36:18',37,206),(175,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:36:18',NULL,0.00,'2020-10-10 11:36:18',37,206),(176,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:36:19',NULL,25.00,'2020-10-10 11:36:19',37,206),(177,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:36:19',NULL,0.00,'2020-10-10 11:36:19',37,206),(178,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:36:22',NULL,25.00,'2020-10-10 11:36:22',37,206),(179,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:36:22',NULL,0.00,'2020-10-10 11:36:22',37,206),(180,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:36:53',NULL,25.00,'2020-10-10 11:36:53',37,206),(181,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:36:53',NULL,0.00,'2020-10-10 11:36:53',37,206),(182,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:37:05',NULL,25.00,'2020-10-10 11:37:05',37,206),(183,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:37:05',NULL,0.00,'2020-10-10 11:37:05',37,206),(184,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:37:12',NULL,25.00,'2020-10-10 11:37:12',37,206),(185,1,NULL,'','','',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:37:12',NULL,0.00,'2020-10-10 11:37:12',37,206),(186,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:39:00',NULL,0.00,'2020-10-10 11:39:00',37,206),(187,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:39:31',NULL,0.00,'2020-10-10 11:39:31',37,206),(188,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:39:37',NULL,25.00,'2020-10-10 11:39:37',37,206),(189,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:39:37',NULL,25.00,'2020-10-10 11:39:37',37,206),(190,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:39:37',NULL,0.00,'2020-10-10 11:39:37',37,206),(191,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:39:37',NULL,0.00,'2020-10-10 11:39:37',37,206),(192,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:39:46',NULL,25.00,'2020-10-10 11:39:46',37,206),(193,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:39:46',NULL,0.00,'2020-10-10 11:39:46',37,206),(194,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:43:11',NULL,25.00,'2020-10-10 11:43:11',37,206),(195,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:43:11',NULL,0.00,'2020-10-10 11:43:11',37,206),(196,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:43:22',NULL,0.00,'2020-10-10 11:43:22',37,206),(197,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:43:27',NULL,25.00,'2020-10-10 11:43:27',37,206),(198,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:43:27',NULL,25.00,'2020-10-10 11:43:27',37,206),(199,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:43:27',NULL,0.00,'2020-10-10 11:43:27',37,206),(200,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:43:27',NULL,0.00,'2020-10-10 11:43:27',37,206),(201,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:43:36',NULL,25.00,'2020-10-10 11:43:36',37,206),(202,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:43:36',NULL,0.00,'2020-10-10 11:43:36',37,206),(203,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:44:17',NULL,25.00,'2020-10-10 11:44:17',37,206),(204,1,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:44:17',NULL,0.00,'2020-10-10 11:44:17',37,206),(205,250,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:52:49',NULL,0.00,'2020-10-10 11:52:49',37,206),(206,250,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:52:54',NULL,25.00,'2020-10-10 11:52:54',37,206),(207,250,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:52:54',NULL,25.00,'2020-10-10 11:52:54',37,206),(208,250,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:52:54',NULL,0.00,'2020-10-10 11:52:54',37,206),(209,250,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:52:54',NULL,0.00,'2020-10-10 11:52:54',37,206),(210,250,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:53:12',NULL,25.00,'2020-10-10 11:53:12',37,206),(211,250,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:53:12',NULL,0.00,'2020-10-10 11:53:12',37,206),(212,250,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:53:23',NULL,25.00,'2020-10-10 11:53:23',37,206),(213,250,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:53:23',NULL,0.00,'2020-10-10 11:53:23',37,206),(214,250,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:53:33',NULL,25.00,'2020-10-10 11:53:33',37,206),(215,250,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:53:33',NULL,0.00,'2020-10-10 11:53:33',37,206),(216,251,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:55:18',NULL,0.00,'2020-10-10 11:55:18',37,206),(217,251,NULL,'138, Azad Road,','MUMBAI','Kasim ',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:55:33',NULL,25.00,'2020-10-10 11:55:33',37,NULL),(218,251,NULL,'138, Azad Road,','MUMBAI','Kasim ',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:55:33',NULL,25.00,'2020-10-10 11:55:33',37,NULL),(219,251,NULL,'138, Azad Road,','MUMBAI','Kasim ',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:55:33',NULL,0.00,'2020-10-10 11:55:33',37,NULL),(220,251,NULL,'138, Azad Road,','MUMBAI','Kasim ',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:55:33',NULL,0.00,'2020-10-10 11:55:33',37,NULL),(221,251,NULL,'138, Azad Road,','MUMBAI','Kasim ',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:55:39',NULL,25.00,'2020-10-10 11:55:39',37,NULL),(222,251,NULL,'138, Azad Road,','MUMBAI','Kasim ',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:55:39',NULL,0.00,'2020-10-10 11:55:39',37,NULL),(223,251,NULL,'138, Azad Road,','MUMBAI','Kasim ',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'India','2020-10-10 11:56:04',NULL,25.00,'2020-10-10 11:56:04',37,NULL),(224,251,NULL,'138, Azad Road,','MUMBAI','Kasim ',NULL,NULL,'400057','Maharashtra',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 11:56:04',NULL,0.00,'2020-10-10 11:56:04',37,NULL),(225,252,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 12:01:35',NULL,0.00,'2020-10-10 12:01:35',37,206),(226,252,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 12:05:26',NULL,0.00,'2020-10-10 12:05:26',37,206),(227,252,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 12:09:39',NULL,0.00,'2020-10-10 12:09:39',37,206),(228,252,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'Inde','2020-10-10 12:09:58',NULL,25.00,'2020-10-10 12:09:58',37,206),(229,252,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 12:09:58',NULL,0.00,'2020-10-10 12:09:58',37,206),(230,252,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'Inde','2020-10-10 12:09:58',NULL,25.00,'2020-10-10 12:09:58',37,206),(231,252,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 12:09:58',NULL,0.00,'2020-10-10 12:09:58',37,206),(232,252,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'Inde','2020-10-10 12:10:04',NULL,25.00,'2020-10-10 12:10:04',37,206),(233,252,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 12:10:04',NULL,0.00,'2020-10-10 12:10:04',37,206),(234,252,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'Inde','2020-10-10 12:10:25',NULL,25.00,'2020-10-10 12:10:25',37,206),(235,252,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 12:10:25',NULL,0.00,'2020-10-10 12:10:25',37,206),(250,300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 14:53:41',NULL,0.00,'2020-10-10 14:53:41',37,206),(251,300,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'Inde','2020-10-10 15:00:49',NULL,25.00,'2020-10-10 15:00:49',37,206),(252,300,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'Inde','2020-10-10 15:00:49',NULL,25.00,'2020-10-10 15:00:49',37,206),(253,300,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 15:00:49',NULL,0.00,'2020-10-10 15:00:49',37,206),(254,300,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 15:00:49',NULL,0.00,'2020-10-10 15:00:49',37,206),(255,300,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'Inde','2020-10-10 15:00:57',NULL,25.00,'2020-10-10 15:00:57',37,206),(256,300,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 15:00:57',NULL,0.00,'2020-10-10 15:00:57',37,206),(257,300,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'Inde','2020-10-10 15:01:13',NULL,25.00,'2020-10-10 15:01:13',37,206),(258,300,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 15:01:13',NULL,0.00,'2020-10-10 15:01:13',37,206),(259,300,NULL,'138, Azad Road,','MUMBAI','','Shabbir','Manasawala','400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'Inde','2020-10-10 15:01:27',NULL,25.00,'2020-10-10 15:01:27',37,206),(260,300,NULL,'138, Azad Road,','MUMBAI','','Shabbir','Manasawala','400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 15:01:27',NULL,0.00,'2020-10-10 15:01:27',37,206),(261,300,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','weightBased','CUSTOM_WEIGHT',NULL,'Inde','2020-10-10 15:01:33',NULL,25.00,'2020-10-10 15:01:33',37,206),(262,300,NULL,'138, Azad Road,','MUMBAI','',NULL,NULL,'400057','',NULL,NULL,_binary '\0',50.00,'0:0:0:0:0:0:0:1','storePickUp','storePickUp',NULL,NULL,'2020-10-10 15:01:33',NULL,0.00,'2020-10-10 15:01:33',37,206);
/*!40000 ALTER TABLE `shipping_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `SHP_CART_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint DEFAULT NULL,
  `PROMO_ADDED` datetime DEFAULT NULL,
  `PROMO_CODE` varchar(255) DEFAULT NULL,
  `SHP_CART_CODE` varchar(255) NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`SHP_CART_ID`),
  UNIQUE KEY `UK_8ld8p40fwrjobi7t3n95pna35` (`SHP_CART_CODE`),
  KEY `SHP_CART_CODE_IDX` (`SHP_CART_CODE`),
  KEY `SHP_CART_CUSTOMER_IDX` (`CUSTOMER_ID`),
  KEY `FKqvghr5rmjefe3lw9mcolk30a0` (`MERCHANT_ID`),
  CONSTRAINT `FKqvghr5rmjefe3lw9mcolk30a0` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (1,'2020-10-06 11:43:37','2020-10-10 11:44:18',NULL,NULL,'0:0:0:0:0:0:0:1',1,'2020-10-10 11:35:52','','c1f8b04993e74a3abcc0fed186a43b42',1),(3,'2020-10-06 15:17:18','2020-10-06 15:17:19',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'83a97e0b767147e9abb8dae449f28ed9',1),(50,'2020-10-09 23:32:09','2020-10-10 00:38:39',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,'2020-10-10 00:38:39','','e62e331b543d45778f085522807dc946',1),(100,'2020-10-10 00:24:15','2020-10-10 00:24:17',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'b7d961e3d0c144338b9650f9cd3cfffb',1),(101,'2020-10-10 00:24:31','2020-10-10 00:24:33',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'c4ae53ee8a834d3dbfeebf5c6ac37c6c',1),(200,'2020-10-10 01:16:37','2020-10-10 01:18:56',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,'2020-10-10 01:18:56','','d0debae96d6f45ada4ee7b1995ca02ba',1),(250,'2020-10-10 11:52:38','2020-10-10 11:53:34',NULL,NULL,'0:0:0:0:0:0:0:1',2,NULL,NULL,'e5e2eccefd84483292c6c1654f5cb398',1),(251,'2020-10-10 11:54:32','2020-10-10 11:56:07',NULL,8,'0:0:0:0:0:0:0:1',3,'2020-10-10 11:55:09','Bam0530','a258d2ad1ed64689aa1bf8e59763428c',1),(252,'2020-10-10 12:01:10','2020-10-10 12:10:26',NULL,NULL,'0:0:0:0:0:0:0:1',4,'2020-10-10 12:01:30','Bam0530','529520dede534ec7b54c09cd5316302a',1),(300,'2020-10-10 14:52:22','2020-10-10 14:53:15',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,'2020-10-10 14:53:15','','8fe72f2f93514cd4bb531df21a79a8c9',1),(350,'2020-10-10 15:26:29','2020-10-10 15:26:31',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'d5842c45e2234d529f6cb9bd9fd3fe0d',1),(351,'2020-10-10 15:37:41','2020-10-10 15:37:43',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'77e16273da064340854259af6e0e233c',1),(352,'2020-10-10 16:17:44','2020-10-10 16:17:44',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'52db850c905a4f81a51f93bb993db7ad',1),(353,'2020-10-10 16:17:47','2020-10-10 16:17:47',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'bb742ac5d8c6445c823c9a43b9c60e80',1),(354,'2020-10-10 16:19:26','2020-10-10 16:19:26',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'b273b44bdb25447abc481ffbd4a15ef2',1),(355,'2020-10-10 16:19:35','2020-10-10 16:19:35',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'141450f3982141f5969ebbdaf2a7ebe3',1),(400,'2020-10-10 16:27:21','2020-10-10 16:27:22',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'577ba020f95942ad8bd0d8160eb953d9',1),(401,'2020-10-10 16:33:50','2020-10-10 16:33:50',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'aa13872dc7394db892c4c3d1d081ec00',1),(402,'2020-10-10 16:34:43','2020-10-10 16:34:43',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'cf385b45002140c8bde5482e487527eb',1),(403,'2020-10-10 16:36:38','2020-10-10 16:36:38',NULL,8,'0:0:0:0:0:0:0:1',NULL,NULL,NULL,'d4f15b597a204ab48b8b5a21c80649f5',1),(450,'2020-10-10 16:44:51','2020-10-10 16:45:12',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,'2020-10-10 16:45:12','','f39a4241331d480dac1d6d42062faf28',1);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_attr_item`
--

DROP TABLE IF EXISTS `shopping_cart_attr_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart_attr_item` (
  `SHP_CART_ATTR_ITEM_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `PRODUCT_ATTR_ID` bigint NOT NULL,
  `SHP_CART_ITEM_ID` bigint NOT NULL,
  PRIMARY KEY (`SHP_CART_ATTR_ITEM_ID`),
  KEY `FKp42tpa623hyo9ww69v0ohb3er` (`SHP_CART_ITEM_ID`),
  CONSTRAINT `FKp42tpa623hyo9ww69v0ohb3er` FOREIGN KEY (`SHP_CART_ITEM_ID`) REFERENCES `shopping_cart_item` (`SHP_CART_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_attr_item`
--

LOCK TABLES `shopping_cart_attr_item` WRITE;
/*!40000 ALTER TABLE `shopping_cart_attr_item` DISABLE KEYS */;
INSERT INTO `shopping_cart_attr_item` VALUES (11,'2020-10-06 15:17:19','2020-10-06 15:17:19',NULL,4,7),(12,'2020-10-06 15:17:19','2020-10-06 15:17:19',NULL,2,7),(13,'2020-10-06 16:19:59','2020-10-06 16:19:59',NULL,5,8),(14,'2020-10-06 16:19:59','2020-10-06 16:19:59',NULL,3,8),(150,'2020-10-10 01:16:39','2020-10-10 01:16:39',NULL,4,300),(151,'2020-10-10 01:16:39','2020-10-10 01:16:39',NULL,2,300),(200,'2020-10-10 15:26:31','2020-10-10 15:26:31',NULL,4,450),(201,'2020-10-10 15:26:31','2020-10-10 15:26:31',NULL,2,450),(202,'2020-10-10 15:37:43','2020-10-10 15:37:43',NULL,4,451),(203,'2020-10-10 15:37:43','2020-10-10 15:37:43',NULL,2,451),(250,'2020-10-10 16:27:22','2020-10-10 16:27:22',NULL,5,500),(251,'2020-10-10 16:27:22','2020-10-10 16:27:22',NULL,3,500),(252,'2020-10-10 16:31:09','2020-10-10 16:31:09',NULL,5,501),(253,'2020-10-10 16:31:09','2020-10-10 16:31:09',NULL,3,501),(302,'2020-10-10 17:27:35','2020-10-10 17:27:35',NULL,101,553),(303,'2020-10-10 17:27:35','2020-10-10 17:27:35',NULL,103,553);
/*!40000 ALTER TABLE `shopping_cart_attr_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_item`
--

DROP TABLE IF EXISTS `shopping_cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart_item` (
  `SHP_CART_ITEM_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  `QUANTITY` int DEFAULT NULL,
  `SHP_CART_ID` bigint NOT NULL,
  PRIMARY KEY (`SHP_CART_ITEM_ID`),
  KEY `FK2gbimdwe9uysd5xadnfl0xq83` (`SHP_CART_ID`),
  CONSTRAINT `FK2gbimdwe9uysd5xadnfl0xq83` FOREIGN KEY (`SHP_CART_ID`) REFERENCES `shopping_cart` (`SHP_CART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_item`
--

LOCK TABLES `shopping_cart_item` WRITE;
/*!40000 ALTER TABLE `shopping_cart_item` DISABLE KEYS */;
INSERT INTO `shopping_cart_item` VALUES (7,'2020-10-06 15:17:19','2020-10-06 15:17:19',NULL,1,1,3),(8,'2020-10-06 16:19:59','2020-10-06 16:19:59',NULL,1,1,3),(100,'2020-10-09 23:32:10','2020-10-10 00:38:43',NULL,1,8,50),(200,'2020-10-10 00:24:17','2020-10-10 00:24:17',NULL,1,1,100),(201,'2020-10-10 00:24:33','2020-10-10 00:24:33',NULL,1,1,101),(300,'2020-10-10 01:16:39','2020-10-10 01:18:56',NULL,1,1,200),(350,'2020-10-10 11:14:51','2020-10-10 11:35:52',NULL,50,49,1),(351,'2020-10-10 11:52:38','2020-10-10 11:52:38',NULL,52,1,250),(352,'2020-10-10 11:54:32','2020-10-10 11:56:02',NULL,50,1,251),(353,'2020-10-10 11:54:35','2020-10-10 11:56:02',NULL,1,1,251),(354,'2020-10-10 11:54:47','2020-10-10 11:54:47',NULL,51,1,251),(355,'2020-10-10 12:01:10','2020-10-10 12:01:10',NULL,52,1,252),(400,'2020-10-10 14:52:22','2020-10-10 16:34:43',NULL,50,2,300),(401,'2020-10-10 14:52:37','2020-10-10 16:34:43',NULL,51,2,300),(402,'2020-10-10 14:52:44','2020-10-10 16:34:43',NULL,1,1,300),(450,'2020-10-10 15:26:31','2020-10-10 15:26:31',NULL,1,1,350),(451,'2020-10-10 15:37:43','2020-10-10 15:37:43',NULL,1,1,351),(452,'2020-10-10 16:17:44','2020-10-10 16:17:44',NULL,50,1,352),(453,'2020-10-10 16:17:47','2020-10-10 16:17:47',NULL,51,1,353),(454,'2020-10-10 16:19:26','2020-10-10 16:19:26',NULL,50,1,354),(455,'2020-10-10 16:19:35','2020-10-10 16:19:35',NULL,50,1,355),(500,'2020-10-10 16:27:22','2020-10-10 16:27:22',NULL,1,1,400),(501,'2020-10-10 16:31:09','2020-10-10 16:31:09',NULL,1,1,300),(502,'2020-10-10 16:33:50','2020-10-10 16:33:50',NULL,50,1,401),(503,'2020-10-10 16:34:43','2020-10-10 16:34:43',NULL,50,1,402),(504,'2020-10-10 16:36:38','2020-10-10 16:36:38',NULL,50,1,403),(550,'2020-10-10 16:44:52','2020-10-10 16:45:12',NULL,50,2,450),(551,'2020-10-10 17:00:14','2020-10-10 17:30:18',NULL,1,1,450),(552,'2020-10-10 17:01:26','2020-10-10 17:30:18',NULL,1,1,450),(553,'2020-10-10 17:27:35','2020-10-10 17:27:35',NULL,1,1,450);
/*!40000 ALTER TABLE `shopping_cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sm_group`
--

DROP TABLE IF EXISTS `sm_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sm_group` (
  `GROUP_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `GROUP_NAME` varchar(255) DEFAULT NULL,
  `GROUP_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`),
  UNIQUE KEY `UK_t83rjsoml3o785oj37lpqpyko` (`GROUP_NAME`),
  KEY `SM_GROUP_GROUP_TYPE` (`GROUP_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sm_group`
--

LOCK TABLES `sm_group` WRITE;
/*!40000 ALTER TABLE `sm_group` DISABLE KEYS */;
INSERT INTO `sm_group` VALUES (1,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'SUPERADMIN','ADMIN'),(2,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'ADMIN','ADMIN'),(3,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'ADMIN_RETAILER','ADMIN'),(4,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'ADMIN_STORE','ADMIN'),(5,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'ADMIN_CATALOGUE','ADMIN'),(6,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'ADMIN_ORDER','ADMIN'),(7,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'ADMIN_CONTENT','ADMIN'),(8,'2020-10-06 10:41:03','2020-10-06 10:41:03',NULL,'CUSTOMER','CUSTOMER');
/*!40000 ALTER TABLE `sm_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sm_sequencer`
--

DROP TABLE IF EXISTS `sm_sequencer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sm_sequencer` (
  `SEQ_NAME` varchar(255) NOT NULL,
  `SEQ_COUNT` bigint DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sm_sequencer`
--

LOCK TABLES `sm_sequencer` WRITE;
/*!40000 ALTER TABLE `sm_sequencer` DISABLE KEYS */;
INSERT INTO `sm_sequencer` VALUES ('category_description_seq',22),('CATEGORY_SEQ_NEXT_VAL',2),('content_description_seq',24),('CONTENT_SEQ_NEXT_VAL',4),('country_description_seq',286),('COUNTRY_SEQ_NEXT_VAL',2),('CURRENCY_SEQ_NEXT_VAL',4),('CUSTOMER_SEQ_NEXT_VAL',2),('GROUP_SEQ_NEXT_VAL',1),('LANG_SEQ_NEXT_VAL',1),('MANUFACT_SEQ_NEXT_VAL',2),('manufacturer_description_seq',18),('MERCH_CONF_SEQ_NEXT_VAL',3),('MOD_CONF_SEQ_NEXT_VAL',1),('OPTIN_SEQ_NEXT_VAL',1),('ORDER_ID_SEQ_NEXT_VAL',1),('ORDER_PRD_PRICE_ID_NEXT_VAL',1),('ORDER_PRODUCT_ID_NEXT_VALUE',1),('ORDER_TOTAL_ID_NEXT_VALUE',1),('PERMISSION_SEQ_NEXT_VAL',1),('PRD_TYPE_SEQ_NEXT_VAL',1),('PRODUCT_ATTR_SEQ_NEXT_VAL',3),('PRODUCT_AVAIL_SEQ_NEXT_VAL',3),('product_description_seq',15),('product_image_description_seq',13),('PRODUCT_IMG_SEQ_NEXT_VAL',4),('PRODUCT_OPT_VAL_SEQ_NEXT_VAL',3),('product_option_description_seq',13),('PRODUCT_OPTION_SEQ_NEXT_VAL',1),('product_option_value_description_seq',45),('product_price_description_seq',13),('PRODUCT_PRICE_SEQ_NEXT_VAL',3),('PRODUCT_RELATION_SEQ_NEXT_VAL',2),('PRODUCT_SEQ_NEXT_VAL',3),('SHIP_QUOTE_ID_NEXT_VALUE',6),('SHP_CRT_ATTR_ITM_SEQ_NEXT_VAL',7),('SHP_CRT_ITM_SEQ_NEXT_VAL',12),('SHP_CRT_SEQ_NEXT_VAL',10),('SHP_ORIG_SEQ_NEXT_VAL',1),('STATUS_HIST_ID_NEXT_VALUE',1),('STORE_SEQ_NEXT_VAL',1),('TAX_RATE_ID_NEXT_VALUE',1),('taxrate_description_seq',3),('TRANSACT_SEQ_NEXT_VAL',1),('TX_CLASS_SEQ_NEXT_VAL',1),('USER_SEQ_NEXT_VAL',1),('zone_description_seq',652),('ZONE_SEQ_NEXT_VAL',5);
/*!40000 ALTER TABLE `sm_sequencer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sm_transaction`
--

DROP TABLE IF EXISTS `sm_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sm_transaction` (
  `TRANSACTION_ID` bigint NOT NULL,
  `AMOUNT` decimal(19,2) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DETAILS` longtext,
  `PAYMENT_TYPE` varchar(255) DEFAULT NULL,
  `TRANSACTION_DATE` datetime DEFAULT NULL,
  `TRANSACTION_TYPE` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`TRANSACTION_ID`),
  KEY `FK7j0s1gqh2tue1fyh5nyj5kwkp` (`ORDER_ID`),
  CONSTRAINT `FK7j0s1gqh2tue1fyh5nyj5kwkp` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sm_transaction`
--

LOCK TABLES `sm_transaction` WRITE;
/*!40000 ALTER TABLE `sm_transaction` DISABLE KEYS */;
INSERT INTO `sm_transaction` VALUES (1,4367.18,'2020-10-10 11:44:17','2020-10-10 11:44:18',NULL,NULL,'MONEYORDER','2020-10-10 11:44:17','AUTHORIZECAPTURE',1),(2,146.32,'2020-10-10 11:53:34','2020-10-10 11:53:34',NULL,NULL,'MONEYORDER','2020-10-10 11:53:34','AUTHORIZECAPTURE',2),(3,182.20,'2020-10-10 11:56:06','2020-10-10 11:56:06',NULL,NULL,'MONEYORDER','2020-10-10 11:56:06','AUTHORIZECAPTURE',3),(4,136.52,'2020-10-10 12:10:25','2020-10-10 12:10:25',NULL,NULL,'MONEYORDER','2020-10-10 12:10:25','AUTHORIZECAPTURE',4);
/*!40000 ALTER TABLE `sm_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_configuration`
--

DROP TABLE IF EXISTS `system_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_configuration` (
  `SYSTEM_CONFIG_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CONFIG_KEY` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SYSTEM_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_configuration`
--

LOCK TABLES `system_configuration` WRITE;
/*!40000 ALTER TABLE `system_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notification`
--

DROP TABLE IF EXISTS `system_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notification` (
  `SYSTEM_NOTIF_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `CONFIG_KEY` varchar(255) DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  `USER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`SYSTEM_NOTIF_ID`),
  UNIQUE KEY `UKnpdnlc390vgr2mhepib1mtrmr` (`MERCHANT_ID`,`CONFIG_KEY`),
  KEY `FKa54891emcl0fo27a1qk54slvk` (`USER_ID`),
  CONSTRAINT `FKa54891emcl0fo27a1qk54slvk` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `FKs6qk7l06e0s6m9n04momedgt7` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notification`
--

LOCK TABLES `system_notification` WRITE;
/*!40000 ALTER TABLE `system_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_class` (
  `TAX_CLASS_ID` bigint NOT NULL,
  `TAX_CLASS_CODE` varchar(10) NOT NULL,
  `TAX_CLASS_TITLE` varchar(32) NOT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`TAX_CLASS_ID`),
  UNIQUE KEY `UKa4q5q57a8oeh2ojeo8dhr935k` (`MERCHANT_ID`,`TAX_CLASS_CODE`),
  KEY `TAX_CLASS_CODE_IDX` (`TAX_CLASS_CODE`),
  CONSTRAINT `FK82i8puujghcv7fc82qwsgjg8w` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_class`
--

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` VALUES (1,'DEFAULT','DEFAULT',1);
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rate`
--

DROP TABLE IF EXISTS `tax_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rate` (
  `TAX_RATE_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `TAX_CODE` varchar(255) DEFAULT NULL,
  `PIGGYBACK` bit(1) DEFAULT NULL,
  `STORE_STATE_PROV` varchar(100) DEFAULT NULL,
  `TAX_PRIORITY` int DEFAULT NULL,
  `TAX_RATE` decimal(7,4) NOT NULL,
  `COUNTRY_ID` int NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  `TAX_CLASS_ID` bigint NOT NULL,
  `ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`TAX_RATE_ID`),
  UNIQUE KEY `UK8gh6l9n0xq03b91sglp62oelu` (`TAX_CODE`,`MERCHANT_ID`),
  KEY `FK6wm34jcwoembe1qsmle2wtwnv` (`COUNTRY_ID`),
  KEY `FKfwp6yka2qps9jna473e6c6yc1` (`MERCHANT_ID`),
  KEY `FKt8isen27i3ioa0tw3bl8qlvdh` (`PARENT_ID`),
  KEY `FK7bpa9pbl1gnj5y3xbgs3wc0eg` (`TAX_CLASS_ID`),
  KEY `FKm9snpf6o1nb4j1t80nas8d1ix` (`ZONE_ID`),
  CONSTRAINT `FK6wm34jcwoembe1qsmle2wtwnv` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`),
  CONSTRAINT `FK7bpa9pbl1gnj5y3xbgs3wc0eg` FOREIGN KEY (`TAX_CLASS_ID`) REFERENCES `tax_class` (`TAX_CLASS_ID`),
  CONSTRAINT `FKfwp6yka2qps9jna473e6c6yc1` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FKm9snpf6o1nb4j1t80nas8d1ix` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ZONE_ID`),
  CONSTRAINT `FKt8isen27i3ioa0tw3bl8qlvdh` FOREIGN KEY (`PARENT_ID`) REFERENCES `tax_rate` (`TAX_RATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rate`
--

LOCK TABLES `tax_rate` WRITE;
/*!40000 ALTER TABLE `tax_rate` DISABLE KEYS */;
INSERT INTO `tax_rate` VALUES (1,'2020-10-06 15:14:23','2020-10-06 15:14:23',NULL,'gst',_binary '\0','',0,18.0000,37,1,NULL,1,206);
/*!40000 ALTER TABLE `tax_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rate_description`
--

DROP TABLE IF EXISTS `tax_rate_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rate_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `TAX_RATE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKt3xg8pl88yacdxg49nb46effg` (`TAX_RATE_ID`,`LANGUAGE_ID`),
  KEY `FKsicb2ydx42o04pvlnxw2mlx0w` (`LANGUAGE_ID`),
  CONSTRAINT `FK65c2lqslk5kx25dpkem2r0vxq` FOREIGN KEY (`TAX_RATE_ID`) REFERENCES `tax_rate` (`TAX_RATE_ID`),
  CONSTRAINT `FKsicb2ydx42o04pvlnxw2mlx0w` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rate_description`
--

LOCK TABLES `tax_rate_description` WRITE;
/*!40000 ALTER TABLE `tax_rate_description` DISABLE KEYS */;
INSERT INTO `tax_rate_description` VALUES (1,'2020-10-06 15:14:23','2020-10-06 15:14:23',NULL,NULL,'GST',NULL,1,1),(2,'2020-10-06 15:14:23','2020-10-06 15:14:23',NULL,NULL,'GST',NULL,2,1);
/*!40000 ALTER TABLE `tax_rate_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `USER_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `ADMIN_EMAIL` varchar(255) DEFAULT NULL,
  `ADMIN_NAME` varchar(100) DEFAULT NULL,
  `ADMIN_PASSWORD` varchar(60) DEFAULT NULL,
  `ADMIN_A1` varchar(255) DEFAULT NULL,
  `ADMIN_A2` varchar(255) DEFAULT NULL,
  `ADMIN_A3` varchar(255) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `ADMIN_FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_ACCESS` datetime DEFAULT NULL,
  `ADMIN_LAST_NAME` varchar(255) DEFAULT NULL,
  `LOGIN_ACCESS` datetime DEFAULT NULL,
  `ADMIN_Q1` varchar(255) DEFAULT NULL,
  `ADMIN_Q2` varchar(255) DEFAULT NULL,
  `ADMIN_Q3` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `UKt2hv34k7g4po0pvmmvt5c7vgo` (`MERCHANT_ID`,`ADMIN_NAME`),
  KEY `FK3sh6qxgt118m71ttvkubgd9y8` (`LANGUAGE_ID`),
  CONSTRAINT `FK2yn065l2n7nw9rofjs4hwpij2` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchant_store` (`MERCHANT_ID`),
  CONSTRAINT `FK3sh6qxgt118m71ttvkubgd9y8` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,_binary '','admin@sams.com','admin@sams.com','$2a$10$M9ilc6.qjDYv7rDo33VinuKzOJEPDa4aJPGsyR876fNzJZqmi4yja',NULL,NULL,NULL,'2020-10-06 10:41:23','2020-10-10 16:45:47',NULL,'Administrator','2020-10-10 16:28:52','User','2020-10-10 16:45:47',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group` (
  `USER_ID` bigint NOT NULL,
  `GROUP_ID` int NOT NULL,
  KEY `FK75kainrhn4kh8j3sw2xbe7v61` (`GROUP_ID`),
  KEY `FKdonp1m2n25ua1465rhice3qna` (`USER_ID`),
  CONSTRAINT `FK75kainrhn4kh8j3sw2xbe7v61` FOREIGN KEY (`GROUP_ID`) REFERENCES `sm_group` (`GROUP_ID`),
  CONSTRAINT `FKdonp1m2n25ua1465rhice3qna` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userconnection`
--

DROP TABLE IF EXISTS `userconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userconnection` (
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `expireTime` bigint DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(255) DEFAULT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `userRank` int NOT NULL,
  PRIMARY KEY (`providerId`,`providerUserId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userconnection`
--

LOCK TABLES `userconnection` WRITE;
/*!40000 ALTER TABLE `userconnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `userconnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone` (
  `ZONE_ID` bigint NOT NULL,
  `ZONE_CODE` varchar(255) NOT NULL,
  `COUNTRY_ID` int NOT NULL,
  PRIMARY KEY (`ZONE_ID`),
  UNIQUE KEY `UK_4tq3p5w8k4h4easyf5t3n1jdr` (`ZONE_CODE`),
  KEY `FKhn2c1w3e1twhjg7tiwv7vuk67` (`COUNTRY_ID`),
  CONSTRAINT `FKhn2c1w3e1twhjg7tiwv7vuk67` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (1,'Guipuzcoa',79),(2,'HI',91),(3,'PR',91),(4,'Zamora',79),(5,'Vizcaya',79),(6,'OTR',64),(7,'Albacete',79),(8,'Lleida',79),(9,'QC',13),(10,'NRW',30),(11,'IA',91),(12,'ID',91),(13,'YT',13),(14,'Leon',79),(15,'ACorua',79),(16,'Castellon',79),(17,'LasPalmas',79),(18,'Pontevedra',79),(19,'AA',91),(20,'Teruel',79),(21,'AB',13),(22,'AC',91),(23,'IL',91),(24,'AE',91),(25,'AF',91),(26,'IN',91),(27,'AG',82),(28,'A Corua',79),(29,'AI',82),(30,'AK',91),(31,'Caceres',79),(32,'Segovia',79),(33,'AL',91),(34,'AM',91),(35,'ZG',82),(36,'Malaga',79),(37,'CEN',64),(38,'ZH',82),(39,'LaRioja',79),(40,'AP',91),(41,'Melilla',79),(42,'AR',91),(43,'AS',91),(44,'NSW',4),(45,'Madrid',79),(46,'RI',91),(47,'AZ',91),(48,'Ceuta',79),(49,'BC',13),(50,'Huelva',79),(51,'BE',82),(52,'Huesca',79),(53,'ARCH',82),(54,'BL',82),(55,'JU',82),(56,'Asturias',79),(57,'SA',4),(58,'SB',5),(59,'TIAT',5),(60,'SC',91),(61,'THE',30),(62,'SD',91),(63,'BS',82),(64,'Cordoba',79),(65,'Tarragona',79),(66,'Valladolid',79),(67,'SG',82),(68,'SH',82),(69,'WAAU',4),(70,'SK',13),(71,'NDS',30),(72,'SO',82),(73,'CA',91),(74,'NTAU',4),(75,'ST',5),(76,'KN',5),(77,'Jaen',79),(78,'ASU',64),(79,'CiudadReal',79),(80,'SZ',82),(81,'Alava',79),(82,'KS',91),(83,'CO',91),(84,'KY',91),(85,'BER',30),(86,'CT',91),(87,'ACT',4),(88,'TG',82),(89,'LA',91),(90,'HAM',30),(91,'TI',82),(92,'Lugo',79),(93,'NECH',82),(94,'TN',91),(95,'Toledo',79),(96,'DC',91),(97,'Palencia',79),(98,'DE',91),(99,'TX',91),(100,'TAS',4),(101,'QLD',4),(102,'LU',82),(103,'Burgos',79),(104,'Cadiz',79),(105,'SantaCruzdeTenerife',79),(106,'MA',91),(107,'MB',13),(108,'MD',91),(109,'Girona',79),(110,'ME',91),(111,'Alicante',79),(112,'Guadalajara',79),(113,'Cantabria',79),(114,'MH',91),(115,'MI',91),(116,'UR',82),(117,'UT',91),(118,'MN',91),(119,'MO',91),(120,'MP',91),(121,'Barcelona',79),(122,'MS',91),(123,'MT',91),(124,'Badajoz',79),(125,'MEC',30),(126,'VA',91),(127,'VB',5),(128,'Cuenca',79),(129,'WIAT',5),(130,'VD',82),(131,'Sevilla',79),(132,'VI',91),(133,'Zaragoza',79),(134,'NB',13),(135,'SAC',30),(136,'NC',91),(137,'ND',91),(138,'NE',91),(139,'NF',13),(140,'NH',91),(141,'NJ',91),(142,'VS',82),(143,'VT',91),(144,'NM',91),(145,'NO',5),(146,'SAS',30),(147,'NS',13),(148,'SAR',30),(149,'FL',91),(150,'NT',13),(151,'FM',91),(152,'NU',13),(153,'NV',91),(154,'NW',82),(155,'WA',91),(156,'NY',91),(157,'Granada',79),(158,'Soria',79),(159,'FR',82),(160,'RHE',30),(161,'Ourense',79),(162,'WI',91),(163,'OH',91),(164,'GA',91),(165,'Murcia',79),(166,'OK',91),(167,'GE',82),(168,'WV',91),(169,'ON',13),(170,'OO',5),(171,'WY',91),(172,'BLAT',5),(173,'Avila',79),(174,'OR',91),(175,'Salamanca',79),(176,'GL',82),(177,'Baleares',79),(178,'OW',82),(179,'GR',82),(180,'GU',91),(181,'PA',91),(182,'VIC',4),(183,'BRE',30),(184,'PE',13),(185,'BRG',30),(186,'HES',30),(187,'Almeria',79),(188,'BAW',30),(189,'BAY',30),(190,'Navarra',79),(191,'Valencia',79),(192,'SCN',30),(193,'AndhraPradesh',37),(194,'ArunachalPradesh',37),(195,'Assam',37),(196,'Bihar',37),(197,'Chhattisgarh',37),(198,'Goa',37),(199,'Gujarat',37),(200,'Haryana',37),(201,'HimachalPradesh',37),(202,'Jharkhand',37),(203,'Karnataka',37),(204,'Kerala',37),(205,'MadhyaPradesh',37),(206,'Maharashtra',37),(207,'Manipur',37),(208,'Meghalaya',37),(209,'Mizoram',37),(210,'Nagaland',37),(211,'Odisha',37),(212,'Punjab',37),(213,'Rajasthan',37),(214,'Sikkim',37),(215,'TamilNadu',37),(216,'Telangana',37),(217,'Tripura',37),(218,'Uttarakhand',37),(219,'WestBengal',37);
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone_description`
--

DROP TABLE IF EXISTS `zone_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone_description` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `ZONE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKm64laxgrv9fxm6io232ap4su9` (`ZONE_ID`,`LANGUAGE_ID`),
  KEY `FK69ybu7r3bgpcq65c77ji1udh3` (`LANGUAGE_ID`),
  CONSTRAINT `FK69ybu7r3bgpcq65c77ji1udh3` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `language` (`LANGUAGE_ID`),
  CONSTRAINT `FKpv4elin6w3b03756obqvk447f` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_description`
--

LOCK TABLES `zone_description` WRITE;
/*!40000 ALTER TABLE `zone_description` DISABLE KEYS */;
INSERT INTO `zone_description` VALUES (1,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Guipuzcoa',NULL,1,1),(2,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Guipuzcoa',NULL,2,1),(3,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Guipuzcoa',NULL,3,1),(4,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Hawaii',NULL,1,2),(5,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Hawaii',NULL,2,2),(6,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Hawaii',NULL,3,2),(7,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Puerto Rico',NULL,1,3),(8,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Puerto Rico',NULL,2,3),(9,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Puerto Rico',NULL,3,3),(10,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Zamora',NULL,1,4),(11,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Zamora',NULL,2,4),(12,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Zamora',NULL,3,4),(13,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Vizcaya',NULL,1,5),(14,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Vizcaya',NULL,2,5),(15,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Vizcaya',NULL,3,5),(16,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Other',NULL,1,6),(17,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Otro',NULL,3,6),(18,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Albacete',NULL,1,7),(19,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Albacete',NULL,2,7),(20,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Albacete',NULL,3,7),(21,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Lleida',NULL,1,8),(22,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Lleida',NULL,2,8),(23,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Lleida',NULL,3,8),(24,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Quebec',NULL,1,9),(25,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Québec',NULL,2,9),(26,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Quebec',NULL,3,9),(27,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Nordrhein-Westfalen',NULL,1,10),(28,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Nordrhein-Westfalen',NULL,2,10),(29,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Nordrhein-Westfalen',NULL,3,10),(30,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Iowa',NULL,1,11),(31,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Iowa',NULL,2,11),(32,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Iowa',NULL,3,11),(33,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Idaho',NULL,1,12),(34,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Idaho',NULL,2,12),(35,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Idaho',NULL,3,12),(36,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Yukon Territory',NULL,1,13),(37,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Yukon',NULL,2,13),(38,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Yukon Territory',NULL,3,13),(39,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Leon',NULL,1,14),(40,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Leon',NULL,2,14),(41,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Leon',NULL,3,14),(42,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'A Corua',NULL,1,15),(43,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'A Corua',NULL,3,15),(44,'2020-10-06 10:41:08','2020-10-06 10:41:08',NULL,NULL,'Castellon',NULL,1,16),(45,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Castellon',NULL,2,16),(46,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Castellon',NULL,3,16),(47,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Las Palmas',NULL,1,17),(48,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Las Palmas',NULL,2,17),(49,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Las Palmas',NULL,3,17),(50,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Pontevedra',NULL,1,18),(51,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Pontevedra',NULL,2,18),(52,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Pontevedra',NULL,3,18),(53,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Americas',NULL,1,19),(54,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Americas',NULL,2,19),(55,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Americas',NULL,3,19),(56,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Teruel',NULL,1,20),(57,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Teruel',NULL,2,20),(58,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Teruel',NULL,3,20),(59,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Alberta',NULL,1,21),(60,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Alberta',NULL,2,21),(61,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Alberta',NULL,3,21),(62,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Canada',NULL,1,22),(63,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Canada',NULL,2,22),(64,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Canada',NULL,3,22),(65,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Illinois',NULL,1,23),(66,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Illinois',NULL,2,23),(67,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Illinois',NULL,3,23),(68,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Europe',NULL,1,24),(69,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Europe',NULL,2,24),(70,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Europe',NULL,3,24),(71,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Africa',NULL,1,25),(72,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Africa',NULL,2,25),(73,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Africa',NULL,3,25),(74,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Indiana',NULL,1,26),(75,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Indiana',NULL,2,26),(76,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Indiana',NULL,3,26),(77,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Aargau',NULL,1,27),(78,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Aargau',NULL,2,27),(79,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Aargau',NULL,3,27),(80,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'A Corua',NULL,2,28),(81,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Appenzell Innerrhoden',NULL,1,29),(82,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Appenzell Innerrhoden',NULL,2,29),(83,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Appenzell Innerrhoden',NULL,3,29),(84,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Alaska',NULL,1,30),(85,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Alaska',NULL,2,30),(86,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Alaska',NULL,3,30),(87,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Caceres',NULL,1,31),(88,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Caceres',NULL,2,31),(89,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Caceres',NULL,3,31),(90,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Segovia',NULL,1,32),(91,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Segovia',NULL,2,32),(92,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Segovia',NULL,3,32),(93,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Alabama',NULL,1,33),(94,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Alabama',NULL,2,33),(95,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Alabama',NULL,3,33),(96,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Middle East',NULL,1,34),(97,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Middle East',NULL,2,34),(98,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Armed Forces Middle East',NULL,3,34),(99,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Zug',NULL,1,35),(100,'2020-10-06 10:41:09','2020-10-06 10:41:09',NULL,NULL,'Zug',NULL,2,35),(101,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Zug',NULL,3,35),(102,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Malaga',NULL,1,36),(103,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Malaga',NULL,2,36),(104,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Malaga',NULL,3,36),(105,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Central',NULL,1,37),(106,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Central',NULL,3,37),(107,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Zrich',NULL,1,38),(108,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Zrich',NULL,2,38),(109,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Zrich',NULL,3,38),(110,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'La Rioja',NULL,1,39),(111,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'La Rioja',NULL,2,39),(112,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'La Rioja',NULL,3,39),(113,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Armed Forces Pacific',NULL,1,40),(114,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Armed Forces Pacific',NULL,2,40),(115,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Armed Forces Pacific',NULL,3,40),(116,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Melilla',NULL,1,41),(117,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Melilla',NULL,2,41),(118,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Melilla',NULL,3,41),(119,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Arkansas',NULL,1,42),(120,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Arkansas',NULL,2,42),(121,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Arkansas',NULL,3,42),(122,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'American Samoa',NULL,1,43),(123,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'American Samoa',NULL,2,43),(124,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'American Samoa',NULL,3,43),(125,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'New South Wales',NULL,1,44),(126,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Nouvelle-Galles du Sud',NULL,2,44),(127,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'New South Wales',NULL,3,44),(128,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Madrid',NULL,1,45),(129,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Madrid',NULL,2,45),(130,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Madrid',NULL,3,45),(131,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Rhode Island',NULL,1,46),(132,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Rhode Island',NULL,2,46),(133,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Rhode Island',NULL,3,46),(134,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Arizona',NULL,1,47),(135,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Arizona',NULL,2,47),(136,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Arizona',NULL,3,47),(137,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Ceuta',NULL,1,48),(138,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Ceuta',NULL,2,48),(139,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Ceuta',NULL,3,48),(140,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'British Columbia',NULL,1,49),(141,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Colombie Britanique',NULL,2,49),(142,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'British Columbia',NULL,3,49),(143,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Huelva',NULL,1,50),(144,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Huelva',NULL,2,50),(145,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Huelva',NULL,3,50),(146,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Bern',NULL,1,51),(147,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Bern',NULL,2,51),(148,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Bern',NULL,3,51),(149,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Huesca',NULL,1,52),(150,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Huesca',NULL,2,52),(151,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Huesca',NULL,3,52),(152,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Appenzell Ausserrhoden',NULL,1,53),(153,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Appenzell Ausserrhoden',NULL,2,53),(154,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Appenzell Ausserrhoden',NULL,3,53),(155,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Basel-Landschaft',NULL,1,54),(156,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Basel-Landschaft',NULL,2,54),(157,'2020-10-06 10:41:10','2020-10-06 10:41:10',NULL,NULL,'Basel-Landschaft',NULL,3,54),(158,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Jura',NULL,1,55),(159,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Jura',NULL,2,55),(160,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Jura',NULL,3,55),(161,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Asturias',NULL,1,56),(162,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Asturias',NULL,2,56),(163,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Asturias',NULL,3,56),(164,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'South Australia',NULL,1,57),(165,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Australie-Mridionale',NULL,2,57),(166,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'South Australia',NULL,3,57),(167,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Salzburg',NULL,1,58),(168,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Salzburg',NULL,2,58),(169,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Salzburg',NULL,3,58),(170,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Tirol',NULL,1,59),(171,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Tirol',NULL,2,59),(172,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Tirol',NULL,3,59),(173,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'South Carolina',NULL,1,60),(174,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Caroline du Sud',NULL,2,60),(175,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'South Carolina',NULL,3,60),(176,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Thringen',NULL,1,61),(177,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Thringen',NULL,2,61),(178,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Thringen',NULL,3,61),(179,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'South Dakota',NULL,1,62),(180,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Dakota du Sud',NULL,2,62),(181,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'South Dakota',NULL,3,62),(182,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Basel-Stadt',NULL,1,63),(183,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Basel-Stadt',NULL,2,63),(184,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Basel-Stadt',NULL,3,63),(185,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Cordoba',NULL,1,64),(186,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Cordoba',NULL,2,64),(187,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Cordoba',NULL,3,64),(188,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Tarragona',NULL,1,65),(189,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Tarragona',NULL,2,65),(190,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Tarragona',NULL,3,65),(191,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Valladolid',NULL,1,66),(192,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Valladolid',NULL,2,66),(193,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Valladolid',NULL,3,66),(194,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'St. Gallen',NULL,1,67),(195,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'St. Gallen',NULL,2,67),(196,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'St. Gallen',NULL,3,67),(197,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Schaffhausen',NULL,1,68),(198,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Schaffhausen',NULL,2,68),(199,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Schaffhausen',NULL,3,68),(200,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Western Australia',NULL,1,69),(201,'2020-10-06 10:41:11','2020-10-06 10:41:11',NULL,NULL,'Australie-Occidentale',NULL,2,69),(202,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Western Australia',NULL,3,69),(203,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Saskatchewan',NULL,1,70),(204,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Saskatchewan',NULL,2,70),(205,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Saskatchewan',NULL,3,70),(206,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Niedersachsen',NULL,1,71),(207,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Niedersachsen',NULL,2,71),(208,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Niedersachsen',NULL,3,71),(209,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Solothurn',NULL,1,72),(210,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Solothurn',NULL,2,72),(211,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Solothurn',NULL,3,72),(212,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'California',NULL,1,73),(213,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Californie',NULL,2,73),(214,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'California',NULL,3,73),(215,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Northern Territory',NULL,1,74),(216,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Territoire du Nord',NULL,2,74),(217,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Northern Territory',NULL,3,74),(218,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Steiermark',NULL,1,75),(219,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Steiermark',NULL,2,75),(220,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Steiermark',NULL,3,75),(221,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Katen',NULL,1,76),(222,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Karten',NULL,2,76),(223,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Katen',NULL,3,76),(224,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Jaen',NULL,1,77),(225,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Jaen',NULL,2,77),(226,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Jaen',NULL,3,77),(227,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Asuncion',NULL,1,78),(228,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Asunción',NULL,3,78),(229,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Ciudad Real',NULL,1,79),(230,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Ciudad Real',NULL,2,79),(231,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Ciudad Real',NULL,3,79),(232,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Schwyz',NULL,1,80),(233,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Schwyz',NULL,2,80),(234,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Schwyz',NULL,3,80),(235,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Alava',NULL,1,81),(236,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Alava',NULL,2,81),(237,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Alava',NULL,3,81),(238,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Kansas',NULL,1,82),(239,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Kansas',NULL,2,82),(240,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Kansas',NULL,3,82),(241,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Colorado',NULL,1,83),(242,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Colorado',NULL,2,83),(243,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Colorado',NULL,3,83),(244,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Kentucky',NULL,1,84),(245,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Kentucky',NULL,2,84),(246,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Kentucky',NULL,3,84),(247,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Berlin',NULL,1,85),(248,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Berlin',NULL,2,85),(249,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Berlin',NULL,3,85),(250,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Connecticut',NULL,1,86),(251,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Connecticut',NULL,2,86),(252,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Connecticut',NULL,3,86),(253,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Australian Capital Territory',NULL,1,87),(254,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Territoire de la capitale australienne',NULL,2,87),(255,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Australian Capital Territory',NULL,3,87),(256,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Thurgau',NULL,1,88),(257,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Thurgau',NULL,2,88),(258,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Thurgau',NULL,3,88),(259,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Louisiana',NULL,1,89),(260,'2020-10-06 10:41:12','2020-10-06 10:41:12',NULL,NULL,'Louisiane',NULL,2,89),(261,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Louisiana',NULL,3,89),(262,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Hamburg',NULL,1,90),(263,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Hamburg',NULL,2,90),(264,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Hamburg',NULL,3,90),(265,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Tessin',NULL,1,91),(266,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Tessin',NULL,2,91),(267,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Tessin',NULL,3,91),(268,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Lugo',NULL,1,92),(269,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Lugo',NULL,2,92),(270,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Lugo',NULL,3,92),(271,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Neuenburg',NULL,1,93),(272,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Neuenburg',NULL,2,93),(273,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Neuenburg',NULL,3,93),(274,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Tennessee',NULL,1,94),(275,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Tennessee',NULL,2,94),(276,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Tennessee',NULL,3,94),(277,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Toledo',NULL,1,95),(278,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Toledo',NULL,2,95),(279,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Toledo',NULL,3,95),(280,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'District of Columbia',NULL,1,96),(281,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'District de Columbia',NULL,2,96),(282,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'District of Columbia',NULL,3,96),(283,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Palencia',NULL,1,97),(284,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Palencia',NULL,2,97),(285,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Palencia',NULL,3,97),(286,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Delaware',NULL,1,98),(287,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Delaware',NULL,2,98),(288,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Delaware',NULL,3,98),(289,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Texas',NULL,1,99),(290,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Texas',NULL,2,99),(291,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Texas',NULL,3,99),(292,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Tasmania',NULL,1,100),(293,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Tasmanie',NULL,2,100),(294,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Tasmania',NULL,3,100),(295,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Queensland',NULL,1,101),(296,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Queensland',NULL,2,101),(297,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Queensland',NULL,3,101),(298,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Luzern',NULL,1,102),(299,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Luzern',NULL,2,102),(300,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Luzern',NULL,3,102),(301,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Burgos',NULL,1,103),(302,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Burgos',NULL,2,103),(303,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Burgos',NULL,3,103),(304,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Cadiz',NULL,1,104),(305,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Cadiz',NULL,2,104),(306,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Cadiz',NULL,3,104),(307,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Santa Cruz de Tenerife',NULL,1,105),(308,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Santa Cruz de Tenerife',NULL,2,105),(309,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Santa Cruz de Tenerife',NULL,3,105),(310,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Massachusetts',NULL,1,106),(311,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Massachusetts',NULL,2,106),(312,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Massachusetts',NULL,3,106),(313,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Manitoba',NULL,1,107),(314,'2020-10-06 10:41:13','2020-10-06 10:41:13',NULL,NULL,'Manitoba',NULL,2,107),(315,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Manitoba',NULL,3,107),(316,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Maryland',NULL,1,108),(317,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Maryland',NULL,2,108),(318,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Maryland',NULL,3,108),(319,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Girona',NULL,1,109),(320,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Girona',NULL,2,109),(321,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Girona',NULL,3,109),(322,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Maine',NULL,1,110),(323,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Maine',NULL,2,110),(324,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Maine',NULL,3,110),(325,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Alicante',NULL,1,111),(326,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Alicante',NULL,2,111),(327,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Alicante',NULL,3,111),(328,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Guadalajara',NULL,1,112),(329,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Guadalajara',NULL,2,112),(330,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Guadalajara',NULL,3,112),(331,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Cantabria',NULL,1,113),(332,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Cantabria',NULL,2,113),(333,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Cantabria',NULL,3,113),(334,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Marshall Islands',NULL,1,114),(335,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Marshall Islands',NULL,2,114),(336,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Marshall Islands',NULL,3,114),(337,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Michigan',NULL,1,115),(338,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Michigan',NULL,2,115),(339,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Michigan',NULL,3,115),(340,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Uri',NULL,1,116),(341,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Uri',NULL,2,116),(342,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Uri',NULL,3,116),(343,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Utah',NULL,1,117),(344,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Utah',NULL,2,117),(345,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Utah',NULL,3,117),(346,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Minnesota',NULL,1,118),(347,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Minnesota',NULL,2,118),(348,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Minnesota',NULL,3,118),(349,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Missouri',NULL,1,119),(350,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Missouri',NULL,2,119),(351,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Missouri',NULL,3,119),(352,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Northern Mariana Islands',NULL,1,120),(353,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Northern Mariana Islands',NULL,2,120),(354,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Northern Mariana Islands',NULL,3,120),(355,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Barcelona',NULL,1,121),(356,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Barcelona',NULL,2,121),(357,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Barcelona',NULL,3,121),(358,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Mississippi',NULL,1,122),(359,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Mississippi',NULL,2,122),(360,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Mississippi',NULL,3,122),(361,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Montana',NULL,1,123),(362,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Montana',NULL,2,123),(363,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Montana',NULL,3,123),(364,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Badajoz',NULL,1,124),(365,'2020-10-06 10:41:14','2020-10-06 10:41:14',NULL,NULL,'Badajoz',NULL,2,124),(366,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Badajoz',NULL,3,124),(367,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Mecklenburg-Vorpommern',NULL,1,125),(368,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Mecklenburg-Vorpommern',NULL,2,125),(369,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Mecklenburg-Vorpommern',NULL,3,125),(370,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Virginia',NULL,1,126),(371,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Virginie',NULL,2,126),(372,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Virginia',NULL,3,126),(373,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Voralberg',NULL,1,127),(374,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Voralberg',NULL,2,127),(375,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Voralberg',NULL,3,127),(376,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Cuenca',NULL,1,128),(377,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Cuenca',NULL,2,128),(378,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Cuenca',NULL,3,128),(379,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Wien',NULL,1,129),(380,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Wien',NULL,2,129),(381,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Wien',NULL,3,129),(382,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Waadt',NULL,1,130),(383,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Waadt',NULL,2,130),(384,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Waadt',NULL,3,130),(385,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Sevilla',NULL,1,131),(386,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Sevilla',NULL,2,131),(387,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Sevilla',NULL,3,131),(388,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Virgin Islands',NULL,1,132),(389,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Virgin Islands',NULL,2,132),(390,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Virgin Islands',NULL,3,132),(391,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Zaragoza',NULL,1,133),(392,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Zaragoza',NULL,2,133),(393,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Zaragoza',NULL,3,133),(394,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'New Brunswick',NULL,1,134),(395,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Nouveau Brunswick',NULL,2,134),(396,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'New Brunswick',NULL,3,134),(397,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Sachsen-Anhalt',NULL,1,135),(398,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Sachsen-Anhalt',NULL,2,135),(399,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Sachsen-Anhalt',NULL,3,135),(400,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'North Carolina',NULL,1,136),(401,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Caroline du Nord',NULL,2,136),(402,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'North Carolina',NULL,3,136),(403,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'North Dakota',NULL,1,137),(404,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Dakota du Nord',NULL,2,137),(405,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'North Dakota',NULL,3,137),(406,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Nebraska',NULL,1,138),(407,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Nebraska',NULL,2,138),(408,'2020-10-06 10:41:15','2020-10-06 10:41:15',NULL,NULL,'Nebraska',NULL,3,138),(409,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Newfoundland - Labrador',NULL,1,139),(410,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Terre-Neuve - Labrador',NULL,2,139),(411,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Newfoundland - Labrador',NULL,3,139),(412,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'New Hampshire',NULL,1,140),(413,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Nouveau Hampshire',NULL,2,140),(414,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'New Hampshire',NULL,3,140),(415,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'New Jersey',NULL,1,141),(416,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'New Jersey',NULL,2,141),(417,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'New Jersey',NULL,3,141),(418,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Wallis',NULL,1,142),(419,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Wallis',NULL,2,142),(420,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Wallis',NULL,3,142),(421,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Vermont',NULL,1,143),(422,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Vermont',NULL,2,143),(423,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Vermont',NULL,3,143),(424,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'New Mexico',NULL,1,144),(425,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Nouveau Mexique',NULL,2,144),(426,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'New Mexico',NULL,3,144),(427,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Niederosterreich',NULL,1,145),(428,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Niederosterreich',NULL,2,145),(429,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Niederosterreich',NULL,3,145),(430,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Sachsen',NULL,1,146),(431,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Sachsen',NULL,2,146),(432,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Sachsen',NULL,3,146),(433,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Nova Scotia',NULL,1,147),(434,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Nouvelle Écosse',NULL,2,147),(435,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Nova Scotia',NULL,3,147),(436,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Saarland',NULL,1,148),(437,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Saarland',NULL,2,148),(438,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Saarland',NULL,3,148),(439,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Florida',NULL,1,149),(440,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Floride',NULL,2,149),(441,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Florida',NULL,3,149),(442,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Northwest Territories',NULL,1,150),(443,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Territores du Nord-Ouest',NULL,2,150),(444,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Northwest Territories',NULL,3,150),(445,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Federated States Of Micronesia',NULL,1,151),(446,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Federated States Of Micronesia',NULL,2,151),(447,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Federated States Of Micronesia',NULL,3,151),(448,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Nunavut',NULL,1,152),(449,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Nunavut',NULL,2,152),(450,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Nunavut',NULL,3,152),(451,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Nevada',NULL,1,153),(452,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Nevada',NULL,2,153),(453,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Nevada',NULL,3,153),(454,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Nidwalden',NULL,1,154),(455,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Nidwalden',NULL,2,154),(456,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Nidwalden',NULL,3,154),(457,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Washington',NULL,1,155),(458,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Washington',NULL,2,155),(459,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'Washington',NULL,3,155),(460,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'New York',NULL,1,156),(461,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'New York',NULL,2,156),(462,'2020-10-06 10:41:16','2020-10-06 10:41:16',NULL,NULL,'New York',NULL,3,156),(463,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Granada',NULL,1,157),(464,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Granada',NULL,2,157),(465,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Granada',NULL,3,157),(466,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Soria',NULL,1,158),(467,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Soria',NULL,2,158),(468,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Soria',NULL,3,158),(469,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Freiburg',NULL,1,159),(470,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Freiburg',NULL,2,159),(471,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Freiburg',NULL,3,159),(472,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Rheinland-Pfalz',NULL,1,160),(473,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Rheinland-Pfalz',NULL,2,160),(474,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Rheinland-Pfalz',NULL,3,160),(475,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Ourense',NULL,1,161),(476,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Ourense',NULL,2,161),(477,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Ourense',NULL,3,161),(478,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Wisconsin',NULL,1,162),(479,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Wisconsin',NULL,2,162),(480,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Wisconsin',NULL,3,162),(481,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Ohio',NULL,1,163),(482,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Ohio',NULL,2,163),(483,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Ohio',NULL,3,163),(484,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Georgia',NULL,1,164),(485,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Georgie',NULL,2,164),(486,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Georgia',NULL,3,164),(487,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Murcia',NULL,1,165),(488,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Murcia',NULL,2,165),(489,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Murcia',NULL,3,165),(490,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Oklahoma',NULL,1,166),(491,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Oklahoma',NULL,2,166),(492,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Oklahoma',NULL,3,166),(493,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Genf',NULL,1,167),(494,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Genf',NULL,2,167),(495,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Genf',NULL,3,167),(496,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'West Virginia',NULL,1,168),(497,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'West Virginia',NULL,2,168),(498,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'West Virginia',NULL,3,168),(499,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Ontario',NULL,1,169),(500,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Ontario',NULL,2,169),(501,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Ontario',NULL,3,169),(502,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Oberosterreich',NULL,1,170),(503,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Oberosterreich',NULL,2,170),(504,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Oberosterreich',NULL,3,170),(505,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Wyoming',NULL,1,171),(506,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Wyoming',NULL,2,171),(507,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Wyoming',NULL,3,171),(508,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Burgenland',NULL,1,172),(509,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Burgenland',NULL,2,172),(510,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Burgenland',NULL,3,172),(511,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Avila',NULL,1,173),(512,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Avila',NULL,2,173),(513,'2020-10-06 10:41:17','2020-10-06 10:41:17',NULL,NULL,'Avila',NULL,3,173),(514,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Oregon',NULL,1,174),(515,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Oregon',NULL,2,174),(516,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Oregon',NULL,3,174),(517,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Salamanca',NULL,1,175),(518,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Salamanca',NULL,2,175),(519,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Salamanca',NULL,3,175),(520,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Glarus',NULL,1,176),(521,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Glarus',NULL,2,176),(522,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Glarus',NULL,3,176),(523,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Baleares',NULL,1,177),(524,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Baleares',NULL,2,177),(525,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Baleares',NULL,3,177),(526,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Obwalden',NULL,1,178),(527,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Obwalden',NULL,2,178),(528,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Obwalden',NULL,3,178),(529,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Graubnden',NULL,1,179),(530,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Graubnden',NULL,2,179),(531,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Graubnden',NULL,3,179),(532,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Guam',NULL,1,180),(533,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Guam',NULL,2,180),(534,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Guam',NULL,3,180),(535,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Pennsylvania',NULL,1,181),(536,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Pennsylvanie',NULL,2,181),(537,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Pennsylvania',NULL,3,181),(538,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Victoria',NULL,1,182),(539,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Victoria',NULL,2,182),(540,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Victoria',NULL,3,182),(541,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Bremen',NULL,1,183),(542,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Bremen',NULL,2,183),(543,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Bremen',NULL,3,183),(544,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Prince Edward Island',NULL,1,184),(545,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Île-du-Prince-Édouard',NULL,2,184),(546,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Prince Edward Island',NULL,3,184),(547,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Brandenburg',NULL,1,185),(548,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Brandenburg',NULL,2,185),(549,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Brandenburg',NULL,3,185),(550,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Hessen',NULL,1,186),(551,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Hessen',NULL,2,186),(552,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Hessen',NULL,3,186),(553,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Almeria',NULL,1,187),(554,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Almeria',NULL,2,187),(555,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Almeria',NULL,3,187),(556,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Baden-Wrttemberg',NULL,1,188),(557,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Baden-Wrttemberg',NULL,2,188),(558,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Baden-Wrttemberg',NULL,3,188),(559,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Bayern',NULL,1,189),(560,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Bayern',NULL,2,189),(561,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Bayern',NULL,3,189),(562,'2020-10-06 10:41:18','2020-10-06 10:41:18',NULL,NULL,'Navarra',NULL,1,190),(563,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Navarra',NULL,2,190),(564,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Navarra',NULL,3,190),(565,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Valencia',NULL,1,191),(566,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Valencia',NULL,2,191),(567,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Valencia',NULL,3,191),(568,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Schleswig-Holstein',NULL,1,192),(569,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Schleswig-Holstein',NULL,2,192),(570,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Schleswig-Holstein',NULL,3,192),(571,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Andhra Pradesh',NULL,1,193),(572,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Andhra Pradesh',NULL,2,193),(573,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Andhra Pradesh',NULL,3,193),(574,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Arunachal Pradesh',NULL,1,194),(575,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Arunachal Pradesh',NULL,2,194),(576,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Arunachal Pradesh',NULL,3,194),(577,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Assam',NULL,1,195),(578,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Assam',NULL,2,195),(579,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Assam',NULL,3,195),(580,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Bihar',NULL,1,196),(581,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Bihar',NULL,2,196),(582,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Bihar',NULL,3,196),(583,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Chhattisgarh',NULL,1,197),(584,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Chhattisgarh',NULL,2,197),(585,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Chhattisgarh',NULL,3,197),(586,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Goa',NULL,1,198),(587,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Goa',NULL,2,198),(588,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Goa',NULL,3,198),(589,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Gujarat',NULL,1,199),(590,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Gujarat',NULL,2,199),(591,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Gujarat',NULL,3,199),(592,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Haryana',NULL,1,200),(593,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Haryana',NULL,2,200),(594,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Haryana',NULL,3,200),(595,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Himachal Pradesh',NULL,1,201),(596,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Himachal Pradesh',NULL,2,201),(597,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Himachal Pradesh',NULL,3,201),(598,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Jharkhand',NULL,1,202),(599,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Jharkhand',NULL,2,202),(600,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Jharkhand',NULL,3,202),(601,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Karnataka',NULL,1,203),(602,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Karnataka',NULL,2,203),(603,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Karnataka',NULL,3,203),(604,'2020-10-06 10:41:19','2020-10-06 10:41:19',NULL,NULL,'Kerala',NULL,1,204),(605,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Kerala',NULL,2,204),(606,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Kerala',NULL,3,204),(607,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Madhya Pradesh',NULL,1,205),(608,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Madhya Pradesh',NULL,2,205),(609,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Madhya Pradesh',NULL,3,205),(610,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Maharashtra',NULL,1,206),(611,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Maharashtra',NULL,2,206),(612,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Maharashtra',NULL,3,206),(613,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Manipur',NULL,1,207),(614,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Manipur',NULL,2,207),(615,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Manipur',NULL,3,207),(616,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Meghalaya',NULL,1,208),(617,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Meghalaya',NULL,2,208),(618,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Meghalaya',NULL,3,208),(619,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Mizoram',NULL,1,209),(620,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Mizoram',NULL,2,209),(621,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Mizoram',NULL,3,209),(622,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Nagaland',NULL,1,210),(623,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Nagaland',NULL,2,210),(624,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Nagaland',NULL,3,210),(625,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Odisha',NULL,1,211),(626,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Odisha',NULL,2,211),(627,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Odisha',NULL,3,211),(628,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Punjab',NULL,1,212),(629,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Punjab',NULL,2,212),(630,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Punjab',NULL,3,212),(631,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Rajasthan',NULL,1,213),(632,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Rajasthan',NULL,2,213),(633,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Rajasthan',NULL,3,213),(634,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Sikkim',NULL,1,214),(635,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Sikkim',NULL,2,214),(636,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Sikkim',NULL,3,214),(637,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Tamil Nadu',NULL,1,215),(638,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Tamil Nadu',NULL,2,215),(639,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Tamil Nadu',NULL,3,215),(640,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Telangana',NULL,1,216),(641,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Telangana',NULL,2,216),(642,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Telangana',NULL,3,216),(643,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Tripura',NULL,1,217),(644,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Tripura',NULL,2,217),(645,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Tripura',NULL,3,217),(646,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Uttarakhand',NULL,1,218),(647,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Uttarakhand',NULL,2,218),(648,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'Uttarakhand',NULL,3,218),(649,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'West Bengal',NULL,1,219),(650,'2020-10-06 10:41:20','2020-10-06 10:41:20',NULL,NULL,'West Bengal',NULL,2,219),(651,'2020-10-06 10:41:21','2020-10-06 10:41:21',NULL,NULL,'West Bengal',NULL,3,219);
/*!40000 ALTER TABLE `zone_description` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-10 17:36:43
