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
) ENGINE=InnoDB AUTO_INCREMENT=475 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',23,'add_permission'),(2,'Can change permission',23,'change_permission'),(3,'Can delete permission',23,'delete_permission'),(4,'Can view permission',23,'view_permission'),(5,'Can add group',24,'add_group'),(6,'Can change group',24,'change_group'),(7,'Can delete group',24,'delete_group'),(8,'Can view group',24,'view_group'),(9,'Can change config',25,'change_config'),(10,'Can view config',25,'view_config'),(11,'Can add content type',26,'add_contenttype'),(12,'Can change content type',26,'change_contenttype'),(13,'Can delete content type',26,'delete_contenttype'),(14,'Can view content type',26,'view_contenttype'),(15,'Can add session',27,'add_session'),(16,'Can change session',27,'change_session'),(17,'Can delete session',27,'delete_session'),(18,'Can view session',27,'view_session'),(19,'Can add association',28,'add_association'),(20,'Can change association',28,'change_association'),(21,'Can delete association',28,'delete_association'),(22,'Can view association',28,'view_association'),(23,'Can add code',29,'add_code'),(24,'Can change code',29,'change_code'),(25,'Can delete code',29,'delete_code'),(26,'Can view code',29,'view_code'),(27,'Can add nonce',30,'add_nonce'),(28,'Can change nonce',30,'change_nonce'),(29,'Can delete nonce',30,'delete_nonce'),(30,'Can view nonce',30,'view_nonce'),(31,'Can add user social auth',31,'add_usersocialauth'),(32,'Can change user social auth',31,'change_usersocialauth'),(33,'Can delete user social auth',31,'delete_usersocialauth'),(34,'Can view user social auth',31,'view_usersocialauth'),(35,'Can add partial',32,'add_partial'),(36,'Can change partial',32,'change_partial'),(37,'Can delete partial',32,'delete_partial'),(38,'Can view partial',32,'view_partial'),(39,'Can add tag',33,'add_tag'),(40,'Can change tag',33,'change_tag'),(41,'Can delete tag',33,'delete_tag'),(42,'Can view tag',33,'view_tag'),(43,'Can add tagged item',34,'add_taggeditem'),(44,'Can change tagged item',34,'change_taggeditem'),(45,'Can delete tagged item',34,'delete_taggeditem'),(46,'Can view tagged item',34,'view_taggeditem'),(47,'Can add log entry',35,'add_logentry'),(48,'Can change log entry',35,'change_logentry'),(49,'Can delete log entry',35,'delete_logentry'),(50,'Can view log entry',35,'view_logentry'),(51,'Can add crontab',36,'add_crontabschedule'),(52,'Can change crontab',36,'change_crontabschedule'),(53,'Can delete crontab',36,'delete_crontabschedule'),(54,'Can view crontab',36,'view_crontabschedule'),(55,'Can add interval',37,'add_intervalschedule'),(56,'Can change interval',37,'change_intervalschedule'),(57,'Can delete interval',37,'delete_intervalschedule'),(58,'Can view interval',37,'view_intervalschedule'),(59,'Can add periodic task',38,'add_periodictask'),(60,'Can change periodic task',38,'change_periodictask'),(61,'Can delete periodic task',38,'delete_periodictask'),(62,'Can view periodic task',38,'view_periodictask'),(63,'Can add periodic tasks',39,'add_periodictasks'),(64,'Can change periodic tasks',39,'change_periodictasks'),(65,'Can delete periodic tasks',39,'delete_periodictasks'),(66,'Can view periodic tasks',39,'view_periodictasks'),(67,'Can add solar event',40,'add_solarschedule'),(68,'Can change solar event',40,'change_solarschedule'),(69,'Can delete solar event',40,'delete_solarschedule'),(70,'Can view solar event',40,'view_solarschedule'),(71,'Can add clocked',41,'add_clockedschedule'),(72,'Can change clocked',41,'change_clockedschedule'),(73,'Can delete clocked',41,'delete_clockedschedule'),(74,'Can view clocked',41,'view_clockedschedule'),(75,'Can add task result',42,'add_taskresult'),(76,'Can change task result',42,'change_taskresult'),(77,'Can delete task result',42,'delete_taskresult'),(78,'Can view task result',42,'view_taskresult'),(79,'Can add chord counter',43,'add_chordcounter'),(80,'Can change chord counter',43,'change_chordcounter'),(81,'Can delete chord counter',43,'delete_chordcounter'),(82,'Can view chord counter',43,'view_chordcounter'),(83,'Can add group result',44,'add_groupresult'),(84,'Can change group result',44,'change_groupresult'),(85,'Can delete group result',44,'delete_groupresult'),(86,'Can view group result',44,'view_groupresult'),(87,'Can add circuit',1,'add_circuit'),(88,'Can change circuit',1,'change_circuit'),(89,'Can delete circuit',1,'delete_circuit'),(90,'Can view circuit',1,'view_circuit'),(91,'Can add circuit termination',45,'add_circuittermination'),(92,'Can change circuit termination',45,'change_circuittermination'),(93,'Can delete circuit termination',45,'delete_circuittermination'),(94,'Can view circuit termination',45,'view_circuittermination'),(95,'Can add circuit type',46,'add_circuittype'),(96,'Can change circuit type',46,'change_circuittype'),(97,'Can delete circuit type',46,'delete_circuittype'),(98,'Can view circuit type',46,'view_circuittype'),(99,'Can add provider',47,'add_provider'),(100,'Can change provider',47,'change_provider'),(101,'Can delete provider',47,'delete_provider'),(102,'Can view provider',47,'view_provider'),(103,'Can add provider network',48,'add_providernetwork'),(104,'Can change provider network',48,'change_providernetwork'),(105,'Can delete provider network',48,'delete_providernetwork'),(106,'Can view provider network',48,'view_providernetwork'),(107,'Can add cable',2,'add_cable'),(108,'Can change cable',2,'change_cable'),(109,'Can delete cable',2,'delete_cable'),(110,'Can view cable',2,'view_cable'),(111,'Can add cable path',49,'add_cablepath'),(112,'Can change cable path',49,'change_cablepath'),(113,'Can delete cable path',49,'delete_cablepath'),(114,'Can view cable path',49,'view_cablepath'),(115,'Can add console port',50,'add_consoleport'),(116,'Can change console port',50,'change_consoleport'),(117,'Can delete console port',50,'delete_consoleport'),(118,'Can view console port',50,'view_consoleport'),(119,'Can add console port template',51,'add_consoleporttemplate'),(120,'Can change console port template',51,'change_consoleporttemplate'),(121,'Can delete console port template',51,'delete_consoleporttemplate'),(122,'Can view console port template',51,'view_consoleporttemplate'),(123,'Can add console server port',52,'add_consoleserverport'),(124,'Can change console server port',52,'change_consoleserverport'),(125,'Can delete console server port',52,'delete_consoleserverport'),(126,'Can view console server port',52,'view_consoleserverport'),(127,'Can add console server port template',53,'add_consoleserverporttemplate'),(128,'Can change console server port template',53,'change_consoleserverporttemplate'),(129,'Can delete console server port template',53,'delete_consoleserverporttemplate'),(130,'Can view console server port template',53,'view_consoleserverporttemplate'),(131,'Can add device',3,'add_device'),(132,'Can change device',3,'change_device'),(133,'Can delete device',3,'delete_device'),(134,'Can view device',3,'view_device'),(135,'Can add device bay',54,'add_devicebay'),(136,'Can change device bay',54,'change_devicebay'),(137,'Can delete device bay',54,'delete_devicebay'),(138,'Can view device bay',54,'view_devicebay'),(139,'Can add device bay template',55,'add_devicebaytemplate'),(140,'Can change device bay template',55,'change_devicebaytemplate'),(141,'Can delete device bay template',55,'delete_devicebaytemplate'),(142,'Can view device bay template',55,'view_devicebaytemplate'),(143,'Can add device type',56,'add_devicetype'),(144,'Can change device type',56,'change_devicetype'),(145,'Can delete device type',56,'delete_devicetype'),(146,'Can view device type',56,'view_devicetype'),(147,'Can add front port',57,'add_frontport'),(148,'Can change front port',57,'change_frontport'),(149,'Can delete front port',57,'delete_frontport'),(150,'Can view front port',57,'view_frontport'),(151,'Can add front port template',58,'add_frontporttemplate'),(152,'Can change front port template',58,'change_frontporttemplate'),(153,'Can delete front port template',58,'delete_frontporttemplate'),(154,'Can view front port template',58,'view_frontporttemplate'),(155,'Can add interface',13,'add_interface'),(156,'Can change interface',13,'change_interface'),(157,'Can delete interface',13,'delete_interface'),(158,'Can view interface',13,'view_interface'),(159,'Can add interface template',59,'add_interfacetemplate'),(160,'Can change interface template',59,'change_interfacetemplate'),(161,'Can delete interface template',59,'delete_interfacetemplate'),(162,'Can view interface template',59,'view_interfacetemplate'),(163,'Can add inventory item',60,'add_inventoryitem'),(164,'Can change inventory item',60,'change_inventoryitem'),(165,'Can delete inventory item',60,'delete_inventoryitem'),(166,'Can view inventory item',60,'view_inventoryitem'),(167,'Can add manufacturer',61,'add_manufacturer'),(168,'Can change manufacturer',61,'change_manufacturer'),(169,'Can delete manufacturer',61,'delete_manufacturer'),(170,'Can view manufacturer',61,'view_manufacturer'),(171,'Can add platform',62,'add_platform'),(172,'Can change platform',62,'change_platform'),(173,'Can delete platform',62,'delete_platform'),(174,'Can view platform',62,'view_platform'),(175,'Can add power feed',4,'add_powerfeed'),(176,'Can change power feed',4,'change_powerfeed'),(177,'Can delete power feed',4,'delete_powerfeed'),(178,'Can view power feed',4,'view_powerfeed'),(179,'Can add power outlet',63,'add_poweroutlet'),(180,'Can change power outlet',63,'change_poweroutlet'),(181,'Can delete power outlet',63,'delete_poweroutlet'),(182,'Can view power outlet',63,'view_poweroutlet'),(183,'Can add power outlet template',64,'add_poweroutlettemplate'),(184,'Can change power outlet template',64,'change_poweroutlettemplate'),(185,'Can delete power outlet template',64,'delete_poweroutlettemplate'),(186,'Can view power outlet template',64,'view_poweroutlettemplate'),(187,'Can add power panel',65,'add_powerpanel'),(188,'Can change power panel',65,'change_powerpanel'),(189,'Can delete power panel',65,'delete_powerpanel'),(190,'Can view power panel',65,'view_powerpanel'),(191,'Can add power port',66,'add_powerport'),(192,'Can change power port',66,'change_powerport'),(193,'Can delete power port',66,'delete_powerport'),(194,'Can view power port',66,'view_powerport'),(195,'Can add power port template',67,'add_powerporttemplate'),(196,'Can change power port template',67,'change_powerporttemplate'),(197,'Can delete power port template',67,'delete_powerporttemplate'),(198,'Can view power port template',67,'view_powerporttemplate'),(199,'Can add rack',5,'add_rack'),(200,'Can change rack',5,'change_rack'),(201,'Can delete rack',5,'delete_rack'),(202,'Can view rack',5,'view_rack'),(203,'Can add rack group',68,'add_rackgroup'),(204,'Can change rack group',68,'change_rackgroup'),(205,'Can delete rack group',68,'delete_rackgroup'),(206,'Can view rack group',68,'view_rackgroup'),(207,'Can add rack reservation',69,'add_rackreservation'),(208,'Can change rack reservation',69,'change_rackreservation'),(209,'Can delete rack reservation',69,'delete_rackreservation'),(210,'Can view rack reservation',69,'view_rackreservation'),(211,'Can add rear port',70,'add_rearport'),(212,'Can change rear port',70,'change_rearport'),(213,'Can delete rear port',70,'delete_rearport'),(214,'Can view rear port',70,'view_rearport'),(215,'Can add rear port template',71,'add_rearporttemplate'),(216,'Can change rear port template',71,'change_rearporttemplate'),(217,'Can delete rear port template',71,'delete_rearporttemplate'),(218,'Can view rear port template',71,'view_rearporttemplate'),(219,'Can add virtual chassis',72,'add_virtualchassis'),(220,'Can change virtual chassis',72,'change_virtualchassis'),(221,'Can delete virtual chassis',72,'delete_virtualchassis'),(222,'Can view virtual chassis',72,'view_virtualchassis'),(223,'Can add location type',73,'add_locationtype'),(224,'Can change location type',73,'change_locationtype'),(225,'Can delete location type',73,'delete_locationtype'),(226,'Can view location type',73,'view_locationtype'),(227,'Can add location',14,'add_location'),(228,'Can change location',14,'change_location'),(229,'Can delete location',14,'delete_location'),(230,'Can view location',14,'view_location'),(231,'Can add device redundancy group',19,'add_deviceredundancygroup'),(232,'Can change device redundancy group',19,'change_deviceredundancygroup'),(233,'Can delete device redundancy group',19,'delete_deviceredundancygroup'),(234,'Can view device redundancy group',19,'view_deviceredundancygroup'),(235,'Can add interface redundancy group',20,'add_interfaceredundancygroup'),(236,'Can change interface redundancy group',20,'change_interfaceredundancygroup'),(237,'Can delete interface redundancy group',20,'delete_interfaceredundancygroup'),(238,'Can view interface redundancy group',20,'view_interfaceredundancygroup'),(239,'Can add interface redundancy group association',74,'add_interfaceredundancygroupassociation'),(240,'Can change interface redundancy group association',74,'change_interfaceredundancygroupassociation'),(241,'Can delete interface redundancy group association',74,'delete_interfaceredundancygroupassociation'),(242,'Can view interface redundancy group association',74,'view_interfaceredundancygroupassociation'),(243,'Can add IP address',6,'add_ipaddress'),(244,'Can change IP address',6,'change_ipaddress'),(245,'Can delete IP address',6,'delete_ipaddress'),(246,'Can view IP address',6,'view_ipaddress'),(247,'Can add prefix',7,'add_prefix'),(248,'Can change prefix',7,'change_prefix'),(249,'Can delete prefix',7,'delete_prefix'),(250,'Can view prefix',7,'view_prefix'),(251,'Can add RIR',75,'add_rir'),(252,'Can change RIR',75,'change_rir'),(253,'Can delete RIR',75,'delete_rir'),(254,'Can view RIR',75,'view_rir'),(255,'Can add route target',76,'add_routetarget'),(256,'Can change route target',76,'change_routetarget'),(257,'Can delete route target',76,'delete_routetarget'),(258,'Can view route target',76,'view_routetarget'),(259,'Can add VRF',77,'add_vrf'),(260,'Can change VRF',77,'change_vrf'),(261,'Can delete VRF',77,'delete_vrf'),(262,'Can view VRF',77,'view_vrf'),(263,'Can add VLAN group',78,'add_vlangroup'),(264,'Can change VLAN group',78,'change_vlangroup'),(265,'Can delete VLAN group',78,'delete_vlangroup'),(266,'Can view VLAN group',78,'view_vlangroup'),(267,'Can add VLAN',8,'add_vlan'),(268,'Can change VLAN',8,'change_vlan'),(269,'Can delete VLAN',8,'delete_vlan'),(270,'Can view VLAN',8,'view_vlan'),(271,'Can add service',79,'add_service'),(272,'Can change service',79,'change_service'),(273,'Can delete service',79,'delete_service'),(274,'Can view service',79,'view_service'),(275,'Can add IP Address Assignment',80,'add_ipaddresstointerface'),(276,'Can change IP Address Assignment',80,'change_ipaddresstointerface'),(277,'Can delete IP Address Assignment',80,'delete_ipaddresstointerface'),(278,'Can view IP Address Assignment',80,'view_ipaddresstointerface'),(279,'Can add vrf prefix assignment',81,'add_vrfprefixassignment'),(280,'Can change vrf prefix assignment',81,'change_vrfprefixassignment'),(281,'Can delete vrf prefix assignment',81,'delete_vrfprefixassignment'),(282,'Can view vrf prefix assignment',81,'view_vrfprefixassignment'),(283,'Can add vrf device assignment',82,'add_vrfdeviceassignment'),(284,'Can change vrf device assignment',82,'change_vrfdeviceassignment'),(285,'Can delete vrf device assignment',82,'delete_vrfdeviceassignment'),(286,'Can view vrf device assignment',82,'view_vrfdeviceassignment'),(287,'Can add namespace',83,'add_namespace'),(288,'Can change namespace',83,'change_namespace'),(289,'Can delete namespace',83,'delete_namespace'),(290,'Can view namespace',83,'view_namespace'),(291,'Can add config context',84,'add_configcontext'),(292,'Can change config context',84,'change_configcontext'),(293,'Can delete config context',84,'delete_configcontext'),(294,'Can view config context',84,'view_configcontext'),(295,'Can add custom field',10,'add_customfield'),(296,'Can change custom field',10,'change_customfield'),(297,'Can delete custom field',10,'delete_customfield'),(298,'Can view custom field',10,'view_customfield'),(299,'Can add custom field choice',85,'add_customfieldchoice'),(300,'Can change custom field choice',85,'change_customfieldchoice'),(301,'Can delete custom field choice',85,'delete_customfieldchoice'),(302,'Can view custom field choice',85,'view_customfieldchoice'),(303,'Can add custom link',86,'add_customlink'),(304,'Can change custom link',86,'change_customlink'),(305,'Can delete custom link',86,'delete_customlink'),(306,'Can view custom link',86,'view_customlink'),(307,'Can add export template',87,'add_exporttemplate'),(308,'Can change export template',87,'change_exporttemplate'),(309,'Can delete export template',87,'delete_exporttemplate'),(310,'Can view export template',87,'view_exporttemplate'),(311,'Can add Git repository',88,'add_gitrepository'),(312,'Can change Git repository',88,'change_gitrepository'),(313,'Can delete Git repository',88,'delete_gitrepository'),(314,'Can view Git repository',88,'view_gitrepository'),(315,'Can add image attachment',89,'add_imageattachment'),(316,'Can change image attachment',89,'change_imageattachment'),(317,'Can delete image attachment',89,'delete_imageattachment'),(318,'Can view image attachment',89,'view_imageattachment'),(319,'Can add job result',90,'add_jobresult'),(320,'Can change job result',90,'change_jobresult'),(321,'Can delete job result',90,'delete_jobresult'),(322,'Can view job result',90,'view_jobresult'),(323,'Can add relationship',91,'add_relationship'),(324,'Can change relationship',91,'change_relationship'),(325,'Can delete relationship',91,'delete_relationship'),(326,'Can view relationship',91,'view_relationship'),(327,'Can add tag',92,'add_tag'),(328,'Can change tag',92,'change_tag'),(329,'Can delete tag',92,'delete_tag'),(330,'Can view tag',92,'view_tag'),(331,'Can add webhook',93,'add_webhook'),(332,'Can change webhook',93,'change_webhook'),(333,'Can delete webhook',93,'delete_webhook'),(334,'Can view webhook',93,'view_webhook'),(335,'Can add tagged item',94,'add_taggeditem'),(336,'Can change tagged item',94,'change_taggeditem'),(337,'Can delete tagged item',94,'delete_taggeditem'),(338,'Can view tagged item',94,'view_taggeditem'),(339,'Can add status',95,'add_status'),(340,'Can change status',95,'change_status'),(341,'Can delete status',95,'delete_status'),(342,'Can view status',95,'view_status'),(343,'Can add relationship association',96,'add_relationshipassociation'),(344,'Can change relationship association',96,'change_relationshipassociation'),(345,'Can delete relationship association',96,'delete_relationshipassociation'),(346,'Can view relationship association',96,'view_relationshipassociation'),(347,'Can add object change',97,'add_objectchange'),(348,'Can change object change',97,'change_objectchange'),(349,'Can delete object change',97,'delete_objectchange'),(350,'Can view object change',97,'view_objectchange'),(351,'Can add GraphQL query',98,'add_graphqlquery'),(352,'Can change GraphQL query',98,'change_graphqlquery'),(353,'Can delete GraphQL query',98,'delete_graphqlquery'),(354,'Can view GraphQL query',98,'view_graphqlquery'),(355,'Can add config context schema',99,'add_configcontextschema'),(356,'Can change config context schema',99,'change_configcontextschema'),(357,'Can delete config context schema',99,'delete_configcontextschema'),(358,'Can view config context schema',99,'view_configcontextschema'),(359,'Can add computed field',100,'add_computedfield'),(360,'Can change computed field',100,'change_computedfield'),(361,'Can delete computed field',100,'delete_computedfield'),(362,'Can view computed field',100,'view_computedfield'),(363,'Can add file attachment',101,'add_fileattachment'),(364,'Can change file attachment',101,'change_fileattachment'),(365,'Can delete file attachment',101,'delete_fileattachment'),(366,'Can view file attachment',101,'view_fileattachment'),(367,'Can add file proxy',102,'add_fileproxy'),(368,'Can change file proxy',102,'change_fileproxy'),(369,'Can delete file proxy',102,'delete_fileproxy'),(370,'Can view file proxy',102,'view_fileproxy'),(371,'Can add health check test model',103,'add_healthchecktestmodel'),(372,'Can change health check test model',103,'change_healthchecktestmodel'),(373,'Can delete health check test model',103,'delete_healthchecktestmodel'),(374,'Can view health check test model',103,'view_healthchecktestmodel'),(375,'Can add scheduled jobs',104,'add_scheduledjobs'),(376,'Can change scheduled jobs',104,'change_scheduledjobs'),(377,'Can delete scheduled jobs',104,'delete_scheduledjobs'),(378,'Can view scheduled jobs',104,'view_scheduledjobs'),(379,'Can add scheduled job',105,'add_scheduledjob'),(380,'Can change scheduled job',105,'change_scheduledjob'),(381,'Can delete scheduled job',105,'delete_scheduledjob'),(382,'Can view scheduled job',105,'view_scheduledjob'),(383,'Can add secret',106,'add_secret'),(384,'Can change secret',106,'change_secret'),(385,'Can delete secret',106,'delete_secret'),(386,'Can view secret',106,'view_secret'),(387,'Can add secrets group',107,'add_secretsgroup'),(388,'Can change secrets group',107,'change_secretsgroup'),(389,'Can delete secrets group',107,'delete_secretsgroup'),(390,'Can view secrets group',107,'view_secretsgroup'),(391,'Can add secrets group association',108,'add_secretsgroupassociation'),(392,'Can change secrets group association',108,'change_secretsgroupassociation'),(393,'Can delete secrets group association',108,'delete_secretsgroupassociation'),(394,'Can view secrets group association',108,'view_secretsgroupassociation'),(395,'Can add job log entry',109,'add_joblogentry'),(396,'Can change job log entry',109,'change_joblogentry'),(397,'Can delete job log entry',109,'delete_joblogentry'),(398,'Can view job log entry',109,'view_joblogentry'),(399,'Can add job',11,'add_job'),(400,'Can change job',11,'change_job'),(401,'Can delete job',11,'delete_job'),(402,'Can view job',11,'view_job'),(403,'Can add dynamic group',110,'add_dynamicgroup'),(404,'Can change dynamic group',110,'change_dynamicgroup'),(405,'Can delete dynamic group',110,'delete_dynamicgroup'),(406,'Can view dynamic group',110,'view_dynamicgroup'),(407,'Can add dynamic group membership',111,'add_dynamicgroupmembership'),(408,'Can change dynamic group membership',111,'change_dynamicgroupmembership'),(409,'Can delete dynamic group membership',111,'delete_dynamicgroupmembership'),(410,'Can view dynamic group membership',111,'view_dynamicgroupmembership'),(411,'Can add note',112,'add_note'),(412,'Can change note',112,'change_note'),(413,'Can delete note',112,'delete_note'),(414,'Can view note',112,'view_note'),(415,'Can add job hook',113,'add_jobhook'),(416,'Can change job hook',113,'change_jobhook'),(417,'Can delete job hook',113,'delete_jobhook'),(418,'Can view job hook',113,'view_jobhook'),(419,'Can add job button',114,'add_jobbutton'),(420,'Can change job button',114,'change_jobbutton'),(421,'Can delete job button',114,'delete_jobbutton'),(422,'Can view job button',114,'view_jobbutton'),(423,'Can add role',16,'add_role'),(424,'Can change role',16,'change_role'),(425,'Can delete role',16,'delete_role'),(426,'Can view role',16,'view_role'),(427,'Can add tenant group',115,'add_tenantgroup'),(428,'Can change tenant group',115,'change_tenantgroup'),(429,'Can delete tenant group',115,'delete_tenantgroup'),(430,'Can view tenant group',115,'view_tenantgroup'),(431,'Can add tenant',116,'add_tenant'),(432,'Can change tenant',116,'change_tenant'),(433,'Can delete tenant',116,'delete_tenant'),(434,'Can view tenant',116,'view_tenant'),(435,'Can add user',117,'add_user'),(436,'Can change user',117,'change_user'),(437,'Can delete user',117,'delete_user'),(438,'Can view user',117,'view_user'),(439,'Can add Group',118,'add_admingroup'),(440,'Can change Group',118,'change_admingroup'),(441,'Can delete Group',118,'delete_admingroup'),(442,'Can view Group',118,'view_admingroup'),(443,'Can add token',119,'add_token'),(444,'Can change token',119,'change_token'),(445,'Can delete token',119,'delete_token'),(446,'Can view token',119,'view_token'),(447,'Can add permission',120,'add_objectpermission'),(448,'Can change permission',120,'change_objectpermission'),(449,'Can delete permission',120,'delete_objectpermission'),(450,'Can view permission',120,'view_objectpermission'),(451,'Can add cluster',121,'add_cluster'),(452,'Can change cluster',121,'change_cluster'),(453,'Can delete cluster',121,'delete_cluster'),(454,'Can view cluster',121,'view_cluster'),(455,'Can add cluster group',122,'add_clustergroup'),(456,'Can change cluster group',122,'change_clustergroup'),(457,'Can delete cluster group',122,'delete_clustergroup'),(458,'Can view cluster group',122,'view_clustergroup'),(459,'Can add cluster type',123,'add_clustertype'),(460,'Can change cluster type',123,'change_clustertype'),(461,'Can delete cluster type',123,'delete_clustertype'),(462,'Can view cluster type',123,'view_clustertype'),(463,'Can add virtual machine',9,'add_virtualmachine'),(464,'Can change virtual machine',9,'change_virtualmachine'),(465,'Can delete virtual machine',9,'delete_virtualmachine'),(466,'Can view virtual machine',9,'view_virtualmachine'),(467,'Can add VM interface',12,'add_vminterface'),(468,'Can change VM interface',12,'change_vminterface'),(469,'Can delete VM interface',12,'delete_vminterface'),(470,'Can view VM interface',12,'view_vminterface'),(471,'Can add constance',124,'add_constance'),(472,'Can change constance',124,'change_constance'),(473,'Can delete constance',124,'delete_constance'),(474,'Can view constance',124,'view_constance');
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
  `cid` varchar(100) NOT NULL,
  `install_date` date DEFAULT NULL,
  `commit_rate` int unsigned DEFAULT NULL,
  `description` varchar(200) NOT NULL,
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
  `xconnect_id` varchar(50) NOT NULL,
  `pp_info` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `asn` bigint DEFAULT NULL,
  `account` varchar(100) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `label` varchar(100) NOT NULL,
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
  UNIQUE KEY `dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq` (`termination_b_type_id`,`termination_b_id`),
  UNIQUE KEY `dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq` (`termination_a_type_id`,`termination_a_id`),
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
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(64) DEFAULT NULL,
  `_name` varchar(100) DEFAULT NULL,
  `serial` varchar(255) NOT NULL,
  `asset_tag` varchar(100) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_tag` (`asset_tag`),
  UNIQUE KEY `dcim_device_virtual_chassis_id_vc_position_efea7133_uniq` (`virtual_chassis_id`,`vc_position`),
  UNIQUE KEY `dcim_device_rack_id_position_face_43208a79_uniq` (`rack_id`,`position`,`face`),
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
  CONSTRAINT `dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `virtualization_cluster` (`id`),
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
-- Table structure for table `dcim_devicebay`
--

