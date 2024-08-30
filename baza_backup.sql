-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mi_baza
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `autori`
--

DROP TABLE IF EXISTS `autori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autori` (
  `aut_id` int NOT NULL AUTO_INCREMENT,
  `aut_naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`aut_id`),
  UNIQUE KEY `aut_id_UNIQUE` (`aut_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autori`
--

LOCK TABLES `autori` WRITE;
/*!40000 ALTER TABLE `autori` DISABLE KEYS */;
INSERT INTO `autori` VALUES (1,'Mesa Selimovic'),(2,'Desanka Maksimovic'),(3,'Petar Petrovic NJegod'),(4,'Ivo Andric'),(5,'Buba Miranovic');
/*!40000 ALTER TABLE `autori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autori_knjige`
--

DROP TABLE IF EXISTS `autori_knjige`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autori_knjige` (
  `aut_id` int NOT NULL,
  `knj_id` int NOT NULL,
  PRIMARY KEY (`aut_id`,`knj_id`),
  KEY `aut_id_idx` (`aut_id`),
  KEY `knj_id_idx` (`knj_id`),
  CONSTRAINT `aut_id` FOREIGN KEY (`aut_id`) REFERENCES `autori` (`aut_id`),
  CONSTRAINT `knj_id` FOREIGN KEY (`knj_id`) REFERENCES `knjige` (`knj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autori_knjige`
--

LOCK TABLES `autori_knjige` WRITE;
/*!40000 ALTER TABLE `autori_knjige` DISABLE KEYS */;
INSERT INTO `autori_knjige` VALUES (1,1),(1,3),(2,2),(2,5),(3,2);
/*!40000 ALTER TABLE `autori_knjige` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dani`
--

DROP TABLE IF EXISTS `dani`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dani` (
  `dan_id` int NOT NULL AUTO_INCREMENT,
  `dan_naziv` varchar(255) NOT NULL,
  PRIMARY KEY (`dan_id`),
  UNIQUE KEY `dan_id_UNIQUE` (`dan_id`),
  UNIQUE KEY `dan_naziv_UNIQUE` (`dan_naziv`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dani`
--

LOCK TABLES `dani` WRITE;
/*!40000 ALTER TABLE `dani` DISABLE KEYS */;
INSERT INTO `dani` VALUES (4,'četvrtak'),(5,'petak'),(1,'ponedeljak'),(3,'sreda'),(2,'utorak');
/*!40000 ALTER TABLE `dani` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kabineti`
--

DROP TABLE IF EXISTS `kabineti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kabineti` (
  `kab_id` int NOT NULL AUTO_INCREMENT,
  `kab_broj` varchar(45) NOT NULL,
  `kab_sprat` varchar(45) NOT NULL,
  PRIMARY KEY (`kab_id`),
  UNIQUE KEY `kab_id_UNIQUE` (`kab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kabineti`
--

LOCK TABLES `kabineti` WRITE;
/*!40000 ALTER TABLE `kabineti` DISABLE KEYS */;
INSERT INTO `kabineti` VALUES (16,'201','drugi'),(17,'202','drugi'),(18,'203','drugi'),(19,'204','drugi'),(20,'210','drugi'),(21,'211','drugi'),(22,'212','drugi'),(23,'213','drugi'),(24,'214','drugi'),(25,'203','drugi'),(26,'221','drugi'),(27,'tehnicko','prizemlje'),(28,'informatika','prizemlje'),(29,'muzičko','prizemlje'),(30,'110','prvi'),(31,'111','prvi'),(32,'112','prvi'),(33,'113','prvi'),(34,'fizičko','prizemlje'),(35,'gradjansko 111/112','prvi'),(36,'verska 111/112','prvi'),(37,'kompas','prvi');
/*!40000 ALTER TABLE `kabineti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kabinpredmet`
--

DROP TABLE IF EXISTS `kabinpredmet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kabinpredmet` (
  `kab_id` int NOT NULL,
  `prd_id` int NOT NULL,
  `fk_kabin` int DEFAULT NULL,
  `fk_predmet` int DEFAULT NULL,
  `pro_id` int NOT NULL,
  PRIMARY KEY (`kab_id`,`prd_id`,`pro_id`),
  KEY `fk_kabin_idx` (`fk_kabin`),
  KEY `fk_predmet_idx` (`fk_predmet`),
  CONSTRAINT `fk_kabin` FOREIGN KEY (`fk_kabin`) REFERENCES `kabineti` (`kab_id`),
  CONSTRAINT `fk_predmet` FOREIGN KEY (`fk_predmet`) REFERENCES `predmeti` (`prd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kabinpredmet`
--

LOCK TABLES `kabinpredmet` WRITE;
/*!40000 ALTER TABLE `kabinpredmet` DISABLE KEYS */;
INSERT INTO `kabinpredmet` VALUES (16,11,NULL,NULL,19),(16,11,NULL,NULL,20),(17,2,NULL,NULL,6),(18,2,NULL,NULL,5),(19,13,NULL,NULL,23),(19,13,NULL,NULL,24),(20,1,NULL,NULL,1),(20,1,NULL,NULL,2),(21,10,NULL,NULL,17),(22,1,NULL,NULL,3),(22,1,NULL,NULL,4),(23,12,NULL,NULL,21),(23,12,NULL,NULL,22),(24,6,NULL,NULL,12),(25,16,NULL,NULL,29),(25,16,NULL,NULL,30),(26,7,NULL,NULL,13),(27,2,NULL,NULL,9),(27,3,NULL,NULL,8),(28,4,NULL,NULL,10),(29,5,NULL,NULL,11),(30,14,NULL,NULL,27),(31,13,NULL,NULL,23),(31,13,NULL,NULL,24),(32,9,NULL,NULL,24),(32,9,NULL,NULL,28),(32,9,NULL,NULL,33),(32,9,NULL,NULL,34),(32,15,NULL,NULL,28),(33,2,NULL,NULL,7),(34,8,NULL,NULL,14),(34,8,NULL,NULL,15),(35,9,NULL,NULL,24),(35,9,NULL,NULL,28),(35,9,NULL,NULL,33),(35,9,NULL,NULL,34),(36,17,NULL,NULL,31),(37,25,NULL,NULL,35);
/*!40000 ALTER TABLE `kabinpredmet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kabinprof`
--

DROP TABLE IF EXISTS `kabinprof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kabinprof` (
  `kab_id` int NOT NULL,
  `pro_id` int NOT NULL,
  `fk_kabp` int DEFAULT NULL,
  `fk_proff` int DEFAULT NULL,
  `ode_id` int NOT NULL,
  PRIMARY KEY (`kab_id`,`pro_id`,`ode_id`),
  KEY `fk_kabp_idx` (`fk_kabp`),
  KEY `fk_prof_idx` (`fk_proff`),
  CONSTRAINT `fk_kabp` FOREIGN KEY (`fk_kabp`) REFERENCES `kabineti` (`kab_id`),
  CONSTRAINT `fk_proff` FOREIGN KEY (`fk_proff`) REFERENCES `profesori` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kabinprof`
--

LOCK TABLES `kabinprof` WRITE;
/*!40000 ALTER TABLE `kabinprof` DISABLE KEYS */;
INSERT INTO `kabinprof` VALUES (16,19,NULL,NULL,3),(16,19,NULL,NULL,4),(16,19,NULL,NULL,5),(16,19,NULL,NULL,6),(16,19,NULL,NULL,7),(16,19,NULL,NULL,8),(16,19,NULL,NULL,13),(16,19,NULL,NULL,14),(16,19,NULL,NULL,15),(16,19,NULL,NULL,16),(16,20,NULL,NULL,1),(16,20,NULL,NULL,2),(16,20,NULL,NULL,9),(16,20,NULL,NULL,10),(16,20,NULL,NULL,11),(16,20,NULL,NULL,12),(17,6,NULL,NULL,11),(17,6,NULL,NULL,13),(17,6,NULL,NULL,14),(17,6,NULL,NULL,15),(17,6,NULL,NULL,16),(18,5,NULL,NULL,1),(18,5,NULL,NULL,2),(18,5,NULL,NULL,5),(18,5,NULL,NULL,6),(18,5,NULL,NULL,7),(19,23,NULL,NULL,2),(19,23,NULL,NULL,3),(19,23,NULL,NULL,6),(19,23,NULL,NULL,7),(19,23,NULL,NULL,8),(19,23,NULL,NULL,9),(19,23,NULL,NULL,10),(19,23,NULL,NULL,11),(19,23,NULL,NULL,12),(19,24,NULL,NULL,1),(19,24,NULL,NULL,4),(19,24,NULL,NULL,5),(19,24,NULL,NULL,13),(19,24,NULL,NULL,14),(19,24,NULL,NULL,15),(19,24,NULL,NULL,16),(20,1,NULL,NULL,5),(20,1,NULL,NULL,9),(20,1,NULL,NULL,10),(20,1,NULL,NULL,16),(20,2,NULL,NULL,1),(20,2,NULL,NULL,3),(20,2,NULL,NULL,12),(20,2,NULL,NULL,15),(21,17,NULL,NULL,1),(21,17,NULL,NULL,2),(21,17,NULL,NULL,3),(21,17,NULL,NULL,4),(21,17,NULL,NULL,5),(21,17,NULL,NULL,6),(21,17,NULL,NULL,7),(21,17,NULL,NULL,8),(21,17,NULL,NULL,13),(21,17,NULL,NULL,14),(21,17,NULL,NULL,15),(21,17,NULL,NULL,16),(21,18,NULL,NULL,9),(21,18,NULL,NULL,10),(21,18,NULL,NULL,11),(21,18,NULL,NULL,12),(22,3,NULL,NULL,2),(22,3,NULL,NULL,4),(22,3,NULL,NULL,6),(22,3,NULL,NULL,7),(22,4,NULL,NULL,8),(22,4,NULL,NULL,11),(22,4,NULL,NULL,13),(22,4,NULL,NULL,14),(23,21,NULL,NULL,1),(23,21,NULL,NULL,2),(23,21,NULL,NULL,3),(23,21,NULL,NULL,4),(23,21,NULL,NULL,5),(23,21,NULL,NULL,6),(23,21,NULL,NULL,7),(23,21,NULL,NULL,8),(23,21,NULL,NULL,9),(23,21,NULL,NULL,10),(23,21,NULL,NULL,11),(23,21,NULL,NULL,12),(23,22,NULL,NULL,13),(23,22,NULL,NULL,14),(23,22,NULL,NULL,15),(23,22,NULL,NULL,16),(24,12,NULL,NULL,5),(24,12,NULL,NULL,6),(24,12,NULL,NULL,7),(24,12,NULL,NULL,8),(24,12,NULL,NULL,9),(24,12,NULL,NULL,10),(24,12,NULL,NULL,11),(24,12,NULL,NULL,12),(24,12,NULL,NULL,13),(24,12,NULL,NULL,14),(24,12,NULL,NULL,15),(24,12,NULL,NULL,16),(25,29,NULL,NULL,5),(25,29,NULL,NULL,8),(25,29,NULL,NULL,9),(25,29,NULL,NULL,10),(25,29,NULL,NULL,11),(25,29,NULL,NULL,12),(25,29,NULL,NULL,13),(25,29,NULL,NULL,14),(25,29,NULL,NULL,15),(25,29,NULL,NULL,16),(25,30,NULL,NULL,1),(25,30,NULL,NULL,2),(25,30,NULL,NULL,3),(25,30,NULL,NULL,4),(25,30,NULL,NULL,6),(25,30,NULL,NULL,7),(26,13,NULL,NULL,9),(26,13,NULL,NULL,10),(26,13,NULL,NULL,11),(26,13,NULL,NULL,12),(26,13,NULL,NULL,13),(26,13,NULL,NULL,14),(26,13,NULL,NULL,15),(26,13,NULL,NULL,16),(27,8,NULL,NULL,1),(27,8,NULL,NULL,2),(27,8,NULL,NULL,9),(27,8,NULL,NULL,10),(27,8,NULL,NULL,11),(27,8,NULL,NULL,12),(27,8,NULL,NULL,13),(27,8,NULL,NULL,14),(27,8,NULL,NULL,15),(27,8,NULL,NULL,16),(27,9,NULL,NULL,3),(27,9,NULL,NULL,4),(27,9,NULL,NULL,5),(27,9,NULL,NULL,6),(27,9,NULL,NULL,7),(27,9,NULL,NULL,8),(28,10,NULL,NULL,1),(28,10,NULL,NULL,2),(28,10,NULL,NULL,3),(28,10,NULL,NULL,4),(28,10,NULL,NULL,5),(28,10,NULL,NULL,6),(28,10,NULL,NULL,7),(28,10,NULL,NULL,8),(28,10,NULL,NULL,9),(28,10,NULL,NULL,10),(28,10,NULL,NULL,11),(28,10,NULL,NULL,12),(28,10,NULL,NULL,13),(28,10,NULL,NULL,14),(28,10,NULL,NULL,15),(28,10,NULL,NULL,16),(29,11,NULL,NULL,1),(29,11,NULL,NULL,2),(29,11,NULL,NULL,3),(29,11,NULL,NULL,4),(29,11,NULL,NULL,5),(29,11,NULL,NULL,6),(29,11,NULL,NULL,7),(29,11,NULL,NULL,8),(29,11,NULL,NULL,9),(29,11,NULL,NULL,10),(29,11,NULL,NULL,11),(29,11,NULL,NULL,12),(29,11,NULL,NULL,13),(29,11,NULL,NULL,14),(29,11,NULL,NULL,15),(29,11,NULL,NULL,16),(30,27,NULL,NULL,1),(30,27,NULL,NULL,2),(30,27,NULL,NULL,3),(30,27,NULL,NULL,4),(30,27,NULL,NULL,5),(30,27,NULL,NULL,6),(30,27,NULL,NULL,7),(30,27,NULL,NULL,8),(30,27,NULL,NULL,9),(30,27,NULL,NULL,10),(30,27,NULL,NULL,11),(30,27,NULL,NULL,12),(30,27,NULL,NULL,13),(30,27,NULL,NULL,14),(30,27,NULL,NULL,15),(30,27,NULL,NULL,16),(31,31,NULL,NULL,9),(31,35,NULL,NULL,1),(31,35,NULL,NULL,2),(31,35,NULL,NULL,4),(32,28,NULL,NULL,1),(32,28,NULL,NULL,2),(32,28,NULL,NULL,3),(32,28,NULL,NULL,4),(32,28,NULL,NULL,5),(32,28,NULL,NULL,6),(32,28,NULL,NULL,7),(32,28,NULL,NULL,8),(32,28,NULL,NULL,9),(32,28,NULL,NULL,10),(32,28,NULL,NULL,11),(32,28,NULL,NULL,12),(32,28,NULL,NULL,13),(32,28,NULL,NULL,14),(32,28,NULL,NULL,15),(32,28,NULL,NULL,16),(32,33,NULL,NULL,13),(32,33,NULL,NULL,14),(32,33,NULL,NULL,15),(32,33,NULL,NULL,16),(32,34,NULL,NULL,5),(32,34,NULL,NULL,6),(32,34,NULL,NULL,7),(32,34,NULL,NULL,8),(32,34,NULL,NULL,9),(32,34,NULL,NULL,10),(32,34,NULL,NULL,11),(32,34,NULL,NULL,12),(33,7,NULL,NULL,3),(33,7,NULL,NULL,4),(33,7,NULL,NULL,8),(33,7,NULL,NULL,9),(33,7,NULL,NULL,10),(33,7,NULL,NULL,12),(34,14,NULL,NULL,1),(34,14,NULL,NULL,4),(34,14,NULL,NULL,5),(34,14,NULL,NULL,8),(34,14,NULL,NULL,9),(34,14,NULL,NULL,11),(34,14,NULL,NULL,13),(34,14,NULL,NULL,16),(34,15,NULL,NULL,2),(34,15,NULL,NULL,3),(34,15,NULL,NULL,6),(34,15,NULL,NULL,7),(34,15,NULL,NULL,10),(34,15,NULL,NULL,12),(34,15,NULL,NULL,14),(34,15,NULL,NULL,15),(35,24,NULL,NULL,1),(35,24,NULL,NULL,4),(35,28,NULL,NULL,2),(35,28,NULL,NULL,3),(35,33,NULL,NULL,13),(35,33,NULL,NULL,14),(35,33,NULL,NULL,15),(35,33,NULL,NULL,16),(35,34,NULL,NULL,5),(35,34,NULL,NULL,6),(35,34,NULL,NULL,7),(35,34,NULL,NULL,8),(35,34,NULL,NULL,9),(35,34,NULL,NULL,10),(35,34,NULL,NULL,11),(35,34,NULL,NULL,12),(36,31,NULL,NULL,1),(36,31,NULL,NULL,2),(36,31,NULL,NULL,3),(36,31,NULL,NULL,4),(36,31,NULL,NULL,5),(36,31,NULL,NULL,6),(36,31,NULL,NULL,7),(36,31,NULL,NULL,8),(36,31,NULL,NULL,10),(36,31,NULL,NULL,11),(36,31,NULL,NULL,12),(36,31,NULL,NULL,13),(36,31,NULL,NULL,14),(36,31,NULL,NULL,15),(36,31,NULL,NULL,16),(37,35,NULL,NULL,1),(37,35,NULL,NULL,2),(37,35,NULL,NULL,4);
/*!40000 ALTER TABLE `kabinprof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knjige`
--

DROP TABLE IF EXISTS `knjige`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knjige` (
  `knj_id` int NOT NULL AUTO_INCREMENT,
  `knj_naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`knj_id`),
  UNIQUE KEY `knj_id_UNIQUE` (`knj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knjige`
--

LOCK TABLES `knjige` WRITE;
/*!40000 ALTER TABLE `knjige` DISABLE KEYS */;
INSERT INTO `knjige` VALUES (1,'Dervic i smrt'),(2,'Prokleta Avlija'),(3,'Gorski Vijenac'),(4,'Ana Karenjina'),(5,'Kleo se');
/*!40000 ALTER TABLE `knjige` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odeljenje`
--

DROP TABLE IF EXISTS `odeljenje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odeljenje` (
  `ode_id` int NOT NULL AUTO_INCREMENT,
  `ode_naziv` varchar(45) NOT NULL,
  `ode_razred` varchar(45) NOT NULL,
  PRIMARY KEY (`ode_id`),
  UNIQUE KEY `ode_id_UNIQUE` (`ode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odeljenje`
--

LOCK TABLES `odeljenje` WRITE;
/*!40000 ALTER TABLE `odeljenje` DISABLE KEYS */;
INSERT INTO `odeljenje` VALUES (1,'5/1','peti'),(2,'5/2','peti'),(3,'5/3','peti'),(4,'5/4','peti'),(5,'6/1','šesti'),(6,'6/2','šesti'),(7,'6/3','šesti'),(8,'6/4','šesti'),(9,'7/1','sedmi'),(10,'7/2','sedmi'),(11,'7/3','sedmi'),(12,'7/4','sedmi'),(13,'8/1','osmi'),(14,'8/2','osmi'),(15,'8/3','osmi'),(16,'8/4','osmi');
/*!40000 ALTER TABLE `odeljenje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predmeti`
--

DROP TABLE IF EXISTS `predmeti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predmeti` (
  `prd_id` int NOT NULL AUTO_INCREMENT,
  `prd_naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`prd_id`),
  UNIQUE KEY `prd_id_UNIQUE` (`prd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predmeti`
--

LOCK TABLES `predmeti` WRITE;
/*!40000 ALTER TABLE `predmeti` DISABLE KEYS */;
INSERT INTO `predmeti` VALUES (1,'srpski'),(2,'matematika'),(3,'tehničko'),(4,'informatika'),(5,'muzičko'),(6,'fizika'),(7,'hemija'),(8,'fizičko'),(10,'geografija'),(11,'biologija'),(12,'istorija'),(13,'engleski'),(14,'ruski'),(15,'francuski'),(16,'likovno');
/*!40000 ALTER TABLE `predmeti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predmode`
--

DROP TABLE IF EXISTS `predmode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predmode` (
  `prd_id` int NOT NULL,
  `brcas` int NOT NULL,
  `razred` varchar(45) NOT NULL,
  `ode_id` int NOT NULL,
  `fk_odd` int DEFAULT NULL,
  `fk_prdd` int DEFAULT NULL,
  `pro_id` int NOT NULL,
  `dan_id` int NOT NULL,
  PRIMARY KEY (`prd_id`,`ode_id`,`pro_id`,`dan_id`),
  KEY `fk_odd_idx` (`fk_odd`),
  KEY `fk_prdd_idx` (`fk_prdd`),
  CONSTRAINT `fk_odd` FOREIGN KEY (`fk_odd`) REFERENCES `odeljenje` (`ode_id`),
  CONSTRAINT `fk_prdd` FOREIGN KEY (`fk_prdd`) REFERENCES `predmeti` (`prd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predmode`
--

LOCK TABLES `predmode` WRITE;
/*!40000 ALTER TABLE `predmode` DISABLE KEYS */;
INSERT INTO `predmode` VALUES (1,5,'peti',1,NULL,NULL,2,0),(1,5,'peti',2,NULL,NULL,3,0),(1,5,'peti',3,NULL,NULL,2,0),(1,5,'peti',4,NULL,NULL,3,0),(1,4,'šest',5,NULL,NULL,1,0),(1,4,'šest',6,NULL,NULL,3,0),(1,4,'šest',7,NULL,NULL,3,0),(1,4,'šest',8,NULL,NULL,4,0),(1,4,'sedam',9,NULL,NULL,1,0),(1,4,'sedam',10,NULL,NULL,1,0),(1,4,'sedam',11,NULL,NULL,4,0),(1,4,'sedam',12,NULL,NULL,2,0),(1,4,'osam',13,NULL,NULL,4,0),(1,4,'osam',14,NULL,NULL,4,0),(1,4,'osam',15,NULL,NULL,2,0),(1,4,'osam',16,NULL,NULL,1,0),(2,4,'peti',1,NULL,NULL,5,0),(2,4,'peti',2,NULL,NULL,5,0),(2,4,'peti',3,NULL,NULL,7,0),(2,4,'peti',4,NULL,NULL,7,0),(2,4,'šest',5,NULL,NULL,5,0),(2,4,'šest',6,NULL,NULL,5,0),(2,4,'šest',7,NULL,NULL,5,0),(2,4,'šest',8,NULL,NULL,7,0),(2,4,'sedam',9,NULL,NULL,7,0),(2,4,'sedam',10,NULL,NULL,7,0),(2,4,'sedam',11,NULL,NULL,6,0),(2,4,'sedam',12,NULL,NULL,7,0),(2,4,'osam',13,NULL,NULL,6,0),(2,4,'osam',14,NULL,NULL,6,0),(2,4,'osam',15,NULL,NULL,6,0),(2,4,'osam',16,NULL,NULL,6,0),(3,2,'peti',1,NULL,NULL,8,0),(3,2,'pet',2,NULL,NULL,8,0),(3,2,'pet',3,NULL,NULL,9,0),(3,2,'pet',4,NULL,NULL,9,0),(3,2,'šest',5,NULL,NULL,9,0),(3,2,'šest',6,NULL,NULL,9,0),(3,2,'šest',7,NULL,NULL,9,0),(3,2,'šest',8,NULL,NULL,9,0),(3,2,'sedam',9,NULL,NULL,8,0),(3,2,'sedam',10,NULL,NULL,8,0),(3,2,'sedam',11,NULL,NULL,8,0),(3,2,'sedam',12,NULL,NULL,8,0),(3,2,'osam',13,NULL,NULL,8,0),(3,2,'osam',14,NULL,NULL,8,0),(3,2,'osam',15,NULL,NULL,8,0),(3,2,'osam',16,NULL,NULL,8,0),(4,1,'peti',1,NULL,NULL,10,0),(4,1,'pet',2,NULL,NULL,10,0),(4,1,'pet',3,NULL,NULL,10,0),(4,1,'pet',4,NULL,NULL,10,0),(4,1,'šest',5,NULL,NULL,10,0),(4,1,'šest',6,NULL,NULL,10,0),(4,1,'šest',7,NULL,NULL,10,0),(4,1,'šest',8,NULL,NULL,10,0),(4,1,'sedam',9,NULL,NULL,10,0),(4,1,'sedam',10,NULL,NULL,10,0),(4,1,'sedam',11,NULL,NULL,10,0),(4,1,'sedam',12,NULL,NULL,10,0),(4,1,'osam',13,NULL,NULL,10,0),(4,1,'osam',14,NULL,NULL,10,0),(4,1,'osam',15,NULL,NULL,10,0),(4,1,'osam',16,NULL,NULL,10,0),(5,2,'peti',1,NULL,NULL,11,0),(5,2,'pet',2,NULL,NULL,11,0),(5,2,'pet',3,NULL,NULL,11,0),(5,2,'pet',4,NULL,NULL,11,0),(5,1,'šest',5,NULL,NULL,11,0),(5,1,'šest',6,NULL,NULL,11,0),(5,1,'šest',7,NULL,NULL,11,0),(5,1,'šest',8,NULL,NULL,11,0),(5,1,'sedam',9,NULL,NULL,11,0),(5,1,'sedam',10,NULL,NULL,11,0),(5,1,'sedam',11,NULL,NULL,11,0),(5,1,'sedam',12,NULL,NULL,11,0),(5,1,'osam',13,NULL,NULL,11,0),(5,1,'osam',14,NULL,NULL,11,0),(5,1,'psam',15,NULL,NULL,11,0),(5,1,'osam',16,NULL,NULL,11,0),(6,2,'šest',5,NULL,NULL,12,0),(6,2,'šest',6,NULL,NULL,12,0),(6,2,'šest',7,NULL,NULL,12,0),(6,2,'šest',8,NULL,NULL,12,0),(6,2,'sedam',9,NULL,NULL,12,0),(6,2,'sedam',10,NULL,NULL,12,0),(6,2,'sedam',11,NULL,NULL,12,0),(6,2,'sedam',12,NULL,NULL,12,0),(6,2,'osam',13,NULL,NULL,12,0),(6,2,'osam',14,NULL,NULL,12,0),(6,2,'osam',15,NULL,NULL,12,0),(6,2,'osam',16,NULL,NULL,12,0),(7,2,'sedam',9,NULL,NULL,13,0),(7,2,'sedam',10,NULL,NULL,13,0),(7,2,'sedam',11,NULL,NULL,13,0),(7,2,'sedam',12,NULL,NULL,13,0),(7,2,'osam',13,NULL,NULL,13,0),(7,2,'osam',14,NULL,NULL,13,0),(7,2,'osam',15,NULL,NULL,13,0),(7,2,'osam',16,NULL,NULL,13,0),(8,3,'peti',1,NULL,NULL,14,0),(8,3,'pet',2,NULL,NULL,15,0),(8,3,'pet',3,NULL,NULL,15,0),(8,3,'pet',4,NULL,NULL,14,0),(8,3,'šest',5,NULL,NULL,14,0),(8,3,'šest',6,NULL,NULL,15,0),(8,3,'šest',7,NULL,NULL,15,0),(8,3,'šest',8,NULL,NULL,14,0),(8,3,'sedam',9,NULL,NULL,14,0),(8,3,'sedam',10,NULL,NULL,15,0),(8,3,'sedam',11,NULL,NULL,14,0),(8,3,'sedam',12,NULL,NULL,15,0),(8,3,'osam',13,NULL,NULL,14,0),(8,3,'osam',14,NULL,NULL,15,0),(8,3,'osam',15,NULL,NULL,15,0),(8,3,'osam',16,NULL,NULL,14,0),(10,1,'peti',1,NULL,NULL,17,0),(10,1,'pet',2,NULL,NULL,17,0),(10,1,'pet',3,NULL,NULL,17,0),(10,1,'pet',4,NULL,NULL,17,0),(10,2,'šest',5,NULL,NULL,17,0),(10,2,'šest',6,NULL,NULL,17,0),(10,2,'šest',7,NULL,NULL,17,0),(10,2,'šest',8,NULL,NULL,17,0),(10,2,'sedam',9,NULL,NULL,18,0),(10,2,'sedam',10,NULL,NULL,18,0),(10,2,'sedam',11,NULL,NULL,18,0),(10,2,'sedam',12,NULL,NULL,18,0),(10,2,'osam',13,NULL,NULL,17,0),(10,2,'osam',14,NULL,NULL,17,0),(10,2,'osam',15,NULL,NULL,17,0),(10,2,'osam',16,NULL,NULL,17,0),(11,2,'peti',1,NULL,NULL,20,0),(11,2,'pet',2,NULL,NULL,20,0),(11,2,'pet',3,NULL,NULL,19,0),(11,2,'pet',4,NULL,NULL,19,0),(11,2,'šest',5,NULL,NULL,19,0),(11,2,'šest',6,NULL,NULL,19,0),(11,2,'šest',7,NULL,NULL,19,0),(11,2,'šest',8,NULL,NULL,19,0),(11,2,'sedam',9,NULL,NULL,20,0),(11,2,'sedam',10,NULL,NULL,20,0),(11,2,'sedam',11,NULL,NULL,20,0),(11,2,'sedam',12,NULL,NULL,20,0),(11,2,'osam',13,NULL,NULL,19,0),(11,2,'osam',14,NULL,NULL,19,0),(11,2,'osam',15,NULL,NULL,19,0),(11,2,'osam',16,NULL,NULL,19,0),(12,1,'peti',1,NULL,NULL,21,0),(12,1,'pet',2,NULL,NULL,21,0),(12,1,'pet',3,NULL,NULL,21,0),(12,1,'pet',4,NULL,NULL,21,0),(12,2,'šest',5,NULL,NULL,21,0),(12,2,'šest',6,NULL,NULL,21,0),(12,2,'šest',7,NULL,NULL,21,0),(12,2,'šest',8,NULL,NULL,21,0),(12,2,'sedam',9,NULL,NULL,21,0),(12,2,'sedam',10,NULL,NULL,21,0),(12,2,'sedam',11,NULL,NULL,21,0),(12,2,'sedam',12,NULL,NULL,21,0),(12,2,'osam',13,NULL,NULL,22,0),(12,2,'osam',14,NULL,NULL,22,0),(12,2,'osam',15,NULL,NULL,22,0),(12,2,'osam',16,NULL,NULL,22,0),(13,2,'peti',1,NULL,NULL,24,0),(13,2,'pet',2,NULL,NULL,23,0),(13,2,'pet',3,NULL,NULL,23,0),(13,2,'pet',4,NULL,NULL,24,0),(13,2,'šest',5,NULL,NULL,24,0),(13,2,'šest',6,NULL,NULL,23,0),(13,2,'šest',7,NULL,NULL,23,0),(13,2,'šest',8,NULL,NULL,23,0),(13,2,'sedam',9,NULL,NULL,23,0),(13,2,'sedam',10,NULL,NULL,23,0),(13,2,'sedam',11,NULL,NULL,23,0),(13,2,'sedam',12,NULL,NULL,23,0),(13,2,'osam',13,NULL,NULL,24,0),(13,2,'osam',14,NULL,NULL,24,0),(13,2,'osam',15,NULL,NULL,24,0),(13,2,'osam',16,NULL,NULL,24,0),(14,2,'peti',1,NULL,NULL,27,0),(14,2,'pet',2,NULL,NULL,27,0),(14,2,'pet',3,NULL,NULL,27,0),(14,2,'pet',4,NULL,NULL,27,0),(14,2,'šest',5,NULL,NULL,27,0),(14,2,'šest',6,NULL,NULL,27,0),(14,2,'šest',7,NULL,NULL,27,0),(14,2,'šest',8,NULL,NULL,27,0),(14,2,'sedam',9,NULL,NULL,27,0),(14,2,'sedam',10,NULL,NULL,27,0),(14,2,'sedam',11,NULL,NULL,27,0),(14,2,'sedam',12,NULL,NULL,27,0),(14,2,'osam',13,NULL,NULL,27,0),(14,2,'osam',14,NULL,NULL,27,0),(14,2,'osam',15,NULL,NULL,27,0),(14,2,'osam ',16,NULL,NULL,27,0),(15,2,'peti',1,NULL,NULL,28,0),(15,2,'pet',2,NULL,NULL,28,0),(15,2,'pet',3,NULL,NULL,28,0),(15,2,'pet',4,NULL,NULL,28,0),(15,2,'šest',5,NULL,NULL,28,0),(15,2,'šest',6,NULL,NULL,28,0),(15,2,'šest',7,NULL,NULL,28,0),(15,2,'šest',8,NULL,NULL,28,0),(15,2,'sedam',9,NULL,NULL,28,0),(15,2,'sedam',10,NULL,NULL,28,0),(15,2,'sedam',11,NULL,NULL,28,0),(15,2,'sedam',12,NULL,NULL,28,0),(15,2,'osam',13,NULL,NULL,28,0),(15,2,'osam',14,NULL,NULL,28,0),(15,2,'osam',15,NULL,NULL,28,0),(15,2,'osam',16,NULL,NULL,28,0);
/*!40000 ALTER TABLE `predmode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profdan`
--

DROP TABLE IF EXISTS `profdan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profdan` (
  `pro_id` int NOT NULL,
  `dan_id` int NOT NULL,
  `broj_casova` int NOT NULL,
  PRIMARY KEY (`pro_id`,`dan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profdan`
--

LOCK TABLES `profdan` WRITE;
/*!40000 ALTER TABLE `profdan` DISABLE KEYS */;
INSERT INTO `profdan` VALUES (1,1,8),(1,2,8),(1,3,8),(1,4,8),(1,5,8),(2,1,8),(2,2,8),(2,3,8),(2,4,8),(2,5,8),(3,1,8),(3,2,8),(3,3,8),(3,4,8),(3,5,8),(4,1,8),(4,2,8),(4,3,8),(4,4,8),(4,5,8),(5,1,8),(5,2,8),(5,3,8),(5,4,8),(5,5,8),(6,1,8),(6,2,8),(6,3,8),(6,4,8),(6,5,8),(7,1,8),(7,2,8),(7,3,8),(7,4,8),(7,5,8),(8,1,8),(8,2,8),(8,3,8),(8,4,8),(8,5,8),(9,1,8),(9,2,8),(9,3,8),(9,4,8),(9,5,8),(10,1,8),(10,2,8),(10,3,8),(10,4,8),(11,1,8),(11,2,8),(11,3,8),(11,4,8),(11,5,8),(12,1,8),(12,2,8),(12,3,8),(12,4,8),(12,5,8),(13,1,8),(13,2,8),(13,3,8),(13,4,8),(13,5,8),(14,1,8),(14,2,8),(14,3,8),(14,4,8),(14,5,8),(15,1,8),(15,2,8),(15,3,8),(15,4,8),(15,5,8),(17,1,8),(17,2,8),(17,3,8),(17,4,8),(17,5,8),(18,2,8),(18,4,8),(19,1,8),(19,2,8),(19,3,8),(19,4,8),(19,5,8),(20,1,8),(20,3,8),(20,5,8),(21,1,8),(21,2,8),(21,3,8),(21,4,8),(21,5,8),(22,1,8),(22,3,8),(23,1,8),(23,2,8),(23,3,8),(23,4,0),(23,5,8),(24,1,8),(24,2,8),(24,3,8),(24,4,8),(24,5,8),(27,1,8),(27,3,8),(27,4,8),(27,5,8),(28,1,8),(28,2,8),(28,3,8),(28,4,8),(28,5,8),(29,1,8),(29,2,8),(29,3,8),(29,4,8),(29,5,8),(30,1,8),(30,2,8),(30,3,8),(30,4,8);
/*!40000 ALTER TABLE `profdan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesori`
--

DROP TABLE IF EXISTS `profesori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesori` (
  `pro_id` int NOT NULL AUTO_INCREMENT,
  `pro_ime` varchar(45) NOT NULL,
  PRIMARY KEY (`pro_id`),
  UNIQUE KEY `pro_id_UNIQUE` (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesori`
--

LOCK TABLES `profesori` WRITE;
/*!40000 ALTER TABLE `profesori` DISABLE KEYS */;
INSERT INTO `profesori` VALUES (1,'Tatjana Hadžić'),(2,'Slavica Brkić Milovanović'),(3,'Marija Stamenković'),(4,'Jovana Repić'),(5,'Svetlana Janković'),(6,'Snežana Bogićević'),(7,'Mina Teoharević'),(8,'Aleksandar Bogićević'),(9,'Žarko Gojković'),(10,'Nevena Čvorović'),(11,'Jelena Oparušić'),(12,'Jovana Živanović'),(13,'Milica Čalija'),(14,'David'),(15,'Darko'),(17,'Sanja Arsenijević'),(18,'Jelena Živković'),(19,'Sabrina Kuraica'),(20,'Ivana Stanković'),(21,'Vesna Kostić'),(22,'Ivan Drljača'),(23,'Olivera Nedeljković'),(24,'Milica Matić'),(27,'Nataša Trišić'),(28,'Snežana Budimčić'),(29,'Nina Manić Jovanović'),(30,'Jelena Munđa Ivanković');
/*!40000 ALTER TABLE `profesori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profodel`
--

DROP TABLE IF EXISTS `profodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profodel` (
  `pro_id` int NOT NULL,
  `odel_id` int NOT NULL,
  `fk_prof` int DEFAULT NULL,
  `fk_odel` int DEFAULT NULL,
  PRIMARY KEY (`pro_id`,`odel_id`),
  KEY `fk_prof_idx` (`fk_prof`),
  KEY `fk_odel_idx` (`fk_odel`),
  CONSTRAINT `fk_odel` FOREIGN KEY (`fk_odel`) REFERENCES `odeljenje` (`ode_id`),
  CONSTRAINT `fk_prof` FOREIGN KEY (`fk_prof`) REFERENCES `profesori` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profodel`
--

LOCK TABLES `profodel` WRITE;
/*!40000 ALTER TABLE `profodel` DISABLE KEYS */;
INSERT INTO `profodel` VALUES (1,5,NULL,NULL),(1,9,NULL,NULL),(1,10,NULL,NULL),(1,16,NULL,NULL),(2,1,NULL,NULL),(2,3,NULL,NULL),(2,12,NULL,NULL),(2,15,NULL,NULL),(3,2,NULL,NULL),(3,4,NULL,NULL),(3,6,NULL,NULL),(3,7,NULL,NULL),(4,8,NULL,NULL),(4,11,NULL,NULL),(4,13,NULL,NULL),(4,14,NULL,NULL),(5,1,NULL,NULL),(5,2,NULL,NULL),(5,5,NULL,NULL),(5,6,NULL,NULL),(5,7,NULL,NULL),(6,11,NULL,NULL),(6,13,NULL,NULL),(6,14,NULL,NULL),(6,15,NULL,NULL),(6,16,NULL,NULL),(7,3,NULL,NULL),(7,4,NULL,NULL),(7,8,NULL,NULL),(7,9,NULL,NULL),(7,10,NULL,NULL),(7,12,NULL,NULL),(8,1,NULL,NULL),(8,2,NULL,NULL),(8,9,NULL,NULL),(8,10,NULL,NULL),(8,11,NULL,NULL),(8,12,NULL,NULL),(8,13,NULL,NULL),(8,14,NULL,NULL),(8,15,NULL,NULL),(8,16,NULL,NULL),(9,3,NULL,NULL),(9,4,NULL,NULL),(9,5,NULL,NULL),(9,6,NULL,NULL),(9,7,NULL,NULL),(9,8,NULL,NULL),(10,1,NULL,NULL),(10,2,NULL,NULL),(10,3,NULL,NULL),(10,4,NULL,NULL),(10,5,NULL,NULL),(10,6,NULL,NULL),(10,7,NULL,NULL),(10,8,NULL,NULL),(10,9,NULL,NULL),(10,10,NULL,NULL),(10,11,NULL,NULL),(10,12,NULL,NULL),(10,13,NULL,NULL),(10,14,NULL,NULL),(10,15,NULL,NULL),(10,16,NULL,NULL),(11,1,NULL,NULL),(11,2,NULL,NULL),(11,3,NULL,NULL),(11,4,NULL,NULL),(11,5,NULL,NULL),(11,6,NULL,NULL),(11,7,NULL,NULL),(11,8,NULL,NULL),(11,9,NULL,NULL),(11,10,NULL,NULL),(11,11,NULL,NULL),(11,12,NULL,NULL),(11,13,NULL,NULL),(11,14,NULL,NULL),(11,15,NULL,NULL),(11,16,NULL,NULL),(12,5,NULL,NULL),(12,6,NULL,NULL),(12,7,NULL,NULL),(12,8,NULL,NULL),(12,9,NULL,NULL),(12,10,NULL,NULL),(12,11,NULL,NULL),(12,12,NULL,NULL),(12,13,NULL,NULL),(12,14,NULL,NULL),(12,15,NULL,NULL),(12,16,NULL,NULL),(13,9,NULL,NULL),(13,10,NULL,NULL),(13,11,NULL,NULL),(13,12,NULL,NULL),(13,13,NULL,NULL),(13,14,NULL,NULL),(13,15,NULL,NULL),(13,16,NULL,NULL),(14,1,NULL,NULL),(14,4,NULL,NULL),(14,5,NULL,NULL),(14,8,NULL,NULL),(14,9,NULL,NULL),(14,11,NULL,NULL),(14,13,NULL,NULL),(14,16,NULL,NULL),(15,2,NULL,NULL),(15,3,NULL,NULL),(15,6,NULL,NULL),(15,7,NULL,NULL),(15,10,NULL,NULL),(15,12,NULL,NULL),(15,14,NULL,NULL),(15,15,NULL,NULL),(16,1,NULL,NULL),(16,2,NULL,NULL),(16,3,NULL,NULL),(16,4,NULL,NULL),(17,1,NULL,NULL),(17,2,NULL,NULL),(17,3,NULL,NULL),(17,4,NULL,NULL),(17,5,NULL,NULL),(17,6,NULL,NULL),(17,7,NULL,NULL),(17,8,NULL,NULL),(17,13,NULL,NULL),(17,14,NULL,NULL),(17,15,NULL,NULL),(17,16,NULL,NULL),(18,9,NULL,NULL),(18,10,NULL,NULL),(18,11,NULL,NULL),(18,12,NULL,NULL),(19,3,NULL,NULL),(19,4,NULL,NULL),(19,5,NULL,NULL),(19,6,NULL,NULL),(19,7,NULL,NULL),(19,8,NULL,NULL),(19,13,NULL,NULL),(19,14,NULL,NULL),(19,15,NULL,NULL),(19,16,NULL,NULL),(20,1,NULL,NULL),(20,2,NULL,NULL),(20,9,NULL,NULL),(20,10,NULL,NULL),(20,11,NULL,NULL),(20,12,NULL,NULL),(21,1,NULL,NULL),(21,2,NULL,NULL),(21,3,NULL,NULL),(21,4,NULL,NULL),(21,5,NULL,NULL),(21,6,NULL,NULL),(21,7,NULL,NULL),(21,8,NULL,NULL),(21,9,NULL,NULL),(21,10,NULL,NULL),(21,11,NULL,NULL),(21,12,NULL,NULL),(22,13,NULL,NULL),(22,14,NULL,NULL),(22,15,NULL,NULL),(22,16,NULL,NULL),(23,2,NULL,NULL),(23,3,NULL,NULL),(23,6,NULL,NULL),(23,7,NULL,NULL),(23,8,NULL,NULL),(23,9,NULL,NULL),(23,10,NULL,NULL),(23,11,NULL,NULL),(23,12,NULL,NULL),(24,1,NULL,NULL),(24,4,NULL,NULL),(24,5,NULL,NULL),(24,13,NULL,NULL),(24,14,NULL,NULL),(24,15,NULL,NULL),(24,16,NULL,NULL),(27,1,NULL,NULL),(27,2,NULL,NULL),(27,3,NULL,NULL),(27,4,NULL,NULL),(27,5,NULL,NULL),(27,6,NULL,NULL),(27,7,NULL,NULL),(27,8,NULL,NULL),(27,9,NULL,NULL),(27,10,NULL,NULL),(27,11,NULL,NULL),(27,12,NULL,NULL),(27,13,NULL,NULL),(27,14,NULL,NULL),(27,15,NULL,NULL),(27,16,NULL,NULL),(28,1,NULL,NULL),(28,2,NULL,NULL),(28,3,NULL,NULL),(28,4,NULL,NULL),(28,5,NULL,NULL),(28,6,NULL,NULL),(28,7,NULL,NULL),(28,8,NULL,NULL),(28,9,NULL,NULL),(28,10,NULL,NULL),(28,11,NULL,NULL),(28,12,NULL,NULL),(28,13,NULL,NULL),(28,14,NULL,NULL),(28,15,NULL,NULL),(28,16,NULL,NULL),(29,5,NULL,NULL),(29,8,NULL,NULL),(29,9,NULL,NULL),(29,10,NULL,NULL),(29,11,NULL,NULL),(29,12,NULL,NULL),(29,13,NULL,NULL),(29,14,NULL,NULL),(29,15,NULL,NULL),(29,16,NULL,NULL),(30,1,NULL,NULL),(30,2,NULL,NULL),(30,3,NULL,NULL),(30,4,NULL,NULL),(30,6,NULL,NULL),(30,7,NULL,NULL);
/*!40000 ALTER TABLE `profodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racuni`
--

DROP TABLE IF EXISTS `racuni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `racuni` (
  `rac_id` int NOT NULL AUTO_INCREMENT,
  `rac_datum_izd` datetime DEFAULT CURRENT_TIMESTAMP,
  `kor_id` int DEFAULT NULL,
  PRIMARY KEY (`rac_id`),
  UNIQUE KEY `rac_id_UNIQUE` (`rac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racuni`
--

LOCK TABLES `racuni` WRITE;
/*!40000 ALTER TABLE `racuni` DISABLE KEYS */;
INSERT INTO `racuni` VALUES (1,'2023-05-17 00:00:00',NULL);
/*!40000 ALTER TABLE `racuni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raspored`
--

DROP TABLE IF EXISTS `raspored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raspored` (
  `ras_id` int NOT NULL AUTO_INCREMENT,
  `fkprd_id` int DEFAULT NULL,
  `fkpro_id` int DEFAULT NULL,
  `fkkab_id` int DEFAULT NULL,
  `fkode_id` int DEFAULT NULL,
  `ras_br` int NOT NULL,
  PRIMARY KEY (`ras_id`),
  UNIQUE KEY `ras_id_UNIQUE` (`ras_id`),
  KEY `fk_kabid_idx` (`fkkab_id`),
  KEY `fk_proid_idx` (`fkpro_id`),
  KEY `fk_prdid_idx` (`fkprd_id`),
  KEY `fk_ode_id_idx` (`fkode_id`),
  CONSTRAINT `fk_kabid` FOREIGN KEY (`fkkab_id`) REFERENCES `kabineti` (`kab_id`),
  CONSTRAINT `fk_ode_id` FOREIGN KEY (`fkode_id`) REFERENCES `odeljenje` (`ode_id`),
  CONSTRAINT `fk_prdid` FOREIGN KEY (`fkprd_id`) REFERENCES `predmeti` (`prd_id`),
  CONSTRAINT `fk_proid` FOREIGN KEY (`fkpro_id`) REFERENCES `profesori` (`pro_id`),
  CONSTRAINT `fk_raspored_kabinet` FOREIGN KEY (`fkkab_id`) REFERENCES `kabineti` (`kab_id`),
  CONSTRAINT `fk_raspored_odeljenje` FOREIGN KEY (`fkode_id`) REFERENCES `odeljenje` (`ode_id`),
  CONSTRAINT `fk_raspored_predmet` FOREIGN KEY (`fkprd_id`) REFERENCES `predmeti` (`prd_id`),
  CONSTRAINT `fk_raspored_profesor` FOREIGN KEY (`fkpro_id`) REFERENCES `profesori` (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22411 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raspored`
--

LOCK TABLES `raspored` WRITE;
/*!40000 ALTER TABLE `raspored` DISABLE KEYS */;
/*!40000 ALTER TABLE `raspored` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slobodakt`
--

DROP TABLE IF EXISTS `slobodakt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slobodakt` (
  `slob_id` int NOT NULL AUTO_INCREMENT,
  `slob_naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`slob_id`),
  UNIQUE KEY `slob_id_UNIQUE` (`slob_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slobodakt`
--

LOCK TABLES `slobodakt` WRITE;
/*!40000 ALTER TABLE `slobodakt` DISABLE KEYS */;
INSERT INTO `slobodakt` VALUES (1,'Građansko vaspitanje'),(2,'Verska nastava'),(3,'Medijska pismenost'),(4,'Čuvari prirode'),(5,'Domaćinstvo'),(6,'Crtanje, slikanje, vajanje'),(7,'Umetnost'),(8,'Moja životna sredina'),(9,'Preduzetništvo'),(10,'Vrline i vrednosti kao životni kompas');
/*!40000 ALTER TABLE `slobodakt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slobodne_nastavne_aktivnosti`
--

DROP TABLE IF EXISTS `slobodne_nastavne_aktivnosti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slobodne_nastavne_aktivnosti` (
  `aktivnost_id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(255) NOT NULL,
  `opis` text,
  `vreme` datetime DEFAULT NULL,
  PRIMARY KEY (`aktivnost_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slobodne_nastavne_aktivnosti`
--

LOCK TABLES `slobodne_nastavne_aktivnosti` WRITE;
/*!40000 ALTER TABLE `slobodne_nastavne_aktivnosti` DISABLE KEYS */;
/*!40000 ALTER TABLE `slobodne_nastavne_aktivnosti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sloboprof`
--

DROP TABLE IF EXISTS `sloboprof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sloboprof` (
  `slob_id` int NOT NULL,
  `pro_id` int NOT NULL,
  `fk_slobo` int DEFAULT NULL,
  `fk_profo` int DEFAULT NULL,
  PRIMARY KEY (`slob_id`,`pro_id`),
  KEY `fk_slobo_idx` (`fk_slobo`),
  KEY `fk_profo_idx` (`fk_profo`),
  CONSTRAINT `fk_profo` FOREIGN KEY (`fk_profo`) REFERENCES `profesori` (`pro_id`),
  CONSTRAINT `fk_slobo` FOREIGN KEY (`fk_slobo`) REFERENCES `slobodakt` (`slob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sloboprof`
--

LOCK TABLES `sloboprof` WRITE;
/*!40000 ALTER TABLE `sloboprof` DISABLE KEYS */;
INSERT INTO `sloboprof` VALUES (1,24,NULL,NULL),(1,28,NULL,NULL),(1,33,NULL,NULL),(1,34,NULL,NULL),(2,31,NULL,NULL),(3,24,NULL,NULL),(3,28,NULL,NULL),(3,33,NULL,NULL),(4,13,NULL,NULL),(4,17,NULL,NULL),(4,18,NULL,NULL),(5,19,NULL,NULL),(6,30,NULL,NULL),(7,30,NULL,NULL),(8,20,NULL,NULL),(9,9,NULL,NULL),(9,10,NULL,NULL),(10,35,NULL,NULL);
/*!40000 ALTER TABLE `sloboprof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stavke`
--

DROP TABLE IF EXISTS `stavke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stavke` (
  `stv_id` int NOT NULL AUTO_INCREMENT,
  `rac_id` int DEFAULT NULL,
  `stv_cena` decimal(10,2) DEFAULT NULL,
  `pro_id` int DEFAULT NULL,
  `stv_kolicina` smallint DEFAULT NULL,
  PRIMARY KEY (`stv_id`),
  UNIQUE KEY `stv_id_UNIQUE` (`stv_id`),
  KEY `fk_stavke_racuni_idx` (`rac_id`),
  CONSTRAINT `fk_rac_id` FOREIGN KEY (`rac_id`) REFERENCES `racuni` (`rac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stavke`
--

LOCK TABLES `stavke` WRITE;
/*!40000 ALTER TABLE `stavke` DISABLE KEYS */;
INSERT INTO `stavke` VALUES (1,1,300.00,NULL,2);
/*!40000 ALTER TABLE `stavke` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 20:30:17
