-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: achados_perdidos
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `itens`
--

DROP TABLE IF EXISTS `itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  `categoria` varchar(50) DEFAULT NULL,
  `local_encontrado` varchar(100) DEFAULT NULL,
  `data_encontrado` date DEFAULT NULL,
  `situacao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens`
--

LOCK TABLES `itens` WRITE;
/*!40000 ALTER TABLE `itens` DISABLE KEYS */;
INSERT INTO `itens` VALUES (1,'caneta','','educação','chao','2026-06-16','Encontrado'),(2,'a','','a','chao','2026-06-16','Encontrado'),(3,'garrafa','garrafa azul','garrafa','sala 12, no lixeiro','2026-06-23',NULL),(4,'casaco','cor preta','casaco','mesa','2026-06-23',NULL),(5,'colar','com pedrinha vermelha','acessório','chão do lab 2','2026-06-23',NULL),(6,'lapis','preto','material escolar','chao sala 11','2026-06-23',NULL),(7,'laṕiseira','faber castell preta com porta lixo','escrever','de lado pra cadeira dela','2026-06-23',NULL);
/*!40000 ALTER TABLE `itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `turma` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `funcao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
INSERT INTO `pessoas` VALUES (1,'ana','9 ano a','','','aluna'),(2,'ana v','3info','89955343','anssv@gmail.com','aluno'),(3,'evilyin','3 info','73263516752','evilyszinhagostosinha@gmail.com','humilhar professores');
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retiradas`
--

DROP TABLE IF EXISTS `retiradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retiradas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `pessoa_id` int DEFAULT NULL,
  `data_retirada` date DEFAULT NULL,
  `assinatura` varchar(100) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `turma` varchar(100) DEFAULT NULL,
  `funcao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `pessoa_id` (`pessoa_id`),
  CONSTRAINT `retiradas_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `itens` (`id`),
  CONSTRAINT `retiradas_ibfk_2` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retiradas`
--

LOCK TABLES `retiradas` WRITE;
/*!40000 ALTER TABLE `retiradas` DISABLE KEYS */;
INSERT INTO `retiradas` VALUES (1,1,1,'2026-06-16','09',NULL,NULL,NULL),(2,1,1,'2026-06-16','aa',NULL,NULL,NULL),(3,2,1,'2026-06-23','ds',NULL,NULL,NULL),(4,4,1,'2026-06-23','js',NULL,NULL,NULL),(5,1,1,'2026-06-23','anas',NULL,NULL,NULL),(6,1,1,'2026-06-23','d',NULL,NULL,NULL),(7,1,1,'2026-06-23','d',NULL,NULL,NULL),(8,1,1,'2026-06-23','d',NULL,NULL,NULL),(9,1,1,'2026-06-23','d',NULL,NULL,NULL),(10,1,1,'2026-06-23','d',NULL,NULL,NULL),(11,6,2,'2026-06-23','anss',NULL,NULL,NULL),(12,7,3,'2026-06-23','elyy',NULL,NULL,NULL);
/*!40000 ALTER TABLE `retiradas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-30  9:42:56
