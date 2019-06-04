-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: aladhan-com_database
-- Generation Time: Jun 04, 2019 at 09:29 AM
-- Server version: 5.7.26-29-log
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aladhan`
--
CREATE DATABASE IF NOT EXISTS `aladhan` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `aladhan`;

-- --------------------------------------------------------

--
-- Table structure for table `address_geolocate_invalid`
--

CREATE TABLE `address_geolocate_invalid` (
  `id` int(25) NOT NULL,
  `query` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `address_geolocate_queries`
--

CREATE TABLE `address_geolocate_queries` (
  `id` int(50) NOT NULL,
  `address` varchar(999) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(25) UNSIGNED NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `countryiso` char(2) DEFAULT '',
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `admin1code` varchar(20) DEFAULT NULL,
  `admin2code` varchar(80) DEFAULT NULL,
  `admin3code` varchar(20) DEFAULT NULL,
  `admin4code` varchar(20) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `iso` char(2) COLLATE utf8_bin NOT NULL,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  `printable_name` varchar(80) COLLATE utf8_bin NOT NULL,
  `iso3` char(3) COLLATE utf8_bin DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `geolocate`
--

CREATE TABLE `geolocate` (
  `id` int(25) NOT NULL,
  `countryiso` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cityabbr` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `stateabbr` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `timezonename` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `geolocate_queries`
--

CREATE TABLE `geolocate_queries` (
  `id` int(25) NOT NULL,
  `city` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `geolocate_queries_invalid`
--

CREATE TABLE `geolocate_queries_invalid` (
  `id` int(25) UNSIGNED NOT NULL,
  `city` varchar(500) DEFAULT NULL,
  `state` varchar(500) DEFAULT NULL,
  `country` varchar(500) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `countryiso` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `occupied` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `fips_state` varchar(255) DEFAULT NULL,
  `assoc_press` varchar(255) DEFAULT NULL,
  `standard_federal_region` varchar(255) DEFAULT NULL,
  `census_region` varchar(255) DEFAULT NULL,
  `census_region_name` varchar(255) DEFAULT NULL,
  `census_division` varchar(255) DEFAULT NULL,
  `census_division_name` varchar(255) DEFAULT NULL,
  `circuit_court` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timezone`
--

CREATE TABLE `timezone` (
  `id` int(50) UNSIGNED NOT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `timezone` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_geolocate_invalid`
--
ALTER TABLE `address_geolocate_invalid`
  ADD PRIMARY KEY (`id`),
  ADD KEY `query` (`query`);

--
-- Indexes for table `address_geolocate_queries`
--
ALTER TABLE `address_geolocate_queries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address` (`address`(255));

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countryiso` (`countryiso`),
  ADD KEY `admin1code` (`admin1code`),
  ADD KEY `timezone` (`timezone`);
ALTER TABLE `city` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`iso`),
  ADD KEY `name` (`name`),
  ADD KEY `printable_name` (`printable_name`),
  ADD KEY `iso3` (`iso3`);

--
-- Indexes for table `geolocate`
--
ALTER TABLE `geolocate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_and_iso` (`country`,`countryiso`),
  ADD KEY `city_and_abbr` (`cityabbr`,`city`),
  ADD KEY `city` (`city`),
  ADD KEY `cityabbr` (`cityabbr`),
  ADD KEY `country` (`country`),
  ADD KEY `countryiso` (`countryiso`);
ALTER TABLE `geolocate` ADD FULLTEXT KEY `city_state_country` (`city`,`state`,`country`);
ALTER TABLE `geolocate` ADD FULLTEXT KEY `all` (`city`,`cityabbr`,`country`,`countryiso`);

--
-- Indexes for table `geolocate_queries`
--
ALTER TABLE `geolocate_queries`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `state` (`state`(255)),
  ADD KEY `city_country` (`city`,`country`),
  ADD KEY `country` (`country`),
  ADD KEY `city` (`city`);
ALTER TABLE `geolocate_queries` ADD FULLTEXT KEY `city_state_country` (`city`,`state`,`country`);

--
-- Indexes for table `geolocate_queries_invalid`
--
ALTER TABLE `geolocate_queries_invalid`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `geolocate_queries_invalid` ADD FULLTEXT KEY `csc` (`city`,`state`,`country`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD KEY `abbreviation` (`abbreviation`),
  ADD KEY `countryiso` (`countryiso`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `timezone`
--
ALTER TABLE `timezone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timezone` (`timezone`),
  ADD KEY `latitude_longitude` (`latitude`,`longitude`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_geolocate_invalid`
--
ALTER TABLE `address_geolocate_invalid`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `address_geolocate_queries`
--
ALTER TABLE `address_geolocate_queries`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(25) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `geolocate`
--
ALTER TABLE `geolocate`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `geolocate_queries`
--
ALTER TABLE `geolocate_queries`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `geolocate_queries_invalid`
--
ALTER TABLE `geolocate_queries_invalid`
  MODIFY `id` int(25) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timezone`
--
ALTER TABLE `timezone`
  MODIFY `id` int(50) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
