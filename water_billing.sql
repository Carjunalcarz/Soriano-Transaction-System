-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2022 at 01:21 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `water_billing`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(9, 'Water Billing ', '', 1, 0, '2022-02-21 00:53:22', NULL),
(10, 'Barangay Clearance', '', 1, 0, '2022-02-21 00:53:38', NULL),
(12, 'Cedula', '', 1, 0, '2022-02-21 00:57:49', NULL),
(13, 'Barangay Cost', 'Barangay Enhancement', 1, 0, '2022-02-21 02:17:32', NULL),
(14, 'Piso Wifi', '', 1, 0, '2022-02-21 02:43:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_history`
--

CREATE TABLE `payment_history` (
  `id` int(30) NOT NULL,
  `transaction_id` int(30) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_history`
--

INSERT INTO `payment_history` (`id`, `transaction_id`, `amount`, `date_created`, `date_updated`) VALUES
(42, 28, 0, '2022-02-21 11:19:47', NULL),
(43, 28, 9500, '2022-02-21 11:20:33', NULL),
(44, 29, 0, '2022-02-21 11:24:00', NULL),
(45, 29, 100, '2022-02-21 11:24:15', NULL),
(46, 30, 0, '2022-03-02 10:09:14', NULL),
(47, 30, 100, '2022-03-02 10:10:13', NULL),
(48, 30, 88, '2022-03-02 10:11:09', NULL),
(49, 30, 22, '2022-03-02 10:11:21', NULL),
(50, 31, 0, '2022-03-02 10:43:23', NULL),
(51, 31, 210, '2022-03-02 10:43:31', NULL),
(52, 32, 0, '2022-03-02 14:01:48', NULL),
(53, 33, 0, '2022-03-02 14:07:57', NULL),
(54, 34, 0, '2022-03-02 16:45:57', NULL),
(55, 33, 210, '2022-03-02 16:47:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `price_list`
--

CREATE TABLE `price_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `size` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `price_list`
--

INSERT INTO `price_list` (`id`, `category_id`, `size`, `price`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(17, 9, '', 10, 1, 0, '2022-02-21 00:53:51', NULL),
(18, 10, '', 120, 1, 0, '2022-02-21 00:54:02', '2022-02-21 02:32:09'),
(20, 12, '', 100, 1, 0, '2022-02-21 00:57:58', NULL),
(21, 13, '', 1000, 1, 0, '2022-02-21 02:17:53', NULL),
(22, 14, '', 9500, 1, 1, '2022-02-21 02:43:22', '2022-02-21 11:31:29');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Barangay Soriano Transaction Record System'),
(6, 'short_name', 'Soriano TRS'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(25, 'logo', 'uploads/logo-1234545.png'),
(26, 'cover', 'uploads/cover-123456744.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_items`
--

CREATE TABLE `transaction_items` (
  `transaction_id` int(30) NOT NULL,
  `price_id` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `quantity` float NOT NULL DEFAULT 0,
  `or_number` varchar(255) NOT NULL,
  `total` float NOT NULL DEFAULT 0,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_items`
--

INSERT INTO `transaction_items` (`transaction_id`, `price_id`, `price`, `quantity`, `or_number`, `total`, `date_updated`) VALUES
(29, 20, 100, 1, '', 100, '2022-02-21 11:24:00'),
(30, 17, 10, 10, '', 100, '2022-03-02 10:32:24'),
(30, 17, 10, 11, '', 110, '2022-03-02 10:32:24'),
(30, 17, 10, 12, '', 120, '2022-03-02 10:32:24'),
(31, 17, 10, 111, '', 1110, '2022-03-02 10:43:23'),
(28, 22, 9500, 1, '', 9500, '2022-03-02 10:52:49'),
(32, 20, 100, 1, '', 100, '2022-03-02 14:01:48'),
(34, 17, 10, 1, '', 10, '2022-03-02 16:45:57'),
(33, 17, 10, 10, '', 100, '2022-03-02 16:47:15'),
(33, 17, 10, 11, '', 110, '2022-03-02 16:47:15');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_list`
--

CREATE TABLE `transaction_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_name` text NOT NULL,
  `client_contact` text NOT NULL,
  `client_purpose` varchar(255) NOT NULL,
  `client_or` varchar(255) NOT NULL,
  `client_station` varchar(255) NOT NULL,
  `client_meter` varchar(255) NOT NULL,
  `client_address` text NOT NULL,
  `total_amount` float NOT NULL DEFAULT 0,
  `paid_amount` float NOT NULL DEFAULT 0,
  `balance` float NOT NULL DEFAULT 0,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Unpaid, 1=partially paid, 2= paid',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1= On-process, 2= done',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_list`
--

INSERT INTO `transaction_list` (`id`, `code`, `client_name`, `client_contact`, `client_purpose`, `client_or`, `client_station`, `client_meter`, `client_address`, `total_amount`, `paid_amount`, `balance`, `payment_status`, `status`, `date_created`, `date_updated`) VALUES
(28, '202202-00001', 'Guest', '09104422786', 'Brgy Clearance', '0873259', '', '', 'Brgy. Soriano Cabadbaran City', 9500, 9500, 0, 2, 0, '2022-02-21 11:19:47', '2022-03-02 10:52:49'),
(29, '202202-00002', 'Junberz L. Bermejo', '09152154', 'Cedula', '094545775', '', '', 'Brgy. Soriano Cabadbaran City', 100, 100, 0, 2, 0, '2022-02-21 11:24:00', '2022-03-02 10:43:06'),
(30, '202203-00001', 'Botitok', 'N/A', 'Water', 'N/A', '', '', 'Brgy. Soriano Cabadbaran City', 330, 210, 120, 1, 1, '2022-03-02 10:09:14', '2022-03-02 10:32:24'),
(31, '202203-00002', 'Guest', 'N/A', 'N/A', 'N/A', '', '', 'Brgy. Soriano Cabadbaran City', 1110, 210, 900, 1, 0, '2022-03-02 10:43:23', '2022-03-02 10:43:31'),
(32, '202203-00003', 'Guest', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Brgy. Soriano Cabadbaran City', 100, 0, 100, 0, 0, '2022-03-02 14:01:48', '2022-03-02 14:01:48'),
(33, '202203-00004', 'Aljun Cardona', '0191054', 'Water', 'N/A', '12', '5', 'Brgy. Soriano Cabadbaran City', 210, 210, 0, 2, 2, '2022-03-02 14:07:57', '2022-03-02 16:47:34'),
(34, '202203-00005', 'Guest', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Brgy. Soriano Cabadbaran City', 10, 0, 10, 0, 0, '2022-03-02 16:45:57', '2022-03-02 16:45:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1639468007', NULL, 1, 1, '2021-01-20 14:02:37', '2021-12-14 15:47:08'),
(7, 'Samantha', NULL, 'Lou', 'sam23', '45bff2a14658fc9b21c6e5e9bf75186b', 'uploads/avatar-7.png?v=1643180426', NULL, 2, 1, '2022-01-26 15:00:26', '2022-01-26 15:00:26'),
(8, 'Aljunx', NULL, 'Cardona', 'Aljun', '05fed005c83f8e9ad0258338b6aa9423', NULL, NULL, 2, 1, '2022-02-21 01:03:26', '2022-02-21 02:11:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `price_list`
--
ALTER TABLE `price_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `price_id` (`price_id`);

--
-- Indexes for table `transaction_list`
--
ALTER TABLE `transaction_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `price_list`
--
ALTER TABLE `price_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `transaction_list`
--
ALTER TABLE `transaction_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD CONSTRAINT `payment_history_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `price_list`
--
ALTER TABLE `price_list`
  ADD CONSTRAINT `price_list_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD CONSTRAINT `transaction_items_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_items_ibfk_2` FOREIGN KEY (`price_id`) REFERENCES `price_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
