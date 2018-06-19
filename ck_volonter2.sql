-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:8086
-- Generation Time: Jun 20, 2018 at 01:13 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ck_volonter2`
--

-- --------------------------------------------------------

--
-- Table structure for table `aktivnosts`
--

CREATE TABLE `aktivnosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `naziv` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mesto` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opis` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `datumOd` date NOT NULL,
  `datumDo` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aktivnosts`
--

INSERT INTO `aktivnosts` (`id`, `naziv`, `tip`, `mesto`, `opis`, `datumOd`, `datumDo`, `created_at`, `updated_at`) VALUES
(1, 'Trka za srecnije detinjstvo', 'Za decu', 'Stadion Gornji Milanovac', 'Obezbediti prvu pomoc', '2019-02-05', '2100-01-01', '2018-06-19 20:30:25', '2018-06-19 20:30:25'),
(2, 'Za suncanu jesen zivota', 'Za stare', 'Selo Gornji Milanovac', ' ', '2019-06-29', '2100-01-01', '2018-06-19 20:33:51', '2018-06-19 20:33:51'),
(3, 'Akcija dobrovoljnog davanja krvi', 'Humanitarna', 'Vrsac', 'sds', '2009-01-01', '2100-01-01', '2018-06-19 20:41:59', '2018-06-19 20:41:59'),
(4, 'Akcija dobrovoljnog davanja krvi', 'Humanitarna', 'Kraljevo', 'Pomoci radnicima transfuzije', '2018-06-30', '2100-01-01', '2018-06-19 20:43:02', '2018-06-19 20:43:02'),
(5, 'Dan borbe protiv side', 'Humanitarna preventivna', 'Uzice', 'sds', '2019-12-01', '2100-01-01', '2018-06-19 20:43:59', '2018-06-19 20:43:59'),
(6, 'Jedan paketic mnogo ljubavi', 'Humanitarna za decu', 'Krusevac', ' ', '2018-12-25', '2100-01-01', '2018-06-19 20:45:16', '2018-06-19 20:45:16'),
(7, 'Onkoloski besplatni pregledi', 'Zdravstveni preventivni', 'Beograd', ' ', '2018-02-01', '2100-01-01', '2018-06-19 20:46:14', '2018-06-19 20:46:14'),
(8, 'Leto na Djetinji', 'Zabavna', 'Uzice', ' ', '2018-07-30', '2100-01-01', '2018-06-19 20:46:46', '2018-06-19 20:46:46'),
(9, 'Plivanje za bogojavljenski krst', 'Pomoc spc', 'Surcin', ' ', '2019-01-19', '2100-01-01', '2018-06-19 20:47:37', '2018-06-19 20:47:37'),
(10, 'Drug za druga', 'Humanitarna', 'Vrsac', ' ', '2018-07-20', '2100-01-01', '2018-06-19 20:53:29', '2018-06-19 20:53:29');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(19, '2014_10_12_000000_create_users_table', 1),
(20, '2014_10_12_100000_create_password_resets_table', 1),
(21, '2018_05_30_140753_create_aktivnosts_table', 1),
(22, '2018_05_30_142245_create_obucenosts_table', 1),
(23, '2018_05_30_142637_create_obukas_table', 1),
(24, '2018_05_30_143645_create_seminars_table', 1),
(25, '2018_05_30_144004_create_vol_obucenosts_table', 1),
(26, '2018_05_30_144427_create_ucesces_table', 1),
(27, '2018_05_30_144757_create_vol_seminars_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `obucenosts`
--

CREATE TABLE `obucenosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `naziv` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `obucenosts`
--

INSERT INTO `obucenosts` (`id`, `naziv`, `created_at`, `updated_at`) VALUES
(1, 'Delovanje u poplavama', '2018-06-19 20:48:15', '2018-06-19 20:48:15'),
(2, 'Delovanje u zemljotresima', '2018-06-19 20:48:29', '2018-06-19 20:48:29'),
(3, 'Delovanje u ratu', '2018-06-19 20:48:36', '2018-06-19 20:48:36'),
(4, 'Delovanje u pozarima', '2018-06-19 20:48:43', '2018-06-19 20:48:43'),
(5, 'Prva pomoc', '2018-06-19 20:48:52', '2018-06-19 20:48:52'),
(6, 'Spasilastvo na vodi', '2018-06-19 20:49:00', '2018-06-19 20:49:00');

