-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 30, 2024 at 01:50 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommb2`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` float NOT NULL,
  `total_price` int NOT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT '0-cart|1-sold',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `unit_price`, `total_price`, `status`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1200, 12000, 0, NULL, '2024-11-23 16:56:00', '2024-11-23 16:56:00'),
(2, 1, 4, 1, 900, 4500, 0, NULL, '2024-11-23 17:04:28', '2024-11-23 17:04:28'),
(3, 3, 7, 1, 120, 2400, 0, NULL, '2024-11-23 18:53:39', '2024-11-23 18:53:39'),
(4, 3, 6, 1, 400, 3200, 0, NULL, '2024-11-23 18:54:11', '2024-11-23 18:54:11'),
(5, 3, 2, 1, 900, 13500, 0, NULL, '2024-11-23 18:54:23', '2024-11-23 18:54:23'),
(6, 2, 2, 1, 900, 13500, 0, NULL, '2024-11-23 19:08:03', '2024-11-23 19:08:03'),
(7, 2, 5, 1, 200, 2400, 0, NULL, '2024-11-23 19:17:33', '2024-11-23 19:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `product_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `base_price` float NOT NULL,
  `stocks` int NOT NULL,
  `unit_price` float NOT NULL,
  `total_price` float NOT NULL,
  `image_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='product inventory';

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_description`, `category_id`, `base_price`, `stocks`, `unit_price`, `total_price`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'Gaming PC Build', 'High-end gaming PC', 1, 800, 0, 1200, 12000, 'public/uploads/products/cpu.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(2, 'Mid-range Gaming PC', 'Balanced gaming PC', 1, 600, 15, 900, 13500, 'public/uploads/products/gpu.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(4, 'Graphics Card', 'NVIDIA RTX 3080', 2, 700, 5, 900, 4500, 'public/uploads/products/cpu.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(5, 'Motherboard', 'ASUS ROG Strix B550', 2, 150, 12, 200, 2400, 'public/uploads/products/ram.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(6, 'CPU', 'Intel Core i7-11700K', 2, 300, 8, 400, 3200, 'public/uploads/products/psu.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(7, 'RAM', 'Corsair Vengeance 16GB', 2, 80, 20, 120, 2400, 'public/uploads/products/ram.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(8, 'SSD', 'Samsung 970 EVO 1TB', 2, 120, 10, 180, 1800, 'public/uploads/products/cpu.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(9, 'HDD', 'Seagate Barracuda 2TB', 2, 50, 15, 80, 1200, 'public/uploads/products/mobo.png', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(10, 'Power Supply', 'Corsair 750W', 2, 90, 10, 130, 1300, 'public/uploads/products/gpu.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(11, 'Cooling System', 'Cooler Master Hyper 212', 2, 40, 25, 70, 1750, 'public/uploads/products/ram.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(12, 'PC Case', 'NZXT H510', 2, 70, 15, 110, 1650, 'public/uploads/products/psu.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(13, 'Monitor', 'Acer 24\" 144Hz', 3, 200, 7, 300, 2100, 'public/uploads/products/mobo.png', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(14, 'Keyboard', 'Logitech Mechanical', 3, 60, 20, 100, 2000, 'public/uploads/products/cpu.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(15, 'Mouse', 'Razer DeathAdder', 3, 40, 25, 80, 2000, 'public/uploads/products/gpu.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(16, 'Gaming Headset', 'HyperX Cloud II', 3, 50, 18, 90, 1620, 'public/uploads/products/gpu.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(17, 'Capture Card', 'Elgato HD60 S', 3, 150, 10, 220, 2200, 'public/uploads/products/psu.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(18, 'Webcam', 'Logitech C920', 3, 70, 12, 100, 1200, 'public/uploads/products/gpu.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(19, 'Microphone', 'Blue Yeti', 3, 120, 8, 180, 1440, 'public/uploads/products/ram.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(20, 'Router', 'TP-Link AC750', 4, 30, 25, 50, 1250, 'public/uploads/products/psu.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(21, 'USB Hub', 'Anker 7-Port', 4, 25, 30, 40, 1200, 'public/uploads/products/mobo.png', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(22, 'Gaming Chair', 'Secretlab Titan', 4, 300, 5, 450, 2250, 'public/uploads/products/ram.jpg', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(23, 'Desk', 'IKEA Gaming Desk', 4, 150, 10, 220, 2200, 'public/uploads/products/mobo.png', '2024-11-14 13:48:34', '2024-11-14 13:48:34'),
(24, 'House Plan', '  Belkin 12-Outlet  ', 3, 10000, 10, 600, 6000, 'public/uploads/products/2e184d1ebbe9eb35327568441848b39b.jpg', '2024-11-14 13:48:34', '2024-11-15 01:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `remarks` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `password`, `is_admin`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 'kherstien', 'khers@sdca.edu.ph', '$2y$10$H.yXWY53m0v75LqAZOzOve98inP2MK9gxxo.Hio0OKGF0Ib1Urcra', 0, NULL, '2024-11-14 23:03:31', '2024-11-14 23:03:31'),
(2, 'admin', 'admin', '$2y$10$SoizAsNbT96HjgglXhLf2eCFdwVg9IiYBFsNg3Xe2eyAPNaPBrzp6', 1, NULL, '2024-11-14 23:03:45', '2024-11-14 23:03:45'),
(3, 'Kimchi', 'kimchi@sdca', '$2y$10$aykdAf4bIgFoQGgxoykWw.K.pkxex0wA3UWKX3Kr/XEsY3OnUY/eq', 0, NULL, '2024-11-23 18:20:18', '2024-11-23 18:20:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
