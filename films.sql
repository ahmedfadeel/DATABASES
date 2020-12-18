-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2020 at 09:28 PM
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
-- Database: `films`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `actor_id` bigint(20) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`actor_id`, `first_name`, `last_update`, `last_name`) VALUES
(1, 'fjhdj', '2020-11-09', 'dfmf'),
(2, 'dmfks', '2020-11-09', 'vv sv'),
(3, '.dkfkldn', NULL, 'kffkg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(2, 'Horror'),
(1, 'Romance');

-- --------------------------------------------------------

--
-- Table structure for table `film_actor`
--

CREATE TABLE `film_actor` (
  `film_id` bigint(20) NOT NULL,
  `actor_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `film_actor`
--

INSERT INTO `film_actor` (`film_id`, `actor_id`) VALUES
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `film_category`
--

CREATE TABLE `film_category` (
  `film_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `film_category`
--

INSERT INTO `film_category` (`film_id`, `category_id`) VALUES
(14, 1),
(14, 2),
(15, 1),
(15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `fims`
--

CREATE TABLE `fims` (
  `film_id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `release_year` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fims`
--

INSERT INTO `fims` (`film_id`, `description`, `release_year`, `title`, `language_id`) VALUES
(1, 'el;smf;la', '2020', ' vvmv', 1),
(8, NULL, NULL, 'flfdkfjdk', NULL),
(11, NULL, NULL, 'gggflfdkfjdk', NULL),
(13, NULL, NULL, 'gggflfg,lg,fldkfjdk', NULL),
(14, NULL, NULL, 'Revenant', NULL),
(15, NULL, NULL, 'lord of the rings ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `language_id` bigint(20) NOT NULL,
  `language_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`language_id`, `language_name`) VALUES
(1, 'English'),
(2, 'Arabic');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`actor_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `UK_41g4n0emuvcm3qyf1f6cn43c0` (`category_name`);

--
-- Indexes for table `film_actor`
--
ALTER TABLE `film_actor`
  ADD PRIMARY KEY (`film_id`,`actor_id`),
  ADD KEY `FKof205v7o3p6pv7qxwc09170f8` (`actor_id`);

--
-- Indexes for table `film_category`
--
ALTER TABLE `film_category`
  ADD PRIMARY KEY (`film_id`,`category_id`),
  ADD KEY `FK1u6u1pdpmmcq53uwxsri6yry3` (`category_id`);

--
-- Indexes for table `fims`
--
ALTER TABLE `fims`
  ADD PRIMARY KEY (`film_id`),
  ADD UNIQUE KEY `UK_lrd70y5o1yuteiqagvtvjts6g` (`title`),
  ADD KEY `FK3np9x23qwb10n51d16fjjrrj8` (`language_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`language_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `actor_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fims`
--
ALTER TABLE `fims`
  MODIFY `film_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `language_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `film_actor`
--
ALTER TABLE `film_actor`
  ADD CONSTRAINT `FKof205v7o3p6pv7qxwc09170f8` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`),
  ADD CONSTRAINT `FKqhsddd197hlcdkxuyclth8mkk` FOREIGN KEY (`film_id`) REFERENCES `fims` (`film_id`);

--
-- Constraints for table `film_category`
--
ALTER TABLE `film_category`
  ADD CONSTRAINT `FK1u6u1pdpmmcq53uwxsri6yry3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `FK6y29t4djelgk14lox6683krsn` FOREIGN KEY (`film_id`) REFERENCES `fims` (`film_id`);

--
-- Constraints for table `fims`
--
ALTER TABLE `fims`
  ADD CONSTRAINT `FK3np9x23qwb10n51d16fjjrrj8` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
