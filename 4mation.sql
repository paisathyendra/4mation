-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2017 at 02:31 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4mation`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_11_06_210809_create_votes_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sathyendra Pai', 'paisathyendra@gmail.com', '$2y$10$ViLW40X/Gu7SkB1nOzBMuORBWJsbYVyLumBWD3wOCBHsxFSffAPmu', 'Qsuv9twtCC5mRVIIdqsiw2eya1Ya9pLLF1mMRBroLad2KpdbUargJXUo9H0a', '2017-11-06 10:37:54', '2017-11-06 10:37:54'),
(2, 'Minion', 'minion@minion.com', '$2y$10$AO1q/3Ky6If5HvE/2q.7AuL5YEo2m1QzAkpjdLBq6YS5eCYX9toaO', '0IxVh2Iiu1LzGFILmIMQ9kAuCXgKBcvkFQfQ1FglRqWAeKYzS63osls7GxUn', '2017-11-06 11:23:33', '2017-11-06 11:23:33'),
(3, '4mation', '4mation@4mation.com', '$2y$10$DH22eMvmr.7tC8hRx4m88OYKR6GXhrFvIk08DZOmHJ/EnS2kc/2MK', NULL, '2017-11-06 13:36:45', '2017-11-06 13:36:45'),
(4, 'Minion 1', 'minion1@minion.com', '$2y$10$GvOIa3X1HQTw/sMqWlh59O8IaLM0i/OWu.2iNVBJd.Q8/16gsxGaC', NULL, '2017-11-06 14:30:47', '2017-11-06 14:30:47');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `joke_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vote` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `user_id`, `joke_id`, `vote`, `created_at`, `updated_at`) VALUES
(5, 1, 'DuhjnnJCQmKAeMECnYTJuA', 0, '2017-11-06 11:11:49', '2017-11-06 11:12:46'),
(6, 1, 'Vnx6otXNQD6W04saS5qZjA', 1, '2017-11-06 11:13:46', '2017-11-06 11:13:46'),
(7, 1, 'tnsit4iqsk2fe7ohwk1qgq', 1, '2017-11-06 11:16:26', '2017-11-06 11:16:26'),
(8, 2, 'tnsit4iqsk2fe7ohwk1qgq', 1, '2017-11-06 11:25:41', '2017-11-06 11:25:41'),
(9, 1, 'mwbg78xjQiGL5aEJHShqVw', 1, '2017-11-06 12:44:16', '2017-11-06 12:44:16'),
(10, 1, 'ztULFv21SDyoWxeD3gxUhw', 0, '2017-11-06 12:44:34', '2017-11-06 12:44:34'),
(11, 1, 'RT1fmqL_RFmpMkRd_qSzMA', 1, '2017-11-06 12:44:40', '2017-11-06 12:44:40'),
(12, 1, 'i0rm6AKzQL-o8PtUkcp4PA', 1, '2017-11-06 12:44:50', '2017-11-06 12:44:50'),
(13, 1, 'hbCl1mPLQHuKuZGij--jZA', 1, '2017-11-06 13:25:44', '2017-11-06 13:25:44'),
(14, 1, 'dJQ2OqkBQPqfksj9maoxYQ', 1, '2017-11-06 13:28:05', '2017-11-06 13:28:05'),
(15, 1, 'hy1jtzj8svq3mpr6pv6lfg', 1, '2017-11-06 13:28:11', '2017-11-06 13:28:11'),
(16, 1, '-gpz270mr76inxsqt3bzqa', 1, '2017-11-06 13:30:34', '2017-11-06 13:30:34'),
(17, 1, '11m4u2vyriuhrpbag0w7sa', 1, '2017-11-06 13:31:00', '2017-11-06 13:31:00'),
(18, 1, 'o-c_rdw5sweexosfwefcpg', 1, '2017-11-06 13:32:00', '2017-11-06 13:32:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
