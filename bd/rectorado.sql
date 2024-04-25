-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-04-2024 a las 00:01:09
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
(9, 'EXTERNO');

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
(17, 'CAACUPÉ'),
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
(42, 'SAN BLAS'),
(43, 'AREGUÁ');

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
(8, 'TESORERIA');

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
  `id_dependencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionario`, `ci`, `nombre`, `apellido`, `id_ciudad`, `direccion`, `id_dependencia`) VALUES
(1, '6658363', 'ALEXANDER', 'RIVAS', 15, 'SANTO DOMINGO DE GUZMAN C/ANGEL GIOVINNE', 4),
(2, '1234567', 'JUAN', 'LOPEZ', 20, 'SAN ANTONIO', 5),
(3, '6969100', 'OSCAR', 'CONCHA', 1, 'GUILLERMO ROMANIACH', 3),
(4, '6761829', 'CRISTHIAN', 'VALENZUELA', 5, 'VILLA ARMANDO', 4),
(5, '7074066', 'RODNEY', 'ROJAS', 11, 'VILLA ARMANDO', 5);

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
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `foto` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `correo`, `id_rol`, `foto`, `usuario`, `password`) VALUES
(1, 'ALEXANDER', 'RIVAS', 'alexrivasbenitez324@gmail.com', 8, 'alexander.jpg', 'alexander', 'AleX1.2.'),
(7, 'JUAN', 'PEREZ', 'juan@gmail.com', 11, 'sin_perfil.jpg', 'juan', 'JuaN1.2.');

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
-- Indices de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `id_ciudad` (`id_ciudad`),
  ADD KEY `funcionarios_ibfk_2` (`id_dependencia`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

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
  MODIFY `id_dependencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`),
  ADD CONSTRAINT `funcionarios_ibfk_2` FOREIGN KEY (`id_dependencia`) REFERENCES `dependencias` (`id_dependencia`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
