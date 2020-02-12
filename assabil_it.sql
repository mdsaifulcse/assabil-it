-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2020 at 04:53 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assabil_it`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ELPRESS_HYGIENE_EQUIPMENT_WASHING_SYSTEM', NULL, 1, '2019-11-17 03:22:37', '2020-01-30 11:55:53'),
(2, 'SESOTEC_METAL_DETECTOR_X-RAY_MAGNET', NULL, 1, '2019-11-17 03:23:49', '2020-01-30 11:55:30'),
(3, 'IMA HASSIA INDIA_VFFS_PACKAGING_MACHINE', NULL, 1, '2020-01-30 11:53:39', '2020-01-30 11:55:12'),
(4, 'LabThink_Packaging_Testing_Machine', NULL, 1, '2020-01-30 11:53:47', '2020-01-30 11:54:50'),
(5, 'PerkinElmer(Perten)_Lab_Equipment', NULL, 1, '2020-01-30 11:54:04', '2020-01-30 11:54:36'),
(6, 'Gostol_Bakery_Line', NULL, 1, '2020-01-30 11:54:25', '2020-01-30 11:54:25'),
(7, 'IMA_HASSSIA_GERMANY_FILLING_LINE', NULL, 1, '2020-01-30 11:56:30', '2020-01-30 11:56:30'),
(8, 'AMS_FERRARI_FILLING_LINE', NULL, 1, '2020-01-30 11:56:42', '2020-01-30 11:56:42'),
(9, 'OCRIM_FLOUR_MILL', NULL, 1, '2020-01-30 11:57:19', '2020-01-30 11:57:19'),
(10, 'AXOR_OCRIM_PASTA_LINE', NULL, 1, '2020-01-30 11:57:31', '2020-01-30 11:57:31'),
(11, 'BALAGUER_ROLLS', NULL, 1, '2020-01-30 11:57:46', '2020-01-30 11:57:46'),
(12, 'TECHNOGEL_ICE_CREAM_LINE', NULL, 1, '2020-01-30 11:58:16', '2020-01-30 11:58:16');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `designation` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `designation`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Distributor', 1, 1, NULL, '2019-11-15 15:02:08', '2020-02-11 13:24:20'),
(2, 'Business manager', 1, 1, NULL, '2019-11-16 22:00:55', '2020-02-11 13:24:30'),
(5, 'General user', 1, 1, NULL, '2020-02-11 16:42:31', '2020-02-11 16:42:31'),
(6, 'Admistrator', 1, 1, NULL, '2020-02-11 17:00:06', '2020-02-11 17:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `district` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `serial_num` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `serial_num` tinyint(3) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `name_bn`, `url`, `icon_class`, `slug`, `icon`, `big_icon`, `status`, `serial_num`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Setting', NULL, '#', 'fa fa-folder', '[\"menu\"]', 'images/menu/icon/2019/11/19/setting19-11-201912-43-06.png', 'images/menu/big-icon/2019/11/19/setting19-11-201912-43-06.png', 1, 6, 1, '2019-11-08 00:43:46', '2019-11-19 06:43:06'),
(2, 'Setup', NULL, '#', 'fa fa-folder', '[\"setup\"]', 'images/menu/icon/2019/11/19/setting19-11-201912-42-10.png', 'images/menu/big-icon/2019/11/19/setting19-11-201912-42-10.png', 1, 4, 1, '2019-11-18 18:08:52', '2019-11-19 06:44:49'),
(3, 'Admin & User', NULL, 'all-users', 'fa fa-folder', '[\"users\"]', 'images/menu/icon/2019/11/19/admin19-11-201912-41-44.png', 'images/menu/big-icon/2019/11/19/admin19-11-201912-41-44.png', 1, 3, 1, '2019-11-18 18:12:40', '2020-02-11 13:09:23'),
(6, 'Product', NULL, 'products', 'fa fa-folder', '[\"products.view\",\"products.create\",\"products.update\",\"products.delete\"]', 'images/menu/icon/2020/02/12/assabil-logo-mini12-02-202006-51-43.png', 'images/menu/big-icon/2020/02/12/assabil-logo-mini12-02-202006-51-43.png', 1, 7, 1, '2020-02-12 00:51:43', '2020-02-12 00:51:43');

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2015_12_20_100001_create_permissions_table', 2),
(5, '2015_12_20_100002_create_roles_table', 2),
(6, '2015_12_20_100003_create_permission_role_table', 2),
(7, '2015_12_20_100004_create_role_user_table', 2),
(8, '2019_11_07_123603_create_primary_info_table', 3),
(9, '2019_11_07_172733_create_menu_table', 4),
(10, '2019_11_07_173956_create_sub_menu_table', 4),
(11, '2019_11_07_174703_create_sub_sub_menu_table', 5),
(12, '2019_11_08_090748_create_page_table', 6),
(13, '2019_11_08_091123_create_page_photo_table', 6),
(18, '2019_11_08_095714_add_user_type_users', 7),
(19, '2019_11_15_123151_add_address_image_users_table', 8),
(27, '2019_11_02_100237_create_categories_table', 9),
(28, '2018_12_09_173537_create_districts_table', 10),
(29, '2018_12_09_180420_create_thana_upazilas_table', 10),
(30, '2019_05_19_224359_create_designations_table', 9),
(31, '2019_11_16_064126_create_user_infos_table', 1),
(32, '2020_02_11_235128_create_products_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `description_ban` text COLLATE utf8mb4_unicode_ci,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `serial_num` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_photo`
--

