-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2020 at 09:29 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee-management-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `dtos`
--

CREATE TABLE `dtos` (
  `id` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) NOT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `email_id`, `first_name`, `last_name`) VALUES
(12, 'ahmed@gmail.com', 'ali', 'mahmoud'),
(13, 'ahmed@gmail.com', 'ahmed', 'mahmoud'),
(14, 'ahmed@gmail.com', 'ali', 'mahmoud');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` bigint(20) NOT NULL,
  `carrier` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `country_prefix` varchar(255) DEFAULT NULL,
  `international_format` varchar(255) DEFAULT NULL,
  `line_type` varchar(255) DEFAULT NULL,
  `local_format` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `valid` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `carrier`, `country_code`, `country_name`, `country_prefix`, `international_format`, `line_type`, `local_format`, `location`, `number`, `valid`) VALUES
(1, 'AT&T Mobility LLC', 'US', 'United States of America', '+1', '+14158586277', 'mobile', '4158586277', 'Novato', '14158586277', b'1'),
(2, 'AT&T Mobility LLC', 'US', 'United States of America', '+1', '+14158586290', 'mobile', '4158586290', 'Novato', '14158586290', b'1'),
(3, 'AT&T Mobility LLC', 'US', 'United States of America', '+1', '+14158586290', 'mobile', '4158586290', 'Novato', '14158586290', b'1'),
(4, 'AT&T Mobility LLC', 'US', 'United States of America', '+1', '+14158586256', 'mobile', '4158586256', 'Novato', '14158586256', b'1'),
(5, 'AT&T Mobility LLC', 'US', 'United States of America', '+1', '+14158586292', 'mobile', '4158586292', 'Novato', '14158586292', b'1'),
(6, 'AT&T Mobility LLC', 'US', 'United States of America', '+1', '+14158586292', 'mobile', '4158586292', 'Novato', '14158586292', b'1'),
(7, 'AT&T Mobility LLC', 'US', 'United States of America', '+1', '+14158586292', 'mobile', '4158586292', 'Novato', '14158586292', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `active`, `password`, `roles`, `user_name`) VALUES
(1, b'1', 'test', 'user', 'test'),
(3, b'0', 'mahmoud', 'user', 'ahmed'),
(4, b'1', 'ali', 'user', 'ali'),
(5, b'1', 'ayman', 'user', 'ayman'),
(6, b'1', '$2a$10$W4prcXGk7LIQfrNc2CCUM.ESgh9vLWJpTDM4WkocFATznMTzXba8C', 'user', 'mohamed'),
(8, b'1', '$2a$10$W7aig5fTisCbUO2a0jicruookqY2.NXgs6gC2WecUTwKTNkDSQAnK', 'user', 'wael'),
(12, b'1', '$2a$10$I2mSAsqxoQjET0lMcB3GkOWoz9ivhj3RRV6GAzFr.VZy1dBLw81ea', 'user,admin', 'Ahmedd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dtos`
--
ALTER TABLE `dtos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_k8d0f2n7n88w1a16yhua64onx` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
