-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 23, 2021 at 04:04 PM
-- Server version: 5.6.49-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jounalweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Mathematics'),
(2, 'Medical'),
(3, 'Physics'),
(4, 'Chemistry'),
(5, 'Computer Science');

-- --------------------------------------------------------

--
-- Table structure for table `contact_info`
--

CREATE TABLE `contact_info` (
  `contact_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `street_address` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `phone` int(13) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_info`
--

INSERT INTO `contact_info` (`contact_id`, `first_name`, `last_name`, `street_address`, `country`, `province`, `city`, `phone`, `email`) VALUES
(11, 'admin', 'z', '     cndcndncndklcnsdnkcs                    ', '', '', '', 2147483647, 'receivetestjournal+1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `decision`
--

CREATE TABLE `decision` (
  `decision_id` int(11) NOT NULL,
  `decision_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `decision`
--

INSERT INTO `decision` (`decision_id`, `decision_type`) VALUES
(1, 'Accepted'),
(2, 'Rejected');

-- --------------------------------------------------------

--
-- Table structure for table `degree`
--

CREATE TABLE `degree` (
  `degree_id` int(11) NOT NULL,
  `degree_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `degree`
--

INSERT INTO `degree` (`degree_id`, `degree_type`) VALUES
(1, 'Masters in Computer Science'),
(2, 'PHD in I.T'),
(3, 'BSCS Honors'),
(4, 'Post Graduate Diploma in Interior Design'),
(5, 'BSc Textile Engineering'),
(6, 'BSc Industrial Engineering'),
(7, 'BS Software Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`) VALUES
(1, 'Department of Economics'),
(2, 'Institute of Business & Information Technology'),
(3, 'Department of Textile Engineering & Technology'),
(4, 'Department of Sports Sciences & Physical Education'),
(5, 'Department of Natural Medicine');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `upload_date` datetime NOT NULL,
  `journal_id` int(11) NOT NULL,
  `document_order` int(11) NOT NULL,
  `document_name` text NOT NULL,
  `document_type` varchar(50) NOT NULL,
  `document_designation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expertise`
--

CREATE TABLE `expertise` (
  `expertise_id` int(11) NOT NULL,
  `expertise` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expertise`
--

INSERT INTO `expertise` (`expertise_id`, `expertise`) VALUES
(1, 'Neurology'),
(2, 'Cloud Computing'),
(3, 'Data Sciences'),
(4, 'Data Management'),
(5, 'Computer Networking');

-- --------------------------------------------------------

--
-- Table structure for table `institute`
--

CREATE TABLE `institute` (
  `institute_id` int(11) NOT NULL,
  `institute_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institute`
--

INSERT INTO `institute` (`institute_id`, `institute_name`) VALUES
(1, 'National College of Business Administration and Economics'),
(2, 'FAST University'),
(3, 'PUCIT'),
(4, 'NUST'),
(5, 'GIKI');

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `journal_name` varchar(255) NOT NULL,
  `category_ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `volume_number` int(30) NOT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '0',
  `parent_journal` int(11) NOT NULL,
  `journal_status` int(11) NOT NULL DEFAULT '0',
  `journal_submit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journals_history`
--

CREATE TABLE `journals_history` (
  `id` int(11) NOT NULL,
  `journal_id` int(11) NOT NULL,
  `journal_status_id` int(11) NOT NULL,
  `status_update_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journals_status`
--

CREATE TABLE `journals_status` (
  `id` int(11) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journals_status`
--

INSERT INTO `journals_status` (`id`, `status`) VALUES
(1, 'Submitted to EIC'),
(2, 'EIC Assign AE'),
(3, 'Declined by EIC'),
(4, 'AE Assigned'),
(5, 'Waiting for Reviewer Selection'),
(6, 'Invitation Declined by AE'),
(7, 'Waiting for Reviewer Response'),
(8, 'Waiting for Reviewer Score'),
(9, 'Waiting AE Decision  '),
(10, 'Accepted by AE after reviewer'),
(11, 'Declined by AE after reviewer'),
(12, 'Accepted for Publication'),
(13, 'Declined for Publication');

-- --------------------------------------------------------

--
-- Table structure for table `journal_associate_editors`
--

CREATE TABLE `journal_associate_editors` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `journal_id` int(11) NOT NULL,
  `ae_id` int(11) NOT NULL,
  `assigned_date` datetime NOT NULL,
  `due_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journal_authors`
--

CREATE TABLE `journal_authors` (
  `id` int(11) NOT NULL,
  `journal_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `author_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journal_details`
--

CREATE TABLE `journal_details` (
  `id` int(11) NOT NULL,
  `journal_id` int(11) NOT NULL,
  `type_choice` text NOT NULL,
  `title` text NOT NULL,
  `running_head` text NOT NULL,
  `abstract` text NOT NULL,
  `cover_letter` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journal_keywords`
--

CREATE TABLE `journal_keywords` (
  `id` int(11) NOT NULL,
  `keyword` text NOT NULL,
  `journal_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journal_reviewers`
--

CREATE TABLE `journal_reviewers` (
  `id` int(11) NOT NULL,
  `journal_id` int(11) NOT NULL,
  `reviewer_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suggested_by_author` tinyint(1) NOT NULL DEFAULT '0',
  `added_by_ae` tinyint(1) NOT NULL DEFAULT '0',
  `review_assigned_date` datetime NOT NULL,
  `review_due_date` datetime NOT NULL,
  `accepted_for_review` tinyint(1) NOT NULL DEFAULT '0',
  `declined_for_review` tinyint(1) NOT NULL DEFAULT '0',
  `scores_submitted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journal_reviewer_scores`
--

CREATE TABLE `journal_reviewer_scores` (
  `id` int(11) NOT NULL,
  `journal_reviewer_id` int(11) NOT NULL,
  `journal_id` int(11) NOT NULL,
  `reviewer_id` int(11) NOT NULL,
  `q1` int(11) NOT NULL,
  `q2` int(11) NOT NULL,
  `q3` int(11) NOT NULL,
  `q4` int(11) NOT NULL,
  `q5` int(11) NOT NULL,
  `q6` int(11) NOT NULL,
  `q7` int(11) NOT NULL,
  `q8` int(11) NOT NULL,
  `q9` int(11) NOT NULL,
  `q10` int(11) NOT NULL,
  `reviewer_comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journal_score_parameters`
--

CREATE TABLE `journal_score_parameters` (
  `id` int(11) NOT NULL,
  `score_parameter` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal_score_parameters`
--

INSERT INTO `journal_score_parameters` (`id`, `score_parameter`) VALUES
(1, 'Valid'),
(2, 'Systematic'),
(3, 'Critical'),
(4, 'Logical'),
(5, 'Precise'),
(6, 'Collective'),
(7, 'Dedicated'),
(8, 'Rigorous'),
(9, 'Controlled'),
(10, 'Empirical');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_type`) VALUES
(1, 'Editor-in-chief'),
(2, 'Associate Editor'),
(3, 'Reviewer'),
(4, 'Author');

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `score_id` int(11) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`score_id`, `score`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status`) VALUES
(1, 'Awaiting for reviewer\'s decision'),
(2, 'Awaiting for AE decision');

-- --------------------------------------------------------

--
-- Table structure for table `title`
--

CREATE TABLE `title` (
  `title_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `title`
--

INSERT INTO `title` (`title_id`, `title`) VALUES
(1, 'Professor'),
(2, 'Doctor'),
(3, 'Associate Professor'),
(4, 'Lecturer'),
(5, 'Associate Lecturer');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `title_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `institute_id` int(11) NOT NULL,
  `degree_id` int(11) NOT NULL,
  `role_id` int(20) NOT NULL,
  `expertise_id` int(50) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `user_status` varchar(50) NOT NULL DEFAULT 'requested',
  `requested_date` datetime NOT NULL,
  `approved_date` datetime NOT NULL,
  `added_by_author` tinyint(1) NOT NULL DEFAULT '0',
  `added_by_author_name` text NOT NULL,
  `added_by_ae` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `title_id`, `department_id`, `institute_id`, `degree_id`, `role_id`, `expertise_id`, `contact_id`, `user_status`, `requested_date`, `approved_date`, `added_by_author`, `added_by_author_name`, `added_by_ae`) VALUES
(20, 'admin', 'MTIz', 1, 1, 1, 1, 1, 1, 11, 'Accepted', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `contact_info`
--
ALTER TABLE `contact_info`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `decision`
--
ALTER TABLE `decision`
  ADD PRIMARY KEY (`decision_id`);

--
-- Indexes for table `degree`
--
ALTER TABLE `degree`
  ADD PRIMARY KEY (`degree_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expertise`
--
ALTER TABLE `expertise`
  ADD PRIMARY KEY (`expertise_id`);

--
-- Indexes for table `institute`
--
ALTER TABLE `institute`
  ADD PRIMARY KEY (`institute_id`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journals_history`
--
ALTER TABLE `journals_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journals_status`
--
ALTER TABLE `journals_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_associate_editors`
--
ALTER TABLE `journal_associate_editors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_authors`
--
ALTER TABLE `journal_authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_details`
--
ALTER TABLE `journal_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_keywords`
--
ALTER TABLE `journal_keywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_reviewers`
--
ALTER TABLE `journal_reviewers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_reviewer_scores`
--
ALTER TABLE `journal_reviewer_scores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_score_parameters`
--
ALTER TABLE `journal_score_parameters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`score_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `title`
--
ALTER TABLE `title`
  ADD PRIMARY KEY (`title_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_info`
--
ALTER TABLE `contact_info`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `decision`
--
ALTER TABLE `decision`
  MODIFY `decision_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `degree`
--
ALTER TABLE `degree`
  MODIFY `degree_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `expertise`
--
ALTER TABLE `expertise`
  MODIFY `expertise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `institute`
--
ALTER TABLE `institute`
  MODIFY `institute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `journal`
--
ALTER TABLE `journal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `journals_history`
--
ALTER TABLE `journals_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `journals_status`
--
ALTER TABLE `journals_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `journal_associate_editors`
--
ALTER TABLE `journal_associate_editors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `journal_authors`
--
ALTER TABLE `journal_authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `journal_details`
--
ALTER TABLE `journal_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `journal_keywords`
--
ALTER TABLE `journal_keywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `journal_reviewers`
--
ALTER TABLE `journal_reviewers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `journal_reviewer_scores`
--
ALTER TABLE `journal_reviewer_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `journal_score_parameters`
--
ALTER TABLE `journal_score_parameters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `title`
--
ALTER TABLE `title`
  MODIFY `title_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
