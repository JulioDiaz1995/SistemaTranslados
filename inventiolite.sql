-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-01-2022 a las 19:57:56
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `inventiolite`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `box`
--

CREATE TABLE IF NOT EXISTS `box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `image`, `name`, `description`, `created_at`) VALUES
(1, NULL, 'nuevo', NULL, '2021-09-20 14:13:15'),
(2, NULL, 'Usado', NULL, '2021-11-18 14:56:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuration`
--

CREATE TABLE IF NOT EXISTS `configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  `val` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short` (`short`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `configuration`
--

INSERT INTO `configuration` (`id`, `short`, `name`, `kind`, `val`) VALUES
(1, 'title', 'Titulo del Sistema', 2, 'Plasencia Inventario'),
(2, 'use_image_product', 'Utilizar Imagenes en los productos', 1, '0'),
(3, 'active_clients', 'Activar Empleados', 1, '0'),
(4, 'active_providers', 'Activar Encargados', 1, '0'),
(5, 'active_categories', 'Activar categorias', 1, '0'),
(6, 'active_reports_word', 'Activar reportes en Word', 1, '0'),
(7, 'active_reports_excel', 'Activar reportes en Excel', 1, '0'),
(8, 'active_reports_pdf', 'Activar reportes en PDF', 1, '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_remision`
--

CREATE TABLE IF NOT EXISTS `detalle_remision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_remision` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operation`
--

CREATE TABLE IF NOT EXISTS `operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `q` float DEFAULT NULL,
  `operation_type_id` int(11) DEFAULT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `operation_type_id` (`operation_type_id`),
  KEY `sell_id` (`sell_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `operation`
--

INSERT INTO `operation` (`id`, `product_id`, `q`, `operation_type_id`, `sell_id`, `created_at`) VALUES
(1, 1, 20, 1, NULL, '2021-09-20 13:57:19'),
(2, 1, 2, 2, 0, '2021-09-20 14:25:01'),
(3, 1, 3, 2, 0, '2021-09-20 14:39:24'),
(4, 2, 18, 1, NULL, '2021-09-20 14:43:59'),
(5, 2, 8, 2, 0, '2021-09-20 14:45:17'),
(6, 1, 2, 2, 0, '2021-09-20 14:48:51'),
(7, 1, 2, 2, 1, '2021-09-20 16:11:05'),
(8, 1, 4, 1, 2, '2021-09-21 10:49:50'),
(9, 1, 2, 2, 0, '2021-09-22 07:52:15'),
(10, 1, 3, 2, 0, '2021-09-22 08:10:25'),
(11, 2, 10, 2, 0, '2021-09-22 08:12:56'),
(12, 1, 2, 2, 0, '2021-09-22 11:13:49'),
(13, 1, 6, 2, 0, '2021-09-22 11:24:03'),
(14, 1, 1, 2, 0, '2021-11-18 14:51:09'),
(15, 10, 4, 1, 3, '2021-11-18 14:53:58'),
(16, 1, 1, 1, 4, '2021-11-24 09:46:56'),
(17, 1, 1, 2, 0, '2021-11-24 09:51:06'),
(18, 1, 1, 1, 5, '2021-11-24 09:59:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operation_type`
--

CREATE TABLE IF NOT EXISTS `operation_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `operation_type`
--

INSERT INTO `operation_type` (`id`, `name`) VALUES
(1, 'entrada'),
(2, 'salida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `person`
--

INSERT INTO `person` (`id`, `image`, `name`, `lastname`, `company`, `address1`, `address2`, `phone1`, `phone2`, `email1`, `email2`, `kind`, `created_at`) VALUES
(1, NULL, 'Maritza', 'Lagos', NULL, '3232', NULL, '3333333', NULL, 'mlagos@gmail.com', NULL, 1, '2021-09-22 08:07:37'),
(4, NULL, 'Naun', 'Flores', NULL, '0117', NULL, '98234596', NULL, 'naunflorescrack@gmail.com', NULL, 1, '2021-11-24 10:10:20'),
(3, NULL, 'Julio', 'Diaz', NULL, '0116', NULL, '97013930', NULL, 'diazjulio1995@gmail.com', NULL, 2, '2021-11-24 09:43:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `inventary_min` int(11) DEFAULT '10',
  `price_in` varchar(50) DEFAULT NULL,
  `price_out` varchar(50) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `presentation` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=200 ;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `image`, `barcode`, `name`, `description`, `inventary_min`, `price_in`, `price_out`, `unit`, `presentation`, `user_id`, `category_id`, `created_at`, `is_active`) VALUES
(1, NULL, '', 'planta electica marca sinergi motor cumer modelo 2', '', 0, 'Taller Mantemiento 2', '', '1', '', NULL, 1, NULL, 0),
(2, NULL, NULL, 'bomba de combustible', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(3, NULL, NULL, 'main principal cutrer hamer 2000 amp', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(4, NULL, NULL, 'transfer de energia ', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(5, NULL, NULL, 'caja de paso ', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(6, NULL, NULL, 'distribuidor de energia ', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(7, NULL, NULL, 'sanitarios nuevos', NULL, 0, 'Taller Mantemiento 2', NULL, '3', NULL, NULL, NULL, NULL, 0),
(8, NULL, NULL, 'almagana de 16 libras', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(9, NULL, NULL, 'barras de metal', NULL, 0, 'Taller Mantemiento 2', NULL, '2', NULL, NULL, NULL, NULL, 0),
(10, NULL, NULL, 'palas', NULL, 0, 'Taller Mantemiento 2', NULL, '4', NULL, NULL, NULL, NULL, 0),
(11, NULL, '', 'piochas', '', 0, 'Taller Mantemiento 2', '', '2', '', NULL, NULL, NULL, 0),
(12, NULL, NULL, 'chapiadora o chindagua ', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(13, NULL, NULL, 'compresor de aire grande', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(14, NULL, NULL, 'llaves de ajustar tornillos ', NULL, 0, 'Taller Mantemiento 2', NULL, '23', NULL, NULL, NULL, NULL, 0),
(15, NULL, NULL, 'ajustables de tornillos', NULL, 0, 'Taller Mantemiento 2', NULL, '3', NULL, NULL, NULL, NULL, 0),
(16, NULL, NULL, 'desarmadores planos', NULL, 0, 'Taller Mantemiento 2', NULL, '9', NULL, NULL, NULL, NULL, 0),
(17, NULL, NULL, 'desarmadores phillips', NULL, 0, 'Taller Mantemiento 2', NULL, '3', NULL, NULL, NULL, NULL, 0),
(18, NULL, NULL, 'tenazas ', NULL, 0, 'Taller Mantemiento 2', NULL, '3', NULL, NULL, NULL, NULL, 0),
(19, NULL, NULL, 'brochas nuevas ', NULL, 0, 'Taller Mantemiento 2', NULL, '3', NULL, NULL, NULL, NULL, 0),
(20, NULL, NULL, 'Tijeras de cortar aluminio ', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(21, NULL, NULL, 'Cubos para ajustar tornillos ', NULL, 0, 'Taller Mantemiento 2', NULL, '10', NULL, NULL, NULL, NULL, 0),
(22, NULL, NULL, 'Niveles de albañileria ', NULL, 0, 'Taller Mantemiento 2', NULL, '2', NULL, NULL, NULL, NULL, 0),
(23, NULL, NULL, 'Manerales para ajustar tuercas ', NULL, 0, 'Taller Mantemiento 2', NULL, '2', NULL, NULL, NULL, NULL, 0),
(24, NULL, NULL, 'Tenazas o cizallas grande', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(25, NULL, NULL, 'Pistola de pintar ', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(26, NULL, NULL, 'Sargento', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(27, NULL, NULL, 'Perforadora', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(28, NULL, NULL, 'Perica', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(29, NULL, NULL, 'Llave stillson ', NULL, 0, 'Taller Mantemiento 2', NULL, '4', NULL, NULL, NULL, NULL, 0),
(30, NULL, NULL, 'Cortadora de tuvos ', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(31, NULL, NULL, 'Voltimetro analogo', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(32, NULL, NULL, 'Voltimetro normal', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(33, NULL, NULL, 'Pistola de soldar estaño', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(34, NULL, NULL, 'Machetes', NULL, 0, 'Taller Mantemiento 2', NULL, '3', NULL, NULL, NULL, NULL, 0),
(35, NULL, NULL, 'Dobladora de tubos', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(36, NULL, NULL, 'Bomba de 1 y 1/2 hp con tamque', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(37, NULL, NULL, 'Bomba de 1/2 hp con tamque', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(38, NULL, NULL, 'Cegueta', NULL, 0, 'Taller Mantemiento 2', NULL, '1', NULL, NULL, NULL, NULL, 0),
(39, NULL, NULL, 'Escaleras de 8 pies de fibra rojas', NULL, 0, 'Taller Mantemiento 2', NULL, '2', NULL, NULL, NULL, NULL, 0),
(40, NULL, NULL, 'Motores de dragon master', NULL, 0, 'Taller Mantemiento 1', NULL, '9', NULL, NULL, NULL, NULL, 0),
(41, NULL, NULL, 'Motor de plancha nuevos', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(42, NULL, NULL, 'Regulador de temperatura', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(43, NULL, NULL, 'Motor de estractor de planchado', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(44, NULL, NULL, 'Bandejas de clavos y tornillo', NULL, 0, 'Taller Mantemiento 1', NULL, '43', NULL, NULL, NULL, NULL, 0),
(45, NULL, NULL, 'Chavetas usadas para boncheros ', NULL, 0, 'Taller Mantemiento 1', NULL, '145', NULL, NULL, NULL, NULL, 0),
(46, NULL, NULL, 'Caja de visagras', NULL, 0, 'Taller Mantemiento 1', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(47, NULL, NULL, 'Rodos de maquinas para brocha', NULL, 0, 'Taller Mantemiento 1', NULL, '72', NULL, NULL, NULL, NULL, 0),
(48, NULL, NULL, 'Boquillas', NULL, 0, 'Taller Mantemiento 1', NULL, '3', NULL, NULL, NULL, NULL, 0),
(49, NULL, NULL, 'Valvulas', NULL, 0, 'Taller Mantemiento 1', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(50, NULL, NULL, 'Terminales', NULL, 0, 'Taller Mantemiento 1', NULL, '4', NULL, NULL, NULL, NULL, 0),
(51, NULL, NULL, 'Centros', NULL, 0, 'Taller Mantemiento 1', NULL, '4', NULL, NULL, NULL, NULL, 0),
(52, NULL, NULL, 'Maquinas de cortar', NULL, 0, 'Taller Mantemiento 1', NULL, '261', NULL, NULL, NULL, NULL, 0),
(53, NULL, NULL, 'Laminas para brochas', NULL, 0, 'Taller Mantemiento 1', NULL, '75', NULL, NULL, NULL, NULL, 0),
(54, NULL, NULL, 'Maquinas de boncheros ', NULL, 0, 'Taller Mantemiento 1', NULL, '187', NULL, NULL, NULL, NULL, 0),
(55, NULL, NULL, 'Ventilador de extractor grande', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(56, NULL, NULL, 'Ventilador de extractor pequeño', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(57, NULL, NULL, 'Taladros Alambricos', NULL, 0, 'Taller Mantemiento 1', NULL, '3', NULL, NULL, NULL, NULL, 0),
(58, NULL, NULL, 'Taladora', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(59, NULL, NULL, 'Bandas lijadoras', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(60, NULL, NULL, 'Maquinas selladoras para banda(bolsas)', NULL, 0, 'Taller Mantemiento 1', NULL, '4', NULL, NULL, NULL, NULL, 0),
(61, NULL, NULL, 'Kit de tarraja ', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(62, NULL, NULL, 'Cajas Octagonales metalicas', NULL, 0, 'Taller Mantemiento 1', NULL, '10', NULL, NULL, NULL, NULL, 0),
(63, NULL, NULL, 'Codos de 90 grados', NULL, 0, 'Taller Mantemiento 1', NULL, '5', NULL, NULL, NULL, NULL, 0),
(64, NULL, NULL, 'Terminales durman', NULL, 0, 'Taller Mantemiento 1', NULL, '3', NULL, NULL, NULL, NULL, 0),
(65, NULL, NULL, 'Cuchilla pela cables ', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(66, NULL, NULL, 'Tester', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(67, NULL, NULL, 'Desarmandores planos ', NULL, 0, 'Taller Mantemiento 1', NULL, '11', NULL, NULL, NULL, NULL, 0),
(68, NULL, NULL, 'Desarmandores phillips', NULL, 0, 'Taller Mantemiento 1', NULL, '6', NULL, NULL, NULL, NULL, 0),
(69, NULL, NULL, 'Condensadro o balastro', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(70, NULL, NULL, 'Remachadora UTP', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(71, NULL, NULL, 'Kit de herraminetas machuelo ', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(72, NULL, NULL, 'Perforadora', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(73, NULL, NULL, 'Cautin', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(74, NULL, NULL, 'Remachador', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(75, NULL, NULL, 'Ultimetro', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(76, NULL, NULL, 'Llave inglesa', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(77, NULL, NULL, 'Almágana', NULL, 0, 'Taller Mantemiento 1', NULL, '3', NULL, NULL, NULL, NULL, 0),
(78, NULL, NULL, 'Cortadora o cizalla ', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(79, NULL, NULL, 'Disco para concreto', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(80, NULL, NULL, 'Focos ahorrativos 110 amp', NULL, 0, 'Taller Mantemiento 1', NULL, '5', NULL, NULL, NULL, NULL, 0),
(81, NULL, NULL, 'Contador de energia ', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(82, NULL, NULL, 'Marcadoras de fecha de empaque ', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(83, NULL, NULL, 'Cierra cicular ', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(84, NULL, NULL, 'Compreasor de aire ', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(85, NULL, NULL, 'Chavetas usadas para roleros ', NULL, 0, 'Taller Mantemiento 1', NULL, '200', NULL, 1, NULL, NULL, 0),
(86, NULL, NULL, 'Pulidoras Pequeñas', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(87, NULL, NULL, 'Medidor para cortar banda ', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(88, NULL, NULL, 'Repuestos para planachadora (Bandas Y Motor)', NULL, 0, 'Taller Mantemiento 1', NULL, '5', NULL, NULL, NULL, NULL, 0),
(89, NULL, NULL, 'Lampara LED', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(90, NULL, NULL, 'Taladros inalambricos ', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(91, NULL, NULL, 'Caretaas Normales', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(92, NULL, NULL, 'Juegos de mangueras ', NULL, 0, 'Taller Mantemiento 1', NULL, '7', NULL, NULL, NULL, NULL, 0),
(93, NULL, NULL, 'Pistola de pintar para compresor ', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(94, NULL, NULL, 'Mangos de maquinas de bonchar ', NULL, 0, 'Taller Mantemiento 1', NULL, '14', NULL, NULL, NULL, NULL, 0),
(95, NULL, NULL, 'Ayudantes de temperatura planchadora', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(96, NULL, NULL, 'Filtros para extractores ', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(97, NULL, NULL, 'Taladro de mesa ', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(98, NULL, NULL, 'Cepillo para madera ', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(99, NULL, NULL, 'Ajustable', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(100, NULL, NULL, 'Discos para cierra circular', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(101, NULL, NULL, 'Serrucho', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(102, NULL, NULL, 'Cegueta', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(103, NULL, NULL, 'Rodos para cortar capa', NULL, 0, 'Taller Mantemiento 1', NULL, '72', NULL, NULL, NULL, NULL, 0),
(104, NULL, NULL, 'Maquinas para probar brocha nuevas', NULL, 0, 'Taller Mantemiento 1', NULL, '4', NULL, NULL, NULL, NULL, 0),
(105, NULL, NULL, 'Cortadoras de boquilla nuevas', NULL, 0, 'Taller Mantemiento 1', NULL, '20', NULL, NULL, NULL, NULL, 0),
(106, NULL, NULL, 'Cortadoras de boquilla usadas en mantenimiento ', NULL, 0, 'Taller Mantemiento 1', NULL, '38', NULL, NULL, NULL, NULL, 0),
(107, NULL, NULL, 'Cortadoras usadas ', NULL, 0, 'Taller Mantemiento 1', NULL, '10', NULL, NULL, NULL, NULL, 0),
(108, NULL, NULL, 'Maquina para hacer brocha', NULL, 0, 'Taller Mantemiento 1', NULL, '48', NULL, NULL, NULL, NULL, 0),
(109, NULL, NULL, 'Cepos De Aluminio 52x8 1/2', NULL, 0, 'Taller Mantemiento 1', NULL, '6', NULL, NULL, NULL, NULL, 0),
(110, NULL, NULL, 'Cepos De Aluminio 50x6', NULL, 0, 'Taller Mantemiento 1', NULL, '6', NULL, NULL, NULL, NULL, 0),
(111, NULL, NULL, 'Cepo de aluminio 50 x 8 1/2 ', NULL, 0, 'Taller Mantemiento 1', NULL, '31', NULL, NULL, NULL, NULL, 0),
(112, NULL, NULL, 'Cepo de aluminio 7x48', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(113, NULL, NULL, 'Cepo de aluminio 48x7 1/2', NULL, 0, 'Taller Mantemiento 1', NULL, '6', NULL, NULL, NULL, NULL, 0),
(114, NULL, NULL, 'Cepo de aluminio torpedo', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(115, NULL, NULL, 'Cepo de aluminio 42x7 1/8', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(116, NULL, NULL, 'Cepo de aluminio 45', NULL, 0, 'Taller Mantemiento 1', NULL, '10', NULL, NULL, NULL, NULL, 0),
(117, NULL, NULL, 'Cepos De Aluminio 42x4 1/2', NULL, 0, 'Taller Mantemiento 1', NULL, '4', NULL, NULL, NULL, NULL, 0),
(118, NULL, NULL, 'Cepo estilo grada ', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(119, NULL, NULL, 'Cepos de brocha', NULL, 0, 'Taller Mantemiento 1', NULL, '55', NULL, NULL, NULL, NULL, 0),
(120, NULL, NULL, 'Cepos de brocha varias medidas', NULL, 0, 'Taller Mantemiento 1', NULL, '93', NULL, NULL, NULL, NULL, 0),
(121, NULL, NULL, 'Cepos de aluminio 46 x 6 1/4', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(122, NULL, NULL, 'Cepos de madera roleros 22', NULL, 0, 'Taller Mantemiento 1', NULL, '4', NULL, NULL, NULL, NULL, 0),
(123, NULL, NULL, 'Cepos de madera roleros 23', NULL, 0, 'Taller Mantemiento 1', NULL, '8', NULL, NULL, NULL, NULL, 0),
(124, NULL, NULL, 'Cepos de madera roleros 27', NULL, 0, 'Taller Mantemiento 1', NULL, '6', NULL, NULL, NULL, NULL, 0),
(125, NULL, NULL, 'Cepos de madera roleros 30', NULL, 0, 'Taller Mantemiento 1', NULL, '26', NULL, NULL, NULL, NULL, 0),
(126, NULL, NULL, 'Cepos de madera roleros 33', NULL, 0, 'Taller Mantemiento 1', NULL, '8', NULL, NULL, NULL, NULL, 0),
(127, NULL, NULL, 'Cepos de madera roleros 34', NULL, 0, 'Taller Mantemiento 1', NULL, '4', NULL, NULL, NULL, NULL, 0),
(128, NULL, NULL, 'Cepos de madera roleros 38', NULL, 0, 'Taller Mantemiento 1', NULL, '46', NULL, NULL, NULL, NULL, 0),
(129, NULL, NULL, 'Cepos de madera roleros 40', NULL, 0, 'Taller Mantemiento 1', NULL, '14', NULL, NULL, NULL, NULL, 0),
(130, NULL, NULL, 'Cepos de madera roleros 41', NULL, 0, 'Taller Mantemiento 1', NULL, '7', NULL, NULL, NULL, NULL, 0),
(131, NULL, NULL, 'Cepos de madera roleros 42', NULL, 0, 'Taller Mantemiento 1', NULL, '27', NULL, NULL, NULL, NULL, 0),
(132, NULL, NULL, 'Cepos de madera roleros 43', NULL, 0, 'Taller Mantemiento 1', NULL, '6', NULL, NULL, NULL, NULL, 0),
(133, NULL, NULL, 'Cepos de madera roleros 44', NULL, 0, 'Taller Mantemiento 1', NULL, '30', NULL, NULL, NULL, NULL, 0),
(134, NULL, NULL, 'Cepos de madera roleros 45', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(135, NULL, NULL, 'Cepos de madera roleros 46', NULL, 0, 'Taller Mantemiento 1', NULL, '14', NULL, NULL, NULL, NULL, 0),
(136, NULL, NULL, 'Cepos de madera roleros 47', NULL, 0, 'Taller Mantemiento 1', NULL, '5', NULL, NULL, NULL, NULL, 0),
(137, NULL, NULL, 'Cepos de madera roleros 48', NULL, 0, 'Taller Mantemiento 1', NULL, '16', NULL, NULL, NULL, NULL, 0),
(138, NULL, NULL, 'Cepos de madera roleros 49', NULL, 0, 'Taller Mantemiento 1', NULL, '14', NULL, NULL, NULL, NULL, 0),
(139, NULL, NULL, 'Cepos de madera roleros 50', NULL, 0, 'Taller Mantemiento 1', NULL, '44', NULL, NULL, NULL, NULL, 0),
(140, NULL, NULL, 'Cepos de madera roleros 52', NULL, 0, 'Taller Mantemiento 1', NULL, '139', NULL, NULL, NULL, NULL, 0),
(141, NULL, NULL, 'Cepos de madera roleros 54', NULL, 0, 'Taller Mantemiento 1', NULL, '37', NULL, NULL, NULL, NULL, 0),
(142, NULL, NULL, 'Cepos de madera roleros 56', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(143, NULL, NULL, 'Cepos de madera roleros 58', NULL, 0, 'Taller Mantemiento 1', NULL, '9', NULL, NULL, NULL, NULL, 0),
(144, NULL, NULL, 'Cepos de madera roleros 60', NULL, 0, 'Taller Mantemiento 1', NULL, '35', NULL, NULL, NULL, NULL, 0),
(145, NULL, NULL, 'Cepos de madera roleros 61', NULL, 0, 'Taller Mantemiento 1', NULL, '4', NULL, NULL, NULL, NULL, 0),
(146, NULL, NULL, 'Cepos de madera roleros 70', NULL, 0, 'Taller Mantemiento 1', NULL, '7', NULL, NULL, NULL, NULL, 0),
(147, NULL, NULL, 'Cepos americanos Casinos 42x8 1/2', NULL, 0, 'Taller Mantemiento 1', NULL, '26', NULL, NULL, NULL, NULL, 0),
(148, NULL, NULL, 'Cepos americanos 42x7 1/4', NULL, 0, 'Taller Mantemiento 1', NULL, '9', NULL, NULL, NULL, NULL, 0),
(149, NULL, NULL, 'Cepos americanos 48x7 1/8', NULL, 0, 'Taller Mantemiento 1', NULL, '3', NULL, NULL, NULL, NULL, 0),
(150, NULL, NULL, 'Cepos americanos Torpedo', NULL, 0, 'Taller Mantemiento 1', NULL, '3', NULL, NULL, NULL, NULL, 0),
(151, NULL, NULL, 'Cepos americanos 6,0', NULL, 0, 'Taller Mantemiento 1', NULL, '47', NULL, NULL, NULL, NULL, 0),
(152, NULL, NULL, 'Cepos americanos 5_1/2', NULL, 0, 'Taller Mantemiento 1', NULL, '42', NULL, NULL, NULL, NULL, 0),
(153, NULL, NULL, 'Cepos americanos 42x5 1/4', NULL, 0, 'Taller Mantemiento 1', NULL, '50', NULL, NULL, NULL, NULL, 0),
(154, NULL, NULL, 'Cepos americanos 41/2x42', NULL, 0, 'Taller Mantemiento 1', NULL, '27', NULL, NULL, NULL, NULL, 0),
(155, NULL, NULL, 'Cepos americanos 4_1/2', NULL, 0, 'Taller Mantemiento 1', NULL, '10', NULL, NULL, NULL, NULL, 0),
(156, NULL, NULL, 'Cepos americanos 4.5', NULL, 0, 'Taller Mantemiento 1', NULL, '109', NULL, NULL, NULL, NULL, 0),
(157, NULL, NULL, 'Cepos americanos 41,42,43', NULL, 0, 'Taller Mantemiento 1', NULL, '46', NULL, NULL, NULL, NULL, 0),
(158, NULL, NULL, 'Cepos americanos 4_1/2', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(159, NULL, NULL, ' Prensas en mantenimiento ', NULL, 0, 'Taller Mantemiento 1', NULL, '8', NULL, NULL, NULL, NULL, 0),
(160, NULL, NULL, 'Esmeril 225', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(161, NULL, NULL, 'Pulidoras Grandes', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(162, NULL, NULL, 'Remachadora truper tipo acordion ', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(163, NULL, NULL, 'Soldadora', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(164, NULL, NULL, 'Caretas Digitales', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(165, NULL, NULL, 'Careta normal', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(166, NULL, NULL, 'Caretas ', NULL, 0, 'Taller Mantemiento 1', NULL, '3', NULL, NULL, NULL, NULL, 0),
(167, NULL, NULL, 'Rastrillo', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(168, NULL, NULL, 'Piocha', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(169, NULL, NULL, 'Palas', NULL, 0, 'Taller Mantemiento 1', NULL, '3', NULL, NULL, NULL, NULL, 0),
(170, NULL, NULL, 'Martillos', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(171, NULL, NULL, 'Almagana', NULL, 0, 'Taller Mantemiento 1', NULL, '7', NULL, NULL, NULL, NULL, 0),
(172, NULL, NULL, 'Cincel', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(173, NULL, NULL, 'Desarmador phillips', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 0),
(174, NULL, NULL, 'Cinta metrica', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 0),
(175, NULL, NULL, 'Cinturones de seguridad', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 1),
(176, NULL, NULL, 'Laminas para Roleros', NULL, 0, 'Taller Mantemiento 1', NULL, '190', NULL, NULL, NULL, NULL, 1),
(177, NULL, NULL, 'Maquina lijadora', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 1),
(178, NULL, NULL, 'bases de prensas', NULL, 0, 'Taller Mantemiento 1', NULL, '173', NULL, NULL, NULL, NULL, 1),
(179, NULL, NULL, 'prensas de meson (produccion)', NULL, 0, 'Taller Mantemiento 1', NULL, '176', NULL, NULL, NULL, NULL, 1),
(180, NULL, NULL, 'Prensas de piso (Empaque)', NULL, 0, 'Taller Mantemiento 1', NULL, '14', NULL, NULL, NULL, NULL, 1),
(181, NULL, NULL, 'Prensas de piso (Produccion)', NULL, 0, 'Taller Mantemiento 1', NULL, '10', NULL, NULL, NULL, NULL, 1),
(182, NULL, NULL, 'Motores Pequeños', NULL, 0, 'Taller Mantemiento 1', NULL, '9', NULL, NULL, NULL, NULL, 1),
(183, NULL, NULL, 'Motores Pequeños', NULL, 0, 'Taller Mantemiento 1', NULL, '9', NULL, NULL, NULL, NULL, 1),
(184, NULL, NULL, 'Extractores pequeños', NULL, 0, 'Taller Mantemiento 1', NULL, '3', NULL, NULL, NULL, NULL, 1),
(185, NULL, NULL, 'Caladoras', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 1),
(186, NULL, NULL, 'Selladoras pequeñas', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 1),
(187, NULL, NULL, 'Prensa de mesa (uso múltiple)', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 1),
(188, NULL, NULL, 'Kit de herramientas Corona', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 1),
(189, NULL, NULL, 'Remachadora truper tipo acordeón ', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 1),
(190, NULL, NULL, 'Lijadora pequeña (de mano)', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 1),
(191, NULL, NULL, 'Máquinas de probar brochas (Americana Digital)', NULL, 0, 'Taller Mantemiento 1', NULL, '3', NULL, NULL, NULL, NULL, 1),
(192, NULL, NULL, 'Kit de Cubos ( Con sus extensiones)', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 1),
(193, NULL, NULL, 'Pie de Rey', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 1),
(194, NULL, NULL, 'Maquina de Bonchar electrica', NULL, 0, 'Taller Mantemiento 1', NULL, '2', NULL, NULL, NULL, NULL, 1),
(195, NULL, NULL, 'Desarmadores estilo cubo', NULL, 0, 'Taller Mantemiento 1', NULL, '6', NULL, NULL, NULL, NULL, 1),
(196, NULL, NULL, 'Juego de Hexagonales', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 1),
(197, NULL, NULL, 'Probeta', NULL, 0, 'Taller Mantemiento 1', NULL, '1', NULL, NULL, NULL, NULL, 1),
(198, NULL, NULL, 'Cepos De Aluminio 6x50', NULL, 10, 'Taller Mantemiento 1', NULL, '13', NULL, NULL, NULL, NULL, 1),
(199, NULL, NULL, 'Cepos americanos 61/4x46', NULL, 10, 'Taller Mantemiento 1', NULL, '10', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remision`
--

CREATE TABLE IF NOT EXISTS `remision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `de` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `para` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `encargado` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recibido` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `enviado_firma` text COLLATE utf8_unicode_ci,
  `transportado_firma` text COLLATE utf8_unicode_ci,
  `recibido_firma` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sell`
--

CREATE TABLE IF NOT EXISTS `sell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `operation_type_id` int(11) DEFAULT '2',
  `box_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `cash` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `box_id` (`box_id`),
  KEY `operation_type_id` (`operation_type_id`),
  KEY `user_id` (`user_id`),
  KEY `person_id` (`person_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `sell`
--

INSERT INTO `sell` (`id`, `person_id`, `user_id`, `operation_type_id`, `box_id`, `total`, `cash`, `discount`, `created_at`) VALUES
(1, NULL, 1, 2, NULL, 0, NULL, 2, '2021-09-20 16:11:05'),
(2, NULL, 1, 1, NULL, NULL, NULL, NULL, '2021-09-21 10:49:50'),
(3, NULL, 1, 1, NULL, NULL, NULL, NULL, '2021-11-18 14:53:58'),
(4, 3, 1, 1, NULL, NULL, NULL, NULL, '2021-11-24 09:46:56'),
(5, 3, 1, 1, NULL, NULL, NULL, NULL, '2021-11-24 09:59:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `lastname`, `username`, `email`, `password`, `image`, `is_active`, `is_admin`, `created_at`) VALUES
(1, 'Administrador', '1', 'admin', 'admin', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', NULL, 1, 1, '2021-09-20 13:53:18'),
(2, 'Julio Cesar ', 'Palma Diaz', 'juliodiaz94', 'diazjulio1995@gmail.com', '1a3d27dbec5331d920648238a26421d66f538521', NULL, 1, 1, '2021-11-04 14:06:14');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
