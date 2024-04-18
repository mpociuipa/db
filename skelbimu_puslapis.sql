-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2024 at 07:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skelbimu_puslapis`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorijos`
--

CREATE TABLE `kategorijos` (
  `kategorijos_id` int(11) NOT NULL,
  `kategorijos_pavadinimas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategorijos`
--

INSERT INTO `kategorijos` (`kategorijos_id`, `kategorijos_pavadinimas`) VALUES
(1, 'paslaugos'),
(2, 'prekes');

-- --------------------------------------------------------

--
-- Table structure for table `komentarai`
--

CREATE TABLE `komentarai` (
  `komentaro_id` int(11) NOT NULL,
  `skelbimo_id` int(11) NOT NULL,
  `vartotojo_id` int(11) NOT NULL,
  `komentaro_data` datetime DEFAULT current_timestamp(),
  `komentaro_tekstas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `komentarai`
--

INSERT INTO `komentarai` (`komentaro_id`, `skelbimo_id`, `vartotojo_id`, `komentaro_data`, `komentaro_tekstas`) VALUES
(1, 1, 1, '2024-04-12 10:44:13', 'noriu dazyti autobusa, kokia kaina?'),
(7, 1, 2, '2024-04-12 11:28:54', 'Ar tinka i vw passat?');

-- --------------------------------------------------------

--
-- Table structure for table `skelbimai`
--

CREATE TABLE `skelbimai` (
  `skelbimo_id` int(11) NOT NULL,
  `vartotojo_id` int(11) NOT NULL,
  `kategorijos_id` int(11) NOT NULL,
  `skelbimo_data` datetime DEFAULT current_timestamp(),
  `skelbimo_pavadinimas` varchar(50) NOT NULL,
  `skelbimo_aprasymas` varchar(50) NOT NULL,
  `skelbimo_kaina` float(10,2) DEFAULT NULL,
  `skelbimo_tel_nr` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skelbimai`
--

INSERT INTO `skelbimai` (`skelbimo_id`, `vartotojo_id`, `kategorijos_id`, `skelbimo_data`, `skelbimo_pavadinimas`, `skelbimo_aprasymas`, `skelbimo_kaina`, `skelbimo_tel_nr`) VALUES
(1, 2, 1, '2024-04-12 10:34:57', 'dazau automobilius', 'esu geriausias dazytojas kaune, negailiu spakliaus', 100.00, '860012345'),
(2, 2, 2, '2024-04-12 10:40:30', 'parduodu antro golfo varikli', 'parduodu antro golfo varikli be defektu', 300.00, '860012345');

-- --------------------------------------------------------

--
-- Table structure for table `vartotojai`
--

CREATE TABLE `vartotojai` (
  `vartotojo_id` int(10) NOT NULL,
  `vartotojo_vardas` varchar(50) NOT NULL,
  `vartotojo_el_pastas` varchar(50) NOT NULL,
  `vartotojo_slaptazodis` varchar(50) NOT NULL,
  `role` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vartotojai`
--

INSERT INTO `vartotojai` (`vartotojo_id`, `vartotojo_vardas`, `vartotojo_el_pastas`, `vartotojo_slaptazodis`, `role`) VALUES
(1, 'JOLITA', 'J.KUNCIENE@GMAIL.COM', 'UZSIFRUOTAS123', 1),
(2, 'MARIUS', 'MARIULE@GMAIL.COM', 'UZSIFRUOTAS123', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategorijos`
--
ALTER TABLE `kategorijos`
  ADD PRIMARY KEY (`kategorijos_id`);

--
-- Indexes for table `komentarai`
--
ALTER TABLE `komentarai`
  ADD PRIMARY KEY (`komentaro_id`),
  ADD KEY `skelbimo_id` (`skelbimo_id`),
  ADD KEY `vartotojo_id` (`vartotojo_id`);

--
-- Indexes for table `skelbimai`
--
ALTER TABLE `skelbimai`
  ADD PRIMARY KEY (`skelbimo_id`),
  ADD KEY `vartotojo_id` (`vartotojo_id`),
  ADD KEY `kategorijos_id` (`kategorijos_id`);

--
-- Indexes for table `vartotojai`
--
ALTER TABLE `vartotojai`
  ADD PRIMARY KEY (`vartotojo_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategorijos`
--
ALTER TABLE `kategorijos`
  MODIFY `kategorijos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `komentarai`
--
ALTER TABLE `komentarai`
  MODIFY `komentaro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `skelbimai`
--
ALTER TABLE `skelbimai`
  MODIFY `skelbimo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vartotojai`
--
ALTER TABLE `vartotojai`
  MODIFY `vartotojo_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komentarai`
--
ALTER TABLE `komentarai`
  ADD CONSTRAINT `komentarai_ibfk_1` FOREIGN KEY (`skelbimo_id`) REFERENCES `skelbimai` (`skelbimo_id`),
  ADD CONSTRAINT `komentarai_ibfk_2` FOREIGN KEY (`vartotojo_id`) REFERENCES `vartotojai` (`vartotojo_id`);

--
-- Constraints for table `skelbimai`
--
ALTER TABLE `skelbimai`
  ADD CONSTRAINT `skelbimai_ibfk_1` FOREIGN KEY (`vartotojo_id`) REFERENCES `vartotojai` (`vartotojo_id`),
  ADD CONSTRAINT `skelbimai_ibfk_2` FOREIGN KEY (`kategorijos_id`) REFERENCES `kategorijos` (`kategorijos_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
