-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id_address` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `zone` varchar(45) NOT NULL,
  `house_building` varchar(45) NOT NULL,
  `floor` varchar(45) DEFAULT NULL,
  `local` varchar(45) DEFAULT NULL,
  `id_sponsor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_address`),
  KEY `fk_addresses_sponsors1_idx` (`id_sponsor`),
  CONSTRAINT `fk_addresses_sponsors1` FOREIGN KEY (`id_sponsor`) REFERENCES `sponsors` (`id_sponsor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Venezuela','Miranda','Caracas','Las Mercedes','Los Postes','3','14',1),(2,'Venezuela','Distrito Capital','Caracas','El Caribe','#15',NULL,NULL,NULL),(3,'Venezuela','Miranda','Guarenas','Nueva Casarapa','La Fuente',NULL,NULL,NULL),(4,'Venezuela','Miranda','Guatire','El Marques','El Color','1','2',NULL);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset` (
  `id_ingress` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `description` text NOT NULL,
  `id_billings` int(11) NOT NULL,
  `id_balance` int(11) NOT NULL,
  PRIMARY KEY (`id_ingress`),
  KEY `fk_ingress_billings1_idx` (`id_billings`),
  KEY `fk_asset_balance1_idx` (`id_balance`),
  CONSTRAINT `fk_asset_balance1` FOREIGN KEY (`id_balance`) REFERENCES `balance` (`id_balance`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingress_billings1` FOREIGN KEY (`id_billings`) REFERENCES `billings` (`id_billing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES (1,94000,'pago de un(1) curso por sponsor de Jose De Leon',1,1),(2,151200,'brian pago 2 curso porque pago el de su amigo',3,1),(3,36000,'pago de inscripcion',4,1),(4,12000,'cuota#1',5,1);
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `balance`
--

DROP TABLE IF EXISTS `balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance` (
  `id_balance` int(11) NOT NULL AUTO_INCREMENT,
  `capital` double NOT NULL,
  `id_company` int(11) NOT NULL,
  PRIMARY KEY (`id_balance`),
  KEY `fk_balance_companys1_idx` (`id_company`),
  CONSTRAINT `fk_balance_companys1` FOREIGN KEY (`id_company`) REFERENCES `companys` (`id_company`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance`
--

LOCK TABLES `balance` WRITE;
/*!40000 ALTER TABLE `balance` DISABLE KEYS */;
INSERT INTO `balance` VALUES (1,293200,1);
/*!40000 ALTER TABLE `balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billings`
--

DROP TABLE IF EXISTS `billings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billings` (
  `id_billing` int(11) NOT NULL AUTO_INCREMENT,
  `number_billing` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `id` varchar(45) NOT NULL,
  `address` varchar(245) NOT NULL,
  `telephone_number` int(21) NOT NULL,
  `date` date NOT NULL,
  `products` varchar(245) DEFAULT NULL,
  `BI` double NOT NULL,
  `TAX` double NOT NULL DEFAULT '0',
  `total_amount` double NOT NULL,
  `status` varchar(45) NOT NULL,
  `type` enum('asset','expense') DEFAULT NULL,
  `id_payment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_billing`),
  KEY `fk_billings_payments1_idx` (`id_payment`),
  CONSTRAINT `fk_billings_payments1` FOREIGN KEY (`id_payment`) REFERENCES `payments` (`id_payment`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billings`
--

LOCK TABLES `billings` WRITE;
/*!40000 ALTER TABLE `billings` DISABLE KEYS */;
INSERT INTO `billings` VALUES (1,1,'comware','j-1342315','venezuela, caracas, las mercedes',2122344234,'2015-10-19','curso',84000,10000,94000,'cancellada','asset',1),(2,1,'hack','j-1252354','venezuela, distrito capital, los dos caminos',2125669878,'2015-10-30','impuestos',10000,0,10000,'cancelada','expense',NULL),(3,2,'brian','v-26040675','venezuela, catia, el caribe',534553153,'2015-10-15','2 curso',151200,0,151200,'cancelada','asset',2),(4,3,'irindiana','v-10803275','venezuela, miranda, el marques',414325975,'2015-10-19','inscripcion',36000,0,36000,'cancelada','asset',3),(5,4,'irindiana','v-10803275','venezuela, miranda, el marques',414325975,'2015-11-19','cuota#1',12000,0,12000,'cancelada','asset',4);
/*!40000 ALTER TABLE `billings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('sponsor','student') NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'sponsor'),(2,'student'),(3,'student');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companys`
--

DROP TABLE IF EXISTS `companys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companys` (
  `id_company` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `RIF` varchar(45) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_company`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companys`
--

LOCK TABLES `companys` WRITE;
/*!40000 ALTER TABLE `companys` DISABLE KEYS */;
INSERT INTO `companys` VALUES (1,'HACK','j-112314','Venezuela','Distrito Capital','Caracas');
/*!40000 ALTER TABLE `companys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credits`
--

DROP TABLE IF EXISTS `credits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credits` (
  `id_credit` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(45) NOT NULL,
  `amount_credit` double NOT NULL,
  `id_order` int(11) NOT NULL,
  PRIMARY KEY (`id_credit`),
  KEY `fk_credits_orders1_idx` (`id_order`),
  CONSTRAINT `fk_credits_orders1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credits`
--

LOCK TABLES `credits` WRITE;
/*!40000 ALTER TABLE `credits` DISABLE KEYS */;
INSERT INTO `credits` VALUES (1,'inscripcion',36000,3),(2,'cuota#1',12000,3);
/*!40000 ALTER TABLE `credits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenses` (
  `id_expenses` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `description` varchar(45) NOT NULL,
  `id_billings` int(11) NOT NULL,
  `id_balance` int(11) NOT NULL,
  PRIMARY KEY (`id_expenses`),
  KEY `fk_expenses_billings1_idx` (`id_billings`),
  KEY `fk_expenses_balance1_idx` (`id_balance`),
  CONSTRAINT `fk_expenses_balance1` FOREIGN KEY (`id_balance`) REFERENCES `balance` (`id_balance`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_expenses_billings1` FOREIGN KEY (`id_billings`) REFERENCES `billings` (`id_billing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,10000,'pago de impuestos',2,1);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `full`
--

DROP TABLE IF EXISTS `full`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `full` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `discount` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `id_order` int(11) NOT NULL,
  PRIMARY KEY (`id_type`),
  KEY `fk_full_orders1_idx` (`id_order`),
  CONSTRAINT `fk_full_orders1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `full`
--

LOCK TABLES `full` WRITE;
/*!40000 ALTER TABLE `full` DISABLE KEYS */;
INSERT INTO `full` VALUES (1,0,84000,1),(2,16800,151200,2);
/*!40000 ALTER TABLE `full` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `methods`
--

DROP TABLE IF EXISTS `methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `methods` (
  `id_method` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL,
  `responsible` varchar(45) NOT NULL,
  `bank` varchar(45) NOT NULL,
  `type` enum('transfer','deposit') DEFAULT NULL,
  PRIMARY KEY (`id_method`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `methods`
--

LOCK TABLES `methods` WRITE;
/*!40000 ALTER TABLE `methods` DISABLE KEYS */;
INSERT INTO `methods` VALUES (1,2314325,'2015-10-18',84000,'manuel','banesco','transfer'),(2,1666457,'2015-10-15',151200,'brian','mercantil','deposit'),(3,3889638,'2015-10-19',36000,'irindiana','venezuela','transfer'),(4,5615152,'2015-11-19',12000,'irindiana','venezuela','deposit');
/*!40000 ALTER TABLE `methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `date_ordered` date NOT NULL,
  `total_amount` double DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `fk_orders_clients1_idx1` (`id_client`),
  CONSTRAINT `fk_orders_clients1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2015-09-15',84000,'pagado','el cliente pidio el curso',1),(2,'2015-09-25',168000,'pagado','brian pago el curso',2),(3,'2015-09-09',84000,'pagando','1 curso por cuotas',3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity_ordered` int(11) NOT NULL,
  `detail_price` double NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_products_products1_idx` (`id_product`),
  KEY `fk_orders_products_orders1_idx` (`id_orders`),
  CONSTRAINT `fk_orders_products_orders1` FOREIGN KEY (`id_orders`) REFERENCES `orders` (`id_order`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_products_products1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` VALUES (1,1,84000,1,1),(2,2,84000,1,2),(3,1,84000,1,3);
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id_payment` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `id_method` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `id_credit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_payment`),
  KEY `fk_payments_methods1_idx` (`id_method`),
  KEY `fk_payments_full1_idx` (`id_type`),
  KEY `fk_payments_credit_idx` (`id_credit`),
  CONSTRAINT `fk_payments_credit` FOREIGN KEY (`id_credit`) REFERENCES `credits` (`id_credit`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_full1` FOREIGN KEY (`id_type`) REFERENCES `full` (`id_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_methods1` FOREIGN KEY (`id_method`) REFERENCES `methods` (`id_method`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,84000,1,1,NULL),(2,151200,2,2,NULL),(3,36000,3,NULL,1),(4,12000,4,NULL,2);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'curso','duracion 4 meses',84000),(2,'propedeutico','2 semanas ',5000);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsors` (
  `id_sponsor` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `RIF` varchar(45) NOT NULL,
  `telephone_number` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `logo` varchar(45) DEFAULT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id_sponsor`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_sponsors_hack_clients1_idx` (`id_client`),
  CONSTRAINT `fk_sponsors_hack_clients1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsors`
--

LOCK TABLES `sponsors` WRITE;
/*!40000 ALTER TABLE `sponsors` DISABLE KEYS */;
INSERT INTO `sponsors` VALUES (1,'comware','j-1343256','0212-234-42-34','comware@gmail.com','',1);
/*!40000 ALTER TABLE `sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id_student` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `telephone_number` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `id_card` varchar(45) NOT NULL,
  `study` varchar(45) NOT NULL DEFAULT 'sin estudios',
  `second_name` varchar(45) DEFAULT NULL,
  `second_surname` varchar(45) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_sponsor` int(11) DEFAULT NULL,
  `id_address` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_student`),
  KEY `fk_students_addresses_idx` (`id_address`),
  KEY `fk_students_sponsors1_idx` (`id_sponsor`),
  KEY `fk_students_hack_clients1_idx` (`id_client`),
  CONSTRAINT `fk_students_addresses` FOREIGN KEY (`id_address`) REFERENCES `addresses` (`id_address`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_students_hack_clients1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_students_sponsors1` FOREIGN KEY (`id_sponsor`) REFERENCES `sponsors` (`id_sponsor`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Jose','De Leon','04141600534','josedeleon_ka@hotmail.com','26194045','Bachiller',NULL,NULL,NULL,1,2),(2,'brian','del alcazar','04122905554','brian.delalcazar@gmail.com','26040675','Bachiller',NULL,NULL,2,NULL,3),(3,'Irindiana','Barrios','04142359771','irindiana_barrios@hotmail.com','10803275','sin estudios',NULL,NULL,3,NULL,4);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-03 15:13:58
