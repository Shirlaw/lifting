-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 02, 2013 at 03:51 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `title`) VALUES
(1, 'Bench Press'),
(2, 'Deadlift'),
(3, 'Bent over rows'),
(4, 'Squats');

-- --------------------------------------------------------

--
-- Table structure for table `previous`
--

CREATE TABLE IF NOT EXISTS `previous` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `exercise_id` int(2) unsigned NOT NULL,
  `dates` date NOT NULL,
  `reps` int(3) unsigned NOT NULL,
  `weight` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `previous`
--

INSERT INTO `previous` (`id`, `exercise_id`, `dates`, `reps`, `weight`) VALUES
(1, 1, '2013-02-26', 8, 35),
(2, 2, '2013-02-26', 5, 45),
(3, 1, '2013-02-27', 3, 45),
(4, 1, '0000-00-00', 2, 2),
(5, 1, '0000-00-00', 2, 2),
(6, 2, '0000-00-00', 8, 25);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
