-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2023 at 09:20 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enrollment_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `id` int(30) NOT NULL,
  `student_id` int(30) NOT NULL,
  `school_year` int(30) NOT NULL,
  `level_section_id` int(30) NOT NULL,
  `faculty_id` int(30) NOT NULL,
  `status` tinyint(30) NOT NULL DEFAULT 1 COMMENT '0 = inactive , 1 = Active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`id`, `student_id`, `school_year`, `level_section_id`, `faculty_id`, `status`, `date_updated`) VALUES
(2, 8, 2, 1, 1, 1, '2020-09-11 15:45:50'),
(3, 9, 2, 3, 2, 1, '2023-11-22 09:59:12'),
(4, 9, 5, 3, 2, 0, '2023-11-23 11:04:24'),
(5, 10, 5, 3, 2, 1, '2023-11-23 10:03:02'),
(6, 8, 5, 4, 3, 1, '2023-11-23 10:04:54'),
(7, 11, 5, 4, 3, 1, '2023-11-23 10:09:13'),
(8, 12, 5, 3, 2, 1, '2023-11-23 10:17:51'),
(9, 13, 5, 3, 2, 1, '2023-11-23 10:31:04'),
(10, 14, 5, 4, 3, 1, '2023-11-23 11:06:19'),
(11, 15, 5, 6, 4, 1, '2023-11-23 16:04:38'),
(12, 0, 5, 4, 3, 1, '2023-11-24 09:33:37'),
(13, 0, 5, 0, 0, 1, '2023-11-27 19:42:59');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(30) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `level_section_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = Inactive , 1 = Active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `firstname`, `middlename`, `lastname`, `level_section_id`, `user_id`, `status`, `date_updated`) VALUES
(1, 'John', '', 'Smith', 1, 4, 0, '2023-11-23 09:09:31'),
(2, 'Franz Philip', 'B', 'Saculles', 3, 5, 1, '2023-11-22 09:58:45'),
(3, 'Susuna', 'G.', 'Mangrobang', 4, 6, 1, '2023-11-23 09:10:49'),
(4, 'Joseph', '', 'Cosning', 6, 7, 0, '2023-11-24 11:52:47'),
(5, 'Rhina', 'G.', 'Gonzales', 6, 8, 1, '2023-11-27 20:36:24');

-- --------------------------------------------------------

--
-- Table structure for table `last_school`
--

CREATE TABLE `last_school` (
  `id` int(30) NOT NULL,
  `last_school` text NOT NULL,
  `last_address` text NOT NULL,
  `enrollment_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `last_school`
--

INSERT INTO `last_school` (`id`, `last_school`, `last_address`, `enrollment_id`) VALUES
(1, 'Sample Schoolll', 'Sample School address', 2),
(2, 'Juan G. Macaraeg National High School', 'Canarvacanan Binalonan Pangasinan', 3),
(3, 'Juan G', 'Bugayong Binalonan Pangasinan', 4),
(4, 'loaoacnational high school', 'binalonan pangasinan', 5),
(5, 'juan G.macaraeg national high scool', 'sumabnit binalonan pangasinan', 6),
(6, 'sumabnit elementary school', 'submabnit binalonan', 7),
(7, 'Capas Elementary School', 'Capas Binalonan Pangasinan', 8),
(8, 'Laoac National high School', 'Laoac Pangasinan', 9),
(9, 'Pozorrubio national high school', 'Pozorrubio pangasinan', 10),
(10, 'Juan G Macaraeg National High School', 'Canarvacanan Binalonan Pangasinan', 11),
(11, 'Bugayong Integrated School', 'Bugayong Binalonan Pangasinan', 12),
(12, 'Bugayong Integrated School', 'Bugayong Binalonan Pangasinan', 13);

-- --------------------------------------------------------

--
-- Table structure for table `level_section`
--

