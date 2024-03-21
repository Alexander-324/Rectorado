/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.28-MariaDB : Database - rectorado
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `ciudades` */

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `id_ciudad` int(11) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(30) NOT NULL,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `ciudades` */

insert  into `ciudades`(`id_ciudad`,`ciudad`) values (1,'ASUNCIÓN'),(2,'CIUDAD DEL ESTE'),(3,'SAN LORENZO'),(4,'LUQUE'),(5,'ENCARNACIÓN'),(6,'PEDRO JUAN CABALLERO'),(7,'CAPIATÁ'),(8,'LAMBARÉ'),(9,'FERNANDO DE LA MORA'),(10,'VILLA ELISA'),(11,'ITAUGUÁ'),(12,'COLONIA MARIANO ROQUE ALONSO'),(13,'VILLARRICA'),(14,'CAAGUAZÚ'),(15,'CONCEPCIÓN'),(16,'CORONEL OVIEDO'),(17,'CAACUPÉ'),(18,'SAN JUAN BAUTISTA'),(19,'PILAR'),(20,'CAAZAPÁ'),(21,'LIMPIO'),(22,'ÑEMBY'),(24,'YPACARAÍ'),(25,'PARAGUARÍ'),(26,'CAAPUCÚ'),(27,'YBYCUÍ'),(28,'ITÁ'),(29,'SAN BERNARDINO'),(30,'PIRIBEBUY'),(31,'QUIINDY'),(32,'YUTY'),(33,'GUARAMBARÉ'),(34,'CARMEN DEL PARANÁ'),(35,'OBLIGADO'),(36,'MBOCAYATY'),(37,'NUEVA COLOMBIA'),(38,'YGATIMÍ'),(40,'GUAYAIBÍ'),(42,'SAN BLAS'),(43,'AREGUÁ');

/*Table structure for table `dependencias` */

DROP TABLE IF EXISTS `dependencias`;

CREATE TABLE `dependencias` (
  `id_dependencia` int(11) NOT NULL AUTO_INCREMENT,
  `dependencia` varchar(30) NOT NULL,
  PRIMARY KEY (`id_dependencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `dependencias` */

/*Table structure for table `funcionarios` */

DROP TABLE IF EXISTS `funcionarios`;

CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `ci` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `id_ciudad` int(12) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `id_ciudad` (`id_ciudad`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`),
  CONSTRAINT `funcionarios_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `funcionarios` */

insert  into `funcionarios`(`id_funcionario`,`ci`,`nombre`,`apellido`,`id_ciudad`,`direccion`,`id_rol`) values (1,'6658363','ALEXANDER','RIVAS',15,'SANTO DOMINGO DE GUZMAN C/ANGEL GIOVINNE',1);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `roles` */

insert  into `roles`(`id_rol`,`rol`) values (1,'ADMINISTRADOR'),(2,'SECRETARÍA GENERAL');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcionario` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(80) NOT NULL,
  PRIMARY KEY (`id_usuarios`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_usuarios`,`id_funcionario`,`foto`,`correo`,`usuario`,`password`) values (1,1,'alexander.jpg','alexrivasbenitez324@gmail.com','alexander','AleX1.2.');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
