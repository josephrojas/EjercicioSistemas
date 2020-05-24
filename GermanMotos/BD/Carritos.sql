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
-- Table structure for table `demanda`
--

DROP TABLE IF EXISTS `demanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demanda` (
  `idDemanda` int NOT NULL,
  `Mes` varchar(25) DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Carros` int DEFAULT NULL,
  PRIMARY KEY (`idDemanda`),
  KEY `fk.carros_idx` (`Carros`),
  CONSTRAINT `fk.carros` FOREIGN KEY (`Carros`) REFERENCES `carros` (`idCarros`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demanda`
--

LOCK TABLES `demanda` WRITE;
/*!40000 ALTER TABLE `demanda` DISABLE KEYS */;
INSERT INTO `demanda` VALUES (1,'Enero',47,1),(2,'Enero',2,2),(3,'Enero',11,3),(4,'Enero',18,4),(5,'Enero',0,5),(6,'Enero',9,6),(7,'Enero',2,7),(8,'Enero',30,8),(9,'Enero',6,9),(10,'Enero',10,10),(11,'Febrero',27,1),(12,'Febrero',11,2),(13,'Febrero',50,3),(14,'Febrero',18,4),(15,'Febrero',37,5),(16,'Febrero',3,6),(17,'Febrero',30,7),(18,'Febrero',29,8),(19,'Febrero',48,9),(20,'Febrero',41,10),(21,'Marzo',0,1),(22,'Marzo',41,2),(23,'Marzo',45,3),(24,'Marzo',16,4),(25,'Marzo',18,5),(26,'Marzo',32,6),(27,'Marzo',33,7),(28,'Marzo',41,8),(29,'Marzo',17,9),(30,'Marzo',1,10),(31,'Abril',11,1),(32,'Abril',11,2),(33,'Abril',17,3),(34,'Abril',2,4),(35,'Abril',30,5),(36,'Abril',25,6),(37,'Abril',0,7),(38,'Abril',26,8),(39,'Abril',16,9),(40,'Abril',50,10),(41,'Mayo',39,1),(42,'Mayo',43,2),(43,'Mayo',4,3),(44,'Mayo',13,4),(45,'Mayo',41,5),(46,'Mayo',19,6),(47,'Mayo',28,7),(48,'Mayo',42,8),(49,'Mayo',41,9),(50,'Mayo',28,10),(51,'Junio',48,1),(52,'Junio',34,2),(53,'Junio',32,3),(54,'Junio',26,4),(55,'Junio',5,5),(56,'Junio',4,6),(57,'Junio',19,7),(58,'Junio',0,8),(59,'Junio',45,9),(60,'Junio',35,10),(61,'Julio',23,1),(62,'Julio',19,2),(63,'Julio',2,3),(64,'Julio',31,4),(65,'Julio',0,5),(66,'Julio',0,6),(67,'Julio',26,7),(68,'Julio',21,8),(69,'Julio',27,9),(70,'Julio',42,10),(71,'Agosto',48,1),(72,'Agosto',44,2),(73,'Agosto',24,3),(74,'Agosto',31,4),(75,'Agosto',32,5),(76,'Agosto',21,6),(77,'Agosto',11,7),(78,'Agosto',35,8),(79,'Agosto',27,9),(80,'Agosto',2,10),(81,'Septiembre',50,1),(82,'Septiembre',45,2),(83,'Septiembre',17,3),(84,'Septiembre',43,4),(85,'Septiembre',34,5),(86,'Septiembre',16,6),(87,'Septiembre',26,7),(88,'Septiembre',33,8),(89,'Septiembre',16,9),(90,'Septiembre',13,10),(91,'Octubre',35,1),(92,'Octubre',46,2),(93,'Octubre',21,3),(94,'Octubre',11,4),(95,'Octubre',6,5),(96,'Octubre',31,6),(97,'Octubre',17,7),(98,'Octubre',7,8),(99,'Octubre',35,9),(100,'Octubre',1,10),(101,'Noviembre',38,1),(102,'Noviembre',50,2),(103,'Noviembre',22,3),(104,'Noviembre',39,4),(105,'Noviembre',0,5),(106,'Noviembre',5,6),(107,'Noviembre',14,7),(108,'Noviembre',37,8),(109,'Noviembre',47,9),(110,'Diciembre',9,10),(111,'Diciembre',9,1),(112,'Diciembre',20,2),(113,'Diciembre',0,3),(114,'Diciembre',17,4),(115,'Diciembre',16,5),(116,'Diciembre',13,6),(117,'Diciembre',39,7),(118,'Diciembre',12,8),(119,'Diciembre',19,9),(120,'Diciembre',2,10);
/*!40000 ALTER TABLE `demanda` ENABLE KEYS */;
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

-- Dump completed on 2020-05-23 22:20:44