CREATE TABLE `page_photo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fk_page_id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'System',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `resource`, `system`, `created_at`, `updated_at`) VALUES
(1, 'Primary Info', 'primary-info', NULL, 1, NULL, '2019-11-07 23:29:45'),
(2, 'Users', 'users', NULL, 1, NULL, '2019-11-08 03:19:29'),
(3, 'ACL', 'acl', NULL, 1, NULL, NULL),
(4, 'Others', 'others', NULL, 1, NULL, NULL),
(5, 'Menu', 'menu', NULL, 1, NULL, NULL),
(23, 'categories', 'categories', '', 1, '2019-11-18 18:04:14', '2019-11-18 18:04:14'),
(24, 'designation', 'designation', '', 1, '2019-11-18 18:07:10', '2019-11-18 18:07:10'),
(25, 'setup', 'setup', '', 1, '2019-11-18 18:07:52', '2019-11-18 18:07:52'),
(27, 'dashboard', 'dashboard', '', 1, '2019-11-19 12:12:10', '2019-11-19 12:12:10'),
(30, 'acl-role', 'acl-role', '', 1, '2020-02-11 13:02:03', '2020-02-11 13:02:03'),
(31, 'View Products', 'products.view', 'Products', 1, '2020-02-12 00:28:27', '2020-02-12 00:28:27'),
(32, 'Create Products', 'products.create', 'Products', 1, '2020-02-12 00:28:27', '2020-02-12 00:28:27'),
(33, 'Update Products', 'products.update', 'Products', 1, '2020-02-12 00:28:27', '2020-02-12 00:28:27'),
(34, 'Delete Products', 'products.delete', 'Products', 1, '2020-02-12 00:28:27', '2020-02-12 00:28:27'),
(35, 'General User Permission', 'general-user-permission', '', 1, '2020-02-12 02:10:59', '2020-02-12 02:10:59');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(164, 9, 3, NULL, NULL),
(165, 10, 3, NULL, NULL),
(166, 11, 3, NULL, NULL),
(167, 13, 3, NULL, NULL),
(168, 14, 3, NULL, NULL),
(169, 15, 3, NULL, NULL),
(170, 26, 3, NULL, NULL),
(171, 27, 3, NULL, NULL),
(215, 9, 4, NULL, NULL),
(216, 10, 4, NULL, NULL),
(217, 11, 4, NULL, NULL),
(218, 13, 4, NULL, NULL),
(219, 14, 4, NULL, NULL),
(220, 15, 4, NULL, NULL),
(282, 2, 5, NULL, NULL),
(350, 31, 7, NULL, NULL),
(351, 32, 7, NULL, NULL),
(352, 33, 7, NULL, NULL),
(353, 34, 7, NULL, NULL),
(360, 31, 1, NULL, NULL),
(361, 32, 1, NULL, NULL),
(362, 33, 1, NULL, NULL),
(363, 34, 1, NULL, NULL),
(364, 1, 1, NULL, NULL),
(365, 2, 1, NULL, NULL),
(366, 3, 1, NULL, NULL),
(367, 4, 1, NULL, NULL),
(368, 5, 1, NULL, NULL),
(369, 23, 1, NULL, NULL),
(370, 24, 1, NULL, NULL),
(371, 25, 1, NULL, NULL),
(372, 27, 1, NULL, NULL),
(373, 30, 1, NULL, NULL),
(374, 35, 1, NULL, NULL),
(375, 31, 2, NULL, NULL),
(376, 32, 2, NULL, NULL),
(377, 33, 2, NULL, NULL),
(378, 34, 2, NULL, NULL),
(379, 2, 2, NULL, NULL),
(380, 24, 2, NULL, NULL),
(381, 25, 2, NULL, NULL),
(382, 35, 2, NULL, NULL),
(383, 31, 6, NULL, NULL),
(384, 32, 6, NULL, NULL),
(385, 33, 6, NULL, NULL),
(386, 34, 6, NULL, NULL),
(387, 2, 6, NULL, NULL),
(388, 35, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `primary_info`
--

CREATE TABLE `primary_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name_ban` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_ban` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no_ban` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL COMMENT '1=Group of Company, 2=Single Company',
  `description` text COLLATE utf8mb4_unicode_ci,
  `description_ban` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_description_ban` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `primary_info`
