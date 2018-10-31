CREATE DATABASE  IF NOT EXISTS `gymmanagement` /*!40100 DEFAULT CHARACTER SET utf8 */;


-- test 

USE `gymmanagement`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gymmanagement
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.26-MariaDB

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
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` bigint(20) DEFAULT NULL,
  `fromModel` varchar(255) DEFAULT NULL,
  `originalRecord` longtext,
  `originalRecordId` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gymadmin`
--

DROP TABLE IF EXISTS `gymadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gymadmin` (
  `UserId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL,
  `bid` bigint(20) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL,
  `Username` varchar(250) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `UpdatedBy` bigint(20) DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `filepath` longtext,
  `filename` longtext,
  `displayfilename` longtext,
  `isLock` bit(1) DEFAULT b'0',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gymadmin`
--

LOCK TABLES `gymadmin` WRITE;
/*!40000 ALTER TABLE `gymadmin` DISABLE KEYS */;
INSERT INTO `gymadmin` VALUES (1,'admin','356a192b7913b04c54574d18c28d46e6395428ab',1,1,1,'admin',NULL,NULL,NULL,1,'2018-08-28 14:49:45','d:\\Nodejs\\gymapp\\assets\\userfiles\\adminphoto\\1\\1\\f01531a1-41db-4a49-882b-e721ca08b0ba.png','f01531a1-41db-4a49-882b-e721ca08b0ba.png','585e4bcdcb11b227491c3396.png','\0'),(2,'vinoth','7110eda4d09e062aa5e4a390b0a572ac0d2c0220',1,6,2,'vinoth','9042967143','2018-08-27 15:36:08',1,1,'2018-08-28 15:04:17','d:\\Nodejs\\gymapp\\assets\\userfiles\\adminphoto\\2\\2\\9ade63cb-31fc-4493-b0e0-ac3fe2e3d902.jpg','9ade63cb-31fc-4493-b0e0-ac3fe2e3d902.jpg','flower.jpg',NULL);
/*!40000 ALTER TABLE `gymadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processquery`
--

DROP TABLE IF EXISTS `processquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processquery` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processquery`
--

LOCK TABLES `processquery` WRITE;
/*!40000 ALTER TABLE `processquery` DISABLE KEYS */;
/*!40000 ALTER TABLE `processquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbbranch`
--

DROP TABLE IF EXISTS `tbbranch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbbranch` (
  `bid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Place` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `UpdatedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbbranch`
--

LOCK TABLES `tbbranch` WRITE;
/*!40000 ALTER TABLE `tbbranch` DISABLE KEYS */;
INSERT INTO `tbbranch` VALUES (1,'Malumichampatti','Malumichampatti',NULL,'2018-06-04 01:50:50','\0',NULL,1),(2,'test','test','2018-06-03 16:13:39','2018-06-04 02:00:52','\0',1,1),(3,'test','test','2018-06-03 16:14:19','2018-06-04 02:00:45','\0',1,1),(4,'test','test','2018-06-03 16:20:13','2018-06-04 01:54:02','\0',1,1),(5,'test','test','2018-06-03 16:20:17','2018-06-04 01:52:46','\0',1,1),(6,'Malumichampatti','Malumichampatti','2018-06-04 02:01:07',NULL,'',1,NULL),(7,'Echanari','Echanari','2018-06-04 02:02:14',NULL,'',1,NULL),(8,'kuniyamuthur','kuniyamuthur','2018-07-20 03:39:20',NULL,'',1,NULL),(9,'test','test','2018-07-28 02:50:56','2018-07-28 02:51:05','\0',1,1);
/*!40000 ALTER TABLE `tbbranch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgymuser`
--

DROP TABLE IF EXISTS `tblgymuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgymuser` (
  `UserId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `EmailId` longtext,
  `DOB` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `bid` bigint(20) DEFAULT NULL,
  `CreatedDate` varchar(45) DEFAULT NULL,
  `UpdatedDate` varchar(45) DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  `height` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `filepath` longtext,
  `filename` longtext,
  `displayfilename` longtext,
  `gymnumber` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgymuser`
--

LOCK TABLES `tblgymuser` WRITE;
/*!40000 ALTER TABLE `tblgymuser` DISABLE KEYS */;
INSERT INTO `tblgymuser` VALUES (1,'Thirumurthy','mohammad.dach@example.com',NULL,'70557 Lesch Way Apt. 006\nWest Valeriehaven, A',NULL,6,NULL,'2018-08-28 14:45:28',NULL,'1',1,'1971-07-13',NULL,NULL,'d:\\Nodejs\\gymapp\\assets\\userfiles\\avatar\\1\\1\\9a8fe737-5dbe-4109-9d24-3d30181b67c2.png','9a8fe737-5dbe-4109-9d24-3d30181b67c2.png','585e4bcdcb11b227491c3396.png',NULL),(3,'totam','modesto09@example.org',NULL,'7442 Windler Hill Suite 338\nRunteburgh, MA 02','858.498.5640x5929',NULL,NULL,NULL,NULL,NULL,1,'1988-01-09',NULL,NULL,NULL,NULL,NULL,NULL),(4,'eos','mclaughlin.christelle@example.com',NULL,'58223 Neva Stream\nAlexanetown, OK 51420','708-420-6118',NULL,NULL,NULL,NULL,NULL,0,'1997-01-03',NULL,NULL,NULL,NULL,NULL,NULL),(5,'qui','fleta74@example.org',NULL,'44372 Selena Centers\nCarloport, KY 95877','1-632-900-9018',NULL,NULL,NULL,NULL,NULL,0,'1975-03-16',NULL,NULL,NULL,NULL,NULL,NULL),(6,'cum','anahi42@example.org',NULL,'59086 Brown Villages\nMullerhaven, NY 23683','03098425300',NULL,NULL,NULL,NULL,NULL,0,'1990-09-10',NULL,NULL,NULL,NULL,NULL,NULL),(7,'deserunt','bblick@example.com',NULL,'62201 Wolff Square Suite 652\nMylenechester, C','176.906.1743x889',NULL,NULL,NULL,NULL,NULL,1,'1980-02-03',NULL,NULL,NULL,NULL,NULL,NULL),(8,'pariatur','josh83@example.org',NULL,'85822 Jayne Fields\nBernhardtown, WY 56349-303','804.041.3139x079',NULL,NULL,NULL,NULL,NULL,1,'1984-11-11',NULL,NULL,NULL,NULL,NULL,NULL),(9,'perspiciatis','helena.brown@example.net',NULL,'6159 Walter Center\nMateostad, TN 76726','317-565-9485x38045',NULL,NULL,NULL,NULL,NULL,1,'1984-01-12',NULL,NULL,NULL,NULL,NULL,NULL),(10,'quaerat','fay.emmett@example.net',NULL,'06635 Hammes Ways\nKrajcikmouth, OH 18719-1830','914-989-2495',NULL,NULL,NULL,NULL,NULL,0,'2002-08-18',NULL,NULL,NULL,NULL,NULL,NULL),(11,'distinctio','rodriguez.herman@example.org',NULL,'1997 Corine Gateway Suite 979\nPort Grayceshir','424-723-0082',NULL,NULL,NULL,NULL,NULL,0,'1993-12-12',NULL,NULL,NULL,NULL,NULL,NULL),(12,'totam','gabrielle72@example.org',NULL,'129 Maddison Bypass Suite 164\nVeummouth, CA 7','1-414-015-4264',NULL,NULL,NULL,NULL,NULL,1,'1976-09-18',NULL,NULL,NULL,NULL,NULL,NULL),(13,'est','pearl52@example.org',NULL,'5712 Johnston Ville Suite 225\nWest Orlandosid','768.767.7175x369',NULL,NULL,NULL,NULL,NULL,1,'1998-02-25',NULL,NULL,NULL,NULL,NULL,NULL),(14,'quis','goldner.eliezer@example.net',NULL,'249 Rosalyn Garden\nSouth Orinburgh, OH 11087-','462.345.3081x9127',NULL,NULL,NULL,NULL,NULL,1,'1992-11-13',NULL,NULL,NULL,NULL,NULL,NULL),(15,'eos','jennyfer36@example.org',NULL,'710 Parisian Court Apt. 109\nJazlynport, OK 55','+73(2)4031678470',NULL,NULL,NULL,NULL,NULL,0,'2006-04-25',NULL,NULL,NULL,NULL,NULL,NULL),(16,'beatae','mbins@example.com',NULL,'9734 Mraz Trail Apt. 231\nRosaliaburgh, ND 983','393-124-6083x2864',NULL,NULL,NULL,NULL,NULL,1,'2009-03-14',NULL,NULL,NULL,NULL,NULL,NULL),(17,'magnam','gutmann.sandra@example.net',NULL,'3361 Wolf Meadow Apt. 514\nGibsonfort, NE 2572','+25(8)3117966254',NULL,NULL,NULL,NULL,NULL,1,'2010-05-19',NULL,NULL,NULL,NULL,NULL,NULL),(18,'itaque','wilma.cruickshank@example.org',NULL,'606 Leffler Ramp Apt. 242\nOraton, GA 49447-43','08973017682',NULL,NULL,NULL,NULL,NULL,0,'1985-08-13',NULL,NULL,NULL,NULL,NULL,NULL),(19,'et','feeney.makayla@example.com',NULL,'49140 Elisha Valleys Suite 160\nHuelshaven, ME','069-173-2819x026',NULL,NULL,NULL,NULL,NULL,0,'1974-04-03',NULL,NULL,NULL,NULL,NULL,NULL),(20,'aliquid','danika06@example.org',NULL,'81320 Leda Unions Apt. 993\nSatterfieldchester','503-438-3677',NULL,NULL,NULL,NULL,NULL,0,'2011-01-15',NULL,NULL,NULL,NULL,NULL,NULL),(21,'enim','kamryn56@example.com',NULL,'56061 Idell Curve Suite 240\nEast Joesphside, ','+59(3)6893638654',NULL,NULL,NULL,NULL,NULL,1,'1989-01-16',NULL,NULL,NULL,NULL,NULL,NULL),(22,'voluptatem','willy37@example.net',NULL,'364 Maxie Roads Apt. 746\nPaulport, WI 82865-1','(451)660-1293x1752',NULL,NULL,NULL,NULL,NULL,0,'1978-07-31',NULL,NULL,NULL,NULL,NULL,NULL),(23,'aut','laverne.roob@example.net',NULL,'426 Maxwell Drive\nNorth Annabell, MA 91660-43','1-963-924-8552',NULL,NULL,NULL,NULL,NULL,1,'2004-07-13',NULL,NULL,NULL,NULL,NULL,NULL),(24,'dicta','toney53@example.com',NULL,'904 Thalia Mews\nJustenburgh, AL 19190-6252','711-786-2773x671',NULL,NULL,NULL,NULL,NULL,0,'2010-12-11',NULL,NULL,NULL,NULL,NULL,NULL),(25,'rerum','hortense.parker@example.com',NULL,'78035 Heaney Highway\nHandside, CT 43729-0496','(056)242-0965x44692',NULL,NULL,NULL,NULL,NULL,1,'1986-12-24',NULL,NULL,NULL,NULL,NULL,NULL),(26,'rerum','sdaugherty@example.org',NULL,'009 Tromp Via\nPort Murrayport, KY 21032-9398','920-822-9225x821',NULL,NULL,NULL,NULL,NULL,1,'2016-05-22',NULL,NULL,NULL,NULL,NULL,NULL),(27,'non','sylvester51@example.com',NULL,'4815 Vandervort Glens Apt. 344\nNew Maximillia','1-910-667-8467x01673',NULL,NULL,NULL,NULL,NULL,1,'1993-01-04',NULL,NULL,NULL,NULL,NULL,NULL),(28,'et','kelly.jacobs@example.net',NULL,'547 Durgan Walk Apt. 313\nHarrisport, OH 70641','(836)110-7047x955',NULL,NULL,NULL,NULL,NULL,0,'1994-04-30',NULL,NULL,NULL,NULL,NULL,NULL),(29,'eos','tdibbert@example.com',NULL,'243 Gottlieb Wells Suite 209\nChasityville, SC','206.706.6055x617',NULL,NULL,NULL,NULL,NULL,0,'1980-11-09',NULL,NULL,NULL,NULL,NULL,NULL),(30,'voluptas','d\'amore.eliza@example.net',NULL,'67662 Viva Village\nWindlertown, HI 47442','(956)114-6989x8686',NULL,NULL,NULL,NULL,NULL,1,'1988-03-23',NULL,NULL,NULL,NULL,NULL,NULL),(31,'fugiat','yschmidt@example.com',NULL,'335 Hintz Inlet\nNorth Toyport, WA 67532-7006','03096619599',NULL,NULL,NULL,NULL,NULL,1,'1996-08-11',NULL,NULL,NULL,NULL,NULL,NULL),(32,'et','sierra70@example.com',NULL,'3486 Eileen Points\nLake Duane, WA 43169-3133','(854)654-4701',NULL,NULL,NULL,NULL,NULL,0,'1974-04-29',NULL,NULL,NULL,NULL,NULL,NULL),(33,'dignissimos','jayde.beer@example.com',NULL,'28873 Jacobi Row\nPort Juliana, HI 81786','1-493-028-1069x3515',NULL,NULL,NULL,NULL,NULL,0,'1989-05-31',NULL,NULL,NULL,NULL,NULL,NULL),(34,'non','sbecker@example.com',NULL,'629 Keebler Plaza\nMooreshire, CA 23195','(591)857-1275x3550',NULL,NULL,NULL,NULL,NULL,0,'1972-06-24',NULL,NULL,NULL,NULL,NULL,NULL),(35,'rem','hillary28@example.org',NULL,'37403 Bettye Groves Suite 468\nLake Gayle, AL ','102.997.3356',NULL,NULL,NULL,NULL,NULL,1,'1972-07-17',NULL,NULL,NULL,NULL,NULL,NULL),(36,'rem','zieme.alexa@example.org',NULL,'4172 Kutch Burgs Suite 635\nNorth Thaddeusport','(865)288-5149x51344',NULL,NULL,NULL,NULL,NULL,0,'1984-11-08',NULL,NULL,NULL,NULL,NULL,NULL),(37,'omnis','dach.ryann@example.org',NULL,'97941 Huels View Apt. 622\nWest Loyceview, AL ','722-352-3627',NULL,NULL,NULL,NULL,NULL,0,'1983-02-26',NULL,NULL,NULL,NULL,NULL,NULL),(38,'quisquam','lcorwin@example.org',NULL,'733 Hayes Pass\nLake Justen, NM 71443','1-264-453-9345x35375',NULL,NULL,NULL,NULL,NULL,1,'2010-05-17',NULL,NULL,NULL,NULL,NULL,NULL),(39,'ut','ronaldo16@example.net',NULL,'31469 Halle Roads Suite 181\nTorphyview, MT 90','07792576364',NULL,NULL,NULL,NULL,NULL,0,'2010-03-16',NULL,NULL,NULL,NULL,NULL,NULL),(40,'autem','wdurgan@example.com',NULL,'6609 Howe Run Suite 520\nLoweton, ME 40666','007.419.3835',NULL,NULL,NULL,NULL,NULL,1,'1987-09-22',NULL,NULL,NULL,NULL,NULL,NULL),(41,'dolores','carmella19@example.org',NULL,'67422 Armstrong Point\nHerzogside, NC 72349-13','(012)192-1506',NULL,NULL,NULL,NULL,NULL,1,'1970-09-03',NULL,NULL,NULL,NULL,NULL,NULL),(42,'officiis','arnold72@example.net',NULL,'33981 Hodkiewicz Mountain Suite 421\nSouth Gre','847-186-8940x0184',NULL,NULL,NULL,NULL,NULL,0,'1975-09-14',NULL,NULL,NULL,NULL,NULL,NULL),(43,'et','reichert.khalid@example.com',NULL,'921 Jenkins Estate\nSouth Octavia, PA 08522','(272)865-6914x1413',NULL,NULL,NULL,NULL,NULL,0,'2010-08-31',NULL,NULL,NULL,NULL,NULL,NULL),(44,'ratione','hobart83@example.com',NULL,'4675 Alyson Radial\nNellemouth, MS 84867-5434','+18(1)7391600178',NULL,NULL,NULL,NULL,NULL,1,'1979-08-26',NULL,NULL,NULL,NULL,NULL,NULL),(45,'impedit','gutkowski.eleanora@example.org',NULL,'07003 Anabelle Ridge\nPagacview, IL 42051-5845','03847353931',NULL,NULL,NULL,NULL,NULL,0,'2011-07-10',NULL,NULL,NULL,NULL,NULL,NULL),(46,'omnis','lowe.adelia@example.org',NULL,'20443 Shanahan Isle\nEast Otiliaberg, DC 97697','(168)968-9633x296',NULL,NULL,NULL,NULL,NULL,0,'2018-04-26',NULL,NULL,NULL,NULL,NULL,NULL),(47,'tempore','ohahn@example.com',NULL,'3078 D\'Amore Vista\nNorth Mathilde, MS 93321-1','227.270.2116x3243',NULL,NULL,NULL,NULL,NULL,1,'2001-11-20',NULL,NULL,NULL,NULL,NULL,NULL),(48,'cumque','goldner.wyatt@example.org',NULL,'021 Isac Heights\nJackelinemouth, SD 48036-054','200-659-9811x5038',NULL,NULL,NULL,NULL,NULL,1,'2002-10-04',NULL,NULL,NULL,NULL,NULL,NULL),(49,'omnis','arolfson@example.com',NULL,'529 Ebert Point\nSouth Grayce, CO 98425-3032','346-950-7617x68680',NULL,NULL,NULL,NULL,NULL,0,'2006-12-02',NULL,NULL,NULL,NULL,NULL,NULL),(50,'occaecati','jeramie.blanda@example.org',NULL,'468 Hirthe Plain\nMarlinborough, FL 37085-5828','1-062-516-9578x22629',NULL,NULL,NULL,NULL,NULL,1,'2004-01-17',NULL,NULL,NULL,NULL,NULL,NULL),(51,'quibusdam','luis74@example.net',NULL,'21261 Isabell Causeway\nLake Juvenalport, WI 0','02401179696',NULL,NULL,NULL,NULL,NULL,0,'1996-05-22',NULL,NULL,NULL,NULL,NULL,NULL),(52,'dolore','korbin54@example.net',NULL,'4280 Laurel Mews\nLittlefort, WY 83612-4315','(967)303-3251x747',NULL,NULL,NULL,NULL,NULL,0,'1999-04-08',NULL,NULL,NULL,NULL,NULL,NULL),(53,'deserunt','beer.larry@example.org',NULL,'05824 Ondricka Overpass\nCruickshankland, MS 5','981.825.9036x8819',NULL,NULL,NULL,NULL,NULL,1,'1974-01-30',NULL,NULL,NULL,NULL,NULL,NULL),(54,'esse','cgreen@example.com',NULL,'21777 McDermott Crescent Apt. 650\nEast Breann','791-222-7290x760',NULL,NULL,NULL,NULL,NULL,1,'1972-12-05',NULL,NULL,NULL,NULL,NULL,NULL),(55,'sed','gabriel08@example.net',NULL,'42032 Cory Plains\nAlyciaville, DE 92567','835.029.2364',NULL,NULL,NULL,NULL,NULL,0,'2016-08-12',NULL,NULL,NULL,NULL,NULL,NULL),(56,'unde','jon81@example.com',NULL,'0739 Beier Crest\nDariuschester, HI 43303-3217','1-623-655-5105',NULL,NULL,NULL,NULL,NULL,0,'1993-11-09',NULL,NULL,NULL,NULL,NULL,NULL),(57,'blanditiis','cgibson@example.com',NULL,'991 Gleichner Vista Apt. 722\nLubowitzberg, DC','1-629-542-7843',NULL,NULL,NULL,NULL,NULL,0,'1987-12-27',NULL,NULL,NULL,NULL,NULL,NULL),(58,'dolore','winnifred03@example.com',NULL,'58939 Kuphal Key Apt. 757\nWest Theresia, HI 2','+53(2)3908360959',NULL,NULL,NULL,NULL,NULL,1,'1990-03-28',NULL,NULL,NULL,NULL,NULL,NULL),(59,'vero','arvilla40@example.org',NULL,'666 Lowe Spring\nNorth Shad, AZ 82429-4114','879.467.9087',NULL,NULL,NULL,NULL,NULL,0,'1970-02-17',NULL,NULL,NULL,NULL,NULL,NULL),(60,'id','bprosacco@example.org',NULL,'7787 Rippin Plains\nNew Clotildefurt, ME 84445','05923623344',NULL,NULL,NULL,NULL,NULL,0,'2005-01-14',NULL,NULL,NULL,NULL,NULL,NULL),(61,'repudiandae','nnienow@example.net',NULL,'1569 Pauline Village Apt. 580\nEast Martine, F','357-413-9720',NULL,NULL,NULL,NULL,NULL,1,'1989-03-09',NULL,NULL,NULL,NULL,NULL,NULL),(62,'earum','pkoss@example.com',NULL,'67469 Schimmel Terrace\nQuitzonfort, NE 59206','1-584-089-3708',NULL,NULL,NULL,NULL,NULL,1,'1972-12-21',NULL,NULL,NULL,NULL,NULL,NULL),(63,'quis','cschowalter@example.org',NULL,'312 Conor Avenue Apt. 896\nJovanyfort, IN 4200','1-964-870-9847',NULL,NULL,NULL,NULL,NULL,0,'1996-10-21',NULL,NULL,NULL,NULL,NULL,NULL),(64,'eaque','unique94@example.com',NULL,'2356 Flatley Key Apt. 333\nLednerbury, WA 9169','06580418590',NULL,NULL,NULL,NULL,NULL,0,'2006-10-07',NULL,NULL,NULL,NULL,NULL,NULL),(65,'esse','schmidt.carli@example.net',NULL,'346 Goyette Forest Suite 825\nNorth Evelynburg','06844514485',NULL,NULL,NULL,NULL,NULL,1,'1978-10-14',NULL,NULL,NULL,NULL,NULL,NULL),(66,'est','prosacco.alvena@example.com',NULL,'413 Sauer Parkway\nConsidineburgh, FL 35106-65','+85(5)8401097050',NULL,NULL,NULL,NULL,NULL,0,'1988-12-11',NULL,NULL,NULL,NULL,NULL,NULL),(67,'natus','garland.shanahan@example.com',NULL,'74866 Dudley Stream\nGeovanyfort, MN 66561','530.187.0222',NULL,NULL,NULL,NULL,NULL,0,'2012-10-07',NULL,NULL,NULL,NULL,NULL,NULL),(68,'sequi','denis.stroman@example.net',NULL,'719 Ondricka Valleys\nEast Maribel, OH 28164','188.193.7321x5872',NULL,NULL,NULL,NULL,NULL,1,'2001-11-19',NULL,NULL,NULL,NULL,NULL,NULL),(69,'atque','eugene88@example.org',NULL,'36723 Ted Estates Apt. 796\nLake Ibrahimboroug','312-728-6579',NULL,NULL,NULL,NULL,NULL,1,'1983-03-23',NULL,NULL,NULL,NULL,NULL,NULL),(70,'voluptatem','porter94@example.org',NULL,'065 Thompson Throughway Suite 734\nDexterview,','1-746-959-4216',NULL,NULL,NULL,NULL,NULL,1,'1972-02-04',NULL,NULL,NULL,NULL,NULL,NULL),(71,'aut','hodkiewicz.howell@example.net',NULL,'88061 Ken Meadows Suite 533\nO\'Connelltown, NV','969-360-2902',NULL,NULL,NULL,NULL,NULL,0,'1988-10-19',NULL,NULL,NULL,NULL,NULL,NULL),(72,'exercitationem','glebsack@example.com',NULL,'78717 Swift Course\nPfefferton, AR 26311','1-654-948-9922x592',NULL,NULL,NULL,NULL,NULL,1,'2001-12-15',NULL,NULL,NULL,NULL,NULL,NULL),(73,'minus','shirley99@example.org',NULL,'26837 DuBuque Forest Apt. 269\nRavenside, LA 9','1-380-947-6267',NULL,NULL,NULL,NULL,NULL,1,'2006-04-26',NULL,NULL,NULL,NULL,NULL,NULL),(74,'quia','hoppe.heloise@example.org',NULL,'8162 Heidenreich Coves\nEast Enafort, SD 09016','682-581-9420',NULL,NULL,NULL,NULL,NULL,1,'1981-07-28',NULL,NULL,NULL,NULL,NULL,NULL),(75,'nesciunt','jo\'kon@example.net',NULL,'5931 DuBuque Fort\nNorth Hester, LA 31876-6368','958-036-6293',NULL,NULL,NULL,NULL,NULL,0,'1972-03-13',NULL,NULL,NULL,NULL,NULL,NULL),(76,'et','leffler.gino@example.org',NULL,'77889 Carolyn Ports\nWest Leilani, NY 96018-12','+67(6)3448772619',NULL,NULL,NULL,NULL,NULL,0,'1978-02-03',NULL,NULL,NULL,NULL,NULL,NULL),(77,'numquam','rgreenholt@example.com',NULL,'0862 Sheila Greens Apt. 161\nNorth Frank, AR 4','520.158.9523',NULL,NULL,NULL,NULL,NULL,0,'2008-11-15',NULL,NULL,NULL,NULL,NULL,NULL),(78,'est','manuel40@example.com',NULL,'02181 Avery Place\nBettyetown, ID 36454-0298','794.361.3948x89376',NULL,NULL,NULL,NULL,NULL,0,'1971-05-12',NULL,NULL,NULL,NULL,NULL,NULL),(79,'sed','green.jedidiah@example.org',NULL,'354 Kuvalis Lodge\nSchroederport, MI 34830-078','931.743.1203x31109',NULL,NULL,NULL,NULL,NULL,1,'2007-07-17',NULL,NULL,NULL,NULL,NULL,NULL),(80,'alias','cbednar@example.com',NULL,'2438 Wiegand Mountains\nWest Maudfurt, IL 8004','(490)952-6789',NULL,NULL,NULL,NULL,NULL,1,'2007-05-24',NULL,NULL,NULL,NULL,NULL,NULL),(81,'asperiores','gabriella.grady@example.net',NULL,'73440 Janae Inlet Suite 597\nRosendoville, LA ','582.959.9436',NULL,NULL,NULL,NULL,NULL,0,'1978-04-15',NULL,NULL,NULL,NULL,NULL,NULL),(82,'facilis','adell92@example.net',NULL,'747 Madison Grove\nKeeblerhaven, CA 31777','00233815317',NULL,NULL,NULL,NULL,NULL,0,'2004-02-10',NULL,NULL,NULL,NULL,NULL,NULL),(83,'sunt','mann.nicole@example.net',NULL,'040 Schaden Ways\nSouth Adelbert, OH 70282-199','114-324-8766',NULL,NULL,NULL,NULL,NULL,1,'1989-04-25',NULL,NULL,NULL,NULL,NULL,NULL),(84,'non','qmarks@example.com',NULL,'76528 Hauck Canyon Apt. 209\nSouth Bailee, IL ','(572)645-6240',NULL,NULL,NULL,NULL,NULL,1,'2011-10-12',NULL,NULL,NULL,NULL,NULL,NULL),(85,'eveniet','casandra64@example.net',NULL,'570 Jordi Wells Suite 873\nKuphalfort, VT 3668','342.983.7787x22278',NULL,NULL,NULL,NULL,NULL,0,'1975-04-02',NULL,NULL,NULL,NULL,NULL,NULL),(86,'consequatur','fcarter@example.net',NULL,'58012 Leffler Common\nRutherfordton, AR 56412-','(091)610-8868x0405',NULL,NULL,NULL,NULL,NULL,1,'2007-12-30',NULL,NULL,NULL,NULL,NULL,NULL),(87,'voluptates','haskell.hamill@example.org',NULL,'41476 Athena Vista\nSamanthafort, WV 68435-087','1-447-334-6547x64523',NULL,NULL,NULL,NULL,NULL,0,'2011-09-17',NULL,NULL,NULL,NULL,NULL,NULL),(88,'sit','arlie.klocko@example.org',NULL,'3228 Little Forest Suite 788\nNew Carissa, AR ','1-346-878-6427x8774',NULL,NULL,NULL,NULL,NULL,1,'1978-05-17',NULL,NULL,NULL,NULL,NULL,NULL),(89,'expedita','dhoeger@example.com',NULL,'124 Kiehn Ways\nRobertsstad, MA 00767-1148','810.596.7787x12569',NULL,NULL,NULL,NULL,NULL,1,'1995-03-20',NULL,NULL,NULL,NULL,NULL,NULL),(90,'sed','shaina78@example.com',NULL,'1352 Will Meadow\nCristfurt, KS 65636','1-622-405-0541',NULL,NULL,NULL,NULL,NULL,0,'2002-04-11',NULL,NULL,NULL,NULL,NULL,NULL),(91,'earum','veda21@example.com',NULL,'266 McDermott Flat Suite 107\nLake Jaylen, KS ','(048)883-5289x60323',NULL,NULL,NULL,NULL,NULL,0,'1976-09-22',NULL,NULL,NULL,NULL,NULL,NULL),(92,'quis','brock65@example.org',NULL,'709 Douglas Corner Suite 696\nPourosside, IA 7','1-057-290-7905',NULL,NULL,NULL,NULL,NULL,0,'1995-04-02',NULL,NULL,NULL,NULL,NULL,NULL),(93,'ex','remard@example.com',NULL,'353 King Inlet Suite 441\nLake Gerhard, CA 404','900-939-6888',NULL,NULL,NULL,NULL,NULL,1,'2006-06-05',NULL,NULL,NULL,NULL,NULL,NULL),(94,'harum','lo\'keefe@example.net',NULL,'20685 Thora Center\nNorth Christop, MN 88783-4','1-338-915-4274',NULL,NULL,NULL,NULL,NULL,1,'2010-03-29',NULL,NULL,NULL,NULL,NULL,NULL),(95,'ut','bins.lucius@example.net',NULL,'3859 Isabel Bridge Suite 694\nFreddieview, OK ','148.467.6310x828',NULL,NULL,NULL,NULL,NULL,1,'1977-04-13',NULL,NULL,NULL,NULL,NULL,NULL),(96,'eveniet','ucrist@example.com',NULL,'030 Bins Bypass Apt. 278\nLillianchester, NE 6','319.416.0572x4800',NULL,NULL,NULL,NULL,NULL,1,'1999-08-08',NULL,NULL,NULL,NULL,NULL,NULL),(97,'provident','nathen31@example.org',NULL,'2653 Adela Crest Suite 963\nNew Brandynberg, K','007.947.6020x3919',NULL,NULL,NULL,NULL,NULL,1,'1991-03-21',NULL,NULL,NULL,NULL,NULL,NULL),(98,'ab','eve.zulauf@example.net',NULL,'3557 Alfonzo Prairie Suite 117\nLake Elmerboro','1-763-050-2289x39148',NULL,NULL,NULL,NULL,NULL,1,'2003-02-17',NULL,NULL,NULL,NULL,NULL,NULL),(99,'officiis','damion.cartwright@example.org',NULL,'111 Dickinson Green Apt. 477\nPort Norbertoshi','040.670.3172x6872',NULL,NULL,NULL,NULL,NULL,0,'1981-07-04',NULL,NULL,NULL,NULL,NULL,NULL),(100,'nesciunt','dstanton@example.net',NULL,'31058 Thompson Corner Apt. 680\nNorth Horace, ','680.993.0724',NULL,NULL,NULL,NULL,NULL,1,'1973-04-24',NULL,NULL,NULL,NULL,NULL,NULL),(101,'animi','pstreich@example.org',NULL,'17418 Ryder Hollow Suite 365\nLaurelland, IA 9','1-725-352-2487',NULL,NULL,NULL,NULL,NULL,0,'1985-08-29',NULL,NULL,NULL,NULL,NULL,NULL),(102,'Troy Nelson',NULL,NULL,NULL,NULL,7,'2018-05-30 17:29:23','2018-09-16 12:43:59','1','1',1,NULL,'73','158','D:\\Nodejs\\gymapp\\assets\\userfiles\\avatar\\102\\102\\47a66efe-0265-499b-a337-71c4f1be9c1b.png','47a66efe-0265-499b-a337-71c4f1be9c1b.png','node.png',NULL),(103,'Jeremy Yates',NULL,NULL,NULL,NULL,6,'2018-05-30 17:29:47','2018-06-04 02:25:38','1','1',1,'2018-06-23','74','175',NULL,NULL,NULL,NULL),(104,'ravi',NULL,NULL,NULL,NULL,6,'2018-07-19 03:51:54',NULL,'1',NULL,1,NULL,'74','175',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tblgymuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsubscription`
--

DROP TABLE IF EXISTS `tblsubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsubscription` (
  `Sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `NoOfDays` int(11) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `SType` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `UpdatedBy` bigint(20) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `ptype` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsubscription`
--

LOCK TABLES `tblsubscription` WRITE;
/*!40000 ALTER TABLE `tblsubscription` DISABLE KEYS */;
INSERT INTO `tblsubscription` VALUES (1,'1 year',365,1000.00,1,6,NULL,'2018-07-20 15:26:46',NULL,1,'',1,3),(2,'echanari',150,500.00,1,6,'2018-06-09 15:29:03','2018-06-09 15:55:49',NULL,1,'\0',5,2),(3,'3month plan',200,3000.00,1,6,'2018-07-12 03:44:32','2018-07-20 15:26:56',1,1,'',200,1),(4,'3month',90,2500.00,1,7,'2018-07-28 02:52:26','2018-07-28 02:52:49',1,1,'',3,2);
/*!40000 ALTER TABLE `tblsubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblusersubscription`
--

DROP TABLE IF EXISTS `tblusersubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblusersubscription` (
  `UserSid` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) DEFAULT NULL,
  `Sid` bigint(20) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  `ExpireDate` date DEFAULT NULL,
  `SType` int(11) DEFAULT NULL,
  `PaidAmount` decimal(14,4) DEFAULT NULL,
  `PaymentStatus` int(11) DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `DeletedDate` date DEFAULT NULL,
  `DeletedBy` bigint(20) DEFAULT NULL,
  `Notes` longtext,
  `DeleteReason` longtext,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpdatedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UserSid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblusersubscription`
--

LOCK TABLES `tblusersubscription` WRITE;
/*!40000 ALTER TABLE `tblusersubscription` DISABLE KEYS */;
INSERT INTO `tblusersubscription` VALUES (1,102,1,'2018-07-23','1980-02-13',1,200.0000,1,NULL,'2018-07-13 03:49:02','',NULL,NULL,'sdfsd',NULL,NULL,NULL),(2,1,3,'2018-08-29','2018-09-01',1,3000.0000,1,1,'2018-08-29 13:43:56','',NULL,NULL,'paid',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tblusersubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailAddress` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `isSuperAdmin` tinyint(1) DEFAULT NULL,
  `passwordResetToken` varchar(255) DEFAULT NULL,
  `passwordResetTokenExpiresAt` double DEFAULT NULL,
  `stripeCustomerId` varchar(255) DEFAULT NULL,
  `hasBillingCard` tinyint(1) DEFAULT NULL,
  `billingCardBrand` varchar(255) DEFAULT NULL,
  `billingCardLast4` varchar(255) DEFAULT NULL,
  `billingCardExpMonth` varchar(255) DEFAULT NULL,
  `billingCardExpYear` varchar(255) DEFAULT NULL,
  `emailProofToken` varchar(255) DEFAULT NULL,
  `emailProofTokenExpiresAt` double DEFAULT NULL,
  `emailStatus` varchar(255) DEFAULT NULL,
  `emailChangeCandidate` varchar(255) DEFAULT NULL,
  `tosAcceptedByIp` varchar(255) DEFAULT NULL,
  `lastSeenAt` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `emailAddress` (`emailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gymmanagement'
--

--
-- Dumping routines for database 'gymmanagement'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_del` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_del`(
v_UserId bigint(20),
v_CreatedBy bigint(20)
)
BEGIN

if v_UserId = 1 then 
	select '401' as scode;
else
		if exists(select 1 from gymadmin where UserId=v_UserId and isActive=1) then
			update gymadmin set isActive=0, UpdatedDate=UTC_TIMESTAMP(),UpdatedBy=v_CreatedBy where UserId=v_UserId;
			select '200' as scode;
		else
			select '400' as scode;
		end if;
end if;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_list` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_list`(
v_page int,
v_row int,
v_Branch varchar(250),
v_filter varchar(250)
)
BEGIN


declare v_count int default 0;
set v_row=if(v_row<=0,10,v_row);
set  v_page =((v_page -1)* v_row); 
set v_filter = concat('%',v_filter,'%');
select count(1) into @count from gymadmin where isActive=1
 and if(v_Branch is null or v_Branch='',1,find_in_set(bid,v_Branch)) 
 and if(v_filter is null or v_filter='',1,concat( ifnull(Username,''),ifnull(`Name`,'') ) like v_filter);
 select @count as Count,UserId,Name, bid,Username,phone,userType,
 case when userType=1 then 'Admin' else 'Trainee' end as userRole,
 (select Place from tbbranch where  bid=tu.bid limit 1) as bName,CreatedDate   ,filename,displayfilename
 
 from gymadmin tu where isActive=1  and if(v_Branch is null or v_Branch='',1,find_in_set(bid,v_Branch)) 
 and if(v_filter is null or v_filter='',1,concat( ifnull(Username,''),ifnull(`Name`,'') ) like v_filter) order by ifnull(UpdatedDate,CreatedDate) desc limit  v_row offset v_page;  


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_login`(
v_Name varchar(45),
v_password varchar(255)
)
BEGIN


if exists(select 1 from gymadmin where  Name=v_Name and password=sha1(v_password) and isActive=1) then
	select '200' as scode, UserId, userType,if(userType=1,0,bid) as bid from gymadmin where  Name=v_Name and password=sha1(v_password) and isActive=1 limit 1;
else
	select '400' as scode, 0 as UserId, 0 as userType, 0 as bid;
end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_save`(
v_UserId bigint(20),
v_Name varchar(45),
v_password varchar(250),
v_bid int,
v_userType int,
v_Username varchar(250),
v_phone varchar(45),
v_CreatedBy bigint(20),
v_isLock bit
)
BEGIN



if(v_UserId=0) then 
	if exists(select 1 from gymadmin where Username=v_Username  and isActive=1 ) then 
		SELECT '401' as scode,0 as UserId;
	else
		INSERT INTO   gymadmin (   Name ,password, CreatedDate  , isActive , CreatedBy,bid, userType,Username, phone )VALUES
		( v_Name, sha1(v_password),  UTC_TIMESTAMP(), 1, v_CreatedBy, v_bid, v_userType, v_Username,v_phone );
		SELECT '200' as scode,LAST_INSERT_ID() as UserId;
		
    end if;
else
	if exists(select 1 from gymadmin where UserId  <>  v_UserId and   Username=v_Username and isActive=1 ) then 
		SELECT '401' as scode,0 as UserId;
	else
		UPDATE   gymadmin SET   password  =  if(v_password is null or v_password='',password,sha1(password)), Name  =  v_Name, isLock = v_isLock,  
		UpdatedDate  =  UTC_TIMESTAMP(),   UpdatedBy  =  v_CreatedBy, bid=v_bid,userType=if(v_UserId=1,1, v_userType),Username= v_Username, phone=v_phone WHERE  UserId  =  v_UserId;
		SELECT '200' as scode,v_UserId as UserId;
	end if;
end if;
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_assignsubs` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_assignsubs`(
dUserId bigint(20),
dSid bigint(20),
dJoinDate varchar(250)
)
BEGIN


if not exists(select 1 from tblusersubscription where UserId=dUserId and Sid=dSid and isActive=1 and JoinDate=STR_TO_DATE(dJoinDate,'%d/%m/%Y') ) then
	insert into  tblusersubscription(UserId,Sid,JoinDate,CreatedDate,isActive) values
    (dUserId,dSid,STR_TO_DATE(dJoinDate,'%d/%m/%Y') ,UTC_TIMESTAMP(),1);
	select '9999' as ErrorCode;
else
	select '9997' as ErrorCode;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_branch_del` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_branch_del`(
v_bid int,
v_UserId bigint(20)
)
BEGIN


if exists(select 1 from tbbranch where bid=v_bid and isActive=1) then
	update tbbranch set isActive=0, UpdatedDate=UTC_TIMESTAMP(),UpdatedBy=v_UserId where bid=v_bid;
	select '200' as scode;
else
	select '400' as scode;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_branch_get` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_branch_get`()
BEGIN

SELECT bid,
    Place,
    Name
    
FROM tbbranch where isActive=1;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_branch_list` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_branch_list`()
BEGIN

SELECT bid,
    Place,
    Name
    
FROM tbbranch where isActive=1;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_branch_save` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_branch_save`(
v_bid bigint(20),
v_Place varchar(45),
v_Name varchar(45),
v_CreatedBy bigint(20)
)
BEGIN

if(v_bid=0) then 
	if exists(select 1 from tbbranch where Place=v_Place and  Name=v_Name and isActive=1 ) then 
		SELECT '401' as scode,0 as bid;
	else
		INSERT INTO   tbbranch (  Place , Name , CreatedDate  , isActive , CreatedBy  )VALUES
		( v_Place, v_Name,  UTC_TIMESTAMP(), 1, v_CreatedBy);
		SELECT '200' as scode,LAST_INSERT_ID() as bid;
		
    end if;
else
	if exists(select 1 from tbbranch where bid  <>  v_bid and Place=v_Place and  Name=v_Name and isActive=1 ) then 
		SELECT '401' as scode,0 as bid;
	else
		UPDATE   tbbranch SET   Place  =  v_Place, Name  =  v_Name,   
		UpdatedDate  =  UTC_TIMESTAMP(),   UpdatedBy  =  v_CreatedBy WHERE  bid  =  v_bid;
		SELECT '200' as scode,v_bid as bid;
	end if;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_file_update` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_file_update`(
v_CreatedBy bigint(20),
v_id bigint(20),
v_userid bigint(20),
v_utype varchar(250),
v_filepath longtext,
v_filename longtext,
v_displayfilename longtext
)
BEGIN
declare v_scode varchar(10) default '400';
	if(v_utype='avatar') then 
		update tblgymuser set   UpdatedBy=v_CreatedBy, UpdatedDate= utc_timestamp(),filepath = v_filepath, filename=v_filename, 
        displayfilename=v_displayfilename  where UserId=v_id;
        set v_scode = '200';
	elseif(v_utype ='adminphoto') then
		update gymadmin set UpdatedBy=v_CreatedBy, UpdatedDate= utc_timestamp(),filepath = v_filepath, filename=v_filename, 
        displayfilename=v_displayfilename  where UserId=v_id;
    end if;

select v_scode as scode;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUser`(
v_page int,
v_row int,
v_Branch varchar(250),
v_filter varchar(250),
v_userId bigint(20)
)
BEGIN

declare v_count int default 0;
set v_row=if(v_row<=0,10,v_row);
set  v_page =((v_page -1)* v_row); 
set v_filter = concat('%',v_filter,'%');
          

select count(1) into @count from tblgymuser where isActive=1
 and if(v_Branch is null or v_Branch='',1,find_in_set(bid,v_Branch)) 
 and if(v_filter is null or v_filter='',1,concat( ifnull(gymnumber,''),ifnull(`Name`,'') ) like v_filter);
 select @count as Count,UserId,Name, EmailId,DOB,Address,bid,
 (select Place from tbbranch where  bid=tu.bid limit 1) as bName,CreatedDate ,DATE_FORMAT(JoinDate,'%d/%m/%Y') as JoinDate, height, weight,
 (SELECT DATE_FORMAT(ExpireDate,'%d/%m/%Y')  FROM tblusersubscription us where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by UserSid desc limit 1) 
 as ExpireDate,
 (Select ( DATEDIFF(ExpireDate,CURDATE())) FROM tblusersubscription us where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by UserSid desc limit 1)
 as ExpireDays,
 concat('MZ',UserId) as id,filename,displayfilename
 
 from tblgymuser tu where isActive=1  and if(v_Branch is null or v_Branch='',1,find_in_set(bid,v_Branch)) 
 and if(v_filter is null or v_filter='',1,concat( ifnull(gymnumber,''),ifnull(`Name`,'') ) like v_filter) order by 
 ifnull((Select ( DATEDIFF(ExpireDate,CURDATE())) FROM tblusersubscription us where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by UserSid desc limit 1),'zzzzz'),
 ifnull(UpdatedDate,CreatedDate) desc limit  v_row offset v_page;  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_saveUser` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveUser`(
v_UserId bigint(20),
v_Name longtext,
v_EmailId longtext,
v_DOB varchar(45),
v_Address varchar(45),
v_bid bigint(20),
v_phone varchar(45),
v_JoinDate varchar(45),
v_height varchar(45),
v_weight varchar(45),
v_CreatedBy bigint(20)
)
BEGIN

if v_UserId=0  then 	
	-- insert into tbluser (Name) 
    INSERT INTO tblgymuser(Name,EmailId,DOB,Address,phone,bid,CreatedDate,CreatedBy,isActive,JoinDate,height,weight)
    VALUES( v_Name, v_EmailId, if( v_DOB is null or v_DOB='',null, STR_TO_DATE(v_DOB,'%d/%m/%Y')), v_Address, v_phone, 
    v_bid, UTC_TIMESTAMP(), v_CreatedBy, 1, if(v_JoinDate is null or v_JoinDate='',null,STR_TO_DATE(v_JoinDate,'%d/%m/%Y')), v_height, v_weight);
    select LAST_INSERT_ID() as UserId, '200' as scode;
else
	
    UPDATE tblgymuser SET  Name = v_Name,EmailId = v_EmailId,DOB =  if( v_DOB is null or v_DOB='',null, STR_TO_DATE(v_DOB,'%d/%m/%Y')),
    Address = v_Address,
    phone = v_phone,bid = v_bid, UpdatedDate = UTC_TIMESTAMP(), 
    UpdatedBy = v_CreatedBy ,JoinDate =  if(v_JoinDate is null or v_JoinDate='',null,STR_TO_DATE(v_JoinDate,'%d/%m/%Y')),
    height = v_height,weight = v_weight WHERE UserId = v_UserId;
	select v_UserId as UserId, '200' as scode;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_subs_del` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subs_del`(
v_Sid bigint(20),
v_UserId bigint(20)
)
BEGIN


if exists(select 1 from tblsubscription where Sid=v_Sid and isActive=1) then
	update tblsubscription set isActive=0, UpdatedDate=UTC_TIMESTAMP(),UpdatedBy=v_UserId where Sid=v_Sid;
	select '200' as scode;
else
	select '400' as scode;
end if;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_subs_list` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subs_list`(
v_bid int
)
BEGIN

SELECT Sid, Name,   NoOfDays,    Amount,    SType,    bid ,
(select Name from tbbranch sbr where sbr.bid=sub.bid and isActive=1) as branchname,
case when ptype =1 then 'Fees'
	 when ptype =2 then 'Personal Trainee'
     when ptype =3 then 'Diet' else '' end as SubType,period,ptype

FROM  tblsubscription sub where isActive=1 and if(v_bid>0,bid=v_bid,1);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_subs_save` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subs_save`(
v_Sid bigint(20),
v_NoOfDays int,
v_Amount decimal(10,2),
v_SType int,
v_bid int,
v_CreatedBy bigint(20),
v_Name varchar(45),
v_period int,
v_ptype int
)
BEGIN

if (v_Sid = 0) then
		if exists(select 1 from tblsubscription where Name=v_Name and isActive=1) then
			select '400' as scode, 0 as Sid;
        else
			INSERT INTO tblsubscription ( Name, NoOfDays, Amount, SType, bid, CreatedDate, CreatedBy, isActive,ptype, period) VALUES 
			( v_Name, v_NoOfDays , v_Amount , v_SType , v_bid , UTC_TIMESTAMP() , v_CreatedBy  , 1,v_ptype , v_period); 
			select LAST_INSERT_ID() as Sid,'200' as scode;
        end if;
else

	if exists(select 1 from tblsubscription where Sid  <>  v_Sid and Name = v_Name and isActive =1 ) then
		select 0 as Sid,'400' as scode;
    else
		UPDATE   tblsubscription 
		SET
		Name = v_Name,
		 NoOfDays  =  v_NoOfDays,
		 Amount  =  v_Amount,
		 SType  =  v_SType,
		 bid  =  v_bid, 
		 UpdatedDate  =  UTC_TIMESTAMP(),
		 ptype = v_ptype,
         period = v_period,
		 UpdatedBy  =  v_CreatedBy
		  
		WHERE  Sid  =  v_Sid;
		select v_Sid as Sid,'200' as scode;
	end if;
	
end if;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_getbyid` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_getbyid`(
v_UserId bigint(20)
)
BEGIN

 select @count as Count,UserId,Name, EmailId,DOB,Address,bid,
 (select Place from tbbranch where  bid=tu.bid limit 1) as bName,CreatedDate ,DATE_FORMAT(JoinDate,'%d/%m/%Y') as JoinDate, height, weight,
 '1 days' as ExpireDays,concat('MZ',UserId) as id,filename,displayfilename
 
 from tblgymuser tu where UserId = v_UserId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_subs_delete` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_subs_delete`(
v_UserSid bigint(20),
v_DeletedBy bigint(20),
v_DeleteReason longtext
)
BEGIN


if exists(select 1 from tblusersubscription where UserSid=v_UserSid and isActive=1) then
	
    update tblusersubscription set isActive=0, DeletedDate=UTC_TIMESTAMP(),DeletedBy= v_DeletedBy, DeleteReason=v_DeleteReason
    where UserSid=v_UserSid;
	select '200' as scode;
else
	select '400' as scode;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_subs_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_subs_list`(
v_UserId bigint(20),
v_page int,
v_row int
)
BEGIN

declare v_count int default 0;
set v_row=if(v_row<=0,10,v_row);
set  v_page =((v_page -1)* v_row); 

select count(1) into v_count from
tblusersubscription where isActive=1  and if(v_UserId =0, 1, UserId=v_UserId);


select v_count as count, UserSid, UserId, Sid, DATE_FORMAT(JoinDate,'%d/%m/%Y')  as JoinDate, 
DATE_FORMAT(ExpireDate,'%d/%m/%Y')  as ExpireDate, SType, PaidAmount, PaymentStatus, Notes,
(select Name from tblgymuser gu where gu. UserId=us.UserId ) as UserName,
(select Name from gymadmin ga where ga. UserId=us.UserId) as PaidBy,
case when SType =1 then 'Fees'
	 when SType =2 then 'Personal Trainee'
     when SType =3 then 'Diet' else '' end as SubType


 from
tblusersubscription us where isActive=1  and if(v_UserId =0, 1, UserId=v_UserId) order by ifnull(UpdatedDate,CreatedDate) desc 
   limit  v_row offset v_page
  ;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_subs_pay` */;
ALTER DATABASE `gymmanagement` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_subs_pay`(
v_UserId bigint(20),
v_Sid bigint(20),
v_JoinDate varchar(45),
v_ExpireDate varchar(45),
v_SType int,
v_PaidAmount decimal(14,4),
v_PaymentStatus int,
v_CreatedBy bigint(20),
v_Notes longtext

)
BEGIN


 
	INSERT INTO tblusersubscription(UserId,Sid,JoinDate,ExpireDate,SType,PaidAmount,PaymentStatus,
    CreatedBy,CreatedDate,isActive,Notes)VALUES(v_UserId,v_Sid,if(v_JoinDate is null or v_JoinDate='',null,str_to_date(v_JoinDate,'%d/%m/%Y')),
    if(v_ExpireDate is null or v_ExpireDate='',null,str_to_date(v_ExpireDate,'%d/%m/%Y')),v_SType,v_PaidAmount,
    v_PaymentStatus,v_CreatedBy,UTC_TIMESTAMP(),1,v_Notes);

	select '200' as scode;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `gymmanagement` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-02 22:22:46
