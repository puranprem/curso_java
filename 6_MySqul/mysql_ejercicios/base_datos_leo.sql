-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2020 a las 14:49:24
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base_datos_leo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombres_ej`
--

CREATE TABLE `nombres_ej` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `edad` int(3) NOT NULL,
  `alergias` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `nombres_ej`
--

INSERT INTO `nombres_ej` (`id`, `nombre`, `edad`, `alergias`) VALUES
(1, 'Maria', 35, 1),
(2, 'Pedro', 27, 0),
(3, 'Josefina', 75, 1),
(4, 'Canario', 27, 0),
(5, 'Israel', 25, 0),
(10, 'Andrea', 38, 1),
(12, 'Pedro', 99, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `nombres_ej`
--
ALTER TABLE `nombres_ej`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `nombres_ej`
--
ALTER TABLE `nombres_ej`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
