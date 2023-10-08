-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: robotwebdb
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `explor_pic`
--

DROP TABLE IF EXISTS `explor_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `explor_pic` (
  `exp_pic_id` int NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`exp_pic_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explor_pic`
--

LOCK TABLES `explor_pic` WRITE;
/*!40000 ALTER TABLE `explor_pic` DISABLE KEYS */;
INSERT INTO `explor_pic` VALUES (1,'upload/Snipaste_2023-04-11_15-56-46.jpg','2023-10-08 00:00:00'),(2,'upload/Snipaste_2023-03-14_09-50-34.jpg','2023-10-08 00:00:00'),(3,'upload/20230303223141tm5l6.png','2023-10-08 05:03:00'),(4,'upload/Snipaste_2023-03-14_09-42-04.jpg','2023-10-08 14:42:03'),(5,'upload/Snipaste_2023-03-09_13-14-55.jpg','2023-10-08 14:42:24'),(6,'upload/Snipaste_2023-03-09_13-14-55.jpg','2023-10-08 14:44:33'),(7,'upload/Snipaste_2023-03-09_13-14-55.jpg','2023-10-08 14:54:41'),(8,'upload/Snipaste_2023-03-15_09-20-56.jpg','2023-10-08 14:55:26'),(9,'upload/Snipaste_2023-10-08_14-56-29.jpg','2023-10-08 14:57:08');
/*!40000 ALTER TABLE `explor_pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explorationrecord`
--

DROP TABLE IF EXISTS `explorationrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `explorationrecord` (
  `recordId` int NOT NULL AUTO_INCREMENT,
  `robotId` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Treasuretype` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Treasure_Count` int DEFAULT NULL,
  `begintime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`recordId`) USING BTREE,
  KEY `robotId_idx` (`robotId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explorationrecord`
--

LOCK TABLES `explorationrecord` WRITE;
/*!40000 ALTER TABLE `explorationrecord` DISABLE KEYS */;
INSERT INTO `explorationrecord` VALUES (1,'2','special',1,'08:00:00','10:00:00','upload/Snipaste2213.jpg'),(2,'1','common',2,'13:20:20','15:40:00','upload/1342662832816.jpg'),(270,'2','common',1,'15:05:30','15:05:43','upload/Snipaste_2023-10-08_14-56-40.jpg'),(271,'2','common',3,'15:10:46','15:12:35','upload/Snipaste_2023-10-08_14-56-11.jpg');
/*!40000 ALTER TABLE `explorationrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robotinfo`
--

DROP TABLE IF EXISTS `robotinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `robotinfo` (
  `robotId` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `robotname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `situation` tinyint DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`robotId`) USING BTREE,
  KEY `userId_idx` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robotinfo`
--

LOCK TABLES `robotinfo` WRITE;
/*!40000 ALTER TABLE `robotinfo` DISABLE KEYS */;
INSERT INTO `robotinfo` VALUES ('1','alex',1,0,NULL),('2','apex',2,0,NULL),('3','罗密尔狗',4,0,'');
/*!40000 ALTER TABLE `robotinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int NOT NULL AUTO_INCREMENT,
  `userpassword` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('李华',1,'12345'),('王文',2,'123'),('imrobot',3,'123456'),('mytest',4,'123456'),('tomcat',6,'1234');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-08 20:11:29
