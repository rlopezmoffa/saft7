-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: saft_development
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.20.04.1

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
-- Table structure for table `administraciones`
--

DROP TABLE IF EXISTS `administraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administraciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administraciones`
--

LOCK TABLES `administraciones` WRITE;
/*!40000 ALTER TABLE `administraciones` DISABLE KEYS */;
INSERT INTO `administraciones` VALUES (1,'Virginia Nosiglia','2023-12-14 12:44:43.686461','2023-12-14 12:44:43.686461');
/*!40000 ALTER TABLE `administraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2023-12-01 17:42:17.560408','2023-12-18 16:47:00.857373');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boletas`
--

DROP TABLE IF EXISTS `boletas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boletas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `chofer_id` int DEFAULT '0',
  `vehiculo_id` int DEFAULT '0',
  `recaudacion` decimal(10,2) DEFAULT '0.00',
  `turno` int DEFAULT NULL,
  `comision` decimal(10,0) DEFAULT '0',
  `combustible` decimal(10,0) DEFAULT '0',
  `aceite` decimal(10,0) DEFAULT '0',
  `gomeria` decimal(10,0) DEFAULT '0',
  `lavados` decimal(10,0) DEFAULT '0',
  `otros` decimal(10,0) DEFAULT '0',
  `detalle_otros` varchar(255) DEFAULT NULL,
  `aportes` decimal(10,0) DEFAULT '0',
  `subtotal` decimal(10,0) DEFAULT NULL,
  `ganancia` decimal(10,0) DEFAULT NULL,
  `kmts` int DEFAULT '0',
  `rec_efectivo` decimal(10,0) DEFAULT '0',
  `rec_mercado_pago` decimal(10,0) DEFAULT '0',
  `rec_oca_cel` decimal(10,0) DEFAULT '0',
  `rec_bits` decimal(10,0) DEFAULT '0',
  `rec_transferencia` decimal(10,0) DEFAULT '0',
  `rec_h13` decimal(10,0) DEFAULT '0',
  `rec_otros` decimal(10,0) DEFAULT '0',
  `administracion_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boletas`
--

LOCK TABLES `boletas` WRITE;
/*!40000 ALTER TABLE `boletas` DISABLE KEYS */;
INSERT INTO `boletas` VALUES (45,'2023-12-18','2023-12-18 14:50:54.084193','2023-12-18 14:51:19.446406',1,5,100.00,1,0,0,0,0,0,0,'',0,NULL,NULL,0,100,0,0,0,0,0,0,1);
/*!40000 ALTER TABLE `boletas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choferes`
--

DROP TABLE IF EXISTS `choferes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choferes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `vencimiento_libreta_chofer` date DEFAULT NULL,
  `vencimiento_carne_salud` date DEFAULT NULL,
  `vencimiento_cedula` date DEFAULT NULL,
  `cedula` varchar(255) DEFAULT NULL,
  `libreta_chofer` varchar(255) DEFAULT NULL,
  `carne_salud` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL,
  `telefonos` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mutualista` varchar(255) DEFAULT NULL,
  `emergencia` varchar(255) DEFAULT NULL,
  `contacto_tercero` varchar(255) DEFAULT NULL,
  `banco` varchar(255) DEFAULT NULL,
  `cuenta_banco` varchar(255) DEFAULT NULL,
  `sucursal_banco` varchar(255) DEFAULT NULL,
  `observaciones` text,
  `administracion_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choferes`
--

LOCK TABLES `choferes` WRITE;
/*!40000 ALTER TABLE `choferes` DISABLE KEYS */;
INSERT INTO `choferes` VALUES (1,'1','Hugo Alberto','Martinez Cardozo','2023-12-01 19:14:20.541793','2023-12-18 14:31:12.087094','2024-03-06','2023-12-26','2023-04-04','17923631','E','','1965-11-23','Luis Kousut 4519','095637793','','','','','22040544 Madre','','','','',1),(12,'2','FRANCISCO IVAN','MENDEZ HRCHILLA','2023-12-18 14:42:09.864856','2023-12-18 14:42:09.864856','2023-01-20','2023-12-06','2024-01-22','50523428','E','MEDILAB','2000-05-28','AV GIANATASSIO KM 28500 ESQ CIUDAD DE LA PLATA','098974598','','','','','MADRE 091886243 PADRE 099824673','','','','',1);
/*!40000 ALTER TABLE `choferes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `nro_bps` varchar(255) DEFAULT NULL,
  `rut` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `flag_activa` tinyint(1) DEFAULT '1',
  `observaciones` text,
  `telefonos` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `administracion_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'CAZERES','Carlos Vaz Ferreira 3684','','21497890010','2023-12-06 13:51:05.843997','2023-12-18 14:24:44.149383','2023-12-12',1,'','','','',1);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas_choferes`
--

DROP TABLE IF EXISTS `empresas_choferes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas_choferes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `empresa_id` int DEFAULT NULL,
  `chofer_id` int DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `fecha_alta_bps` date DEFAULT NULL,
  `porc_comision` decimal(10,3) DEFAULT '0.000',
  `porc_aporte` decimal(10,3) DEFAULT '0.000',
  `administracion_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas_choferes`
--

LOCK TABLES `empresas_choferes` WRITE;
/*!40000 ALTER TABLE `empresas_choferes` DISABLE KEYS */;
INSERT INTO `empresas_choferes` VALUES (13,2,2,'2023-11-27','2023-12-07 17:56:54.933214','2023-12-08 14:23:24.237009',NULL,0.000,0.000,1),(25,3,2,'2023-12-01','2023-12-08 13:51:21.517295','2023-12-08 13:51:21.517295',NULL,0.000,0.000,1),(26,3,1,'2023-12-05','2023-12-08 13:52:00.645160','2023-12-08 13:52:00.645160',NULL,0.000,0.000,1),(29,1,1,'2023-05-02','2023-12-08 14:11:24.265095','2023-12-18 16:50:23.236896','2023-05-02',29.000,21.100,1),(32,1,12,'2023-07-26','2023-12-18 14:43:17.622169','2023-12-18 16:50:40.851112','2023-07-26',29.000,19.600,1);
/*!40000 ALTER TABLE `empresas_choferes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquidaciones_vehiculos`
--

DROP TABLE IF EXISTS `liquidaciones_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liquidaciones_vehiculos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vehiculo_id` int DEFAULT NULL,
  `mes` int DEFAULT NULL,
  `anio` int DEFAULT NULL,
  `dia` int DEFAULT NULL,
  `rec_diurna` decimal(10,0) DEFAULT '0',
  `rec_nocturna` decimal(10,0) DEFAULT '0',
  `comision` decimal(10,0) DEFAULT '0',
  `combustible` decimal(10,0) DEFAULT '0',
  `aceite` decimal(10,0) DEFAULT '0',
  `gomeria` decimal(10,0) DEFAULT '0',
  `lavados` decimal(10,0) DEFAULT '0',
  `otros` decimal(10,0) DEFAULT '0',
  `detalle_otros` varchar(255) DEFAULT NULL,
  `aportes` decimal(10,0) DEFAULT '0',
  `subtotal` decimal(10,0) DEFAULT NULL,
  `ganancia` decimal(10,0) DEFAULT NULL,
  `kmts` int DEFAULT '0',
  `valor_kmt` decimal(10,0) DEFAULT NULL,
  `administracion_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquidaciones_vehiculos`
--

LOCK TABLES `liquidaciones_vehiculos` WRITE;
/*!40000 ALTER TABLE `liquidaciones_vehiculos` DISABLE KEYS */;
INSERT INTO `liquidaciones_vehiculos` VALUES (134,NULL,NULL,NULL,18,100,0,0,0,0,0,0,0,'',0,0,0,0,0,0);
/*!40000 ALTER TABLE `liquidaciones_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20231201174056'),('20231201182456'),('20231201183255'),('20231201183403'),('20231201184124'),('20231201185551'),('20231201190221'),('20231201190253'),('20231201190604'),('20231201190804'),('20231201191106'),('20231201221508'),('20231201225247'),('20231201225317'),('20231202144757'),('20231206134835'),('20231206142854'),('20231206183954'),('20231207141815'),('20231208221721'),('20231208221802'),('20231208221824'),('20231211123546'),('20231211124350'),('20231211131949'),('20231211150805'),('20231211150819'),('20231212135726'),('20231212135905'),('20231212135947'),('20231212140625'),('20231212140715'),('20231212140746'),('20231212142204'),('20231212142506'),('20231212142535'),('20231212144311'),('20231212144337'),('20231212144359'),('20231212144418'),('20231212144441'),('20231212144514'),('20231212150630'),('20231212150703'),('20231212150740'),('20231212150821'),('20231212150901'),('20231212150923'),('20231212150952'),('20231212151014'),('20231212151039'),('20231212151104'),('20231212151134'),('20231212151200'),('20231212151217'),('20231212151239'),('20231212151307'),('20231213150838'),('20231214124241'),('20231214125654'),('20231214131017'),('20231218163536');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime(6) DEFAULT NULL,
  `remember_created_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `administracion_id` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'rlopezmoffa@gmail.com','$2a$12$2WhaG3oyJr5fNHeD5juSCOMj2D9TFfo8BC0VFySv6V7jckTH8fS6i','89ffc67e3b684f5d158ab13e686af5cc7dd8545c72a3da6d838e407f995ae05e','2023-12-01 18:25:49.596755','2023-12-07 15:06:48.540977','2023-12-01 18:03:56.625395','2023-12-07 15:06:48.541837',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `matricula` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `empresa_id` int DEFAULT '0',
  `seguro` varchar(255) DEFAULT NULL,
  `padron` varchar(255) DEFAULT NULL,
  `motor` varchar(255) DEFAULT NULL,
  `chasis` varchar(255) DEFAULT NULL,
  `combustible` varchar(255) DEFAULT NULL,
  `observaciones` text,
  `administracion_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES (5,'1234','CITROEN','','1505','2023-12-01 22:27:02.033589','2023-12-18 14:48:53.432419',1,'FAR','903604098','10JBEC01311117','VF7DD9HJCPJ514016','Gasoil 50-S','',1);
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-20 12:08:07
