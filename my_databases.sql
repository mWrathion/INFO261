-- MySQL dump 10.16  Distrib 10.1.36-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Valdivia
-- ------------------------------------------------------
-- Server version	10.1.36-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Valdivia`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Valdivia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `Valdivia`;

--
-- Table structure for table `DESPLAZARSE`
--

DROP TABLE IF EXISTS `DESPLAZARSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DESPLAZARSE` (
  `pk_RUT` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `Latitud` decimal(10,0) NOT NULL,
  `Longitud` decimal(10,0) NOT NULL,
  PRIMARY KEY (`pk_RUT`,`fecha`),
  CONSTRAINT `DESPLAZARSE_ibfk_1` FOREIGN KEY (`pk_RUT`) REFERENCES `PERSONA` (`pk_RUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DESPLAZARSE`
--

LOCK TABLES `DESPLAZARSE` WRITE;
/*!40000 ALTER TABLE `DESPLAZARSE` DISABLE KEYS */;
INSERT INTO `DESPLAZARSE` VALUES ('19111111-2','2018-10-25',10,10),('19111111-3','2018-10-25',10,10),('19111111-4','2018-10-25',10,10),('19111111-5','2018-10-25',10,10),('19111111-6','2018-10-25',10,10);
/*!40000 ALTER TABLE `DESPLAZARSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LUGAR_DE_INTERES`
--

DROP TABLE IF EXISTS `LUGAR_DE_INTERES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LUGAR_DE_INTERES` (
  `pk_Lugar` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Latitud` decimal(10,0) NOT NULL,
  `Longitud` decimal(10,0) NOT NULL,
  PRIMARY KEY (`pk_Lugar`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LUGAR_DE_INTERES`
--

LOCK TABLES `LUGAR_DE_INTERES` WRITE;
/*!40000 ALTER TABLE `LUGAR_DE_INTERES` DISABLE KEYS */;
INSERT INTO `LUGAR_DE_INTERES` VALUES (6,'Descripcion','Categoria',10,10),(7,'Descripcion2','Categoria2',10,10),(8,'Descripcion3','Categoria3',10,10),(9,'Descripcion4','Categoria4',10,10),(10,'Descripcion5','Categoria5',10,10);
/*!40000 ALTER TABLE `LUGAR_DE_INTERES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSONA`
--

DROP TABLE IF EXISTS `PERSONA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSONA` (
  `pk_RUT` varchar(45) NOT NULL,
  `NOMBRE` varchar(45) NOT NULL,
  `EDAD` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`pk_RUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONA`
--

LOCK TABLES `PERSONA` WRITE;
/*!40000 ALTER TABLE `PERSONA` DISABLE KEYS */;
INSERT INTO `PERSONA` VALUES ('19111111-2','Juan',20),('19111111-3','Juan',20),('19111111-4','Juan',20),('19111111-5','Juan',20),('19111111-6','Juan',20);
/*!40000 ALTER TABLE `PERSONA` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-03 15:41:21
