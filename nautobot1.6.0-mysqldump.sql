-- MySQL dump 10.13  Distrib 8.4.5, for Linux (x86_64)
--
-- Host: localhost    Database: nautobot
-- ------------------------------------------------------
-- Server version	8.4.5

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
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',18,'add_permission'),(2,'Can change permission',18,'change_permission'),(3,'Can delete permission',18,'delete_permission'),(4,'Can view permission',18,'view_permission'),(5,'Can add group',19,'add_group'),(6,'Can change group',19,'change_group'),(7,'Can delete group',19,'delete_group'),(8,'Can view group',19,'view_group'),(9,'Can change config',20,'change_config'),(10,'Can view config',20,'view_config'),(11,'Can add content type',21,'add_contenttype'),(12,'Can change content type',21,'change_contenttype'),(13,'Can delete content type',21,'delete_contenttype'),(14,'Can view content type',21,'view_contenttype'),(15,'Can add session',22,'add_session'),(16,'Can change session',22,'change_session'),(17,'Can delete session',22,'delete_session'),(18,'Can view session',22,'view_session'),(19,'Can add association',23,'add_association'),(20,'Can change association',23,'change_association'),(21,'Can delete association',23,'delete_association'),(22,'Can view association',23,'view_association'),(23,'Can add code',24,'add_code'),(24,'Can change code',24,'change_code'),(25,'Can delete code',24,'delete_code'),(26,'Can view code',24,'view_code'),(27,'Can add nonce',25,'add_nonce'),(28,'Can change nonce',25,'change_nonce'),(29,'Can delete nonce',25,'delete_nonce'),(30,'Can view nonce',25,'view_nonce'),(31,'Can add user social auth',26,'add_usersocialauth'),(32,'Can change user social auth',26,'change_usersocialauth'),(33,'Can delete user social auth',26,'delete_usersocialauth'),(34,'Can view user social auth',26,'view_usersocialauth'),(35,'Can add partial',27,'add_partial'),(36,'Can change partial',27,'change_partial'),(37,'Can delete partial',27,'delete_partial'),(38,'Can view partial',27,'view_partial'),(39,'Can add tag',28,'add_tag'),(40,'Can change tag',28,'change_tag'),(41,'Can delete tag',28,'delete_tag'),(42,'Can view tag',28,'view_tag'),(43,'Can add tagged item',29,'add_taggeditem'),(44,'Can change tagged item',29,'change_taggeditem'),(45,'Can delete tagged item',29,'delete_taggeditem'),(46,'Can view tagged item',29,'view_taggeditem'),(47,'Can add log entry',30,'add_logentry'),(48,'Can change log entry',30,'change_logentry'),(49,'Can delete log entry',30,'delete_logentry'),(50,'Can view log entry',30,'view_logentry'),(51,'Can add crontab',31,'add_crontabschedule'),(52,'Can change crontab',31,'change_crontabschedule'),(53,'Can delete crontab',31,'delete_crontabschedule'),(54,'Can view crontab',31,'view_crontabschedule'),(55,'Can add interval',32,'add_intervalschedule'),(56,'Can change interval',32,'change_intervalschedule'),(57,'Can delete interval',32,'delete_intervalschedule'),(58,'Can view interval',32,'view_intervalschedule'),(59,'Can add periodic task',33,'add_periodictask'),(60,'Can change periodic task',33,'change_periodictask'),(61,'Can delete periodic task',33,'delete_periodictask'),(62,'Can view periodic task',33,'view_periodictask'),(63,'Can add periodic tasks',34,'add_periodictasks'),(64,'Can change periodic tasks',34,'change_periodictasks'),(65,'Can delete periodic tasks',34,'delete_periodictasks'),(66,'Can view periodic tasks',34,'view_periodictasks'),(67,'Can add solar event',35,'add_solarschedule'),(68,'Can change solar event',35,'change_solarschedule'),(69,'Can delete solar event',35,'delete_solarschedule'),(70,'Can view solar event',35,'view_solarschedule'),(71,'Can add clocked',36,'add_clockedschedule'),(72,'Can change clocked',36,'change_clockedschedule'),(73,'Can delete clocked',36,'delete_clockedschedule'),(74,'Can view clocked',36,'view_clockedschedule'),(75,'Can add circuit',1,'add_circuit'),(76,'Can change circuit',1,'change_circuit'),(77,'Can delete circuit',1,'delete_circuit'),(78,'Can view circuit',1,'view_circuit'),(79,'Can add circuit termination',37,'add_circuittermination'),(80,'Can change circuit termination',37,'change_circuittermination'),(81,'Can delete circuit termination',37,'delete_circuittermination'),(82,'Can view circuit termination',37,'view_circuittermination'),(83,'Can add circuit type',38,'add_circuittype'),(84,'Can change circuit type',38,'change_circuittype'),(85,'Can delete circuit type',38,'delete_circuittype'),(86,'Can view circuit type',38,'view_circuittype'),(87,'Can add provider',39,'add_provider'),(88,'Can change provider',39,'change_provider'),(89,'Can delete provider',39,'delete_provider'),(90,'Can view provider',39,'view_provider'),(91,'Can add provider network',40,'add_providernetwork'),(92,'Can change provider network',40,'change_providernetwork'),(93,'Can delete provider network',40,'delete_providernetwork'),(94,'Can view provider network',40,'view_providernetwork'),(95,'Can add cable',2,'add_cable'),(96,'Can change cable',2,'change_cable'),(97,'Can delete cable',2,'delete_cable'),(98,'Can view cable',2,'view_cable'),(99,'Can add cable path',41,'add_cablepath'),(100,'Can change cable path',41,'change_cablepath'),(101,'Can delete cable path',41,'delete_cablepath'),(102,'Can view cable path',41,'view_cablepath'),(103,'Can add console port',42,'add_consoleport'),(104,'Can change console port',42,'change_consoleport'),(105,'Can delete console port',42,'delete_consoleport'),(106,'Can view console port',42,'view_consoleport'),(107,'Can add console port template',43,'add_consoleporttemplate'),(108,'Can change console port template',43,'change_consoleporttemplate'),(109,'Can delete console port template',43,'delete_consoleporttemplate'),(110,'Can view console port template',43,'view_consoleporttemplate'),(111,'Can add console server port',44,'add_consoleserverport'),(112,'Can change console server port',44,'change_consoleserverport'),(113,'Can delete console server port',44,'delete_consoleserverport'),(114,'Can view console server port',44,'view_consoleserverport'),(115,'Can add console server port template',45,'add_consoleserverporttemplate'),(116,'Can change console server port template',45,'change_consoleserverporttemplate'),(117,'Can delete console server port template',45,'delete_consoleserverporttemplate'),(118,'Can view console server port template',45,'view_consoleserverporttemplate'),(119,'Can add device',3,'add_device'),(120,'Can change device',3,'change_device'),(121,'Can delete device',3,'delete_device'),(122,'Can view device',3,'view_device'),(123,'Can add device bay',46,'add_devicebay'),(124,'Can change device bay',46,'change_devicebay'),(125,'Can delete device bay',46,'delete_devicebay'),(126,'Can view device bay',46,'view_devicebay'),(127,'Can add device bay template',47,'add_devicebaytemplate'),(128,'Can change device bay template',47,'change_devicebaytemplate'),(129,'Can delete device bay template',47,'delete_devicebaytemplate'),(130,'Can view device bay template',47,'view_devicebaytemplate'),(131,'Can add device role',48,'add_devicerole'),(132,'Can change device role',48,'change_devicerole'),(133,'Can delete device role',48,'delete_devicerole'),(134,'Can view device role',48,'view_devicerole'),(135,'Can add device type',49,'add_devicetype'),(136,'Can change device type',49,'change_devicetype'),(137,'Can delete device type',49,'delete_devicetype'),(138,'Can view device type',49,'view_devicetype'),(139,'Can add front port',50,'add_frontport'),(140,'Can change front port',50,'change_frontport'),(141,'Can delete front port',50,'delete_frontport'),(142,'Can view front port',50,'view_frontport'),(143,'Can add front port template',51,'add_frontporttemplate'),(144,'Can change front port template',51,'change_frontporttemplate'),(145,'Can delete front port template',51,'delete_frontporttemplate'),(146,'Can view front port template',51,'view_frontporttemplate'),(147,'Can add interface',4,'add_interface'),(148,'Can change interface',4,'change_interface'),(149,'Can delete interface',4,'delete_interface'),(150,'Can view interface',4,'view_interface'),(151,'Can add interface template',52,'add_interfacetemplate'),(152,'Can change interface template',52,'change_interfacetemplate'),(153,'Can delete interface template',52,'delete_interfacetemplate'),(154,'Can view interface template',52,'view_interfacetemplate'),(155,'Can add inventory item',53,'add_inventoryitem'),(156,'Can change inventory item',53,'change_inventoryitem'),(157,'Can delete inventory item',53,'delete_inventoryitem'),(158,'Can view inventory item',53,'view_inventoryitem'),(159,'Can add manufacturer',54,'add_manufacturer'),(160,'Can change manufacturer',54,'change_manufacturer'),(161,'Can delete manufacturer',54,'delete_manufacturer'),(162,'Can view manufacturer',54,'view_manufacturer'),(163,'Can add platform',55,'add_platform'),(164,'Can change platform',55,'change_platform'),(165,'Can delete platform',55,'delete_platform'),(166,'Can view platform',55,'view_platform'),(167,'Can add power feed',6,'add_powerfeed'),(168,'Can change power feed',6,'change_powerfeed'),(169,'Can delete power feed',6,'delete_powerfeed'),(170,'Can view power feed',6,'view_powerfeed'),(171,'Can add power outlet',56,'add_poweroutlet'),(172,'Can change power outlet',56,'change_poweroutlet'),(173,'Can delete power outlet',56,'delete_poweroutlet'),(174,'Can view power outlet',56,'view_poweroutlet'),(175,'Can add power outlet template',57,'add_poweroutlettemplate'),(176,'Can change power outlet template',57,'change_poweroutlettemplate'),(177,'Can delete power outlet template',57,'delete_poweroutlettemplate'),(178,'Can view power outlet template',57,'view_poweroutlettemplate'),(179,'Can add power panel',58,'add_powerpanel'),(180,'Can change power panel',58,'change_powerpanel'),(181,'Can delete power panel',58,'delete_powerpanel'),(182,'Can view power panel',58,'view_powerpanel'),(183,'Can add power port',59,'add_powerport'),(184,'Can change power port',59,'change_powerport'),(185,'Can delete power port',59,'delete_powerport'),(186,'Can view power port',59,'view_powerport'),(187,'Can add power port template',60,'add_powerporttemplate'),(188,'Can change power port template',60,'change_powerporttemplate'),(189,'Can delete power port template',60,'delete_powerporttemplate'),(190,'Can view power port template',60,'view_powerporttemplate'),(191,'Can add rack',7,'add_rack'),(192,'Can change rack',7,'change_rack'),(193,'Can delete rack',7,'delete_rack'),(194,'Can view rack',7,'view_rack'),(195,'Can add rack group',61,'add_rackgroup'),(196,'Can change rack group',61,'change_rackgroup'),(197,'Can delete rack group',61,'delete_rackgroup'),(198,'Can view rack group',61,'view_rackgroup'),(199,'Can add rack reservation',62,'add_rackreservation'),(200,'Can change rack reservation',62,'change_rackreservation'),(201,'Can delete rack reservation',62,'delete_rackreservation'),(202,'Can view rack reservation',62,'view_rackreservation'),(203,'Can add rack role',63,'add_rackrole'),(204,'Can change rack role',63,'change_rackrole'),(205,'Can delete rack role',63,'delete_rackrole'),(206,'Can view rack role',63,'view_rackrole'),(207,'Can add rear port',64,'add_rearport'),(208,'Can change rear port',64,'change_rearport'),(209,'Can delete rear port',64,'delete_rearport'),(210,'Can view rear port',64,'view_rearport'),(211,'Can add rear port template',65,'add_rearporttemplate'),(212,'Can change rear port template',65,'change_rearporttemplate'),(213,'Can delete rear port template',65,'delete_rearporttemplate'),(214,'Can view rear port template',65,'view_rearporttemplate'),(215,'Can add region',66,'add_region'),(216,'Can change region',66,'change_region'),(217,'Can delete region',66,'delete_region'),(218,'Can view region',66,'view_region'),(219,'Can add site',10,'add_site'),(220,'Can change site',10,'change_site'),(221,'Can delete site',10,'delete_site'),(222,'Can view site',10,'view_site'),(223,'Can add virtual chassis',67,'add_virtualchassis'),(224,'Can change virtual chassis',67,'change_virtualchassis'),(225,'Can delete virtual chassis',67,'delete_virtualchassis'),(226,'Can view virtual chassis',67,'view_virtualchassis'),(227,'Can add location type',68,'add_locationtype'),(228,'Can change location type',68,'change_locationtype'),(229,'Can delete location type',68,'delete_locationtype'),(230,'Can view location type',68,'view_locationtype'),(231,'Can add location',5,'add_location'),(232,'Can change location',5,'change_location'),(233,'Can delete location',5,'delete_location'),(234,'Can view location',5,'view_location'),(235,'Can add device redundancy group',8,'add_deviceredundancygroup'),(236,'Can change device redundancy group',8,'change_deviceredundancygroup'),(237,'Can delete device redundancy group',8,'delete_deviceredundancygroup'),(238,'Can view device redundancy group',8,'view_deviceredundancygroup'),(239,'Can add interface redundancy group',9,'add_interfaceredundancygroup'),(240,'Can change interface redundancy group',9,'change_interfaceredundancygroup'),(241,'Can delete interface redundancy group',9,'delete_interfaceredundancygroup'),(242,'Can view interface redundancy group',9,'view_interfaceredundancygroup'),(243,'Can add interface redundancy group association',69,'add_interfaceredundancygroupassociation'),(244,'Can change interface redundancy group association',69,'change_interfaceredundancygroupassociation'),(245,'Can delete interface redundancy group association',69,'delete_interfaceredundancygroupassociation'),(246,'Can view interface redundancy group association',69,'view_interfaceredundancygroupassociation'),(247,'Can add aggregate',70,'add_aggregate'),(248,'Can change aggregate',70,'change_aggregate'),(249,'Can delete aggregate',70,'delete_aggregate'),(250,'Can view aggregate',70,'view_aggregate'),(251,'Can add IP address',11,'add_ipaddress'),(252,'Can change IP address',11,'change_ipaddress'),(253,'Can delete IP address',11,'delete_ipaddress'),(254,'Can view IP address',11,'view_ipaddress'),(255,'Can add prefix',12,'add_prefix'),(256,'Can change prefix',12,'change_prefix'),(257,'Can delete prefix',12,'delete_prefix'),(258,'Can view prefix',12,'view_prefix'),(259,'Can add RIR',71,'add_rir'),(260,'Can change RIR',71,'change_rir'),(261,'Can delete RIR',71,'delete_rir'),(262,'Can view RIR',71,'view_rir'),(263,'Can add role',72,'add_role'),(264,'Can change role',72,'change_role'),(265,'Can delete role',72,'delete_role'),(266,'Can view role',72,'view_role'),(267,'Can add route target',73,'add_routetarget'),(268,'Can change route target',73,'change_routetarget'),(269,'Can delete route target',73,'delete_routetarget'),(270,'Can view route target',73,'view_routetarget'),(271,'Can add VRF',74,'add_vrf'),(272,'Can change VRF',74,'change_vrf'),(273,'Can delete VRF',74,'delete_vrf'),(274,'Can view VRF',74,'view_vrf'),(275,'Can add VLAN group',75,'add_vlangroup'),(276,'Can change VLAN group',75,'change_vlangroup'),(277,'Can delete VLAN group',75,'delete_vlangroup'),(278,'Can view VLAN group',75,'view_vlangroup'),(279,'Can add VLAN',13,'add_vlan'),(280,'Can change VLAN',13,'change_vlan'),(281,'Can delete VLAN',13,'delete_vlan'),(282,'Can view VLAN',13,'view_vlan'),(283,'Can add service',76,'add_service'),(284,'Can change service',76,'change_service'),(285,'Can delete service',76,'delete_service'),(286,'Can view service',76,'view_service'),(287,'Can add config context',77,'add_configcontext'),(288,'Can change config context',77,'change_configcontext'),(289,'Can delete config context',77,'delete_configcontext'),(290,'Can view config context',77,'view_configcontext'),(291,'Can add custom field',16,'add_customfield'),(292,'Can change custom field',16,'change_customfield'),(293,'Can delete custom field',16,'delete_customfield'),(294,'Can view custom field',16,'view_customfield'),(295,'Can add custom field choice',78,'add_customfieldchoice'),(296,'Can change custom field choice',78,'change_customfieldchoice'),(297,'Can delete custom field choice',78,'delete_customfieldchoice'),(298,'Can view custom field choice',78,'view_customfieldchoice'),(299,'Can add custom link',79,'add_customlink'),(300,'Can change custom link',79,'change_customlink'),(301,'Can delete custom link',79,'delete_customlink'),(302,'Can view custom link',79,'view_customlink'),(303,'Can add export template',80,'add_exporttemplate'),(304,'Can change export template',80,'change_exporttemplate'),(305,'Can delete export template',80,'delete_exporttemplate'),(306,'Can view export template',80,'view_exporttemplate'),(307,'Can add Git repository',81,'add_gitrepository'),(308,'Can change Git repository',81,'change_gitrepository'),(309,'Can delete Git repository',81,'delete_gitrepository'),(310,'Can view Git repository',81,'view_gitrepository'),(311,'Can add image attachment',82,'add_imageattachment'),(312,'Can change image attachment',82,'change_imageattachment'),(313,'Can delete image attachment',82,'delete_imageattachment'),(314,'Can view image attachment',82,'view_imageattachment'),(315,'Can add job result',83,'add_jobresult'),(316,'Can change job result',83,'change_jobresult'),(317,'Can delete job result',83,'delete_jobresult'),(318,'Can view job result',83,'view_jobresult'),(319,'Can add relationship',84,'add_relationship'),(320,'Can change relationship',84,'change_relationship'),(321,'Can delete relationship',84,'delete_relationship'),(322,'Can view relationship',84,'view_relationship'),(323,'Can add tag',85,'add_tag'),(324,'Can change tag',85,'change_tag'),(325,'Can delete tag',85,'delete_tag'),(326,'Can view tag',85,'view_tag'),(327,'Can add webhook',86,'add_webhook'),(328,'Can change webhook',86,'change_webhook'),(329,'Can delete webhook',86,'delete_webhook'),(330,'Can view webhook',86,'view_webhook'),(331,'Can add tagged item',87,'add_taggeditem'),(332,'Can change tagged item',87,'change_taggeditem'),(333,'Can delete tagged item',87,'delete_taggeditem'),(334,'Can view tagged item',87,'view_taggeditem'),(335,'Can add status',88,'add_status'),(336,'Can change status',88,'change_status'),(337,'Can delete status',88,'delete_status'),(338,'Can view status',88,'view_status'),(339,'Can add relationship association',89,'add_relationshipassociation'),(340,'Can change relationship association',89,'change_relationshipassociation'),(341,'Can delete relationship association',89,'delete_relationshipassociation'),(342,'Can view relationship association',89,'view_relationshipassociation'),(343,'Can add object change',90,'add_objectchange'),(344,'Can change object change',90,'change_objectchange'),(345,'Can delete object change',90,'delete_objectchange'),(346,'Can view object change',90,'view_objectchange'),(347,'Can add GraphQL query',91,'add_graphqlquery'),(348,'Can change GraphQL query',91,'change_graphqlquery'),(349,'Can delete GraphQL query',91,'delete_graphqlquery'),(350,'Can view GraphQL query',91,'view_graphqlquery'),(351,'Can add config context schema',92,'add_configcontextschema'),(352,'Can change config context schema',92,'change_configcontextschema'),(353,'Can delete config context schema',92,'delete_configcontextschema'),(354,'Can view config context schema',92,'view_configcontextschema'),(355,'Can add computed field',93,'add_computedfield'),(356,'Can change computed field',93,'change_computedfield'),(357,'Can delete computed field',93,'delete_computedfield'),(358,'Can view computed field',93,'view_computedfield'),(359,'Can add file attachment',94,'add_fileattachment'),(360,'Can change file attachment',94,'change_fileattachment'),(361,'Can delete file attachment',94,'delete_fileattachment'),(362,'Can view file attachment',94,'view_fileattachment'),(363,'Can add file proxy',95,'add_fileproxy'),(364,'Can change file proxy',95,'change_fileproxy'),(365,'Can delete file proxy',95,'delete_fileproxy'),(366,'Can view file proxy',95,'view_fileproxy'),(367,'Can add health check test model',96,'add_healthchecktestmodel'),(368,'Can change health check test model',96,'change_healthchecktestmodel'),(369,'Can delete health check test model',96,'delete_healthchecktestmodel'),(370,'Can view health check test model',96,'view_healthchecktestmodel'),(371,'Can add scheduled jobs',97,'add_scheduledjobs'),(372,'Can change scheduled jobs',97,'change_scheduledjobs'),(373,'Can delete scheduled jobs',97,'delete_scheduledjobs'),(374,'Can view scheduled jobs',97,'view_scheduledjobs'),(375,'Can add scheduled job',98,'add_scheduledjob'),(376,'Can change scheduled job',98,'change_scheduledjob'),(377,'Can delete scheduled job',98,'delete_scheduledjob'),(378,'Can view scheduled job',98,'view_scheduledjob'),(379,'Can add secret',99,'add_secret'),(380,'Can change secret',99,'change_secret'),(381,'Can delete secret',99,'delete_secret'),(382,'Can view secret',99,'view_secret'),(383,'Can add secrets group',100,'add_secretsgroup'),(384,'Can change secrets group',100,'change_secretsgroup'),(385,'Can delete secrets group',100,'delete_secretsgroup'),(386,'Can view secrets group',100,'view_secretsgroup'),(387,'Can add secrets group association',101,'add_secretsgroupassociation'),(388,'Can change secrets group association',101,'change_secretsgroupassociation'),(389,'Can delete secrets group association',101,'delete_secretsgroupassociation'),(390,'Can view secrets group association',101,'view_secretsgroupassociation'),(391,'Can add job log entry',102,'add_joblogentry'),(392,'Can change job log entry',102,'change_joblogentry'),(393,'Can delete job log entry',102,'delete_joblogentry'),(394,'Can view job log entry',102,'view_joblogentry'),(395,'Can add job',17,'add_job'),(396,'Can change job',17,'change_job'),(397,'Can delete job',17,'delete_job'),(398,'Can view job',17,'view_job'),(399,'Can add dynamic group',103,'add_dynamicgroup'),(400,'Can change dynamic group',103,'change_dynamicgroup'),(401,'Can delete dynamic group',103,'delete_dynamicgroup'),(402,'Can view dynamic group',103,'view_dynamicgroup'),(403,'Can add dynamic group membership',104,'add_dynamicgroupmembership'),(404,'Can change dynamic group membership',104,'change_dynamicgroupmembership'),(405,'Can delete dynamic group membership',104,'delete_dynamicgroupmembership'),(406,'Can view dynamic group membership',104,'view_dynamicgroupmembership'),(407,'Can add note',105,'add_note'),(408,'Can change note',105,'change_note'),(409,'Can delete note',105,'delete_note'),(410,'Can view note',105,'view_note'),(411,'Can add job hook',106,'add_jobhook'),(412,'Can change job hook',106,'change_jobhook'),(413,'Can delete job hook',106,'delete_jobhook'),(414,'Can view job hook',106,'view_jobhook'),(415,'Can add job button',107,'add_jobbutton'),(416,'Can change job button',107,'change_jobbutton'),(417,'Can delete job button',107,'delete_jobbutton'),(418,'Can view job button',107,'view_jobbutton'),(419,'Can add tenant group',108,'add_tenantgroup'),(420,'Can change tenant group',108,'change_tenantgroup'),(421,'Can delete tenant group',108,'delete_tenantgroup'),(422,'Can view tenant group',108,'view_tenantgroup'),(423,'Can add tenant',109,'add_tenant'),(424,'Can change tenant',109,'change_tenant'),(425,'Can delete tenant',109,'delete_tenant'),(426,'Can view tenant',109,'view_tenant'),(427,'Can add user',110,'add_user'),(428,'Can change user',110,'change_user'),(429,'Can delete user',110,'delete_user'),(430,'Can view user',110,'view_user'),(431,'Can add Group',111,'add_admingroup'),(432,'Can change Group',111,'change_admingroup'),(433,'Can delete Group',111,'delete_admingroup'),(434,'Can view Group',111,'view_admingroup'),(435,'Can add token',112,'add_token'),(436,'Can change token',112,'change_token'),(437,'Can delete token',112,'delete_token'),(438,'Can view token',112,'view_token'),(439,'Can add permission',113,'add_objectpermission'),(440,'Can change permission',113,'change_objectpermission'),(441,'Can delete permission',113,'delete_objectpermission'),(442,'Can view permission',113,'view_objectpermission'),(443,'Can add cluster',114,'add_cluster'),(444,'Can change cluster',114,'change_cluster'),(445,'Can delete cluster',114,'delete_cluster'),(446,'Can view cluster',114,'view_cluster'),(447,'Can add cluster group',115,'add_clustergroup'),(448,'Can change cluster group',115,'change_clustergroup'),(449,'Can delete cluster group',115,'delete_clustergroup'),(450,'Can view cluster group',115,'view_clustergroup'),(451,'Can add cluster type',116,'add_clustertype'),(452,'Can change cluster type',116,'change_clustertype'),(453,'Can delete cluster type',116,'delete_clustertype'),(454,'Can view cluster type',116,'view_clustertype'),(455,'Can add virtual machine',14,'add_virtualmachine'),(456,'Can change virtual machine',14,'change_virtualmachine'),(457,'Can delete virtual machine',14,'delete_virtualmachine'),(458,'Can view virtual machine',14,'view_virtualmachine'),(459,'Can add VM interface',15,'add_vminterface'),(460,'Can change VM interface',15,'change_vminterface'),(461,'Can delete VM interface',15,'delete_vminterface'),(462,'Can view VM interface',15,'view_vminterface'),(463,'Access admin page',117,'view'),(464,'Can add constance',118,'add_constance'),(465,'Can change constance',118,'change_constance'),(466,'Can delete constance',118,'delete_constance'),(467,'Can view constance',118,'view_constance');
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `cid` varchar(100) NOT NULL,
  `install_date` date DEFAULT NULL,
  `commit_rate` int unsigned DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `comments` longtext NOT NULL,
  `provider_id` char(32) NOT NULL,
  `status_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `type_id` char(32) NOT NULL,
  `termination_a_id` char(32) DEFAULT NULL,
  `termination_z_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `circuits_circuit_provider_id_cid_b6f29862_uniq` (`provider_id`,`cid`),
  KEY `circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id` (`type_id`),
  KEY `circuits_circuit_status_id_6433793f` (`status_id`),
  KEY `circuits_circuit_termination_a_id_f891adac_fk_circuits_` (`termination_a_id`),
  KEY `circuits_circuit_termination_z_id_377b8551_fk_circuits_` (`termination_z_id`),
  CONSTRAINT `circuits_circuit_provider_id_d9195418_fk_circuits_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `circuits_provider` (`id`),
  CONSTRAINT `circuits_circuit_status_id_6433793f_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `circuits_circuit_termination_a_id_f891adac_fk_circuits_` FOREIGN KEY (`termination_a_id`) REFERENCES `circuits_circuittermination` (`id`),
  CONSTRAINT `circuits_circuit_termination_z_id_377b8551_fk_circuits_` FOREIGN KEY (`termination_z_id`) REFERENCES `circuits_circuittermination` (`id`),
  CONSTRAINT `circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id` FOREIGN KEY (`type_id`) REFERENCES `circuits_circuittype` (`id`),
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
  `site_id` char(32) DEFAULT NULL,
  `provider_network_id` char(32) DEFAULT NULL,
  `_custom_field_data` json NOT NULL DEFAULT (_utf8mb4'{}'),
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `location_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq` (`circuit_id`,`term_side`),
  KEY `circuits_circuitterm__cable_peer_type_id_bd122156_fk_django_co` (`_cable_peer_type_id`),
  KEY `circuits_circuitterm__path_id_6dfd8db0_fk_dcim_cabl` (`_path_id`),
  KEY `circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id` (`cable_id`),
  KEY `circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id` (`site_id`),
  KEY `circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_` (`provider_network_id`),
  KEY `circuits_circuitterm_location_id_9896bd96_fk_dcim_loca` (`location_id`),
  CONSTRAINT `circuits_circuitterm__cable_peer_type_id_bd122156_fk_django_co` FOREIGN KEY (`_cable_peer_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `circuits_circuitterm__path_id_6dfd8db0_fk_dcim_cabl` FOREIGN KEY (`_path_id`) REFERENCES `dcim_cablepath` (`id`),
  CONSTRAINT `circuits_circuitterm_circuit_id_257e87e7_fk_circuits_` FOREIGN KEY (`circuit_id`) REFERENCES `circuits_circuit` (`id`),
  CONSTRAINT `circuits_circuitterm_location_id_9896bd96_fk_dcim_loca` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_` FOREIGN KEY (`provider_network_id`) REFERENCES `circuits_providernetwork` (`id`),
  CONSTRAINT `circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id` FOREIGN KEY (`cable_id`) REFERENCES `dcim_cable` (`id`),
  CONSTRAINT `circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id` FOREIGN KEY (`site_id`) REFERENCES `dcim_site` (`id`),
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `asn` bigint DEFAULT NULL,
  `account` varchar(100) NOT NULL,
  `portal_url` varchar(200) NOT NULL,
  `noc_contact` longtext NOT NULL,
  `admin_contact` longtext NOT NULL,
  `comments` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `comments` longtext NOT NULL,
  `provider_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
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
  `created` date DEFAULT NULL,
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
  `status_id` char(32) DEFAULT NULL,
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_consoleport_device_id_name_293786b6_uniq` (`device_id`,`name`),
  KEY `dcim_consoleport__cable_peer_type_id_52adb1be_fk_django_co` (`_cable_peer_type_id`),
  KEY `dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id` (`_path_id`),
  KEY `dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id` (`cable_id`),
  KEY `dcim_consoleport_name_ef94d0d1` (`name`),
  KEY `dcim_consoleport__name_6ac60d99` (`_name`),
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
  `created` date DEFAULT NULL,
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_consoleserverport_device_id_name_fb1c5999_uniq` (`device_id`,`name`),
  KEY `dcim_consoleserverpo__cable_peer_type_id_132b6744_fk_django_co` (`_cable_peer_type_id`),
  KEY `dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id` (`_path_id`),
  KEY `dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id` (`cable_id`),
  KEY `dcim_consoleserverport_name_2319aaf4` (`name`),
  KEY `dcim_consoleserverport__name_70f9317c` (`_name`),
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
  `created` date DEFAULT NULL,
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `local_context_data` json DEFAULT NULL,
  `local_context_data_owner_object_id` char(32) DEFAULT NULL,
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
  `device_role_id` char(32) NOT NULL,
  `device_type_id` char(32) NOT NULL,
  `local_context_data_owner_content_type_id` int DEFAULT NULL,
  `platform_id` char(32) DEFAULT NULL,
  `primary_ip4_id` char(32) DEFAULT NULL,
  `primary_ip6_id` char(32) DEFAULT NULL,
  `rack_id` char(32) DEFAULT NULL,
  `site_id` char(32) NOT NULL,
  `status_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `virtual_chassis_id` char(32) DEFAULT NULL,
  `local_context_schema_id` char(32) DEFAULT NULL,
  `secrets_group_id` char(32) DEFAULT NULL,
  `location_id` char(32) DEFAULT NULL,
  `device_redundancy_group_priority` smallint unsigned DEFAULT NULL,
  `device_redundancy_group_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_tag` (`asset_tag`),
  UNIQUE KEY `primary_ip4_id` (`primary_ip4_id`),
  UNIQUE KEY `primary_ip6_id` (`primary_ip6_id`),
  UNIQUE KEY `dcim_device_site_id_tenant_id_name_93f4f962_uniq` (`site_id`,`tenant_id`,`name`),
  UNIQUE KEY `dcim_device_virtual_chassis_id_vc_position_efea7133_uniq` (`virtual_chassis_id`,`vc_position`),
  UNIQUE KEY `dcim_device_rack_id_position_face_43208a79_uniq` (`rack_id`,`position`,`face`),
  KEY `dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id` (`cluster_id`),
  KEY `dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id` (`device_role_id`),
  KEY `dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id` (`device_type_id`),
  KEY `dcim_device_local_context_data_o_5d06013b_fk_django_co` (`local_context_data_owner_content_type_id`),
  KEY `dcim_device_platform_id_468138f1_fk_dcim_platform_id` (`platform_id`),
  KEY `dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `dcim_device_status_id_96d2fc6f` (`status_id`),
  KEY `dcim_device_local_context_schema_0ff8d657_fk_extras_co` (`local_context_schema_id`),
  KEY `dcim_device_secrets_group_id_52d75f4a_fk_extras_secretsgroup_id` (`secrets_group_id`),
  KEY `dcim_device__name_a8ed2cdf` (`_name`),
  KEY `dcim_device_name_cfa61dd8` (`name`),
  KEY `dcim_device_serial_9170722b` (`serial`),
  KEY `dcim_device_location_id_11a7bedb_fk_dcim_location_id` (`location_id`),
  KEY `dcim_device_device_redundancy_gr_ca97f1fc_fk_dcim_devi` (`device_redundancy_group_id`),
  CONSTRAINT `dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `virtualization_cluster` (`id`),
  CONSTRAINT `dcim_device_device_redundancy_gr_ca97f1fc_fk_dcim_devi` FOREIGN KEY (`device_redundancy_group_id`) REFERENCES `dcim_deviceredundancygroup` (`id`),
  CONSTRAINT `dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id` FOREIGN KEY (`device_role_id`) REFERENCES `dcim_devicerole` (`id`),
  CONSTRAINT `dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
  CONSTRAINT `dcim_device_local_context_data_o_5d06013b_fk_django_co` FOREIGN KEY (`local_context_data_owner_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_device_local_context_schema_0ff8d657_fk_extras_co` FOREIGN KEY (`local_context_schema_id`) REFERENCES `extras_configcontextschema` (`id`),
  CONSTRAINT `dcim_device_location_id_11a7bedb_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `dcim_device_platform_id_468138f1_fk_dcim_platform_id` FOREIGN KEY (`platform_id`) REFERENCES `dcim_platform` (`id`),
  CONSTRAINT `dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id` FOREIGN KEY (`primary_ip4_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id` FOREIGN KEY (`primary_ip6_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `dcim_device_rack_id_23bde71f_fk_dcim_rack_id` FOREIGN KEY (`rack_id`) REFERENCES `dcim_rack` (`id`),
  CONSTRAINT `dcim_device_secrets_group_id_52d75f4a_fk_extras_secretsgroup_id` FOREIGN KEY (`secrets_group_id`) REFERENCES `extras_secretsgroup` (`id`),
  CONSTRAINT `dcim_device_site_id_ff897cf6_fk_dcim_site_id` FOREIGN KEY (`site_id`) REFERENCES `dcim_site` (`id`),
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
  `created` date DEFAULT NULL,
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
  `created` date DEFAULT NULL,
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `failover_strategy` varchar(50) NOT NULL,
  `comments` longtext NOT NULL,
  `secrets_group_id` char(32) DEFAULT NULL,
  `status_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
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
-- Table structure for table `dcim_devicerole`
--

DROP TABLE IF EXISTS `dcim_devicerole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_devicerole` (
  `id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `color` varchar(6) NOT NULL,
  `vm_role` tinyint(1) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_devicerole`
--

LOCK TABLES `dcim_devicerole` WRITE;
/*!40000 ALTER TABLE `dcim_devicerole` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_devicerole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_devicetype`
--

DROP TABLE IF EXISTS `dcim_devicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_devicetype` (
  `id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `model` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
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
  UNIQUE KEY `dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq` (`manufacturer_id`,`slug`),
  KEY `dcim_devicetype_slug_448745bd` (`slug`),
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
  `created` date DEFAULT NULL,
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
  `rear_port_id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq` (`rear_port_id`,`rear_port_position`),
  UNIQUE KEY `dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq` (`device_type_id`,`name`),
  CONSTRAINT `dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
  CONSTRAINT `dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear` FOREIGN KEY (`rear_port_id`) REFERENCES `dcim_rearporttemplate` (`id`),
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
  `mac_address` varchar(18) DEFAULT NULL,
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
  `status_id` char(32) DEFAULT NULL,
  `parent_interface_id` char(32) DEFAULT NULL,
  `bridge_id` char(32) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_interface_device_id_name_bffc4ec4_uniq` (`device_id`,`name`),
  KEY `dcim_interface__cable_peer_type_id_ce52cb81_fk_django_co` (`_cable_peer_type_id`),
  KEY `dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id` (`_path_id`),
  KEY `dcim_interface_cable_id_1b264edb_fk_dcim_cable_id` (`cable_id`),
  KEY `dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id` (`lag_id`),
  KEY `dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id` (`untagged_vlan_id`),
  KEY `dcim_interface_name_bc4e48ab` (`name`),
  KEY `dcim_interface__name_8796fa61` (`_name`),
  KEY `dcim_interface_status_id_5d68d3d6` (`status_id`),
  KEY `dcim_interface_parent_interface_id_dc46b61a_fk_dcim_interface_id` (`parent_interface_id`),
  KEY `dcim_interface_bridge_id_f2a8df85_fk_dcim_interface_id` (`bridge_id`),
  CONSTRAINT `dcim_interface__cable_peer_type_id_ce52cb81_fk_django_co` FOREIGN KEY (`_cable_peer_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id` FOREIGN KEY (`_path_id`) REFERENCES `dcim_cablepath` (`id`),
  CONSTRAINT `dcim_interface_bridge_id_f2a8df85_fk_dcim_interface_id` FOREIGN KEY (`bridge_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `dcim_interface_cable_id_1b264edb_fk_dcim_cable_id` FOREIGN KEY (`cable_id`) REFERENCES `dcim_cable` (`id`),
  CONSTRAINT `dcim_interface_device_id_359c6115_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id` FOREIGN KEY (`lag_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `dcim_interface_parent_interface_id_dc46b61a_fk_dcim_interface_id` FOREIGN KEY (`parent_interface_id`) REFERENCES `dcim_interface` (`id`),
  CONSTRAINT `dcim_interface_status_id_5d68d3d6_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id` FOREIGN KEY (`untagged_vlan_id`) REFERENCES `ipam_vlan` (`id`),
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
  `status_id` char(32) DEFAULT NULL,
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
  `created` date DEFAULT NULL,
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
  `created` date DEFAULT NULL,
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
  `lft` int unsigned NOT NULL,
  `rght` int unsigned NOT NULL,
  `tree_id` int unsigned NOT NULL,
  `level` int unsigned NOT NULL,
  `device_id` char(32) NOT NULL,
  `manufacturer_id` char(32) DEFAULT NULL,
  `parent_id` char(32) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_tag` (`asset_tag`),
  UNIQUE KEY `dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq` (`device_id`,`parent_id`,`name`),
  KEY `dcim_inventoryitem_tree_id_4676ade2` (`tree_id`),
  KEY `dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu` (`manufacturer_id`),
  KEY `dcim_inventoryitem_parent_id_7ebcd457` (`parent_id`),
  KEY `dcim_inventoryitem_name_3e415949` (`name`),
  KEY `dcim_inventoryitem_serial_9f53019e` (`serial`),
  KEY `dcim_inventoryitem__name_959f73cc` (`_name`),
  CONSTRAINT `dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id` FOREIGN KEY (`device_id`) REFERENCES `dcim_device` (`id`),
  CONSTRAINT `dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu` FOREIGN KEY (`manufacturer_id`) REFERENCES `dcim_manufacturer` (`id`),
  CONSTRAINT `dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id` FOREIGN KEY (`parent_id`) REFERENCES `dcim_inventoryitem` (`id`),
  CONSTRAINT `dcim_inventoryitem_chk_1` CHECK ((`lft` >= 0)),
  CONSTRAINT `dcim_inventoryitem_chk_2` CHECK ((`rght` >= 0)),
  CONSTRAINT `dcim_inventoryitem_chk_3` CHECK ((`tree_id` >= 0)),
  CONSTRAINT `dcim_inventoryitem_chk_4` CHECK ((`level` >= 0))
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `location_type_id` char(32) NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  `site_id` char(32) DEFAULT NULL,
  `status_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `dcim_location_parent_id_name_1e7c6218_uniq` (`parent_id`,`name`),
  KEY `dcim_location_location_type_id_511a9421_fk_dcim_locationtype_id` (`location_type_id`),
  KEY `dcim_location_site_id_b55e975f_fk_dcim_site_id` (`site_id`),
  KEY `dcim_location_tenant_id_2c4df974_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `dcim_location_name_da208275` (`name`),
  KEY `dcim_location__name_09ea12a5` (`_name`),
  KEY `dcim_location_status_id_3d74f10a` (`status_id`),
  CONSTRAINT `dcim_location_location_type_id_511a9421_fk_dcim_locationtype_id` FOREIGN KEY (`location_type_id`) REFERENCES `dcim_locationtype` (`id`),
  CONSTRAINT `dcim_location_parent_id_d77f3318_fk_dcim_location_id` FOREIGN KEY (`parent_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `dcim_location_site_id_b55e975f_fk_dcim_site_id` FOREIGN KEY (`site_id`) REFERENCES `dcim_site` (`id`),
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  `nestable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `napalm_driver` varchar(50) NOT NULL,
  `napalm_args` json DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `manufacturer_id` char(32) DEFAULT NULL,
  `network_driver` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
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
  `created` date DEFAULT NULL,
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
  `status_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq` (`power_panel_id`,`name`),
  KEY `dcim_powerfeed__cable_peer_type_id_9f930589_fk_django_co` (`_cable_peer_type_id`),
  KEY `dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id` (`_path_id`),
  KEY `dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id` (`cable_id`),
  KEY `dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id` (`rack_id`),
  KEY `dcim_powerfeed_status_id_8c424cc3` (`status_id`),
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_poweroutlet_device_id_name_981b00c1_uniq` (`device_id`,`name`),
  KEY `dcim_poweroutlet__cable_peer_type_id_bbff28d0_fk_django_co` (`_cable_peer_type_id`),
  KEY `dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id` (`_path_id`),
  KEY `dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id` (`cable_id`),
  KEY `dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id` (`power_port_id`),
  KEY `dcim_poweroutlet_name_98c8e7a2` (`name`),
  KEY `dcim_poweroutlet__name_0ecdd374` (`_name`),
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
  `power_port_id` char(32) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq` (`device_type_id`,`name`),
  KEY `dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe` (`power_port_id`),
  CONSTRAINT `dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi` FOREIGN KEY (`device_type_id`) REFERENCES `dcim_devicetype` (`id`),
  CONSTRAINT `dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe` FOREIGN KEY (`power_port_id`) REFERENCES `dcim_powerporttemplate` (`id`)
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `rack_group_id` char(32) DEFAULT NULL,
  `site_id` char(32) NOT NULL,
  `location_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_powerpanel_site_id_name_804df4c0_uniq` (`site_id`,`name`),
  KEY `dcim_powerpanel_rack_group_id_76467cc9_fk_dcim_rackgroup_id` (`rack_group_id`),
  KEY `dcim_powerpanel_name_09946067` (`name`),
  KEY `dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id` (`location_id`),
  CONSTRAINT `dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `dcim_powerpanel_rack_group_id_76467cc9_fk_dcim_rackgroup_id` FOREIGN KEY (`rack_group_id`) REFERENCES `dcim_rackgroup` (`id`),
  CONSTRAINT `dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id` FOREIGN KEY (`site_id`) REFERENCES `dcim_site` (`id`)
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_powerport_device_id_name_948af82c_uniq` (`device_id`,`name`),
  KEY `dcim_powerport__cable_peer_type_id_9df2a278_fk_django_co` (`_cable_peer_type_id`),
  KEY `dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id` (`_path_id`),
  KEY `dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id` (`cable_id`),
  KEY `dcim_powerport_name_8b95aa68` (`name`),
  KEY `dcim_powerport__name_cd2ccdac` (`_name`),
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
  `created` date DEFAULT NULL,
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
  `created` date DEFAULT NULL,
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
  `group_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  `site_id` char(32) NOT NULL,
  `status_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `location_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_tag` (`asset_tag`),
  UNIQUE KEY `dcim_rack_group_id_name_846f3826_uniq` (`group_id`,`name`),
  UNIQUE KEY `dcim_rack_group_id_facility_id_f16a53ae_uniq` (`group_id`,`facility_id`),
  KEY `dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id` (`role_id`),
  KEY `dcim_rack_site_id_403c7b3a_fk_dcim_site_id` (`site_id`),
  KEY `dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `dcim_rack_status_id_ee3dee3e` (`status_id`),
  KEY `dcim_rack_name_b74aa0b4` (`name`),
  KEY `dcim_rack_serial_d9cd7ac4` (`serial`),
  KEY `dcim_rack__name_e3323581` (`_name`),
  KEY `dcim_rack_location_id_5f63ec31_fk_dcim_location_id` (`location_id`),
  CONSTRAINT `dcim_rack_group_id_44e90ea9_fk_dcim_rackgroup_id` FOREIGN KEY (`group_id`) REFERENCES `dcim_rackgroup` (`id`),
  CONSTRAINT `dcim_rack_location_id_5f63ec31_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id` FOREIGN KEY (`role_id`) REFERENCES `dcim_rackrole` (`id`),
  CONSTRAINT `dcim_rack_site_id_403c7b3a_fk_dcim_site_id` FOREIGN KEY (`site_id`) REFERENCES `dcim_site` (`id`),
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `lft` int unsigned NOT NULL,
  `rght` int unsigned NOT NULL,
  `tree_id` int unsigned NOT NULL,
  `level` int unsigned NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  `site_id` char(32) NOT NULL,
  `location_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dcim_rackgroup_site_id_slug_7fbfd118_uniq` (`site_id`,`slug`),
  UNIQUE KEY `dcim_rackgroup_site_id_name_c9bd921f_uniq` (`site_id`,`name`),
  KEY `dcim_rackgroup_slug_3f4582a7` (`slug`),
  KEY `dcim_rackgroup_tree_id_9c2ad6f4` (`tree_id`),
  KEY `dcim_rackgroup_parent_id_cc315105` (`parent_id`),
  KEY `dcim_rackgroup_name_6a84593a` (`name`),
  KEY `dcim_rackgroup_location_id_5a6fdeac_fk_dcim_location_id` (`location_id`),
  CONSTRAINT `dcim_rackgroup_location_id_5a6fdeac_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `dcim_rackgroup_parent_id_cc315105_fk_dcim_rackgroup_id` FOREIGN KEY (`parent_id`) REFERENCES `dcim_rackgroup` (`id`),
  CONSTRAINT `dcim_rackgroup_site_id_13520e89_fk_dcim_site_id` FOREIGN KEY (`site_id`) REFERENCES `dcim_site` (`id`),
  CONSTRAINT `dcim_rackgroup_chk_1` CHECK ((`lft` >= 0)),
  CONSTRAINT `dcim_rackgroup_chk_2` CHECK ((`rght` >= 0)),
  CONSTRAINT `dcim_rackgroup_chk_3` CHECK ((`tree_id` >= 0)),
  CONSTRAINT `dcim_rackgroup_chk_4` CHECK ((`level` >= 0))
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
  `created` date DEFAULT NULL,
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
-- Table structure for table `dcim_rackrole`
--

DROP TABLE IF EXISTS `dcim_rackrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_rackrole` (
  `id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `color` varchar(6) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_rackrole`
--

LOCK TABLES `dcim_rackrole` WRITE;
/*!40000 ALTER TABLE `dcim_rackrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_rackrole` ENABLE KEYS */;
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
  `created` date DEFAULT NULL,
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
  `created` date DEFAULT NULL,
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
-- Table structure for table `dcim_region`
--

DROP TABLE IF EXISTS `dcim_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_region` (
  `id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `lft` int unsigned NOT NULL,
  `rght` int unsigned NOT NULL,
  `tree_id` int unsigned NOT NULL,
  `level` int unsigned NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `dcim_region_tree_id_a09ea9a7` (`tree_id`),
  KEY `dcim_region_parent_id_2486f5d4` (`parent_id`),
  CONSTRAINT `dcim_region_parent_id_2486f5d4_fk_dcim_region_id` FOREIGN KEY (`parent_id`) REFERENCES `dcim_region` (`id`),
  CONSTRAINT `dcim_region_chk_1` CHECK ((`lft` >= 0)),
  CONSTRAINT `dcim_region_chk_2` CHECK ((`rght` >= 0)),
  CONSTRAINT `dcim_region_chk_3` CHECK ((`tree_id` >= 0)),
  CONSTRAINT `dcim_region_chk_4` CHECK ((`level` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_region`
--

LOCK TABLES `dcim_region` WRITE;
/*!40000 ALTER TABLE `dcim_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_site`
--

DROP TABLE IF EXISTS `dcim_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_site` (
  `id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `facility` varchar(50) NOT NULL,
  `asn` bigint DEFAULT NULL,
  `time_zone` varchar(63) NOT NULL,
  `description` varchar(200) NOT NULL,
  `physical_address` varchar(200) NOT NULL,
  `shipping_address` varchar(200) NOT NULL,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `contact_name` varchar(50) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `contact_email` varchar(254) NOT NULL,
  `comments` longtext NOT NULL,
  `region_id` char(32) DEFAULT NULL,
  `status_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `dcim_site_region_id_45210932_fk_dcim_region_id` (`region_id`),
  KEY `dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `dcim_site_status_id_e6a50f56` (`status_id`),
  KEY `dcim_site__name_6144ca75` (`_name`),
  CONSTRAINT `dcim_site_region_id_45210932_fk_dcim_region_id` FOREIGN KEY (`region_id`) REFERENCES `dcim_region` (`id`),
  CONSTRAINT `dcim_site_status_id_e6a50f56_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcim_site`
--

LOCK TABLES `dcim_site` WRITE;
/*!40000 ALTER TABLE `dcim_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcim_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcim_virtualchassis`
--

DROP TABLE IF EXISTS `dcim_virtualchassis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcim_virtualchassis` (
  `id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(64) NOT NULL,
  `domain` varchar(30) NOT NULL,
  `master_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `master_id` (`master_id`),
  KEY `dcim_virtualchassis_name_7dcc237d` (`name`),
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (30,'admin','logentry'),(19,'auth','group'),(18,'auth','permission'),(1,'circuits','circuit'),(37,'circuits','circuittermination'),(38,'circuits','circuittype'),(39,'circuits','provider'),(40,'circuits','providernetwork'),(20,'constance','config'),(21,'contenttypes','contenttype'),(118,'database','constance'),(2,'dcim','cable'),(41,'dcim','cablepath'),(42,'dcim','consoleport'),(43,'dcim','consoleporttemplate'),(44,'dcim','consoleserverport'),(45,'dcim','consoleserverporttemplate'),(3,'dcim','device'),(46,'dcim','devicebay'),(47,'dcim','devicebaytemplate'),(8,'dcim','deviceredundancygroup'),(48,'dcim','devicerole'),(49,'dcim','devicetype'),(50,'dcim','frontport'),(51,'dcim','frontporttemplate'),(4,'dcim','interface'),(9,'dcim','interfaceredundancygroup'),(69,'dcim','interfaceredundancygroupassociation'),(52,'dcim','interfacetemplate'),(53,'dcim','inventoryitem'),(5,'dcim','location'),(68,'dcim','locationtype'),(54,'dcim','manufacturer'),(55,'dcim','platform'),(6,'dcim','powerfeed'),(56,'dcim','poweroutlet'),(57,'dcim','poweroutlettemplate'),(58,'dcim','powerpanel'),(59,'dcim','powerport'),(60,'dcim','powerporttemplate'),(7,'dcim','rack'),(61,'dcim','rackgroup'),(62,'dcim','rackreservation'),(63,'dcim','rackrole'),(64,'dcim','rearport'),(65,'dcim','rearporttemplate'),(66,'dcim','region'),(10,'dcim','site'),(67,'dcim','virtualchassis'),(36,'django_celery_beat','clockedschedule'),(31,'django_celery_beat','crontabschedule'),(32,'django_celery_beat','intervalschedule'),(33,'django_celery_beat','periodictask'),(34,'django_celery_beat','periodictasks'),(35,'django_celery_beat','solarschedule'),(117,'django_rq','queue'),(93,'extras','computedfield'),(77,'extras','configcontext'),(92,'extras','configcontextschema'),(16,'extras','customfield'),(78,'extras','customfieldchoice'),(79,'extras','customlink'),(103,'extras','dynamicgroup'),(104,'extras','dynamicgroupmembership'),(80,'extras','exporttemplate'),(94,'extras','fileattachment'),(95,'extras','fileproxy'),(81,'extras','gitrepository'),(91,'extras','graphqlquery'),(96,'extras','healthchecktestmodel'),(82,'extras','imageattachment'),(17,'extras','job'),(107,'extras','jobbutton'),(106,'extras','jobhook'),(102,'extras','joblogentry'),(83,'extras','jobresult'),(105,'extras','note'),(90,'extras','objectchange'),(84,'extras','relationship'),(89,'extras','relationshipassociation'),(98,'extras','scheduledjob'),(97,'extras','scheduledjobs'),(99,'extras','secret'),(100,'extras','secretsgroup'),(101,'extras','secretsgroupassociation'),(88,'extras','status'),(85,'extras','tag'),(87,'extras','taggeditem'),(86,'extras','webhook'),(70,'ipam','aggregate'),(11,'ipam','ipaddress'),(12,'ipam','prefix'),(71,'ipam','rir'),(72,'ipam','role'),(73,'ipam','routetarget'),(76,'ipam','service'),(13,'ipam','vlan'),(75,'ipam','vlangroup'),(74,'ipam','vrf'),(22,'sessions','session'),(23,'social_django','association'),(24,'social_django','code'),(25,'social_django','nonce'),(27,'social_django','partial'),(26,'social_django','usersocialauth'),(28,'taggit','tag'),(29,'taggit','taggeditem'),(109,'tenancy','tenant'),(108,'tenancy','tenantgroup'),(111,'users','admingroup'),(113,'users','objectpermission'),(112,'users','token'),(110,'users','user'),(114,'virtualization','cluster'),(115,'virtualization','clustergroup'),(116,'virtualization','clustertype'),(14,'virtualization','virtualmachine'),(15,'virtualization','vminterface');
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
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-05-12 04:10:53.896102'),(2,'contenttypes','0002_remove_content_type_name','2025-05-12 04:10:53.927520'),(3,'auth','0001_initial','2025-05-12 04:10:54.029220'),(4,'auth','0002_alter_permission_name_max_length','2025-05-12 04:10:54.052433'),(5,'auth','0003_alter_user_email_max_length','2025-05-12 04:10:54.057885'),(6,'auth','0004_alter_user_username_opts','2025-05-12 04:10:54.062942'),(7,'auth','0005_alter_user_last_login_null','2025-05-12 04:10:54.071508'),(8,'auth','0006_require_contenttypes_0002','2025-05-12 04:10:54.073473'),(9,'auth','0007_alter_validators_add_error_messages','2025-05-12 04:10:54.079324'),(10,'auth','0008_alter_user_username_max_length','2025-05-12 04:10:54.084334'),(11,'auth','0009_alter_user_last_name_max_length','2025-05-12 04:10:54.089481'),(12,'auth','0010_alter_group_name_max_length','2025-05-12 04:10:54.098539'),(13,'auth','0011_update_proxy_permissions','2025-05-12 04:10:54.104098'),(14,'auth','0012_alter_user_first_name_max_length','2025-05-12 04:10:54.108779'),(15,'users','0001_initial','2025-05-12 04:10:54.503812'),(16,'admin','0001_initial','2025-05-12 04:10:54.576081'),(17,'admin','0002_logentry_remove_auto_add','2025-05-12 04:10:54.585990'),(18,'admin','0003_logentry_add_action_flag_choices','2025-05-12 04:10:54.595733'),(19,'extras','0001_initial_part_1','2025-05-12 04:10:55.194227'),(20,'tenancy','0001_initial','2025-05-12 04:10:55.327075'),(21,'dcim','0001_initial_part_1','2025-05-12 04:10:55.900886'),(22,'dcim','0002_initial_part_2','2025-05-12 04:10:56.537434'),(23,'ipam','0001_initial_part_1','2025-05-12 04:10:57.189765'),(24,'extras','0002_initial_part_2','2025-05-12 04:10:57.690033'),(25,'dcim','0003_initial_part_3','2025-05-12 04:11:02.055267'),(26,'virtualization','0001_initial','2025-05-12 04:11:03.174272'),(27,'dcim','0004_initial_part_4','2025-05-12 04:11:08.368914'),(28,'extras','0003_initial_part_3','2025-05-12 04:11:10.001784'),(29,'extras','0004_populate_default_status_records','2025-05-12 04:11:10.317497'),(30,'extras','0005_configcontext_device_types','2025-05-12 04:11:10.434680'),(31,'extras','0006_graphqlquery','2025-05-12 04:11:10.455565'),(32,'extras','0007_configcontextschema','2025-05-12 04:11:10.861022'),(33,'extras','0008_jobresult__custom_field_data','2025-05-12 04:11:10.925526'),(34,'extras','0009_computedfield','2025-05-12 04:11:11.034818'),(35,'extras','0010_change_cf_validation_max_min_field_to_bigint','2025-05-12 04:11:11.193368'),(36,'extras','0011_fileattachment_fileproxy','2025-05-12 04:11:11.275080'),(37,'extras','0012_healthchecktestmodel','2025-05-12 04:11:11.288451'),(38,'extras','0013_default_fallback_value_computedfield','2025-05-12 04:11:11.321716'),(39,'extras','0014_auto_slug','2025-05-12 04:11:11.733594'),(40,'extras','0015_scheduled_job','2025-05-12 04:11:11.982000'),(41,'extras','0016_secret','2025-05-12 04:11:12.359308'),(42,'extras','0017_joblogentry','2025-05-12 04:11:12.459368'),(43,'extras','0018_joblog_data_migration','2025-05-12 04:11:12.731940'),(44,'extras','0019_joblogentry__meta_options__related_name','2025-05-12 04:11:12.803679'),(45,'extras','0020_customfield_changelog','2025-05-12 04:11:12.966934'),(46,'extras','0021_customfield_changelog_data','2025-05-12 04:11:13.039894'),(47,'extras','0022_objectchange_object_datav2','2025-05-12 04:11:13.099101'),(48,'extras','0023_job_model','2025-05-12 04:11:13.781578'),(49,'extras','0024_job_data_migration','2025-05-12 04:11:13.855827'),(50,'extras','0025_add_advanced_ui_boolean_to_customfield_conputedfield_and_relationship','2025-05-12 04:11:14.034925'),(51,'extras','0026_job_add_gitrepository_fk','2025-05-12 04:11:14.257046'),(52,'extras','0027_job_gitrepository_data_migration','2025-05-12 04:11:14.521249'),(53,'extras','0028_job_reduce_source','2025-05-12 04:11:14.606914'),(54,'extras','0029_dynamicgroup','2025-05-12 04:11:14.712052'),(55,'extras','0030_webhook_alter_unique_together','2025-05-12 04:11:14.765462'),(56,'extras','0031_tag_content_types','2025-05-12 04:11:14.893937'),(57,'extras','0032_tag_content_types_data_migration','2025-05-12 04:11:14.973636'),(58,'extras','0033_add__optimized_indexing','2025-05-12 04:11:15.970904'),(59,'extras','0034_alter_fileattachment_mimetype','2025-05-12 04:11:15.994240'),(60,'extras','0035_scheduledjob_crontab','2025-05-12 04:11:16.049681'),(61,'extras','0036_job_add_has_sensitive_variables','2025-05-12 04:11:16.223992'),(62,'extras','0037_configcontextschema__remove_name_unique__create_constraint_unique_name_owner','2025-05-12 04:11:16.493573'),(63,'dcim','0005_device_local_context_schema','2025-05-12 04:11:16.646395'),(64,'dcim','0006_auto_slug','2025-05-12 04:11:16.993578'),(65,'dcim','0007_device_secrets_group','2025-05-12 04:11:17.368544'),(66,'dcim','0008_increase_all_serial_lengths','2025-05-12 04:11:17.657809'),(67,'dcim','0009_add_natural_indexing','2025-05-12 04:11:20.137295'),(68,'dcim','0010_interface_status','2025-05-12 04:11:20.276871'),(69,'dcim','0011_interface_status_data_migration','2025-05-12 04:11:20.363712'),(70,'dcim','0012_interface_parent_bridge','2025-05-12 04:11:20.600961'),(71,'dcim','0013_location_location_type','2025-05-12 04:11:22.019632'),(72,'circuits','0001_initial_part_1','2025-05-12 04:11:22.091917'),(73,'circuits','0002_initial_part_2','2025-05-12 04:11:23.686819'),(74,'circuits','0003_auto_slug','2025-05-12 04:11:23.735194'),(75,'circuits','0004_increase_provider_account_length','2025-05-12 04:11:23.798139'),(76,'circuits','0005_providernetwork','2025-05-12 04:11:24.734372'),(77,'circuits','0006_cache_circuit_terminations','2025-05-12 04:11:24.816056'),(78,'circuits','0007_circuitterminations_primary_model','2025-05-12 04:11:25.335274'),(79,'circuits','0008_add_natural_indexing','2025-05-12 04:11:25.391004'),(80,'circuits','0009_circuittermination_location','2025-05-12 04:11:25.525858'),(81,'database','0001_initial','2025-05-12 04:11:25.543908'),(82,'database','0002_auto_20190129_2304','2025-05-12 04:11:25.566595'),(83,'ipam','0002_initial_part_2','2025-05-12 04:11:28.181907'),(84,'ipam','0003_remove_max_length','2025-05-12 04:11:28.699408'),(85,'ipam','0004_fixup_p2p_broadcast','2025-05-12 04:11:28.781161'),(86,'ipam','0005_auto_slug','2025-05-12 04:11:28.817295'),(87,'ipam','0006_ipaddress_nat_outside_list','2025-05-12 04:11:29.016209'),(88,'ipam','0007_add_natural_indexing','2025-05-12 04:11:29.767905'),(89,'ipam','0008_prefix_vlan_vlangroup_location','2025-05-12 04:11:30.135782'),(90,'ipam','0009_alter_vlan_name','2025-05-12 04:11:30.417630'),(91,'extras','0038_configcontext_locations','2025-05-12 04:11:30.560838'),(92,'extras','0039_objectchange__add_change_context','2025-05-12 04:11:30.718519'),(93,'extras','0040_dynamicgroup__dynamicgroupmembership','2025-05-12 04:11:30.943248'),(94,'extras','0041_jobresult_job_kwargs','2025-05-12 04:11:31.016970'),(95,'extras','0042_job__add_is_job_hook_receiver','2025-05-12 04:11:31.116510'),(96,'extras','0043_note','2025-05-12 04:11:31.495311'),(97,'extras','0044_add_job_hook','2025-05-12 04:11:31.680596'),(98,'extras','0045_add_custom_field_slug','2025-05-12 04:11:31.756033'),(99,'extras','0046_populate_custom_field_slug_label','2025-05-12 04:11:31.840262'),(100,'extras','0047_enforce_custom_field_slug','2025-05-12 04:11:31.925669'),(101,'extras','0048_alter_objectchange_change_context_detail','2025-05-12 04:11:31.983639'),(102,'extras','0049_alter_tag_slug','2025-05-12 04:11:32.068550'),(103,'extras','0050_customfield_grouping','2025-05-12 04:11:32.363949'),(104,'extras','0051_add_job_task_queues','2025-05-12 04:11:32.560351'),(105,'dcim','0014_location_status_data_migration','2025-05-12 04:11:32.648213'),(106,'dcim','0015_device_components__changeloggedmodel','2025-05-12 04:11:35.555983'),(107,'dcim','0016_device_components__timestamp_data_migration','2025-05-12 04:11:35.643109'),(108,'dcim','0017_locationtype_nestable','2025-05-12 04:11:35.715271'),(109,'dcim','0018_device_redundancy_group','2025-05-12 04:11:36.283152'),(110,'extras','0052_configcontext_device_redundancy_groups','2025-05-12 04:11:36.429939'),(111,'extras','0053_relationship_required_on','2025-05-12 04:11:36.499986'),(112,'extras','0054_scheduledjob_kwargs_request_user_change','2025-05-12 04:11:36.582554'),(113,'extras','0055_configcontext_dynamic_groups','2025-05-12 04:11:37.055971'),(114,'extras','0056_objectchange_add_reverse_time_idx','2025-05-12 04:11:37.114894'),(115,'extras','0057_jobbutton','2025-05-12 04:11:37.439579'),(116,'extras','0058_jobresult_add_time_status_idxs','2025-05-12 04:11:38.000105'),(117,'dcim','0019_device_redundancy_group_data_migration','2025-05-12 04:11:38.091870'),(118,'dcim','0020_increase_device_asset_tag_size_limit','2025-05-12 04:11:38.266470'),(119,'dcim','0021_platform_network_driver','2025-05-12 04:11:38.323380'),(120,'dcim','0022_interface_redundancy_group','2025-05-12 04:11:39.192863'),(121,'dcim','0023_interface_redundancy_group_data_migration','2025-05-12 04:11:39.291352'),(122,'django_celery_beat','0001_initial','2025-05-12 04:11:39.412713'),(123,'django_celery_beat','0002_auto_20161118_0346','2025-05-12 04:11:39.465682'),(124,'django_celery_beat','0003_auto_20161209_0049','2025-05-12 04:11:39.486803'),(125,'django_celery_beat','0004_auto_20170221_0000','2025-05-12 04:11:39.494725'),(126,'django_celery_beat','0005_add_solarschedule_events_choices','2025-05-12 04:11:39.502554'),(127,'django_celery_beat','0006_auto_20180322_0932','2025-05-12 04:11:39.571801'),(128,'django_celery_beat','0007_auto_20180521_0826','2025-05-12 04:11:39.639986'),(129,'django_celery_beat','0008_auto_20180914_1922','2025-05-12 04:11:39.670795'),(130,'django_celery_beat','0006_auto_20180210_1226','2025-05-12 04:11:39.688950'),(131,'django_celery_beat','0006_periodictask_priority','2025-05-12 04:11:39.736081'),(132,'django_celery_beat','0009_periodictask_headers','2025-05-12 04:11:39.777432'),(133,'django_celery_beat','0010_auto_20190429_0326','2025-05-12 04:11:39.952385'),(134,'django_celery_beat','0011_auto_20190508_0153','2025-05-12 04:11:40.009888'),(135,'django_celery_beat','0012_periodictask_expire_seconds','2025-05-12 04:11:40.059799'),(136,'django_celery_beat','0013_auto_20200609_0727','2025-05-12 04:11:40.069894'),(137,'django_celery_beat','0014_remove_clockedschedule_enabled','2025-05-12 04:11:40.099209'),(138,'django_celery_beat','0015_edit_solarschedule_events_choices','2025-05-12 04:11:40.107474'),(139,'django_celery_beat','0016_alter_crontabschedule_timezone','2025-05-12 04:11:40.115565'),(140,'django_celery_beat','0017_alter_crontabschedule_month_of_year','2025-05-12 04:11:40.123588'),(141,'django_celery_beat','0018_improve_crontab_helptext','2025-05-12 04:11:40.131494'),(142,'django_rq','0001_initial','2025-05-12 04:11:40.136139'),(143,'sessions','0001_initial','2025-05-12 04:11:40.156889'),(144,'default','0001_initial','2025-05-12 04:11:40.544632'),(145,'social_auth','0001_initial','2025-05-12 04:11:40.547242'),(146,'default','0002_add_related_name','2025-05-12 04:11:40.632635'),(147,'social_auth','0002_add_related_name','2025-05-12 04:11:40.635050'),(148,'default','0003_alter_email_max_length','2025-05-12 04:11:40.646407'),(149,'social_auth','0003_alter_email_max_length','2025-05-12 04:11:40.648667'),(150,'default','0004_auto_20160423_0400','2025-05-12 04:11:40.666022'),(151,'social_auth','0004_auto_20160423_0400','2025-05-12 04:11:40.668210'),(152,'social_auth','0005_auto_20160727_2333','2025-05-12 04:11:40.679982'),(153,'social_django','0006_partial','2025-05-12 04:11:40.698921'),(154,'social_django','0007_code_timestamp','2025-05-12 04:11:40.727390'),(155,'social_django','0008_partial_timestamp','2025-05-12 04:11:40.758187'),(156,'social_django','0009_auto_20191118_0520','2025-05-12 04:11:40.823962'),(157,'social_django','0010_uid_db_index','2025-05-12 04:11:40.846613'),(158,'social_django','0011_alter_id_fields','2025-05-12 04:11:40.975524'),(159,'taggit','0001_initial','2025-05-12 04:11:41.136808'),(160,'taggit','0002_auto_20150616_2121','2025-05-12 04:11:41.192821'),(161,'taggit','0003_taggeditem_add_unique_index','2025-05-12 04:11:41.254264'),(162,'taggit','0004_alter_taggeditem_content_type_alter_taggeditem_tag','2025-05-12 04:11:41.603109'),(163,'taggit','0005_auto_20220424_2025','2025-05-12 04:11:41.611849'),(164,'tenancy','0002_auto_slug','2025-05-12 04:11:41.778677'),(165,'users','0002_token_ordering_by_created','2025-05-12 04:11:41.795923'),(166,'virtualization','0002_virtualmachine_local_context_schema','2025-05-12 04:11:41.930394'),(167,'virtualization','0003_vminterface_verbose_name','2025-05-12 04:11:41.985064'),(168,'virtualization','0004_auto_slug','2025-05-12 04:11:42.281733'),(169,'virtualization','0005_add_natural_indexing','2025-05-12 04:11:42.492138'),(170,'virtualization','0006_vminterface_status','2025-05-12 04:11:42.627093'),(171,'virtualization','0007_vminterface_status_data_migration','2025-05-12 04:11:42.728309'),(172,'virtualization','0008_vminterface_parent','2025-05-12 04:11:43.174527'),(173,'virtualization','0009_cluster_location','2025-05-12 04:11:43.303249'),(174,'social_django','0002_add_related_name','2025-05-12 04:11:43.309407'),(175,'social_django','0003_alter_email_max_length','2025-05-12 04:11:43.311468'),(176,'social_django','0005_auto_20160727_2333','2025-05-12 04:11:43.313573'),(177,'social_django','0004_auto_20160423_0400','2025-05-12 04:11:43.315768'),(178,'social_django','0001_initial','2025-05-12 04:11:43.317851');
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `slug` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `template` longtext NOT NULL,
  `fallback_value` varchar(500) NOT NULL,
  `weight` smallint unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  `advanced_ui` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `owner_object_id` char(32) DEFAULT NULL,
  `weight` smallint unsigned NOT NULL,
  `description` varchar(200) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `data` json NOT NULL,
  `owner_content_type_id` int DEFAULT NULL,
  `schema_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_name_owner_content_type__c289e08f_uniq` (`name`,`owner_content_type_id`,`owner_object_id`),
  KEY `extras_configcontext_owner_content_type_i_af30e837_fk_django_co` (`owner_content_type_id`),
  KEY `extras_configcontext_schema_id_1a9d39fe_fk_extras_co` (`schema_id`),
  KEY `extras_configcontext_name_4bbfe25d` (`name`),
  CONSTRAINT `extras_configcontext_owner_content_type_i_af30e837_fk_django_co` FOREIGN KEY (`owner_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_configcontext_schema_id_1a9d39fe_fk_extras_co` FOREIGN KEY (`schema_id`) REFERENCES `extras_configcontextschema` (`id`),
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
-- Table structure for table `extras_configcontext_regions`
--

DROP TABLE IF EXISTS `extras_configcontext_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext_regions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configcontext_id` char(32) NOT NULL,
  `region_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq` (`configcontext_id`,`region_id`),
  KEY `extras_configcontext_region_id_35c6ba9d_fk_dcim_regi` (`region_id`),
  CONSTRAINT `extras_configcontext_configcontext_id_73003dbc_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`),
  CONSTRAINT `extras_configcontext_region_id_35c6ba9d_fk_dcim_regi` FOREIGN KEY (`region_id`) REFERENCES `dcim_region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext_regions`
--

LOCK TABLES `extras_configcontext_regions` WRITE;
/*!40000 ALTER TABLE `extras_configcontext_regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext_regions` ENABLE KEYS */;
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
  `devicerole_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq` (`configcontext_id`,`devicerole_id`),
  KEY `extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi` (`devicerole_id`),
  CONSTRAINT `extras_configcontext_configcontext_id_59b67386_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`),
  CONSTRAINT `extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi` FOREIGN KEY (`devicerole_id`) REFERENCES `dcim_devicerole` (`id`)
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
-- Table structure for table `extras_configcontext_sites`
--

DROP TABLE IF EXISTS `extras_configcontext_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_configcontext_sites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configcontext_id` char(32) NOT NULL,
  `site_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq` (`configcontext_id`,`site_id`),
  KEY `extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id` (`site_id`),
  CONSTRAINT `extras_configcontext_configcontext_id_8c54feb9_fk_extras_co` FOREIGN KEY (`configcontext_id`) REFERENCES `extras_configcontext` (`id`),
  CONSTRAINT `extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id` FOREIGN KEY (`site_id`) REFERENCES `dcim_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_configcontext_sites`
--

LOCK TABLES `extras_configcontext_sites` WRITE;
/*!40000 ALTER TABLE `extras_configcontext_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras_configcontext_sites` ENABLE KEYS */;
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `data_schema` json NOT NULL,
  `owner_object_id` char(32) DEFAULT NULL,
  `owner_content_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name_owner` (`name`,`owner_content_type_id`,`owner_object_id`),
  KEY `extras_configcontext_owner_content_type_i_0a0756bc_fk_django_co` (`owner_content_type_id`),
  KEY `extras_configcontextschema_slug_80083c21` (`slug`),
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
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `filter_logic` varchar(50) NOT NULL,
  `default` json DEFAULT NULL,
  `weight` smallint unsigned NOT NULL,
  `validation_minimum` bigint DEFAULT NULL,
  `validation_maximum` bigint DEFAULT NULL,
  `validation_regex` varchar(500) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `advanced_ui` tinyint(1) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `grouping` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `extras_customfield_slug_ed27c4fe_uniq` (`slug`),
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
  `field_id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_customfieldchoice_field_id_value_f959a108_uniq` (`field_id`,`value`),
  CONSTRAINT `extras_customfieldch_field_id_35006739_fk_extras_cu` FOREIGN KEY (`field_id`) REFERENCES `extras_customfield` (`id`),
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
  `created` date DEFAULT NULL,
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `filter` json NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
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
  `created` date DEFAULT NULL,
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
  UNIQUE KEY `extras_exporttemplate_content_type_id_name_own_3b6ea31b_uniq` (`content_type_id`,`name`,`owner_content_type_id`,`owner_object_id`),
  KEY `extras_exporttemplat_owner_content_type_i_6bb67821_fk_django_co` (`owner_content_type_id`),
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `remote_url` varchar(255) NOT NULL,
  `branch` varchar(64) NOT NULL,
  `current_head` varchar(48) NOT NULL,
  `_token` longblob NOT NULL,
  `username` varchar(64) NOT NULL,
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `query` longtext NOT NULL,
  `variables` json NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `source` varchar(16) NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `job_class_name` varchar(100) NOT NULL,
  `slug` varchar(320) NOT NULL,
  `grouping` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `commit_default` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `read_only` tinyint(1) NOT NULL,
  `approval_required` tinyint(1) NOT NULL,
  `soft_time_limit` double NOT NULL,
  `time_limit` double NOT NULL,
  `grouping_override` tinyint(1) NOT NULL,
  `name_override` tinyint(1) NOT NULL,
  `description_override` tinyint(1) NOT NULL,
  `commit_default_override` tinyint(1) NOT NULL,
  `hidden_override` tinyint(1) NOT NULL,
  `read_only_override` tinyint(1) NOT NULL,
  `approval_required_override` tinyint(1) NOT NULL,
  `soft_time_limit_override` tinyint(1) NOT NULL,
  `time_limit_override` tinyint(1) NOT NULL,
  `git_repository_id` char(32) DEFAULT NULL,
  `has_sensitive_variables` tinyint(1) NOT NULL,
  `has_sensitive_variables_override` tinyint(1) NOT NULL,
  `is_job_hook_receiver` tinyint(1) NOT NULL,
  `task_queues` json NOT NULL DEFAULT (_utf8mb4'[]'),
  `task_queues_override` tinyint(1) NOT NULL,
  `is_job_button_receiver` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `extras_job_grouping_name_8cbc9328_uniq` (`grouping`,`name`),
  UNIQUE KEY `extras_job_source_git_repository_id_e6dfe58c_uniq` (`source`,`git_repository_id`,`module_name`,`job_class_name`),
  KEY `extras_job_source_2dddec01` (`source`),
  KEY `extras_job_module_name_912a3dda` (`module_name`),
  KEY `extras_job_job_class_name_d9c82b93` (`job_class_name`),
  KEY `extras_job_installed_9b043061` (`installed`),
  KEY `extras_job_hidden_f4b1d9d5` (`hidden`),
  KEY `extras_job_git_repository_id_9ee97baf_fk_extras_gitrepository_id` (`git_repository_id`),
  KEY `extras_job_grouping_692d2dc2` (`grouping`),
  KEY `extras_job_name_34d98c40` (`name`),
  CONSTRAINT `extras_job_git_repository_id_9ee97baf_fk_extras_gitrepository_id` FOREIGN KEY (`git_repository_id`) REFERENCES `extras_gitrepository` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_job`
--

LOCK TABLES `extras_job` WRITE;
/*!40000 ALTER TABLE `extras_job` DISABLE KEYS */;
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
  `created` date DEFAULT NULL,
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `type_create` tinyint(1) NOT NULL,
  `type_delete` tinyint(1) NOT NULL,
  `type_update` tinyint(1) NOT NULL,
  `job_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
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
  `log_object` varchar(200) DEFAULT NULL,
  `absolute_url` varchar(255) DEFAULT NULL,
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
  `created` datetime(6) NOT NULL,
  `completed` datetime(6) DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `data` json DEFAULT NULL,
  `job_id` char(32) NOT NULL,
  `obj_type_id` int NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `_custom_field_data` json NOT NULL DEFAULT (_utf8mb4'{}'),
  `schedule_id` char(32) DEFAULT NULL,
  `job_model_id` char(32) DEFAULT NULL,
  `job_kwargs` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_id` (`job_id`),
  KEY `extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id` (`obj_type_id`),
  KEY `extras_jobresult_user_id_d35285ab_fk_auth_user_id` (`user_id`),
  KEY `extras_jobresult_schedule_id_24ce985a_fk_extras_scheduledjob_id` (`schedule_id`),
  KEY `extras_jobresult_job_model_id_d581ec7e_fk_extras_job_id` (`job_model_id`),
  KEY `extras_jobresult_name_3f143125` (`name`),
  KEY `extras_jobresult_completed_41ca396b` (`completed`),
  KEY `extras_jobresult_created_bf3a3954` (`created`),
  KEY `extras_jobresult_rcreated_idx` (`created` DESC),
  KEY `extras_jr_rcompleted_idx` (`completed` DESC),
  KEY `extras_jr_statrcreate_idx` (`status`,`created` DESC),
  KEY `extras_jr_statrcompl_idx` (`status`,`completed` DESC),
  CONSTRAINT `extras_jobresult_job_model_id_d581ec7e_fk_extras_job_id` FOREIGN KEY (`job_model_id`) REFERENCES `extras_job` (`id`),
  CONSTRAINT `extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id` FOREIGN KEY (`obj_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `extras_jobresult_schedule_id_24ce985a_fk_extras_scheduledjob_id` FOREIGN KEY (`schedule_id`) REFERENCES `extras_scheduledjob` (`id`),
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `assigned_object_id` char(32) NOT NULL,
  `user_name` varchar(150) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `note` longtext NOT NULL,
  `assigned_object_type_id` int NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `extras_note_assigned_object_type_e15d3cda_fk_django_co` (`assigned_object_type_id`),
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
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
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
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
-- Table structure for table `extras_scheduledjob`
--

DROP TABLE IF EXISTS `extras_scheduledjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_scheduledjob` (
  `id` char(32) NOT NULL,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `job_class` varchar(255) NOT NULL,
  `interval` varchar(255) NOT NULL,
  `args` json NOT NULL,
  `kwargs` json NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `extras_scheduledjob_approved_by_user_id_06b8fb0a_fk_auth_user_id` (`approved_by_user_id`),
  KEY `extras_scheduledjob_user_id_4d8034ff_fk_auth_user_id` (`user_id`),
  KEY `extras_scheduledjob_job_model_id_d4c0711e_fk_extras_job_id` (`job_model_id`),
  KEY `extras_scheduledjob_job_class_c1c4178e` (`job_class`),
  KEY `extras_scheduledjob_name_fcea52d7` (`name`),
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `provider` varchar(100) NOT NULL,
  `parameters` json NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
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
  `group_id` char(32) NOT NULL,
  `secret_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extras_secretsgroupassoc_group_id_access_type_sec_1b1e944a_uniq` (`group_id`,`access_type`,`secret_type`),
  KEY `extras_secretsgroupa_secret_id_14d43d7e_fk_extras_se` (`secret_id`),
  CONSTRAINT `extras_secretsgroupa_group_id_68ca43f6_fk_extras_se` FOREIGN KEY (`group_id`) REFERENCES `extras_secretsgroup` (`id`),
  CONSTRAINT `extras_secretsgroupa_secret_id_14d43d7e_fk_extras_se` FOREIGN KEY (`secret_id`) REFERENCES `extras_secret` (`id`)
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(50) NOT NULL,
  `color` varchar(6) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_status`
--

LOCK TABLES `extras_status` WRITE;
/*!40000 ALTER TABLE `extras_status` DISABLE KEYS */;
INSERT INTO `extras_status` VALUES ('09748a30a25e44ab9a19d1ce87d5b882','2025-05-12','2025-05-12 04:11:10.259382','{}','Container','9e9e9e','container','Network contains children'),('4040675696a54e058616bf89486c1d62','2025-05-12','2025-05-12 04:11:10.133931','{}','Maintenance','9e9e9e','maintenance','Unit is under maintenance'),('4130b1fa42f849c3af5d8a90222a6337','2025-05-12','2025-05-12 04:11:10.172516','{}','Available','4caf50','available','Unit is available'),('50ea006babe04c90aa79353bd6a48b5d','2025-05-12','2025-05-12 04:11:10.082634','{}','Decommissioned','9e9e9e','decommissioned','Circuit has been decommissioned'),('57c03c1ed2254cef82637f778047ccbe','2025-05-12','2025-05-12 04:11:10.064580','{}','Planned','00bcd4','planned','Unit has been planned'),('5a174e654fa34023bb14e3a2e8cf1df9','2025-05-12','2025-05-12 04:11:10.068602','{}','Provisioning','2196f3','provisioning','Circuit is being provisioned'),('5f2d924a4d844a03b20d0aa15226f41a','2025-05-12','2025-05-12 04:11:10.141987','{}','Staging','2196f3','staging','Site or Location is in the process of being staged'),('6806d2f4da024f12ae358e0c5c826482','2025-05-12','2025-05-12 04:11:10.250211','{}','DHCP','4caf50','dhcp','Dynamically assigned IPv4/IPv6 address'),('6f1d98550d1544c5a857eaad9fe735a2','2025-05-12','2025-05-12 04:11:10.079332','{}','Deprovisioning','ffc107','deprovisioning','Circuit is being deprovisioned'),('9b9317d728e8456791563955d23f3fc7','2025-05-12','2025-05-12 04:11:10.169031','{}','Reserved','00bcd4','reserved','Unit is reserved'),('b1ab0c4daa8249c0a146638df4fb6f1e','2025-05-12','2025-05-12 04:11:10.150797','{}','Retired','f44336','retired','Site or Location has been retired'),('b91f0c84729a41c3adfb50e517d8659d','2025-05-12','2025-05-12 04:11:10.253846','{}','SLAAC','4caf50','slaac','Dynamically assigned IPv6 address'),('bc45a223fbba47478250a063db74fbdd','2025-05-12','2025-05-12 04:11:10.110801','{}','Failed','f44336','failed','Unit has failed'),('cb6650b3f06e4be3b30d50eeb7485707','2025-05-12','2025-05-12 04:11:10.114291','{}','Inventory','9e9e9e','inventory','Device is in inventory'),('cb914d5e3e9e4b2ab91f4c138598c1f5','2025-05-12','2025-05-12 04:11:10.093892','{}','Decommissioning','ffc107','decommissioning','Unit is being decommissioned'),('ce573fa6e821492889b60880fb744368','2025-05-12','2025-05-12 04:11:10.072455','{}','Active','4caf50','active','Unit is active'),('d35a826e87d24d419ba10be86c9bd63a','2025-05-12','2025-05-12 04:11:10.181399','{}','Deprecated','f44336','deprecated','Unit has been deprecated'),('d61500a844e04bbf94d3d3f8ec27e16f','2025-05-12','2025-05-12 04:11:10.075860','{}','Offline','ffc107','offline','Unit is offline'),('f4749135944b4dc69683a77462e20532','2025-05-12','2025-05-12 04:11:10.087855','{}','Connected','4caf50','connected','Cable is connected'),('f91caedc409d42fba5870a3af3bfe98d','2025-05-12','2025-05-12 04:11:10.107179','{}','Staged','2196f3','staged','Unit has been staged');
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras_status_content_types`
--

LOCK TABLES `extras_status_content_types` WRITE;
/*!40000 ALTER TABLE `extras_status_content_types` DISABLE KEYS */;
INSERT INTO `extras_status_content_types` VALUES (56,'09748a30a25e44ab9a19d1ce87d5b882',12),(21,'4040675696a54e058616bf89486c1d62',4),(72,'4040675696a54e058616bf89486c1d62',15),(32,'4130b1fa42f849c3af5d8a90222a6337',7),(6,'50ea006babe04c90aa79353bd6a48b5d',1),(1,'57c03c1ed2254cef82637f778047ccbe',1),(8,'57c03c1ed2254cef82637f778047ccbe',2),(12,'57c03c1ed2254cef82637f778047ccbe',3),(17,'57c03c1ed2254cef82637f778047ccbe',4),(22,'57c03c1ed2254cef82637f778047ccbe',5),(29,'57c03c1ed2254cef82637f778047ccbe',6),(33,'57c03c1ed2254cef82637f778047ccbe',7),(36,'57c03c1ed2254cef82637f778047ccbe',8),(41,'57c03c1ed2254cef82637f778047ccbe',9),(46,'57c03c1ed2254cef82637f778047ccbe',10),(65,'57c03c1ed2254cef82637f778047ccbe',14),(73,'57c03c1ed2254cef82637f778047ccbe',15),(2,'5a174e654fa34023bb14e3a2e8cf1df9',1),(23,'5f2d924a4d844a03b20d0aa15226f41a',5),(37,'5f2d924a4d844a03b20d0aa15226f41a',8),(42,'5f2d924a4d844a03b20d0aa15226f41a',9),(47,'5f2d924a4d844a03b20d0aa15226f41a',10),(54,'6806d2f4da024f12ae358e0c5c826482',11),(5,'6f1d98550d1544c5a857eaad9fe735a2',1),(31,'9b9317d728e8456791563955d23f3fc7',7),(52,'9b9317d728e8456791563955d23f3fc7',11),(58,'9b9317d728e8456791563955d23f3fc7',12),(61,'9b9317d728e8456791563955d23f3fc7',13),(26,'b1ab0c4daa8249c0a146638df4fb6f1e',5),(40,'b1ab0c4daa8249c0a146638df4fb6f1e',8),(45,'b1ab0c4daa8249c0a146638df4fb6f1e',9),(50,'b1ab0c4daa8249c0a146638df4fb6f1e',10),(55,'b91f0c84729a41c3adfb50e517d8659d',11),(14,'bc45a223fbba47478250a063db74fbdd',3),(18,'bc45a223fbba47478250a063db74fbdd',4),(30,'bc45a223fbba47478250a063db74fbdd',6),(67,'bc45a223fbba47478250a063db74fbdd',14),(69,'bc45a223fbba47478250a063db74fbdd',15),(15,'cb6650b3f06e4be3b30d50eeb7485707',3),(9,'cb914d5e3e9e4b2ab91f4c138598c1f5',2),(16,'cb914d5e3e9e4b2ab91f4c138598c1f5',3),(20,'cb914d5e3e9e4b2ab91f4c138598c1f5',4),(25,'cb914d5e3e9e4b2ab91f4c138598c1f5',5),(39,'cb914d5e3e9e4b2ab91f4c138598c1f5',8),(44,'cb914d5e3e9e4b2ab91f4c138598c1f5',9),(49,'cb914d5e3e9e4b2ab91f4c138598c1f5',10),(68,'cb914d5e3e9e4b2ab91f4c138598c1f5',14),(71,'cb914d5e3e9e4b2ab91f4c138598c1f5',15),(3,'ce573fa6e821492889b60880fb744368',1),(11,'ce573fa6e821492889b60880fb744368',3),(19,'ce573fa6e821492889b60880fb744368',4),(24,'ce573fa6e821492889b60880fb744368',5),(28,'ce573fa6e821492889b60880fb744368',6),(34,'ce573fa6e821492889b60880fb744368',7),(38,'ce573fa6e821492889b60880fb744368',8),(43,'ce573fa6e821492889b60880fb744368',9),(48,'ce573fa6e821492889b60880fb744368',10),(51,'ce573fa6e821492889b60880fb744368',11),(57,'ce573fa6e821492889b60880fb744368',12),(60,'ce573fa6e821492889b60880fb744368',13),(64,'ce573fa6e821492889b60880fb744368',14),(70,'ce573fa6e821492889b60880fb744368',15),(35,'d35a826e87d24d419ba10be86c9bd63a',7),(53,'d35a826e87d24d419ba10be86c9bd63a',11),(59,'d35a826e87d24d419ba10be86c9bd63a',12),(62,'d35a826e87d24d419ba10be86c9bd63a',13),(4,'d61500a844e04bbf94d3d3f8ec27e16f',1),(10,'d61500a844e04bbf94d3d3f8ec27e16f',3),(27,'d61500a844e04bbf94d3d3f8ec27e16f',6),(63,'d61500a844e04bbf94d3d3f8ec27e16f',14),(7,'f4749135944b4dc69683a77462e20532',2),(13,'f91caedc409d42fba5870a3af3bfe98d',3),(66,'f91caedc409d42fba5870a3af3bfe98d',14);
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
  `slug` varchar(100) NOT NULL,
  `id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `color` varchar(6) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
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
  KEY `extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id` (`tag_id`),
  KEY `extras_taggeditem_content_type_id_object_id_80e28e23_idx` (`content_type_id`,`object_id`),
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
  `created` date DEFAULT NULL,
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
  `ca_file_path` varchar(4096) DEFAULT NULL,
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
-- Table structure for table `ipam_aggregate`
--

DROP TABLE IF EXISTS `ipam_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_aggregate` (
  `id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `network` varbinary(16) NOT NULL,
  `broadcast` varbinary(16) NOT NULL,
  `prefix_length` int NOT NULL,
  `date_added` date DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `rir_id` char(32) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ipam_aggregate_network_e8d5e036` (`network`),
  KEY `ipam_aggregate_broadcast_cff7c80e` (`broadcast`),
  KEY `ipam_aggregate_prefix_length_da6bd002` (`prefix_length`),
  KEY `ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id` (`rir_id`),
  KEY `ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id` (`tenant_id`),
  CONSTRAINT `ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id` FOREIGN KEY (`rir_id`) REFERENCES `ipam_rir` (`id`),
  CONSTRAINT `ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_aggregate`
--

LOCK TABLES `ipam_aggregate` WRITE;
/*!40000 ALTER TABLE `ipam_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_ipaddress`
--

DROP TABLE IF EXISTS `ipam_ipaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_ipaddress` (
  `id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `host` varbinary(16) NOT NULL,
  `broadcast` varbinary(16) NOT NULL,
  `prefix_length` int NOT NULL,
  `role` varchar(50) NOT NULL,
  `assigned_object_id` char(32) DEFAULT NULL,
  `dns_name` varchar(255) NOT NULL,
  `description` varchar(200) NOT NULL,
  `assigned_object_type_id` int DEFAULT NULL,
  `nat_inside_id` char(32) DEFAULT NULL,
  `status_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `vrf_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ipam_ipaddress_host_c1f8ad3e` (`host`),
  KEY `ipam_ipaddress_broadcast_f3d0b760` (`broadcast`),
  KEY `ipam_ipaddress_prefix_length_f80d3663` (`prefix_length`),
  KEY `ipam_ipaddress_assigned_object_type_02354370_fk_django_co` (`assigned_object_type_id`),
  KEY `ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id` (`vrf_id`),
  KEY `ipam_ipaddress_status_id_942778b7` (`status_id`),
  KEY `ipam_ipaddress_nat_inside_id_a45fb7c5` (`nat_inside_id`),
  KEY `ipam_ipaddress_assigned_object_id_cff64474` (`assigned_object_id`),
  KEY `ipam_ipaddress_dns_name_d5c4f5d8` (`dns_name`),
  KEY `ipam_ipaddress_role_ff25f462` (`role`),
  CONSTRAINT `ipam_ipaddress_assigned_object_type_02354370_fk_django_co` FOREIGN KEY (`assigned_object_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id` FOREIGN KEY (`nat_inside_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `ipam_ipaddress_status_id_942778b7_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id` FOREIGN KEY (`vrf_id`) REFERENCES `ipam_vrf` (`id`)
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
-- Table structure for table `ipam_prefix`
--

DROP TABLE IF EXISTS `ipam_prefix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_prefix` (
  `id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `network` varbinary(16) NOT NULL,
  `broadcast` varbinary(16) NOT NULL,
  `prefix_length` int NOT NULL,
  `is_pool` tinyint(1) NOT NULL,
  `description` varchar(200) NOT NULL,
  `role_id` char(32) DEFAULT NULL,
  `site_id` char(32) DEFAULT NULL,
  `status_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `vlan_id` char(32) DEFAULT NULL,
  `vrf_id` char(32) DEFAULT NULL,
  `location_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ipam_prefix_network_f7bac882` (`network`),
  KEY `ipam_prefix_broadcast_8e623832` (`broadcast`),
  KEY `ipam_prefix_prefix_length_84660485` (`prefix_length`),
  KEY `ipam_prefix_role_id_0a98d415_fk_ipam_role_id` (`role_id`),
  KEY `ipam_prefix_site_id_0b20df05_fk_dcim_site_id` (`site_id`),
  KEY `ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id` (`vlan_id`),
  KEY `ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id` (`vrf_id`),
  KEY `ipam_prefix_status_id_cffa56c0` (`status_id`),
  KEY `ipam_prefix_location_id_9a5c5f60_fk_dcim_location_id` (`location_id`),
  CONSTRAINT `ipam_prefix_location_id_9a5c5f60_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `ipam_prefix_role_id_0a98d415_fk_ipam_role_id` FOREIGN KEY (`role_id`) REFERENCES `ipam_role` (`id`),
  CONSTRAINT `ipam_prefix_site_id_0b20df05_fk_dcim_site_id` FOREIGN KEY (`site_id`) REFERENCES `dcim_site` (`id`),
  CONSTRAINT `ipam_prefix_status_id_cffa56c0_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
  CONSTRAINT `ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id` FOREIGN KEY (`vlan_id`) REFERENCES `ipam_vlan` (`id`),
  CONSTRAINT `ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id` FOREIGN KEY (`vrf_id`) REFERENCES `ipam_vrf` (`id`)
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
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
-- Table structure for table `ipam_role`
--

DROP TABLE IF EXISTS `ipam_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_role` (
  `id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `weight` smallint unsigned NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  CONSTRAINT `ipam_role_chk_1` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_role`
--

LOCK TABLES `ipam_role` WRITE;
/*!40000 ALTER TABLE `ipam_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_routetarget`
--

DROP TABLE IF EXISTS `ipam_routetarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_routetarget` (
  `id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `protocol` varchar(50) NOT NULL,
  `ports` json NOT NULL,
  `description` varchar(200) NOT NULL,
  `device_id` char(32) DEFAULT NULL,
  `virtual_machine_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
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
-- Table structure for table `ipam_service_ipaddresses`
--

DROP TABLE IF EXISTS `ipam_service_ipaddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_service_ipaddresses` (
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
-- Dumping data for table `ipam_service_ipaddresses`
--

LOCK TABLES `ipam_service_ipaddresses` WRITE;
/*!40000 ALTER TABLE `ipam_service_ipaddresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_service_ipaddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_vlan`
--

DROP TABLE IF EXISTS `ipam_vlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipam_vlan` (
  `id` char(32) NOT NULL,
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `vid` smallint unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(200) NOT NULL,
  `group_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  `site_id` char(32) DEFAULT NULL,
  `status_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `location_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_vlan_group_id_name_e53919df_uniq` (`group_id`,`name`),
  UNIQUE KEY `ipam_vlan_group_id_vid_5ca4cc47_uniq` (`group_id`,`vid`),
  KEY `ipam_vlan_role_id_f5015962_fk_ipam_role_id` (`role_id`),
  KEY `ipam_vlan_site_id_a59334e3_fk_dcim_site_id` (`site_id`),
  KEY `ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `ipam_vlan_status_id_898aa317` (`status_id`),
  KEY `ipam_vlan_name_a7671201` (`name`),
  KEY `ipam_vlan_location_id_07dd65e4_fk_dcim_location_id` (`location_id`),
  CONSTRAINT `ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id` FOREIGN KEY (`group_id`) REFERENCES `ipam_vlangroup` (`id`),
  CONSTRAINT `ipam_vlan_location_id_07dd65e4_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `ipam_vlan_role_id_f5015962_fk_ipam_role_id` FOREIGN KEY (`role_id`) REFERENCES `ipam_role` (`id`),
  CONSTRAINT `ipam_vlan_site_id_a59334e3_fk_dcim_site_id` FOREIGN KEY (`site_id`) REFERENCES `dcim_site` (`id`),
  CONSTRAINT `ipam_vlan_status_id_898aa317_fk_extras_status_id` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `site_id` char(32) DEFAULT NULL,
  `location_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipam_vlangroup_site_id_slug_6372a304_uniq` (`site_id`,`slug`),
  UNIQUE KEY `ipam_vlangroup_site_id_name_a38e981b_uniq` (`site_id`,`name`),
  KEY `ipam_vlangroup_slug_40abcf6b` (`slug`),
  KEY `ipam_vlangroup_name_46bf02a4` (`name`),
  KEY `ipam_vlangroup_location_id_f239af79_fk_dcim_location_id` (`location_id`),
  CONSTRAINT `ipam_vlangroup_location_id_f239af79_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `ipam_vlangroup_site_id_264f36f6_fk_dcim_site_id` FOREIGN KEY (`site_id`) REFERENCES `dcim_site` (`id`)
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `rd` varchar(21) DEFAULT NULL,
  `enforce_unique` tinyint(1) NOT NULL,
  `description` varchar(200) NOT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rd` (`rd`),
  KEY `ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `ipam_vrf_name_bf7146b0` (`name`),
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `comments` longtext NOT NULL,
  `group_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id` (`group_id`),
  CONSTRAINT `tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id` FOREIGN KEY (`group_id`) REFERENCES `tenancy_tenantgroup` (`id`)
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `lft` int unsigned NOT NULL,
  `rght` int unsigned NOT NULL,
  `tree_id` int unsigned NOT NULL,
  `level` int unsigned NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `tenancy_tenantgroup_tree_id_769a98bf` (`tree_id`),
  KEY `tenancy_tenantgroup_parent_id_2542fc18` (`parent_id`),
  CONSTRAINT `tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_tenantgroup_id` FOREIGN KEY (`parent_id`) REFERENCES `tenancy_tenantgroup` (`id`),
  CONSTRAINT `tenancy_tenantgroup_chk_1` CHECK ((`lft` >= 0)),
  CONSTRAINT `tenancy_tenantgroup_chk_2` CHECK ((`rght` >= 0)),
  CONSTRAINT `tenancy_tenantgroup_chk_3` CHECK ((`tree_id` >= 0)),
  CONSTRAINT `tenancy_tenantgroup_chk_4` CHECK ((`level` >= 0))
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
  PRIMARY KEY (`id`)
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `comments` longtext NOT NULL,
  `group_id` char(32) DEFAULT NULL,
  `site_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `type_id` char(32) NOT NULL,
  `location_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `virtualization_clust_group_id_de379828_fk_virtualiz` (`group_id`),
  KEY `virtualization_cluster_site_id_4d5af282_fk_dcim_site_id` (`site_id`),
  KEY `virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id` (`tenant_id`),
  KEY `virtualization_clust_type_id_4efafb0a_fk_virtualiz` (`type_id`),
  KEY `virtualization_cluster_location_id_fdcab7e6_fk_dcim_location_id` (`location_id`),
  CONSTRAINT `virtualization_clust_group_id_de379828_fk_virtualiz` FOREIGN KEY (`group_id`) REFERENCES `virtualization_clustergroup` (`id`),
  CONSTRAINT `virtualization_clust_type_id_4efafb0a_fk_virtualiz` FOREIGN KEY (`type_id`) REFERENCES `virtualization_clustertype` (`id`),
  CONSTRAINT `virtualization_cluster_location_id_fdcab7e6_fk_dcim_location_id` FOREIGN KEY (`location_id`) REFERENCES `dcim_location` (`id`),
  CONSTRAINT `virtualization_cluster_site_id_4d5af282_fk_dcim_site_id` FOREIGN KEY (`site_id`) REFERENCES `dcim_site` (`id`),
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
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
  `created` date DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `_custom_field_data` json NOT NULL,
  `local_context_data` json DEFAULT NULL,
  `local_context_data_owner_object_id` char(32) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `vcpus` smallint unsigned DEFAULT NULL,
  `memory` int unsigned DEFAULT NULL,
  `disk` int unsigned DEFAULT NULL,
  `comments` longtext NOT NULL,
  `cluster_id` char(32) NOT NULL,
  `local_context_data_owner_content_type_id` int DEFAULT NULL,
  `platform_id` char(32) DEFAULT NULL,
  `primary_ip4_id` char(32) DEFAULT NULL,
  `primary_ip6_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  `status_id` char(32) DEFAULT NULL,
  `tenant_id` char(32) DEFAULT NULL,
  `local_context_schema_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `primary_ip4_id` (`primary_ip4_id`),
  UNIQUE KEY `primary_ip6_id` (`primary_ip6_id`),
  UNIQUE KEY `virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq` (`cluster_id`,`tenant_id`,`name`),
  KEY `virtualization_virtu_local_context_data_o_f760366b_fk_django_co` (`local_context_data_owner_content_type_id`),
  KEY `virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat` (`platform_id`),
  KEY `virtualization_virtu_role_id_0cc898f9_fk_dcim_devi` (`role_id`),
  KEY `virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t` (`tenant_id`),
  KEY `virtualization_virtualmachine_status_id_ff17be20` (`status_id`),
  KEY `virtualization_virtu_local_context_schema_d359876d_fk_extras_co` (`local_context_schema_id`),
  KEY `virtualization_virtualmachine_name_266f6cdc` (`name`),
  CONSTRAINT `virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz` FOREIGN KEY (`cluster_id`) REFERENCES `virtualization_cluster` (`id`),
  CONSTRAINT `virtualization_virtu_local_context_data_o_f760366b_fk_django_co` FOREIGN KEY (`local_context_data_owner_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `virtualization_virtu_local_context_schema_d359876d_fk_extras_co` FOREIGN KEY (`local_context_schema_id`) REFERENCES `extras_configcontextschema` (`id`),
  CONSTRAINT `virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat` FOREIGN KEY (`platform_id`) REFERENCES `dcim_platform` (`id`),
  CONSTRAINT `virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad` FOREIGN KEY (`primary_ip4_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad` FOREIGN KEY (`primary_ip6_id`) REFERENCES `ipam_ipaddress` (`id`),
  CONSTRAINT `virtualization_virtu_role_id_0cc898f9_fk_dcim_devi` FOREIGN KEY (`role_id`) REFERENCES `dcim_devicerole` (`id`),
  CONSTRAINT `virtualization_virtu_status_id_ff17be20_fk_extras_st` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t` FOREIGN KEY (`tenant_id`) REFERENCES `tenancy_tenant` (`id`),
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
  `mac_address` varchar(18) DEFAULT NULL,
  `mtu` int unsigned DEFAULT NULL,
  `mode` varchar(50) NOT NULL,
  `name` varchar(64) NOT NULL,
  `_name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `untagged_vlan_id` char(32) DEFAULT NULL,
  `virtual_machine_id` char(32) NOT NULL,
  `status_id` char(32) DEFAULT NULL,
  `parent_interface_id` char(32) DEFAULT NULL,
  `bridge_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtualization_vminterface_virtual_machine_id_name_cfb9c423_uniq` (`virtual_machine_id`,`name`),
  KEY `virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan` (`untagged_vlan_id`),
  KEY `virtualization_vminterface__name_0052e83a` (`_name`),
  KEY `virtualization_vminterface_name_8b75a799` (`name`),
  KEY `virtualization_vminterface_status_id_5f9104d8` (`status_id`),
  KEY `virtualization_vmint_parent_interface_id_3532b142_fk_virtualiz` (`parent_interface_id`),
  KEY `virtualization_vmint_bridge_id_7462b91e_fk_virtualiz` (`bridge_id`),
  CONSTRAINT `virtualization_vmint_bridge_id_7462b91e_fk_virtualiz` FOREIGN KEY (`bridge_id`) REFERENCES `virtualization_vminterface` (`id`),
  CONSTRAINT `virtualization_vmint_parent_interface_id_3532b142_fk_virtualiz` FOREIGN KEY (`parent_interface_id`) REFERENCES `virtualization_vminterface` (`id`),
  CONSTRAINT `virtualization_vmint_status_id_5f9104d8_fk_extras_st` FOREIGN KEY (`status_id`) REFERENCES `extras_status` (`id`),
  CONSTRAINT `virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan` FOREIGN KEY (`untagged_vlan_id`) REFERENCES `ipam_vlan` (`id`),
  CONSTRAINT `virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz` FOREIGN KEY (`virtual_machine_id`) REFERENCES `virtualization_virtualmachine` (`id`),
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

-- Dump completed on 2025-05-12  4:11:45
