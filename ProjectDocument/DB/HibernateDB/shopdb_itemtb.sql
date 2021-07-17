-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shopdb
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
-- Table structure for table `itemtb`
--

DROP TABLE IF EXISTS `itemtb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemtb` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Brand` varchar(255) DEFAULT NULL,
  `Conditions` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `PostDate` varchar(255) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `electronicsType_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKp3etuxybwpyekbbcrvruhffiu` (`electronicsType_ID`),
  CONSTRAINT `FKp3etuxybwpyekbbcrvruhffiu` FOREIGN KEY (`electronicsType_ID`) REFERENCES `electronicstype` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemtb`
--

LOCK TABLES `itemtb` WRITE;
/*!40000 ALTER TABLE `itemtb` DISABLE KEYS */;
INSERT INTO `itemtb` VALUES (1,'camaro','New','New','a10.jpg','A10','2021/07/17',10000,1,1),(2,'camaro','New','Unlocked','xs.jpg','Xs','2021-07-17',21000,1,1),(3,'camaro','New','New, 64bit, 500GB HDD, 4GB RAM  ','mac.jpg','Mac01','2021-07-14',13500,3,2),(4,'camaro','New','Two Lens','nikon.jpg','D3200','2021-07-16',21000,1,3),(5,'camaro','New','New','canon.jpg','EOS','2021-07-15',23500,3,3),(6,'camaro','New','1TB HDD, 8GB RAM, 64bits','hp.jpg','Envy','2021-07-15',21000,2,2),(7,'camaro','New','42 Inch','lgtv.jpg','LG10','2021-07-15',21000,6,4);
/*!40000 ALTER TABLE `itemtb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-17 17:39:27
