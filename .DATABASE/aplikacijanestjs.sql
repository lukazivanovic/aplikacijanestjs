-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2020 at 06:30 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikacijanestjs`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `administrator_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`administrator_id`, `username`, `password_hash`) VALUES
(1, 'milantex', '18F94E0E8472D0558A8B2C8BC832C7D22B378B50DF8DA2F0AC1F34FB4AF4EC85392B2B41A956153D86E87F7547C1B19BC9808C3F9878202F063399975852165D'),
(2, 'test_user', 'password'),
(3, 'pperic', '6A4C0DC4FCC43BDEA28963DF73E4F8351BCDAE08FDA1516234E8D764AF8178A610BCCA2813D204DFF92A43F0511EB0016C7682CCF7B343D99E01739FC26EF104'),
(5, 'mmilic', '13A7C884739F3FD6DDFDE357B099343EEDBAD582EA74A1351853C2F21E1B1C3A7A3DBBB214D7A2CCD45ED8026911603FCB84C754A5546411D426A165F6E461FB'),
(7, 'admin', '7FCF4BA391C48784EDDE599889D6E3F1E47A27DB36ECC050CC92F259BFAC38AFAD2C68A1AE804D77075E8FB722503F3ECA2B2C1006EE6F6C7B7628CB45FFFD1D'),
(8, 'test', 'EE26B0DD4AF7E749AA1A8EE3C10AE9923F618980772E473F8819A5D4940E0DB27AC185F8A0E1D5F84F88BC887FD67B143732C304CC5FA9AD8E6F57F50028A8FF');

-- --------------------------------------------------------

--
-- Table structure for table `administrator_token`
--

CREATE TABLE `administrator_token` (
  `administrator_token_id` int(10) UNSIGNED NOT NULL,
  `administrator_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `token` text COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_valid` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `excerpt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('available','visible','hidden') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `is_promoted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `name`, `category_id`, `excerpt`, `description`, `status`, `is_promoted`, `created_at`) VALUES
