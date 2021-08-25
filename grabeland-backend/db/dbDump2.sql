-- MySQL dump 10.19  Distrib 10.3.28-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: handschu
-- ------------------------------------------------------
-- Server version       10.3.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `OpenDays`
--

DROP TABLE IF EXISTS `OpenDays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OpenDays` (
  `Date` date NOT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OpenDays`
--

LOCK TABLES `OpenDays` WRITE;
/*!40000 ALTER TABLE `OpenDays` DISABLE KEYS */;
INSERT INTO `OpenDays` VALUES ('2021-09-16',1),('2021-09-17',2),('2021-09-18',3),('2021-09-24',4),('2021-09-25',5),('2021-09-30',6),('2021-10-01',7),('2021-10-02',8),('2021-10-08',9),('2021-10-09',10);
/*!40000 ALTER TABLE `OpenDays` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TicketID` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Owner` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TicketID` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Owner` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BookingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `EMail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TimeSlot` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Tickets_FK` (`TimeSlot`),
  CONSTRAINT `Tickets_FK` FOREIGN KEY (`TimeSlot`) REFERENCES `TimeSlots` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tickets`
--

LOCK TABLES `Tickets` WRITE;
/*!40000 ALTER TABLE `Tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeSlots`
--

DROP TABLE IF EXISTS `TimeSlots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimeSlots` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `StartTime` time NOT NULL,
  `OpenDay` bigint(20) NOT NULL,
  `FreeTickets` bigint(20) unsigned NOT NULL DEFAULT 10,
  `BookedTickets` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `TimeSlots_FK` (`OpenDay`),
  CONSTRAINT `TimeSlots_FK` FOREIGN KEY (`OpenDay`) REFERENCES `OpenDays` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeSlots`
--

LOCK TABLES `TimeSlots` WRITE;
/*!40000 ALTER TABLE `TimeSlots` DISABLE KEYS */;
INSERT INTO `TimeSlots` VALUES (1,'16:00:00',1,10,0),(2,'16:20:00',1,10,0),(3,'16:40:00',1,10,0),(4,'17:00:00',1,10,0),(5,'17:20:00',1,10,0),(6,'17:40:00',1,10,0),(7,'18:00:00',1,10,0);
/*!40000 ALTER TABLE `TimeSlots` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-24 16:20:21
