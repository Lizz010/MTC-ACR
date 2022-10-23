CREATE DATABASE  IF NOT EXISTS `minticacr` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `minticacr`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: minticacr
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `apartamento`
--

DROP TABLE IF EXISTS `apartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apartamento` (
  `IdApartamento` int NOT NULL,
  `IdPropietario` int NOT NULL,
  `IdConjunto` int DEFAULT NULL,
  `NumPiso` int DEFAULT NULL,
  `NumApart` int DEFAULT NULL,
  `MetrosApart` int DEFAULT NULL,
  PRIMARY KEY (`IdApartamento`),
  KEY `Apartamento_Conjunto_idx` (`IdConjunto`),
  CONSTRAINT `Apartamento_Conjunto` FOREIGN KEY (`IdConjunto`) REFERENCES `conjunto` (`IdConjunto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartamento`
--

LOCK TABLES `apartamento` WRITE;
/*!40000 ALTER TABLE `apartamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartera`
--

DROP TABLE IF EXISTS `cartera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartera` (
  `IdCartera` int NOT NULL,
  PRIMARY KEY (`IdCartera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartera`
--

LOCK TABLES `cartera` WRITE;
/*!40000 ALTER TABLE `cartera` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coeficientecobro`
--

DROP TABLE IF EXISTS `coeficientecobro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coeficientecobro` (
  `IdCoeficienteCobro` int NOT NULL,
  `IdConjunto` int DEFAULT NULL,
  `IdApartamento` int DEFAULT NULL,
  `PorcentajeCoef` decimal(45,0) DEFAULT NULL,
  PRIMARY KEY (`IdCoeficienteCobro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coeficientecobro`
--

LOCK TABLES `coeficientecobro` WRITE;
/*!40000 ALTER TABLE `coeficientecobro` DISABLE KEYS */;
/*!40000 ALTER TABLE `coeficientecobro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conceptopago`
--

DROP TABLE IF EXISTS `conceptopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conceptopago` (
  `IdConceptoPago` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdConceptoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conceptopago`
--

LOCK TABLES `conceptopago` WRITE;
/*!40000 ALTER TABLE `conceptopago` DISABLE KEYS */;
/*!40000 ALTER TABLE `conceptopago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conjunto`
--

DROP TABLE IF EXISTS `conjunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conjunto` (
  `IdConjunto` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Estrato` int DEFAULT NULL,
  `NumAparts` int DEFAULT NULL,
  `ATMetros` int DEFAULT NULL,
  PRIMARY KEY (`IdConjunto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conjunto`
--

LOCK TABLES `conjunto` WRITE;
/*!40000 ALTER TABLE `conjunto` DISABLE KEYS */;
/*!40000 ALTER TABLE `conjunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentacobro`
--

DROP TABLE IF EXISTS `cuentacobro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentacobro` (
  `idCuentaCobro` int NOT NULL,
  `IdConjunto` varchar(45) NOT NULL,
  `IdApartamento` varchar(45) DEFAULT NULL,
  `IdConceptoPago` int DEFAULT NULL,
  `FechCobro` date DEFAULT NULL,
  `ValorCobro` decimal(45,0) DEFAULT NULL,
  PRIMARY KEY (`idCuentaCobro`),
  KEY `CuentaCobro_ConceptoPago_idx` (`IdConceptoPago`),
  CONSTRAINT `CuentaCobro_ConceptoPago` FOREIGN KEY (`IdConceptoPago`) REFERENCES `conceptopago` (`IdConceptoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentacobro`
--

LOCK TABLES `cuentacobro` WRITE;
/*!40000 ALTER TABLE `cuentacobro` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentacobro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `IdPago` int NOT NULL,
  `IdCuentaCobro` int DEFAULT NULL,
  `IdApartamento` int DEFAULT NULL,
  `IdConceptoPago` int DEFAULT NULL,
  `FechPago` date DEFAULT NULL,
  `ValorPago` decimal(45,0) DEFAULT NULL,
  PRIMARY KEY (`IdPago`),
  KEY `Pagos_CuentaCobro_idx` (`IdCuentaCobro`),
  CONSTRAINT `Pagos_CuentaCobro` FOREIGN KEY (`IdCuentaCobro`) REFERENCES `cuentacobro` (`idCuentaCobro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietario` (
  `IdPropietario` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `IdConjunto` int DEFAULT NULL,
  `IdApartamento` int DEFAULT NULL,
  PRIMARY KEY (`IdPropietario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario`
--

LOCK TABLES `propietario` WRITE;
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-03  06:31:35
