-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: ingenieria
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `apartado`
--

DROP TABLE IF EXISTS `apartado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartado` (
  `idApartado` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpleado` int(11) DEFAULT NULL,
  `idPagoApartado` int(11) DEFAULT NULL,
  `idVenta` int(11) DEFAULT NULL,
  `flete` tinyint(1) DEFAULT NULL,
  `cantidadPieza` int(11) DEFAULT NULL,
  `importeApartado` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `fechaApartado` datetime DEFAULT NULL,
  `estatus` text,
  PRIMARY KEY (`idApartado`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idPagoApartado` (`idPagoApartado`),
  KEY `idVenta` (`idVenta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartado`
--

LOCK TABLES `apartado` WRITE;
/*!40000 ALTER TABLE `apartado` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `idPersona` int(11) DEFAULT NULL,
  `rfc` text,
  `frecuente` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `idPersona` (`idPersona`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comision`
--

DROP TABLE IF EXISTS `comision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comision` (
  `idComision` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) DEFAULT NULL,
  `montoComision` float DEFAULT NULL,
  `fechaComision` datetime DEFAULT NULL,
  PRIMARY KEY (`idComision`),
  KEY `idVenta` (`idVenta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comision`
--

LOCK TABLES `comision` WRITE;
/*!40000 ALTER TABLE `comision` DISABLE KEYS */;
/*!40000 ALTER TABLE `comision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleapartado`
--

DROP TABLE IF EXISTS `detalleapartado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleapartado` (
  `idDetalleApartado` int(11) NOT NULL AUTO_INCREMENT,
  `idPagoApartado` int(11) DEFAULT NULL,
  `idApartado` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `subTotal` float DEFAULT NULL,
  PRIMARY KEY (`idDetalleApartado`),
  KEY `idPagoApartado` (`idPagoApartado`),
  KEY `idApartado` (`idApartado`),
  KEY `idProducto` (`idProducto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleapartado`
--

LOCK TABLES `detalleapartado` WRITE;
/*!40000 ALTER TABLE `detalleapartado` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleapartado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleventa` (
  `idDetalleVenta` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subTotal` float DEFAULT NULL,
  PRIMARY KEY (`idDetalleVenta`),
  KEY `idVenta` (`idVenta`),
  KEY `idProducto` (`idProducto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventa`
--

LOCK TABLES `detalleventa` WRITE;
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `idPersona` int(11) DEFAULT NULL,
  `cargo` text,
  PRIMARY KEY (`idEmpleado`),
  KEY `idPersona` (`idPersona`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,1,'Vendedor'),(2,2,'Vendedir');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flete`
--

DROP TABLE IF EXISTS `flete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flete` (
  `idFlete` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` text,
  `costo` float DEFAULT NULL,
  PRIMARY KEY (`idFlete`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flete`
--

LOCK TABLES `flete` WRITE;
/*!40000 ALTER TABLE `flete` DISABLE KEYS */;
/*!40000 ALTER TABLE `flete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garantia`
--

DROP TABLE IF EXISTS `garantia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `garantia` (
  `idGarantia` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `descripcion` text,
  `nombreTecnico` text,
  PRIMARY KEY (`idGarantia`),
  KEY `idVenta` (`idVenta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garantia`
--

LOCK TABLES `garantia` WRITE;
/*!40000 ALTER TABLE `garantia` DISABLE KEYS */;
/*!40000 ALTER TABLE `garantia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagoapartado`
--

DROP TABLE IF EXISTS `pagoapartado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagoapartado` (
  `idPagoApartado` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) DEFAULT NULL,
  `idFlete` int(11) DEFAULT NULL,
  `fechaPago` datetime DEFAULT NULL,
  `totalPago` float DEFAULT NULL,
  `deuda` float DEFAULT NULL,
  `numeroPago` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPagoApartado`),
  KEY `idFlete` (`idFlete`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagoapartado`
--

LOCK TABLES `pagoapartado` WRITE;
/*!40000 ALTER TABLE `pagoapartado` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagoapartado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagoventa`
--

DROP TABLE IF EXISTS `pagoventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagoventa` (
  `idPagoVenta` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) DEFAULT NULL,
  `idFlete` int(11) DEFAULT NULL,
  `fechaPago` datetime DEFAULT NULL,
  `totalPago` float DEFAULT NULL,
  PRIMARY KEY (`idPagoVenta`),
  KEY `idVenta` (`idVenta`),
  KEY `idFlete` (`idFlete`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagoventa`
--

LOCK TABLES `pagoventa` WRITE;
/*!40000 ALTER TABLE `pagoventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagoventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `apaterno` text,
  `amaterno` text,
  `edad` int(11) DEFAULT NULL,
  `telefono` text,
  `email` text,
  `direccion` text,
  PRIMARY KEY (`idPersona`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Juan','Alva','Bustamante',20,'5516365615','juanalva432@gmail.com','Zumpango'),(2,'Vero','Cvz','Torres',24,'5516365627','vero.cure24@gmail.com','Santo Domingo');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` text,
  `producto` text,
  `costo` float DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`idProducto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarjeta` (
  `idTarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) DEFAULT NULL,
  `idVenta` int(11) DEFAULT NULL,
  `saldo` float DEFAULT NULL,
  PRIMARY KEY (`idTarjeta`),
  KEY `idCliente` (`idCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` text,
  `contrasenia` text,
  `id_persona` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'juan123','123',1),(2,'vero123','1234',2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idFlete` int(11) DEFAULT NULL,
  `idPagoVenta` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `totalVenta` float DEFAULT NULL,
  `totalIVA` float DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `idPagoVenta` (`idPagoVenta`),
  KEY `idFlete` (`idFlete`),
  KEY `idCliente` (`idCliente`),
  KEY `idEmpleado` (`idEmpleado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ingenieria'
--
/*!50003 DROP PROCEDURE IF EXISTS `deleteEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteEmpleado`(idPersonaIN int)
BEGIN
DELETE FROM usuarios WHERE id_persona = idPersonaIN;
DELETE FROM empleado WHERE idPersona = idPersonaIN;
DELETE FROM persona WHERE idPersona = idPersonaIN;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEmpleado`(
nombre VARCHAR(50), 
apaterno VARCHAR(50),
amaterno VARCHAR(50),
edad VARCHAR(50),
telefono VARCHAR(50),
email VARCHAR(50),
direccion VARCHAR(50),
cargo VARCHAR(50),
usuario VARCHAR(50),
contraseña VARCHAR(50))
BEGIN 
DECLARE 
idPersona int;
INSERT INTO PERSONA VALUES (null, nombre, apaterno, amaterno, edad, telefono, email, direccion);
set idPersona = (Select last_insert_id());
INSERT INTO empleado values (null, idPersona, cargo);
INSERT INTO usuarios VALUES (null, usuario, contraseña, idPersona);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmpleado`(
id_personaIN int,
nombreIN VARCHAR(50), 
aparternoIN VARCHAR(50),
amaternoIN VARCHAR(50),
edadIN VARCHAR(50),
telefonoIN VARCHAR(50),
emailIN VARCHAR(50),
direccionIN VARCHAR(50),
cargoIN VARCHAR(50),
usuarioIN VARCHAR(50),
contraseñaIN VARCHAR(50))
BEGIN 
Update persona set nombre = nombreIN, apaterno = aparternoIN, amaterno = amaternoIN,
edad = edadIN, telefono = telefonoIN, email = emailIN, direccion = direccionIN 
where idPersona = id_personaIN;
Update empleado set cargo = cargoIN where idPersona = id_personaIN;
Update usuarios set nombreUsuario = usuarioIN, contrasenia = contraseñaIN where id_persona = id_personaIN;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-24  3:20:52
