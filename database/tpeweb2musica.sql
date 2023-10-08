-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2023 a las 22:01:10
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpeweb2musica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artistas`
--

CREATE TABLE `artistas` (
  `ID` int(11) NOT NULL,
  `Nombre del Artista` varchar(255) NOT NULL,
  `País de Origen` varchar(255) NOT NULL,
  `Género Musical` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canciones`
--

CREATE TABLE `canciones` (
  `ID` int(11) NOT NULL,
  `Título de la Canción` varchar(255) NOT NULL,
  `Duración` time NOT NULL,
  `Álbum ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

CREATE TABLE `sesion` (
  `ID` int(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL COMMENT 'No deberia verse ',
  `Tipo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sesion`
--

INSERT INTO `sesion` (`ID`, `username`, `password`, `Tipo`) VALUES
(0, 'joaquin', 'morales', 'usuario'),
(1, 'webadmin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `álbumes`
--

CREATE TABLE `álbumes` (
  `ID` int(11) NOT NULL,
  `Título del Álbum` varchar(255) NOT NULL,
  `Año de Lanzamiento` int(11) NOT NULL,
  `Artista ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD KEY `FK_ID_AlbumesID` (`Álbum ID`);

--
-- Indices de la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indices de la tabla `álbumes`
--
ALTER TABLE `álbumes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ArtistaID` (`Artista ID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD CONSTRAINT `FK_ID_AlbumesID` FOREIGN KEY (`Álbum ID`) REFERENCES `álbumes` (`ID`);

--
-- Filtros para la tabla `álbumes`
--
ALTER TABLE `álbumes`
  ADD CONSTRAINT `FK_ArtistaID` FOREIGN KEY (`Artista ID`) REFERENCES `artistas` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
