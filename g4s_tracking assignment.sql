-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2026 at 11:58 AM
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
-- Database: `g4s_tracking`
--

-- --------------------------------------------------------

--
-- Table structure for table `retailcenter`
--

CREATE TABLE `retailcenter` (
  `center_id` varchar(20) NOT NULL,
  `type` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipmenttransport`
--

CREATE TABLE `shipmenttransport` (
  `item_number` varchar(20) NOT NULL,
  `schedule_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shippeditem`
--

CREATE TABLE `shippeditem` (
  `item_number` varchar(20) NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `dimensions` varchar(100) DEFAULT NULL,
  `insurance_amount` decimal(10,2) DEFAULT NULL,
  `destination` varchar(200) NOT NULL,
  `final_delivery_date` date DEFAULT NULL,
  `center_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transportationevent`
--

CREATE TABLE `transportationevent` (
  `schedule_number` varchar(20) NOT NULL,
  `type` varchar(50) NOT NULL,
  `delivery_route` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `retailcenter`
--
ALTER TABLE `retailcenter`
  ADD PRIMARY KEY (`center_id`);

--
-- Indexes for table `shipmenttransport`
--
ALTER TABLE `shipmenttransport`
  ADD PRIMARY KEY (`item_number`,`schedule_number`),
  ADD KEY `schedule_number` (`schedule_number`);

--
-- Indexes for table `shippeditem`
--
ALTER TABLE `shippeditem`
  ADD PRIMARY KEY (`item_number`),
  ADD KEY `center_id` (`center_id`);

--
-- Indexes for table `transportationevent`
--
ALTER TABLE `transportationevent`
  ADD PRIMARY KEY (`schedule_number`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shipmenttransport`
--
ALTER TABLE `shipmenttransport`
  ADD CONSTRAINT `shipmenttransport_ibfk_1` FOREIGN KEY (`item_number`) REFERENCES `shippeditem` (`item_number`),
  ADD CONSTRAINT `shipmenttransport_ibfk_2` FOREIGN KEY (`schedule_number`) REFERENCES `transportationevent` (`schedule_number`);

--
-- Constraints for table `shippeditem`
--
ALTER TABLE `shippeditem`
  ADD CONSTRAINT `shippeditem_ibfk_1` FOREIGN KEY (`center_id`) REFERENCES `retailcenter` (`center_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
