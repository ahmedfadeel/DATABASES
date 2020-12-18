-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2020 at 09:27 PM
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
-- Database: `users`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `courseid` bigint(20) NOT NULL,
  `course_start_date` date DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `salary` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`courseid`, `course_start_date`, `name`, `salary`) VALUES
(1, '2020-08-28', 'java basics ', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(22);

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `id` bigint(20) NOT NULL,
  `field` varchar(255) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `years_of_experience` int(11) NOT NULL,
  `course_courseid` bigint(20) DEFAULT NULL,
  `instructor_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`id`, `field`, `age`, `name`, `years_of_experience`, `course_courseid`, `instructor_id`) VALUES
(3, 'java', 35, 'Mohammed yousry', 3, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `students_studentid` bigint(20) NOT NULL,
  `courses_courseid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `studentid` bigint(20) NOT NULL,
  `age` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`studentid`, `age`, `email`, `first_name`, `last_name`) VALUES
(1, '30', 'ahmedfadelj@gmail.com', 'ahmed', 'lastName');

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
(1, b'1', '$2a$10$sdBFNKWjdbXY4AsPnbcLIuvz1vQXe4raEH4d.myfrRpfk8wYWIGrG', 'USER', 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseid`),
  ADD UNIQUE KEY `UK_5o6x4fpafbywj4v2g0owhh11r` (`name`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_23b11cjm6yf8ydkov0kj6de7` (`name`),
  ADD KEY `FK83qomj061g2q3i45ih96w3qav` (`course_courseid`),
  ADD KEY `FKe3wgn7rkb22o1oesyya9y0ah2` (`instructor_id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`students_studentid`,`courses_courseid`),
  ADD KEY `FK6dlq7rtwcct9yl8j28bkc8jk4` (`courses_courseid`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`studentid`),
  ADD UNIQUE KEY `UK_e2rndfrsx22acpq2ty1caeuyw` (`email`),
  ADD UNIQUE KEY `UKicgym6uan7jujllv92neh5q1a` (`email`);

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
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `courseid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `instructors`
--
ALTER TABLE `instructors`
  ADD CONSTRAINT `FK83qomj061g2q3i45ih96w3qav` FOREIGN KEY (`course_courseid`) REFERENCES `courses` (`courseid`),
  ADD CONSTRAINT `FKe3wgn7rkb22o1oesyya9y0ah2` FOREIGN KEY (`instructor_id`) REFERENCES `courses` (`courseid`);

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `FK6dlq7rtwcct9yl8j28bkc8jk4` FOREIGN KEY (`courses_courseid`) REFERENCES `courses` (`courseid`),
  ADD CONSTRAINT `FKt7pj6yr9frjbl076aa3vfo0ed` FOREIGN KEY (`students_studentid`) REFERENCES `students` (`studentid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
