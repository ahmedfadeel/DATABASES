-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2020 at 09:34 PM
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
-- Database: `course_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) NOT NULL,
  `name` varchar(80) NOT NULL,
  `total` int(10) NOT NULL,
  `adress` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `total`, `adress`) VALUES
(1, 'ahmed fadel ', 0, 'TTa'),
(2, 'ahmed hanfy ', 0, 'TTa');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `quantity` int(10) NOT NULL,
  `name` varchar(80) NOT NULL,
  `cost_perunit` int(10) NOT NULL,
  `supplierName` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`quantity`, `name`, `cost_perunit`, `supplierName`) VALUES
(0, 'kossp', 300, 'El Asyoty'),
(0, 'Rdda', 150, 'Ibn El Katab');

-- --------------------------------------------------------

--
-- Table structure for table `reciepe`
--

CREATE TABLE `reciepe` (
  `id` int(10) NOT NULL,
  `customerName` varchar(80) NOT NULL,
  `total` int(10) NOT NULL,
  `date` date NOT NULL,
  `paid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `name` varchar(80) NOT NULL,
  `adress` varchar(80) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`name`, `adress`, `total`) VALUES
('El Asyoty', 'Asyout', 0),
('El mostakble', 'cairo', 0),
('Ibn El Katab', 'cairo', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int(10) NOT NULL,
  `UserName` varchar(80) NOT NULL,
  `Password` varchar(80) NOT NULL,
  `Type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `UserName`, `Password`, `Type`) VALUES
(1, 'ahmed mahmod', '123', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `supplierName` (`supplierName`);

--
-- Indexes for table `reciepe`
--
ALTER TABLE `reciepe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerName` (`customerName`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reciepe`
--
ALTER TABLE `reciepe`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`supplierName`) REFERENCES `supplier` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reciepe`
--
ALTER TABLE `reciepe`
  ADD CONSTRAINT `reciepe_ibfk_1` FOREIGN KEY (`customerName`) REFERENCES `customer` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