(1, 'ACME HDD 512GB', 5, 'Kratak opis...', 'Detaljan opis...', 'available', 0, '2020-08-17 13:46:40'),
(2, 'ACME HD11 1024GB', 5, 'Neki kratak tekst 2...', 'Neki malo duzi tekst o proizvodu 2.', 'visible', 1, '2020-08-17 15:49:20'),
(3, 'ACME 3345', 3, 'Ovde je kratak opis...', 'Detaljan opis laptopa je ovde...', 'available', 0, '2020-08-21 09:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `article_feature`
--

CREATE TABLE `article_feature` (
  `article_feature_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `feature_id` int(10) UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_feature`
--

INSERT INTO `article_feature` (`article_feature_id`, `article_id`, `feature_id`, `value`) VALUES
(1, 1, 1, '512GB'),
(2, 1, 2, 'SATA 3.0'),
(3, 1, 3, 'SSD'),
(4, 2, 1, '1TB'),
(5, 2, 3, 'SSD'),
(6, 3, 7, 'ACME'),
(7, 3, 8, '15.6\"'),
(8, 3, 9, 'Bez OS');

-- --------------------------------------------------------

--
-- Table structure for table `article_price`
--

CREATE TABLE `article_price` (
  `article_price_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_price`
--

INSERT INTO `article_price` (`article_price_id`, `article_id`, `price`, `created_at`) VALUES
(1, 1, '45.00', '2020-08-17 14:00:00'),
(2, 1, '43.56', '2020-08-17 14:00:08'),
(3, 2, '56.89', '2020-08-17 15:49:20'),
(4, 2, '57.11', '2020-08-19 12:43:51'),
(5, 3, '340.00', '2020-08-21 09:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `created_at`) VALUES
(1, 1, '2020-08-19 20:38:36'),
(2, 1, '2020-08-19 20:42:42'),
(3, 1, '2020-08-19 21:39:51'),
(4, 1, '2020-08-21 12:38:50'),
(5, 1, '2020-08-21 13:44:45'),
(6, 1, '2020-08-21 13:47:28'),
(7, 1, '2020-08-21 13:51:21'),
(8, 1, '2020-08-21 14:05:28'),
(9, 1, '2020-08-21 14:26:27'),
(10, 1, '2020-08-21 14:34:35'),
(11, 4, '2020-08-21 14:38:28'),
(12, 4, '2020-08-21 14:41:07');

-- --------------------------------------------------------

--
-- Table structure for table `cart_article`
--

CREATE TABLE `cart_article` (
  `cart_article_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_article`
--

INSERT INTO `cart_article` (`cart_article_id`, `cart_id`, `article_id`, `quantity`) VALUES
(1, 1, 1, 4),
(2, 2, 2, 1),
(3, 3, 2, 2),
(4, 4, 1, 3),
(5, 4, 2, 1),
(6, 5, 2, 1),
(7, 5, 1, 3),
(8, 6, 2, 2),
(9, 6, 1, 3),
(10, 7, 2, 1),
(11, 7, 1, 2),
(12, 8, 1, 3),
(13, 8, 2, 2),
(14, 9, 2, 3),
(15, 9, 1, 2),
(16, 10, 1, 2),
(17, 10, 2, 1),
(18, 11, 2, 3),
(19, 11, 1, 2),
(20, 12, 1, 2),
(21, 12, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent__category_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `image_path`, `parent__category_id`) VALUES
(1, 'Računarske komponente', 'assets/pc.jpg', NULL),
(2, 'Kućna elektronika', 'assets/home.jpg', NULL),
(3, 'Laptop računari', 'assets/pc/laptop.jpg', 1),
(4, 'Memorijski mediji', 'assets/pc/memory.jpg', 1),
(5, 'Hard diskovi', 'assets/pc/memory/hdd.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `feature`
--

CREATE TABLE `feature` (
  `feature_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feature`
--

INSERT INTO `feature` (`feature_id`, `name`, `category_id`) VALUES
(8, 'Dijagonala ekrana', 3),
(1, 'Kapacitet', 5),
(4, 'Napon', 2),
(9, 'Operativni sistem', 3),
(6, 'Proizvodjac', 2),
(7, 'Proizvodjac', 3),
(5, 'Snaga', 2),
(3, 'Tehnologija', 5),
(2, 'Tip', 5);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `cart_id` int(10) UNSIGNED NOT NULL,
  `status` enum('rejected','accepted','shipped','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `created_at`, `cart_id`, `status`) VALUES
(1, '2020-08-19 20:42:17', 1, 'shipped'),
(3, '2020-08-19 21:39:35', 2, 'pending'),
(4, '2020-08-19 21:40:31', 3, 'pending'),
(5, '2020-08-21 12:40:50', 4, 'rejected'),
(6, '2020-08-21 13:45:48', 5, 'accepted'),
(7, '2020-08-21 13:48:21', 6, 'pending'),
(8, '2020-08-21 14:01:33', 7, 'pending'),
(9, '2020-08-21 14:12:32', 8, 'pending'),
(10, '2020-08-21 14:26:50', 9, 'pending'),
(11, '2020-08-21 14:34:47', 10, 'pending'),
(12, '2020-08-21 14:38:56', 11, 'pending'),
(13, '2020-08-21 14:41:26', 12, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `photo_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `image_path` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`photo_id`, `article_id`, `image_path`) VALUES
(1, 1, 'images/1/front.jpg'),
(2, 1, 'images/1/label.jpg'),
(5, 2, '2020818-1447346854-hard-disk-slika.jpg'),
(6, 2, '2020818-7534167365-hard-disk-slika-2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forename` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_address` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password_hash`, `forename`, `surname`, `phone_number`, `postal_address`) VALUES
(1, 'test@test.rs', '8D2F4D9C7F87141F0810F1ACD6C0462FF0319BB049AA88EA4E310649628091DE316CF1392E19AF4F0A327826545F63E4E969838F5E7D572A475DE3255B738ACA', 'Pera', 'Peric', '+381669999999', 'Nepoznata adresa bb, Glavna Luka, Nedodjija'),
(4, 'test123@test.rs', 'C70B5DD9EBFB6F51D09D4132B7170C9D20750A7852F00680F65658F0310E810056E6763C34C9A00B0E940076F54495C169FC2302CCEB312039271C43469507DC', 'Milan', 'Milanovic', '+381113000000', 'Nova adresa bb, Glavna Luka, Nedodjija');

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `user_token_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `token` text COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_valid` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`user_token_id`, `user_id`, `created_at`, `token`, `expires_at`, `is_valid`) VALUES
(1, 1, '2020-08-21 17:27:49', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMDcwOTI2OS40MzQsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjMiLCJpYXQiOjE1OTgwMzA4Njl9.ydTmiQgjt8c022ZOrMAGooXbqpcvewkr5-gOFFOrWlo', '2020-09-21 17:27:49', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`administrator_id`),
  ADD UNIQUE KEY `uq_administrator_username` (`username`);

--
-- Indexes for table `administrator_token`
--
ALTER TABLE `administrator_token`
  ADD PRIMARY KEY (`administrator_token_id`),
  ADD KEY `fk_administrator_token_administrator_id` (`administrator_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `fk_article_category_id` (`category_id`);

--
-- Indexes for table `article_feature`
--
ALTER TABLE `article_feature`
  ADD PRIMARY KEY (`article_feature_id`),
  ADD UNIQUE KEY `uq_article_feature_article_id_feature_id` (`article_id`,`feature_id`) USING BTREE,
  ADD KEY `fk_article_feature_feature_id` (`feature_id`);

--
-- Indexes for table `article_price`
--
ALTER TABLE `article_price`
  ADD PRIMARY KEY (`article_price_id`),
  ADD KEY `fk_article_price_article_id` (`article_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `fk_cart_user_id` (`user_id`);

--
-- Indexes for table `cart_article`
--
ALTER TABLE `cart_article`
  ADD PRIMARY KEY (`cart_article_id`),
  ADD UNIQUE KEY `uq_cart_article_cart_id_article_id` (`cart_id`,`article_id`) USING BTREE,
  ADD KEY `fk_cart_article_article_id` (`article_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `uq_category_name` (`name`),
  ADD UNIQUE KEY `uq_category_image_path` (`image_path`),
  ADD KEY `fk_category_parent__category_id` (`parent__category_id`);

--
-- Indexes for table `feature`
--
ALTER TABLE `feature`
  ADD PRIMARY KEY (`feature_id`),
  ADD UNIQUE KEY `uq_feature_name_category_id` (`name`,`category_id`),
  ADD KEY `fk_feature_category_id` (`category_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `uq_order_cart_id` (`cart_id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photo_id`),
  ADD UNIQUE KEY `uq_photo_image_path` (`image_path`) USING BTREE,
  ADD KEY `fk_photo_article_id` (`article_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uq_user_email` (`email`),
  ADD UNIQUE KEY `uq_user_phone_number` (`phone_number`) USING BTREE;

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`user_token_id`),
  ADD KEY `fk_user_token` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `administrator_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `administrator_token`
--
ALTER TABLE `administrator_token`
  MODIFY `administrator_token_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `article_feature`
--
ALTER TABLE `article_feature`
  MODIFY `article_feature_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `article_price`
--
ALTER TABLE `article_price`
  MODIFY `article_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart_article`
--
ALTER TABLE `cart_article`
  MODIFY `cart_article_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feature`
--
ALTER TABLE `feature`
  MODIFY `feature_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `photo_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `user_token_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator_token`
--
ALTER TABLE `administrator_token`
  ADD CONSTRAINT `fk_administrator_token_administrator_id` FOREIGN KEY (`administrator_id`) REFERENCES `administrator` (`administrator_id`) ON UPDATE CASCADE;

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE;

--
-- Constraints for table `article_feature`
--
ALTER TABLE `article_feature`
  ADD CONSTRAINT `fk_article_feature_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_article_feature_feature_id` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`) ON UPDATE CASCADE;

--
-- Constraints for table `article_price`
--
ALTER TABLE `article_price`
  ADD CONSTRAINT `fk_article_price_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `cart_article`
--
ALTER TABLE `cart_article`
  ADD CONSTRAINT `fk_cart_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cart_article_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_category_parent__category_id` FOREIGN KEY (`parent__category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE;

--
-- Constraints for table `feature`
--
ALTER TABLE `feature`
  ADD CONSTRAINT `fk_feature_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON UPDATE CASCADE;

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `fk_photo_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_token`
--
ALTER TABLE `user_token`
  ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
