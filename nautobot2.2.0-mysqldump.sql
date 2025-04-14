-- MySQL dump 10.13  Distrib 8.4.4, for Linux (x86_64)
--
-- Host: localhost    Database: nautobot
-- ------------------------------------------------------
-- Server version	8.4.4

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',27,'add_permission'),(2,'Can change permission',27,'change_permission'),(3,'Can delete permission',27,'delete_permission'),(4,'Can view permission',27,'view_permission'),(5,'Can add group',28,'add_group'),(6,'Can change group',28,'change_group'),(7,'Can delete group',28,'delete_group'),(8,'Can view group',28,'view_group'),(9,'Can change config',29,'change_config'),(10,'Can view config',29,'view_config'),(11,'Can add content type',30,'add_contenttype'),(12,'Can change content type',30,'change_contenttype'),(13,'Can delete content type',30,'delete_contenttype'),(14,'Can view content type',30,'view_contenttype'),(15,'Can add session',31,'add_session'),(16,'Can change session',31,'change_session'),(17,'Can delete session',31,'delete_session'),(18,'Can view session',31,'view_session'),(19,'Can add association',32,'add_association'),(20,'Can change association',32,'change_association'),(21,'Can delete association',32,'delete_association'),(22,'Can view association',32,'view_association'),(23,'Can add code',33,'add_code'),(24,'Can change code',33,'change_code'),(25,'Can delete code',33,'delete_code'),(26,'Can view code',33,'view_code'),(27,'Can add nonce',34,'add_nonce'),(28,'Can change nonce',34,'change_nonce'),(29,'Can delete nonce',34,'delete_nonce'),(30,'Can view nonce',34,'view_nonce'),(31,'Can add user social auth',35,'add_usersocialauth'),(32,'Can change user social auth',35,'change_usersocialauth'),(33,'Can delete user social auth',35,'delete_usersocialauth'),(34,'Can view user social auth',35,'view_usersocialauth'),(35,'Can add partial',36,'add_partial'),(36,'Can change partial',36,'change_partial'),(37,'Can delete partial',36,'delete_partial'),(38,'Can view partial',36,'view_partial'),(39,'Can add tag',37,'add_tag'),(40,'Can change tag',37,'change_tag'),(41,'Can delete tag',37,'delete_tag'),(42,'Can view tag',37,'view_tag'),(43,'Can add tagged item',38,'add_taggeditem'),(44,'Can change tagged item',38,'change_taggeditem'),(45,'Can delete tagged item',38,'delete_taggeditem'),(46,'Can view tagged item',38,'view_taggeditem'),(47,'Can add log entry',39,'add_logentry'),(48,'Can change log entry',39,'change_logentry'),(49,'Can delete log entry',39,'delete_logentry'),(50,'Can view log entry',39,'view_logentry'),(51,'Can add crontab',40,'add_crontabschedule'),(52,'Can change crontab',40,'change_crontabschedule'),(53,'Can delete crontab',40,'delete_crontabschedule'),(54,'Can view crontab',40,'view_crontabschedule'),(55,'Can add interval',41,'add_intervalschedule'),(56,'Can change interval',41,'change_intervalschedule'),(57,'Can delete interval',41,'delete_intervalschedule'),(58,'Can view interval',41,'view_intervalschedule'),(59,'Can add periodic task',42,'add_periodictask'),(60,'Can change periodic task',42,'change_periodictask'),(61,'Can delete periodic task',42,'delete_periodictask'),(62,'Can view periodic task',42,'view_periodictask'),(63,'Can add periodic tasks',43,'add_periodictasks'),(64,'Can change periodic tasks',43,'change_periodictasks'),(65,'Can delete periodic tasks',43,'delete_periodictasks'),(66,'Can view periodic tasks',43,'view_periodictasks'),(67,'Can add solar event',44,'add_solarschedule'),(68,'Can change solar event',44,'change_solarschedule'),(69,'Can delete solar event',44,'delete_solarschedule'),(70,'Can view solar event',44,'view_solarschedule'),(71,'Can add clocked',45,'add_clockedschedule'),(72,'Can change clocked',45,'change_clockedschedule'),(73,'Can delete clocked',45,'delete_clockedschedule'),(74,'Can view clocked',45,'view_clockedschedule'),(75,'Can add task result',46,'add_taskresult'),(76,'Can change task result',46,'change_taskresult'),(77,'Can delete task result',46,'delete_taskresult'),(78,'Can view task result',46,'view_taskresult'),(79,'Can add chord counter',47,'add_chordcounter'),(80,'Can change chord counter',47,'change_chordcounter'),(81,'Can delete chord counter',47,'delete_chordcounter'),(82,'Can view chord counter',47,'view_chordcounter'),(83,'Can add group result',48,'add_groupresult'),(84,'Can change group result',48,'change_groupresult'),(85,'Can delete group result',48,'delete_groupresult'),(86,'Can view group result',48,'view_groupresult'),(87,'Can add circuit',1,'add_circuit'),(88,'Can change circuit',1,'change_circuit'),(89,'Can delete circuit',1,'delete_circuit'),(90,'Can view circuit',1,'view_circuit'),(91,'Can add circuit termination',49,'add_circuittermination'),(92,'Can change circuit termination',49,'change_circuittermination'),(93,'Can delete circuit termination',49,'delete_circuittermination'),(94,'Can view circuit termination',49,'view_circuittermination'),(95,'Can add circuit type',50,'add_circuittype'),(96,'Can change circuit type',50,'change_circuittype'),(97,'Can delete circuit type',50,'delete_circuittype'),(98,'Can view circuit type',50,'view_circuittype'),(99,'Can add provider',51,'add_provider'),(100,'Can change provider',51,'change_provider'),(101,'Can delete provider',51,'delete_provider'),(102,'Can view provider',51,'view_provider'),(103,'Can add provider network',52,'add_providernetwork'),(104,'Can change provider network',52,'change_providernetwork'),(105,'Can delete provider network',52,'delete_providernetwork'),(106,'Can view provider network',52,'view_providernetwork'),(107,'Can add cable',2,'add_cable'),(108,'Can change cable',2,'change_cable'),(109,'Can delete cable',2,'delete_cable'),(110,'Can view cable',2,'view_cable'),(111,'Can add cable path',53,'add_cablepath'),(112,'Can change cable path',53,'change_cablepath'),(113,'Can delete cable path',53,'delete_cablepath'),(114,'Can view cable path',53,'view_cablepath'),(115,'Can add console port',54,'add_consoleport'),(116,'Can change console port',54,'change_consoleport'),(117,'Can delete console port',54,'delete_consoleport'),(118,'Can view console port',54,'view_consoleport'),(119,'Can add console port template',55,'add_consoleporttemplate'),(120,'Can change console port template',55,'change_consoleporttemplate'),(121,'Can delete console port template',55,'delete_consoleporttemplate'),(122,'Can view console port template',55,'view_consoleporttemplate'),(123,'Can add console server port',56,'add_consoleserverport'),(124,'Can change console server port',56,'change_consoleserverport'),(125,'Can delete console server port',56,'delete_consoleserverport'),(126,'Can view console server port',56,'view_consoleserverport'),(127,'Can add console server port template',57,'add_consoleserverporttemplate'),(128,'Can change console server port template',57,'change_consoleserverporttemplate'),(129,'Can delete console server port template',57,'delete_consoleserverporttemplate'),(130,'Can view console server port template',57,'view_consoleserverporttemplate'),(131,'Can add device',3,'add_device'),(132,'Can change device',3,'change_device'),(133,'Can delete device',3,'delete_device'),(134,'Can view device',3,'view_device'),(135,'Can add device bay',58,'add_devicebay'),(136,'Can change device bay',58,'change_devicebay'),(137,'Can delete device bay',58,'delete_devicebay'),(138,'Can view device bay',58,'view_devicebay'),(139,'Can add device bay template',59,'add_devicebaytemplate'),(140,'Can change device bay template',59,'change_devicebaytemplate'),(141,'Can delete device bay template',59,'delete_devicebaytemplate'),(142,'Can view device bay template',59,'view_devicebaytemplate'),(143,'Can add device type',60,'add_devicetype'),(144,'Can change device type',60,'change_devicetype'),(145,'Can delete device type',60,'delete_devicetype'),(146,'Can view device type',60,'view_devicetype'),(147,'Can add front port',61,'add_frontport'),(148,'Can change front port',61,'change_frontport'),(149,'Can delete front port',61,'delete_frontport'),(150,'Can view front port',61,'view_frontport'),(151,'Can add front port template',62,'add_frontporttemplate'),(152,'Can change front port template',62,'change_frontporttemplate'),(153,'Can delete front port template',62,'delete_frontporttemplate'),(154,'Can view front port template',62,'view_frontporttemplate'),(155,'Can add interface',13,'add_interface'),(156,'Can change interface',13,'change_interface'),(157,'Can delete interface',13,'delete_interface'),(158,'Can view interface',13,'view_interface'),(159,'Can add interface template',63,'add_interfacetemplate'),(160,'Can change interface template',63,'change_interfacetemplate'),(161,'Can delete interface template',63,'delete_interfacetemplate'),(162,'Can view interface template',63,'view_interfacetemplate'),(163,'Can add inventory item',64,'add_inventoryitem'),(164,'Can change inventory item',64,'change_inventoryitem'),(165,'Can delete inventory item',64,'delete_inventoryitem'),(166,'Can view inventory item',64,'view_inventoryitem'),(167,'Can add manufacturer',65,'add_manufacturer'),(168,'Can change manufacturer',65,'change_manufacturer'),(169,'Can delete manufacturer',65,'delete_manufacturer'),(170,'Can view manufacturer',65,'view_manufacturer'),(171,'Can add platform',66,'add_platform'),(172,'Can change platform',66,'change_platform'),(173,'Can delete platform',66,'delete_platform'),(174,'Can view platform',66,'view_platform'),(175,'Can add power feed',4,'add_powerfeed'),(176,'Can change power feed',4,'change_powerfeed'),(177,'Can delete power feed',4,'delete_powerfeed'),(178,'Can view power feed',4,'view_powerfeed'),(179,'Can add power outlet',67,'add_poweroutlet'),(180,'Can change power outlet',67,'change_poweroutlet'),(181,'Can delete power outlet',67,'delete_poweroutlet'),(182,'Can view power outlet',67,'view_poweroutlet'),(183,'Can add power outlet template',68,'add_poweroutlettemplate'),(184,'Can change power outlet template',68,'change_poweroutlettemplate'),(185,'Can delete power outlet template',68,'delete_poweroutlettemplate'),(186,'Can view power outlet template',68,'view_poweroutlettemplate'),(187,'Can add power panel',69,'add_powerpanel'),(188,'Can change power panel',69,'change_powerpanel'),(189,'Can delete power panel',69,'delete_powerpanel'),(190,'Can view power panel',69,'view_powerpanel'),(191,'Can add power port',70,'add_powerport'),(192,'Can change power port',70,'change_powerport'),(193,'Can delete power port',70,'delete_powerport'),(194,'Can view power port',70,'view_powerport'),(195,'Can add power port template',71,'add_powerporttemplate'),(196,'Can change power port template',71,'change_powerporttemplate'),(197,'Can delete power port template',71,'delete_powerporttemplate'),(198,'Can view power port template',71,'view_powerporttemplate'),(199,'Can add rack',5,'add_rack'),(200,'Can change rack',5,'change_rack'),(201,'Can delete rack',5,'delete_rack'),(202,'Can view rack',5,'view_rack'),(203,'Can add rack group',72,'add_rackgroup'),(204,'Can change rack group',72,'change_rackgroup'),(205,'Can delete rack group',72,'delete_rackgroup'),(206,'Can view rack group',72,'view_rackgroup'),(207,'Can add rack reservation',73,'add_rackreservation'),(208,'Can change rack reservation',73,'change_rackreservation'),(209,'Can delete rack reservation',73,'delete_rackreservation'),(210,'Can view rack reservation',73,'view_rackreservation'),(211,'Can add rear port',74,'add_rearport'),(212,'Can change rear port',74,'change_rearport'),(213,'Can delete rear port',74,'delete_rearport'),(214,'Can view rear port',74,'view_rearport'),(215,'Can add rear port template',75,'add_rearporttemplate'),(216,'Can change rear port template',75,'change_rearporttemplate'),(217,'Can delete rear port template',75,'delete_rearporttemplate'),(218,'Can view rear port template',75,'view_rearporttemplate'),(219,'Can add virtual chassis',76,'add_virtualchassis'),(220,'Can change virtual chassis',76,'change_virtualchassis'),(221,'Can delete virtual chassis',76,'delete_virtualchassis'),(222,'Can view virtual chassis',76,'view_virtualchassis'),(223,'Can add location type',77,'add_locationtype'),(224,'Can change location type',77,'change_locationtype'),(225,'Can delete location type',77,'delete_locationtype'),(226,'Can view location type',77,'view_locationtype'),(227,'Can add location',14,'add_location'),(228,'Can change location',14,'change_location'),(229,'Can delete location',14,'delete_location'),(230,'Can view location',14,'view_location'),(231,'Can add device redundancy group',19,'add_deviceredundancygroup'),(232,'Can change device redundancy group',19,'change_deviceredundancygroup'),(233,'Can delete device redundancy group',19,'delete_deviceredundancygroup'),(234,'Can view device redundancy group',19,'view_deviceredundancygroup'),(235,'Can add interface redundancy group',20,'add_interfaceredundancygroup'),(236,'Can change interface redundancy group',20,'change_interfaceredundancygroup'),(237,'Can delete interface redundancy group',20,'delete_interfaceredundancygroup'),(238,'Can view interface redundancy group',20,'view_interfaceredundancygroup'),(239,'Can add interface redundancy group association',78,'add_interfaceredundancygroupassociation'),(240,'Can change interface redundancy group association',78,'change_interfaceredundancygroupassociation'),(241,'Can delete interface redundancy group association',78,'delete_interfaceredundancygroupassociation'),(242,'Can view interface redundancy group association',78,'view_interfaceredundancygroupassociation'),(243,'Can add device family',79,'add_devicefamily'),(244,'Can change device family',79,'change_devicefamily'),(245,'Can delete device family',79,'delete_devicefamily'),(246,'Can view device family',79,'view_devicefamily'),(247,'Can add software version',25,'add_softwareversion'),(248,'Can change software version',25,'change_softwareversion'),(249,'Can delete software version',25,'delete_softwareversion'),(250,'Can view software version',25,'view_softwareversion'),(251,'Can add software image file',24,'add_softwareimagefile'),(252,'Can change software image file',24,'change_softwareimagefile'),(253,'Can delete software image file',24,'delete_softwareimagefile'),(254,'Can view software image file',24,'view_softwareimagefile'),(255,'Can add device type to software image file mapping',80,'add_devicetypetosoftwareimagefile'),(256,'Can change device type to software image file mapping',80,'change_devicetypetosoftwareimagefile'),(257,'Can delete device type to software image file mapping',80,'delete_devicetypetosoftwareimagefile'),(258,'Can view device type to software image file mapping',80,'view_devicetypetosoftwareimagefile'),(259,'Can add controller',26,'add_controller'),(260,'Can change controller',26,'change_controller'),(261,'Can delete controller',26,'delete_controller'),(262,'Can view controller',26,'view_controller'),(263,'Can add controller managed device group',81,'add_controllermanageddevicegroup'),(264,'Can change controller managed device group',81,'change_controllermanageddevicegroup'),(265,'Can delete controller managed device group',81,'delete_controllermanageddevicegroup'),(266,'Can view controller managed device group',81,'view_controllermanageddevicegroup'),(267,'Can add IP address',6,'add_ipaddress'),(268,'Can change IP address',6,'change_ipaddress'),(269,'Can delete IP address',6,'delete_ipaddress'),(270,'Can view IP address',6,'view_ipaddress'),(271,'Can add prefix',7,'add_prefix'),(272,'Can change prefix',7,'change_prefix'),(273,'Can delete prefix',7,'delete_prefix'),(274,'Can view prefix',7,'view_prefix'),(275,'Can add RIR',82,'add_rir'),(276,'Can change RIR',82,'change_rir'),(277,'Can delete RIR',82,'delete_rir'),(278,'Can view RIR',82,'view_rir'),(279,'Can add route target',83,'add_routetarget'),(280,'Can change route target',83,'change_routetarget'),(281,'Can delete route target',83,'delete_routetarget'),(282,'Can view route target',83,'view_routetarget'),(283,'Can add VRF',84,'add_vrf'),(284,'Can change VRF',84,'change_vrf'),(285,'Can delete VRF',84,'delete_vrf'),(286,'Can view VRF',84,'view_vrf'),(287,'Can add VLAN group',85,'add_vlangroup'),(288,'Can change VLAN group',85,'change_vlangroup'),(289,'Can delete VLAN group',85,'delete_vlangroup'),(290,'Can view VLAN group',85,'view_vlangroup'),(291,'Can add VLAN',8,'add_vlan'),(292,'Can change VLAN',8,'change_vlan'),(293,'Can delete VLAN',8,'delete_vlan'),(294,'Can view VLAN',8,'view_vlan'),(295,'Can add service',86,'add_service'),(296,'Can change service',86,'change_service'),(297,'Can delete service',86,'delete_service'),(298,'Can view service',86,'view_service'),(299,'Can add IP Address Assignment',87,'add_ipaddresstointerface'),(300,'Can change IP Address Assignment',87,'change_ipaddresstointerface'),(301,'Can delete IP Address Assignment',87,'delete_ipaddresstointerface'),(302,'Can view IP Address Assignment',87,'view_ipaddresstointerface'),(303,'Can add vrf prefix assignment',88,'add_vrfprefixassignment'),(304,'Can change vrf prefix assignment',88,'change_vrfprefixassignment'),(305,'Can delete vrf prefix assignment',88,'delete_vrfprefixassignment'),(306,'Can view vrf prefix assignment',88,'view_vrfprefixassignment'),(307,'Can add vrf device assignment',89,'add_vrfdeviceassignment'),(308,'Can change vrf device assignment',89,'change_vrfdeviceassignment'),(309,'Can delete vrf device assignment',89,'delete_vrfdeviceassignment'),(310,'Can view vrf device assignment',89,'view_vrfdeviceassignment'),(311,'Can add namespace',90,'add_namespace'),(312,'Can change namespace',90,'change_namespace'),(313,'Can delete namespace',90,'delete_namespace'),(314,'Can view namespace',90,'view_namespace'),(315,'Can add vlan location assignment',91,'add_vlanlocationassignment'),(316,'Can change vlan location assignment',91,'change_vlanlocationassignment'),(317,'Can delete vlan location assignment',91,'delete_vlanlocationassignment'),(318,'Can view vlan location assignment',91,'view_vlanlocationassignment'),(319,'Can add prefix location assignment',92,'add_prefixlocationassignment'),(320,'Can change prefix location assignment',92,'change_prefixlocationassignment'),(321,'Can delete prefix location assignment',92,'delete_prefixlocationassignment'),(322,'Can view prefix location assignment',92,'view_prefixlocationassignment'),(323,'Can add config context',93,'add_configcontext'),(324,'Can change config context',93,'change_configcontext'),(325,'Can delete config context',93,'delete_configcontext'),(326,'Can view config context',93,'view_configcontext'),(327,'Can add custom field',10,'add_customfield'),(328,'Can change custom field',10,'change_customfield'),(329,'Can delete custom field',10,'delete_customfield'),(330,'Can view custom field',10,'view_customfield'),(331,'Can add custom field choice',94,'add_customfieldchoice'),(332,'Can change custom field choice',94,'change_customfieldchoice'),(333,'Can delete custom field choice',94,'delete_customfieldchoice'),(334,'Can view custom field choice',94,'view_customfieldchoice'),(335,'Can add custom link',95,'add_customlink'),(336,'Can change custom link',95,'change_customlink'),(337,'Can delete custom link',95,'delete_customlink'),(338,'Can view custom link',95,'view_customlink'),(339,'Can add export template',96,'add_exporttemplate'),(340,'Can change export template',96,'change_exporttemplate'),(341,'Can delete export template',96,'delete_exporttemplate'),(342,'Can view export template',96,'view_exporttemplate'),(343,'Can add Git repository',97,'add_gitrepository'),(344,'Can change Git repository',97,'change_gitrepository'),(345,'Can delete Git repository',97,'delete_gitrepository'),(346,'Can view Git repository',97,'view_gitrepository'),(347,'Can add image attachment',98,'add_imageattachment'),(348,'Can change image attachment',98,'change_imageattachment'),(349,'Can delete image attachment',98,'delete_imageattachment'),(350,'Can view image attachment',98,'view_imageattachment'),(351,'Can add job result',99,'add_jobresult'),(352,'Can change job result',99,'change_jobresult'),(353,'Can delete job result',99,'delete_jobresult'),(354,'Can view job result',99,'view_jobresult'),(355,'Can add relationship',100,'add_relationship'),(356,'Can change relationship',100,'change_relationship'),(357,'Can delete relationship',100,'delete_relationship'),(358,'Can view relationship',100,'view_relationship'),(359,'Can add tag',101,'add_tag'),(360,'Can change tag',101,'change_tag'),(361,'Can delete tag',101,'delete_tag'),(362,'Can view tag',101,'view_tag'),(363,'Can add webhook',102,'add_webhook'),(364,'Can change webhook',102,'change_webhook'),(365,'Can delete webhook',102,'delete_webhook'),(366,'Can view webhook',102,'view_webhook'),(367,'Can add tagged item',103,'add_taggeditem'),(368,'Can change tagged item',103,'change_taggeditem'),(369,'Can delete tagged item',103,'delete_taggeditem'),(370,'Can view tagged item',103,'view_taggeditem'),(371,'Can add status',104,'add_status'),(372,'Can change status',104,'change_status'),(373,'Can delete status',104,'delete_status'),(374,'Can view status',104,'view_status'),(375,'Can add relationship association',105,'add_relationshipassociation'),(376,'Can change relationship association',105,'change_relationshipassociation'),(377,'Can delete relationship association',105,'delete_relationshipassociation'),(378,'Can view relationship association',105,'view_relationshipassociation'),(379,'Can add object change',106,'add_objectchange'),(380,'Can change object change',106,'change_objectchange'),(381,'Can delete object change',106,'delete_objectchange'),(382,'Can view object change',106,'view_objectchange'),(383,'Can add GraphQL query',107,'add_graphqlquery'),(384,'Can change GraphQL query',107,'change_graphqlquery'),(385,'Can delete GraphQL query',107,'delete_graphqlquery'),(386,'Can view GraphQL query',107,'view_graphqlquery'),(387,'Can add config context schema',108,'add_configcontextschema'),(388,'Can change config context schema',108,'change_configcontextschema'),(389,'Can delete config context schema',108,'delete_configcontextschema'),(390,'Can view config context schema',108,'view_configcontextschema'),(391,'Can add computed field',109,'add_computedfield'),(392,'Can change computed field',109,'change_computedfield'),(393,'Can delete computed field',109,'delete_computedfield'),(394,'Can view computed field',109,'view_computedfield'),(395,'Can add file attachment',110,'add_fileattachment'),(396,'Can change file attachment',110,'change_fileattachment'),(397,'Can delete file attachment',110,'delete_fileattachment'),(398,'Can view file attachment',110,'view_fileattachment'),(399,'Can add file proxy',111,'add_fileproxy'),(400,'Can change file proxy',111,'change_fileproxy'),(401,'Can delete file proxy',111,'delete_fileproxy'),(402,'Can view file proxy',111,'view_fileproxy'),(403,'Can add health check test model',112,'add_healthchecktestmodel'),(404,'Can change health check test model',112,'change_healthchecktestmodel'),(405,'Can delete health check test model',112,'delete_healthchecktestmodel'),(406,'Can view health check test model',112,'view_healthchecktestmodel'),(407,'Can add scheduled jobs',113,'add_scheduledjobs'),(408,'Can change scheduled jobs',113,'change_scheduledjobs'),(409,'Can delete scheduled jobs',113,'delete_scheduledjobs'),(410,'Can view scheduled jobs',113,'view_scheduledjobs'),(411,'Can add scheduled job',114,'add_scheduledjob'),(412,'Can change scheduled job',114,'change_scheduledjob'),(413,'Can delete scheduled job',114,'delete_scheduledjob'),(414,'Can view scheduled job',114,'view_scheduledjob'),(415,'Can add secret',115,'add_secret'),(416,'Can change secret',115,'change_secret'),(417,'Can delete secret',115,'delete_secret'),(418,'Can view secret',115,'view_secret'),(419,'Can add secrets group',116,'add_secretsgroup'),(420,'Can change secrets group',116,'change_secretsgroup'),(421,'Can delete secrets group',116,'delete_secretsgroup'),(422,'Can view secrets group',116,'view_secretsgroup'),(423,'Can add secrets group association',117,'add_secretsgroupassociation'),(424,'Can change secrets group association',117,'change_secretsgroupassociation'),(425,'Can delete secrets group association',117,'delete_secretsgroupassociation'),(426,'Can view secrets group association',117,'view_secretsgroupassociation'),(427,'Can add job log entry',118,'add_joblogentry'),(428,'Can change job log entry',118,'change_joblogentry'),(429,'Can delete job log entry',118,'delete_joblogentry'),(430,'Can view job log entry',118,'view_joblogentry'),(431,'Can add job',11,'add_job'),(432,'Can change job',11,'change_job'),(433,'Can delete job',11,'delete_job'),(434,'Can view job',11,'view_job'),(435,'Can add dynamic group',119,'add_dynamicgroup'),(436,'Can change dynamic group',119,'change_dynamicgroup'),(437,'Can delete dynamic group',119,'delete_dynamicgroup'),(438,'Can view dynamic group',119,'view_dynamicgroup'),(439,'Can add dynamic group membership',120,'add_dynamicgroupmembership'),(440,'Can change dynamic group membership',120,'change_dynamicgroupmembership'),(441,'Can delete dynamic group membership',120,'delete_dynamicgroupmembership'),(442,'Can view dynamic group membership',120,'view_dynamicgroupmembership'),(443,'Can add note',121,'add_note'),(444,'Can change note',121,'change_note'),(445,'Can delete note',121,'delete_note'),(446,'Can view note',121,'view_note'),(447,'Can add job hook',122,'add_jobhook'),(448,'Can change job hook',122,'change_jobhook'),(449,'Can delete job hook',122,'delete_jobhook'),(450,'Can view job hook',122,'view_jobhook'),(451,'Can add job button',123,'add_jobbutton'),(452,'Can change job button',123,'change_jobbutton'),(453,'Can delete job button',123,'delete_jobbutton'),(454,'Can view job button',123,'view_jobbutton'),(455,'Can add role',16,'add_role'),(456,'Can change role',16,'change_role'),(457,'Can delete role',16,'delete_role'),(458,'Can view role',16,'view_role'),(459,'Can add external integration',124,'add_externalintegration'),(460,'Can change external integration',124,'change_externalintegration'),(461,'Can delete external integration',124,'delete_externalintegration'),(462,'Can view external integration',124,'view_externalintegration'),(463,'Can add contact',125,'add_contact'),(464,'Can change contact',125,'change_contact'),(465,'Can delete contact',125,'delete_contact'),(466,'Can view contact',125,'view_contact'),(467,'Can add team',126,'add_team'),(468,'Can change team',126,'change_team'),(469,'Can delete team',126,'delete_team'),(470,'Can view team',126,'view_team'),(471,'Can add contact association',23,'add_contactassociation'),(472,'Can change contact association',23,'change_contactassociation'),(473,'Can delete contact association',23,'delete_contactassociation'),(474,'Can view contact association',23,'view_contactassociation'),(475,'Can add tenant group',127,'add_tenantgroup'),(476,'Can change tenant group',127,'change_tenantgroup'),(477,'Can delete tenant group',127,'delete_tenantgroup'),(478,'Can view tenant group',127,'view_tenantgroup'),(479,'Can add tenant',128,'add_tenant'),(480,'Can change tenant',128,'change_tenant'),(481,'Can delete tenant',128,'delete_tenant'),(482,'Can view tenant',128,'view_tenant'),(483,'Can add user',129,'add_user'),(484,'Can change user',129,'change_user'),(485,'Can delete user',129,'delete_user'),(486,'Can view user',129,'view_user'),(487,'Can add Group',130,'add_admingroup'),(488,'Can change Group',130,'change_admingroup'),(489,'Can delete Group',130,'delete_admingroup'),(490,'Can view Group',130,'view_admingroup'),(491,'Can add token',131,'add_token'),(492,'Can change token',131,'change_token'),(493,'Can delete token',131,'delete_token'),(494,'Can view token',131,'view_token'),(495,'Can add permission',132,'add_objectpermission'),(496,'Can change permission',132,'change_objectpermission'),(497,'Can delete permission',132,'delete_objectpermission'),(498,'Can view permission',132,'view_objectpermission'),(499,'Can add cluster',133,'add_cluster'),(500,'Can change cluster',133,'change_cluster'),(501,'Can delete cluster',133,'delete_cluster'),(502,'Can view cluster',133,'view_cluster'),(503,'Can add cluster group',134,'add_clustergroup'),(504,'Can change cluster group',134,'change_clustergroup'),(505,'Can delete cluster group',134,'delete_clustergroup'),(506,'Can view cluster group',134,'view_clustergroup'),(507,'Can add cluster type',135,'add_clustertype'),(508,'Can change cluster type',135,'change_clustertype'),(509,'Can delete cluster type',135,'delete_clustertype'),(510,'Can view cluster type',135,'view_clustertype'),(511,'Can add virtual machine',9,'add_virtualmachine'),(512,'Can change virtual machine',9,'change_virtualmachine'),(513,'Can delete virtual machine',9,'delete_virtualmachine'),(514,'Can view virtual machine',9,'view_virtualmachine'),(515,'Can add VM interface',12,'add_vminterface'),(516,'Can change VM interface',12,'change_vminterface'),(517,'Can delete VM interface',12,'delete_vminterface'),(518,'Can view VM interface',12,'view_vminterface'),(519,'Can add constance',136,'add_constance'),(520,'Can change constance',136,'change_constance'),(521,'Can delete constance',136,'delete_constance'),(522,'Can view constance',136,'view_constance'),(523,'Can add profile',137,'add_profile'),(524,'Can change profile',137,'change_profile'),(525,'Can delete profile',137,'delete_profile'),(526,'Can view profile',137,'view_profile'),(527,'Can add request',138,'add_request'),(528,'Can change request',138,'change_request'),(529,'Can delete request',138,'delete_request'),(530,'Can view request',138,'view_request'),(531,'Can add response',139,'add_response'),(532,'Can change response',139,'change_response'),(533,'Can delete response',139,'delete_response'),(534,'Can view response',139,'view_response'),(535,'Can add sql query',140,'add_sqlquery'),(536,'Can change sql query',140,'change_sqlquery'),(537,'Can delete sql query',140,'delete_sqlquery'),(538,'Can view sql query',140,'view_sqlquery');
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
  `_cable_peer_id` char(32) DEFAULT NULL,
  `term_side` varchar(1) NOT NULL,
  `port_speed` int unsigned DEFAULT NULL,
  `upstream_speed` int unsigned DEFAULT NULL,
  `xconnect_id` varchar(255) NOT NULL,
  `pp_info` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `_cable_peer_type_id` int DEFAULT NULL,
  `_path_id` char(32) DEFAULT NULL,
  `cable_id` char(32) DEFAULT NULL,
  `circuit_id` char(32) NOT NULL,
  `provider_network_id` char(32) DEFAULT NULL,
  `_custom_field_data` json NOT NULL DEFAULT (_utf8mb4'{}'),
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `location_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq` (`circuit_id`,`term_side`),
  KEY `circuits_circuitterm__cable_peer_type_id_bd122156_fk_django_co` (`_cable_peer_type_id`),
  KEY `circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id` (`cable_id`),
  KEY `circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_` (`provider_network_id`),
  KEY `circuits_circuitterm_location_id_9896bd96_fk_dcim_loca` (`location_id`),
  KEY `circuits_circuitterm__path_id_6dfd8db0_fk_dcim_cabl` (`_path_id`),
  CONSTRAINT `circuits_circuitterm__cable_peer_type_id_bd122156_fk_django_co` FOREIGN KEY (`_cable_peer_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `circuits_circuitterm__path_id_6dfd8db0_fk_dcim_cabl` FOREIGN KEY (`_path_id`) REFERENCES `dcim_cablepath` (`id`),
  CONSTRAINT `circuits_circuitterm_circuit_id_257e87e7_fk_circuits_` FOREIGN KEY (`circuit_id`) REFERENCES `circuits_circuit` (`id`),
  CONSTRAINT `circuits_circuitterm_location_id_9896bd96_fk_dcim_loca` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_` FOREIGN KEY (`provider_network_id`) REFERENCES `circuits_providernetwork` (`id`),
  CONSTRAINT `circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id` FOREIGN KEY (`cable_id`) REFERENCES `dcim_cable` (`id`),
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
-- Table structure for table `constance_config`
--

DROP TABLE IF EXISTS `constance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constance_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constance_config`
--

LOCK TABLES `constance_config` WRITE;
/*!40000 ALTER TABLE `constance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `constance_config` ENABLE KEYS */;
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
  `termination_a_id` char(32) NOT NULL,
  `termination_b_id` char(32) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `color` varchar(6) NOT NULL,
  `length` smallint unsigned DEFAULT NULL,
  `length_unit` varchar(50) NOT NULL,
  `_abs_length` decimal(10,4) DEFAULT NULL,
  `_termination_a_device_id` char(32) DEFAULT NULL,
  `_termination_b_device_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `termination_a_type_id` int NOT NULL,
  `termination_b_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq` (`termination_a_type_id`,`termination_a_id`),
  UNIQUE KEY `dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq` (`termination_b_type_id`,`termination_b_id`),
  KEY `dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id` (`_termination_a_device_id`),
  KEY `dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id` (`_termination_b_device_id`),
  KEY `dcim_cable_status_id_6a580869` (`status_id`),
  CONSTRAINT `dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id` FOREIGN KEY (`_termination_a_device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id` FOREIGN KEY (`_termination_b_device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_cable_status_id_6a580869_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_cable_termination_a_type_i_a614bab8_fk_django_co` FOREIGN KEY (`termination_a_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_cable_termination_b_type_i_a91595d0_fk_django_co` FOREIGN KEY (`termination_b_type_id`) REFERENCES `django_content_type` (`id`),
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq` (`origin_type_id`,`origin_id`),
  KEY `dcim_cablepath_destination_type_id_a8c1654b_fk_django_co` (`destination_type_id`),
  CONSTRAINT `dcim_cablepath_destination_type_id_a8c1654b_fk_django_co` FOREIGN KEY (`destination_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_cablepath_origin_type_id_6de54f6d_fk_django_content_type_id` FOREIGN KEY (`origin_type_id`) REFERENCES `django_content_type` (`id`)
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
  `_cable_peer_id` char(32) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `_cable_peer_type_id` int DEFAULT NULL,
  `_path_id` char(32) DEFAULT NULL,
  `cable_id` char(32) DEFAULT NULL,
  `device_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_consoleport_device_id_name_293786b6_uniq` (`device_id`,`name`),
  KEY `dcim_consoleport__cable_peer_type_id_52adb1be_fk_django_co` (`_cable_peer_type_id`),
  KEY `dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id` (`cable_id`),
  KEY `dcim_consoleport_name_ef94d0d1` (`name`),
  KEY `dcim_consoleport__name_6ac60d99` (`_name`),
  KEY `dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id` (`_path_id`),
  CONSTRAINT `dcim_consoleport__cable_peer_type_id_52adb1be_fk_django_co` FOREIGN KEY (`_cable_peer_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id` FOREIGN KEY (`_path_id`) REFERENCES `dcim_cablepath` (`id`),
  CONSTRAINT `dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id` FOREIGN KEY (`cable_id`) REFERENCES `dcim_cable` (`id`),
  CONSTRAINT `dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`)
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
  `device_type_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq` (`device_type_id`,`name`),
  CONSTRAINT `dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`)
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
  `_cable_peer_id` char(32) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `_cable_peer_type_id` int DEFAULT NULL,
  `_path_id` char(32) DEFAULT NULL,
  `cable_id` char(32) DEFAULT NULL,
  `device_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_consoleserverport_device_id_name_fb1c5999_uniq` (`device_id`,`name`),
  KEY `dcim_consoleserverpo__cable_peer_type_id_132b6744_fk_django_co` (`_cable_peer_type_id`),
  KEY `dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id` (`cable_id`),
  KEY `dcim_consoleserverport_name_2319aaf4` (`name`),
  KEY `dcim_consoleserverport__name_70f9317c` (`_name`),
  KEY `dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id` (`_path_id`),
  CONSTRAINT `dcim_consoleserverpo__cable_peer_type_id_132b6744_fk_django_co` FOREIGN KEY (`_cable_peer_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id` FOREIGN KEY (`_path_id`) REFERENCES `dcim_cablepath` (`id`),
  CONSTRAINT `dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id` FOREIGN KEY (`cable_id`) REFERENCES `dcim_cable` (`id`),
  CONSTRAINT `dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`)
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
  `device_type_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_consoleserverporttemplate_device_type_id_name_a05c974d_uniq` (`device_type_id`,`name`),
  CONSTRAINT `dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `dcim_controllermanag_controller_id_ca2df71d_fk_dcim_cont` (`controller_id`),
  KEY `dcim_controllermanag_parent_id_567b18e0_fk_dcim_cont` (`parent_id`),
  CONSTRAINT `dcim_controllermanag_controller_id_ca2df71d_fk_dcim_cont` FOREIGN KEY (`controller_id`) REFERENCES `dcim_controller` (`id`),
  CONSTRAINT `dcim_controllermanag_parent_id_567b18e0_fk_dcim_cont` FOREIGN KEY (`parent_id`) REFERENCES `dcim_controllermanageddevicegroup` (`id`),
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
  `cluster_id` char(32) DEFAULT NULL,
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
  `device_redundancy_group_priority` smallint unsigned DEFAULT NULL,
  `device_redundancy_group_id` char(32) DEFAULT NULL,
  `role_id` char(32) NOT NULL,
  `software_version_id` char(32) DEFAULT NULL,
  `controller_managed_device_group_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_tag` (`asset_tag`),
  UNIQUE KEY `dcim_device_rack_id_position_face_43208a79_uniq` (`rack_id`,`position`,`face`),
  UNIQUE KEY `dcim_device_virtual_chassis_id_vc_position_efea7133_uniq` (`virtual_chassis_id`,`vc_position`),
  UNIQUE KEY `dcim_device_location_id_tenant_id_name_2259bd02_uniq` (`location_id`,`tenant_id`,`name`),
  KEY `dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id` (`cluster_id`),
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
  CONSTRAINT `dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `virtualization_cluster` (`id`),
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
  KEY `dcim_devicetype_manufacturer_id_a3e8029e` (`manufacturer_id`),
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
  `_cable_peer_id` char(32) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `rear_port_position` smallint unsigned NOT NULL,
  `_cable_peer_type_id` int DEFAULT NULL,
  `cable_id` char(32) DEFAULT NULL,
  `device_id` char(32) NOT NULL,
  `rear_port_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq` (`rear_port_id`,`rear_port_position`),
  UNIQUE KEY `dcim_frontport_device_id_name_235b7af2_uniq` (`device_id`,`name`),
  KEY `dcim_frontport__cable_peer_type_id_c4690f56_fk_django_co` (`_cable_peer_type_id`),
  KEY `dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id` (`cable_id`),
  KEY `dcim_frontport_name_8972111f` (`name`),
  KEY `dcim_frontport__name_273b2ca3` (`_name`),
  CONSTRAINT `dcim_frontport__cable_peer_type_id_c4690f56_fk_django_co` FOREIGN KEY (`_cable_peer_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id` FOREIGN KEY (`cable_id`) REFERENCES `dcim_cable` (`id`),
  CONSTRAINT `dcim_frontport_device_id_950557b5_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
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
  `device_type_id` char(32) NOT NULL,
  `rear_port_template_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq` (`rear_port_template_id`,`rear_port_position`),
  UNIQUE KEY `dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq` (`device_type_id`,`name`),
  CONSTRAINT `dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
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
  `_cable_peer_id` char(32) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `mac_address` varchar(18) NOT NULL,
  `mtu` int unsigned DEFAULT NULL,
  `mode` varchar(50) NOT NULL,
  `_name` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `mgmt_only` tinyint(1) NOT NULL,
  `_cable_peer_type_id` int DEFAULT NULL,
  `_path_id` char(32) DEFAULT NULL,
  `cable_id` char(32) DEFAULT NULL,
  `device_id` char(32) NOT NULL,
  `lag_id` char(32) DEFAULT NULL,
  `untagged_vlan_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `parent_interface_id` char(32) DEFAULT NULL,
  `bridge_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `vrf_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_interface_device_id_name_bffc4ec4_uniq` (`device_id`,`name`),
  KEY `dcim_interface__cable_peer_type_id_ce52cb81_fk_django_co` (`_cable_peer_type_id`),
  KEY `dcim_interface_cable_id_1b264edb_fk_dcim_cable_id` (`cable_id`),
  KEY `dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id` (`lag_id`),
  KEY `dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id` (`untagged_vlan_id`),
  KEY `dcim_interface_name_bc4e48ab` (`name`),
  KEY `dcim_interface__name_8796fa61` (`_name`),
  KEY `dcim_interface_status_id_5d68d3d6` (`status_id`),
  KEY `dcim_interface_parent_interface_id_dc46b61a_fk_dcim_interface_id` (`parent_interface_id`),
  KEY `dcim_interface_bridge_id_f2a8df85_fk_dcim_interface_id` (`bridge_id`),
  KEY `dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id` (`_path_id`),
  KEY `dcim_interface_vrf_id_a92e59b2_fk_ipam_vrf_id` (`vrf_id`),
  CONSTRAINT `dcim_interface__cable_peer_type_id_ce52cb81_fk_django_co` FOREIGN KEY (`_cable_peer_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id` FOREIGN KEY (`_path_id`) REFERENCES `dcim_cablepath` (`id`),
  CONSTRAINT `dcim_interface_bridge_id_f2a8df85_fk_dcim_interface_id` FOREIGN KEY (`bridge_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `dcim_interface_cable_id_1b264edb_fk_dcim_cable_id` FOREIGN KEY (`cable_id`) REFERENCES `dcim_cable` (`id`),
  CONSTRAINT `dcim_interface_device_id_359c6115_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id` FOREIGN KEY (`lag_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `dcim_interface_parent_interface_id_dc46b61a_fk_dcim_interface_id` FOREIGN KEY (`parent_interface_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `dcim_interface_status_id_5d68d3d6_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id` FOREIGN KEY (`untagged_vlan_id`) REFERENCES `ipam_vlan` (`id`),
  CONSTRAINT `dcim_interface_vrf_id_a92e59b2_fk_ipam_vrf_id` FOREIGN KEY (`vrf_id`) REFERENCES `ipam_vrf` (`id`),
  CONSTRAINT `dcim_interface_chk_1` CHECK ((`mtu` >= 0))
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
  `priority` smallint unsigned NOT NULL,
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
  `device_type_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_interfacetemplate_device_type_id_name_3a847237_uniq` (`device_type_id`,`name`),
  CONSTRAINT `dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`)
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
  `comments` longtext NOT NULL DEFAULT (_utf8mb4''),
  `contact_email` varchar(254) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `facility` varchar(255) NOT NULL,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `physical_address` longtext NOT NULL DEFAULT (_utf8mb4''),
  `shipping_address` longtext NOT NULL DEFAULT (_utf8mb4''),
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
  `_cable_peer_id` char(32) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `supply` varchar(50) NOT NULL,
  `phase` varchar(50) NOT NULL,
  `voltage` smallint NOT NULL,
  `amperage` smallint unsigned NOT NULL,
  `max_utilization` smallint unsigned NOT NULL,
  `available_power` int unsigned NOT NULL,
  `comments` longtext NOT NULL,
  `_cable_peer_type_id` int DEFAULT NULL,
  `_path_id` char(32) DEFAULT NULL,
  `cable_id` char(32) DEFAULT NULL,
  `power_panel_id` char(32) NOT NULL,
  `rack_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq` (`power_panel_id`,`name`),
  KEY `dcim_powerfeed__cable_peer_type_id_9f930589_fk_django_co` (`_cable_peer_type_id`),
  KEY `dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id` (`cable_id`),
  KEY `dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id` (`rack_id`),
  KEY `dcim_powerfeed_status_id_8c424cc3` (`status_id`),
  KEY `dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id` (`_path_id`),
  CONSTRAINT `dcim_powerfeed__cable_peer_type_id_9f930589_fk_django_co` FOREIGN KEY (`_cable_peer_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id` FOREIGN KEY (`_path_id`) REFERENCES `dcim_cablepath` (`id`),
  CONSTRAINT `dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id` FOREIGN KEY (`cable_id`) REFERENCES `dcim_cable` (`id`),
  CONSTRAINT `dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id` FOREIGN KEY (`power_panel_id`) REFERENCES `dcim_powerpanel` (`id`),
  CONSTRAINT `dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id` FOREIGN KEY (`rack_id`) REFERENCES `dcim_rack` (`id`),
  CONSTRAINT `dcim_powerfeed_status_id_8c424cc3_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_powerfeed_chk_1` CHECK ((`amperage` >= 0)),
  CONSTRAINT `dcim_powerfeed_chk_2` CHECK ((`max_utilization` >= 0)),
  CONSTRAINT `dcim_powerfeed_chk_3` CHECK ((`available_power` >= 0))
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
  `_cable_peer_id` char(32) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `feed_leg` varchar(50) NOT NULL,
  `_cable_peer_type_id` int DEFAULT NULL,
  `_path_id` char(32) DEFAULT NULL,
  `cable_id` char(32) DEFAULT NULL,
  `device_id` char(32) NOT NULL,
  `power_port_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_poweroutlet_device_id_name_981b00c1_uniq` (`device_id`,`name`),
  KEY `dcim_poweroutlet__cable_peer_type_id_bbff28d0_fk_django_co` (`_cable_peer_type_id`),
  KEY `dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id` (`cable_id`),
  KEY `dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id` (`power_port_id`),
  KEY `dcim_poweroutlet_name_98c8e7a2` (`name`),
  KEY `dcim_poweroutlet__name_0ecdd374` (`_name`),
  KEY `dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id` (`_path_id`),
  CONSTRAINT `dcim_poweroutlet__cable_peer_type_id_bbff28d0_fk_django_co` FOREIGN KEY (`_cable_peer_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id` FOREIGN KEY (`_path_id`) REFERENCES `dcim_cablepath` (`id`),
  CONSTRAINT `dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id` FOREIGN KEY (`cable_id`) REFERENCES `dcim_cable` (`id`),
  CONSTRAINT `dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
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
  `device_type_id` char(32) NOT NULL,
  `power_port_template_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq` (`device_type_id`,`name`),
  KEY `dcim_poweroutlettemp_power_port_template__fd11e222_fk_dcim_powe` (`power_port_template_id`),
  CONSTRAINT `dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_powerpanel_location_id_name_682403ca_uniq` (`location_id`,`name`),
  KEY `dcim_powerpanel_rack_group_id_76467cc9_fk_dcim_rackgroup_id` (`rack_group_id`),
  KEY `dcim_powerpanel_name_09946067` (`name`),
  CONSTRAINT `dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `dcim_powerpanel_rack_group_id_76467cc9_fk_dcim_rackgroup_id` FOREIGN KEY (`rack_group_id`) REFERENCES `dcim_rackgroup` (`id`)
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
  `_cable_peer_id` char(32) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `maximum_draw` smallint unsigned DEFAULT NULL,
  `allocated_draw` smallint unsigned DEFAULT NULL,
  `_cable_peer_type_id` int DEFAULT NULL,
  `_path_id` char(32) DEFAULT NULL,
  `cable_id` char(32) DEFAULT NULL,
  `device_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_powerport_device_id_name_948af82c_uniq` (`device_id`,`name`),
  KEY `dcim_powerport__cable_peer_type_id_9df2a278_fk_django_co` (`_cable_peer_type_id`),
  KEY `dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id` (`cable_id`),
  KEY `dcim_powerport_name_8b95aa68` (`name`),
  KEY `dcim_powerport__name_cd2ccdac` (`_name`),
  KEY `dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id` (`_path_id`),
  CONSTRAINT `dcim_powerport__cable_peer_type_id_9df2a278_fk_django_co` FOREIGN KEY (`_cable_peer_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id` FOREIGN KEY (`_path_id`) REFERENCES `dcim_cablepath` (`id`),
  CONSTRAINT `dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id` FOREIGN KEY (`cable_id`) REFERENCES `dcim_cable` (`id`),
  CONSTRAINT `dcim_powerport_device_id_ef7185ae_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
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
  `device_type_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq` (`device_type_id`,`name`),
  CONSTRAINT `dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
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
  UNIQUE KEY `dcim_rack_group_id_name_846f3826_uniq` (`rack_group_id`,`name`),
  UNIQUE KEY `dcim_rack_group_id_facility_id_f16a53ae_uniq` (`rack_group_id`,`facility_id`),
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
  KEY `dcim_rackgroup_location_id_5a6fdeac` (`location_id`),
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
  `_cable_peer_id` char(32) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `positions` smallint unsigned NOT NULL,
  `_cable_peer_type_id` int DEFAULT NULL,
  `cable_id` char(32) DEFAULT NULL,
  `device_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_rearport_device_id_name_4b14dde6_uniq` (`device_id`,`name`),
  KEY `dcim_rearport__cable_peer_type_id_cecf241c_fk_django_co` (`_cable_peer_type_id`),
  KEY `dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id` (`cable_id`),
  KEY `dcim_rearport_name_2300a129` (`name`),
  KEY `dcim_rearport__name_50f20c9e` (`_name`),
  CONSTRAINT `dcim_rearport__cable_peer_type_id_cecf241c_fk_django_co` FOREIGN KEY (`_cable_peer_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id` FOREIGN KEY (`cable_id`) REFERENCES `dcim_cable` (`id`),
  CONSTRAINT `dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
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
  `device_type_id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq` (`device_type_id`,`name`),
  CONSTRAINT `dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_softwareimagefile_image_file_name_software_9887bb4c_uniq` (`image_file_name`,`software_version_id`),
  KEY `dcim_softwareimagefi_software_version_id_a143fbd3_fk_dcim_soft` (`software_version_id`),
  KEY `dcim_softwareimagefile_status_id_5288600b` (`status_id`),
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_cele_task_na_08aec9_idx` (`task_name`),
  KEY `django_cele_status_9b6201_idx` (`status`),
  KEY `django_cele_worker_d54dd8_idx` (`worker`),
  KEY `django_cele_date_cr_f04a50_idx` (`date_created`),
  KEY `django_cele_date_do_f59aad_idx` (`date_done`)
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
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (39,'admin','logentry'),(28,'auth','group'),(27,'auth','permission'),(1,'circuits','circuit'),(49,'circuits','circuittermination'),(50,'circuits','circuittype'),(51,'circuits','provider'),(52,'circuits','providernetwork'),(29,'constance','config'),(30,'contenttypes','contenttype'),(136,'database','constance'),(2,'dcim','cable'),(53,'dcim','cablepath'),(54,'dcim','consoleport'),(55,'dcim','consoleporttemplate'),(56,'dcim','consoleserverport'),(57,'dcim','consoleserverporttemplate'),(26,'dcim','controller'),(81,'dcim','controllermanageddevicegroup'),(3,'dcim','device'),(58,'dcim','devicebay'),(59,'dcim','devicebaytemplate'),(79,'dcim','devicefamily'),(19,'dcim','deviceredundancygroup'),(15,'dcim','devicerole'),(60,'dcim','devicetype'),(80,'dcim','devicetypetosoftwareimagefile'),(61,'dcim','frontport'),(62,'dcim','frontporttemplate'),(13,'dcim','interface'),(20,'dcim','interfaceredundancygroup'),(78,'dcim','interfaceredundancygroupassociation'),(63,'dcim','interfacetemplate'),(64,'dcim','inventoryitem'),(14,'dcim','location'),(77,'dcim','locationtype'),(65,'dcim','manufacturer'),(66,'dcim','platform'),(4,'dcim','powerfeed'),(67,'dcim','poweroutlet'),(68,'dcim','poweroutlettemplate'),(69,'dcim','powerpanel'),(70,'dcim','powerport'),(71,'dcim','powerporttemplate'),(5,'dcim','rack'),(72,'dcim','rackgroup'),(73,'dcim','rackreservation'),(17,'dcim','rackrole'),(74,'dcim','rearport'),(75,'dcim','rearporttemplate'),(21,'dcim','site'),(24,'dcim','softwareimagefile'),(25,'dcim','softwareversion'),(76,'dcim','virtualchassis'),(45,'django_celery_beat','clockedschedule'),(40,'django_celery_beat','crontabschedule'),(41,'django_celery_beat','intervalschedule'),(42,'django_celery_beat','periodictask'),(43,'django_celery_beat','periodictasks'),(44,'django_celery_beat','solarschedule'),(47,'django_celery_results','chordcounter'),(48,'django_celery_results','groupresult'),(46,'django_celery_results','taskresult'),(109,'extras','computedfield'),(93,'extras','configcontext'),(108,'extras','configcontextschema'),(125,'extras','contact'),(23,'extras','contactassociation'),(10,'extras','customfield'),(94,'extras','customfieldchoice'),(95,'extras','customlink'),(119,'extras','dynamicgroup'),(120,'extras','dynamicgroupmembership'),(96,'extras','exporttemplate'),(124,'extras','externalintegration'),(110,'extras','fileattachment'),(111,'extras','fileproxy'),(97,'extras','gitrepository'),(107,'extras','graphqlquery'),(112,'extras','healthchecktestmodel'),(98,'extras','imageattachment'),(11,'extras','job'),(123,'extras','jobbutton'),(122,'extras','jobhook'),(118,'extras','joblogentry'),(99,'extras','jobresult'),(121,'extras','note'),(106,'extras','objectchange'),(100,'extras','relationship'),(105,'extras','relationshipassociation'),(16,'extras','role'),(114,'extras','scheduledjob'),(113,'extras','scheduledjobs'),(115,'extras','secret'),(116,'extras','secretsgroup'),(117,'extras','secretsgroupassociation'),(104,'extras','status'),(101,'extras','tag'),(103,'extras','taggeditem'),(126,'extras','team'),(102,'extras','webhook'),(22,'ipam','aggregate'),(6,'ipam','ipaddress'),(87,'ipam','ipaddresstointerface'),(90,'ipam','namespace'),(7,'ipam','prefix'),(92,'ipam','prefixlocationassignment'),(82,'ipam','rir'),(18,'ipam','role'),(83,'ipam','routetarget'),(86,'ipam','service'),(8,'ipam','vlan'),(85,'ipam','vlangroup'),(91,'ipam','vlanlocationassignment'),(84,'ipam','vrf'),(89,'ipam','vrfdeviceassignment'),(88,'ipam','vrfprefixassignment'),(31,'sessions','session'),(137,'silk','profile'),(138,'silk','request'),(139,'silk','response'),(140,'silk','sqlquery'),(32,'social_django','association'),(33,'social_django','code'),(34,'social_django','nonce'),(36,'social_django','partial'),(35,'social_django','usersocialauth'),(37,'taggit','tag'),(38,'taggit','taggeditem'),(128,'tenancy','tenant'),(127,'tenancy','tenantgroup'),(130,'users','admingroup'),(132,'users','objectpermission'),(131,'users','token'),(129,'users','user'),(133,'virtualization','cluster'),(134,'virtualization','clustergroup'),(135,'virtualization','clustertype'),(9,'virtualization','virtualmachine'),(12,'virtualization','vminterface');
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
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-14 04:08:29.450539'),(2,'contenttypes','0002_remove_content_type_name','2025-04-14 04:08:29.480226'),(3,'auth','0001_initial','2025-04-14 04:08:29.576755'),(4,'auth','0002_alter_permission_name_max_length','2025-04-14 04:08:29.602677'),(5,'auth','0003_alter_user_email_max_length','2025-04-14 04:08:29.609057'),(6,'auth','0004_alter_user_username_opts','2025-04-14 04:08:29.614523'),(7,'auth','0005_alter_user_last_login_null','2025-04-14 04:08:29.619616'),(8,'auth','0006_require_contenttypes_0002','2025-04-14 04:08:29.621722'),(9,'auth','0007_alter_validators_add_error_messages','2025-04-14 04:08:29.626816'),(10,'auth','0008_alter_user_username_max_length','2025-04-14 04:08:29.632374'),(11,'auth','0009_alter_user_last_name_max_length','2025-04-14 04:08:29.638140'),(12,'auth','0010_alter_group_name_max_length','2025-04-14 04:08:29.647511'),(13,'auth','0011_update_proxy_permissions','2025-04-14 04:08:29.653735'),(14,'auth','0012_alter_user_first_name_max_length','2025-04-14 04:08:29.659051'),(15,'users','0001_initial','2025-04-14 04:08:29.959764'),(16,'admin','0001_initial','2025-04-14 04:08:30.018110'),(17,'admin','0002_logentry_remove_auto_add','2025-04-14 04:08:30.029050'),(18,'admin','0003_logentry_add_action_flag_choices','2025-04-14 04:08:30.040090'),(19,'extras','0001_initial_part_1','2025-04-14 04:08:30.633899'),(20,'tenancy','0001_initial','2025-04-14 04:08:30.724456'),(21,'dcim','0001_initial_part_1','2025-04-14 04:08:31.264817'),(22,'dcim','0002_initial_part_2','2025-04-14 04:08:31.883931'),(23,'ipam','0001_initial_part_1','2025-04-14 04:08:32.518905'),(24,'extras','0002_initial_part_2','2025-04-14 04:08:33.197847'),(25,'dcim','0003_initial_part_3','2025-04-14 04:08:37.316568'),(26,'virtualization','0001_initial','2025-04-14 04:08:38.407309'),(27,'dcim','0004_initial_part_4','2025-04-14 04:08:43.607213'),(28,'extras','0003_initial_part_3','2025-04-14 04:08:45.214374'),(29,'ipam','0002_initial_part_2','2025-04-14 04:08:47.651605'),(30,'circuits','0001_initial_part_1','2025-04-14 04:08:47.721886'),(31,'circuits','0002_initial_part_2','2025-04-14 04:08:49.297503'),(32,'extras','0004_populate_default_status_records','2025-04-14 04:08:49.527727'),(33,'extras','0005_configcontext_device_types','2025-04-14 04:08:49.646792'),(34,'extras','0006_graphqlquery','2025-04-14 04:08:49.664044'),(35,'extras','0007_configcontextschema','2025-04-14 04:08:49.881913'),(36,'virtualization','0002_virtualmachine_local_context_schema','2025-04-14 04:08:49.994629'),(37,'virtualization','0003_vminterface_verbose_name','2025-04-14 04:08:50.266471'),(38,'virtualization','0004_auto_slug','2025-04-14 04:08:50.339973'),(39,'virtualization','0005_add_natural_indexing','2025-04-14 04:08:50.520554'),(40,'extras','0008_jobresult__custom_field_data','2025-04-14 04:08:50.581902'),(41,'extras','0009_computedfield','2025-04-14 04:08:50.690984'),(42,'extras','0010_change_cf_validation_max_min_field_to_bigint','2025-04-14 04:08:50.841933'),(43,'extras','0011_fileattachment_fileproxy','2025-04-14 04:08:51.117186'),(44,'extras','0012_healthchecktestmodel','2025-04-14 04:08:51.129282'),(45,'extras','0013_default_fallback_value_computedfield','2025-04-14 04:08:51.166876'),(46,'extras','0014_auto_slug','2025-04-14 04:08:51.436490'),(47,'extras','0015_scheduled_job','2025-04-14 04:08:51.683501'),(48,'extras','0016_secret','2025-04-14 04:08:52.305601'),(49,'extras','0017_joblogentry','2025-04-14 04:08:52.412289'),(50,'extras','0018_joblog_data_migration','2025-04-14 04:08:52.485602'),(51,'extras','0019_joblogentry__meta_options__related_name','2025-04-14 04:08:52.566734'),(52,'extras','0020_customfield_changelog','2025-04-14 04:08:52.731884'),(53,'extras','0021_customfield_changelog_data','2025-04-14 04:08:53.054500'),(54,'extras','0022_objectchange_object_datav2','2025-04-14 04:08:53.114362'),(55,'extras','0023_job_model','2025-04-14 04:08:53.660391'),(56,'extras','0024_job_data_migration','2025-04-14 04:08:53.962025'),(57,'extras','0025_add_advanced_ui_boolean_to_customfield_conputedfield_and_relationship','2025-04-14 04:08:54.142314'),(58,'extras','0026_job_add_gitrepository_fk','2025-04-14 04:08:54.405390'),(59,'extras','0027_job_gitrepository_data_migration','2025-04-14 04:08:54.480273'),(60,'extras','0028_job_reduce_source','2025-04-14 04:08:54.564203'),(61,'extras','0029_dynamicgroup','2025-04-14 04:08:54.889669'),(62,'extras','0030_webhook_alter_unique_together','2025-04-14 04:08:54.944873'),(63,'extras','0031_tag_content_types','2025-04-14 04:08:55.066938'),(64,'extras','0032_tag_content_types_data_migration','2025-04-14 04:08:55.154617'),(65,'extras','0033_add__optimized_indexing','2025-04-14 04:08:56.254710'),(66,'virtualization','0006_vminterface_status','2025-04-14 04:08:56.394904'),(67,'virtualization','0007_vminterface_status_data_migration','2025-04-14 04:08:56.754534'),(68,'virtualization','0008_vminterface_parent','2025-04-14 04:08:56.971531'),(69,'extras','0034_alter_fileattachment_mimetype','2025-04-14 04:08:56.993436'),(70,'extras','0035_scheduledjob_crontab','2025-04-14 04:08:57.046389'),(71,'extras','0036_job_add_has_sensitive_variables','2025-04-14 04:08:57.225370'),(72,'extras','0037_configcontextschema__remove_name_unique__create_constraint_unique_name_owner','2025-04-14 04:08:57.333417'),(73,'dcim','0005_device_local_context_schema','2025-04-14 04:08:57.493785'),(74,'dcim','0006_auto_slug','2025-04-14 04:08:58.150304'),(75,'dcim','0007_device_secrets_group','2025-04-14 04:08:58.305170'),(76,'dcim','0008_increase_all_serial_lengths','2025-04-14 04:08:58.845861'),(77,'dcim','0009_add_natural_indexing','2025-04-14 04:09:01.613546'),(78,'dcim','0010_interface_status','2025-04-14 04:09:01.758083'),(79,'dcim','0011_interface_status_data_migration','2025-04-14 04:09:01.857898'),(80,'dcim','0012_interface_parent_bridge','2025-04-14 04:09:02.110326'),(81,'dcim','0013_location_location_type','2025-04-14 04:09:03.674428'),(82,'virtualization','0009_cluster_location','2025-04-14 04:09:04.017472'),(83,'virtualization','0010_vminterface_mac_address_data_migration','2025-04-14 04:09:04.099116'),(84,'virtualization','0011_alter_vminterface_mac_address','2025-04-14 04:09:04.174599'),(85,'extras','0038_configcontext_locations','2025-04-14 04:09:04.309811'),(86,'extras','0039_objectchange__add_change_context','2025-04-14 04:09:04.483767'),(87,'extras','0040_dynamicgroup__dynamicgroupmembership','2025-04-14 04:09:04.936644'),(88,'extras','0041_jobresult_job_kwargs','2025-04-14 04:09:05.010371'),(89,'extras','0042_job__add_is_job_hook_receiver','2025-04-14 04:09:05.100843'),(90,'extras','0043_note','2025-04-14 04:09:05.253944'),(91,'extras','0044_add_job_hook','2025-04-14 04:09:05.444980'),(92,'extras','0045_add_custom_field_slug','2025-04-14 04:09:05.511827'),(93,'extras','0046_populate_custom_field_slug_label','2025-04-14 04:09:05.594973'),(94,'extras','0047_enforce_custom_field_slug','2025-04-14 04:09:05.670266'),(95,'extras','0048_alter_objectchange_change_context_detail','2025-04-14 04:09:05.727324'),(96,'extras','0049_alter_tag_slug','2025-04-14 04:09:06.049465'),(97,'extras','0050_customfield_grouping','2025-04-14 04:09:06.120034'),(98,'extras','0051_add_job_task_queues','2025-04-14 04:09:06.313502'),(99,'dcim','0014_location_status_data_migration','2025-04-14 04:09:06.421014'),(100,'dcim','0015_device_components__changeloggedmodel','2025-04-14 04:09:09.356477'),(101,'dcim','0016_device_components__timestamp_data_migration','2025-04-14 04:09:09.451873'),(102,'dcim','0017_locationtype_nestable','2025-04-14 04:09:09.525349'),(103,'dcim','0018_device_redundancy_group','2025-04-14 04:09:10.028819'),(104,'extras','0052_configcontext_device_redundancy_groups','2025-04-14 04:09:10.172746'),(105,'extras','0053_relationship_required_on','2025-04-14 04:09:10.715130'),(106,'extras','0054_scheduledjob_kwargs_request_user_change','2025-04-14 04:09:10.801584'),(107,'extras','0055_configcontext_dynamic_groups','2025-04-14 04:09:10.949553'),(108,'extras','0056_objectchange_add_reverse_time_idx','2025-04-14 04:09:11.010929'),(109,'extras','0057_jobbutton','2025-04-14 04:09:11.283116'),(110,'extras','0058_jobresult_add_time_status_idxs','2025-04-14 04:09:11.912070'),(111,'extras','0059_joblogentry_scheduledjob_webhook_data_migration','2025-04-14 04:09:12.163138'),(112,'extras','0060_alter_joblogentry_scheduledjob_webhook_fields','2025-04-14 04:09:12.602256'),(113,'extras','0061_role_and_alter_status','2025-04-14 04:09:12.868399'),(114,'extras','0062_collect_roles_from_related_apps_roles','2025-04-14 04:09:13.004283'),(115,'virtualization','0012_alter_virtualmachine_role_add_new_role','2025-04-14 04:09:13.313113'),(116,'virtualization','0013_migrate_virtualmachine_role_data','2025-04-14 04:09:13.628735'),(117,'virtualization','0014_rename_virtualmachine_roles','2025-04-14 04:09:13.918101'),(118,'extras','0063_alter_role_options','2025-04-14 04:09:13.966031'),(119,'extras','0064_alter_configcontext_and_add_new_role','2025-04-14 04:09:14.202642'),(120,'extras','0065_configcontext_data_migrations','2025-04-14 04:09:14.519978'),(121,'extras','0066_rename_configcontext_role','2025-04-14 04:09:14.706589'),(122,'virtualization','0015_rename_foreignkey_fields','2025-04-14 04:09:15.920645'),(123,'ipam','0003_remove_max_length','2025-04-14 04:09:16.536333'),(124,'ipam','0004_fixup_p2p_broadcast','2025-04-14 04:09:16.629741'),(125,'ipam','0005_auto_slug','2025-04-14 04:09:16.673878'),(126,'ipam','0006_ipaddress_nat_outside_list','2025-04-14 04:09:16.888175'),(127,'ipam','0007_add_natural_indexing','2025-04-14 04:09:17.742380'),(128,'ipam','0008_prefix_vlan_vlangroup_location','2025-04-14 04:09:18.348436'),(129,'ipam','0009_alter_vlan_name','2025-04-14 04:09:18.465065'),(130,'ipam','0010_alter_ipam_role_add_new_role','2025-04-14 04:09:19.547979'),(131,'ipam','0011_migrate_ipam_role_data','2025-04-14 04:09:19.647004'),(132,'ipam','0012_rename_ipam_roles','2025-04-14 04:09:20.746424'),(133,'ipam','0013_delete_role','2025-04-14 04:09:20.755584'),(134,'ipam','0014_rename_foreign_keys_and_related_names','2025-04-14 04:09:21.346754'),(135,'ipam','0015_prefix_add_type','2025-04-14 04:09:21.445658'),(136,'dcim','0019_device_redundancy_group_data_migration','2025-04-14 04:09:21.553989'),(137,'dcim','0020_increase_device_asset_tag_size_limit','2025-04-14 04:09:21.721502'),(138,'dcim','0021_platform_network_driver','2025-04-14 04:09:21.778678'),(139,'dcim','0022_interface_redundancy_group','2025-04-14 04:09:22.873233'),(140,'dcim','0023_interface_redundancy_group_data_migration','2025-04-14 04:09:22.980744'),(141,'dcim','0024_move_site_fields_to_location_model','2025-04-14 04:09:24.476435'),(142,'dcim','0025_mptt_to_tree_queries','2025-04-14 04:09:25.924552'),(143,'dcim','0026_interface_mac_address_data_migration','2025-04-14 04:09:26.013612'),(144,'dcim','0027_alter_interface_mac_address','2025-04-14 04:09:26.155320'),(145,'dcim','0028_alter_device_and_rack_role_add_new_role','2025-04-14 04:09:27.490472'),(146,'dcim','0029_device_and_rack_roles_data_migrations','2025-04-14 04:09:27.584184'),(147,'dcim','0030_rename_device_and_rack_role','2025-04-14 04:09:28.546436'),(148,'dcim','0031_remove_device_role_and_rack_role','2025-04-14 04:09:28.561148'),(149,'dcim','0032_rename_foreignkey_fields','2025-04-14 04:09:29.724100'),(150,'circuits','0003_auto_slug','2025-04-14 04:09:29.780949'),(151,'circuits','0004_increase_provider_account_length','2025-04-14 04:09:29.852611'),(152,'circuits','0005_providernetwork','2025-04-14 04:09:30.862414'),(153,'circuits','0006_cache_circuit_terminations','2025-04-14 04:09:30.955509'),(154,'circuits','0007_circuitterminations_primary_model','2025-04-14 04:09:31.540206'),(155,'circuits','0008_add_natural_indexing','2025-04-14 04:09:31.607787'),(156,'circuits','0009_circuittermination_location','2025-04-14 04:09:31.758341'),(157,'dcim','0033_add_tree_managers_and_foreign_keys_pre_data_migration','2025-04-14 04:09:32.397720'),(158,'dcim','0034_migrate_region_and_site_data_to_locations','2025-04-14 04:09:32.493280'),(159,'virtualization','0016_remove_site_foreign_key_from_cluster_class','2025-04-14 04:09:32.636921'),(160,'virtualization','0017_created_datetime','2025-04-14 04:09:33.321206'),(161,'extras','0067_migrate_job_result_status','2025-04-14 04:09:33.420378'),(162,'extras','0068_jobresult__add_celery_fields','2025-04-14 04:09:35.488735'),(163,'extras','0069_created_datetime','2025-04-14 04:09:37.630173'),(164,'virtualization','0018_related_name_changes','2025-04-14 04:09:38.521701'),(165,'ipam','0016_prefix_type_data_migration','2025-04-14 04:09:38.868872'),(166,'ipam','0017_prefix_remove_is_pool','2025-04-14 04:09:38.951702'),(167,'tenancy','0002_auto_slug','2025-04-14 04:09:39.124456'),(168,'tenancy','0003_mptt_to_tree_queries','2025-04-14 04:09:39.333183'),(169,'tenancy','0004_change_tree_manager_on_tree_models','2025-04-14 04:09:39.348933'),(170,'tenancy','0005_rename_foreign_keys_and_related_names','2025-04-14 04:09:39.851954'),(171,'dcim','0035_rename_path_end_point_related_name','2025-04-14 04:09:40.643847'),(172,'dcim','0036_remove_site_foreign_key_from_dcim_models','2025-04-14 04:09:43.345316'),(173,'ipam','0018_remove_site_foreign_key_from_ipam_models','2025-04-14 04:09:44.187646'),(174,'ipam','0019_created_datetime','2025-04-14 04:09:45.178386'),(175,'ipam','0020_related_name_changes','2025-04-14 04:09:45.932593'),(176,'ipam','0021_prefix_add_rir_and_date_allocated','2025-04-14 04:09:46.499947'),(177,'ipam','0022_aggregate_to_prefix_data_migration','2025-04-14 04:09:46.603242'),(178,'ipam','0023_delete_aggregate','2025-04-14 04:09:46.616982'),(179,'extras','0070_remove_site_and_region_attributes_from_config_context','2025-04-14 04:09:46.823505'),(180,'django_celery_results','0001_initial','2025-04-14 04:09:46.849679'),(181,'django_celery_results','0002_add_task_name_args_kwargs','2025-04-14 04:09:46.905818'),(182,'django_celery_results','0003_auto_20181106_1101','2025-04-14 04:09:46.913859'),(183,'django_celery_results','0004_auto_20190516_0412','2025-04-14 04:09:46.997629'),(184,'django_celery_results','0005_taskresult_worker','2025-04-14 04:09:47.027838'),(185,'django_celery_results','0006_taskresult_date_created','2025-04-14 04:09:47.154755'),(186,'tenancy','0006_created_datetime','2025-04-14 04:09:47.676456'),(187,'dcim','0037_created_datetime','2025-04-14 04:09:51.133614'),(188,'dcim','0038_fixup_fks_and_related_names','2025-04-14 04:09:58.131656'),(189,'dcim','0039_related_name_changes','2025-04-14 04:10:00.030934'),(190,'circuits','0010_rename_foreign_keys_and_related_names','2025-04-14 04:10:00.795906'),(191,'circuits','0011_remove_site_foreign_key_from_circuit_termination_class','2025-04-14 04:10:00.931506'),(192,'dcim','0040_remove_region_and_site','2025-04-14 04:10:01.658231'),(193,'ipam','0024_interface_to_ipaddress_m2m','2025-04-14 04:10:01.827538'),(194,'virtualization','0019_vminterface_ip_addresses_m2m','2025-04-14 04:10:01.919258'),(195,'virtualization','0020_remove_clustergroup_clustertype_slug','2025-04-14 04:10:01.969283'),(196,'tenancy','0007_remove_tenant_tenantgroup_slug','2025-04-14 04:10:02.096613'),(197,'ipam','0025_interface_ipaddress_m2m_data_migration','2025-04-14 04:10:02.407151'),(198,'ipam','0026_ipaddress_remove_assigned_object','2025-04-14 04:10:02.671194'),(199,'ipam','0027_remove_rir_slug','2025-04-14 04:10:02.694752'),(200,'extras','0071_replace_related_names','2025-04-14 04:10:05.111131'),(201,'extras','0072_rename_model_fields','2025-04-14 04:10:05.838544'),(202,'extras','0073_job__unique_name_data_migration','2025-04-14 04:10:06.095595'),(203,'extras','0074_job__unique_name','2025-04-14 04:10:06.886133'),(204,'extras','0075_remove_gitrepository_fields','2025-04-14 04:10:07.014073'),(205,'extras','0076_rename_slug_to_key_for_custom_field','2025-04-14 04:10:07.392712'),(206,'extras','0077_migrate_custom_field_data','2025-04-14 04:10:07.495657'),(207,'extras','0078_remove_name_field_and_make_label_field_non_nullable','2025-04-14 04:10:07.671876'),(208,'dcim','0041_interface_ip_addresses_m2m','2025-04-14 04:10:07.765844'),(209,'dcim','0042_alter_location_managers','2025-04-14 04:10:07.821068'),(210,'dcim','0043_remove_slug','2025-04-14 04:10:07.959052'),(211,'circuits','0012_created_datetime','2025-04-14 04:10:08.575018'),(212,'circuits','0013_alter_circuittermination__path','2025-04-14 04:10:08.720202'),(213,'circuits','0014_related_name_changes','2025-04-14 04:10:08.809600'),(214,'circuits','0015_remove_circuittype_provider_slug','2025-04-14 04:10:08.894805'),(215,'extras','0079_remove_slug','2025-04-14 04:10:09.543534'),(216,'extras','0080_tagsfield','2025-04-14 04:10:09.809379'),(217,'extras','0081_rename_relationship_slug_to_key','2025-04-14 04:10:09.866879'),(218,'extras','0082_rename_relationship_name_to_label','2025-04-14 04:10:10.289657'),(219,'extras','0083_ensure_relationship_keys_are_unique','2025-04-14 04:10:10.377109'),(220,'extras','0084_rename_computed_field_slug_to_key','2025-04-14 04:10:10.472763'),(221,'circuits','0016_tagsfield','2025-04-14 04:10:11.098245'),(222,'circuits','0017_fixup_null_statuses','2025-04-14 04:10:11.187816'),(223,'circuits','0018_status_nonnullable','2025-04-14 04:10:11.343294'),(224,'circuits','0019_remove_providernetwork_slug','2025-04-14 04:10:11.411126'),(225,'circuits','0020_update_all_charfields_max_length_to_255','2025-04-14 04:10:12.296380'),(226,'database','0001_initial','2025-04-14 04:10:12.312224'),(227,'database','0002_auto_20190129_2304','2025-04-14 04:10:12.333557'),(228,'tenancy','0008_tagsfield','2025-04-14 04:10:12.421853'),(229,'tenancy','0009_update_all_charfields_max_length_to_255','2025-04-14 04:10:13.158196'),(230,'extras','0085_taggeditem_cleanup','2025-04-14 04:10:13.245155'),(231,'extras','0086_taggeditem_uniqueness','2025-04-14 04:10:13.631556'),(232,'extras','0087_job__celery_task_fields__dryrun_support','2025-04-14 04:10:14.767413'),(233,'extras','0088_job__commit_default_data_migration','2025-04-14 04:10:14.853722'),(234,'extras','0089_joblogentry__log_level_default','2025-04-14 04:10:14.868724'),(235,'extras','0090_joblogentry__log_level_data_migration','2025-04-14 04:10:14.957578'),(236,'extras','0091_scheduledjob__data_migration','2025-04-14 04:10:15.043516'),(237,'extras','0092_uniqueness_data_migration','2025-04-14 04:10:15.449852'),(238,'extras','0093_uniqueness_fixup','2025-04-14 04:10:16.055994'),(239,'extras','0094_alter_objectchange_unique_together','2025-04-14 04:10:16.118293'),(240,'extras','0095_ensure_note_timestamps_are_unique','2025-04-14 04:10:16.431845'),(241,'extras','0096_remove_slugs','2025-04-14 04:10:16.630156'),(242,'extras','0097_alter_job_result_remove_result','2025-04-14 04:10:16.697887'),(243,'extras','0098_rename_data_jobresult_result','2025-04-14 04:10:16.732937'),(244,'extras','0099_remove_dangling_note_objects','2025-04-14 04:10:16.817649'),(245,'extras','0100_fileproxy_job_result','2025-04-14 04:10:16.929894'),(246,'extras','0101_externalintegration','2025-04-14 04:10:17.048169'),(247,'extras','0102_set_null_objectchange_contenttype','2025-04-14 04:10:17.651661'),(248,'extras','0103_add_db_indexes_to_object_change','2025-04-14 04:10:17.946611'),(249,'extras','0104_contact_contactassociation_team','2025-04-14 04:10:18.670333'),(250,'extras','0105_update_all_charfields_max_length_to_255','2025-04-14 04:10:23.394807'),(251,'extras','0106_populate_default_statuses_and_roles_for_contact_associations','2025-04-14 04:10:23.519381'),(252,'dcim','0044_tagsfield','2025-04-14 04:10:26.131996'),(253,'dcim','0045_ipam__namespaces','2025-04-14 04:10:26.271059'),(254,'dcim','0046_fixup_null_statuses','2025-04-14 04:10:26.464878'),(255,'dcim','0047_status_nonnullable','2025-04-14 04:10:28.602299'),(256,'dcim','0048_ensure_virtual_chassis_names_are_unique_and_add_uniqueness_constraint','2025-04-14 04:10:28.774270'),(257,'dcim','0049_remove_slugs_and_change_device_primary_ip_fields','2025-04-14 04:10:30.068648'),(258,'dcim','0050_fix_interface_redundancy_group_association_created','2025-04-14 04:10:30.108256'),(259,'dcim','0051_interface_redundancy_group_nullable_status','2025-04-14 04:10:30.280867'),(260,'dcim','0052_fix_interface_redundancy_group_created','2025-04-14 04:10:30.950930'),(261,'dcim','0053_create_device_family_model','2025-04-14 04:10:31.174612'),(262,'dcim','0054_softwareimage_softwareversion','2025-04-14 04:10:32.725737'),(263,'dcim','0055_softwareimage_softwareversion_data_migration','2025-04-14 04:10:32.845241'),(264,'dcim','0056_update_all_charfields_max_length_to_255','2025-04-14 04:10:43.030511'),(265,'dcim','0057_controller_models','2025-04-14 04:10:43.663387'),(266,'dcim','0058_controller_data_migration','2025-04-14 04:10:44.158611'),(267,'django_celery_beat','0001_initial','2025-04-14 04:10:44.257857'),(268,'django_celery_beat','0002_auto_20161118_0346','2025-04-14 04:10:44.302629'),(269,'django_celery_beat','0003_auto_20161209_0049','2025-04-14 04:10:44.326311'),(270,'django_celery_beat','0004_auto_20170221_0000','2025-04-14 04:10:44.336893'),(271,'django_celery_beat','0005_add_solarschedule_events_choices','2025-04-14 04:10:44.347446'),(272,'django_celery_beat','0006_auto_20180322_0932','2025-04-14 04:10:44.445809'),(273,'django_celery_beat','0007_auto_20180521_0826','2025-04-14 04:10:44.500760'),(274,'django_celery_beat','0008_auto_20180914_1922','2025-04-14 04:10:44.538445'),(275,'django_celery_beat','0006_auto_20180210_1226','2025-04-14 04:10:44.559476'),(276,'django_celery_beat','0006_periodictask_priority','2025-04-14 04:10:44.594247'),(277,'django_celery_beat','0009_periodictask_headers','2025-04-14 04:10:44.628278'),(278,'django_celery_beat','0010_auto_20190429_0326','2025-04-14 04:10:44.845621'),(279,'django_celery_beat','0011_auto_20190508_0153','2025-04-14 04:10:44.894856'),(280,'django_celery_beat','0012_periodictask_expire_seconds','2025-04-14 04:10:44.931996'),(281,'django_celery_beat','0013_auto_20200609_0727','2025-04-14 04:10:44.944065'),(282,'django_celery_beat','0014_remove_clockedschedule_enabled','2025-04-14 04:10:44.964506'),(283,'django_celery_beat','0015_edit_solarschedule_events_choices','2025-04-14 04:10:44.975803'),(284,'django_celery_beat','0016_alter_crontabschedule_timezone','2025-04-14 04:10:44.986256'),(285,'django_celery_beat','0017_alter_crontabschedule_month_of_year','2025-04-14 04:10:44.997433'),(286,'django_celery_beat','0018_improve_crontab_helptext','2025-04-14 04:10:45.008504'),(287,'django_celery_results','0007_remove_taskresult_hidden','2025-04-14 04:10:45.033537'),(288,'django_celery_results','0008_chordcounter','2025-04-14 04:10:45.049484'),(289,'django_celery_results','0009_groupresult','2025-04-14 04:10:45.258443'),(290,'django_celery_results','0010_remove_duplicate_indices','2025-04-14 04:10:45.276600'),(291,'django_celery_results','0011_taskresult_periodic_task_name','2025-04-14 04:10:45.299549'),(292,'virtualization','0021_tagsfield_and_vminterface_to_primarymodel','2025-04-14 04:10:46.029512'),(293,'virtualization','0022_vminterface_timestamps_data_migration','2025-04-14 04:10:46.127298'),(294,'ipam','0028_tagsfield','2025-04-14 04:10:46.932489'),(295,'ipam','0029_ip_address_to_interface_uniqueness_constraints','2025-04-14 04:10:46.974464'),(296,'ipam','0030_ipam__namespaces','2025-04-14 04:10:49.705388'),(297,'virtualization','0023_ipam__namespaces','2025-04-14 04:10:49.841393'),(298,'virtualization','0024_fixup_null_statuses','2025-04-14 04:10:50.169773'),(299,'virtualization','0025_status_nonnullable','2025-04-14 04:10:50.546020'),(300,'ipam','0031_ipam___data_migrations','2025-04-14 04:10:50.792983'),(301,'ipam','0032_ipam__namespaces_finish','2025-04-14 04:10:52.394786'),(302,'ipam','0033_fixup_null_statuses','2025-04-14 04:10:52.505241'),(303,'ipam','0034_status_nonnullable','2025-04-14 04:10:53.353113'),(304,'ipam','0035_ensure_all_services_fit_uniqueness_constraint','2025-04-14 04:10:53.467011'),(305,'ipam','0036_add_uniqueness_constraints_to_service','2025-04-14 04:10:53.617411'),(306,'ipam','0037_data_migration_vlan_group_name_uniqueness','2025-04-14 04:10:53.975156'),(307,'ipam','0038_vlan_group_name_unique_remove_slug','2025-04-14 04:10:54.144029'),(308,'ipam','0039_alter_ipaddresstointerface_ip_address','2025-04-14 04:10:54.251087'),(309,'ipam','0040_vlan_prefix_locations','2025-04-14 04:10:54.986137'),(310,'ipam','0041_vlan_prefix_locations_data_migration','2025-04-14 04:10:55.100085'),(311,'ipam','0042_remove_location_from_vlan_and_prefix','2025-04-14 04:10:55.479202'),(312,'ipam','0043_fixup_null_ip_version','2025-04-14 04:10:55.831796'),(313,'ipam','0044_ip_version_nonnullable','2025-04-14 04:10:56.103057'),(314,'ipam','0045_alter_vlangroup_options','2025-04-14 04:10:56.134312'),(315,'ipam','0046_update_all_charfields_max_length_to_255','2025-04-14 04:10:57.732653'),(316,'sessions','0001_initial','2025-04-14 04:10:57.751255'),(317,'silk','0001_initial','2025-04-14 04:10:57.967063'),(318,'silk','0002_auto_update_uuid4_id_field','2025-04-14 04:10:57.989147'),(319,'silk','0003_request_prof_file','2025-04-14 04:10:58.023447'),(320,'silk','0004_request_prof_file_storage','2025-04-14 04:10:58.036227'),(321,'silk','0005_increase_request_prof_file_length','2025-04-14 04:10:58.059619'),(322,'silk','0006_fix_request_prof_file_blank','2025-04-14 04:10:58.107296'),(323,'silk','0007_sqlquery_identifier','2025-04-14 04:10:58.136733'),(324,'silk','0008_sqlquery_analysis','2025-04-14 04:10:58.161990'),(325,'default','0001_initial','2025-04-14 04:10:58.398792'),(326,'social_auth','0001_initial','2025-04-14 04:10:58.401606'),(327,'default','0002_add_related_name','2025-04-14 04:10:58.500288'),(328,'social_auth','0002_add_related_name','2025-04-14 04:10:58.502926'),(329,'default','0003_alter_email_max_length','2025-04-14 04:10:58.517485'),(330,'social_auth','0003_alter_email_max_length','2025-04-14 04:10:58.520040'),(331,'default','0004_auto_20160423_0400','2025-04-14 04:10:58.540132'),(332,'social_auth','0004_auto_20160423_0400','2025-04-14 04:10:58.543279'),(333,'social_auth','0005_auto_20160727_2333','2025-04-14 04:10:58.559604'),(334,'social_django','0006_partial','2025-04-14 04:10:58.837965'),(335,'social_django','0007_code_timestamp','2025-04-14 04:10:58.876764'),(336,'social_django','0008_partial_timestamp','2025-04-14 04:10:58.907676'),(337,'social_django','0009_auto_20191118_0520','2025-04-14 04:10:58.977516'),(338,'social_django','0010_uid_db_index','2025-04-14 04:10:59.004455'),(339,'social_django','0011_alter_id_fields','2025-04-14 04:10:59.132203'),(340,'taggit','0001_initial','2025-04-14 04:10:59.291252'),(341,'taggit','0002_auto_20150616_2121','2025-04-14 04:10:59.347592'),(342,'taggit','0003_taggeditem_add_unique_index','2025-04-14 04:10:59.405035'),(343,'taggit','0004_alter_taggeditem_content_type_alter_taggeditem_tag','2025-04-14 04:10:59.606465'),(344,'taggit','0005_auto_20220424_2025','2025-04-14 04:10:59.618891'),(345,'users','0002_token_ordering_by_created','2025-04-14 04:10:59.639523'),(346,'users','0003_alter_user_options','2025-04-14 04:10:59.659092'),(347,'users','0004_alter_user_managers','2025-04-14 04:10:59.934895'),(348,'users','0005_ensure_object_permission_names_are_unique','2025-04-14 04:11:00.041882'),(349,'users','0006_make_object_permission_name_globally_unique','2025-04-14 04:11:00.107357'),(350,'users','0007_alter_objectpermission_object_types','2025-04-14 04:11:00.209919'),(351,'users','0008_make_object_permission_a_changelogged_model','2025-04-14 04:11:00.359394'),(352,'users','0009_update_all_charfields_max_length_to_255','2025-04-14 04:11:00.504780'),(353,'virtualization','0026_change_virtualmachine_primary_ip_fields','2025-04-14 04:11:01.156616'),(354,'virtualization','0027_virtualmachine_software_image','2025-04-14 04:11:01.452355'),(355,'virtualization','0028_update_all_charfields_max_length_to_255','2025-04-14 04:11:02.662093'),(356,'social_django','0002_add_related_name','2025-04-14 04:11:02.670623'),(357,'social_django','0004_auto_20160423_0400','2025-04-14 04:11:02.673162'),(358,'social_django','0003_alter_email_max_length','2025-04-14 04:11:02.675682'),(359,'social_django','0005_auto_20160727_2333','2025-04-14 04:11:02.678045'),(360,'social_django','0001_initial','2025-04-14 04:11:02.680674');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `extras_dynamicgroup_content_type_id_1bed5de5_fk_django_co` (`content_type_id`),
  CONSTRAINT `extras_dynamicgroup_content_type_id_1bed5de5_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
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
  `approval_required` tinyint(1) NOT NULL,
  `soft_time_limit` double NOT NULL,
  `time_limit` double NOT NULL,
  `grouping_override` tinyint(1) NOT NULL,
  `name_override` tinyint(1) NOT NULL,
  `description_override` tinyint(1) NOT NULL,
  `dryrun_default_override` tinyint(1) NOT NULL,
  `hidden_override` tinyint(1) NOT NULL,
  `approval_required_override` tinyint(1) NOT NULL,
  `soft_time_limit_override` tinyint(1) NOT NULL,
  `time_limit_override` tinyint(1) NOT NULL,
  `has_sensitive_variables` tinyint(1) NOT NULL,
  `has_sensitive_variables_override` tinyint(1) NOT NULL,
  `is_job_hook_receiver` tinyint(1) NOT NULL,
  `task_queues` json NOT NULL DEFAULT (_utf8mb4'[]'),
  `task_queues_override` tinyint(1) NOT NULL,
  `is_job_button_receiver` tinyint(1) NOT NULL,
  `supports_dryrun` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_job_name_34d98c40_uniq` (`name`),
  UNIQUE KEY `extras_job_module_name_job_class_name_b531472b_uniq` (`module_name`,`job_class_name`),
  KEY `extras_job_module_name_912a3dda` (`module_name`),
  KEY `extras_job_job_class_name_d9c82b93` (`job_class_name`),
  KEY `extras_job_installed_9b043061` (`installed`),
  KEY `extras_job_hidden_f4b1d9d5` (`hidden`),
  KEY `extras_job_grouping_692d2dc2` (`grouping`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_job`
--

LOCK TABLES `extras_job` WRITE;
/*!40000 ALTER TABLE `extras_job` DISABLE KEYS */;
INSERT INTO `extras_job` VALUES ('74ad8d69eeb44b42b57082b5212069f0','2025-04-14 04:11:02.859772','2025-04-14 04:11:02.860712','{}','nautobot.core.jobs','ExportObjectList','System Jobs','Export Object List','',1,1,0,0,0,0,1800,2000,0,0,0,0,0,0,0,0,0,0,0,'[]',0,0,0),('80de3820e24e4febae2f3627260748ae','2025-04-14 04:11:02.865180','2025-04-14 04:11:02.865984','{}','nautobot.core.jobs','GitRepositorySync','System Jobs','Git Repository: Sync','',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'[]',0,0,0),('a2a27fac726e4fe3b82b59b9c1432eaa','2025-04-14 04:11:02.870184','2025-04-14 04:11:02.870993','{}','nautobot.core.jobs','GitRepositoryDryRun','System Jobs','Git Repository: Dry-Run','',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'[]',0,0,0),('fff4e3eabf3d43b0936c066489e6916a','2025-04-14 04:11:02.875385','2025-04-14 04:11:02.876288','{}','nautobot.core.jobs','ImportObjects','System Jobs','Import Objects','',1,1,0,0,0,0,1800,2000,0,0,0,0,0,0,0,0,0,0,0,'[]',0,0,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_jobbutton_content_types`
--

LOCK TABLES `extras_jobbutton_content_types` WRITE;
/*!40000 ALTER TABLE `extras_jobbutton_content_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_jobbutton_content_types` ENABLE KEYS */;
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
  KEY `extras_joblogentry_job_result_id_91e10d1a_fk_extras_jobresult_id` (`job_result_id`),
  KEY `extras_joblogentry_log_level_f8cfe898` (`log_level`),
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
  CONSTRAINT `extras_jobresult_job_model_id_d581ec7e_fk_extras_job_id` FOREIGN KEY (`job_model_id`) REFERENCES `extras_job` (`id`),
  CONSTRAINT `extras_jobresult_scheduled_job_id_0921f94c_fk_extras_sc` FOREIGN KEY (`scheduled_job_id`) REFERENCES `extras_scheduledjob` (`id`),
  CONSTRAINT `extras_jobresult_user_id_d35285ab_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
INSERT INTO `extras_role` VALUES ('26e057e4dc6343379ce0431478bcc507','2025-04-14 04:10:23.501978','2025-04-14 04:10:23.502005','{}','Administrative','2196f3','Unit plays an administrative role',NULL),('36ce6a3ff63c40568c3e7ea291cde06f','2025-04-14 00:00:00.000000','2025-04-14 04:09:12.980950','{}','VRRP','4caf50','',NULL),('3c7201c32d2a40839dec734918b1b27e','2025-04-14 00:00:00.000000','2025-04-14 04:09:12.984387','{}','GLBP','4caf50','',NULL),('50e1e28a65e1458fa5fcfe0a99694cf2','2025-04-14 00:00:00.000000','2025-04-14 04:09:12.986075','{}','CARP','4caf50','',NULL),('9788faa30f6c458584d9e79ca0a19844','2025-04-14 00:00:00.000000','2025-04-14 04:09:12.979361','{}','VIP','4caf50','',NULL),('b6163400d4e94eebb1afb8d720535bd8','2025-04-14 04:10:23.506194','2025-04-14 04:10:23.506214','{}','Billing','4caf50','Unit plays a billing role',NULL),('c00260680ad64b49aef0127de4e5d00a','2025-04-14 04:10:23.509888','2025-04-14 04:10:23.509911','{}','Support','ffeb3b','Unit plays a support role',NULL),('c82071b3b7024e4da477a207a25acd35','2025-04-14 04:10:23.514179','2025-04-14 04:10:23.514204','{}','On Site','111111','Unit plays an on site role',NULL),('c967e43e64034ba8aea0d4f2ba5f231d','2025-04-14 00:00:00.000000','2025-04-14 04:09:12.974149','{}','Loopback','9e9e9e','',NULL),('cb6cea23a9fd49b6859446c753b81ff5','2025-04-14 00:00:00.000000','2025-04-14 04:09:12.977564','{}','Anycast','ffc107','',NULL),('ceb96998378647c39031aca0c31fad6f','2025-04-14 00:00:00.000000','2025-04-14 04:09:12.982619','{}','HSRP','4caf50','',NULL),('e340752a176645a7aefa2d177e02e179','2025-04-14 00:00:00.000000','2025-04-14 04:09:12.975859','{}','Secondary','2196f3','',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_role_content_types`
--

LOCK TABLES `extras_role_content_types` WRITE;
/*!40000 ALTER TABLE `extras_role_content_types` DISABLE KEYS */;
INSERT INTO `extras_role_content_types` VALUES (9,'26e057e4dc6343379ce0431478bcc507',23),(8,'36ce6a3ff63c40568c3e7ea291cde06f',6),(3,'3c7201c32d2a40839dec734918b1b27e',6),(2,'50e1e28a65e1458fa5fcfe0a99694cf2',6),(7,'9788faa30f6c458584d9e79ca0a19844',6),(10,'b6163400d4e94eebb1afb8d720535bd8',23),(11,'c00260680ad64b49aef0127de4e5d00a',23),(12,'c82071b3b7024e4da477a207a25acd35',23),(5,'c967e43e64034ba8aea0d4f2ba5f231d',6),(1,'cb6cea23a9fd49b6859446c753b81ff5',6),(4,'ceb96998378647c39031aca0c31fad6f',6),(6,'e340752a176645a7aefa2d177e02e179',6);
/*!40000 ALTER TABLE `extras_role_content_types` ENABLE KEYS */;
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
  `queue` varchar(255) NOT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `approval_required` tinyint(1) NOT NULL,
  `approved_at` datetime(6) DEFAULT NULL,
  `approved_by_user_id` char(32) DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  `job_model_id` char(32) DEFAULT NULL,
  `crontab` varchar(255) NOT NULL,
  `celery_kwargs` json NOT NULL DEFAULT (_utf8mb4'{}'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_scheduledjob_name_fcea52d7_uniq` (`name`),
  KEY `extras_scheduledjob_approved_by_user_id_06b8fb0a_fk_auth_user_id` (`approved_by_user_id`),
  KEY `extras_scheduledjob_user_id_4d8034ff_fk_auth_user_id` (`user_id`),
  KEY `extras_scheduledjob_job_model_id_d4c0711e_fk_extras_job_id` (`job_model_id`),
  KEY `extras_scheduledjob_queue_681f2627` (`queue`),
  KEY `extras_scheduledjob_task_7eaf2d6d` (`task`),
  CONSTRAINT `extras_scheduledjob_approved_by_user_id_06b8fb0a_fk_auth_user_id` FOREIGN KEY (`approved_by_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `extras_scheduledjob_job_model_id_d4c0711e_fk_extras_job_id` FOREIGN KEY (`job_model_id`) REFERENCES `extras_job` (`id`),
  CONSTRAINT `extras_scheduledjob_user_id_4d8034ff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `extras_scheduledjob_chk_1` CHECK ((`total_run_count` >= 0))
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
INSERT INTO `extras_status` VALUES ('100fc8b73b80471e979449beee035904','2025-04-14 00:00:00.000000','2025-04-14 04:08:49.379234','{}','Provisioning','2196f3','Circuit is being provisioned'),('368a8fc7f6d74accb4912a1d523160b4','2025-04-14 00:00:00.000000','2025-04-14 04:09:06.405752','{}','Staging','2196f3','Location is in the process of being staged'),('3fc6399bd6e14d5c9b0676ad2acc93a1','2025-04-14 00:00:00.000000','2025-04-14 04:08:49.461107','{}','Available','4caf50','Unit is available'),('57069fb1ea2d4e3a8616c55981b17bab','2025-04-14 00:00:00.000000','2025-04-14 04:09:06.415703','{}','Retired','f44336','Location has been retired'),('5e5d09edfab248f69eb184ff20e7a6a6','2025-04-14 00:00:00.000000','2025-04-14 04:08:49.401853','{}','Connected','4caf50','Cable is connected'),('67ac9bd3c8164018aa9824a924a3c56f','2025-04-14 00:00:00.000000','2025-04-14 04:08:49.456132','{}','Reserved','00bcd4','Unit is reserved'),('684e88e9e65c40dd8ea76a4038fca30b','2025-04-14 00:00:00.000000','2025-04-14 04:08:49.391528','{}','Deprovisioning','ffc107','Circuit is being deprovisioned'),('69d94e12319847648b890cc937fb3938','2025-04-14 00:00:00.000000','2025-04-14 04:08:49.383313','{}','Active','4caf50','Unit is active'),('7f275f03496340e39ed3707adf453eda','2025-04-14 04:10:23.494324','2025-04-14 04:10:23.494355','{}','Secondary','ffeb3b','Unit is secondary'),('8e6a694c6ced45569936f5432715bdeb','2025-04-14 04:10:23.488981','2025-04-14 04:10:23.489015','{}','Primary','2196f3','Unit is primary'),('8fcc755347244d27901ec1d866e7142c','2025-04-14 00:00:00.000000','2025-04-14 04:08:49.470966','{}','Deprecated','f44336','Unit has been deprecated'),('957c9843e7614246bc8a3898032b5055','2025-04-14 00:00:00.000000','2025-04-14 04:08:49.372958','{}','Planned','00bcd4','Unit has been planned'),('9d11aedb243845beba8d3ab367155ac2','2025-04-14 00:00:00.000000','2025-04-14 04:08:49.387648','{}','Offline','ffc107','Unit is offline'),('9e26124274c84a92acdbd66e419bc483','2025-04-14 04:10:32.829003','2025-04-14 04:10:32.829024','{}','End-of-Life','f44336','Unit has reached end-of-life'),('b9d95310d2924b469a9117540060daf5','2025-04-14 00:00:00.000000','2025-04-14 04:08:49.395432','{}','Decommissioned','9e9e9e','Circuit has been decommissioned'),('bb82778ec8354df6a37f5acdb5da42bd','2025-04-14 00:00:00.000000','2025-04-14 04:08:49.432094','{}','Inventory','9e9e9e','Device is in inventory'),('c545a75c452142c7b4e1e568e744a0f2','2025-04-14 00:00:00.000000','2025-04-14 04:08:49.424324','{}','Staged','2196f3','Unit has been staged'),('ca0b8a0f0c5c4d46843645af9bec5208','2025-04-14 00:00:00.000000','2025-04-14 04:08:49.408872','{}','Decommissioning','ffc107','Unit is being decommissioned'),('d124905398904780bf5ee5a40fa0b2f0','2025-04-14 04:10:32.825126','2025-04-14 04:10:32.825157','{}','Extended Support','00bcd4','Software is in extended support'),('d8ab675e57d44b39be1c16081e871154','2025-04-14 00:00:00.000000','2025-04-14 04:08:56.744491','{}','Maintenance','9e9e9e','Unit is under maintenance'),('fe781b7c60a848cea1814a9ebd84adab','2025-04-14 00:00:00.000000','2025-04-14 04:08:49.428329','{}','Failed','f44336','Unit has failed');
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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_status_content_types`
--

LOCK TABLES `extras_status_content_types` WRITE;
/*!40000 ALTER TABLE `extras_status_content_types` DISABLE KEYS */;
INSERT INTO `extras_status_content_types` VALUES (2,'100fc8b73b80471e979449beee035904',1),(52,'368a8fc7f6d74accb4912a1d523160b4',14),(57,'368a8fc7f6d74accb4912a1d523160b4',19),(62,'368a8fc7f6d74accb4912a1d523160b4',20),(22,'3fc6399bd6e14d5c9b0676ad2acc93a1',5),(55,'57069fb1ea2d4e3a8616c55981b17bab',14),(60,'57069fb1ea2d4e3a8616c55981b17bab',19),(65,'57069fb1ea2d4e3a8616c55981b17bab',20),(7,'5e5d09edfab248f69eb184ff20e7a6a6',2),(21,'67ac9bd3c8164018aa9824a924a3c56f',5),(27,'67ac9bd3c8164018aa9824a924a3c56f',6),(30,'67ac9bd3c8164018aa9824a924a3c56f',7),(33,'67ac9bd3c8164018aa9824a924a3c56f',8),(5,'684e88e9e65c40dd8ea76a4038fca30b',1),(3,'69d94e12319847648b890cc937fb3938',1),(11,'69d94e12319847648b890cc937fb3938',3),(18,'69d94e12319847648b890cc937fb3938',4),(24,'69d94e12319847648b890cc937fb3938',5),(26,'69d94e12319847648b890cc937fb3938',6),(29,'69d94e12319847648b890cc937fb3938',7),(32,'69d94e12319847648b890cc937fb3938',8),(36,'69d94e12319847648b890cc937fb3938',9),(42,'69d94e12319847648b890cc937fb3938',12),(48,'69d94e12319847648b890cc937fb3938',13),(53,'69d94e12319847648b890cc937fb3938',14),(58,'69d94e12319847648b890cc937fb3938',19),(63,'69d94e12319847648b890cc937fb3938',20),(68,'69d94e12319847648b890cc937fb3938',23),(69,'69d94e12319847648b890cc937fb3938',24),(72,'69d94e12319847648b890cc937fb3938',25),(76,'69d94e12319847648b890cc937fb3938',26),(67,'7f275f03496340e39ed3707adf453eda',23),(66,'8e6a694c6ced45569936f5432715bdeb',23),(25,'8fcc755347244d27901ec1d866e7142c',5),(28,'8fcc755347244d27901ec1d866e7142c',6),(31,'8fcc755347244d27901ec1d866e7142c',7),(34,'8fcc755347244d27901ec1d866e7142c',8),(1,'957c9843e7614246bc8a3898032b5055',1),(8,'957c9843e7614246bc8a3898032b5055',2),(12,'957c9843e7614246bc8a3898032b5055',3),(19,'957c9843e7614246bc8a3898032b5055',4),(23,'957c9843e7614246bc8a3898032b5055',5),(37,'957c9843e7614246bc8a3898032b5055',9),(45,'957c9843e7614246bc8a3898032b5055',12),(46,'957c9843e7614246bc8a3898032b5055',13),(51,'957c9843e7614246bc8a3898032b5055',14),(56,'957c9843e7614246bc8a3898032b5055',19),(61,'957c9843e7614246bc8a3898032b5055',20),(77,'957c9843e7614246bc8a3898032b5055',26),(4,'9d11aedb243845beba8d3ab367155ac2',1),(10,'9d11aedb243845beba8d3ab367155ac2',3),(17,'9d11aedb243845beba8d3ab367155ac2',4),(35,'9d11aedb243845beba8d3ab367155ac2',9),(75,'9d11aedb243845beba8d3ab367155ac2',26),(71,'9e26124274c84a92acdbd66e419bc483',24),(74,'9e26124274c84a92acdbd66e419bc483',25),(6,'b9d95310d2924b469a9117540060daf5',1),(15,'bb82778ec8354df6a37f5acdb5da42bd',3),(80,'bb82778ec8354df6a37f5acdb5da42bd',26),(13,'c545a75c452142c7b4e1e568e744a0f2',3),(38,'c545a75c452142c7b4e1e568e744a0f2',9),(78,'c545a75c452142c7b4e1e568e744a0f2',26),(9,'ca0b8a0f0c5c4d46843645af9bec5208',2),(16,'ca0b8a0f0c5c4d46843645af9bec5208',3),(40,'ca0b8a0f0c5c4d46843645af9bec5208',9),(43,'ca0b8a0f0c5c4d46843645af9bec5208',12),(49,'ca0b8a0f0c5c4d46843645af9bec5208',13),(54,'ca0b8a0f0c5c4d46843645af9bec5208',14),(59,'ca0b8a0f0c5c4d46843645af9bec5208',19),(64,'ca0b8a0f0c5c4d46843645af9bec5208',20),(81,'ca0b8a0f0c5c4d46843645af9bec5208',26),(70,'d124905398904780bf5ee5a40fa0b2f0',24),(73,'d124905398904780bf5ee5a40fa0b2f0',25),(44,'d8ab675e57d44b39be1c16081e871154',12),(50,'d8ab675e57d44b39be1c16081e871154',13),(14,'fe781b7c60a848cea1814a9ebd84adab',3),(20,'fe781b7c60a848cea1814a9ebd84adab',4),(39,'fe781b7c60a848cea1814a9ebd84adab',9),(41,'fe781b7c60a848cea1814a9ebd84adab',12),(47,'fe781b7c60a848cea1814a9ebd84adab',13),(79,'fe781b7c60a848cea1814a9ebd84adab',26);
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
  KEY `extras_taggeditem_content_type_id_object_id_80e28e23_idx` (`content_type_id`,`object_id`),
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ipam_namespace_location_id_0ee18237_fk_dcim_location_id` (`location_id`),
  CONSTRAINT `ipam_namespace_location_id_0ee18237_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_namespace`
--

LOCK TABLES `ipam_namespace` WRITE;
/*!40000 ALTER TABLE `ipam_namespace` DISABLE KEYS */;
INSERT INTO `ipam_namespace` VALUES ('115bd92dec4e430aabf7c53c8b3e7cf8','2025-04-14 04:10:47.709221','2025-04-14 04:10:47.709253','{}','Global','Default Global namespace. Created by Nautobot.',NULL);
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
  KEY `ipam_prefix_network_broadcast_prefix_length_cac86426_idx` (`network`,`broadcast`,`prefix_length`),
  KEY `ipam_prefix_namespace_id_network_broa_a2f7797d_idx` (`namespace_id`,`network`,`broadcast`,`prefix_length`),
  KEY `ipam_prefix_ip_version_85fe83ba` (`ip_version`),
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_vrf_namespace_id_rd_ddfc14fc_uniq` (`namespace_id`,`rd`),
  KEY `ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `ipam_vrf_name_bf7146b0` (`name`),
  CONSTRAINT `ipam_vrf_namespace_id_8835a4df_fk_ipam_namespace_id` FOREIGN KEY (`namespace_id`) REFERENCES `ipam_namespace` (`id`),
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_vrfdeviceassignment_vrf_id_device_id_6c9f7b7d_uniq` (`vrf_id`,`device_id`),
  UNIQUE KEY `ipam_vrfdeviceassignment_vrf_id_virtual_machine_id_0799c2cc_uniq` (`vrf_id`,`virtual_machine_id`),
  KEY `ipam_vrfdeviceassignment_device_id_b79a12ce_fk_dcim_device_id` (`device_id`),
  KEY `ipam_vrfdeviceassign_virtual_machine_id_2b9c3e80_fk_virtualiz` (`virtual_machine_id`),
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
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
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
  `extra_data` longtext NOT NULL,
  `user_id` char(32) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `taggit_taggeditem_content_type_id_object_id_196cc965_idx` (`content_type_id`,`object_id`),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_objectpermission_groups`
--

LOCK TABLES `users_objectpermission_groups` WRITE;
/*!40000 ALTER TABLE `users_objectpermission_groups` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_objectpermission_object_types`
--

LOCK TABLES `users_objectpermission_object_types` WRITE;
/*!40000 ALTER TABLE `users_objectpermission_object_types` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtualization_vminterface_virtual_machine_id_name_cfb9c423_uniq` (`virtual_machine_id`,`name`),
  KEY `virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan` (`untagged_vlan_id`),
  KEY `virtualization_vminterface__name_0052e83a` (`_name`),
  KEY `virtualization_vminterface_name_8b75a799` (`name`),
  KEY `virtualization_vminterface_status_id_5f9104d8` (`status_id`),
  KEY `virtualization_vmint_parent_interface_id_3532b142_fk_virtualiz` (`parent_interface_id`),
  KEY `virtualization_vmint_bridge_id_7462b91e_fk_virtualiz` (`bridge_id`),
  KEY `virtualization_vminterface_vrf_id_4b570a8c_fk_ipam_vrf_id` (`vrf_id`),
  CONSTRAINT `virtualization_vmint_bridge_id_7462b91e_fk_virtualiz` FOREIGN KEY (`bridge_id`) REFERENCES `virtualization_vminterface` (`id`),
  CONSTRAINT `virtualization_vmint_parent_interface_id_3532b142_fk_virtualiz` FOREIGN KEY (`parent_interface_id`) REFERENCES `virtualization_vminterface` (`id`),
  CONSTRAINT `virtualization_vmint_status_id_5f9104d8_fk_extras_st` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan` FOREIGN KEY (`untagged_vlan_id`) REFERENCES `ipam_vlan` (`id`),
  CONSTRAINT `virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz` FOREIGN KEY (`virtual_machine_id`) REFERENCES `virtualization_virtualmachine` (`id`),
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-14  4:11:05
