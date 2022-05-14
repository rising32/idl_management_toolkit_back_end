-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 14, 2022 at 07:22 AM
-- Server version: 5.7.38-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PMO_DB`
--

-- --------------------------------------------------------

--
-- Table structure for table `mst_client`
--

CREATE TABLE `mst_client` (
  `client_id` int(8) NOT NULL,
  `client_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `client_address` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_detail` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mst_client`
--

INSERT INTO `mst_client` (`client_id`, `client_name`, `client_address`, `client_detail`, `is_active`) VALUES
(1, 'AMAZON MHG9', NULL, NULL, 1),
(2, 'AMAZON XDEY', NULL, NULL, 0),
(4, 'ATU M2S', NULL, NULL, 0),
(12, 'Ikea', NULL, NULL, 1),
(13, 'Coty', NULL, NULL, 1),
(14, 'Mobivia', NULL, NULL, 1),
(15, 'TitTok', NULL, NULL, 1),
(16, 'Cinatis', NULL, NULL, 1),
(17, 'GCL Group', NULL, NULL, 1),
(18, 'IER BOLLORE', NULL, NULL, 1),
(19, 'Baidu', NULL, NULL, 1),
(20, 'IDL', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mst_company`
--

CREATE TABLE `mst_company` (
  `company_id` int(8) NOT NULL,
  `company_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mst_company`
--

INSERT INTO `mst_company` (`company_id`, `company_name`) VALUES
(1, 'ID LOGISTICS'),
(2, 'AMAZON XDEY'),
(3, 'ATU M2S'),
(4, 'IKEA');

-- --------------------------------------------------------

--
-- Table structure for table `mst_role`
--

CREATE TABLE `mst_role` (
  `role_id` int(8) NOT NULL,
  `role_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mst_role`
--

INSERT INTO `mst_role` (`role_id`, `role_name`) VALUES
(1, 'Administrator'),
(2, 'Project Manager'),
(3, 'Project User'),
(4, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account_setting`
--

CREATE TABLE `tbl_account_setting` (
  `as_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `date_format` int(2) DEFAULT NULL,
  `time_format` int(2) DEFAULT NULL,
  `currency` int(1) DEFAULT NULL,
  `decimal_seperator` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_account_setting`
--

INSERT INTO `tbl_account_setting` (`as_id`, `user_id`, `date_format`, `time_format`, `currency`, `decimal_seperator`) VALUES
(5, 3, 2, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_client_project`
--

CREATE TABLE `tbl_client_project` (
  `cp_id` int(10) NOT NULL,
  `project_id` int(8) NOT NULL,
  `client_id` int(8) NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `description` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_client_project`
--

INSERT INTO `tbl_client_project` (`cp_id`, `project_id`, `client_id`, `date_start`, `date_end`, `description`) VALUES
(4, 3, 1, '2022-02-16 14:59:01', '2022-03-16 14:59:11', NULL),
(20, 24, 1, NULL, NULL, NULL),
(21, 25, 1, NULL, NULL, NULL),
(22, 26, 1, NULL, NULL, NULL),
(23, 27, 1, NULL, NULL, NULL),
(24, 28, 12, NULL, NULL, NULL),
(25, 29, 20, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company_member`
--

CREATE TABLE `tbl_company_member` (
  `cm_id` int(8) NOT NULL,
  `company_id` int(8) NOT NULL,
  `member_id` int(8) NOT NULL,
  `role_id` int(8) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_company_member`
--

INSERT INTO `tbl_company_member` (`cm_id`, `company_id`, `member_id`, `role_id`) VALUES
(5, 3, 3, 1),
(16, 3, 7, 3),
(17, 3, 21, 3),
(18, 3, 22, 3),
(19, 3, 23, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_deliverable`
--

CREATE TABLE `tbl_deliverable` (
  `deliverable_id` int(8) NOT NULL,
  `deliverable_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(8) NOT NULL,
  `task_id` int(8) NOT NULL,
  `periority_id` int(8) DEFAULT NULL,
  `budget` float DEFAULT NULL,
  `planned_end_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_completed` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_deliverable`
--

INSERT INTO `tbl_deliverable` (`deliverable_id`, `deliverable_name`, `user_id`, `task_id`, `periority_id`, `budget`, `planned_end_date`, `end_date`, `is_completed`) VALUES
(31, 'React Hook Form', 3, 42, NULL, 50, '2022-04-29', NULL, 1),
(32, 'logic diagram ', 3, 43, NULL, 50, '2022-04-01', NULL, 0),
(33, 'Logic diagram ', 3, 44, NULL, 50, '2022-04-02', NULL, 0),
(34, 'Logic diagram of priority and deliverable ', 3, 47, NULL, 50, '2022-04-05', NULL, 0),
(35, 'Weekly statistics ', 3, 49, NULL, 50, '2022-04-06', NULL, 0),
(36, 'React select component ', 3, 61, NULL, 50, '2022-04-29', NULL, 1),
(37, 'Account page logic and role', 3, 46, 20, 50, '2022-04-29', NULL, 1),
(38, 'Change Database with real data', 1, 62, NULL, 50, '2022-04-30', NULL, 0),
(39, 'Form submit function', 3, 57, NULL, 50, '2022-05-05', NULL, 1),
(40, 'Form reset', 3, 48, NULL, 50, '2022-05-05', NULL, 0),
(41, 'Spinner function', 3, 56, NULL, 50, '2022-05-06', NULL, 0),
(42, 'Deliverable Page Form', 3, 57, NULL, 50, '2022-05-07', NULL, 1),
(43, 'Material UI', 3, 57, NULL, 50, '2022-05-07', NULL, 1),
(44, 'Bug fix', 3, 57, NULL, 50, '2022-05-07', NULL, 1),
(45, 'Create Deliverable', 3, 57, NULL, 50, '2022-05-07', NULL, 1),
(46, 'Bug', 3, 57, NULL, 50, '2022-05-07', NULL, 1),
(47, 'Custom component', 3, 57, NULL, 50, '2022-05-07', NULL, 1),
(48, 'Decrease font globally ', 3, 57, 18, 50, '2022-05-07', NULL, 1),
(49, 'Week of Agenda calendar ', 3, 59, 21, 50, '2022-05-07', NULL, 1),
(50, 'Detail Priority', 3, 61, NULL, 50, '2022-05-08', NULL, 1),
(51, 'Create Task and Project', 7, 61, NULL, 50, '2022-05-08', NULL, 0),
(52, 'Auth Restful Api', 21, 55, NULL, 50, '2022-05-08', NULL, 0),
(53, 'Camera Image Picture', 3, 57, NULL, 50, '2022-05-09', NULL, 0),
(54, 'finish', 22, 50, NULL, 50, '2022-05-14', NULL, 0),
(55, 'Work Setting', 21, 61, NULL, 50, '2022-05-14', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `login_id` int(10) NOT NULL,
  `user_id` int(8) NOT NULL,
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `out_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`login_id`, `user_id`, `login_time`, `token`, `out_time`) VALUES
(15, 3, '2022-03-16 16:06:38', NULL, '2022-03-16 16:08:37'),
(16, 3, '2022-03-16 16:09:22', NULL, '2022-03-16 16:33:05'),
(25, 7, '2022-03-18 12:47:53', NULL, '2022-04-17 15:02:43'),
(27, 3, '2022-03-18 21:50:32', NULL, '2022-03-18 21:50:55'),
(32, 3, '2022-03-20 15:31:52', NULL, '2022-04-17 14:35:20'),
(39, 3, '2022-04-20 14:38:03', '5auQwjXkGDqjLokexbsrFA==$DPu6bfxB1hi5YykBU8i3GVT4BYlBLAX14XYN35vJviTqO07lFH5FW4YuVpnGO0T0WSzryVFIgdaPeo/1E3cOmQ==', '2022-04-21 06:15:45'),
(41, 3, '2022-04-21 06:15:52', 'zjwOUtKP1ccep1xgdiN2JQ==$B5r0viW2XfjaZUoscGlSwMjLTaLQxDzbRsB+aQDh5rCZkWcIjIfGA0HihpT721novr0PDADyVa0ipmYeSt6AZg==', '2022-04-22 16:13:54'),
(42, 3, '2022-04-22 20:00:56', 'oQrCnZn6UGMpo2B3J3gFvw==$cR0UrcIxjjxtYRr8sfCPAZJumjzArIAlZQUc3R4OGrPjOmvbKruxzhMfzJF0PuA8t7VO3Cv+0wdMjnUr8wVt9Q==', '2022-04-26 20:00:23'),
(45, 3, '2022-04-26 20:03:57', 'Kcmq/+tG2QlnWcc95b6Ktg==$5dzsOFUSSV90hX9GQq4EVNyQNOBjLeq0gjMtBoufpw7NKd79N9rNfUuLSVC6J6B+YstzZNhbwOzzy/RogA/SBg==', '2022-04-26 20:05:47'),
(46, 3, '2022-04-27 00:39:42', 'M7zeEBq9yDYiuhoNOZ4UbQ==$T+8tRdI+2tHtgOu2WXAALYMl+lYXJvgG6BHcHLSPHihUkJQaY0mj5OKnR7RVV3NXxIUIw5So6887Vvwa5eAMrA==', '2022-04-28 08:24:28'),
(48, 3, '2022-04-29 03:35:20', '5zrpf+QQDA/Yc3zETriB6g==$mcjEpd9TkvnOxaIx0a48fajoYMkeSunY78aqs5NeakYI66zAcnnVMdDJ+f1ZmgfMPKqQ3iXv/Bgbm6z+mZStUg==', '2022-04-29 13:29:05'),
(51, 7, '2022-04-29 13:30:23', 'ACI2CfgMkzw56ZCNcftxhg==$CMO0dPo9IXgQ9tu1iRz1BrRXrerHdvwFy/Bbj61oqBjoTFqShMbbWa7vPn8D8eh+gE2Frd/mBYAeIs4lxVxzzw==', '2022-04-29 13:32:26'),
(52, 3, '2022-04-29 13:32:36', 'j+ebtarw1dpci+EZyUevXQ==$4i/UYXZAKyc/YpDPsIh1FLyKJpv4tpFUseoF7ZSKcwidX/JyH9EaBEZFfVLmKtOfgWb7y1JPJPIG5IvGUv2gtg==', '2022-04-29 13:36:59'),
(53, 3, '2022-04-29 13:37:07', 'mlpW90sO8Y9BjupC4+Y9cw==$60rnue1L0bvNXvKKjCaZFBuMg1qd4Yi1cFcahRbkuGa1Y7PHjszddVclzTRwZntU2J2eh0xSEqQ/DmfKSW9sHg==', '2022-04-29 13:37:12'),
(54, 20, '2022-04-29 13:39:02', 'BG/3J+L6oO1BBhODG+f58A==$mRfCoMdc65Czi6wcYW+8vPpMeG7drkrYaRsR1u/DJTBz7/5fOykfsYNiNMD6K7gtcfef9nyufGQqnv/bf+/wrw==', '2022-04-29 13:40:25'),
(55, 3, '2022-04-29 13:40:32', 'I12WAepcqSbGwi/h0P38pw==$kISf5X2+VZF8H6TDc9qoGCj+sOrNZIHrsb7it+yoC6bBz7QXDDYnbDL1aCyuwWOy2TywgWaKV0MKzWZ3yC4bYg==', '2022-04-29 13:42:50'),
(56, 3, '2022-04-30 00:58:26', 'yV0U/LwrRIUkVKrz/5g7Uw==$q3JbToNPM3aFmXQ01gbH3b+gZCifPxMtKE/BqEsmGdSamLukXaAhbifi1oGzDb0qLMv16ur8G6A02fF7C/HkHA==', '2022-04-30 01:52:37'),
(58, 3, '2022-04-30 05:08:27', '1H0LnVXujaOO36z9cOCNxg==$H/bZvQpDaBdyj16Yr37JV1vQWIhPT0Nncqg8B9w8JNuNhxpNVjSzNHmNDFMJmAaduOxPJb47iTz4MtoUV+ZXDg==', '2022-05-03 14:55:58'),
(59, 3, '2022-05-03 14:57:40', 'WbZ35Tsv/E+qmW/yVVXEDg==$ByNeqeN58md3LexxYV9Fshp8gj999Ayu/A+Tm92JBl7ajomAubzqtQ+ey+etqfaKCIcOzHsV5YFpvyTUR27s/A==', '2022-05-03 15:10:10'),
(60, 3, '2022-05-04 01:18:23', 'IYtBaknOSOgbFKaXQBohFA==$A9uGT0vsZ3cl4TrPUEcwHWUVr+ZZoNDeumhECnvBJkaz3zpKOJ/A73zdw4IB+hcAbd6629BoIMeJ+bRY8fO27w==', '2022-05-04 02:20:43'),
(61, 3, '2022-05-04 02:20:53', 'x+uwuXGetQg5y8SudSgVdQ==$LntjgRaA/d0GXINNhfcv7JUusiIJQDQq+QfV85By2dHuLBfORRz+iEjTKs58sSlZc0P4hANxFIaSVyyo8cN7tg==', '2022-05-04 02:34:56'),
(62, 3, '2022-05-04 02:45:50', 'WEwzN5gNs17DvQondyrq2Q==$Ot4kuZsF5bGHYZQUfjgRnzx/PxCIdsDx7jUEV4ctyxNkb5nCCfFcGC6R/A3FqpjtqeCkEFa2bqWYX/hdq7F8fA==', '2022-05-04 03:45:26'),
(63, 3, '2022-05-05 01:05:11', 'NBKxBh929H3ea/k6z9LWoA==$TeXzEVlw87iHxwPjyN/x8EL3W3eC5wZztIgihBfM24p3fjdnITPzZDhCavchEwqY327wRRwsKmio7qrR+P9Rxg==', '2022-05-05 11:01:10'),
(64, 3, '2022-05-05 13:48:21', '7cI+DO/e5o8+gtsF5B1rdQ==$ZkuqRXpaEVBn5O9IwUGftIphwGpv6Eb2nEtXr0Ai8pAqjFgGJjzQDT6eClse8EwANfvkf5VQeAnADSXFhLAzNw==', '2022-05-05 13:49:06'),
(65, 3, '2022-05-06 01:01:56', 'hYUxwdqdlOQ1Wu92Z/z9yg==$asXJ5eFr7NTXzI5JUvdCopbBckg55/9X1DUllMsd9hGuQK8OZVbSFUCfnT1Ll6HQMR1O1XTWnupxNhB7RJhDvQ==', '2022-05-06 10:16:32'),
(66, 3, '2022-05-07 01:07:51', 'iCm96EkI5En6ZeG5Q50lSg==$5xW0rjotCTEGdjltqdYWm/+bVgATQyX89MarewFB9pc8PjUesBF/Rs3QYceEH39zkpn7IalfcBswUmQe1uAHFw==', '2022-05-07 05:18:50'),
(68, 3, '2022-05-07 05:26:06', 'MOnK0vTOe5/bVlZZ/S8Ouw==$nHvDkhgcLwS4QduyhfWOX1qdBGEuFKQx0/wjmhfVAPS6M0/DdgMz030ztGD57t+8FRghyD6hGJh1/E6GyUfaKA==', '2022-05-07 05:26:16'),
(69, 3, '2022-05-07 05:26:18', '2TTE68/Qxb0l1+wiRDk9cQ==$/4MNagtmCFRycBQfS47XDQa04kFvDb9yW16PIWS+GoPFibHNzpJwsZGUPeJFb8rBeI9tljDHPh+JItlV3l+kXQ==', '2022-05-07 08:28:36'),
(70, 3, '2022-05-07 08:28:40', 'h8z4xYqz4IQYORWnrNGJdw==$h0iqRE4xm3fk+KJKo4DrVzUrRH1SVMJE5o+k5XaU+v9GjQj182tkWZfjFw5Wxbx5piFCp9yEG6E2bqMd7mNaTg==', '2022-05-07 12:18:33'),
(71, 3, '2022-05-07 13:42:51', 'mX+V7WKGKVGCLfGDdVfoRQ==$my0EOfPoUnyLYyqiMYQGkH7W7R+ULL85Wc3ShLRFRm7iWwtRfOGbMoI96ozZXgdo4G0pg5KrfI4O8zEdxTTzrw==', '2022-05-08 01:25:38'),
(72, 3, '2022-05-08 02:16:45', 'ftb35jxd3Dg7KEsu9ED1Aw==$os3QAZFZP1q+VLutDBzzGtZfeqKBgEzu0ezpWsg0Zg6nj9gO/RzWtDmc53FkULwDq79O42LyybEF37o7fAInhQ==', '2022-05-08 06:35:04'),
(73, 7, '2022-05-08 06:26:19', 'ALd43z28g5JtVKwqBkggfg==$bkJXI14TYJX3nIH63aY0fRW9DhFI6SqwTwcAxdG9U0VQ0Rh9LIWfbZoNvnFb6IfEHwJzLGp712vWjJhFOSIEQA==', '2022-05-08 06:30:09'),
(74, 20, '2022-05-08 06:31:14', '8xeMMiWrtFt+7oHlXavBQA==$sln+p8Y7X6oozkOWcmNHZprrtMIeEJi3kPoX8ew/mDLP88wxTu65wiLERHgNaB3uypFhllCmlCw5X6ItecdBkA==', '2022-05-08 06:31:53'),
(75, 21, '2022-05-08 06:32:36', 'kfDnnSwl5FV4zFYBW6LTgQ==$rbUxhIr9jIT4elK/DiXu5r8VfOkMbK1QhC5uXRnLyQdgUA0ewN7VRjmtqg6RPb7IQG0MONKDbE+VISca6akbAA==', '2022-05-08 06:56:50'),
(76, 3, '2022-05-08 06:56:56', 'VnyGJA4IAvTYEkj2AGFULA==$SM0Fsaw0WfBRyjQaJ7kKDjOvi2DiWiUNHWAQwRXnWWj+fwNjo2k0d9GWiHSVVDMCPwoXFkdUPEoDzBszTZUCqA==', '2022-05-09 01:11:23'),
(78, 3, '2022-05-09 01:24:49', 'wupXKqTssT7HNaoMHx17/A==$F3FWplUcPLHvCxYViq2/a7+qFPL0t1CcsrPyowuebQSGVtzr0UJg8Yzx9mV3BaO2RkfTFDaH+Q1ZzIgmPYnYhw==', '2022-05-09 02:32:30'),
(79, 3, '2022-05-09 02:32:32', '0HcR88UVqkgTw5cec2tAhw==$C19pipogIvwXRhOCtDSQT2+h3t/JpP+RbBlMJsuVUAgNvkeL7AFCowf/oK2DJCa5hGbaZvPVpl4WzfLV4F0foQ==', '2022-05-09 05:52:41'),
(80, 21, '2022-05-09 02:51:16', 'H4Q6gWHbTTJgYuDN9awnPA==$UaRxa+k1CzWoxmVcEn5/QGSTTWNzUDydKIpLanJ7+ZdB741ORNrsKJu6Z5DnG5i+QglEnxpXJ7IpQqZk/n5Xcw==', '2022-05-09 03:24:40'),
(81, 21, '2022-05-09 03:24:43', 'albtxpVmrMklj+jm4KC+QQ==$vmpbH3jakWSXNgIkidxnceduehPO7o2kQSVqPQdwfWUzqJw7UjyCplk2PIgAk5nXerZEQkdFlb/utBVXbsigUg==', '2022-05-09 05:51:52'),
(82, 3, '2022-05-09 05:52:47', 'gWi7e0XuuibMcsfzzABOZg==$tjLcLzOxFF7y2Xro6lvf1/qIyMeenkZtE/luPzcEKBzxebwYcxVEFNTsINOg2wjwyBP0vfhrfiK9pUWyBrxSmQ==', '2022-05-09 05:55:13'),
(83, 21, '2022-05-09 05:55:17', 'M4XlyLR0WODEioINi2A02w==$HC722gAWsrgzmFfIxs39TCm4OandtA+7umq6YCX3Ck61wRkxu37AkrcRS68ooe196H1SDNeiRKR5JOr5EBPOng==', '2022-05-09 07:28:32'),
(84, 3, '2022-05-09 07:28:38', 'JRSoyS+9we+UhKUUdzcmKQ==$0lcNh4waloCN2HGcDjAIS6ye+nTQDLHmR7N7gvW4JiiejyIgFUOm9/mzgX0zV0ydm053reTAseaR/RzDzdCtCA==', '2022-05-13 03:48:04'),
(85, 21, '2022-05-10 14:29:16', '2rlfjtupLtJ+hvTPj5Huew==$2kNwUGPpbaRCrgPoJvEyVeLCZth8YSHBNglYPVovHZRjT0hOCo15qbGS8f1aHCwBquWdeA/aTxvNCf8UpCV37Q==', '2022-05-13 04:27:54'),
(86, 3, '2022-05-13 04:26:28', 'f19eKIBx68Oz79fGcqAFKA==$4au4aKXsaUHJCDRvhzZkXfdZYfGTzZg2M25t5AZIRDep3LRHquN9SPsog8UlUZAKtKyi1HYbNyflL7KC5yCNTw==', '2022-05-13 04:26:51'),
(87, 3, '2022-05-13 04:27:58', '/RMII5yGcjdX3xrp5z1M4w==$DmNBrCGdDz3pIdfLkHvkhxwv93CzUZCNQli44gNWh6nBocN9CKNn9CCTdRWgsZRCEABnibitYoOY0dEyzjXIoA==', '2022-05-13 04:30:29'),
(88, 21, '2022-05-13 04:31:05', 'tXO9K8TVvyGwzVBGXOO+jA==$UUm8PbKpyCpRRVqvRoybgJZLP48j4gpWI5h5WWJF4njxJIy97qYLtl2PKxenGf1iojHlj6ERnU/JslJFUB8VoQ==', '2022-05-13 13:15:05'),
(89, 3, '2022-05-13 05:23:37', '7z3nMhXGtz7xs03GIFHG+A==$it72igxXpN6DyQAzKvnRL7SEZS74M2leM7mBNoxjAZNVQgEZeXfXurF67wYOycxritp9TCm9ImoMmrkXAOtWUg==', '2022-05-13 05:35:35'),
(90, 3, '2022-05-13 05:37:05', 'Hv2lIC0hkcsMihiz1f7iYw==$faNJho8UwlzkxH7CpleziqTbp2by6L7jry/NAReTujsTz01YWAojsNLr+fun1ME9xIdPiiKD3weJI8oVf3phhQ==', '2022-05-13 05:37:19'),
(93, 3, '2022-05-13 06:12:15', 'y1vQfd5zUxvYXntbo20/6g==$cDi+TkluR+5hW7tDm2+JLuZtLALSklC7ZIil9WLS3tKd5RdRSwu2PL5o0CUaZjrqDoALi4R5hCleADrUvGuxfw==', '2022-05-13 06:17:19'),
(94, 3, '2022-05-13 06:34:51', 'O4TthCXRLhZogAFJwyRiNw==$cTWcbUX3eCxVlcdMBvRoweBZ8tLEQRGODLSGb+I5SvzbZ/oxG+aAfOx9z9SerqJGeqTwbB1H42towlKtMpAS0g==', '2022-05-13 13:00:16'),
(95, 3, '2022-05-13 13:07:37', 'aI2UCdgaw3bSviLgtKua9Q==$OZKxYCLenQpwMV2XuKeqYyZDeIdH3dTKXMpKLktZ+FaM9vydJhWFmVnIgaSx9vuTU4ZU0ilPZPcGgFHZiWY3UA==', '2022-05-13 13:09:50'),
(98, 3, '2022-05-13 13:10:15', 'VGoV4/giCnw+I4AW8vaP3w==$1CfsaYfOPueiLHuIreqmxabWqDSRAsPKGDkVQKsfNhkFuORCStfXgJ6MBYMyyswWwdA39aK61VwIOAteL/cmrw==', '2022-05-13 13:12:05'),
(99, 3, '2022-05-13 13:12:10', 'FcXqyxDuzBOTXed+whmXPA==$cCjN+fKXIsE/liHj4tKEgphw2Eto5ENpOUdqhVB2uxgv6BO5aN7soMPRqKvfIuk7K9rnBWOP1oeNX8tvxGXC/w==', '2022-05-13 13:12:37'),
(100, 3, '2022-05-13 13:15:52', 'ae/oVNn7T2YbwVj1Go6maQ==$ht7/Z76dz0roPFjgOfAxsoD2oa5oUMEvUHNbcyhGCHxr6aXVJnsnlV6g/BOwSPCS+MK6nhnB3UW0zESWgPxM1Q==', '2022-05-13 13:16:29'),
(101, 3, '2022-05-13 13:16:37', 'mKQY7abtsH46gbjgKizung==$/6wfR5DDGeawMXj5aPLkL/k+nnBTUe76NHxIo/7/6g1jqk78WUMf1JJo2smwZBULRX4LTFabI7VxkHWI3EkdqA==', '2022-05-13 13:21:23'),
(102, 21, '2022-05-13 13:16:45', '3or1CVCwmCZMwD/e+A5MTA==$r0l3NG40te/nkgjgAF1anQHtjYcRXmR5cbG/NZgKn6j0yRL9tQ6zwEbaN8ICIQOnbM+caHL6a99j0kLTLitYrg==', '2022-05-13 13:17:35'),
(103, 22, '2022-05-13 13:18:08', 'Bm7kkzF27lt0MLYCg8pWTg==$b3NWN84OtPLRUw44xmHtjUsaQOVLFPzVATK+fz6zYzjQGyS8J//fINhGdgGfBygbZpGqQN25CrU7TUPW+gRbtA==', '2022-05-13 13:19:50'),
(104, 22, '2022-05-13 13:21:38', 'wwgV39ADQJlXCQZvilL+QQ==$igZ4NOHChUcUXZLxCVuMKbR/aFfdrf4ryEmD/Pa+YSJKLddEh7xOmND7Y2EmUbvRl5teo/xnb9l1Syajs9sp4A==', '2022-05-13 13:22:55'),
(105, 3, '2022-05-13 13:24:04', 'zcyuNlF2oUzTtPxaWZXQGg==$LSJzuTY5u3BvC3wrroOfnXGwtWInWFpwUhetF5xywK1MvVdn+SmIqh+TqO5fEPTQzYMSAj6Mrn1Sco/snpBrJA==', '2022-05-13 13:27:31'),
(106, 3, '2022-05-13 13:27:36', 'p9lwQlPnxSRm95YG/PdQrA==$r3KY1Ah7qZp3HLNPhL2GBlGv5v0bylu/66mD/fzcNhA9sGUwh7wXlxQt0xI69yPCCiVa2NRnmM57HQ1kUmnZZg==', '2022-05-13 13:27:43'),
(107, 21, '2022-05-13 13:27:47', 'shxem+cwieKbbbMdiRr6ng==$BCHh6sHnzF8VtviThVDfqqlqUD4o7UWNEOwAxRxgn943MuyH8Ym10CO38LEaZGxFq+67RvvXuWrqOoq/uWYUAg==', '2022-05-14 00:59:25'),
(110, 22, '2022-05-13 17:44:45', 'z5l8XBlaqBHnzOImOq31JA==$KABKMkrEGwzYI+gsn1AC2DnGuKUC+oVx3bcOwoLzFjPCVOJkNvERbLrEdiQAVKEuA0UxcMjSBE7GhbLzuXCTXQ==', '2022-05-13 17:44:56'),
(111, 22, '2022-05-13 17:45:01', 'ZYj1zFZjX5FC1sb0P1IlMg==$c/zMF7rg1mA0cZaBA4GiWVQTdOBSY2pWOLVOHV/f0jnWPCYowiSd9119Z1OjSIWKJV5CKyj7LcBXJrKQ+yY+aQ==', '2022-05-13 17:45:08'),
(112, 3, '2022-05-13 17:45:31', '8a1DAUzZwSCUY2qLu3+GTQ==$aYeK4eHkgZxwjRVOuQJ/smLJcQa3IEj7YOS+7lF8IJxVnKLS5It3biRIW19p/fiwkZaboDb48GDxWLUfBCFJKA==', '2022-05-13 17:49:37'),
(113, 3, '2022-05-13 17:49:50', '/RJvCZ3NoVoGvHdrt3x4qw==$QLUpzHHIst7Xn28lbk+3LL9CMBxQV7or2NNHb2EHhAd3zXlndyl2HViB2vW5E56iESkGHNBCoLXE9lgc85Hqyg==', '2022-05-13 17:51:12'),
(114, 3, '2022-05-13 17:59:16', 'FbSl4d07aGxCZ7U2t8mDxQ==$9q3Eia1l1IXsDUQivB5lPmc0uXwuvrqspbv7BQ2FHf82kDH1w4i+LKtpd3y49gR2cJunZCVAfxdFvxJECwYQkg==', '2022-05-14 00:58:15'),
(116, 3, '2022-05-14 00:58:17', 'V7J0GWeAOlWPTh6eKIlQkg==$TFBY61hio92A9GnbfmBxxSJp1YGdR2Wt4Q/bRlOeSboy4Kv41arZgf79xdO//4ebn+QHbllZS5j8nJZY3Kz7DQ==', '2022-05-14 00:58:26'),
(117, 3, '2022-05-14 00:58:28', '/epcsbioOyx9GZjKh4Ooaw==$QFH9DF+uWGofvBWXd01VnImXkwuVs9rJHycnk/DjXen6hRcOi613xMwaCzDKDOAStfMTvyckUn13a5ypt3hYFQ==', '2022-05-14 00:58:34'),
(118, 3, '2022-05-14 00:59:30', 'IosWMFWmllOThcrz3T5ZlQ==$7toqRRzkh42+tEO4Y7GF31JaD3OYVnd14HtO8iFKMVtYbfqNz6/ww6BgClH5B8Q8rr2fkUFuwSd+8O/XBWu2vw==', '2022-05-14 01:22:21'),
(120, 21, '2022-05-14 01:22:24', 'wDPPCYrwi1wawk4F4NGuqQ==$D7no857Q2TwEBzHEPcfZigB5+Lct7ZFAR6iwWutbM+bx7NH3JiK8IZY0XDlqn13bWot5DA4gy7UX7Y/sgxwJxg==', '2022-05-14 01:22:52'),
(121, 3, '2022-05-14 01:22:55', 'fGBNghdj5L/EcZ1mrPDpxw==$UzGH91eqGSEBfxltsrM1t5jD1q28VUFwAZlRs89gFlRsxcsSUeDpjw7kjN2+rNzpfY6Jt7NoBm9rVskf9vvLqw==', '2022-05-14 01:23:32'),
(122, 21, '2022-05-14 01:23:36', 'ZqIR93PJVUZ2HrhSxLHg6g==$IRqnitLqu/3hMtUBhJkSSZ+tyddYxJWWA4srLm+mMJ34uCjGwJ7DKktVSB7CaQNh8fFnDspwoDQGbmp6vs0/gg==', '2022-05-14 01:26:58'),
(123, 21, '2022-05-14 01:26:59', '98D9HYCWk+UZYS0a7UTlAw==$4OzmWIdvraGirJeeSjdH2dhR/hB8ZITMW/Mx7Mc5IuJO/x6FnN+n0nZD9TxMWbo6x7UHSnTyvPu3429Tqf1RzA==', '2022-05-14 01:35:18'),
(124, 3, '2022-05-14 01:35:21', 'kpOB45RssDH6kxytBJ6uDw==$jwmsX4S/WBw3sMbJMhyFEPiPp2saabcoYlelWDEeRdmw+ByMnuwpZuvNfVR5sL1jj8Yvo/z9QPwJyAzEDWcVxA==', '2022-05-14 01:35:44'),
(125, 21, '2022-05-14 01:35:47', 'WsoXUm8YXKBXxwHS/Hfghg==$V90zxuMyr6IIqeCiwgDfCWIl6qoMxwXyPaRJNIQ8ApB11qmz4s0b0+NiKQkQhbEiwQ5jWfsI6ioByTOPRdRq/A==', '2022-05-14 01:38:04'),
(126, 3, '2022-05-14 01:38:07', 'tFrWJ/Wlled7GFflgwtZbA==$3Xy6ocPKibE4Ir1e1pf4uVTSAwQXC9u3SDLEfTltYnb2nr4o3kgBmgvectunkV1wZ8roErqk/Ff2u/wVCWXKwQ==', '2022-05-14 01:38:21'),
(127, 21, '2022-05-14 01:38:24', '89vC4b+1ysGy5hyHHEK0ng==$VQdUaUX3bW0DtppGY/tnSYeQN4JhfG3DJLlSYYKdTjj1XTXXkhrYQ57s32dSjP8jl67eDsfUiPjQw7qCiO/BvA==', '2022-05-14 05:23:33'),
(128, 3, '2022-05-14 03:29:49', 'XBhjPKixuEcr1nWVUftT7w==$wBOTJwTMReven3P3RZtWCAo3tYQdhqON2Vm9r7FCPU1xaxOwUpKQp9yh3hJFypT+bDSzbpx/cREpbWC0U/qnuQ==', '2022-05-14 05:24:11'),
(129, 21, '2022-05-14 05:24:17', 'YaPD1DcVR3fQi9DGNEAfTg==$ak+31uf968XnxnLpcRRc1DaE8ga6cdOlxMXEJTxAya4crAJOSvul6jjZPYssMyAIxc2o2nSnCrFSdqOuX9RI0g==', '2022-05-14 05:44:50'),
(131, 3, '2022-05-14 05:45:06', 'StRk5Y7odUqc9KTv9pl1oQ==$7W6lXDXmPGi7xNATyrc+3A6s5D5sbZ7LqCSNySCj0y8fBCro2h/zZ9ebiWVNWrKGxhDmgi08SC/qQhOVYrOXIw==', '2022-05-14 05:50:27'),
(133, 23, '2022-05-14 05:49:30', 'zBtvNJSsqb5qwnH2klrKVA==$YxcEmy2EpaXWuqiXfCG89hYTU+n+B7bMx1t5D1U/Y+yhdR4Fjed/HKQV2AqjNOvRyHN1w0KjsVoYe5hQtfgUmQ==', '2022-05-14 05:49:55'),
(134, 23, '2022-05-14 05:50:35', 'gqwrvn6w6JjlUQInqFJnSw==$wKjUnBIJOn2MuwxDyLzJZ5GiTJ/4Oe4gnUe0dGSX96yos+T23ptA8U4/0EXQ0vIRx6QYRX99E4Dg+rHJh1tjkQ==', '2022-05-14 06:26:03'),
(135, 21, '2022-05-14 06:26:07', 'DGs1ryV3bQgmu5OZHM7BXg==$W4nTZ0RjxEnXzwxY+HXLd//Ar4HnQ6RiAv8aRyN8m325NVjTLFwBboXPujd8MRF6NJFohcdJHZV3LWeO4nCTFw==', '2022-05-14 07:19:17'),
(136, 3, '2022-05-14 07:19:21', '30TTC/T/NNGRCvAjJ3QYDg==$DNvXu41kFZR72pp67RnIuj6MfZyu3a4elju1V88VUnSCwdIRCusjBu3wyjNFxpaRSrmvSRicczp6iIhlxcRrZA==', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_precede_task`
--

CREATE TABLE `tbl_precede_task` (
  `precede_id` int(8) NOT NULL,
  `task_id` int(8) NOT NULL,
  `preceding` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_priority_agenda`
--

CREATE TABLE `tbl_priority_agenda` (
  `pa_id` int(10) NOT NULL,
  `wp_id` int(8) NOT NULL,
  `planned_date` date DEFAULT NULL,
  `planned_time` timestamp NULL DEFAULT NULL,
  `content` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_priority_file`
--

CREATE TABLE `tbl_priority_file` (
  `pf_id` int(10) NOT NULL,
  `priority_id` int(8) NOT NULL,
  `file_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_priority_task`
--

CREATE TABLE `tbl_priority_task` (
  `task_id` int(8) NOT NULL,
  `creator_id` int(8) NOT NULL,
  `company_id` int(8) DEFAULT NULL,
  `task_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(8) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `planned_start_date` date DEFAULT NULL,
  `planned_end_date` date DEFAULT NULL,
  `actual_start_date` datetime DEFAULT NULL,
  `actual_end_date` datetime DEFAULT NULL,
  `hourly_rate` float NOT NULL,
  `is_add_all` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_priority_task`
--

INSERT INTO `tbl_priority_task` (`task_id`, `creator_id`, `company_id`, `task_name`, `project_id`, `description`, `planned_start_date`, `planned_end_date`, `actual_start_date`, `actual_end_date`, `hourly_rate`, `is_add_all`, `is_active`, `is_deleted`) VALUES
(42, 3, 3, 'Login Interface', 24, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 35, 0, 1, 0),
(43, 3, 3, 'User role', 3, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(44, 3, 3, 'Relationship of Project and Client', 3, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(45, 3, 3, 'Relationship of priority and deliverable ', 3, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(46, 3, 3, 'Account setting ', 3, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(47, 3, 3, 'priority concept ', 3, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(48, 3, 3, 'deliverable concept ', 3, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(49, 3, 3, 'statistics method ', 3, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(50, 3, NULL, 'Sign out and User profile ', 29, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(51, 3, 3, 'Team members logic', NULL, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(52, 3, 3, 'Sign out interface ', 24, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(53, 3, 3, 'Task page Material UI', NULL, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(54, 3, NULL, 'Priority page design ', 29, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(55, 3, 3, 'Account page design ', 25, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(56, 3, 3, 'User profile page', 28, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(57, 3, 3, 'Deliverable page', 24, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(58, 3, 3, 'user model', 25, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(59, 3, 3, 'priority and deliverable model', 24, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(60, 3, 3, 'statistics logic', 25, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(61, 3, 3, 'Change of Task page', 24, '', '2022-04-29', '2022-05-06', '2022-04-29 00:00:00', '2022-05-06 00:00:00', 30, 0, 1, 0),
(62, 3, 3, 'Decrease font globally', 26, '', '2022-04-30', '2022-05-07', '2022-04-30 00:00:00', '2022-05-07 00:00:00', 30, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_proceed_deliverable`
--

CREATE TABLE `tbl_proceed_deliverable` (
  `pd_id` int(8) NOT NULL,
  `deliverable_id` int(8) NOT NULL,
  `precede` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project`
--

CREATE TABLE `tbl_project` (
  `project_id` int(8) NOT NULL,
  `creator_id` int(8) NOT NULL,
  `company_id` int(8) NOT NULL,
  `project_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `planned_start_date` date DEFAULT NULL,
  `planned_end_date` date DEFAULT NULL,
  `actual_start_date` date DEFAULT NULL,
  `actual_end_date` date DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_project`
--

INSERT INTO `tbl_project` (`project_id`, `creator_id`, `company_id`, `project_name`, `planned_start_date`, `planned_end_date`, `actual_start_date`, `actual_end_date`, `description`) VALUES
(3, 3, 3, 'Research App Logic', '2022-03-15', '2022-03-30', NULL, NULL, 'IKEA Project'),
(24, 3, 3, 'Frontend of IDL logistics ', NULL, NULL, NULL, NULL, NULL),
(25, 3, 3, 'Backend of IDL logistics ', '2022-04-29', '2022-05-06', '2022-04-29', '2022-05-06', ''),
(26, 3, 3, 'Feedback and Bug fix', NULL, NULL, NULL, NULL, NULL),
(27, 3, 3, 'Self Project', NULL, NULL, NULL, NULL, NULL),
(28, 7, 3, 'Test Project', NULL, NULL, NULL, NULL, NULL),
(29, 3, 3, 'Working Project', '2022-05-07', '2022-05-14', '2022-05-07', '2022-05-14', ''),
(30, 3, 3, 'Responsive Design', '2022-05-07', '2022-05-14', '2022-05-07', '2022-05-14', ''),
(31, 3, 3, 'Exceiption', '2022-05-07', '2022-05-14', '2022-05-07', '2022-05-14', ''),
(32, 3, 3, 'Project Model', '2022-05-09', '2022-05-16', '2022-05-09', '2022-05-16', ''),
(33, 3, 3, 'Add User Role', '2022-05-01', '2022-05-31', '2022-05-01', '2022-05-31', ''),
(35, 3, 3, 'IKEA LOGIN 1', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project_member`
--

CREATE TABLE `tbl_project_member` (
  `pm_id` int(8) NOT NULL,
  `project_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `is_manager` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_project_member`
--

INSERT INTO `tbl_project_member` (`pm_id`, `project_id`, `user_id`, `is_manager`) VALUES
(1, 35, 3, 1),
(2, 29, 22, 0),
(3, 24, 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_task_assign`
--

CREATE TABLE `tbl_task_assign` (
  `assign_id` int(8) NOT NULL,
  `task_id` int(8) NOT NULL,
  `member_id` int(8) NOT NULL,
  `role_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_task_assign`
--

INSERT INTO `tbl_task_assign` (`assign_id`, `task_id`, `member_id`, `role_id`) VALUES
(24, 42, 3, 3),
(25, 43, 3, 3),
(26, 44, 3, 3),
(27, 47, 3, 3),
(28, 49, 3, 3),
(30, 56, 3, 3),
(31, 56, 3, 3),
(32, 61, 3, 3),
(33, 61, 7, 3),
(34, 55, 21, 3),
(35, 50, 22, 3),
(36, 61, 21, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(8) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `avatar` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(1) NOT NULL DEFAULT '3',
  `registration_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `email`, `phone_number`, `password`, `display_name`, `birthday`, `avatar`, `role_id`, `registration_time`) VALUES
(3, 'admin@mail.com', '56345896541', '123456', 'Admin', NULL, NULL, 1, '2022-03-17 10:42:49'),
(7, 'puser@mail.com', '1235648542', '123456', 'Dorneld henli', NULL, NULL, 3, '2022-03-17 12:38:10'),
(20, 'testuser1@mail.com', '18600559433', '123456', 'Test user', NULL, NULL, 3, '2022-04-29 13:39:03'),
(21, 'common@mail.com', '18600559489', '123456', 'Common User', NULL, NULL, 3, '2022-05-08 06:32:36'),
(22, 'matin@mail.com', '111111111', '123456', 'matin', NULL, NULL, 3, '2022-05-13 13:18:08'),
(23, 'pmanager@mail.com', '123456789', '123456', 'Project Manager', NULL, NULL, 3, '2022-05-14 05:49:30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_client`
--

CREATE TABLE `tbl_user_client` (
  `uc_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `client_id` int(8) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_user_client`
--

INSERT INTO `tbl_user_client` (`uc_id`, `user_id`, `client_id`, `is_active`) VALUES
(1, 3, 1, 1),
(10, 3, 12, 1),
(11, 3, 13, 1),
(12, 3, 14, 1),
(13, 3, 15, 1),
(14, 3, 16, 1),
(15, 3, 17, 1),
(16, 3, 18, 1),
(17, 3, 19, 1),
(18, 3, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_company`
--

CREATE TABLE `tbl_user_company` (
  `uc_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `company_id` int(8) NOT NULL,
  `is_manager` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_user_company`
--

INSERT INTO `tbl_user_company` (`uc_id`, `user_id`, `company_id`, `is_manager`) VALUES
(4, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_week_priority`
--

CREATE TABLE `tbl_week_priority` (
  `wp_id` int(10) NOT NULL,
  `user_id` int(8) NOT NULL,
  `week` int(2) NOT NULL,
  `priority` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_id` int(8) DEFAULT NULL,
  `goal` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `is_completed` float DEFAULT NULL,
  `is_weekly` tinyint(1) DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_week_priority`
--

INSERT INTO `tbl_week_priority` (`wp_id`, `user_id`, `week`, `priority`, `project_id`, `goal`, `detail`, `is_completed`, `is_weekly`, `end_date`) VALUES
(18, 3, 17, 'Decrease font globally ', NULL, 'Bug fix ', '', 0, 0, NULL),
(19, 3, 17, 'Task page UI', NULL, 'Bug fix ', '', 0, 0, NULL),
(20, 3, 16, 'Account page logic and role', NULL, 'User role', '', 1, 0, '2022-04-29'),
(21, 3, 17, 'Week of Agenda calendar ', NULL, 'UI', '', 1, 0, '2022-05-07'),
(22, 3, 18, 'Priority interface fix', NULL, 'input enter key ', '', 0, 0, NULL),
(23, 3, 18, 'Form action by React Hook Form', NULL, 'form action', '', 0, 0, NULL),
(24, 3, 18, 'Reset of Form', NULL, 'form action', '', 0, 0, NULL),
(25, 3, 18, 'Form Reset Api', NULL, 'form action', '', 0, 0, NULL),
(26, 3, 18, 'Edit priority', NULL, 'Edit ', '', 1, 1, '2022-05-08'),
(27, 3, 18, 'Priority Tab', NULL, '', '', 0, 0, NULL),
(28, 3, 19, 'User role', NULL, '', '', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_work_setting`
--

CREATE TABLE `tbl_work_setting` (
  `ws_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `week` int(2) DEFAULT NULL,
  `year` int(5) NOT NULL,
  `first_day_of_week` date DEFAULT NULL,
  `work_on_week` int(1) DEFAULT NULL,
  `start_work_time` int(2) DEFAULT NULL,
  `end_work_time` int(2) DEFAULT NULL,
  `remainder` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_work_setting`
--

INSERT INTO `tbl_work_setting` (`ws_id`, `user_id`, `week`, `year`, `first_day_of_week`, `work_on_week`, `start_work_time`, `end_work_time`, `remainder`) VALUES
(261, 21, 1, 2022, '2022-01-04', 3, 7, 18, 3),
(262, 21, 2, 2022, '2022-01-10', 5, 9, 18, 3),
(263, 21, 3, 2022, '2022-01-17', 5, 9, 18, 3),
(264, 21, 4, 2022, '2022-01-24', 5, 9, 18, 3),
(265, 21, 5, 2022, '2022-01-31', 5, 9, 18, 3),
(266, 21, 6, 2022, '2022-02-07', 5, 9, 18, 3),
(267, 21, 7, 2022, '2022-02-14', 5, 9, 18, 3),
(268, 21, 8, 2022, '2022-02-21', 5, 9, 18, 3),
(269, 21, 9, 2022, '2022-02-28', 5, 9, 18, 3),
(270, 21, 10, 2022, '2022-03-07', 5, 9, 18, 3),
(271, 21, 11, 2022, '2022-03-14', 5, 9, 18, 3),
(272, 21, 12, 2022, '2022-03-21', 5, 9, 18, 3),
(273, 21, 13, 2022, '2022-03-28', 5, 9, 18, 3),
(274, 21, 14, 2022, '2022-04-04', 5, 9, 18, 3),
(275, 21, 15, 2022, '2022-04-11', 5, 9, 18, 3),
(276, 21, 16, 2022, '2022-04-18', 5, 9, 18, 3),
(277, 21, 17, 2022, '2022-04-25', 5, 9, 18, 3),
(278, 21, 18, 2022, '2022-05-02', 5, 9, 18, 3),
(279, 21, 19, 2022, '2022-05-09', 5, 9, 18, 3),
(280, 21, 20, 2022, '2022-05-16', 5, 9, 18, 3),
(281, 21, 21, 2022, '2022-05-23', 5, 9, 18, 3),
(282, 21, 22, 2022, '2022-05-30', 5, 9, 18, 3),
(283, 21, 23, 2022, '2022-06-06', 5, 9, 18, 3),
(284, 21, 24, 2022, '2022-06-13', 5, 9, 18, 3),
(285, 21, 25, 2022, '2022-06-20', 5, 9, 18, 3),
(286, 21, 26, 2022, '2022-06-27', 5, 9, 18, 3),
(287, 21, 27, 2022, '2022-07-04', 5, 9, 18, 3),
(288, 21, 28, 2022, '2022-07-11', 5, 9, 18, 3),
(289, 21, 29, 2022, '2022-07-18', 5, 9, 18, 3),
(290, 21, 30, 2022, '2022-07-25', 5, 9, 18, 3),
(291, 21, 31, 2022, '2022-08-01', 5, 9, 18, 3),
(292, 21, 32, 2022, '2022-08-08', 5, 9, 18, 3),
(293, 21, 33, 2022, '2022-08-15', 5, 9, 18, 3),
(294, 21, 34, 2022, '2022-08-22', 5, 9, 18, 3),
(295, 21, 35, 2022, '2022-08-29', 5, 9, 18, 3),
(296, 21, 36, 2022, '2022-09-05', 5, 9, 18, 3),
(297, 21, 37, 2022, '2022-09-12', 5, 9, 18, 3),
(298, 21, 38, 2022, '2022-09-19', 5, 9, 18, 3),
(299, 21, 39, 2022, '2022-09-26', 5, 9, 18, 3),
(300, 21, 40, 2022, '2022-10-03', 5, 9, 18, 3),
(301, 21, 41, 2022, '2022-10-10', 5, 9, 18, 3),
(302, 21, 42, 2022, '2022-10-17', 5, 9, 18, 3),
(303, 21, 43, 2022, '2022-10-24', 5, 9, 18, 3),
(304, 21, 44, 2022, '2022-10-31', 5, 9, 18, 3),
(305, 21, 45, 2022, '2022-11-07', 5, 9, 18, 3),
(306, 21, 46, 2022, '2022-11-14', 5, 9, 18, 3),
(307, 21, 47, 2022, '2022-11-21', 5, 9, 18, 3),
(308, 21, 48, 2022, '2022-11-28', 5, 9, 18, 3),
(309, 21, 49, 2022, '2022-12-05', 5, 9, 18, 3),
(310, 21, 50, 2022, '2022-12-12', 5, 9, 18, 3),
(311, 21, 51, 2022, '2022-12-19', 5, 9, 18, 3),
(312, 21, 52, 2022, '2022-12-26', 5, 9, 18, 3),
(313, 3, 1, 2022, '2022-01-03', 5, 9, 18, 3),
(314, 3, 2, 2022, '2022-01-10', 5, 9, 18, 3),
(315, 3, 3, 2022, '2022-01-17', 5, 9, 18, 3),
(316, 3, 4, 2022, '2022-01-24', 5, 9, 18, 3),
(317, 3, 5, 2022, '2022-01-31', 5, 9, 18, 3),
(318, 3, 6, 2022, '2022-02-07', 5, 9, 18, 3),
(319, 3, 7, 2022, '2022-02-14', 5, 9, 18, 3),
(320, 3, 8, 2022, '2022-02-21', 5, 9, 18, 3),
(321, 3, 9, 2022, '2022-02-28', 5, 9, 18, 3),
(322, 3, 10, 2022, '2022-03-07', 5, 9, 18, 3),
(323, 3, 11, 2022, '2022-03-14', 5, 9, 18, 3),
(324, 3, 12, 2022, '2022-03-21', 5, 9, 18, 3),
(325, 3, 13, 2022, '2022-03-28', 5, 9, 18, 3),
(326, 3, 14, 2022, '2022-04-04', 5, 9, 18, 3),
(327, 3, 15, 2022, '2022-04-11', 5, 9, 18, 3),
(328, 3, 16, 2022, '2022-04-18', 5, 9, 18, 3),
(329, 3, 17, 2022, '2022-04-25', 5, 9, 18, 3),
(330, 3, 18, 2022, '2022-05-02', 5, 9, 18, 3),
(331, 3, 19, 2022, '2022-05-09', 3, 9, 18, 3),
(332, 3, 20, 2022, '2022-05-16', 5, 9, 18, 3),
(333, 3, 21, 2022, '2022-05-23', 5, 9, 18, 3),
(334, 3, 22, 2022, '2022-05-30', 5, 9, 18, 3),
(335, 3, 23, 2022, '2022-06-06', 5, 9, 18, 3),
(336, 3, 24, 2022, '2022-06-13', 5, 9, 18, 3),
(337, 3, 25, 2022, '2022-06-20', 5, 9, 18, 3),
(338, 3, 26, 2022, '2022-06-27', 5, 9, 18, 3),
(339, 3, 27, 2022, '2022-07-04', 5, 9, 18, 3),
(340, 3, 28, 2022, '2022-07-11', 5, 9, 18, 3),
(341, 3, 29, 2022, '2022-07-18', 5, 9, 18, 3),
(342, 3, 30, 2022, '2022-07-25', 5, 9, 18, 3),
(343, 3, 31, 2022, '2022-08-01', 5, 9, 18, 3),
(344, 3, 32, 2022, '2022-08-08', 5, 9, 18, 3),
(345, 3, 33, 2022, '2022-08-15', 5, 9, 18, 3),
(346, 3, 34, 2022, '2022-08-22', 5, 9, 18, 3),
(347, 3, 35, 2022, '2022-08-29', 5, 9, 18, 3),
(348, 3, 36, 2022, '2022-09-05', 5, 9, 18, 3),
(349, 3, 37, 2022, '2022-09-12', 5, 9, 18, 3),
(350, 3, 38, 2022, '2022-09-19', 5, 9, 18, 3),
(351, 3, 39, 2022, '2022-09-26', 5, 9, 18, 3),
(352, 3, 40, 2022, '2022-10-03', 5, 9, 18, 3),
(353, 3, 41, 2022, '2022-10-10', 5, 9, 18, 3),
(354, 3, 42, 2022, '2022-10-17', 5, 9, 18, 3),
(355, 3, 43, 2022, '2022-10-24', 5, 9, 18, 3),
(356, 3, 44, 2022, '2022-10-31', 5, 9, 18, 3),
(357, 3, 45, 2022, '2022-11-07', 5, 9, 18, 3),
(358, 3, 46, 2022, '2022-11-14', 5, 9, 18, 3),
(359, 3, 47, 2022, '2022-11-21', 5, 9, 18, 3),
(360, 3, 48, 2022, '2022-11-28', 5, 9, 18, 3),
(361, 3, 49, 2022, '2022-12-05', 5, 9, 18, 3),
(362, 3, 50, 2022, '2022-12-12', 5, 9, 18, 3),
(363, 3, 51, 2022, '2022-12-19', 5, 9, 18, 3),
(364, 3, 52, 2022, '2022-12-26', 5, 9, 18, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mst_client`
--
ALTER TABLE `mst_client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `mst_company`
--
ALTER TABLE `mst_company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `mst_role`
--
ALTER TABLE `mst_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tbl_account_setting`
--
ALTER TABLE `tbl_account_setting`
  ADD PRIMARY KEY (`as_id`),
  ADD UNIQUE KEY `userId` (`user_id`);

--
-- Indexes for table `tbl_client_project`
--
ALTER TABLE `tbl_client_project`
  ADD PRIMARY KEY (`cp_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `tbl_company_member`
--
ALTER TABLE `tbl_company_member`
  ADD PRIMARY KEY (`cm_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `tbl_deliverable`
--
ALTER TABLE `tbl_deliverable`
  ADD PRIMARY KEY (`deliverable_id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `periority_id` (`periority_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_precede_task`
--
ALTER TABLE `tbl_precede_task`
  ADD PRIMARY KEY (`precede_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `tbl_priority_agenda`
--
ALTER TABLE `tbl_priority_agenda`
  ADD PRIMARY KEY (`pa_id`),
  ADD KEY `wp_id` (`wp_id`);

--
-- Indexes for table `tbl_priority_file`
--
ALTER TABLE `tbl_priority_file`
  ADD PRIMARY KEY (`pf_id`),
  ADD KEY `priority_id` (`priority_id`);

--
-- Indexes for table `tbl_priority_task`
--
ALTER TABLE `tbl_priority_task`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `creator_id` (`creator_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `tbl_proceed_deliverable`
--
ALTER TABLE `tbl_proceed_deliverable`
  ADD PRIMARY KEY (`pd_id`),
  ADD KEY `deliverable_id` (`deliverable_id`);

--
-- Indexes for table `tbl_project`
--
ALTER TABLE `tbl_project`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `creator_id` (`creator_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `tbl_project_member`
--
ALTER TABLE `tbl_project_member`
  ADD PRIMARY KEY (`pm_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `tbl_task_assign`
--
ALTER TABLE `tbl_task_assign`
  ADD PRIMARY KEY (`assign_id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_num` (`phone_number`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `tbl_user_client`
--
ALTER TABLE `tbl_user_client`
  ADD PRIMARY KEY (`uc_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `tbl_user_company`
--
ALTER TABLE `tbl_user_company`
  ADD PRIMARY KEY (`uc_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `tbl_week_priority`
--
ALTER TABLE `tbl_week_priority`
  ADD PRIMARY KEY (`wp_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `tbl_work_setting`
--
ALTER TABLE `tbl_work_setting`
  ADD PRIMARY KEY (`ws_id`),
  ADD KEY `company_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mst_client`
--
ALTER TABLE `mst_client`
  MODIFY `client_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `mst_company`
--
ALTER TABLE `mst_company`
  MODIFY `company_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mst_role`
--
ALTER TABLE `mst_role`
  MODIFY `role_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_account_setting`
--
ALTER TABLE `tbl_account_setting`
  MODIFY `as_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_client_project`
--
ALTER TABLE `tbl_client_project`
  MODIFY `cp_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `tbl_company_member`
--
ALTER TABLE `tbl_company_member`
  MODIFY `cm_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `tbl_deliverable`
--
ALTER TABLE `tbl_deliverable`
  MODIFY `deliverable_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `login_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT for table `tbl_precede_task`
--
ALTER TABLE `tbl_precede_task`
  MODIFY `precede_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_priority_agenda`
--
ALTER TABLE `tbl_priority_agenda`
  MODIFY `pa_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_priority_file`
--
ALTER TABLE `tbl_priority_file`
  MODIFY `pf_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_priority_task`
--
ALTER TABLE `tbl_priority_task`
  MODIFY `task_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `tbl_proceed_deliverable`
--
ALTER TABLE `tbl_proceed_deliverable`
  MODIFY `pd_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_project`
--
ALTER TABLE `tbl_project`
  MODIFY `project_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `tbl_project_member`
--
ALTER TABLE `tbl_project_member`
  MODIFY `pm_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_task_assign`
--
ALTER TABLE `tbl_task_assign`
  MODIFY `assign_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `tbl_user_client`
--
ALTER TABLE `tbl_user_client`
  MODIFY `uc_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tbl_user_company`
--
ALTER TABLE `tbl_user_company`
  MODIFY `uc_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_week_priority`
--
ALTER TABLE `tbl_week_priority`
  MODIFY `wp_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tbl_work_setting`
--
ALTER TABLE `tbl_work_setting`
  MODIFY `ws_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_account_setting`
--
ALTER TABLE `tbl_account_setting`
  ADD CONSTRAINT `tbl_account_setting_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_client_project`
--
ALTER TABLE `tbl_client_project`
  ADD CONSTRAINT `tbl_client_project_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_client_project_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `mst_client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_company_member`
--
ALTER TABLE `tbl_company_member`
  ADD CONSTRAINT `tbl_company_member_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `mst_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_company_member_ibfk_4` FOREIGN KEY (`member_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_company_member_ibfk_5` FOREIGN KEY (`company_id`) REFERENCES `mst_company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_deliverable`
--
ALTER TABLE `tbl_deliverable`
  ADD CONSTRAINT `tbl_deliverable_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tbl_priority_task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_deliverable_ibfk_2` FOREIGN KEY (`periority_id`) REFERENCES `tbl_week_priority` (`wp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD CONSTRAINT `tbl_login_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_precede_task`
--
ALTER TABLE `tbl_precede_task`
  ADD CONSTRAINT `tbl_precede_task_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tbl_priority_task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_priority_agenda`
--
ALTER TABLE `tbl_priority_agenda`
  ADD CONSTRAINT `tbl_priority_agenda_ibfk_2` FOREIGN KEY (`wp_id`) REFERENCES `tbl_week_priority` (`wp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_priority_file`
--
ALTER TABLE `tbl_priority_file`
  ADD CONSTRAINT `tbl_priority_file_ibfk_1` FOREIGN KEY (`priority_id`) REFERENCES `tbl_week_priority` (`wp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_priority_task`
--
ALTER TABLE `tbl_priority_task`
  ADD CONSTRAINT `tbl_priority_task_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_priority_task_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_proceed_deliverable`
--
ALTER TABLE `tbl_proceed_deliverable`
  ADD CONSTRAINT `tbl_proceed_deliverable_ibfk_1` FOREIGN KEY (`deliverable_id`) REFERENCES `tbl_deliverable` (`deliverable_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_project`
--
ALTER TABLE `tbl_project`
  ADD CONSTRAINT `tbl_project_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_project_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `mst_company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_project_member`
--
ALTER TABLE `tbl_project_member`
  ADD CONSTRAINT `tbl_project_member_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_project_member_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_task_assign`
--
ALTER TABLE `tbl_task_assign`
  ADD CONSTRAINT `tbl_task_assign_ibfk_4` FOREIGN KEY (`member_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_task_assign_ibfk_5` FOREIGN KEY (`task_id`) REFERENCES `tbl_priority_task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `mst_role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_user_client`
--
ALTER TABLE `tbl_user_client`
  ADD CONSTRAINT `tbl_user_client_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_user_client_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `mst_client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_week_priority`
--
ALTER TABLE `tbl_week_priority`
  ADD CONSTRAINT `tbl_week_priority_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_week_priority_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_work_setting`
--
ALTER TABLE `tbl_work_setting`
  ADD CONSTRAINT `tbl_work_setting_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
