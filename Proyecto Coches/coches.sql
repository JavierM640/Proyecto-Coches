-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2022 a las 01:53:54
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `coches`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coches`
--

CREATE TABLE `coches` (
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(11) NOT NULL,
  `kms` int(11) NOT NULL,
  `matricula` varchar(11) NOT NULL,
  `año` int(11) NOT NULL,
  `subasta` decimal(11,0) NOT NULL,
  `costo` int(11) NOT NULL,
  `tasador` int(11) NOT NULL,
  `diferencia` int(11) NOT NULL,
  `compraventa` int(11) NOT NULL,
  `beneficio` int(11) NOT NULL,
  `peritacion` text NOT NULL,
  `id` int(11) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `coches`
--

INSERT INTO `coches` (`marca`, `modelo`, `kms`, `matricula`, `año`, `subasta`, `costo`, `tasador`, `diferencia`, `compraventa`, `beneficio`, `peritacion`, `id`, `activo`) VALUES
('Bmw', 'Serie 4', 54729, '2069KPM', 2018, '25894', 26414, 32200, 5786, 27700, 1286, 'https://ci.vimsweb.com/Reports/InspectionReports/LPAppraisalReport.aspx?inspection_id=W6VjT9ysU84=&ENC=1', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `marca` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `marca`) VALUES
(1, 'Abarth'),
(2, 'Alfa Romeo'),
(3, 'Aro'),
(4, 'Asia'),
(5, 'Asia Motors'),
(6, 'Aston Martin'),
(7, 'Audi'),
(8, 'Austin'),
(9, 'Auverland'),
(10, 'Bentley'),
(11, 'Bertone'),
(12, 'Bmw'),
(13, 'Cadillac'),
(14, 'Chevrolet'),
(15, 'Chrysler'),
(16, 'Citroen'),
(17, 'Corvette'),
(18, 'Dacia'),
(19, 'Daewoo'),
(20, 'Daf'),
(21, 'Daihatsu'),
(22, 'Daimler'),
(23, 'Dodge'),
(24, 'Ferrari'),
(25, 'Fiat'),
(26, 'Ford'),
(27, 'Galloper'),
(28, 'Gmc'),
(29, 'Honda'),
(30, 'Hummer'),
(31, 'Hyundai'),
(32, 'Infiniti'),
(33, 'Innocenti'),
(34, 'Isuzu'),
(35, 'Iveco'),
(36, 'Iveco-pegaso'),
(37, 'Jaguar'),
(38, 'Jeep'),
(39, 'Kia'),
(40, 'Lada'),
(41, 'Lamborghini'),
(42, 'Lancia'),
(43, 'Land-rover'),
(44, 'Ldv'),
(45, 'Lexus'),
(46, 'Lotus'),
(47, 'Mahindra'),
(48, 'Maserati'),
(49, 'Maybach'),
(50, 'Mazda'),
(51, 'Mercedes-benz'),
(52, 'Mg'),
(53, 'Mini'),
(54, 'Mitsubishi'),
(55, 'Morgan'),
(56, 'Nissan'),
(57, 'Opel'),
(58, 'Peugeot'),
(59, 'Pontiac'),
(60, 'Porsche'),
(61, 'Renault'),
(62, 'Rolls-royce'),
(63, 'Rover'),
(64, 'Saab'),
(65, 'Santana'),
(66, 'Seat'),
(67, 'Skoda'),
(68, 'Smart'),
(69, 'Ssangyong'),
(70, 'Subaru'),
(71, 'Suzuki'),
(72, 'Talbot'),
(73, 'Tata'),
(74, 'Toyota'),
(75, 'Umm'),
(76, 'Vaz'),
(77, 'Volkswagen'),
(78, 'Volvo'),
(79, 'Wartburg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

CREATE TABLE `modelos` (
  `id_marca` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `modelo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modelos`
--

INSERT INTO `modelos` (`id_marca`, `id`, `modelo`) VALUES
(1, 1, '500'),
(1, 2, 'Grande Punto'),
(1, 3, 'Punto Evo'),
(1, 4, '500c'),
(1, 5, '695'),
(1, 6, 'Punto'),
(2, 7, '155'),
(2, 8, '156'),
(2, 9, '159'),
(2, 10, '164'),
(2, 11, '145'),
(2, 12, '147'),
(2, 13, '146'),
(2, 14, 'Gtv'),
(2, 15, 'Spider'),
(2, 16, '166'),
(2, 17, 'Gt'),
(2, 18, 'Crosswagon'),
(2, 19, 'Brera'),
(2, 20, '90'),
(2, 21, '75'),
(2, 22, '33'),
(2, 23, 'Giulietta'),
(2, 24, 'Sprint'),
(2, 25, 'Mito'),
(3, 26, 'Expander'),
(3, 27, '10'),
(3, 28, '24'),
(3, 29, 'Dacia'),
(4, 30, 'Rocsta'),
(5, 31, 'Rocsta'),
(6, 32, 'Db7'),
(6, 33, 'V8'),
(6, 34, 'Db9'),
(6, 35, 'Vanquish'),
(6, 36, 'V8 Vantage'),
(6, 37, 'Vantage'),
(6, 38, 'Dbs'),
(6, 39, 'Volante'),
(6, 40, 'Virage'),
(6, 41, 'Vantage V8'),
(6, 42, 'Vantage V12'),
(6, 43, 'Rapide'),
(6, 44, 'Cygnet'),
(7, 45, '80'),
(7, 46, 'A4'),
(7, 47, 'A6'),
(7, 48, 'S6'),
(7, 49, 'Coupe'),
(7, 50, 'S2'),
(7, 51, 'Rs2'),
(7, 52, 'A8'),
(7, 53, 'Cabriolet'),
(7, 54, 'S8'),
(7, 55, 'A3'),
(7, 56, 'S4'),
(7, 57, 'Tt'),
(7, 58, 'S3'),
(7, 59, 'Allroad Quattro'),
(7, 60, 'Rs4'),
(7, 61, 'A2'),
(7, 62, 'Rs6'),
(7, 63, 'Q7'),
(7, 64, 'R8'),
(7, 65, 'A5'),
(7, 66, 'S5'),
(7, 67, 'V8'),
(7, 68, '200'),
(7, 69, '100'),
(7, 70, '90'),
(7, 71, 'Tts'),
(7, 72, 'Q5'),
(7, 73, 'A4 Allroad Quattro'),
(7, 74, 'Tt Rs'),
(7, 75, 'Rs5'),
(7, 76, 'A1'),
(7, 77, 'A7'),
(7, 78, 'Rs3'),
(7, 79, 'Q3'),
(7, 80, 'A6 Allroad Quattro'),
(7, 81, 'S7'),
(7, 82, 'Sq5'),
(8, 83, 'Mini'),
(8, 84, 'Montego'),
(8, 85, 'Maestro'),
(8, 86, 'Metro'),
(8, 87, 'Mini Moke'),
(9, 88, 'Diesel'),
(10, 89, 'Brooklands'),
(10, 90, 'Turbo'),
(10, 91, 'Continental'),
(10, 92, 'Azure'),
(10, 93, 'Arnage'),
(10, 94, 'Continental Gt'),
(10, 95, 'Continental Flying Spur'),
(10, 96, 'Turbo R'),
(10, 97, 'Mulsanne'),
(10, 98, 'Eight'),
(10, 99, 'Continental Gtc'),
(10, 100, 'Continental Supersports'),
(11, 101, 'Freeclimber Diesel'),
(12, 102, 'Serie 3'),
(12, 103, 'Serie 5'),
(12, 104, 'Compact'),
(12, 105, 'Serie 7'),
(12, 106, 'Serie 8'),
(12, 107, 'Z3'),
(12, 108, 'Z4'),
(12, 109, 'Z8'),
(12, 110, 'X5'),
(12, 111, 'Serie 6'),
(12, 112, 'X3'),
(12, 113, 'Serie 1'),
(12, 114, 'Z1'),
(12, 115, 'X6'),
(12, 116, 'X1'),
(13, 117, 'Seville'),
(13, 118, 'Sts'),
(13, 119, 'El Dorado'),
(13, 120, 'Cts'),
(13, 121, 'Xlr'),
(13, 122, 'Srx'),
(13, 123, 'Escalade'),
(13, 124, 'Bls'),
(14, 125, 'Corvette'),
(14, 126, 'Blazer'),
(14, 127, 'Astro'),
(14, 128, 'Nubira'),
(14, 129, 'Evanda'),
(14, 130, 'Trans Sport'),
(14, 131, 'Camaro'),
(14, 132, 'Matiz'),
(14, 133, 'Alero'),
(14, 134, 'Tahoe'),
(14, 135, 'Tacuma'),
(14, 136, 'Trailblazer'),
(14, 137, 'Kalos'),
(14, 138, 'Aveo'),
(14, 139, 'Lacetti'),
(14, 140, 'Epica'),
(14, 141, 'Captiva'),
(14, 142, 'Hhr'),
(14, 143, 'Cruze'),
(14, 144, 'Spark'),
(14, 145, 'Orlando'),
(14, 146, 'Volt'),
(14, 147, 'Malibu'),
(15, 148, 'Vision'),
(15, 149, '300m'),
(15, 150, 'Grand Voyager'),
(15, 151, 'Viper'),
(15, 152, 'Neon'),
(15, 153, 'Voyager'),
(15, 154, 'Stratus'),
(15, 155, 'Sebring'),
(15, 156, 'Sebring 200c'),
(15, 157, 'New Yorker'),
(15, 158, 'Pt Cruiser'),
(15, 159, 'Crossfire'),
(15, 160, '300c'),
(15, 161, 'Le Baron'),
(15, 162, 'Saratoga'),
(16, 163, 'Xantia'),
(16, 164, 'Xm'),
(16, 165, 'Ax'),
(16, 166, 'Zx'),
(16, 167, 'Evasion'),
(16, 168, 'C8'),
(16, 169, 'Saxo'),
(16, 170, 'C2'),
(16, 171, 'Xsara'),
(16, 172, 'C4'),
(16, 173, 'Xsara Picasso'),
(16, 174, 'C5'),
(16, 175, 'C3'),
(16, 176, 'C3 Pluriel'),
(16, 177, 'C1'),
(16, 178, 'C6'),
(16, 179, 'Grand C4 Picasso'),
(16, 180, 'C4 Picasso'),
(16, 181, 'Ccrosser'),
(16, 182, 'C15'),
(16, 183, 'Jumper'),
(16, 184, 'Jumpy'),
(16, 185, 'Berlingo'),
(16, 186, 'Bx'),
(16, 187, 'C25'),
(16, 188, 'Cx'),
(16, 189, 'Gsa'),
(16, 190, 'Visa'),
(16, 191, 'Lna'),
(16, 192, '2cv'),
(16, 193, 'Nemo'),
(16, 194, 'C4 Sedan'),
(16, 195, 'Berlingo First'),
(16, 196, 'C3 Picasso'),
(16, 197, 'Ds3'),
(16, 198, 'Czero'),
(16, 199, 'Ds4'),
(16, 200, 'Ds5'),
(16, 201, 'C4 Aircross'),
(16, 202, 'Celysee'),
(17, 203, 'Corvette'),
(18, 204, 'Contac'),
(18, 205, 'Logan'),
(18, 206, 'Sandero'),
(18, 207, 'Duster'),
(18, 208, 'Lodgy'),
(19, 209, 'Nexia'),
(19, 210, 'Aranos'),
(19, 211, 'Lanos'),
(19, 212, 'Nubira'),
(19, 213, 'Compact'),
(19, 214, 'Nubira Compact'),
(19, 215, 'Leganza'),
(19, 216, 'Evanda'),
(19, 217, 'Matiz'),
(19, 218, 'Tacuma'),
(19, 219, 'Kalos'),
(19, 220, 'Lacetti'),
(21, 221, 'Applause'),
(21, 222, 'Charade'),
(21, 223, 'Rocky'),
(21, 224, 'Feroza'),
(21, 225, 'Terios'),
(21, 226, 'Sirion'),
(22, 227, 'Serie Xj'),
(22, 228, 'Xj'),
(22, 229, 'Double Six'),
(22, 230, 'Six'),
(22, 231, 'Series Iii'),
(23, 232, 'Viper'),
(23, 233, 'Caliber'),
(23, 234, 'Nitro'),
(23, 235, 'Avenger'),
(23, 236, 'Journey'),
(24, 237, 'F355'),
(24, 238, '360'),
(24, 239, 'F430'),
(24, 240, 'F512 M'),
(24, 241, '550 Maranello'),
(24, 242, '575m Maranello'),
(24, 243, '599'),
(24, 244, '456'),
(24, 245, '456m'),
(24, 246, '612'),
(24, 247, 'F50'),
(24, 248, 'Enzo'),
(24, 249, 'Superamerica'),
(24, 250, '430'),
(24, 251, '348'),
(24, 252, 'Testarossa'),
(24, 253, '512'),
(24, 254, '355'),
(24, 255, 'F40'),
(24, 256, '412'),
(24, 257, 'Mondial'),
(24, 258, '328'),
(24, 259, 'California'),
(24, 260, '458'),
(24, 261, 'Ff'),
(25, 262, 'Croma'),
(25, 263, 'Cinquecento'),
(25, 264, 'Seicento'),
(25, 265, 'Punto'),
(25, 266, 'Grande Punto'),
(25, 267, 'Panda'),
(25, 268, 'Tipo'),
(25, 269, 'Coupe'),
(25, 270, 'Uno'),
(25, 271, 'Ulysse'),
(25, 272, 'Tempra'),
(25, 273, 'Marea'),
(25, 274, 'Barchetta'),
(25, 275, 'Bravo'),
(25, 276, 'Stilo'),
(25, 277, 'Brava'),
(25, 278, 'Palio Weekend'),
(25, 279, '600'),
(25, 280, 'Multipla'),
(25, 281, 'Idea'),
(25, 282, 'Sedici'),
(25, 283, 'Linea'),
(25, 284, '500'),
(25, 285, 'Fiorino'),
(25, 286, 'Ducato'),
(25, 287, 'Doblo Cargo'),
(25, 288, 'Doblo'),
(25, 289, 'Strada'),
(25, 290, 'Regata'),
(25, 291, 'Talento'),
(25, 292, 'Argenta'),
(25, 293, 'Ritmo'),
(25, 294, 'Punto Classic'),
(25, 295, 'Qubo'),
(25, 296, 'Punto Evo'),
(25, 297, '500c'),
(25, 298, 'Freemont'),
(25, 299, 'Panda Classic'),
(25, 300, '500l'),
(26, 301, 'Maverick'),
(26, 302, 'Escort'),
(26, 303, 'Focus'),
(26, 304, 'Mondeo'),
(26, 305, 'Scorpio'),
(26, 306, 'Fiesta'),
(26, 307, 'Probe'),
(26, 308, 'Explorer'),
(26, 309, 'Galaxy'),
(26, 310, 'Ka'),
(26, 311, 'Puma'),
(26, 312, 'Cougar'),
(26, 313, 'Focus Cmax'),
(26, 314, 'Fusion'),
(26, 315, 'Streetka'),
(26, 316, 'Cmax'),
(26, 317, 'Smax'),
(26, 318, 'Transit'),
(26, 319, 'Courier'),
(26, 320, 'Ranger'),
(26, 321, 'Sierra'),
(26, 322, 'Orion'),
(26, 323, 'Pick Up'),
(26, 324, 'Capri'),
(26, 325, 'Granada'),
(26, 326, 'Kuga'),
(26, 327, 'Grand Cmax'),
(26, 328, 'Bmax'),
(26, 329, 'Tourneo Custom'),
(27, 330, 'Exceed'),
(27, 331, 'Santamo'),
(27, 332, 'Super Exceed'),
(29, 333, 'Accord'),
(29, 334, 'Civic'),
(29, 335, 'Crx'),
(29, 336, 'Prelude'),
(29, 337, 'Nsx'),
(29, 338, 'Legend'),
(29, 339, 'Crv'),
(29, 340, 'Hrv'),
(29, 341, 'Logo'),
(29, 342, 'S2000'),
(29, 343, 'Stream'),
(29, 344, 'Jazz'),
(29, 345, 'Frv'),
(29, 346, 'Concerto'),
(29, 347, 'Insight'),
(29, 348, 'Crz'),
(30, 349, 'H2'),
(30, 350, 'H3'),
(30, 351, 'H3t'),
(31, 352, 'Lantra'),
(31, 353, 'Sonata'),
(31, 354, 'Elantra'),
(31, 355, 'Accent'),
(31, 356, 'Scoupe'),
(31, 357, 'Coupe'),
(31, 358, 'Atos'),
(31, 359, 'H1'),
(31, 360, 'Atos Prime'),
(31, 361, 'Xg'),
(31, 362, 'Trajet'),
(31, 363, 'Santa Fe'),
(31, 364, 'Terracan'),
(31, 365, 'Matrix'),
(31, 366, 'Getz'),
(31, 367, 'Tucson'),
(31, 368, 'I30'),
(31, 369, 'Pony'),
(31, 370, 'Grandeur'),
(31, 371, 'I10'),
(31, 372, 'I800'),
(31, 373, 'Sonata Fl'),
(31, 374, 'Ix55'),
(31, 375, 'I20'),
(31, 376, 'Ix35'),
(31, 377, 'Ix20'),
(31, 378, 'Genesis'),
(31, 379, 'I40'),
(31, 380, 'Veloster'),
(32, 381, 'G'),
(32, 382, 'Ex'),
(32, 383, 'Fx'),
(32, 384, 'M'),
(33, 385, 'Elba'),
(33, 386, 'Minitre'),
(34, 387, 'Trooper'),
(34, 388, 'Pick Up'),
(34, 389, 'D Max'),
(34, 390, 'Rodeo'),
(34, 391, 'Dmax'),
(34, 392, 'Trroper'),
(35, 393, 'Daily'),
(35, 394, 'Massif'),
(36, 395, 'Daily'),
(36, 396, 'Duty'),
(37, 397, 'Serie Xj'),
(37, 398, 'Serie Xk'),
(37, 399, 'Xj'),
(37, 400, 'Stype'),
(37, 401, 'Xf'),
(37, 402, 'Xtype'),
(38, 403, 'Wrangler'),
(38, 404, 'Cherokee'),
(38, 405, 'Grand Cherokee'),
(38, 406, 'Commander'),
(38, 407, 'Compass'),
(38, 408, 'Wrangler Unlimited'),
(38, 409, 'Patriot'),
(39, 410, 'Sportage'),
(39, 411, 'Sephia'),
(39, 412, 'Sephia Ii'),
(39, 413, 'Pride'),
(39, 414, 'Clarus'),
(39, 415, 'Shuma'),
(39, 416, 'Carnival'),
(39, 417, 'Joice'),
(39, 418, 'Magentis'),
(39, 419, 'Carens'),
(39, 420, 'Rio'),
(39, 421, 'Cerato'),
(39, 422, 'Sorento'),
(39, 423, 'Opirus'),
(39, 424, 'Picanto'),
(39, 425, 'Ceed'),
(39, 426, 'Ceed Sporty Wagon'),
(39, 427, 'Proceed'),
(39, 428, 'K2500 Frontier'),
(39, 429, 'K2500'),
(39, 430, 'Soul'),
(39, 431, 'Venga'),
(39, 432, 'Optima'),
(39, 433, 'Ceed Sportswagon'),
(40, 434, 'Samara'),
(40, 435, 'Niva'),
(40, 436, 'Sagona'),
(40, 437, 'Stawra 2110'),
(40, 438, '214'),
(40, 439, 'Kalina'),
(40, 440, 'Serie 2100'),
(40, 441, 'Priora'),
(41, 442, 'Gallardo'),
(41, 443, 'Murcielago'),
(41, 444, 'Aventador'),
(42, 445, 'Delta'),
(42, 446, 'K'),
(42, 447, 'Y10'),
(42, 448, 'Dedra'),
(42, 449, 'Lybra'),
(42, 450, 'Z'),
(42, 451, 'Y'),
(42, 452, 'Ypsilon'),
(42, 453, 'Thesis'),
(42, 454, 'Phedra'),
(42, 455, 'Musa'),
(42, 456, 'Thema'),
(42, 457, 'Zeta'),
(42, 458, 'Kappa'),
(42, 459, 'Trevi'),
(42, 460, 'Prisma'),
(42, 461, 'A112'),
(42, 462, 'Ypsilon Elefantino'),
(42, 463, 'Voyager'),
(43, 464, 'Range Rover'),
(43, 465, 'Defender'),
(43, 466, 'Discovery'),
(43, 467, 'Freelander'),
(43, 468, 'Range Rover Sport'),
(43, 469, 'Discovery 4'),
(43, 470, 'Range Rover Evoque'),
(44, 471, 'Maxus'),
(45, 472, 'Ls400'),
(45, 473, 'Ls430'),
(45, 474, 'Gs300'),
(45, 475, 'Is200'),
(45, 476, 'Rx300'),
(45, 477, 'Gs430'),
(45, 478, 'Gs460'),
(45, 479, 'Sc430'),
(45, 480, 'Is300'),
(45, 481, 'Is250'),
(45, 482, 'Rx400h'),
(45, 483, 'Is220d'),
(45, 484, 'Rx350'),
(45, 485, 'Gs450h'),
(45, 486, 'Ls460'),
(45, 487, 'Ls600h'),
(45, 488, 'Ls'),
(45, 489, 'Gs'),
(45, 490, 'Is'),
(45, 491, 'Sc'),
(45, 492, 'Rx'),
(45, 493, 'Ct'),
(46, 494, 'Elise'),
(46, 495, 'Exige'),
(47, 496, 'Bolero Pickup'),
(47, 497, 'Goa Pickup'),
(47, 498, 'Goa'),
(47, 499, 'Cj'),
(47, 500, 'Pikup'),
(47, 501, 'Thar'),
(48, 502, 'Ghibli'),
(48, 503, 'Shamal'),
(48, 504, 'Quattroporte'),
(48, 505, '3200 Gt'),
(48, 506, 'Coupe'),
(48, 507, 'Spyder'),
(48, 508, 'Gransport'),
(48, 509, 'Granturismo'),
(48, 510, '430'),
(48, 511, 'Biturbo'),
(48, 512, '228'),
(48, 513, '224'),
(48, 514, 'Grancabrio'),
(49, 515, 'Maybach'),
(50, 516, 'Xedos 6'),
(50, 517, '626'),
(50, 518, '121'),
(50, 519, 'Xedos 9'),
(50, 520, '323'),
(50, 521, 'Mx3'),
(50, 522, 'Rx7'),
(50, 523, 'Mx5'),
(50, 524, 'Mazda3'),
(50, 525, 'Mpv'),
(50, 526, 'Demio'),
(50, 527, 'Premacy'),
(50, 528, 'Tribute'),
(50, 529, 'Mazda6'),
(50, 530, 'Mazda2'),
(50, 531, 'Rx8'),
(50, 532, 'Mazda5'),
(50, 533, 'Cx7'),
(50, 534, 'Serie B'),
(50, 535, 'B2500'),
(50, 536, 'Bt50'),
(50, 537, 'Mx6'),
(50, 538, '929'),
(50, 539, 'Cx5'),
(52, 580, 'Mgf'),
(52, 581, 'Tf'),
(52, 582, 'Zr'),
(52, 583, 'Zs'),
(52, 584, 'Zt'),
(52, 585, 'Ztt'),
(52, 586, 'Mini'),
(52, 587, 'Countryman'),
(52, 588, 'Paceman'),
(54, 589, 'Montero'),
(54, 590, 'Galant'),
(54, 591, 'Colt'),
(54, 592, 'Space Wagon'),
(54, 593, 'Space Runner'),
(54, 594, 'Space Gear'),
(54, 595, '3000 Gt'),
(54, 596, 'Carisma'),
(54, 597, 'Eclipse'),
(54, 598, 'Space Star'),
(54, 599, 'Montero Sport'),
(54, 600, 'Montero Io'),
(54, 601, 'Outlander'),
(54, 602, 'Lancer'),
(54, 603, 'Grandis'),
(54, 604, 'L200'),
(54, 605, 'Canter'),
(54, 606, '300 Gt'),
(54, 607, 'Asx'),
(54, 608, 'Imiev'),
(55, 609, '44'),
(55, 610, 'Plus 8'),
(55, 611, 'Aero 8'),
(55, 612, 'V6'),
(55, 613, 'Roadster'),
(55, 614, '4'),
(55, 615, 'Plus 4'),
(56, 616, 'Terrano Ii'),
(56, 617, 'Terrano'),
(56, 618, 'Micra'),
(56, 619, 'Sunny'),
(56, 620, 'Primera'),
(56, 621, 'Serena'),
(56, 622, 'Patrol'),
(56, 623, 'Maxima Qx'),
(56, 624, '200 Sx'),
(56, 625, '300 Zx'),
(56, 626, 'Patrol Gr'),
(56, 627, '100 Nx'),
(56, 628, 'Almera'),
(56, 629, 'Pathfinder'),
(56, 630, 'Almera Tino'),
(56, 631, 'Xtrail'),
(56, 632, '350z'),
(56, 633, 'Murano'),
(56, 634, 'Note'),
(56, 635, 'Qashqai'),
(56, 636, 'Tiida'),
(56, 637, 'Vanette'),
(56, 638, 'Trade'),
(56, 639, 'Vanette Cargo'),
(56, 640, 'Pickup'),
(56, 641, 'Navara'),
(56, 642, 'Cabstar E'),
(56, 643, 'Cabstar'),
(56, 644, 'Maxima'),
(56, 645, 'Camion'),
(56, 646, 'Prairie'),
(56, 647, 'Bluebird'),
(56, 648, 'Np300 Pick Up'),
(56, 649, 'Qashqai2'),
(56, 650, 'Pixo'),
(56, 651, 'Gtr'),
(56, 652, '370z'),
(56, 653, 'Cube'),
(56, 654, 'Juke'),
(56, 655, 'Leaf'),
(56, 656, 'Evalia'),
(57, 657, 'Astra'),
(57, 658, 'Vectra'),
(57, 659, 'Calibra'),
(57, 660, 'Corsa'),
(57, 661, 'Omega'),
(57, 662, 'Frontera'),
(57, 663, 'Tigra'),
(57, 664, 'Monterey'),
(57, 665, 'Sintra'),
(57, 666, 'Zafira'),
(57, 667, 'Agila'),
(57, 668, 'Speedster'),
(57, 669, 'Signum'),
(57, 670, 'Meriva'),
(57, 671, 'Antara'),
(57, 672, 'Gt'),
(57, 673, 'Combo'),
(57, 674, 'Movano'),
(57, 675, 'Vivaro'),
(57, 676, 'Kadett'),
(57, 677, 'Monza'),
(57, 678, 'Senator'),
(57, 679, 'Rekord'),
(57, 680, 'Manta'),
(57, 681, 'Ascona'),
(57, 682, 'Insignia'),
(57, 683, 'Zafira Tourer'),
(57, 684, 'Ampera'),
(57, 685, 'Mokka'),
(57, 686, 'Adam'),
(58, 687, '306'),
(58, 688, '605'),
(58, 689, '106'),
(58, 690, '205'),
(58, 691, '405'),
(58, 692, '406'),
(58, 693, '806'),
(58, 694, '807'),
(58, 695, '407'),
(58, 696, '307'),
(58, 697, '206'),
(58, 698, '607'),
(58, 699, '308'),
(58, 700, '307 Sw'),
(58, 701, '206 Sw'),
(58, 702, '407 Sw'),
(58, 703, '1007'),
(58, 704, '107'),
(58, 705, '207'),
(58, 706, '4007'),
(58, 707, 'Boxer'),
(58, 708, 'Partner'),
(58, 709, 'J5'),
(58, 710, '604'),
(58, 711, '505'),
(58, 712, '309'),
(58, 713, 'Bipper'),
(58, 714, 'Partner Origin'),
(58, 715, '3008'),
(58, 716, '5008'),
(58, 717, 'Rcz'),
(58, 718, '508'),
(58, 719, 'Ion'),
(58, 720, '208'),
(58, 721, '4008'),
(59, 722, 'Trans Sport'),
(59, 723, 'Firebird'),
(59, 724, 'Trans Am'),
(60, 725, '911'),
(60, 726, 'Boxster'),
(60, 727, 'Cayenne'),
(60, 728, 'Carrera Gt'),
(60, 729, 'Cayman'),
(60, 730, '928'),
(60, 731, '968'),
(60, 732, '944'),
(60, 733, '924'),
(60, 734, 'Panamera'),
(60, 735, '918'),
(61, 736, 'Megane'),
(61, 737, 'Safrane'),
(61, 738, 'Laguna'),
(61, 739, 'Clio'),
(61, 740, 'Twingo'),
(61, 741, 'Nevada'),
(61, 742, 'Espace'),
(61, 743, 'Spider'),
(61, 744, 'Scenic'),
(61, 745, 'Grand Espace'),
(61, 746, 'Avantime'),
(61, 747, 'Vel Satis'),
(61, 748, 'Grand Scenic'),
(61, 749, 'Clio Campus'),
(61, 750, 'Modus'),
(61, 751, 'Express'),
(61, 752, 'Trafic'),
(61, 753, 'Master'),
(61, 754, 'Kangoo'),
(61, 755, 'Mascott'),
(61, 756, 'Master Propulsion'),
(61, 757, 'Maxity'),
(61, 758, 'R19'),
(61, 759, 'R25'),
(61, 760, 'R5'),
(61, 761, 'R21'),
(61, 762, 'R4'),
(61, 763, 'Alpine'),
(61, 764, 'Fuego'),
(61, 765, 'R18'),
(61, 766, 'R11'),
(61, 767, 'R9'),
(61, 768, 'R6'),
(61, 769, 'Grand Modus'),
(61, 770, 'Kangoo Combi'),
(61, 771, 'Koleos'),
(61, 772, 'Fluence'),
(61, 773, 'Wind'),
(61, 774, 'Latitude'),
(61, 775, 'Grand Kangoo Combi'),
(62, 776, 'Siver Dawn'),
(62, 777, 'Silver Spur'),
(62, 778, 'Park Ward'),
(62, 779, 'Silver Seraph'),
(62, 780, 'Corniche'),
(62, 781, 'Phantom'),
(62, 782, 'Touring'),
(62, 783, 'Silvier'),
(63, 784, '800'),
(63, 785, '600'),
(63, 786, '100'),
(63, 787, '200'),
(63, 788, 'Coupe'),
(63, 789, '400'),
(63, 790, '45'),
(63, 791, 'Cabriolet'),
(63, 792, '25'),
(63, 793, 'Mini'),
(63, 794, '75'),
(63, 795, 'Streetwise'),
(63, 796, 'Sd'),
(64, 797, '900'),
(64, 798, '93'),
(64, 799, '9000'),
(64, 800, '95'),
(64, 801, '93x'),
(64, 802, '94x'),
(65, 803, '300'),
(65, 804, '350'),
(65, 805, 'Anibal'),
(65, 806, 'Anibal Pick Up'),
(66, 807, 'Ibiza'),
(66, 808, 'Cordoba'),
(66, 809, 'Toledo'),
(66, 810, 'Marbella'),
(66, 811, 'Alhambra'),
(66, 812, 'Arosa'),
(66, 813, 'Leon'),
(66, 814, 'Altea'),
(66, 815, 'Altea Xl'),
(66, 816, 'Altea Freetrack'),
(66, 817, 'Terra'),
(66, 818, 'Inca'),
(66, 819, 'Malaga'),
(66, 820, 'Ronda'),
(66, 821, 'Exeo'),
(66, 822, 'Mii'),
(67, 823, 'Felicia'),
(67, 824, 'Forman'),
(67, 825, 'Octavia'),
(67, 826, 'Octavia Tour'),
(67, 827, 'Fabia'),
(67, 828, 'Superb'),
(67, 829, 'Roomster'),
(67, 830, 'Scout'),
(67, 831, 'Pickup'),
(67, 832, 'Favorit'),
(67, 833, '130'),
(67, 834, 'S'),
(67, 835, 'Yeti'),
(67, 836, 'Citigo'),
(67, 837, 'Rapid'),
(68, 838, 'Smart'),
(68, 839, 'Citycoupe'),
(68, 840, 'Fortwo'),
(68, 841, 'Cabrio'),
(68, 842, 'Crossblade'),
(68, 843, 'Roadster'),
(68, 844, 'Forfour'),
(69, 845, 'Korando'),
(69, 846, 'Family'),
(69, 847, 'K4d'),
(69, 848, 'Musso'),
(69, 849, 'Korando Kj'),
(69, 850, 'Rexton'),
(69, 851, 'Rexton Ii'),
(69, 852, 'Rodius'),
(69, 853, 'Kyron'),
(69, 854, 'Actyon'),
(69, 855, 'Sports Pick Up'),
(69, 856, 'Actyon Sports Pick Up'),
(69, 857, 'Kodando'),
(70, 858, 'Legacy'),
(70, 859, 'Impreza'),
(70, 860, 'Svx'),
(70, 861, 'Justy'),
(70, 862, 'Outback'),
(70, 863, 'Forester'),
(70, 864, 'G3x Justy'),
(70, 865, 'B9 Tribeca'),
(70, 866, 'Xt'),
(70, 867, '1800'),
(70, 868, 'Tribeca'),
(70, 869, 'Wrx Sti'),
(70, 870, 'Trezia'),
(70, 871, 'Xv'),
(70, 872, 'Brz'),
(71, 873, 'Maruti'),
(71, 874, 'Swift'),
(71, 875, 'Vitara'),
(71, 876, 'Baleno'),
(71, 877, 'Samurai'),
(71, 878, 'Alto'),
(71, 879, 'Wagon R'),
(71, 880, 'Jimny'),
(71, 881, 'Grand Vitara'),
(71, 882, 'Ignis'),
(71, 883, 'Liana'),
(71, 884, 'Grand Vitara Xl7'),
(71, 885, 'Sx4'),
(71, 886, 'Splash'),
(71, 887, 'Kizashi'),
(72, 888, 'Samba'),
(72, 889, 'Tagora'),
(72, 890, 'Solara'),
(72, 891, 'Horizon'),
(73, 892, 'Telcosport'),
(73, 893, 'Telco'),
(73, 894, 'Sumo'),
(73, 895, 'Safari'),
(73, 896, 'Indica'),
(73, 897, 'Indigo'),
(73, 898, 'Grand Safari'),
(73, 899, 'Tl Pick Up'),
(73, 900, 'Xenon Pick Up'),
(73, 901, 'Vista'),
(73, 902, 'Xenon'),
(73, 903, 'Aria'),
(74, 904, 'Carina E'),
(74, 905, '4runner'),
(74, 906, 'Camry'),
(74, 907, 'Rav4'),
(74, 908, 'Celica'),
(74, 909, 'Supra'),
(74, 910, 'Paseo'),
(74, 911, 'Land Cruiser 80'),
(74, 912, 'Land Cruiser 100'),
(74, 913, 'Land Cruiser'),
(74, 914, 'Land Cruiser 90'),
(74, 915, 'Corolla'),
(74, 916, 'Auris'),
(74, 917, 'Avensis'),
(74, 918, 'Picnic'),
(74, 919, 'Yaris'),
(74, 920, 'Yaris Verso'),
(74, 921, 'Mr2'),
(74, 922, 'Previa'),
(74, 923, 'Prius'),
(74, 924, 'Avensis Verso'),
(74, 925, 'Corolla Verso'),
(74, 926, 'Corolla Sedan'),
(74, 927, 'Aygo'),
(74, 928, 'Hilux'),
(74, 929, 'Dyna'),
(74, 930, 'Land Cruiser 200'),
(74, 931, 'Verso'),
(74, 932, 'Iq'),
(74, 933, 'Urban Cruiser'),
(74, 934, 'Gt86'),
(75, 935, '100'),
(75, 936, '121'),
(76, 937, '214'),
(76, 938, '110 Stawra'),
(76, 939, '111 Stawra'),
(76, 940, '215'),
(76, 941, '112 Stawra'),
(77, 942, 'Passat'),
(77, 943, 'Golf'),
(77, 944, 'Vento'),
(77, 945, 'Polo'),
(77, 946, 'Corrado'),
(77, 947, 'Sharan'),
(77, 948, 'Lupo'),
(77, 949, 'Bora'),
(77, 950, 'Jetta'),
(77, 951, 'New Beetle'),
(77, 952, 'Phaeton'),
(77, 953, 'Touareg'),
(77, 954, 'Touran'),
(77, 955, 'Multivan'),
(77, 956, 'Caddy'),
(77, 957, 'Golf Plus'),
(77, 958, 'Fox'),
(77, 959, 'Eos'),
(77, 960, 'Caravelle'),
(77, 961, 'Tiguan'),
(77, 962, 'Transporter'),
(77, 963, 'Lt'),
(77, 964, 'Taro'),
(77, 965, 'Crafter'),
(77, 966, 'California'),
(77, 967, 'Santana'),
(77, 968, 'Scirocco'),
(77, 969, 'Passat Cc'),
(77, 970, 'Amarok'),
(77, 971, 'Beetle'),
(77, 972, 'Up'),
(77, 973, 'Cc'),
(78, 974, '440'),
(78, 975, '850'),
(78, 976, 'S70'),
(78, 977, 'V70'),
(78, 978, 'V70 Classic'),
(78, 979, '940'),
(78, 980, '480'),
(78, 981, '460'),
(78, 982, '960'),
(78, 983, 'S90'),
(78, 984, 'V90'),
(78, 985, 'Classic'),
(78, 986, 'S40'),
(78, 987, 'V40'),
(78, 988, 'V50'),
(78, 989, 'V70 Xc'),
(78, 990, 'Xc70'),
(78, 991, 'C70'),
(78, 992, 'S80'),
(78, 993, 'S60'),
(78, 994, 'Xc90'),
(78, 995, 'C30'),
(78, 996, '780'),
(78, 997, '760'),
(78, 998, '740'),
(78, 999, '240'),
(78, 1000, '360'),
(78, 1001, '340'),
(78, 1002, 'Xc60'),
(78, 1003, 'V60'),
(78, 1004, 'V40 Cross Country'),
(79, 1005, '353'),
(53, 1006, 'Mini'),
(53, 1007, 'Countryman'),
(53, 1008, 'Paceman'),
(12, 1009, 'Serie 4'),
(51, 1011, 'Clase SL'),
(51, 1012, 'Clase SLK'),
(51, 1013, 'Clase V'),
(51, 1014, 'Clase C'),
(51, 1015, 'Clase M'),
(51, 1016, 'Clase G'),
(51, 1017, 'Clase E'),
(51, 1018, 'Clase CL'),
(51, 1019, 'Clase S'),
(51, 1020, 'Clase GLK'),
(51, 1021, 'SLS AMG'),
(51, 1022, 'Clase B'),
(51, 1023, 'Clase A'),
(51, 1024, 'Clase GL'),
(51, 1027, 'Clase CLS'),
(51, 1028, 'Clase CLA'),
(51, 1029, 'Clase GLA'),
(51, 1030, 'AMG GT'),
(51, 1031, 'Vito'),
(51, 1032, 'Clase GLE Coupé'),
(51, 1033, 'Clase GLE'),
(51, 1034, 'Clase GLK'),
(51, 1035, 'Clase GLC Coupé'),
(51, 1036, 'Clase GLC'),
(51, 1037, 'Clase GLS'),
(51, 1038, 'Clase SLC');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `coches`
--
ALTER TABLE `coches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idmarca` (`id_marca`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `coches`
--
ALTER TABLE `coches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1039;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `fk_idmarca` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
