-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: maturita
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

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
-- Table structure for table `argomento`
--

DROP TABLE IF EXISTS `argomento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `argomento` (
  `id_argomento` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id_argomento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `argomento`
--

LOCK TABLES `argomento` WRITE;
/*!40000 ALTER TABLE `argomento` DISABLE KEYS */;
INSERT INTO `argomento` VALUES (1,'triangoli'),(2,'legge di OHM'),(3,'verismo');
/*!40000 ALTER TABLE `argomento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classe`
--

DROP TABLE IF EXISTS `classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classe` (
  `id_classe` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `docente` int DEFAULT NULL,
  `materia` int NOT NULL,
  PRIMARY KEY (`id_classe`),
  KEY `materia` (`materia`),
  KEY `docente` (`docente`),
  CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`materia`) REFERENCES `materia` (`materia_id`) ON UPDATE CASCADE,
  CONSTRAINT `classe_ibfk_2` FOREIGN KEY (`docente`) REFERENCES `docente` (`id_doc`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classe`
--

LOCK TABLES `classe` WRITE;
/*!40000 ALTER TABLE `classe` DISABLE KEYS */;
INSERT INTO `classe` VALUES (1,'1A',1,1);
/*!40000 ALTER TABLE `classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `id_doc` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  PRIMARY KEY (`id_doc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'Mario','Rossi');
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `immagine`
--

DROP TABLE IF EXISTS `immagine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `immagine` (
  `id_immagine` int NOT NULL AUTO_INCREMENT,
  `nome_url` varchar(255) NOT NULL,
  `videogioco` int DEFAULT NULL,
  PRIMARY KEY (`id_immagine`),
  KEY `videogioco` (`videogioco`),
  CONSTRAINT `immagine_ibfk_1` FOREIGN KEY (`videogioco`) REFERENCES `videogioco` (`id_vg`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `immagine`
--

LOCK TABLES `immagine` WRITE;
/*!40000 ALTER TABLE `immagine` DISABLE KEYS */;
INSERT INTO `immagine` VALUES (3,'ciao.jpg',1);
/*!40000 ALTER TABLE `immagine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `materia_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`materia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Informatica');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `n_monete`
--

DROP TABLE IF EXISTS `n_monete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `n_monete` (
  `id_monete` int NOT NULL AUTO_INCREMENT,
  `n_monete` int NOT NULL,
  `studente` int NOT NULL,
  `videogioco` int NOT NULL,
  PRIMARY KEY (`id_monete`),
  KEY `studente` (`studente`),
  KEY `videogioco` (`videogioco`),
  CONSTRAINT `n_monete_ibfk_1` FOREIGN KEY (`studente`) REFERENCES `studente` (`id_stud`) ON UPDATE CASCADE,
  CONSTRAINT `n_monete_ibfk_2` FOREIGN KEY (`videogioco`) REFERENCES `videogioco` (`id_vg`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `n_monete`
--

LOCK TABLES `n_monete` WRITE;
/*!40000 ALTER TABLE `n_monete` DISABLE KEYS */;
INSERT INTO `n_monete` VALUES (2,100,1,1);
/*!40000 ALTER TABLE `n_monete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pippo`
--

DROP TABLE IF EXISTS `pippo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pippo` (
  `id_pippo` int NOT NULL AUTO_INCREMENT,
  `classe` int DEFAULT NULL,
  `studenti` int DEFAULT NULL,
  PRIMARY KEY (`id_pippo`),
  KEY `classe` (`classe`),
  KEY `studenti` (`studenti`),
  CONSTRAINT `pippo_ibfk_1` FOREIGN KEY (`classe`) REFERENCES `classe` (`id_classe`) ON UPDATE CASCADE,
  CONSTRAINT `pippo_ibfk_2` FOREIGN KEY (`studenti`) REFERENCES `studente` (`id_stud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pippo`
--

LOCK TABLES `pippo` WRITE;
/*!40000 ALTER TABLE `pippo` DISABLE KEYS */;
INSERT INTO `pippo` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `pippo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studente`
--

DROP TABLE IF EXISTS `studente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studente` (
  `id_stud` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  PRIMARY KEY (`id_stud`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studente`
--

LOCK TABLES `studente` WRITE;
/*!40000 ALTER TABLE `studente` DISABLE KEYS */;
INSERT INTO `studente` VALUES (1,'Giuseppe','Bianchi'),(2,'Luigi','Neri'),(3,'Anna','Gialli');
/*!40000 ALTER TABLE `studente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topolino`
--

DROP TABLE IF EXISTS `topolino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topolino` (
  `id_topolino` int NOT NULL AUTO_INCREMENT,
  `classe` int DEFAULT NULL,
  `videogioco` int DEFAULT NULL,
  PRIMARY KEY (`id_topolino`),
  KEY `classe` (`classe`),
  KEY `videogioco` (`videogioco`),
  CONSTRAINT `topolino_ibfk_1` FOREIGN KEY (`classe`) REFERENCES `classe` (`id_classe`) ON UPDATE CASCADE,
  CONSTRAINT `topolino_ibfk_2` FOREIGN KEY (`videogioco`) REFERENCES `videogioco` (`id_vg`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topolino`
--

LOCK TABLES `topolino` WRITE;
/*!40000 ALTER TABLE `topolino` DISABLE KEYS */;
INSERT INTO `topolino` VALUES (2,1,1),(3,1,1);
/*!40000 ALTER TABLE `topolino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videogioco`
--

DROP TABLE IF EXISTS `videogioco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videogioco` (
  `id_vg` int NOT NULL AUTO_INCREMENT,
  `titolo` varchar(255) NOT NULL,
  `desc_brv` varchar(160) NOT NULL,
  `desc_ests` varchar(255) NOT NULL,
  `argomento` int DEFAULT NULL,
  PRIMARY KEY (`id_vg`),
  KEY `argomento` (`argomento`),
  CONSTRAINT `videogioco_ibfk_1` FOREIGN KEY (`argomento`) REFERENCES `argomento` (`id_argomento`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videogioco`
--

LOCK TABLES `videogioco` WRITE;
/*!40000 ALTER TABLE `videogioco` DISABLE KEYS */;
INSERT INTO `videogioco` VALUES (1,'ciao','ciao test','test maturita preparazione',1);
/*!40000 ALTER TABLE `videogioco` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-24 17:00:25
