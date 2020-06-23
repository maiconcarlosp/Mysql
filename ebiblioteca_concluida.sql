-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: ebiblioteca
-- ------------------------------------------------------
-- Server version	5.6.44

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
-- Table structure for table `emprestimos`
--

DROP TABLE IF EXISTS `emprestimos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `livro_id` int(11) NOT NULL,
  `data_retirada` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_entrega` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_emprestimos_usuarios_idx` (`usuario_id`),
  KEY `fk_emprestimos_livro_idx` (`livro_id`),
  CONSTRAINT `fk_emprestimos_livro` FOREIGN KEY (`livro_id`) REFERENCES `livros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprestimos_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimos`
--

LOCK TABLES `emprestimos` WRITE;
/*!40000 ALTER TABLE `emprestimos` DISABLE KEYS */;
INSERT INTO `emprestimos` VALUES (1,1,7,'2020-06-12 23:29:25',NULL),(2,2,3,'2020-06-16 23:29:25','2020-06-17 12:29:25'),(3,2,2,'2020-06-16 23:29:25',NULL),(4,3,8,'2020-06-16 23:29:25',NULL),(5,5,10,'2020-06-16 23:29:25',NULL),(6,1,10,'2020-06-17 00:05:57','2020-06-17 23:29:25'),(7,2,8,'2020-06-17 00:05:57',NULL),(8,3,1,'2020-06-10 00:05:57','2020-06-16 23:29:25'),(9,2,10,'2020-06-17 00:39:35',NULL),(10,4,6,'2020-04-10 22:07:15','2020-06-16 13:29:25'),(12,2,2,'2020-06-18 22:24:10',NULL),(13,3,3,'2020-06-19 22:24:10',NULL),(14,5,6,'2020-06-18 22:24:10','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `emprestimos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(120) COLLATE utf8_bin NOT NULL,
  `situacao` enum('Disponivel','Excluido') COLLATE utf8_bin NOT NULL DEFAULT 'Disponivel',
  PRIMARY KEY (`id`),
  KEY `idx_titulo` (`titulo`),
  KEY `idx_situacao` (`situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (1,'A DEFESA TEM A PALAVRA','Disponivel'),(2,'NO TRIUNAL DO JURI','Disponivel'),(3,'ZUN TSU','Excluido'),(4,'STEVE JOBS','Disponivel'),(5,'DICIONARIO PT-BR','Disponivel'),(6,'CPC','Disponivel'),(7,'CLT','Excluido'),(8,'CP','Excluido'),(9,'DICIONARIO DE PRINCIPIOS JURIDICOS','Disponivel'),(10,'NODEJS','Disponivel'),(11,'VUE','Excluido'),(12,'COMPOSER','Disponivel');
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifas`
--

DROP TABLE IF EXISTS `tarifas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarifas` (
  `id` int(11) NOT NULL,
  `multa` decimal(5,2) DEFAULT NULL,
  `diaria` decimal(5,2) DEFAULT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifas`
--

LOCK TABLES `tarifas` WRITE;
/*!40000 ALTER TABLE `tarifas` DISABLE KEYS */;
INSERT INTO `tarifas` VALUES (0,10.99,1.70,'2020-06-19 22:44:44');
/*!40000 ALTER TABLE `tarifas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) CHARACTER SET utf8 NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `genero` enum('Masculino','Feminino') COLLATE utf8_bin DEFAULT NULL,
  `cep` int(8) DEFAULT NULL,
  `rua` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `numero` int(10) DEFAULT NULL,
  `complemento` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cidade` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `estado` enum('AC','AL','AP','AM','BA','CE','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO','DF') COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Victor','1993-01-10','Masculino',80630280,'Flores',123,'bloco A','Curitiba','PR'),(2,'Heitor','2019-06-08','Masculino',50631293,'Vercedino Jesus',421,NULL,'Caxias do Sul','RS'),(3,'Dayane',NULL,'Feminino',81237128,'Oliveiras',4123,NULL,'São Paulo','SP'),(4,'Julio',NULL,'Masculino',59738122,'Bauru',12,NULL,'São Paulo','SP'),(5,'Cida',NULL,'Feminino',23981239,'Santarem',54,NULL,'Florianopolis','SC');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ebiblioteca'
--

--
-- Dumping routines for database 'ebiblioteca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-22 20:17:40
