CREATE DATABASE  IF NOT EXISTS `skillo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `skillo`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: skillo
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `qualification_temp`
--

DROP TABLE IF EXISTS `qualification_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualification_temp` (
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification_temp`
--

LOCK TABLES `qualification_temp` WRITE;
/*!40000 ALTER TABLE `qualification_temp` DISABLE KEYS */;
INSERT INTO `qualification_temp` VALUES ('16th Edition','',''),('17th Edition','',''),('180 Driver','',''),('360 Driver Above 10 Tonnes','',''),('360 Driver Bellow 10 Tonnes','',''),('Abrasive Wheel','',''),('Area A','',''),('Asbestos Awareness','',''),('Asphalt Worker','',''),('Banksman','',''),('BBMV Induction','',''),('Bending Machine','',''),('Bricklayer','',''),('Bulldozer Driver','',''),('Cable Puller','',''),('Carpenter','',''),('CC (Crane Controller)','','CC\r'),('CCDO (Demolition Operative)','','CCDO\r'),('CCNSG Card','',''),('Ceiling Fixer','',''),('Chain Saw (Slipper Ends)','',''),('Cherry Picker','',''),('CISRS','','CISRS\r'),('Cleaner','',''),('Concrete Finisher','',''),('Coss','','COSS\r'),('CP1','','CP1\r'),('CP2','','CP2\r'),('CP3','','CP3\r'),('CPCS','','CPCS\r'),('Crane Operator','',''),('Crane Supervisor','',''),('CSCS','','CSCS\r'),('Deep Drainage','',''),('Demolition Labour','',''),('Depot Accustomed','',''),('DLR','','DLR\r'),('Dryliner','',''),('Dump Truck','',''),('Dumper Driver','',''),('ECS','','ECS\r'),('Electrical Tester','',''),('Electrician Lv 2','',''),('Electrician Lv 3','',''),('Electrician Mate','',''),('ES (Engineering Supervisor)','','ES\r'),('EUSR','','EUSR\r'),('F-Gas','',''),('FA1 (Emergency First Aid)','',''),('FA3 (First Aid at Work)','',''),('Fire Marshal','',''),('Fire Protection','',''),('Firewatcher','',''),('Foreman','',''),('Forklift Driver','',''),('Forward Tipping Dumper','',''),('Ganger','',''),('Gas Engineer','',''),('Ground Worker','',''),('Hand Signaller','',''),('Hand Trolley','',''),('Handyman','',''),('HGV Class 1','',''),('HGV Class 2','',''),('Hiab','',''),('Hod Carrier','',''),('Hoist Driver','',''),('HV Assessor','',''),('HV Competent','',''),('Icats (Industrial Painter)','',''),('IOSH Managing Safely','',''),('Ipaf','',''),('IRSE Installer','',''),('JIB','',''),('Joiner','',''),('Kerb Layer','',''),('Kitchen Fitter','',''),('L&amp;E (Lift and Escalator)','',''),('Labourer','',''),('Lantra Traffic Supervisor','',''),('Leading Edge','',''),('Level Crossing Attendant','',''),('Loco Driver','',''),('Lookout','',''),('Lucas','',''),('Lv 1 Stressing','',''),('Lv 2 Stressing','',''),('Lv 3 Stressing','',''),('Manual Handling','',''),('Mastic Asphalt Lv 3','',''),('MC (Machine Controller)','',''),('MEWPs','','MEWPs\r'),('MOD 5 Test Assistant','',''),('Multitrader','',''),('Murphy Induction','',''),('NEBOSH','','NEBOSH\r'),('NICEIC Tester','',''),('NPORS','','NPORS\r'),('NPTC CS30 (Chainsaw)','','NPTC CS30\r'),('NPTC CS31 (Strimmer)','','NPTC CS31\r'),('NPTC CS38(Aerial Rescue)','','NPTC CS38\r'),('OTP Operator','','OTP Operator\r'),('Painter','',''),('Pasma','',''),('Paver','',''),('PC (Protection Controller)','','PC\r'),('PICOP ','','PICOP \r'),('PICOW','','PICOW\r'),('Pipe Layer','',''),('Plasterer','',''),('Plate layer','',''),('Plumber','',''),('Plumber Mate','',''),('PM (Protection Master)','','PM \r'),('Points Operator','',''),('Project Manager','',''),('PTS','',''),('Pyro Electrician','',''),('Quaf54','',''),('RD4000','','RD4000\r'),('RD8000','','RD8000\r'),('Roller Driver','',''),('Roofer','',''),('Rubber Duck Driver','',''),('SAC (Site Access Controller)','',''),('Safe Isolation Level 3','',''),('Scaffolder Advanced','',''),('Scaffolder Part 1','',''),('Scaffolder Part 2','',''),('Scissor Lift','',''),('Screeder','',''),('Setting out Engineer','',''),('Shuttering Carpenter','',''),('SIA','','SIA\r'),('Site Agent','',''),('Site Fitter','',''),('Site Manager','',''),('Slab Layer','',''),('Slinger','',''),('Small Tools','',''),('SMSTS','','SMSTS\r'),('SPC (Site Person in Charge)','','SPC\r'),('SPICOP','','SPICOP\r'),('SSOWP (SSOW Planner)','','SSOWP\r'),('SSSTS','','SSSTS\r'),('Steel  Fixer','',''),('Steel Erector','',''),('Storeman','',''),('Strapman','',''),('Street Works Supervisor','',''),('Street Works Ticket','',''),('Striker','',''),('Strimmer Ticket','',''),('Substation Restricted','',''),('Substation Unrestricted','',''),('T001 (Track Inspection)','',''),('T002/003 (Handback Engineer)','',''),('T004 (Handback lines up to 125mph)','',''),('T006 TANC','',''),('Tandem Lift','',''),('Tape & Joiner','',''),('Telehandler','',''),('Thames Water Safety Passport','',''),('Thameslink Inducted','',''),('Tiler','',''),('Track Accustomed','',''),('Track Induction','',''),('Track Trolley','',''),('Track/Depot Accustomed','',''),('Trackman','',''),('Tractor Driver','',''),('Traffic marshal','',''),('Tramlink Possession Super','',''),('Tramlink Worksite Super','',''),('TSC (Tunnel  Safety  card)','','TSC \r'),('UKPN SSR2 Project Induction','',''),('UKPN/Murphy SPC Briefing','',''),('Vinci Ealing Common Induction','',''),('Vinci Victoria Dock Induction','',''),('Welder','',''),('Wheeled Loading Shovel','',''),('Window Fixer','',''),('Working at Height','','');
/*!40000 ALTER TABLE `qualification_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_code_temp`
--

DROP TABLE IF EXISTS `post_code_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_code_temp` (
  `postcode` varchar(255) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `easting` bigint(20) DEFAULT NULL,
  `northing` bigint(20) DEFAULT NULL,
  `grind_ref` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `district_code` varchar(255) DEFAULT NULL,
  `ward_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  UNIQUE KEY `postcode` (`postcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_code_temp`
--

LOCK TABLES `post_code_temp` WRITE;
/*!40000 ALTER TABLE `post_code_temp` DISABLE KEYS */;
INSERT INTO `post_code_temp` VALUES ('AB10 1AA',57.148235,-2.096648,394251,806376,'NJ942063','','Aberdeen City','George St/Harbour Ward',' S12000033','S13002483','Scotland',''),('AB10 1AB',57.149079,-2.096964,394232,806470,'NJ942064','','Aberdeen City','George St/Harbour Ward',' S12000033','S13002483','Scotland',''),('AB10 1AF',57.14871,-2.097806,394181,806429,'NJ941064','','Aberdeen City','George St/Harbour Ward',' S12000033','S13002483','Scotland',''),('AB10 1AG',57.148235,-2.096648,394251,806376,'NJ942063','','Aberdeen City','George St/Harbour Ward',' S12000033','S13002483','Scotland',''),('AB10 1AH',57.148084,-2.094665,394371,806359,'NJ943063','','Aberdeen City','George St/Harbour Ward',' S12000033','S13002483','Scotland',''),('AB10 1AJ',57.14871,-2.097806,394181,806429,'NJ941064','','Aberdeen City','George St/Harbour Ward',' S12000033','S13002483','Scotland',''),('AB10 1AL',57.149619,-2.09533,394331,806530,'NJ943065','','Aberdeen City','George St/Harbour Ward',' S12000033','S13002483','Scotland',''),('AB10 1AN',57.149727,-2.094735,394367,806542,'NJ943065','','Aberdeen City','George St/Harbour Ward',' S12000033','S13002483','Scotland',''),('AB10 1AP',57.148667,-2.095988,394291,806424,'NJ942064','','Aberdeen City','George St/Harbour Ward',' S12000033','S13002483','Scotland',''),('AB10 1AQ',57.148084,-2.094665,394371,806359,'NJ943063','','Aberdeen City','George St/Harbour Ward',' S12000033','S13002483','Scotland',''),('AB10 1AR',57.148084,-2.094665,394371,806359,'NJ943063','','Aberdeen City','George St/Harbour Ward',' S12000033','S13002483','Scotland',''),('AB10 1AS',57.148324,-2.097508,394199,806386,'NJ941063','','Aberdeen City','George St/Harbour Ward',' S12000033','S13002483','Scotland','');
/*!40000 ALTER TABLE `post_code_temp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-27 15:47:12
