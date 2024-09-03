-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-09-2024 a las 00:53:17
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rectorado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id_area` int(11) NOT NULL,
  `area` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id_area`, `area`) VALUES
(1, 'FCEA'),
(4, 'FACET'),
(5, 'FO'),
(6, 'MEDICINA'),
(7, 'FHYCE'),
(8, 'FCA'),
(9, 'OTRO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id_ciudad` int(11) NOT NULL,
  `ciudad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id_ciudad`, `ciudad`) VALUES
(1, 'ASUNCIÓN'),
(2, 'CIUDAD DEL ESTE'),
(3, 'SAN LORENZO'),
(4, 'LUQUE'),
(5, 'ENCARNACIÓN'),
(6, 'PEDRO JUAN CABALLERO'),
(7, 'CAPIATÁ'),
(8, 'LAMBARÉ'),
(9, 'FERNANDO DE LA MORA'),
(10, 'VILLA ELISA'),
(11, 'ITAUGUÁ'),
(12, 'COLONIA MARIANO ROQUE ALONSO'),
(13, 'VILLARRICA'),
(14, 'CAAGUAZÚ'),
(15, 'CONCEPCIÓN'),
(16, 'CORONEL OVIEDO'),
(18, 'SAN JUAN BAUTISTA'),
(19, 'PILAR'),
(20, 'CAAZAPÁ'),
(21, 'LIMPIO'),
(22, 'ÑEMBY'),
(24, 'YPACARAÍ'),
(25, 'PARAGUARÍ'),
(26, 'CAAPUCÚ'),
(27, 'YBYCUÍ'),
(28, 'ITÁ'),
(29, 'SAN BERNARDINO'),
(30, 'PIRIBEBUY'),
(31, 'QUIINDY'),
(32, 'YUTY'),
(33, 'GUARAMBARÉ'),
(34, 'CARMEN DEL PARANÁ'),
(35, 'OBLIGADO'),
(36, 'MBOCAYATY'),
(37, 'NUEVA COLOMBIA'),
(38, 'YGATIMÍ'),
(40, 'GUAYAIBÍ'),
(42, 'SAN BLAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependencias`
--

CREATE TABLE `dependencias` (
  `id_dependencia` int(11) NOT NULL,
  `dependencia` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `dependencias`
--

INSERT INTO `dependencias` (`id_dependencia`, `dependencia`) VALUES
(1, 'MESA DE ENTRADA'),
(2, 'SECRETARIA GENERAL'),
(3, 'ADMINISTRACION Y FINANZAS'),
(4, 'CONTROL PREVENTIVO'),
(5, 'PRESUPUESTO'),
(6, 'CONTABILIDAD Y PATRIMONIO'),
(8, 'TESORERIA'),
(9, 'RECTORADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expedientes`
--

CREATE TABLE `expedientes` (
  `id_expediente` int(11) NOT NULL,
  `nro_expediente` int(11) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `anio_recepcion` int(11) NOT NULL DEFAULT 2000,
  `id_area` int(11) NOT NULL,
  `id_objeto` int(11) NOT NULL,
  `id_dependencia` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `observacion` varchar(100) NOT NULL DEFAULT 'NINGUNA',
  `estado` varchar(30) NOT NULL DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `expedientes`
--

INSERT INTO `expedientes` (`id_expediente`, `nro_expediente`, `fecha_recepcion`, `anio_recepcion`, `id_area`, `id_objeto`, `id_dependencia`, `id_funcionario`, `observacion`, `estado`) VALUES
(1, 178, '2024-07-11', 2000, 1, 1, 9, 1, 'NINGUNA', 'enviado a rectorado'),
(2, 150, '2024-07-12', 2024, 1, 3, 9, 1, 'NINGUNA', 'enviado a rectorado'),
(3, 78484, '2024-06-04', 2024, 6, 4, 4, 1, 'BECA', 'enviado a rectorado'),
(4, 48484, '2024-03-19', 2021, 6, 1, 2, 1, 'AAA', 'enviado a rectorado'),
(5, 176, '2024-07-16', 2024, 1, 4, 9, 1, 'NINGUNA', 'enviado a rectorado'),
(6, 201, '2024-08-21', 2024, 1, 4, 2, 1, 'NINGUNA', 'enviado a rectorado'),
(7, 204, '2024-09-02', 2024, 4, 4, 9, 1, 'NINGUNA', 'enviado a rectorado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL,
  `ci` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `id_ciudad` int(12) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `telefono` varchar(12) NOT NULL DEFAULT '00000000',
  `id_dependencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionario`, `ci`, `nombre`, `apellido`, `id_ciudad`, `direccion`, `telefono`, `id_dependencia`) VALUES
(1, '6658363', 'ALEXANDER', 'RIVAS BENÍTEZ', 15, 'SANTO DOMINGO DE GUZMAN C/ANGEL GIOVINNE', '0986430579', 4),
(2, '1234567', 'JUAN', 'LOPEZ', 20, 'SAN ANTONIO', '00000000', 5),
(3, '6969100', 'OSCAR', 'CONCHA', 15, 'GUILLERMO ROMANIACH', '00000000', 3),
(4, '6761829', 'CRISTHIAN', 'VALENZUELA', 5, 'VILLA ARMANDO', '00000000', 4),
(5, '7074066', 'RODNEY', 'ROJAS', 11, 'VILLA ARMANDO', '00000000', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos`
--

CREATE TABLE `objetos` (
  `id_objeto` int(11) NOT NULL,
  `codigo` int(10) DEFAULT NULL,
  `objeto` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `objetos`
--

INSERT INTO `objetos` (`id_objeto`, `codigo`, `objeto`) VALUES
(1, 180, 'PAGO DE FACTURA DE ANDE'),
(3, 187, 'PAGO FACTURA DE AGUA'),
(4, 201, 'SOLICITUD DE BECA DE INTERCAMBIO'),
(5, 206, 'PAGO DE FACTURA DE SOLICITUD DE ARANCEL CERO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pantallas`
--

CREATE TABLE `pantallas` (
  `id_pantalla` int(11) NOT NULL,
  `pantalla` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pantallas`
--

INSERT INTO `pantallas` (`id_pantalla`, `pantalla`) VALUES
(1, 'ciudades'),
(2, 'roles'),
(3, 'funcionarios'),
(4, 'usuarios'),
(5, 'dependencias'),
(6, 'areas'),
(7, 'objetos'),
(8, 'recepcion'),
(9, 'exp_revisar'),
(10, 'his_expedientes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permiso` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_pantalla` int(11) DEFAULT NULL,
  `alta` tinyint(1) DEFAULT 0,
  `baja` tinyint(1) DEFAULT 0,
  `modificacion` tinyint(1) DEFAULT 0,
  `leer` tinyint(1) DEFAULT 0,
  `recepcion` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `id_usuario`, `id_pantalla`, `alta`, `baja`, `modificacion`, `leer`, `recepcion`) VALUES
(1, 11, 1, 0, 0, 0, 1, 0),
(2, 11, 2, 0, 0, 0, 0, 0),
(3, 11, 3, 0, 0, 0, 0, 0),
(4, 11, 4, 0, 0, 0, 0, 0),
(5, 11, 5, 0, 0, 0, 0, 0),
(6, 11, 6, 0, 0, 0, 0, 0),
(7, 11, 7, 0, 0, 0, 0, 0),
(8, 11, 8, 0, 0, 0, 0, 0),
(9, 11, 9, 0, 0, 1, 1, 0),
(10, 11, 10, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `rol`) VALUES
(8, 'RRHH'),
(10, 'ADMINISTRADOR'),
(11, 'SECRETARIO'),
(12, 'VISITANTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas`
--

CREATE TABLE `rutas` (
  `id_ruta` int(11) NOT NULL,
  `id_expediente` int(11) DEFAULT NULL,
  `id_dependencia` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `id_funcionario` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `correo`, `id_rol`, `id_funcionario`, `foto`, `usuario`, `password`) VALUES
(1, 'alexrivasbenitez324@gmail.com', 10, 1, 'alexander.41', 'alexander', 'AleX1.2.'),
(11, 'juan@gmail.com', 12, 2, 'juan.png', 'juan', 'JuaN1.2.');

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `triger_permisos` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
  INSERT INTO permisos (
    id_usuario,
    id_pantalla,
    alta,
    baja,
    modificacion,
    recepcion
  ) 
  VALUES
    (NEW.id_usuario, 1, 0, 0, 0, 0),
    (NEW.id_usuario, 2, 0, 0, 0, 0),
    (NEW.id_usuario, 3, 0, 0, 0, 0),
    (NEW.id_usuario, 4, 0, 0, 0, 0),
    (NEW.id_usuario, 5, 0, 0, 0, 0),
    (NEW.id_usuario, 6, 0, 0, 0, 0),
    (NEW.id_usuario, 7, 0, 0, 0, 0),
    (NEW.id_usuario, 8, 0, 0, 0, 0),
    (NEW.id_usuario, 9, 0, 0, 0, 0),
    (NEW.id_usuario, 10, 0, 0, 0, 0) ;
    
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  ADD PRIMARY KEY (`id_dependencia`);

--
-- Indices de la tabla `expedientes`
--
ALTER TABLE `expedientes`
  ADD PRIMARY KEY (`id_expediente`),
  ADD KEY `id_dependencia` (`id_dependencia`),
  ADD KEY `id_funcionario` (`id_funcionario`),
  ADD KEY `id_area` (`id_area`),
  ADD KEY `id_objeto` (`id_objeto`);

--
-- Indices de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `id_ciudad` (`id_ciudad`),
  ADD KEY `funcionarios_ibfk_2` (`id_dependencia`);

--
-- Indices de la tabla `objetos`
--
ALTER TABLE `objetos`
  ADD PRIMARY KEY (`id_objeto`);

--
-- Indices de la tabla `pantallas`
--
ALTER TABLE `pantallas`
  ADD PRIMARY KEY (`id_pantalla`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permiso`),
  ADD KEY `id_pantalla` (`id_pantalla`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD PRIMARY KEY (`id_ruta`),
  ADD KEY `id_expediente` (`id_expediente`),
  ADD KEY `id_dependencia` (`id_dependencia`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_funcionario` (`id_funcionario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `id_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  MODIFY `id_dependencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `expedientes`
--
ALTER TABLE `expedientes`
  MODIFY `id_expediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `objetos`
--
ALTER TABLE `objetos`
  MODIFY `id_objeto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pantallas`
--
ALTER TABLE `pantallas`
  MODIFY `id_pantalla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `expedientes`
--
ALTER TABLE `expedientes`
  ADD CONSTRAINT `expedientes_ibfk_1` FOREIGN KEY (`id_dependencia`) REFERENCES `dependencias` (`id_dependencia`),
  ADD CONSTRAINT `expedientes_ibfk_2` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`),
  ADD CONSTRAINT `expedientes_ibfk_3` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`),
  ADD CONSTRAINT `expedientes_ibfk_4` FOREIGN KEY (`id_objeto`) REFERENCES `objetos` (`id_objeto`);

--
-- Filtros para la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`),
  ADD CONSTRAINT `funcionarios_ibfk_2` FOREIGN KEY (`id_dependencia`) REFERENCES `dependencias` (`id_dependencia`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`id_pantalla`) REFERENCES `pantallas` (`id_pantalla`),
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD CONSTRAINT `rutas_ibfk_1` FOREIGN KEY (`id_expediente`) REFERENCES `expedientes` (`id_expediente`),
  ADD CONSTRAINT `rutas_ibfk_2` FOREIGN KEY (`id_dependencia`) REFERENCES `dependencias` (`id_dependencia`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
