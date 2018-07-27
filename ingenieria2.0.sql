-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2018 a las 22:03:00
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `ingenieria`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteEmpleado`(idPersonaIN int)
BEGIN
DELETE FROM usuarios WHERE id_persona = idPersonaIN;
DELETE FROM empleado WHERE idPersona = idPersonaIN;
DELETE FROM persona WHERE idPersona = idPersonaIN;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartado`
--

CREATE TABLE IF NOT EXISTS `apartado` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `idPersona` int(11) DEFAULT NULL,
  `rfc` text,
  `frecuente` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `idPersona` (`idPersona`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `idPersona`, `rfc`, `frecuente`) VALUES
(1, 6, '123456789', 0),
(2, 7, '123456789', 1),
(3, 8, '123456789', 12),
(4, 9, '123456789', 0),
(5, 10, '123456789', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comision`
--

CREATE TABLE IF NOT EXISTS `comision` (
  `idComision` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) DEFAULT NULL,
  `montoComision` float DEFAULT NULL,
  `fechaComision` date DEFAULT NULL,
  PRIMARY KEY (`idComision`),
  KEY `idVenta` (`idVenta`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `comision`
--

INSERT INTO `comision` (`idComision`, `idVenta`, `montoComision`, `fechaComision`) VALUES
(1, 2, 2.1, '2018-07-27'),
(2, 3, 3, '2018-07-27'),
(3, 4, 1.5, '2018-07-27'),
(4, 5, 0.06, '2018-07-27'),
(5, 6, 2.4, '2018-07-27'),
(6, 7, 1.5, '2018-07-27'),
(7, 9, 2.34, '2018-07-27'),
(8, 10, 2.64, '2018-07-27'),
(9, 11, 7.02, '2018-07-27'),
(10, 12, 4.3992, '2018-07-27'),
(11, 13, 14.1, '2018-07-27'),
(12, 14, 19.98, '2018-07-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleapartado`
--

CREATE TABLE IF NOT EXISTS `detalleapartado` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE IF NOT EXISTS `detalleventa` (
  `idDetalleVenta` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subTotal` float DEFAULT NULL,
  PRIMARY KEY (`idDetalleVenta`),
  KEY `idVenta` (`idVenta`),
  KEY `idProducto` (`idProducto`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`idDetalleVenta`, `idVenta`, `idProducto`, `cantidad`, `subTotal`) VALUES
(1, 3, 1, 5, 100),
(2, 4, 1, 1, 20),
(3, 4, 2, 1, 30),
(4, 5, 4, 1, 2),
(5, 6, 9, 1, 20),
(6, 6, 4, 1, 2),
(7, 6, 5, 2, 58),
(8, 7, 1, 1, 20),
(9, 7, 2, 1, 30),
(10, 8, 13, 2, 156),
(11, 9, 13, 1, 78),
(12, 10, 13, 1, 78),
(13, 10, 3, 1, 10),
(14, 11, 13, 3, 234),
(15, 12, 13, 2, 156),
(16, 13, 7, 1, 500),
(17, 14, 1, 1, 20),
(18, 14, 7, 1, 500),
(19, 14, 5, 1, 58),
(20, 14, 12, 2, 10),
(21, 14, 13, 1, 78);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `idPersona` int(11) DEFAULT NULL,
  `cargo` text,
  `foto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `idPersona` (`idPersona`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `idPersona`, `cargo`, `foto`) VALUES
(5, 5, 'Gerente', 'BrilloMio.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flete`
--

CREATE TABLE IF NOT EXISTS `flete` (
  `idFlete` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` text,
  `costo` float DEFAULT NULL,
  PRIMARY KEY (`idFlete`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `flete`
--

INSERT INTO `flete` (`idFlete`, `direccion`, `costo`) VALUES
(1, 'null', 500),
(2, 'En lo mas turbas', 500),
(3, 'SD', 500),
(4, 'SD', 500),
(5, 'nueva perro', 500),
(6, 'SD', 500),
(7, 'tu mama', 500),
(8, 'SD', 500),
(9, 'SD', 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `garantia`
--

CREATE TABLE IF NOT EXISTS `garantia` (
  `idGarantia` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `descripcion` text,
  `nombreTecnico` text,
  PRIMARY KEY (`idGarantia`),
  KEY `idVenta` (`idVenta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagoapartado`
--

CREATE TABLE IF NOT EXISTS `pagoapartado` (
  `idPagoApartado` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) DEFAULT NULL,
  `idFlete` int(11) DEFAULT NULL,
  `fechaPago` datetime DEFAULT NULL,
  `totalPago` float DEFAULT NULL,
  `deuda` float DEFAULT NULL,
  `numeroPago` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPagoApartado`),
  KEY `idFlete` (`idFlete`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagoventa`
--

CREATE TABLE IF NOT EXISTS `pagoventa` (
  `idPagoVenta` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) DEFAULT NULL,
  `idFlete` int(11) DEFAULT NULL,
  `fechaPago` date DEFAULT NULL,
  `totalPago` float DEFAULT NULL,
  PRIMARY KEY (`idPagoVenta`),
  KEY `idVenta` (`idVenta`),
  KEY `idFlete` (`idFlete`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `pagoventa`
--

INSERT INTO `pagoventa` (`idPagoVenta`, `idVenta`, `idFlete`, `fechaPago`, `totalPago`) VALUES
(1, 2, 0, '2018-07-27', 1),
(2, 3, 0, '2018-07-27', 1),
(3, 4, 0, '2018-07-27', 100),
(4, 5, 1, '2018-07-27', 1),
(5, 6, 0, '2018-07-27', 1),
(6, 7, 2, '2018-07-27', 1),
(7, 9, 5, '2018-07-27', 100),
(8, 10, 6, '2018-07-27', 1),
(9, 11, 7, '2018-07-27', 300),
(10, 12, 0, '2018-07-27', 190),
(11, 13, 8, '2018-07-27', 600),
(12, 14, 9, '2018-07-27', 800);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `apaterno` text,
  `amaterno` text,
  `edad` int(11) DEFAULT NULL,
  `telefono` text,
  `email` text,
  `direccion` text,
  PRIMARY KEY (`idPersona`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `nombre`, `apaterno`, `amaterno`, `edad`, `telefono`, `email`, `direccion`) VALUES
(5, 'Juan', 'ALva', 'Bustamante', 20, '671256387', 'juanalva432@gmail.com', 'Zumpango'),
(6, 'Juan', 'Alva', 'Bustamante', 20, '5586929212', 'email@email.com', 'SD'),
(7, 'Jose', 'Alva', 'Bustamante', 20, '5586929212', 'email@email.com', 'SD'),
(8, 'Luis', 'Alva', 'Bustamante', 20, '5586929212', 'email@email.com', 'SD'),
(9, 'Alberto', 'Alva', 'Bustamante', 20, '5586929212', 'email@email.com', 'SD'),
(10, 'Gilberto', 'Alva', 'Bustamante', 20, '5586929212', 'email@email.com', 'SD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` text,
  `producto` text,
  `costo` float DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`idProducto`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `categoria`, `producto`, `costo`, `cantidad`, `descripcion`) VALUES
(1, 'Linea Blanca', 'Lavadora', 20, 2, 'Es una lavadora chida'),
(2, 'Linea Blanca', 'Lavadora', 30, 3, 'Es una lavadora chida'),
(3, 'Linea Blanca', 'Lavadora', 10, 1, 'Es una lavadora chida'),
(4, 'Linea Blanca', 'Refrigerador', 2, 4, 'Es una lavadora chida'),
(5, 'Linea Blanca', 'Refrigerador', 58, 3, 'Es una lavadora chida'),
(6, 'Linea Blanca', 'Tostador', 100, 3, 'Es una lavadora chida'),
(7, 'Decoracion', 'Globos', 500, 1, 'Es una lavadora chida1'),
(8, 'Decoracion', 'Globos', 45, 5, 'Es una lavadora chida1'),
(9, 'Decoracion', 'Globos', 20, 1, 'Es una lavadora chida1'),
(10, 'Decoracion', 'Globos', 12, 2, 'Es una lavadora chida1'),
(11, 'Decoracion', 'Muebles', 23, 0, 'Es una lavadora chida1'),
(12, 'Decoracion', 'Muebles', 5, 1, 'Es una lavadora chida1'),
(13, 'Decoracion', 'Muebles', 78, 5, 'Es una lavadora chida1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE IF NOT EXISTS `tarjeta` (
  `idTarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) DEFAULT NULL,
  `idVenta` int(11) DEFAULT NULL,
  `saldo` float DEFAULT NULL,
  PRIMARY KEY (`idTarjeta`),
  KEY `idCliente` (`idCliente`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`idTarjeta`, `idCliente`, `idVenta`, `saldo`) VALUES
(1, 3, 0, 62);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` text,
  `contrasenia` text,
  `id_persona` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombreUsuario`, `contrasenia`, `id_persona`) VALUES
(5, 'juanalva', 'juan123', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idFlete` int(11) DEFAULT NULL,
  `idPagoVenta` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `totalVenta` float DEFAULT NULL,
  `totalIVA` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `idPagoVenta` (`idPagoVenta`),
  KEY `idFlete` (`idFlete`),
  KEY `idCliente` (`idCliente`),
  KEY `idEmpleado` (`idEmpleado`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idVenta`, `idCliente`, `idEmpleado`, `idFlete`, `idPagoVenta`, `cantidad`, `totalVenta`, `totalIVA`, `fecha`) VALUES
(1, 3, 5, 0, 0, 6, 158, 25.28, '2018-07-27'),
(2, 3, 5, 0, 0, 4, 70, 11.2, '2018-07-27'),
(3, 3, 5, 0, 0, 5, 100, 16, '2018-07-27'),
(4, 3, 5, 0, 0, 2, 50, 8, '2018-07-27'),
(5, 3, 5, 1, 0, 1, 2, 0.32, '2018-07-27'),
(6, 3, 5, 0, 0, 3, 80, 12.8, '2018-07-27'),
(7, 3, 5, 2, 0, 2, 50, 8, '2018-07-27'),
(8, 3, 5, 4, 0, 2, 156, 24.96, '2018-07-27'),
(9, 3, 5, 5, 0, 1, 78, 12.48, '2018-07-27'),
(10, 3, 5, 6, 0, 2, 88, 14.08, '2018-07-27'),
(11, 3, 5, 7, 0, 3, 234, 37.44, '2018-07-27'),
(12, 3, 5, 0, 0, 2, 146.64, 24.96, '2018-07-27'),
(13, 3, 5, 8, 0, 1, 470, 80, '2018-07-27'),
(14, 2, 5, 9, 0, 6, 666, 106.56, '2018-07-27');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
