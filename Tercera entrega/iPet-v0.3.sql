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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collar`
--

LOCK TABLES `collar` WRITE;
/*!40000 ALTER TABLE `collar` DISABLE KEYS */;
INSERT INTO `collar` VALUES (1,11111111),(2,22222222),(3,33333333),(4,44444444);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humano`
--

LOCK TABLES `humano` WRITE;
/*!40000 ALTER TABLE `humano` DISABLE KEYS */;
INSERT INTO `humano` VALUES (2,'Cayetana','el valle',658955413,'pinkiglos',1),(3,'Jenny','las 3000',658999562,'reinadelgloss69',2),(4,'Pepe','una calle normal',659874565,'asdfge3asqw',3),(5,'Jonny','el barrio',546556985,'aquillegotutiburon',4);
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
INSERT INTO `perro` VALUES ('Alfredo',1,'Alergico a las cuca',1,10),('Lui',2,'Esta to masao',2,20),('Estefania',2,'Problemas de sobrepeso',3,100),('Tobi',5,'Alergico a las galletas',4,15);
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
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`idSensor`),
  KEY `sensor_collar_idx` (`idCollar`),
  CONSTRAINT `sensor_collar` FOREIGN KEY (`idCollar`) REFERENCES `collar` (`idCollar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensores`
--

LOCK TABLES `sensores` WRITE;
/*!40000 ALTER TABLE `sensores` DISABLE KEYS */;
INSERT INTO `sensores` VALUES (16,1,'pulsometro'),(17,2,'temperatura'),(18,2,'humedad'),(19,2,'pulsometro'),(20,1,'temperatura'),(21,1,'humedad'),(22,1,'podometro'),(23,2,'podometro');
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
  `valor` float NOT NULL,
  `timestamp` bigint NOT NULL,
  `accuracy` float NOT NULL,
  `idSensor` int NOT NULL,
  PRIMARY KEY (`idValue`),
  KEY `sensorValue_sensores_idx` (`idSensor`),
  CONSTRAINT `sensorValue_sensores` FOREIGN KEY (`idSensor`) REFERENCES `sensores` (`idSensor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensorvalue`
--

LOCK TABLES `sensorvalue` WRITE;
/*!40000 ALTER TABLE `sensorvalue` DISABLE KEYS */;
INSERT INTO `sensorvalue` VALUES (28,32,1111112,1,16),(29,23,22222223,1,17),(30,44,3333334,2,18),(31,5,444445,2,19),(32,654,5555556,1,20),(33,55,666667,2,21),(34,577,7777778,2,22),(35,8,8888889,3,23);
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

-- Dump completed on 2020-04-16 20:09:18
