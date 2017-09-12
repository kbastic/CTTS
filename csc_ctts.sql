-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2016 at 11:33 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `csc_ctts`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
`clientID` int(11) unsigned NOT NULL,
  `companyName` varchar(100) NOT NULL,
  `companyPhone` varchar(10) DEFAULT NULL,
  `companyEmail` varchar(50) NOT NULL,
  `companyAddress` varchar(50) NOT NULL,
  `companyCity` varchar(50) NOT NULL,
  `companyState` varchar(50) NOT NULL,
  `companyZip` varchar(10) DEFAULT NULL,
  `contactFirstName` varchar(30) NOT NULL,
  `contactLastName` varchar(30) NOT NULL,
  `contactPhone` varchar(10) DEFAULT NULL,
  `contactEmail` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`clientID`, `companyName`, `companyPhone`, `companyEmail`, `companyAddress`, `companyCity`, `companyState`, `companyZip`, `contactFirstName`, `contactLastName`, `contactPhone`, `contactEmail`) VALUES
(1, 'Coastline Systems', '9087376000', 'support@costlinesystems.com', '1 Company Ave', 'Union', 'NJ', '7083', 'John', 'Smith', '9087371234', 'john@coastlinesystems.com'),
(2, 'Doe Publishing', '9083331234', 'support@doePublish.com', ' 100 Company St', 'Union', 'NJ', '7083', 'John', 'Doe', '9083331244', 'JohnDoe@doePublish.com'),
(3, 'walmart', '9083425857', 'suppport@walmart.com', '106 north av', 'Union', 'NJ', '7083', 'Mauro', 'Quizhpi', '9083821648', 'john@walmart.com'),
(4, 'KRS Inc', '9085555555', 'support@krsinc.com', '1234 Morris Ave', 'Union', 'NJ', '07083', 'Katarina', 'Bastic', '9085555555', 'kbastic@krsinc.com'),
(5, 'RG-VB Inc', '9081234567', 'support@rgvb.com', '4931 Morris Ave', 'Union', 'NJ', '07083', 'Gafar', 'Balogun', '9081234567', 'balogung@rgvb.com'),
(6, 'At&t', '8924561234', 'support.att.com', '446 knigstbridge rd', 'Piscataway', 'NJ', '08854', 'Quinn', 'MacLean', '9082461234', 'macleanq@kean.edu'),
(7, 'ToysRUs', '9088519695', 'brian@toys.com', '1701 Morris Ave', 'Union', 'NJ', '7083', 'Brian', 'Fuller', NULL, 'fullbria@kean.edu');

-- --------------------------------------------------------

--
-- Table structure for table `component`
--

