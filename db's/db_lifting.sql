-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 10, 2013 at 12:02 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_lifting`
--

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE IF NOT EXISTS `exercises` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `title`) VALUES
(1, 'Bench Press'),
(2, 'Deadlift'),
(3, 'Bent over rows'),
(25, 'Pull ups');

-- --------------------------------------------------------

--
-- Table structure for table `previous`
--

CREATE TABLE IF NOT EXISTS `previous` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `exercise_id` int(2) unsigned NOT NULL,
  `dates` varchar(40) NOT NULL,
  `reps` int(3) unsigned NOT NULL,
  `weight` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `previous`
--

INSERT INTO `previous` (`id`, `exercise_id`, `dates`, `reps`, `weight`) VALUES
(42, 3, '5/3/2013', 22, 222222222),
(47, 1, '5/3/2013', 22, 22),
(48, 32, '6/3/2013', 22, 22),
(49, 1, '8/3/2013', 25, 45),
(50, 25, '8/3/2013', 121, 1213),
(51, 25, '8/3/2013', 121, 1213),
(52, 25, '8/3/2013', 121, 1213),
(53, 25, '8/3/2013', 121, 1213),
(54, 25, '8/3/2013', 121, 1213),
(55, 25, '8/3/2013', 121, 1213),
(56, 25, '8/3/2013', 121, 1213),
(57, 25, '8/3/2013', 121, 1213),
(58, 25, '8/3/2013', 121, 1213),
(59, 25, '8/3/2013', 121, 1213);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
