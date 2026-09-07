-- MySQL dump 10.13  Distrib 8.4.11, for Linux (x86_64)
--
-- Host: localhost    Database: nautobot
-- ------------------------------------------------------
-- Server version	8.4.11

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'nautobot-default-scheduledjob-approver'),(3,'nautobot-default-scheduledjob-architect'),(2,'nautobot-default-scheduledjob-operator');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=767 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',40,'add_permission'),(2,'Can change permission',40,'change_permission'),(3,'Can delete permission',40,'delete_permission'),(4,'Can view permission',40,'view_permission'),(5,'Can add group',41,'add_group'),(6,'Can change group',41,'change_group'),(7,'Can delete group',41,'delete_group'),(8,'Can view group',41,'view_group'),(9,'Can add content type',42,'add_contenttype'),(10,'Can change content type',42,'change_contenttype'),(11,'Can delete content type',42,'delete_contenttype'),(12,'Can view content type',42,'view_contenttype'),(13,'Can add session',43,'add_session'),(14,'Can change session',43,'change_session'),(15,'Can delete session',43,'delete_session'),(16,'Can view session',43,'view_session'),(17,'Can add association',44,'add_association'),(18,'Can change association',44,'change_association'),(19,'Can delete association',44,'delete_association'),(20,'Can view association',44,'view_association'),(21,'Can add code',45,'add_code'),(22,'Can change code',45,'change_code'),(23,'Can delete code',45,'delete_code'),(24,'Can view code',45,'view_code'),(25,'Can add nonce',46,'add_nonce'),(26,'Can change nonce',46,'change_nonce'),(27,'Can delete nonce',46,'delete_nonce'),(28,'Can view nonce',46,'view_nonce'),(29,'Can add user social auth',47,'add_usersocialauth'),(30,'Can change user social auth',47,'change_usersocialauth'),(31,'Can delete user social auth',47,'delete_usersocialauth'),(32,'Can view user social auth',47,'view_usersocialauth'),(33,'Can add partial',48,'add_partial'),(34,'Can change partial',48,'change_partial'),(35,'Can delete partial',48,'delete_partial'),(36,'Can view partial',48,'view_partial'),(37,'Can add tag',49,'add_tag'),(38,'Can change tag',49,'change_tag'),(39,'Can delete tag',49,'delete_tag'),(40,'Can view tag',49,'view_tag'),(41,'Can add tagged item',50,'add_taggeditem'),(42,'Can change tagged item',50,'change_taggeditem'),(43,'Can delete tagged item',50,'delete_taggeditem'),(44,'Can view tagged item',50,'view_taggeditem'),(45,'Can add constance',51,'add_constance'),(46,'Can change constance',51,'change_constance'),(47,'Can delete constance',51,'delete_constance'),(48,'Can view constance',51,'view_constance'),(49,'Can change config',51,'change_config'),(50,'Can view config',51,'view_config'),(51,'Can add log entry',53,'add_logentry'),(52,'Can change log entry',53,'change_logentry'),(53,'Can delete log entry',53,'delete_logentry'),(54,'Can view log entry',53,'view_logentry'),(55,'Can add crontab',54,'add_crontabschedule'),(56,'Can change crontab',54,'change_crontabschedule'),(57,'Can delete crontab',54,'delete_crontabschedule'),(58,'Can view crontab',54,'view_crontabschedule'),(59,'Can add interval',55,'add_intervalschedule'),(60,'Can change interval',55,'change_intervalschedule'),(61,'Can delete interval',55,'delete_intervalschedule'),(62,'Can view interval',55,'view_intervalschedule'),(63,'Can add periodic task',56,'add_periodictask'),(64,'Can change periodic task',56,'change_periodictask'),(65,'Can delete periodic task',56,'delete_periodictask'),(66,'Can view periodic task',56,'view_periodictask'),(67,'Can add periodic task track',57,'add_periodictasks'),(68,'Can change periodic task track',57,'change_periodictasks'),(69,'Can delete periodic task track',57,'delete_periodictasks'),(70,'Can view periodic task track',57,'view_periodictasks'),(71,'Can add solar event',58,'add_solarschedule'),(72,'Can change solar event',58,'change_solarschedule'),(73,'Can delete solar event',58,'delete_solarschedule'),(74,'Can view solar event',58,'view_solarschedule'),(75,'Can add clocked',59,'add_clockedschedule'),(76,'Can change clocked',59,'change_clockedschedule'),(77,'Can delete clocked',59,'delete_clockedschedule'),(78,'Can view clocked',59,'view_clockedschedule'),(79,'Can add task result',60,'add_taskresult'),(80,'Can change task result',60,'change_taskresult'),(81,'Can delete task result',60,'delete_taskresult'),(82,'Can view task result',60,'view_taskresult'),(83,'Can add chord counter',61,'add_chordcounter'),(84,'Can change chord counter',61,'change_chordcounter'),(85,'Can delete chord counter',61,'delete_chordcounter'),(86,'Can view chord counter',61,'view_chordcounter'),(87,'Can add group result',62,'add_groupresult'),(88,'Can change group result',62,'change_groupresult'),(89,'Can delete group result',62,'delete_groupresult'),(90,'Can view group result',62,'view_groupresult'),(91,'Can add circuit',1,'add_circuit'),(92,'Can change circuit',1,'change_circuit'),(93,'Can delete circuit',1,'delete_circuit'),(94,'Can view circuit',1,'view_circuit'),(95,'Can add circuit termination',63,'add_circuittermination'),(96,'Can change circuit termination',63,'change_circuittermination'),(97,'Can delete circuit termination',63,'delete_circuittermination'),(98,'Can view circuit termination',63,'view_circuittermination'),(99,'Can add circuit type',64,'add_circuittype'),(100,'Can change circuit type',64,'change_circuittype'),(101,'Can delete circuit type',64,'delete_circuittype'),(102,'Can view circuit type',64,'view_circuittype'),(103,'Can add provider',65,'add_provider'),(104,'Can change provider',65,'change_provider'),(105,'Can delete provider',65,'delete_provider'),(106,'Can view provider',65,'view_provider'),(107,'Can add provider network',66,'add_providernetwork'),(108,'Can change provider network',66,'change_providernetwork'),(109,'Can delete provider network',66,'delete_providernetwork'),(110,'Can view provider network',66,'view_providernetwork'),(111,'Can add cloud account',67,'add_cloudaccount'),(112,'Can change cloud account',67,'change_cloudaccount'),(113,'Can delete cloud account',67,'delete_cloudaccount'),(114,'Can view cloud account',67,'view_cloudaccount'),(115,'Can add cloud network',68,'add_cloudnetwork'),(116,'Can change cloud network',68,'change_cloudnetwork'),(117,'Can delete cloud network',68,'delete_cloudnetwork'),(118,'Can view cloud network',68,'view_cloudnetwork'),(119,'Can add cloud resource type',69,'add_cloudresourcetype'),(120,'Can change cloud resource type',69,'change_cloudresourcetype'),(121,'Can delete cloud resource type',69,'delete_cloudresourcetype'),(122,'Can view cloud resource type',69,'view_cloudresourcetype'),(123,'Can add cloud service',70,'add_cloudservice'),(124,'Can change cloud service',70,'change_cloudservice'),(125,'Can delete cloud service',70,'delete_cloudservice'),(126,'Can view cloud service',70,'view_cloudservice'),(127,'Can add cloud network prefix assignment',71,'add_cloudnetworkprefixassignment'),(128,'Can change cloud network prefix assignment',71,'change_cloudnetworkprefixassignment'),(129,'Can delete cloud network prefix assignment',71,'delete_cloudnetworkprefixassignment'),(130,'Can view cloud network prefix assignment',71,'view_cloudnetworkprefixassignment'),(131,'Can add cloud service network assignment',72,'add_cloudservicenetworkassignment'),(132,'Can change cloud service network assignment',72,'change_cloudservicenetworkassignment'),(133,'Can delete cloud service network assignment',72,'delete_cloudservicenetworkassignment'),(134,'Can view cloud service network assignment',72,'view_cloudservicenetworkassignment'),(135,'Can add unique validation rule',73,'add_uniquevalidationrule'),(136,'Can change unique validation rule',73,'change_uniquevalidationrule'),(137,'Can delete unique validation rule',73,'delete_uniquevalidationrule'),(138,'Can view unique validation rule',73,'view_uniquevalidationrule'),(139,'Can add required validation rule',74,'add_requiredvalidationrule'),(140,'Can change required validation rule',74,'change_requiredvalidationrule'),(141,'Can delete required validation rule',74,'delete_requiredvalidationrule'),(142,'Can view required validation rule',74,'view_requiredvalidationrule'),(143,'Can add regular expression validation rule',75,'add_regularexpressionvalidationrule'),(144,'Can change regular expression validation rule',75,'change_regularexpressionvalidationrule'),(145,'Can delete regular expression validation rule',75,'delete_regularexpressionvalidationrule'),(146,'Can view regular expression validation rule',75,'view_regularexpressionvalidationrule'),(147,'Can add min max validation rule',76,'add_minmaxvalidationrule'),(148,'Can change min max validation rule',76,'change_minmaxvalidationrule'),(149,'Can delete min max validation rule',76,'delete_minmaxvalidationrule'),(150,'Can view min max validation rule',76,'view_minmaxvalidationrule'),(151,'Can add data compliance',77,'add_datacompliance'),(152,'Can change data compliance',77,'change_datacompliance'),(153,'Can delete data compliance',77,'delete_datacompliance'),(154,'Can view data compliance',77,'view_datacompliance'),(155,'Can add cable',2,'add_cable'),(156,'Can change cable',2,'change_cable'),(157,'Can delete cable',2,'delete_cable'),(158,'Can view cable',2,'view_cable'),(159,'Can add cable path',78,'add_cablepath'),(160,'Can change cable path',78,'change_cablepath'),(161,'Can delete cable path',78,'delete_cablepath'),(162,'Can view cable path',78,'view_cablepath'),(163,'Can add console port',79,'add_consoleport'),(164,'Can change console port',79,'change_consoleport'),(165,'Can delete console port',79,'delete_consoleport'),(166,'Can view console port',79,'view_consoleport'),(167,'Can add console port template',80,'add_consoleporttemplate'),(168,'Can change console port template',80,'change_consoleporttemplate'),(169,'Can delete console port template',80,'delete_consoleporttemplate'),(170,'Can view console port template',80,'view_consoleporttemplate'),(171,'Can add console server port',81,'add_consoleserverport'),(172,'Can change console server port',81,'change_consoleserverport'),(173,'Can delete console server port',81,'delete_consoleserverport'),(174,'Can view console server port',81,'view_consoleserverport'),(175,'Can add console server port template',82,'add_consoleserverporttemplate'),(176,'Can change console server port template',82,'change_consoleserverporttemplate'),(177,'Can delete console server port template',82,'delete_consoleserverporttemplate'),(178,'Can view console server port template',82,'view_consoleserverporttemplate'),(179,'Can add device',3,'add_device'),(180,'Can change device',3,'change_device'),(181,'Can delete device',3,'delete_device'),(182,'Can view device',3,'view_device'),(183,'Can add device bay',83,'add_devicebay'),(184,'Can change device bay',83,'change_devicebay'),(185,'Can delete device bay',83,'delete_devicebay'),(186,'Can view device bay',83,'view_devicebay'),(187,'Can add device bay template',84,'add_devicebaytemplate'),(188,'Can change device bay template',84,'change_devicebaytemplate'),(189,'Can delete device bay template',84,'delete_devicebaytemplate'),(190,'Can view device bay template',84,'view_devicebaytemplate'),(191,'Can add device type',85,'add_devicetype'),(192,'Can change device type',85,'change_devicetype'),(193,'Can delete device type',85,'delete_devicetype'),(194,'Can view device type',85,'view_devicetype'),(195,'Can add front port',86,'add_frontport'),(196,'Can change front port',86,'change_frontport'),(197,'Can delete front port',86,'delete_frontport'),(198,'Can view front port',86,'view_frontport'),(199,'Can add front port template',87,'add_frontporttemplate'),(200,'Can change front port template',87,'change_frontporttemplate'),(201,'Can delete front port template',87,'delete_frontporttemplate'),(202,'Can view front port template',87,'view_frontporttemplate'),(203,'Can add interface',13,'add_interface'),(204,'Can change interface',13,'change_interface'),(205,'Can delete interface',13,'delete_interface'),(206,'Can view interface',13,'view_interface'),(207,'Can add interface template',88,'add_interfacetemplate'),(208,'Can change interface template',88,'change_interfacetemplate'),(209,'Can delete interface template',88,'delete_interfacetemplate'),(210,'Can view interface template',88,'view_interfacetemplate'),(211,'Can add inventory item',89,'add_inventoryitem'),(212,'Can change inventory item',89,'change_inventoryitem'),(213,'Can delete inventory item',89,'delete_inventoryitem'),(214,'Can view inventory item',89,'view_inventoryitem'),(215,'Can add manufacturer',90,'add_manufacturer'),(216,'Can change manufacturer',90,'change_manufacturer'),(217,'Can delete manufacturer',90,'delete_manufacturer'),(218,'Can view manufacturer',90,'view_manufacturer'),(219,'Can add platform',91,'add_platform'),(220,'Can change platform',91,'change_platform'),(221,'Can delete platform',91,'delete_platform'),(222,'Can view platform',91,'view_platform'),(223,'Can add power feed',4,'add_powerfeed'),(224,'Can change power feed',4,'change_powerfeed'),(225,'Can delete power feed',4,'delete_powerfeed'),(226,'Can view power feed',4,'view_powerfeed'),(227,'Can add power outlet',92,'add_poweroutlet'),(228,'Can change power outlet',92,'change_poweroutlet'),(229,'Can delete power outlet',92,'delete_poweroutlet'),(230,'Can view power outlet',92,'view_poweroutlet'),(231,'Can add power outlet template',93,'add_poweroutlettemplate'),(232,'Can change power outlet template',93,'change_poweroutlettemplate'),(233,'Can delete power outlet template',93,'delete_poweroutlettemplate'),(234,'Can view power outlet template',93,'view_poweroutlettemplate'),(235,'Can add power panel',94,'add_powerpanel'),(236,'Can change power panel',94,'change_powerpanel'),(237,'Can delete power panel',94,'delete_powerpanel'),(238,'Can view power panel',94,'view_powerpanel'),(239,'Can add power port',95,'add_powerport'),(240,'Can change power port',95,'change_powerport'),(241,'Can delete power port',95,'delete_powerport'),(242,'Can view power port',95,'view_powerport'),(243,'Can add power port template',96,'add_powerporttemplate'),(244,'Can change power port template',96,'change_powerporttemplate'),(245,'Can delete power port template',96,'delete_powerporttemplate'),(246,'Can view power port template',96,'view_powerporttemplate'),(247,'Can add rack',5,'add_rack'),(248,'Can change rack',5,'change_rack'),(249,'Can delete rack',5,'delete_rack'),(250,'Can view rack',5,'view_rack'),(251,'Can add rack group',97,'add_rackgroup'),(252,'Can change rack group',97,'change_rackgroup'),(253,'Can delete rack group',97,'delete_rackgroup'),(254,'Can view rack group',97,'view_rackgroup'),(255,'Can add rack reservation',98,'add_rackreservation'),(256,'Can change rack reservation',98,'change_rackreservation'),(257,'Can delete rack reservation',98,'delete_rackreservation'),(258,'Can view rack reservation',98,'view_rackreservation'),(259,'Can add rear port',99,'add_rearport'),(260,'Can change rear port',99,'change_rearport'),(261,'Can delete rear port',99,'delete_rearport'),(262,'Can view rear port',99,'view_rearport'),(263,'Can add rear port template',100,'add_rearporttemplate'),(264,'Can change rear port template',100,'change_rearporttemplate'),(265,'Can delete rear port template',100,'delete_rearporttemplate'),(266,'Can view rear port template',100,'view_rearporttemplate'),(267,'Can add virtual chassis',101,'add_virtualchassis'),(268,'Can change virtual chassis',101,'change_virtualchassis'),(269,'Can delete virtual chassis',101,'delete_virtualchassis'),(270,'Can view virtual chassis',101,'view_virtualchassis'),(271,'Can add location type',102,'add_locationtype'),(272,'Can change location type',102,'change_locationtype'),(273,'Can delete location type',102,'delete_locationtype'),(274,'Can view location type',102,'view_locationtype'),(275,'Can add location',14,'add_location'),(276,'Can change location',14,'change_location'),(277,'Can delete location',14,'delete_location'),(278,'Can view location',14,'view_location'),(279,'Can add device redundancy group',19,'add_deviceredundancygroup'),(280,'Can change device redundancy group',19,'change_deviceredundancygroup'),(281,'Can delete device redundancy group',19,'delete_deviceredundancygroup'),(282,'Can view device redundancy group',19,'view_deviceredundancygroup'),(283,'Can add interface redundancy group',20,'add_interfaceredundancygroup'),(284,'Can change interface redundancy group',20,'change_interfaceredundancygroup'),(285,'Can delete interface redundancy group',20,'delete_interfaceredundancygroup'),(286,'Can view interface redundancy group',20,'view_interfaceredundancygroup'),(287,'Can add interface redundancy group association',103,'add_interfaceredundancygroupassociation'),(288,'Can change interface redundancy group association',103,'change_interfaceredundancygroupassociation'),(289,'Can delete interface redundancy group association',103,'delete_interfaceredundancygroupassociation'),(290,'Can view interface redundancy group association',103,'view_interfaceredundancygroupassociation'),(291,'Can add device family',104,'add_devicefamily'),(292,'Can change device family',104,'change_devicefamily'),(293,'Can delete device family',104,'delete_devicefamily'),(294,'Can view device family',104,'view_devicefamily'),(295,'Can add software version',25,'add_softwareversion'),(296,'Can change software version',25,'change_softwareversion'),(297,'Can delete software version',25,'delete_softwareversion'),(298,'Can view software version',25,'view_softwareversion'),(299,'Can add software image file',24,'add_softwareimagefile'),(300,'Can change software image file',24,'change_softwareimagefile'),(301,'Can delete software image file',24,'delete_softwareimagefile'),(302,'Can view software image file',24,'view_softwareimagefile'),(303,'Can add device type to software image file mapping',105,'add_devicetypetosoftwareimagefile'),(304,'Can change device type to software image file mapping',105,'change_devicetypetosoftwareimagefile'),(305,'Can delete device type to software image file mapping',105,'delete_devicetypetosoftwareimagefile'),(306,'Can view device type to software image file mapping',105,'view_devicetypetosoftwareimagefile'),(307,'Can add controller',26,'add_controller'),(308,'Can change controller',26,'change_controller'),(309,'Can delete controller',26,'delete_controller'),(310,'Can view controller',26,'view_controller'),(311,'Can add controller managed device group',106,'add_controllermanageddevicegroup'),(312,'Can change controller managed device group',106,'change_controllermanageddevicegroup'),(313,'Can delete controller managed device group',106,'delete_controllermanageddevicegroup'),(314,'Can view controller managed device group',106,'view_controllermanageddevicegroup'),(315,'Can add module',27,'add_module'),(316,'Can change module',27,'change_module'),(317,'Can delete module',27,'delete_module'),(318,'Can view module',27,'view_module'),(319,'Can add module bay',107,'add_modulebay'),(320,'Can change module bay',107,'change_modulebay'),(321,'Can delete module bay',107,'delete_modulebay'),(322,'Can view module bay',107,'view_modulebay'),(323,'Can add module bay template',108,'add_modulebaytemplate'),(324,'Can change module bay template',108,'change_modulebaytemplate'),(325,'Can delete module bay template',108,'delete_modulebaytemplate'),(326,'Can view module bay template',108,'view_modulebaytemplate'),(327,'Can add module type',109,'add_moduletype'),(328,'Can change module type',109,'change_moduletype'),(329,'Can delete module type',109,'delete_moduletype'),(330,'Can view module type',109,'view_moduletype'),(331,'Can add interface vdc assignment',110,'add_interfacevdcassignment'),(332,'Can change interface vdc assignment',110,'change_interfacevdcassignment'),(333,'Can delete interface vdc assignment',110,'delete_interfacevdcassignment'),(334,'Can view interface vdc assignment',110,'view_interfacevdcassignment'),(335,'Can add virtual device context',29,'add_virtualdevicecontext'),(336,'Can change virtual device context',29,'change_virtualdevicecontext'),(337,'Can delete virtual device context',29,'delete_virtualdevicecontext'),(338,'Can view virtual device context',29,'view_virtualdevicecontext'),(339,'Can add module family',111,'add_modulefamily'),(340,'Can change module family',111,'change_modulefamily'),(341,'Can delete module family',111,'delete_modulefamily'),(342,'Can view module family',111,'view_modulefamily'),(343,'Can add device cluster assignment',112,'add_deviceclusterassignment'),(344,'Can change device cluster assignment',112,'change_deviceclusterassignment'),(345,'Can delete device cluster assignment',112,'delete_deviceclusterassignment'),(346,'Can view device cluster assignment',112,'view_deviceclusterassignment'),(347,'Can add cable type',113,'add_cabletype'),(348,'Can change cable type',113,'change_cabletype'),(349,'Can delete cable type',113,'delete_cabletype'),(350,'Can view cable type',113,'view_cabletype'),(351,'Can add cable to cable termination',114,'add_cabletocabletermination'),(352,'Can change cable to cable termination',114,'change_cabletocabletermination'),(353,'Can delete cable to cable termination',114,'delete_cabletocabletermination'),(354,'Can view cable to cable termination',114,'view_cabletocabletermination'),(355,'Can add config context',115,'add_configcontext'),(356,'Can change config context',115,'change_configcontext'),(357,'Can delete config context',115,'delete_configcontext'),(358,'Can view config context',115,'view_configcontext'),(359,'Can add custom field',10,'add_customfield'),(360,'Can change custom field',10,'change_customfield'),(361,'Can delete custom field',10,'delete_customfield'),(362,'Can view custom field',10,'view_customfield'),(363,'Can add custom field choice',116,'add_customfieldchoice'),(364,'Can change custom field choice',116,'change_customfieldchoice'),(365,'Can delete custom field choice',116,'delete_customfieldchoice'),(366,'Can view custom field choice',116,'view_customfieldchoice'),(367,'Can add custom link',117,'add_customlink'),(368,'Can change custom link',117,'change_customlink'),(369,'Can delete custom link',117,'delete_customlink'),(370,'Can view custom link',117,'view_customlink'),(371,'Can add export template',118,'add_exporttemplate'),(372,'Can change export template',118,'change_exporttemplate'),(373,'Can delete export template',118,'delete_exporttemplate'),(374,'Can view export template',118,'view_exporttemplate'),(375,'Can add Git repository',119,'add_gitrepository'),(376,'Can change Git repository',119,'change_gitrepository'),(377,'Can delete Git repository',119,'delete_gitrepository'),(378,'Can view Git repository',119,'view_gitrepository'),(379,'Can add image attachment',120,'add_imageattachment'),(380,'Can change image attachment',120,'change_imageattachment'),(381,'Can delete image attachment',120,'delete_imageattachment'),(382,'Can view image attachment',120,'view_imageattachment'),(383,'Can add job result',121,'add_jobresult'),(384,'Can change job result',121,'change_jobresult'),(385,'Can delete job result',121,'delete_jobresult'),(386,'Can view job result',121,'view_jobresult'),(387,'Can add relationship',122,'add_relationship'),(388,'Can change relationship',122,'change_relationship'),(389,'Can delete relationship',122,'delete_relationship'),(390,'Can view relationship',122,'view_relationship'),(391,'Can add tag',123,'add_tag'),(392,'Can change tag',123,'change_tag'),(393,'Can delete tag',123,'delete_tag'),(394,'Can view tag',123,'view_tag'),(395,'Can add webhook',124,'add_webhook'),(396,'Can change webhook',124,'change_webhook'),(397,'Can delete webhook',124,'delete_webhook'),(398,'Can view webhook',124,'view_webhook'),(399,'Can add tagged item',125,'add_taggeditem'),(400,'Can change tagged item',125,'change_taggeditem'),(401,'Can delete tagged item',125,'delete_taggeditem'),(402,'Can view tagged item',125,'view_taggeditem'),(403,'Can add status',126,'add_status'),(404,'Can change status',126,'change_status'),(405,'Can delete status',126,'delete_status'),(406,'Can view status',126,'view_status'),(407,'Can add relationship association',127,'add_relationshipassociation'),(408,'Can change relationship association',127,'change_relationshipassociation'),(409,'Can delete relationship association',127,'delete_relationshipassociation'),(410,'Can view relationship association',127,'view_relationshipassociation'),(411,'Can add object change',128,'add_objectchange'),(412,'Can change object change',128,'change_objectchange'),(413,'Can delete object change',128,'delete_objectchange'),(414,'Can view object change',128,'view_objectchange'),(415,'Can add GraphQL query',129,'add_graphqlquery'),(416,'Can change GraphQL query',129,'change_graphqlquery'),(417,'Can delete GraphQL query',129,'delete_graphqlquery'),(418,'Can view GraphQL query',129,'view_graphqlquery'),(419,'Can add config context schema',130,'add_configcontextschema'),(420,'Can change config context schema',130,'change_configcontextschema'),(421,'Can delete config context schema',130,'delete_configcontextschema'),(422,'Can view config context schema',130,'view_configcontextschema'),(423,'Can add computed field',131,'add_computedfield'),(424,'Can change computed field',131,'change_computedfield'),(425,'Can delete computed field',131,'delete_computedfield'),(426,'Can view computed field',131,'view_computedfield'),(427,'Can add file attachment',132,'add_fileattachment'),(428,'Can change file attachment',132,'change_fileattachment'),(429,'Can delete file attachment',132,'delete_fileattachment'),(430,'Can view file attachment',132,'view_fileattachment'),(431,'Can add file proxy',133,'add_fileproxy'),(432,'Can change file proxy',133,'change_fileproxy'),(433,'Can delete file proxy',133,'delete_fileproxy'),(434,'Can view file proxy',133,'view_fileproxy'),(435,'Can add health check test model',134,'add_healthchecktestmodel'),(436,'Can change health check test model',134,'change_healthchecktestmodel'),(437,'Can delete health check test model',134,'delete_healthchecktestmodel'),(438,'Can view health check test model',134,'view_healthchecktestmodel'),(439,'Can add scheduled jobs',135,'add_scheduledjobs'),(440,'Can change scheduled jobs',135,'change_scheduledjobs'),(441,'Can delete scheduled jobs',135,'delete_scheduledjobs'),(442,'Can view scheduled jobs',135,'view_scheduledjobs'),(443,'Can add scheduled job',35,'add_scheduledjob'),(444,'Can change scheduled job',35,'change_scheduledjob'),(445,'Can delete scheduled job',35,'delete_scheduledjob'),(446,'Can view scheduled job',35,'view_scheduledjob'),(447,'Can add secret',136,'add_secret'),(448,'Can change secret',136,'change_secret'),(449,'Can delete secret',136,'delete_secret'),(450,'Can view secret',136,'view_secret'),(451,'Can add secrets group',137,'add_secretsgroup'),(452,'Can change secrets group',137,'change_secretsgroup'),(453,'Can delete secrets group',137,'delete_secretsgroup'),(454,'Can view secrets group',137,'view_secretsgroup'),(455,'Can add secrets group association',138,'add_secretsgroupassociation'),(456,'Can change secrets group association',138,'change_secretsgroupassociation'),(457,'Can delete secrets group association',138,'delete_secretsgroupassociation'),(458,'Can view secrets group association',138,'view_secretsgroupassociation'),(459,'Can add job log entry',139,'add_joblogentry'),(460,'Can change job log entry',139,'change_joblogentry'),(461,'Can delete job log entry',139,'delete_joblogentry'),(462,'Can view job log entry',139,'view_joblogentry'),(463,'Can add job',11,'add_job'),(464,'Can change job',11,'change_job'),(465,'Can delete job',11,'delete_job'),(466,'Can view job',11,'view_job'),(467,'Can add dynamic group',52,'add_dynamicgroup'),(468,'Can change dynamic group',52,'change_dynamicgroup'),(469,'Can delete dynamic group',52,'delete_dynamicgroup'),(470,'Can view dynamic group',52,'view_dynamicgroup'),(471,'Can add dynamic group membership',140,'add_dynamicgroupmembership'),(472,'Can change dynamic group membership',140,'change_dynamicgroupmembership'),(473,'Can delete dynamic group membership',140,'delete_dynamicgroupmembership'),(474,'Can view dynamic group membership',140,'view_dynamicgroupmembership'),(475,'Can add note',141,'add_note'),(476,'Can change note',141,'change_note'),(477,'Can delete note',141,'delete_note'),(478,'Can view note',141,'view_note'),(479,'Can add job hook',142,'add_jobhook'),(480,'Can change job hook',142,'change_jobhook'),(481,'Can delete job hook',142,'delete_jobhook'),(482,'Can view job hook',142,'view_jobhook'),(483,'Can add job button',143,'add_jobbutton'),(484,'Can change job button',143,'change_jobbutton'),(485,'Can delete job button',143,'delete_jobbutton'),(486,'Can view job button',143,'view_jobbutton'),(487,'Can add role',16,'add_role'),(488,'Can change role',16,'change_role'),(489,'Can delete role',16,'delete_role'),(490,'Can view role',16,'view_role'),(491,'Can add external integration',144,'add_externalintegration'),(492,'Can change external integration',144,'change_externalintegration'),(493,'Can delete external integration',144,'delete_externalintegration'),(494,'Can view external integration',144,'view_externalintegration'),(495,'Can add contact',145,'add_contact'),(496,'Can change contact',145,'change_contact'),(497,'Can delete contact',145,'delete_contact'),(498,'Can view contact',145,'view_contact'),(499,'Can add team',146,'add_team'),(500,'Can change team',146,'change_team'),(501,'Can delete team',146,'delete_team'),(502,'Can view team',146,'view_team'),(503,'Can add contact association',23,'add_contactassociation'),(504,'Can change contact association',23,'change_contactassociation'),(505,'Can delete contact association',23,'delete_contactassociation'),(506,'Can view contact association',23,'view_contactassociation'),(507,'Can add static group association',147,'add_staticgroupassociation'),(508,'Can change static group association',147,'change_staticgroupassociation'),(509,'Can delete static group association',147,'delete_staticgroupassociation'),(510,'Can view static group association',147,'view_staticgroupassociation'),(511,'Can add metadata type',148,'add_metadatatype'),(512,'Can change metadata type',148,'change_metadatatype'),(513,'Can delete metadata type',148,'delete_metadatatype'),(514,'Can view metadata type',148,'view_metadatatype'),(515,'Can add object metadata',149,'add_objectmetadata'),(516,'Can change object metadata',149,'change_objectmetadata'),(517,'Can delete object metadata',149,'delete_objectmetadata'),(518,'Can view object metadata',149,'view_objectmetadata'),(519,'Can add metadata choice',150,'add_metadatachoice'),(520,'Can change metadata choice',150,'change_metadatachoice'),(521,'Can delete metadata choice',150,'delete_metadatachoice'),(522,'Can view metadata choice',150,'view_metadatachoice'),(523,'Can add saved view',151,'add_savedview'),(524,'Can change saved view',151,'change_savedview'),(525,'Can delete saved view',151,'delete_savedview'),(526,'Can view saved view',151,'view_savedview'),(527,'Can add user saved view association',152,'add_usersavedviewassociation'),(528,'Can change user saved view association',152,'change_usersavedviewassociation'),(529,'Can delete user saved view association',152,'delete_usersavedviewassociation'),(530,'Can view user saved view association',152,'view_usersavedviewassociation'),(531,'Can add job queue',153,'add_jobqueue'),(532,'Can change job queue',153,'change_jobqueue'),(533,'Can delete job queue',153,'delete_jobqueue'),(534,'Can view job queue',153,'view_jobqueue'),(535,'Can add job queue assignment',154,'add_jobqueueassignment'),(536,'Can change job queue assignment',154,'change_jobqueueassignment'),(537,'Can delete job queue assignment',154,'delete_jobqueueassignment'),(538,'Can view job queue assignment',154,'view_jobqueueassignment'),(539,'Can add Approval Workflow',30,'add_approvalworkflow'),(540,'Can change Approval Workflow',30,'change_approvalworkflow'),(541,'Can delete Approval Workflow',30,'delete_approvalworkflow'),(542,'Can view Approval Workflow',30,'view_approvalworkflow'),(543,'Can add Approval Workflow Definition',33,'add_approvalworkflowdefinition'),(544,'Can change Approval Workflow Definition',33,'change_approvalworkflowdefinition'),(545,'Can delete Approval Workflow Definition',33,'delete_approvalworkflowdefinition'),(546,'Can view Approval Workflow Definition',33,'view_approvalworkflowdefinition'),(547,'Can add Approval Workflow Stage',31,'add_approvalworkflowstage'),(548,'Can change Approval Workflow Stage',31,'change_approvalworkflowstage'),(549,'Can delete Approval Workflow Stage',31,'delete_approvalworkflowstage'),(550,'Can view Approval Workflow Stage',31,'view_approvalworkflowstage'),(551,'Can add Approval Workflow Stage Response',32,'add_approvalworkflowstageresponse'),(552,'Can change Approval Workflow Stage Response',32,'change_approvalworkflowstageresponse'),(553,'Can delete Approval Workflow Stage Response',32,'delete_approvalworkflowstageresponse'),(554,'Can view Approval Workflow Stage Response',32,'view_approvalworkflowstageresponse'),(555,'Can add Approval Workflow Stage Definition',34,'add_approvalworkflowstagedefinition'),(556,'Can change Approval Workflow Stage Definition',34,'change_approvalworkflowstagedefinition'),(557,'Can delete Approval Workflow Stage Definition',34,'delete_approvalworkflowstagedefinition'),(558,'Can view Approval Workflow Stage Definition',34,'view_approvalworkflowstagedefinition'),(559,'Can add job console entry',155,'add_jobconsoleentry'),(560,'Can change job console entry',155,'change_jobconsoleentry'),(561,'Can delete job console entry',155,'delete_jobconsoleentry'),(562,'Can view job console entry',155,'view_jobconsoleentry'),(563,'Can add IP address',6,'add_ipaddress'),(564,'Can change IP address',6,'change_ipaddress'),(565,'Can delete IP address',6,'delete_ipaddress'),(566,'Can view IP address',6,'view_ipaddress'),(567,'Can add prefix',7,'add_prefix'),(568,'Can change prefix',7,'change_prefix'),(569,'Can delete prefix',7,'delete_prefix'),(570,'Can view prefix',7,'view_prefix'),(571,'Can add RIR',156,'add_rir'),(572,'Can change RIR',156,'change_rir'),(573,'Can delete RIR',156,'delete_rir'),(574,'Can view RIR',156,'view_rir'),(575,'Can add route target',157,'add_routetarget'),(576,'Can change route target',157,'change_routetarget'),(577,'Can delete route target',157,'delete_routetarget'),(578,'Can view route target',157,'view_routetarget'),(579,'Can add VRF',28,'add_vrf'),(580,'Can change VRF',28,'change_vrf'),(581,'Can delete VRF',28,'delete_vrf'),(582,'Can view VRF',28,'view_vrf'),(583,'Can add VLAN group',158,'add_vlangroup'),(584,'Can change VLAN group',158,'change_vlangroup'),(585,'Can delete VLAN group',158,'delete_vlangroup'),(586,'Can view VLAN group',158,'view_vlangroup'),(587,'Can add VLAN',8,'add_vlan'),(588,'Can change VLAN',8,'change_vlan'),(589,'Can delete VLAN',8,'delete_vlan'),(590,'Can view VLAN',8,'view_vlan'),(591,'Can add service',159,'add_service'),(592,'Can change service',159,'change_service'),(593,'Can delete service',159,'delete_service'),(594,'Can view service',159,'view_service'),(595,'Can add IP Address Assignment',160,'add_ipaddresstointerface'),(596,'Can change IP Address Assignment',160,'change_ipaddresstointerface'),(597,'Can delete IP Address Assignment',160,'delete_ipaddresstointerface'),(598,'Can view IP Address Assignment',160,'view_ipaddresstointerface'),(599,'Can add VRF-prefix assignment',161,'add_vrfprefixassignment'),(600,'Can change VRF-prefix assignment',161,'change_vrfprefixassignment'),(601,'Can delete VRF-prefix assignment',161,'delete_vrfprefixassignment'),(602,'Can view VRF-prefix assignment',161,'view_vrfprefixassignment'),(603,'Can add VRF-device assignment',162,'add_vrfdeviceassignment'),(604,'Can change VRF-device assignment',162,'change_vrfdeviceassignment'),(605,'Can delete VRF-device assignment',162,'delete_vrfdeviceassignment'),(606,'Can view VRF-device assignment',162,'view_vrfdeviceassignment'),(607,'Can add namespace',163,'add_namespace'),(608,'Can change namespace',163,'change_namespace'),(609,'Can delete namespace',163,'delete_namespace'),(610,'Can view namespace',163,'view_namespace'),(611,'Can add vlan location assignment',164,'add_vlanlocationassignment'),(612,'Can change vlan location assignment',164,'change_vlanlocationassignment'),(613,'Can delete vlan location assignment',164,'delete_vlanlocationassignment'),(614,'Can view vlan location assignment',164,'view_vlanlocationassignment'),(615,'Can add prefix location assignment',165,'add_prefixlocationassignment'),(616,'Can change prefix location assignment',165,'change_prefixlocationassignment'),(617,'Can delete prefix location assignment',165,'delete_prefixlocationassignment'),(618,'Can view prefix location assignment',165,'view_prefixlocationassignment'),(619,'Can add IP address range',36,'add_ipaddressrange'),(620,'Can change IP address range',36,'change_ipaddressrange'),(621,'Can delete IP address range',36,'delete_ipaddressrange'),(622,'Can view IP address range',36,'view_ipaddressrange'),(623,'Can add Certificate Profile',166,'add_certificateprofile'),(624,'Can change Certificate Profile',166,'change_certificateprofile'),(625,'Can delete Certificate Profile',166,'delete_certificateprofile'),(626,'Can view Certificate Profile',166,'view_certificateprofile'),(627,'Can add Health Check Monitor',167,'add_healthcheckmonitor'),(628,'Can change Health Check Monitor',167,'change_healthcheckmonitor'),(629,'Can delete Health Check Monitor',167,'delete_healthcheckmonitor'),(630,'Can view Health Check Monitor',167,'view_healthcheckmonitor'),(631,'Can add Load Balancer Pool',168,'add_loadbalancerpool'),(632,'Can change Load Balancer Pool',168,'change_loadbalancerpool'),(633,'Can delete Load Balancer Pool',168,'delete_loadbalancerpool'),(634,'Can view Load Balancer Pool',168,'view_loadbalancerpool'),(635,'Can add Load Balancer Pool Member',37,'add_loadbalancerpoolmember'),(636,'Can change Load Balancer Pool Member',37,'change_loadbalancerpoolmember'),(637,'Can delete Load Balancer Pool Member',37,'delete_loadbalancerpoolmember'),(638,'Can view Load Balancer Pool Member',37,'view_loadbalancerpoolmember'),(639,'Can add Virtual Server',169,'add_virtualserver'),(640,'Can change Virtual Server',169,'change_virtualserver'),(641,'Can delete Virtual Server',169,'delete_virtualserver'),(642,'Can view Virtual Server',169,'view_virtualserver'),(643,'Can add virtual server certificate profile assignment',170,'add_virtualservercertificateprofileassignment'),(644,'Can change virtual server certificate profile assignment',170,'change_virtualservercertificateprofileassignment'),(645,'Can delete virtual server certificate profile assignment',170,'delete_virtualservercertificateprofileassignment'),(646,'Can view virtual server certificate profile assignment',170,'view_virtualservercertificateprofileassignment'),(647,'Can add load balancer pool member certificate profile assignment',171,'add_loadbalancerpoolmembercertificateprofileassignment'),(648,'Can change load balancer pool member certificate profile assignment',171,'change_loadbalancerpoolmembercertificateprofileassignment'),(649,'Can delete load balancer pool member certificate profile assignment',171,'delete_loadbalancerpoolmembercertificateprofileassignment'),(650,'Can view load balancer pool member certificate profile assignment',171,'view_loadbalancerpoolmembercertificateprofileassignment'),(651,'Can add tenant group',172,'add_tenantgroup'),(652,'Can change tenant group',172,'change_tenantgroup'),(653,'Can delete tenant group',172,'delete_tenantgroup'),(654,'Can view tenant group',172,'view_tenantgroup'),(655,'Can add tenant',173,'add_tenant'),(656,'Can change tenant',173,'change_tenant'),(657,'Can delete tenant',173,'delete_tenant'),(658,'Can view tenant',173,'view_tenant'),(659,'Can add user',174,'add_user'),(660,'Can change user',174,'change_user'),(661,'Can delete user',174,'delete_user'),(662,'Can view user',174,'view_user'),(663,'Can add Group',175,'add_admingroup'),(664,'Can change Group',175,'change_admingroup'),(665,'Can delete Group',175,'delete_admingroup'),(666,'Can view Group',175,'view_admingroup'),(667,'Can add token',176,'add_token'),(668,'Can change token',176,'change_token'),(669,'Can delete token',176,'delete_token'),(670,'Can view token',176,'view_token'),(671,'Can add permission',177,'add_objectpermission'),(672,'Can change permission',177,'change_objectpermission'),(673,'Can delete permission',177,'delete_objectpermission'),(674,'Can view permission',177,'view_objectpermission'),(675,'Can add cluster',178,'add_cluster'),(676,'Can change cluster',178,'change_cluster'),(677,'Can delete cluster',178,'delete_cluster'),(678,'Can view cluster',178,'view_cluster'),(679,'Can add cluster group',179,'add_clustergroup'),(680,'Can change cluster group',179,'change_clustergroup'),(681,'Can delete cluster group',179,'delete_clustergroup'),(682,'Can view cluster group',179,'view_clustergroup'),(683,'Can add cluster type',180,'add_clustertype'),(684,'Can change cluster type',180,'change_clustertype'),(685,'Can delete cluster type',180,'delete_clustertype'),(686,'Can view cluster type',180,'view_clustertype'),(687,'Can add virtual machine',9,'add_virtualmachine'),(688,'Can change virtual machine',9,'change_virtualmachine'),(689,'Can delete virtual machine',9,'delete_virtualmachine'),(690,'Can view virtual machine',9,'view_virtualmachine'),(691,'Can add VM interface',12,'add_vminterface'),(692,'Can change VM interface',12,'change_vminterface'),(693,'Can delete VM interface',12,'delete_vminterface'),(694,'Can view VM interface',12,'view_vminterface'),(695,'Can add VPN',181,'add_vpn'),(696,'Can change VPN',181,'change_vpn'),(697,'Can delete VPN',181,'delete_vpn'),(698,'Can view VPN',181,'view_vpn'),(699,'Can add VPN Phase 1 Policy',182,'add_vpnphase1policy'),(700,'Can change VPN Phase 1 Policy',182,'change_vpnphase1policy'),(701,'Can delete VPN Phase 1 Policy',182,'delete_vpnphase1policy'),(702,'Can view VPN Phase 1 Policy',182,'view_vpnphase1policy'),(703,'Can add VPN Phase 2 Policy',183,'add_vpnphase2policy'),(704,'Can change VPN Phase 2 Policy',183,'change_vpnphase2policy'),(705,'Can delete VPN Phase 2 Policy',183,'delete_vpnphase2policy'),(706,'Can view VPN Phase 2 Policy',183,'view_vpnphase2policy'),(707,'Can add VPN Profile',184,'add_vpnprofile'),(708,'Can change VPN Profile',184,'change_vpnprofile'),(709,'Can delete VPN Profile',184,'delete_vpnprofile'),(710,'Can view VPN Profile',184,'view_vpnprofile'),(711,'Can add VPN Tunnel Endpoint',39,'add_vpntunnelendpoint'),(712,'Can change VPN Tunnel Endpoint',39,'change_vpntunnelendpoint'),(713,'Can delete VPN Tunnel Endpoint',39,'delete_vpntunnelendpoint'),(714,'Can view VPN Tunnel Endpoint',39,'view_vpntunnelendpoint'),(715,'Can add VPN Tunnel',38,'add_vpntunnel'),(716,'Can change VPN Tunnel',38,'change_vpntunnel'),(717,'Can delete VPN Tunnel',38,'delete_vpntunnel'),(718,'Can view VPN Tunnel',38,'view_vpntunnel'),(719,'Can add vpn profile phase2 policy assignment',185,'add_vpnprofilephase2policyassignment'),(720,'Can change vpn profile phase2 policy assignment',185,'change_vpnprofilephase2policyassignment'),(721,'Can delete vpn profile phase2 policy assignment',185,'delete_vpnprofilephase2policyassignment'),(722,'Can view vpn profile phase2 policy assignment',185,'view_vpnprofilephase2policyassignment'),(723,'Can add vpn profile phase1 policy assignment',186,'add_vpnprofilephase1policyassignment'),(724,'Can change vpn profile phase1 policy assignment',186,'change_vpnprofilephase1policyassignment'),(725,'Can delete vpn profile phase1 policy assignment',186,'delete_vpnprofilephase1policyassignment'),(726,'Can view vpn profile phase1 policy assignment',186,'view_vpnprofilephase1policyassignment'),(727,'Can add VPN Termination',187,'add_vpntermination'),(728,'Can change VPN Termination',187,'change_vpntermination'),(729,'Can delete VPN Termination',187,'delete_vpntermination'),(730,'Can view VPN Termination',187,'view_vpntermination'),(731,'Can add wireless network',188,'add_wirelessnetwork'),(732,'Can change wireless network',188,'change_wirelessnetwork'),(733,'Can delete wireless network',188,'delete_wirelessnetwork'),(734,'Can view wireless network',188,'view_wirelessnetwork'),(735,'Can add supported data rate',189,'add_supporteddatarate'),(736,'Can change supported data rate',189,'change_supporteddatarate'),(737,'Can delete supported data rate',189,'delete_supporteddatarate'),(738,'Can view supported data rate',189,'view_supporteddatarate'),(739,'Can add radio profile',190,'add_radioprofile'),(740,'Can change radio profile',190,'change_radioprofile'),(741,'Can delete radio profile',190,'delete_radioprofile'),(742,'Can view radio profile',190,'view_radioprofile'),(743,'Can add controller managed device group wireless network assignment',191,'add_controllermanageddevicegroupwirelessnetworkassignment'),(744,'Can change controller managed device group wireless network assignment',191,'change_controllermanageddevicegroupwirelessnetworkassignment'),(745,'Can delete controller managed device group wireless network assignment',191,'delete_controllermanageddevicegroupwirelessnetworkassignment'),(746,'Can view controller managed device group wireless network assignment',191,'view_controllermanageddevicegroupwirelessnetworkassignment'),(747,'Can add controller managed device group radio profile assignment',192,'add_controllermanageddevicegroupradioprofileassignment'),(748,'Can change controller managed device group radio profile assignment',192,'change_controllermanageddevicegroupradioprofileassignment'),(749,'Can delete controller managed device group radio profile assignment',192,'delete_controllermanageddevicegroupradioprofileassignment'),(750,'Can view controller managed device group radio profile assignment',192,'view_controllermanageddevicegroupradioprofileassignment'),(751,'Can add profile',193,'add_profile'),(752,'Can change profile',193,'change_profile'),(753,'Can delete profile',193,'delete_profile'),(754,'Can view profile',193,'view_profile'),(755,'Can add request',194,'add_request'),(756,'Can change request',194,'change_request'),(757,'Can delete request',194,'delete_request'),(758,'Can view request',194,'view_request'),(759,'Can add response',195,'add_response'),(760,'Can change response',195,'change_response'),(761,'Can delete response',195,'delete_response'),(762,'Can view response',195,'view_response'),(763,'Can add sql query',196,'add_sqlquery'),(764,'Can change sql query',196,'change_sqlquery'),(765,'Can delete sql query',196,'delete_sqlquery'),(766,'Can view sql query',196,'view_sqlquery');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `config_data` json NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` char(32) NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` char(32) NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circuits_circuit`
--

DROP TABLE IF EXISTS `circuits_circuit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `circuits_circuit` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `cid` varchar(255) NOT NULL,
  `install_date` date DEFAULT NULL,
  `commit_rate` int unsigned DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `comments` longtext NOT NULL,
  `provider_id` char(32) NOT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `circuit_type_id` char(32) NOT NULL,
  `circuit_termination_a_id` char(32) DEFAULT NULL,
  `circuit_termination_z_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `circuits_circuit_provider_id_cid_b6f29862_uniq` (`provider_id`,`cid`),
  KEY `circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `circuits_circuit_status_id_6433793f` (`status_id`),
  KEY `circuits_circuit_circuit_termination__ef74b54e_fk_circuits_` (`circuit_termination_a_id`),
  KEY `circuits_circuit_circuit_termination__498b110c_fk_circuits_` (`circuit_termination_z_id`),
  KEY `circuits_circuit_circuit_type_id_8b659c7a_fk_circuits_` (`circuit_type_id`),
  CONSTRAINT `circuits_circuit_circuit_termination__498b110c_fk_circuits_` FOREIGN KEY (`circuit_termination_z_id`) REFERENCES `circuits_circuittermination` (`id`),
  CONSTRAINT `circuits_circuit_circuit_termination__ef74b54e_fk_circuits_` FOREIGN KEY (`circuit_termination_a_id`) REFERENCES `circuits_circuittermination` (`id`),
  CONSTRAINT `circuits_circuit_circuit_type_id_8b659c7a_fk_circuits_` FOREIGN KEY (`circuit_type_id`) REFERENCES `circuits_circuittype` (`id`),
  CONSTRAINT `circuits_circuit_provider_id_d9195418_fk_circuits_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `circuits_provider` (`id`),
  CONSTRAINT `circuits_circuit_status_id_6433793f_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `circuits_circuit_chk_1` CHECK ((`commit_rate` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuits_circuit`
--

LOCK TABLES `circuits_circuit` WRITE;
/*!40000 ALTER TABLE `circuits_circuit` DISABLE KEYS */;
/*!40000 ALTER TABLE `circuits_circuit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circuits_circuittermination`
--

DROP TABLE IF EXISTS `circuits_circuittermination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `circuits_circuittermination` (
  `id` char(32) NOT NULL,
  `term_side` varchar(1) NOT NULL,
  `port_speed` int unsigned DEFAULT NULL,
  `upstream_speed` int unsigned DEFAULT NULL,
  `xconnect_id` varchar(255) NOT NULL,
  `pp_info` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `circuit_id` char(32) NOT NULL,
  `provider_network_id` char(32) DEFAULT NULL,
  `_custom_field_data` json NOT NULL DEFAULT (_utf8mb4'{}'),
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `location_id` char(32) DEFAULT NULL,
  `cloud_network_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq` (`circuit_id`,`term_side`),
  KEY `circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_` (`provider_network_id`),
  KEY `circuits_circuitterm_location_id_9896bd96_fk_dcim_loca` (`location_id`),
  KEY `circuits_circuitterm_cloud_network_id_47b1bd20_fk_cloud_clo` (`cloud_network_id`),
  CONSTRAINT `circuits_circuitterm_circuit_id_257e87e7_fk_circuits_` FOREIGN KEY (`circuit_id`) REFERENCES `circuits_circuit` (`id`),
  CONSTRAINT `circuits_circuitterm_cloud_network_id_47b1bd20_fk_cloud_clo` FOREIGN KEY (`cloud_network_id`) REFERENCES `cloud_cloudnetwork` (`id`),
  CONSTRAINT `circuits_circuitterm_location_id_9896bd96_fk_dcim_loca` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_` FOREIGN KEY (`provider_network_id`) REFERENCES `circuits_providernetwork` (`id`),
  CONSTRAINT `circuits_circuittermination_chk_1` CHECK ((`port_speed` >= 0)),
  CONSTRAINT `circuits_circuittermination_chk_2` CHECK ((`upstream_speed` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuits_circuittermination`
--

LOCK TABLES `circuits_circuittermination` WRITE;
/*!40000 ALTER TABLE `circuits_circuittermination` DISABLE KEYS */;
/*!40000 ALTER TABLE `circuits_circuittermination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circuits_circuittype`
--

DROP TABLE IF EXISTS `circuits_circuittype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `circuits_circuittype` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuits_circuittype`
--

LOCK TABLES `circuits_circuittype` WRITE;
/*!40000 ALTER TABLE `circuits_circuittype` DISABLE KEYS */;
/*!40000 ALTER TABLE `circuits_circuittype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circuits_provider`
--

DROP TABLE IF EXISTS `circuits_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `circuits_provider` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `asn` bigint DEFAULT NULL,
  `account` varchar(255) NOT NULL,
  `portal_url` varchar(200) NOT NULL,
  `noc_contact` longtext NOT NULL,
  `admin_contact` longtext NOT NULL,
  `comments` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuits_provider`
--

LOCK TABLES `circuits_provider` WRITE;
/*!40000 ALTER TABLE `circuits_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `circuits_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circuits_providernetwork`
--

DROP TABLE IF EXISTS `circuits_providernetwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `circuits_providernetwork` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `comments` longtext NOT NULL,
  `provider_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `circuits_providernetwork_provider_name` (`provider_id`,`name`),
  UNIQUE KEY `circuits_providernetwork_provider_id_name_6f6610a0_uniq` (`provider_id`,`name`),
  KEY `circuits_providernetwork_name_9d69fb4d` (`name`),
  CONSTRAINT `circuits_providernet_provider_id_7992236c_fk_circuits_` FOREIGN KEY (`provider_id`) REFERENCES `circuits_provider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuits_providernetwork`
--

LOCK TABLES `circuits_providernetwork` WRITE;
/*!40000 ALTER TABLE `circuits_providernetwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `circuits_providernetwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_cloudaccount`
--

DROP TABLE IF EXISTS `cloud_cloudaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_cloudaccount` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `provider_id` char(32) NOT NULL,
  `secrets_group_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `cloud_cloudaccount_provider_id_d092fa49_fk_dcim_manufacturer_id` (`provider_id`),
  KEY `cloud_cloudaccount_secrets_group_id_bfbea030_fk_extras_se` (`secrets_group_id`),
  CONSTRAINT `cloud_cloudaccount_provider_id_d092fa49_fk_dcim_manufacturer_id` FOREIGN KEY (`provider_id`) REFERENCES `dcim_manufacturer` (`id`),
  CONSTRAINT `cloud_cloudaccount_secrets_group_id_bfbea030_fk_extras_se` FOREIGN KEY (`secrets_group_id`) REFERENCES `extras_secretsgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_cloudaccount`
--

LOCK TABLES `cloud_cloudaccount` WRITE;
/*!40000 ALTER TABLE `cloud_cloudaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_cloudaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_cloudnetwork`
--

DROP TABLE IF EXISTS `cloud_cloudnetwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_cloudnetwork` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `extra_config` json DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `cloud_account_id` char(32) NOT NULL,
  `cloud_resource_type_id` char(32) NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `cloud_cloudnetwork_parent_id_c3415beb_fk_cloud_cloudnetwork_id` (`parent_id`),
  KEY `cloud_cloudnetwork_cloud_account_id_3936df5b_fk_cloud_clo` (`cloud_account_id`),
  KEY `cloud_cloudnetwork_cloud_resource_type_id_afa3409e` (`cloud_resource_type_id`),
  CONSTRAINT `cloud_cloudnetwork_cloud_account_id_3936df5b_fk_cloud_clo` FOREIGN KEY (`cloud_account_id`) REFERENCES `cloud_cloudaccount` (`id`),
  CONSTRAINT `cloud_cloudnetwork_cloud_resource_type__afa3409e_fk_cloud_clo` FOREIGN KEY (`cloud_resource_type_id`) REFERENCES `cloud_cloudresourcetype` (`id`),
  CONSTRAINT `cloud_cloudnetwork_parent_id_c3415beb_fk_cloud_cloudnetwork_id` FOREIGN KEY (`parent_id`) REFERENCES `cloud_cloudnetwork` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_cloudnetwork`
--

LOCK TABLES `cloud_cloudnetwork` WRITE;
/*!40000 ALTER TABLE `cloud_cloudnetwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_cloudnetwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_cloudnetworkprefixassignment`
--

DROP TABLE IF EXISTS `cloud_cloudnetworkprefixassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_cloudnetworkprefixassignment` (
  `id` char(32) NOT NULL,
  `cloud_network_id` char(32) NOT NULL,
  `prefix_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cloud_cloudnetworkprefix_cloud_network_id_prefix__887a4919_uniq` (`cloud_network_id`,`prefix_id`),
  KEY `cloud_cloudnetworkpr_prefix_id_81356785_fk_ipam_pref` (`prefix_id`),
  CONSTRAINT `cloud_cloudnetworkpr_cloud_network_id_bf71122d_fk_cloud_clo` FOREIGN KEY (`cloud_network_id`) REFERENCES `cloud_cloudnetwork` (`id`),
  CONSTRAINT `cloud_cloudnetworkpr_prefix_id_81356785_fk_ipam_pref` FOREIGN KEY (`prefix_id`) REFERENCES `ipam_prefix` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_cloudnetworkprefixassignment`
--

LOCK TABLES `cloud_cloudnetworkprefixassignment` WRITE;
/*!40000 ALTER TABLE `cloud_cloudnetworkprefixassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_cloudnetworkprefixassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_cloudresourcetype`
--

DROP TABLE IF EXISTS `cloud_cloudresourcetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_cloudresourcetype` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `config_schema` json DEFAULT NULL,
  `provider_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `cloud_cloudresourcet_provider_id_ab3a3edb_fk_dcim_manu` (`provider_id`),
  CONSTRAINT `cloud_cloudresourcet_provider_id_ab3a3edb_fk_dcim_manu` FOREIGN KEY (`provider_id`) REFERENCES `dcim_manufacturer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_cloudresourcetype`
--

LOCK TABLES `cloud_cloudresourcetype` WRITE;
/*!40000 ALTER TABLE `cloud_cloudresourcetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_cloudresourcetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_cloudresourcetype_content_types`
--

DROP TABLE IF EXISTS `cloud_cloudresourcetype_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_cloudresourcetype_content_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cloudresourcetype_id` char(32) NOT NULL,
  `contenttype_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cloud_cloudresourcetype__cloudresourcetype_id_con_b84e6ea0_uniq` (`cloudresourcetype_id`,`contenttype_id`),
  KEY `cloud_cloudresourcet_contenttype_id_22bc7c1c_fk_django_co` (`contenttype_id`),
  CONSTRAINT `cloud_cloudresourcet_cloudresourcetype_id_366afc0c_fk_cloud_clo` FOREIGN KEY (`cloudresourcetype_id`) REFERENCES `cloud_cloudresourcetype` (`id`),
  CONSTRAINT `cloud_cloudresourcet_contenttype_id_22bc7c1c_fk_django_co` FOREIGN KEY (`contenttype_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_cloudresourcetype_content_types`
--

LOCK TABLES `cloud_cloudresourcetype_content_types` WRITE;
/*!40000 ALTER TABLE `cloud_cloudresourcetype_content_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_cloudresourcetype_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_cloudservice`
--

DROP TABLE IF EXISTS `cloud_cloudservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_cloudservice` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `extra_config` json DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `cloud_account_id` char(32) DEFAULT NULL,
  `cloud_resource_type_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `cloud_cloudservice_cloud_account_id_60c91048_fk_cloud_clo` (`cloud_account_id`),
  KEY `cloud_cloudservice_cloud_resource_type_id_46a3d193` (`cloud_resource_type_id`),
  CONSTRAINT `cloud_cloudservice_cloud_account_id_60c91048_fk_cloud_clo` FOREIGN KEY (`cloud_account_id`) REFERENCES `cloud_cloudaccount` (`id`),
  CONSTRAINT `cloud_cloudservice_cloud_resource_type__46a3d193_fk_cloud_clo` FOREIGN KEY (`cloud_resource_type_id`) REFERENCES `cloud_cloudresourcetype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_cloudservice`
--

LOCK TABLES `cloud_cloudservice` WRITE;
/*!40000 ALTER TABLE `cloud_cloudservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_cloudservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_cloudservicenetworkassignment`
--

DROP TABLE IF EXISTS `cloud_cloudservicenetworkassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_cloudservicenetworkassignment` (
  `id` char(32) NOT NULL,
  `cloud_network_id` char(32) NOT NULL,
  `cloud_service_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cloud_cloudservicenetwor_cloud_network_id_cloud_s_0bc84b88_uniq` (`cloud_network_id`,`cloud_service_id`),
  KEY `cloud_cloudservicene_cloud_service_id_6c953e3a_fk_cloud_clo` (`cloud_service_id`),
  CONSTRAINT `cloud_cloudservicene_cloud_network_id_e9bffd99_fk_cloud_clo` FOREIGN KEY (`cloud_network_id`) REFERENCES `cloud_cloudnetwork` (`id`),
  CONSTRAINT `cloud_cloudservicene_cloud_service_id_6c953e3a_fk_cloud_clo` FOREIGN KEY (`cloud_service_id`) REFERENCES `cloud_cloudservice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_cloudservicenetworkassignment`
--

LOCK TABLES `cloud_cloudservicenetworkassignment` WRITE;
/*!40000 ALTER TABLE `cloud_cloudservicenetworkassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_cloudservicenetworkassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constance_constance`
--

DROP TABLE IF EXISTS `constance_constance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constance_constance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constance_constance`
--

LOCK TABLES `constance_constance` WRITE;
/*!40000 ALTER TABLE `constance_constance` DISABLE KEYS */;
INSERT INTO `constance_constance` VALUES (1,'DEVICE_UNIQUENESS','location_tenant_name');
/*!40000 ALTER TABLE `constance_constance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_validation_datacompliance`
--

DROP TABLE IF EXISTS `data_validation_datacompliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_validation_datacompliance` (
  `id` char(32) NOT NULL,
  `compliance_class_name` varchar(255) NOT NULL,
  `last_validation_date` datetime(6) NOT NULL,
  `object_id` char(32) NOT NULL,
  `validated_object_str` varchar(255) NOT NULL,
  `validated_attribute` varchar(255) NOT NULL,
  `validated_attribute_value` varchar(255) NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_validation_datacomp_compliance_class_name_co_b0e38158_uniq` (`compliance_class_name`,`content_type_id`,`object_id`,`validated_attribute`),
  KEY `data_validation_data_content_type_id_26bf587e_fk_django_co` (`content_type_id`),
  CONSTRAINT `data_validation_data_content_type_id_26bf587e_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_validation_datacompliance`
--

LOCK TABLES `data_validation_datacompliance` WRITE;
/*!40000 ALTER TABLE `data_validation_datacompliance` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_validation_datacompliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_validation_minmaxrule`
--

DROP TABLE IF EXISTS `data_validation_minmaxrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_validation_minmaxrule` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `error_message` varchar(255) NOT NULL,
  `min` double DEFAULT NULL,
  `max` double DEFAULT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `data_validation_minmaxrule_content_type_id_field_a0d64d51_uniq` (`content_type_id`,`field`),
  CONSTRAINT `data_validation_minm_content_type_id_669cb2ce_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_validation_minmaxrule`
--

LOCK TABLES `data_validation_minmaxrule` WRITE;
/*!40000 ALTER TABLE `data_validation_minmaxrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_validation_minmaxrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_validation_regexrule`
--

DROP TABLE IF EXISTS `data_validation_regexrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_validation_regexrule` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `error_message` varchar(255) NOT NULL,
  `regular_expression` longtext NOT NULL,
  `context_processing` tinyint(1) NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `data_validation_regexrule_content_type_id_field_6b19bc08_uniq` (`content_type_id`,`field`),
  CONSTRAINT `data_validation_rege_content_type_id_87ed748b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_validation_regexrule`
--

LOCK TABLES `data_validation_regexrule` WRITE;
/*!40000 ALTER TABLE `data_validation_regexrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_validation_regexrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_validation_requiredrule`
--

DROP TABLE IF EXISTS `data_validation_requiredrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_validation_requiredrule` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `error_message` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `data_validation_requiredrule_content_type_id_field_fccaa1c1_uniq` (`content_type_id`,`field`),
  CONSTRAINT `data_validation_requ_content_type_id_1eea2be4_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_validation_requiredrule`
--

LOCK TABLES `data_validation_requiredrule` WRITE;
/*!40000 ALTER TABLE `data_validation_requiredrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_validation_requiredrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_validation_uniquerule`
--

DROP TABLE IF EXISTS `data_validation_uniquerule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_validation_uniquerule` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `error_message` varchar(255) NOT NULL,
  `max_instances` int unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `data_validation_uniquerule_content_type_id_field_02db8a56_uniq` (`content_type_id`,`field`),
  CONSTRAINT `data_validation_uniq_content_type_id_0c0249fc_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `data_validation_uniquerule_chk_1` CHECK ((`max_instances` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_validation_uniquerule`
--

LOCK TABLES `data_validation_uniquerule` WRITE;
/*!40000 ALTER TABLE `data_validation_uniquerule` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_validation_uniquerule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_cable`
--

DROP TABLE IF EXISTS `dcim_cable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_cable` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `color` varchar(6) NOT NULL,
  `length` smallint unsigned DEFAULT NULL,
  `length_unit` varchar(50) NOT NULL,
  `_abs_length` decimal(13,4) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `cable_type_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dcim_cable_status_id_6a580869` (`status_id`),
  KEY `dcim_cable_cable_type_id_476b3754_fk_dcim_cabletype_id` (`cable_type_id`),
  CONSTRAINT `dcim_cable_cable_type_id_476b3754_fk_dcim_cabletype_id` FOREIGN KEY (`cable_type_id`) REFERENCES `dcim_cabletype` (`id`),
  CONSTRAINT `dcim_cable_status_id_6a580869_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_cable_chk_1` CHECK ((`length` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_cable`
--

LOCK TABLES `dcim_cable` WRITE;
/*!40000 ALTER TABLE `dcim_cable` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_cable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_cablepath`
--

DROP TABLE IF EXISTS `dcim_cablepath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_cablepath` (
  `id` char(32) NOT NULL,
  `origin_id` char(32) NOT NULL,
  `destination_id` char(32) DEFAULT NULL,
  `path` json NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_split` tinyint(1) NOT NULL,
  `destination_type_id` int DEFAULT NULL,
  `origin_type_id` int NOT NULL,
  `peer_connector` smallint unsigned NOT NULL,
  `destination_fans_out` tinyint(1) NOT NULL,
  `origin_fans_out` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_cablepath_origin_type_id_origin_id_93b779d6_uniq` (`origin_type_id`,`origin_id`,`peer_connector`),
  KEY `dcim_cablepath_destination_type_id_a8c1654b_fk_django_co` (`destination_type_id`),
  KEY `dcim_cablepath_origin_type_id_6de54f6d` (`origin_type_id`),
  CONSTRAINT `dcim_cablepath_destination_type_id_a8c1654b_fk_django_co` FOREIGN KEY (`destination_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_cablepath_origin_type_id_6de54f6d_fk_django_content_type_id` FOREIGN KEY (`origin_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_cablepath_chk_1` CHECK ((`peer_connector` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_cablepath`
--

LOCK TABLES `dcim_cablepath` WRITE;
/*!40000 ALTER TABLE `dcim_cablepath` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_cablepath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_cabletocabletermination`
--

DROP TABLE IF EXISTS `dcim_cabletocabletermination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_cabletocabletermination` (
  `id` char(32) NOT NULL,
  `cable_end` varchar(1) NOT NULL,
  `connector` smallint unsigned NOT NULL,
  `cable_id` char(32) NOT NULL,
  `circuit_termination_id` char(32) DEFAULT NULL,
  `console_port_id` char(32) DEFAULT NULL,
  `console_server_port_id` char(32) DEFAULT NULL,
  `front_port_id` char(32) DEFAULT NULL,
  `interface_id` char(32) DEFAULT NULL,
  `power_feed_id` char(32) DEFAULT NULL,
  `power_outlet_id` char(32) DEFAULT NULL,
  `power_port_id` char(32) DEFAULT NULL,
  `rear_port_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_cabletocabletermination_unique_connector` (`cable_id`,`cable_end`,`connector`),
  UNIQUE KEY `circuit_termination_id` (`circuit_termination_id`),
  UNIQUE KEY `console_port_id` (`console_port_id`),
  UNIQUE KEY `console_server_port_id` (`console_server_port_id`),
  UNIQUE KEY `front_port_id` (`front_port_id`),
  UNIQUE KEY `interface_id` (`interface_id`),
  UNIQUE KEY `power_feed_id` (`power_feed_id`),
  UNIQUE KEY `power_outlet_id` (`power_outlet_id`),
  UNIQUE KEY `power_port_id` (`power_port_id`),
  UNIQUE KEY `rear_port_id` (`rear_port_id`),
  CONSTRAINT `dcim_cabletocableter_circuit_termination__c55de3d4_fk_circuits_` FOREIGN KEY (`circuit_termination_id`) REFERENCES `circuits_circuittermination` (`id`),
  CONSTRAINT `dcim_cabletocableter_console_port_id_e23ae225_fk_dcim_cons` FOREIGN KEY (`console_port_id`) REFERENCES `dcim_consoleport` (`id`),
  CONSTRAINT `dcim_cabletocableter_console_server_port__288571bb_fk_dcim_cons` FOREIGN KEY (`console_server_port_id`) REFERENCES `dcim_consoleserverport` (`id`),
  CONSTRAINT `dcim_cabletocableter_front_port_id_dc4aad9c_fk_dcim_fron` FOREIGN KEY (`front_port_id`) REFERENCES `dcim_frontport` (`id`),
  CONSTRAINT `dcim_cabletocableter_interface_id_1a299e3f_fk_dcim_inte` FOREIGN KEY (`interface_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `dcim_cabletocableter_power_feed_id_a60ab629_fk_dcim_powe` FOREIGN KEY (`power_feed_id`) REFERENCES `dcim_powerfeed` (`id`),
  CONSTRAINT `dcim_cabletocableter_power_outlet_id_88e97bdb_fk_dcim_powe` FOREIGN KEY (`power_outlet_id`) REFERENCES `dcim_poweroutlet` (`id`),
  CONSTRAINT `dcim_cabletocableter_power_port_id_7c3e336a_fk_dcim_powe` FOREIGN KEY (`power_port_id`) REFERENCES `dcim_powerport` (`id`),
  CONSTRAINT `dcim_cabletocableter_rear_port_id_83277674_fk_dcim_rear` FOREIGN KEY (`rear_port_id`) REFERENCES `dcim_rearport` (`id`),
  CONSTRAINT `dcim_cabletocabletermination_cable_id_21aad480_fk_dcim_cable_id` FOREIGN KEY (`cable_id`) REFERENCES `dcim_cable` (`id`),
  CONSTRAINT `dcim_cabletocabletermination_at_most_one_termination` CHECK ((((`circuit_termination_id` is null) and (`console_port_id` is null) and (`console_server_port_id` is null) and (`front_port_id` is null) and (`interface_id` is null) and (`power_feed_id` is null) and (`power_outlet_id` is null) and (`power_port_id` is null) and (`rear_port_id` is null)) or ((`circuit_termination_id` is not null) and (`console_port_id` is null) and (`console_server_port_id` is null) and (`front_port_id` is null) and (`interface_id` is null) and (`power_feed_id` is null) and (`power_outlet_id` is null) and (`power_port_id` is null) and (`rear_port_id` is null)) or ((`console_port_id` is not null) and (`circuit_termination_id` is null) and (`console_server_port_id` is null) and (`front_port_id` is null) and (`interface_id` is null) and (`power_feed_id` is null) and (`power_outlet_id` is null) and (`power_port_id` is null) and (`rear_port_id` is null)) or ((`console_server_port_id` is not null) and (`circuit_termination_id` is null) and (`console_port_id` is null) and (`front_port_id` is null) and (`interface_id` is null) and (`power_feed_id` is null) and (`power_outlet_id` is null) and (`power_port_id` is null) and (`rear_port_id` is null)) or ((`front_port_id` is not null) and (`circuit_termination_id` is null) and (`console_port_id` is null) and (`console_server_port_id` is null) and (`interface_id` is null) and (`power_feed_id` is null) and (`power_outlet_id` is null) and (`power_port_id` is null) and (`rear_port_id` is null)) or ((`interface_id` is not null) and (`circuit_termination_id` is null) and (`console_port_id` is null) and (`console_server_port_id` is null) and (`front_port_id` is null) and (`power_feed_id` is null) and (`power_outlet_id` is null) and (`power_port_id` is null) and (`rear_port_id` is null)) or ((`power_feed_id` is not null) and (`circuit_termination_id` is null) and (`console_port_id` is null) and (`console_server_port_id` is null) and (`front_port_id` is null) and (`interface_id` is null) and (`power_outlet_id` is null) and (`power_port_id` is null) and (`rear_port_id` is null)) or ((`power_outlet_id` is not null) and (`circuit_termination_id` is null) and (`console_port_id` is null) and (`console_server_port_id` is null) and (`front_port_id` is null) and (`interface_id` is null) and (`power_feed_id` is null) and (`power_port_id` is null) and (`rear_port_id` is null)) or ((`power_port_id` is not null) and (`circuit_termination_id` is null) and (`console_port_id` is null) and (`console_server_port_id` is null) and (`front_port_id` is null) and (`interface_id` is null) and (`power_feed_id` is null) and (`power_outlet_id` is null) and (`rear_port_id` is null)) or ((`rear_port_id` is not null) and (`circuit_termination_id` is null) and (`console_port_id` is null) and (`console_server_port_id` is null) and (`front_port_id` is null) and (`interface_id` is null) and (`power_feed_id` is null) and (`power_outlet_id` is null) and (`power_port_id` is null)))),
  CONSTRAINT `dcim_cabletocabletermination_chk_1` CHECK ((`connector` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_cabletocabletermination`
--

LOCK TABLES `dcim_cabletocabletermination` WRITE;
/*!40000 ALTER TABLE `dcim_cabletocabletermination` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_cabletocabletermination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_cabletype`
--

DROP TABLE IF EXISTS `dcim_cabletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_cabletype` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `manufacturer_id` char(32) DEFAULT NULL,
  `part_number` varchar(255) NOT NULL,
  `has_embedded_transceivers` tinyint(1) NOT NULL,
  `a_connectors` smallint unsigned NOT NULL,
  `b_connectors` smallint unsigned NOT NULL,
  `total_lanes` smallint unsigned NOT NULL,
  `mapping` json NOT NULL,
  `is_shuffle` tinyint(1) NOT NULL,
  `strands_per_lane` smallint unsigned NOT NULL,
  `polarity_method` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `dcim_cabletype_manufacturer_id_49e6bbe2_fk_dcim_manufacturer_id` (`manufacturer_id`),
  CONSTRAINT `dcim_cabletype_manufacturer_id_49e6bbe2_fk_dcim_manufacturer_id` FOREIGN KEY (`manufacturer_id`) REFERENCES `dcim_manufacturer` (`id`),
  CONSTRAINT `dcim_cabletype_chk_1` CHECK ((`a_connectors` >= 0)),
  CONSTRAINT `dcim_cabletype_chk_2` CHECK ((`b_connectors` >= 0)),
  CONSTRAINT `dcim_cabletype_chk_3` CHECK ((`total_lanes` >= 0)),
  CONSTRAINT `dcim_cabletype_chk_4` CHECK ((`strands_per_lane` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_cabletype`
--

LOCK TABLES `dcim_cabletype` WRITE;
/*!40000 ALTER TABLE `dcim_cabletype` DISABLE KEYS */;
INSERT INTO `dcim_cabletype` VALUES ('14163799057248ef9b01d087404799f1','2026-09-07 09:13:16.126201','2026-09-07 09:13:16.126224','{}','1x4 Breakout','1 trunk connector broken out to 4 individual legs',NULL,'',0,1,4,4,'[{\"label\": \"1\", \"a_position\": 1, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 1}, {\"label\": \"2\", \"a_position\": 2, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 2}, {\"label\": \"3\", \"a_position\": 3, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 3}, {\"label\": \"4\", \"a_position\": 4, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 4}]',0,1,''),('43739efe1978439e82d06ee7d0970a8f','2026-09-07 09:13:16.124531','2026-09-07 09:13:16.124564','{}','1x2 Breakout','1 trunk connector broken out to 2 individual legs',NULL,'',0,1,2,2,'[{\"label\": \"1\", \"a_position\": 1, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 1}, {\"label\": \"2\", \"a_position\": 2, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 2}]',0,1,''),('83963b3ca9bb4117bcc7ffd2659718a3','2026-09-07 09:13:16.128352','2026-09-07 09:13:16.128363','{}','1x8 Breakout','1 trunk connector broken out to 8 individual legs',NULL,'',0,1,8,8,'[{\"label\": \"1\", \"a_position\": 1, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 1}, {\"label\": \"2\", \"a_position\": 2, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 2}, {\"label\": \"3\", \"a_position\": 3, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 3}, {\"label\": \"4\", \"a_position\": 4, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 4}, {\"label\": \"5\", \"a_position\": 5, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 5}, {\"label\": \"6\", \"a_position\": 6, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 6}, {\"label\": \"7\", \"a_position\": 7, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 7}, {\"label\": \"8\", \"a_position\": 8, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 8}]',0,1,''),('ef5371fbbdd04b6b8245ec9988e601fa','2026-09-07 09:13:16.127319','2026-09-07 09:13:16.127349','{}','1x6 Breakout','1 trunk connector broken out to 6 individual legs',NULL,'',0,1,6,6,'[{\"label\": \"1\", \"a_position\": 1, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 1}, {\"label\": \"2\", \"a_position\": 2, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 2}, {\"label\": \"3\", \"a_position\": 3, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 3}, {\"label\": \"4\", \"a_position\": 4, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 4}, {\"label\": \"5\", \"a_position\": 5, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 5}, {\"label\": \"6\", \"a_position\": 6, \"b_position\": 1, \"a_connector\": 1, \"b_connector\": 6}]',0,1,'');
/*!40000 ALTER TABLE `dcim_cabletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_consoleport`
--

DROP TABLE IF EXISTS `dcim_consoleport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_consoleport` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `device_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `module_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_consoleport_module_name_unique` (`module_id`,`name`),
  KEY `dcim_consoleport_name_ef94d0d1` (`name`),
  KEY `dcim_consoleport__name_6ac60d99` (`_name`),
  KEY `dcim_consoleport_module_id_d17b2519` (`module_id`),
  KEY `dcim_consoleport_device_id_f2d90d3c` (`device_id`),
  CONSTRAINT `dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_consoleport_module_id_d17b2519_fk_dcim_module_id` FOREIGN KEY (`module_id`) REFERENCES `dcim_module` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_consoleport`
--

LOCK TABLES `dcim_consoleport` WRITE;
/*!40000 ALTER TABLE `dcim_consoleport` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_consoleport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_consoleporttemplate`
--

DROP TABLE IF EXISTS `dcim_consoleporttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_consoleporttemplate` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `device_type_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `module_type_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_consoleporttemplate_device_type_name_unique` (`device_type_id`,`name`),
  UNIQUE KEY `dcim_consoleporttemplate_module_type_name_unique` (`module_type_id`,`name`),
  KEY `dcim_consoleporttemplate_module_type_id_c0f35d97` (`module_type_id`),
  CONSTRAINT `dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
  CONSTRAINT `dcim_consoleporttemp_module_type_id_c0f35d97_fk_dcim_modu` FOREIGN KEY (`module_type_id`) REFERENCES `dcim_moduletype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_consoleporttemplate`
--

LOCK TABLES `dcim_consoleporttemplate` WRITE;
/*!40000 ALTER TABLE `dcim_consoleporttemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_consoleporttemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_consoleserverport`
--

DROP TABLE IF EXISTS `dcim_consoleserverport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_consoleserverport` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `device_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `module_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_consoleserverport_module_name_unique` (`module_id`,`name`),
  KEY `dcim_consoleserverport_name_2319aaf4` (`name`),
  KEY `dcim_consoleserverport__name_70f9317c` (`_name`),
  KEY `dcim_consoleserverport_module_id_d060cfc8` (`module_id`),
  KEY `dcim_consoleserverport_device_id_d9866581` (`device_id`),
  CONSTRAINT `dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_consoleserverport_module_id_d060cfc8_fk_dcim_module_id` FOREIGN KEY (`module_id`) REFERENCES `dcim_module` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_consoleserverport`
--

LOCK TABLES `dcim_consoleserverport` WRITE;
/*!40000 ALTER TABLE `dcim_consoleserverport` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_consoleserverport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_consoleserverporttemplate`
--

DROP TABLE IF EXISTS `dcim_consoleserverporttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_consoleserverporttemplate` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `device_type_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `module_type_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_consoleserverporttemplate_device_type_name_unique` (`device_type_id`,`name`),
  UNIQUE KEY `dcim_consoleserverporttemplate_module_type_name_unique` (`module_type_id`,`name`),
  KEY `dcim_consoleserverporttemplate_module_type_id_4abf751a` (`module_type_id`),
  CONSTRAINT `dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
  CONSTRAINT `dcim_consoleserverpo_module_type_id_4abf751a_fk_dcim_modu` FOREIGN KEY (`module_type_id`) REFERENCES `dcim_moduletype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_consoleserverporttemplate`
--

LOCK TABLES `dcim_consoleserverporttemplate` WRITE;
/*!40000 ALTER TABLE `dcim_consoleserverporttemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_consoleserverporttemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_controller`
--

DROP TABLE IF EXISTS `dcim_controller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_controller` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `controller_device_id` char(32) DEFAULT NULL,
  `controller_device_redundancy_group_id` char(32) DEFAULT NULL,
  `external_integration_id` char(32) DEFAULT NULL,
  `location_id` char(32) NOT NULL,
  `platform_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `capabilities` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `dcim_controller_controller_device_id_ac4051d9_fk_dcim_device_id` (`controller_device_id`),
  KEY `dcim_controller_controller_device_re_1689f27b_fk_dcim_devi` (`controller_device_redundancy_group_id`),
  KEY `dcim_controller_external_integration_656fb857_fk_extras_ex` (`external_integration_id`),
  KEY `dcim_controller_location_id_e3518103_fk_dcim_location_id` (`location_id`),
  KEY `dcim_controller_platform_id_86f63411_fk_dcim_platform_id` (`platform_id`),
  KEY `dcim_controller_tenant_id_5cc9817a_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `dcim_controller_role_id_0593bbde` (`role_id`),
  KEY `dcim_controller_status_id_d9fb93f5` (`status_id`),
  CONSTRAINT `dcim_controller_controller_device_id_ac4051d9_fk_dcim_device_id` FOREIGN KEY (`controller_device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_controller_controller_device_re_1689f27b_fk_dcim_devi` FOREIGN KEY (`controller_device_redundancy_group_id`) REFERENCES `dcim_deviceredundancygroup` (`id`),
  CONSTRAINT `dcim_controller_external_integration_656fb857_fk_extras_ex` FOREIGN KEY (`external_integration_id`) REFERENCES `extras_externalintegration` (`id`),
  CONSTRAINT `dcim_controller_location_id_e3518103_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `dcim_controller_platform_id_86f63411_fk_dcim_platform_id` FOREIGN KEY (`platform_id`) REFERENCES `dcim_platform` (`id`),
  CONSTRAINT `dcim_controller_role_id_0593bbde_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `dcim_controller_status_id_d9fb93f5_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_controller_tenant_id_5cc9817a_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_controller`
--

LOCK TABLES `dcim_controller` WRITE;
/*!40000 ALTER TABLE `dcim_controller` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_controller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_controllermanageddevicegroup`
--

DROP TABLE IF EXISTS `dcim_controllermanageddevicegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_controllermanageddevicegroup` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `weight` int unsigned NOT NULL,
  `controller_id` char(32) NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  `capabilities` json DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `dcim_controllermanag_controller_id_ca2df71d_fk_dcim_cont` (`controller_id`),
  KEY `dcim_controllermanag_parent_id_567b18e0_fk_dcim_cont` (`parent_id`),
  KEY `dcim_controllermanag_tenant_id_aa76d6c9_fk_tenancy_t` (`tenant_id`),
  CONSTRAINT `dcim_controllermanag_controller_id_ca2df71d_fk_dcim_cont` FOREIGN KEY (`controller_id`) REFERENCES `dcim_controller` (`id`),
  CONSTRAINT `dcim_controllermanag_parent_id_567b18e0_fk_dcim_cont` FOREIGN KEY (`parent_id`) REFERENCES `dcim_controllermanageddevicegroup` (`id`),
  CONSTRAINT `dcim_controllermanag_tenant_id_aa76d6c9_fk_tenancy_t` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `dcim_controllermanageddevicegroup_chk_1` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_controllermanageddevicegroup`
--

LOCK TABLES `dcim_controllermanageddevicegroup` WRITE;
/*!40000 ALTER TABLE `dcim_controllermanageddevicegroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_controllermanageddevicegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_device`
--

DROP TABLE IF EXISTS `dcim_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_device` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `local_config_context_data` json DEFAULT NULL,
  `local_config_context_data_owner_object_id` char(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `_name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) NOT NULL,
  `asset_tag` varchar(255) DEFAULT NULL,
  `position` smallint unsigned DEFAULT NULL,
  `face` varchar(50) NOT NULL,
  `vc_position` smallint unsigned DEFAULT NULL,
  `vc_priority` smallint unsigned DEFAULT NULL,
  `comments` longtext NOT NULL,
  `device_type_id` char(32) NOT NULL,
  `local_config_context_data_owner_content_type_id` int DEFAULT NULL,
  `platform_id` char(32) DEFAULT NULL,
  `primary_ip4_id` char(32) DEFAULT NULL,
  `primary_ip6_id` char(32) DEFAULT NULL,
  `rack_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `virtual_chassis_id` char(32) DEFAULT NULL,
  `local_config_context_schema_id` char(32) DEFAULT NULL,
  `secrets_group_id` char(32) DEFAULT NULL,
  `location_id` char(32) NOT NULL,
  `device_redundancy_group_priority` int unsigned DEFAULT NULL,
  `device_redundancy_group_id` char(32) DEFAULT NULL,
  `role_id` char(32) NOT NULL,
  `software_version_id` char(32) DEFAULT NULL,
  `controller_managed_device_group_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_tag` (`asset_tag`),
  UNIQUE KEY `dcim_device_virtual_chassis_id_vc_position_efea7133_uniq` (`virtual_chassis_id`,`vc_position`),
  UNIQUE KEY `dcim_device_rack_id_position_face_43208a79_uniq` (`rack_id`,`position`,`face`),
  KEY `dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id` (`device_type_id`),
  KEY `dcim_device_platform_id_468138f1_fk_dcim_platform_id` (`platform_id`),
  KEY `dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `dcim_device_status_id_96d2fc6f` (`status_id`),
  KEY `dcim_device_secrets_group_id_52d75f4a_fk_extras_secretsgroup_id` (`secrets_group_id`),
  KEY `dcim_device__name_a8ed2cdf` (`_name`),
  KEY `dcim_device_name_cfa61dd8` (`name`),
  KEY `dcim_device_serial_9170722b` (`serial`),
  KEY `dcim_device_device_redundancy_gr_ca97f1fc_fk_dcim_devi` (`device_redundancy_group_id`),
  KEY `dcim_device_new_role_id_edcafe36` (`role_id`),
  KEY `dcim_device_local_config_context_433299af_fk_django_co` (`local_config_context_data_owner_content_type_id`),
  KEY `dcim_device_local_config_context_a4c083a4_fk_extras_co` (`local_config_context_schema_id`),
  KEY `dcim_device_primary_ip4_id_2ccd943a` (`primary_ip4_id`),
  KEY `dcim_device_primary_ip6_id_d180fe91` (`primary_ip6_id`),
  KEY `dcim_device_software_version_id_5bc284cc_fk_dcim_soft` (`software_version_id`),
  KEY `dcim_device_controller_managed_d_81d03712_fk_dcim_cont` (`controller_managed_device_group_id`),
  KEY `dcim_device_location_id_11a7bedb` (`location_id`),
  CONSTRAINT `dcim_device_controller_managed_d_81d03712_fk_dcim_cont` FOREIGN KEY (`controller_managed_device_group_id`) REFERENCES `dcim_controllermanageddevicegroup` (`id`),
  CONSTRAINT `dcim_device_device_redundancy_gr_ca97f1fc_fk_dcim_devi` FOREIGN KEY (`device_redundancy_group_id`) REFERENCES `dcim_deviceredundancygroup` (`id`),
  CONSTRAINT `dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
  CONSTRAINT `dcim_device_local_config_context_433299af_fk_django_co` FOREIGN KEY (`local_config_context_data_owner_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_device_local_config_context_a4c083a4_fk_extras_co` FOREIGN KEY (`local_config_context_schema_id`) REFERENCES `extras_configcontextschema` (`id`),
  CONSTRAINT `dcim_device_location_id_11a7bedb_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `dcim_device_platform_id_468138f1_fk_dcim_platform_id` FOREIGN KEY (`platform_id`) REFERENCES `dcim_platform` (`id`),
  CONSTRAINT `dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id` FOREIGN KEY (`primary_ip4_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id` FOREIGN KEY (`primary_ip6_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `dcim_device_rack_id_23bde71f_fk_dcim_rack_id` FOREIGN KEY (`rack_id`) REFERENCES `dcim_rack` (`id`),
  CONSTRAINT `dcim_device_role_id_61edcc33_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `dcim_device_secrets_group_id_52d75f4a_fk_extras_secretsgroup_id` FOREIGN KEY (`secrets_group_id`) REFERENCES `extras_secretsgroup` (`id`),
  CONSTRAINT `dcim_device_software_version_id_5bc284cc_fk_dcim_soft` FOREIGN KEY (`software_version_id`) REFERENCES `dcim_softwareversion` (`id`),
  CONSTRAINT `dcim_device_status_id_96d2fc6f_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt` FOREIGN KEY (`virtual_chassis_id`) REFERENCES `dcim_virtualchassis` (`id`),
  CONSTRAINT `dcim_device_chk_1` CHECK ((`position` >= 0)),
  CONSTRAINT `dcim_device_chk_2` CHECK ((`vc_position` >= 0)),
  CONSTRAINT `dcim_device_chk_3` CHECK ((`vc_priority` >= 0)),
  CONSTRAINT `dcim_device_chk_4` CHECK ((`device_redundancy_group_priority` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_device`
--

LOCK TABLES `dcim_device` WRITE;
/*!40000 ALTER TABLE `dcim_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_device_software_image_files`
--

DROP TABLE IF EXISTS `dcim_device_software_image_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_device_software_image_files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `device_id` char(32) NOT NULL,
  `softwareimagefile_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_device_software_ima_device_id_softwareimagef_70442b46_uniq` (`device_id`,`softwareimagefile_id`),
  KEY `dcim_device_software_softwareimagefile_id_41a541f0_fk_dcim_soft` (`softwareimagefile_id`),
  CONSTRAINT `dcim_device_software_device_id_54aaa8f9_fk_dcim_devi` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_device_software_softwareimagefile_id_41a541f0_fk_dcim_soft` FOREIGN KEY (`softwareimagefile_id`) REFERENCES `dcim_softwareimagefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_device_software_image_files`
--

LOCK TABLES `dcim_device_software_image_files` WRITE;
/*!40000 ALTER TABLE `dcim_device_software_image_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_device_software_image_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_devicebay`
--

DROP TABLE IF EXISTS `dcim_devicebay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_devicebay` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `device_id` char(32) NOT NULL,
  `installed_device_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_devicebay_device_id_name_2475a67b_uniq` (`device_id`,`name`),
  UNIQUE KEY `installed_device_id` (`installed_device_id`),
  KEY `dcim_devicebay_name_ee470978` (`name`),
  KEY `dcim_devicebay__name_d9f2bdd3` (`_name`),
  CONSTRAINT `dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id` FOREIGN KEY (`installed_device_id`) REFERENCES `dcim_device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_devicebay`
--

LOCK TABLES `dcim_devicebay` WRITE;
/*!40000 ALTER TABLE `dcim_devicebay` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_devicebay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_devicebaytemplate`
--

DROP TABLE IF EXISTS `dcim_devicebaytemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_devicebaytemplate` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `device_type_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq` (`device_type_id`,`name`),
  CONSTRAINT `dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_devicebaytemplate`
--

LOCK TABLES `dcim_devicebaytemplate` WRITE;
/*!40000 ALTER TABLE `dcim_devicebaytemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_devicebaytemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_deviceclusterassignment`
--

DROP TABLE IF EXISTS `dcim_deviceclusterassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_deviceclusterassignment` (
  `id` char(32) NOT NULL,
  `cluster_id` char(32) NOT NULL,
  `device_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_deviceclusterassignment_device_id_cluster_id_a7029fa6_uniq` (`device_id`,`cluster_id`),
  KEY `dcim_deviceclusteras_cluster_id_1d7e167c_fk_virtualiz` (`cluster_id`),
  CONSTRAINT `dcim_deviceclusteras_cluster_id_1d7e167c_fk_virtualiz` FOREIGN KEY (`cluster_id`) REFERENCES `virtualization_cluster` (`id`),
  CONSTRAINT `dcim_deviceclusteras_device_id_8b6ac12e_fk_dcim_devi` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_deviceclusterassignment`
--

LOCK TABLES `dcim_deviceclusterassignment` WRITE;
/*!40000 ALTER TABLE `dcim_deviceclusterassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_deviceclusterassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_devicefamily`
--

DROP TABLE IF EXISTS `dcim_devicefamily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_devicefamily` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_devicefamily`
--

LOCK TABLES `dcim_devicefamily` WRITE;
/*!40000 ALTER TABLE `dcim_devicefamily` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_devicefamily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_deviceredundancygroup`
--

DROP TABLE IF EXISTS `dcim_deviceredundancygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_deviceredundancygroup` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `failover_strategy` varchar(50) NOT NULL,
  `comments` longtext NOT NULL,
  `secrets_group_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `dcim_deviceredundanc_secrets_group_id_19061ee9_fk_extras_se` (`secrets_group_id`),
  KEY `dcim_deviceredundancygroup_status_id_de1ca6f3` (`status_id`),
  CONSTRAINT `dcim_deviceredundanc_secrets_group_id_19061ee9_fk_extras_se` FOREIGN KEY (`secrets_group_id`) REFERENCES `extras_secretsgroup` (`id`),
  CONSTRAINT `dcim_deviceredundanc_status_id_de1ca6f3_fk_extras_st` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_deviceredundancygroup`
--

LOCK TABLES `dcim_deviceredundancygroup` WRITE;
/*!40000 ALTER TABLE `dcim_deviceredundancygroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_deviceredundancygroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_devicetype`
--

DROP TABLE IF EXISTS `dcim_devicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_devicetype` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `model` varchar(255) NOT NULL,
  `part_number` varchar(255) NOT NULL,
  `u_height` smallint unsigned NOT NULL,
  `is_full_depth` tinyint(1) NOT NULL,
  `subdevice_role` varchar(50) NOT NULL,
  `front_image` varchar(100) NOT NULL,
  `rear_image` varchar(100) NOT NULL,
  `comments` longtext NOT NULL,
  `manufacturer_id` char(32) NOT NULL,
  `device_family_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_devicetype_manufacturer_id_model_17948c0c_uniq` (`manufacturer_id`,`model`),
  KEY `dcim_devicetype_device_family_id_e02e7c53_fk_dcim_devi` (`device_family_id`),
  CONSTRAINT `dcim_devicetype_device_family_id_e02e7c53_fk_dcim_devi` FOREIGN KEY (`device_family_id`) REFERENCES `dcim_devicefamily` (`id`),
  CONSTRAINT `dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manufacturer_id` FOREIGN KEY (`manufacturer_id`) REFERENCES `dcim_manufacturer` (`id`),
  CONSTRAINT `dcim_devicetype_chk_1` CHECK ((`u_height` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_devicetype`
--

LOCK TABLES `dcim_devicetype` WRITE;
/*!40000 ALTER TABLE `dcim_devicetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_devicetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_devicetypetosoftwareimagefile`
--

DROP TABLE IF EXISTS `dcim_devicetypetosoftwareimagefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_devicetypetosoftwareimagefile` (
  `id` char(32) NOT NULL,
  `device_type_id` char(32) NOT NULL,
  `software_image_file_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_devicetypetosoftwar_device_type_id_software__35e2e1a8_uniq` (`device_type_id`,`software_image_file_id`),
  KEY `dcim_devicetypetosof_software_image_file__ce1ed3c6_fk_dcim_soft` (`software_image_file_id`),
  CONSTRAINT `dcim_devicetypetosof_device_type_id_74d7511c_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
  CONSTRAINT `dcim_devicetypetosof_software_image_file__ce1ed3c6_fk_dcim_soft` FOREIGN KEY (`software_image_file_id`) REFERENCES `dcim_softwareimagefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_devicetypetosoftwareimagefile`
--

LOCK TABLES `dcim_devicetypetosoftwareimagefile` WRITE;
/*!40000 ALTER TABLE `dcim_devicetypetosoftwareimagefile` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_devicetypetosoftwareimagefile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_frontport`
--

DROP TABLE IF EXISTS `dcim_frontport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_frontport` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `rear_port_position` smallint unsigned NOT NULL,
  `device_id` char(32) DEFAULT NULL,
  `rear_port_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `module_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_frontport_rear_port_position_unique` (`rear_port_id`,`rear_port_position`),
  UNIQUE KEY `dcim_frontport_module_name_unique` (`module_id`,`name`),
  KEY `dcim_frontport_name_8972111f` (`name`),
  KEY `dcim_frontport__name_273b2ca3` (`_name`),
  KEY `dcim_frontport_module_id_952c3f9a` (`module_id`),
  KEY `dcim_frontport_device_id_950557b5` (`device_id`),
  CONSTRAINT `dcim_frontport_device_id_950557b5_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_frontport_module_id_952c3f9a_fk_dcim_module_id` FOREIGN KEY (`module_id`) REFERENCES `dcim_module` (`id`),
  CONSTRAINT `dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id` FOREIGN KEY (`rear_port_id`) REFERENCES `dcim_rearport` (`id`),
  CONSTRAINT `dcim_frontport_chk_1` CHECK ((`rear_port_position` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_frontport`
--

LOCK TABLES `dcim_frontport` WRITE;
/*!40000 ALTER TABLE `dcim_frontport` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_frontport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_frontporttemplate`
--

DROP TABLE IF EXISTS `dcim_frontporttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_frontporttemplate` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `rear_port_position` smallint unsigned NOT NULL,
  `device_type_id` char(32) DEFAULT NULL,
  `rear_port_template_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `module_type_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_frontporttemplate_rear_port_template_position_unique` (`rear_port_template_id`,`rear_port_position`),
  UNIQUE KEY `dcim_frontporttemplate_device_type_name_unique` (`device_type_id`,`name`),
  UNIQUE KEY `dcim_frontporttemplate_module_type_name_unique` (`module_type_id`,`name`),
  KEY `dcim_frontporttemplate_module_type_id_66851ff9` (`module_type_id`),
  CONSTRAINT `dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
  CONSTRAINT `dcim_frontporttempla_module_type_id_66851ff9_fk_dcim_modu` FOREIGN KEY (`module_type_id`) REFERENCES `dcim_moduletype` (`id`),
  CONSTRAINT `dcim_frontporttempla_rear_port_template_i_d6a910d0_fk_dcim_rear` FOREIGN KEY (`rear_port_template_id`) REFERENCES `dcim_rearporttemplate` (`id`),
  CONSTRAINT `dcim_frontporttemplate_chk_1` CHECK ((`rear_port_position` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_frontporttemplate`
--

LOCK TABLES `dcim_frontporttemplate` WRITE;
/*!40000 ALTER TABLE `dcim_frontporttemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_frontporttemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_interface`
--

DROP TABLE IF EXISTS `dcim_interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_interface` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `mac_address` varchar(18) NOT NULL,
  `mtu` int unsigned DEFAULT NULL,
  `mode` varchar(50) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `mgmt_only` tinyint(1) NOT NULL,
  `device_id` char(32) DEFAULT NULL,
  `lag_id` char(32) DEFAULT NULL,
  `untagged_vlan_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `parent_interface_id` char(32) DEFAULT NULL,
  `bridge_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `vrf_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  `module_id` char(32) DEFAULT NULL,
  `duplex` varchar(10) NOT NULL,
  `speed` int unsigned DEFAULT NULL,
  `port_type` varchar(50) NOT NULL,
  `breakout_position` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_interface_module_name_unique` (`module_id`,`name`),
  UNIQUE KEY `dcim_interface_unique_parent_breakout_position` (`parent_interface_id`,`breakout_position`),
  KEY `dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id` (`lag_id`),
  KEY `dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id` (`untagged_vlan_id`),
  KEY `dcim_interface_name_bc4e48ab` (`name`),
  KEY `dcim_interface__name_8796fa61` (`_name`),
  KEY `dcim_interface_status_id_5d68d3d6` (`status_id`),
  KEY `dcim_interface_bridge_id_f2a8df85_fk_dcim_interface_id` (`bridge_id`),
  KEY `dcim_interface_vrf_id_a92e59b2_fk_ipam_vrf_id` (`vrf_id`),
  KEY `dcim_interface_role_id_0c0a2a5d` (`role_id`),
  KEY `dcim_interface_module_id_05ca2da5` (`module_id`),
  KEY `dcim_interface_device_id_359c6115` (`device_id`),
  CONSTRAINT `dcim_interface_bridge_id_f2a8df85_fk_dcim_interface_id` FOREIGN KEY (`bridge_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `dcim_interface_device_id_359c6115_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id` FOREIGN KEY (`lag_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `dcim_interface_module_id_05ca2da5_fk_dcim_module_id` FOREIGN KEY (`module_id`) REFERENCES `dcim_module` (`id`),
  CONSTRAINT `dcim_interface_parent_interface_id_dc46b61a_fk_dcim_interface_id` FOREIGN KEY (`parent_interface_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `dcim_interface_role_id_0c0a2a5d_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `dcim_interface_status_id_5d68d3d6_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id` FOREIGN KEY (`untagged_vlan_id`) REFERENCES `ipam_vlan` (`id`),
  CONSTRAINT `dcim_interface_vrf_id_a92e59b2_fk_ipam_vrf_id` FOREIGN KEY (`vrf_id`) REFERENCES `ipam_vrf` (`id`),
  CONSTRAINT `dcim_interface_chk_1` CHECK ((`mtu` >= 0)),
  CONSTRAINT `dcim_interface_chk_2` CHECK ((`speed` >= 0)),
  CONSTRAINT `dcim_interface_chk_3` CHECK ((`breakout_position` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_interface`
--

LOCK TABLES `dcim_interface` WRITE;
/*!40000 ALTER TABLE `dcim_interface` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_interface_tagged_vlans`
--

DROP TABLE IF EXISTS `dcim_interface_tagged_vlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_interface_tagged_vlans` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `interface_id` char(32) NOT NULL,
  `vlan_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq` (`interface_id`,`vlan_id`),
  KEY `dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id` (`vlan_id`),
  CONSTRAINT `dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte` FOREIGN KEY (`interface_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id` FOREIGN KEY (`vlan_id`) REFERENCES `ipam_vlan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_interface_tagged_vlans`
--

LOCK TABLES `dcim_interface_tagged_vlans` WRITE;
/*!40000 ALTER TABLE `dcim_interface_tagged_vlans` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_interface_tagged_vlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_interfaceredundancygroup`
--

DROP TABLE IF EXISTS `dcim_interfaceredundancygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_interfaceredundancygroup` (
  `id` char(32) NOT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` datetime(6) NOT NULL,
  `description` varchar(255) NOT NULL,
  `protocol` varchar(50) NOT NULL,
  `protocol_group_id` varchar(255) NOT NULL,
  `secrets_group_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `virtual_ip_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `dcim_interfaceredund_secrets_group_id_e31c9631_fk_extras_se` (`secrets_group_id`),
  KEY `dcim_interfaceredund_virtual_ip_id_14cbd633_fk_ipam_ipad` (`virtual_ip_id`),
  KEY `dcim_interfaceredundancygroup_status_id_751f2043` (`status_id`),
  CONSTRAINT `dcim_interfaceredund_secrets_group_id_e31c9631_fk_extras_se` FOREIGN KEY (`secrets_group_id`) REFERENCES `extras_secretsgroup` (`id`),
  CONSTRAINT `dcim_interfaceredund_status_id_751f2043_fk_extras_st` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_interfaceredund_virtual_ip_id_14cbd633_fk_ipam_ipad` FOREIGN KEY (`virtual_ip_id`) REFERENCES `ipam_ipaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_interfaceredundancygroup`
--

LOCK TABLES `dcim_interfaceredundancygroup` WRITE;
/*!40000 ALTER TABLE `dcim_interfaceredundancygroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_interfaceredundancygroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_interfaceredundancygroupassociation`
--

DROP TABLE IF EXISTS `dcim_interfaceredundancygroupassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_interfaceredundancygroupassociation` (
  `id` char(32) NOT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `priority` int unsigned NOT NULL,
  `interface_id` char(32) NOT NULL,
  `interface_redundancy_group_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_interfaceredundancy_interface_redundancy_gro_5aece630_uniq` (`interface_redundancy_group_id`,`interface_id`),
  KEY `dcim_interfaceredund_interface_id_a2cd97e8_fk_dcim_inte` (`interface_id`),
  CONSTRAINT `dcim_interfaceredund_interface_id_a2cd97e8_fk_dcim_inte` FOREIGN KEY (`interface_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `dcim_interfaceredund_interface_redundancy_a12adcaa_fk_dcim_inte` FOREIGN KEY (`interface_redundancy_group_id`) REFERENCES `dcim_interfaceredundancygroup` (`id`),
  CONSTRAINT `dcim_interfaceredundancygroupassociation_chk_1` CHECK ((`priority` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_interfaceredundancygroupassociation`
--

LOCK TABLES `dcim_interfaceredundancygroupassociation` WRITE;
/*!40000 ALTER TABLE `dcim_interfaceredundancygroupassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_interfaceredundancygroupassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_interfacetemplate`
--

DROP TABLE IF EXISTS `dcim_interfacetemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_interfacetemplate` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `mgmt_only` tinyint(1) NOT NULL,
  `device_type_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `module_type_id` char(32) DEFAULT NULL,
  `duplex` varchar(10) NOT NULL,
  `speed` int unsigned DEFAULT NULL,
  `port_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_interfacetemplate_device_type_name_unique` (`device_type_id`,`name`),
  UNIQUE KEY `dcim_interfacetemplate_module_type_name_unique` (`module_type_id`,`name`),
  KEY `dcim_interfacetemplate_module_type_id_f941f180` (`module_type_id`),
  CONSTRAINT `dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
  CONSTRAINT `dcim_interfacetempla_module_type_id_f941f180_fk_dcim_modu` FOREIGN KEY (`module_type_id`) REFERENCES `dcim_moduletype` (`id`),
  CONSTRAINT `dcim_interfacetemplate_chk_1` CHECK ((`speed` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_interfacetemplate`
--

LOCK TABLES `dcim_interfacetemplate` WRITE;
/*!40000 ALTER TABLE `dcim_interfacetemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_interfacetemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_interfacevdcassignment`
--

DROP TABLE IF EXISTS `dcim_interfacevdcassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_interfacevdcassignment` (
  `id` char(32) NOT NULL,
  `interface_id` char(32) NOT NULL,
  `virtual_device_context_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_interfacevdcassignm_virtual_device_context_i_66758687_uniq` (`virtual_device_context_id`,`interface_id`),
  KEY `dcim_interfacevdcass_interface_id_eb9f75eb_fk_dcim_inte` (`interface_id`),
  CONSTRAINT `dcim_interfacevdcass_interface_id_eb9f75eb_fk_dcim_inte` FOREIGN KEY (`interface_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `dcim_interfacevdcass_virtual_device_conte_9aa240e5_fk_dcim_virt` FOREIGN KEY (`virtual_device_context_id`) REFERENCES `dcim_virtualdevicecontext` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_interfacevdcassignment`
--

LOCK TABLES `dcim_interfacevdcassignment` WRITE;
/*!40000 ALTER TABLE `dcim_interfacevdcassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_interfacevdcassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_inventoryitem`
--

DROP TABLE IF EXISTS `dcim_inventoryitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_inventoryitem` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `part_id` varchar(255) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `asset_tag` varchar(255) DEFAULT NULL,
  `discovered` tinyint(1) NOT NULL,
  `device_id` char(32) NOT NULL,
  `manufacturer_id` char(32) DEFAULT NULL,
  `parent_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `software_version_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_tag` (`asset_tag`),
  UNIQUE KEY `dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq` (`device_id`,`parent_id`,`name`),
  KEY `dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu` (`manufacturer_id`),
  KEY `dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id` (`parent_id`),
  KEY `dcim_inventoryitem_name_3e415949` (`name`),
  KEY `dcim_inventoryitem_serial_9f53019e` (`serial`),
  KEY `dcim_inventoryitem__name_959f73cc` (`_name`),
  KEY `dcim_inventoryitem_software_version_id_0e33b2f2_fk_dcim_soft` (`software_version_id`),
  CONSTRAINT `dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu` FOREIGN KEY (`manufacturer_id`) REFERENCES `dcim_manufacturer` (`id`),
  CONSTRAINT `dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id` FOREIGN KEY (`parent_id`) REFERENCES `dcim_inventoryitem` (`id`),
  CONSTRAINT `dcim_inventoryitem_software_version_id_0e33b2f2_fk_dcim_soft` FOREIGN KEY (`software_version_id`) REFERENCES `dcim_softwareversion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_inventoryitem`
--

LOCK TABLES `dcim_inventoryitem` WRITE;
/*!40000 ALTER TABLE `dcim_inventoryitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_inventoryitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_inventoryitem_software_image_files`
--

DROP TABLE IF EXISTS `dcim_inventoryitem_software_image_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_inventoryitem_software_image_files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `inventoryitem_id` char(32) NOT NULL,
  `softwareimagefile_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_inventoryitem_softw_inventoryitem_id_softwar_1e7b0b5c_uniq` (`inventoryitem_id`,`softwareimagefile_id`),
  KEY `dcim_inventoryitem_s_softwareimagefile_id_6c5e374d_fk_dcim_soft` (`softwareimagefile_id`),
  CONSTRAINT `dcim_inventoryitem_s_inventoryitem_id_f580bb3c_fk_dcim_inve` FOREIGN KEY (`inventoryitem_id`) REFERENCES `dcim_inventoryitem` (`id`),
  CONSTRAINT `dcim_inventoryitem_s_softwareimagefile_id_6c5e374d_fk_dcim_soft` FOREIGN KEY (`softwareimagefile_id`) REFERENCES `dcim_softwareimagefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_inventoryitem_software_image_files`
--

LOCK TABLES `dcim_inventoryitem_software_image_files` WRITE;
/*!40000 ALTER TABLE `dcim_inventoryitem_software_image_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_inventoryitem_software_image_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_location`
--

DROP TABLE IF EXISTS `dcim_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_location` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `location_type_id` char(32) NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `asn` bigint DEFAULT NULL,
  `comments` longtext NOT NULL,
  `contact_email` varchar(254) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `facility` varchar(255) NOT NULL,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `physical_address` longtext NOT NULL,
  `shipping_address` longtext NOT NULL,
  `time_zone` varchar(63) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_location_parent_id_name_1e7c6218_uniq` (`parent_id`,`name`),
  KEY `dcim_location_location_type_id_511a9421_fk_dcim_locationtype_id` (`location_type_id`),
  KEY `dcim_location_tenant_id_2c4df974_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `dcim_location_name_da208275` (`name`),
  KEY `dcim_location__name_09ea12a5` (`_name`),
  KEY `dcim_location_status_id_3d74f10a` (`status_id`),
  CONSTRAINT `dcim_location_location_type_id_511a9421_fk_dcim_locationtype_id` FOREIGN KEY (`location_type_id`) REFERENCES `dcim_locationtype` (`id`),
  CONSTRAINT `dcim_location_parent_id_d77f3318_fk_dcim_location_id` FOREIGN KEY (`parent_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `dcim_location_status_id_3d74f10a_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_location_tenant_id_2c4df974_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_location`
--

LOCK TABLES `dcim_location` WRITE;
/*!40000 ALTER TABLE `dcim_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_locationtype`
--

DROP TABLE IF EXISTS `dcim_locationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_locationtype` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  `nestable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `dcim_locationtype_parent_id_023ca1c8_fk_dcim_locationtype_id` (`parent_id`),
  CONSTRAINT `dcim_locationtype_parent_id_023ca1c8_fk_dcim_locationtype_id` FOREIGN KEY (`parent_id`) REFERENCES `dcim_locationtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_locationtype`
--

LOCK TABLES `dcim_locationtype` WRITE;
/*!40000 ALTER TABLE `dcim_locationtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_locationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_locationtype_content_types`
--

DROP TABLE IF EXISTS `dcim_locationtype_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_locationtype_content_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `locationtype_id` char(32) NOT NULL,
  `contenttype_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_locationtype_conten_locationtype_id_contentt_58938a25_uniq` (`locationtype_id`,`contenttype_id`),
  KEY `dcim_locationtype_co_contenttype_id_806c318e_fk_django_co` (`contenttype_id`),
  CONSTRAINT `dcim_locationtype_co_contenttype_id_806c318e_fk_django_co` FOREIGN KEY (`contenttype_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_locationtype_co_locationtype_id_daa2005b_fk_dcim_loca` FOREIGN KEY (`locationtype_id`) REFERENCES `dcim_locationtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_locationtype_content_types`
--

LOCK TABLES `dcim_locationtype_content_types` WRITE;
/*!40000 ALTER TABLE `dcim_locationtype_content_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_locationtype_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_manufacturer`
--

DROP TABLE IF EXISTS `dcim_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_manufacturer` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_manufacturer`
--

LOCK TABLES `dcim_manufacturer` WRITE;
/*!40000 ALTER TABLE `dcim_manufacturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_module`
--

DROP TABLE IF EXISTS `dcim_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_module` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `asset_tag` varchar(255) DEFAULT NULL,
  `location_id` char(32) DEFAULT NULL,
  `module_type_id` char(32) NOT NULL,
  `parent_module_bay_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_tag` (`asset_tag`),
  UNIQUE KEY `parent_module_bay_id` (`parent_module_bay_id`),
  UNIQUE KEY `dcim_module_module_type_serial_unique` (`module_type_id`,`serial`),
  KEY `dcim_module_location_id_e5fb18b4_fk_dcim_location_id` (`location_id`),
  KEY `dcim_module_tenant_id_16f147cb_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `dcim_module_serial_45693f90` (`serial`),
  KEY `dcim_module_role_id_cd7e97ed` (`role_id`),
  KEY `dcim_module_status_id_aa4a1ce4` (`status_id`),
  CONSTRAINT `dcim_module_location_id_e5fb18b4_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `dcim_module_module_type_id_a50b39fc_fk_dcim_moduletype_id` FOREIGN KEY (`module_type_id`) REFERENCES `dcim_moduletype` (`id`),
  CONSTRAINT `dcim_module_parent_module_bay_id_43d98869_fk_dcim_modulebay_id` FOREIGN KEY (`parent_module_bay_id`) REFERENCES `dcim_modulebay` (`id`),
  CONSTRAINT `dcim_module_role_id_cd7e97ed_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `dcim_module_status_id_aa4a1ce4_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_module_tenant_id_16f147cb_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_module`
--

LOCK TABLES `dcim_module` WRITE;
/*!40000 ALTER TABLE `dcim_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_modulebay`
--

DROP TABLE IF EXISTS `dcim_modulebay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_modulebay` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `position` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `parent_device_id` char(32) DEFAULT NULL,
  `parent_module_id` char(32) DEFAULT NULL,
  `requires_first_party_modules` tinyint(1) NOT NULL,
  `module_family_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_modulebay_parent_module_name_unique` (`parent_module_id`,`name`),
  KEY `dcim_modulebay_name_7b5cb727` (`name`),
  KEY `dcim_modulebay__name_92226737` (`_name`),
  KEY `dcim_modulebay_module_family_id_c5964e05_fk_dcim_modulefamily_id` (`module_family_id`),
  KEY `dcim_modulebay_parent_device_id_38ff7f03` (`parent_device_id`),
  CONSTRAINT `dcim_modulebay_module_family_id_c5964e05_fk_dcim_modulefamily_id` FOREIGN KEY (`module_family_id`) REFERENCES `dcim_modulefamily` (`id`),
  CONSTRAINT `dcim_modulebay_parent_device_id_38ff7f03_fk_dcim_device_id` FOREIGN KEY (`parent_device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_modulebay_parent_module_id_d76b681b_fk_dcim_module_id` FOREIGN KEY (`parent_module_id`) REFERENCES `dcim_module` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_modulebay`
--

LOCK TABLES `dcim_modulebay` WRITE;
/*!40000 ALTER TABLE `dcim_modulebay` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_modulebay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_modulebaytemplate`
--

DROP TABLE IF EXISTS `dcim_modulebaytemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_modulebaytemplate` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `position` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `device_type_id` char(32) DEFAULT NULL,
  `module_type_id` char(32) DEFAULT NULL,
  `requires_first_party_modules` tinyint(1) NOT NULL,
  `module_family_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_modulebaytemplate_device_type_name_unique` (`device_type_id`,`name`),
  UNIQUE KEY `dcim_modulebaytemplate_module_type_name_unique` (`module_type_id`,`name`),
  KEY `dcim_modulebaytemplate_device_type_id_9eaf9bd3` (`device_type_id`),
  KEY `dcim_modulebaytemplate_module_type_id_2fdfb491` (`module_type_id`),
  KEY `dcim_modulebaytempla_module_family_id_b0d298c7_fk_dcim_modu` (`module_family_id`),
  CONSTRAINT `dcim_modulebaytempla_device_type_id_9eaf9bd3_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
  CONSTRAINT `dcim_modulebaytempla_module_family_id_b0d298c7_fk_dcim_modu` FOREIGN KEY (`module_family_id`) REFERENCES `dcim_modulefamily` (`id`),
  CONSTRAINT `dcim_modulebaytempla_module_type_id_2fdfb491_fk_dcim_modu` FOREIGN KEY (`module_type_id`) REFERENCES `dcim_moduletype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_modulebaytemplate`
--

LOCK TABLES `dcim_modulebaytemplate` WRITE;
/*!40000 ALTER TABLE `dcim_modulebaytemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_modulebaytemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_modulefamily`
--

DROP TABLE IF EXISTS `dcim_modulefamily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_modulefamily` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_modulefamily`
--

LOCK TABLES `dcim_modulefamily` WRITE;
/*!40000 ALTER TABLE `dcim_modulefamily` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_modulefamily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_moduletype`
--

DROP TABLE IF EXISTS `dcim_moduletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_moduletype` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `model` varchar(255) NOT NULL,
  `part_number` varchar(255) NOT NULL,
  `comments` longtext NOT NULL,
  `manufacturer_id` char(32) NOT NULL,
  `module_family_id` char(32) DEFAULT NULL,
  `front_image` varchar(100) NOT NULL,
  `rear_image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_moduletype_manufacturer_id_model_bd40def7_uniq` (`manufacturer_id`,`model`),
  KEY `dcim_moduletype_module_family_id_07bf5351_fk_dcim_modu` (`module_family_id`),
  CONSTRAINT `dcim_moduletype_manufacturer_id_7347392e_fk_dcim_manufacturer_id` FOREIGN KEY (`manufacturer_id`) REFERENCES `dcim_manufacturer` (`id`),
  CONSTRAINT `dcim_moduletype_module_family_id_07bf5351_fk_dcim_modu` FOREIGN KEY (`module_family_id`) REFERENCES `dcim_modulefamily` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_moduletype`
--

LOCK TABLES `dcim_moduletype` WRITE;
/*!40000 ALTER TABLE `dcim_moduletype` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_moduletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_platform`
--

DROP TABLE IF EXISTS `dcim_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_platform` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `napalm_driver` varchar(255) NOT NULL,
  `napalm_args` json DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `manufacturer_id` char(32) DEFAULT NULL,
  `network_driver` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id` (`manufacturer_id`),
  CONSTRAINT `dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id` FOREIGN KEY (`manufacturer_id`) REFERENCES `dcim_manufacturer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_platform`
--

LOCK TABLES `dcim_platform` WRITE;
/*!40000 ALTER TABLE `dcim_platform` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_powerfeed`
--

DROP TABLE IF EXISTS `dcim_powerfeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_powerfeed` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `supply` varchar(50) NOT NULL,
  `phase` varchar(50) NOT NULL,
  `voltage` smallint NOT NULL,
  `amperage` smallint unsigned NOT NULL,
  `max_utilization` smallint unsigned NOT NULL,
  `available_power` int unsigned NOT NULL,
  `comments` longtext NOT NULL,
  `power_panel_id` char(32) NOT NULL,
  `rack_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `breaker_pole_count` smallint unsigned DEFAULT NULL,
  `breaker_position` int unsigned DEFAULT NULL,
  `destination_panel_id` char(32) DEFAULT NULL,
  `power_path` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq` (`power_panel_id`,`name`),
  UNIQUE KEY `dcim_powerfeed_power_panel_id_breaker_position_9a88b2a3_uniq` (`power_panel_id`,`breaker_position`),
  KEY `dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id` (`rack_id`),
  KEY `dcim_powerfeed_status_id_8c424cc3` (`status_id`),
  KEY `dcim_powerfeed_destination_panel_id_7f6d6103_fk_dcim_powe` (`destination_panel_id`),
  KEY `dcim_powerf_power_p_b4d96d_idx` (`power_panel_id`,`breaker_position`),
  CONSTRAINT `dcim_powerfeed_destination_panel_id_7f6d6103_fk_dcim_powe` FOREIGN KEY (`destination_panel_id`) REFERENCES `dcim_powerpanel` (`id`),
  CONSTRAINT `dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id` FOREIGN KEY (`power_panel_id`) REFERENCES `dcim_powerpanel` (`id`),
  CONSTRAINT `dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id` FOREIGN KEY (`rack_id`) REFERENCES `dcim_rack` (`id`),
  CONSTRAINT `dcim_powerfeed_status_id_8c424cc3_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_powerfeed_chk_1` CHECK ((`amperage` >= 0)),
  CONSTRAINT `dcim_powerfeed_chk_2` CHECK ((`max_utilization` >= 0)),
  CONSTRAINT `dcim_powerfeed_chk_3` CHECK ((`available_power` >= 0)),
  CONSTRAINT `dcim_powerfeed_chk_4` CHECK ((`breaker_pole_count` >= 0)),
  CONSTRAINT `dcim_powerfeed_chk_5` CHECK ((`breaker_position` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_powerfeed`
--

LOCK TABLES `dcim_powerfeed` WRITE;
/*!40000 ALTER TABLE `dcim_powerfeed` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_powerfeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_poweroutlet`
--

DROP TABLE IF EXISTS `dcim_poweroutlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_poweroutlet` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `feed_leg` varchar(50) NOT NULL,
  `device_id` char(32) DEFAULT NULL,
  `power_port_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `module_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_poweroutlet_module_name_unique` (`module_id`,`name`),
  KEY `dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id` (`power_port_id`),
  KEY `dcim_poweroutlet_name_98c8e7a2` (`name`),
  KEY `dcim_poweroutlet__name_0ecdd374` (`_name`),
  KEY `dcim_poweroutlet_module_id_032f5af2` (`module_id`),
  KEY `dcim_poweroutlet_device_id_286351d7` (`device_id`),
  CONSTRAINT `dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_poweroutlet_module_id_032f5af2_fk_dcim_module_id` FOREIGN KEY (`module_id`) REFERENCES `dcim_module` (`id`),
  CONSTRAINT `dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id` FOREIGN KEY (`power_port_id`) REFERENCES `dcim_powerport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_poweroutlet`
--

LOCK TABLES `dcim_poweroutlet` WRITE;
/*!40000 ALTER TABLE `dcim_poweroutlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_poweroutlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_poweroutlettemplate`
--

DROP TABLE IF EXISTS `dcim_poweroutlettemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_poweroutlettemplate` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `feed_leg` varchar(50) NOT NULL,
  `device_type_id` char(32) DEFAULT NULL,
  `power_port_template_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `module_type_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_poweroutlettemplate_device_type_name_unique` (`device_type_id`,`name`),
  UNIQUE KEY `dcim_poweroutlettemplate_module_type_name_unique` (`module_type_id`,`name`),
  KEY `dcim_poweroutlettemp_power_port_template__fd11e222_fk_dcim_powe` (`power_port_template_id`),
  KEY `dcim_poweroutlettemplate_module_type_id_6142b416` (`module_type_id`),
  CONSTRAINT `dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
  CONSTRAINT `dcim_poweroutlettemp_module_type_id_6142b416_fk_dcim_modu` FOREIGN KEY (`module_type_id`) REFERENCES `dcim_moduletype` (`id`),
  CONSTRAINT `dcim_poweroutlettemp_power_port_template__fd11e222_fk_dcim_powe` FOREIGN KEY (`power_port_template_id`) REFERENCES `dcim_powerporttemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_poweroutlettemplate`
--

LOCK TABLES `dcim_poweroutlettemplate` WRITE;
/*!40000 ALTER TABLE `dcim_poweroutlettemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_poweroutlettemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_powerpanel`
--

DROP TABLE IF EXISTS `dcim_powerpanel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_powerpanel` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `rack_group_id` char(32) DEFAULT NULL,
  `location_id` char(32) NOT NULL,
  `breaker_position_count` int unsigned DEFAULT NULL,
  `panel_type` varchar(30) NOT NULL,
  `power_path` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_powerpanel_location_id_name_682403ca_uniq` (`location_id`,`name`),
  KEY `dcim_powerpanel_rack_group_id_76467cc9_fk_dcim_rackgroup_id` (`rack_group_id`),
  KEY `dcim_powerpanel_name_09946067` (`name`),
  CONSTRAINT `dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `dcim_powerpanel_rack_group_id_76467cc9_fk_dcim_rackgroup_id` FOREIGN KEY (`rack_group_id`) REFERENCES `dcim_rackgroup` (`id`),
  CONSTRAINT `dcim_powerpanel_chk_1` CHECK ((`breaker_position_count` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_powerpanel`
--

LOCK TABLES `dcim_powerpanel` WRITE;
/*!40000 ALTER TABLE `dcim_powerpanel` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_powerpanel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_powerport`
--

DROP TABLE IF EXISTS `dcim_powerport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_powerport` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `maximum_draw` smallint unsigned DEFAULT NULL,
  `allocated_draw` smallint unsigned DEFAULT NULL,
  `device_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `module_id` char(32) DEFAULT NULL,
  `power_factor` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_powerport_module_name_unique` (`module_id`,`name`),
  KEY `dcim_powerport_name_8b95aa68` (`name`),
  KEY `dcim_powerport__name_cd2ccdac` (`_name`),
  KEY `dcim_powerport_module_id_d0c27534` (`module_id`),
  KEY `dcim_powerport_device_id_ef7185ae` (`device_id`),
  CONSTRAINT `dcim_powerport_device_id_ef7185ae_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_powerport_module_id_d0c27534_fk_dcim_module_id` FOREIGN KEY (`module_id`) REFERENCES `dcim_module` (`id`),
  CONSTRAINT `dcim_powerport_chk_1` CHECK ((`maximum_draw` >= 0)),
  CONSTRAINT `dcim_powerport_chk_2` CHECK ((`allocated_draw` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_powerport`
--

LOCK TABLES `dcim_powerport` WRITE;
/*!40000 ALTER TABLE `dcim_powerport` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_powerport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_powerporttemplate`
--

DROP TABLE IF EXISTS `dcim_powerporttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_powerporttemplate` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `maximum_draw` smallint unsigned DEFAULT NULL,
  `allocated_draw` smallint unsigned DEFAULT NULL,
  `device_type_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `module_type_id` char(32) DEFAULT NULL,
  `power_factor` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_powerporttemplate_device_type_name_unique` (`device_type_id`,`name`),
  UNIQUE KEY `dcim_powerporttemplate_module_type_name_unique` (`module_type_id`,`name`),
  KEY `dcim_powerporttemplate_module_type_id_93e26849` (`module_type_id`),
  CONSTRAINT `dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
  CONSTRAINT `dcim_powerporttempla_module_type_id_93e26849_fk_dcim_modu` FOREIGN KEY (`module_type_id`) REFERENCES `dcim_moduletype` (`id`),
  CONSTRAINT `dcim_powerporttemplate_chk_1` CHECK ((`maximum_draw` >= 0)),
  CONSTRAINT `dcim_powerporttemplate_chk_2` CHECK ((`allocated_draw` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_powerporttemplate`
--

LOCK TABLES `dcim_powerporttemplate` WRITE;
/*!40000 ALTER TABLE `dcim_powerporttemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_powerporttemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_rack`
--

DROP TABLE IF EXISTS `dcim_rack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_rack` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `facility_id` varchar(50) DEFAULT NULL,
  `serial` varchar(255) NOT NULL,
  `asset_tag` varchar(255) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `width` smallint unsigned NOT NULL,
  `u_height` smallint unsigned NOT NULL,
  `desc_units` tinyint(1) NOT NULL,
  `outer_width` smallint unsigned DEFAULT NULL,
  `outer_depth` smallint unsigned DEFAULT NULL,
  `outer_unit` varchar(50) NOT NULL,
  `comments` longtext NOT NULL,
  `rack_group_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `location_id` char(32) NOT NULL,
  `role_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_tag` (`asset_tag`),
  UNIQUE KEY `dcim_rack_group_id_facility_id_f16a53ae_uniq` (`rack_group_id`,`facility_id`),
  UNIQUE KEY `dcim_rack_group_id_name_846f3826_uniq` (`rack_group_id`,`name`),
  KEY `dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `dcim_rack_status_id_ee3dee3e` (`status_id`),
  KEY `dcim_rack_name_b74aa0b4` (`name`),
  KEY `dcim_rack_serial_d9cd7ac4` (`serial`),
  KEY `dcim_rack__name_e3323581` (`_name`),
  KEY `dcim_rack_new_role_id_dfa62b13` (`role_id`),
  KEY `dcim_rack_location_id_5f63ec31_fk_dcim_location_id` (`location_id`),
  CONSTRAINT `dcim_rack_location_id_5f63ec31_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `dcim_rack_rack_group_id_70309130_fk_dcim_rackgroup_id` FOREIGN KEY (`rack_group_id`) REFERENCES `dcim_rackgroup` (`id`),
  CONSTRAINT `dcim_rack_role_id_62d6919e_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `dcim_rack_status_id_ee3dee3e_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `dcim_rack_chk_1` CHECK ((`width` >= 0)),
  CONSTRAINT `dcim_rack_chk_2` CHECK ((`u_height` >= 0)),
  CONSTRAINT `dcim_rack_chk_3` CHECK ((`outer_width` >= 0)),
  CONSTRAINT `dcim_rack_chk_4` CHECK ((`outer_depth` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_rack`
--

LOCK TABLES `dcim_rack` WRITE;
/*!40000 ALTER TABLE `dcim_rack` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_rack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_rackgroup`
--

DROP TABLE IF EXISTS `dcim_rackgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_rackgroup` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  `location_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_rackgroup_location_id_name_8555e7b1_uniq` (`location_id`,`name`),
  KEY `dcim_rackgroup_parent_id_cc315105_fk_dcim_rackgroup_id` (`parent_id`),
  KEY `dcim_rackgroup_name_6a84593a` (`name`),
  CONSTRAINT `dcim_rackgroup_location_id_5a6fdeac_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `dcim_rackgroup_parent_id_cc315105_fk_dcim_rackgroup_id` FOREIGN KEY (`parent_id`) REFERENCES `dcim_rackgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_rackgroup`
--

LOCK TABLES `dcim_rackgroup` WRITE;
/*!40000 ALTER TABLE `dcim_rackgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_rackgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_rackreservation`
--

DROP TABLE IF EXISTS `dcim_rackreservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_rackreservation` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `units` json NOT NULL,
  `description` varchar(255) NOT NULL,
  `rack_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id` (`rack_id`),
  KEY `dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `dcim_rackreservation_user_id_0785a527_fk_auth_user_id` (`user_id`),
  CONSTRAINT `dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id` FOREIGN KEY (`rack_id`) REFERENCES `dcim_rack` (`id`),
  CONSTRAINT `dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `dcim_rackreservation_user_id_0785a527_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_rackreservation`
--

LOCK TABLES `dcim_rackreservation` WRITE;
/*!40000 ALTER TABLE `dcim_rackreservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_rackreservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_rearport`
--

DROP TABLE IF EXISTS `dcim_rearport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_rearport` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `positions` smallint unsigned NOT NULL,
  `device_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `module_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_rearport_module_name_unique` (`module_id`,`name`),
  KEY `dcim_rearport_name_2300a129` (`name`),
  KEY `dcim_rearport__name_50f20c9e` (`_name`),
  KEY `dcim_rearport_module_id_9a7b7e91` (`module_id`),
  KEY `dcim_rearport_device_id_0bdfe9c0` (`device_id`),
  CONSTRAINT `dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_rearport_module_id_9a7b7e91_fk_dcim_module_id` FOREIGN KEY (`module_id`) REFERENCES `dcim_module` (`id`),
  CONSTRAINT `dcim_rearport_chk_1` CHECK ((`positions` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_rearport`
--

LOCK TABLES `dcim_rearport` WRITE;
/*!40000 ALTER TABLE `dcim_rearport` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_rearport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_rearporttemplate`
--

DROP TABLE IF EXISTS `dcim_rearporttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_rearporttemplate` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `positions` smallint unsigned NOT NULL,
  `device_type_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `module_type_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_rearporttemplate_device_type_name_unique` (`device_type_id`,`name`),
  UNIQUE KEY `dcim_rearporttemplate_module_type_name_unique` (`module_type_id`,`name`),
  KEY `dcim_rearporttemplate_module_type_id_4d970e5b` (`module_type_id`),
  CONSTRAINT `dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
  CONSTRAINT `dcim_rearporttemplat_module_type_id_4d970e5b_fk_dcim_modu` FOREIGN KEY (`module_type_id`) REFERENCES `dcim_moduletype` (`id`),
  CONSTRAINT `dcim_rearporttemplate_chk_1` CHECK ((`positions` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_rearporttemplate`
--

LOCK TABLES `dcim_rearporttemplate` WRITE;
/*!40000 ALTER TABLE `dcim_rearporttemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_rearporttemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_softwareimagefile`
--

DROP TABLE IF EXISTS `dcim_softwareimagefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_softwareimagefile` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `image_file_name` varchar(255) NOT NULL,
  `image_file_checksum` varchar(256) NOT NULL,
  `hashing_algorithm` varchar(255) NOT NULL,
  `image_file_size` bigint unsigned DEFAULT NULL,
  `download_url` varchar(200) NOT NULL,
  `default_image` tinyint(1) NOT NULL,
  `software_version_id` char(32) NOT NULL,
  `status_id` char(32) NOT NULL,
  `external_integration_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_softwareimagefile_image_file_name_software_9887bb4c_uniq` (`image_file_name`,`software_version_id`),
  KEY `dcim_softwareimagefi_software_version_id_a143fbd3_fk_dcim_soft` (`software_version_id`),
  KEY `dcim_softwareimagefile_status_id_5288600b` (`status_id`),
  KEY `dcim_softwareimagefi_external_integration_2d211aee_fk_extras_ex` (`external_integration_id`),
  CONSTRAINT `dcim_softwareimagefi_external_integration_2d211aee_fk_extras_ex` FOREIGN KEY (`external_integration_id`) REFERENCES `extras_externalintegration` (`id`),
  CONSTRAINT `dcim_softwareimagefi_software_version_id_a143fbd3_fk_dcim_soft` FOREIGN KEY (`software_version_id`) REFERENCES `dcim_softwareversion` (`id`),
  CONSTRAINT `dcim_softwareimagefile_status_id_5288600b_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_softwareimagefile_chk_1` CHECK ((`image_file_size` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_softwareimagefile`
--

LOCK TABLES `dcim_softwareimagefile` WRITE;
/*!40000 ALTER TABLE `dcim_softwareimagefile` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_softwareimagefile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_softwareversion`
--

DROP TABLE IF EXISTS `dcim_softwareversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_softwareversion` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `version` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `release_date` date DEFAULT NULL,
  `end_of_support_date` date DEFAULT NULL,
  `documentation_url` varchar(200) NOT NULL,
  `long_term_support` tinyint(1) NOT NULL,
  `pre_release` tinyint(1) NOT NULL,
  `platform_id` char(32) NOT NULL,
  `status_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_softwareversion_platform_id_version_34b58c7b_uniq` (`platform_id`,`version`),
  KEY `dcim_softwareversion_status_id_e167dc1f` (`status_id`),
  CONSTRAINT `dcim_softwareversion_platform_id_dcac6ff8_fk_dcim_platform_id` FOREIGN KEY (`platform_id`) REFERENCES `dcim_platform` (`id`),
  CONSTRAINT `dcim_softwareversion_status_id_e167dc1f_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_softwareversion`
--

LOCK TABLES `dcim_softwareversion` WRITE;
/*!40000 ALTER TABLE `dcim_softwareversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_softwareversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_virtualchassis`
--

DROP TABLE IF EXISTS `dcim_virtualchassis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_virtualchassis` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `master_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_virtualchassis_name_7dcc237d_uniq` (`name`),
  UNIQUE KEY `master_id` (`master_id`),
  CONSTRAINT `dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id` FOREIGN KEY (`master_id`) REFERENCES `dcim_device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_virtualchassis`
--

LOCK TABLES `dcim_virtualchassis` WRITE;
/*!40000 ALTER TABLE `dcim_virtualchassis` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_virtualchassis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_virtualdevicecontext`
--

DROP TABLE IF EXISTS `dcim_virtualdevicecontext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_virtualdevicecontext` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `identifier` smallint unsigned DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `device_id` char(32) NOT NULL,
  `primary_ip4_id` char(32) DEFAULT NULL,
  `primary_ip6_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `role_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `controller_managed_device_group_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_virtualdevicecontext_device_id_name_6eec71ab_uniq` (`device_id`,`name`),
  UNIQUE KEY `dcim_virtualdevicecontext_device_id_identifier_a871cba8_uniq` (`device_id`,`identifier`),
  KEY `dcim_virtualdeviceco_primary_ip4_id_6bd0605b_fk_ipam_ipad` (`primary_ip4_id`),
  KEY `dcim_virtualdeviceco_primary_ip6_id_ed3b81bd_fk_ipam_ipad` (`primary_ip6_id`),
  KEY `dcim_virtualdeviceco_tenant_id_b6a21753_fk_tenancy_t` (`tenant_id`),
  KEY `dcim_virtualdevicecontext_status_id_6df019d2` (`status_id`),
  KEY `dcim_virtualdevicecontext_role_id_9e434101` (`role_id`),
  KEY `dcim_virtualdeviceco_controller_managed_d_d65d0532_fk_dcim_cont` (`controller_managed_device_group_id`),
  CONSTRAINT `dcim_virtualdeviceco_controller_managed_d_d65d0532_fk_dcim_cont` FOREIGN KEY (`controller_managed_device_group_id`) REFERENCES `dcim_controllermanageddevicegroup` (`id`),
  CONSTRAINT `dcim_virtualdeviceco_primary_ip4_id_6bd0605b_fk_ipam_ipad` FOREIGN KEY (`primary_ip4_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `dcim_virtualdeviceco_primary_ip6_id_ed3b81bd_fk_ipam_ipad` FOREIGN KEY (`primary_ip6_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `dcim_virtualdeviceco_tenant_id_b6a21753_fk_tenancy_t` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `dcim_virtualdevicecontext_device_id_4f39274b_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_virtualdevicecontext_role_id_9e434101_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `dcim_virtualdevicecontext_status_id_6df019d2_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_virtualdevicecontext_chk_1` CHECK ((`identifier` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_virtualdevicecontext`
--

LOCK TABLES `dcim_virtualdevicecontext` WRITE;
/*!40000 ALTER TABLE `dcim_virtualdevicecontext` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_virtualdevicecontext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_clockedschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_clockedschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clocked_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_clockedschedule`
--

LOCK TABLES `django_celery_beat_clockedschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_crontabschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_crontabschedule`
--

LOCK TABLES `django_celery_beat_crontabschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_intervalschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `every` int NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_intervalschedule`
--

LOCK TABLES `django_celery_beat_intervalschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictask`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int DEFAULT NULL,
  `interval_id` int DEFAULT NULL,
  `solar_id` int DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int unsigned DEFAULT NULL,
  `headers` longtext NOT NULL DEFAULT (_utf8mb4'{}'),
  `clocked_id` int DEFAULT NULL,
  `expire_seconds` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`),
  CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`),
  CONSTRAINT `django_celery_beat_periodictask_chk_1` CHECK ((`total_run_count` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_2` CHECK ((`priority` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_3` CHECK ((`expire_seconds` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictask`
--

LOCK TABLES `django_celery_beat_periodictask` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictasks`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictasks`
--

LOCK TABLES `django_celery_beat_periodictasks` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_solarschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_solarschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_solarschedule`
--

LOCK TABLES `django_celery_beat_solarschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_chordcounter`
--

DROP TABLE IF EXISTS `django_celery_results_chordcounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_results_chordcounter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `sub_tasks` longtext NOT NULL,
  `count` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`),
  CONSTRAINT `django_celery_results_chordcounter_chk_1` CHECK ((`count` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_chordcounter`
--

LOCK TABLES `django_celery_results_chordcounter` WRITE;
/*!40000 ALTER TABLE `django_celery_results_chordcounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_chordcounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_groupresult`
--

DROP TABLE IF EXISTS `django_celery_results_groupresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_results_groupresult` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`),
  KEY `django_cele_date_cr_bd6c1d_idx` (`date_created`),
  KEY `django_cele_date_do_caae0e_idx` (`date_done`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_groupresult`
--

LOCK TABLES `django_celery_results_groupresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_groupresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_groupresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_taskresult`
--

DROP TABLE IF EXISTS `django_celery_results_taskresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_results_taskresult` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `meta` longtext,
  `task_args` longtext,
  `task_kwargs` longtext,
  `task_name` varchar(255) DEFAULT NULL,
  `worker` varchar(100) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `periodic_task_name` varchar(255) DEFAULT NULL,
  `date_started` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_cele_task_na_08aec9_idx` (`task_name`),
  KEY `django_cele_status_9b6201_idx` (`status`),
  KEY `django_cele_worker_d54dd8_idx` (`worker`),
  KEY `django_cele_date_cr_f04a50_idx` (`date_created`),
  KEY `django_cele_date_do_f59aad_idx` (`date_done`),
  KEY `django_cele_periodi_1993cf_idx` (`periodic_task_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_taskresult`
--

LOCK TABLES `django_celery_results_taskresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_taskresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_taskresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (53,'admin','logentry'),(41,'auth','group'),(40,'auth','permission'),(1,'circuits','circuit'),(63,'circuits','circuittermination'),(64,'circuits','circuittype'),(65,'circuits','provider'),(66,'circuits','providernetwork'),(67,'cloud','cloudaccount'),(68,'cloud','cloudnetwork'),(71,'cloud','cloudnetworkprefixassignment'),(69,'cloud','cloudresourcetype'),(70,'cloud','cloudservice'),(72,'cloud','cloudservicenetworkassignment'),(51,'constance','constance'),(42,'contenttypes','contenttype'),(77,'data_validation','datacompliance'),(76,'data_validation','minmaxvalidationrule'),(75,'data_validation','regularexpressionvalidationrule'),(74,'data_validation','requiredvalidationrule'),(73,'data_validation','uniquevalidationrule'),(2,'dcim','cable'),(78,'dcim','cablepath'),(114,'dcim','cabletocabletermination'),(113,'dcim','cabletype'),(79,'dcim','consoleport'),(80,'dcim','consoleporttemplate'),(81,'dcim','consoleserverport'),(82,'dcim','consoleserverporttemplate'),(26,'dcim','controller'),(106,'dcim','controllermanageddevicegroup'),(3,'dcim','device'),(83,'dcim','devicebay'),(84,'dcim','devicebaytemplate'),(112,'dcim','deviceclusterassignment'),(104,'dcim','devicefamily'),(19,'dcim','deviceredundancygroup'),(15,'dcim','devicerole'),(85,'dcim','devicetype'),(105,'dcim','devicetypetosoftwareimagefile'),(86,'dcim','frontport'),(87,'dcim','frontporttemplate'),(13,'dcim','interface'),(20,'dcim','interfaceredundancygroup'),(103,'dcim','interfaceredundancygroupassociation'),(88,'dcim','interfacetemplate'),(110,'dcim','interfacevdcassignment'),(89,'dcim','inventoryitem'),(14,'dcim','location'),(102,'dcim','locationtype'),(90,'dcim','manufacturer'),(27,'dcim','module'),(107,'dcim','modulebay'),(108,'dcim','modulebaytemplate'),(111,'dcim','modulefamily'),(109,'dcim','moduletype'),(91,'dcim','platform'),(4,'dcim','powerfeed'),(92,'dcim','poweroutlet'),(93,'dcim','poweroutlettemplate'),(94,'dcim','powerpanel'),(95,'dcim','powerport'),(96,'dcim','powerporttemplate'),(5,'dcim','rack'),(97,'dcim','rackgroup'),(98,'dcim','rackreservation'),(17,'dcim','rackrole'),(99,'dcim','rearport'),(100,'dcim','rearporttemplate'),(21,'dcim','site'),(24,'dcim','softwareimagefile'),(25,'dcim','softwareversion'),(101,'dcim','virtualchassis'),(29,'dcim','virtualdevicecontext'),(59,'django_celery_beat','clockedschedule'),(54,'django_celery_beat','crontabschedule'),(55,'django_celery_beat','intervalschedule'),(56,'django_celery_beat','periodictask'),(57,'django_celery_beat','periodictasks'),(58,'django_celery_beat','solarschedule'),(61,'django_celery_results','chordcounter'),(62,'django_celery_results','groupresult'),(60,'django_celery_results','taskresult'),(30,'extras','approvalworkflow'),(33,'extras','approvalworkflowdefinition'),(31,'extras','approvalworkflowstage'),(34,'extras','approvalworkflowstagedefinition'),(32,'extras','approvalworkflowstageresponse'),(131,'extras','computedfield'),(115,'extras','configcontext'),(130,'extras','configcontextschema'),(145,'extras','contact'),(23,'extras','contactassociation'),(10,'extras','customfield'),(116,'extras','customfieldchoice'),(117,'extras','customlink'),(52,'extras','dynamicgroup'),(140,'extras','dynamicgroupmembership'),(118,'extras','exporttemplate'),(144,'extras','externalintegration'),(132,'extras','fileattachment'),(133,'extras','fileproxy'),(119,'extras','gitrepository'),(129,'extras','graphqlquery'),(134,'extras','healthchecktestmodel'),(120,'extras','imageattachment'),(11,'extras','job'),(143,'extras','jobbutton'),(155,'extras','jobconsoleentry'),(142,'extras','jobhook'),(139,'extras','joblogentry'),(153,'extras','jobqueue'),(154,'extras','jobqueueassignment'),(121,'extras','jobresult'),(150,'extras','metadatachoice'),(148,'extras','metadatatype'),(141,'extras','note'),(128,'extras','objectchange'),(149,'extras','objectmetadata'),(122,'extras','relationship'),(127,'extras','relationshipassociation'),(16,'extras','role'),(151,'extras','savedview'),(35,'extras','scheduledjob'),(135,'extras','scheduledjobs'),(136,'extras','secret'),(137,'extras','secretsgroup'),(138,'extras','secretsgroupassociation'),(147,'extras','staticgroupassociation'),(126,'extras','status'),(123,'extras','tag'),(125,'extras','taggeditem'),(146,'extras','team'),(152,'extras','usersavedviewassociation'),(124,'extras','webhook'),(22,'ipam','aggregate'),(6,'ipam','ipaddress'),(36,'ipam','ipaddressrange'),(160,'ipam','ipaddresstointerface'),(163,'ipam','namespace'),(7,'ipam','prefix'),(165,'ipam','prefixlocationassignment'),(156,'ipam','rir'),(18,'ipam','role'),(157,'ipam','routetarget'),(159,'ipam','service'),(8,'ipam','vlan'),(158,'ipam','vlangroup'),(164,'ipam','vlanlocationassignment'),(28,'ipam','vrf'),(162,'ipam','vrfdeviceassignment'),(161,'ipam','vrfprefixassignment'),(166,'load_balancers','certificateprofile'),(167,'load_balancers','healthcheckmonitor'),(168,'load_balancers','loadbalancerpool'),(37,'load_balancers','loadbalancerpoolmember'),(171,'load_balancers','loadbalancerpoolmembercertificateprofileassignment'),(169,'load_balancers','virtualserver'),(170,'load_balancers','virtualservercertificateprofileassignment'),(43,'sessions','session'),(193,'silk','profile'),(194,'silk','request'),(195,'silk','response'),(196,'silk','sqlquery'),(44,'social_django','association'),(45,'social_django','code'),(46,'social_django','nonce'),(48,'social_django','partial'),(47,'social_django','usersocialauth'),(49,'taggit','tag'),(50,'taggit','taggeditem'),(173,'tenancy','tenant'),(172,'tenancy','tenantgroup'),(175,'users','admingroup'),(177,'users','objectpermission'),(176,'users','token'),(174,'users','user'),(178,'virtualization','cluster'),(179,'virtualization','clustergroup'),(180,'virtualization','clustertype'),(9,'virtualization','virtualmachine'),(12,'virtualization','vminterface'),(181,'vpn','vpn'),(182,'vpn','vpnphase1policy'),(183,'vpn','vpnphase2policy'),(184,'vpn','vpnprofile'),(186,'vpn','vpnprofilephase1policyassignment'),(185,'vpn','vpnprofilephase2policyassignment'),(187,'vpn','vpntermination'),(38,'vpn','vpntunnel'),(39,'vpn','vpntunnelendpoint'),(192,'wireless','controllermanageddevicegroupradioprofileassignment'),(191,'wireless','controllermanageddevicegroupwirelessnetworkassignment'),(190,'wireless','radioprofile'),(189,'wireless','supporteddatarate'),(188,'wireless','wirelessnetwork');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=472 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-09-07 09:05:51.424214'),(2,'contenttypes','0002_remove_content_type_name','2026-09-07 09:05:52.085746'),(3,'auth','0001_initial','2026-09-07 09:05:52.373872'),(4,'auth','0002_alter_permission_name_max_length','2026-09-07 09:05:52.407147'),(5,'auth','0003_alter_user_email_max_length','2026-09-07 09:05:52.411436'),(6,'auth','0004_alter_user_username_opts','2026-09-07 09:05:52.414355'),(7,'auth','0005_alter_user_last_login_null','2026-09-07 09:05:52.424286'),(8,'auth','0006_require_contenttypes_0002','2026-09-07 09:05:52.453218'),(9,'auth','0007_alter_validators_add_error_messages','2026-09-07 09:05:52.457511'),(10,'auth','0008_alter_user_username_max_length','2026-09-07 09:05:52.638143'),(11,'auth','0009_alter_user_last_name_max_length','2026-09-07 09:05:52.641516'),(12,'auth','0010_alter_group_name_max_length','2026-09-07 09:05:52.809104'),(13,'auth','0011_update_proxy_permissions','2026-09-07 09:05:52.818021'),(14,'auth','0012_alter_user_first_name_max_length','2026-09-07 09:05:52.822504'),(15,'users','0001_initial','2026-09-07 09:05:55.316503'),(16,'admin','0001_initial','2026-09-07 09:05:55.648913'),(17,'admin','0002_logentry_remove_auto_add','2026-09-07 09:05:55.656108'),(18,'admin','0003_logentry_add_action_flag_choices','2026-09-07 09:05:55.874488'),(19,'extras','0001_initial_part_1','2026-09-07 09:06:02.681686'),(20,'tenancy','0001_initial','2026-09-07 09:06:04.132675'),(21,'dcim','0001_initial_part_1','2026-09-07 09:06:06.887164'),(22,'dcim','0002_initial_part_2','2026-09-07 09:06:11.663132'),(23,'ipam','0001_initial_part_1','2026-09-07 09:06:15.044273'),(24,'extras','0002_initial_part_2','2026-09-07 09:06:19.934066'),(25,'dcim','0003_initial_part_3','2026-09-07 09:06:37.437271'),(26,'virtualization','0001_initial','2026-09-07 09:06:40.709233'),(27,'dcim','0004_initial_part_4','2026-09-07 09:06:55.951097'),(28,'extras','0003_initial_part_3','2026-09-07 09:07:00.444919'),(29,'ipam','0002_initial_part_2','2026-09-07 09:07:06.819823'),(30,'circuits','0001_initial_part_1','2026-09-07 09:07:06.904271'),(31,'circuits','0002_initial_part_2','2026-09-07 09:07:13.335108'),(32,'extras','0004_populate_default_status_records','2026-09-07 09:07:13.894860'),(33,'extras','0005_configcontext_device_types','2026-09-07 09:07:15.673254'),(34,'extras','0006_graphqlquery','2026-09-07 09:07:15.896156'),(35,'extras','0007_configcontextschema','2026-09-07 09:07:17.420484'),(36,'virtualization','0002_virtualmachine_local_context_schema','2026-09-07 09:07:18.430547'),(37,'virtualization','0003_vminterface_verbose_name','2026-09-07 09:07:18.462915'),(38,'virtualization','0004_auto_slug','2026-09-07 09:07:18.760284'),(39,'virtualization','0005_add_natural_indexing','2026-09-07 09:07:19.673120'),(40,'extras','0008_jobresult__custom_field_data','2026-09-07 09:07:20.159777'),(41,'extras','0009_computedfield','2026-09-07 09:07:21.624709'),(42,'extras','0010_change_cf_validation_max_min_field_to_bigint','2026-09-07 09:07:22.212183'),(43,'extras','0011_fileattachment_fileproxy','2026-09-07 09:07:22.278984'),(44,'extras','0012_healthchecktestmodel','2026-09-07 09:07:22.286100'),(45,'extras','0013_default_fallback_value_computedfield','2026-09-07 09:07:22.333994'),(46,'extras','0014_auto_slug','2026-09-07 09:07:22.889382'),(47,'extras','0015_scheduled_job','2026-09-07 09:07:23.403982'),(48,'extras','0016_secret','2026-09-07 09:07:24.896051'),(49,'extras','0017_joblogentry','2026-09-07 09:07:25.133906'),(50,'extras','0018_joblog_data_migration','2026-09-07 09:07:25.186149'),(51,'extras','0019_joblogentry__meta_options__related_name','2026-09-07 09:07:25.241950'),(52,'extras','0020_customfield_changelog','2026-09-07 09:07:25.902545'),(53,'extras','0021_customfield_changelog_data','2026-09-07 09:07:26.041098'),(54,'extras','0022_objectchange_object_datav2','2026-09-07 09:07:26.253667'),(55,'extras','0023_job_model','2026-09-07 09:07:27.672644'),(56,'extras','0024_job_data_migration','2026-09-07 09:07:27.745102'),(57,'extras','0025_add_advanced_ui_boolean_to_customfield_conputedfield_and_relationship','2026-09-07 09:07:29.017682'),(58,'extras','0026_job_add_gitrepository_fk','2026-09-07 09:07:29.998947'),(59,'extras','0027_job_gitrepository_data_migration','2026-09-07 09:07:30.055076'),(60,'extras','0028_job_reduce_source','2026-09-07 09:07:30.219721'),(61,'extras','0029_dynamicgroup','2026-09-07 09:07:31.075224'),(62,'extras','0030_webhook_alter_unique_together','2026-09-07 09:07:31.677584'),(63,'extras','0031_tag_content_types','2026-09-07 09:07:32.350016'),(64,'extras','0032_tag_content_types_data_migration','2026-09-07 09:07:32.421303'),(65,'extras','0033_add__optimized_indexing','2026-09-07 09:07:35.016924'),(66,'virtualization','0006_vminterface_status','2026-09-07 09:07:35.181915'),(67,'virtualization','0007_vminterface_status_data_migration','2026-09-07 09:07:35.249099'),(68,'virtualization','0008_vminterface_parent','2026-09-07 09:07:35.530435'),(69,'extras','0034_alter_fileattachment_mimetype','2026-09-07 09:07:35.563942'),(70,'extras','0035_scheduledjob_crontab','2026-09-07 09:07:35.742919'),(71,'extras','0036_job_add_has_sensitive_variables','2026-09-07 09:07:36.067384'),(72,'extras','0037_configcontextschema__remove_name_unique__create_constraint_unique_name_owner','2026-09-07 09:07:36.301632'),(73,'dcim','0005_device_local_context_schema','2026-09-07 09:07:37.303778'),(74,'dcim','0006_auto_slug','2026-09-07 09:07:37.952868'),(75,'dcim','0007_device_secrets_group','2026-09-07 09:07:38.285339'),(76,'dcim','0008_increase_all_serial_lengths','2026-09-07 09:07:39.353247'),(77,'dcim','0009_add_natural_indexing','2026-09-07 09:07:45.342932'),(78,'dcim','0010_interface_status','2026-09-07 09:07:45.526009'),(79,'dcim','0011_interface_status_data_migration','2026-09-07 09:07:46.004495'),(80,'dcim','0012_interface_parent_bridge','2026-09-07 09:07:47.452490'),(81,'dcim','0013_location_location_type','2026-09-07 09:07:52.572238'),(82,'virtualization','0009_cluster_location','2026-09-07 09:07:53.334416'),(83,'virtualization','0010_vminterface_mac_address_data_migration','2026-09-07 09:07:53.392508'),(84,'virtualization','0011_alter_vminterface_mac_address','2026-09-07 09:07:53.529581'),(85,'extras','0038_configcontext_locations','2026-09-07 09:07:53.875647'),(86,'extras','0039_objectchange__add_change_context','2026-09-07 09:07:54.562182'),(87,'extras','0040_dynamicgroup__dynamicgroupmembership','2026-09-07 09:07:55.261170'),(88,'extras','0041_jobresult_job_kwargs','2026-09-07 09:07:55.421667'),(89,'extras','0042_job__add_is_job_hook_receiver','2026-09-07 09:07:55.524109'),(90,'extras','0043_note','2026-09-07 09:07:56.919373'),(91,'extras','0044_add_job_hook','2026-09-07 09:07:58.065154'),(92,'extras','0045_add_custom_field_slug','2026-09-07 09:07:58.291274'),(93,'extras','0046_populate_custom_field_slug_label','2026-09-07 09:07:58.350951'),(94,'extras','0047_enforce_custom_field_slug','2026-09-07 09:07:58.828909'),(95,'extras','0048_alter_objectchange_change_context_detail','2026-09-07 09:07:58.869975'),(96,'extras','0049_alter_tag_slug','2026-09-07 09:07:58.927644'),(97,'extras','0050_customfield_grouping','2026-09-07 09:07:59.129825'),(98,'extras','0051_add_job_task_queues','2026-09-07 09:08:00.021447'),(99,'dcim','0014_location_status_data_migration','2026-09-07 09:08:00.135552'),(100,'dcim','0015_device_components__changeloggedmodel','2026-09-07 09:08:12.058779'),(101,'dcim','0016_device_components__timestamp_data_migration','2026-09-07 09:08:12.121587'),(102,'dcim','0017_locationtype_nestable','2026-09-07 09:08:12.470019'),(103,'dcim','0018_device_redundancy_group','2026-09-07 09:08:17.219062'),(104,'extras','0052_configcontext_device_redundancy_groups','2026-09-07 09:08:19.592725'),(105,'extras','0053_relationship_required_on','2026-09-07 09:08:20.193903'),(106,'extras','0054_scheduledjob_kwargs_request_user_change','2026-09-07 09:08:20.255782'),(107,'extras','0055_configcontext_dynamic_groups','2026-09-07 09:08:20.783969'),(108,'extras','0056_objectchange_add_reverse_time_idx','2026-09-07 09:08:20.829156'),(109,'extras','0057_jobbutton','2026-09-07 09:08:23.416836'),(110,'extras','0058_jobresult_add_time_status_idxs','2026-09-07 09:08:25.108499'),(111,'extras','0059_joblogentry_scheduledjob_webhook_data_migration','2026-09-07 09:08:25.279262'),(112,'extras','0060_alter_joblogentry_scheduledjob_webhook_fields','2026-09-07 09:08:25.884895'),(113,'extras','0061_role_and_alter_status','2026-09-07 09:08:26.134809'),(114,'extras','0062_collect_roles_from_related_apps_roles','2026-09-07 09:08:26.221602'),(115,'virtualization','0012_alter_virtualmachine_role_add_new_role','2026-09-07 09:08:26.773185'),(116,'virtualization','0013_migrate_virtualmachine_role_data','2026-09-07 09:08:27.227826'),(117,'virtualization','0014_rename_virtualmachine_roles','2026-09-07 09:08:27.793372'),(118,'extras','0063_alter_role_options','2026-09-07 09:08:27.828581'),(119,'extras','0064_alter_configcontext_and_add_new_role','2026-09-07 09:08:28.859383'),(120,'extras','0065_configcontext_data_migrations','2026-09-07 09:08:28.921157'),(121,'extras','0066_rename_configcontext_role','2026-09-07 09:08:29.738020'),(122,'virtualization','0015_rename_foreignkey_fields','2026-09-07 09:08:33.015203'),(123,'ipam','0003_remove_max_length','2026-09-07 09:08:33.664089'),(124,'ipam','0004_fixup_p2p_broadcast','2026-09-07 09:08:33.726091'),(125,'ipam','0005_auto_slug','2026-09-07 09:08:33.853098'),(126,'ipam','0006_ipaddress_nat_outside_list','2026-09-07 09:08:35.228790'),(127,'ipam','0007_add_natural_indexing','2026-09-07 09:08:36.785504'),(128,'ipam','0008_prefix_vlan_vlangroup_location','2026-09-07 09:08:38.066825'),(129,'ipam','0009_alter_vlan_name','2026-09-07 09:08:38.187391'),(130,'ipam','0010_alter_ipam_role_add_new_role','2026-09-07 09:08:41.148010'),(131,'ipam','0011_migrate_ipam_role_data','2026-09-07 09:08:41.228381'),(132,'ipam','0012_rename_ipam_roles','2026-09-07 09:08:44.885055'),(133,'ipam','0013_delete_role','2026-09-07 09:08:45.125094'),(134,'ipam','0014_rename_foreign_keys_and_related_names','2026-09-07 09:08:45.526405'),(135,'ipam','0015_prefix_add_type','2026-09-07 09:08:45.679919'),(136,'dcim','0019_device_redundancy_group_data_migration','2026-09-07 09:08:45.770496'),(137,'dcim','0020_increase_device_asset_tag_size_limit','2026-09-07 09:08:46.378725'),(138,'dcim','0021_platform_network_driver','2026-09-07 09:08:46.483480'),(139,'dcim','0022_interface_redundancy_group','2026-09-07 09:08:47.903044'),(140,'dcim','0023_interface_redundancy_group_data_migration','2026-09-07 09:08:47.983908'),(141,'dcim','0024_move_site_fields_to_location_model','2026-09-07 09:08:53.193929'),(142,'dcim','0025_mptt_to_tree_queries','2026-09-07 09:08:55.867518'),(143,'dcim','0026_interface_mac_address_data_migration','2026-09-07 09:08:56.029666'),(144,'dcim','0027_alter_interface_mac_address','2026-09-07 09:08:57.542089'),(145,'dcim','0028_alter_device_and_rack_role_add_new_role','2026-09-07 09:09:01.501499'),(146,'dcim','0029_device_and_rack_roles_data_migrations','2026-09-07 09:09:01.580990'),(147,'dcim','0030_rename_device_and_rack_role','2026-09-07 09:09:05.519164'),(148,'dcim','0031_remove_device_role_and_rack_role','2026-09-07 09:09:05.550971'),(149,'dcim','0032_rename_foreignkey_fields','2026-09-07 09:09:08.080811'),(150,'circuits','0003_auto_slug','2026-09-07 09:09:08.256565'),(151,'circuits','0004_increase_provider_account_length','2026-09-07 09:09:08.552995'),(152,'circuits','0005_providernetwork','2026-09-07 09:09:10.894919'),(153,'circuits','0006_cache_circuit_terminations','2026-09-07 09:09:10.967207'),(154,'circuits','0007_circuitterminations_primary_model','2026-09-07 09:09:11.684122'),(155,'circuits','0008_add_natural_indexing','2026-09-07 09:09:11.849603'),(156,'circuits','0009_circuittermination_location','2026-09-07 09:09:12.111689'),(157,'dcim','0033_add_tree_managers_and_foreign_keys_pre_data_migration','2026-09-07 09:09:12.903003'),(158,'dcim','0034_migrate_region_and_site_data_to_locations','2026-09-07 09:09:13.002173'),(159,'virtualization','0016_remove_site_foreign_key_from_cluster_class','2026-09-07 09:09:13.191190'),(160,'virtualization','0017_created_datetime','2026-09-07 09:09:14.088372'),(161,'extras','0067_migrate_job_result_status','2026-09-07 09:09:14.527609'),(162,'extras','0068_jobresult__add_celery_fields','2026-09-07 09:09:19.033257'),(163,'extras','0069_created_datetime','2026-09-07 09:09:23.709574'),(164,'virtualization','0018_related_name_changes','2026-09-07 09:09:24.395337'),(165,'ipam','0016_prefix_type_data_migration','2026-09-07 09:09:24.464300'),(166,'ipam','0017_prefix_remove_is_pool','2026-09-07 09:09:24.578100'),(167,'tenancy','0002_auto_slug','2026-09-07 09:09:25.116952'),(168,'tenancy','0003_mptt_to_tree_queries','2026-09-07 09:09:25.844913'),(169,'tenancy','0004_change_tree_manager_on_tree_models','2026-09-07 09:09:25.902860'),(170,'tenancy','0005_rename_foreign_keys_and_related_names','2026-09-07 09:09:26.426176'),(171,'dcim','0035_rename_path_end_point_related_name','2026-09-07 09:09:27.166997'),(172,'dcim','0036_remove_site_foreign_key_from_dcim_models','2026-09-07 09:09:34.014731'),(173,'ipam','0018_remove_site_foreign_key_from_ipam_models','2026-09-07 09:09:35.886535'),(174,'ipam','0019_created_datetime','2026-09-07 09:09:38.221911'),(175,'ipam','0020_related_name_changes','2026-09-07 09:09:38.993268'),(176,'ipam','0021_prefix_add_rir_and_date_allocated','2026-09-07 09:09:40.055890'),(177,'ipam','0022_aggregate_to_prefix_data_migration','2026-09-07 09:09:40.600320'),(178,'ipam','0023_delete_aggregate','2026-09-07 09:09:40.610477'),(179,'extras','0070_remove_site_and_region_attributes_from_config_context','2026-09-07 09:09:40.772227'),(180,'django_celery_results','0001_initial','2026-09-07 09:09:40.835219'),(181,'django_celery_results','0002_add_task_name_args_kwargs','2026-09-07 09:09:41.254400'),(182,'django_celery_results','0003_auto_20181106_1101','2026-09-07 09:09:41.395720'),(183,'django_celery_results','0004_auto_20190516_0412','2026-09-07 09:09:41.516349'),(184,'django_celery_results','0005_taskresult_worker','2026-09-07 09:09:41.567080'),(185,'django_celery_results','0006_taskresult_date_created','2026-09-07 09:09:41.710690'),(186,'tenancy','0006_created_datetime','2026-09-07 09:09:41.994155'),(187,'dcim','0037_created_datetime','2026-09-07 09:09:50.860470'),(188,'dcim','0038_fixup_fks_and_related_names','2026-09-07 09:10:04.180857'),(189,'dcim','0039_related_name_changes','2026-09-07 09:10:10.123559'),(190,'circuits','0010_rename_foreign_keys_and_related_names','2026-09-07 09:10:11.324087'),(191,'circuits','0011_remove_site_foreign_key_from_circuit_termination_class','2026-09-07 09:10:11.584686'),(192,'dcim','0040_remove_region_and_site','2026-09-07 09:10:12.732427'),(193,'ipam','0024_interface_to_ipaddress_m2m','2026-09-07 09:10:13.059209'),(194,'virtualization','0019_vminterface_ip_addresses_m2m','2026-09-07 09:10:13.125915'),(195,'virtualization','0020_remove_clustergroup_clustertype_slug','2026-09-07 09:10:13.423389'),(196,'tenancy','0007_remove_tenant_tenantgroup_slug','2026-09-07 09:10:13.883244'),(197,'ipam','0025_interface_ipaddress_m2m_data_migration','2026-09-07 09:10:14.071125'),(198,'ipam','0026_ipaddress_remove_assigned_object','2026-09-07 09:10:14.546135'),(199,'ipam','0027_remove_rir_slug','2026-09-07 09:10:14.568119'),(200,'extras','0071_replace_related_names','2026-09-07 09:10:17.219025'),(201,'extras','0072_rename_model_fields','2026-09-07 09:10:18.269231'),(202,'extras','0073_job__unique_name_data_migration','2026-09-07 09:10:18.460753'),(203,'extras','0074_job__unique_name','2026-09-07 09:10:20.118671'),(204,'extras','0075_remove_gitrepository_fields','2026-09-07 09:10:20.493952'),(205,'extras','0076_rename_slug_to_key_for_custom_field','2026-09-07 09:10:20.625751'),(206,'extras','0077_migrate_custom_field_data','2026-09-07 09:10:20.789730'),(207,'extras','0078_remove_name_field_and_make_label_field_non_nullable','2026-09-07 09:10:20.979118'),(208,'dcim','0041_interface_ip_addresses_m2m','2026-09-07 09:10:21.061742'),(209,'dcim','0042_alter_location_managers','2026-09-07 09:10:21.597346'),(210,'dcim','0043_remove_slug','2026-09-07 09:10:21.933234'),(211,'circuits','0012_created_datetime','2026-09-07 09:10:22.746619'),(212,'circuits','0013_alter_circuittermination__path','2026-09-07 09:10:23.068785'),(213,'circuits','0014_related_name_changes','2026-09-07 09:10:23.134227'),(214,'circuits','0015_remove_circuittype_provider_slug','2026-09-07 09:10:23.244178'),(215,'extras','0079_remove_slug','2026-09-07 09:10:23.866048'),(216,'extras','0080_tagsfield','2026-09-07 09:10:24.435922'),(217,'virtualization','0021_tagsfield_and_vminterface_to_primarymodel','2026-09-07 09:10:24.986062'),(218,'virtualization','0022_vminterface_timestamps_data_migration','2026-09-07 09:10:25.046529'),(219,'ipam','0028_tagsfield','2026-09-07 09:10:25.899712'),(220,'dcim','0044_tagsfield','2026-09-07 09:10:27.974573'),(221,'ipam','0029_ip_address_to_interface_uniqueness_constraints','2026-09-07 09:10:28.063056'),(222,'ipam','0030_ipam__namespaces','2026-09-07 09:10:32.188354'),(223,'virtualization','0023_ipam__namespaces','2026-09-07 09:10:32.561417'),(224,'virtualization','0024_fixup_null_statuses','2026-09-07 09:10:33.082707'),(225,'extras','0081_rename_relationship_slug_to_key','2026-09-07 09:10:33.131508'),(226,'extras','0082_rename_relationship_name_to_label','2026-09-07 09:10:33.311913'),(227,'extras','0083_ensure_relationship_keys_are_unique','2026-09-07 09:10:33.402964'),(228,'extras','0084_rename_computed_field_slug_to_key','2026-09-07 09:10:33.562769'),(229,'virtualization','0025_status_nonnullable','2026-09-07 09:10:34.266562'),(230,'dcim','0045_ipam__namespaces','2026-09-07 09:10:34.465594'),(231,'ipam','0031_ipam___data_migrations','2026-09-07 09:10:35.068786'),(232,'ipam','0032_ipam__namespaces_finish','2026-09-07 09:10:37.211272'),(233,'ipam','0033_fixup_null_statuses','2026-09-07 09:10:37.283258'),(234,'ipam','0034_status_nonnullable','2026-09-07 09:10:38.746719'),(235,'ipam','0035_ensure_all_services_fit_uniqueness_constraint','2026-09-07 09:10:38.816970'),(236,'dcim','0046_fixup_null_statuses','2026-09-07 09:10:38.953433'),(237,'dcim','0047_status_nonnullable','2026-09-07 09:10:42.669216'),(238,'ipam','0036_add_uniqueness_constraints_to_service','2026-09-07 09:10:43.462795'),(239,'ipam','0037_data_migration_vlan_group_name_uniqueness','2026-09-07 09:10:43.530504'),(240,'ipam','0038_vlan_group_name_unique_remove_slug','2026-09-07 09:10:43.698973'),(241,'ipam','0039_alter_ipaddresstointerface_ip_address','2026-09-07 09:10:43.771838'),(242,'dcim','0048_ensure_virtual_chassis_names_are_unique_and_add_uniqueness_constraint','2026-09-07 09:10:43.984130'),(243,'dcim','0049_remove_slugs_and_change_device_primary_ip_fields','2026-09-07 09:10:46.222019'),(244,'dcim','0050_fix_interface_redundancy_group_association_created','2026-09-07 09:10:46.289070'),(245,'dcim','0051_interface_redundancy_group_nullable_status','2026-09-07 09:10:46.429135'),(246,'dcim','0052_fix_interface_redundancy_group_created','2026-09-07 09:10:47.278232'),(247,'ipam','0040_vlan_prefix_locations','2026-09-07 09:10:48.631264'),(248,'ipam','0041_vlan_prefix_locations_data_migration','2026-09-07 09:10:48.711910'),(249,'ipam','0042_remove_location_from_vlan_and_prefix','2026-09-07 09:10:49.597425'),(250,'ipam','0043_fixup_null_ip_version','2026-09-07 09:10:49.677715'),(251,'ipam','0044_ip_version_nonnullable','2026-09-07 09:10:50.511570'),(252,'ipam','0045_alter_vlangroup_options','2026-09-07 09:10:50.949204'),(253,'ipam','0046_update_all_charfields_max_length_to_255','2026-09-07 09:10:52.726762'),(254,'virtualization','0026_change_virtualmachine_primary_ip_fields','2026-09-07 09:10:53.604964'),(255,'tenancy','0008_tagsfield','2026-09-07 09:10:53.670117'),(256,'tenancy','0009_update_all_charfields_max_length_to_255','2026-09-07 09:10:54.352542'),(257,'extras','0085_taggeditem_cleanup','2026-09-07 09:10:54.884884'),(258,'extras','0086_taggeditem_uniqueness','2026-09-07 09:10:55.219966'),(259,'extras','0087_job__celery_task_fields__dryrun_support','2026-09-07 09:10:57.266324'),(260,'extras','0088_job__commit_default_data_migration','2026-09-07 09:10:57.336317'),(261,'extras','0089_joblogentry__log_level_default','2026-09-07 09:10:57.345922'),(262,'extras','0090_joblogentry__log_level_data_migration','2026-09-07 09:10:57.410929'),(263,'extras','0091_scheduledjob__data_migration','2026-09-07 09:10:57.475293'),(264,'extras','0092_uniqueness_data_migration','2026-09-07 09:10:57.643288'),(265,'extras','0093_uniqueness_fixup','2026-09-07 09:10:59.067702'),(266,'extras','0094_alter_objectchange_unique_together','2026-09-07 09:10:59.133572'),(267,'extras','0095_ensure_note_timestamps_are_unique','2026-09-07 09:10:59.199968'),(268,'extras','0096_remove_slugs','2026-09-07 09:10:59.517656'),(269,'extras','0097_alter_job_result_remove_result','2026-09-07 09:10:59.587493'),(270,'extras','0098_rename_data_jobresult_result','2026-09-07 09:10:59.618467'),(271,'extras','0099_remove_dangling_note_objects','2026-09-07 09:10:59.692195'),(272,'extras','0100_fileproxy_job_result','2026-09-07 09:10:59.879036'),(273,'extras','0101_externalintegration','2026-09-07 09:10:59.972565'),(274,'extras','0102_set_null_objectchange_contenttype','2026-09-07 09:11:00.710884'),(275,'extras','0103_add_db_indexes_to_object_change','2026-09-07 09:11:01.085468'),(276,'extras','0104_contact_contactassociation_team','2026-09-07 09:11:01.775875'),(277,'extras','0105_update_all_charfields_max_length_to_255','2026-09-07 09:11:09.732591'),(278,'extras','0106_populate_default_statuses_and_roles_for_contact_associations','2026-09-07 09:11:09.824288'),(279,'extras','0107_laxurlfield','2026-09-07 09:11:10.000652'),(280,'extras','0108_jobbutton_enabled','2026-09-07 09:11:10.179865'),(281,'extras','0109_dynamicgroup_group_type_dynamicgroup_tags_and_more','2026-09-07 09:11:11.235117'),(282,'dcim','0053_create_device_family_model','2026-09-07 09:11:11.481633'),(283,'dcim','0054_softwareimage_softwareversion','2026-09-07 09:11:14.716889'),(284,'dcim','0055_softwareimage_softwareversion_data_migration','2026-09-07 09:11:14.833948'),(285,'dcim','0056_update_all_charfields_max_length_to_255','2026-09-07 09:11:30.203480'),(286,'dcim','0057_controller_models','2026-09-07 09:11:32.706132'),(287,'dcim','0058_controller_data_migration','2026-09-07 09:11:32.812643'),(288,'dcim','0059_add_role_field_to_interface_models','2026-09-07 09:11:33.110929'),(289,'dcim','0060_alter_cable_status_alter_consoleport__path_and_more','2026-09-07 09:11:38.165470'),(290,'extras','0110_alter_configcontext_cluster_groups_and_more','2026-09-07 09:11:40.110312'),(291,'ipam','0047_alter_ipaddress_role_alter_ipaddress_status_and_more','2026-09-07 09:11:40.926485'),(292,'extras','0111_metadata','2026-09-07 09:11:42.191311'),(293,'extras','0112_dynamic_group_group_type_data_migration','2026-09-07 09:11:42.267234'),(294,'extras','0113_saved_views','2026-09-07 09:11:42.570489'),(295,'dcim','0061_module_models','2026-09-07 09:12:07.314156'),(296,'dcim','0062_module_data_migration','2026-09-07 09:12:07.633427'),(297,'cloud','0001_initial','2026-09-07 09:12:11.978695'),(298,'circuits','0016_tagsfield','2026-09-07 09:12:12.303995'),(299,'circuits','0017_fixup_null_statuses','2026-09-07 09:12:12.509626'),(300,'circuits','0018_status_nonnullable','2026-09-07 09:12:13.181311'),(301,'circuits','0019_remove_providernetwork_slug','2026-09-07 09:12:13.249940'),(302,'circuits','0020_update_all_charfields_max_length_to_255','2026-09-07 09:12:15.284977'),(303,'circuits','0021_alter_circuit_status_alter_circuittermination__path','2026-09-07 09:12:15.463612'),(304,'circuits','0022_circuittermination_cloud_network','2026-09-07 09:12:15.848035'),(305,'circuits','0023_remove_circuittermination_cable_peer_fields','2026-09-07 09:12:18.095073'),(306,'cloud','0002_alter_cloudservice_cloud_networks','2026-09-07 09:12:18.180351'),(307,'constance','0001_initial','2026-09-07 09:12:18.190099'),(308,'constance','0002_migrate_from_old_table','2026-09-07 09:12:18.268814'),(309,'constance','0003_drop_pickle','2026-09-07 09:12:18.351767'),(310,'extras','0114_computedfield_grouping','2026-09-07 09:12:18.490100'),(311,'extras','0115_scheduledjob_time_zone','2026-09-07 09:12:18.646092'),(312,'extras','0116_fix_dynamic_group_group_type_data_migration','2026-09-07 09:12:18.733216'),(313,'extras','0117_create_job_queue_model','2026-09-07 09:12:21.440080'),(314,'extras','0118_task_queue_to_job_queue_migration','2026-09-07 09:12:21.718645'),(315,'extras','0119_remove_task_queues_from_job_and_queue_from_scheduled_job','2026-09-07 09:12:23.270376'),(316,'extras','0120_job_is_singleton_job_is_singleton_override','2026-09-07 09:12:24.047108'),(317,'extras','0121_alter_team_contacts','2026-09-07 09:12:24.135127'),(318,'extras','0122_add_graphqlquery_owner_content_type','2026-09-07 09:12:24.469948'),(319,'extras','0123_alter_joblogentry_created','2026-09-07 09:12:24.636162'),(320,'extras','0124_add_joblogentry_index','2026-09-07 09:12:24.727818'),(321,'django_celery_results','0007_remove_taskresult_hidden','2026-09-07 09:12:24.796807'),(322,'django_celery_results','0008_chordcounter','2026-09-07 09:12:25.264058'),(323,'django_celery_results','0009_groupresult','2026-09-07 09:12:25.774597'),(324,'django_celery_results','0010_remove_duplicate_indices','2026-09-07 09:12:25.804864'),(325,'django_celery_results','0011_taskresult_periodic_task_name','2026-09-07 09:12:26.284930'),(326,'django_celery_results','0012_taskresult_date_started','2026-09-07 09:12:26.815641'),(327,'extras','0125_jobresult_date_started','2026-09-07 09:12:26.873650'),(328,'extras','0126_approval_workflow_pre_check','2026-09-07 09:12:27.363575'),(329,'extras','0127_approval_workflow_models','2026-09-07 09:12:30.782492'),(330,'data_validation','0001_initial','2026-09-07 09:12:33.010887'),(331,'data_validation','0002_data_migration_from_app','2026-09-07 09:12:33.411263'),(332,'extras','0128_remove_job_approval_required_and_more','2026-09-07 09:12:34.511433'),(333,'extras','0129_jobresult_debug_log_count_jobresult_error_log_count_and_more','2026-09-07 09:12:35.751631'),(334,'extras','0130_jobresult_generate_log_entry_counts','2026-09-07 09:12:35.848219'),(335,'ipam','0048_vrf_status','2026-09-07 09:12:36.393927'),(336,'ipam','0049_vrf_data_migration','2026-09-07 09:12:36.557520'),(337,'ipam','0050_vlangroup_range','2026-09-07 09:12:36.988597'),(338,'dcim','0063_interfacevdcassignment_virtualdevicecontext_and_more','2026-09-07 09:12:39.536999'),(339,'dcim','0064_virtualdevicecontext_status_data_migration','2026-09-07 09:12:39.723584'),(340,'dcim','0065_controller_capabilities_and_more','2026-09-07 09:12:40.853548'),(341,'wireless','0001_initial','2026-09-07 09:12:43.590969'),(342,'dcim','0066_controllermanageddevicegroup_radio_profiles_and_more','2026-09-07 09:12:44.280520'),(343,'dcim','0067_controllermanageddevicegroup_tenant','2026-09-07 09:12:44.609943'),(344,'dcim','0068_alter_softwareimagefile_download_url','2026-09-07 09:12:44.819027'),(345,'dcim','0069_softwareimagefile_external_integration','2026-09-07 09:12:44.981593'),(346,'dcim','0070_modulefamily_models','2026-09-07 09:12:46.748238'),(347,'dcim','0071_alter_consoleport_options_and_more','2026-09-07 09:12:47.698691'),(348,'dcim','0072_alter_powerfeed_options_and_more','2026-09-07 09:12:50.665071'),(349,'dcim','0073_alter_powerport_power_factor_and_more','2026-09-07 09:12:50.764893'),(350,'dcim','0074_alter_rack_u_height','2026-09-07 09:12:51.400885'),(351,'extras','0131_configcontext_device_families','2026-09-07 09:12:51.759695'),(352,'extras','0132_approval_workflow_seed_data','2026-09-07 09:12:51.897736'),(353,'extras','0133_alter_approvalworkflowstageresponse_options_and_more','2026-09-07 09:12:51.963508'),(354,'extras','0134_customfield_scope_filter','2026-09-07 09:12:52.348805'),(355,'extras','0135_rename_taggeditem_content_type_object_id_extras_tagg_content_717743_idx_and_more','2026-09-07 09:12:52.732973'),(356,'django_celery_beat','0001_initial','2026-09-07 09:12:53.216721'),(357,'django_celery_beat','0002_auto_20161118_0346','2026-09-07 09:12:53.384238'),(358,'django_celery_beat','0003_auto_20161209_0049','2026-09-07 09:12:53.407375'),(359,'django_celery_beat','0004_auto_20170221_0000','2026-09-07 09:12:53.417014'),(360,'django_celery_beat','0005_add_solarschedule_events_choices','2026-09-07 09:12:53.461474'),(361,'django_celery_beat','0006_auto_20180322_0932','2026-09-07 09:12:53.642459'),(362,'django_celery_beat','0007_auto_20180521_0826','2026-09-07 09:12:54.403165'),(363,'django_celery_beat','0008_auto_20180914_1922','2026-09-07 09:12:54.448875'),(364,'django_celery_beat','0006_auto_20180210_1226','2026-09-07 09:12:54.555762'),(365,'django_celery_beat','0006_periodictask_priority','2026-09-07 09:12:54.915911'),(366,'django_celery_beat','0009_periodictask_headers','2026-09-07 09:12:54.952456'),(367,'django_celery_beat','0010_auto_20190429_0326','2026-09-07 09:12:55.957402'),(368,'django_celery_beat','0011_auto_20190508_0153','2026-09-07 09:12:56.387776'),(369,'django_celery_beat','0012_periodictask_expire_seconds','2026-09-07 09:12:56.953095'),(370,'django_celery_beat','0013_auto_20200609_0727','2026-09-07 09:12:56.965811'),(371,'django_celery_beat','0014_remove_clockedschedule_enabled','2026-09-07 09:12:57.176448'),(372,'django_celery_beat','0015_edit_solarschedule_events_choices','2026-09-07 09:12:57.201368'),(373,'django_celery_beat','0016_alter_crontabschedule_timezone','2026-09-07 09:12:57.232039'),(374,'django_celery_beat','0017_alter_crontabschedule_month_of_year','2026-09-07 09:12:57.245815'),(375,'django_celery_beat','0018_improve_crontab_helptext','2026-09-07 09:12:57.257071'),(376,'django_celery_beat','0019_alter_periodictasks_options','2026-09-07 09:12:57.263567'),(377,'extras','0136_scheduledjob_clocked_scheduledjob_exchange_and_more','2026-09-07 09:13:00.341894'),(378,'extras','0137_jobconsoleentry','2026-09-07 09:13:00.921530'),(379,'extras','0138_job_console_log_default_and_more','2026-09-07 09:13:01.579580'),(380,'virtualization','0027_virtualmachine_software_image','2026-09-07 09:13:03.409802'),(381,'virtualization','0028_update_all_charfields_max_length_to_255','2026-09-07 09:13:05.968114'),(382,'virtualization','0029_add_role_field_to_interface_models','2026-09-07 09:13:06.659825'),(383,'virtualization','0030_alter_virtualmachine_local_config_context_data_owner_content_type_and_more','2026-09-07 09:13:07.721413'),(384,'dcim','0075_interface_duplex_interface_speed_and_more','2026-09-07 09:13:09.415090'),(385,'dcim','0076_add_deviceclusterassignment','2026-09-07 09:13:09.948439'),(386,'dcim','0077_device_cluster_to_clusters_data_migration','2026-09-07 09:13:10.092684'),(387,'dcim','0078_remove_device_cluster','2026-09-07 09:13:10.796610'),(388,'dcim','0079_remove_device_location_tenant_name_uniqueness','2026-09-07 09:13:11.214266'),(389,'dcim','0080_device_name_data_migration','2026-09-07 09:13:11.867477'),(390,'dcim','0081_alter_device_device_redundancy_group_priority_and_more','2026-09-07 09:13:12.488368'),(391,'dcim','0082_interface_port_type_interfacetemplate_port_type','2026-09-07 09:13:13.257590'),(392,'dcim','0083_alter_controllermanageddevicegroup_radio_profiles_and_more','2026-09-07 09:13:13.515742'),(393,'dcim','0084_add_module_type_image_support','2026-09-07 09:13:14.897848'),(394,'dcim','0085_fix_128gfc_qsfp28_typo','2026-09-07 09:13:15.084056'),(395,'dcim','0086_cabletype','2026-09-07 09:13:16.008369'),(396,'dcim','0087_populate_default_cable_types','2026-09-07 09:13:16.140913'),(397,'dcim','0088_cabletocabletermination','2026-09-07 09:13:27.577758'),(398,'dcim','0089_populate_cabletocabletermination','2026-09-07 09:13:27.736044'),(399,'dcim','0090_remove_cable_old_gfk_fields','2026-09-07 09:13:40.170769'),(400,'dcim','0091_cablepath_add_lane_fields','2026-09-07 09:13:43.085933'),(401,'dcim','0092_remove_consoleport_dcim_consoleport_device_name_unique_and_more','2026-09-07 09:13:51.978542'),(402,'dcim','0093_backpopulate_device_on_modular_component','2026-09-07 09:13:52.236105'),(403,'dcim','0094_alter_cable__abs_length','2026-09-07 09:13:53.313063'),(404,'dcim','0095_alter_consoleport_options_and_more','2026-09-07 09:13:54.248683'),(405,'dcim','0096_cablepath_add_fans_out_flags','2026-09-07 09:13:54.514254'),(406,'dcim','0097_virtualdevicecontext_controller_managed_device_group','2026-09-07 09:13:54.808411'),(407,'django_celery_results','0013_taskresult_django_cele_periodi_1993cf_idx','2026-09-07 09:13:54.977422'),(408,'django_celery_results','0014_alter_taskresult_status','2026-09-07 09:13:54.986875'),(409,'extras','0139_alter_approvalworkflow_approval_workflow_definition_and_more','2026-09-07 09:13:56.976504'),(410,'extras','0140_scheduledjob_state','2026-09-07 09:13:57.758021'),(411,'extras','0141_scheduledjob_state_data_migration','2026-09-07 09:13:57.976550'),(412,'extras','0142_remove_scheduledjob_approval_required','2026-09-07 09:13:58.162134'),(413,'extras','0143_computedfield_output_type_jobresult_cancel_type_and_more','2026-09-07 09:13:59.426841'),(414,'extras','0144_delete_orphaned_object_metadata','2026-09-07 09:13:59.538370'),(415,'extras','0145_objectmetadata_assigned_object_type_cascade','2026-09-07 09:14:00.358821'),(416,'ipam','0051_added_optional_vrf_relationship_to_vdc','2026-09-07 09:14:01.007113'),(417,'ipam','0052_alter_ipaddress_index_together_and_more','2026-09-07 09:14:01.598798'),(418,'ipam','0053_alter_vrfdeviceassignment_options_and_more','2026-09-07 09:14:02.089811'),(419,'ipam','0054_namespace_tenant','2026-09-07 09:14:02.295387'),(420,'ipam','0055_rename_ipaddress_ip_version_host_mask_length_ipam_ipaddr_ip_vers_d82ba5_idx_and_more','2026-09-07 09:14:04.183792'),(421,'ipam','0056_alter_vrfdeviceassignment_ordering_vrfprefixassignment_ordering','2026-09-07 09:14:04.248664'),(422,'ipam','0057_ipaddressrange','2026-09-07 09:14:06.287643'),(423,'ipam','0058_iprange_role_data','2026-09-07 09:14:06.548646'),(424,'load_balancers','0001_initial','2026-09-07 09:14:23.436447'),(425,'load_balancers','0002_create_default_statuses_pool_members','2026-09-07 09:14:24.016204'),(426,'sessions','0001_initial','2026-09-07 09:14:24.235698'),(427,'silk','0001_initial','2026-09-07 09:14:25.866148'),(428,'silk','0002_auto_update_uuid4_id_field','2026-09-07 09:14:25.917046'),(429,'silk','0003_request_prof_file','2026-09-07 09:14:26.052422'),(430,'silk','0004_request_prof_file_storage','2026-09-07 09:14:26.063564'),(431,'silk','0005_increase_request_prof_file_length','2026-09-07 09:14:26.093318'),(432,'silk','0006_fix_request_prof_file_blank','2026-09-07 09:14:26.751834'),(433,'silk','0007_sqlquery_identifier','2026-09-07 09:14:26.778568'),(434,'silk','0008_sqlquery_analysis','2026-09-07 09:14:26.846696'),(435,'social_django','0001_initial','2026-09-07 09:14:27.964177'),(436,'social_django','0002_add_related_name','2026-09-07 09:14:28.082681'),(437,'social_django','0003_alter_email_max_length','2026-09-07 09:14:28.142476'),(438,'social_django','0004_auto_20160423_0400','2026-09-07 09:14:28.165907'),(439,'social_django','0005_auto_20160727_2333','2026-09-07 09:14:28.375197'),(440,'social_django','0006_partial','2026-09-07 09:14:28.617404'),(441,'social_django','0007_code_timestamp','2026-09-07 09:14:28.828863'),(442,'social_django','0008_partial_timestamp','2026-09-07 09:14:29.246649'),(443,'social_django','0009_auto_20191118_0520','2026-09-07 09:14:29.968888'),(444,'social_django','0010_uid_db_index','2026-09-07 09:14:30.058991'),(445,'social_django','0011_alter_id_fields','2026-09-07 09:14:31.708053'),(446,'social_django','0012_usersocialauth_extra_data_new','2026-09-07 09:14:32.201626'),(447,'social_django','0013_migrate_extra_data','2026-09-07 09:14:32.318001'),(448,'social_django','0014_remove_usersocialauth_extra_data','2026-09-07 09:14:32.540092'),(449,'social_django','0015_rename_extra_data_new_usersocialauth_extra_data','2026-09-07 09:14:32.753054'),(450,'social_django','0016_alter_usersocialauth_extra_data','2026-09-07 09:14:32.781596'),(451,'social_django','0017_usersocialauth_user_social_auth_uid_required','2026-09-07 09:14:33.110128'),(452,'taggit','0001_initial','2026-09-07 09:14:34.477592'),(453,'taggit','0002_auto_20150616_2121','2026-09-07 09:14:34.581393'),(454,'taggit','0003_taggeditem_add_unique_index','2026-09-07 09:14:34.626903'),(455,'taggit','0004_alter_taggeditem_content_type_alter_taggeditem_tag','2026-09-07 09:14:34.853503'),(456,'taggit','0005_auto_20220424_2025','2026-09-07 09:14:34.874885'),(457,'taggit','0006_rename_taggeditem_content_type_object_id_taggit_tagg_content_8fc721_idx','2026-09-07 09:14:35.044374'),(458,'users','0002_token_ordering_by_created','2026-09-07 09:14:35.065767'),(459,'users','0003_alter_user_options','2026-09-07 09:14:35.085271'),(460,'users','0004_alter_user_managers','2026-09-07 09:14:35.143808'),(461,'users','0005_ensure_object_permission_names_are_unique','2026-09-07 09:14:35.439716'),(462,'users','0006_make_object_permission_name_globally_unique','2026-09-07 09:14:35.502934'),(463,'users','0007_alter_objectpermission_object_types','2026-09-07 09:14:36.134263'),(464,'users','0008_make_object_permission_a_changelogged_model','2026-09-07 09:14:36.396858'),(465,'users','0009_update_all_charfields_max_length_to_255','2026-09-07 09:14:36.643771'),(466,'users','0010_user_default_saved_views','2026-09-07 09:14:36.768430'),(467,'users','0011_alter_user_default_saved_views','2026-09-07 09:14:36.889266'),(468,'vpn','0001_initial','2026-09-07 09:14:42.785889'),(469,'vpn','0002_populate_defaults','2026-09-07 09:14:43.153969'),(470,'vpn','0003_vpntunnel_secrets_group','2026-09-07 09:14:43.390115'),(471,'vpn','0004_vpn_overlay_support','2026-09-07 09:14:45.731899');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_approvaluserresponse`
--

DROP TABLE IF EXISTS `extras_approvaluserresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_approvaluserresponse` (
  `id` char(32) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `approval_workflow_stage_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `extras_approvaluserr_approval_workflow_st_ee56bc0c_fk_extras_ap` (`approval_workflow_stage_id`),
  KEY `extras_approvaluserresponse_user_id_13bb9039_fk_auth_user_id` (`user_id`),
  CONSTRAINT `extras_approvaluserr_approval_workflow_st_ee56bc0c_fk_extras_ap` FOREIGN KEY (`approval_workflow_stage_id`) REFERENCES `extras_approvalworkflowstage` (`id`),
  CONSTRAINT `extras_approvaluserresponse_user_id_13bb9039_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_approvaluserresponse`
--

LOCK TABLES `extras_approvaluserresponse` WRITE;
/*!40000 ALTER TABLE `extras_approvaluserresponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_approvaluserresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_approvalworkflow`
--

DROP TABLE IF EXISTS `extras_approvalworkflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_approvalworkflow` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `object_under_review_object_id` char(32) NOT NULL,
  `current_state` varchar(255) NOT NULL,
  `decision_date` datetime(6) DEFAULT NULL,
  `user_name` varchar(150) NOT NULL,
  `approval_workflow_definition_id` char(32) DEFAULT NULL,
  `object_under_review_content_type_id` int NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_approvalworkflow_approval_workflow_defini_1ab9fae5_uniq` (`approval_workflow_definition_id`,`object_under_review_content_type_id`,`object_under_review_object_id`),
  KEY `extras_approvalworkf_object_under_review__99ff4617_fk_django_co` (`object_under_review_content_type_id`),
  KEY `extras_approvalworkflow_user_id_f2506f51_fk_auth_user_id` (`user_id`),
  KEY `extras_approvalworkflow_object_under_review_object_id_2d64d1d5` (`object_under_review_object_id`),
  KEY `extras_approvalworkflow_user_name_adc14745` (`user_name`),
  CONSTRAINT `extras_approvalworkf_approval_workflow_de_d39a7459_fk_extras_ap` FOREIGN KEY (`approval_workflow_definition_id`) REFERENCES `extras_approvalworkflowdefinition` (`id`),
  CONSTRAINT `extras_approvalworkf_object_under_review__99ff4617_fk_django_co` FOREIGN KEY (`object_under_review_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_approvalworkflow_user_id_f2506f51_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_approvalworkflow`
--

LOCK TABLES `extras_approvalworkflow` WRITE;
/*!40000 ALTER TABLE `extras_approvalworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_approvalworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_approvalworkflowdefinition`
--

DROP TABLE IF EXISTS `extras_approvalworkflowdefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_approvalworkflowdefinition` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `model_constraints` json NOT NULL,
  `weight` int NOT NULL,
  `model_content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `extras_approvalworkflowd_model_content_type_id_we_a7156a7e_uniq` (`model_content_type_id`,`weight`),
  CONSTRAINT `extras_approvalworkf_model_content_type_i_3a0eb629_fk_django_co` FOREIGN KEY (`model_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_approvalworkflowdefinition`
--

LOCK TABLES `extras_approvalworkflowdefinition` WRITE;
/*!40000 ALTER TABLE `extras_approvalworkflowdefinition` DISABLE KEYS */;
INSERT INTO `extras_approvalworkflowdefinition` VALUES ('ce0c1a693c0942b7bf4644bf8334eb00','2026-09-07 09:12:51.883087','2026-09-07 09:12:51.883120','{}','Scheduled Jobs Approval - Example','{\"job_model__job_class_name\": \"JobThatDoesNotExist\"}',100,35);
/*!40000 ALTER TABLE `extras_approvalworkflowdefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_approvalworkflowstage`
--

DROP TABLE IF EXISTS `extras_approvalworkflowstage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_approvalworkflowstage` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `state` varchar(255) NOT NULL,
  `decision_date` datetime(6) DEFAULT NULL,
  `approval_workflow_id` char(32) NOT NULL,
  `approval_workflow_stage_definition_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_approvalworkflows_approval_workflow_id_app_42233e40_uniq` (`approval_workflow_id`,`approval_workflow_stage_definition_id`),
  KEY `extras_approvalworkf_approval_workflow_st_e96ca568_fk_extras_ap` (`approval_workflow_stage_definition_id`),
  CONSTRAINT `extras_approvalworkf_approval_workflow_id_fb35e65a_fk_extras_ap` FOREIGN KEY (`approval_workflow_id`) REFERENCES `extras_approvalworkflow` (`id`),
  CONSTRAINT `extras_approvalworkf_approval_workflow_st_e96ca568_fk_extras_ap` FOREIGN KEY (`approval_workflow_stage_definition_id`) REFERENCES `extras_approvalworkflowstagedefinition` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_approvalworkflowstage`
--

LOCK TABLES `extras_approvalworkflowstage` WRITE;
/*!40000 ALTER TABLE `extras_approvalworkflowstage` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_approvalworkflowstage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_approvalworkflowstagedefinition`
--

DROP TABLE IF EXISTS `extras_approvalworkflowstagedefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_approvalworkflowstagedefinition` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `sequence` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `min_approvers` int unsigned NOT NULL,
  `denial_message` varchar(255) NOT NULL,
  `approval_workflow_definition_id` char(32) NOT NULL,
  `approver_group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_approvalworkflows_approval_workflow_defini_83c5e3bf_uniq` (`approval_workflow_definition_id`,`sequence`),
  UNIQUE KEY `extras_approvalworkflows_approval_workflow_defini_4ca372ff_uniq` (`approval_workflow_definition_id`,`name`),
  KEY `extras_approvalworkf_approver_group_id_150265c8_fk_auth_grou` (`approver_group_id`),
  CONSTRAINT `extras_approvalworkf_approval_workflow_de_f2706272_fk_extras_ap` FOREIGN KEY (`approval_workflow_definition_id`) REFERENCES `extras_approvalworkflowdefinition` (`id`),
  CONSTRAINT `extras_approvalworkf_approver_group_id_150265c8_fk_auth_grou` FOREIGN KEY (`approver_group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `extras_approvalworkflowstagedefinition_chk_1` CHECK ((`sequence` >= 0)),
  CONSTRAINT `extras_approvalworkflowstagedefinition_chk_2` CHECK ((`min_approvers` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_approvalworkflowstagedefinition`
--

LOCK TABLES `extras_approvalworkflowstagedefinition` WRITE;
/*!40000 ALTER TABLE `extras_approvalworkflowstagedefinition` DISABLE KEYS */;
INSERT INTO `extras_approvalworkflowstagedefinition` VALUES ('9c2c2522eaab415193165a6c1f795290','2026-09-07 09:12:51.884530','2026-09-07 09:12:51.884552','{}',10,'Approval by nautobot-default-scheduledjob-approver',1,'This Job requires an approval from nautobot-default-scheduledjob-approver.','ce0c1a693c0942b7bf4644bf8334eb00',1);
/*!40000 ALTER TABLE `extras_approvalworkflowstagedefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_computedfield`
--

DROP TABLE IF EXISTS `extras_computedfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_computedfield` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `template` longtext NOT NULL,
  `fallback_value` varchar(500) NOT NULL,
  `weight` smallint unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  `advanced_ui` tinyint(1) NOT NULL,
  `grouping` varchar(255) NOT NULL,
  `output_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`key`),
  UNIQUE KEY `extras_computedfield_content_type_id_label_021486c8_uniq` (`content_type_id`,`label`),
  CONSTRAINT `extras_computedfield_content_type_id_def6603f_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_computedfield_chk_1` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_computedfield`
--

LOCK TABLES `extras_computedfield` WRITE;
/*!40000 ALTER TABLE `extras_computedfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_computedfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_configcontext`
--

DROP TABLE IF EXISTS `extras_configcontext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `owner_object_id` char(32) DEFAULT NULL,
  `weight` smallint unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `data` json NOT NULL,
  `owner_content_type_id` int DEFAULT NULL,
  `config_context_schema_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_name_4bbfe25d_uniq` (`name`),
  KEY `extras_configcontext_owner_content_type_i_af30e837_fk_django_co` (`owner_content_type_id`),
  KEY `extras_configcontext_config_context_schem_1e242da5_fk_extras_co` (`config_context_schema_id`),
  CONSTRAINT `extras_configcontext_config_context_schem_1e242da5_fk_extras_co` FOREIGN KEY (`config_context_schema_id`) REFERENCES `extras_configcontextschema` (`id`),
  CONSTRAINT `extras_configcontext_owner_content_type_i_af30e837_fk_django_co` FOREIGN KEY (`owner_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_configcontext_chk_1` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext`
--

LOCK TABLES `extras_configcontext` WRITE;
/*!40000 ALTER TABLE `extras_configcontext` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_configcontext_cluster_groups`
--

DROP TABLE IF EXISTS `extras_configcontext_cluster_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext_cluster_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configcontext_id` char(32) NOT NULL,
  `clustergroup_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq` (`configcontext_id`,`clustergroup_id`),
  KEY `extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz` (`clustergroup_id`),
  CONSTRAINT `extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz` FOREIGN KEY (`clustergroup_id`) REFERENCES `virtualization_clustergroup` (`id`),
  CONSTRAINT `extras_configcontext_configcontext_id_8f50b794_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext_cluster_groups`
--

LOCK TABLES `extras_configcontext_cluster_groups` WRITE;
/*!40000 ALTER TABLE `extras_configcontext_cluster_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext_cluster_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_configcontext_clusters`
--

DROP TABLE IF EXISTS `extras_configcontext_clusters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext_clusters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configcontext_id` char(32) NOT NULL,
  `cluster_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq` (`configcontext_id`,`cluster_id`),
  KEY `extras_configcontext_cluster_id_6abd47a1_fk_virtualiz` (`cluster_id`),
  CONSTRAINT `extras_configcontext_cluster_id_6abd47a1_fk_virtualiz` FOREIGN KEY (`cluster_id`) REFERENCES `virtualization_cluster` (`id`),
  CONSTRAINT `extras_configcontext_configcontext_id_ed579a40_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext_clusters`
--

LOCK TABLES `extras_configcontext_clusters` WRITE;
/*!40000 ALTER TABLE `extras_configcontext_clusters` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext_clusters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_configcontext_device_families`
--

DROP TABLE IF EXISTS `extras_configcontext_device_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext_device_families` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configcontext_id` char(32) NOT NULL,
  `devicefamily_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_dev_configcontext_id_devicef_97bff8b9_uniq` (`configcontext_id`,`devicefamily_id`),
  KEY `extras_configcontext_devicefamily_id_5f12186f_fk_dcim_devi` (`devicefamily_id`),
  CONSTRAINT `extras_configcontext_configcontext_id_e1adebb5_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`),
  CONSTRAINT `extras_configcontext_devicefamily_id_5f12186f_fk_dcim_devi` FOREIGN KEY (`devicefamily_id`) REFERENCES `dcim_devicefamily` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext_device_families`
--

LOCK TABLES `extras_configcontext_device_families` WRITE;
/*!40000 ALTER TABLE `extras_configcontext_device_families` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext_device_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_configcontext_device_redundancy_groups`
--

DROP TABLE IF EXISTS `extras_configcontext_device_redundancy_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext_device_redundancy_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configcontext_id` char(32) NOT NULL,
  `deviceredundancygroup_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_dev_configcontext_id_devicer_80f1d0b0_uniq` (`configcontext_id`,`deviceredundancygroup_id`),
  KEY `extras_configcontext_deviceredundancygrou_d30c185c_fk_dcim_devi` (`deviceredundancygroup_id`),
  CONSTRAINT `extras_configcontext_configcontext_id_72bfff9d_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`),
  CONSTRAINT `extras_configcontext_deviceredundancygrou_d30c185c_fk_dcim_devi` FOREIGN KEY (`deviceredundancygroup_id`) REFERENCES `dcim_deviceredundancygroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext_device_redundancy_groups`
--

LOCK TABLES `extras_configcontext_device_redundancy_groups` WRITE;
/*!40000 ALTER TABLE `extras_configcontext_device_redundancy_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext_device_redundancy_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_configcontext_device_types`
--

DROP TABLE IF EXISTS `extras_configcontext_device_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext_device_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configcontext_id` char(32) NOT NULL,
  `devicetype_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq` (`configcontext_id`,`devicetype_id`),
  KEY `extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi` (`devicetype_id`),
  CONSTRAINT `extras_configcontext_configcontext_id_55632923_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`),
  CONSTRAINT `extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi` FOREIGN KEY (`devicetype_id`) REFERENCES `dcim_devicetype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext_device_types`
--

LOCK TABLES `extras_configcontext_device_types` WRITE;
/*!40000 ALTER TABLE `extras_configcontext_device_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext_device_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_configcontext_dynamic_groups`
--

DROP TABLE IF EXISTS `extras_configcontext_dynamic_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext_dynamic_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configcontext_id` char(32) NOT NULL,
  `dynamicgroup_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_dyn_configcontext_id_dynamic_2eea3817_uniq` (`configcontext_id`,`dynamicgroup_id`),
  KEY `extras_configcontext_dynamicgroup_id_05854998_fk_extras_dy` (`dynamicgroup_id`),
  CONSTRAINT `extras_configcontext_configcontext_id_3cdbc95f_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`),
  CONSTRAINT `extras_configcontext_dynamicgroup_id_05854998_fk_extras_dy` FOREIGN KEY (`dynamicgroup_id`) REFERENCES `extras_dynamicgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext_dynamic_groups`
--

LOCK TABLES `extras_configcontext_dynamic_groups` WRITE;
/*!40000 ALTER TABLE `extras_configcontext_dynamic_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext_dynamic_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_configcontext_locations`
--

DROP TABLE IF EXISTS `extras_configcontext_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext_locations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configcontext_id` char(32) NOT NULL,
  `location_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_loc_configcontext_id_locatio_15d9b342_uniq` (`configcontext_id`,`location_id`),
  KEY `extras_configcontext_location_id_9e19eac9_fk_dcim_loca` (`location_id`),
  CONSTRAINT `extras_configcontext_configcontext_id_cc629ec1_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`),
  CONSTRAINT `extras_configcontext_location_id_9e19eac9_fk_dcim_loca` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext_locations`
--

LOCK TABLES `extras_configcontext_locations` WRITE;
/*!40000 ALTER TABLE `extras_configcontext_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_configcontext_platforms`
--

DROP TABLE IF EXISTS `extras_configcontext_platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext_platforms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configcontext_id` char(32) NOT NULL,
  `platform_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq` (`configcontext_id`,`platform_id`),
  KEY `extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat` (`platform_id`),
  CONSTRAINT `extras_configcontext_configcontext_id_2a516699_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`),
  CONSTRAINT `extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat` FOREIGN KEY (`platform_id`) REFERENCES `dcim_platform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext_platforms`
--

LOCK TABLES `extras_configcontext_platforms` WRITE;
/*!40000 ALTER TABLE `extras_configcontext_platforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext_platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_configcontext_roles`
--

DROP TABLE IF EXISTS `extras_configcontext_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext_roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configcontext_id` char(32) NOT NULL,
  `role_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_new_configcontext_id_role_id_66046ad0_uniq` (`configcontext_id`,`role_id`),
  KEY `extras_configcontext_role_id_597e3d84_fk_extras_ro` (`role_id`),
  CONSTRAINT `extras_configcontext_configcontext_id_7b11e08b_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`),
  CONSTRAINT `extras_configcontext_role_id_597e3d84_fk_extras_ro` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext_roles`
--

LOCK TABLES `extras_configcontext_roles` WRITE;
/*!40000 ALTER TABLE `extras_configcontext_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_configcontext_tags`
--

DROP TABLE IF EXISTS `extras_configcontext_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configcontext_id` char(32) NOT NULL,
  `tag_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq` (`configcontext_id`,`tag_id`),
  KEY `extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id` (`tag_id`),
  CONSTRAINT `extras_configcontext_configcontext_id_64a392b1_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`),
  CONSTRAINT `extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `extras_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext_tags`
--

LOCK TABLES `extras_configcontext_tags` WRITE;
/*!40000 ALTER TABLE `extras_configcontext_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_configcontext_tenant_groups`
--

DROP TABLE IF EXISTS `extras_configcontext_tenant_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext_tenant_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configcontext_id` char(32) NOT NULL,
  `tenantgroup_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq` (`configcontext_id`,`tenantgroup_id`),
  KEY `extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t` (`tenantgroup_id`),
  CONSTRAINT `extras_configcontext_configcontext_id_92f68345_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`),
  CONSTRAINT `extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t` FOREIGN KEY (`tenantgroup_id`) REFERENCES `tenancy_tenantgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext_tenant_groups`
--

LOCK TABLES `extras_configcontext_tenant_groups` WRITE;
/*!40000 ALTER TABLE `extras_configcontext_tenant_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext_tenant_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_configcontext_tenants`
--

DROP TABLE IF EXISTS `extras_configcontext_tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext_tenants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configcontext_id` char(32) NOT NULL,
  `tenant_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq` (`configcontext_id`,`tenant_id`),
  KEY `extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t` (`tenant_id`),
  CONSTRAINT `extras_configcontext_configcontext_id_b53552a6_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`),
  CONSTRAINT `extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext_tenants`
--

LOCK TABLES `extras_configcontext_tenants` WRITE;
/*!40000 ALTER TABLE `extras_configcontext_tenants` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext_tenants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_configcontextschema`
--

DROP TABLE IF EXISTS `extras_configcontextschema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontextschema` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `data_schema` json NOT NULL,
  `owner_object_id` char(32) DEFAULT NULL,
  `owner_content_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontextschema_name_e2a3ef7b_uniq` (`name`),
  KEY `extras_configcontext_owner_content_type_i_0a0756bc_fk_django_co` (`owner_content_type_id`),
  CONSTRAINT `extras_configcontext_owner_content_type_i_0a0756bc_fk_django_co` FOREIGN KEY (`owner_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontextschema`
--

LOCK TABLES `extras_configcontextschema` WRITE;
/*!40000 ALTER TABLE `extras_configcontextschema` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontextschema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_contact`
--

DROP TABLE IF EXISTS `extras_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_contact` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address` longtext NOT NULL,
  `comments` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_contact_name_phone_email_aba1cb5c_uniq` (`name`,`phone`,`email`),
  KEY `extras_contact_name_93e7728d` (`name`),
  KEY `extras_contact_phone_17e0a2f8` (`phone`),
  KEY `extras_contact_email_cda6017a` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_contact`
--

LOCK TABLES `extras_contact` WRITE;
/*!40000 ALTER TABLE `extras_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_contactassociation`
--

DROP TABLE IF EXISTS `extras_contactassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_contactassociation` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `associated_object_id` char(32) NOT NULL,
  `associated_object_type_id` int DEFAULT NULL,
  `contact_id` char(32) DEFAULT NULL,
  `role_id` char(32) NOT NULL,
  `status_id` char(32) NOT NULL,
  `team_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_contactassociatio_contact_id_associated_ob_e743dc3a_uniq` (`contact_id`,`associated_object_type_id`,`associated_object_id`,`role_id`),
  UNIQUE KEY `extras_contactassociatio_team_id_associated_objec_e8ebb4d5_uniq` (`team_id`,`associated_object_type_id`,`associated_object_id`,`role_id`),
  KEY `extras_contactassoci_associated_object_ty_b9f32adb_fk_django_co` (`associated_object_type_id`),
  KEY `extras_contactassociation_associated_object_id_e117d769` (`associated_object_id`),
  KEY `extras_contactassociation_role_id_64bf7e21` (`role_id`),
  KEY `extras_contactassociation_status_id_8678ca28` (`status_id`),
  CONSTRAINT `extras_contactassoci_associated_object_ty_b9f32adb_fk_django_co` FOREIGN KEY (`associated_object_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_contactassoci_contact_id_1aa5b58c_fk_extras_co` FOREIGN KEY (`contact_id`) REFERENCES `extras_contact` (`id`),
  CONSTRAINT `extras_contactassociation_role_id_64bf7e21_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `extras_contactassociation_status_id_8678ca28_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `extras_contactassociation_team_id_23dabd4a_fk_extras_team_id` FOREIGN KEY (`team_id`) REFERENCES `extras_team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_contactassociation`
--

LOCK TABLES `extras_contactassociation` WRITE;
/*!40000 ALTER TABLE `extras_contactassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_contactassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_customfield`
--

DROP TABLE IF EXISTS `extras_customfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_customfield` (
  `id` char(32) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `filter_logic` varchar(50) NOT NULL,
  `default` json DEFAULT NULL,
  `weight` smallint unsigned NOT NULL,
  `validation_minimum` bigint DEFAULT NULL,
  `validation_maximum` bigint DEFAULT NULL,
  `validation_regex` varchar(500) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `advanced_ui` tinyint(1) NOT NULL,
  `key` varchar(255) NOT NULL,
  `grouping` varchar(255) NOT NULL,
  `scope_filter` json NOT NULL DEFAULT (_utf8mb4'{}'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_customfield_slug_ed27c4fe_uniq` (`key`),
  CONSTRAINT `extras_customfield_chk_1` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_customfield`
--

LOCK TABLES `extras_customfield` WRITE;
/*!40000 ALTER TABLE `extras_customfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_customfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_customfield_content_types`
--

DROP TABLE IF EXISTS `extras_customfield_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_customfield_content_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customfield_id` char(32) NOT NULL,
  `contenttype_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_customfield_conte_customfield_id_contentty_51136c2b_uniq` (`customfield_id`,`contenttype_id`),
  KEY `extras_customfield_c_contenttype_id_2997ba90_fk_django_co` (`contenttype_id`),
  CONSTRAINT `extras_customfield_c_contenttype_id_2997ba90_fk_django_co` FOREIGN KEY (`contenttype_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu` FOREIGN KEY (`customfield_id`) REFERENCES `extras_customfield` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_customfield_content_types`
--

LOCK TABLES `extras_customfield_content_types` WRITE;
/*!40000 ALTER TABLE `extras_customfield_content_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_customfield_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_customfieldchoice`
--

DROP TABLE IF EXISTS `extras_customfieldchoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_customfieldchoice` (
  `id` char(32) NOT NULL,
  `value` varchar(255) NOT NULL,
  `weight` smallint unsigned NOT NULL,
  `custom_field_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_customfieldchoice_field_id_value_f959a108_uniq` (`custom_field_id`,`value`),
  CONSTRAINT `extras_customfieldch_custom_field_id_d57e0f43_fk_extras_cu` FOREIGN KEY (`custom_field_id`) REFERENCES `extras_customfield` (`id`),
  CONSTRAINT `extras_customfieldchoice_chk_1` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_customfieldchoice`
--

LOCK TABLES `extras_customfieldchoice` WRITE;
/*!40000 ALTER TABLE `extras_customfieldchoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_customfieldchoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_customlink`
--

DROP TABLE IF EXISTS `extras_customlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_customlink` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `text` varchar(500) NOT NULL,
  `target_url` varchar(500) NOT NULL,
  `weight` smallint unsigned NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `button_class` varchar(30) NOT NULL,
  `new_window` tinyint(1) NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `extras_customlink_content_type_id_4d35b063_fk_django_co` (`content_type_id`),
  CONSTRAINT `extras_customlink_content_type_id_4d35b063_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_customlink_chk_1` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_customlink`
--

LOCK TABLES `extras_customlink` WRITE;
/*!40000 ALTER TABLE `extras_customlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_customlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_dynamicgroup`
--

DROP TABLE IF EXISTS `extras_dynamicgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_dynamicgroup` (
  `_custom_field_data` json NOT NULL,
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `filter` json NOT NULL,
  `content_type_id` int NOT NULL,
  `group_type` varchar(16) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `extras_dynamicgroup_content_type_id_1bed5de5_fk_django_co` (`content_type_id`),
  KEY `extras_dynamicgroup_tenant_id_1de7fb41_fk_tenancy_tenant_id` (`tenant_id`),
  CONSTRAINT `extras_dynamicgroup_content_type_id_1bed5de5_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_dynamicgroup_tenant_id_1de7fb41_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_dynamicgroup`
--

LOCK TABLES `extras_dynamicgroup` WRITE;
/*!40000 ALTER TABLE `extras_dynamicgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_dynamicgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_dynamicgroupmembership`
--

DROP TABLE IF EXISTS `extras_dynamicgroupmembership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_dynamicgroupmembership` (
  `id` char(32) NOT NULL,
  `operator` varchar(12) NOT NULL,
  `weight` smallint unsigned NOT NULL,
  `group_id` char(32) NOT NULL,
  `parent_group_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_dynamicgroupmembe_group_id_parent_group_id_0011d94d_uniq` (`group_id`,`parent_group_id`,`operator`,`weight`),
  KEY `extras_dynamicgroupm_parent_group_id_f09f9b01_fk_extras_dy` (`parent_group_id`),
  CONSTRAINT `extras_dynamicgroupm_group_id_1616d7d6_fk_extras_dy` FOREIGN KEY (`group_id`) REFERENCES `extras_dynamicgroup` (`id`),
  CONSTRAINT `extras_dynamicgroupm_parent_group_id_f09f9b01_fk_extras_dy` FOREIGN KEY (`parent_group_id`) REFERENCES `extras_dynamicgroup` (`id`),
  CONSTRAINT `extras_dynamicgroupmembership_chk_1` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_dynamicgroupmembership`
--

LOCK TABLES `extras_dynamicgroupmembership` WRITE;
/*!40000 ALTER TABLE `extras_dynamicgroupmembership` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_dynamicgroupmembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_exporttemplate`
--

DROP TABLE IF EXISTS `extras_exporttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_exporttemplate` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `owner_object_id` char(32) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `template_code` longtext NOT NULL,
  `mime_type` varchar(255) NOT NULL,
  `file_extension` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `owner_content_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_exporttemplate_content_type_id_name_edca9b9b_uniq` (`content_type_id`,`name`),
  KEY `extras_exporttemplat_owner_content_type_i_6bb67821_fk_django_co` (`owner_content_type_id`),
  KEY `extras_exporttemplate_content_type_id_59737e21` (`content_type_id`),
  CONSTRAINT `extras_exporttemplat_content_type_id_59737e21_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_exporttemplat_owner_content_type_i_6bb67821_fk_django_co` FOREIGN KEY (`owner_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_exporttemplate`
--

LOCK TABLES `extras_exporttemplate` WRITE;
/*!40000 ALTER TABLE `extras_exporttemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_exporttemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_externalintegration`
--

DROP TABLE IF EXISTS `extras_externalintegration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_externalintegration` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `remote_url` varchar(500) NOT NULL,
  `verify_ssl` tinyint(1) NOT NULL,
  `timeout` int NOT NULL,
  `extra_config` json DEFAULT NULL,
  `secrets_group_id` char(32) DEFAULT NULL,
  `ca_file_path` varchar(255) NOT NULL,
  `headers` json DEFAULT NULL,
  `http_method` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `extras_externalinteg_secrets_group_id_2f744e5c_fk_extras_se` (`secrets_group_id`),
  CONSTRAINT `extras_externalinteg_secrets_group_id_2f744e5c_fk_extras_se` FOREIGN KEY (`secrets_group_id`) REFERENCES `extras_secretsgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_externalintegration`
--

LOCK TABLES `extras_externalintegration` WRITE;
/*!40000 ALTER TABLE `extras_externalintegration` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_externalintegration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_fileattachment`
--

DROP TABLE IF EXISTS `extras_fileattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_fileattachment` (
  `id` char(32) NOT NULL,
  `bytes` longblob NOT NULL,
  `filename` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_fileattachment`
--

LOCK TABLES `extras_fileattachment` WRITE;
/*!40000 ALTER TABLE `extras_fileattachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_fileattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_fileproxy`
--

DROP TABLE IF EXISTS `extras_fileproxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_fileproxy` (
  `id` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `job_result_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `extras_fileproxy_job_result_id_dfce512c_fk_extras_jobresult_id` (`job_result_id`),
  CONSTRAINT `extras_fileproxy_job_result_id_dfce512c_fk_extras_jobresult_id` FOREIGN KEY (`job_result_id`) REFERENCES `extras_jobresult` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_fileproxy`
--

LOCK TABLES `extras_fileproxy` WRITE;
/*!40000 ALTER TABLE `extras_fileproxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_fileproxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_gitrepository`
--

DROP TABLE IF EXISTS `extras_gitrepository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_gitrepository` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `remote_url` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `current_head` varchar(48) NOT NULL,
  `provided_contents` json NOT NULL,
  `secrets_group_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `extras_gitrepository_secrets_group_id_fd1fdceb_fk_extras_se` (`secrets_group_id`),
  CONSTRAINT `extras_gitrepository_secrets_group_id_fd1fdceb_fk_extras_se` FOREIGN KEY (`secrets_group_id`) REFERENCES `extras_secretsgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_gitrepository`
--

LOCK TABLES `extras_gitrepository` WRITE;
/*!40000 ALTER TABLE `extras_gitrepository` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_gitrepository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_graphqlquery`
--

DROP TABLE IF EXISTS `extras_graphqlquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_graphqlquery` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  `variables` json NOT NULL,
  `owner_content_type_id` int DEFAULT NULL,
  `owner_object_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `extras_graphqlquery_owner_content_type_i_87bf6bd4_fk_django_co` (`owner_content_type_id`),
  CONSTRAINT `extras_graphqlquery_owner_content_type_i_87bf6bd4_fk_django_co` FOREIGN KEY (`owner_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_graphqlquery`
--

LOCK TABLES `extras_graphqlquery` WRITE;
/*!40000 ALTER TABLE `extras_graphqlquery` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_graphqlquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_healthchecktestmodel`
--

DROP TABLE IF EXISTS `extras_healthchecktestmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_healthchecktestmodel` (
  `id` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_healthchecktestmodel`
--

LOCK TABLES `extras_healthchecktestmodel` WRITE;
/*!40000 ALTER TABLE `extras_healthchecktestmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_healthchecktestmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_imageattachment`
--

DROP TABLE IF EXISTS `extras_imageattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_imageattachment` (
  `id` char(32) NOT NULL,
  `object_id` char(32) NOT NULL,
  `image` varchar(100) NOT NULL,
  `image_height` smallint unsigned NOT NULL,
  `image_width` smallint unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` datetime(6) NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extras_imageattachme_content_type_id_90e0643d_fk_django_co` (`content_type_id`),
  KEY `extras_imageattachment_name_04f9d9dd` (`name`),
  KEY `extras_imageattachment_object_id_f5308bf7` (`object_id`),
  CONSTRAINT `extras_imageattachme_content_type_id_90e0643d_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_imageattachment_chk_1` CHECK ((`image_height` >= 0)),
  CONSTRAINT `extras_imageattachment_chk_2` CHECK ((`image_width` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_imageattachment`
--

LOCK TABLES `extras_imageattachment` WRITE;
/*!40000 ALTER TABLE `extras_imageattachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_imageattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_job`
--

DROP TABLE IF EXISTS `extras_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_job` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `job_class_name` varchar(100) NOT NULL,
  `grouping` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `dryrun_default` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `read_only` tinyint(1) NOT NULL,
  `soft_time_limit` double NOT NULL,
  `time_limit` double NOT NULL,
  `grouping_override` tinyint(1) NOT NULL,
  `name_override` tinyint(1) NOT NULL,
  `description_override` tinyint(1) NOT NULL,
  `dryrun_default_override` tinyint(1) NOT NULL,
  `hidden_override` tinyint(1) NOT NULL,
  `soft_time_limit_override` tinyint(1) NOT NULL,
  `time_limit_override` tinyint(1) NOT NULL,
  `has_sensitive_variables` tinyint(1) NOT NULL,
  `has_sensitive_variables_override` tinyint(1) NOT NULL,
  `is_job_hook_receiver` tinyint(1) NOT NULL,
  `job_queues_override` tinyint(1) NOT NULL,
  `is_job_button_receiver` tinyint(1) NOT NULL,
  `supports_dryrun` tinyint(1) NOT NULL,
  `default_job_queue_override` tinyint(1) NOT NULL,
  `default_job_queue_id` char(32) NOT NULL,
  `is_singleton` tinyint(1) NOT NULL,
  `is_singleton_override` tinyint(1) NOT NULL,
  `console_log_default` tinyint(1) NOT NULL,
  `console_log_default_override` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_job_name_34d98c40_uniq` (`name`),
  UNIQUE KEY `extras_job_module_name_job_class_name_b531472b_uniq` (`module_name`,`job_class_name`),
  KEY `extras_job_module_name_912a3dda` (`module_name`),
  KEY `extras_job_job_class_name_d9c82b93` (`job_class_name`),
  KEY `extras_job_installed_9b043061` (`installed`),
  KEY `extras_job_hidden_f4b1d9d5` (`hidden`),
  KEY `extras_job_grouping_692d2dc2` (`grouping`),
  KEY `extras_job_default_job_queue_id_12ff4ebf_fk_extras_jobqueue_id` (`default_job_queue_id`),
  CONSTRAINT `extras_job_default_job_queue_id_12ff4ebf_fk_extras_jobqueue_id` FOREIGN KEY (`default_job_queue_id`) REFERENCES `extras_jobqueue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_job`
--

LOCK TABLES `extras_job` WRITE;
/*!40000 ALTER TABLE `extras_job` DISABLE KEYS */;
INSERT INTO `extras_job` VALUES ('16c9164fe8534cc299d9b9425e6468e8','2026-09-07 09:14:46.189855','2026-09-07 09:14:46.192106','{}','nautobot.core.jobs.customfields','ProvisionCustomField','Custom Field System Jobs','Provision Custom Field','Add missing Custom Field default values to all in-scope objects for the specified Content Types.',1,1,0,0,0,3600,4000,0,0,0,0,0,0,0,0,0,0,0,0,1,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('1b7428d200644364869cb4f641a37f6f','2026-09-07 09:14:46.071675','2026-09-07 09:14:46.074108','{}','nautobot.core.jobs.bulk_actions','BulkEditObjects','System Jobs','Bulk Edit Objects','Bulk edit objects.',1,1,0,1,0,1800,2000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('2085d23a1e3240c3a1792579346672ae','2026-09-07 09:14:46.206436','2026-09-07 09:14:46.208862','{}','nautobot.core.jobs','RunRegisteredDataComplianceRules','System Jobs','Run Registered Data Compliance Rules','Runs selected Data Compliance rule classes.',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('2ad11f6f5f3a4f849ba757618b081b1b','2026-09-07 09:14:46.137205','2026-09-07 09:14:46.139249','{}','nautobot.core.jobs','ExportObjectList','System Jobs','Export Object List','Export a list of objects to CSV or YAML, or render a specified Export Template.',1,1,0,0,0,1800,2000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('2d2107ed38fc4dcd8f681c52874c02cc','2026-09-07 09:14:46.142354','2026-09-07 09:14:46.144283','{}','nautobot.core.jobs','GitRepositorySync','System Jobs','Git Repository: Sync','Clone and/or pull a Git repository, then refresh data sourced from this repository.',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('3ccc7684b54f4ba2bb5c9401061ef20b','2026-09-07 09:14:46.180691','2026-09-07 09:14:46.182797','{}','nautobot.core.jobs.cleanup','LogsCleanup','System Jobs','Logs Cleanup','Delete ObjectChange and/or JobResult/JobLogEntry records older than a specified cutoff.',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('48fbcf032efa453d860e7b4c07cf7e30','2026-09-07 09:14:46.125956','2026-09-07 09:14:46.128463','{}','nautobot.core.jobs.customfields','CleanupCustomFieldsData','Custom Field System Jobs','Cleanup Custom Fields','System Job to cleanup Custom Field data, which may be destructive.\n\nPlease review the documentation before running this job. It is recommended to run this job in a test environment and dry-run first.',1,1,0,0,0,3600,4000,0,0,0,0,0,0,0,0,0,0,0,0,1,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('4cc2a8202ba14618a986141da4d74cef','2026-09-07 09:14:46.200723','2026-09-07 09:14:46.203045','{}','nautobot.core.jobs.groups','RefreshDynamicGroupCacheJobButtonReceiver','System Jobs','Refresh Dynamic Group Cache (Job Button Receiver)','Re-calculate and re-cache the membership list of a given Dynamic Group.',1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('6719596a4fa14c8193ef793da7ae1cec','2026-09-07 09:14:46.174861','2026-09-07 09:14:46.177528','{}','nautobot.core.jobs','ImportObjects','System Jobs','Import Objects','Import objects from CSV-formatted data.',1,1,0,0,0,1800,2000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('79a7516221bf4ee5a74493e62cacc2ef','2026-09-07 09:14:46.212265','2026-09-07 09:14:46.214450','{}','nautobot.core.jobs.customfields','UpdateCustomFieldChoiceData','Custom Field System Jobs','Update Custom Field Choice Data','Rename a choice value on a Select or Multi-Select Custom Field across all affected objects.',1,1,0,0,0,3600,4000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('79c7f2ec02ae43b5bde05b8e9bb7bb69','2026-09-07 09:14:46.222585','2026-09-07 09:14:46.224564','{}','nautobot.ipam.jobs.cleanup','FixIPAMParents','System Jobs','Check/Fix IPAM Parents','Check for and/or fix incorrect \'parent\' values on IP Address and/or Prefix records.',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('9158746086a847d4a17bb5e5359a9eb2','2026-09-07 09:14:46.132092','2026-09-07 09:14:46.134124','{}','nautobot.core.jobs.customfields','DeleteCustomFieldData','Custom Field System Jobs','Delete Custom Field Data','Delete all stored values for a given Custom Field key across the specified Content Types.',1,1,0,0,0,3600,4000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('b14660ffaaf1404d97716fb823fdea49','2026-09-07 09:14:46.195249','2026-09-07 09:14:46.197383','{}','nautobot.core.jobs.groups','RefreshDynamicGroupCaches','System Jobs','Refresh Dynamic Group Caches','Re-calculate and re-cache the membership lists of Dynamic Groups.',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('b95f5a2e54924e5ca3a42f427ad5f3a3','2026-09-07 09:14:46.147476','2026-09-07 09:14:46.149641','{}','nautobot.core.jobs','GitRepositoryDryRun','System Jobs','Git Repository: Dry-Run','Dry run of Git repository sync - will not update data sourced from this repository.',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('c992752c8948455c8fa6ded9d88965fa','2026-09-07 09:14:45.981355','2026-09-07 09:14:45.984457','{}','nautobot.core.jobs.bulk_actions','BulkDeleteObjects','System Jobs','Bulk Delete Objects','Bulk delete objects.',1,1,0,1,0,1800,2000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0),('fae1df4c8c4645e696b197d0659e7b6f','2026-09-07 09:14:46.217630','2026-09-07 09:14:46.219680','{}','nautobot.core.jobs','ValidateModelData','System Jobs','Validate Model Data','Run `full_clean()` against all records of a given type(s) to check for data validity.',1,1,0,0,1,1800,2000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2a1e51758de048e1a5e7722958e39263',0,0,0,0);
/*!40000 ALTER TABLE `extras_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_jobbutton`
--

DROP TABLE IF EXISTS `extras_jobbutton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_jobbutton` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `text` varchar(500) NOT NULL,
  `weight` smallint unsigned NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `button_class` varchar(30) NOT NULL,
  `confirmation` tinyint(1) NOT NULL,
  `job_id` char(32) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `extras_jobbutton_job_id_710e013a_fk_extras_job_id` (`job_id`),
  CONSTRAINT `extras_jobbutton_job_id_710e013a_fk_extras_job_id` FOREIGN KEY (`job_id`) REFERENCES `extras_job` (`id`),
  CONSTRAINT `extras_jobbutton_chk_1` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_jobbutton`
--

LOCK TABLES `extras_jobbutton` WRITE;
/*!40000 ALTER TABLE `extras_jobbutton` DISABLE KEYS */;
INSERT INTO `extras_jobbutton` VALUES ('4d6b713b07f84d1a82de67d81b3a538c','2026-09-07 09:14:46.235036','2026-09-07 09:14:46.235057','Refresh Dynamic Group Members Cache','Refresh Members',100,'','warning',1,'4cc2a8202ba14618a986141da4d74cef',1);
/*!40000 ALTER TABLE `extras_jobbutton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_jobbutton_content_types`
--

DROP TABLE IF EXISTS `extras_jobbutton_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_jobbutton_content_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jobbutton_id` char(32) NOT NULL,
  `contenttype_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_jobbutton_content_jobbutton_id_contenttype_058baab2_uniq` (`jobbutton_id`,`contenttype_id`),
  KEY `extras_jobbutton_con_contenttype_id_b0c6bbc4_fk_django_co` (`contenttype_id`),
  CONSTRAINT `extras_jobbutton_con_contenttype_id_b0c6bbc4_fk_django_co` FOREIGN KEY (`contenttype_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_jobbutton_con_jobbutton_id_72bd14bf_fk_extras_jo` FOREIGN KEY (`jobbutton_id`) REFERENCES `extras_jobbutton` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_jobbutton_content_types`
--

LOCK TABLES `extras_jobbutton_content_types` WRITE;
/*!40000 ALTER TABLE `extras_jobbutton_content_types` DISABLE KEYS */;
INSERT INTO `extras_jobbutton_content_types` VALUES (1,'4d6b713b07f84d1a82de67d81b3a538c',52);
/*!40000 ALTER TABLE `extras_jobbutton_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_jobconsoleentry`
--

DROP TABLE IF EXISTS `extras_jobconsoleentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_jobconsoleentry` (
  `id` char(32) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `output_type` varchar(10) NOT NULL,
  `text` longtext NOT NULL,
  `job_result_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extras_jobconsoleent_job_result_id_5c27d716_fk_extras_jo` (`job_result_id`),
  CONSTRAINT `extras_jobconsoleent_job_result_id_5c27d716_fk_extras_jo` FOREIGN KEY (`job_result_id`) REFERENCES `extras_jobresult` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_jobconsoleentry`
--

LOCK TABLES `extras_jobconsoleentry` WRITE;
/*!40000 ALTER TABLE `extras_jobconsoleentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_jobconsoleentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_jobhook`
--

DROP TABLE IF EXISTS `extras_jobhook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_jobhook` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type_create` tinyint(1) NOT NULL,
  `type_delete` tinyint(1) NOT NULL,
  `type_update` tinyint(1) NOT NULL,
  `job_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `extras_jobhook_job_id_cfcdb972_fk_extras_job_id` (`job_id`),
  CONSTRAINT `extras_jobhook_job_id_cfcdb972_fk_extras_job_id` FOREIGN KEY (`job_id`) REFERENCES `extras_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_jobhook`
--

LOCK TABLES `extras_jobhook` WRITE;
/*!40000 ALTER TABLE `extras_jobhook` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_jobhook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_jobhook_content_types`
--

DROP TABLE IF EXISTS `extras_jobhook_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_jobhook_content_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jobhook_id` char(32) NOT NULL,
  `contenttype_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_jobhook_content_t_jobhook_id_contenttype_i_c21a50f9_uniq` (`jobhook_id`,`contenttype_id`),
  KEY `extras_jobhook_conte_contenttype_id_42d2bda1_fk_django_co` (`contenttype_id`),
  CONSTRAINT `extras_jobhook_conte_contenttype_id_42d2bda1_fk_django_co` FOREIGN KEY (`contenttype_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_jobhook_conte_jobhook_id_d994e51b_fk_extras_jo` FOREIGN KEY (`jobhook_id`) REFERENCES `extras_jobhook` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_jobhook_content_types`
--

LOCK TABLES `extras_jobhook_content_types` WRITE;
/*!40000 ALTER TABLE `extras_jobhook_content_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_jobhook_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_joblogentry`
--

DROP TABLE IF EXISTS `extras_joblogentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_joblogentry` (
  `id` char(32) NOT NULL,
  `log_level` varchar(32) NOT NULL,
  `grouping` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `log_object` varchar(200) NOT NULL,
  `absolute_url` varchar(255) NOT NULL,
  `job_result_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extras_joblogentry_log_level_f8cfe898` (`log_level`),
  KEY `extras_joblogentry_created_ef6e01c5` (`created`),
  KEY `extras_joblog_jr_created_idx` (`job_result_id`,`created`),
  CONSTRAINT `extras_joblogentry_job_result_id_91e10d1a_fk_extras_jobresult_id` FOREIGN KEY (`job_result_id`) REFERENCES `extras_jobresult` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_joblogentry`
--

LOCK TABLES `extras_joblogentry` WRITE;
/*!40000 ALTER TABLE `extras_joblogentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_joblogentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_jobqueue`
--

DROP TABLE IF EXISTS `extras_jobqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_jobqueue` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `queue_type` varchar(50) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `extras_jobqueue_tenant_id_042f9066_fk_tenancy_tenant_id` (`tenant_id`),
  CONSTRAINT `extras_jobqueue_tenant_id_042f9066_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_jobqueue`
--

LOCK TABLES `extras_jobqueue` WRITE;
/*!40000 ALTER TABLE `extras_jobqueue` DISABLE KEYS */;
INSERT INTO `extras_jobqueue` VALUES ('2a1e51758de048e1a5e7722958e39263','2026-09-07 09:12:21.553837','2026-09-07 09:12:21.553866','{}','default','','celery',NULL);
/*!40000 ALTER TABLE `extras_jobqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_jobqueueassignment`
--

DROP TABLE IF EXISTS `extras_jobqueueassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_jobqueueassignment` (
  `id` char(32) NOT NULL,
  `job_id` char(32) NOT NULL,
  `job_queue_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_jobqueueassignment_job_id_job_queue_id_1c36e3d3_uniq` (`job_id`,`job_queue_id`),
  KEY `extras_jobqueueassig_job_queue_id_94e2147b_fk_extras_jo` (`job_queue_id`),
  CONSTRAINT `extras_jobqueueassig_job_queue_id_94e2147b_fk_extras_jo` FOREIGN KEY (`job_queue_id`) REFERENCES `extras_jobqueue` (`id`),
  CONSTRAINT `extras_jobqueueassignment_job_id_5c6d0ffc_fk_extras_job_id` FOREIGN KEY (`job_id`) REFERENCES `extras_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_jobqueueassignment`
--

LOCK TABLES `extras_jobqueueassignment` WRITE;
/*!40000 ALTER TABLE `extras_jobqueueassignment` DISABLE KEYS */;
INSERT INTO `extras_jobqueueassignment` VALUES ('f872842a6eb4462eba16fc540c6961e5','16c9164fe8534cc299d9b9425e6468e8','2a1e51758de048e1a5e7722958e39263'),('56edbd0565f34ca4918a6325e0eec572','1b7428d200644364869cb4f641a37f6f','2a1e51758de048e1a5e7722958e39263'),('7215cc7edb314af49581ead3878c28ed','2085d23a1e3240c3a1792579346672ae','2a1e51758de048e1a5e7722958e39263'),('dc1435afa9c04256b3a64e2cf3d9a2a1','2ad11f6f5f3a4f849ba757618b081b1b','2a1e51758de048e1a5e7722958e39263'),('3109e9891d39497aa9277b78d59a7e3f','2d2107ed38fc4dcd8f681c52874c02cc','2a1e51758de048e1a5e7722958e39263'),('ddefc4b01cfd49a5949f4d9d836d1ecc','3ccc7684b54f4ba2bb5c9401061ef20b','2a1e51758de048e1a5e7722958e39263'),('afa62162dd884aac91f21e70148af316','48fbcf032efa453d860e7b4c07cf7e30','2a1e51758de048e1a5e7722958e39263'),('a230361a5a4d40539d77744763030ac8','4cc2a8202ba14618a986141da4d74cef','2a1e51758de048e1a5e7722958e39263'),('1dbc478a45c94696a86a978f5664c110','6719596a4fa14c8193ef793da7ae1cec','2a1e51758de048e1a5e7722958e39263'),('1d41e58f2433406a83bfcd03e7e09994','79a7516221bf4ee5a74493e62cacc2ef','2a1e51758de048e1a5e7722958e39263'),('0adf52b02a624c8aa44a2d84d2dd6663','79c7f2ec02ae43b5bde05b8e9bb7bb69','2a1e51758de048e1a5e7722958e39263'),('5c1dc17564c542178080711f1bf95e86','9158746086a847d4a17bb5e5359a9eb2','2a1e51758de048e1a5e7722958e39263'),('d63c65c489724d44b28eddd11bf7f0ec','b14660ffaaf1404d97716fb823fdea49','2a1e51758de048e1a5e7722958e39263'),('60841210798a4a8c845d34c9eff6d8a5','b95f5a2e54924e5ca3a42f427ad5f3a3','2a1e51758de048e1a5e7722958e39263'),('fabcbf83fa8347448ac553f57e15fed2','c992752c8948455c8fa6ded9d88965fa','2a1e51758de048e1a5e7722958e39263'),('7ae0aea9f2ff40ba9a50ef8a499b5c4f','fae1df4c8c4645e696b197d0659e7b6f','2a1e51758de048e1a5e7722958e39263');
/*!40000 ALTER TABLE `extras_jobqueueassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_jobresult`
--

DROP TABLE IF EXISTS `extras_jobresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_jobresult` (
  `id` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_done` datetime(6) DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `result` json DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  `_custom_field_data` json NOT NULL DEFAULT (_utf8mb4'{}'),
  `scheduled_job_id` char(32) DEFAULT NULL,
  `job_model_id` char(32) DEFAULT NULL,
  `task_args` json NOT NULL,
  `meta` json DEFAULT NULL,
  `task_kwargs` json NOT NULL DEFAULT (_utf8mb4'{}'),
  `task_name` varchar(255) DEFAULT NULL,
  `traceback` longtext,
  `worker` varchar(100) DEFAULT NULL,
  `celery_kwargs` json NOT NULL DEFAULT (_utf8mb4'{}'),
  `date_started` datetime(6) DEFAULT NULL,
  `debug_log_count` int unsigned DEFAULT NULL,
  `error_log_count` int unsigned DEFAULT NULL,
  `info_log_count` int unsigned DEFAULT NULL,
  `success_log_count` int unsigned DEFAULT NULL,
  `warning_log_count` int unsigned DEFAULT NULL,
  `cancel_type` varchar(30) NOT NULL,
  `canceled_by_id` char(32) DEFAULT NULL,
  `canceled_by_user_name` varchar(150) NOT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `extras_jobresult_user_id_d35285ab_fk_auth_user_id` (`user_id`),
  KEY `extras_jobresult_job_model_id_d581ec7e_fk_extras_job_id` (`job_model_id`),
  KEY `extras_jobresult_name_3f143125` (`name`),
  KEY `extras_jobresult_completed_41ca396b` (`date_done`),
  KEY `extras_jobresult_created_bf3a3954` (`date_created`),
  KEY `extras_jobresult_status_2659cbae` (`status`),
  KEY `extras_jobresult_rcreated_idx` (`date_created` DESC),
  KEY `extras_jr_rdone_idx` (`date_done` DESC),
  KEY `extras_jr_statrcreate_idx` (`status`,`date_created` DESC),
  KEY `extras_jr_statrdone_idx` (`status`,`date_done` DESC),
  KEY `extras_jobresult_task_name_05e4b9b2` (`task_name`),
  KEY `extras_jobresult_scheduled_job_id_0921f94c_fk_extras_sc` (`scheduled_job_id`),
  KEY `extras_jobresult_date_started_6992234b` (`date_started`),
  KEY `extras_jobresult_canceled_by_id_9bd0780e_fk_auth_user_id` (`canceled_by_id`),
  CONSTRAINT `extras_jobresult_canceled_by_id_9bd0780e_fk_auth_user_id` FOREIGN KEY (`canceled_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `extras_jobresult_job_model_id_d581ec7e_fk_extras_job_id` FOREIGN KEY (`job_model_id`) REFERENCES `extras_job` (`id`),
  CONSTRAINT `extras_jobresult_scheduled_job_id_0921f94c_fk_extras_sc` FOREIGN KEY (`scheduled_job_id`) REFERENCES `extras_scheduledjob` (`id`),
  CONSTRAINT `extras_jobresult_user_id_d35285ab_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `extras_jobresult_chk_1` CHECK ((`debug_log_count` >= 0)),
  CONSTRAINT `extras_jobresult_chk_2` CHECK ((`error_log_count` >= 0)),
  CONSTRAINT `extras_jobresult_chk_3` CHECK ((`info_log_count` >= 0)),
  CONSTRAINT `extras_jobresult_chk_4` CHECK ((`success_log_count` >= 0)),
  CONSTRAINT `extras_jobresult_chk_5` CHECK ((`warning_log_count` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_jobresult`
--

LOCK TABLES `extras_jobresult` WRITE;
/*!40000 ALTER TABLE `extras_jobresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_jobresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_metadatachoice`
--

DROP TABLE IF EXISTS `extras_metadatachoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_metadatachoice` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `weight` smallint unsigned NOT NULL,
  `metadata_type_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_metadatachoice_metadata_type_id_value_654f2a93_uniq` (`metadata_type_id`,`value`),
  CONSTRAINT `extras_metadatachoic_metadata_type_id_a926f087_fk_extras_me` FOREIGN KEY (`metadata_type_id`) REFERENCES `extras_metadatatype` (`id`),
  CONSTRAINT `extras_metadatachoice_chk_1` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_metadatachoice`
--

LOCK TABLES `extras_metadatachoice` WRITE;
/*!40000 ALTER TABLE `extras_metadatachoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_metadatachoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_metadatatype`
--

DROP TABLE IF EXISTS `extras_metadatatype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_metadatatype` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `data_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_metadatatype`
--

LOCK TABLES `extras_metadatatype` WRITE;
/*!40000 ALTER TABLE `extras_metadatatype` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_metadatatype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_metadatatype_content_types`
--

DROP TABLE IF EXISTS `extras_metadatatype_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_metadatatype_content_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `metadatatype_id` char(32) NOT NULL,
  `contenttype_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_metadatatype_cont_metadatatype_id_contentt_630db2b4_uniq` (`metadatatype_id`,`contenttype_id`),
  KEY `extras_metadatatype__contenttype_id_ff6bdd1a_fk_django_co` (`contenttype_id`),
  CONSTRAINT `extras_metadatatype__contenttype_id_ff6bdd1a_fk_django_co` FOREIGN KEY (`contenttype_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_metadatatype__metadatatype_id_a01f54b4_fk_extras_me` FOREIGN KEY (`metadatatype_id`) REFERENCES `extras_metadatatype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_metadatatype_content_types`
--

LOCK TABLES `extras_metadatatype_content_types` WRITE;
/*!40000 ALTER TABLE `extras_metadatatype_content_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_metadatatype_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_note`
--

DROP TABLE IF EXISTS `extras_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_note` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `assigned_object_id` char(32) NOT NULL,
  `user_name` varchar(150) NOT NULL,
  `note` longtext NOT NULL,
  `assigned_object_type_id` int NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_note_assigned_object_type_id__e1504524_uniq` (`assigned_object_type_id`,`assigned_object_id`,`user_name`,`created`),
  KEY `extras_note_user_id_f11ab655_fk_auth_user_id` (`user_id`),
  KEY `extras_note_assigned_object_id_af6ced75` (`assigned_object_id`),
  CONSTRAINT `extras_note_assigned_object_type_e15d3cda_fk_django_co` FOREIGN KEY (`assigned_object_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_note_user_id_f11ab655_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_note`
--

LOCK TABLES `extras_note` WRITE;
/*!40000 ALTER TABLE `extras_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_objectchange`
--

DROP TABLE IF EXISTS `extras_objectchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_objectchange` (
  `id` char(32) NOT NULL,
  `time` datetime(6) NOT NULL,
  `user_name` varchar(150) NOT NULL,
  `request_id` char(32) NOT NULL,
  `action` varchar(50) NOT NULL,
  `changed_object_id` char(32) NOT NULL,
  `related_object_id` char(32) DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `object_data` json NOT NULL,
  `changed_object_type_id` int DEFAULT NULL,
  `related_object_type_id` int DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  `object_data_v2` json DEFAULT NULL,
  `change_context` varchar(50) NOT NULL,
  `change_context_detail` varchar(400) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_objectchange_time_request_id_changed__f5f870cc_uniq` (`time`,`request_id`,`changed_object_type_id`,`changed_object_id`),
  KEY `extras_objectchange_time_224380ea` (`time`),
  KEY `extras_objectchange_changed_object_id_efb1a943` (`changed_object_id`),
  KEY `extras_objectchange_request_id_4ae21e90` (`request_id`),
  KEY `extras_objectchange_triple_idx` (`request_id`,`changed_object_type_id`,`changed_object_id`),
  KEY `extras_objectchange_double_idx` (`request_id`,`changed_object_type_id`),
  KEY `extras_objectchange_change_context_8e03ae30` (`change_context`),
  KEY `extras_objectchange_rtime_idx` (`time` DESC),
  KEY `extras_objectchange_user_name_4ef4fac7` (`user_name`),
  KEY `changed_object_idx` (`changed_object_type_id`,`changed_object_id`),
  KEY `related_object_idx` (`related_object_type_id`,`related_object_id`),
  KEY `user_changed_object_idx` (`user_id`,`changed_object_type_id`,`changed_object_id`),
  KEY `user_name_changed_object_idx` (`user_name`,`changed_object_type_id`,`changed_object_id`),
  CONSTRAINT `extras_objectchange_changed_object_type__b755bb60_fk_django_co` FOREIGN KEY (`changed_object_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_objectchange_related_object_type__fe6e521f_fk_django_co` FOREIGN KEY (`related_object_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_objectchange_user_id_7fdf8186_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_objectchange`
--

LOCK TABLES `extras_objectchange` WRITE;
/*!40000 ALTER TABLE `extras_objectchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_objectchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_objectmetadata`
--

DROP TABLE IF EXISTS `extras_objectmetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_objectmetadata` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `scoped_fields` json NOT NULL,
  `_value` json DEFAULT NULL,
  `assigned_object_id` char(32) NOT NULL,
  `assigned_object_type_id` int NOT NULL,
  `contact_id` char(32) DEFAULT NULL,
  `metadata_type_id` char(32) NOT NULL,
  `team_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `extras_objectmetadata_contact_id_6677d391_fk_extras_contact_id` (`contact_id`),
  KEY `extras_objectmetadat_metadata_type_id_2d962b1c_fk_extras_me` (`metadata_type_id`),
  KEY `extras_objectmetadata_team_id_01c93a83_fk_extras_team_id` (`team_id`),
  KEY `extras_objectmetadata_assigned_object_id_979c3856` (`assigned_object_id`),
  KEY `assigned_object` (`assigned_object_type_id`,`assigned_object_id`),
  KEY `assigned_object_contact` (`assigned_object_type_id`,`assigned_object_id`,`contact_id`),
  KEY `assigned_object_team` (`assigned_object_type_id`,`assigned_object_id`,`team_id`),
  CONSTRAINT `extras_objectmetadat_assigned_object_type_d5a5f952_fk_django_co` FOREIGN KEY (`assigned_object_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_objectmetadat_metadata_type_id_2d962b1c_fk_extras_me` FOREIGN KEY (`metadata_type_id`) REFERENCES `extras_metadatatype` (`id`),
  CONSTRAINT `extras_objectmetadata_contact_id_6677d391_fk_extras_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `extras_contact` (`id`),
  CONSTRAINT `extras_objectmetadata_team_id_01c93a83_fk_extras_team_id` FOREIGN KEY (`team_id`) REFERENCES `extras_team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_objectmetadata`
--

LOCK TABLES `extras_objectmetadata` WRITE;
/*!40000 ALTER TABLE `extras_objectmetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_objectmetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_relationship`
--

DROP TABLE IF EXISTS `extras_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_relationship` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `source_label` varchar(255) NOT NULL,
  `source_hidden` tinyint(1) NOT NULL,
  `source_filter` json DEFAULT NULL,
  `destination_label` varchar(255) NOT NULL,
  `destination_hidden` tinyint(1) NOT NULL,
  `destination_filter` json DEFAULT NULL,
  `destination_type_id` int NOT NULL,
  `source_type_id` int NOT NULL,
  `advanced_ui` tinyint(1) NOT NULL,
  `required_on` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`label`),
  UNIQUE KEY `slug` (`key`),
  KEY `extras_relationship_destination_type_id_fb7387c3_fk_django_co` (`destination_type_id`),
  KEY `extras_relationship_source_type_id_21183ad6_fk_django_co` (`source_type_id`),
  CONSTRAINT `extras_relationship_destination_type_id_fb7387c3_fk_django_co` FOREIGN KEY (`destination_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_relationship_source_type_id_21183ad6_fk_django_co` FOREIGN KEY (`source_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_relationship`
--

LOCK TABLES `extras_relationship` WRITE;
/*!40000 ALTER TABLE `extras_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_relationshipassociation`
--

DROP TABLE IF EXISTS `extras_relationshipassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_relationshipassociation` (
  `id` char(32) NOT NULL,
  `source_id` char(32) NOT NULL,
  `destination_id` char(32) NOT NULL,
  `destination_type_id` int NOT NULL,
  `relationship_id` char(32) NOT NULL,
  `source_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_relationshipassoc_relationship_id_source_t_6826a98b_uniq` (`relationship_id`,`source_type_id`,`source_id`,`destination_type_id`,`destination_id`),
  KEY `extras_relationshipa_destination_type_id_5ccb6728_fk_django_co` (`destination_type_id`),
  KEY `extras_relationshipa_source_type_id_28c8df60_fk_django_co` (`source_type_id`),
  KEY `extras_relationshipassociation_destination_id_83f811cb` (`destination_id`),
  KEY `extras_relationshipassociation_source_id_cb8931c1` (`source_id`),
  CONSTRAINT `extras_relationshipa_destination_type_id_5ccb6728_fk_django_co` FOREIGN KEY (`destination_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_relationshipa_relationship_id_9a65ccc8_fk_extras_re` FOREIGN KEY (`relationship_id`) REFERENCES `extras_relationship` (`id`),
  CONSTRAINT `extras_relationshipa_source_type_id_28c8df60_fk_django_co` FOREIGN KEY (`source_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_relationshipassociation`
--

LOCK TABLES `extras_relationshipassociation` WRITE;
/*!40000 ALTER TABLE `extras_relationshipassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_relationshipassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_role`
--

DROP TABLE IF EXISTS `extras_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_role` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(6) NOT NULL,
  `description` varchar(255) NOT NULL,
  `weight` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `extras_role_chk_1` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_role`
--

LOCK TABLES `extras_role` WRITE;
/*!40000 ALTER TABLE `extras_role` DISABLE KEYS */;
INSERT INTO `extras_role` VALUES ('1041b68365ae4f4d99540e049e0ab54c','2026-09-07 09:11:09.816500','2026-09-07 09:11:09.816513','{}','On Site','111111','Unit plays an on site role',NULL),('1efc6207064846f69b8abe30ee710ff3','2026-09-07 00:00:00.000000','2026-09-07 09:08:26.209345','{}','Anycast','ffc107','',NULL),('2e8aeb8cf67443a796040badf8a6d46f','2026-09-07 09:14:06.414550','2026-09-07 09:14:06.414578','{}','DHCP','2196f3','IP Address Range used as a DHCP scope',NULL),('4bdde622255f4f3aa31c51e499b8a407','2026-09-07 09:14:06.420457','2026-09-07 09:14:06.420473','{}','Load Balancer Pool','4caf50','IP Address Range used as a load balancer pool',NULL),('510bbe996030436f9bd5aee05465dae3','2026-09-07 09:14:06.416834','2026-09-07 09:14:06.416854','{}','Firewall Object','f44336','IP Address Range representing a firewall address object',NULL),('52378d69bfa14ec7a743fbf30f1d9261','2026-09-07 00:00:00.000000','2026-09-07 09:08:26.213288','{}','CARP','4caf50','',NULL),('81a0bffd584f4215b40ab46c7a256f2a','2026-09-07 00:00:00.000000','2026-09-07 09:08:26.211673','{}','HSRP','4caf50','',NULL),('857f39b53e034fcc8f367624b2421c2a','2026-09-07 09:14:06.418623','2026-09-07 09:14:06.418642','{}','NAT Pool','ff9800','IP Address Range used as a NAT pool',NULL),('8cda65702e584eb3b254266c821ef61c','2026-09-07 00:00:00.000000','2026-09-07 09:08:26.207467','{}','Loopback','9e9e9e','',NULL),('9262d15fd4024fb59cc1fa0f1aabc071','2026-09-07 00:00:00.000000','2026-09-07 09:08:26.210119','{}','VIP','4caf50','',NULL),('962d25a389044d5a8b9511e5662b33ac','2026-09-07 00:00:00.000000','2026-09-07 09:08:26.210835','{}','VRRP','4caf50','',NULL),('ab5fe91763fe4187b4b2235270f6d263','2026-09-07 09:11:09.814800','2026-09-07 09:11:09.814811','{}','Support','ffeb3b','Unit plays a support role',NULL),('bed1eb5e908949c187b9289bc8acb497','2026-09-07 09:14:42.931575','2026-09-07 09:14:42.931594','{}','Spoke','8bc34a','Unit plays a Spoke role',NULL),('bf44c1c41ab24f909610806bbfd27677','2026-09-07 09:11:09.813215','2026-09-07 09:11:09.813228','{}','Billing','4caf50','Unit plays a billing role',NULL),('c4fa568c58fd4111b4cb3b7318df7ff7','2026-09-07 09:14:42.927567','2026-09-07 09:14:42.927598','{}','Peer','ff9800','Unit plays a Peer role',NULL),('c9122cbd78244edabe6eda4b664544f1','2026-09-07 09:14:42.929762','2026-09-07 09:14:42.929784','{}','Hub','2f6a31','Unit plays a Hub role',NULL),('cc0f6fbd89e44859bbfefaaeddf7f0ad','2026-09-07 00:00:00.000000','2026-09-07 09:08:26.208320','{}','Secondary','2196f3','',NULL),('cef4358a1cdc407195dfb4872973cf93','2026-09-07 09:11:09.810902','2026-09-07 09:11:09.810916','{}','Administrative','2196f3','Unit plays an administrative role',NULL),('f1008e54140945d4aa259fb145eaf79c','2026-09-07 09:14:06.422083','2026-09-07 09:14:06.422101','{}','Reserved','9e9e9e','IP Address Range reserved for a specific purpose',NULL),('fda67a3eaf2141ba94ca3cc45c2aba5b','2026-09-07 00:00:00.000000','2026-09-07 09:08:26.212465','{}','GLBP','4caf50','',NULL);
/*!40000 ALTER TABLE `extras_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_role_content_types`
--

DROP TABLE IF EXISTS `extras_role_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_role_content_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` char(32) NOT NULL,
  `contenttype_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_role_content_types_role_id_contenttype_id_ff2e3d23_uniq` (`role_id`,`contenttype_id`),
  KEY `extras_role_content__contenttype_id_b8004814_fk_django_co` (`contenttype_id`),
  CONSTRAINT `extras_role_content__contenttype_id_b8004814_fk_django_co` FOREIGN KEY (`contenttype_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_role_content_types_role_id_1db5d29d_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_role_content_types`
--

LOCK TABLES `extras_role_content_types` WRITE;
/*!40000 ALTER TABLE `extras_role_content_types` DISABLE KEYS */;
INSERT INTO `extras_role_content_types` VALUES (12,'1041b68365ae4f4d99540e049e0ab54c',23),(1,'1efc6207064846f69b8abe30ee710ff3',6),(13,'2e8aeb8cf67443a796040badf8a6d46f',36),(16,'4bdde622255f4f3aa31c51e499b8a407',36),(14,'510bbe996030436f9bd5aee05465dae3',36),(2,'52378d69bfa14ec7a743fbf30f1d9261',6),(4,'81a0bffd584f4215b40ab46c7a256f2a',6),(15,'857f39b53e034fcc8f367624b2421c2a',36),(5,'8cda65702e584eb3b254266c821ef61c',6),(7,'9262d15fd4024fb59cc1fa0f1aabc071',6),(8,'962d25a389044d5a8b9511e5662b33ac',6),(11,'ab5fe91763fe4187b4b2235270f6d263',23),(20,'bed1eb5e908949c187b9289bc8acb497',39),(10,'bf44c1c41ab24f909610806bbfd27677',23),(18,'c4fa568c58fd4111b4cb3b7318df7ff7',39),(19,'c9122cbd78244edabe6eda4b664544f1',39),(6,'cc0f6fbd89e44859bbfefaaeddf7f0ad',6),(9,'cef4358a1cdc407195dfb4872973cf93',23),(17,'f1008e54140945d4aa259fb145eaf79c',36),(3,'fda67a3eaf2141ba94ca3cc45c2aba5b',6);
/*!40000 ALTER TABLE `extras_role_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_savedview`
--

DROP TABLE IF EXISTS `extras_savedview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_savedview` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `view` varchar(255) NOT NULL,
  `config` json NOT NULL,
  `is_global_default` tinyint(1) NOT NULL,
  `is_shared` tinyint(1) NOT NULL,
  `owner_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_savedview_owner_id_name_view_2fe994b2_uniq` (`owner_id`,`name`,`view`),
  CONSTRAINT `extras_savedview_owner_id_c976ba29_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_savedview`
--

LOCK TABLES `extras_savedview` WRITE;
/*!40000 ALTER TABLE `extras_savedview` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_savedview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_scheduledjob`
--

DROP TABLE IF EXISTS `extras_scheduledjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_scheduledjob` (
  `id` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `task` varchar(201) NOT NULL,
  `interval` varchar(255) NOT NULL,
  `args` json NOT NULL,
  `kwargs` json NOT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `decision_date` datetime(6) DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  `job_model_id` char(32) DEFAULT NULL,
  `crontab` varchar(255) NOT NULL,
  `celery_kwargs` json NOT NULL DEFAULT (_utf8mb4'{}'),
  `time_zone` varchar(63) NOT NULL,
  `job_queue_id` char(32) DEFAULT NULL,
  `clocked_id` int DEFAULT NULL,
  `exchange` varchar(255) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `expire_seconds` int unsigned DEFAULT NULL,
  `headers` longtext NOT NULL DEFAULT (_utf8mb4'{}'),
  `priority` int unsigned DEFAULT NULL,
  `routing_key` varchar(255) DEFAULT NULL,
  `solar_id` int DEFAULT NULL,
  `state` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_scheduledjob_name_fcea52d7_uniq` (`name`),
  KEY `extras_scheduledjob_user_id_4d8034ff_fk_auth_user_id` (`user_id`),
  KEY `extras_scheduledjob_job_model_id_d4c0711e_fk_extras_job_id` (`job_model_id`),
  KEY `extras_scheduledjob_task_7eaf2d6d` (`task`),
  KEY `extras_scheduledjob_job_queue_id_d238dd34_fk_extras_jobqueue_id` (`job_queue_id`),
  KEY `extras_scheduledjob_clocked_id_7521f2a5_fk_django_ce` (`clocked_id`),
  KEY `extras_scheduledjob_solar_id_07789418_fk_django_ce` (`solar_id`),
  KEY `extras_scheduledjob_state_a164d56f` (`state`),
  CONSTRAINT `extras_scheduledjob_clocked_id_7521f2a5_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  CONSTRAINT `extras_scheduledjob_job_model_id_d4c0711e_fk_extras_job_id` FOREIGN KEY (`job_model_id`) REFERENCES `extras_job` (`id`),
  CONSTRAINT `extras_scheduledjob_job_queue_id_d238dd34_fk_extras_jobqueue_id` FOREIGN KEY (`job_queue_id`) REFERENCES `extras_jobqueue` (`id`),
  CONSTRAINT `extras_scheduledjob_solar_id_07789418_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`),
  CONSTRAINT `extras_scheduledjob_user_id_4d8034ff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `extras_scheduledjob_chk_1` CHECK ((`total_run_count` >= 0)),
  CONSTRAINT `extras_scheduledjob_chk_2` CHECK ((`expire_seconds` >= 0)),
  CONSTRAINT `extras_scheduledjob_chk_3` CHECK ((`priority` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_scheduledjob`
--

LOCK TABLES `extras_scheduledjob` WRITE;
/*!40000 ALTER TABLE `extras_scheduledjob` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_scheduledjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_scheduledjobs`
--

DROP TABLE IF EXISTS `extras_scheduledjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_scheduledjobs` (
  `ident` smallint NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_scheduledjobs`
--

LOCK TABLES `extras_scheduledjobs` WRITE;
/*!40000 ALTER TABLE `extras_scheduledjobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_scheduledjobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_secret`
--

DROP TABLE IF EXISTS `extras_secret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_secret` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `parameters` json NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_secret`
--

LOCK TABLES `extras_secret` WRITE;
/*!40000 ALTER TABLE `extras_secret` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_secret` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_secretsgroup`
--

DROP TABLE IF EXISTS `extras_secretsgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_secretsgroup` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_secretsgroup`
--

LOCK TABLES `extras_secretsgroup` WRITE;
/*!40000 ALTER TABLE `extras_secretsgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_secretsgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_secretsgroupassociation`
--

DROP TABLE IF EXISTS `extras_secretsgroupassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_secretsgroupassociation` (
  `id` char(32) NOT NULL,
  `access_type` varchar(32) NOT NULL,
  `secret_type` varchar(32) NOT NULL,
  `secrets_group_id` char(32) NOT NULL,
  `secret_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_secretsgroupassoc_group_id_access_type_sec_1b1e944a_uniq` (`secrets_group_id`,`access_type`,`secret_type`),
  KEY `extras_secretsgroupa_secret_id_14d43d7e_fk_extras_se` (`secret_id`),
  CONSTRAINT `extras_secretsgroupa_secret_id_14d43d7e_fk_extras_se` FOREIGN KEY (`secret_id`) REFERENCES `extras_secret` (`id`),
  CONSTRAINT `extras_secretsgroupa_secrets_group_id_cf96162e_fk_extras_se` FOREIGN KEY (`secrets_group_id`) REFERENCES `extras_secretsgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_secretsgroupassociation`
--

LOCK TABLES `extras_secretsgroupassociation` WRITE;
/*!40000 ALTER TABLE `extras_secretsgroupassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_secretsgroupassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_staticgroupassociation`
--

DROP TABLE IF EXISTS `extras_staticgroupassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_staticgroupassociation` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `associated_object_id` char(32) NOT NULL,
  `associated_object_type_id` int NOT NULL,
  `dynamic_group_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_staticgroupassoci_dynamic_group_id_associa_086dca7c_uniq` (`dynamic_group_id`,`associated_object_type_id`,`associated_object_id`),
  KEY `extras_staticgroupassociation_associated_object_id_81e97e16` (`associated_object_id`),
  KEY `extras_sga_double` (`dynamic_group_id`,`associated_object_id`),
  KEY `extras_sga_associated_object` (`associated_object_type_id`,`associated_object_id`),
  CONSTRAINT `extras_staticgroupas_associated_object_ty_d3db04b2_fk_django_co` FOREIGN KEY (`associated_object_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_staticgroupas_dynamic_group_id_a1f081df_fk_extras_dy` FOREIGN KEY (`dynamic_group_id`) REFERENCES `extras_dynamicgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_staticgroupassociation`
--

LOCK TABLES `extras_staticgroupassociation` WRITE;
/*!40000 ALTER TABLE `extras_staticgroupassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_staticgroupassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_status`
--

DROP TABLE IF EXISTS `extras_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_status` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(6) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_status`
--

LOCK TABLES `extras_status` WRITE;
/*!40000 ALTER TABLE `extras_status` DISABLE KEYS */;
INSERT INTO `extras_status` VALUES ('02d2847b5cd14c74a24f9736518a900b','2026-09-07 00:00:00.000000','2026-09-07 09:07:13.436461','{}','Connected','4caf50','Cable is connected'),('07747db0211a433f979ed12937df75b8','2026-09-07 09:11:09.807557','2026-09-07 09:11:09.807575','{}','Secondary','ffeb3b','Unit is secondary'),('12176be9fcda44f7a43bf9a4c499d349','2026-09-07 00:00:00.000000','2026-09-07 09:07:13.464442','{}','Deprecated','f44336','Unit has been deprecated'),('19b6f6314e234644b4936f3a9f1c14fd','2026-09-07 00:00:00.000000','2026-09-07 09:07:13.439198','{}','Decommissioning','ffc107','Unit is being decommissioned'),('1a974c4bcaab4d33a2056b6bf0d1203e','2026-09-07 00:00:00.000000','2026-09-07 09:07:13.432281','{}','Deprovisioning','ffc107','Circuit is being deprovisioned'),('28063febb7e74940b1ab6b3937768fb4','2026-09-07 00:00:00.000000','2026-09-07 09:07:13.428804','{}','Active','4caf50','Unit is active'),('51cd6409ee874b55b6a0f893d1d4892b','2026-09-07 09:11:14.793962','2026-09-07 09:11:14.793974','{}','End-of-Life','f44336','Unit has reached end-of-life'),('5880281d01a34025a3566aba42b2b069','2026-09-07 00:00:00.000000','2026-09-07 09:07:35.244359','{}','Maintenance','9e9e9e','Unit is under maintenance'),('5c479289e08b4c0882dab95b1778d383','2026-09-07 00:00:00.000000','2026-09-07 09:07:13.446425','{}','Failed','f44336','Unit has failed'),('690db7350b424bc9b63c05d246ffc4f1','2026-09-07 00:00:00.000000','2026-09-07 09:07:13.444984','{}','Staged','2196f3','Unit has been staged'),('79f363fd8c1649bd8a6f21010e77e66f','2026-09-07 00:00:00.000000','2026-09-07 09:07:13.424627','{}','Planned','00bcd4','Unit has been planned'),('860bc33bcaf34b4c893e6d915935648a','2026-09-07 00:00:00.000000','2026-09-07 09:08:00.086186','{}','Staging','2196f3','Location is in the process of being staged'),('88641f582de34e12a9ba16531ab2b18f','2026-09-07 00:00:00.000000','2026-09-07 09:07:13.458349','{}','Reserved','00bcd4','Unit is reserved'),('9617d596e3ab40cfa7d8f81e8a0ec224','2026-09-07 00:00:00.000000','2026-09-07 09:07:13.434016','{}','Decommissioned','9e9e9e','Circuit has been decommissioned'),('9f916c217f4c42f49cf8023bf7faf95e','2026-09-07 00:00:00.000000','2026-09-07 09:08:00.090962','{}','Retired','f44336','Location has been retired'),('a881e1b627e9421d8d165d510673e34b','2026-09-07 00:00:00.000000','2026-09-07 09:07:13.430553','{}','Offline','ffc107','Unit is offline'),('b5dc54b6f3044ee3b24fe604f4cef4ce','2026-09-07 09:11:09.804639','2026-09-07 09:11:09.804670','{}','Primary','2196f3','Unit is primary'),('b713285e8cee4b76ba16c747cc382365','2026-09-07 09:11:14.792220','2026-09-07 09:11:14.792244','{}','Extended Support','00bcd4','Software is in extended support'),('c018b9833ca24bf49d7d4eef3e3869ae','2026-09-07 00:00:00.000000','2026-09-07 09:07:13.447891','{}','Inventory','9e9e9e','Device is in inventory'),('c0501b3d11b04bf593425c2ba75a738d','2026-09-07 09:12:36.491510','2026-09-07 09:12:36.491536','{}','Down','ffc107','VRF is down'),('d307beb4bb134bf2bf3da477440a238c','2026-09-07 00:00:00.000000','2026-09-07 09:07:13.460017','{}','Available','4caf50','Unit is available'),('e45b5909eb9f42a18e96c87f06493e04','2026-09-07 00:00:00.000000','2026-09-07 09:07:13.426959','{}','Provisioning','2196f3','Circuit is being provisioned');
/*!40000 ALTER TABLE `extras_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_status_content_types`
--

DROP TABLE IF EXISTS `extras_status_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_status_content_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status_id` char(32) NOT NULL,
  `contenttype_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_status_content_ty_status_id_contenttype_id_423e142c_uniq` (`status_id`,`contenttype_id`),
  KEY `extras_status_conten_contenttype_id_38503e74_fk_django_co` (`contenttype_id`),
  CONSTRAINT `extras_status_conten_contenttype_id_38503e74_fk_django_co` FOREIGN KEY (`contenttype_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_status_conten_status_id_27c665c7_fk_extras_st` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_status_content_types`
--

LOCK TABLES `extras_status_content_types` WRITE;
/*!40000 ALTER TABLE `extras_status_content_types` DISABLE KEYS */;
INSERT INTO `extras_status_content_types` VALUES (7,'02d2847b5cd14c74a24f9736518a900b',2),(67,'07747db0211a433f979ed12937df75b8',23),(25,'12176be9fcda44f7a43bf9a4c499d349',5),(28,'12176be9fcda44f7a43bf9a4c499d349',6),(31,'12176be9fcda44f7a43bf9a4c499d349',7),(34,'12176be9fcda44f7a43bf9a4c499d349',8),(91,'12176be9fcda44f7a43bf9a4c499d349',28),(97,'12176be9fcda44f7a43bf9a4c499d349',36),(105,'12176be9fcda44f7a43bf9a4c499d349',38),(9,'19b6f6314e234644b4936f3a9f1c14fd',2),(16,'19b6f6314e234644b4936f3a9f1c14fd',3),(40,'19b6f6314e234644b4936f3a9f1c14fd',9),(43,'19b6f6314e234644b4936f3a9f1c14fd',12),(49,'19b6f6314e234644b4936f3a9f1c14fd',13),(54,'19b6f6314e234644b4936f3a9f1c14fd',14),(59,'19b6f6314e234644b4936f3a9f1c14fd',19),(64,'19b6f6314e234644b4936f3a9f1c14fd',20),(81,'19b6f6314e234644b4936f3a9f1c14fd',26),(88,'19b6f6314e234644b4936f3a9f1c14fd',27),(102,'19b6f6314e234644b4936f3a9f1c14fd',37),(5,'1a974c4bcaab4d33a2056b6bf0d1203e',1),(3,'28063febb7e74940b1ab6b3937768fb4',1),(11,'28063febb7e74940b1ab6b3937768fb4',3),(18,'28063febb7e74940b1ab6b3937768fb4',4),(24,'28063febb7e74940b1ab6b3937768fb4',5),(26,'28063febb7e74940b1ab6b3937768fb4',6),(29,'28063febb7e74940b1ab6b3937768fb4',7),(32,'28063febb7e74940b1ab6b3937768fb4',8),(36,'28063febb7e74940b1ab6b3937768fb4',9),(42,'28063febb7e74940b1ab6b3937768fb4',12),(48,'28063febb7e74940b1ab6b3937768fb4',13),(53,'28063febb7e74940b1ab6b3937768fb4',14),(58,'28063febb7e74940b1ab6b3937768fb4',19),(63,'28063febb7e74940b1ab6b3937768fb4',20),(68,'28063febb7e74940b1ab6b3937768fb4',23),(69,'28063febb7e74940b1ab6b3937768fb4',24),(72,'28063febb7e74940b1ab6b3937768fb4',25),(76,'28063febb7e74940b1ab6b3937768fb4',26),(83,'28063febb7e74940b1ab6b3937768fb4',27),(89,'28063febb7e74940b1ab6b3937768fb4',28),(93,'28063febb7e74940b1ab6b3937768fb4',29),(95,'28063febb7e74940b1ab6b3937768fb4',36),(98,'28063febb7e74940b1ab6b3937768fb4',37),(103,'28063febb7e74940b1ab6b3937768fb4',38),(71,'51cd6409ee874b55b6a0f893d1d4892b',24),(74,'51cd6409ee874b55b6a0f893d1d4892b',25),(44,'5880281d01a34025a3566aba42b2b069',12),(50,'5880281d01a34025a3566aba42b2b069',13),(99,'5880281d01a34025a3566aba42b2b069',37),(14,'5c479289e08b4c0882dab95b1778d383',3),(20,'5c479289e08b4c0882dab95b1778d383',4),(39,'5c479289e08b4c0882dab95b1778d383',9),(41,'5c479289e08b4c0882dab95b1778d383',12),(47,'5c479289e08b4c0882dab95b1778d383',13),(79,'5c479289e08b4c0882dab95b1778d383',26),(86,'5c479289e08b4c0882dab95b1778d383',27),(101,'5c479289e08b4c0882dab95b1778d383',37),(13,'690db7350b424bc9b63c05d246ffc4f1',3),(38,'690db7350b424bc9b63c05d246ffc4f1',9),(78,'690db7350b424bc9b63c05d246ffc4f1',26),(85,'690db7350b424bc9b63c05d246ffc4f1',27),(1,'79f363fd8c1649bd8a6f21010e77e66f',1),(8,'79f363fd8c1649bd8a6f21010e77e66f',2),(12,'79f363fd8c1649bd8a6f21010e77e66f',3),(19,'79f363fd8c1649bd8a6f21010e77e66f',4),(23,'79f363fd8c1649bd8a6f21010e77e66f',5),(37,'79f363fd8c1649bd8a6f21010e77e66f',9),(45,'79f363fd8c1649bd8a6f21010e77e66f',12),(46,'79f363fd8c1649bd8a6f21010e77e66f',13),(51,'79f363fd8c1649bd8a6f21010e77e66f',14),(56,'79f363fd8c1649bd8a6f21010e77e66f',19),(61,'79f363fd8c1649bd8a6f21010e77e66f',20),(77,'79f363fd8c1649bd8a6f21010e77e66f',26),(84,'79f363fd8c1649bd8a6f21010e77e66f',27),(94,'79f363fd8c1649bd8a6f21010e77e66f',29),(100,'79f363fd8c1649bd8a6f21010e77e66f',37),(52,'860bc33bcaf34b4c893e6d915935648a',14),(57,'860bc33bcaf34b4c893e6d915935648a',19),(62,'860bc33bcaf34b4c893e6d915935648a',20),(21,'88641f582de34e12a9ba16531ab2b18f',5),(27,'88641f582de34e12a9ba16531ab2b18f',6),(30,'88641f582de34e12a9ba16531ab2b18f',7),(33,'88641f582de34e12a9ba16531ab2b18f',8),(96,'88641f582de34e12a9ba16531ab2b18f',36),(6,'9617d596e3ab40cfa7d8f81e8a0ec224',1),(55,'9f916c217f4c42f49cf8023bf7faf95e',14),(60,'9f916c217f4c42f49cf8023bf7faf95e',19),(65,'9f916c217f4c42f49cf8023bf7faf95e',20),(4,'a881e1b627e9421d8d165d510673e34b',1),(10,'a881e1b627e9421d8d165d510673e34b',3),(17,'a881e1b627e9421d8d165d510673e34b',4),(35,'a881e1b627e9421d8d165d510673e34b',9),(75,'a881e1b627e9421d8d165d510673e34b',26),(82,'a881e1b627e9421d8d165d510673e34b',27),(92,'a881e1b627e9421d8d165d510673e34b',29),(66,'b5dc54b6f3044ee3b24fe604f4cef4ce',23),(70,'b713285e8cee4b76ba16c747cc382365',24),(73,'b713285e8cee4b76ba16c747cc382365',25),(15,'c018b9833ca24bf49d7d4eef3e3869ae',3),(80,'c018b9833ca24bf49d7d4eef3e3869ae',26),(87,'c018b9833ca24bf49d7d4eef3e3869ae',27),(90,'c0501b3d11b04bf593425c2ba75a738d',28),(104,'c0501b3d11b04bf593425c2ba75a738d',38),(22,'d307beb4bb134bf2bf3da477440a238c',5),(2,'e45b5909eb9f42a18e96c87f06493e04',1);
/*!40000 ALTER TABLE `extras_status_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_tag`
--

DROP TABLE IF EXISTS `extras_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_tag` (
  `name` varchar(255) NOT NULL,
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `color` varchar(6) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_tag`
--

LOCK TABLES `extras_tag` WRITE;
/*!40000 ALTER TABLE `extras_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_tag_content_types`
--

DROP TABLE IF EXISTS `extras_tag_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_tag_content_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tag_id` char(32) NOT NULL,
  `contenttype_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_tag_content_types_tag_id_contenttype_id_726a20d6_uniq` (`tag_id`,`contenttype_id`),
  KEY `extras_tag_content_t_contenttype_id_5baa3bb5_fk_django_co` (`contenttype_id`),
  CONSTRAINT `extras_tag_content_t_contenttype_id_5baa3bb5_fk_django_co` FOREIGN KEY (`contenttype_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_tag_content_types_tag_id_34a8ca46_fk_extras_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `extras_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_tag_content_types`
--

LOCK TABLES `extras_tag_content_types` WRITE;
/*!40000 ALTER TABLE `extras_tag_content_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_tag_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_taggeditem`
--

DROP TABLE IF EXISTS `extras_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_taggeditem` (
  `id` char(32) NOT NULL,
  `object_id` char(32) NOT NULL,
  `content_type_id` int NOT NULL,
  `tag_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_taggeditem_content_type_id_object_id_tag_id_fb5205e9_uniq` (`content_type_id`,`object_id`,`tag_id`),
  KEY `extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id` (`tag_id`),
  KEY `extras_tagg_content_717743_idx` (`content_type_id`,`object_id`),
  KEY `extras_taggeditem_object_id_31b2aa77` (`object_id`),
  CONSTRAINT `extras_taggeditem_content_type_id_ba5562ed_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `extras_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_taggeditem`
--

LOCK TABLES `extras_taggeditem` WRITE;
/*!40000 ALTER TABLE `extras_taggeditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_team`
--

DROP TABLE IF EXISTS `extras_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_team` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address` longtext NOT NULL,
  `comments` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_team_name_phone_email_943ce106_uniq` (`name`,`phone`,`email`),
  KEY `extras_team_name_1e27beab` (`name`),
  KEY `extras_team_phone_f55ffc6f` (`phone`),
  KEY `extras_team_email_f8003440` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_team`
--

LOCK TABLES `extras_team` WRITE;
/*!40000 ALTER TABLE `extras_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_team_contacts`
--

DROP TABLE IF EXISTS `extras_team_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_team_contacts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `team_id` char(32) NOT NULL,
  `contact_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_team_contacts_team_id_contact_id_6e32675e_uniq` (`team_id`,`contact_id`),
  KEY `extras_team_contacts_contact_id_98c0e1d5_fk_extras_contact_id` (`contact_id`),
  CONSTRAINT `extras_team_contacts_contact_id_98c0e1d5_fk_extras_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `extras_contact` (`id`),
  CONSTRAINT `extras_team_contacts_team_id_4696917a_fk_extras_team_id` FOREIGN KEY (`team_id`) REFERENCES `extras_team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_team_contacts`
--

LOCK TABLES `extras_team_contacts` WRITE;
/*!40000 ALTER TABLE `extras_team_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_team_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_usersavedviewassociation`
--

DROP TABLE IF EXISTS `extras_usersavedviewassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_usersavedviewassociation` (
  `id` char(32) NOT NULL,
  `view_name` varchar(255) NOT NULL,
  `saved_view_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_usersavedviewassociation_user_id_view_name_720f0e3d_uniq` (`user_id`,`view_name`),
  KEY `extras_usersavedview_saved_view_id_0b7e08c0_fk_extras_sa` (`saved_view_id`),
  CONSTRAINT `extras_usersavedview_saved_view_id_0b7e08c0_fk_extras_sa` FOREIGN KEY (`saved_view_id`) REFERENCES `extras_savedview` (`id`),
  CONSTRAINT `extras_usersavedviewassociation_user_id_fdd15bc4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_usersavedviewassociation`
--

LOCK TABLES `extras_usersavedviewassociation` WRITE;
/*!40000 ALTER TABLE `extras_usersavedviewassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_usersavedviewassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_webhook`
--

DROP TABLE IF EXISTS `extras_webhook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_webhook` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type_create` tinyint(1) NOT NULL,
  `type_update` tinyint(1) NOT NULL,
  `type_delete` tinyint(1) NOT NULL,
  `payload_url` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `http_method` varchar(30) NOT NULL,
  `http_content_type` varchar(255) NOT NULL,
  `additional_headers` longtext NOT NULL,
  `body_template` longtext NOT NULL,
  `secret` varchar(255) NOT NULL,
  `ssl_verification` tinyint(1) NOT NULL,
  `ca_file_path` varchar(4096) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_webhook`
--

LOCK TABLES `extras_webhook` WRITE;
/*!40000 ALTER TABLE `extras_webhook` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_webhook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_webhook_content_types`
--

DROP TABLE IF EXISTS `extras_webhook_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_webhook_content_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `webhook_id` char(32) NOT NULL,
  `contenttype_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq` (`webhook_id`,`contenttype_id`),
  KEY `extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co` (`contenttype_id`),
  CONSTRAINT `extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co` FOREIGN KEY (`contenttype_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_webhook_conte_webhook_id_0c169800_fk_extras_we` FOREIGN KEY (`webhook_id`) REFERENCES `extras_webhook` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_webhook_content_types`
--

LOCK TABLES `extras_webhook_content_types` WRITE;
/*!40000 ALTER TABLE `extras_webhook_content_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_webhook_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_ipaddress`
--

DROP TABLE IF EXISTS `ipam_ipaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_ipaddress` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `host` varbinary(16) NOT NULL,
  `mask_length` int NOT NULL,
  `dns_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `nat_inside_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  `ip_version` int NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_ipaddress_parent_id_host_89330d7e_uniq` (`parent_id`,`host`),
  KEY `ipam_ipaddress_host_c1f8ad3e` (`host`),
  KEY `ipam_ipaddress_prefix_length_f80d3663` (`mask_length`),
  KEY `ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `ipam_ipaddress_status_id_942778b7` (`status_id`),
  KEY `ipam_ipaddress_nat_inside_id_a45fb7c5` (`nat_inside_id`),
  KEY `ipam_ipaddress_dns_name_d5c4f5d8` (`dns_name`),
  KEY `ipam_ipaddress_new_role_id_93bf5f61` (`role_id`),
  KEY `ipam_ipaddress_ip_version_ce3b626f` (`ip_version`),
  KEY `ipam_ipaddr_ip_vers_d82ba5_idx` (`ip_version`,`host`,`mask_length`),
  CONSTRAINT `ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id` FOREIGN KEY (`nat_inside_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `ipam_ipaddress_parent_id_085a7a43_fk_ipam_prefix_id` FOREIGN KEY (`parent_id`) REFERENCES `ipam_prefix` (`id`),
  CONSTRAINT `ipam_ipaddress_role_id_719761b6_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `ipam_ipaddress_status_id_942778b7_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_ipaddress`
--

LOCK TABLES `ipam_ipaddress` WRITE;
/*!40000 ALTER TABLE `ipam_ipaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_ipaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_ipaddressrange`
--

DROP TABLE IF EXISTS `ipam_ipaddressrange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_ipaddressrange` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_host` varbinary(16) NOT NULL,
  `end_host` varbinary(16) NOT NULL,
  `ip_version` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `count_as_utilized` tinyint(1) NOT NULL,
  `is_exclusive` tinyint(1) NOT NULL,
  `parent_id` char(32) NOT NULL,
  `role_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_iprange_parent_start` (`parent_id`,`start_host`),
  KEY `ipam_ipaddressrange_tenant_id_4bfe4e16_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `ipam_ipaddressrange_name_230d1b53` (`name`),
  KEY `ipam_ipaddressrange_start_host_2337a950` (`start_host`),
  KEY `ipam_ipaddressrange_end_host_6810d1b3` (`end_host`),
  KEY `ipam_ipaddressrange_ip_version_baf7a76d` (`ip_version`),
  KEY `ipam_ipaddressrange_role_id_453551db` (`role_id`),
  KEY `ipam_ipaddressrange_status_id_cba43d64` (`status_id`),
  KEY `ipam_ipaddr_parent__859c12_idx` (`parent_id`,`ip_version`,`start_host`,`end_host`),
  CONSTRAINT `ipam_ipaddressrange_parent_id_f5b3accd_fk_ipam_prefix_id` FOREIGN KEY (`parent_id`) REFERENCES `ipam_prefix` (`id`),
  CONSTRAINT `ipam_ipaddressrange_role_id_453551db_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `ipam_ipaddressrange_status_id_cba43d64_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `ipam_ipaddressrange_tenant_id_4bfe4e16_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_ipaddressrange`
--

LOCK TABLES `ipam_ipaddressrange` WRITE;
/*!40000 ALTER TABLE `ipam_ipaddressrange` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_ipaddressrange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_ipaddresstointerface`
--

DROP TABLE IF EXISTS `ipam_ipaddresstointerface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_ipaddresstointerface` (
  `id` char(32) NOT NULL,
  `is_source` tinyint(1) NOT NULL,
  `is_destination` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `is_preferred` tinyint(1) NOT NULL,
  `is_primary` tinyint(1) NOT NULL,
  `is_secondary` tinyint(1) NOT NULL,
  `is_standby` tinyint(1) NOT NULL,
  `interface_id` char(32) DEFAULT NULL,
  `ip_address_id` char(32) NOT NULL,
  `vm_interface_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_ipaddresstointerfac_ip_address_id_vm_interfa_be84a621_uniq` (`ip_address_id`,`vm_interface_id`),
  UNIQUE KEY `ipam_ipaddresstointerfac_ip_address_id_interface__b15a8b31_uniq` (`ip_address_id`,`interface_id`),
  KEY `ipam_ipaddresstointe_interface_id_035d6540_fk_dcim_inte` (`interface_id`),
  KEY `ipam_ipaddresstointe_vm_interface_id_9ffb75a8_fk_virtualiz` (`vm_interface_id`),
  CONSTRAINT `ipam_ipaddresstointe_interface_id_035d6540_fk_dcim_inte` FOREIGN KEY (`interface_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `ipam_ipaddresstointe_ip_address_id_7437efa0_fk_ipam_ipad` FOREIGN KEY (`ip_address_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `ipam_ipaddresstointe_vm_interface_id_9ffb75a8_fk_virtualiz` FOREIGN KEY (`vm_interface_id`) REFERENCES `virtualization_vminterface` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_ipaddresstointerface`
--

LOCK TABLES `ipam_ipaddresstointerface` WRITE;
/*!40000 ALTER TABLE `ipam_ipaddresstointerface` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_ipaddresstointerface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_namespace`
--

DROP TABLE IF EXISTS `ipam_namespace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_namespace` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `location_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ipam_namespace_location_id_0ee18237_fk_dcim_location_id` (`location_id`),
  KEY `ipam_namespace_tenant_id_7f42e7b1_fk_tenancy_tenant_id` (`tenant_id`),
  CONSTRAINT `ipam_namespace_location_id_0ee18237_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `ipam_namespace_tenant_id_7f42e7b1_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_namespace`
--

LOCK TABLES `ipam_namespace` WRITE;
/*!40000 ALTER TABLE `ipam_namespace` DISABLE KEYS */;
INSERT INTO `ipam_namespace` VALUES ('4d6574a1c1f241f5a31bd1a4ca44ca6c','2026-09-07 09:10:29.248494','2026-09-07 09:10:29.248525','{}','Global','Default Global namespace. Created by Nautobot.',NULL,NULL);
/*!40000 ALTER TABLE `ipam_namespace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_prefix`
--

DROP TABLE IF EXISTS `ipam_prefix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_prefix` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `network` varbinary(16) NOT NULL,
  `broadcast` varbinary(16) NOT NULL,
  `prefix_length` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `vlan_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `date_allocated` datetime(6) DEFAULT NULL,
  `rir_id` char(32) DEFAULT NULL,
  `ip_version` int NOT NULL,
  `namespace_id` char(32) NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_prefix_namespace_id_network_prefix_length_b2dd8b57_uniq` (`namespace_id`,`network`,`prefix_length`),
  KEY `ipam_prefix_network_f7bac882` (`network`),
  KEY `ipam_prefix_broadcast_8e623832` (`broadcast`),
  KEY `ipam_prefix_prefix_length_84660485` (`prefix_length`),
  KEY `ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id` (`vlan_id`),
  KEY `ipam_prefix_status_id_cffa56c0` (`status_id`),
  KEY `ipam_prefix_new_role_id_528afd96` (`role_id`),
  KEY `ipam_prefix_rir_id_a009797a_fk_ipam_rir_id` (`rir_id`),
  KEY `ipam_prefix_parent_id_93c2aef8_fk_ipam_prefix_id` (`parent_id`),
  KEY `ipam_prefix_network_e89faf_idx` (`network`,`broadcast`,`prefix_length`),
  KEY `ipam_prefix_namespa_ec3758_idx` (`namespace_id`,`network`,`broadcast`,`prefix_length`),
  KEY `ipam_prefix_ip_version_85fe83ba` (`ip_version`),
  KEY `ipam_prefix_namespa_34fd7d_idx` (`namespace_id`,`ip_version`,`network`,`prefix_length`),
  CONSTRAINT `ipam_prefix_namespace_id_aaf034e9_fk_ipam_namespace_id` FOREIGN KEY (`namespace_id`) REFERENCES `ipam_namespace` (`id`),
  CONSTRAINT `ipam_prefix_parent_id_93c2aef8_fk_ipam_prefix_id` FOREIGN KEY (`parent_id`) REFERENCES `ipam_prefix` (`id`),
  CONSTRAINT `ipam_prefix_rir_id_a009797a_fk_ipam_rir_id` FOREIGN KEY (`rir_id`) REFERENCES `ipam_rir` (`id`),
  CONSTRAINT `ipam_prefix_role_id_0a98d415_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `ipam_prefix_status_id_cffa56c0_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id` FOREIGN KEY (`vlan_id`) REFERENCES `ipam_vlan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_prefix`
--

LOCK TABLES `ipam_prefix` WRITE;
/*!40000 ALTER TABLE `ipam_prefix` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_prefix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_prefixlocationassignment`
--

DROP TABLE IF EXISTS `ipam_prefixlocationassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_prefixlocationassignment` (
  `id` char(32) NOT NULL,
  `location_id` char(32) NOT NULL,
  `prefix_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_prefixlocationassig_prefix_id_location_id_66100e12_uniq` (`prefix_id`,`location_id`),
  KEY `ipam_prefixlocationa_location_id_49531b36_fk_dcim_loca` (`location_id`),
  CONSTRAINT `ipam_prefixlocationa_location_id_49531b36_fk_dcim_loca` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `ipam_prefixlocationa_prefix_id_93a70640_fk_ipam_pref` FOREIGN KEY (`prefix_id`) REFERENCES `ipam_prefix` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_prefixlocationassignment`
--

LOCK TABLES `ipam_prefixlocationassignment` WRITE;
/*!40000 ALTER TABLE `ipam_prefixlocationassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_prefixlocationassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_rir`
--

DROP TABLE IF EXISTS `ipam_rir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_rir` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_rir`
--

LOCK TABLES `ipam_rir` WRITE;
/*!40000 ALTER TABLE `ipam_rir` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_rir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_routetarget`
--

DROP TABLE IF EXISTS `ipam_routetarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_routetarget` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(21) NOT NULL,
  `description` varchar(255) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id` (`tenant_id`),
  CONSTRAINT `ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_routetarget`
--

LOCK TABLES `ipam_routetarget` WRITE;
/*!40000 ALTER TABLE `ipam_routetarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_routetarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_service`
--

DROP TABLE IF EXISTS `ipam_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_service` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `protocol` varchar(50) NOT NULL,
  `ports` json NOT NULL,
  `description` varchar(255) NOT NULL,
  `device_id` char(32) DEFAULT NULL,
  `virtual_machine_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_device_service_name` (`name`,`device_id`),
  UNIQUE KEY `unique_virtual_machine_service_name` (`name`,`virtual_machine_id`),
  KEY `ipam_service_device_id_b4d2bb9c_fk_dcim_device_id` (`device_id`),
  KEY `ipam_service_virtual_machine_id_e8b53562_fk_virtualiz` (`virtual_machine_id`),
  KEY `ipam_service_name_7e839153` (`name`),
  CONSTRAINT `ipam_service_device_id_b4d2bb9c_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `ipam_service_virtual_machine_id_e8b53562_fk_virtualiz` FOREIGN KEY (`virtual_machine_id`) REFERENCES `virtualization_virtualmachine` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_service`
--

LOCK TABLES `ipam_service` WRITE;
/*!40000 ALTER TABLE `ipam_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_service_ip_addresses`
--

DROP TABLE IF EXISTS `ipam_service_ip_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_service_ip_addresses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `service_id` char(32) NOT NULL,
  `ipaddress_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq` (`service_id`,`ipaddress_id`),
  KEY `ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad` (`ipaddress_id`),
  CONSTRAINT `ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad` FOREIGN KEY (`ipaddress_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id` FOREIGN KEY (`service_id`) REFERENCES `ipam_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_service_ip_addresses`
--

LOCK TABLES `ipam_service_ip_addresses` WRITE;
/*!40000 ALTER TABLE `ipam_service_ip_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_service_ip_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_vlan`
--

DROP TABLE IF EXISTS `ipam_vlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_vlan` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `vid` smallint unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `vlan_group_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_vlan_group_id_name_e53919df_uniq` (`vlan_group_id`,`name`),
  UNIQUE KEY `ipam_vlan_group_id_vid_5ca4cc47_uniq` (`vlan_group_id`,`vid`),
  KEY `ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `ipam_vlan_status_id_898aa317` (`status_id`),
  KEY `ipam_vlan_name_a7671201` (`name`),
  KEY `ipam_vlan_new_role_id_980649ea` (`role_id`),
  CONSTRAINT `ipam_vlan_role_id_f5015962_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `ipam_vlan_status_id_898aa317_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `ipam_vlan_vlan_group_id_a59c4d3f_fk_ipam_vlangroup_id` FOREIGN KEY (`vlan_group_id`) REFERENCES `ipam_vlangroup` (`id`),
  CONSTRAINT `ipam_vlan_chk_1` CHECK ((`vid` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_vlan`
--

LOCK TABLES `ipam_vlan` WRITE;
/*!40000 ALTER TABLE `ipam_vlan` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_vlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_vlangroup`
--

DROP TABLE IF EXISTS `ipam_vlangroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_vlangroup` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `location_id` char(32) DEFAULT NULL,
  `range` longtext NOT NULL DEFAULT (_utf8mb4'1-4094'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_vlangroup_name_46bf02a4_uniq` (`name`),
  KEY `ipam_vlangroup_location_id_f239af79` (`location_id`),
  CONSTRAINT `ipam_vlangroup_location_id_f239af79_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_vlangroup`
--

LOCK TABLES `ipam_vlangroup` WRITE;
/*!40000 ALTER TABLE `ipam_vlangroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_vlangroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_vlanlocationassignment`
--

DROP TABLE IF EXISTS `ipam_vlanlocationassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_vlanlocationassignment` (
  `id` char(32) NOT NULL,
  `location_id` char(32) NOT NULL,
  `vlan_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_vlanlocationassignment_vlan_id_location_id_847361ab_uniq` (`vlan_id`,`location_id`),
  KEY `ipam_vlanlocationass_location_id_452fe170_fk_dcim_loca` (`location_id`),
  CONSTRAINT `ipam_vlanlocationass_location_id_452fe170_fk_dcim_loca` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `ipam_vlanlocationassignment_vlan_id_9591c78f_fk_ipam_vlan_id` FOREIGN KEY (`vlan_id`) REFERENCES `ipam_vlan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_vlanlocationassignment`
--

LOCK TABLES `ipam_vlanlocationassignment` WRITE;
/*!40000 ALTER TABLE `ipam_vlanlocationassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_vlanlocationassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_vrf`
--

DROP TABLE IF EXISTS `ipam_vrf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_vrf` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `rd` varchar(21) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `namespace_id` char(32) NOT NULL,
  `status_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_vrf_namespace_id_rd_ddfc14fc_uniq` (`namespace_id`,`rd`),
  KEY `ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `ipam_vrf_name_bf7146b0` (`name`),
  KEY `ipam_vrf_status_id_d8f28917` (`status_id`),
  KEY `ipam_vrf_namespa_3a222d_idx` (`namespace_id`,`name`,`rd`),
  CONSTRAINT `ipam_vrf_namespace_id_8835a4df_fk_ipam_namespace_id` FOREIGN KEY (`namespace_id`) REFERENCES `ipam_namespace` (`id`),
  CONSTRAINT `ipam_vrf_status_id_d8f28917_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_vrf`
--

LOCK TABLES `ipam_vrf` WRITE;
/*!40000 ALTER TABLE `ipam_vrf` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_vrf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_vrf_export_targets`
--

DROP TABLE IF EXISTS `ipam_vrf_export_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_vrf_export_targets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vrf_id` char(32) NOT NULL,
  `routetarget_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq` (`vrf_id`,`routetarget_id`),
  KEY `ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout` (`routetarget_id`),
  CONSTRAINT `ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout` FOREIGN KEY (`routetarget_id`) REFERENCES `ipam_routetarget` (`id`),
  CONSTRAINT `ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id` FOREIGN KEY (`vrf_id`) REFERENCES `ipam_vrf` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_vrf_export_targets`
--

LOCK TABLES `ipam_vrf_export_targets` WRITE;
/*!40000 ALTER TABLE `ipam_vrf_export_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_vrf_export_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_vrf_import_targets`
--

DROP TABLE IF EXISTS `ipam_vrf_import_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_vrf_import_targets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vrf_id` char(32) NOT NULL,
  `routetarget_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq` (`vrf_id`,`routetarget_id`),
  KEY `ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout` (`routetarget_id`),
  CONSTRAINT `ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout` FOREIGN KEY (`routetarget_id`) REFERENCES `ipam_routetarget` (`id`),
  CONSTRAINT `ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id` FOREIGN KEY (`vrf_id`) REFERENCES `ipam_vrf` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_vrf_import_targets`
--

LOCK TABLES `ipam_vrf_import_targets` WRITE;
/*!40000 ALTER TABLE `ipam_vrf_import_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_vrf_import_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_vrfdeviceassignment`
--

DROP TABLE IF EXISTS `ipam_vrfdeviceassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_vrfdeviceassignment` (
  `id` char(32) NOT NULL,
  `rd` varchar(21) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `device_id` char(32) DEFAULT NULL,
  `virtual_machine_id` char(32) DEFAULT NULL,
  `vrf_id` char(32) NOT NULL,
  `virtual_device_context_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_vrfdeviceassignment_vrf_id_device_id_6c9f7b7d_uniq` (`vrf_id`,`device_id`),
  UNIQUE KEY `ipam_vrfdeviceassignment_vrf_id_virtual_machine_id_0799c2cc_uniq` (`vrf_id`,`virtual_machine_id`),
  UNIQUE KEY `ipam_vrfdeviceassignment_vrf_id_virtual_device_co_788fcb46_uniq` (`vrf_id`,`virtual_device_context_id`),
  KEY `ipam_vrfdeviceassignment_device_id_b79a12ce_fk_dcim_device_id` (`device_id`),
  KEY `ipam_vrfdeviceassign_virtual_machine_id_2b9c3e80_fk_virtualiz` (`virtual_machine_id`),
  KEY `ipam_vrfdeviceassign_virtual_device_conte_8d0d4e0b_fk_dcim_virt` (`virtual_device_context_id`),
  CONSTRAINT `ipam_vrfdeviceassign_virtual_device_conte_8d0d4e0b_fk_dcim_virt` FOREIGN KEY (`virtual_device_context_id`) REFERENCES `dcim_virtualdevicecontext` (`id`),
  CONSTRAINT `ipam_vrfdeviceassign_virtual_machine_id_2b9c3e80_fk_virtualiz` FOREIGN KEY (`virtual_machine_id`) REFERENCES `virtualization_virtualmachine` (`id`),
  CONSTRAINT `ipam_vrfdeviceassignment_device_id_b79a12ce_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `ipam_vrfdeviceassignment_vrf_id_de560201_fk_ipam_vrf_id` FOREIGN KEY (`vrf_id`) REFERENCES `ipam_vrf` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_vrfdeviceassignment`
--

LOCK TABLES `ipam_vrfdeviceassignment` WRITE;
/*!40000 ALTER TABLE `ipam_vrfdeviceassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_vrfdeviceassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_vrfprefixassignment`
--

DROP TABLE IF EXISTS `ipam_vrfprefixassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_vrfprefixassignment` (
  `id` char(32) NOT NULL,
  `prefix_id` char(32) NOT NULL,
  `vrf_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_vrfprefixassignment_vrf_id_prefix_id_8123b1c4_uniq` (`vrf_id`,`prefix_id`),
  KEY `ipam_vrfprefixassignment_prefix_id_808d8301_fk_ipam_prefix_id` (`prefix_id`),
  CONSTRAINT `ipam_vrfprefixassignment_prefix_id_808d8301_fk_ipam_prefix_id` FOREIGN KEY (`prefix_id`) REFERENCES `ipam_prefix` (`id`),
  CONSTRAINT `ipam_vrfprefixassignment_vrf_id_d9496635_fk_ipam_vrf_id` FOREIGN KEY (`vrf_id`) REFERENCES `ipam_vrf` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_vrfprefixassignment`
--

LOCK TABLES `ipam_vrfprefixassignment` WRITE;
/*!40000 ALTER TABLE `ipam_vrfprefixassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_vrfprefixassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `load_balancers_certificateprofile`
--

DROP TABLE IF EXISTS `load_balancers_certificateprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `load_balancers_certificateprofile` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `certificate_type` varchar(255) NOT NULL,
  `certificate_file_path` varchar(255) NOT NULL,
  `chain_file_path` varchar(255) NOT NULL,
  `key_file_path` varchar(255) NOT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  `cipher` varchar(255) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `load_balancers_certi_tenant_id_335ccfca_fk_tenancy_t` (`tenant_id`),
  CONSTRAINT `load_balancers_certi_tenant_id_335ccfca_fk_tenancy_t` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `load_balancers_certificateprofile`
--

LOCK TABLES `load_balancers_certificateprofile` WRITE;
/*!40000 ALTER TABLE `load_balancers_certificateprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `load_balancers_certificateprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `load_balancers_healthcheckmonitor`
--

DROP TABLE IF EXISTS `load_balancers_healthcheckmonitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `load_balancers_healthcheckmonitor` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `interval` int unsigned DEFAULT NULL,
  `retry` int unsigned DEFAULT NULL,
  `timeout` int unsigned DEFAULT NULL,
  `port` int unsigned DEFAULT NULL,
  `health_check_type` varchar(255) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `load_balancers_healt_tenant_id_8c216871_fk_tenancy_t` (`tenant_id`),
  CONSTRAINT `load_balancers_healt_tenant_id_8c216871_fk_tenancy_t` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `load_balancers_healthcheckmonitor_chk_1` CHECK ((`interval` >= 0)),
  CONSTRAINT `load_balancers_healthcheckmonitor_chk_2` CHECK ((`retry` >= 0)),
  CONSTRAINT `load_balancers_healthcheckmonitor_chk_3` CHECK ((`timeout` >= 0)),
  CONSTRAINT `load_balancers_healthcheckmonitor_chk_4` CHECK ((`port` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `load_balancers_healthcheckmonitor`
--

LOCK TABLES `load_balancers_healthcheckmonitor` WRITE;
/*!40000 ALTER TABLE `load_balancers_healthcheckmonitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `load_balancers_healthcheckmonitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `load_balancers_loadbalancerpool`
--

DROP TABLE IF EXISTS `load_balancers_loadbalancerpool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `load_balancers_loadbalancerpool` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `load_balancing_algorithm` varchar(255) NOT NULL,
  `health_check_monitor_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `load_balancers_loadb_health_check_monitor_2b05fb98_fk_load_bala` (`health_check_monitor_id`),
  KEY `load_balancers_loadb_tenant_id_96eafb33_fk_tenancy_t` (`tenant_id`),
  CONSTRAINT `load_balancers_loadb_health_check_monitor_2b05fb98_fk_load_bala` FOREIGN KEY (`health_check_monitor_id`) REFERENCES `load_balancers_healthcheckmonitor` (`id`),
  CONSTRAINT `load_balancers_loadb_tenant_id_96eafb33_fk_tenancy_t` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `load_balancers_loadbalancerpool`
--

LOCK TABLES `load_balancers_loadbalancerpool` WRITE;
/*!40000 ALTER TABLE `load_balancers_loadbalancerpool` DISABLE KEYS */;
/*!40000 ALTER TABLE `load_balancers_loadbalancerpool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `load_balancers_loadbalancerpoolmember`
--

DROP TABLE IF EXISTS `load_balancers_loadbalancerpoolmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `load_balancers_loadbalancerpoolmember` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `label` varchar(255) NOT NULL,
  `port` int unsigned NOT NULL,
  `ssl_offload` tinyint(1) NOT NULL,
  `health_check_monitor_id` char(32) DEFAULT NULL,
  `ip_address_id` char(32) NOT NULL,
  `load_balancer_pool_id` char(32) NOT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `load_balancers_loadbalan_ip_address_id_port_load__d0a951a0_uniq` (`ip_address_id`,`port`,`load_balancer_pool_id`),
  KEY `load_balancers_loadb_health_check_monitor_54bb32d4_fk_load_bala` (`health_check_monitor_id`),
  KEY `load_balancers_loadb_load_balancer_pool_i_c7debc4f_fk_load_bala` (`load_balancer_pool_id`),
  KEY `load_balancers_loadb_tenant_id_96310c18_fk_tenancy_t` (`tenant_id`),
  KEY `load_balancers_loadbalancerpoolmember_status_id_ed8abf82` (`status_id`),
  CONSTRAINT `load_balancers_loadb_health_check_monitor_54bb32d4_fk_load_bala` FOREIGN KEY (`health_check_monitor_id`) REFERENCES `load_balancers_healthcheckmonitor` (`id`),
  CONSTRAINT `load_balancers_loadb_ip_address_id_22e710ab_fk_ipam_ipad` FOREIGN KEY (`ip_address_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `load_balancers_loadb_load_balancer_pool_i_c7debc4f_fk_load_bala` FOREIGN KEY (`load_balancer_pool_id`) REFERENCES `load_balancers_loadbalancerpool` (`id`),
  CONSTRAINT `load_balancers_loadb_status_id_ed8abf82_fk_extras_st` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `load_balancers_loadb_tenant_id_96310c18_fk_tenancy_t` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `load_balancers_loadbalancerpoolmember_chk_1` CHECK ((`port` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `load_balancers_loadbalancerpoolmember`
--

LOCK TABLES `load_balancers_loadbalancerpoolmember` WRITE;
/*!40000 ALTER TABLE `load_balancers_loadbalancerpoolmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `load_balancers_loadbalancerpoolmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `load_balancers_loadbalancerpoolmembercertificateprofileassig0862`
--

DROP TABLE IF EXISTS `load_balancers_loadbalancerpoolmembercertificateprofileassig0862`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `load_balancers_loadbalancerpoolmembercertificateprofileassig0862` (
  `id` char(32) NOT NULL,
  `certificate_profile_id` char(32) NOT NULL,
  `load_balancer_pool_member_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `load_balancers_loadbalan_load_balancer_pool_membe_d364e060_uniq` (`load_balancer_pool_member_id`,`certificate_profile_id`),
  KEY `load_balancers_loadb_certificate_profile__e27eb08b_fk_load_bala` (`certificate_profile_id`),
  CONSTRAINT `load_balancers_loadb_certificate_profile__e27eb08b_fk_load_bala` FOREIGN KEY (`certificate_profile_id`) REFERENCES `load_balancers_certificateprofile` (`id`),
  CONSTRAINT `load_balancers_loadb_load_balancer_pool_m_96df0575_fk_load_bala` FOREIGN KEY (`load_balancer_pool_member_id`) REFERENCES `load_balancers_loadbalancerpoolmember` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `load_balancers_loadbalancerpoolmembercertificateprofileassig0862`
--

LOCK TABLES `load_balancers_loadbalancerpoolmembercertificateprofileassig0862` WRITE;
/*!40000 ALTER TABLE `load_balancers_loadbalancerpoolmembercertificateprofileassig0862` DISABLE KEYS */;
/*!40000 ALTER TABLE `load_balancers_loadbalancerpoolmembercertificateprofileassig0862` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `load_balancers_virtualserver`
--

DROP TABLE IF EXISTS `load_balancers_virtualserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `load_balancers_virtualserver` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `port` int unsigned DEFAULT NULL,
  `protocol` varchar(255) NOT NULL,
  `source_nat_type` varchar(255) NOT NULL,
  `load_balancer_type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `ssl_offload` tinyint(1) NOT NULL,
  `cloud_service_id` char(32) DEFAULT NULL,
  `device_id` char(32) DEFAULT NULL,
  `device_redundancy_group_id` char(32) DEFAULT NULL,
  `health_check_monitor_id` char(32) DEFAULT NULL,
  `load_balancer_pool_id` char(32) DEFAULT NULL,
  `source_nat_pool_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `vip_id` char(32) NOT NULL,
  `virtual_chassis_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `load_balancers_virtualserver_vip_id_port_protocol_26aef8c7_uniq` (`vip_id`,`port`,`protocol`),
  KEY `load_balancers_virtu_cloud_service_id_55f55b13_fk_cloud_clo` (`cloud_service_id`),
  KEY `load_balancers_virtu_device_id_ed6bd403_fk_dcim_devi` (`device_id`),
  KEY `load_balancers_virtu_device_redundancy_gr_dacbdcdb_fk_dcim_devi` (`device_redundancy_group_id`),
  KEY `load_balancers_virtu_health_check_monitor_df8d80e4_fk_load_bala` (`health_check_monitor_id`),
  KEY `load_balancers_virtu_load_balancer_pool_i_1991938e_fk_load_bala` (`load_balancer_pool_id`),
  KEY `load_balancers_virtu_source_nat_pool_id_d076d96c_fk_ipam_pref` (`source_nat_pool_id`),
  KEY `load_balancers_virtu_tenant_id_49a13904_fk_tenancy_t` (`tenant_id`),
  KEY `load_balancers_virtu_virtual_chassis_id_71f0a8e0_fk_dcim_virt` (`virtual_chassis_id`),
  CONSTRAINT `load_balancers_virtu_cloud_service_id_55f55b13_fk_cloud_clo` FOREIGN KEY (`cloud_service_id`) REFERENCES `cloud_cloudservice` (`id`),
  CONSTRAINT `load_balancers_virtu_device_id_ed6bd403_fk_dcim_devi` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `load_balancers_virtu_device_redundancy_gr_dacbdcdb_fk_dcim_devi` FOREIGN KEY (`device_redundancy_group_id`) REFERENCES `dcim_deviceredundancygroup` (`id`),
  CONSTRAINT `load_balancers_virtu_health_check_monitor_df8d80e4_fk_load_bala` FOREIGN KEY (`health_check_monitor_id`) REFERENCES `load_balancers_healthcheckmonitor` (`id`),
  CONSTRAINT `load_balancers_virtu_load_balancer_pool_i_1991938e_fk_load_bala` FOREIGN KEY (`load_balancer_pool_id`) REFERENCES `load_balancers_loadbalancerpool` (`id`),
  CONSTRAINT `load_balancers_virtu_source_nat_pool_id_d076d96c_fk_ipam_pref` FOREIGN KEY (`source_nat_pool_id`) REFERENCES `ipam_prefix` (`id`),
  CONSTRAINT `load_balancers_virtu_tenant_id_49a13904_fk_tenancy_t` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `load_balancers_virtu_vip_id_44d6cf83_fk_ipam_ipad` FOREIGN KEY (`vip_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `load_balancers_virtu_virtual_chassis_id_71f0a8e0_fk_dcim_virt` FOREIGN KEY (`virtual_chassis_id`) REFERENCES `dcim_virtualchassis` (`id`),
  CONSTRAINT `load_balancers_virtualserver_chk_1` CHECK ((`port` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `load_balancers_virtualserver`
--

LOCK TABLES `load_balancers_virtualserver` WRITE;
/*!40000 ALTER TABLE `load_balancers_virtualserver` DISABLE KEYS */;
/*!40000 ALTER TABLE `load_balancers_virtualserver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `load_balancers_virtualservercertificateprofileassignment`
--

DROP TABLE IF EXISTS `load_balancers_virtualservercertificateprofileassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `load_balancers_virtualservercertificateprofileassignment` (
  `id` char(32) NOT NULL,
  `certificate_profile_id` char(32) NOT NULL,
  `virtual_server_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `load_balancers_virtualse_virtual_server_id_certif_46f4c3f7_uniq` (`virtual_server_id`,`certificate_profile_id`),
  KEY `load_balancers_virtu_certificate_profile__ce33b9bb_fk_load_bala` (`certificate_profile_id`),
  CONSTRAINT `load_balancers_virtu_certificate_profile__ce33b9bb_fk_load_bala` FOREIGN KEY (`certificate_profile_id`) REFERENCES `load_balancers_certificateprofile` (`id`),
  CONSTRAINT `load_balancers_virtu_virtual_server_id_8c14d276_fk_load_bala` FOREIGN KEY (`virtual_server_id`) REFERENCES `load_balancers_virtualserver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `load_balancers_virtualservercertificateprofileassignment`
--

LOCK TABLES `load_balancers_virtualservercertificateprofileassignment` WRITE;
/*!40000 ALTER TABLE `load_balancers_virtualservercertificateprofileassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `load_balancers_virtualservercertificateprofileassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `silk_profile`
--

DROP TABLE IF EXISTS `silk_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `silk_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `time_taken` double DEFAULT NULL,
  `file_path` varchar(300) NOT NULL,
  `line_num` int DEFAULT NULL,
  `end_line_num` int DEFAULT NULL,
  `func_name` varchar(300) NOT NULL,
  `exception_raised` tinyint(1) NOT NULL,
  `dynamic` tinyint(1) NOT NULL,
  `request_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `silk_profile_request_id_7b81bd69_fk_silk_request_id` (`request_id`),
  CONSTRAINT `silk_profile_request_id_7b81bd69_fk_silk_request_id` FOREIGN KEY (`request_id`) REFERENCES `silk_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `silk_profile`
--

LOCK TABLES `silk_profile` WRITE;
/*!40000 ALTER TABLE `silk_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `silk_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `silk_profile_queries`
--

DROP TABLE IF EXISTS `silk_profile_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `silk_profile_queries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL,
  `sqlquery_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `silk_profile_queries_profile_id_sqlquery_id_b2403d9b_uniq` (`profile_id`,`sqlquery_id`),
  KEY `silk_profile_queries_sqlquery_id_155df455_fk_silk_sqlquery_id` (`sqlquery_id`),
  CONSTRAINT `silk_profile_queries_profile_id_a3d76db8_fk_silk_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `silk_profile` (`id`),
  CONSTRAINT `silk_profile_queries_sqlquery_id_155df455_fk_silk_sqlquery_id` FOREIGN KEY (`sqlquery_id`) REFERENCES `silk_sqlquery` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `silk_profile_queries`
--

LOCK TABLES `silk_profile_queries` WRITE;
/*!40000 ALTER TABLE `silk_profile_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `silk_profile_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `silk_request`
--

DROP TABLE IF EXISTS `silk_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `silk_request` (
  `id` varchar(36) NOT NULL,
  `path` varchar(190) NOT NULL,
  `query_params` longtext NOT NULL,
  `raw_body` longtext NOT NULL,
  `body` longtext NOT NULL,
  `method` varchar(10) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `view_name` varchar(190) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `time_taken` double DEFAULT NULL,
  `encoded_headers` longtext NOT NULL,
  `meta_time` double DEFAULT NULL,
  `meta_num_queries` int DEFAULT NULL,
  `meta_time_spent_queries` double DEFAULT NULL,
  `pyprofile` longtext NOT NULL,
  `num_sql_queries` int NOT NULL,
  `prof_file` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `silk_request_path_9f3d798e` (`path`),
  KEY `silk_request_start_time_1300bc58` (`start_time`),
  KEY `silk_request_view_name_68559f7b` (`view_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `silk_request`
--

LOCK TABLES `silk_request` WRITE;
/*!40000 ALTER TABLE `silk_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `silk_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `silk_response`
--

DROP TABLE IF EXISTS `silk_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `silk_response` (
  `id` varchar(36) NOT NULL,
  `status_code` int NOT NULL,
  `raw_body` longtext NOT NULL,
  `body` longtext NOT NULL,
  `encoded_headers` longtext NOT NULL,
  `request_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `request_id` (`request_id`),
  CONSTRAINT `silk_response_request_id_1e8e2776_fk_silk_request_id` FOREIGN KEY (`request_id`) REFERENCES `silk_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `silk_response`
--

LOCK TABLES `silk_response` WRITE;
/*!40000 ALTER TABLE `silk_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `silk_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `silk_sqlquery`
--

DROP TABLE IF EXISTS `silk_sqlquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `silk_sqlquery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `query` longtext NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `time_taken` double DEFAULT NULL,
  `traceback` longtext NOT NULL,
  `request_id` varchar(36) DEFAULT NULL,
  `identifier` int NOT NULL,
  `analysis` longtext,
  PRIMARY KEY (`id`),
  KEY `silk_sqlquery_request_id_6f8f0527_fk_silk_request_id` (`request_id`),
  CONSTRAINT `silk_sqlquery_request_id_6f8f0527_fk_silk_request_id` FOREIGN KEY (`request_id`) REFERENCES `silk_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `silk_sqlquery`
--

LOCK TABLES `silk_sqlquery` WRITE;
/*!40000 ALTER TABLE `silk_sqlquery` DISABLE KEYS */;
/*!40000 ALTER TABLE `silk_sqlquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_association` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int NOT NULL,
  `lifetime` int NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_code` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_nonce` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_partial` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `data` json NOT NULL DEFAULT (_utf8mb4'{}'),
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`),
  CONSTRAINT `social_auth_partial_chk_1` CHECK ((`next_step` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `user_id` char(32) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `extra_data` json NOT NULL DEFAULT (_utf8mb4'{}'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_social_auth_uid_required` CHECK ((`uid` <> _utf8mb4''))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_tag`
--

DROP TABLE IF EXISTS `taggit_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggit_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_taggeditem`
--

DROP TABLE IF EXISTS `taggit_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggit_taggeditem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int NOT NULL,
  `content_type_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq` (`content_type_id`,`object_id`,`tag_id`),
  KEY `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id`),
  KEY `taggit_taggeditem_object_id_e2d7d1df` (`object_id`),
  KEY `taggit_tagg_content_8fc721_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggit_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenancy_tenant`
--

DROP TABLE IF EXISTS `tenancy_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenancy_tenant` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `comments` longtext NOT NULL,
  `tenant_group_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `tenancy_tenant_tenant_group_id_bb4557b9_fk_tenancy_t` (`tenant_group_id`),
  CONSTRAINT `tenancy_tenant_tenant_group_id_bb4557b9_fk_tenancy_t` FOREIGN KEY (`tenant_group_id`) REFERENCES `tenancy_tenantgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenancy_tenant`
--

LOCK TABLES `tenancy_tenant` WRITE;
/*!40000 ALTER TABLE `tenancy_tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenancy_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenancy_tenantgroup`
--

DROP TABLE IF EXISTS `tenancy_tenantgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenancy_tenantgroup` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_tenantgroup_id` (`parent_id`),
  CONSTRAINT `tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_tenantgroup_id` FOREIGN KEY (`parent_id`) REFERENCES `tenancy_tenantgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenancy_tenantgroup`
--

LOCK TABLES `tenancy_tenantgroup` WRITE;
/*!40000 ALTER TABLE `tenancy_tenantgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenancy_tenantgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_objectpermission`
--

DROP TABLE IF EXISTS `users_objectpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_objectpermission` (
  `id` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `actions` json NOT NULL,
  `constraints` json DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_objectpermission_name_8d7a5900_uniq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_objectpermission`
--

LOCK TABLES `users_objectpermission` WRITE;
/*!40000 ALTER TABLE `users_objectpermission` DISABLE KEYS */;
INSERT INTO `users_objectpermission` VALUES ('411e9e0be499429688fa4027f38de49f','nautobot-default-scheduledjobs-operator-permissions','Nautobot added permission aligned to the Workflow Operator persona.',1,'[\"view\"]',NULL,'2026-09-07 09:14:36.281883','2026-09-07 09:14:36.360110'),('4b618fe5a48e4c2bbfeec78ee701426f','nautobot-default-scheduledjobs-approver-permissions','Nautobot added permission aligned to the Workflow Approver persona.',1,'[\"view\", \"change\"]',NULL,'2026-09-07 09:14:36.281883','2026-09-07 09:14:36.360110'),('c79c2b25a11c4ad78417ee43268baf04','nautobot-default-scheduledjobs-architect-permissions','Nautobot added permission aligned to the Workflow Architect persona.',1,'[\"view\", \"add\", \"change\", \"delete\"]',NULL,'2026-09-07 09:14:36.281883','2026-09-07 09:14:36.360110');
/*!40000 ALTER TABLE `users_objectpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_objectpermission_groups`
--

DROP TABLE IF EXISTS `users_objectpermission_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_objectpermission_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `objectpermission_id` char(32) NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq` (`objectpermission_id`,`group_id`),
  KEY `users_objectpermission_groups_group_id_fb7ba6e0_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj` FOREIGN KEY (`objectpermission_id`) REFERENCES `users_objectpermission` (`id`),
  CONSTRAINT `users_objectpermission_groups_group_id_fb7ba6e0_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_objectpermission_groups`
--

LOCK TABLES `users_objectpermission_groups` WRITE;
/*!40000 ALTER TABLE `users_objectpermission_groups` DISABLE KEYS */;
INSERT INTO `users_objectpermission_groups` VALUES (3,'411e9e0be499429688fa4027f38de49f',1),(4,'411e9e0be499429688fa4027f38de49f',2),(5,'411e9e0be499429688fa4027f38de49f',3),(2,'4b618fe5a48e4c2bbfeec78ee701426f',1),(1,'c79c2b25a11c4ad78417ee43268baf04',3);
/*!40000 ALTER TABLE `users_objectpermission_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_objectpermission_object_types`
--

DROP TABLE IF EXISTS `users_objectpermission_object_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_objectpermission_object_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `objectpermission_id` char(32) NOT NULL,
  `contenttype_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq` (`objectpermission_id`,`contenttype_id`),
  KEY `users_objectpermissi_contenttype_id_594b1cc7_fk_django_co` (`contenttype_id`),
  CONSTRAINT `users_objectpermissi_contenttype_id_594b1cc7_fk_django_co` FOREIGN KEY (`contenttype_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj` FOREIGN KEY (`objectpermission_id`) REFERENCES `users_objectpermission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_objectpermission_object_types`
--

LOCK TABLES `users_objectpermission_object_types` WRITE;
/*!40000 ALTER TABLE `users_objectpermission_object_types` DISABLE KEYS */;
INSERT INTO `users_objectpermission_object_types` VALUES (5,'411e9e0be499429688fa4027f38de49f',30),(6,'411e9e0be499429688fa4027f38de49f',31),(4,'411e9e0be499429688fa4027f38de49f',32),(3,'4b618fe5a48e4c2bbfeec78ee701426f',31),(1,'c79c2b25a11c4ad78417ee43268baf04',33),(2,'c79c2b25a11c4ad78417ee43268baf04',34);
/*!40000 ALTER TABLE `users_objectpermission_object_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_objectpermission_users`
--

DROP TABLE IF EXISTS `users_objectpermission_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_objectpermission_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `objectpermission_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_objectpermission_u_objectpermission_id_user_3a7db108_uniq` (`objectpermission_id`,`user_id`),
  KEY `users_objectpermission_users_user_id_16c0905d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj` FOREIGN KEY (`objectpermission_id`) REFERENCES `users_objectpermission` (`id`),
  CONSTRAINT `users_objectpermission_users_user_id_16c0905d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_objectpermission_users`
--

LOCK TABLES `users_objectpermission_users` WRITE;
/*!40000 ALTER TABLE `users_objectpermission_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_objectpermission_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_token`
--

DROP TABLE IF EXISTS `users_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_token` (
  `id` char(32) NOT NULL,
  `created` datetime(6) NOT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `key` varchar(40) NOT NULL,
  `write_enabled` tinyint(1) NOT NULL,
  `description` varchar(255) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `users_token_user_id_af964690_fk_auth_user_id` (`user_id`),
  CONSTRAINT `users_token_user_id_af964690_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_token`
--

LOCK TABLES `users_token` WRITE;
/*!40000 ALTER TABLE `users_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualization_cluster`
--

DROP TABLE IF EXISTS `virtualization_cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virtualization_cluster` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `comments` longtext NOT NULL,
  `cluster_group_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `cluster_type_id` char(32) NOT NULL,
  `location_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `virtualization_cluster_location_id_fdcab7e6_fk_dcim_location_id` (`location_id`),
  KEY `virtualization_clust_cluster_group_id_fec59c40_fk_virtualiz` (`cluster_group_id`),
  KEY `virtualization_clust_cluster_type_id_d4889bbe_fk_virtualiz` (`cluster_type_id`),
  CONSTRAINT `virtualization_clust_cluster_group_id_fec59c40_fk_virtualiz` FOREIGN KEY (`cluster_group_id`) REFERENCES `virtualization_clustergroup` (`id`),
  CONSTRAINT `virtualization_clust_cluster_type_id_d4889bbe_fk_virtualiz` FOREIGN KEY (`cluster_type_id`) REFERENCES `virtualization_clustertype` (`id`),
  CONSTRAINT `virtualization_cluster_location_id_fdcab7e6_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualization_cluster`
--

LOCK TABLES `virtualization_cluster` WRITE;
/*!40000 ALTER TABLE `virtualization_cluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualization_cluster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualization_clustergroup`
--

DROP TABLE IF EXISTS `virtualization_clustergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virtualization_clustergroup` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualization_clustergroup`
--

LOCK TABLES `virtualization_clustergroup` WRITE;
/*!40000 ALTER TABLE `virtualization_clustergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualization_clustergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualization_clustertype`
--

DROP TABLE IF EXISTS `virtualization_clustertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virtualization_clustertype` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualization_clustertype`
--

LOCK TABLES `virtualization_clustertype` WRITE;
/*!40000 ALTER TABLE `virtualization_clustertype` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualization_clustertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualization_virtualmachine`
--

DROP TABLE IF EXISTS `virtualization_virtualmachine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virtualization_virtualmachine` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `local_config_context_data` json DEFAULT NULL,
  `local_config_context_data_owner_object_id` char(32) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `vcpus` smallint unsigned DEFAULT NULL,
  `memory` int unsigned DEFAULT NULL,
  `disk` int unsigned DEFAULT NULL,
  `comments` longtext NOT NULL,
  `cluster_id` char(32) NOT NULL,
  `local_config_context_data_owner_content_type_id` int DEFAULT NULL,
  `platform_id` char(32) DEFAULT NULL,
  `primary_ip4_id` char(32) DEFAULT NULL,
  `primary_ip6_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `local_config_context_schema_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  `software_version_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq` (`cluster_id`,`tenant_id`,`name`),
  KEY `virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat` (`platform_id`),
  KEY `virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t` (`tenant_id`),
  KEY `virtualization_virtualmachine_status_id_ff17be20` (`status_id`),
  KEY `virtualization_virtualmachine_name_266f6cdc` (`name`),
  KEY `virtualization_virtualmachine_new_role_id_73370f1c` (`role_id`),
  KEY `virtualization_virtu_local_config_context_a233267f_fk_django_co` (`local_config_context_data_owner_content_type_id`),
  KEY `virtualization_virtu_local_config_context_bec5cdf8_fk_extras_co` (`local_config_context_schema_id`),
  KEY `virtualization_virtualmachine_primary_ip4_id_942e42ae` (`primary_ip4_id`),
  KEY `virtualization_virtualmachine_primary_ip6_id_b7904e73` (`primary_ip6_id`),
  KEY `virtualization_virtu_software_version_id_44a299cb_fk_dcim_soft` (`software_version_id`),
  CONSTRAINT `virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz` FOREIGN KEY (`cluster_id`) REFERENCES `virtualization_cluster` (`id`),
  CONSTRAINT `virtualization_virtu_local_config_context_a233267f_fk_django_co` FOREIGN KEY (`local_config_context_data_owner_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `virtualization_virtu_local_config_context_bec5cdf8_fk_extras_co` FOREIGN KEY (`local_config_context_schema_id`) REFERENCES `extras_configcontextschema` (`id`),
  CONSTRAINT `virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat` FOREIGN KEY (`platform_id`) REFERENCES `dcim_platform` (`id`),
  CONSTRAINT `virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad` FOREIGN KEY (`primary_ip4_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad` FOREIGN KEY (`primary_ip6_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `virtualization_virtu_software_version_id_44a299cb_fk_dcim_soft` FOREIGN KEY (`software_version_id`) REFERENCES `dcim_softwareversion` (`id`),
  CONSTRAINT `virtualization_virtu_status_id_ff17be20_fk_extras_st` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `virtualization_virtualmachine_role_id_0cc898f9_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `virtualization_virtualmachine_chk_1` CHECK ((`vcpus` >= 0)),
  CONSTRAINT `virtualization_virtualmachine_chk_2` CHECK ((`memory` >= 0)),
  CONSTRAINT `virtualization_virtualmachine_chk_3` CHECK ((`disk` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualization_virtualmachine`
--

LOCK TABLES `virtualization_virtualmachine` WRITE;
/*!40000 ALTER TABLE `virtualization_virtualmachine` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualization_virtualmachine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualization_virtualmachine_software_image_files`
--

DROP TABLE IF EXISTS `virtualization_virtualmachine_software_image_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virtualization_virtualmachine_software_image_files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `virtualmachine_id` char(32) NOT NULL,
  `softwareimagefile_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtualization_virtualma_virtualmachine_id_softwa_98924fb6_uniq` (`virtualmachine_id`,`softwareimagefile_id`),
  KEY `virtualization_virtu_softwareimagefile_id_cf541719_fk_dcim_soft` (`softwareimagefile_id`),
  CONSTRAINT `virtualization_virtu_softwareimagefile_id_cf541719_fk_dcim_soft` FOREIGN KEY (`softwareimagefile_id`) REFERENCES `dcim_softwareimagefile` (`id`),
  CONSTRAINT `virtualization_virtu_virtualmachine_id_6722bc07_fk_virtualiz` FOREIGN KEY (`virtualmachine_id`) REFERENCES `virtualization_virtualmachine` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualization_virtualmachine_software_image_files`
--

LOCK TABLES `virtualization_virtualmachine_software_image_files` WRITE;
/*!40000 ALTER TABLE `virtualization_virtualmachine_software_image_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualization_virtualmachine_software_image_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualization_vminterface`
--

DROP TABLE IF EXISTS `virtualization_vminterface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virtualization_vminterface` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `mac_address` varchar(18) NOT NULL,
  `mtu` int unsigned DEFAULT NULL,
  `mode` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `untagged_vlan_id` char(32) DEFAULT NULL,
  `virtual_machine_id` char(32) NOT NULL,
  `status_id` char(32) NOT NULL,
  `parent_interface_id` char(32) DEFAULT NULL,
  `bridge_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `vrf_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtualization_vminterface_virtual_machine_id_name_cfb9c423_uniq` (`virtual_machine_id`,`name`),
  KEY `virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan` (`untagged_vlan_id`),
  KEY `virtualization_vminterface__name_0052e83a` (`_name`),
  KEY `virtualization_vminterface_name_8b75a799` (`name`),
  KEY `virtualization_vminterface_status_id_5f9104d8` (`status_id`),
  KEY `virtualization_vmint_parent_interface_id_3532b142_fk_virtualiz` (`parent_interface_id`),
  KEY `virtualization_vmint_bridge_id_7462b91e_fk_virtualiz` (`bridge_id`),
  KEY `virtualization_vminterface_vrf_id_4b570a8c_fk_ipam_vrf_id` (`vrf_id`),
  KEY `virtualization_vminterface_role_id_63af4a58` (`role_id`),
  CONSTRAINT `virtualization_vmint_bridge_id_7462b91e_fk_virtualiz` FOREIGN KEY (`bridge_id`) REFERENCES `virtualization_vminterface` (`id`),
  CONSTRAINT `virtualization_vmint_parent_interface_id_3532b142_fk_virtualiz` FOREIGN KEY (`parent_interface_id`) REFERENCES `virtualization_vminterface` (`id`),
  CONSTRAINT `virtualization_vmint_status_id_5f9104d8_fk_extras_st` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan` FOREIGN KEY (`untagged_vlan_id`) REFERENCES `ipam_vlan` (`id`),
  CONSTRAINT `virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz` FOREIGN KEY (`virtual_machine_id`) REFERENCES `virtualization_virtualmachine` (`id`),
  CONSTRAINT `virtualization_vminterface_role_id_63af4a58_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `virtualization_vminterface_vrf_id_4b570a8c_fk_ipam_vrf_id` FOREIGN KEY (`vrf_id`) REFERENCES `ipam_vrf` (`id`),
  CONSTRAINT `virtualization_vminterface_chk_1` CHECK ((`mtu` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualization_vminterface`
--

LOCK TABLES `virtualization_vminterface` WRITE;
/*!40000 ALTER TABLE `virtualization_vminterface` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualization_vminterface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualization_vminterface_tagged_vlans`
--

DROP TABLE IF EXISTS `virtualization_vminterface_tagged_vlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virtualization_vminterface_tagged_vlans` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vminterface_id` char(32) NOT NULL,
  `vlan_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq` (`vminterface_id`,`vlan_id`),
  KEY `virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan` (`vlan_id`),
  CONSTRAINT `virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan` FOREIGN KEY (`vlan_id`) REFERENCES `ipam_vlan` (`id`),
  CONSTRAINT `virtualization_vmint_vminterface_id_904b12de_fk_virtualiz` FOREIGN KEY (`vminterface_id`) REFERENCES `virtualization_vminterface` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualization_vminterface_tagged_vlans`
--

LOCK TABLES `virtualization_vminterface_tagged_vlans` WRITE;
/*!40000 ALTER TABLE `virtualization_vminterface_tagged_vlans` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualization_vminterface_tagged_vlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpn_vpn`
--

DROP TABLE IF EXISTS `vpn_vpn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpn_vpn` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `vpn_id` varchar(255) NOT NULL,
  `role_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `vpn_profile_id` char(32) DEFAULT NULL,
  `extra_attributes` json NOT NULL DEFAULT (_utf8mb4'{}'),
  `service_type` varchar(255) NOT NULL,
  `status_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `vpn_vpn_vpn_profile_id_3227205a_fk_vpn_vpnprofile_id` (`vpn_profile_id`),
  KEY `vpn_vpn_tenant_id_0facb2dc_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `vpn_vpn_role_id_fe533e76` (`role_id`),
  KEY `vpn_vpn_status_id_e7106010` (`status_id`),
  CONSTRAINT `vpn_vpn_role_id_fe533e76_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `vpn_vpn_status_id_e7106010_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `vpn_vpn_tenant_id_0facb2dc_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `vpn_vpn_vpn_profile_id_3227205a_fk_vpn_vpnprofile_id` FOREIGN KEY (`vpn_profile_id`) REFERENCES `vpn_vpnprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpn_vpn`
--

LOCK TABLES `vpn_vpn` WRITE;
/*!40000 ALTER TABLE `vpn_vpn` DISABLE KEYS */;
/*!40000 ALTER TABLE `vpn_vpn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpn_vpnphase1policy`
--

DROP TABLE IF EXISTS `vpn_vpnphase1policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpn_vpnphase1policy` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `ike_version` varchar(255) NOT NULL,
  `aggressive_mode` tinyint(1) NOT NULL,
  `encryption_algorithm` json DEFAULT NULL,
  `integrity_algorithm` json DEFAULT NULL,
  `dh_group` json DEFAULT NULL,
  `lifetime_seconds` int unsigned DEFAULT NULL,
  `lifetime_kb` int unsigned DEFAULT NULL,
  `authentication_method` varchar(255) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `vpn_vpnphase1policy_tenant_id_8c24077c_fk_tenancy_tenant_id` (`tenant_id`),
  CONSTRAINT `vpn_vpnphase1policy_tenant_id_8c24077c_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `vpn_vpnphase1policy_chk_1` CHECK ((`lifetime_seconds` >= 0)),
  CONSTRAINT `vpn_vpnphase1policy_chk_2` CHECK ((`lifetime_kb` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpn_vpnphase1policy`
--

LOCK TABLES `vpn_vpnphase1policy` WRITE;
/*!40000 ALTER TABLE `vpn_vpnphase1policy` DISABLE KEYS */;
INSERT INTO `vpn_vpnphase1policy` VALUES ('5dc9d7367e1e4d09b5ccd0cf3e4de7ba','2026-09-07 09:14:43.117223','2026-09-07 09:14:43.117252','{}','Remote Access','Policy dedicated for Remote Access VPN (IKEv2)','IKEv2',0,'[\"AES-256-CBC\"]','[\"SHA256\"]','[\"19\"]',28800,NULL,'',NULL),('7504bd4b21cb4720847ea942669243b2','2026-09-07 09:14:43.099400','2026-09-07 09:14:43.099438','{}','Standard Policy','Standard Phase 1 Policy dedicated for Standard Site-to-Site VPN','IKEv2',0,'[\"AES-256-CBC\"]','[\"SHA256\"]','[\"14\"]',86400,NULL,'',NULL),('f081f747925c4c729b79df5cdaa44fcb','2026-09-07 09:14:43.124746','2026-09-07 09:14:43.124766','{}','Performance-Oriented','Performance-Oriented for Site-to-Site','IKEv2',0,'[\"AES-128-CBC\"]','[\"SHA256\"]','[\"5\"]',86400,NULL,'',NULL),('f142f6568ae8443a9021352b9c1063d7','2026-09-07 09:14:43.131250','2026-09-07 09:14:43.131304','{}','High-Security','High-Security Policy for Site-to-Site','IKEv2',0,'[\"AES-256-GCM\"]','[\"SHA512\"]','[\"21\"]',86400,NULL,'',NULL);
/*!40000 ALTER TABLE `vpn_vpnphase1policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpn_vpnphase2policy`
--

DROP TABLE IF EXISTS `vpn_vpnphase2policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpn_vpnphase2policy` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `encryption_algorithm` json DEFAULT NULL,
  `integrity_algorithm` json DEFAULT NULL,
  `pfs_group` json DEFAULT NULL,
  `lifetime` int unsigned DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `vpn_vpnphase2policy_tenant_id_7869b5cd_fk_tenancy_tenant_id` (`tenant_id`),
  CONSTRAINT `vpn_vpnphase2policy_tenant_id_7869b5cd_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `vpn_vpnphase2policy_chk_1` CHECK ((`lifetime` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpn_vpnphase2policy`
--

LOCK TABLES `vpn_vpnphase2policy` WRITE;
/*!40000 ALTER TABLE `vpn_vpnphase2policy` DISABLE KEYS */;
INSERT INTO `vpn_vpnphase2policy` VALUES ('427e427e86254e96a1af072935e4738c','2026-09-07 09:14:43.101966','2026-09-07 09:14:43.101990','{}','Standard Policy','Standard Phase 2 Policy dedicated for Standard Site-to-Site VPN','[\"AES-256-CBC\"]','[\"SHA256\"]','[\"14\"]',3600,NULL),('7bde9fecc71e4e1287ccefe8f34eadb0','2026-09-07 09:14:43.118594','2026-09-07 09:14:43.118614','{}','Remote Access','Policy dedicated for Remote Access VPN (IKEv2)','[\"AES-256-CBC\"]','[\"SHA256\"]','[\"19\"]',3600,NULL),('871d6a417cfd4a5392076a80e3f57cbe','2026-09-07 09:14:43.125668','2026-09-07 09:14:43.125683','{}','Performance-Oriented','Performance-Oriented for Site-to-Site','[\"AES-128-CBC\"]','[\"SHA256\"]',NULL,3600,NULL),('e1c3045716ee44e9ba6b7008d607de73','2026-09-07 09:14:43.138886','2026-09-07 09:14:43.138906','{}','High-Security','High-Security Policy for Site-to-Site','[\"AES-256-GCM\"]','[\"SHA512\"]','[\"21\"]',1800,NULL);
/*!40000 ALTER TABLE `vpn_vpnphase2policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpn_vpnprofile`
--

DROP TABLE IF EXISTS `vpn_vpnprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpn_vpnprofile` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keepalive_enabled` tinyint(1) NOT NULL,
  `keepalive_interval` int unsigned DEFAULT NULL,
  `keepalive_retries` int unsigned DEFAULT NULL,
  `nat_traversal` tinyint(1) NOT NULL,
  `extra_options` json DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  `secrets_group_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `vpn_vpnprofile_secrets_group_id_ab204c2a_fk_extras_se` (`secrets_group_id`),
  KEY `vpn_vpnprofile_tenant_id_0217ddf4_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `vpn_vpnprofile_role_id_0aca02b3` (`role_id`),
  CONSTRAINT `vpn_vpnprofile_role_id_0aca02b3_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `vpn_vpnprofile_secrets_group_id_ab204c2a_fk_extras_se` FOREIGN KEY (`secrets_group_id`) REFERENCES `extras_secretsgroup` (`id`),
  CONSTRAINT `vpn_vpnprofile_tenant_id_0217ddf4_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `vpn_vpnprofile_chk_1` CHECK ((`keepalive_interval` >= 0)),
  CONSTRAINT `vpn_vpnprofile_chk_2` CHECK ((`keepalive_retries` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpn_vpnprofile`
--

LOCK TABLES `vpn_vpnprofile` WRITE;
/*!40000 ALTER TABLE `vpn_vpnprofile` DISABLE KEYS */;
INSERT INTO `vpn_vpnprofile` VALUES ('28d192d2b2e34a2ab4c1d016333723cd','2026-09-07 09:14:43.126538','2026-09-07 09:14:43.126553','{}','Performance-Oriented Site-to-Site','Performance-Oriented Site-to-Site',1,5,2,0,NULL,NULL,NULL,NULL),('8406122a00f44963b75a2b0dc59a097f','2026-09-07 09:14:43.142687','2026-09-07 09:14:43.142700','{}','High-Security Site-to-Site','High-Security Site-to-Site',1,15,4,0,NULL,NULL,NULL,NULL),('a82caecfcb014b66a63815f0fa583edc','2026-09-07 09:14:43.104179','2026-09-07 09:14:43.104200','{}','Standard Site-to-Site VPN','Standard Site-to-Site VPN',1,10,3,0,NULL,NULL,NULL,NULL),('c8fbc06376274408afebe52ce739e1e9','2026-09-07 09:14:43.120376','2026-09-07 09:14:43.120397','{}','Remote Access VPN (IKEv2)','Remote Access VPN (IKEv2)',1,30,5,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vpn_vpnprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpn_vpnprofilephase1policyassignment`
--

DROP TABLE IF EXISTS `vpn_vpnprofilephase1policyassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpn_vpnprofilephase1policyassignment` (
  `id` char(32) NOT NULL,
  `weight` int unsigned NOT NULL,
  `vpn_phase1_policy_id` char(32) NOT NULL,
  `vpn_profile_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vpn_vpnprofilephase1poli_vpn_profile_id_vpn_phase_b2f97cd9_uniq` (`vpn_profile_id`,`vpn_phase1_policy_id`),
  KEY `vpn_vpnprofilephase1_vpn_phase1_policy_id_d346ff83_fk_vpn_vpnph` (`vpn_phase1_policy_id`),
  CONSTRAINT `vpn_vpnprofilephase1_vpn_phase1_policy_id_d346ff83_fk_vpn_vpnph` FOREIGN KEY (`vpn_phase1_policy_id`) REFERENCES `vpn_vpnphase1policy` (`id`),
  CONSTRAINT `vpn_vpnprofilephase1_vpn_profile_id_dc2e1220_fk_vpn_vpnpr` FOREIGN KEY (`vpn_profile_id`) REFERENCES `vpn_vpnprofile` (`id`),
  CONSTRAINT `vpn_vpnprofilephase1policyassignment_chk_1` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpn_vpnprofilephase1policyassignment`
--

LOCK TABLES `vpn_vpnprofilephase1policyassignment` WRITE;
/*!40000 ALTER TABLE `vpn_vpnprofilephase1policyassignment` DISABLE KEYS */;
INSERT INTO `vpn_vpnprofilephase1policyassignment` VALUES ('20306051b9b74c04b730f0f664750504',100,'f142f6568ae8443a9021352b9c1063d7','8406122a00f44963b75a2b0dc59a097f'),('6d748c2f3c0f48099f4aa91943843cf3',100,'f081f747925c4c729b79df5cdaa44fcb','28d192d2b2e34a2ab4c1d016333723cd'),('894869e7ca864d2a899c02766bbb8e47',100,'7504bd4b21cb4720847ea942669243b2','a82caecfcb014b66a63815f0fa583edc'),('a9e762b61dd0429bb759b9c236dc1d3c',100,'5dc9d7367e1e4d09b5ccd0cf3e4de7ba','c8fbc06376274408afebe52ce739e1e9');
/*!40000 ALTER TABLE `vpn_vpnprofilephase1policyassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpn_vpnprofilephase2policyassignment`
--

DROP TABLE IF EXISTS `vpn_vpnprofilephase2policyassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpn_vpnprofilephase2policyassignment` (
  `id` char(32) NOT NULL,
  `weight` int unsigned NOT NULL,
  `vpn_phase2_policy_id` char(32) NOT NULL,
  `vpn_profile_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vpn_vpnprofilephase2poli_vpn_profile_id_vpn_phase_3868c393_uniq` (`vpn_profile_id`,`vpn_phase2_policy_id`),
  KEY `vpn_vpnprofilephase2_vpn_phase2_policy_id_7e2a8157_fk_vpn_vpnph` (`vpn_phase2_policy_id`),
  CONSTRAINT `vpn_vpnprofilephase2_vpn_phase2_policy_id_7e2a8157_fk_vpn_vpnph` FOREIGN KEY (`vpn_phase2_policy_id`) REFERENCES `vpn_vpnphase2policy` (`id`),
  CONSTRAINT `vpn_vpnprofilephase2_vpn_profile_id_a4ca60d0_fk_vpn_vpnpr` FOREIGN KEY (`vpn_profile_id`) REFERENCES `vpn_vpnprofile` (`id`),
  CONSTRAINT `vpn_vpnprofilephase2policyassignment_chk_1` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpn_vpnprofilephase2policyassignment`
--

LOCK TABLES `vpn_vpnprofilephase2policyassignment` WRITE;
/*!40000 ALTER TABLE `vpn_vpnprofilephase2policyassignment` DISABLE KEYS */;
INSERT INTO `vpn_vpnprofilephase2policyassignment` VALUES ('476010bf8bab46dfb95b7053e71136df',100,'427e427e86254e96a1af072935e4738c','a82caecfcb014b66a63815f0fa583edc'),('607839bb90934eb0aea0ef186a4f2a35',100,'871d6a417cfd4a5392076a80e3f57cbe','28d192d2b2e34a2ab4c1d016333723cd'),('8e27e6d1b24c4c1db60a0a289ea3b2e8',100,'e1c3045716ee44e9ba6b7008d607de73','8406122a00f44963b75a2b0dc59a097f'),('e8ec0393858d4114ad3319287a20818d',100,'7bde9fecc71e4e1287ccefe8f34eadb0','c8fbc06376274408afebe52ce739e1e9');
/*!40000 ALTER TABLE `vpn_vpnprofilephase2policyassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpn_vpntermination`
--

DROP TABLE IF EXISTS `vpn_vpntermination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpn_vpntermination` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `interface_id` char(32) DEFAULT NULL,
  `vlan_id` char(32) DEFAULT NULL,
  `vm_interface_id` char(32) DEFAULT NULL,
  `vpn_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vpn_vpntermination_unique_vlan` (`vlan_id`),
  UNIQUE KEY `vpn_vpntermination_unique_interface` (`interface_id`),
  UNIQUE KEY `vpn_vpntermination_unique_vm_interface` (`vm_interface_id`),
  KEY `vpn_vpntermination_vpn_id_abd295d5_fk_vpn_vpn_id` (`vpn_id`),
  CONSTRAINT `vpn_vpntermination_interface_id_6012e1f2_fk_dcim_interface_id` FOREIGN KEY (`interface_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `vpn_vpntermination_vlan_id_9b1ae536_fk_ipam_vlan_id` FOREIGN KEY (`vlan_id`) REFERENCES `ipam_vlan` (`id`),
  CONSTRAINT `vpn_vpntermination_vm_interface_id_e1d881e0_fk_virtualiz` FOREIGN KEY (`vm_interface_id`) REFERENCES `virtualization_vminterface` (`id`),
  CONSTRAINT `vpn_vpntermination_vpn_id_abd295d5_fk_vpn_vpn_id` FOREIGN KEY (`vpn_id`) REFERENCES `vpn_vpn` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpn_vpntermination`
--

LOCK TABLES `vpn_vpntermination` WRITE;
/*!40000 ALTER TABLE `vpn_vpntermination` DISABLE KEYS */;
/*!40000 ALTER TABLE `vpn_vpntermination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpn_vpntunnel`
--

DROP TABLE IF EXISTS `vpn_vpntunnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpn_vpntunnel` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `tunnel_id` varchar(255) NOT NULL,
  `encapsulation` varchar(255) NOT NULL,
  `endpoint_a_id` char(32) DEFAULT NULL,
  `endpoint_z_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `vpn_id` char(32) DEFAULT NULL,
  `vpn_profile_id` char(32) DEFAULT NULL,
  `secrets_group_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `vpn_vpntunnel_endpoint_a_id_267e0323_fk_vpn_vpntunnelendpoint_id` (`endpoint_a_id`),
  KEY `vpn_vpntunnel_endpoint_z_id_5b5e9784_fk_vpn_vpntunnelendpoint_id` (`endpoint_z_id`),
  KEY `vpn_vpntunnel_tenant_id_c06d4a64_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `vpn_vpntunnel_vpn_id_f0853583_fk_vpn_vpn_id` (`vpn_id`),
  KEY `vpn_vpntunnel_vpn_profile_id_4719feb0_fk_vpn_vpnprofile_id` (`vpn_profile_id`),
  KEY `vpn_vpntunnel_role_id_bb259bff` (`role_id`),
  KEY `vpn_vpntunnel_status_id_b26b610e` (`status_id`),
  KEY `vpn_vpntunnel_secrets_group_id_575a3360_fk_extras_se` (`secrets_group_id`),
  CONSTRAINT `vpn_vpntunnel_endpoint_a_id_267e0323_fk_vpn_vpntunnelendpoint_id` FOREIGN KEY (`endpoint_a_id`) REFERENCES `vpn_vpntunnelendpoint` (`id`),
  CONSTRAINT `vpn_vpntunnel_endpoint_z_id_5b5e9784_fk_vpn_vpntunnelendpoint_id` FOREIGN KEY (`endpoint_z_id`) REFERENCES `vpn_vpntunnelendpoint` (`id`),
  CONSTRAINT `vpn_vpntunnel_role_id_bb259bff_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `vpn_vpntunnel_secrets_group_id_575a3360_fk_extras_se` FOREIGN KEY (`secrets_group_id`) REFERENCES `extras_secretsgroup` (`id`),
  CONSTRAINT `vpn_vpntunnel_status_id_b26b610e_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `vpn_vpntunnel_tenant_id_c06d4a64_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `vpn_vpntunnel_vpn_id_f0853583_fk_vpn_vpn_id` FOREIGN KEY (`vpn_id`) REFERENCES `vpn_vpn` (`id`),
  CONSTRAINT `vpn_vpntunnel_vpn_profile_id_4719feb0_fk_vpn_vpnprofile_id` FOREIGN KEY (`vpn_profile_id`) REFERENCES `vpn_vpnprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpn_vpntunnel`
--

LOCK TABLES `vpn_vpntunnel` WRITE;
/*!40000 ALTER TABLE `vpn_vpntunnel` DISABLE KEYS */;
/*!40000 ALTER TABLE `vpn_vpntunnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpn_vpntunnelendpoint`
--

DROP TABLE IF EXISTS `vpn_vpntunnelendpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpn_vpntunnelendpoint` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `source_fqdn` varchar(255) NOT NULL,
  `device_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  `source_interface_id` char(32) DEFAULT NULL,
  `source_ipaddress_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `tunnel_interface_id` char(32) DEFAULT NULL,
  `vpn_profile_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_interface_id` (`source_interface_id`),
  UNIQUE KEY `tunnel_interface_id` (`tunnel_interface_id`),
  KEY `vpn_vpntunnelendpoint_device_id_2cdc3904_fk_dcim_device_id` (`device_id`),
  KEY `vpn_vpntunnelendpoin_source_ipaddress_id_f04d428d_fk_ipam_ipad` (`source_ipaddress_id`),
  KEY `vpn_vpntunnelendpoint_tenant_id_fa61b98a_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `vpn_vpntunnelendpoin_vpn_profile_id_86a7fbbf_fk_vpn_vpnpr` (`vpn_profile_id`),
  KEY `vpn_vpntunnelendpoint_role_id_4dc5896c` (`role_id`),
  CONSTRAINT `vpn_vpntunnelendpoin_source_interface_id_81358fc8_fk_dcim_inte` FOREIGN KEY (`source_interface_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `vpn_vpntunnelendpoin_source_ipaddress_id_f04d428d_fk_ipam_ipad` FOREIGN KEY (`source_ipaddress_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `vpn_vpntunnelendpoin_tunnel_interface_id_1d658d75_fk_dcim_inte` FOREIGN KEY (`tunnel_interface_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `vpn_vpntunnelendpoin_vpn_profile_id_86a7fbbf_fk_vpn_vpnpr` FOREIGN KEY (`vpn_profile_id`) REFERENCES `vpn_vpnprofile` (`id`),
  CONSTRAINT `vpn_vpntunnelendpoint_device_id_2cdc3904_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `vpn_vpntunnelendpoint_role_id_4dc5896c_fk_extras_role_id` FOREIGN KEY (`role_id`) REFERENCES `extras_role` (`id`),
  CONSTRAINT `vpn_vpntunnelendpoint_tenant_id_fa61b98a_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpn_vpntunnelendpoint`
--

LOCK TABLES `vpn_vpntunnelendpoint` WRITE;
/*!40000 ALTER TABLE `vpn_vpntunnelendpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `vpn_vpntunnelendpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpn_vpntunnelendpoint_protected_prefixes`
--

DROP TABLE IF EXISTS `vpn_vpntunnelendpoint_protected_prefixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpn_vpntunnelendpoint_protected_prefixes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vpntunnelendpoint_id` char(32) NOT NULL,
  `prefix_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vpn_vpntunnelendpoint_pr_vpntunnelendpoint_id_pre_ba6c2165_uniq` (`vpntunnelendpoint_id`,`prefix_id`),
  KEY `vpn_vpntunnelendpoin_prefix_id_33d5d3f8_fk_ipam_pref` (`prefix_id`),
  CONSTRAINT `vpn_vpntunnelendpoin_prefix_id_33d5d3f8_fk_ipam_pref` FOREIGN KEY (`prefix_id`) REFERENCES `ipam_prefix` (`id`),
  CONSTRAINT `vpn_vpntunnelendpoin_vpntunnelendpoint_id_0fd7ff77_fk_vpn_vpntu` FOREIGN KEY (`vpntunnelendpoint_id`) REFERENCES `vpn_vpntunnelendpoint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpn_vpntunnelendpoint_protected_prefixes`
--

LOCK TABLES `vpn_vpntunnelendpoint_protected_prefixes` WRITE;
/*!40000 ALTER TABLE `vpn_vpntunnelendpoint_protected_prefixes` DISABLE KEYS */;
/*!40000 ALTER TABLE `vpn_vpntunnelendpoint_protected_prefixes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpn_vpntunnelendpoint_protected_prefixes_dg`
--

DROP TABLE IF EXISTS `vpn_vpntunnelendpoint_protected_prefixes_dg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpn_vpntunnelendpoint_protected_prefixes_dg` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vpntunnelendpoint_id` char(32) NOT NULL,
  `dynamicgroup_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vpn_vpntunnelendpoint_pr_vpntunnelendpoint_id_dyn_6a094019_uniq` (`vpntunnelendpoint_id`,`dynamicgroup_id`),
  KEY `vpn_vpntunnelendpoin_dynamicgroup_id_16f7dcdc_fk_extras_dy` (`dynamicgroup_id`),
  CONSTRAINT `vpn_vpntunnelendpoin_dynamicgroup_id_16f7dcdc_fk_extras_dy` FOREIGN KEY (`dynamicgroup_id`) REFERENCES `extras_dynamicgroup` (`id`),
  CONSTRAINT `vpn_vpntunnelendpoin_vpntunnelendpoint_id_2d286f58_fk_vpn_vpntu` FOREIGN KEY (`vpntunnelendpoint_id`) REFERENCES `vpn_vpntunnelendpoint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpn_vpntunnelendpoint_protected_prefixes_dg`
--

LOCK TABLES `vpn_vpntunnelendpoint_protected_prefixes_dg` WRITE;
/*!40000 ALTER TABLE `vpn_vpntunnelendpoint_protected_prefixes_dg` DISABLE KEYS */;
/*!40000 ALTER TABLE `vpn_vpntunnelendpoint_protected_prefixes_dg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wireless_controllermanageddevicegroupradioprofileassignment`
--

DROP TABLE IF EXISTS `wireless_controllermanageddevicegroupradioprofileassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wireless_controllermanageddevicegroupradioprofileassignment` (
  `id` char(32) NOT NULL,
  `controller_managed_device_group_id` char(32) NOT NULL,
  `radio_profile_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wireless_controllermanag_controller_managed_devic_2621aa60_uniq` (`controller_managed_device_group_id`,`radio_profile_id`),
  KEY `wireless_controllerm_radio_profile_id_d14c9110_fk_wireless_` (`radio_profile_id`),
  CONSTRAINT `wireless_controllerm_controller_managed_d_95e252a1_fk_dcim_cont` FOREIGN KEY (`controller_managed_device_group_id`) REFERENCES `dcim_controllermanageddevicegroup` (`id`),
  CONSTRAINT `wireless_controllerm_radio_profile_id_d14c9110_fk_wireless_` FOREIGN KEY (`radio_profile_id`) REFERENCES `wireless_radioprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wireless_controllermanageddevicegroupradioprofileassignment`
--

LOCK TABLES `wireless_controllermanageddevicegroupradioprofileassignment` WRITE;
/*!40000 ALTER TABLE `wireless_controllermanageddevicegroupradioprofileassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `wireless_controllermanageddevicegroupradioprofileassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wireless_controllermanageddevicegroupwirelessnetworkassignment`
--

DROP TABLE IF EXISTS `wireless_controllermanageddevicegroupwirelessnetworkassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wireless_controllermanageddevicegroupwirelessnetworkassignment` (
  `id` char(32) NOT NULL,
  `controller_managed_device_group_id` char(32) NOT NULL,
  `vlan_id` char(32) DEFAULT NULL,
  `wireless_network_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wireless_controllermanag_controller_managed_devic_a0db3014_uniq` (`controller_managed_device_group_id`,`wireless_network_id`),
  KEY `wireless_controllerm_vlan_id_bafbd3ce_fk_ipam_vlan` (`vlan_id`),
  KEY `wireless_controllerm_wireless_network_id_2b73121d_fk_wireless_` (`wireless_network_id`),
  CONSTRAINT `wireless_controllerm_controller_managed_d_50ac51fd_fk_dcim_cont` FOREIGN KEY (`controller_managed_device_group_id`) REFERENCES `dcim_controllermanageddevicegroup` (`id`),
  CONSTRAINT `wireless_controllerm_vlan_id_bafbd3ce_fk_ipam_vlan` FOREIGN KEY (`vlan_id`) REFERENCES `ipam_vlan` (`id`),
  CONSTRAINT `wireless_controllerm_wireless_network_id_2b73121d_fk_wireless_` FOREIGN KEY (`wireless_network_id`) REFERENCES `wireless_wirelessnetwork` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wireless_controllermanageddevicegroupwirelessnetworkassignment`
--

LOCK TABLES `wireless_controllermanageddevicegroupwirelessnetworkassignment` WRITE;
/*!40000 ALTER TABLE `wireless_controllermanageddevicegroupwirelessnetworkassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `wireless_controllermanageddevicegroupwirelessnetworkassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wireless_radioprofile`
--

DROP TABLE IF EXISTS `wireless_radioprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wireless_radioprofile` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `tx_power_min` int DEFAULT NULL,
  `tx_power_max` int DEFAULT NULL,
  `channel_width` json DEFAULT NULL,
  `allowed_channel_list` json DEFAULT NULL,
  `regulatory_domain` varchar(255) NOT NULL,
  `rx_power_min` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wireless_radioprofile`
--

LOCK TABLES `wireless_radioprofile` WRITE;
/*!40000 ALTER TABLE `wireless_radioprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `wireless_radioprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wireless_radioprofile_supported_data_rates`
--

DROP TABLE IF EXISTS `wireless_radioprofile_supported_data_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wireless_radioprofile_supported_data_rates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `radioprofile_id` char(32) NOT NULL,
  `supporteddatarate_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wireless_radioprofile_su_radioprofile_id_supporte_75c406e0_uniq` (`radioprofile_id`,`supporteddatarate_id`),
  KEY `wireless_radioprofil_supporteddatarate_id_e736d83f_fk_wireless_` (`supporteddatarate_id`),
  CONSTRAINT `wireless_radioprofil_radioprofile_id_4e43ed37_fk_wireless_` FOREIGN KEY (`radioprofile_id`) REFERENCES `wireless_radioprofile` (`id`),
  CONSTRAINT `wireless_radioprofil_supporteddatarate_id_e736d83f_fk_wireless_` FOREIGN KEY (`supporteddatarate_id`) REFERENCES `wireless_supporteddatarate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wireless_radioprofile_supported_data_rates`
--

LOCK TABLES `wireless_radioprofile_supported_data_rates` WRITE;
/*!40000 ALTER TABLE `wireless_radioprofile_supported_data_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `wireless_radioprofile_supported_data_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wireless_supporteddatarate`
--

DROP TABLE IF EXISTS `wireless_supporteddatarate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wireless_supporteddatarate` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `standard` varchar(255) NOT NULL,
  `rate` int unsigned NOT NULL,
  `mcs_index` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wireless_supporteddatarate_standard_rate_5f25aaf0_uniq` (`standard`,`rate`),
  CONSTRAINT `wireless_supporteddatarate_chk_1` CHECK ((`rate` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wireless_supporteddatarate`
--

LOCK TABLES `wireless_supporteddatarate` WRITE;
/*!40000 ALTER TABLE `wireless_supporteddatarate` DISABLE KEYS */;
/*!40000 ALTER TABLE `wireless_supporteddatarate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wireless_wirelessnetwork`
--

DROP TABLE IF EXISTS `wireless_wirelessnetwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wireless_wirelessnetwork` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `ssid` varchar(255) NOT NULL,
  `mode` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `authentication` varchar(255) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `secrets_group_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `wireless_wirelessnet_secrets_group_id_e64d44e5_fk_extras_se` (`secrets_group_id`),
  KEY `wireless_wirelessnetwork_tenant_id_d410d4f0_fk_tenancy_tenant_id` (`tenant_id`),
  CONSTRAINT `wireless_wirelessnet_secrets_group_id_e64d44e5_fk_extras_se` FOREIGN KEY (`secrets_group_id`) REFERENCES `extras_secretsgroup` (`id`),
  CONSTRAINT `wireless_wirelessnetwork_tenant_id_d410d4f0_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wireless_wirelessnetwork`
--

LOCK TABLES `wireless_wirelessnetwork` WRITE;
/*!40000 ALTER TABLE `wireless_wirelessnetwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `wireless_wirelessnetwork` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-07  9:14:49
