-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2023 a las 01:11:10
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

--
-- Volcado de datos para la tabla `artistas`
--

INSERT INTO `artistas` (`ID`, `Nombre del Artista`, `País de Origen`, `Género Musical`) VALUES
(0, 'fire', 'EEUU', 'pop');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canciones`
--

CREATE TABLE `canciones` (
  `ID` int(11) NOT NULL,
  `cancion` varchar(255) NOT NULL,
  `Duración` time NOT NULL,
  `albumID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `canciones`
--

INSERT INTO `canciones` (`ID`, `cancion`, `Duración`, `albumID`) VALUES
(0, 'Boogie', '02:30:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

CREATE TABLE `sesion` (
  `ID` int(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(256) NOT NULL COMMENT 'No deberia verse ',
  `Tipo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sesion`
--

INSERT INTO `sesion` (`ID`, `username`, `password`, `Tipo`) VALUES
(0, 'webadmin', '$2y$10$8EUbcp4L7og8xoeFMJ3xpuGTGni6su.pyAw3eoAdmO9VG7aH/44m.', 'admin'),
(1, 'webusuario', '$2y$10$8EUbcp4L7og8xoeFMJ3xpuGTGni6su.pyAw3eoAdmO9VG7aH/44m.', 'usuario');

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
-- Volcado de datos para la tabla `álbumes`
--

INSERT INTO `álbumes` (`ID`, `Título del Álbum`, `Año de Lanzamiento`, `Artista ID`) VALUES
(0, 'earth wind fire', 1990, 0);

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
  ADD KEY `FK_ID_AlbumesID` (`albumID`);

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
  ADD CONSTRAINT `FK_ID_AlbumesID` FOREIGN KEY (`albumID`) REFERENCES `álbumes` (`ID`);

--
-- Filtros para la tabla `álbumes`
--
ALTER TABLE `álbumes`
  ADD CONSTRAINT `FK_ArtistaID` FOREIGN KEY (`Artista ID`) REFERENCES `artistas` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
