-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for exam_gate
CREATE DATABASE IF NOT EXISTS `exam_gate` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `exam_gate`;

-- Dumping structure for table exam_gate.login
CREATE TABLE IF NOT EXISTS `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `college` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exam_gate.login: ~6 rows (approximately)
DELETE FROM `login`;
INSERT INTO `login` (`id`, `user_name`, `pass`, `email`, `college`) VALUES
	(1, 'aditya', 'pass', 'asdf', 'sdf'),
	(2, 'fuck', 'fuck', 'fuck', 'fuck'),
	(3, 'suck', 'suck', 'suck', 'suck'),
	(4, 'aditya', 'aditya', 'adiaya', 'sdf'),
	(5, 'user', 'user', 'user', 'user'),
	(6, 'jadu', 'jadu', 'jadugmail.com', 'csmss');

-- Dumping structure for table exam_gate.question
CREATE TABLE IF NOT EXISTS `question` (
  `qid` int NOT NULL AUTO_INCREMENT,
  `que` varchar(50) DEFAULT NULL,
  `o1` varchar(50) DEFAULT NULL,
  `o2` varchar(50) DEFAULT NULL,
  `o3` varchar(50) DEFAULT NULL,
  `o4` varchar(50) DEFAULT NULL,
  `test_no` int DEFAULT NULL,
  `coorect` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`qid`),
  KEY `test_no` (`test_no`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`test_no`) REFERENCES `test_name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exam_gate.question: ~8 rows (approximately)
DELETE FROM `question`;
INSERT INTO `question` (`qid`, `que`, `o1`, `o2`, `o3`, `o4`, `test_no`, `coorect`) VALUES
	(1, 'asd', 'sdf', 'dsf', '4', '4', 6, 'sdf'),
	(2, 'asd', 'asd', '3', 'sdf', '12', 6, 'asd'),
	(3, 'asd', '2', '12', 'dsf', '12', 7, '2'),
	(4, 'sdf', 'asd', '3', 'sdf', '4', 7, 'asd'),
	(5, 'asd', '2', 'sd', '12', '4', 8, '2'),
	(6, 'asd', 'asd', '3', 'sdf', '12', 8, 'asd'),
	(7, 'asd', 'asd', '3', '45', 'asdf', 9, 'asd'),
	(8, 'asd', '2', 'asdf', 'sdf', 'asdf', 9, 'asdf');

-- Dumping structure for table exam_gate.test_name
CREATE TABLE IF NOT EXISTS `test_name` (
  `id` int NOT NULL AUTO_INCREMENT,
  `testname` varchar(100) DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `test_duration` time DEFAULT (NULL),
  `ch_test_no` int DEFAULT (NULL),
  `week_test_no` int DEFAULT (NULL),
  `topic_name` varchar(100) DEFAULT NULL,
  `no_of_question` int DEFAULT NULL,
  `test_date` date DEFAULT (NULL),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exam_gate.test_name: ~4 rows (approximately)
DELETE FROM `test_name`;
INSERT INTO `test_name` (`id`, `testname`, `test_type`, `test_duration`, `ch_test_no`, `week_test_no`, `topic_name`, `no_of_question`, `test_date`) VALUES
	(6, 'Test No 3', 'Chapter_wise_test', NULL, 3, NULL, '12', 2, NULL),
	(7, 'Test No 4', 'Chapter_wise_test', NULL, 4, NULL, 'asdf', 2, NULL),
	(8, 'Test No 1', 'Weekly_test', '12:12:00', NULL, 1, 'sad', 2, '2023-07-08'),
	(9, 'Test No 5', 'Chapter_wise_test', NULL, 5, NULL, 'data', 2, NULL);

-- Dumping structure for table exam_gate.user_progress
CREATE TABLE IF NOT EXISTS `user_progress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_name` varchar(100) DEFAULT NULL,
  `Test_type` varchar(100) DEFAULT NULL,
  `Total_marks` varchar(100) DEFAULT NULL,
  `Total_question` varchar(100) DEFAULT NULL,
  `marks_obtain` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exam_gate.user_progress: ~3 rows (approximately)
DELETE FROM `user_progress`;
INSERT INTO `user_progress` (`id`, `test_name`, `Test_type`, `Total_marks`, `Total_question`, `marks_obtain`, `user_id`) VALUES
	(1, 'Test No 3', 'Chapter_wise_test', '2', '2', '2', 3),
	(2, 'Test No 3', 'Chapter_wise_test', '2', '2', '2', 4),
	(3, 'Test No 3', 'Chapter_wise_test', '2', '2', '2', 6);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