DROP TABLE IF EXISTS `dcim_devicebay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_devicebay` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `model` varchar(100) NOT NULL,
  `part_number` varchar(50) NOT NULL,
  `u_height` smallint unsigned NOT NULL,
  `is_full_depth` tinyint(1) NOT NULL,
  `subdevice_role` varchar(50) NOT NULL,
  `front_image` varchar(100) NOT NULL,
  `rear_image` varchar(100) NOT NULL,
  `comments` longtext NOT NULL,
  `manufacturer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_devicetype_manufacturer_id_model_17948c0c_uniq` (`manufacturer_id`,`model`),
  KEY `dcim_devicetype_manufacturer_id_a3e8029e` (`manufacturer_id`),
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
-- Table structure for table `dcim_frontport`
--

DROP TABLE IF EXISTS `dcim_frontport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_frontport` (
  `id` char(32) NOT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  UNIQUE KEY `dcim_frontport_device_id_name_235b7af2_uniq` (`device_id`,`name`),
  UNIQUE KEY `dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq` (`rear_port_id`,`rear_port_position`),
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
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(64) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
  `_cable_peer_id` char(32) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `mac_address` varchar(18) NOT NULL,
  `mtu` int unsigned DEFAULT NULL,
  `mode` varchar(50) NOT NULL,
  `_name` varchar(100) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `description` varchar(200) NOT NULL,
  `protocol` varchar(50) NOT NULL,
  `protocol_group_id` varchar(50) NOT NULL,
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
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `priority` smallint unsigned NOT NULL,
  `interface_id` char(32) NOT NULL,
  `interface_redundancy_group_id` char(32) NOT NULL,
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
  `name` varchar(64) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
  `_name` varchar(100) NOT NULL,
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
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
  `part_id` varchar(50) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `asset_tag` varchar(50) DEFAULT NULL,
  `discovered` tinyint(1) NOT NULL,
  `device_id` char(32) NOT NULL,
  `manufacturer_id` char(32) DEFAULT NULL,
  `parent_id` char(32) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_tag` (`asset_tag`),
  UNIQUE KEY `dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq` (`device_id`,`parent_id`,`name`),
  KEY `dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu` (`manufacturer_id`),
  KEY `dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id` (`parent_id`),
  KEY `dcim_inventoryitem_name_3e415949` (`name`),
  KEY `dcim_inventoryitem_serial_9f53019e` (`serial`),
  KEY `dcim_inventoryitem__name_959f73cc` (`_name`),
  CONSTRAINT `dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu` FOREIGN KEY (`manufacturer_id`) REFERENCES `dcim_manufacturer` (`id`),
  CONSTRAINT `dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id` FOREIGN KEY (`parent_id`) REFERENCES `dcim_inventoryitem` (`id`)
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
  `name` varchar(100) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `location_type_id` char(32) NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `asn` bigint DEFAULT NULL,
  `comments` longtext NOT NULL DEFAULT (_utf8mb4''),
  `contact_email` varchar(254) NOT NULL,
  `contact_name` varchar(100) NOT NULL,
  `contact_phone` varchar(50) NOT NULL,
  `facility` varchar(50) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `napalm_driver` varchar(50) NOT NULL,
  `napalm_args` json DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `manufacturer_id` char(32) DEFAULT NULL,
  `network_driver` varchar(100) NOT NULL,
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
  `name` varchar(100) NOT NULL,
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
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
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
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `facility_id` varchar(50) DEFAULT NULL,
  `serial` varchar(255) NOT NULL,
  `asset_tag` varchar(50) DEFAULT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `description` varchar(200) NOT NULL,
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
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(64) NOT NULL,
  `domain` varchar(30) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (35,'admin','logentry'),(24,'auth','group'),(23,'auth','permission'),(1,'circuits','circuit'),(45,'circuits','circuittermination'),(46,'circuits','circuittype'),(47,'circuits','provider'),(48,'circuits','providernetwork'),(25,'constance','config'),(26,'contenttypes','contenttype'),(124,'database','constance'),(2,'dcim','cable'),(49,'dcim','cablepath'),(50,'dcim','consoleport'),(51,'dcim','consoleporttemplate'),(52,'dcim','consoleserverport'),(53,'dcim','consoleserverporttemplate'),(3,'dcim','device'),(54,'dcim','devicebay'),(55,'dcim','devicebaytemplate'),(19,'dcim','deviceredundancygroup'),(15,'dcim','devicerole'),(56,'dcim','devicetype'),(57,'dcim','frontport'),(58,'dcim','frontporttemplate'),(13,'dcim','interface'),(20,'dcim','interfaceredundancygroup'),(74,'dcim','interfaceredundancygroupassociation'),(59,'dcim','interfacetemplate'),(60,'dcim','inventoryitem'),(14,'dcim','location'),(73,'dcim','locationtype'),(61,'dcim','manufacturer'),(62,'dcim','platform'),(4,'dcim','powerfeed'),(63,'dcim','poweroutlet'),(64,'dcim','poweroutlettemplate'),(65,'dcim','powerpanel'),(66,'dcim','powerport'),(67,'dcim','powerporttemplate'),(5,'dcim','rack'),(68,'dcim','rackgroup'),(69,'dcim','rackreservation'),(17,'dcim','rackrole'),(70,'dcim','rearport'),(71,'dcim','rearporttemplate'),(21,'dcim','site'),(72,'dcim','virtualchassis'),(41,'django_celery_beat','clockedschedule'),(36,'django_celery_beat','crontabschedule'),(37,'django_celery_beat','intervalschedule'),(38,'django_celery_beat','periodictask'),(39,'django_celery_beat','periodictasks'),(40,'django_celery_beat','solarschedule'),(43,'django_celery_results','chordcounter'),(44,'django_celery_results','groupresult'),(42,'django_celery_results','taskresult'),(100,'extras','computedfield'),(84,'extras','configcontext'),(99,'extras','configcontextschema'),(10,'extras','customfield'),(85,'extras','customfieldchoice'),(86,'extras','customlink'),(110,'extras','dynamicgroup'),(111,'extras','dynamicgroupmembership'),(87,'extras','exporttemplate'),(101,'extras','fileattachment'),(102,'extras','fileproxy'),(88,'extras','gitrepository'),(98,'extras','graphqlquery'),(103,'extras','healthchecktestmodel'),(89,'extras','imageattachment'),(11,'extras','job'),(114,'extras','jobbutton'),(113,'extras','jobhook'),(109,'extras','joblogentry'),(90,'extras','jobresult'),(112,'extras','note'),(97,'extras','objectchange'),(91,'extras','relationship'),(96,'extras','relationshipassociation'),(16,'extras','role'),(105,'extras','scheduledjob'),(104,'extras','scheduledjobs'),(106,'extras','secret'),(107,'extras','secretsgroup'),(108,'extras','secretsgroupassociation'),(95,'extras','status'),(92,'extras','tag'),(94,'extras','taggeditem'),(93,'extras','webhook'),(22,'ipam','aggregate'),(6,'ipam','ipaddress'),(80,'ipam','ipaddresstointerface'),(83,'ipam','namespace'),(7,'ipam','prefix'),(75,'ipam','rir'),(18,'ipam','role'),(76,'ipam','routetarget'),(79,'ipam','service'),(8,'ipam','vlan'),(78,'ipam','vlangroup'),(77,'ipam','vrf'),(82,'ipam','vrfdeviceassignment'),(81,'ipam','vrfprefixassignment'),(27,'sessions','session'),(28,'social_django','association'),(29,'social_django','code'),(30,'social_django','nonce'),(32,'social_django','partial'),(31,'social_django','usersocialauth'),(33,'taggit','tag'),(34,'taggit','taggeditem'),(116,'tenancy','tenant'),(115,'tenancy','tenantgroup'),(118,'users','admingroup'),(120,'users','objectpermission'),(119,'users','token'),(117,'users','user'),(121,'virtualization','cluster'),(122,'virtualization','clustergroup'),(123,'virtualization','clustertype'),(9,'virtualization','virtualmachine'),(12,'virtualization','vminterface');
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
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-03-14 18:42:28.649842'),(2,'contenttypes','0002_remove_content_type_name','2025-03-14 18:42:28.683837'),(3,'auth','0001_initial','2025-03-14 18:42:28.782377'),(4,'auth','0002_alter_permission_name_max_length','2025-03-14 18:42:28.810548'),(5,'auth','0003_alter_user_email_max_length','2025-03-14 18:42:28.817318'),(6,'auth','0004_alter_user_username_opts','2025-03-14 18:42:28.822462'),(7,'auth','0005_alter_user_last_login_null','2025-03-14 18:42:28.827772'),(8,'auth','0006_require_contenttypes_0002','2025-03-14 18:42:28.829857'),(9,'auth','0007_alter_validators_add_error_messages','2025-03-14 18:42:28.835219'),(10,'auth','0008_alter_user_username_max_length','2025-03-14 18:42:28.840490'),(11,'auth','0009_alter_user_last_name_max_length','2025-03-14 18:42:28.845695'),(12,'auth','0010_alter_group_name_max_length','2025-03-14 18:42:28.855833'),(13,'auth','0011_update_proxy_permissions','2025-03-14 18:42:28.861729'),(14,'auth','0012_alter_user_first_name_max_length','2025-03-14 18:42:28.867119'),(15,'users','0001_initial','2025-03-14 18:42:29.229267'),(16,'admin','0001_initial','2025-03-14 18:42:29.295613'),(17,'admin','0002_logentry_remove_auto_add','2025-03-14 18:42:29.306311'),(18,'admin','0003_logentry_add_action_flag_choices','2025-03-14 18:42:29.317726'),(19,'extras','0001_initial_part_1','2025-03-14 18:42:30.023395'),(20,'tenancy','0001_initial','2025-03-14 18:42:30.144316'),(21,'dcim','0001_initial_part_1','2025-03-14 18:42:30.689271'),(22,'dcim','0002_initial_part_2','2025-03-14 18:42:31.181694'),(23,'ipam','0001_initial_part_1','2025-03-14 18:42:31.825996'),(24,'extras','0002_initial_part_2','2025-03-14 18:42:32.500478'),(25,'dcim','0003_initial_part_3','2025-03-14 18:42:36.787599'),(26,'virtualization','0001_initial','2025-03-14 18:42:37.917021'),(27,'dcim','0004_initial_part_4','2025-03-14 18:42:43.249641'),(28,'extras','0003_initial_part_3','2025-03-14 18:42:45.098822'),(29,'ipam','0002_initial_part_2','2025-03-14 18:42:47.335060'),(30,'circuits','0001_initial_part_1','2025-03-14 18:42:47.403742'),(31,'circuits','0002_initial_part_2','2025-03-14 18:42:48.909782'),(32,'extras','0004_populate_default_status_records','2025-03-14 18:42:49.119068'),(33,'extras','0005_configcontext_device_types','2025-03-14 18:42:49.244727'),(34,'extras','0006_graphqlquery','2025-03-14 18:42:49.263660'),(35,'extras','0007_configcontextschema','2025-03-14 18:42:49.705203'),(36,'virtualization','0002_virtualmachine_local_context_schema','2025-03-14 18:42:49.830111'),(37,'virtualization','0003_vminterface_verbose_name','2025-03-14 18:42:49.877597'),(38,'virtualization','0004_auto_slug','2025-03-14 18:42:49.950030'),(39,'virtualization','0005_add_natural_indexing','2025-03-14 18:42:50.129990'),(40,'extras','0008_jobresult__custom_field_data','2025-03-14 18:42:50.192466'),(41,'extras','0009_computedfield','2025-03-14 18:42:50.510606'),(42,'extras','0010_change_cf_validation_max_min_field_to_bigint','2025-03-14 18:42:50.672497'),(43,'extras','0011_fileattachment_fileproxy','2025-03-14 18:42:50.736743'),(44,'extras','0012_healthchecktestmodel','2025-03-14 18:42:50.750305'),(45,'extras','0013_default_fallback_value_computedfield','2025-03-14 18:42:50.788718'),(46,'extras','0014_auto_slug','2025-03-14 18:42:51.048371'),(47,'extras','0015_scheduled_job','2025-03-14 18:42:51.316369'),(48,'extras','0016_secret','2025-03-14 18:42:51.984265'),(49,'extras','0017_joblogentry','2025-03-14 18:42:52.104598'),(50,'extras','0018_joblog_data_migration','2025-03-14 18:42:52.178604'),(51,'extras','0019_joblogentry__meta_options__related_name','2025-03-14 18:42:52.484014'),(52,'extras','0020_customfield_changelog','2025-03-14 18:42:52.659411'),(53,'extras','0021_customfield_changelog_data','2025-03-14 18:42:52.736199'),(54,'extras','0022_objectchange_object_datav2','2025-03-14 18:42:52.804969'),(55,'extras','0023_job_model','2025-03-14 18:42:53.575633'),(56,'extras','0024_job_data_migration','2025-03-14 18:42:53.656074'),(57,'extras','0025_add_advanced_ui_boolean_to_customfield_conputedfield_and_relationship','2025-03-14 18:42:53.838791'),(58,'extras','0026_job_add_gitrepository_fk','2025-03-14 18:42:54.097437'),(59,'extras','0027_job_gitrepository_data_migration','2025-03-14 18:42:54.171755'),(60,'extras','0028_job_reduce_source','2025-03-14 18:42:54.471056'),(61,'extras','0029_dynamicgroup','2025-03-14 18:42:54.584194'),(62,'extras','0030_webhook_alter_unique_together','2025-03-14 18:42:54.638025'),(63,'extras','0031_tag_content_types','2025-03-14 18:42:54.773791'),(64,'extras','0032_tag_content_types_data_migration','2025-03-14 18:42:54.858326'),(65,'extras','0033_add__optimized_indexing','2025-03-14 18:42:55.935457'),(66,'virtualization','0006_vminterface_status','2025-03-14 18:42:56.264076'),(67,'virtualization','0007_vminterface_status_data_migration','2025-03-14 18:42:56.364533'),(68,'virtualization','0008_vminterface_parent','2025-03-14 18:42:56.591359'),(69,'extras','0034_alter_fileattachment_mimetype','2025-03-14 18:42:56.613724'),(70,'extras','0035_scheduledjob_crontab','2025-03-14 18:42:56.667031'),(71,'extras','0036_job_add_has_sensitive_variables','2025-03-14 18:42:56.847665'),(72,'extras','0037_configcontextschema__remove_name_unique__create_constraint_unique_name_owner','2025-03-14 18:42:56.953556'),(73,'dcim','0005_device_local_context_schema','2025-03-14 18:42:57.417272'),(74,'dcim','0006_auto_slug','2025-03-14 18:42:57.816671'),(75,'dcim','0007_device_secrets_group','2025-03-14 18:42:58.222081'),(76,'dcim','0008_increase_all_serial_lengths','2025-03-14 18:42:58.544511'),(77,'dcim','0009_add_natural_indexing','2025-03-14 18:43:01.267016'),(78,'dcim','0010_interface_status','2025-03-14 18:43:01.410101'),(79,'dcim','0011_interface_status_data_migration','2025-03-14 18:43:01.506953'),(80,'dcim','0012_interface_parent_bridge','2025-03-14 18:43:01.757681'),(81,'dcim','0013_location_location_type','2025-03-14 18:43:03.460008'),(82,'virtualization','0009_cluster_location','2025-03-14 18:43:03.580590'),(83,'virtualization','0010_vminterface_mac_address_data_migration','2025-03-14 18:43:03.661436'),(84,'virtualization','0011_alter_vminterface_mac_address','2025-03-14 18:43:03.739131'),(85,'extras','0038_configcontext_locations','2025-03-14 18:43:03.877945'),(86,'extras','0039_objectchange__add_change_context','2025-03-14 18:43:04.034076'),(87,'extras','0040_dynamicgroup__dynamicgroupmembership','2025-03-14 18:43:04.460217'),(88,'extras','0041_jobresult_job_kwargs','2025-03-14 18:43:04.531067'),(89,'extras','0042_job__add_is_job_hook_receiver','2025-03-14 18:43:04.627352'),(90,'extras','0043_note','2025-03-14 18:43:04.775126'),(91,'extras','0044_add_job_hook','2025-03-14 18:43:04.947335'),(92,'extras','0045_add_custom_field_slug','2025-03-14 18:43:05.015691'),(93,'extras','0046_populate_custom_field_slug_label','2025-03-14 18:43:05.097468'),(94,'extras','0047_enforce_custom_field_slug','2025-03-14 18:43:05.365522'),(95,'extras','0048_alter_objectchange_change_context_detail','2025-03-14 18:43:05.419818'),(96,'extras','0049_alter_tag_slug','2025-03-14 18:43:05.498764'),(97,'extras','0050_customfield_grouping','2025-03-14 18:43:05.567545'),(98,'extras','0051_add_job_task_queues','2025-03-14 18:43:05.765445'),(99,'dcim','0014_location_status_data_migration','2025-03-14 18:43:05.865170'),(100,'dcim','0015_device_components__changeloggedmodel','2025-03-14 18:43:08.798635'),(101,'dcim','0016_device_components__timestamp_data_migration','2025-03-14 18:43:08.887214'),(102,'dcim','0017_locationtype_nestable','2025-03-14 18:43:08.958793'),(103,'dcim','0018_device_redundancy_group','2025-03-14 18:43:09.466521'),(104,'extras','0052_configcontext_device_redundancy_groups','2025-03-14 18:43:09.981231'),(105,'extras','0053_relationship_required_on','2025-03-14 18:43:10.052391'),(106,'extras','0054_scheduledjob_kwargs_request_user_change','2025-03-14 18:43:10.141115'),(107,'extras','0055_configcontext_dynamic_groups','2025-03-14 18:43:10.290126'),(108,'extras','0056_objectchange_add_reverse_time_idx','2025-03-14 18:43:10.349479'),(109,'extras','0057_jobbutton','2025-03-14 18:43:10.628214'),(110,'extras','0058_jobresult_add_time_status_idxs','2025-03-14 18:43:11.213267'),(111,'extras','0059_joblogentry_scheduledjob_webhook_data_migration','2025-03-14 18:43:11.648754'),(112,'extras','0060_alter_joblogentry_scheduledjob_webhook_fields','2025-03-14 18:43:11.842506'),(113,'extras','0061_role_and_alter_status','2025-03-14 18:43:12.113956'),(114,'extras','0062_collect_roles_from_related_apps_roles','2025-03-14 18:43:12.242264'),(115,'virtualization','0012_alter_virtualmachine_role_add_new_role','2025-03-14 18:43:12.546086'),(116,'virtualization','0013_migrate_virtualmachine_role_data','2025-03-14 18:43:12.858654'),(117,'virtualization','0014_rename_virtualmachine_roles','2025-03-14 18:43:13.150080'),(118,'extras','0063_alter_role_options','2025-03-14 18:43:13.198225'),(119,'extras','0064_alter_configcontext_and_add_new_role','2025-03-14 18:43:13.434492'),(120,'extras','0065_configcontext_data_migrations','2025-03-14 18:43:13.734646'),(121,'extras','0066_rename_configcontext_role','2025-03-14 18:43:13.920003'),(122,'virtualization','0015_rename_foreignkey_fields','2025-03-14 18:43:15.093275'),(123,'ipam','0003_remove_max_length','2025-03-14 18:43:15.659876'),(124,'ipam','0004_fixup_p2p_broadcast','2025-03-14 18:43:15.749777'),(125,'ipam','0005_auto_slug','2025-03-14 18:43:15.788575'),(126,'ipam','0006_ipaddress_nat_outside_list','2025-03-14 18:43:16.204804'),(127,'ipam','0007_add_natural_indexing','2025-03-14 18:43:16.820949'),(128,'ipam','0008_prefix_vlan_vlangroup_location','2025-03-14 18:43:17.433584'),(129,'ipam','0009_alter_vlan_name','2025-03-14 18:43:17.542892'),(130,'ipam','0010_alter_ipam_role_add_new_role','2025-03-14 18:43:18.622858'),(131,'ipam','0011_migrate_ipam_role_data','2025-03-14 18:43:18.720453'),(132,'ipam','0012_rename_ipam_roles','2025-03-14 18:43:19.827038'),(133,'ipam','0013_delete_role','2025-03-14 18:43:19.836426'),(134,'ipam','0014_rename_foreign_keys_and_related_names','2025-03-14 18:43:20.421710'),(135,'ipam','0015_prefix_add_type','2025-03-14 18:43:20.513145'),(136,'dcim','0019_device_redundancy_group_data_migration','2025-03-14 18:43:20.615595'),(137,'dcim','0020_increase_device_asset_tag_size_limit','2025-03-14 18:43:20.799273'),(138,'dcim','0021_platform_network_driver','2025-03-14 18:43:20.862572'),(139,'dcim','0022_interface_redundancy_group','2025-03-14 18:43:21.727892'),(140,'dcim','0023_interface_redundancy_group_data_migration','2025-03-14 18:43:22.096100'),(141,'dcim','0024_move_site_fields_to_location_model','2025-03-14 18:43:23.570284'),(142,'dcim','0025_mptt_to_tree_queries','2025-03-14 18:43:24.828399'),(143,'dcim','0026_interface_mac_address_data_migration','2025-03-14 18:43:25.157604'),(144,'dcim','0027_alter_interface_mac_address','2025-03-14 18:43:25.298050'),(145,'dcim','0028_alter_device_and_rack_role_add_new_role','2025-03-14 18:43:26.647489'),(146,'dcim','0029_device_and_rack_roles_data_migrations','2025-03-14 18:43:26.737673'),(147,'dcim','0030_rename_device_and_rack_role','2025-03-14 18:43:27.510491'),(148,'dcim','0031_remove_device_role_and_rack_role','2025-03-14 18:43:27.528098'),(149,'dcim','0032_rename_foreignkey_fields','2025-03-14 18:43:28.940828'),(150,'circuits','0003_auto_slug','2025-03-14 18:43:28.999785'),(151,'circuits','0004_increase_provider_account_length','2025-03-14 18:43:29.081655'),(152,'circuits','0005_providernetwork','2025-03-14 18:43:30.124367'),(153,'circuits','0006_cache_circuit_terminations','2025-03-14 18:43:30.218562'),(154,'circuits','0007_circuitterminations_primary_model','2025-03-14 18:43:30.824880'),(155,'circuits','0008_add_natural_indexing','2025-03-14 18:43:30.889357'),(156,'circuits','0009_circuittermination_location','2025-03-14 18:43:31.034250'),(157,'dcim','0033_add_tree_managers_and_foreign_keys_pre_data_migration','2025-03-14 18:43:31.714680'),(158,'dcim','0034_migrate_region_and_site_data_to_locations','2025-03-14 18:43:31.806817'),(159,'virtualization','0016_remove_site_foreign_key_from_cluster_class','2025-03-14 18:43:31.949069'),(160,'virtualization','0017_created_datetime','2025-03-14 18:43:32.565371'),(161,'extras','0067_migrate_job_result_status','2025-03-14 18:43:32.658823'),(162,'extras','0068_jobresult__add_celery_fields','2025-03-14 18:43:34.776921'),(163,'extras','0069_created_datetime','2025-03-14 18:43:37.008989'),(164,'virtualization','0018_related_name_changes','2025-03-14 18:43:37.915648'),(165,'ipam','0016_prefix_type_data_migration','2025-03-14 18:43:38.011438'),(166,'ipam','0017_prefix_remove_is_pool','2025-03-14 18:43:38.101746'),(167,'tenancy','0002_auto_slug','2025-03-14 18:43:38.491125'),(168,'tenancy','0003_mptt_to_tree_queries','2025-03-14 18:43:38.712409'),(169,'tenancy','0004_change_tree_manager_on_tree_models','2025-03-14 18:43:38.727595'),(170,'tenancy','0005_rename_foreign_keys_and_related_names','2025-03-14 18:43:39.020229'),(171,'dcim','0035_rename_path_end_point_related_name','2025-03-14 18:43:39.991194'),(172,'dcim','0036_remove_site_foreign_key_from_dcim_models','2025-03-14 18:43:42.685255'),(173,'ipam','0018_remove_site_foreign_key_from_ipam_models','2025-03-14 18:43:43.466442'),(174,'ipam','0019_created_datetime','2025-03-14 18:43:44.423219'),(175,'ipam','0020_related_name_changes','2025-03-14 18:43:45.165700'),(176,'ipam','0021_prefix_add_rir_and_date_allocated','2025-03-14 18:43:45.474551'),(177,'ipam','0022_aggregate_to_prefix_data_migration','2025-03-14 18:43:45.829378'),(178,'ipam','0023_delete_aggregate','2025-03-14 18:43:45.844991'),(179,'extras','0070_remove_site_and_region_attributes_from_config_context','2025-03-14 18:43:46.050526'),(180,'django_celery_results','0001_initial','2025-03-14 18:43:46.074485'),(181,'django_celery_results','0002_add_task_name_args_kwargs','2025-03-14 18:43:46.135659'),(182,'django_celery_results','0003_auto_20181106_1101','2025-03-14 18:43:46.144094'),(183,'django_celery_results','0004_auto_20190516_0412','2025-03-14 18:43:46.216496'),(184,'django_celery_results','0005_taskresult_worker','2025-03-14 18:43:46.248059'),(185,'django_celery_results','0006_taskresult_date_created','2025-03-14 18:43:46.370958'),(186,'tenancy','0006_created_datetime','2025-03-14 18:43:46.835715'),(187,'dcim','0037_created_datetime','2025-03-14 18:43:50.127177'),(188,'dcim','0038_fixup_fks_and_related_names','2025-03-14 18:43:56.657427'),(189,'dcim','0039_related_name_changes','2025-03-14 18:43:58.337662'),(190,'circuits','0010_rename_foreign_keys_and_related_names','2025-03-14 18:43:59.029349'),(191,'circuits','0011_remove_site_foreign_key_from_circuit_termination_class','2025-03-14 18:43:59.162179'),(192,'dcim','0040_remove_region_and_site','2025-03-14 18:43:59.816498'),(193,'ipam','0024_interface_to_ipaddress_m2m','2025-03-14 18:43:59.965406'),(194,'virtualization','0019_vminterface_ip_addresses_m2m','2025-03-14 18:44:00.052948'),(195,'virtualization','0020_remove_clustergroup_clustertype_slug','2025-03-14 18:44:00.114947'),(196,'tenancy','0007_remove_tenant_tenantgroup_slug','2025-03-14 18:44:00.234557'),(197,'ipam','0025_interface_ipaddress_m2m_data_migration','2025-03-14 18:44:00.319526'),(198,'ipam','0026_ipaddress_remove_assigned_object','2025-03-14 18:44:00.770634'),(199,'ipam','0027_remove_rir_slug','2025-03-14 18:44:00.793891'),(200,'extras','0071_replace_related_names','2025-03-14 18:44:03.042300'),(201,'extras','0072_rename_model_fields','2025-03-14 18:44:03.733143'),(202,'extras','0073_job__unique_name_data_migration','2025-03-14 18:44:03.982963'),(203,'extras','0074_job__unique_name','2025-03-14 18:44:04.792780'),(204,'extras','0075_remove_gitrepository_fields','2025-03-14 18:44:04.919791'),(205,'extras','0076_rename_slug_to_key_for_custom_field','2025-03-14 18:44:05.089164'),(206,'extras','0077_migrate_custom_field_data','2025-03-14 18:44:05.188913'),(207,'extras','0078_remove_name_field_and_make_label_field_non_nullable','2025-03-14 18:44:05.569907'),(208,'dcim','0041_interface_ip_addresses_m2m','2025-03-14 18:44:05.667333'),(209,'dcim','0042_alter_location_managers','2025-03-14 18:44:05.722525'),(210,'dcim','0043_remove_slug','2025-03-14 18:44:05.861351'),(211,'circuits','0012_created_datetime','2025-03-14 18:44:06.469905'),(212,'circuits','0013_alter_circuittermination__path','2025-03-14 18:44:06.614644'),(213,'circuits','0014_related_name_changes','2025-03-14 18:44:06.702984'),(214,'circuits','0015_remove_circuittype_provider_slug','2025-03-14 18:44:06.788951'),(215,'extras','0079_remove_slug','2025-03-14 18:44:07.128514'),(216,'extras','0080_tagsfield','2025-03-14 18:44:07.689760'),(217,'extras','0081_rename_relationship_slug_to_key','2025-03-14 18:44:07.745148'),(218,'extras','0082_rename_relationship_name_to_label','2025-03-14 18:44:07.885384'),(219,'extras','0083_ensure_relationship_keys_are_unique','2025-03-14 18:44:07.971067'),(220,'extras','0084_rename_computed_field_slug_to_key','2025-03-14 18:44:08.272780'),(221,'circuits','0016_tagsfield','2025-03-14 18:44:08.610757'),(222,'circuits','0017_fixup_null_statuses','2025-03-14 18:44:08.699317'),(223,'circuits','0018_status_nonnullable','2025-03-14 18:44:09.065306'),(224,'circuits','0019_remove_providernetwork_slug','2025-03-14 18:44:09.133263'),(225,'database','0001_initial','2025-03-14 18:44:09.148628'),(226,'database','0002_auto_20190129_2304','2025-03-14 18:44:09.167855'),(227,'dcim','0044_tagsfield','2025-03-14 18:44:11.383269'),(228,'dcim','0045_ipam__namespaces','2025-03-14 18:44:11.520727'),(229,'dcim','0046_fixup_null_statuses','2025-03-14 18:44:11.908693'),(230,'dcim','0047_status_nonnullable','2025-03-14 18:44:13.744637'),(231,'dcim','0048_ensure_virtual_chassis_names_are_unique_and_add_uniqueness_constraint','2025-03-14 18:44:13.906115'),(232,'dcim','0049_remove_slugs_and_change_device_primary_ip_fields','2025-03-14 18:44:15.213304'),(233,'django_celery_beat','0001_initial','2025-03-14 18:44:15.317017'),(234,'django_celery_beat','0002_auto_20161118_0346','2025-03-14 18:44:15.362509'),(235,'django_celery_beat','0003_auto_20161209_0049','2025-03-14 18:44:15.383320'),(236,'django_celery_beat','0004_auto_20170221_0000','2025-03-14 18:44:15.392898'),(237,'django_celery_beat','0005_add_solarschedule_events_choices','2025-03-14 18:44:15.402074'),(238,'django_celery_beat','0006_auto_20180322_0932','2025-03-14 18:44:15.480500'),(239,'django_celery_beat','0007_auto_20180521_0826','2025-03-14 18:44:15.533871'),(240,'django_celery_beat','0008_auto_20180914_1922','2025-03-14 18:44:15.571034'),(241,'django_celery_beat','0006_auto_20180210_1226','2025-03-14 18:44:15.594832'),(242,'django_celery_beat','0006_periodictask_priority','2025-03-14 18:44:15.629963'),(243,'django_celery_beat','0009_periodictask_headers','2025-03-14 18:44:15.666207'),(244,'django_celery_beat','0010_auto_20190429_0326','2025-03-14 18:44:15.878874'),(245,'django_celery_beat','0011_auto_20190508_0153','2025-03-14 18:44:15.928302'),(246,'django_celery_beat','0012_periodictask_expire_seconds','2025-03-14 18:44:15.970938'),(247,'django_celery_beat','0013_auto_20200609_0727','2025-03-14 18:44:15.981894'),(248,'django_celery_beat','0014_remove_clockedschedule_enabled','2025-03-14 18:44:16.003404'),(249,'django_celery_beat','0015_edit_solarschedule_events_choices','2025-03-14 18:44:16.013137'),(250,'django_celery_beat','0016_alter_crontabschedule_timezone','2025-03-14 18:44:16.025405'),(251,'django_celery_beat','0017_alter_crontabschedule_month_of_year','2025-03-14 18:44:16.291774'),(252,'django_celery_beat','0018_improve_crontab_helptext','2025-03-14 18:44:16.302673'),(253,'django_celery_results','0007_remove_taskresult_hidden','2025-03-14 18:44:16.329876'),(254,'django_celery_results','0008_chordcounter','2025-03-14 18:44:16.346263'),(255,'django_celery_results','0009_groupresult','2025-03-14 18:44:16.547664'),(256,'django_celery_results','0010_remove_duplicate_indices','2025-03-14 18:44:16.567095'),(257,'django_celery_results','0011_taskresult_periodic_task_name','2025-03-14 18:44:16.595757'),(258,'extras','0085_taggeditem_cleanup','2025-03-14 18:44:16.689446'),(259,'extras','0086_taggeditem_uniqueness','2025-03-14 18:44:16.854302'),(260,'extras','0087_job__celery_task_fields__dryrun_support','2025-03-14 18:44:17.962215'),(261,'extras','0088_job__commit_default_data_migration','2025-03-14 18:44:18.055478'),(262,'extras','0089_joblogentry__log_level_default','2025-03-14 18:44:18.070136'),(263,'extras','0090_joblogentry__log_level_data_migration','2025-03-14 18:44:18.452914'),(264,'extras','0091_scheduledjob__data_migration','2025-03-14 18:44:18.541227'),(265,'extras','0092_uniqueness_data_migration','2025-03-14 18:44:18.719552'),(266,'extras','0093_uniqueness_fixup','2025-03-14 18:44:19.561102'),(267,'extras','0094_alter_objectchange_unique_together','2025-03-14 18:44:19.625237'),(268,'extras','0095_ensure_note_timestamps_are_unique','2025-03-14 18:44:19.718046'),(269,'extras','0096_remove_slugs','2025-03-14 18:44:19.920989'),(270,'extras','0097_alter_job_result_remove_result','2025-03-14 18:44:19.990931'),(271,'extras','0098_rename_data_jobresult_result','2025-03-14 18:44:20.026072'),(272,'virtualization','0021_tagsfield_and_vminterface_to_primarymodel','2025-03-14 18:44:20.733715'),(273,'virtualization','0022_vminterface_timestamps_data_migration','2025-03-14 18:44:20.822021'),(274,'ipam','0028_tagsfield','2025-03-14 18:44:21.744601'),(275,'ipam','0029_ip_address_to_interface_uniqueness_constraints','2025-03-14 18:44:21.809515'),(276,'ipam','0030_ipam__namespaces','2025-03-14 18:44:24.466553'),(277,'virtualization','0023_ipam__namespaces','2025-03-14 18:44:24.598816'),(278,'virtualization','0024_fixup_null_statuses','2025-03-14 18:44:24.694091'),(279,'virtualization','0025_status_nonnullable','2025-03-14 18:44:25.325569'),(280,'ipam','0031_ipam___data_migrations','2025-03-14 18:44:25.535764'),(281,'ipam','0032_ipam__namespaces_finish','2025-03-14 18:44:27.067516'),(282,'ipam','0033_fixup_null_statuses','2025-03-14 18:44:27.166941'),(283,'ipam','0034_status_nonnullable','2025-03-14 18:44:27.743826'),(284,'ipam','0035_ensure_all_services_fit_uniqueness_constraint','2025-03-14 18:44:27.841876'),(285,'ipam','0036_add_uniqueness_constraints_to_service','2025-03-14 18:44:28.257708'),(286,'ipam','0037_data_migration_vlan_group_name_uniqueness','2025-03-14 18:44:28.349086'),(287,'ipam','0038_vlan_group_name_unique_remove_slug','2025-03-14 18:44:28.511002'),(288,'sessions','0001_initial','2025-03-14 18:44:28.530501'),(289,'default','0001_initial','2025-03-14 18:44:28.743464'),(290,'social_auth','0001_initial','2025-03-14 18:44:28.746373'),(291,'default','0002_add_related_name','2025-03-14 18:44:28.833239'),(292,'social_auth','0002_add_related_name','2025-03-14 18:44:28.835884'),(293,'default','0003_alter_email_max_length','2025-03-14 18:44:28.847818'),(294,'social_auth','0003_alter_email_max_length','2025-03-14 18:44:28.850407'),(295,'default','0004_auto_20160423_0400','2025-03-14 18:44:28.869010'),(296,'social_auth','0004_auto_20160423_0400','2025-03-14 18:44:28.871568'),(297,'social_auth','0005_auto_20160727_2333','2025-03-14 18:44:28.884802'),(298,'social_django','0006_partial','2025-03-14 18:44:28.906694'),(299,'social_django','0007_code_timestamp','2025-03-14 18:44:29.164722'),(300,'social_django','0008_partial_timestamp','2025-03-14 18:44:29.193835'),(301,'social_django','0009_auto_20191118_0520','2025-03-14 18:44:29.262686'),(302,'social_django','0010_uid_db_index','2025-03-14 18:44:29.288920'),(303,'social_django','0011_alter_id_fields','2025-03-14 18:44:29.419597'),(304,'taggit','0001_initial','2025-03-14 18:44:29.571347'),(305,'taggit','0002_auto_20150616_2121','2025-03-14 18:44:29.624618'),(306,'taggit','0003_taggeditem_add_unique_index','2025-03-14 18:44:29.675912'),(307,'taggit','0004_alter_taggeditem_content_type_alter_taggeditem_tag','2025-03-14 18:44:29.848858'),(308,'taggit','0005_auto_20220424_2025','2025-03-14 18:44:29.858488'),(309,'tenancy','0008_tagsfield','2025-03-14 18:44:30.173637'),(310,'users','0002_token_ordering_by_created','2025-03-14 18:44:30.192863'),(311,'users','0003_alter_user_options','2025-03-14 18:44:30.212483'),(312,'users','0004_alter_user_managers','2025-03-14 18:44:30.231940'),(313,'users','0005_ensure_object_permission_names_are_unique','2025-03-14 18:44:30.326307'),(314,'users','0006_make_object_permission_name_globally_unique','2025-03-14 18:44:30.389892'),(315,'virtualization','0026_change_virtualmachine_primary_ip_fields','2025-03-14 18:44:30.783032'),(316,'social_django','0002_add_related_name','2025-03-14 18:44:30.790657'),(317,'social_django','0004_auto_20160423_0400','2025-03-14 18:44:30.793132'),(318,'social_django','0001_initial','2025-03-14 18:44:30.795520'),(319,'social_django','0003_alter_email_max_length','2025-03-14 18:44:30.797933'),(320,'social_django','0005_auto_20160727_2333','2025-03-14 18:44:30.800610');
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
  `key` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `owner_object_id` char(32) DEFAULT NULL,
  `weight` smallint unsigned NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
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
-- Table structure for table `extras_customfield`
--

DROP TABLE IF EXISTS `extras_customfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_customfield` (
  `id` char(32) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `key` varchar(100) NOT NULL,
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
  `value` varchar(100) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `text` varchar(500) NOT NULL,
  `target_url` varchar(500) NOT NULL,
  `weight` smallint unsigned NOT NULL,
  `group_name` varchar(50) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `template_code` longtext NOT NULL,
  `mime_type` varchar(50) NOT NULL,
  `file_extension` varchar(15) NOT NULL,
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
  PRIMARY KEY (`id`)
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
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `remote_url` varchar(255) NOT NULL,
  `branch` varchar(64) NOT NULL,
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
  `name` varchar(100) NOT NULL,
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
  `title` varchar(128) NOT NULL,
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
  `name` varchar(50) NOT NULL,
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
INSERT INTO `extras_job` VALUES ('34ca6a87ef724cecbd23d75c3f55e98b','2025-03-14 18:44:30.971874','2025-03-14 18:44:30.972587','{}','nautobot.core.jobs','GitRepositoryDryRun','System Jobs','Git Repository: Dry-Run','',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'[]',0,0,0),('46289e03f6e144ea8145f5118587997d','2025-03-14 18:44:30.966639','2025-03-14 18:44:30.967476','{}','nautobot.core.jobs','GitRepositorySync','System Jobs','Git Repository: Sync','',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'[]',0,0,0);
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
  `name` varchar(100) NOT NULL,
  `text` varchar(500) NOT NULL,
  `weight` smallint unsigned NOT NULL,
  `group_name` varchar(50) NOT NULL,
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
  `name` varchar(100) NOT NULL,
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
  `changed_object_type_id` int NOT NULL,
  `related_object_type_id` int DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  `object_data_v2` json DEFAULT NULL,
  `change_context` varchar(50) NOT NULL,
  `change_context_detail` varchar(400) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_objectchange_time_request_id_changed__f5f870cc_uniq` (`time`,`request_id`,`changed_object_type_id`,`changed_object_id`),
  KEY `extras_objectchange_changed_object_type__b755bb60_fk_django_co` (`changed_object_type_id`),
  KEY `extras_objectchange_related_object_type__fe6e521f_fk_django_co` (`related_object_type_id`),
  KEY `extras_objectchange_time_224380ea` (`time`),
  KEY `extras_objectchange_user_id_7fdf8186_fk_auth_user_id` (`user_id`),
  KEY `extras_objectchange_changed_object_id_efb1a943` (`changed_object_id`),
  KEY `extras_objectchange_request_id_4ae21e90` (`request_id`),
  KEY `extras_objectchange_triple_idx` (`request_id`,`changed_object_type_id`,`changed_object_id`),
  KEY `extras_objectchange_double_idx` (`request_id`,`changed_object_type_id`),
  KEY `extras_objectchange_change_context_8e03ae30` (`change_context`),
  KEY `extras_objectchange_rtime_idx` (`time` DESC),
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
  `label` varchar(100) NOT NULL,
  `key` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(50) NOT NULL,
  `source_label` varchar(50) NOT NULL,
  `source_hidden` tinyint(1) NOT NULL,
  `source_filter` json DEFAULT NULL,
  `destination_label` varchar(50) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `color` varchar(6) NOT NULL,
  `description` varchar(200) NOT NULL,
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
INSERT INTO `extras_role` VALUES ('40ff5ade619242e2a0de39d3c60d441c','2025-03-14 00:00:00.000000','2025-03-14 18:43:12.221908','{}','HSRP','4caf50','',NULL),('6daf0f62d6834f429cb35f1b04c878a1','2025-03-14 00:00:00.000000','2025-03-14 18:43:12.220522','{}','VRRP','4caf50','',NULL),('71094e3e3fd44180ac750108e419c10d','2025-03-14 00:00:00.000000','2025-03-14 18:43:12.224737','{}','CARP','4caf50','',NULL),('72b4db7572b1459b9bca18d4a72eb7c0','2025-03-14 00:00:00.000000','2025-03-14 18:43:12.214748','{}','Loopback','9e9e9e','',NULL),('8c2ee6bab3994e1381feec73c4559be8','2025-03-14 00:00:00.000000','2025-03-14 18:43:12.216266','{}','Secondary','2196f3','',NULL),('ad84a15f27b343c8a44f8bc9e5eaa952','2025-03-14 00:00:00.000000','2025-03-14 18:43:12.223353','{}','GLBP','4caf50','',NULL),('d222e4b6c4144b6e8bf4aae2e2325995','2025-03-14 00:00:00.000000','2025-03-14 18:43:12.219128','{}','VIP','4caf50','',NULL),('da8df7551ad0437e9f5f7b490bc9d50c','2025-03-14 00:00:00.000000','2025-03-14 18:43:12.217734','{}','Anycast','ffc107','',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_role_content_types`
--

LOCK TABLES `extras_role_content_types` WRITE;
/*!40000 ALTER TABLE `extras_role_content_types` DISABLE KEYS */;
INSERT INTO `extras_role_content_types` VALUES (4,'40ff5ade619242e2a0de39d3c60d441c',6),(8,'6daf0f62d6834f429cb35f1b04c878a1',6),(2,'71094e3e3fd44180ac750108e419c10d',6),(5,'72b4db7572b1459b9bca18d4a72eb7c0',6),(6,'8c2ee6bab3994e1381feec73c4559be8',6),(3,'ad84a15f27b343c8a44f8bc9e5eaa952',6),(7,'d222e4b6c4144b6e8bf4aae2e2325995',6),(1,'da8df7551ad0437e9f5f7b490bc9d50c',6);
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
  `name` varchar(200) NOT NULL,
  `task` varchar(201) NOT NULL,
  `interval` varchar(255) NOT NULL,
  `args` json NOT NULL,
  `kwargs` json NOT NULL,
  `queue` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `provider` varchar(100) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `color` varchar(6) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_status`
--

LOCK TABLES `extras_status` WRITE;
/*!40000 ALTER TABLE `extras_status` DISABLE KEYS */;
INSERT INTO `extras_status` VALUES ('0a97d164bc1a41d29d2b93904631954b','2025-03-14 00:00:00.000000','2025-03-14 18:42:49.023240','{}','Staged','2196f3','Unit has been staged'),('0ae9f45c0d644030b0e13e7154cb6015','2025-03-14 00:00:00.000000','2025-03-14 18:42:48.995000','{}','Deprovisioning','ffc107','Circuit is being deprovisioned'),('0fabab9b6db54184b4659dfdbe1d793f','2025-03-14 00:00:00.000000','2025-03-14 18:42:49.064057','{}','Deprecated','f44336','Unit has been deprecated'),('2405741548244c889e508ef0a3a99e63','2025-03-14 00:00:00.000000','2025-03-14 18:43:05.851706','{}','Staging','2196f3','Location is in the process of being staged'),('360d0e1fa7e74fc68ebb7112c855b2b2','2025-03-14 00:00:00.000000','2025-03-14 18:42:49.009768','{}','Decommissioning','ffc107','Unit is being decommissioned'),('57c8e63d0fa54a55ae79cfc4e9724f81','2025-03-14 00:00:00.000000','2025-03-14 18:42:48.987953','{}','Active','4caf50','Unit is active'),('6f36eabe479a4bca975a94442eba8e51','2025-03-14 00:00:00.000000','2025-03-14 18:42:48.998322','{}','Decommissioned','9e9e9e','Circuit has been decommissioned'),('8cd69c143c774180a256c4ef97ac9287','2025-03-14 00:00:00.000000','2025-03-14 18:42:48.991571','{}','Offline','ffc107','Unit is offline'),('909867ba333b401c9d0abb4ee7f162c4','2025-03-14 00:00:00.000000','2025-03-14 18:42:49.051583','{}','Reserved','00bcd4','Unit is reserved'),('946314b39a184169b8c0dba3079606a5','2025-03-14 00:00:00.000000','2025-03-14 18:42:49.030423','{}','Inventory','9e9e9e','Device is in inventory'),('b810066f42cb4f078e8ef78b520a81f4','2025-03-14 00:00:00.000000','2025-03-14 18:42:49.055201','{}','Available','4caf50','Unit is available'),('bfd021e08e38496a8b5274059b290f72','2025-03-14 00:00:00.000000','2025-03-14 18:42:49.026811','{}','Failed','f44336','Unit has failed'),('c79b9503193b4b6fb7a5058c82660c44','2025-03-14 00:00:00.000000','2025-03-14 18:42:49.003722','{}','Connected','4caf50','Cable is connected'),('cbaa6fb8075b47cba30b12b67696c651','2025-03-14 00:00:00.000000','2025-03-14 18:42:48.978895','{}','Planned','00bcd4','Unit has been planned'),('ce20fb0452f4400a9af288d32052c41c','2025-03-14 00:00:00.000000','2025-03-14 18:43:05.860454','{}','Retired','f44336','Location has been retired'),('e15399c9d6cd4cce839e1cdf75b61863','2025-03-14 00:00:00.000000','2025-03-14 18:42:48.984199','{}','Provisioning','2196f3','Circuit is being provisioned'),('f4256f6d427242efbd30b61481f0f95b','2025-03-14 00:00:00.000000','2025-03-14 18:42:56.354652','{}','Maintenance','9e9e9e','Unit is under maintenance');
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_status_content_types`
--

LOCK TABLES `extras_status_content_types` WRITE;
/*!40000 ALTER TABLE `extras_status_content_types` DISABLE KEYS */;
INSERT INTO `extras_status_content_types` VALUES (13,'0a97d164bc1a41d29d2b93904631954b',3),(38,'0a97d164bc1a41d29d2b93904631954b',9),(5,'0ae9f45c0d644030b0e13e7154cb6015',1),(25,'0fabab9b6db54184b4659dfdbe1d793f',5),(28,'0fabab9b6db54184b4659dfdbe1d793f',6),(31,'0fabab9b6db54184b4659dfdbe1d793f',7),(34,'0fabab9b6db54184b4659dfdbe1d793f',8),(52,'2405741548244c889e508ef0a3a99e63',14),(57,'2405741548244c889e508ef0a3a99e63',19),(62,'2405741548244c889e508ef0a3a99e63',20),(9,'360d0e1fa7e74fc68ebb7112c855b2b2',2),(16,'360d0e1fa7e74fc68ebb7112c855b2b2',3),(40,'360d0e1fa7e74fc68ebb7112c855b2b2',9),(43,'360d0e1fa7e74fc68ebb7112c855b2b2',12),(49,'360d0e1fa7e74fc68ebb7112c855b2b2',13),(54,'360d0e1fa7e74fc68ebb7112c855b2b2',14),(59,'360d0e1fa7e74fc68ebb7112c855b2b2',19),(64,'360d0e1fa7e74fc68ebb7112c855b2b2',20),(3,'57c8e63d0fa54a55ae79cfc4e9724f81',1),(11,'57c8e63d0fa54a55ae79cfc4e9724f81',3),(18,'57c8e63d0fa54a55ae79cfc4e9724f81',4),(24,'57c8e63d0fa54a55ae79cfc4e9724f81',5),(26,'57c8e63d0fa54a55ae79cfc4e9724f81',6),(29,'57c8e63d0fa54a55ae79cfc4e9724f81',7),(32,'57c8e63d0fa54a55ae79cfc4e9724f81',8),(36,'57c8e63d0fa54a55ae79cfc4e9724f81',9),(42,'57c8e63d0fa54a55ae79cfc4e9724f81',12),(48,'57c8e63d0fa54a55ae79cfc4e9724f81',13),(53,'57c8e63d0fa54a55ae79cfc4e9724f81',14),(58,'57c8e63d0fa54a55ae79cfc4e9724f81',19),(63,'57c8e63d0fa54a55ae79cfc4e9724f81',20),(6,'6f36eabe479a4bca975a94442eba8e51',1),(4,'8cd69c143c774180a256c4ef97ac9287',1),(10,'8cd69c143c774180a256c4ef97ac9287',3),(17,'8cd69c143c774180a256c4ef97ac9287',4),(35,'8cd69c143c774180a256c4ef97ac9287',9),(21,'909867ba333b401c9d0abb4ee7f162c4',5),(27,'909867ba333b401c9d0abb4ee7f162c4',6),(30,'909867ba333b401c9d0abb4ee7f162c4',7),(33,'909867ba333b401c9d0abb4ee7f162c4',8),(15,'946314b39a184169b8c0dba3079606a5',3),(22,'b810066f42cb4f078e8ef78b520a81f4',5),(14,'bfd021e08e38496a8b5274059b290f72',3),(20,'bfd021e08e38496a8b5274059b290f72',4),(39,'bfd021e08e38496a8b5274059b290f72',9),(41,'bfd021e08e38496a8b5274059b290f72',12),(47,'bfd021e08e38496a8b5274059b290f72',13),(7,'c79b9503193b4b6fb7a5058c82660c44',2),(1,'cbaa6fb8075b47cba30b12b67696c651',1),(8,'cbaa6fb8075b47cba30b12b67696c651',2),(12,'cbaa6fb8075b47cba30b12b67696c651',3),(19,'cbaa6fb8075b47cba30b12b67696c651',4),(23,'cbaa6fb8075b47cba30b12b67696c651',5),(37,'cbaa6fb8075b47cba30b12b67696c651',9),(45,'cbaa6fb8075b47cba30b12b67696c651',12),(46,'cbaa6fb8075b47cba30b12b67696c651',13),(51,'cbaa6fb8075b47cba30b12b67696c651',14),(56,'cbaa6fb8075b47cba30b12b67696c651',19),(61,'cbaa6fb8075b47cba30b12b67696c651',20),(55,'ce20fb0452f4400a9af288d32052c41c',14),(60,'ce20fb0452f4400a9af288d32052c41c',19),(65,'ce20fb0452f4400a9af288d32052c41c',20),(2,'e15399c9d6cd4cce839e1cdf75b61863',1),(44,'f4256f6d427242efbd30b61481f0f95b',12),(50,'f4256f6d427242efbd30b61481f0f95b',13);
/*!40000 ALTER TABLE `extras_status_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras_tag`
--

DROP TABLE IF EXISTS `extras_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_tag` (
  `name` varchar(100) NOT NULL,
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `color` varchar(6) NOT NULL,
  `description` varchar(200) NOT NULL,
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
-- Table structure for table `extras_webhook`
--

DROP TABLE IF EXISTS `extras_webhook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_webhook` (
  `id` char(32) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `type_create` tinyint(1) NOT NULL,
  `type_update` tinyint(1) NOT NULL,
  `type_delete` tinyint(1) NOT NULL,
  `payload_url` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `http_method` varchar(30) NOT NULL,
  `http_content_type` varchar(100) NOT NULL,
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
  `description` varchar(200) NOT NULL,
  `nat_inside_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  `ip_version` int DEFAULT NULL,
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
  UNIQUE KEY `ipam_ipaddresstointerfac_ip_address_id_interface__b15a8b31_uniq` (`ip_address_id`,`interface_id`),
  UNIQUE KEY `ipam_ipaddresstointerfac_ip_address_id_vm_interfa_be84a621_uniq` (`ip_address_id`,`vm_interface_id`),
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
  `description` varchar(200) NOT NULL,
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
INSERT INTO `ipam_namespace` VALUES ('f49c94c913324519b7525102486a31d7','2025-03-14 18:44:22.555901','2025-03-14 18:44:22.555932','{}','Global','Default Global namespace. Created by Nautobot.',NULL);
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
  `description` varchar(200) NOT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `vlan_id` char(32) DEFAULT NULL,
  `location_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `date_allocated` datetime(6) DEFAULT NULL,
  `rir_id` char(32) DEFAULT NULL,
  `ip_version` int DEFAULT NULL,
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
  KEY `ipam_prefix_location_id_9a5c5f60_fk_dcim_location_id` (`location_id`),
  KEY `ipam_prefix_new_role_id_528afd96` (`role_id`),
  KEY `ipam_prefix_rir_id_a009797a_fk_ipam_rir_id` (`rir_id`),
  KEY `ipam_prefix_parent_id_93c2aef8_fk_ipam_prefix_id` (`parent_id`),
  KEY `ipam_prefix_network_broadcast_prefix_length_cac86426_idx` (`network`,`broadcast`,`prefix_length`),
  KEY `ipam_prefix_namespace_id_network_broa_a2f7797d_idx` (`namespace_id`,`network`,`broadcast`,`prefix_length`),
  KEY `ipam_prefix_ip_version_85fe83ba` (`ip_version`),
  CONSTRAINT `ipam_prefix_location_id_9a5c5f60_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
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
  `name` varchar(100) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `protocol` varchar(50) NOT NULL,
  `ports` json NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `description` varchar(200) NOT NULL,
  `vlan_group_id` char(32) DEFAULT NULL,
  `status_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `location_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_vlan_group_id_vid_5ca4cc47_uniq` (`vlan_group_id`,`vid`),
  UNIQUE KEY `ipam_vlan_group_id_name_e53919df_uniq` (`vlan_group_id`,`name`),
  KEY `ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `ipam_vlan_status_id_898aa317` (`status_id`),
  KEY `ipam_vlan_name_a7671201` (`name`),
  KEY `ipam_vlan_location_id_07dd65e4_fk_dcim_location_id` (`location_id`),
  KEY `ipam_vlan_new_role_id_980649ea` (`role_id`),
  CONSTRAINT `ipam_vlan_location_id_07dd65e4_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `rd` varchar(21) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `actions` json NOT NULL,
  `constraints` json DEFAULT NULL,
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
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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
  `name` varchar(64) NOT NULL,
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
  CONSTRAINT `virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz` FOREIGN KEY (`cluster_id`) REFERENCES `virtualization_cluster` (`id`),
  CONSTRAINT `virtualization_virtu_local_config_context_a233267f_fk_django_co` FOREIGN KEY (`local_config_context_data_owner_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `virtualization_virtu_local_config_context_bec5cdf8_fk_extras_co` FOREIGN KEY (`local_config_context_schema_id`) REFERENCES `extras_configcontextschema` (`id`),
  CONSTRAINT `virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat` FOREIGN KEY (`platform_id`) REFERENCES `dcim_platform` (`id`),
  CONSTRAINT `virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad` FOREIGN KEY (`primary_ip4_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad` FOREIGN KEY (`primary_ip6_id`) REFERENCES `ipam_ipaddress` (`id`),
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
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
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

-- Dump completed on 2025-03-14 18:44:33
