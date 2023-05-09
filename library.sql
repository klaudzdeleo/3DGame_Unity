-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2022 at 09:06 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `isbn` int(13) NOT NULL,
  `book_title` varchar(50) NOT NULL,
  `book_desc` tinytext NOT NULL,
  `author` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`isbn`, `book_title`, `book_desc`, `author`) VALUES
(898534990, 'Engineers Survival Guide', 'Advice, tactics, and tricks After a decade of working at Facebook, Snapchat, and Microsoft ', 'Merih Taze'),
(1138632058, 'The Art of Game Design: A Book of Lenses', 'Game Design', 'Jesse Schell'),
(1492051365, 'Introducing Python', 'Easy to understand and fun to read, this updated edition of Introducing Python is ideal for beginning programmers as well as those new to the language. Author Bill Lubanovic takes you from the basics to more involved and varied topics, mixing tutorials wi', ' Bill Lubanovic'),
(1492055751, 'JavaScript Cookbook', 'his cookbook is chock-full of code recipes for common programming tasks, along with techniques for building apps that work in any browser', 'Adam D. Scott '),
(1492056278, 'Learning Java', 'If you’re new to Java—or new to programming—this best-selling book will guide you through the language features and APIs of Java 11.', 'Marc Loy'),
(1492093823, 'Learning PHP, MySQL & JavaScript', 'Build interactive, data-driven websites with the potent combination of open source technologies and web standards', 'Robin Nixon'),
(1732055718, 'The PMP Exam', 'This book is based on the 6th Edition PMBOK® Guide & has been fully updated for the Jan 2021 PMP exam, including the all-important agile content. The PMP Exam: How to Pass on Your First Try provides all the information project managers need to thoroughly', ' Andy Crowe'),
(2147483647, 'JavaScript and jQuery', 'Learn JavaScript and JQuery', 'Adam Nixon');

-- --------------------------------------------------------

--
-- Table structure for table `borrowed_books`
--

CREATE TABLE `borrowed_books` (
  `bw_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `book_isbn` int(11) NOT NULL,
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrowed_books`
--

INSERT INTO `borrowed_books` (`bw_id`, `profile_id`, `book_isbn`, `start_date`) VALUES
(1, 2, 898534990, '2022-05-01'),
(2, 2, 1492051365, '2022-05-02'),
(3, 3, 1138632058, '2022-05-08'),
(4, 1, 1732055718, '2022-05-29'),
(5, 4, 1492055751, '2022-05-23'),
(6, 4, 2147483647, '2022-05-08');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`user_id`, `username`, `email`, `password`) VALUES
(1, 'Layla', 'layla@layla.com', '$2y$10$OMsUPMQpZqumDfERc7rG6uv/4Ilvy3vyGU83yyWmE/VOWfMlQI1dq '),
(2, 'Meshal', 'Meshal@meshal.com', '$2y$10$/bNxRBtMNZUb6/xOyiGngeiRL4BLseGDPat3x8ZFfdZUJc5k6yQxC '),
(3, 'Osama', 'Osama@Osama.com', '$2y$10$LqzgHlHMUEDGdmGH2d0uwezCxJGip/L94123EGsQ4yNYQLZAByRli '),
(4, 'Faris', 'Faris@Faris.com', '$2y$10$SPQCX/pKtrui8Brtx.6QkuwmzsKxPOnJmrS2jRA4uFApTWadzq4nS '),
(5, 'Alanoud', 'Alanoud@Alanoud.com', '$2y$10$iOLutNIdZi03huh7/ZJ7k.LsyEzGurCimGoCuxDzBmuv52qrwbt8C ');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `profile_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `phone` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`profile_id`, `user_id`, `first_name`, `last_name`, `phone`) VALUES
(1, 1, 'Layla', 'Albabtain', '0555555555'),
(2, 5, 'Alanoud', 'Alqahtani', '0555555550'),
(3, 4, 'Faris', 'Almoqbel', '0555555551'),
(4, 2, 'Meshal', 'Almosa', '0555555552');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`isbn`);

--
-- Indexes for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  ADD PRIMARY KEY (`bw_id`),
  ADD KEY `profile_Book_FK` (`profile_id`),
  ADD KEY `Book_Book_FK` (`book_isbn`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `user_Profile_FK` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  MODIFY `bw_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  ADD CONSTRAINT `Book_Book_FK` FOREIGN KEY (`book_isbn`) REFERENCES `books` (`isbn`),
  ADD CONSTRAINT `profile_Book_FK` FOREIGN KEY (`profile_id`) REFERENCES `user_profile` (`profile_id`);

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_Profile_FK` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
