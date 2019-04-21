-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2019 at 03:55 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thames_itclub`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_accounts`
--

CREATE TABLE `tbl_accounts` (
  `transaction_id` int(11) NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `transaction_title` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `event_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_accounts`
--

INSERT INTO `tbl_accounts` (`transaction_id`, `transaction_type`, `transaction_title`, `amount`, `remarks`, `added_date`, `event_id`) VALUES
(1, 'income', 'Membership Fee', 2500, '10 person paid', '2018-02-16 13:48:31', NULL),
(2, 'income', 'FiFa competition income', 3500, NULL, '2018-02-16 13:48:31', NULL),
(3, 'expenditure', 'PS4 for FIFa', 1000, NULL, '2018-02-16 13:49:25', NULL),
(4, 'expenditure', 'Refreshment', 1500, NULL, '2018-02-16 13:49:25', NULL),
(6, 'income', 'Club revenue from Stall', 2500, 'stall during fest', '2018-02-17 02:57:57', NULL),
(7, 'expenditure', 'payment to canteen', 1500, '', '2018-02-22 12:32:09', NULL),
(8, 'expenditure', 'Prizes for FIFA competition', 1500, 'bought in new road', '2018-02-24 02:33:05', NULL),
(9, 'income', 'budget from college', 5000, '', '2018-02-24 06:56:20', NULL),
(10, 'expenditure', 'Monthly Cake ', 500, '', '2018-03-15 04:50:12', NULL),
(11, 'income', 'Registration Fee from Event', 1200, '', '2018-03-15 05:06:23', NULL),
(12, 'expenditure', 'payments to Event Instructor', 1000, '', '2018-03-15 05:52:48', 2),
(13, 'income', 'Rectification for Payment to Instructor', 1000, '', '2018-03-15 05:59:51', NULL),
(14, 'expenditure', 'Buying Coke', 200, '', '2018-03-17 14:28:06', NULL),
(15, 'expenditure', 'advertisement expenses', 2500, NULL, '2018-04-28 08:46:32', 11),
(16, 'income', 'payments for equipments', 500, '', '2018-04-28 09:14:57', 11),
(17, 'expenditure', 'sundry expenses', 200, '', '2018-04-28 09:32:22', 3),
(18, 'income', 'Rectification sundry income', 200, '', '2018-04-28 09:33:40', 3),
(19, 'income', 'recieved from college', 1000, '', '2018-04-28 09:34:15', NULL),
(20, 'income', 'Registration Fee from Event', 3500, '', '2018-05-06 08:43:36', 1),
(21, 'expenditure', 'Equipments Charges', 800, 'PS4', '2018-05-06 08:45:04', 1),
(22, 'expenditure', 'printing and flex', 1000, '', '2018-05-06 08:49:01', 1),
(23, 'income', 'Registration Fee from Event', 3000, '', '2018-05-06 08:49:26', 2),
(24, 'expenditure', 'Equipments', 500, '', '2018-12-25 11:14:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comments`
--

CREATE TABLE `tbl_comments` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_comments`
--

INSERT INTO `tbl_comments` (`comment_id`, `post_id`, `member_id`, `comment`, `added_date`, `picture_id`) VALUES
(5, 5, 1, 'great', '2018-03-10 17:07:59', 1),
(6, 8, 1, 'congratulations ', '2018-03-22 11:09:12', 1),
(13, 8, 6, 'Welcome', '2018-03-18 05:43:47', 12),
(14, 8, 11, 'good Job', '2018-03-18 06:26:32', 15),
(15, 18, 1, 'Hello', '2018-04-15 06:46:03', 1),
(16, 20, 1, 'ok sure', '2018-04-16 07:34:40', 1),
(17, 21, 1, 'hello', '2018-06-06 03:58:48', 1),
(18, 23, 8, 'hello', '2018-07-28 11:18:20', 6),
(19, 25, 1, 'ok', '2018-07-31 11:57:52', 1),
(20, 27, 1, 'welcome raj', '2018-11-20 15:45:11', 1),
(21, 27, 15, 'thanks', '2018-11-20 15:45:56', 19),
(22, 29, 8, 'thanks', '2018-12-25 10:59:14', 6),
(23, 29, 16, 'thanks', '2018-12-25 11:04:24', 20);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_email_templates`
--

CREATE TABLE `tbl_email_templates` (
  `template_id` int(11) NOT NULL,
  `template_title` varchar(255) NOT NULL,
  `template_body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_email_templates`
--

INSERT INTO `tbl_email_templates` (`template_id`, `template_title`, `template_body`) VALUES
(1, 'General Meeting', '\r\nCircular No.: TITC/GM101/2017/, Nov 28, 2017\r\nTo	: Board Members and General Members\r\nFrom	: Lawoj Oli, Secretary 2017\r\nSubject	: General Meeting\r\n\r\nI would like to inform you that the next General members meeting is scheduled to be held as below, I request all the members to kindly be present in this meeting\r\n\r\nDate	:  \r\nTime	: \r\nVenue	: \r\n\r\nPreliminary/Opening Exercises:\r\n:Call to order\r\n:Welcome\r\n:Apology/Message\r\n:Establishment of Quorum\r\n\r\nAgendas:\r\n\r\n\r\nNote: \r\n\r\n\r\n\r\nBests,\r\nLawoj Oli\r\nSecretary 2018\r\nThames IT Club\r\nSent From Roit\'s Club Integration System\r\n\r\n'),
(2, 'Board Meeting', '\r\nCircular No.: TITC/BM101/2017/, Nov 28, 2017\r\nTo	: Board Members\r\nFrom	: Lawoj Oli, Secretary 2017\r\nSubject	: Board Meeting\r\n\r\nI would like to inform you that the next Board members meeting is scheduled to be held as below, I request all the members to kindly be present in this meeting\r\n\r\nDate	:  \r\nTime	: \r\nVenue	: \r\n\r\nPreliminary/Opening Exercises:\r\n:Call to order\r\n:Welcome\r\n:Apology/Message\r\n:Establishment of Quorum\r\n\r\nAgendas:\r\n\r\n\r\nNote: \r\n\r\n\r\n\r\nBests,\r\nLawoj Oli\r\nSecretary 2018\r\nThames IT Club\r\nSent From Roit\'s Club Integration System\r\n\r\n'),
(3, 'Event Invitation', ' Dear Member\r\nGreetings from Thames IT Club\r\n\r\nThames It Club would like to invite you to our upcoming event. the details of the event is provided below\r\n\r\nEVENT-NAME\r\nDate: \r\nTime: \r\nVenue:\r\nRegistration Fee:\r\n\r\nRegister here: FORM-LINK\r\n\r\nwe hope to see you there\r\n\r\nThank You \r\nThames IT Club Boards \r\n\r\nSent from Roit\'s Club Integration System\r\n\r\n                                \r\n                                '),
(4, 'Call for Volunteers', 'Dear Member\r\nGreatings from Thames IT Club\r\n\r\nWe are looking for volunteers for our upcoming event EVENT-NAME happening on EVENT-DATE.\r\n\r\nthis is a good opportunity to learn, gain experience and meet new people.\r\n\r\nWe hope to see you there.\r\n\r\nclick here to apply: FORM-LINK\r\n\r\nNote: Shortlisted candidates will be informed soon. \r\n\r\nAll the Best\r\n\r\nThank you\r\nThames IT Club Board \r\n\r\nSent from Roit\'s club integration system\r\n                                '),
(5, 'Welcome Mail', ' Hello\r\n\r\nWelcome to Thames IT Club. we are excited to have you in our team. We are looking forward to working together and having you as an integral part of out family.\r\n\r\nIf you have any questions regarding the club feel free to mail us and we\'ll get back to you.\r\n\r\nWe hope to have a great tenure together\r\n\r\nThank You\r\nThames IT CLub Board\r\n\r\nSent from Roit\'s Club Integration System\r\n\r\n                                ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_events`
--

CREATE TABLE `tbl_events` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(255) NOT NULL,
  `event_venue` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `event_coOrdinator` varchar(255) NOT NULL,
  `event_description` text NOT NULL,
  `event_status` tinyint(1) NOT NULL,
  `event_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_events`
--

INSERT INTO `tbl_events` (`event_id`, `event_title`, `event_venue`, `event_date`, `event_coOrdinator`, `event_description`, `event_status`, `event_image`) VALUES
(1, 'FIFA Competition ', 'Thames Premises', '2017-01-15', 'Anmol Shrestha', 'FIFA competition was organized by Thames IT Club on 15th November 2017. the event saw 44 participants battle it out for the title. the winner of the competition was Mr. Avinash Raya from BSW 3rd Year. this event was a huge success that helped the club to increase students participation', 0, 'img/portfolio/1.jpg'),
(2, 'Wordpress Workshop', 'Thames Auditorium', '2018-02-21', 'Lawoj Oli', 'Wordpress workshop was conducted to target students of BBA and BSW. the event was aimed to provide students with website building skills using wordpress. the event was faciliated by Mr Neson Bajracharya.', 1, 'img/portfolio/2.jpg'),
(3, 'Orientation Program', 'Thames Ground', '2017-11-08', 'Rohit Jung Karki', 'let\'s change the world', 1, 'img/portfolio/21.jpg'),
(8, 'Image UPload Test', 'home', '2018-02-16', 'Rohit Jung Karki', '                            file testing seems to work now so let\'s try to upload it in the right place now let\'s see editing too', 1, 'img/portfolio/Desert.jpg'),
(11, 'Javascript Traning', 'Thames Premises', '2018-03-18', 'Rohit Jung Karki', 'this is a single day javascript training workshop. it will include core javascript and jquery, this event will help students to understand fundamentals of javascript ,                       ', 0, 'img/portfolio/event.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_event_team`
--

CREATE TABLE `tbl_event_team` (
  `id` int(11) NOT NULL,
  `member_name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `event_id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_event_team`
--

INSERT INTO `tbl_event_team` (`id`, `member_name`, `role`, `event_id`, `description`) VALUES
(2, 'Anmol Shrestha', 'Co-Ordinator', 1, 'head of Event                                '),
(3, 'Rohit Jung Karki', 'Room 1 incharge', 1, 'head of gaming in room 1                                '),
(4, 'Lawoj Oli', 'Room 2 incharge', 1, 'head of gaming in room 2                                '),
(5, 'Lawoj Oli', 'Co-Ordinator', 2, 'head of event                                '),
(6, 'Ashis Basnet', 'Food Incharge', 2, 'arrange foods and drink for participant and instructor');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_meetings`
--

CREATE TABLE `tbl_meetings` (
  `meeting_id` int(11) NOT NULL,
  `meeting_title` varchar(255) NOT NULL,
  `meeting_date` datetime NOT NULL,
  `meeting_venue` varchar(255) NOT NULL,
  `meeting_agenda` text NOT NULL,
  `meeting_decisions` text,
  `meeting_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_meetings`
--

INSERT INTO `tbl_meetings` (`meeting_id`, `meeting_title`, `meeting_date`, `meeting_venue`, `meeting_agenda`, `meeting_decisions`, `meeting_type`) VALUES
(1, 'general Meeting 101', '2018-02-15 11:30:00', 'Room No B101', '                            1. FIFA Competition\r\n2. Selection of Executive Member\r\n                            ', 'FIFA competition completed                       \r\n                            ', 'General Meeting'),
(2, 'Board Meeting 101', '2018-03-21 12:00:00', 'Room No B101', ' 1-New Events\r\n2-Increasing Club Budget\r\n                            ', 'New event will be hosted this month and more budget will be asked to college\r\n                            ', 'Board Meeting'),
(3, 'general Meeting 102', '2018-05-11 10:30:00', 'Room no B101', '1- New Events Planning\r\n2- New Features Testing                                ', '                                ', 'General Meeting'),
(4, 'GM103', '2018-05-21 11:00:00', 'Room B102', '1-orientation for new members\r\n2- planning new events', '                                ', 'General Meeting'),
(5, 'GM104', '2018-11-21 11:00:00', 'Thames Auditorium', '1. New Members Welcome\r\n2. New Board Weicome\r\n3. Event Planning          ', '                                ', 'General Meeting');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_meeting_response`
--

CREATE TABLE `tbl_meeting_response` (
  `response_id` int(11) NOT NULL,
  `response` varchar(255) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_meeting_response`
--

INSERT INTO `tbl_meeting_response` (`response_id`, `response`, `meeting_id`, `member_id`, `added_date`, `comment`) VALUES
(1, 'Going', 3, 1, '2018-05-06 16:49:23', ''),
(2, 'Going', 3, 2, '2018-05-06 17:33:07', ''),
(3, 'Not Going', 3, 10, '2018-05-07 09:59:04', 'I have class'),
(4, 'Maybe', 3, 12, '2018-05-07 09:59:29', ''),
(5, 'Going', 3, 11, '2018-05-07 09:59:45', ''),
(6, 'Not Going', 3, 8, '2018-05-07 10:00:14', 'i have other work'),
(7, 'Going', 4, 2, '2018-05-21 10:05:03', ''),
(8, 'Going', 5, 1, '2018-11-20 16:05:09', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_members`
--

CREATE TABLE `tbl_members` (
  `member_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `stream` varchar(255) NOT NULL,
  `semester` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_members`
--

INSERT INTO `tbl_members` (`member_id`, `first_name`, `last_name`, `email`, `contact_no`, `stream`, `semester`, `username`, `password`, `designation`, `added_date`, `modified_date`, `status`) VALUES
(1, 'Rohit', 'Jung Karki', 'rohit.bim1360@thamescollege.edu.np', '9843933569', 'BIM', 'Fifth', 'president', '123456', 'ROLE_PRESIDENT', '2018-02-24 04:59:03', NULL, 1),
(2, 'Donald', 'Duck', 'Donald@gmail.com', '980112233', 'BIM', 'Fifth', 'vice_president', '123456', 'ROLE_VICE_PRESIDENT', '2018-11-04 14:53:14', NULL, 1),
(5, 'Sumit', 'Kumar Singh', 'sumit@gmail.com', '9841001122', 'BIM', 'Fifth', 'program_co-ordinator', 'apple@123', 'ROLE_PROGRAM_CO-ORDINATOR', '2018-03-07 15:03:25', NULL, 1),
(6, 'Nikesh', 'Nakarmi', 'nikesh123@gmail.com', '9800001112', 'BIM', 'Fifth', 'executive_member', '123456', 'ROLE_EXECUTIVE_MEMBER', '2018-03-18 05:44:27', NULL, 1),
(7, 'general', 'member', 'ittest.generalmember@gmail.com', '9802356894', 'BBA', 'First', 'member1', '123456', 'ROLE_GENERAL_MEMBER', '2018-02-17 11:54:38', NULL, 1),
(8, 'John', 'Mayer', 'rohit.bim1360@thamescollege.edu.np', '98512012012', 'BIM', 'Third', 'generalMember2', '123456', 'ROLE_GENERAL_MEMBER', '2018-03-15 09:57:42', NULL, 1),
(9, 'Sammy', 'Member', 'ittest.generalmember@gmail.com', '9803626548', 'BBS', 'Sixth', 'generalMember3', '123456', 'ROLE_GENERAL_MEMBER', '2018-07-03 08:43:04', NULL, 1),
(10, 'Jason', 'Mraz', 'jason@gmail.com', '9801234567', 'BBA', 'Second', 'Jason', '123456', 'ROLE_GENERAL_MEMBER', '2018-07-03 08:56:44', NULL, 1),
(11, 'Lawoj', 'Oli', 'lawoj@gmail.com', '9807867654', 'BIM', 'Fifth', 'secretary', '123456', 'ROLE_SECRETARY', '2018-04-15 07:05:42', NULL, 1),
(12, 'Ashis', 'Basnet', 'ashis@gmail.com', '9841526369', 'BIM', 'Fifth', 'treasurer', '123456', 'ROLE_TREASURER', '2018-03-18 05:28:27', NULL, 1),
(13, 'Hits', 'Man', 'hitman@gmail.com', '9834234567', 'BBS', 'Second', 'hitman', '123456', 'ROLE_GENERAL_MEMBER', '2018-07-03 08:52:39', NULL, 1),
(14, 'Shreyak', 'Manandhar', 'shreyakmdr55@gmail.com', '9802030405', 'BIM', 'Sixth', 'shreyak', '123456', 'ROLE_GENERAL_MEMBER', '2018-07-28 11:21:36', NULL, 1),
(15, 'Raj', 'Manandhar', 'ittest.generalmember@gmail.com', '9809988773', 'BBA', 'Second', 'gentleman', '123456', 'ROLE_EXECUTIVE_MEMBER', '2018-11-20 15:59:08', NULL, 1),
(16, 'sagar', 'giri', 'sagargiri8991@gmail.com', '2342342424', 'BIM', 'First', 'sagar', '123456', 'ROLE_GENERAL_MEMBER', '2018-12-25 11:01:53', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_messages`
--

CREATE TABLE `tbl_messages` (
  `message_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `sent_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_messages`
--

INSERT INTO `tbl_messages` (`message_id`, `name`, `email`, `contact_no`, `title`, `message`, `sent_date`) VALUES
(1, 'Rohit Jung Karki', 'roit.jung@gmail.com', '9843933569', 'I have a Question', 'Testing first message on feb 10', '2018-02-10 04:40:13'),
(2, 'Rohit Jung Karki', 'rohit.bim1360@thamescollege.edu.np', '9843933569', 'Email Testing', 'let\'s see if the email test works', '2018-02-11 07:54:28'),
(3, 'Dave Smith', 'dave@gmail.com', '98512326598', 'Registration process', 'hello i want to join the club . can i know the process to join the club please inform me soon', '2018-02-24 02:26:39'),
(4, 'Max Gomez', 'ittest.generalmember@gmail.com', '9812345678', 'Sponsorship Offer', 'My company is willing to provide your events sponsorship if you promise good publicity', '2018-03-11 09:37:14'),
(5, 'Timon and Pumba', 'ittest.generalmember@gmail.com', '98078967856', 'How to Become a member', 'Hello\r\nI want to know the procedure to become a member of your club', '2018-03-17 14:25:21'),
(6, 'james', 'ittest.generalmember@gmail.com', '1233423412', 'Information required', 'i want to get information about the club', '2018-07-03 08:02:05'),
(7, 'Shreyak Manandhar', 'shreyakmdr55@gmail.com', '8878765645', 'Hello', 'test test', '2018-07-28 11:09:21'),
(8, 'roit', 'roit.jung@gmail.com', '980332211', 'roit', 'this is send by roit', '2018-07-31 08:26:23'),
(9, 'Umanga', 'umanga@gmail.com', '242343434', 'hello', 'hello hello', '2018-07-31 11:56:07'),
(10, 'probhat', 'prabhat@gmail.com', '98099098768', 'hi', 'hi there', '2018-09-03 05:30:18'),
(11, 'robert`', 'robert@gmail.com', '9878787675', 'enquiry`', 'this message is regarding an enquiry about the club', '2018-11-04 14:49:46'),
(12, 'Sagar', 'sagargiri8991@gmail.com', '3454352343243', 'Hello', 'I have a question', '2018-12-25 10:56:40');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notifications`
--

CREATE TABLE `tbl_notifications` (
  `notification_id` int(11) NOT NULL,
  `member_name` varchar(255) NOT NULL,
  `notification` text NOT NULL,
  `member_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notification_icon` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `button_text` varchar(255) NOT NULL,
  `button_color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_notifications`
--

INSERT INTO `tbl_notifications` (`notification_id`, `member_name`, `notification`, `member_id`, `added_date`, `notification_icon`, `link`, `button_text`, `button_color`) VALUES
(11, 'Ashis Basnet', 'Updated the Club Accounts', 1, '2018-03-15 05:06:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(12, 'Ashis Basnet', 'Updated the Club Accounts', 2, '2018-03-15 05:06:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(15, 'Ashis Basnet', 'Updated the Club Accounts', 5, '2018-03-15 05:06:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(16, 'Ashis Basnet', 'Updated the Club Accounts', 6, '2018-03-15 05:06:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(17, 'Ashis Basnet', 'Updated the Club Accounts', 7, '2018-03-15 05:06:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(18, 'Ashis Basnet', 'Updated the Club Accounts', 8, '2018-03-15 05:06:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(19, 'Ashis Basnet', 'Updated the Club Accounts', 9, '2018-03-15 05:06:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(20, 'Ashis Basnet', 'Updated the Club Accounts', 10, '2018-03-15 05:06:24', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(31, 'Ashis Basnet', 'Updated the Club Accounts', 1, '2018-03-15 05:59:52', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(32, 'Ashis Basnet', 'Updated the Club Accounts', 2, '2018-03-15 05:59:52', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(35, 'Ashis Basnet', 'Updated the Club Accounts', 5, '2018-03-15 05:59:52', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(36, 'Ashis Basnet', 'Updated the Club Accounts', 6, '2018-03-15 05:59:52', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(37, 'Ashis Basnet', 'Updated the Club Accounts', 7, '2018-03-15 05:59:52', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(38, 'Ashis Basnet', 'Updated the Club Accounts', 8, '2018-03-15 05:59:52', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(39, 'Ashis Basnet', 'Updated the Club Accounts', 9, '2018-03-15 05:59:52', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(40, 'Ashis Basnet', 'Updated the Club Accounts', 10, '2018-03-15 05:59:52', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(41, 'Ashis Basnet', 'Commented on Your Post', 1, '2018-03-15 07:26:37', 'fa-comment-o', '/dashboard/notifications/post/14', 'View Comments', 'bg-gray'),
(42, 'You', 'Updated Your Profile Picture', 8, '2018-03-15 09:56:37', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(43, 'You', 'Updated Your Profile Picture', 8, '2018-03-15 09:57:22', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(45, 'Sumit Kumar Singh', 'Edited  \'Javascript Traning\' Event', 1, '2018-03-15 16:01:24', 'fa-edit', '/dashboard/notifications/event/11', 'View events', 'bg-green'),
(46, 'Sumit Kumar Singh', 'Edited  \'Javascript Traning\' Event', 2, '2018-03-15 16:01:24', 'fa-edit', '/dashboard/notifications/event/11', 'View events', 'bg-green'),
(48, 'Rohit Jung Karki', 'Sent an Email to \'rohit.bim1360@thamescollege.edu.np\' titled \'Reply to: Email Testing\'', 1, '2018-03-15 16:23:58', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(49, 'Rohit Jung Karki', 'Sent an Email to \'rohit.bim1360@thamescollege.edu.np\' titled \'Reply to: Email Testing\'', 2, '2018-03-15 16:23:58', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(52, 'Rohit Jung Karki', 'Sent an Email to \'rohit.bim1360@thamescollege.edu.np\' titled \'Reply to: Email Testing\'', 5, '2018-03-15 16:23:59', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(53, 'Rohit Jung Karki', 'Sent an Email to \'rohit.bim1360@thamescollege.edu.np\' titled \'Reply to: Email Testing\'', 6, '2018-03-15 16:23:59', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(54, 'Sumit Kumar Singh', 'Edited  \'Demo Project\' Event', 1, '2018-03-17 07:36:16', 'fa-edit', '/dashboard/notifications/event/10', 'View Details', 'bg-green'),
(55, 'Sumit Kumar Singh', 'Edited  \'Demo Project\' Event', 2, '2018-03-17 07:36:16', 'fa-edit', '/dashboard/notifications/event/10', 'View Details', 'bg-green'),
(57, 'Rohit Jung Karki', 'Edited an Email Template  \'Call for Volunteers\'', 1, '2018-03-17 08:00:50', 'fa-pencil', '/dashboard/notifications/emailTemplate/4', 'View Templates', 'bg-yellow'),
(58, 'Rohit Jung Karki', 'Edited an Email Template  \'Call for Volunteers\'', 2, '2018-03-17 08:00:50', 'fa-pencil', '/dashboard/notifications/emailTemplate/4', 'View Templates', 'bg-yellow'),
(60, 'ittest.generalmember@gmail.com', 'added a new message', 1, '2018-03-17 14:25:22', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(61, 'ittest.generalmember@gmail.com', 'added a new message', 2, '2018-03-17 14:25:22', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(64, 'ittest.generalmember@gmail.com', 'added a new message', 5, '2018-03-17 14:25:22', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(65, 'ittest.generalmember@gmail.com', 'added a new message', 6, '2018-03-17 14:25:22', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(66, 'Ashis Basnet', 'Updated the Club Accounts', 1, '2018-03-17 14:28:06', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(67, 'Ashis Basnet', 'Updated the Club Accounts', 2, '2018-03-17 14:28:06', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(70, 'Ashis Basnet', 'Updated the Club Accounts', 5, '2018-03-17 14:28:06', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(71, 'Ashis Basnet', 'Updated the Club Accounts', 6, '2018-03-17 14:28:06', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(72, 'Ashis Basnet', 'Updated the Club Accounts', 7, '2018-03-17 14:28:06', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(73, 'Ashis Basnet', 'Updated the Club Accounts', 8, '2018-03-17 14:28:06', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(74, 'Ashis Basnet', 'Updated the Club Accounts', 9, '2018-03-17 14:28:06', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(75, 'Ashis Basnet', 'Updated the Club Accounts', 10, '2018-03-17 14:28:06', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(78, 'Jason Mraz', 'Commented on Your Post', 9, '2018-03-17 15:02:57', 'fa-comment-o', '/dashboard/notifications/post/16', 'View Comments', 'bg-gray'),
(79, 'You', 'Updated Your Profile Picture', 10, '2018-03-17 15:05:55', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(80, 'You', 'Updated Your Profile Picture', 10, '2018-03-17 15:07:33', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(81, 'You', 'Updated Your Profile Picture', 10, '2018-03-17 15:28:14', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(82, 'You', 'Updated Your Profile Picture', 10, '2018-03-17 15:32:03', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(83, 'You', 'Updated Your Profile Picture', 9, '2018-03-17 15:33:15', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(84, 'You', 'Deleted a Post', 9, '2018-03-17 15:33:50', 'fa-warning', '/dashboard', 'back', 'bg-red'),
(85, 'Lawoj Oli', 'Commented on Your Post', 10, '2018-03-17 15:38:59', 'fa-comment-o', '/dashboard/notifications/post/17', 'View Comments', 'bg-gray'),
(86, 'You', 'Edited a Post \'Checking post and comments with notif\'', 10, '2018-03-17 15:40:02', '  fa-edit', '/dashboard/notifications/post/17', 'view Post', 'bg-gray'),
(87, 'Lawoj Oli', 'Commented on Your Post', 10, '2018-03-17 15:40:23', 'fa-comment-o', '/dashboard/notifications/post/17', 'View Comments', 'bg-gray'),
(88, 'You', 'Deleted a Post', 10, '2018-03-17 15:40:49', 'fa-warning', '/dashboard', 'back', 'bg-red'),
(91, 'You', 'Updated Your Profile Picture', 10, '2018-03-18 04:43:57', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(93, 'You', 'Updated Your Profile Picture', 5, '2018-03-18 04:58:15', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(94, 'You', 'Updated Your Profile Picture', 1, '2018-03-18 05:06:09', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(95, 'You', 'Updated Your Profile Picture', 1, '2018-03-18 05:06:27', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(98, 'You', 'Removed Lawoj Oli from the Systems', 1, '2018-03-18 05:26:48', '  fa-user', '/dashboard/members', 'View Members', 'bg-light-blue'),
(99, 'Rohit Jung Karki', 'Removed Lawoj Oli from the Systems', 2, '2018-03-18 05:26:48', '  fa-user', '/dashboard/members', 'View Members', 'bg-light-blue'),
(101, 'Rohit Jung Karki', 'Removed Lawoj Oli from the Systems', 5, '2018-03-18 05:26:48', '  fa-user', '/dashboard/members', 'View Members', 'bg-light-blue'),
(102, 'Rohit Jung Karki', 'Removed Lawoj Oli from the Systems', 6, '2018-03-18 05:26:48', '  fa-user', '/dashboard/members', 'View Members', 'bg-light-blue'),
(103, 'You', 'Removed Ashis Basnet from the Systems', 1, '2018-03-18 05:26:57', '  fa-user', '/dashboard/members', 'View Members', 'bg-light-blue'),
(104, 'Rohit Jung Karki', 'Removed Ashis Basnet from the Systems', 2, '2018-03-18 05:26:57', '  fa-user', '/dashboard/members', 'View Members', 'bg-light-blue'),
(105, 'Rohit Jung Karki', 'Removed Ashis Basnet from the Systems', 5, '2018-03-18 05:26:57', '  fa-user', '/dashboard/members', 'View Members', 'bg-light-blue'),
(106, 'Rohit Jung Karki', 'Removed Ashis Basnet from the Systems', 6, '2018-03-18 05:26:57', '  fa-user', '/dashboard/members', 'View Members', 'bg-light-blue'),
(107, 'You', 'Added a New Member \'Lawoj Ole\'', 1, '2018-03-18 05:27:44', 'fa-user', '/dashboard/notifications/member/11', 'View Member Details', 'bg-aqua'),
(108, 'Rohit Jung Karki', 'Added a New Member \'Lawoj Ole\'', 2, '2018-03-18 05:27:44', 'fa-user', '/dashboard/notifications/member/11', 'View Member Details', 'bg-aqua'),
(109, 'Rohit Jung Karki', 'Added a New Member \'Lawoj Ole\'', 5, '2018-03-18 05:27:44', 'fa-user', '/dashboard/notifications/member/11', 'View Member Details', 'bg-aqua'),
(110, 'Rohit Jung Karki', 'Added a New Member \'Lawoj Ole\'', 6, '2018-03-18 05:27:44', 'fa-user', '/dashboard/notifications/member/11', 'View Member Details', 'bg-aqua'),
(111, 'You', 'Added a New Member \'Ashis Basnet\'', 1, '2018-03-18 05:28:27', 'fa-user', '/dashboard/notifications/member/12', 'View Member Details', 'bg-aqua'),
(112, 'Rohit Jung Karki', 'Added a New Member \'Ashis Basnet\'', 2, '2018-03-18 05:28:27', 'fa-user', '/dashboard/notifications/member/12', 'View Member Details', 'bg-aqua'),
(113, 'Rohit Jung Karki', 'Added a New Member \'Ashis Basnet\'', 5, '2018-03-18 05:28:27', 'fa-user', '/dashboard/notifications/member/12', 'View Member Details', 'bg-aqua'),
(114, 'Rohit Jung Karki', 'Added a New Member \'Ashis Basnet\'', 6, '2018-03-18 05:28:27', 'fa-user', '/dashboard/notifications/member/12', 'View Member Details', 'bg-aqua'),
(115, 'Rohit Jung Karki', 'Added a New Member \'Ashis Basnet\'', 11, '2018-03-18 05:28:27', 'fa-user', '/dashboard/notifications/member/12', 'View Member Details', 'bg-aqua'),
(116, 'You', 'Updated Your Profile Picture', 8, '2018-03-18 05:37:48', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(117, 'Sumit Kumar Singh', 'Commented on Your Post', 8, '2018-03-18 05:42:28', 'fa-comment-o', '/dashboard/notifications/post/17', 'View Comments', 'bg-gray'),
(118, 'Sumit Kumar Singh', 'Downloaded the Income File', 12, '2018-03-18 05:42:40', 'fa-download', '/dashboard', 'back', 'bg-brown'),
(119, 'Nikesh Nakarmi', 'Commented on Your Post', 8, '2018-03-18 05:43:27', 'fa-comment-o', '/dashboard/notifications/post/17', 'View Comments', 'bg-gray'),
(120, 'Nikesh Nakarmi', 'Commented on Your Post', 1, '2018-03-18 05:43:38', 'fa-comment-o', '/dashboard/notifications/post/14', 'View Comments', 'bg-gray'),
(121, 'Nikesh Nakarmi', 'Commented on Your Post', 10, '2018-03-18 05:43:48', 'fa-comment-o', '/dashboard/notifications/post/8', 'View Comments', 'bg-gray'),
(122, 'You', 'Created a new Event \'Fifa Competition\' Check out the Details', 1, '2018-03-18 05:48:42', 'fa-briefcase', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(123, 'Rohit Jung Karki', 'Created a new Event \'Fifa Competition\' Check out the Details', 2, '2018-03-18 05:48:42', 'fa-briefcase', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(124, 'Rohit Jung Karki', 'Created a new Event \'Fifa Competition\' Check out the Details', 5, '2018-03-18 05:48:42', 'fa-briefcase', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(125, 'Rohit Jung Karki', 'Created a new Event \'Fifa Competition\' Check out the Details', 6, '2018-03-18 05:48:42', 'fa-briefcase', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(126, 'Rohit Jung Karki', 'Created a new Event \'Fifa Competition\' Check out the Details', 7, '2018-03-18 05:48:42', 'fa-briefcase', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(127, 'Rohit Jung Karki', 'Created a new Event \'Fifa Competition\' Check out the Details', 8, '2018-03-18 05:48:42', 'fa-briefcase', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(128, 'Rohit Jung Karki', 'Created a new Event \'Fifa Competition\' Check out the Details', 9, '2018-03-18 05:48:42', 'fa-briefcase', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(129, 'Rohit Jung Karki', 'Created a new Event \'Fifa Competition\' Check out the Details', 10, '2018-03-18 05:48:42', 'fa-briefcase', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(130, 'Rohit Jung Karki', 'Created a new Event \'Fifa Competition\' Check out the Details', 11, '2018-03-18 05:48:42', 'fa-briefcase', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(131, 'Rohit Jung Karki', 'Created a new Event \'Fifa Competition\' Check out the Details', 12, '2018-03-18 05:48:43', 'fa-briefcase', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(132, 'Lawoj Ole', 'Edited  \'Fifa Competition\' Event', 1, '2018-03-18 05:54:28', 'fa-edit', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(133, 'Lawoj Ole', 'Edited  \'Fifa Competition\' Event', 2, '2018-03-18 05:54:28', 'fa-edit', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(134, 'Lawoj Ole', 'Edited  \'Fifa Competition\' Event', 5, '2018-03-18 05:54:28', 'fa-edit', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(135, 'Lawoj Ole', 'Edited  \'Fifa Competition\' Event', 6, '2018-03-18 05:54:28', 'fa-edit', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(136, 'You', 'Edited  \'Fifa Competition\' Event', 11, '2018-03-18 05:54:28', 'fa-edit', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(137, 'Lawoj Ole', 'Edited  \'Fifa Competition\' Event', 12, '2018-03-18 05:54:28', 'fa-edit', '/dashboard/notifications/event/12', 'View Details', 'bg-green'),
(138, 'You', 'Edited a Post \'Hello All Members\'', 11, '2018-03-18 05:57:08', '  fa-edit', '/dashboard/notifications/post/16', 'view Post', 'bg-gray'),
(139, 'Sumit Kumar Singh', 'Deleted  \'Demo Project\' Event', 1, '2018-03-18 05:58:05', 'fa-times', '/dashboard/events', 'View events', 'bg-green'),
(140, 'Sumit Kumar Singh', 'Deleted  \'Demo Project\' Event', 2, '2018-03-18 05:58:05', 'fa-times', '/dashboard/events', 'View events', 'bg-green'),
(141, 'You', 'Deleted  \'Demo Project\' Event', 5, '2018-03-18 05:58:05', 'fa-times', '/dashboard/events', 'View events', 'bg-green'),
(142, 'Sumit Kumar Singh', 'Deleted  \'Demo Project\' Event', 6, '2018-03-18 05:58:05', 'fa-times', '/dashboard/events', 'View events', 'bg-green'),
(143, 'Sumit Kumar Singh', 'Deleted  \'Demo Project\' Event', 11, '2018-03-18 05:58:05', 'fa-times', '/dashboard/events', 'View events', 'bg-green'),
(144, 'Sumit Kumar Singh', 'Deleted  \'Demo Project\' Event', 12, '2018-03-18 05:58:05', 'fa-times', '/dashboard/events', 'View events', 'bg-green'),
(145, 'Lawoj Oli', 'Sent an Email titled \'Reply to: How to Become a member\'', 1, '2018-03-18 06:01:53', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(146, 'Lawoj Oli', 'Sent an Email titled \'Reply to: How to Become a member\'', 2, '2018-03-18 06:01:53', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(147, 'Lawoj Oli', 'Sent an Email titled \'Reply to: How to Become a member\'', 5, '2018-03-18 06:01:53', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(148, 'Lawoj Oli', 'Sent an Email titled \'Reply to: How to Become a member\'', 6, '2018-03-18 06:01:53', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(149, 'You', 'Sent an Email titled \'Reply to: How to Become a member\'', 11, '2018-03-18 06:01:54', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(150, 'Lawoj Oli', 'Sent an Email titled \'Reply to: How to Become a member\'', 12, '2018-03-18 06:01:54', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(151, 'Lawoj Oli', 'Sent You an Email titled \'General Meeting\'', 1, '2018-03-18 06:05:53', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(152, 'Lawoj Oli', 'Sent You an Email titled \'General Meeting\'', 2, '2018-03-18 06:05:54', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(153, 'Lawoj Oli', 'Sent You an Email titled \'General Meeting\'', 5, '2018-03-18 06:05:54', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(154, 'Lawoj Oli', 'Sent You an Email titled \'General Meeting\'', 6, '2018-03-18 06:05:54', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(155, 'Lawoj Oli', 'Sent You an Email titled \'General Meeting\'', 7, '2018-03-18 06:05:54', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(156, 'Lawoj Oli', 'Sent You an Email titled \'General Meeting\'', 8, '2018-03-18 06:05:54', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(157, 'Lawoj Oli', 'Sent You an Email titled \'General Meeting\'', 9, '2018-03-18 06:05:54', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(158, 'Lawoj Oli', 'Sent You an Email titled \'General Meeting\'', 10, '2018-03-18 06:05:55', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(159, 'You', 'Sent You an Email titled \'General Meeting\'', 11, '2018-03-18 06:05:55', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(160, 'Lawoj Oli', 'Sent You an Email titled \'General Meeting\'', 12, '2018-03-18 06:05:55', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(161, 'Lawoj Oli', 'Added a new Email Template  \'Test Template\'', 1, '2018-03-18 06:07:37', 'fa-pencil', '/dashboard/notifications/emailTemplate/6', 'View Templates', 'bg-yellow'),
(162, 'Lawoj Oli', 'Added a new Email Template  \'Test Template\'', 2, '2018-03-18 06:07:37', 'fa-pencil', '/dashboard/notifications/emailTemplate/6', 'View Templates', 'bg-yellow'),
(163, 'You', 'Added a new Email Template  \'Test Template\'', 11, '2018-03-18 06:07:37', 'fa-pencil', '/dashboard/notifications/emailTemplate/6', 'View Templates', 'bg-yellow'),
(164, 'Lawoj Oli', 'Edited an Email Template  \'Test Template\'', 1, '2018-03-18 06:07:49', 'fa-pencil', '/dashboard/notifications/emailTemplate/6', 'View Templates', 'bg-yellow'),
(165, 'Lawoj Oli', 'Edited an Email Template  \'Test Template\'', 2, '2018-03-18 06:07:49', 'fa-pencil', '/dashboard/notifications/emailTemplate/6', 'View Templates', 'bg-yellow'),
(166, 'You', 'Edited an Email Template  \'Test Template\'', 11, '2018-03-18 06:07:49', 'fa-pencil', '/dashboard/notifications/emailTemplate/6', 'View Templates', 'bg-yellow'),
(167, 'Lawoj Oli', 'Deleted an Email Template  \'Test Template\'', 1, '2018-03-18 06:07:57', 'fa-pencil', '/dashboard/mail', 'view', 'bg-yellow'),
(168, 'Lawoj Oli', 'Deleted an Email Template  \'Test Template\'', 2, '2018-03-18 06:07:57', 'fa-pencil', '/dashboard/mail', 'view', 'bg-yellow'),
(169, 'You', 'Deleted an Email Template  \'Test Template\'', 11, '2018-03-18 06:07:57', 'fa-pencil', '/dashboard/mail', 'view', 'bg-yellow'),
(170, 'Lawoj Oli', 'Posted a new Meeting \'Board Meeting 101\'', 1, '2018-03-18 06:26:03', 'fa-users', '/dashboard/notifications/meeting/2', 'View meeting Details', 'bg-teal'),
(171, 'Lawoj Oli', 'Posted a new Meeting \'Board Meeting 101\'', 2, '2018-03-18 06:26:03', 'fa-users', '/dashboard/notifications/meeting/2', 'View meeting Details', 'bg-teal'),
(172, 'Lawoj Oli', 'Posted a new Meeting \'Board Meeting 101\'', 5, '2018-03-18 06:26:04', 'fa-users', '/dashboard/notifications/meeting/2', 'View meeting Details', 'bg-teal'),
(173, 'Lawoj Oli', 'Posted a new Meeting \'Board Meeting 101\'', 6, '2018-03-18 06:26:04', 'fa-users', '/dashboard/notifications/meeting/2', 'View meeting Details', 'bg-teal'),
(174, 'Lawoj Oli', 'Posted a new Meeting \'Board Meeting 101\'', 7, '2018-03-18 06:26:04', 'fa-users', '/dashboard/notifications/meeting/2', 'View meeting Details', 'bg-teal'),
(175, 'Lawoj Oli', 'Posted a new Meeting \'Board Meeting 101\'', 8, '2018-03-18 06:26:04', 'fa-users', '/dashboard/notifications/meeting/2', 'View meeting Details', 'bg-teal'),
(176, 'Lawoj Oli', 'Posted a new Meeting \'Board Meeting 101\'', 9, '2018-03-18 06:26:04', 'fa-users', '/dashboard/notifications/meeting/2', 'View meeting Details', 'bg-teal'),
(177, 'Lawoj Oli', 'Posted a new Meeting \'Board Meeting 101\'', 10, '2018-03-18 06:26:04', 'fa-users', '/dashboard/notifications/meeting/2', 'View meeting Details', 'bg-teal'),
(178, 'You', 'Posted a new Meeting \'Board Meeting 101\'', 11, '2018-03-18 06:26:04', 'fa-users', '/dashboard/notifications/meeting/2', 'View meeting Details', 'bg-teal'),
(179, 'Lawoj Oli', 'Posted a new Meeting \'Board Meeting 101\'', 12, '2018-03-18 06:26:04', 'fa-users', '/dashboard/notifications/meeting/2', 'View meeting Details', 'bg-teal'),
(180, 'Lawoj Oli', 'Commented on Your Post', 10, '2018-03-18 06:26:20', 'fa-comment-o', '/dashboard/notifications/post/8', 'View Comments', 'bg-gray'),
(181, 'Lawoj Oli', 'Edited a Meeting \'Board Meeting 101\'', 1, '2018-03-18 06:28:11', 'fa-users', '/dashboard/notifications/meeting/2', 'View meetings', 'bg-teal'),
(182, 'Lawoj Oli', 'Edited a Meeting \'Board Meeting 101\'', 2, '2018-03-18 06:28:11', 'fa-users', '/dashboard/notifications/meeting/2', 'View meetings', 'bg-teal'),
(183, 'Lawoj Oli', 'Edited a Meeting \'Board Meeting 101\'', 5, '2018-03-18 06:28:11', 'fa-users', '/dashboard/notifications/meeting/2', 'View meetings', 'bg-teal'),
(184, 'Lawoj Oli', 'Edited a Meeting \'Board Meeting 101\'', 6, '2018-03-18 06:28:11', 'fa-users', '/dashboard/notifications/meeting/2', 'View meetings', 'bg-teal'),
(185, 'You', 'Edited a Meeting \'Board Meeting 101\'', 11, '2018-03-18 06:28:11', 'fa-users', '/dashboard/notifications/meeting/2', 'View meetings', 'bg-teal'),
(186, 'Lawoj Oli', 'Edited a Meeting \'Board Meeting 101\'', 12, '2018-03-18 06:28:11', 'fa-users', '/dashboard/notifications/meeting/2', 'View meetings', 'bg-teal'),
(187, 'Lawoj Oli', 'Added a New Member \'Micket  Laak\'', 1, '2018-03-18 06:29:09', 'fa-user', '/dashboard/notifications/member/13', 'View Member Details', 'bg-aqua'),
(188, 'Lawoj Oli', 'Added a New Member \'Micket  Laak\'', 2, '2018-03-18 06:29:09', 'fa-user', '/dashboard/notifications/member/13', 'View Member Details', 'bg-aqua'),
(189, 'Lawoj Oli', 'Added a New Member \'Micket  Laak\'', 5, '2018-03-18 06:29:09', 'fa-user', '/dashboard/notifications/member/13', 'View Member Details', 'bg-aqua'),
(190, 'Lawoj Oli', 'Added a New Member \'Micket  Laak\'', 6, '2018-03-18 06:29:09', 'fa-user', '/dashboard/notifications/member/13', 'View Member Details', 'bg-aqua'),
(191, 'You', 'Added a New Member \'Micket  Laak\'', 11, '2018-03-18 06:29:09', 'fa-user', '/dashboard/notifications/member/13', 'View Member Details', 'bg-aqua'),
(192, 'Lawoj Oli', 'Added a New Member \'Micket  Laak\'', 12, '2018-03-18 06:29:09', 'fa-user', '/dashboard/notifications/member/13', 'View Member Details', 'bg-aqua'),
(193, 'Lawoj Oli', 'Sent You an Email titled \'Welcome Mail\'', 1, '2018-03-18 06:30:07', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(194, 'Lawoj Oli', 'Sent You an Email titled \'Welcome Mail\'', 2, '2018-03-18 06:30:07', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(195, 'Lawoj Oli', 'Sent You an Email titled \'Welcome Mail\'', 5, '2018-03-18 06:30:07', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(196, 'Lawoj Oli', 'Sent You an Email titled \'Welcome Mail\'', 6, '2018-03-18 06:30:07', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(197, 'Lawoj Oli', 'Sent You an Email titled \'Welcome Mail\'', 7, '2018-03-18 06:30:08', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(198, 'Lawoj Oli', 'Sent You an Email titled \'Welcome Mail\'', 8, '2018-03-18 06:30:08', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(199, 'Lawoj Oli', 'Sent You an Email titled \'Welcome Mail\'', 9, '2018-03-18 06:30:08', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(200, 'Lawoj Oli', 'Sent You an Email titled \'Welcome Mail\'', 10, '2018-03-18 06:30:08', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(201, 'You', 'Sent You an Email titled \'Welcome Mail\'', 11, '2018-03-18 06:30:08', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(202, 'Lawoj Oli', 'Sent You an Email titled \'Welcome Mail\'', 12, '2018-03-18 06:30:08', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(204, 'Lawoj Oli', 'Removed Micket  Laak from the Systems', 1, '2018-03-18 06:33:07', '  fa-user', '/dashboard/members', 'View Members', 'bg-light-blue'),
(205, 'Lawoj Oli', 'Removed Micket  Laak from the Systems', 2, '2018-03-18 06:33:07', '  fa-user', '/dashboard/members', 'View Members', 'bg-light-blue'),
(206, 'Lawoj Oli', 'Removed Micket  Laak from the Systems', 5, '2018-03-18 06:33:07', '  fa-user', '/dashboard/members', 'View Members', 'bg-light-blue'),
(207, 'Lawoj Oli', 'Removed Micket  Laak from the Systems', 6, '2018-03-18 06:33:08', '  fa-user', '/dashboard/members', 'View Members', 'bg-light-blue'),
(208, 'You', 'Removed Micket  Laak from the Systems', 11, '2018-03-18 06:33:08', '  fa-user', '/dashboard/members', 'View Members', 'bg-light-blue'),
(209, 'Lawoj Oli', 'Removed Micket  Laak from the Systems', 12, '2018-03-18 06:33:08', '  fa-user', '/dashboard/members', 'View Members', 'bg-light-blue'),
(210, 'You', 'Edited a Post \'Testing Post hack\'', 1, '2018-03-18 14:37:34', '  fa-edit', '/dashboard/notifications/post/16', 'view Post', 'bg-gray'),
(211, 'You', 'Edited a Post \'hello hack\'', 11, '2018-03-18 15:00:28', '  fa-edit', '/dashboard/notifications/post/16', 'view Post', 'bg-gray'),
(212, 'You', 'Edited a Post \'hello hack\'', 11, '2018-03-18 15:03:24', '  fa-edit', '/dashboard/notifications/post/16', 'view Post', 'bg-gray'),
(213, 'You', 'Edited a Post \'Testing Post \'', 11, '2018-03-18 15:04:00', '  fa-edit', '/dashboard/notifications/post/14', 'view Post', 'bg-gray'),
(214, 'You', 'Edited a Post \'so this is the news feed\'', 11, '2018-03-18 15:04:54', '  fa-edit', '/dashboard/notifications/post/17', 'view Post', 'bg-gray'),
(215, 'You', 'Edited a Post \'so this is the news feed\'', 11, '2018-03-18 15:06:49', '  fa-edit', '/dashboard/notifications/post/17', 'view Post', 'bg-gray'),
(216, 'You', 'Deleted a Post', 11, '2018-03-18 15:09:44', 'fa-warning', '/dashboard', 'back', 'bg-red'),
(217, 'You', 'Edited a Post \'You are Hacked\'', 11, '2018-03-18 15:10:27', '  fa-edit', '/dashboard/notifications/post/16', 'view Post', 'bg-gray'),
(218, 'You', 'Deleted a Post', 11, '2018-03-18 15:12:33', 'fa-warning', '/dashboard', 'back', 'bg-red'),
(219, 'You', 'Edited a Post \'You are Hacked\'', 11, '2018-03-18 15:15:41', '  fa-edit', '/dashboard/notifications/post/16', 'view Post', 'bg-gray'),
(220, 'You', 'Edited a Post \'Third Post\'', 11, '2018-03-18 15:16:24', '  fa-edit', '/dashboard/notifications/post/5', 'view Post', 'bg-gray'),
(221, 'You', 'Edited a Post \'You are Hacked\'', 1, '2018-03-18 15:22:38', '  fa-edit', '/dashboard/notifications/post/16', 'view Post', 'bg-gray'),
(222, 'You', 'Edited a Post \'So happy with my new News Feed \r\nEverything is working perfectly\'', 1, '2018-03-22 05:19:34', '  fa-edit', '/dashboard/notifications/post/7', 'view Post', 'bg-gray'),
(223, 'You', 'Edited a Post \'hack testing post edited\'', 1, '2018-03-22 06:47:32', '  fa-edit', '/dashboard/notifications/post/19', 'view Post', 'bg-gray'),
(224, 'You', 'Deleted a Post', 11, '2018-03-22 07:42:59', 'fa-warning', '/dashboard', 'back', 'bg-red'),
(225, 'Rohit Jung Karki', 'Commented on Your Post', 11, '2018-04-15 06:46:04', 'fa-comment-o', '/dashboard/notifications/post/18', 'View Comments', 'bg-gray'),
(226, 'You', 'Edited an Email Template  \'Welcome Mail\'', 1, '2018-04-15 09:08:09', 'fa-pencil', '/dashboard/notifications/emailTemplate/5', 'View Templates', 'bg-yellow'),
(227, 'Rohit Jung Karki', 'Edited an Email Template  \'Welcome Mail\'', 2, '2018-04-15 09:08:09', 'fa-pencil', '/dashboard/notifications/emailTemplate/5', 'View Templates', 'bg-yellow'),
(228, 'You', 'Added a New Member \'Hit man\'', 1, '2018-04-15 09:10:11', 'fa-user', '/dashboard/notifications/member/13', 'View Member Details', 'bg-aqua'),
(229, 'Rohit Jung Karki', 'Added a New Member \'Hit man\'', 2, '2018-04-15 09:10:11', 'fa-user', '/dashboard/notifications/member/13', 'View Member Details', 'bg-aqua'),
(230, 'Rohit Jung Karki', 'Added a New Member \'Hit man\'', 5, '2018-04-15 09:10:11', 'fa-user', '/dashboard/notifications/member/13', 'View Member Details', 'bg-aqua'),
(231, 'Rohit Jung Karki', 'Added a New Member \'Hit man\'', 6, '2018-04-15 09:10:11', 'fa-user', '/dashboard/notifications/member/13', 'View Member Details', 'bg-aqua'),
(232, 'Rohit Jung Karki', 'Added a New Member \'Hit man\'', 11, '2018-04-15 09:10:11', 'fa-user', '/dashboard/notifications/member/13', 'View Member Details', 'bg-aqua'),
(233, 'Rohit Jung Karki', 'Added a New Member \'Hit man\'', 12, '2018-04-15 09:10:11', 'fa-user', '/dashboard/notifications/member/13', 'View Member Details', 'bg-aqua'),
(234, 'Jason Mraz', 'Downloaded the Income File', 12, '2018-04-16 06:34:04', 'fa-download', '/dashboard', 'back', 'bg-brown'),
(235, 'You', 'Edited a Post \'don\'t forget to download the accounts\'', 12, '2018-04-16 06:36:48', '  fa-edit', '/dashboard/notifications/post/20', 'view Post', 'bg-gray'),
(236, 'Rohit Jung Karki', 'Commented on Your Post', 12, '2018-04-16 07:34:40', 'fa-comment-o', '/dashboard/notifications/post/20', 'View Comments', 'bg-gray'),
(237, 'You', 'Updated Your Profile Picture', 12, '2018-04-28 08:41:49', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(238, 'Ashis Basnet', 'Updated the Club Accounts', 1, '2018-04-28 09:14:57', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(239, 'Ashis Basnet', 'Updated the Club Accounts', 2, '2018-04-28 09:14:57', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(240, 'Ashis Basnet', 'Updated the Club Accounts', 5, '2018-04-28 09:14:57', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(241, 'Ashis Basnet', 'Updated the Club Accounts', 6, '2018-04-28 09:14:57', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(242, 'Ashis Basnet', 'Updated the Club Accounts', 7, '2018-04-28 09:14:57', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(243, 'Ashis Basnet', 'Updated the Club Accounts', 8, '2018-04-28 09:14:58', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(244, 'Ashis Basnet', 'Updated the Club Accounts', 9, '2018-04-28 09:14:58', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(245, 'Ashis Basnet', 'Updated the Club Accounts', 10, '2018-04-28 09:14:58', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(246, 'Ashis Basnet', 'Updated the Club Accounts', 11, '2018-04-28 09:14:58', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(247, 'You', 'Updated the Club Accounts', 12, '2018-04-28 09:14:58', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(248, 'Ashis Basnet', 'Updated the Club Accounts', 13, '2018-04-28 09:14:58', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(249, 'Ashis Basnet', 'Updated the Club Accounts', 1, '2018-04-28 09:32:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(250, 'Ashis Basnet', 'Updated the Club Accounts', 2, '2018-04-28 09:32:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(251, 'Ashis Basnet', 'Updated the Club Accounts', 5, '2018-04-28 09:32:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(252, 'Ashis Basnet', 'Updated the Club Accounts', 6, '2018-04-28 09:32:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(253, 'Ashis Basnet', 'Updated the Club Accounts', 7, '2018-04-28 09:32:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(254, 'Ashis Basnet', 'Updated the Club Accounts', 8, '2018-04-28 09:32:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(255, 'Ashis Basnet', 'Updated the Club Accounts', 9, '2018-04-28 09:32:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(256, 'Ashis Basnet', 'Updated the Club Accounts', 10, '2018-04-28 09:32:23', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(257, 'Ashis Basnet', 'Updated the Club Accounts', 11, '2018-04-28 09:32:24', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(258, 'You', 'Updated the Club Accounts', 12, '2018-04-28 09:32:24', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(259, 'Ashis Basnet', 'Updated the Club Accounts', 13, '2018-04-28 09:32:24', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(260, 'Ashis Basnet', 'Updated the Club Accounts', 1, '2018-04-28 09:33:40', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(261, 'Ashis Basnet', 'Updated the Club Accounts', 2, '2018-04-28 09:33:40', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(262, 'Ashis Basnet', 'Updated the Club Accounts', 5, '2018-04-28 09:33:40', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(263, 'Ashis Basnet', 'Updated the Club Accounts', 6, '2018-04-28 09:33:40', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(264, 'Ashis Basnet', 'Updated the Club Accounts', 7, '2018-04-28 09:33:40', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(265, 'Ashis Basnet', 'Updated the Club Accounts', 8, '2018-04-28 09:33:40', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(266, 'Ashis Basnet', 'Updated the Club Accounts', 9, '2018-04-28 09:33:41', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(267, 'Ashis Basnet', 'Updated the Club Accounts', 10, '2018-04-28 09:33:41', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(268, 'Ashis Basnet', 'Updated the Club Accounts', 11, '2018-04-28 09:33:41', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(269, 'You', 'Updated the Club Accounts', 12, '2018-04-28 09:33:41', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(270, 'Ashis Basnet', 'Updated the Club Accounts', 13, '2018-04-28 09:33:41', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(271, 'Ashis Basnet', 'Updated the Club Accounts', 1, '2018-04-28 09:34:16', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(272, 'Ashis Basnet', 'Updated the Club Accounts', 2, '2018-04-28 09:34:16', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(273, 'Ashis Basnet', 'Updated the Club Accounts', 5, '2018-04-28 09:34:16', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(274, 'Ashis Basnet', 'Updated the Club Accounts', 6, '2018-04-28 09:34:16', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(275, 'Ashis Basnet', 'Updated the Club Accounts', 7, '2018-04-28 09:34:16', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(276, 'Ashis Basnet', 'Updated the Club Accounts', 8, '2018-04-28 09:34:16', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(277, 'Ashis Basnet', 'Updated the Club Accounts', 9, '2018-04-28 09:34:16', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(278, 'Ashis Basnet', 'Updated the Club Accounts', 10, '2018-04-28 09:34:16', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(279, 'Ashis Basnet', 'Updated the Club Accounts', 11, '2018-04-28 09:34:16', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(280, 'You', 'Updated the Club Accounts', 12, '2018-04-28 09:34:16', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(281, 'Ashis Basnet', 'Updated the Club Accounts', 13, '2018-04-28 09:34:16', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(282, 'Rohit Jung Karki', 'Downloaded the Expenses File of Javascript Traning', 12, '2018-04-29 11:40:24', 'fa-download', '/dashboard', 'back', 'bg-brown'),
(283, 'Rohit Jung Karki', 'Downloaded the Expenses File of Javascript Traning', 12, '2018-04-29 12:14:02', 'fa-download', '/dashboard', 'back', 'bg-brown'),
(284, 'Rohit Jung Karki', 'Downloaded the Expenses File of Javascript Traning', 12, '2018-04-29 15:37:14', 'fa-download', '/dashboard', 'back', 'bg-brown'),
(285, 'Sumit Kumar Singh', 'Deleted  \'Fifa Competition\' Event', 1, '2018-05-06 06:58:43', 'fa-times', '/dashboard/events', 'View events', 'bg-green'),
(286, 'Sumit Kumar Singh', 'Deleted  \'Fifa Competition\' Event', 2, '2018-05-06 06:58:43', 'fa-times', '/dashboard/events', 'View events', 'bg-green'),
(287, 'You', 'Deleted  \'Fifa Competition\' Event', 5, '2018-05-06 06:58:43', 'fa-times', '/dashboard/events', 'View events', 'bg-green'),
(288, 'Sumit Kumar Singh', 'Deleted  \'Fifa Competition\' Event', 6, '2018-05-06 06:58:43', 'fa-times', '/dashboard/events', 'View events', 'bg-green'),
(289, 'Sumit Kumar Singh', 'Deleted  \'Fifa Competition\' Event', 11, '2018-05-06 06:58:43', 'fa-times', '/dashboard/events', 'View events', 'bg-green'),
(290, 'Sumit Kumar Singh', 'Deleted  \'Fifa Competition\' Event', 12, '2018-05-06 06:58:43', 'fa-times', '/dashboard/events', 'View events', 'bg-green'),
(291, 'Ashis Basnet', 'Updated the Club Accounts', 1, '2018-05-06 08:43:37', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(292, 'Ashis Basnet', 'Updated the Club Accounts', 2, '2018-05-06 08:43:37', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(293, 'Ashis Basnet', 'Updated the Club Accounts', 5, '2018-05-06 08:43:37', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(294, 'Ashis Basnet', 'Updated the Club Accounts', 6, '2018-05-06 08:43:37', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(295, 'Ashis Basnet', 'Updated the Club Accounts', 7, '2018-05-06 08:43:37', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(296, 'Ashis Basnet', 'Updated the Club Accounts', 8, '2018-05-06 08:43:37', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(297, 'Ashis Basnet', 'Updated the Club Accounts', 9, '2018-05-06 08:43:37', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(298, 'Ashis Basnet', 'Updated the Club Accounts', 10, '2018-05-06 08:43:37', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(299, 'Ashis Basnet', 'Updated the Club Accounts', 11, '2018-05-06 08:43:37', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(300, 'You', 'Updated the Club Accounts', 12, '2018-05-06 08:43:37', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(301, 'Ashis Basnet', 'Updated the Club Accounts', 13, '2018-05-06 08:43:37', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(302, 'Ashis Basnet', 'Updated the Club Accounts', 1, '2018-05-06 08:45:05', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(303, 'Ashis Basnet', 'Updated the Club Accounts', 2, '2018-05-06 08:45:05', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(304, 'Ashis Basnet', 'Updated the Club Accounts', 5, '2018-05-06 08:45:05', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(305, 'Ashis Basnet', 'Updated the Club Accounts', 6, '2018-05-06 08:45:05', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(306, 'Ashis Basnet', 'Updated the Club Accounts', 7, '2018-05-06 08:45:05', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(307, 'Ashis Basnet', 'Updated the Club Accounts', 8, '2018-05-06 08:45:05', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(308, 'Ashis Basnet', 'Updated the Club Accounts', 9, '2018-05-06 08:45:05', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(309, 'Ashis Basnet', 'Updated the Club Accounts', 10, '2018-05-06 08:45:05', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(310, 'Ashis Basnet', 'Updated the Club Accounts', 11, '2018-05-06 08:45:05', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(311, 'You', 'Updated the Club Accounts', 12, '2018-05-06 08:45:05', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(312, 'Ashis Basnet', 'Updated the Club Accounts', 13, '2018-05-06 08:45:05', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(313, 'Ashis Basnet', 'Updated the Club Accounts', 1, '2018-05-06 08:49:01', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(314, 'Ashis Basnet', 'Updated the Club Accounts', 2, '2018-05-06 08:49:01', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(315, 'Ashis Basnet', 'Updated the Club Accounts', 5, '2018-05-06 08:49:01', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(316, 'Ashis Basnet', 'Updated the Club Accounts', 6, '2018-05-06 08:49:02', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(317, 'Ashis Basnet', 'Updated the Club Accounts', 7, '2018-05-06 08:49:02', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(318, 'Ashis Basnet', 'Updated the Club Accounts', 8, '2018-05-06 08:49:02', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(319, 'Ashis Basnet', 'Updated the Club Accounts', 9, '2018-05-06 08:49:02', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(320, 'Ashis Basnet', 'Updated the Club Accounts', 10, '2018-05-06 08:49:02', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(321, 'Ashis Basnet', 'Updated the Club Accounts', 11, '2018-05-06 08:49:02', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(322, 'You', 'Updated the Club Accounts', 12, '2018-05-06 08:49:02', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(323, 'Ashis Basnet', 'Updated the Club Accounts', 13, '2018-05-06 08:49:02', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(324, 'Ashis Basnet', 'Updated the Club Accounts', 1, '2018-05-06 08:49:27', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(325, 'Ashis Basnet', 'Updated the Club Accounts', 2, '2018-05-06 08:49:27', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(326, 'Ashis Basnet', 'Updated the Club Accounts', 5, '2018-05-06 08:49:27', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(327, 'Ashis Basnet', 'Updated the Club Accounts', 6, '2018-05-06 08:49:27', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(328, 'Ashis Basnet', 'Updated the Club Accounts', 7, '2018-05-06 08:49:27', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(329, 'Ashis Basnet', 'Updated the Club Accounts', 8, '2018-05-06 08:49:27', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(330, 'Ashis Basnet', 'Updated the Club Accounts', 9, '2018-05-06 08:49:27', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(331, 'Ashis Basnet', 'Updated the Club Accounts', 10, '2018-05-06 08:49:27', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(332, 'Ashis Basnet', 'Updated the Club Accounts', 11, '2018-05-06 08:49:27', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(333, 'You', 'Updated the Club Accounts', 12, '2018-05-06 08:49:27', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(334, 'Ashis Basnet', 'Updated the Club Accounts', 13, '2018-05-06 08:49:27', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(335, 'You', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 1, '2018-05-06 13:57:20', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(336, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 2, '2018-05-06 13:57:21', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(337, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 5, '2018-05-06 13:57:21', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(338, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 6, '2018-05-06 13:57:21', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(339, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 11, '2018-05-06 13:57:21', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(340, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 12, '2018-05-06 13:57:21', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(341, 'You', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 1, '2018-05-06 14:23:37', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(342, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 2, '2018-05-06 14:23:39', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(343, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 5, '2018-05-06 14:23:39', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(344, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 6, '2018-05-06 14:23:39', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(345, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 11, '2018-05-06 14:23:39', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(346, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 12, '2018-05-06 14:23:39', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(347, 'You', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 1, '2018-05-06 14:34:27', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(348, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 2, '2018-05-06 14:34:29', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(349, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 5, '2018-05-06 14:34:29', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(350, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 6, '2018-05-06 14:34:29', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(351, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 11, '2018-05-06 14:34:29', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(352, 'Rohit Jung Karki', 'Sent an Email of Expenses to \'rohit.bim1360@thamescollege.edu.np\'', 12, '2018-05-06 14:34:29', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(353, 'You', 'Sent an Email of incomes to \'rohit.bim1360@thamescollege.edu.np\'', 1, '2018-05-06 14:53:18', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(354, 'Rohit Jung Karki', 'Sent an Email of incomes to \'rohit.bim1360@thamescollege.edu.np\'', 2, '2018-05-06 14:53:19', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(355, 'Rohit Jung Karki', 'Sent an Email of incomes to \'rohit.bim1360@thamescollege.edu.np\'', 5, '2018-05-06 14:53:19', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(356, 'Rohit Jung Karki', 'Sent an Email of incomes to \'rohit.bim1360@thamescollege.edu.np\'', 6, '2018-05-06 14:53:19', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(357, 'Rohit Jung Karki', 'Sent an Email of incomes to \'rohit.bim1360@thamescollege.edu.np\'', 11, '2018-05-06 14:53:19', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(358, 'Rohit Jung Karki', 'Sent an Email of incomes to \'rohit.bim1360@thamescollege.edu.np\'', 12, '2018-05-06 14:53:20', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(359, 'You', 'Posted a new Meeting \'general Meeting 102\'', 1, '2018-05-06 14:55:45', 'fa-users', '/dashboard/notifications/meeting/3', 'View meeting Details', 'bg-teal'),
(360, 'Rohit Jung Karki', 'Posted a new Meeting \'general Meeting 102\'', 2, '2018-05-06 14:55:45', 'fa-users', '/dashboard/notifications/meeting/3', 'View meeting Details', 'bg-teal'),
(361, 'Rohit Jung Karki', 'Posted a new Meeting \'general Meeting 102\'', 5, '2018-05-06 14:55:45', 'fa-users', '/dashboard/notifications/meeting/3', 'View meeting Details', 'bg-teal'),
(362, 'Rohit Jung Karki', 'Posted a new Meeting \'general Meeting 102\'', 6, '2018-05-06 14:55:46', 'fa-users', '/dashboard/notifications/meeting/3', 'View meeting Details', 'bg-teal'),
(363, 'Rohit Jung Karki', 'Posted a new Meeting \'general Meeting 102\'', 7, '2018-05-06 14:55:46', 'fa-users', '/dashboard/notifications/meeting/3', 'View meeting Details', 'bg-teal'),
(364, 'Rohit Jung Karki', 'Posted a new Meeting \'general Meeting 102\'', 8, '2018-05-06 14:55:48', 'fa-users', '/dashboard/notifications/meeting/3', 'View meeting Details', 'bg-teal'),
(365, 'Rohit Jung Karki', 'Posted a new Meeting \'general Meeting 102\'', 9, '2018-05-06 14:55:48', 'fa-users', '/dashboard/notifications/meeting/3', 'View meeting Details', 'bg-teal'),
(366, 'Rohit Jung Karki', 'Posted a new Meeting \'general Meeting 102\'', 10, '2018-05-06 14:55:48', 'fa-users', '/dashboard/notifications/meeting/3', 'View meeting Details', 'bg-teal'),
(367, 'Rohit Jung Karki', 'Posted a new Meeting \'general Meeting 102\'', 11, '2018-05-06 14:55:48', 'fa-users', '/dashboard/notifications/meeting/3', 'View meeting Details', 'bg-teal'),
(368, 'Rohit Jung Karki', 'Posted a new Meeting \'general Meeting 102\'', 12, '2018-05-06 14:55:48', 'fa-users', '/dashboard/notifications/meeting/3', 'View meeting Details', 'bg-teal'),
(369, 'Rohit Jung Karki', 'Posted a new Meeting \'general Meeting 102\'', 13, '2018-05-06 14:55:49', 'fa-users', '/dashboard/notifications/meeting/3', 'View meeting Details', 'bg-teal');
INSERT INTO `tbl_notifications` (`notification_id`, `member_name`, `notification`, `member_id`, `added_date`, `notification_icon`, `link`, `button_text`, `button_color`) VALUES
(370, 'Lawoj Oli', 'Sent an Email of incomes to \'rohit.bim1360@thamescollege.edu.np\'', 1, '2018-05-07 08:04:26', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(371, 'Lawoj Oli', 'Sent an Email of incomes to \'rohit.bim1360@thamescollege.edu.np\'', 2, '2018-05-07 08:04:30', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(372, 'Lawoj Oli', 'Sent an Email of incomes to \'rohit.bim1360@thamescollege.edu.np\'', 5, '2018-05-07 08:04:35', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(373, 'Lawoj Oli', 'Sent an Email of incomes to \'rohit.bim1360@thamescollege.edu.np\'', 6, '2018-05-07 08:04:38', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(374, 'You', 'Sent an Email of incomes to \'rohit.bim1360@thamescollege.edu.np\'', 11, '2018-05-07 08:04:39', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(375, 'Lawoj Oli', 'Sent an Email of incomes to \'rohit.bim1360@thamescollege.edu.np\'', 12, '2018-05-07 08:04:39', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(376, 'You', 'Sent an Email for Expenditure of FIFA Competition  to \'rohit.bim1360@thamescollege.edu.np\'', 1, '2018-05-07 08:23:12', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(377, 'Rohit Jung Karki', 'Sent an Email for Expenditure of FIFA Competition  to \'rohit.bim1360@thamescollege.edu.np\'', 2, '2018-05-07 08:23:13', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(378, 'Rohit Jung Karki', 'Sent an Email for Expenditure of FIFA Competition  to \'rohit.bim1360@thamescollege.edu.np\'', 5, '2018-05-07 08:23:13', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(379, 'Rohit Jung Karki', 'Sent an Email for Expenditure of FIFA Competition  to \'rohit.bim1360@thamescollege.edu.np\'', 6, '2018-05-07 08:23:13', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(380, 'Rohit Jung Karki', 'Sent an Email for Expenditure of FIFA Competition  to \'rohit.bim1360@thamescollege.edu.np\'', 11, '2018-05-07 08:23:13', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(381, 'Rohit Jung Karki', 'Sent an Email for Expenditure of FIFA Competition  to \'rohit.bim1360@thamescollege.edu.np\'', 12, '2018-05-07 08:23:13', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(382, 'You', 'Sent an Email for Expenditure of FIFA Competition  to \'ittest.generalmember@gmail.com\'', 1, '2018-05-07 08:53:52', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(383, 'Rohit Jung Karki', 'Sent an Email for Expenditure of FIFA Competition  to \'ittest.generalmember@gmail.com\'', 2, '2018-05-07 08:53:53', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(384, 'Rohit Jung Karki', 'Sent an Email for Expenditure of FIFA Competition  to \'ittest.generalmember@gmail.com\'', 5, '2018-05-07 08:53:53', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(385, 'Rohit Jung Karki', 'Sent an Email for Expenditure of FIFA Competition  to \'ittest.generalmember@gmail.com\'', 6, '2018-05-07 08:53:53', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(386, 'Rohit Jung Karki', 'Sent an Email for Expenditure of FIFA Competition  to \'ittest.generalmember@gmail.com\'', 11, '2018-05-07 08:53:53', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(387, 'Rohit Jung Karki', 'Sent an Email for Expenditure of FIFA Competition  to \'ittest.generalmember@gmail.com\'', 12, '2018-05-07 08:53:53', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(388, 'You', 'Posted a new Meeting \'GM103\'', 1, '2018-05-21 09:47:41', 'fa-users', '/dashboard/notifications/meeting/4', 'View meeting Details', 'bg-teal'),
(389, 'Rohit Jung Karki', 'Posted a new Meeting \'GM103\'', 2, '2018-05-21 09:47:42', 'fa-users', '/dashboard/notifications/meeting/4', 'View meeting Details', 'bg-teal'),
(390, 'Rohit Jung Karki', 'Posted a new Meeting \'GM103\'', 5, '2018-05-21 09:47:42', 'fa-users', '/dashboard/notifications/meeting/4', 'View meeting Details', 'bg-teal'),
(391, 'Rohit Jung Karki', 'Posted a new Meeting \'GM103\'', 6, '2018-05-21 09:47:42', 'fa-users', '/dashboard/notifications/meeting/4', 'View meeting Details', 'bg-teal'),
(392, 'Rohit Jung Karki', 'Posted a new Meeting \'GM103\'', 7, '2018-05-21 09:47:42', 'fa-users', '/dashboard/notifications/meeting/4', 'View meeting Details', 'bg-teal'),
(393, 'Rohit Jung Karki', 'Posted a new Meeting \'GM103\'', 8, '2018-05-21 09:47:42', 'fa-users', '/dashboard/notifications/meeting/4', 'View meeting Details', 'bg-teal'),
(394, 'Rohit Jung Karki', 'Posted a new Meeting \'GM103\'', 9, '2018-05-21 09:47:42', 'fa-users', '/dashboard/notifications/meeting/4', 'View meeting Details', 'bg-teal'),
(395, 'Rohit Jung Karki', 'Posted a new Meeting \'GM103\'', 10, '2018-05-21 09:47:42', 'fa-users', '/dashboard/notifications/meeting/4', 'View meeting Details', 'bg-teal'),
(396, 'Rohit Jung Karki', 'Posted a new Meeting \'GM103\'', 11, '2018-05-21 09:47:42', 'fa-users', '/dashboard/notifications/meeting/4', 'View meeting Details', 'bg-teal'),
(397, 'Rohit Jung Karki', 'Posted a new Meeting \'GM103\'', 12, '2018-05-21 09:47:42', 'fa-users', '/dashboard/notifications/meeting/4', 'View meeting Details', 'bg-teal'),
(398, 'Rohit Jung Karki', 'Posted a new Meeting \'GM103\'', 13, '2018-05-21 09:47:42', 'fa-users', '/dashboard/notifications/meeting/4', 'View meeting Details', 'bg-teal'),
(399, 'Rohit Jung Karki', 'Downloaded the Income File', 12, '2018-06-06 04:00:46', 'fa-download', '/dashboard', 'back', 'bg-brown'),
(400, 'ittest.generalmember@gmail.com', 'added a new message', 1, '2018-07-03 08:02:05', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(401, 'ittest.generalmember@gmail.com', 'added a new message', 2, '2018-07-03 08:02:05', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(402, 'ittest.generalmember@gmail.com', 'added a new message', 5, '2018-07-03 08:02:05', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(403, 'ittest.generalmember@gmail.com', 'added a new message', 6, '2018-07-03 08:02:05', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(404, 'ittest.generalmember@gmail.com', 'added a new message', 11, '2018-07-03 08:02:05', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(405, 'ittest.generalmember@gmail.com', 'added a new message', 12, '2018-07-03 08:02:06', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(406, 'You', 'Edited informations of Sammy Member', 1, '2018-07-03 08:43:05', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(407, 'Rohit Jung Karki', 'Edited informations of Sammy Member', 2, '2018-07-03 08:43:05', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(408, 'Rohit Jung Karki', 'Edited informations of Sammy Member', 5, '2018-07-03 08:43:05', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(409, 'Rohit Jung Karki', 'Edited informations of Sammy Member', 6, '2018-07-03 08:43:05', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(410, 'Rohit Jung Karki', 'Edited informations of Sammy Member', 11, '2018-07-03 08:43:05', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(411, 'Rohit Jung Karki', 'Edited informations of Sammy Member', 12, '2018-07-03 08:43:05', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(412, 'You', 'Edited informations of Hits Man', 1, '2018-07-03 08:52:39', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(413, 'Rohit Jung Karki', 'Edited informations of Hits Man', 2, '2018-07-03 08:52:40', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(414, 'Rohit Jung Karki', 'Edited informations of Hits Man', 5, '2018-07-03 08:52:40', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(415, 'Rohit Jung Karki', 'Edited informations of Hits Man', 6, '2018-07-03 08:52:40', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(416, 'Rohit Jung Karki', 'Edited informations of Hits Man', 11, '2018-07-03 08:52:40', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(417, 'Rohit Jung Karki', 'Edited informations of Hits Man', 12, '2018-07-03 08:52:40', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(418, 'Nikesh Nakarmi', 'Edited informations of Jason Mraz', 1, '2018-07-03 08:56:44', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(419, 'Nikesh Nakarmi', 'Edited informations of Jason Mraz', 2, '2018-07-03 08:56:44', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(420, 'Nikesh Nakarmi', 'Edited informations of Jason Mraz', 5, '2018-07-03 08:56:44', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(421, 'You', 'Edited informations of Jason Mraz', 6, '2018-07-03 08:56:45', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(422, 'Nikesh Nakarmi', 'Edited informations of Jason Mraz', 11, '2018-07-03 08:56:45', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(423, 'Nikesh Nakarmi', 'Edited informations of Jason Mraz', 12, '2018-07-03 08:56:45', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(424, 'shreyakmdr55@gmail.com', 'added a new message', 1, '2018-07-28 11:09:21', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(425, 'shreyakmdr55@gmail.com', 'added a new message', 2, '2018-07-28 11:09:21', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(426, 'shreyakmdr55@gmail.com', 'added a new message', 5, '2018-07-28 11:09:21', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(427, 'shreyakmdr55@gmail.com', 'added a new message', 6, '2018-07-28 11:09:21', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(428, 'shreyakmdr55@gmail.com', 'added a new message', 11, '2018-07-28 11:09:21', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(429, 'shreyakmdr55@gmail.com', 'added a new message', 12, '2018-07-28 11:09:21', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(430, 'You', 'Edited a Post \'this is my post\'', 1, '2018-07-28 11:10:13', '  fa-edit', '/dashboard/notifications/post/24', 'view Post', 'bg-gray'),
(431, 'You', 'Deleted a Post', 1, '2018-07-28 11:10:17', 'fa-warning', '/dashboard', 'back', 'bg-red'),
(432, 'Rohit Jung Karki', 'Downloaded the Expenses File of Javascript Traning', 12, '2018-07-28 11:12:55', 'fa-download', '/dashboard', 'back', 'bg-brown'),
(433, 'John Mayer', 'Commented on Your Post', 1, '2018-07-28 11:18:21', 'fa-comment-o', '/dashboard/notifications/post/23', 'View Comments', 'bg-gray'),
(434, 'You', 'Added a New Member \'Shreyak Manandhar\'', 1, '2018-07-28 11:21:36', 'fa-user', '/dashboard/notifications/member/14', 'View Member Details', 'bg-aqua'),
(435, 'Rohit Jung Karki', 'Added a New Member \'Shreyak Manandhar\'', 2, '2018-07-28 11:21:36', 'fa-user', '/dashboard/notifications/member/14', 'View Member Details', 'bg-aqua'),
(436, 'Rohit Jung Karki', 'Added a New Member \'Shreyak Manandhar\'', 5, '2018-07-28 11:21:36', 'fa-user', '/dashboard/notifications/member/14', 'View Member Details', 'bg-aqua'),
(437, 'Rohit Jung Karki', 'Added a New Member \'Shreyak Manandhar\'', 6, '2018-07-28 11:21:36', 'fa-user', '/dashboard/notifications/member/14', 'View Member Details', 'bg-aqua'),
(438, 'Rohit Jung Karki', 'Added a New Member \'Shreyak Manandhar\'', 11, '2018-07-28 11:21:37', 'fa-user', '/dashboard/notifications/member/14', 'View Member Details', 'bg-aqua'),
(439, 'Rohit Jung Karki', 'Added a New Member \'Shreyak Manandhar\'', 12, '2018-07-28 11:21:37', 'fa-user', '/dashboard/notifications/member/14', 'View Member Details', 'bg-aqua'),
(440, 'You', 'Updated Your Profile Picture', 14, '2018-07-28 11:25:02', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(441, 'You', 'Updated Your Profile Picture', 14, '2018-07-28 11:25:42', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(442, 'roit.jung@gmail.com', 'added a new message', 1, '2018-07-31 08:26:24', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(443, 'roit.jung@gmail.com', 'added a new message', 2, '2018-07-31 08:26:24', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(444, 'roit.jung@gmail.com', 'added a new message', 5, '2018-07-31 08:26:24', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(445, 'roit.jung@gmail.com', 'added a new message', 6, '2018-07-31 08:26:24', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(446, 'roit.jung@gmail.com', 'added a new message', 11, '2018-07-31 08:26:24', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(447, 'roit.jung@gmail.com', 'added a new message', 12, '2018-07-31 08:26:24', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(448, 'umanga@gmail.com', 'added a new message', 1, '2018-07-31 11:56:08', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(449, 'umanga@gmail.com', 'added a new message', 2, '2018-07-31 11:56:08', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(450, 'umanga@gmail.com', 'added a new message', 5, '2018-07-31 11:56:08', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(451, 'umanga@gmail.com', 'added a new message', 6, '2018-07-31 11:56:08', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(452, 'umanga@gmail.com', 'added a new message', 11, '2018-07-31 11:56:08', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(453, 'umanga@gmail.com', 'added a new message', 12, '2018-07-31 11:56:08', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(454, 'Rohit Jung Karki', 'Commented on Your Post', 14, '2018-07-31 11:57:52', 'fa-comment-o', '/dashboard/notifications/post/25', 'View Comments', 'bg-gray'),
(455, 'prabhat@gmail.com', 'added a new message', 1, '2018-09-03 05:30:19', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(456, 'prabhat@gmail.com', 'added a new message', 2, '2018-09-03 05:30:19', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(457, 'prabhat@gmail.com', 'added a new message', 5, '2018-09-03 05:30:19', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(458, 'prabhat@gmail.com', 'added a new message', 6, '2018-09-03 05:30:19', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(459, 'prabhat@gmail.com', 'added a new message', 11, '2018-09-03 05:30:19', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(460, 'prabhat@gmail.com', 'added a new message', 12, '2018-09-03 05:30:19', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(461, 'robert@gmail.com', 'added a new message', 1, '2018-11-04 14:49:47', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(462, 'robert@gmail.com', 'added a new message', 2, '2018-11-04 14:49:47', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(463, 'robert@gmail.com', 'added a new message', 5, '2018-11-04 14:49:47', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(464, 'robert@gmail.com', 'added a new message', 6, '2018-11-04 14:49:47', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(465, 'robert@gmail.com', 'added a new message', 11, '2018-11-04 14:49:48', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(466, 'robert@gmail.com', 'added a new message', 12, '2018-11-04 14:49:48', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(467, 'You', 'Edited informations of Donald Duck', 1, '2018-11-04 14:53:14', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(468, 'You', 'Edited informations of Donald Duck', 1, '2018-11-04 14:53:14', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(471, 'Rohit Jung Karki', 'Edited informations of Donald Duck', 6, '2018-11-04 14:53:14', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(472, 'Rohit Jung Karki', 'Edited informations of Donald Duck', 11, '2018-11-04 14:53:14', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(473, 'Rohit Jung Karki', 'Edited informations of Donald Duck', 12, '2018-11-04 14:53:14', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(474, 'You', 'Edited a Post \'final test success\'', 1, '2018-11-20 15:37:27', '  fa-edit', '/dashboard/notifications/post/26', 'view Post', 'bg-gray'),
(475, 'You', 'Added a New Member \'Raj Manandhar\'', 1, '2018-11-20 15:42:12', 'fa-user', '/dashboard/notifications/member/15', 'View Member Details', 'bg-aqua'),
(476, 'Rohit Jung Karki', 'Added a New Member \'Raj Manandhar\'', 2, '2018-11-20 15:42:12', 'fa-user', '/dashboard/notifications/member/15', 'View Member Details', 'bg-aqua'),
(477, 'Rohit Jung Karki', 'Added a New Member \'Raj Manandhar\'', 5, '2018-11-20 15:42:12', 'fa-user', '/dashboard/notifications/member/15', 'View Member Details', 'bg-aqua'),
(478, 'Rohit Jung Karki', 'Added a New Member \'Raj Manandhar\'', 6, '2018-11-20 15:42:12', 'fa-user', '/dashboard/notifications/member/15', 'View Member Details', 'bg-aqua'),
(479, 'Rohit Jung Karki', 'Added a New Member \'Raj Manandhar\'', 11, '2018-11-20 15:42:12', 'fa-user', '/dashboard/notifications/member/15', 'View Member Details', 'bg-aqua'),
(480, 'Rohit Jung Karki', 'Added a New Member \'Raj Manandhar\'', 12, '2018-11-20 15:42:12', 'fa-user', '/dashboard/notifications/member/15', 'View Member Details', 'bg-aqua'),
(481, 'Rohit Jung Karki', 'Commented on Your Post', 15, '2018-11-20 15:45:12', 'fa-comment-o', '/dashboard/notifications/post/27', 'View Comments', 'bg-gray'),
(482, 'Raj Manandhar', 'Downloaded the Expenses File of FIFA Competition ', 12, '2018-11-20 15:48:46', 'fa-download', '/dashboard', 'back', 'bg-brown'),
(483, 'Raj Manandhar', 'Sent an Email for incomes of FIFA Competition  to \'ittest.generalmember@gmail.com\'', 1, '2018-11-20 15:52:14', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(484, 'Raj Manandhar', 'Sent an Email for incomes of FIFA Competition  to \'ittest.generalmember@gmail.com\'', 2, '2018-11-20 15:52:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(485, 'Raj Manandhar', 'Sent an Email for incomes of FIFA Competition  to \'ittest.generalmember@gmail.com\'', 5, '2018-11-20 15:52:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(486, 'Raj Manandhar', 'Sent an Email for incomes of FIFA Competition  to \'ittest.generalmember@gmail.com\'', 6, '2018-11-20 15:52:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(487, 'Raj Manandhar', 'Sent an Email for incomes of FIFA Competition  to \'ittest.generalmember@gmail.com\'', 11, '2018-11-20 15:52:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(488, 'Raj Manandhar', 'Sent an Email for incomes of FIFA Competition  to \'ittest.generalmember@gmail.com\'', 12, '2018-11-20 15:52:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(489, 'You', 'Sent You an Email titled \'General Meeting\'', 1, '2018-11-20 15:54:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(490, 'Rohit Jung Karki', 'Sent You an Email titled \'General Meeting\'', 2, '2018-11-20 15:54:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(491, 'Rohit Jung Karki', 'Sent You an Email titled \'General Meeting\'', 5, '2018-11-20 15:54:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(492, 'Rohit Jung Karki', 'Sent You an Email titled \'General Meeting\'', 6, '2018-11-20 15:54:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(493, 'Rohit Jung Karki', 'Sent You an Email titled \'General Meeting\'', 7, '2018-11-20 15:54:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(494, 'Rohit Jung Karki', 'Sent You an Email titled \'General Meeting\'', 8, '2018-11-20 15:54:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(495, 'Rohit Jung Karki', 'Sent You an Email titled \'General Meeting\'', 9, '2018-11-20 15:54:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(496, 'Rohit Jung Karki', 'Sent You an Email titled \'General Meeting\'', 10, '2018-11-20 15:54:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(497, 'Rohit Jung Karki', 'Sent You an Email titled \'General Meeting\'', 11, '2018-11-20 15:54:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(498, 'Rohit Jung Karki', 'Sent You an Email titled \'General Meeting\'', 12, '2018-11-20 15:54:15', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(499, 'Rohit Jung Karki', 'Sent You an Email titled \'General Meeting\'', 13, '2018-11-20 15:54:16', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(500, 'Rohit Jung Karki', 'Sent You an Email titled \'General Meeting\'', 14, '2018-11-20 15:54:16', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(501, 'Rohit Jung Karki', 'Sent You an Email titled \'General Meeting\'', 15, '2018-11-20 15:54:16', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(502, 'You', 'Updated Your Profile Picture', 15, '2018-11-20 15:57:29', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(503, 'You', 'Edited informations of Raj Manandhar', 1, '2018-11-20 15:59:08', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(504, 'Rohit Jung Karki', 'Edited informations of Raj Manandhar', 2, '2018-11-20 15:59:09', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(505, 'Rohit Jung Karki', 'Edited informations of Raj Manandhar', 5, '2018-11-20 15:59:09', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(506, 'Rohit Jung Karki', 'Edited informations of Raj Manandhar', 6, '2018-11-20 15:59:10', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(507, 'Rohit Jung Karki', 'Edited informations of Raj Manandhar', 11, '2018-11-20 15:59:10', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(508, 'Rohit Jung Karki', 'Edited informations of Raj Manandhar', 12, '2018-11-20 15:59:11', '  fa-user', '\"/dashboard/notifications/member/\" + member.getMemberId()', 'View Details', 'bg-light-blue'),
(509, 'Raj Manandhar', 'Posted a new Meeting \'GM104\'', 1, '2018-11-20 16:03:06', 'fa-users', '/dashboard/notifications/meeting/5', 'View meeting Details', 'bg-teal'),
(510, 'Raj Manandhar', 'Posted a new Meeting \'GM104\'', 2, '2018-11-20 16:03:06', 'fa-users', '/dashboard/notifications/meeting/5', 'View meeting Details', 'bg-teal'),
(511, 'Raj Manandhar', 'Posted a new Meeting \'GM104\'', 5, '2018-11-20 16:03:07', 'fa-users', '/dashboard/notifications/meeting/5', 'View meeting Details', 'bg-teal'),
(512, 'Raj Manandhar', 'Posted a new Meeting \'GM104\'', 6, '2018-11-20 16:03:07', 'fa-users', '/dashboard/notifications/meeting/5', 'View meeting Details', 'bg-teal'),
(513, 'Raj Manandhar', 'Posted a new Meeting \'GM104\'', 7, '2018-11-20 16:03:07', 'fa-users', '/dashboard/notifications/meeting/5', 'View meeting Details', 'bg-teal'),
(514, 'Raj Manandhar', 'Posted a new Meeting \'GM104\'', 8, '2018-11-20 16:03:07', 'fa-users', '/dashboard/notifications/meeting/5', 'View meeting Details', 'bg-teal'),
(515, 'Raj Manandhar', 'Posted a new Meeting \'GM104\'', 9, '2018-11-20 16:03:08', 'fa-users', '/dashboard/notifications/meeting/5', 'View meeting Details', 'bg-teal'),
(516, 'Raj Manandhar', 'Posted a new Meeting \'GM104\'', 10, '2018-11-20 16:03:09', 'fa-users', '/dashboard/notifications/meeting/5', 'View meeting Details', 'bg-teal'),
(517, 'Raj Manandhar', 'Posted a new Meeting \'GM104\'', 11, '2018-11-20 16:03:09', 'fa-users', '/dashboard/notifications/meeting/5', 'View meeting Details', 'bg-teal'),
(518, 'Raj Manandhar', 'Posted a new Meeting \'GM104\'', 12, '2018-11-20 16:03:09', 'fa-users', '/dashboard/notifications/meeting/5', 'View meeting Details', 'bg-teal'),
(519, 'Raj Manandhar', 'Posted a new Meeting \'GM104\'', 13, '2018-11-20 16:03:09', 'fa-users', '/dashboard/notifications/meeting/5', 'View meeting Details', 'bg-teal'),
(520, 'Raj Manandhar', 'Posted a new Meeting \'GM104\'', 14, '2018-11-20 16:03:10', 'fa-users', '/dashboard/notifications/meeting/5', 'View meeting Details', 'bg-teal'),
(521, 'You', 'Posted a new Meeting \'GM104\'', 15, '2018-11-20 16:03:10', 'fa-users', '/dashboard/notifications/meeting/5', 'View meeting Details', 'bg-teal'),
(522, 'sagargiri8991@gmail.com', 'added a new message', 1, '2018-12-25 10:56:41', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(523, 'sagargiri8991@gmail.com', 'added a new message', 2, '2018-12-25 10:56:41', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(524, 'sagargiri8991@gmail.com', 'added a new message', 5, '2018-12-25 10:56:41', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(525, 'sagargiri8991@gmail.com', 'added a new message', 6, '2018-12-25 10:56:41', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(526, 'sagargiri8991@gmail.com', 'added a new message', 11, '2018-12-25 10:56:41', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(527, 'sagargiri8991@gmail.com', 'added a new message', 12, '2018-12-25 10:56:41', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(528, 'sagargiri8991@gmail.com', 'added a new message', 15, '2018-12-25 10:56:41', 'fa-folder-open', '/dashboard/messages', 'View', 'bg-lime'),
(529, 'You', 'Sent an Email titled \'Reply to: Hello\'', 1, '2018-12-25 10:58:06', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(530, 'Rohit Jung Karki', 'Sent an Email titled \'Reply to: Hello\'', 2, '2018-12-25 10:58:06', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(531, 'Rohit Jung Karki', 'Sent an Email titled \'Reply to: Hello\'', 5, '2018-12-25 10:58:06', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(532, 'Rohit Jung Karki', 'Sent an Email titled \'Reply to: Hello\'', 6, '2018-12-25 10:58:06', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(533, 'Rohit Jung Karki', 'Sent an Email titled \'Reply to: Hello\'', 11, '2018-12-25 10:58:06', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(534, 'Rohit Jung Karki', 'Sent an Email titled \'Reply to: Hello\'', 12, '2018-12-25 10:58:07', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(535, 'Rohit Jung Karki', 'Sent an Email titled \'Reply to: Hello\'', 15, '2018-12-25 10:58:07', 'fa-envelope', '/dashboard', 'back', 'bg-maroon'),
(536, 'John Mayer', 'Commented on Your Post', 1, '2018-12-25 10:59:15', 'fa-comment-o', '/dashboard/notifications/post/29', 'View Comments', 'bg-gray'),
(537, 'You', 'Added a New Member \'sagar giri\'', 1, '2018-12-25 11:01:54', 'fa-user', '/dashboard/notifications/member/16', 'View Member Details', 'bg-aqua'),
(538, 'Rohit Jung Karki', 'Added a New Member \'sagar giri\'', 2, '2018-12-25 11:01:54', 'fa-user', '/dashboard/notifications/member/16', 'View Member Details', 'bg-aqua'),
(539, 'Rohit Jung Karki', 'Added a New Member \'sagar giri\'', 5, '2018-12-25 11:01:54', 'fa-user', '/dashboard/notifications/member/16', 'View Member Details', 'bg-aqua'),
(540, 'Rohit Jung Karki', 'Added a New Member \'sagar giri\'', 6, '2018-12-25 11:01:54', 'fa-user', '/dashboard/notifications/member/16', 'View Member Details', 'bg-aqua'),
(541, 'Rohit Jung Karki', 'Added a New Member \'sagar giri\'', 11, '2018-12-25 11:01:54', 'fa-user', '/dashboard/notifications/member/16', 'View Member Details', 'bg-aqua'),
(542, 'Rohit Jung Karki', 'Added a New Member \'sagar giri\'', 12, '2018-12-25 11:01:54', 'fa-user', '/dashboard/notifications/member/16', 'View Member Details', 'bg-aqua'),
(543, 'Rohit Jung Karki', 'Added a New Member \'sagar giri\'', 15, '2018-12-25 11:01:54', 'fa-user', '/dashboard/notifications/member/16', 'View Member Details', 'bg-aqua'),
(544, 'You', 'Updated Your Profile Picture', 16, '2018-12-25 11:04:01', 'fa-picture-o', '/dashboard', 'View', 'bg-black'),
(545, 'sagar giri', 'Commented on Your Post', 1, '2018-12-25 11:04:24', 'fa-comment-o', '/dashboard/notifications/post/29', 'View Comments', 'bg-gray'),
(546, 'You', 'Added a new Email Template  \'Greetings\'', 1, '2018-12-25 11:09:11', 'fa-pencil', '/dashboard/notifications/emailTemplate/6', 'View Templates', 'bg-yellow'),
(547, 'Rohit Jung Karki', 'Added a new Email Template  \'Greetings\'', 2, '2018-12-25 11:09:11', 'fa-pencil', '/dashboard/notifications/emailTemplate/6', 'View Templates', 'bg-yellow'),
(548, 'You', 'Deleted an Email Template  \'Greetings\'', 1, '2018-12-25 11:09:15', 'fa-pencil', '/dashboard/mail', 'view', 'bg-yellow'),
(549, 'Rohit Jung Karki', 'Deleted an Email Template  \'Greetings\'', 2, '2018-12-25 11:09:15', 'fa-pencil', '/dashboard/mail', 'view', 'bg-yellow'),
(550, 'Ashis Basnet', 'Updated the Club Accounts', 1, '2018-12-25 11:14:26', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(551, 'Ashis Basnet', 'Updated the Club Accounts', 2, '2018-12-25 11:14:26', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(552, 'Ashis Basnet', 'Updated the Club Accounts', 5, '2018-12-25 11:14:26', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(553, 'Ashis Basnet', 'Updated the Club Accounts', 6, '2018-12-25 11:14:26', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(554, 'Ashis Basnet', 'Updated the Club Accounts', 7, '2018-12-25 11:14:26', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(555, 'Ashis Basnet', 'Updated the Club Accounts', 8, '2018-12-25 11:14:26', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(556, 'Ashis Basnet', 'Updated the Club Accounts', 9, '2018-12-25 11:14:26', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(557, 'Ashis Basnet', 'Updated the Club Accounts', 10, '2018-12-25 11:14:26', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(558, 'Ashis Basnet', 'Updated the Club Accounts', 11, '2018-12-25 11:14:26', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(559, 'You', 'Updated the Club Accounts', 12, '2018-12-25 11:14:26', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(560, 'Ashis Basnet', 'Updated the Club Accounts', 13, '2018-12-25 11:14:26', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(561, 'Ashis Basnet', 'Updated the Club Accounts', 14, '2018-12-25 11:14:26', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(562, 'Ashis Basnet', 'Updated the Club Accounts', 15, '2018-12-25 11:14:26', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange'),
(563, 'Ashis Basnet', 'Updated the Club Accounts', 16, '2018-12-25 11:14:26', 'fa-money', '/dashboard/accounts', 'Check Accounts', 'bg-orange');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_posts`
--

CREATE TABLE `tbl_posts` (
  `post_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_posts`
--

INSERT INTO `tbl_posts` (`post_id`, `member_id`, `post_body`, `added_date`, `picture_id`) VALUES
(3, 1, 'First Post Ever testing edit', '2018-03-10 03:40:58', 1),
(4, 2, 'Second Post', '2018-03-09 14:50:07', 2),
(5, 11, 'Third Post', '2018-03-09 15:52:26', 15),
(7, 1, 'So happy with my new News Feed \r\nEverything is working perfectly', '2018-03-22 05:19:34', 1),
(8, 10, 'Hello this is my first post', '2018-03-11 16:08:14', 10),
(18, 11, 'hello all', '2018-03-18 14:40:31', 15),
(19, 1, 'hack testing post edited', '2018-03-22 06:47:31', 1),
(20, 12, 'don\'t forget to download the accounts', '2018-04-16 06:36:48', 16),
(21, 1, 'meeting response is working now', '2018-05-07 10:02:21', 1),
(22, 1, 'hello', '2018-07-06 05:19:15', 1),
(23, 1, 'hi', '2018-07-12 04:54:32', 1),
(25, 14, 'my first post', '2018-07-28 11:25:25', 18),
(26, 1, 'final test success', '2018-11-20 15:37:27', 1),
(27, 15, 'hello everyone this is my first post', '2018-11-20 15:44:53', 19),
(28, 1, 'hello world', '2018-11-21 11:17:53', 1),
(29, 1, 'merry christmas', '2018-12-25 10:57:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profile_picture`
--

CREATE TABLE `tbl_profile_picture` (
  `picture_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL DEFAULT 'img/profilePic/default.jpg',
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_current_pic` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_profile_picture`
--

INSERT INTO `tbl_profile_picture` (`picture_id`, `member_id`, `picture`, `added_date`, `is_current_pic`) VALUES
(1, 1, 'img/profilePic/mypic.jpg', '2018-03-18 05:06:26', 1),
(2, 2, 'img/profilePic/default.jpg', '2018-03-09 14:36:11', 1),
(5, 5, 'img/profilePic/james241.jpg', '2018-03-18 04:58:15', 1),
(6, 8, 'img/profilePic/john222.jpg', '2018-03-09 14:36:43', 1),
(10, 10, 'img/profilePic/jason321.jpg', '2018-03-18 04:43:57', 1),
(12, 6, 'img/profilePic/default.jpg', '2018-03-18 04:56:13', 1),
(13, 7, 'img/profilePic/default.jpg', '2018-03-18 04:56:54', 1),
(15, 11, 'img/profilePic/default.jpg', '2018-03-18 05:27:43', 1),
(16, 12, 'img/profilePic/baji.jpg', '2018-03-18 05:28:27', 1),
(17, 13, 'img/profilePic/default.jpg', '2018-04-15 09:10:11', 1),
(18, 14, 'img/profilePic/Koala.jpg', '2018-07-28 11:21:36', 1),
(19, 15, 'img/profilePic/raj.jpg', '2018-11-20 15:42:12', 1),
(20, 16, 'img/profilePic/Jellyfish.jpg', '2018-12-25 11:01:53', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `picture_id` (`picture_id`);

--
-- Indexes for table `tbl_email_templates`
--
ALTER TABLE `tbl_email_templates`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `tbl_events`
--
ALTER TABLE `tbl_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `tbl_event_team`
--
ALTER TABLE `tbl_event_team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `tbl_meetings`
--
ALTER TABLE `tbl_meetings`
  ADD PRIMARY KEY (`meeting_id`);

--
-- Indexes for table `tbl_meeting_response`
--
ALTER TABLE `tbl_meeting_response`
  ADD PRIMARY KEY (`response_id`),
  ADD KEY `meeting_id` (`meeting_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `tbl_members`
--
ALTER TABLE `tbl_members`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `tbl_posts`
--
ALTER TABLE `tbl_posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `picture_id` (`picture_id`);

--
-- Indexes for table `tbl_profile_picture`
--
ALTER TABLE `tbl_profile_picture`
  ADD PRIMARY KEY (`picture_id`),
  ADD KEY `member_id` (`member_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `tbl_email_templates`
--
ALTER TABLE `tbl_email_templates`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_events`
--
ALTER TABLE `tbl_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_event_team`
--
ALTER TABLE `tbl_event_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_meetings`
--
ALTER TABLE `tbl_meetings`
  MODIFY `meeting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_meeting_response`
--
ALTER TABLE `tbl_meeting_response`
  MODIFY `response_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_members`
--
ALTER TABLE `tbl_members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=564;
--
-- AUTO_INCREMENT for table `tbl_posts`
--
ALTER TABLE `tbl_posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `tbl_profile_picture`
--
ALTER TABLE `tbl_profile_picture`
  MODIFY `picture_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  ADD CONSTRAINT `tbl_accounts_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `tbl_events` (`event_id`);

--
-- Constraints for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  ADD CONSTRAINT `tbl_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `tbl_posts` (`post_id`),
  ADD CONSTRAINT `tbl_comments_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `tbl_members` (`member_id`),
  ADD CONSTRAINT `tbl_comments_ibfk_3` FOREIGN KEY (`picture_id`) REFERENCES `tbl_profile_picture` (`picture_id`);

--
-- Constraints for table `tbl_event_team`
--
ALTER TABLE `tbl_event_team`
  ADD CONSTRAINT `tbl_event_team_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `tbl_events` (`event_id`);

--
-- Constraints for table `tbl_meeting_response`
--
ALTER TABLE `tbl_meeting_response`
  ADD CONSTRAINT `tbl_meeting_response_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `tbl_meetings` (`meeting_id`),
  ADD CONSTRAINT `tbl_meeting_response_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `tbl_members` (`member_id`);

--
-- Constraints for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  ADD CONSTRAINT `tbl_notifications_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_members` (`member_id`);

--
-- Constraints for table `tbl_posts`
--
ALTER TABLE `tbl_posts`
  ADD CONSTRAINT `tbl_posts_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_members` (`member_id`),
  ADD CONSTRAINT `tbl_posts_ibfk_2` FOREIGN KEY (`picture_id`) REFERENCES `tbl_profile_picture` (`picture_id`);

--
-- Constraints for table `tbl_profile_picture`
--
ALTER TABLE `tbl_profile_picture`
  ADD CONSTRAINT `tbl_profile_picture_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_members` (`member_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
