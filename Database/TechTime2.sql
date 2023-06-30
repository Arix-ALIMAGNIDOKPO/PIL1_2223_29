-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: techtime2
-- ------------------------------------------------------
-- Server version	8.0.33

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add niveau',6,'add_niveau'),(22,'Can change niveau',6,'change_niveau'),(23,'Can delete niveau',6,'delete_niveau'),(24,'Can view niveau',6,'view_niveau'),(25,'Can add my user',7,'add_myuser'),(26,'Can change my user',7,'change_myuser'),(27,'Can delete my user',7,'delete_myuser'),(28,'Can view my user',7,'view_myuser'),(29,'Can add matiere',8,'add_matiere'),(30,'Can change matiere',8,'change_matiere'),(31,'Can delete matiere',8,'delete_matiere'),(32,'Can view matiere',8,'view_matiere'),(33,'Can add shedule',9,'add_shedule'),(34,'Can change shedule',9,'change_shedule'),(35,'Can delete shedule',9,'delete_shedule'),(36,'Can view shedule',9,'view_shedule'),(37,'Can add classroom',10,'add_classroom'),(38,'Can change classroom',10,'change_classroom'),(39,'Can delete classroom',10,'delete_classroom'),(40,'Can view classroom',10,'view_classroom');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_TechTime_myuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_TechTime_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `techtime_myuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (7,'2023-06-25 20:18:19.607623','3','Licence 2 GL',3,'',6,15),(8,'2023-06-25 20:18:38.847044','5','Licence 1 GL',1,'[{\"added\": {}}]',6,15),(9,'2023-06-25 20:19:04.171615','6','Licence 1 IM',1,'[{\"added\": {}}]',6,15),(10,'2023-06-25 20:19:20.925890','7','Licence 1 SEIOT',1,'[{\"added\": {}}]',6,15),(11,'2023-06-25 20:19:41.395274','8','Licence 1 IM',1,'[{\"added\": {}}]',6,15),(12,'2023-06-25 20:19:48.291187','8','Licence 1 IM',3,'',6,15),(13,'2023-06-25 20:20:21.759806','9','Licence 2 GL',1,'[{\"added\": {}}]',6,15),(14,'2023-06-25 20:20:43.240559','10','Licence 2 IM',1,'[{\"added\": {}}]',6,15),(15,'2023-06-25 20:21:11.866469','11','Licence 2 SI',1,'[{\"added\": {}}]',6,15),(16,'2023-06-25 20:21:35.168447','12','Licence 3 GL',1,'[{\"added\": {}}]',6,15),(17,'2023-06-25 20:21:47.804369','13','Licence 3 IM',1,'[{\"added\": {}}]',6,15),(18,'2023-06-25 20:22:01.462474','14','Licence 3 SI',1,'[{\"added\": {}}]',6,15),(19,'2023-06-25 20:22:53.978111','4','test@gmail.com',3,'',7,15),(20,'2023-06-25 20:23:08.948984','5','test2@gmail.com',3,'',7,15),(21,'2023-06-27 15:15:21.417284','27','pzohou@gmail.com',1,'[{\"added\": {}}]',7,15),(22,'2023-06-27 15:16:00.338041','28','johnaoga@icloud.com',1,'[{\"added\": {}}]',7,15),(23,'2023-06-27 15:16:25.453388','1','Algorithmique',1,'[{\"added\": {}}]',8,15),(24,'2023-06-27 15:16:46.395888','2','Théorie des Graphes',1,'[{\"added\": {}}]',8,15),(25,'2023-06-28 10:09:49.551208','1','Licence 1 IA',3,'',6,15),(26,'2023-06-28 10:09:58.341415','2','Licence 1 SI',3,'',6,15),(27,'2023-06-28 10:10:02.780081','9','Licence 2 GL',3,'',6,15),(28,'2023-06-28 10:10:06.896242','11','Licence 2 SI',3,'',6,15),(29,'2023-06-28 10:10:11.217022','13','Licence 3 IM',3,'',6,15),(30,'2023-06-28 10:10:15.159327','10','Licence 2 IM',3,'',6,15),(31,'2023-06-28 10:10:19.429131','12','Licence 3 GL',3,'',6,15),(32,'2023-06-28 10:10:23.368858','7','Licence 1 SEIOT',3,'',6,15),(33,'2023-06-28 10:10:27.552209','6','Licence 1 IM',3,'',6,15),(34,'2023-06-28 10:10:31.538793','5','Licence 1 GL',3,'',6,15),(35,'2023-06-28 10:10:35.758678','14','Licence 3 SI',3,'',6,15),(36,'2023-06-28 10:10:51.743711','15','Licence 1',1,'[{\"added\": {}}]',6,15),(37,'2023-06-28 10:11:09.936807','16','Licence 2',1,'[{\"added\": {}}]',6,15),(38,'2023-06-28 10:11:23.942273','17','Licence 3',1,'[{\"added\": {}}]',6,15),(39,'2023-06-28 10:13:18.372945','3','Theorie des graphes',1,'[{\"added\": {}}]',8,15),(40,'2023-06-28 10:13:37.055889','4','Langage C',1,'[{\"added\": {}}]',8,15),(41,'2023-06-28 10:13:49.007254','5','Langage Python',1,'[{\"added\": {}}]',8,15),(42,'2023-06-28 10:14:34.854198','6','Securite Informatique',1,'[{\"added\": {}}]',8,15),(43,'2023-06-28 10:14:46.438269','7','Systemes embarques',1,'[{\"added\": {}}]',8,15),(44,'2023-06-28 10:15:00.453274','8','Developpement mobile',1,'[{\"added\": {}}]',8,15),(45,'2023-06-28 10:15:36.056921','9','Redaction de projet',1,'[{\"added\": {}}]',8,15),(46,'2023-06-28 10:15:50.650995','10','Stage en entreprise',1,'[{\"added\": {}}]',8,15),(47,'2023-06-28 10:16:05.500496','11','Soutenance',1,'[{\"added\": {}}]',8,15),(70,'2023-06-30 13:54:52.713171','31','kabirou2001@gmail.com',3,'',7,15),(71,'2023-06-30 13:55:17.909182','28','johnaoga@icloud.com',2,'[]',7,15),(72,'2023-06-30 13:55:36.713476','27','pzohou@icloud.com',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',7,15),(73,'2023-06-30 13:56:08.656996','3','IRAN 1',1,'[{\"added\": {}}]',10,15),(74,'2023-06-30 13:56:13.372476','3','IRAN 1',2,'[]',10,15),(75,'2023-06-30 13:56:22.683355','2','Padtice',2,'[{\"changed\": {\"fields\": [\"Desc\"]}}]',10,15),(76,'2023-06-30 14:09:44.372767','12','Probabilites',1,'[{\"added\": {}}]',8,15),(77,'2023-06-30 14:10:00.436885','13','Statistiques',1,'[{\"added\": {}}]',8,15),(78,'2023-06-30 14:10:26.816343','14','Histoire de l\'Informatique',1,'[{\"added\": {}}]',8,15),(79,'2023-06-30 14:11:04.556629','15','Architecture et technologie des Ordinateurs',1,'[{\"added\": {}}]',8,15),(80,'2023-06-30 14:11:18.753306','16','Langage SQL',1,'[{\"added\": {}}]',8,15),(81,'2023-06-30 14:11:40.577369','17','Theorie des nombres',1,'[{\"added\": {}}]',8,15),(82,'2023-06-30 14:12:19.370691','18','Securité materielle',1,'[{\"added\": {}}]',8,15),(83,'2023-06-30 14:12:43.874978','19','Structure de donnes avances',1,'[{\"added\": {}}]',8,15),(84,'2023-06-30 14:13:07.460993','20','Langage Java',1,'[{\"added\": {}}]',8,15),(85,'2023-06-30 14:13:36.879474','21','Ingenierie Logicielle',1,'[{\"added\": {}}]',8,15),(86,'2023-06-30 14:14:03.814193','22','Initiation au Latex',1,'[{\"added\": {}}]',8,15),(87,'2023-06-30 14:14:34.266156','23','Comptabilité',1,'[{\"added\": {}}]',8,15),(88,'2023-06-30 14:15:13.981550','24','Technologie mobile',1,'[{\"added\": {}}]',8,15),(89,'2023-06-30 14:41:49.246108','33','professor@gmail.com',1,'[{\"added\": {}}]',7,15),(90,'2023-06-30 14:42:06.910629','33','professor@gmail.com',3,'',7,15);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(10,'TechTime','classroom'),(8,'TechTime','matiere'),(7,'TechTime','myuser'),(6,'TechTime','niveau'),(9,'TechTime','shedule');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-06-22 18:17:54.246465'),(2,'contenttypes','0002_remove_content_type_name','2023-06-22 18:17:54.294057'),(3,'auth','0001_initial','2023-06-22 18:17:54.461503'),(4,'auth','0002_alter_permission_name_max_length','2023-06-22 18:17:54.503354'),(5,'auth','0003_alter_user_email_max_length','2023-06-22 18:17:54.510005'),(6,'auth','0004_alter_user_username_opts','2023-06-22 18:17:54.521004'),(7,'auth','0005_alter_user_last_login_null','2023-06-22 18:17:54.529174'),(8,'auth','0006_require_contenttypes_0002','2023-06-22 18:17:54.533174'),(9,'auth','0007_alter_validators_add_error_messages','2023-06-22 18:17:54.543166'),(10,'auth','0008_alter_user_username_max_length','2023-06-22 18:17:54.553181'),(11,'auth','0009_alter_user_last_name_max_length','2023-06-22 18:17:54.568174'),(12,'auth','0010_alter_group_name_max_length','2023-06-22 18:17:54.598176'),(13,'auth','0011_update_proxy_permissions','2023-06-22 18:17:54.610146'),(14,'auth','0012_alter_user_first_name_max_length','2023-06-22 18:17:54.621141'),(15,'TechTime','0001_initial','2023-06-22 18:17:54.885322'),(16,'admin','0001_initial','2023-06-22 18:17:55.012582'),(17,'admin','0002_logentry_remove_auto_add','2023-06-22 18:17:55.029191'),(18,'admin','0003_logentry_add_action_flag_choices','2023-06-22 18:17:55.044184'),(19,'sessions','0001_initial','2023-06-22 18:17:55.087263'),(20,'TechTime','0002_alter_myuser_niveau','2023-06-22 18:20:21.013455'),(21,'TechTime','0003_myuser_is_staff','2023-06-22 18:22:49.266813'),(22,'TechTime','0004_myuser_is_teacher','2023-06-27 15:02:27.663058'),(23,'TechTime','0005_matiere','2023-06-27 15:08:16.009582'),(24,'TechTime','0006_alter_myuser_niveau','2023-06-27 15:15:18.528991'),(25,'TechTime','0007_shedule','2023-06-27 15:46:09.646625'),(26,'TechTime','0008_classroom_shedule_classroom','2023-06-29 00:55:21.900645'),(27,'TechTime','0009_shedule_niveau','2023-06-29 01:17:35.000717'),(28,'TechTime','0010_matiere_bgcolor','2023-06-29 12:42:33.341888');
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
INSERT INTO `django_session` VALUES ('5z7ga9xc8bc5q5ch5zysqnvn020sa1lc','e30:1qEYj0:6ex6yLUoPquzOR39yPXeI5-2YvTAOzeNVUHPXHSk7J8','2023-07-12 17:13:02.391542'),('75b3ad8w8pcxellh8wwt8ugwioylm1z6','e30:1qERyJ:_yxwFT0LQZ36FA-s2BbluCg-bo6pSrnTArMM8hQhhK8','2023-07-12 10:00:23.451334'),('8coee0h4odwwvkzf1dsfut3z26lmimhp','e30:1qES0Y:UuJbhyWrbhBe7cANHBqRvmlTS26wZy9ySgfKmdoz8Ow','2023-07-12 10:02:42.969159'),('8s1lwq3b35cxki6lt9x8dqehpmx5d6tr','e30:1qERxn:COrGe7jRzX1JEdetkSwX-AiQE25JIomkyylhl3VRwDQ','2023-07-12 09:59:51.769560'),('ild5lfl2t0qof9f4h2p1773pieatsdgw','e30:1qEsvz:DauvSOtEfI39u_fBeRFJIft81twen52P-x78vgfbbps','2023-07-13 14:47:47.725223'),('oyy1nvz46pc3re3wowq48y8lnb85x62e','.eJxVjDsOwjAQBe_iGllyvPGHkp4zWLvrNQ4gR4qTCnF3iJQC2jcz76USbmtNW5clTVmdlRnV6Xck5Ie0neQ7ttuseW7rMpHeFX3Qrq9zluflcP8OKvb6raMLpsQ4-gDCJTgCjCDeORFwFIMbICADs2H0A3GG4skQZbGWjVj1_gAIrji1:1qEuM5:ia_LBzXYvUfLq2Mp_Lwy2t1TxyI3Rhd0cprrrflZ9h0','2023-07-13 16:18:49.414646'),('oz11tffxvjjyllovp90e4i9dzscy11zd','e30:1qERyv:UAc1E6tcT05hjSjZGsjFo8pao6G5L8KTEHy7EGUXEBk','2023-07-12 10:01:01.745743'),('t253mjierzt3o9w51i69a1nzw674hvaw','e30:1qEYiW:0i4TEbnBurLpY_RSFIV6oTrfj4HFlR3ob9rc3VDqWOU','2023-07-12 17:12:32.299046');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techtime_classroom`
--

DROP TABLE IF EXISTS `techtime_classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `techtime_classroom` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `desc` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techtime_classroom`
--

LOCK TABLES `techtime_classroom` WRITE;
/*!40000 ALTER TABLE `techtime_classroom` DISABLE KEYS */;
INSERT INTO `techtime_classroom` VALUES (1,'IRAN 2','Amphi IRAN 2 Location'),(2,'Padtice','UAC'),(3,'IRAN 1','UAC');
/*!40000 ALTER TABLE `techtime_classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techtime_matiere`
--

DROP TABLE IF EXISTS `techtime_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `techtime_matiere` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `niveau_id` bigint DEFAULT NULL,
  `bgColor` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TechTime_matiere_niveau_id_93e061e9_fk_TechTime_niveau_id` (`niveau_id`),
  CONSTRAINT `TechTime_matiere_niveau_id_93e061e9_fk_TechTime_niveau_id` FOREIGN KEY (`niveau_id`) REFERENCES `techtime_niveau` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techtime_matiere`
--

LOCK TABLES `techtime_matiere` WRITE;
/*!40000 ALTER TABLE `techtime_matiere` DISABLE KEYS */;
INSERT INTO `techtime_matiere` VALUES (3,'Theorie des graphes',15,'#FF0000'),(4,'Langage C',15,'#BC8B4B'),(5,'Langage Python',15,'#3F9DFF'),(6,'Securite Informatique',16,'#C2D8AF'),(7,'Systemes embarques',16,'#04080C'),(8,'Developpement mobile',16,'#540DDE'),(9,'Redaction de projet',17,'#13FF54'),(10,'Stage en entreprise',17,'#FFD9F8'),(11,'Soutenance',17,'#1D331D'),(12,'Probabilites',15,'#52FF9E'),(13,'Statistiques',15,'#FF9F9F'),(14,'Histoire de l\'Informatique',15,'#7BFFC3'),(15,'Architecture et technologie des Ordinateurs',15,'#FF3C9A'),(16,'Langage SQL',15,'#4032FF'),(17,'Theorie des nombres',16,'#FF0000'),(18,'Securité materielle',16,'#261BFF'),(19,'Structure de donnes avances',16,'#591FFF'),(20,'Langage Java',16,'#55FF11'),(21,'Ingenierie Logicielle',16,'#FF0000'),(22,'Initiation au Latex',17,'#FF0000'),(23,'Comptabilité',17,'#FF0000'),(24,'Technologie mobile',17,'#27FF57');
/*!40000 ALTER TABLE `techtime_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techtime_myuser`
--

DROP TABLE IF EXISTS `techtime_myuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `techtime_myuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `niveau_id` bigint DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_teacher` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `TechTime_myuser_niveau_id_c2b8586e_fk_TechTime_niveau_id` (`niveau_id`),
  CONSTRAINT `TechTime_myuser_niveau_id_c2b8586e_fk_TechTime_niveau_id` FOREIGN KEY (`niveau_id`) REFERENCES `techtime_niveau` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techtime_myuser`
--

LOCK TABLES `techtime_myuser` WRITE;
/*!40000 ALTER TABLE `techtime_myuser` DISABLE KEYS */;
INSERT INTO `techtime_myuser` VALUES (15,'2023-06-30 14:52:10.148959',1,'arixalim@gmail.com','Arix','ALIMAGNIDOKPO','pbkdf2_sha256$320000$hYtJia0cWqD2mxmCFCXIwr$uRgPFulJQdJPR65kVOk7Fk0BMlMAuFh4B7IR8Yiu39I=',1,1,15,1,0),(27,NULL,0,'pzohou@icloud.com','Jérome','ZOHOU','passme',1,0,NULL,0,1),(28,NULL,0,'johnaoga@icloud.com','John','AOGA','passme',1,0,NULL,0,1),(29,'2023-06-28 17:13:02.391542',0,'techtimetable29@gmail.com','ghjkj','ddfdf','pbkdf2_sha256$320000$tseFHImgzAKS6aTsCjnIO7$fA0m77RTFIGcaZ0MHXYivxeJDooY57UUULdLS8mE4/4=',1,0,17,0,0),(32,'2023-06-29 15:30:57.276505',0,'johndoe23@exemple.com','John','DOE','pbkdf2_sha256$600000$54tbSVKDDz9qagLcMUZDu9$BF57kRhJhXOilld8gtHWVmM7kTtXTwlPTjC1xgI2sI8=',1,0,15,0,0),(34,'2023-06-30 14:50:55.713048',0,'arixangemichel@gmail.com','Arix','ALIMAGNIDOKPO','pbkdf2_sha256$320000$QAJyBMIdc5lhOAkPycqJAg$gY7sftZw7wzKtRXHWd0Pjp7T0EKSLUUD1lkhZ/pZUgo=',1,0,15,0,0);
/*!40000 ALTER TABLE `techtime_myuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techtime_myuser_groups`
--

DROP TABLE IF EXISTS `techtime_myuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `techtime_myuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `myuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TechTime_myuser_groups_myuser_id_group_id_bc1c55ce_uniq` (`myuser_id`,`group_id`),
  KEY `TechTime_myuser_groups_group_id_841a2a76_fk_auth_group_id` (`group_id`),
  CONSTRAINT `TechTime_myuser_groups_group_id_841a2a76_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `TechTime_myuser_groups_myuser_id_3b902de0_fk_TechTime_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `techtime_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techtime_myuser_groups`
--

LOCK TABLES `techtime_myuser_groups` WRITE;
/*!40000 ALTER TABLE `techtime_myuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `techtime_myuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techtime_myuser_user_permissions`
--

DROP TABLE IF EXISTS `techtime_myuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `techtime_myuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `myuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TechTime_myuser_user_per_myuser_id_permission_id_0fde8b01_uniq` (`myuser_id`,`permission_id`),
  KEY `TechTime_myuser_user_permission_id_a6939140_fk_auth_perm` (`permission_id`),
  CONSTRAINT `TechTime_myuser_user_myuser_id_e1f01540_fk_TechTime_` FOREIGN KEY (`myuser_id`) REFERENCES `techtime_myuser` (`id`),
  CONSTRAINT `TechTime_myuser_user_permission_id_a6939140_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techtime_myuser_user_permissions`
--

LOCK TABLES `techtime_myuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `techtime_myuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `techtime_myuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techtime_niveau`
--

DROP TABLE IF EXISTS `techtime_niveau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `techtime_niveau` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techtime_niveau`
--

LOCK TABLES `techtime_niveau` WRITE;
/*!40000 ALTER TABLE `techtime_niveau` DISABLE KEYS */;
INSERT INTO `techtime_niveau` VALUES (15,'Licence 1',200),(16,'Licence 2',200),(17,'Licence 3',200);
/*!40000 ALTER TABLE `techtime_niveau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techtime_shedule`
--

DROP TABLE IF EXISTS `techtime_shedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `techtime_shedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `week_num` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `subject_id` bigint NOT NULL,
  `teacher_id` bigint NOT NULL,
  `classroom_id` bigint DEFAULT NULL,
  `niveau_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TechTime_shedule_subject_id_080d48e5_fk_TechTime_matiere_id` (`subject_id`),
  KEY `TechTime_shedule_teacher_id_581d90b8_fk_TechTime_myuser_id` (`teacher_id`),
  KEY `TechTime_shedule_classroom_id_ad35233d_fk_TechTime_classroom_id` (`classroom_id`),
  KEY `TechTime_shedule_niveau_id_0316ac55_fk_TechTime_niveau_id` (`niveau_id`),
  CONSTRAINT `TechTime_shedule_classroom_id_ad35233d_fk_TechTime_classroom_id` FOREIGN KEY (`classroom_id`) REFERENCES `techtime_classroom` (`id`),
  CONSTRAINT `TechTime_shedule_niveau_id_0316ac55_fk_TechTime_niveau_id` FOREIGN KEY (`niveau_id`) REFERENCES `techtime_niveau` (`id`),
  CONSTRAINT `TechTime_shedule_subject_id_080d48e5_fk_TechTime_matiere_id` FOREIGN KEY (`subject_id`) REFERENCES `techtime_matiere` (`id`),
  CONSTRAINT `TechTime_shedule_teacher_id_581d90b8_fk_TechTime_myuser_id` FOREIGN KEY (`teacher_id`) REFERENCES `techtime_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techtime_shedule`
--

LOCK TABLES `techtime_shedule` WRITE;
/*!40000 ALTER TABLE `techtime_shedule` DISABLE KEYS */;
INSERT INTO `techtime_shedule` VALUES (2,'2023-06-29 00:58:00.000000','2023-06-29 00:58:00.000000',26,'2023-06-29 00:06:13.426679',4,28,1,15),(3,'2023-07-01 07:00:00.000000','2023-07-01 10:01:00.000000',26,'2023-06-29 00:08:40.833850',3,27,1,15),(5,'2023-06-29 16:30:00.000000','2023-06-29 19:00:00.000000',26,'2023-06-29 12:22:42.878901',5,28,2,15),(6,'2023-06-26 10:00:00.000000','2023-06-26 13:00:00.000000',26,'2023-06-29 12:31:21.966163',3,27,1,15),(10,'2023-06-29 16:58:00.000000','2023-06-29 16:58:00.000000',26,'2023-06-29 16:04:20.431338',3,27,1,15),(15,'2023-06-30 15:17:00.000000','2023-06-30 17:17:00.000000',26,'2023-06-30 14:18:04.219211',13,27,1,15),(16,'2023-06-30 15:17:00.000000','2023-06-30 17:17:00.000000',26,'2023-06-30 14:18:05.755830',13,27,1,15),(27,'2023-06-30 15:52:00.000000','2023-06-30 15:52:00.000000',26,'2023-06-30 14:52:36.868943',3,27,1,15),(28,'2023-06-24 15:59:00.000000','2023-06-24 15:59:00.000000',25,'2023-06-30 14:59:33.148572',3,27,1,15),(29,'2023-06-24 15:59:00.000000','2023-06-24 15:59:00.000000',25,'2023-06-30 14:59:34.616626',3,27,1,15);
/*!40000 ALTER TABLE `techtime_shedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-30 16:52:37