--

INSERT INTO `primary_info` (`id`, `company_name`, `company_name_ban`, `logo`, `favicon`, `address`, `address_ban`, `mobile_no`, `mobile_no_ban`, `phone`, `email`, `type`, `description`, `description_ban`, `meta_description`, `meta_description_ban`, `created_at`, `updated_at`) VALUES
(1, 'ASSABIL IT LTD', NULL, 'images/logo/logo.png', 'images/logo/favicon.png', NULL, NULL, NULL, NULL, NULL, 'toufik@neemsah.com', 1, NULL, NULL, NULL, NULL, NULL, '2020-02-12 02:36:10');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `product_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `description`, `product_img`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 'New Product1', 'Description1', 'images/product-img/2020/02/12/assabil-it-ltd12-02-202001-56-50.jpg', 1, 5, 1, '2020-02-11 19:56:50', '2020-02-12 01:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `system`, `created_at`, `updated_at`) VALUES
(1, 'Developer\r\n', 'developer', NULL, 1, NULL, NULL),
(2, 'Super Admin', 'super-admin', 'Super Admins', 1, NULL, NULL),
(5, 'Distributor', 'distributor', 'Distributor - can create/edit/view/delete business manager', 1, NULL, NULL),
(6, 'Business manager', 'business-manager', 'Business manager - can create/edit/view/delete general user only', 1, NULL, NULL),
(7, 'General user', 'general-user', 'General user(end user)', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 1, 1, NULL, NULL),
(12, 2, 9, NULL, NULL),
(16, 4, 13, NULL, NULL),
(17, 4, 14, NULL, NULL),
(18, 4, 15, NULL, NULL),
(19, 4, 16, NULL, NULL),
(20, 4, 17, NULL, NULL),
(21, 2, 2, NULL, NULL),
(22, 6, 4, NULL, NULL),
(23, 6, 5, NULL, NULL),
(24, 7, 6, NULL, NULL),
(25, 5, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_menu`
--

CREATE TABLE `sub_menu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fk_menu_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `serial_num` tinyint(3) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_menu`
--

