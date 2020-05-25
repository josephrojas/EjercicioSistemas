CREATE DATABASE  IF NOT EXISTS `german` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `german`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: german
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `carros`
--

DROP TABLE IF EXISTS `carros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carros` (
  `idCarros` int NOT NULL,
  `Tipo` varchar(25) DEFAULT NULL,
  `receta_carros` int DEFAULT NULL,
  PRIMARY KEY (`idCarros`),
  KEY `fk.receta_idx` (`receta_carros`),
  CONSTRAINT `fk.receta` FOREIGN KEY (`receta_carros`) REFERENCES `receta` (`idReceta`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carros`
--

LOCK TABLES `carros` WRITE;
/*!40000 ALTER TABLE `carros` DISABLE KEYS */;
INSERT INTO `carros` VALUES (1,'Sedan',1),(2,'HatchBack',2),(3,'SUV',3),(4,'Deportivo',4),(5,'Van',5),(6,'Pick_Up',6),(7,'Roadster',7),(8,'Familiar',8),(9,'Todoterreno',9),(10,'Cupe',10);
/*!40000 ALTER TABLE `carros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrospordemanda`
--

DROP TABLE IF EXISTS `carrospordemanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrospordemanda` (
  `idCarros` int NOT NULL,
  `Fecha` date NOT NULL,
  `Cantidad` int DEFAULT NULL,
  PRIMARY KEY (`idCarros`,`Fecha`),
  CONSTRAINT `fk.carros` FOREIGN KEY (`idCarros`) REFERENCES `carros` (`idCarros`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrospordemanda`
--

LOCK TABLES `carrospordemanda` WRITE;
/*!40000 ALTER TABLE `carrospordemanda` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrospordemanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrosporfecha`
--

DROP TABLE IF EXISTS `carrosporfecha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrosporfecha` (
  `Fecha` date NOT NULL,
  `idCarro` int NOT NULL,
  `idInventario` int DEFAULT NULL,
  PRIMARY KEY (`Fecha`,`idCarro`),
  KEY `fk.carro_idx` (`idCarro`),
  KEY `fk.inventario_idx` (`idInventario`),
  CONSTRAINT `fk.carro` FOREIGN KEY (`idCarro`) REFERENCES `carros` (`idCarros`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk.inventario` FOREIGN KEY (`idInventario`) REFERENCES `inventario` (`idInventario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrosporfecha`
--

LOCK TABLES `carrosporfecha` WRITE;
/*!40000 ALTER TABLE `carrosporfecha` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrosporfecha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `idInventario` int NOT NULL DEFAULT '0',
  `Periodo` date DEFAULT '0000-00-00',
  `Puertas` int DEFAULT '0',
  `Techo` int DEFAULT '0',
  `Armazon` int DEFAULT '0',
  `ArmazonAlum` int DEFAULT '0',
  `Llantas` int DEFAULT '0',
  `Manijas` int DEFAULT '0',
  `Tapetes` int DEFAULT '0',
  `Aire` int DEFAULT '0',
  `BolsasAire` int DEFAULT '0',
  `MotorLc` int DEFAULT '0',
  `MotorMc` int DEFAULT '0',
  `MotorHc` int DEFAULT '0',
  PRIMARY KEY (`idInventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,'2020-01-01',0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta` (
  `idReceta` int NOT NULL DEFAULT '0',
  `Puertas` int DEFAULT '0',
  `Techo` int DEFAULT '0',
  `Armazon` int DEFAULT '0',
  `ArmazonAlum` int DEFAULT '0',
  `Llantas` int DEFAULT '0',
  `Manijas` int DEFAULT '0',
  `Tapetes` int DEFAULT '0',
  `Aire` int DEFAULT '0',
  `BolsasAire` int DEFAULT '0',
  `MotorLc` int DEFAULT '0',
  `MotorMc` int DEFAULT '0',
  `MotorHc` int DEFAULT '0',
  PRIMARY KEY (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (1,4,1,1,0,5,4,3,1,4,1,0,0),(2,4,1,1,0,5,4,4,1,4,1,0,0),(3,4,1,1,0,5,4,5,1,5,0,1,0),(4,2,1,0,1,4,2,2,1,6,0,0,1),(5,3,1,1,0,4,3,5,0,2,0,1,0),(6,5,1,1,0,5,5,4,0,4,0,1,0),(7,2,0,0,1,4,2,2,1,6,0,0,1),(8,4,1,1,0,5,4,7,1,6,0,1,0),(9,2,1,1,0,4,4,3,0,2,1,0,0),(10,4,1,1,0,4,4,3,1,4,0,1,0);
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'german'
--

--
-- Dumping routines for database 'german'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-24 16:45:23
