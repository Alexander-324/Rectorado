/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.28-MariaDB : Database - rectorado
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rectorado` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `rectorado`;

/*Table structure for table `administracion_finanzas` */

DROP TABLE IF EXISTS `administracion_finanzas`;

CREATE TABLE `administracion_finanzas` (
  `id_administracion_finanzas` smallint(6) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `nro_externa` int(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora_recepcion` varchar(5) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_expediente_tipo` smallint(6) NOT NULL,
  `id_expediente_asunto` smallint(6) NOT NULL,
  `id_funcionario` smallint(6) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  PRIMARY KEY (`id_administracion_finanzas`),
  KEY `id_funcionario` (`id_remitente`),
  KEY `id_dependencia` (`hora_recepcion`),
  KEY `id_conceptos` (`anio`),
  KEY `id_remitente` (`fecha_recepcion`),
  KEY `id_expediente_tipo` (`id_expediente_tipo`),
  KEY `id_expediente_asunto` (`id_expediente_asunto`),
  KEY `id_funcionario_2` (`id_funcionario`),
  CONSTRAINT `administracion_finanzas_ibfk_1` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON UPDATE CASCADE,
  CONSTRAINT `administracion_finanzas_ibfk_2` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `administracion_finanzas_ibfk_3` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`) ON UPDATE CASCADE,
  CONSTRAINT `administracion_finanzas_ibfk_4` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `administracion_finanzas` */

/*Table structure for table `administracion_finanzas_observacion` */

DROP TABLE IF EXISTS `administracion_finanzas_observacion`;