CREATE TABLE IF NOT EXISTS `component` (
  `compID` int(11) NOT NULL,
  `purchaseDate` date NOT NULL,
  `warrantyDate` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `manufacturer` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE IF NOT EXISTS `configuration` (
  `equipID` int(11) NOT NULL,
  `systemSoftware` varchar(50) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `keyword` varchar(200) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
`empID` int(11) unsigned NOT NULL,
  `empFirstName` varchar(30) NOT NULL,
  `empLastName` varchar(30) NOT NULL,
  `empAddress` varchar(50) NOT NULL,
  `empPhone` varchar(10) DEFAULT NULL,
  `empEmail` varchar(50) NOT NULL,
  `empPosition` varchar(50) NOT NULL,
  `empCompany` int(11) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empID`, `empFirstName`, `empLastName`, `empAddress`, `empPhone`, `empEmail`, `empPosition`, `empCompany`) VALUES
(1, 'Jared', 'Kohr', '1000 Morris Avenue', '9087376001', 'kohrj@kean.edu', 'Technician', 1),
(2, 'Carolee', 'Stewart', '1000 Morris Ave', '9087376002', 'cstewart@kean.edu', 'Technician', 1),
(3, 'Jonathan', 'Smith', '1234 Main Street', '9087376002', 'jsmith@kean.edu', 'Technician', 1),
(4, 'Stephanie', 'Eordanidis', '1000 Morris Avenue', '908-737-60', 'eordanis@kean.edu', 'Technician', 1),
(5, 'roger', 'burgos', '147 virginia st', '2012812244', 'burgorog@kean.edu', 'Technician', 1),
(6, 'Roma', 'Vachhani', '1000 Morris Avenue', '3047315910', 'vachhar@kean.edu', 'Technician', 0),
(7, 'Francis', 'Hanson', 'Union', '8763459087', 'hansonf@kean.edu', 'Technician', 0),
(8, 'Eric', 'Rosa', '1000 Morris Ave', '9087376001', 'rosaer@kean.edu', 'Technician', 1),
(9, 'Ray', 'Rutledge', '1000 Morris Ave', '9087376001', 'rutledra@kean.edu', 'Technician', 1),
(10, 'Jaime', 'Corea', '160 Hackensack St WoodRidge NJ', '8622413121', 'coreaj@kean.edu', 'Technician', 1);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE IF NOT EXISTS `equipment` (
`equipID` int(11) unsigned NOT NULL,
  `clientID` int(11) NOT NULL,
  `warrantyDate` date NOT NULL,
  `equipType` varchar(50) NOT NULL,
  `installDate` date NOT NULL,
  `equipName` varchar(50) NOT NULL,
  `serialNumber` varchar(50) NOT NULL,
  `manufacturer` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`equipID`, `clientID`, `warrantyDate`, `equipType`, `installDate`, `equipName`, `serialNumber`, `manufacturer`) VALUES
(1, 1, '2018-06-09', 'Desktop', '2015-03-09', 'Optiplex 7870', '24X675Q', 'Dell'),
(2, 4, '2019-10-10', 'Desktop', '2015-10-10', 'Optiplex 7870', '25x675Q', 'Dell'),
(3, 4, '2015-11-02', 'blaha', '2015-11-01', 'who cares', 'blahahhaha', 'Dell'),
(4, 4, '2016-01-15', 'blah blahlhjfdlall', '2015-11-17', 'dont know dont care', '1121222858', 'someone');

-- --------------------------------------------------------

--
-- Table structure for table `equipmentcomponent`
--

CREATE TABLE IF NOT EXISTS `equipmentcomponent` (
  `equipID` int(11) NOT NULL,
  `compID` int(11) NOT NULL,
  `installDate` date NOT NULL,
  `removalDate` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `servicerequest`
--

CREATE TABLE IF NOT EXISTS `servicerequest` (
`srID` int(11) unsigned NOT NULL,
  `equipID` int(11) NOT NULL,
  `clientID` int(11) NOT NULL,
  `reportDate` date NOT NULL,
  `problemDescription` varchar(2000) NOT NULL,
  `status` varchar(30) NOT NULL,
  `resolveDate` date DEFAULT NULL,
  `assignedTech` int(11) DEFAULT NULL,
  `requestor` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servicerequest`
--

INSERT INTO `servicerequest` (`srID`, `equipID`, `clientID`, `reportDate`, `problemDescription`, `status`, `resolveDate`, `assignedTech`, `requestor`) VALUES
(1, 1, 1, '2015-08-11', 'TEST', 'Resolved', NULL, 4, ''),
(2, 1, 1, '2015-08-11', 'TEST2', 'On Hold', NULL, 4, ''),
(3, 1, 1, '2015-08-16', 'Test #4 - Hello world!', 'Escalated', NULL, NULL, 'Jared Kohr'),
(4, 1, 1, '2015-08-17', 'I am a user from coastline, logged in as the company.', 'Resolved', NULL, 1, 'John Smith'),
(5, 1, 1, '2015-08-17', 'Test service request.', 'Escalated', NULL, NULL, 'John Smith'),
(6, 1, 1, '2015-08-17', 'Test client input.', 'Escalated', NULL, NULL, 'John Smith'),
(7, 1, 1, '2015-08-17', 'Hello World!', 'Escalated', NULL, 4, 'Jared Kohr'),
(8, 2, 2, '2015-08-19', 'The printer will not print', 'Unresolved', NULL, 1, 'Mary White'),
(9, 3, 1, '2015-08-19', 'Screen went black and does not want to work.', 'Unresolved', NULL, 1, 'Jane Doe'),
(10, 1, 1, '2015-08-19', 'Test validation.', 'Unresolved', NULL, 1, 'Jared Kohr'),
(11, 1, 1, '2015-08-19', 'Test validation 2', 'Resolved', NULL, 1, 'Jared Kohr!@$'),
(12, 1, 1, '2015-08-19', 'Test Validation #2', 'Unresolved', NULL, 1, 'Jared Kohr'),
(13, 1, 1, '2015-08-19', 'Test Validation 3', 'New', NULL, NULL, 'Jared'),
(14, 1, 1, '2015-08-19', 'Validation test # idk', 'New', NULL, NULL, 'Jared'),
(15, 1, 1, '2015-08-21', 'TEST', 'New', NULL, NULL, 'John Smith'),
(16, 1, 1, '2015-09-04', 'TEST 9/4/15', 'New', NULL, NULL, 'Jared Kohr'),
(18, 2, 4, '2015-10-10', 'Testing Create Service Request for a Client', 'Unresolved', NULL, 4, 'Katarina Bastic'),
(19, 2, 4, '2015-10-31', 'Testing if it works in my database', 'New', NULL, NULL, 'Kat Bastic'),
(20, 2, 4, '2015-11-06', 'Just adding new request', 'Unresolved', NULL, 4, 'Kat Bastic'),
(21, 2, 4, '2015-11-06', 'Lets add another record', 'Cancelled', NULL, NULL, 'Kat Bastic'),
(22, 2, 4, '2015-11-26', 'jkk', 'On Hold', NULL, NULL, 'Kat Bastic'),
(23, 3, 4, '2015-11-26', 'jkjkjkj', 'Cancelled', NULL, NULL, 'Kat Bastic'),
(24, 3, 4, '2015-11-26', 'hgkjhkj', 'New', NULL, NULL, 'Kat Bastic'),
(25, 4, 4, '2015-11-26', 'Testing if drop down works', 'New', NULL, NULL, 'kat bastic'),
(26, 4, 4, '2015-11-26', 'Testing if confirmation page works', 'New', NULL, NULL, 'Kat Bastic'),
(27, 3, 4, '2015-11-27', 'Something is wrong', 'Cancelled', NULL, NULL, 'Stephanie Eordanidis'),
(28, 2, 4, '2015-11-27', 'Testing', 'New', NULL, NULL, 'Stephanie Eordanidis'),
(29, 2, 4, '2015-11-27', 'Problem', 'New', NULL, NULL, 'Stephanie Eordanidis'),
(30, 2, 4, '2015-11-27', 'Crating new service request for client 4', 'New', NULL, NULL, 'Stephanie Eordanidis'),
(31, 3, 4, '2015-11-27', 'Testing if client still works', 'New', NULL, NULL, 'kat bastic'),
(32, 3, 4, '2015-11-27', 'Why is this not working now', 'Unresolved', NULL, 4, 'kat bastic'),
(33, 2, 4, '2015-11-27', 'Why is this not working', 'Cancelled', NULL, NULL, 'kat bastic'),
(34, 2, 4, '2015-11-27', 'Why is this not working today but it worked yesterday', 'Escalated', NULL, 4, 'Kat Bastic'),
(36, 2, 4, '2015-11-27', 'Testing if this works', 'Cancelled', NULL, NULL, 'Stephanie Eordanidis'),
(37, 4, 4, '2015-11-27', 'Creating new service request', 'New', NULL, NULL, 'kat bastic'),
(38, 4, 4, '2015-11-27', 'Just another test', 'Cancelled', NULL, NULL, 'Katarina Bastic'),
(39, 2, 4, '2015-12-10', 'blah blah blah', 'New', NULL, NULL, 'Kat Bastic');

-- --------------------------------------------------------

--
-- Table structure for table `servicework`
--

CREATE TABLE IF NOT EXISTS `servicework` (
`swID` int(11) unsigned NOT NULL,
  `empID` int(11) NOT NULL,
  `startTime` datetime NOT NULL,
  `finishTime` datetime NOT NULL,
  `description` varchar(200) NOT NULL,
  `srID` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servicework`
--

INSERT INTO `servicework` (`swID`, `empID`, `startTime`, `finishTime`, `description`, `srID`) VALUES
(1, 1, '2015-08-16 11:25:17', '2015-08-17 11:25:17', 'Test adding service work.', 2),
(2, 1, '2015-08-01 12:46:41', '2015-08-02 12:46:41', 'Test #2 adding service work.', 2),
(3, 1, '2015-08-20 15:21:17', '2015-08-28 15:21:17', 'Test', 1),
(4, 1, '2015-08-16 23:24:55', '2015-08-16 23:24:55', 'Testing, post requestor changes.', 3),
(5, 4, '2015-10-28 09:58:51', '2015-10-28 10:38:00', 'Diagnosed the problem, but needs a part we do not have. Put on Hold to wait for part.', 18),
(6, 4, '2015-11-04 12:56:00', '2015-11-04 13:56:00', 'The part came in and we installed it but the system is still not running. New part might be defective, sent back to manufacturer and waiting for replacement.', 18),
(10, 4, '2015-11-24 11:57:27', '2015-11-24 11:57:43', 'this is a test test test t', 18),
(9, 4, '2015-11-24 09:47:33', '2015-11-24 09:49:54', 'bha, lkdkljadlfkjds', 18),
(11, 4, '2015-11-24 11:58:48', '2015-11-24 11:59:03', 'af dafadff asdfasd adsf adfda da fadsfasdfasdfa ', 18),
(12, 4, '2015-11-24 12:24:54', '2015-11-24 12:25:18', 'Testing service work add....', 7),
(13, 4, '2015-11-24 12:29:49', '2015-11-24 12:30:27', 'Must make sure that there are not bad characters', 20),
(14, 4, '2015-11-24 12:30:38', '2015-11-24 12:31:06', 'must add some error check', 20),
(15, 4, '2015-11-25 08:49:29', '2015-11-25 08:49:47', 'This is a test for service work', 20),
(16, 4, '2015-11-27 08:08:25', '2015-11-27 09:08:25', 'This is a test for start time finish time form', 7),
(17, 4, '2015-11-27 11:44:45', '2015-11-28 11:44:45', 'Testing again and again and again', 7),
(18, 4, '2015-11-27 11:54:24', '2015-12-01 11:54:24', 'Testing calendar control', 7),
(19, 4, '2015-05-19 12:53:53', '2015-11-18 12:53:53', 'Adding new service work', 20),
(20, 4, '2015-11-27 17:06:52', '2015-11-30 17:06:52', 'Test', 34),
(21, 4, '2015-12-10 10:08:42', '2015-12-10 10:08:42', 'blah blah blah', 1),
(22, 4, '2015-12-10 10:35:12', '2015-12-10 10:35:12', 'blah blah blah', 2);

-- --------------------------------------------------------

--
-- Table structure for table `serviceworkcomponent`
--

CREATE TABLE IF NOT EXISTS `serviceworkcomponent` (
  `swID` int(11) NOT NULL,
  `compID` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE IF NOT EXISTS `usertable` (
  `userId` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL,
  `empId` int(11) NOT NULL DEFAULT '0',
  `clientId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`userId`, `password`, `empId`, `clientId`) VALUES
('kohrj', 'test', 1, 1),
('coastlinesystems', 'test', 0, 1),
('cstewart', '1234', 2, 1),
('doePublish', '2222', 0, 2),
('jsmith', '2222', 3, 1),
('mwhite', '4444', 0, 2),
('eordanis', 'krs', 4, 1),
('rogerb', 'burgorog', 5, 0),
('quizhpim', '0609211', 0, 3),
('kbastic', '1111', 0, 4),
('vachharo', '9999', 6, 6),
('hansonf', '7763', 7, 7),
('ahadm', 'test', 0, 0),
('qbtran', '1234', 0, 0),
('balogung', 'gb123', 0, 5),
('fullbria', '1234', 7, 7),
('jadcorea', 'mico1992', 1, 0),
('macleanq', 'jqctts', 0, 1),
('rutledra', 'test', 9, 0),
('rosaer', 'test', 8, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
 ADD PRIMARY KEY (`clientID`);

--
-- Indexes for table `component`
--
ALTER TABLE `component`
 ADD PRIMARY KEY (`compID`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
 ADD PRIMARY KEY (`equipID`,`systemSoftware`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
 ADD PRIMARY KEY (`empID`), ADD KEY `empCompany` (`empCompany`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
 ADD PRIMARY KEY (`equipID`), ADD KEY `clientID` (`clientID`);

--
-- Indexes for table `equipmentcomponent`
--
ALTER TABLE `equipmentcomponent`
 ADD PRIMARY KEY (`equipID`,`compID`), ADD KEY `compID` (`compID`);

--
-- Indexes for table `servicerequest`
--
ALTER TABLE `servicerequest`
 ADD PRIMARY KEY (`srID`), ADD KEY `equipID` (`equipID`), ADD KEY `clientID` (`clientID`), ADD KEY `assignedTech` (`assignedTech`);

--
-- Indexes for table `servicework`
--
ALTER TABLE `servicework`
 ADD PRIMARY KEY (`swID`), ADD KEY `empID` (`empID`), ADD KEY `srID` (`srID`);

--
-- Indexes for table `serviceworkcomponent`
--
ALTER TABLE `serviceworkcomponent`
 ADD PRIMARY KEY (`swID`,`compID`), ADD KEY `compID` (`compID`);

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
 ADD PRIMARY KEY (`userId`), ADD KEY `empId` (`empId`), ADD KEY `clientId` (`clientId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
MODIFY `clientID` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
MODIFY `empID` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
MODIFY `equipID` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `servicerequest`
--
ALTER TABLE `servicerequest`
MODIFY `srID` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `servicework`
--
ALTER TABLE `servicework`
MODIFY `swID` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