INSERT INTO `sub_menu` (`id`, `fk_menu_id`, `name`, `name_bn`, `url`, `icon_class`, `slug`, `icon`, `big_icon`, `status`, `serial_num`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'Menu', NULL, 'menu', NULL, '[\"menu\"]', 'images/menu/sub-menu/icon/2019/11/08/chrysanthemum08-11-201909-16-14.jpg', 'images/menu/sub-menu/big-icon/2019/11/08/chrysanthemum08-11-201909-16-15.jpg', 1, 1, 1, '2019-11-08 03:16:15', '2019-11-08 03:16:15'),
(5, 2, 'Designation', NULL, 'designation', NULL, '[\"designation\"]', 'images/menu/sub-menu/icon/2020/02/11/assabil-logo-mini11-02-202018-45-14.png', 'images/menu/big-icon/2020/02/11/assabil-logo-mini11-02-202018-45-15.png', 1, 2, 1, '2019-11-18 18:10:46', '2020-02-11 12:45:15'),
(6, 4, 'Daily Report', NULL, 'company-visit', NULL, '[\"company-visit.view\",\"company-visit.create\",\"company-visit.update\",\"company-visit.delete\"]', 'images/menu/sub-menu/icon/2019/11/19/hydrangeas19-11-201918-09-34.jpg', 'images/menu/big-icon/2019/11/19/hydrangeas19-11-201918-09-34.jpg', 1, 1, 1, '2019-11-18 18:16:10', '2019-12-02 06:46:17'),
(7, 4, 'Follow Up', NULL, 'client-follow-up', NULL, '[\"client-follow-up.view\",\"client-follow-up.create\",\"client-follow-up.update\",\"client-follow-up.delete\"]', 'images/menu/sub-menu/icon/2019/11/19/hydrangeas19-11-201918-09-51.jpg', 'images/menu/big-icon/2019/11/19/hydrangeas19-11-201918-09-51.jpg', 1, 2, 1, '2019-11-18 18:17:45', '2020-01-28 16:31:31'),
(10, 2, 'Roles', NULL, 'acl-role', NULL, '[\"acl-role\"]', 'images/menu/sub-menu/icon/2020/02/11/information25-12-201922-25-3911-02-202019-03-27.png', 'images/menu/sub-menu/big-icon/2020/02/11/information25-12-201922-25-3911-02-202019-03-27.png', 1, 3, 1, '2020-02-11 13:03:27', '2020-02-11 13:03:27'),
(11, 2, 'General User Permission', NULL, 'acl-role/general-user/edit', NULL, '[\"general-user-permission\"]', 'images/menu/sub-menu/icon/2020/02/12/information25-12-201922-25-3912-02-202008-11-27.png', 'images/menu/sub-menu/big-icon/2020/02/12/information25-12-201922-25-3912-02-202008-11-27.png', 1, 4, 1, '2020-02-12 02:11:27', '2020-02-12 02:11:27');

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_menu`
--

CREATE TABLE `sub_sub_menu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fk_menu_id` bigint(20) UNSIGNED NOT NULL,
  `fk_sub_menu_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `serial_num` tinyint(3) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thana_upazilas`
--

CREATE TABLE `thana_upazilas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `thana_upazila` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `serial_num` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '4' COMMENT '1=System/Super Admin,2= Admin, 3=General User',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `social_id`, `mobile`, `type`, `email_verified_at`, `password`, `address`, `image`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Developer', 'dev@gmail.com', NULL, '01829655974', 1, NULL, '$2y$10$bJvF3nxUIPxn.6LLSQ0puu94eRduA9JTH6I9aSYiQJcCuao7.RKYG', NULL, 'images/users/2019/11/16/77020436-430483631234777-5178523127704977408-n16-11-201918-27-16.jpg', 1, NULL, '2019-11-07 18:00:00', '2019-11-16 12:27:16'),
(2, 'Md.Saiful Islam', 'superadmin@gmail.com', NULL, '01687835849', 1, NULL, '$2y$10$D7aWBREK5kdT6Q2TdFBp3OHQns8xyA5TOCzD3NBTWLeoRB.7t5okK', 'Dhaka', 'images/users/2020/02/11/assabil-it-ltd11-02-202021-03-42.jpg', 1, NULL, '2019-11-16 00:46:39', '2020-02-11 16:39:44'),
(5, 'Business manager', NULL, NULL, '01687835848', 3, NULL, '$2y$10$JuOMDmpvOBz6SRvBKBd4PeEtGKtOyfLTji8BUwQiQ9vXGTpxMl1p2', 'Dhaka', 'images/users/2020/02/11/assabil-it-ltd11-02-202022-53-47.jpg', 1, NULL, '2020-02-11 16:53:47', '2020-02-11 16:53:47'),
(6, 'General user (End User)', 'enduser@gmail.com', NULL, '01687835847', 4, NULL, '$2y$10$g7shS8fgGFWcnPG9J28ZQu.V.3cxEN79ovE.PjClDCwAuLaLEsMjO', 'Dhaka', 'images/users/2020/02/11/assabil-it-ltd11-02-202022-56-37.jpg', 1, NULL, '2020-02-11 16:56:37', '2020-02-11 16:56:37'),
(7, 'Distributor', 'dis@gmail.com', NULL, '01687835846', 2, NULL, '$2y$10$oXHD9nJdC4k4Vr23KyL1qe2sbDnXN5D9/rO2ZzZ/KI6cyCPfQvnnm', 'Dhaka', 'images/users/2020/02/11/assabil-logo-mini11-02-202023-02-05.png', 1, NULL, '2020-02-11 17:01:44', '2020-02-11 17:11:16');