-- --------------------------------------------------------

--
-- Table structure for table `obukas`
--

CREATE TABLE `obukas` (
  `id` int(10) UNSIGNED NOT NULL,
  `idObucenost` int(10) UNSIGNED NOT NULL,
  `datumOdrzavanja` date NOT NULL,
  `mesto` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brojUcesnika` int(11) NOT NULL,
  `opis` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `obukas`
--

INSERT INTO `obukas` (`id`, `idObucenost`, `datumOdrzavanja`, `mesto`, `brojUcesnika`, `opis`, `created_at`, `updated_at`) VALUES
(1, 3, '2019-03-03', 'Ljubovija', 2, 'Bila dobra obuka nema sta', '2018-06-19 20:49:52', '2018-06-19 20:49:52'),
(2, 1, '2018-02-02', 'Kraljevo', 20, ' ', '2018-06-19 20:58:57', '2018-06-19 20:58:57'),
(3, 5, '2019-06-06', 'Zdravcici', 225, 'ss', '2018-06-19 20:59:21', '2018-06-19 20:59:21'),
(4, 6, '2018-10-10', 'Grocka', 22, 'Bila kul obuka', '2018-06-19 20:59:49', '2018-06-19 20:59:49'),
(5, 4, '2018-06-25', 'Tara', 250, 'Tara kraljica planina', '2018-06-19 21:00:13', '2018-06-19 21:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seminars`
--

CREATE TABLE `seminars` (
  `id` int(10) UNSIGNED NOT NULL,
  `tema` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datumOdrzavanja` date NOT NULL,
  `brojUcesnika` int(11) NOT NULL,
  `mesto` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opis` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminars`
--

INSERT INTO `seminars` (`id`, `tema`, `datumOdrzavanja`, `brojUcesnika`, `mesto`, `opis`, `created_at`, `updated_at`) VALUES
(1, 'DDK', '2019-01-01', 2, 'Uzice', 'sdsad', '2018-06-19 20:08:05', '2018-06-19 20:08:05'),
(2, 'Trafiking', '2019-05-05', 5, 'Beograd', 'sdasd', '2018-06-19 20:08:36', '2018-06-19 20:08:36'),
(3, 'Antitrafiking', '2019-01-20', 20, 'Zlatibor', 'Zeza zezancija', '2018-06-19 21:05:21', '2018-06-19 21:05:21'),
(4, 'DDK', '2018-02-02', 10, 'Tara', 'Au tara kraljica planina', '2018-06-19 21:06:09', '2018-06-19 21:06:09'),
(5, 'Difuzija', '2019-05-20', 50, 'Vrsacki Breg', 'Jel Vrsacki Breg kod Sombora?', '2018-06-19 21:06:55', '2018-06-19 21:06:55'),
(6, 'PHV', '2019-05-05', 30, 'Rudnik', 'Gornji Milanovac je selo pored Rudnika', '2018-06-19 21:07:32', '2018-06-19 21:07:32');

-- --------------------------------------------------------

--
-- Table structure for table `ucesces`
--

CREATE TABLE `ucesces` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `idAktivnost` int(10) UNSIGNED NOT NULL,
  `idVolonter` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `ime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prezime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pol` enum('M','Z') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prebivaliste` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zanimanje` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slika` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pravaPristupa` enum('V','A','M') COLLATE utf8mb4_unicode_ci NOT NULL,
  `datumRodjenja` date NOT NULL,
  `datumPristupa` date DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ime`, `email`, `password`, `prezime`, `pol`, `prebivaliste`, `zanimanje`, `slika`, `pravaPristupa`, `datumRodjenja`, `datumPristupa`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Srdjan', 'skorkovic1996@gmail.com', '$2y$10$JAnsG1qt1ril7oJpzpxf3une5lADqeMc9rifKTvMxQag6Fbx4k4Eu', 'SKorkovic', 'M', 'Uzice', 'sss', NULL, 'A', '1996-01-01', NULL, 'DFFwg33mzsFgtLjNnG5Ckfj23v0kVhq5M9x2b9hd0OahgsVs0AWIAegMgHf0', '2018-06-19 18:59:21', '2018-06-19 18:59:21'),
(2, 'Stefan', 'stefandomanojevic@gmail.com', '$2y$10$LLUHK9UM7NwmDdT12eMQjemiSlX8p2UImhiK0fQy5UC4yvmn2mah2', 'Domanojevic', 'M', 'Uzice', 'Student', NULL, 'V', '1995-05-05', NULL, 'qdvZqJQRJvyRJFu4llfrIB4Bgi8MwL0JCyLfrEDRNeax5cYVBXXuP9OuRbTD', '2018-06-19 20:21:09', '2018-06-19 20:21:09'),
(3, 'Milosina', 'milosina@yahoo.com', '$2y$10$vzXKXF1SUvw1vlJOipuAWuZnJZgtIQK3oyfp5HdlpmY1d2YrquCO2', 'Nas', 'M', 'Vrsac', 'Bankar', NULL, 'V', '1996-02-05', NULL, 'BkQiEGQrHIgdvYOD4eya3hI17g2cTG4Hyr4rNFrnooMRg0rIi7TR2AzM13mL', '2018-06-19 20:22:01', '2018-06-19 20:22:01'),
(4, 'Marko', 'marevolinadu@gmail.com', '$2y$10$tu9ScD/i7kTzChBj2OpzAetpIFwe..UZEEPHgHbKl5gUqA5flacGG', 'Jovanovic', 'M', 'Gornji Milanovac', 'Fudbaler', NULL, 'V', '1994-06-22', NULL, 'P8moCVgsdcaMfVxhg4HKSEB1iDHw2w5nzarJAGazAh5P9rjsauKMlSZW3uAd', '2018-06-19 20:23:10', '2018-06-19 20:23:10'),
(5, 'Veljko', 'upisemofakultet@gmail.com', '$2y$10$2.5kHoFUshZNONJX570v4urmwp//yyTHh7Em.f0fomB/fANDHMYqy', 'Djordjevic', 'M', 'Krusevac', 'Igrac pesa', NULL, 'M', '1996-08-28', NULL, 'Gcg2yg1LON63HQ5MTHiAlgyodvXDQgPwbcSqbD6lU5CESSVaTSppAAGJMUEt', '2018-06-19 20:24:59', '2018-06-19 20:34:49'),
(6, 'Nadalina', 'nadalina@gmail.com', '$2y$10$ZSNYTgHBCwOws5/Yu9060Ovxk2JDYLmDzFMaGhQKSJNtU7A4FoVeu', 'Nadalinovic', 'Z', 'Vracar', 'Fudbalerka', NULL, 'V', '1990-02-22', NULL, 'ea6bx5M0rtk6ktVJyi5zhxH48yu9nO0fLum9h4biRfIPtY2iRPcFxcLeqkJ9', '2018-06-19 20:26:04', '2018-06-19 20:26:04');

-- --------------------------------------------------------

--
-- Table structure for table `vol_obucenosts`
--

CREATE TABLE `vol_obucenosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `idVolonter` int(10) UNSIGNED NOT NULL,
  `idObucenost` int(10) UNSIGNED NOT NULL,
  `godina` int(11) NOT NULL,
  `opis` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vol_obucenosts`
--

INSERT INTO `vol_obucenosts` (`id`, `idVolonter`, `idObucenost`, `godina`, `opis`, `created_at`, `updated_at`) VALUES
(1, 6, 2, 2018, 'Dobar je', '2018-06-19 21:00:49', '2018-06-19 21:00:49'),
(2, 6, 3, 2018, 'Dobar je', '2018-06-19 21:03:54', '2018-06-19 21:03:54'),
(3, 3, 5, 2018, 'Dobar je', '2018-06-19 21:04:30', '2018-06-19 21:04:30'),
(4, 2, 6, 2018, 'Dobar je', '2018-06-19 21:04:38', '2018-06-19 21:04:38');

-- --------------------------------------------------------

--
-- Table structure for table `vol_seminars`
--

CREATE TABLE `vol_seminars` (
  `id` int(10) UNSIGNED NOT NULL,
  `idSeminar` int(10) UNSIGNED NOT NULL,
  `idVolonter` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vol_seminars`
--

INSERT INTO `vol_seminars` (`id`, `idSeminar`, `idVolonter`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2018-06-19 20:10:42', '2018-06-19 20:10:42'),
(2, 3, 5, '2018-06-19 21:07:45', '2018-06-19 21:07:45'),
(3, 5, 5, '2018-06-19 21:07:49', '2018-06-19 21:07:49'),
(4, 2, 5, '2018-06-19 21:08:02', '2018-06-19 21:08:02'),
(5, 1, 6, '2018-06-19 21:09:14', '2018-06-19 21:09:14'),
(6, 2, 6, '2018-06-19 21:09:18', '2018-06-19 21:09:18'),
(7, 3, 6, '2018-06-19 21:09:21', '2018-06-19 21:09:21'),
(8, 5, 6, '2018-06-19 21:09:25', '2018-06-19 21:09:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aktivnosts`
--
ALTER TABLE `aktivnosts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obucenosts`
--
ALTER TABLE `obucenosts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obukas`
--
ALTER TABLE `obukas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obukas_idobucenost_foreign` (`idObucenost`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `seminars`
--
ALTER TABLE `seminars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ucesces`
--
ALTER TABLE `ucesces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ucesces_idaktivnost_foreign` (`idAktivnost`),
  ADD KEY `ucesces_idvolonter_foreign` (`idVolonter`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vol_obucenosts`
--
ALTER TABLE `vol_obucenosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vol_obucenosts_idvolonter_foreign` (`idVolonter`),
  ADD KEY `vol_obucenosts_idobucenost_foreign` (`idObucenost`);

--
-- Indexes for table `vol_seminars`
--
ALTER TABLE `vol_seminars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vol_seminars_idseminar_foreign` (`idSeminar`),
  ADD KEY `vol_seminars_idvolonter_foreign` (`idVolonter`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aktivnosts`
--
ALTER TABLE `aktivnosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `obucenosts`
--
ALTER TABLE `obucenosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `obukas`
--
ALTER TABLE `obukas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `seminars`
--
ALTER TABLE `seminars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ucesces`
--
ALTER TABLE `ucesces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vol_obucenosts`
--
ALTER TABLE `vol_obucenosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vol_seminars`
--
ALTER TABLE `vol_seminars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `obukas`
--
ALTER TABLE `obukas`
  ADD CONSTRAINT `obukas_idobucenost_foreign` FOREIGN KEY (`idObucenost`) REFERENCES `obucenosts` (`id`);

--
-- Constraints for table `ucesces`
--
ALTER TABLE `ucesces`
  ADD CONSTRAINT `ucesces_idaktivnost_foreign` FOREIGN KEY (`idAktivnost`) REFERENCES `aktivnosts` (`id`),
  ADD CONSTRAINT `ucesces_idvolonter_foreign` FOREIGN KEY (`idVolonter`) REFERENCES `users` (`id`);

--
-- Constraints for table `vol_obucenosts`
--
ALTER TABLE `vol_obucenosts`
  ADD CONSTRAINT `vol_obucenosts_idobucenost_foreign` FOREIGN KEY (`idObucenost`) REFERENCES `obucenosts` (`id`),
  ADD CONSTRAINT `vol_obucenosts_idvolonter_foreign` FOREIGN KEY (`idVolonter`) REFERENCES `users` (`id`);

--
-- Constraints for table `vol_seminars`
--
ALTER TABLE `vol_seminars`
  ADD CONSTRAINT `vol_seminars_idseminar_foreign` FOREIGN KEY (`idSeminar`) REFERENCES `seminars` (`id`),
  ADD CONSTRAINT `vol_seminars_idvolonter_foreign` FOREIGN KEY (`idVolonter`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
