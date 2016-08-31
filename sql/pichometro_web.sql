# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.29)
# Database: pichometro_web
# Generation Time: 2016-08-31 00:05:04 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table pichometros
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pichometros`;

CREATE TABLE `pichometros` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `juego` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pichones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pichones`;

CREATE TABLE `pichones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `rondas` smallint(6) unsigned NOT NULL DEFAULT '0',
  `victorias` smallint(6) unsigned NOT NULL DEFAULT '0',
  `derrotas` smallint(6) unsigned NOT NULL DEFAULT '0',
  `ultima_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table rondas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rondas`;

CREATE TABLE `rondas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pichometro_id` int(11) unsigned NOT NULL DEFAULT '0',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `terminada` tinyint(1) NOT NULL DEFAULT '0',
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `creador_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ganador_id` int(11) unsigned NOT NULL DEFAULT '0',
  `perdedor_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table rondas_pichones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rondas_pichones`;

CREATE TABLE `rondas_pichones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ronda_id` int(11) unsigned NOT NULL DEFAULT '0',
  `pichon_id` int(11) unsigned NOT NULL DEFAULT '0',
  `jugada` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
