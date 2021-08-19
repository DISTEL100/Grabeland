-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: grabelandDev
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bookingDate` datetime NOT NULL DEFAULT current_timestamp(),
  `bookingNumber` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `cancellationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bookings_UN` (`id`,`prename`,`surname`,`bookingDate`,`bookingNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings-tickets`
--

DROP TABLE IF EXISTS `bookings-tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings-tickets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bookingId` bigint(20) NOT NULL,
  `ticketId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bookings_tickets_UN` (`id`,`ticketId`),
  KEY `bookings_tickets_FK` (`ticketId`),
  KEY `bookings_tickets_FK_1` (`bookingId`),
  CONSTRAINT `bookings_tickets_FK` FOREIGN KEY (`ticketId`) REFERENCES `tickets` (`id`),
  CONSTRAINT `bookings_tickets_FK_1` FOREIGN KEY (`bookingId`) REFERENCES `bookings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings-tickets`
--

LOCK TABLES `bookings-tickets` WRITE;
/*!40000 ALTER TABLE `bookings-tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings-tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gardens`
--

DROP TABLE IF EXISTS `gardens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gardens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gardenNumber` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coordinates` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `directions` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gardens_UN` (`name`,`address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gardens`
--

LOCK TABLES `gardens` WRITE;
/*!40000 ALTER TABLE `gardens` DISABLE KEYS */;
INSERT INTO `gardens` VALUES (1,'Lissy\'s und Joni\'s Garten','Stünz-Mölkauer Weg 13, 04318 Leipzig',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `gardens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticketNumber` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT substr(md5(rand()),1,12),
  `timeSlotId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_UN` (`id`,`ticketNumber`),
  KEY `tickets_FK` (`timeSlotId`),
  CONSTRAINT `tickets_FK` FOREIGN KEY (`timeSlotId`) REFERENCES `timeSlots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeSlots`
--

DROP TABLE IF EXISTS `timeSlots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeSlots` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `startTime` datetime NOT NULL,
  `startGardenId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `timeSlots_UN` (`startTime`),
  KEY `timeSlots_FK` (`startGardenId`),
  CONSTRAINT `timeSlots_FK` FOREIGN KEY (`startGardenId`) REFERENCES `gardens` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeSlots`
--

LOCK TABLES `timeSlots` WRITE;
/*!40000 ALTER TABLE `timeSlots` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeSlots` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-19  8:18:57
