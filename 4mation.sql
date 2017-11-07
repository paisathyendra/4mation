-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2017 at 10:43 AM
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
(4, 'Minion 1', 'minion1@minion.com', '$2y$10$GvOIa3X1HQTw/sMqWlh59O8IaLM0i/OWu.2iNVBJd.Q8/16gsxGaC', 'pOS80SsEh85lsFBse9qk0X4zK0tWApKTrd1RFNubUSnbQZTnyRlGJUPnZAYs', '2017-11-06 14:30:47', '2017-11-06 14:30:47'),
(5, 'Minion 2', 'minon2@minion.com', '$2y$10$AaHnZxrLFf8CkJ5MByF7sOAP7UKv7RcLYxM/Yl47mWNu9UdBJ6IR6', 'KDAyj8SZfCi5cUM0eaTNI3ZTUcQf3Qyww8PCyKRDkyErRA4eTloRcsHlosU6', '2017-11-06 19:15:00', '2017-11-06 19:15:00');

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
(5, 1, 'DuhjnnJCQmKAeMECnYTJuA', 1, '2017-11-06 11:11:49', '2017-11-06 17:01:29'),
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
(18, 1, 'o-c_rdw5sweexosfwefcpg', 1, '2017-11-06 13:32:00', '2017-11-06 13:32:00'),
(19, 4, 'YBSAEmO1RrywsHuZicgeWQ', 1, '2017-11-06 14:39:08', '2017-11-06 14:39:08'),
(20, 4, 'kb43vo_4rtoladsdlnnpsq', 1, '2017-11-06 14:39:19', '2017-11-06 14:39:19'),
(21, 4, 'MBPBtN2lTcGOR1iPKzdIww', 1, '2017-11-06 14:39:32', '2017-11-06 14:39:32'),
(22, 4, 'F7-BAalaQvezJS2vg6JQGA', 0, '2017-11-06 14:39:38', '2017-11-06 14:39:38'),
(23, 4, '1r6gj1LTQrmQj7kHCz-_DA', 1, '2017-11-06 14:40:20', '2017-11-06 14:40:20'),
(24, 4, 'mHaLxKzVRjiBLgE1KhEZ_g', 1, '2017-11-06 14:40:32', '2017-11-06 14:40:32'),
(25, 4, 'OxCh_hnCTsGj20G51rMnnA', 1, '2017-11-06 14:55:42', '2017-11-06 14:55:42'),
(26, 4, 'CzC0vnCMSry1IU0Re_0ucg', 0, '2017-11-06 14:55:48', '2017-11-06 14:55:48'),
(27, 4, 'yjJMu6nBRGW0Gfad6mh5Gg', 1, '2017-11-06 14:55:54', '2017-11-06 14:55:54'),
(28, 4, 'jomxhrZtTQaJT6QhvJu5FQ', 1, '2017-11-06 14:56:01', '2017-11-06 14:56:01'),
(29, 4, 'tnsit4iqsk2fe7ohwk1qgq', 1, '2017-11-06 15:46:26', '2017-11-06 15:46:26'),
(30, 1, 'TwLtg7nJQ7i6FnJE9fVwag', 1, '2017-11-06 16:30:50', '2017-11-06 16:30:50'),
(31, 1, 'md-bld8orjsv5mgfsun-xq', 1, '2017-11-06 16:53:02', '2017-11-06 16:53:02'),
(32, 1, 'GzQ6j6hQRQOGL-Uj0doXwQ', 0, '2017-11-06 16:53:24', '2017-11-06 16:53:24'),
(33, 5, 'tnsit4iqsk2fe7ohwk1qgq', 0, '2017-11-06 19:17:10', '2017-11-06 19:18:08'),
(34, 1, 'MqHJfvfvTyqsap3tWwmU-Q', 1, '2017-11-06 22:32:22', '2017-11-06 22:32:22');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
