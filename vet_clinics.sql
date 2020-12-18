-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2020 at 09:26 PM
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
-- Database: `vet_clinics`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` bigint(20) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `city`, `region`) VALUES
(1, 'cairo', 'maadi'),
(2, 'giza', 'october'),
(3, 'suez', 'El arbein');

-- --------------------------------------------------------

--
-- Table structure for table `clinics`
--

CREATE TABLE `clinics` (
  `clinic_id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `working_days_and_hours` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clinics`
--

INSERT INTO `clinics` (`clinic_id`, `email`, `working_days_and_hours`, `name`, `phone`, `address_id`) VALUES
(1, 'gg@gm.com', 'fkgggr', 'grgrgg', '01001002547', 1),
(2, 'gg@gm.com', 'fkgggr', 'kmlkmkml', '01001002543', 2);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` bigint(20) NOT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `photo` longblob,
  `clinic_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `bio`, `name`, `phone`, `photo`, `clinic_id`) VALUES
(1, ';kjhghjgjhftdgru', 'kjgjfg', '01673456783', NULL, 1),
(2, ';kjhghjgjhftdgru', 'kggekgmklr', '01673446783', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `owner_id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `owner_address` tinyblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`owner_id`, `email`, `gender`, `name`, `phone`, `address_id`, `owner_address`) VALUES
(1, 'ggj@gmail.com', 'Male', 'fdvlkgj', '01045678381', 3, NULL),
(2, 'ggj@gmail.com', 'Male', 'lhjlkjlkjl', '01045678382', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `pet_id` bigint(20) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `image` longblob,
  `kind` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `weight` double NOT NULL,
  `owner_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`pet_id`, `date_of_birth`, `gender`, `image`, `kind`, `name`, `weight`, `owner_id`) VALUES
(1, '2020-12-02', 'Female', NULL, 'hggkjgh', 'gdfkglkfg', 50, 1),
(2, '2020-12-02', 'Female', NULL, 'hggkjgh', 'fkfkflgjflk', 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `visit_id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `clinic_id` bigint(20) DEFAULT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `pet_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`visit_id`, `date`, `clinic_id`, `doctor_id`, `owner_id`, `pet_id`) VALUES
(5, '2020-12-05', 1, 1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`clinic_id`),
  ADD UNIQUE KEY `UK_dww0js5tgrxriey7qjabvk8v3` (`name`),
  ADD KEY `FKil1v0kppofqdcr6wcf880ox6r` (`address_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`),
  ADD UNIQUE KEY `UK_89gv7kfdoia7qdkilwkbndfoc` (`name`),
  ADD KEY `FKihqanxookqa5oh9guthqjfxxm` (`clinic_id`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`owner_id`),
  ADD UNIQUE KEY `UK_2j6wve2jb43e32hln9tmftp7a` (`name`),
  ADD KEY `FKa1t23q4qtokda827qr6pmtl00` (`address_id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`pet_id`),
  ADD UNIQUE KEY `UK_mpsqruq98wmxe1bfwxd41ws4l` (`name`),
  ADD KEY `FK6teg4kcjcnjhduguft56wcfoa` (`owner_id`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`visit_id`),
  ADD KEY `FK31r7b584q3116ip0jhvcwyy3t` (`clinic_id`),
  ADD KEY `FKth95fndjk3y3nepjfu3f66r63` (`doctor_id`),
  ADD KEY `FKg8xrars8dx3wpar120pbvej0r` (`owner_id`),
  ADD KEY `FK6jcifhlqqlsfseu67utlouauy` (`pet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clinics`
--
ALTER TABLE `clinics`
  MODIFY `clinic_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `owners`
--
ALTER TABLE `owners`
  MODIFY `owner_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `pet_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `visit_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clinics`
--
ALTER TABLE `clinics`
  ADD CONSTRAINT `FKil1v0kppofqdcr6wcf880ox6r` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `FKihqanxookqa5oh9guthqjfxxm` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`clinic_id`);

--
-- Constraints for table `owners`
--
ALTER TABLE `owners`
  ADD CONSTRAINT `FKa1t23q4qtokda827qr6pmtl00` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`);

--
-- Constraints for table `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `FK6teg4kcjcnjhduguft56wcfoa` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`owner_id`);

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `FK31r7b584q3116ip0jhvcwyy3t` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`clinic_id`),
  ADD CONSTRAINT `FK6jcifhlqqlsfseu67utlouauy` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`),
  ADD CONSTRAINT `FKg8xrars8dx3wpar120pbvej0r` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`owner_id`),
  ADD CONSTRAINT `FKth95fndjk3y3nepjfu3f66r63` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
