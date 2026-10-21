-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2026 at 09:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paradyze`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(30) NOT NULL DEFAULT '',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_item_id`, `customer_id`, `product_id`, `size`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 4, 6, 'S', 1, '2026-07-10 08:09:37', '2026-07-10 08:09:37'),
(2, 4, 8, 'M', 1, '2026-07-10 08:09:37', '2026-07-10 08:09:37'),
(3, 5, 1, 'L', 1, '2026-07-10 08:09:37', '2026-07-10 08:09:37'),
(4, 6, 4, 'M', 2, '2026-07-10 08:09:37', '2026-07-10 08:09:37'),
(5, 7, 13, 'M', 1, '2026-07-10 09:40:20', '2026-07-10 09:40:20');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Dresses'),
(2, 'Tops'),
(3, 'Skirts'),
(4, 'Shorts'),
(5, 'Pants');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `user_id`, `phone`, `address`, `status`) VALUES
(1, 1, '0771234567', '123 Main Street, Colombo 05', 'active'),
(2, 2, '0762345678', '45 Galle Road, Mount Lavinia', 'active'),
(3, 3, '0713456789', '78 Union Place, Colombo 02', 'active'),
(4, 7, '0771234567', '25 Galle Road, Colombo 03', 'active'),
(5, 8, '0762345678', '18 Temple Street, Kandy', 'active'),
(6, 9, '0713456789', '42 Lighthouse Road, Galle', 'active'),
(7, 10, NULL, NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `reorder_level` int(11) DEFAULT 10,
  `supplier_id` int(11) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `product_id`, `quantity`, `reorder_level`, `supplier_id`, `last_updated`) VALUES
(2, 1, 16, 10, NULL, '2026-07-12 07:03:02'),
(3, 2, 8, 10, NULL, '2026-07-10 11:26:22'),
(5, 4, 15, 10, NULL, '2026-07-10 11:26:22'),
(6, 5, 8, 10, NULL, '2026-07-10 11:26:22'),
(7, 6, 19, 10, NULL, '2026-07-12 07:03:05'),
(8, 7, 0, 10, NULL, '2026-07-10 11:26:22'),
(9, 8, 25, 10, NULL, '2026-07-10 11:26:22'),
(12, 11, 10, 10, NULL, '2026-07-10 11:26:22'),
(13, 12, 14, 10, NULL, '2026-07-10 11:26:22'),
(14, 13, 6, 10, NULL, '2026-07-10 11:26:22');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `subscriber_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subscribed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newsletter_subscribers`
--

