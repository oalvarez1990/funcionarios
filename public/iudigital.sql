-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 05-11-2023 a las 23:41:41
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `iudigital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EstadosCiviles`
--

CREATE TABLE `EstadosCiviles` (
  `id_estado_civil` int(11) NOT NULL,
  `estado_civil` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `EstadosCiviles`
--

INSERT INTO `EstadosCiviles` (`id_estado_civil`, `estado_civil`) VALUES
(1, 'Soltero'),
(2, 'Casado'),
(3, 'Divorciado'),
(4, 'Viudo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Funcionarios`
--

CREATE TABLE `Funcionarios` (
  `id_funcionario` int(11) NOT NULL,
  `tipo_identificacion` varchar(200) NOT NULL,
  `numero_identificacion` varchar(200) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `id_estado_civil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Funcionarios`
--

INSERT INTO `Funcionarios` (`id_funcionario`, `tipo_identificacion`, `numero_identificacion`, `fecha_nacimiento`, `telefono`, `id_estado_civil`) VALUES
(1, 'CC', '123456789', '2000-01-01', '3125436789', 2),
(2, 'TI', '987654321', '1990-02-02', '3014567890', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GrupoFamiliares`
--

CREATE TABLE `GrupoFamiliares` (
  `id_grupo_familiar` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_parentesco` int(11) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `GrupoFamiliares`
--

INSERT INTO `GrupoFamiliares` (`id_grupo_familiar`, `id_funcionario`, `id_parentesco`, `nombres`, `apellidos`, `fecha_nacimiento`, `sexo`) VALUES
(1, 1, 1, 'Pedro', 'Pérez', '1970-03-03', 'M'),
(2, 1, 2, 'Ana', 'Pérez', '1975-04-04', 'F'),
(3, 2, 3, 'Carlos', 'González', '2005-05-05', 'M'),
(4, 2, 4, 'Laura', 'González', '2007-06-06', 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `InformacionPersonal`
--

CREATE TABLE `InformacionPersonal` (
  `id_funcionario` int(11) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `universidad` varchar(200) NOT NULL,
  `nivel_estudio` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `InformacionPersonal`
--

INSERT INTO `InformacionPersonal` (`id_funcionario`, `nombres`, `apellidos`, `universidad`, `nivel_estudio`) VALUES
(1, 'Juan', 'Pérez', 'Universidad de Antioquia', 'Ingeniería de Software'),
(2, 'María', 'González', 'Universidad Nacional', 'Medicina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Parentescos`
--

CREATE TABLE `Parentescos` (
  `id_parentesco` int(11) NOT NULL,
  `parentesco` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Parentescos`
--

INSERT INTO `Parentescos` (`id_parentesco`, `parentesco`) VALUES
(1, 'Padre'),
(2, 'Madre'),
(3, 'Esposa'),
(4, 'Hijo'),
(5, 'Hija');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `EstadosCiviles`
--
ALTER TABLE `EstadosCiviles`
  ADD PRIMARY KEY (`id_estado_civil`);

--
-- Indices de la tabla `Funcionarios`
--
ALTER TABLE `Funcionarios`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Indices de la tabla `GrupoFamiliares`
--
ALTER TABLE `GrupoFamiliares`
  ADD PRIMARY KEY (`id_grupo_familiar`),
  ADD KEY `id_funcionario` (`id_funcionario`),
  ADD KEY `id_parentesco` (`id_parentesco`);

--
-- Indices de la tabla `InformacionPersonal`
--
ALTER TABLE `InformacionPersonal`
  ADD KEY `id_funcionario` (`id_funcionario`);

--
-- Indices de la tabla `Parentescos`
--
ALTER TABLE `Parentescos`
  ADD PRIMARY KEY (`id_parentesco`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `EstadosCiviles`
--
ALTER TABLE `EstadosCiviles`
  MODIFY `id_estado_civil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Funcionarios`
--
ALTER TABLE `Funcionarios`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `GrupoFamiliares`
--
ALTER TABLE `GrupoFamiliares`
  MODIFY `id_grupo_familiar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Parentescos`
--
ALTER TABLE `Parentescos`
  MODIFY `id_parentesco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `GrupoFamiliares`
--
ALTER TABLE `GrupoFamiliares`
  ADD CONSTRAINT `GrupoFamiliares_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `Funcionarios` (`id_funcionario`),
  ADD CONSTRAINT `GrupoFamiliares_ibfk_2` FOREIGN KEY (`id_parentesco`) REFERENCES `Parentescos` (`id_parentesco`);

--
-- Filtros para la tabla `InformacionPersonal`
--
ALTER TABLE `InformacionPersonal`
  ADD CONSTRAINT `InformacionPersonal_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `Funcionarios` (`id_funcionario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