CREATE TABLE `level_section` (
  `id` int(30) NOT NULL,
  `level` varchar(20) NOT NULL,
  `section` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = Inactive , 1 = Active',
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level_section`
--

INSERT INTO `level_section` (`id`, `level`, `section`, `status`, `date_updated`) VALUES
(1, 'Grade 1', 'A', 1, NULL),
(2, 'Grade 1', 'B', 1, NULL),
(3, 'Grade 1', 'C', 1, NULL),
(4, 'Grade 2', 'A', 1, '2020-09-11 09:20:32'),
(6, 'Grade 12 HUMSS', 'A', 1, NULL),
(7, 'Grade 11', 'A', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `school_year`
--

CREATE TABLE `school_year` (
  `id` int(30) NOT NULL,
  `school_year` varchar(100) NOT NULL,
  `is_on` tinyint(1) DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = Inactive, 1 = Active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `school_year`
--

INSERT INTO `school_year` (`id`, `school_year`, `is_on`, `status`, `date_updated`) VALUES
(1, 'SY 2018-2019', 0, 1, '2023-11-23 15:54:01'),
(2, 'SY 2019-2020', 0, 1, '2023-11-24 09:42:27'),
(3, 'SY 2017-2018', 0, 1, '2020-09-11 13:09:32'),
(4, 'SY 2016-2017', 0, 1, '2023-11-22 20:02:41'),
(5, 'SY 2023-2024', 1, 1, '2023-11-24 09:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `img_path` text NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `address`, `img_path`, `date_updated`) VALUES
(1, 'Bugayong Integrated School', 'Bugayong Binalonan Pangasinan', '1700646840_school-logo.png', '2023-11-22 17:54:51');

-- --------------------------------------------------------

--
-- Table structure for table `student_list`
--

CREATE TABLE `student_list` (
  `id` int(30) NOT NULL,
  `student_code` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `address` text NOT NULL,
  `contact_person` varchar(200) NOT NULL,
  `cp_relation` varchar(100) NOT NULL,
  `cp_number` varchar(100) NOT NULL,
  `cp_address` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1= new , 2 =regular,3=transferee , 4= returnee',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = inactive , 1= active',
  `date_created` date NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_list`
--

INSERT INTO `student_list` (`id`, `student_code`, `firstname`, `middlename`, `lastname`, `gender`, `dob`, `address`, `contact_person`, `cp_relation`, `cp_number`, `cp_address`, `type`, `status`, `date_created`, `date_updated`) VALUES
(8, '2020-00001\n', 'Rose ann', 'O.', 'Ramos', 'female', '2014-06-23', 'Test', '', '', '', '', 1, 1, '2020-09-11', '2023-11-23 10:05:42'),
(9, '2023-00001\n', 'Bryll Joseph', 'Contaoi', 'Cosning', 'male', '2002-05-10', 'Vacante Binalonan Pangasinan', '', '', '', '', 1, 1, '2023-11-22', '2023-11-22 09:57:37'),
(10, '2023-00002\n', 'king david', 'F.', 'Progreso', 'male', '2023-11-23', 'laoac Pangasinan', '', '', '', '', 3, 1, '2023-11-23', '2023-11-23 10:03:02'),
(11, '2023-00003\n', 'clydel', 'F', 'encomienda', 'female', '2023-11-23', 'sumabnit binalonan', '', '', '', '', 1, 1, '2023-11-23', '2023-11-23 10:09:13'),
(12, '2023-00004\n', 'Mhark', 'Soriano', 'Esquejo', 'male', '1976-01-03', 'Capas, Binalonan Pangasinan', '', '', '', '', 1, 1, '2023-11-23', '2023-11-23 10:17:51'),
(13, '2023-00005\n', 'Reizza', 'D', 'Danao', 'female', '2001-06-19', 'Laoac Pangasinan', '', '', '', '', 1, 1, '2023-11-23', '2023-11-23 10:31:04'),
(14, '2023-00006\n', 'Robert', 'B', 'Gonzales', 'male', '2001-08-05', 'Pozorrubio pangasinan', '', '', '', '', 1, 1, '2023-11-23', '2023-11-23 11:06:19'),
(15, '2023-00007\n', 'Bryll ', '', 'Cosning', 'male', '2002-05-10', 'Vacante, Binalonan, Pangasinan', '', '', '', '', 1, 1, '2023-11-23', '2023-11-23 16:04:38');

-- --------------------------------------------------------

--
-- Table structure for table `student_subject`
--

CREATE TABLE `student_subject` (
  `id` int(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `schedule` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(150) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = admin',
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
(1, 'Administrator', 1, 'admin', 'admin123', 1, '2020-09-08 16:42:28'),
(2, 'John Smith', 1, 'jsmth', 'admin123', 1, '2020-09-08 16:13:53'),
(3, 'Sample User', 1, 'sample', 'sampl123', 1, '2020-09-09 11:34:14'),
(4, 'John  Smith', 2, 'jsmith', 'admin123', 1, '2020-09-11 09:55:25'),
(5, 'Franz Philip B Saculles', 2, 'franzsaculles@gmail.com', '12345', 1, '2023-11-22 09:58:45'),
(6, 'Susuna G. Mangrobang', 2, 'susanamangrobang@gmail.co', 'mangrobang123', 1, '2023-11-23 09:10:49'),
(7, 'Joseph  Cosning', 2, 'josephcosning@gmail.com', '123456', 1, '2023-11-23 15:57:39'),
(8, 'Rhina G. Gonzales', 2, 'rhina@gmail.com', '12345', 1, '2023-11-27 20:36:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `last_school`
--
ALTER TABLE `last_school`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_section`
--
ALTER TABLE `level_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_year`
--
ALTER TABLE `school_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_list`
--
ALTER TABLE `student_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_subject`
--
ALTER TABLE `student_subject`
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
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `last_school`
--
ALTER TABLE `last_school`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `level_section`
--
ALTER TABLE `level_section`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `school_year`
--
ALTER TABLE `school_year`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_list`
--
ALTER TABLE `student_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `student_subject`
--
ALTER TABLE `student_subject`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
