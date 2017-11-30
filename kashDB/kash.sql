-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: kash
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `BILL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `GROUPS_ID` int(11) DEFAULT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  `SUB_CATEGORY_ID` int(11) DEFAULT NULL,
  `BILL_DESCRIPTION` varchar(200) NOT NULL,
  `BILL_AMOUNT` decimal(10,0) NOT NULL,
  `BILL_DATE` datetime(6) NOT NULL,
  `BILL_LASTED_UPDATED_ON` datetime(6) DEFAULT NULL,
  `BILL_NOTE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`BILL_ID`),
  UNIQUE KEY `BILL_ID_UNIQUE` (`BILL_ID`),
  KEY `FK_BILL_USER_ID_idx` (`USER_ID`),
  KEY `FK_BILL_GROUPS_ID_idx` (`GROUPS_ID`),
  KEY `FK_BILL_CATEGORY_ID_idx` (`CATEGORY_ID`),
  KEY `FK_BILL_SUB_CATEGORY_ID_idx` (`SUB_CATEGORY_ID`),
  CONSTRAINT `FK_BILL_CATEGORY_ID` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_BILL_GROUPS_ID` FOREIGN KEY (`GROUPS_ID`) REFERENCES `groups` (`GROUP_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_BILL_SUB_CATEGORY_ID` FOREIGN KEY (`SUB_CATEGORY_ID`) REFERENCES `subcategory` (`SUB_CATEGORY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_BILL_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  UNIQUE KEY `CATEGORY_ID_UNIQUE` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `GROUP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` int(11) NOT NULL,
  `GROUP_NAME` varchar(100) NOT NULL,
  `GROUP_DESCRIPTION` varchar(100) DEFAULT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`),
  UNIQUE KEY `GROUP_ID_UNIQUE` (`GROUP_ID`),
  KEY `GROUP_USER_ID_idx` (`USER_ID`),
  KEY `GROUP_CATEGORY_ID_idx` (`CATEGORY_ID`),
  CONSTRAINT `FK_GROUPS_CATEGORY_ID` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_GROUPS_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory` (
  `SUB_CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` int(11) NOT NULL,
  `SUB_CATEGORY_NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`SUB_CATEGORY_ID`),
  UNIQUE KEY `SUB_CATEGORY_ID_UNIQUE` (`SUB_CATEGORY_ID`),
  KEY `FK_CATEGORY_ID_idx` (`CATEGORY_ID`),
  CONSTRAINT `FK_SUB_CATEGORY_CATEGORY_ID` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `TESTNO` int(11) NOT NULL,
  `TESTMESSAGE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TESTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(30) NOT NULL,
  `LAST_NAME` varchar(45) NOT NULL,
  `USER_EMAIL` varchar(100) NOT NULL,
  `USER_PASSWORD` varchar(45) NOT NULL,
  `USER_PHONE` bigint(10) DEFAULT NULL,
  `CREATED_ON` datetime NOT NULL,
  `UPDATED_ON` datetime DEFAULT NULL,
  `PASSWORD_UPDATED_ON` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USER_ID_UNIQUE` (`USER_ID`),
  UNIQUE KEY `USEREMAIL_UNIQUE` (`USER_EMAIL`)
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
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `USER_GROUP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_GROUP_ID`),
  UNIQUE KEY `USER_GROUP_ID_UNIQUE` (`USER_GROUP_ID`),
  KEY `FK_GROUP_ID_idx` (`GROUP_ID`),
  KEY `FK_USER_ID_idx` (`USER_ID`),
  CONSTRAINT `FK_GROUPS_ID` FOREIGN KEY (`GROUP_ID`) REFERENCES `groups` (`GROUP_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-05 17:29:57
