CREATE DATABASE  IF NOT EXISTS `bd-20171051` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd-20171051`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 35.223.1.130    Database: bd-20171051
-- ------------------------------------------------------
-- Server version	8.0.26-google

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'f9d0f6b0-2e2f-11ed-b746-42010a800002:1-56971';

--
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad` (
  `id_actividad` bigint NOT NULL AUTO_INCREMENT,
  `cantidad_insumo` double DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `id_insumo` bigint DEFAULT NULL,
  `id_siembra` bigint DEFAULT NULL,
  `id_tipo_actividad` bigint DEFAULT NULL,
  PRIMARY KEY (`id_actividad`),
  KEY `FKsmx1cttb9o7dc4sqxmpn8nuvi` (`id_insumo`),
  KEY `FK85qvtwwh4sp7113e5rv4eyq24` (`id_siembra`),
  KEY `FK3poo1sqltrp800vhevt1n5ylr` (`id_tipo_actividad`),
  CONSTRAINT `FK3poo1sqltrp800vhevt1n5ylr` FOREIGN KEY (`id_tipo_actividad`) REFERENCES `tipo_actividad` (`id_tipo_actividad`),
  CONSTRAINT `FK85qvtwwh4sp7113e5rv4eyq24` FOREIGN KEY (`id_siembra`) REFERENCES `siembra` (`id_siembra`),
  CONSTRAINT `FKsmx1cttb9o7dc4sqxmpn8nuvi` FOREIGN KEY (`id_insumo`) REFERENCES `insumo` (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agricultor_lote`
--

DROP TABLE IF EXISTS `agricultor_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agricultor_lote` (
  `id_agricultor_lote` bigint NOT NULL AUTO_INCREMENT,
  `rol` char(1) DEFAULT NULL,
  `id_lote` bigint DEFAULT NULL,
  `id_usuario` bigint DEFAULT NULL,
  PRIMARY KEY (`id_agricultor_lote`),
  KEY `FK26iuorrdfii99n0p6ciin02su` (`id_lote`),
  KEY `FKqio70sym9cfi9ctm3y0rryvks` (`id_usuario`),
  CONSTRAINT `FK26iuorrdfii99n0p6ciin02su` FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id_lote`),
  CONSTRAINT `FKqio70sym9cfi9ctm3y0rryvks` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agricultor_lote`
--

LOCK TABLES `agricultor_lote` WRITE;
/*!40000 ALTER TABLE `agricultor_lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `agricultor_lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_agricultor`
--

DROP TABLE IF EXISTS `cliente_agricultor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_agricultor` (
  `id_cliente_agricultor` bigint NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime(6) DEFAULT NULL,
  `id_agricultor` bigint DEFAULT NULL,
  `id_cliente` bigint DEFAULT NULL,
  PRIMARY KEY (`id_cliente_agricultor`),
  KEY `FKcas5g579o7wswg8w967uwdyo3` (`id_agricultor`),
  KEY `FKnd2ro0ieot1xg4194lwftbm87` (`id_cliente`),
  CONSTRAINT `FKcas5g579o7wswg8w967uwdyo3` FOREIGN KEY (`id_agricultor`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FKnd2ro0ieot1xg4194lwftbm87` FOREIGN KEY (`id_cliente`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_agricultor`
--

LOCK TABLES `cliente_agricultor` WRITE;
/*!40000 ALTER TABLE `cliente_agricultor` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_agricultor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion_pedidos`
--

DROP TABLE IF EXISTS `configuracion_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracion_pedidos` (
  `id_configuracion_pedidos` bigint NOT NULL AUTO_INCREMENT,
  `activo` bit(1) DEFAULT NULL,
  `dias_limite_pago` int DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id_configuracion_pedidos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion_pedidos`
--

LOCK TABLES `configuracion_pedidos` WRITE;
/*!40000 ALTER TABLE `configuracion_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracion_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cosecha`
--

DROP TABLE IF EXISTS `cosecha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cosecha` (
  `id_cosecha` bigint NOT NULL AUTO_INCREMENT,
  `cantidad_obtenida` int DEFAULT NULL,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `id_siembra` bigint DEFAULT NULL,
  PRIMARY KEY (`id_cosecha`),
  KEY `FKsn4nbc3arfrjjew7rfvi0th44` (`id_siembra`),
  CONSTRAINT `FKsn4nbc3arfrjjew7rfvi0th44` FOREIGN KEY (`id_siembra`) REFERENCES `siembra` (`id_siembra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cosecha`
--

LOCK TABLES `cosecha` WRITE;
/*!40000 ALTER TABLE `cosecha` DISABLE KEYS */;
/*!40000 ALTER TABLE `cosecha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costo_insumo`
--

DROP TABLE IF EXISTS `costo_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costo_insumo` (
  `id_costo_insumo` bigint NOT NULL AUTO_INCREMENT,
  `activo` bit(1) DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `id_insumo` bigint DEFAULT NULL,
  PRIMARY KEY (`id_costo_insumo`),
  KEY `FKpb1o4v48c3t678wuqxs22dshu` (`id_insumo`),
  CONSTRAINT `FKpb1o4v48c3t678wuqxs22dshu` FOREIGN KEY (`id_insumo`) REFERENCES `insumo` (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costo_insumo`
--

LOCK TABLES `costo_insumo` WRITE;
/*!40000 ALTER TABLE `costo_insumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `costo_insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `id_insumo` bigint NOT NULL AUTO_INCREMENT,
  `activo` bit(1) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `unidad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lote` (
  `id_lote` bigint NOT NULL AUTO_INCREMENT,
  `activo` bit(1) DEFAULT NULL,
  `area_ha` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `fecha_entrega` datetime(6) DEFAULT NULL,
  `fecha_entrega_estimada` datetime(6) DEFAULT NULL,
  `fecha_pedido` datetime(6) DEFAULT NULL,
  `mercado` bit(1) DEFAULT NULL,
  `motivo_rechazo` varchar(255) DEFAULT NULL,
  `pago_aceptado` bit(1) DEFAULT NULL,
  `total_real` double DEFAULT NULL,
  `total_sugerido` double DEFAULT NULL,
  `verificacion_pago` varchar(255) DEFAULT NULL,
  `id_cliente_agricultor` bigint DEFAULT NULL,
  `id_configuracion_pedidos` bigint DEFAULT NULL,
  `id_variedad_platano` bigint DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FK6c6695toi9um0ld54yq8dldf4` (`id_cliente_agricultor`),
  KEY `FKntyn13gmclxosp7c5si9jx1gn` (`id_configuracion_pedidos`),
  KEY `FKt7xc6ap9gpqmuaj1devk60oip` (`id_variedad_platano`),
  CONSTRAINT `FK6c6695toi9um0ld54yq8dldf4` FOREIGN KEY (`id_cliente_agricultor`) REFERENCES `cliente_agricultor` (`id_cliente_agricultor`),
  CONSTRAINT `FKntyn13gmclxosp7c5si9jx1gn` FOREIGN KEY (`id_configuracion_pedidos`) REFERENCES `configuracion_pedidos` (`id_configuracion_pedidos`),
  CONSTRAINT `FKt7xc6ap9gpqmuaj1devk60oip` FOREIGN KEY (`id_variedad_platano`) REFERENCES `variedad_platano` (`id_variedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precio_platano`
--

DROP TABLE IF EXISTS `precio_platano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precio_platano` (
  `id_precio_platano` bigint NOT NULL AUTO_INCREMENT,
  `activo` bit(1) DEFAULT NULL,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `precio_sugerido` double DEFAULT NULL,
  `id_agricultor` bigint DEFAULT NULL,
  `id_variedad_platano` bigint DEFAULT NULL,
  PRIMARY KEY (`id_precio_platano`),
  KEY `FKiv5pnya50d7wiw5n7uwo9hep8` (`id_agricultor`),
  KEY `FKh9un0jh2mg25t79w6rd54a1ot` (`id_variedad_platano`),
  CONSTRAINT `FKh9un0jh2mg25t79w6rd54a1ot` FOREIGN KEY (`id_variedad_platano`) REFERENCES `variedad_platano` (`id_variedad`),
  CONSTRAINT `FKiv5pnya50d7wiw5n7uwo9hep8` FOREIGN KEY (`id_agricultor`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precio_platano`
--

LOCK TABLES `precio_platano` WRITE;
/*!40000 ALTER TABLE `precio_platano` DISABLE KEYS */;
/*!40000 ALTER TABLE `precio_platano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siembra`
--

DROP TABLE IF EXISTS `siembra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siembra` (
  `id_siembra` bigint NOT NULL AUTO_INCREMENT,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `hijuelos_sembrados` int DEFAULT NULL,
  `id_lote` bigint DEFAULT NULL,
  `id_tipo_siembra` bigint DEFAULT NULL,
  PRIMARY KEY (`id_siembra`),
  KEY `FK7895npx6jsx7dkgpovaer26d1` (`id_lote`),
  KEY `FKr39m0iy9f54qf4xggble8u08w` (`id_tipo_siembra`),
  CONSTRAINT `FK7895npx6jsx7dkgpovaer26d1` FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id_lote`),
  CONSTRAINT `FKr39m0iy9f54qf4xggble8u08w` FOREIGN KEY (`id_tipo_siembra`) REFERENCES `tipo_siembra` (`id_tipo_siembra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siembra`
--

LOCK TABLES `siembra` WRITE;
/*!40000 ALTER TABLE `siembra` DISABLE KEYS */;
/*!40000 ALTER TABLE `siembra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_actividad`
--

DROP TABLE IF EXISTS `tipo_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_actividad` (
  `id_tipo_actividad` bigint NOT NULL AUTO_INCREMENT,
  `activo` bit(1) DEFAULT NULL,
  `descripcion` longtext,
  `duracion_estimada_dias` int DEFAULT NULL,
  `frecuencia_dias` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `recurrente` bit(1) DEFAULT NULL,
  `tiempo_max_cultivo` int DEFAULT NULL,
  `tiempo_min_cultivo` int DEFAULT NULL,
  `id_insumo` bigint DEFAULT NULL,
  PRIMARY KEY (`id_tipo_actividad`),
  KEY `FKl5gioeoa7lildeaupcx954aew` (`id_insumo`),
  CONSTRAINT `FKl5gioeoa7lildeaupcx954aew` FOREIGN KEY (`id_insumo`) REFERENCES `insumo` (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_actividad`
--

LOCK TABLES `tipo_actividad` WRITE;
/*!40000 ALTER TABLE `tipo_actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_siembra`
--

DROP TABLE IF EXISTS `tipo_siembra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_siembra` (
  `id_tipo_siembra` bigint NOT NULL AUTO_INCREMENT,
  `activo` bit(1) DEFAULT NULL,
  `area_planta` double DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `plantas_ha` int DEFAULT NULL,
  `tipo_surco` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_siembra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_siembra`
--

LOCK TABLES `tipo_siembra` WRITE;
/*!40000 ALTER TABLE `tipo_siembra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_siembra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` bigint NOT NULL AUTO_INCREMENT,
  `activo` bit(1) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `rol` char(1) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `telefono_fijo` varchar(255) DEFAULT NULL,
  `telefono_movil` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variedad_platano`
--

DROP TABLE IF EXISTS `variedad_platano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variedad_platano` (
  `id_variedad` bigint NOT NULL AUTO_INCREMENT,
  `activo` bit(1) DEFAULT NULL,
  `dias_cosecha` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_variedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variedad_platano`
--

LOCK TABLES `variedad_platano` WRITE;
/*!40000 ALTER TABLE `variedad_platano` DISABLE KEYS */;
/*!40000 ALTER TABLE `variedad_platano` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-09 23:44:22
