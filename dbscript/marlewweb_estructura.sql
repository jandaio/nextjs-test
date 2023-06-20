-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-06-2023 a las 17:26:49
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `marlewweb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicaciones`
--

DROP TABLE IF EXISTS `aplicaciones`;
CREATE TABLE IF NOT EXISTS `aplicaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_es` varchar(500) NOT NULL,
  `nombre_en` varchar(500) NOT NULL,
  `orden` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicaciones_familias`
--

DROP TABLE IF EXISTS `aplicaciones_familias`;
CREATE TABLE IF NOT EXISTS `aplicaciones_familias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `familia_id` int NOT NULL,
  `aplicacion_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aplicaciones_familias_familias` (`familia_id`),
  KEY `FK_aplicaciones_familias_aplicaciones` (`aplicacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_es` varchar(250) NOT NULL,
  `nombre_en` varchar(250) NOT NULL,
  `clave_es` varchar(250) NOT NULL,
  `clave_en` varchar(250) NOT NULL,
  `orden` tinyint DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriasviejas`
--

DROP TABLE IF EXISTS `categoriasviejas`;
CREATE TABLE IF NOT EXISTS `categoriasviejas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_es` varchar(250) NOT NULL,
  `nombre_en` varchar(250) NOT NULL,
  `clave_es` varchar(250) NOT NULL,
  `clave_en` varchar(250) NOT NULL,
  `orden` tinyint DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificaciones`
--

DROP TABLE IF EXISTS `certificaciones`;
CREATE TABLE IF NOT EXISTS `certificaciones` (
  `id` int NOT NULL DEFAULT (0),
  `titulo_es` varchar(250) NOT NULL,
  `titulo_en` varchar(250) NOT NULL,
  `url` varchar(250) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `imagen_hd` varchar(100) NOT NULL,
  `imagen_ultra` varchar(100) NOT NULL,
  `orden` tinyint DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificaciones_familias`
--

DROP TABLE IF EXISTS `certificaciones_familias`;
CREATE TABLE IF NOT EXISTS `certificaciones_familias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `familia_id` int NOT NULL,
  `certificacion_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_certificaciones_familias_familias` (`familia_id`),
  KEY `FK_certificaciones_familias_certificaciones` (`certificacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigocolores`
--

DROP TABLE IF EXISTS `codigocolores`;
CREATE TABLE IF NOT EXISTS `codigocolores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `html` varchar(250) NOT NULL,
  `regex` varchar(250) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `imagen_cmyk` varchar(250) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

DROP TABLE IF EXISTS `eventos`;
CREATE TABLE IF NOT EXISTS `eventos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `url_es` varchar(255) NOT NULL,
  `url_en` varchar(255) NOT NULL,
  `imagen_es` varchar(255) NOT NULL,
  `imagen_en` varchar(255) NOT NULL,
  `orden` int DEFAULT '0',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familias`
--

DROP TABLE IF EXISTS `familias`;
CREATE TABLE IF NOT EXISTS `familias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subcategoria_id` int NOT NULL,
  `numero_serie` varchar(255) NOT NULL,
  `modificador_id` int DEFAULT NULL,
  `clave_es` varchar(100) NOT NULL,
  `clave_en` varchar(100) NOT NULL,
  `marca_id` int NOT NULL,
  `subtitulo_es` varchar(250) NOT NULL,
  `subtitulo_en` varchar(250) NOT NULL,
  `dimensiones` varchar(64) NOT NULL DEFAULT '''mm2''',
  `tipo` varchar(255) NOT NULL,
  `caracteristicas_especiales_es` varchar(255) NOT NULL,
  `caracteristica_especial_pdf_es` varchar(100) NOT NULL,
  `caracteristica_especial_pdf_en` varchar(100) NOT NULL,
  `caracteristicas_especiales_en` varchar(255) NOT NULL,
  `imagencable` varchar(250) DEFAULT NULL,
  `caracteristicas_es` text NOT NULL,
  `caracteristicas_es_json` text NOT NULL,
  `caracteristicas_en` text NOT NULL,
  `caracteristicas_en_json` text NOT NULL,
  `identificacion_es` text NOT NULL,
  `identificacion_es_json` text NOT NULL,
  `identificacion_en` text NOT NULL,
  `identificacion_en_json` text NOT NULL,
  `variantes_es` text NOT NULL,
  `variantes_es_json` text NOT NULL,
  `variantes_en` text NOT NULL,
  `variantes_en_json` text NOT NULL,
  `pdf_archivo_es` varchar(250) DEFAULT NULL,
  `pdf_archivo_en` varchar(250) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `jsondata` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `ultima_actualizacion_json_data` datetime DEFAULT NULL,
  `ultima_actualizacion_familia` datetime DEFAULT NULL,
  `ultima_actualizacion_pdf_es` datetime DEFAULT NULL,
  `ultima_actualizacion_pdf_en` datetime DEFAULT NULL,
  `orden` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clave_en` (`clave_en`),
  UNIQUE KEY `clave_es` (`clave_es`),
  KEY `FK_familias_subcategorias` (`subcategoria_id`),
  KEY `FK_familias_modificadores` (`modificador_id`),
  KEY `FK_familias_marcas` (`marca_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familias_iconos`
--

DROP TABLE IF EXISTS `familias_iconos`;
CREATE TABLE IF NOT EXISTS `familias_iconos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `familia_id` int NOT NULL,
  `icono_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_familias_iconos_familias` (`familia_id`),
  KEY `FK_familias_iconos_iconos` (`icono_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familias_instalaciones`
--

DROP TABLE IF EXISTS `familias_instalaciones`;
CREATE TABLE IF NOT EXISTS `familias_instalaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `familia_id` int NOT NULL,
  `instalacion_id` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_familias_instalaciones_familias` (`familia_id`),
  KEY `FK_familias_instalaciones_instalaciones` (`instalacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familias_propiedades`
--

DROP TABLE IF EXISTS `familias_propiedades`;
CREATE TABLE IF NOT EXISTS `familias_propiedades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `familia_id` int NOT NULL,
  `propiedad_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_familias_propiedades_familias` (`familia_id`),
  KEY `FK_familias_propiedades_propiedades` (`propiedad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familias_ramas`
--

DROP TABLE IF EXISTS `familias_ramas`;
CREATE TABLE IF NOT EXISTS `familias_ramas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `familia_id` int NOT NULL,
  `rama_id` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_familias_ramas_familias` (`familia_id`),
  KEY `FK_familias_ramas_ramas` (`rama_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iconos`
--

DROP TABLE IF EXISTS `iconos`;
CREATE TABLE IF NOT EXISTS `iconos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo_es` varchar(250) NOT NULL,
  `titulo_en` varchar(250) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `imagen_hd` varchar(100) NOT NULL,
  `imagen_ultra` varchar(100) NOT NULL,
  `orden` tinyint DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `identificaciones`
--

DROP TABLE IF EXISTS `identificaciones`;
CREATE TABLE IF NOT EXISTS `identificaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(50) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `imagenHD` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instalaciones`
--

DROP TABLE IF EXISTS `instalaciones`;
CREATE TABLE IF NOT EXISTS `instalaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_es` varchar(255) NOT NULL,
  `nombre_en` varchar(255) NOT NULL,
  `imagen_es` varchar(255) NOT NULL,
  `imagen_en` varchar(255) NOT NULL,
  `imagen_es_hd` varchar(100) NOT NULL,
  `imagen_es_ultra` varchar(100) NOT NULL,
  `imagen_en_hd` varchar(100) NOT NULL,
  `imagen_en_ultra` varchar(100) NOT NULL,
  `orden` tinyint NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE IF NOT EXISTS `marcas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `color` varchar(10) NOT NULL,
  `colorCmyk` varchar(255) NOT NULL,
  `descripcion_es` varchar(255) NOT NULL,
  `descripcion_en` varchar(255) NOT NULL,
  `imagen_color` varchar(100) NOT NULL,
  `imagen_negro` varchar(100) NOT NULL,
  `imagen_texto_negro` varchar(100) NOT NULL,
  `imagen_texto_blanco` varchar(100) NOT NULL,
  `imagen_logo` varchar(100) NOT NULL,
  `baseline` float NOT NULL DEFAULT '0',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modificadores`
--

DROP TABLE IF EXISTS `modificadores`;
CREATE TABLE IF NOT EXISTS `modificadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(100) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
CREATE TABLE IF NOT EXISTS `propiedades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_es` varchar(255) NOT NULL,
  `nombre_en` varchar(255) NOT NULL,
  `orden` int NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ramas`
--

DROP TABLE IF EXISTS `ramas`;
CREATE TABLE IF NOT EXISTS `ramas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ruta_es` varchar(255) NOT NULL,
  `ruta_en` varchar(255) NOT NULL,
  `categoria_id` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='relaciona una categoria con una rama especifica del arbol de mercados';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recomendaciones`
--

DROP TABLE IF EXISTS `recomendaciones`;
CREATE TABLE IF NOT EXISTS `recomendaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo_es` varchar(250) NOT NULL,
  `titulo_en` varchar(250) NOT NULL,
  `clave_es` varchar(100) NOT NULL,
  `clave_en` varchar(100) NOT NULL,
  `texto_es` mediumtext NOT NULL,
  `texto_en` mediumtext NOT NULL,
  `orden` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clave_es` (`clave_es`),
  UNIQUE KEY `clave_en` (`clave_en`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

DROP TABLE IF EXISTS `subcategorias`;
CREATE TABLE IF NOT EXISTS `subcategorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoriavieja_id` int NOT NULL,
  `nombre_es` varchar(250) NOT NULL,
  `nombre_en` varchar(250) NOT NULL,
  `fondo` varchar(100) NOT NULL,
  `orden` tinyint DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablas`
--

DROP TABLE IF EXISTS `tablas`;
CREATE TABLE IF NOT EXISTS `tablas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `familia_id` int NOT NULL,
  `grupo_es` varchar(250) NOT NULL,
  `grupo_en` varchar(250) NOT NULL,
  `titulo_es` varchar(250) NOT NULL,
  `titulo_en` varchar(250) NOT NULL,
  `html_es` text NOT NULL,
  `html_en` text NOT NULL,
  `json_es` text NOT NULL,
  `json_en` text NOT NULL,
  `notaspie_es` text NOT NULL,
  `notaspie_en` text NOT NULL,
  `ancho_columnas_es` varchar(250) DEFAULT NULL,
  `ancho_columnas_en` varchar(250) DEFAULT NULL,
  `orden` tinyint DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tablas_familias` (`familia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aplicaciones_familias`
--
ALTER TABLE `aplicaciones_familias`
  ADD CONSTRAINT `FK_aplicaciones_familias_aplicaciones` FOREIGN KEY (`aplicacion_id`) REFERENCES `aplicaciones` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_aplicaciones_familias_familias` FOREIGN KEY (`familia_id`) REFERENCES `familias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `certificaciones_familias`
--
ALTER TABLE `certificaciones_familias`
  ADD CONSTRAINT `FK_certificaciones_familias_certificaciones` FOREIGN KEY (`certificacion_id`) REFERENCES `certificaciones` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_certificaciones_familias_familias` FOREIGN KEY (`familia_id`) REFERENCES `familias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `familias`
--
ALTER TABLE `familias`
  ADD CONSTRAINT `FK_familias_marcas` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_familias_modificadores` FOREIGN KEY (`modificador_id`) REFERENCES `modificadores` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_familias_subcategorias` FOREIGN KEY (`subcategoria_id`) REFERENCES `subcategorias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `familias_iconos`
--
ALTER TABLE `familias_iconos`
  ADD CONSTRAINT `FK_familias_iconos_familias` FOREIGN KEY (`familia_id`) REFERENCES `familias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_familias_iconos_iconos` FOREIGN KEY (`icono_id`) REFERENCES `iconos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `familias_instalaciones`
--
ALTER TABLE `familias_instalaciones`
  ADD CONSTRAINT `FK_familias_instalaciones_familias` FOREIGN KEY (`familia_id`) REFERENCES `familias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_familias_instalaciones_instalaciones` FOREIGN KEY (`instalacion_id`) REFERENCES `instalaciones` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `familias_propiedades`
--
ALTER TABLE `familias_propiedades`
  ADD CONSTRAINT `FK_familias_propiedades_familias` FOREIGN KEY (`familia_id`) REFERENCES `familias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_familias_propiedades_propiedades` FOREIGN KEY (`propiedad_id`) REFERENCES `propiedades` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `familias_ramas`
--
ALTER TABLE `familias_ramas`
  ADD CONSTRAINT `FK_familias_ramas_familias` FOREIGN KEY (`familia_id`) REFERENCES `familias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_familias_ramas_ramas` FOREIGN KEY (`rama_id`) REFERENCES `ramas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `ramas`
--
ALTER TABLE `ramas`
  ADD CONSTRAINT `ramas_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `tablas`
--
ALTER TABLE `tablas`
  ADD CONSTRAINT `FK_tablas_familias` FOREIGN KEY (`familia_id`) REFERENCES `familias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
