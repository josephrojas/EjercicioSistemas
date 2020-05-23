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
  `Cantidad` int DEFAULT NULL,
  `receta_carros` int DEFAULT NULL,
  `Mes` varchar(15) DEFAULT NULL,
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
INSERT INTO `carros` VALUES (1,'Sedan',47,1,'Enero'),(2,'HatchBack',2,2,'Enero'),(3,'SUV',11,3,'Enero'),(4,'Deportivo',18,4,'Enero'),(5,'Van',0,5,'Enero'),(6,'Pick_Up',9,6,'Enero'),(7,'Roadster',2,7,'Enero'),(8,'Familiar',30,8,'Enero'),(9,'Todoterreno',6,9,'Enero'),(10,'Cupe',10,10,'Enero');
/*!40000 ALTER TABLE `carros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `idCompra` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `informe_inventario` int DEFAULT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `fk.inventario_idx` (`informe_inventario`),
  CONSTRAINT `fk.inventario` FOREIGN KEY (`informe_inventario`) REFERENCES `inventario` (`idInventario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,'2020-01-01',1);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informe`
--

DROP TABLE IF EXISTS `informe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informe` (
  `Compra` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Carros` int DEFAULT NULL,
  `idInforme` int NOT NULL AUTO_INCREMENT,
  `Proyeccion` int DEFAULT NULL,
  PRIMARY KEY (`idInforme`),
  KEY `fk.carros_idx` (`Carros`),
  KEY `fk.compra` (`Compra`),
  KEY `fk.proyeccion_idx` (`Proyeccion`),
  CONSTRAINT `fk.carros` FOREIGN KEY (`Carros`) REFERENCES `carros` (`idCarros`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk.compra` FOREIGN KEY (`Compra`) REFERENCES `compra` (`idCompra`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk.proyeccion` FOREIGN KEY (`Proyeccion`) REFERENCES `proyeccion` (`idProyeccion`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informe`
--

LOCK TABLES `informe` WRITE;
/*!40000 ALTER TABLE `informe` DISABLE KEYS */;
INSERT INTO `informe` VALUES (1,'0000-00-00',1,1,1);
/*!40000 ALTER TABLE `informe` ENABLE KEYS */;
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
-- Table structure for table `proyeccion`
--

DROP TABLE IF EXISTS `proyeccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyeccion` (
  `idProyeccion` int NOT NULL,
  `Puertas` int DEFAULT NULL,
  `Techo` int DEFAULT NULL,
  `Armazon` int DEFAULT NULL,
  `ArmazonAlum` int DEFAULT NULL,
  `Llantas` int DEFAULT NULL,
  `Manijas` int DEFAULT NULL,
  `Tapetes` int DEFAULT NULL,
  `Aire` int DEFAULT NULL,
  `BolsasAire` int DEFAULT NULL,
  `MotorLc` int DEFAULT NULL,
  `MotorMc` int DEFAULT NULL,
  `MotorHc` int DEFAULT NULL,
  PRIMARY KEY (`idProyeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyeccion`
--

LOCK TABLES `proyeccion` WRITE;
/*!40000 ALTER TABLE `proyeccion` DISABLE KEYS */;
INSERT INTO `proyeccion` VALUES (1,497,133,115,20,639,509,538,120,639,55,60,20);
/*!40000 ALTER TABLE `proyeccion` ENABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-22 13:07:06
