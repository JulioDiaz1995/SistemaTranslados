-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 22-09-2021 a las 21:39:14
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventiolite`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `box`
--

DROP TABLE IF EXISTS `box`;
CREATE TABLE IF NOT EXISTS `box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `image`, `name`, `description`, `created_at`) VALUES
(1, NULL, 'nuevo', NULL, '2021-09-20 14:13:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuration`
--

DROP TABLE IF EXISTS `configuration`;
CREATE TABLE IF NOT EXISTS `configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  `val` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short` (`short`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

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
-- Estructura de tabla para la tabla `operation`
--

DROP TABLE IF EXISTS `operation`;
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

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
(13, 1, 6, 2, 0, '2021-09-22 11:24:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operation_type`
--

DROP TABLE IF EXISTS `operation_type`;
CREATE TABLE IF NOT EXISTS `operation_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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

DROP TABLE IF EXISTS `person`;
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `person`
--

INSERT INTO `person` (`id`, `image`, `name`, `lastname`, `company`, `address1`, `address2`, `phone1`, `phone2`, `email1`, `email2`, `kind`, `created_at`) VALUES
(1, NULL, 'Maritza', 'Lagos', NULL, '3232', NULL, '3333333', NULL, 'mlagos@gmail.com', NULL, 1, '2021-09-22 08:07:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

DROP TABLE IF EXISTS `product`;
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `image`, `barcode`, `name`, `description`, `inventary_min`, `price_in`, `price_out`, `unit`, `presentation`, `user_id`, `category_id`, `created_at`, `is_active`) VALUES
(1, NULL, '1231', 'prensa', 'nnnen', 2, 'bodega', 'producciÃ³n', '20', 'nuevas', 1, 1, '2021-09-20 13:57:19', 1),
(2, NULL, '23232', 'maquina de tiro', 'jdjjdj', 2, 'bodega', 'en uso', '18', 'nuevo', 1, 1, '2021-09-20 14:43:59', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sell`
--

DROP TABLE IF EXISTS `sell`;
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sell`
--

INSERT INTO `sell` (`id`, `person_id`, `user_id`, `operation_type_id`, `box_id`, `total`, `cash`, `discount`, `created_at`) VALUES
(1, NULL, 1, 2, NULL, 0, NULL, 2, '2021-09-20 16:11:05'),
(2, NULL, 1, 1, NULL, NULL, NULL, NULL, '2021-09-21 10:49:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `lastname`, `username`, `email`, `password`, `image`, `is_active`, `is_admin`, `created_at`) VALUES
(1, 'Administrador', 'k', 'admin', 'admin', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', NULL, 1, 1, '2021-09-20 13:53:18');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
