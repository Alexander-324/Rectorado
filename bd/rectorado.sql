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
/*Table structure for table `areas` */

DROP TABLE IF EXISTS `areas`;

CREATE TABLE `areas` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(30) NOT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `areas` */

insert  into `areas`(`id_area`,`area`) values (1,'FCEA'),(4,'FACET'),(5,'FO'),(6,'MEDICINA'),(7,'FHYCE'),(8,'FCA'),(9,'OTRO');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `dependencias` */

insert  into `dependencias`(`id_dependencia`,`dependencia`) values (1,'MESA DE ENTRADA'),(2,'SECRETARIA GENERAL'),(3,'ADMINISTRACION Y FINANZAS'),(4,'CONTROL PREVENTIVO'),(5,'PRESUPUESTO'),(6,'CONTABILIDAD Y PATRIMONIO'),(8,'TESORERIA'),(9,'RECTORADO');

/*Table structure for table `expedientes` */

DROP TABLE IF EXISTS `expedientes`;

CREATE TABLE `expedientes` (
  `íd_expediente` int(11) NOT NULL AUTO_INCREMENT,
  `nro_expediente` int(11) NOT NULL,
  `fecha_recepcion` datetime NOT NULL,
  `id_area` int(11) NOT NULL,
  `id_objeto` int(11) NOT NULL,
  `id_dependencia` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'pendiente',
  PRIMARY KEY (`íd_expediente`),
  KEY `id_dependencia` (`id_dependencia`),
  KEY `id_funcionario` (`id_funcionario`),
  KEY `id_area` (`id_area`),
  KEY `id_objeto` (`id_objeto`),
  CONSTRAINT `expedientes_ibfk_1` FOREIGN KEY (`id_dependencia`) REFERENCES `dependencias` (`id_dependencia`),
  CONSTRAINT `expedientes_ibfk_2` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`),
  CONSTRAINT `expedientes_ibfk_3` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`),
  CONSTRAINT `expedientes_ibfk_4` FOREIGN KEY (`id_objeto`) REFERENCES `objetos` (`id_objeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `expedientes` */

/*Table structure for table `funcionarios` */

DROP TABLE IF EXISTS `funcionarios`;

CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `ci` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `id_ciudad` int(12) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `id_dependencia` int(11) NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `id_ciudad` (`id_ciudad`),
  KEY `funcionarios_ibfk_2` (`id_dependencia`),
  CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`),
  CONSTRAINT `funcionarios_ibfk_2` FOREIGN KEY (`id_dependencia`) REFERENCES `dependencias` (`id_dependencia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `funcionarios` */

insert  into `funcionarios`(`id_funcionario`,`ci`,`nombre`,`apellido`,`id_ciudad`,`direccion`,`id_dependencia`) values (1,'6658363','ALEXANDER','RIVAS',15,'SANTO DOMINGO DE GUZMAN C/ANGEL GIOVINNE',4),(2,'1234567','JUAN','LOPEZ',20,'SAN ANTONIO',5),(3,'6969100','OSCAR','CONCHA',1,'GUILLERMO ROMANIACH',3),(4,'6761829','CRISTHIAN','VALENZUELA',5,'VILLA ARMANDO',4),(5,'7074066','RODNEY','ROJAS',11,'VILLA ARMANDO',5);

/*Table structure for table `objetos` */

DROP TABLE IF EXISTS `objetos`;

CREATE TABLE `objetos` (
  `id_objeto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(10) DEFAULT NULL,
  `objeto` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_objeto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `objetos` */

insert  into `objetos`(`id_objeto`,`codigo`,`objeto`) values (1,180,'PAGO DE FACTURA DE ANDE'),(3,187,'PAGO FACTURA DE AGUA');

/*Table structure for table `pantallas` */

DROP TABLE IF EXISTS `pantallas`;

CREATE TABLE `pantallas` (
  `id_pantalla` int(11) NOT NULL AUTO_INCREMENT,
  `pantalla` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_pantalla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pantallas` */

/*Table structure for table `permisos` */

DROP TABLE IF EXISTS `permisos`;

CREATE TABLE `permisos` (
  `id_permiso` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_pantalla` int(11) DEFAULT NULL,
  `alta` tinyint(1) DEFAULT 0,
  `baja` tinyint(1) DEFAULT 0,
  `modificacion` tinyint(1) DEFAULT 0,
  `leer` tinyint(1) DEFAULT 0,
  `recepcion` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_permiso`),
  KEY `id_pantalla` (`id_pantalla`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`id_pantalla`) REFERENCES `pantallas` (`id_pantalla`),
  CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `permisos` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `roles` */

insert  into `roles`(`id_rol`,`rol`) values (8,'RRHH'),(10,'ADMINISTRADOR'),(11,'SECRETARIO'),(12,'VISITANTE');

/*Table structure for table `rutas` */

DROP TABLE IF EXISTS `rutas`;

CREATE TABLE `rutas` (
  `id_ruta` int(11) NOT NULL,
  `id_expediente` int(11) DEFAULT NULL,
  `id_dependencia` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_ruta`),
  KEY `id_expediente` (`id_expediente`),
  KEY `id_dependencia` (`id_dependencia`),
  CONSTRAINT `rutas_ibfk_1` FOREIGN KEY (`id_expediente`) REFERENCES `expedientes` (`íd_expediente`),
  CONSTRAINT `rutas_ibfk_2` FOREIGN KEY (`id_dependencia`) REFERENCES `dependencias` (`id_dependencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `rutas` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(30) NOT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `id_funcionario` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(80) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_rol` (`id_rol`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_usuario`,`correo`,`id_rol`,`id_funcionario`,`foto`,`usuario`,`password`) values (1,'alexrivasbenitez324@gmail.com',8,1,'alexander.jpg','alexander','AleX1.2.'),(7,'juan@gmail.com',11,2,'sin_perfil.jpg','juan324','JuaN1.2.');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
