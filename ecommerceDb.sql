CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL,
  `coleur` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'beige','CPU 8 cœurs et GPU 7 cœurs - 8Go RAM - SSD 256Go - AZERTY - Français','assets/iphonelogo.png','Iphone'),(2,'red','CPU 8 cœurs et GPU 7 cœurs - 8Go RAM - SSD 256Go - AZERTY - Français','assets/go.png','Google'),(3,'pink','CPU 8 cœurs et GPU 7 cœurs - 8Go RAM - SSD 256Go - AZERTY - Français','assets/samsunglogo.png','Samsung'),(4,'green','CPU 8 cœurs et GPU 7 cœurs - 8Go RAM - SSD 256Go - AZERTY - Français','assets/hp.png','Ordinateur HP'),(5,'yellow','CPU 8 cœurs et GPU 7 cœurs - 8Go RAM - SSD 256Go - AZERTY - Français','assets/Lenovo.png','Ordinateur Lenovo'),(6,'yellow','CPU 8 cœurs et GPU 7 cœurs - 8Go RAM - SSD 256Go - AZERTY - Français','assets/mack.png','Ordinateur Macbook 256'),(7,'grey','CPU 8 cœurs et GPU 7 cœurs - 8Go RAM - SSD 256Go - AZERTY - Français','assets/mack.png','Ipad');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_seq`
--

DROP TABLE IF EXISTS `category_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_seq`
--

LOCK TABLES `category_seq` WRITE;
/*!40000 ALTER TABLE `category_seq` DISABLE KEYS */;
INSERT INTO `category_seq` VALUES (101);
/*!40000 ALTER TABLE `category_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `email` varchar(45) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'69 boulevard jaquard','amineelokri@gmail.com','Amine','0763204803'),(2,'','ahmedcherif','ahmed',''),(52,'','ahmedcherif','ahmed',''),(102,'','aminelokri','aminelokri','');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_seq`
--

DROP TABLE IF EXISTS `client_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_seq`
--

LOCK TABLES `client_seq` WRITE;
/*!40000 ALTER TABLE `client_seq` DISABLE KEYS */;
INSERT INTO `client_seq` VALUES (201);
/*!40000 ALTER TABLE `client_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande_client`
--

DROP TABLE IF EXISTS `commande_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande_client` (
  `id` int NOT NULL,
  `date_creation` datetime(6) DEFAULT NULL,
  `montant` decimal(6,2) DEFAULT NULL,
  `no_confirmation` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkjj3vhf49o1chiq3mpuxk42vx` (`client_id`),
  CONSTRAINT `FKkjj3vhf49o1chiq3mpuxk42vx` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande_client`
--

LOCK TABLES `commande_client` WRITE;
/*!40000 ALTER TABLE `commande_client` DISABLE KEYS */;
INSERT INTO `commande_client` VALUES (1,'2025-02-20 18:51:35.726331',NULL,455896,NULL),(2,'2025-02-20 18:52:46.368578',NULL,467524,NULL),(3,'2025-02-20 18:54:37.837216',NULL,416250,NULL),(4,'2025-02-20 18:55:38.663811',NULL,262732,1),(5,'2025-02-20 18:57:58.187870',3399.96,743191,1),(6,'2025-02-20 19:12:28.051290',NULL,670042,1),(7,'2025-02-20 19:14:28.679873',NULL,451670,1),(8,'2025-02-20 19:16:13.896275',NULL,773840,1),(9,'2025-02-20 19:18:49.517785',NULL,251291,1),(10,'2025-02-20 19:20:04.111807',899.99,537300,1),(11,'2025-02-20 19:22:34.598390',799.99,933099,1),(12,'2025-02-20 19:27:34.420440',899.99,480131,1),(13,'2025-02-20 19:33:14.701481',899.99,856502,1),(14,'2025-02-20 19:36:04.623397',899.99,114076,1),(15,'2025-02-20 19:47:38.928624',899.99,672034,1),(16,'2025-02-20 21:25:08.133698',899.99,751171,2),(52,'2025-02-20 21:55:55.924648',1699.98,447226,102);
/*!40000 ALTER TABLE `commande_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande_client_seq`
--

DROP TABLE IF EXISTS `commande_client_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande_client_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande_client_seq`
--

LOCK TABLES `commande_client_seq` WRITE;
/*!40000 ALTER TABLE `commande_client_seq` DISABLE KEYS */;
INSERT INTO `commande_client_seq` VALUES (151);
/*!40000 ALTER TABLE `commande_client_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` int NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `id_client` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKsdr04cpxiv2u27mkd1ei2tyt6` (`id_client`),
  CONSTRAINT `FKj3inyq0qm6clhdsb2w6pti2pl` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'amine2002','amineelokri',1),(2,'ahmed1234','ahmedcherif',2),(52,'ahmed','ahmedcherif',52),(102,'amine1234','aminelokri',102);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_seq`
--

DROP TABLE IF EXISTS `login_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_seq`
--

LOCK TABLES `login_seq` WRITE;
/*!40000 ALTER TABLE `login_seq` DISABLE KEYS */;
INSERT INTO `login_seq` VALUES (201);
/*!40000 ALTER TABLE `login_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL,
  `available` bit(1) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(38,2) NOT NULL,
  `quantity` int NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,_binary '\0','256Go | Gris | Neuf','assets/iphonelogo.png','Iphone 15 pro',899.99,20,1),(3,_binary '\0','256Go | Red | Neuf','assets/iphone15.png','Iphone 15',799.99,20,1),(4,_binary '\0','256Go | Gris | Neuf','assets/iphone14pro.png','Iphone 14 pro',699.99,20,1),(5,_binary '\0','128Go | Yellow | Neuf','assets/iphone14.png','Iphone 14 ',599.99,20,1),(6,_binary '\0','128Go | Gold | Neuf','assets/iphone13pro.png','Iphone 13 pro ',659.99,20,1),(7,_binary '\0','128Go | Gris | Neuf','assets/iphone13.png','Iphone 13',499.99,20,1),(8,_binary '\0','128Go | Gris | Neuf','assets/iphone12pro.png','Iphone 12 pro',399.99,20,1),(9,_binary '\0','128Go | Gris | Neuf','assets/iphone12.png','Iphone 12',359.99,20,1),(10,_binary '\0','128Go | Gris | Neuf','assets/iphone11pro.png','Iphone 11 pro',299.99,20,1),(11,_binary '\0','128Go | Gris | Neuf','assets/iphone11.png','Iphone 11',259.99,20,1),(12,_binary '\0','256Go | Pink | Neuf','assets/iphone16.png','Iphone 16',1099.99,20,1),(13,_binary '\0','256Go | Gold | Neuf','assets/iphone16pro.png','Iphone 16 pro',1199.99,20,1),(14,_binary '\0','256Go | Gold | Neuf','assets/pixel8pro.png','Google Pixel 8 pro',799.99,20,2),(15,_binary '\0','256Go | Gold | Neuf','assets/pixel8pro.png','Google Pixel 7 pro',599.99,20,2),(16,_binary '\0','256Go | Gold | Neuf','assets/pixel6pro.png','Google Pixel 6 pro',399.99,20,2),(17,_binary '\0','256Go | Gris | Neuf','assets/pixel7pro.png','Google Pixel 7 pro',599.99,20,2),(18,_binary '\0','256Go | Gris | Neuf','assets/pixel8.png','Google Pixel 8',699.99,20,2),(19,_binary '\0','256Go | Gris | Neuf','assets/pixel7.png','Google Pixel 7',699.99,20,2),(20,_binary '\0','256Go | Gris | Neuf','assets/pixel6.png','Google Pixel 6',299.99,20,2),(21,_binary '\0','186Go | Gris | Neuf','assets/pixel6.png','Google Pixel 6',259.99,20,2),(22,_binary '\0','128Go | Gris | Neuf','assets/pixel6.png','Google Pixel 6',259.99,20,2),(23,_binary '\0','128Go | Yellow | Neuf','assets/pixel6.png','Google Pixel 7',359.99,20,2),(24,_binary '\0','128Go | Yellow | Neuf','assets/pixel7.png','Google Pixel 7',359.99,20,2),(25,_binary '\0','512Go | gris | Neuf','assets/samsungs24.png','Samsung S24 Ultra',999.99,20,3),(26,_binary '\0','512Go | gris | Neuf','assets/samsungs23.png','Samsung S23 Ultra',899.99,20,3),(27,_binary '\0','512Go | gris | Neuf','assets/samsungs22.png','Samsung S22 Ultra',799.99,20,3),(28,_binary '\0','512Go | gris | Neuf','assets/samsungs21.png','Samsung S21 Ultra',699.99,20,3),(29,_binary '\0','512Go | gris | Neuf','assets/samsungs20.png','Samsung S20 Ultra',599.99,20,3),(30,_binary '\0','512Go | gris | Neuf','assets/samsungs19.png','Samsung S19 Ultra',499.99,20,3),(31,_binary '\0','512Go | gris | Neuf','assets/samsungs10.png','Samsung S10 Ultra',399.99,20,3),(32,_binary '\0','512Go | gris | Neuf','assets/samsungs9.png','Samsung S9 Ultra',299.99,20,3),(33,_binary '\0','512Go | gris | Neuf','assets/samsungs8.png','Samsung S8 Ultra',199.99,20,3),(34,_binary '\0','512Go | gris | Neuf','assets/samsungs7.png','Samsung S7 Ultra',169.99,20,3),(35,_binary '\0','512Go | gris | Neuf','assets/samsungs10.png','Samsung note 10 Ultra',399.99,20,3),(36,_binary '\0','512Go | gris | Neuf','assets/samsungn9.png','Samsung note 9 Ultra',399.99,20,3),(37,_binary '\0','512Go | gris | Neuf','assets/samsungn8.png','Samsung note 8 Ultra',299.99,20,3),(38,_binary '\0','512Go | gris | Neuf','assets/samsungn7.png','Samsung note 7 Ultra',199.99,20,3),(39,_binary '\0','1 To SSD | 65 Go Ram | Neuf','assets/HP20.png','Ordinateur HP E20',1999.99,20,3),(40,_binary '\0','512 To SSD | 32 Go Ram | Neuf','assets/HP19.png','Ordinateur HP E19',1099.99,20,3),(41,_binary '\0','512 To SSD | 16 Go Ram | Neuf','assets/HP18.png','Ordinateur HP E18',899.99,20,3),(42,_binary '\0','512 To SSD | 8 Go Ram | Neuf','assets/HP16.png','Ordinateur HP E16',699.99,20,3),(43,_binary '\0','512 To SSD | 8 Go Ram | Neuf','assets/HP15.png','Ordinateur HP E15',599.99,20,3),(44,_binary '\0','512 To SSD | 8 Go Ram | Neuf','assets/HP14.png','Ordinateur HP E14',499.99,20,3),(45,_binary '\0','1 To SSD | 65 Go Ram | Neuf','assets/Hp2.png','Ordinateur HP E20',1999.99,20,4),(46,_binary '\0','1 To SSD | 32 Go Ram | Neuf','assets/Hp19.png','Ordinateur HP E19',1099.99,20,4),(47,_binary '\0','1 To SSD | 16 Go Ram | Neuf','assets/Hp18.png','Ordinateur HP E18',999.99,20,4),(48,_binary '\0','1 To SSD | 8 Go Ram | Neuf','assets/Hp17.png','Ordinateur HP E17',899.99,20,4),(49,_binary '\0','512 To SSD |32 Go Ram | Neuf','assets/Hp16.png','Ordinateur HP E16',799.99,20,4),(50,_binary '\0','512 To SSD |32 Go Ram | Neuf','assets/Hp15.png','Ordinateur HP E15',699.99,20,4),(51,_binary '\0','512 To SSD |16 Go Ram | Neuf','assets/Hp14.png','Ordinateur HP E14',599.99,20,4),(52,_binary '\0','512 To SSD |8 Go Ram | Neuf','assets/Hp13.png','Ordinateur HP E13',499.99,20,4),(53,_binary '\0','1 To SSD |64 Go Ram | Neuf','assets/Lenovo20.png','Ordinateur Lenovo E20',1999.99,20,5),(54,_binary '\0','1 To SSD |32 Go Ram | Neuf','assets/Lenovo19.png','Ordinateur Lenovo E19',1099.99,20,5),(55,_binary '\0','1 To SSD |16 Go Ram | Neuf','assets/Lenovo18.png','Ordinateur Lenovo E18',999.99,20,5),(56,_binary '\0','512 To SSD |16 Go Ram | Neuf','assets/Lenovo17.png','Ordinateur Lenovo E17',899.99,20,5),(57,_binary '\0','512 To SSD |8 Go Ram | Neuf','assets/Lenovo16.png','Ordinateur Lenovo E16',799.99,20,5),(58,_binary '\0','512 To SSD |32 Go Ram | Neuf','assets/Lenovo15.png','Ordinateur Lenovo E15',889.99,20,5),(59,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/Lenovo14.png','Ordinateur Lenovo E14',989.99,20,5),(60,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/Lenovo13.png','Ordinateur Lenovo E13',889.99,20,5),(61,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/mac1.png','MacBook Air M2',1299.99,20,6),(62,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/mac2.png','MacBook Air M3',1399.99,20,6),(63,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/mac3.png','MacBook Air M2 13',1499.99,20,6),(64,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/mac4.png','MacBook Air M3 13',1599.99,20,6),(65,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/mac5.png','MacBook Air M3 15',1699.99,20,6),(66,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/mac8.png','MacBook Air M5 ',2099.99,20,6),(67,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/ipad1.png','Ipad 1 Pro ',399.99,20,7),(68,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/ipad2.png','Ipad 2 Pro ',499.99,20,7),(69,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/ipad3.png','Ipad 3 Pro ',599.99,20,7),(70,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/ipad5.png','Ipad 5 Pro ',799.99,20,7),(71,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/ipad6.png','Ipad 6 Pro ',899.99,20,7),(72,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/ipad8.png','Ipad 8 Pro ',1099.99,20,7),(73,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/mac6.png','MacBook M6 ',2199.99,20,7),(74,_binary '\0','512 To SSD |64 Go Ram | Neuf','assets/mac7.png','MacBook M7 ',2299.99,20,7);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_seq`
--

DROP TABLE IF EXISTS `product_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_seq`
--

LOCK TABLES `product_seq` WRITE;
/*!40000 ALTER TABLE `product_seq` DISABLE KEYS */;
INSERT INTO `product_seq` VALUES (151);
/*!40000 ALTER TABLE `product_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit_commande`
--

DROP TABLE IF EXISTS `produit_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit_commande` (
  `quantite` int DEFAULT NULL,
  `commande_client_id` int NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`commande_client_id`,`product_id`),
  KEY `FKo2oosrs0mdyp7ykt2hlro642m` (`product_id`),
  CONSTRAINT `FKgwd1kpmyusg5rsjro728vx0xg` FOREIGN KEY (`commande_client_id`) REFERENCES `commande_client` (`id`),
  CONSTRAINT `FKo2oosrs0mdyp7ykt2hlro642m` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit_commande`
--

LOCK TABLES `produit_commande` WRITE;
/*!40000 ALTER TABLE `produit_commande` DISABLE KEYS */;
INSERT INTO `produit_commande` VALUES (2,5,2),(2,5,3),(1,10,2),(1,11,14),(1,12,2),(1,13,2),(1,14,2),(1,15,2),(1,16,2),(1,52,2),(1,52,14);
/*!40000 ALTER TABLE `produit_commande` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-20 23:01:57
