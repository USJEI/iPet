-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ipet_db
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `collar`
--

DROP TABLE IF EXISTS `collar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collar` (
  `idCollar` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  PRIMARY KEY (`idCollar`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collar`
--

LOCK TABLES `collar` WRITE;
/*!40000 ALTER TABLE `collar` DISABLE KEYS */;
INSERT INTO `collar` VALUES (1,142547854125),(5,25415897);
/*!40000 ALTER TABLE `collar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `humano`
--

DROP TABLE IF EXISTS `humano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humano` (
  `idHumano` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` int NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  `idPerro` int NOT NULL,
  PRIMARY KEY (`idHumano`),
  KEY `perro_humano_idx` (`idPerro`),
  CONSTRAINT `perro_humano` FOREIGN KEY (`idPerro`) REFERENCES `perro` (`idCollar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humano`
--

LOCK TABLES `humano` WRITE;
/*!40000 ALTER TABLE `humano` DISABLE KEYS */;
INSERT INTO `humano` VALUES (1,'Juanma','calle de la piruleta',658452214,'1111',1);
/*!40000 ALTER TABLE `humano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perro`
--

DROP TABLE IF EXISTS `perro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perro` (
  `nombre` varchar(45) NOT NULL,
  `edad` int DEFAULT NULL,
  `salud` varchar(500) DEFAULT NULL,
  `idCollar` int NOT NULL,
  `peso` float NOT NULL,
  PRIMARY KEY (`idCollar`),
  CONSTRAINT `perro_collar` FOREIGN KEY (`idCollar`) REFERENCES `collar` (`idCollar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perro`
--

LOCK TABLES `perro` WRITE;
/*!40000 ALTER TABLE `perro` DISABLE KEYS */;
INSERT INTO `perro` VALUES ('Tobby',3,'perfecto',1,10);
/*!40000 ALTER TABLE `perro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensores`
--

DROP TABLE IF EXISTS `sensores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensores` (
  `idSensor` int NOT NULL AUTO_INCREMENT,
  `idCollar` int NOT NULL,
  `type` enum('temperatura','luminosidad','pulsometro','podometro','ubicacion','microfono') NOT NULL,
  PRIMARY KEY (`idSensor`),
  KEY `sensor_collar_idx` (`idCollar`),
  CONSTRAINT `sensor_collar` FOREIGN KEY (`idCollar`) REFERENCES `collar` (`idCollar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensores`
--

LOCK TABLES `sensores` WRITE;
/*!40000 ALTER TABLE `sensores` DISABLE KEYS */;
INSERT INTO `sensores` VALUES (6,1,'temperatura'),(7,1,'ubicacion'),(8,1,'microfono'),(9,1,'pulsometro'),(10,1,'podometro'),(11,1,'luminosidad');
/*!40000 ALTER TABLE `sensores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensorvalue`
--

DROP TABLE IF EXISTS `sensorvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensorvalue` (
  `idValue` int NOT NULL AUTO_INCREMENT,
  `valor` float DEFAULT NULL,
  `timestamp` bigint NOT NULL,
  `accuracy` float DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `idSensor` int NOT NULL,
  PRIMARY KEY (`idValue`),
  KEY `sensorValue_sensores_idx` (`idSensor`),
  CONSTRAINT `sensorValue_sensores` FOREIGN KEY (`idSensor`) REFERENCES `sensores` (`idSensor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensorvalue`
--

LOCK TABLES `sensorvalue` WRITE;
/*!40000 ALTER TABLE `sensorvalue` DISABLE KEYS */;
INSERT INTO `sensorvalue` VALUES (4,33,855547441236,1,NULL,6),(17,NULL,145874258211,NULL,0,8),(18,NULL,214212,NULL,1,7),(20,200,88859885,2,NULL,11),(21,9000,2554455,1,NULL,10),(22,160,5478542845,2,NULL,9);
/*!40000 ALTER TABLE `sensorvalue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-27 18:53:46
