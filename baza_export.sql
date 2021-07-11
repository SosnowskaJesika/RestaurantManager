-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant_manager_db
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id_bill` int NOT NULL AUTO_INCREMENT,
  `items_ids` longtext,
  `cost_pln` float DEFAULT NULL,
  `time_delivery` time DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `currency` varchar(3) DEFAULT 'pln',
  PRIMARY KEY (`id_bill`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (3,'[35,31,40]',NULL,'00:03:14','2021-07-01 20:10:43','pln'),(4,'[35,31,40]',24.97,'00:03:14','2021-07-01 20:15:14','pln'),(5,'[35,36,32]',26.97,'00:03:15','2021-07-01 20:21:33','pln');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id_currency` int NOT NULL AUTO_INCREMENT,
  `bill_id` int DEFAULT NULL,
  `currency_value` float DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id_currency`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,4,5.52434,'eur'),(2,4,6.55381,'usd');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(60) NOT NULL,
  `item_price` float DEFAULT NULL,
  `category` varchar(80) DEFAULT NULL,
  `price_currency` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (31,'cola',5.99,'drink','pln'),(32,'fanta',4.99,'drink','pln'),(33,'pizza',14.99,'food','pln'),(34,'kebab',12.99,'food','pln'),(35,'burger',16.99,'food','pln'),(36,'fries',4.99,'food','pln'),(37,'water',1.99,'drinks','pln'),(38,'pasta',11.99,'food','pln'),(39,'wine',8.99,'drink','pln'),(40,'water',1.99,'drink','pln'),(41,'sprite',4.99,'drink','pln'),(42,'onion rings',3.99,'food','pln');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(45) NOT NULL,
  `item_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `table_nr` int NOT NULL,
  `order_time` datetime NOT NULL,
  `delivered_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `orders_chk_1` CHECK (json_valid(`item_id`))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (5,'undefined','[35,32]',2,'2021-06-24 19:55:49','2021-06-27 20:39:57'),(6,'undefined','[35,31,40]',3,'2021-06-27 20:43:41','2021-06-27 20:46:55'),(7,'delivered','[35,36,32]',4,'2021-07-01 20:18:07','2021-07-01 20:21:22');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-01 21:52:38