INSERT INTO `newsletter_subscribers` (`subscriber_id`, `email`, `subscribed_at`) VALUES
(1, 'nethmi.customer@paradyze.test', '2026-07-10 08:09:54'),
(2, 'kavindu.customer@paradyze.test', '2026-07-10 08:09:54'),
(3, 'shenali.customer@paradyze.test', '2026-07-10 08:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('Pending','Processing','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `total_amount`, `status`, `order_date`) VALUES
(1, 1, 3200.00, 'Delivered', '2025-10-06 05:00:00'),
(2, 2, 2200.00, 'Pending', '2025-10-08 08:50:00'),
(3, 3, 4500.00, 'Processing', '2025-10-09 04:15:00'),
(4, 1, 1800.00, 'Pending', '2025-10-10 10:45:00'),
(5, 2, 5600.00, 'Delivered', '2025-10-11 05:30:00'),
(6, 4, 7800.00, 'Delivered', '2026-06-20 05:00:00'),
(8, 6, 4700.00, 'Shipped', '2026-07-04 04:10:00'),
(9, 4, 5700.00, 'Delivered', '2026-06-28 10:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(1, 1, 1, 2, 2500.00),
(2, 2, 2, 1, 3500.00),
(3, 6, 4, 1, 2800.00),
(4, 6, 1, 1, 4500.00),
(6, 8, 13, 1, 4200.00),
(7, 9, 12, 2, 2600.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_item_options`
--

CREATE TABLE `order_item_options` (
  `item_id` int(11) NOT NULL,
  `size` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_item_options`
--

INSERT INTO `order_item_options` (`item_id`, `size`) VALUES
(3, 'M'),
(4, 'S'),
(6, 'L'),
(7, 'M');

-- --------------------------------------------------------

--
-- Table structure for table `order_shipping`
--

CREATE TABLE `order_shipping` (
  `order_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `payment_method` enum('cod','bank','card') NOT NULL DEFAULT 'cod',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT 500.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_shipping`
--

INSERT INTO `order_shipping` (`order_id`, `full_name`, `email`, `phone`, `address`, `city`, `postal_code`, `payment_method`, `shipping_fee`) VALUES
(6, 'Nethmi Perera', 'nethmi.customer@paradyze.test', '0771234567', '25 Galle Road', 'Colombo 03', '00300', 'card', 500.00),
(8, 'Shenali Fernando', 'shenali.customer@paradyze.test', '0713456789', '42 Lighthouse Road', 'Galle', '80000', 'bank', 500.00),
(9, 'Nethmi Perera', 'nethmi.customer@paradyze.test', '0771234567', '25 Galle Road', 'Colombo 03', '00300', 'cod', 500.00);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `reset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token_hash` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category` enum('Dresses','Tops','Skirts','Shorts','Pants') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `tagline` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sizes` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `category`, `price`, `stock`, `status`, `tagline`, `description`, `sizes`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Summer Vacay Dress', 'Skirts', 200.00, 16, 'Inactive', 'Twfffffee22', 'Beautiful paisley pattern skirt with comfortable fit and elegant drape.', 'XS,S,M,L,XL', '2026-06-19 18:10:30', '2026-07-12 07:03:02', 'Assets/products/0068.JPG'),
(2, 'Summer Vacay Dress', 'Dresses', 1000.00, 8, 'Inactive', 'Basking in the beauty of neutral hues.', 'Lightweight and breezy dress perfect for summer vacations.', 'XS,S,M,L,XL', '2026-06-19 18:10:30', '2026-07-12 07:01:32', 'Assets/products/0182.JPG'),
(4, 'Paisley Skirt', 'Skirts', 3200.00, 15, 'Inactive', 'Elegant Style', 'Floral printed skirt', 'S,M,L', '2026-07-08 19:27:03', '2026-07-12 07:01:41', 'paisley_skirt.jpg'),
(5, 'Summer Vacay Dress', 'Dresses', 4500.00, 8, 'Active', 'Summer Collection', 'Lightweight floral dress', 'S,M,L', '2026-07-08 19:27:03', '2026-07-08 19:27:03', 'summer_dress.jpg'),
(6, 'Athena Strap Top', 'Tops', 2800.00, 19, 'Inactive', 'Classic Look', 'Comfortable cotton top', 'S,M,L', '2026-07-08 19:27:03', '2026-07-12 07:03:05', 'athena_top.jpg'),
(7, 'Full Strap Dress', 'Dresses', 5000.00, 0, 'Active', 'Party Wear', 'Elegant evening dress', 'M,L', '2026-07-08 19:27:03', '2026-07-08 19:27:03', 'strap_dress.jpg'),
(8, 'Chic Ruffle Skirt', 'Skirts', 3500.00, 25, 'Active', 'New Arrival', 'Layered ruffle skirt', 'S,M,L', '2026-07-08 19:27:03', '2026-07-08 19:27:03', 'ruffle_skirt.jpg'),
(11, 'Victoria Tiered Dress', 'Dresses', 5200.00, 10, 'Active', 'Premium Collection', 'Tiered maxi dress', 'S,M,L', '2026-07-08 19:27:03', '2026-07-08 19:27:03', 'victoria_dress.jpg'),
(12, 'Emerald Chic Short', 'Shorts', 2600.00, 14, 'Inactive', 'Comfort Wear', 'Cotton casual shorts', 'S,M,L', '2026-07-08 19:27:03', '2026-07-12 07:02:21', 'emerald_short.jpg'),
(13, 'Luxe Flow Wide-Leg Pants', 'Pants', 4200.00, 6, 'Inactive', 'Office Collection', 'Wide-leg formal pants', 'M,L,XL', '2026-07-08 19:27:03', '2026-07-12 07:00:51', 'wideleg_pants.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `review_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `rating` tinyint(4) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `review_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`review_id`, `customer_id`, `product_id`, `order_id`, `rating`, `title`, `review_text`, `created_at`, `updated_at`) VALUES
(1, 4, 4, 6, 5, 'Beautiful and comfortable', 'The skirt fits well and the material feels very comfortable.', '2026-06-25 06:30:00', '2026-07-10 08:09:37'),
(2, 4, 12, 9, 4, 'Good casual shorts', 'Comfortable for everyday wear, but one item needed a stitching repair.', '2026-07-03 13:00:00', '2026-07-10 08:09:37');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `purchase_order_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `expected_delivery` date NOT NULL,
  `received_date` datetime DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('Pending','Approved','Received','Cancelled') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `purchase_order_item_id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reason` text DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `status` enum('Pending','Approved','Processing','Completed','Rejected') NOT NULL DEFAULT 'Pending',
  `refund_amount` decimal(10,2) DEFAULT NULL,
  `refund_method` varchar(50) DEFAULT NULL,
  `admin_notes` text DEFAULT NULL,
  `return_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `processed_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`return_id`, `order_id`, `reason`, `rejection_reason`, `status`, `refund_amount`, `refund_method`, `admin_notes`, `return_date`, `processed_date`) VALUES
(1, 1, 'Product size does not fit and customer requested exchange.', NULL, 'Approved', NULL, NULL, NULL, '2025-10-12 05:00:00', NULL),
(2, 3, 'Received a damaged product with minor fabric defects.', NULL, 'Approved', NULL, NULL, NULL, '2025-10-13 10:15:00', NULL),
(3, 5, 'Customer changed mind after delivery.', NULL, 'Rejected', NULL, NULL, NULL, '2025-10-14 03:50:00', NULL),
(4, 1, 'Wrong size received', NULL, 'Rejected', NULL, NULL, NULL, '2026-07-10 06:49:37', NULL),
(5, 2, 'Product was damaged', NULL, 'Approved', NULL, NULL, NULL, '2026-07-10 06:49:37', NULL),
(6, 3, 'Customer changed their mind', NULL, 'Approved', NULL, NULL, NULL, '2026-07-10 06:49:37', NULL),
(7, 4, 'Incorrect product delivered', NULL, 'Rejected', NULL, NULL, NULL, '2026-07-10 06:49:37', NULL),
(8, 6, 'The Summer Vacay Dress was smaller than expected.', NULL, 'Pending', NULL, NULL, NULL, '2026-07-01 04:30:00', NULL),
(9, 9, 'One pair of shorts had a minor stitching defect.', NULL, 'Approved', NULL, NULL, NULL, '2026-07-05 09:50:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `user_id`, `department`, `phone`, `status`) VALUES
(2, 13, 'op', '0726906551', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_code` varchar(30) NOT NULL,
  `supplier_name` varchar(120) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `products_supplied` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','operation_manager','marketing_manager','store_manager','warehouse_staff','customer') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Administrator', 'admin@paradyze.com', 'PASTE_GENERATED_HASH_HERE', 'admin', '2026-06-11 17:45:25'),
(2, 'R. Wickramasekara', 'r.wickramasekara@email.com', '123456', 'customer', '2026-07-08 18:35:43'),
(3, 'S. Perera', 's.perera@email.com', '123456', 'customer', '2026-07-08 18:35:43'),
(4, 'D. Silva', 'd.silva@email.com', '123456', 'customer', '2026-07-08 18:35:43'),
(7, 'Nethmi Perera', 'nethmi.customer@paradyze.test', '$2y$12$n0A7jG48oJ6v0rxnWZrSleuKNuPIhthrNtZEXZF9ZLkRPuNMLa3n6', 'customer', '2026-07-10 08:04:59'),
(8, 'Kavindu Silva', 'kavindu.customer@paradyze.test', '$2y$12$n0A7jG48oJ6v0rxnWZrSleuKNuPIhthrNtZEXZF9ZLkRPuNMLa3n6', 'customer', '2026-07-10 08:05:06'),
(9, 'Shenali Fernando', 'shenali.customer@paradyze.test', '$2y$12$n0A7jG48oJ6v0rxnWZrSleuKNuPIhthrNtZEXZF9ZLkRPuNMLa3n6', 'customer', '2026-07-10 08:05:12'),
(10, 'akaza', 'akaza@gmail.com', '$2y$10$d5DaDlsfZ.HTjtLTr8M/Q.AQRXO2R.CjC9AREqpHObzMhCgvfYoKu', 'customer', '2026-07-10 09:36:05'),
(11, 'Admin User', 'admin@gmail.com', '$2y$10$lTXCrOySUZEE7vWRPpoVU.UXua7l1AnsWyOroT8YzI9Fu9g4WDJja', 'admin', '2026-07-10 11:35:47'),
(12, 'Admin1 User', 'admin1@gmail.com', '$2y$10$NSoXNULLkmTwmnwuFzsDGuRfH6vqt.K//kzcZKERkjUZi8Hz5BYFG', 'admin', '2026-07-12 06:59:36'),
(13, 'Vidusha Navod', 'navod6733@gmail.com', '$2y$10$jveNV/1m94L.uc04UtG5Z.lJewpFq4iNRiu5ThplbG3K75o/5VXvi', 'store_manager', '2026-07-12 07:12:24');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `customer_id`, `product_id`, `created_at`) VALUES
(1, 4, 13, '2026-07-10 08:09:54'),
(2, 4, 1, '2026-07-10 08:09:54'),
(3, 5, 4, '2026-07-10 08:09:54'),
(4, 5, 12, '2026-07-10 08:09:54'),
(5, 6, 6, '2026-07-10 08:09:54'),
(7, 7, 12, '2026-07-10 09:40:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD UNIQUE KEY `uq_cart_product_size` (`customer_id`,`product_id`,`size`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD UNIQUE KEY `uq_inventory_product` (`product_id`),
  ADD KEY `fk_inventory_supplier_fixed` (`supplier_id`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`subscriber_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_item_options`
--
ALTER TABLE `order_item_options`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `order_shipping`
--
ALTER TABLE `order_shipping`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`reset_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD UNIQUE KEY `uq_customer_product_review` (`customer_id`,`product_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`purchase_order_id`),
  ADD KEY `fk_po_supplier` (`supplier_id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`purchase_order_item_id`),
  ADD KEY `fk_poi_order` (`purchase_order_id`),
  ADD KEY `fk_poi_product` (`product_id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `supplier_code` (`supplier_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD UNIQUE KEY `uq_wishlist_customer_product` (`customer_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `subscriber_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `reset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `purchase_order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `purchase_order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk_inventory_product_fixed` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_inventory_supplier_fixed` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `order_item_options`
--
ALTER TABLE `order_item_options`
  ADD CONSTRAINT `order_item_options_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `order_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_shipping`
--
ALTER TABLE `order_shipping`
  ADD CONSTRAINT `order_shipping_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;

--
-- Constraints for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD CONSTRAINT `password_reset_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE SET NULL;

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `fk_po_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Constraints for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD CONSTRAINT `fk_poi_order` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`purchase_order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_poi_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `returns`
--
ALTER TABLE `returns`
  ADD CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