CREATE TABLE `administracion_finanzas_observacion` (
  `id_administracion_finanzas_observacion` smallint(6) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `nro_externa` int(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora_recepcion` varchar(5) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_expediente_tipo` smallint(6) NOT NULL,
  `id_expediente_asunto` smallint(6) NOT NULL,
  `id_funcionario` smallint(6) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `observacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_administracion_finanzas_observacion`),
  KEY `id_remitente` (`id_remitente`),
  KEY `id_expediente_tipo` (`id_expediente_tipo`),
  KEY `id_expediente_asunto` (`id_expediente_asunto`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `administracion_finanzas_observacion_ibfk_1` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON UPDATE CASCADE,
  CONSTRAINT `administracion_finanzas_observacion_ibfk_2` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `administracion_finanzas_observacion_ibfk_3` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`) ON UPDATE CASCADE,
  CONSTRAINT `administracion_finanzas_observacion_ibfk_4` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `administracion_finanzas_observacion` */

/*Table structure for table `busqueda_documentos` */

DROP TABLE IF EXISTS `busqueda_documentos`;

CREATE TABLE `busqueda_documentos` (
  `id_busqueda_documentos` smallint(6) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `nro_externa` int(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora_recepcion` varchar(6) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_expediente_tipo` smallint(6) NOT NULL,
  `id_expediente_asunto` smallint(6) NOT NULL,
  `id_funcionario` smallint(6) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `observacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_busqueda_documentos`),
  KEY `id_remitente` (`id_remitente`),
  KEY `id_expediente_tipo` (`id_expediente_tipo`),
  KEY `id_expediente_asunto` (`id_expediente_asunto`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `busqueda_documentos_ibfk_1` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON UPDATE CASCADE,
  CONSTRAINT `busqueda_documentos_ibfk_2` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `busqueda_documentos_ibfk_3` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`) ON UPDATE CASCADE,
  CONSTRAINT `busqueda_documentos_ibfk_4` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `busqueda_documentos` */

insert  into `busqueda_documentos`(`id_busqueda_documentos`,`departamento`,`nro_expediente`,`nro_externa`,`anio`,`fecha_recepcion`,`hora_recepcion`,`id_remitente`,`id_expediente_tipo`,`id_expediente_asunto`,`id_funcionario`,`comentario`,`observacion`) values (1,'Mesa de Entrada',1,2,2023,'2023-07-14','15:50',3,2,2,4,' ','wfe'),(2,'Mesa de Entrada',1,2,2024,'2024-02-08','16:40',3,2,2,2,' ',' '),(3,'Mesa de Entrada',2,2,2024,'2024-02-08','16:43',4,2,3,1,' ',' '),(4,'Secretaria General',1,2,2024,'2024-02-08','16:40',3,2,2,2,' ',' '),(5,'Mesa de Entrada',3,2,2024,'2024-02-08','17:28',1,2,3,4,' ',' '),(6,'Secretaria General',3,2,2024,'2024-02-08','17:28',1,2,3,4,' ',' '),(7,'Secretaria General',1,2,2024,'2024-02-08','17:30',3,2,2,1,' ','dtfyk'),(8,'Mesa de Entrada',3,2,2024,'2024-02-08','17:30',1,2,3,1,' ',''),(9,'Secretaria General',2,2,2024,'2024-02-08','16:43',4,2,3,1,' ',' '),(10,'Mesa de Entrada',2,2,2024,'2024-02-29','18:26',4,2,3,2,' ',''),(11,'Mesa de Entrada',1,2,2024,'2024-02-08','17:30',3,2,2,3,' ','dtfyk'),(12,'Mesa de Entrada',1,1,2024,'2024-02-29','18:34',1,2,2,4,' ',' '),(13,'Secretaria General',1,1,2024,'2024-02-29','18:34',1,2,2,4,' ',' '),(14,'Secretaria General',1,1,2024,'2024-02-29','18:37',1,2,2,3,' ','Falta de datos'),(15,'Presupuesto',1,1,2024,'2024-02-29','18:37',1,2,2,2,' ','Falta de datos');

/*Table structure for table `conceptos_administracion` */

DROP TABLE IF EXISTS `conceptos_administracion`;

CREATE TABLE `conceptos_administracion` (
  `id_conceptos` smallint(6) NOT NULL,
  `descripcion` char(50) NOT NULL,
  PRIMARY KEY (`id_conceptos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `conceptos_administracion` */

insert  into `conceptos_administracion`(`id_conceptos`,`descripcion`) values (1,'Registro Viaticos'),(2,'Pago'),(3,'Rendicion'),(4,'Movimiento Combustible'),(5,'Prioritario'),(6,'Servicio de Rep.'),(7,'Const. de Salon'),(8,'Informe Cuntitativo'),(9,'Informe Cualitativo'),(10,'Avance de Metodos'),(11,'Balance Anual');

/*Table structure for table `conceptos_tesoreria` */

DROP TABLE IF EXISTS `conceptos_tesoreria`;

CREATE TABLE `conceptos_tesoreria` (
  `id_conceptos` smallint(6) NOT NULL,
  `descripcion` char(50) NOT NULL,
  PRIMARY KEY (`id_conceptos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `conceptos_tesoreria` */

insert  into `conceptos_tesoreria`(`id_conceptos`,`descripcion`) values (1,'Concepto');

/*Table structure for table `contabilidad_patrimonio` */

DROP TABLE IF EXISTS `contabilidad_patrimonio`;

CREATE TABLE `contabilidad_patrimonio` (
  `id_contabilidad_patrimonio` smallint(6) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `nro_externa` int(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora_recepcion` varchar(5) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_expediente_tipo` smallint(6) NOT NULL,
  `id_expediente_asunto` smallint(6) NOT NULL,
  `id_funcionario` smallint(6) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  PRIMARY KEY (`id_contabilidad_patrimonio`),
  KEY `id_remitente` (`id_remitente`),
  KEY `id_expediente_tipo` (`id_expediente_tipo`),
  KEY `id_expediente_asunto` (`id_expediente_asunto`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `contabilidad_patrimonio_ibfk_3` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON UPDATE CASCADE,
  CONSTRAINT `contabilidad_patrimonio_ibfk_4` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `contabilidad_patrimonio_ibfk_5` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`) ON UPDATE CASCADE,
  CONSTRAINT `contabilidad_patrimonio_ibfk_6` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `contabilidad_patrimonio` */

/*Table structure for table `contabilidad_patrimonio_observacion` */

DROP TABLE IF EXISTS `contabilidad_patrimonio_observacion`;

CREATE TABLE `contabilidad_patrimonio_observacion` (
  `id_contabilidad_patrimonio_observacion` smallint(6) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `nro_externa` int(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora_recepcion` varchar(5) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_expediente_tipo` smallint(6) NOT NULL,
  `id_expediente_asunto` smallint(6) NOT NULL,
  `id_funcionario` smallint(6) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `observacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_contabilidad_patrimonio_observacion`),
  KEY `id_remitente` (`id_remitente`),
  KEY `id_expediente_tipo` (`id_expediente_tipo`),
  KEY `id_expediente_asunto` (`id_expediente_asunto`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `contabilidad_patrimonio_observacion_ibfk_1` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON UPDATE CASCADE,
  CONSTRAINT `contabilidad_patrimonio_observacion_ibfk_2` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `contabilidad_patrimonio_observacion_ibfk_3` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`) ON UPDATE CASCADE,
  CONSTRAINT `contabilidad_patrimonio_observacion_ibfk_4` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `contabilidad_patrimonio_observacion` */

/*Table structure for table `contabilidad_y_patrimonio` */

DROP TABLE IF EXISTS `contabilidad_y_patrimonio`;

CREATE TABLE `contabilidad_y_patrimonio` (
  `id_contabilidad_y_patrimonio` smallint(10) NOT NULL,
  `fecha_recep` date NOT NULL,
  `fecha_oblig` date NOT NULL,
  `cant_hojas_num` int(10) NOT NULL,
  `cant_hojas_let` char(50) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `prog` float NOT NULL,
  `obj_gasto` int(10) NOT NULL,
  `nro_obligacion` int(10) NOT NULL,
  `monto` double NOT NULL,
  `fecha_de_envio` date NOT NULL,
  `id_descripcion` smallint(6) NOT NULL,
  `ff` int(10) NOT NULL,
  `of` int(10) NOT NULL,
  `funcionario` char(100) NOT NULL,
  PRIMARY KEY (`id_contabilidad_y_patrimonio`),
  KEY `id_descripcion` (`id_descripcion`),
  CONSTRAINT `contabilidad_y_patrimonio_ibfk_2` FOREIGN KEY (`id_descripcion`) REFERENCES `descripcion_contabilidad_patrimonio` (`id_descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `contabilidad_y_patrimonio` */

insert  into `contabilidad_y_patrimonio`(`id_contabilidad_y_patrimonio`,`fecha_recep`,`fecha_oblig`,`cant_hojas_num`,`cant_hojas_let`,`nro_expediente`,`prog`,`obj_gasto`,`nro_obligacion`,`monto`,`fecha_de_envio`,`id_descripcion`,`ff`,`of`,`funcionario`) values (1,'2023-05-03','2023-05-03',1,'A',1,1,1,1,1,'2023-05-03',1,1,1,'Oscar Concha');

/*Table structure for table `control_preventivo` */

DROP TABLE IF EXISTS `control_preventivo`;

CREATE TABLE `control_preventivo` (
  `id_control_preventivo` smallint(6) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `nro_externa` int(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora_recepcion` varchar(5) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_expediente_tipo` smallint(6) NOT NULL,
  `id_expediente_asunto` smallint(6) NOT NULL,
  `id_funcionario` smallint(6) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  PRIMARY KEY (`id_control_preventivo`),
  KEY `id_dependencia` (`hora_recepcion`),
  KEY `id_funcionario` (`id_remitente`),
  KEY `id_objeto_gasto` (`fecha_recepcion`),
  KEY `id_remitente` (`anio`),
  KEY `id_expediente_tipo` (`id_expediente_tipo`),
  KEY `id_expediente_asunto` (`id_expediente_asunto`),
  KEY `id_funcionario_2` (`id_funcionario`),
  CONSTRAINT `control_preventivo_ibfk_5` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON UPDATE CASCADE,
  CONSTRAINT `control_preventivo_ibfk_6` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `control_preventivo_ibfk_7` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`) ON UPDATE CASCADE,
  CONSTRAINT `control_preventivo_ibfk_8` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `control_preventivo` */

/*Table structure for table `control_preventivo_observacion` */

DROP TABLE IF EXISTS `control_preventivo_observacion`;

CREATE TABLE `control_preventivo_observacion` (
  `id_control_preventivo_observacion` smallint(6) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `nro_externa` int(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora_recepcion` varchar(5) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_expediente_tipo` smallint(6) NOT NULL,
  `id_expediente_asunto` smallint(6) NOT NULL,
  `id_funcionario` smallint(6) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `observacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_control_preventivo_observacion`),
  KEY `id_remitente` (`id_remitente`),
  KEY `id_expediente_tipo` (`id_expediente_tipo`),
  KEY `id_expediente_asunto` (`id_expediente_asunto`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `control_preventivo_observacion_ibfk_1` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON UPDATE CASCADE,
  CONSTRAINT `control_preventivo_observacion_ibfk_2` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `control_preventivo_observacion_ibfk_3` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`) ON UPDATE CASCADE,
  CONSTRAINT `control_preventivo_observacion_ibfk_4` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `control_preventivo_observacion` */

/*Table structure for table `dependencias` */

DROP TABLE IF EXISTS `dependencias`;

CREATE TABLE `dependencias` (
  `id_dependencia` smallint(6) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_dependencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `dependencias` */

insert  into `dependencias`(`id_dependencia`,`descripcion`) values (1,'Mesa de Entrada'),(2,'Secretaria General'),(3,'Administracion y Finanzas'),(4,'Control Preventivo'),(5,'Presupuesto'),(6,'Contabilidad y Patrimonio'),(7,'Tesoreria'),(8,'Otros');

/*Table structure for table `descripcion_contabilidad_patrimonio` */

DROP TABLE IF EXISTS `descripcion_contabilidad_patrimonio`;

CREATE TABLE `descripcion_contabilidad_patrimonio` (
  `id_descripcion` smallint(6) NOT NULL,
  `descripcion` char(50) NOT NULL,
  PRIMARY KEY (`id_descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `descripcion_contabilidad_patrimonio` */

insert  into `descripcion_contabilidad_patrimonio`(`id_descripcion`,`descripcion`) values (1,'Descripcion');

/*Table structure for table `descripciones_presupuesto` */

DROP TABLE IF EXISTS `descripciones_presupuesto`;

CREATE TABLE `descripciones_presupuesto` (
  `id_descripcion` smallint(6) NOT NULL,
  `descripcion` char(50) NOT NULL,
  PRIMARY KEY (`id_descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `descripciones_presupuesto` */

insert  into `descripciones_presupuesto`(`id_descripcion`,`descripcion`) values (1,'Retenciones'),(2,'Pedido Interno'),(3,'Solicitid de Contrato'),(4,'Multas'),(5,'Bonificacion'),(6,'Servicios Basicos'),(7,'Sueldos'),(8,'Dretel');

/*Table structure for table `dir_gral_adm` */

DROP TABLE IF EXISTS `dir_gral_adm`;

CREATE TABLE `dir_gral_adm` (
  `id_dir_gral_adm` smallint(10) NOT NULL,
  `fecha` date NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `id_conceptos` smallint(6) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_dependencia` smallint(6) NOT NULL,
  `funcionario` char(100) NOT NULL COMMENT 'Recibido por',
  PRIMARY KEY (`id_dir_gral_adm`),
  KEY `id_funcionario` (`funcionario`),
  KEY `id_dependencia` (`id_dependencia`),
  KEY `id_conceptos` (`id_conceptos`),
  KEY `id_remitente` (`id_remitente`),
  CONSTRAINT `dir_gral_adm_ibfk_2` FOREIGN KEY (`id_dependencia`) REFERENCES `dependencias` (`id_dependencia`),
  CONSTRAINT `dir_gral_adm_ibfk_4` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON UPDATE CASCADE,
  CONSTRAINT `dir_gral_adm_ibfk_5` FOREIGN KEY (`id_conceptos`) REFERENCES `conceptos_administracion` (`id_conceptos`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `dir_gral_adm` */

insert  into `dir_gral_adm`(`id_dir_gral_adm`,`fecha`,`nro_expediente`,`id_conceptos`,`id_remitente`,`id_dependencia`,`funcionario`) values (1,'2023-05-03',1,10,2,1,'Cristhian Valenzuela');

/*Table structure for table `expediente_asunto` */

DROP TABLE IF EXISTS `expediente_asunto`;

CREATE TABLE `expediente_asunto` (
  `id_expediente_asunto` smallint(6) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_expediente_asunto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `expediente_asunto` */

insert  into `expediente_asunto`(`id_expediente_asunto`,`descripcion`) values (1,''),(2,'Objetos'),(3,'Objetos Dos');

/*Table structure for table `expediente_entrada` */

DROP TABLE IF EXISTS `expediente_entrada`;

CREATE TABLE `expediente_entrada` (
  `id_expediente_entrada` smallint(6) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `nro_externa` int(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora_recepcion` varchar(5) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_expediente_tipo` smallint(6) NOT NULL,
  `id_expediente_asunto` smallint(6) NOT NULL,
  `id_funcionario` smallint(6) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  PRIMARY KEY (`id_expediente_entrada`),
  KEY `id_remitente` (`id_remitente`),
  KEY `id_expediente_asunto` (`id_expediente_asunto`),
  KEY `id_funcionario` (`id_funcionario`),
  KEY `id_expediente_tipo` (`id_expediente_tipo`),
  CONSTRAINT `expediente_entrada_ibfk_1` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`),
  CONSTRAINT `expediente_entrada_ibfk_3` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`),
  CONSTRAINT `expediente_entrada_ibfk_4` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`),
  CONSTRAINT `expediente_entrada_ibfk_5` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `expediente_entrada` */

/*Table structure for table `expediente_tipo` */

DROP TABLE IF EXISTS `expediente_tipo`;

CREATE TABLE `expediente_tipo` (
  `id_expediente_tipo` smallint(6) NOT NULL,
  `descripcion` char(50) NOT NULL,
  PRIMARY KEY (`id_expediente_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `expediente_tipo` */

insert  into `expediente_tipo`(`id_expediente_tipo`,`descripcion`) values (1,'Correspondencia'),(2,'Administrativo');

/*Table structure for table `funcionarios` */

DROP TABLE IF EXISTS `funcionarios`;

CREATE TABLE `funcionarios` (
  `id_funcionarios` smallint(6) NOT NULL,
  `ci` int(8) NOT NULL,
  `nombre` char(50) NOT NULL,
  `apellido` char(50) NOT NULL,
  `id_dependencia` smallint(6) NOT NULL,
  PRIMARY KEY (`id_funcionarios`),
  KEY `id_dependencia` (`id_dependencia`),
  CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`id_dependencia`) REFERENCES `dependencias` (`id_dependencia`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `funcionarios` */

insert  into `funcionarios`(`id_funcionarios`,`ci`,`nombre`,`apellido`,`id_dependencia`) values (1,6969100,'Oscar','Concha',2),(2,6761829,'Cristhian','Valenzuela',5),(3,6892652,'Carolina','Rojas',1),(4,5370488,'Humberto','Paciello',3),(5,6658363,'ALEXANDER','RIVAS',1);

/*Table structure for table `mesa_entrada` */

DROP TABLE IF EXISTS `mesa_entrada`;

CREATE TABLE `mesa_entrada` (
  `id_mesa_entrada` smallint(10) NOT NULL,
  `nro_expediente` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `id_objetos` smallint(6) NOT NULL,
  `id_remitente` smallint(10) NOT NULL COMMENT 'enviado por',
  `funcionario` char(100) NOT NULL COMMENT 'Recibido por',
  PRIMARY KEY (`id_mesa_entrada`),
  KEY `FK_r.mesa_entradae` (`id_remitente`),
  KEY `FK_r.mesa_entradar` (`funcionario`),
  KEY `id_objeto` (`id_objetos`),
  CONSTRAINT `FK_r.mesa_entradae` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`),
  CONSTRAINT `mesa_entrada_ibfk_2` FOREIGN KEY (`id_objetos`) REFERENCES `objetos_formulario` (`id_objetos`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `mesa_entrada` */

insert  into `mesa_entrada`(`id_mesa_entrada`,`nro_expediente`,`fecha`,`id_objetos`,`id_remitente`,`funcionario`) values (1,'1','2023-04-28',1,4,'Cristhian Valenzuela');

/*Table structure for table `objeto_de_gasto` */

DROP TABLE IF EXISTS `objeto_de_gasto`;

CREATE TABLE `objeto_de_gasto` (
  `id_objeto_gasto` smallint(6) NOT NULL,
  `descripcion` char(50) NOT NULL,
  PRIMARY KEY (`id_objeto_gasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `objeto_de_gasto` */

insert  into `objeto_de_gasto`(`id_objeto_gasto`,`descripcion`) values (1,'Objeto de Gasto');

/*Table structure for table `objetos_formulario` */

DROP TABLE IF EXISTS `objetos_formulario`;

CREATE TABLE `objetos_formulario` (
  `id_objetos` smallint(6) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  PRIMARY KEY (`id_objetos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `objetos_formulario` */

insert  into `objetos_formulario`(`id_objetos`,`descripcion`) values (1,'Otro'),(2,'Pago de Salarios - Personal Administrativo'),(3,'Pago de Salarios - Personal Contratado'),(4,'Pago de Salarios - Personal Docente'),(5,'Pago de Dietas - Miembros del CSU'),(6,'Pago de Dietas - Miembros del Consejo Directivo'),(7,'Pago de Bonificaciones y Gratificaciones'),(8,'Pago de Gasto de Representación'),(9,'Pago de Subsidio Para La Salud'),(10,'Pago de Subsidio Familiar'),(11,'Pago a Proveedores'),(12,'Reposición de Fondo Fijo'),(13,'Pago de Viatico'),(14,'Pago a ANDE'),(15,'Pago a COPACO'),(16,'Pago a AFUNC'),(17,'Pago a IPS');

/*Table structure for table `otras_dependencias` */

DROP TABLE IF EXISTS `otras_dependencias`;

CREATE TABLE `otras_dependencias` (
  `id_otras_dependencias` smallint(6) NOT NULL,
  `nro_expediente` int(10) DEFAULT NULL,
  `nro_externa` int(10) DEFAULT NULL,
  `anio` int(4) DEFAULT NULL,
  `fecha_recepcion` date DEFAULT NULL,
  `hora_recepcion` varchar(5) DEFAULT NULL,
  `id_remitente` smallint(6) DEFAULT NULL,
  `id_expediente_tipo` smallint(6) DEFAULT NULL,
  `id_expediente_asunto` smallint(6) DEFAULT NULL,
  `id_funcionario` smallint(6) DEFAULT NULL,
  `comentario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_otras_dependencias`),
  KEY `id_remitente` (`id_remitente`),
  KEY `id_expediente_tipo` (`id_expediente_tipo`),
  KEY `id_expediente_asunto` (`id_expediente_asunto`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `otras_dependencias_ibfk_1` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON UPDATE CASCADE,
  CONSTRAINT `otras_dependencias_ibfk_2` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `otras_dependencias_ibfk_3` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`) ON UPDATE CASCADE,
  CONSTRAINT `otras_dependencias_ibfk_4` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `otras_dependencias` */

/*Table structure for table `presupuesto` */

DROP TABLE IF EXISTS `presupuesto`;

CREATE TABLE `presupuesto` (
  `id_presupuesto` smallint(6) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `nro_externa` int(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora_recepcion` varchar(6) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_expediente_tipo` smallint(6) NOT NULL,
  `id_expediente_asunto` smallint(6) NOT NULL,
  `id_funcionario` smallint(6) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  PRIMARY KEY (`id_presupuesto`),
  KEY `id_funcionario` (`id_expediente_asunto`),
  KEY `id_dependencia` (`id_expediente_tipo`),
  KEY `id_descripcion` (`anio`),
  KEY `id_remitente` (`id_remitente`),
  KEY `id_funcionario_2` (`id_funcionario`),
  CONSTRAINT `presupuesto_ibfk_4` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON UPDATE CASCADE,
  CONSTRAINT `presupuesto_ibfk_5` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `presupuesto_ibfk_6` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`) ON UPDATE CASCADE,
  CONSTRAINT `presupuesto_ibfk_7` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `presupuesto` */

insert  into `presupuesto`(`id_presupuesto`,`nro_expediente`,`nro_externa`,`anio`,`fecha_recepcion`,`hora_recepcion`,`id_remitente`,`id_expediente_tipo`,`id_expediente_asunto`,`id_funcionario`,`comentario`) values (1,1,2,2023,'2023-07-14','16:28',2,2,2,1,' '),(2,1,1,2024,'2024-02-29','18:37',1,2,2,2,' ');

/*Table structure for table `presupuesto_observacion` */

DROP TABLE IF EXISTS `presupuesto_observacion`;

CREATE TABLE `presupuesto_observacion` (
  `id_presupuesto_observacion` smallint(6) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `nro_externa` int(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora_recepcion` varchar(5) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_expediente_tipo` smallint(6) NOT NULL,
  `id_expediente_asunto` smallint(6) NOT NULL,
  `id_funcionario` smallint(6) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `observacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_presupuesto_observacion`),
  KEY `id_remitente` (`id_remitente`),
  KEY `id_expediente_tipo` (`id_expediente_tipo`),
  KEY `id_expediente_asunto` (`id_expediente_asunto`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `presupuesto_observacion_ibfk_1` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON UPDATE CASCADE,
  CONSTRAINT `presupuesto_observacion_ibfk_2` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `presupuesto_observacion_ibfk_3` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`) ON UPDATE CASCADE,
  CONSTRAINT `presupuesto_observacion_ibfk_4` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `presupuesto_observacion` */

/*Table structure for table `remitente` */

DROP TABLE IF EXISTS `remitente`;

CREATE TABLE `remitente` (
  `id_remitente` smallint(6) NOT NULL,
  `responsable` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `celular` varchar(15) NOT NULL,
  PRIMARY KEY (`id_remitente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `remitente` */

insert  into `remitente`(`id_remitente`,`responsable`,`correo`,`telefono`,`celular`) values (1,'FCEA','secretariageneral@fcea-unc.edu.py','0331 - 241 749',''),(2,'FACET','academicofacet@unc.edu.py','0331 - 243 361',''),(3,'Facultad de Medicina','soporte@virtual.fmedicina-unc.edu.py','0331 - 242 591',''),(4,'Facultad de Odontologia','fo@unc.edu.py','0331 - 241 680',''),(5,'FCA','fca-unc@fca-unc.edu.py','0331 - 241 813',''),(6,'FHCE','','0331 - 243 176','');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(30) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `roles` */

insert  into `roles`(`id_rol`,`rol`) values (1,'Administrador'),(2,'Administracion y Finanzas'),(3,'Presupuesto'),(4,'Contabilidad y Patrimonio'),(5,'Control Preventivo'),(6,'Tesoreria'),(8,'Mesa de Entrada'),(9,'Secretaria General'),(10,'Otras Dependencias'),(11,'RRHH');

/*Table structure for table `secretaria_general` */

DROP TABLE IF EXISTS `secretaria_general`;

CREATE TABLE `secretaria_general` (
  `id_secretaria_general` smallint(6) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `nro_externa` int(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora_recepcion` varchar(5) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_expediente_tipo` smallint(6) NOT NULL,
  `id_expediente_asunto` smallint(6) NOT NULL,
  `id_funcionario` smallint(6) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  PRIMARY KEY (`id_secretaria_general`),
  KEY `id_funcionario` (`id_funcionario`),
  KEY `id_remitente` (`id_remitente`),
  KEY `id_expediente_tipo` (`id_expediente_tipo`),
  KEY `id_expediente_asunto` (`id_expediente_asunto`),
  CONSTRAINT `FK_r.secretaria_generalmt` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`),
  CONSTRAINT `secretaria_general_ibfk_1` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`),
  CONSTRAINT `secretaria_general_ibfk_2` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `secretaria_general_ibfk_3` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `secretaria_general` */

/*Table structure for table `secretaria_general_observacion` */

DROP TABLE IF EXISTS `secretaria_general_observacion`;

CREATE TABLE `secretaria_general_observacion` (
  `id_secretaria_general_observacion` smallint(6) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `nro_externa` int(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora_recepcion` varchar(5) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_expediente_tipo` smallint(6) NOT NULL,
  `id_expediente_asunto` smallint(6) NOT NULL,
  `id_funcionario` smallint(6) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `observacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_secretaria_general_observacion`),
  KEY `id_remitente` (`id_remitente`),
  KEY `id_expediente_tipo` (`id_expediente_tipo`),
  KEY `id_expediente_asunto` (`id_expediente_asunto`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `secretaria_general_observacion_ibfk_1` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON UPDATE CASCADE,
  CONSTRAINT `secretaria_general_observacion_ibfk_2` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `secretaria_general_observacion_ibfk_3` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`) ON UPDATE CASCADE,
  CONSTRAINT `secretaria_general_observacion_ibfk_4` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `secretaria_general_observacion` */

/*Table structure for table `tesoreria` */

DROP TABLE IF EXISTS `tesoreria`;

CREATE TABLE `tesoreria` (
  `id_tesoreria` smallint(6) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `nro_externa` int(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora_recepcion` varchar(5) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_expediente_tipo` smallint(6) NOT NULL,
  `id_expediente_asunto` smallint(6) NOT NULL,
  `id_funcionario` smallint(6) NOT NULL,
  `comentario` varchar(10) NOT NULL,
  PRIMARY KEY (`id_tesoreria`),
  KEY `id_funcionario` (`id_expediente_tipo`),
  KEY `id_conceptos` (`fecha_recepcion`),
  KEY `id_remitente` (`nro_externa`),
  KEY `id_remitente_2` (`id_remitente`),
  KEY `id_expediente_asunto` (`id_expediente_asunto`),
  KEY `id_funcionario_2` (`id_funcionario`),
  CONSTRAINT `tesoreria_ibfk_1` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON UPDATE CASCADE,
  CONSTRAINT `tesoreria_ibfk_2` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `tesoreria_ibfk_3` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`) ON UPDATE CASCADE,
  CONSTRAINT `tesoreria_ibfk_4` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tesoreria` */

/*Table structure for table `tesoreria_observacion` */

DROP TABLE IF EXISTS `tesoreria_observacion`;

CREATE TABLE `tesoreria_observacion` (
  `id_tesoreria_observacion` smallint(6) NOT NULL,
  `nro_expediente` int(10) NOT NULL,
  `nro_externa` int(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora_recepcion` varchar(5) NOT NULL,
  `id_remitente` smallint(6) NOT NULL,
  `id_expediente_tipo` smallint(6) NOT NULL,
  `id_expediente_asunto` smallint(6) NOT NULL,
  `id_funcionario` smallint(6) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `observacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tesoreria_observacion`),
  KEY `id_remitente` (`id_remitente`),
  KEY `id_expediente_tipo` (`id_expediente_tipo`),
  KEY `id_expediente_asunto` (`id_expediente_asunto`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `tesoreria_observacion_ibfk_1` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON UPDATE CASCADE,
  CONSTRAINT `tesoreria_observacion_ibfk_2` FOREIGN KEY (`id_expediente_tipo`) REFERENCES `expediente_tipo` (`id_expediente_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `tesoreria_observacion_ibfk_3` FOREIGN KEY (`id_expediente_asunto`) REFERENCES `expediente_asunto` (`id_expediente_asunto`) ON UPDATE CASCADE,
  CONSTRAINT `tesoreria_observacion_ibfk_4` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tesoreria_observacion` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuario` smallint(10) NOT NULL,
  `id_funcionarios` smallint(6) NOT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `contrasena` varchar(30) DEFAULT NULL,
  `id_rol` int(4) DEFAULT NULL,
  `ultima_conexion` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_rol` (`id_rol`),
  KEY `id_funcionarios` (`id_funcionarios`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_funcionarios`) REFERENCES `funcionarios` (`id_funcionarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_usuario`,`id_funcionarios`,`usuario`,`contrasena`,`id_rol`,`ultima_conexion`) values (1,1,'oscarconcha','12345678',1,'Activo'),(2,2,'cristhianvalenzuela','12345678',2,'Activo'),(3,3,'carolinarojas','12345678',4,'Sin Ingresos'),(4,4,'humbertopaciello','12345678',5,'Sin Ingresos'),(5,5,'alexander','AleX1.2.',1,'Activo');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
