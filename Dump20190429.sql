-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: dreamhomerental
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `branch` (
  `branchNo` varchar(4) NOT NULL,
  `street` varchar(20) NOT NULL,
  `city` varchar(10) NOT NULL,
  `postcode` varchar(8) NOT NULL,
  PRIMARY KEY (`branchNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('B002','56 Clover Dr','London','NW10 6EU'),('B003','163 Main St','Glasgow','G11 9QX'),('B004','32 Manse Rd','Bristol','BS99 1NZ'),('B005','22 Deer Rd','London','SW1 4EH'),('B007','16 Argyll St','Aberdeen','AB2 3SU');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clients` (
  `clientNo` varchar(4) NOT NULL,
  `fName` varchar(10) NOT NULL,
  `lName` varchar(10) NOT NULL,
  `telNo` varchar(13) NOT NULL,
  `preftype` enum('House','Flat') NOT NULL,
  `maxRent` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`clientNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('CR56','Aline','Stewart','0141-848-1825','Flat',350,'astewart@hotmail.com'),('CR62','Mary','Tregear','01224-196720','Flat',600,'maryt@hotmail.co.uk'),('CR74','Mike','Ritchie','01475-392178','House',750,'mritchie01@yahoo.co.uk'),('CR76','John','Kay','0207-774-5632','Flat',425,'john.kay@gmail.com');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privateowner`
--

DROP TABLE IF EXISTS `privateowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `privateowner` (
  `ownerNo` varchar(4) NOT NULL,
  `fName` varchar(10) NOT NULL,
  `lName` varchar(10) NOT NULL,
  `address` varchar(40) NOT NULL,
  `telNo` varchar(13) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`ownerNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privateowner`
--

LOCK TABLES `privateowner` WRITE;
/*!40000 ALTER TABLE `privateowner` DISABLE KEYS */;
INSERT INTO `privateowner` VALUES ('CO40','Tina','Murphy','63 Well St, Glasgow G42','0141-943-1728','tinam@hotmail.com','*******'),('CO46','Joe','Keogh','2 Fergus Dr, Aberdeen AB2 7SX','01224-861212','jkeough@lhh.com','*******'),('CO87','Carol','Farrel','6 Achray St, Glasgow G32 9DX','0141-357-7419','cfarrel@gmail.com','*******'),('CO93','Tony','Shaw','12 Park Pl, Glasgow G4 0QR','0141-225-7025','tony.shaw@ark.com','*******');
/*!40000 ALTER TABLE `privateowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertyforrent`
--

DROP TABLE IF EXISTS `propertyforrent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `propertyforrent` (
  `propertyNo` varchar(4) NOT NULL,
  `street` varchar(20) NOT NULL,
  `city` varchar(10) NOT NULL,
  `postcode` varchar(7) NOT NULL,
  `typeofprop` enum('House','Flat') NOT NULL,
  `rooms` int(11) NOT NULL,
  `rent` int(11) NOT NULL,
  `ownerNo` varchar(4) NOT NULL,
  `staffNo` varchar(4) DEFAULT NULL,
  `branchNo` varchar(4) NOT NULL,
  PRIMARY KEY (`propertyNo`),
  KEY `ownerNo` (`ownerNo`),
  KEY `staffNo` (`staffNo`),
  KEY `branchNo` (`branchNo`),
  CONSTRAINT `propertyforrent_ibfk_1` FOREIGN KEY (`ownerNo`) REFERENCES `privateowner` (`ownerNo`),
  CONSTRAINT `propertyforrent_ibfk_2` FOREIGN KEY (`staffNo`) REFERENCES `staff` (`staffNo`),
  CONSTRAINT `propertyforrent_ibfk_3` FOREIGN KEY (`branchNo`) REFERENCES `branch` (`branchNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertyforrent`
--

LOCK TABLES `propertyforrent` WRITE;
/*!40000 ALTER TABLE `propertyforrent` DISABLE KEYS */;
INSERT INTO `propertyforrent` VALUES ('PA14','16 Holhead','Aberdeen','AB7 5SU','House',6,650,'CO46','SA9','B007'),('PG16','5 Novar Dr','Glasgow','G12 9AX','Flat',4,450,'CO93','SG14','B003'),('PG21','18 Dale Rd','Glasgow','G12','House',5,600,'CO87','SG37','B003'),('PG36','2 Manor Rd','Glasgow','G32 4QX','Flat',3,375,'CO93','SG37','B003'),('PG4','6 Lawrence St','Glasgow','G11 9QX','Flat',3,350,'CO40',NULL,'B003'),('PL94','6 Argyll St','London','NW2','Flat',4,400,'CO87','SL41','B005');
/*!40000 ALTER TABLE `propertyforrent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `registration` (
  `clientNo` varchar(4) NOT NULL,
  `branchNo` varchar(4) NOT NULL,
  `staffNo` varchar(4) NOT NULL,
  `dateJoined` date DEFAULT NULL,
  KEY `clientNo` (`clientNo`),
  KEY `branchNo` (`branchNo`),
  KEY `staffNo` (`staffNo`),
  CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`clientNo`) REFERENCES `clients` (`clientNo`),
  CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`branchNo`) REFERENCES `branch` (`branchNo`),
  CONSTRAINT `registration_ibfk_3` FOREIGN KEY (`staffNo`) REFERENCES `staff` (`staffNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES ('CR76','B005','SL41','2013-01-02'),('CR56','B003','SG37','2012-04-11'),('CR74','B003','SG37','2011-11-16'),('CR62','B007','SA9','2012-03-07');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff` (
  `staffNo` varchar(4) NOT NULL,
  `fName` varchar(10) NOT NULL,
  `lName` varchar(10) NOT NULL,
  `title` varchar(10) NOT NULL,
  `sex` enum('M','F') DEFAULT NULL,
  `DOB` date NOT NULL,
  `salary` int(11) NOT NULL,
  `branchNo` varchar(4) NOT NULL,
  PRIMARY KEY (`staffNo`),
  KEY `branchNo` (`branchNo`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`branchNo`) REFERENCES `branch` (`branchNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('SA9','Mary','Howe','Assistant','F','1970-02-19',9000,'B007'),('SG14','David','Ford','Supervisor','M','1958-03-24',18000,'B003'),('SG37','Ann','Beech','Assistant','F','1960-11-10',12000,'B003'),('SG5','Susan','Brand','Manager','F','1940-06-03',24000,'B003'),('SL21','John','White','Manager','M','1945-10-01',30000,'B005'),('SL41','Julie','Lee','Assistant','F','1965-06-13',9000,'B005');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewing`
--

DROP TABLE IF EXISTS `viewing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `viewing` (
  `clientNo` varchar(4) NOT NULL,
  `propertyNo` varchar(4) NOT NULL,
  `viewDate` date NOT NULL,
  `comments` varchar(20) DEFAULT NULL,
  KEY `clientNo` (`clientNo`),
  KEY `propertyNo` (`propertyNo`),
  CONSTRAINT `viewing_ibfk_1` FOREIGN KEY (`clientNo`) REFERENCES `clients` (`clientNo`),
  CONSTRAINT `viewing_ibfk_2` FOREIGN KEY (`propertyNo`) REFERENCES `propertyforrent` (`propertyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewing`
--

LOCK TABLES `viewing` WRITE;
/*!40000 ALTER TABLE `viewing` DISABLE KEYS */;
INSERT INTO `viewing` VALUES ('CR56','PA14','2013-05-24','too small'),('CR76','PG4','2013-04-20','too remote'),('CR56','PG4','2013-05-26',NULL),('CR62','PA14','2013-05-14','no dining room'),('CR56','PG36','2013-04-28',NULL);
/*!40000 ALTER TABLE `viewing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-29 12:26:37