-- --------------------------------------------------------

--
-- Table structure for table `user_infos`
--

CREATE TABLE `user_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `designation_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_infos`
--

INSERT INTO `user_infos` (`id`, `user_id`, `designation_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, 9, 1, 1, 1, 1, '2019-11-16 00:46:39', '2020-01-13 09:15:27'),
(9, 2, 6, 1, 1, 1, '2020-02-11 16:48:50', '2020-02-11 17:00:33'),
(11, 5, 2, 1, 1, NULL, '2020-02-11 16:53:47', '2020-02-11 16:53:47'),
(12, 6, 5, 1, 1, NULL, '2020-02-11 16:56:37', '2020-02-11 16:56:37'),
(13, 7, 1, 1, 1, 1, '2020-02-11 17:01:44', '2020-02-11 17:02:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designations_created_by_foreign` (`created_by`),
  ADD KEY `designations_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `districts_district_unique` (`district`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_photo`
--
ALTER TABLE `page_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_photo_fk_page_id_foreign` (`fk_page_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `primary_info`
--
ALTER TABLE `primary_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_created_by_foreign` (`created_by`),
  ADD KEY `products_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_index` (`role_id`),
  ADD KEY `role_user_user_id_index` (`user_id`);

--
-- Indexes for table `sub_menu`
--
ALTER TABLE `sub_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_menu_fk_menu_id_foreign` (`fk_menu_id`);

--
-- Indexes for table `sub_sub_menu`
--
ALTER TABLE `sub_sub_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_sub_menu_fk_menu_id_foreign` (`fk_menu_id`),
  ADD KEY `sub_sub_menu_fk_sub_menu_id_foreign` (`fk_sub_menu_id`);

--
-- Indexes for table `thana_upazilas`
--
ALTER TABLE `thana_upazilas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `thana_upazilas_thana_upazila_unique` (`thana_upazila`),
  ADD KEY `thana_upazilas_district_id_foreign` (`district_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_infos`
--
ALTER TABLE `user_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_infos_user_id_foreign` (`user_id`),
  ADD KEY `user_infos_designation_id_foreign` (`designation_id`),
  ADD KEY `user_infos_created_by_foreign` (`created_by`),
  ADD KEY `user_infos_updated_by_foreign` (`updated_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_photo`
--
ALTER TABLE `page_photo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- AUTO_INCREMENT for table `primary_info`
--
ALTER TABLE `primary_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sub_menu`
--
ALTER TABLE `sub_menu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sub_sub_menu`
--
ALTER TABLE `sub_sub_menu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thana_upazilas`
--
ALTER TABLE `thana_upazilas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_infos`
--
ALTER TABLE `user_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `thana_upazilas`
--
ALTER TABLE `thana_upazilas`
  ADD CONSTRAINT `thana_upazilas_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
