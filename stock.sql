-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2021 at 08:34 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stock`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `ComName` (`id` INT) RETURNS VARCHAR(100) CHARSET latin1 NO SQL
return (SELECT com_name from company where com_id=id)$$

CREATE DEFINER=`root`@`localhost` FUNCTION `proAvgPrice` (`id` INT) RETURNS DOUBLE NO SQL
return (SELECT pro_pprice/pro_qty from product where pro_id=id)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE `balance` (
  `balance_id` int(11) NOT NULL,
  `balance` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`balance_id`, `balance`) VALUES
(1, 50205250);

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `bor_id` int(11) NOT NULL,
  `bor_by` varchar(100) NOT NULL DEFAULT 'Owner',
  `bor_date` date NOT NULL,
  `bor_amount` double NOT NULL,
  `bor_from` varchar(100) NOT NULL,
  `bor_from_contact` varchar(50) NOT NULL,
  `return_date` date NOT NULL,
  `bor_note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`bor_id`, `bor_by`, `bor_date`, `bor_amount`, `bor_from`, `bor_from_contact`, `return_date`, `bor_note`) VALUES
(1, 'Owner', '2019-12-03', 5000, 'Kabir', '12345678', '2019-12-19', 'Personal Purpose'),
(2, 'Owner', '2019-12-01', 9000, 'Brother', '345678', '2019-12-19', 'needed'),
(3, 'Pranta Kumar Biswas', '2019-12-21', 122134444, 'Armann', '02839021', '2019-12-18', 'srsdfgsdf');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`, `cat_desc`) VALUES
(18, 'Fertilizer', 'Use for crops'),
(20, 'Fruits', 'Description under construction'),
(22, 'Pesticide', 'Uses for crops'),
(23, 'MANIK', 'sdfghjk');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `com_id` int(11) NOT NULL,
  `com_name` varchar(100) NOT NULL,
  `com_desc` varchar(255) NOT NULL,
  `com_contact` varchar(50) NOT NULL,
  `com_location` varchar(100) NOT NULL,
  `com_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`com_id`, `com_name`, `com_desc`, `com_contact`, `com_location`, `com_address`) VALUES
(1, 'ACI', 'Pharma Company', '098765432', 'DHaka', 'Dhaka'),
(2, 'google', 'testing purchase', '017xxxxxxx', 'BAngladesh', 'barisal,bangladesh'),
(3, 'microsoft', 'nothing', '01744444', 'ban', 'barisal'),
(4, 'Israil', 'xszdxfcg', 'xcgvhb', 'cvbn', 'sdfgh');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cus_id` int(11) NOT NULL,
  `cus_name` varchar(100) NOT NULL,
  `cus_identifier` varchar(100) NOT NULL,
  `cus_contact1` varchar(50) NOT NULL,
  `cus_contact2` varchar(50) NOT NULL,
  `cus_address` varchar(255) NOT NULL,
  `cus_nid` varchar(100) NOT NULL,
  `cus_contact_person` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cus_id`, `cus_name`, `cus_identifier`, `cus_contact1`, `cus_contact2`, `cus_address`, `cus_nid`, `cus_contact_person`) VALUES
(1, 'Akib Hossain', 'Singer Aku', '09876', '09876', 'barishal', '987654', 'hdhdg'),
(2, 'Arman Ali', 'Rock Arman', '016XX', '017XX', 'barisal', '121092172832874', '01389233'),
(3, 'Ripon Hossain', 'RP', '01387654321', '01872625263', 'Pabna', '1233452523525', '0198762524232'),
(4, 'kabir', 'kabir khan', '098765', '098765', 'kjhgfd', '876543', 'kjhgfd'),
(5, 'samss', 'master', '09876', '098765', 'jhgfd', '987654', 'nbgfcx');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `emp_contact` varchar(50) NOT NULL,
  `emp_designation` varchar(50) NOT NULL,
  `joining_date` date NOT NULL,
  `emp_salary` double DEFAULT '0',
  `emp_type` varchar(20) DEFAULT NULL,
  `resign_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `emp_contact`, `emp_designation`, `joining_date`, `emp_salary`, `emp_type`, `resign_date`) VALUES
(1, 'Ahmed Ullah', '34567', 'Chairman', '2015-12-01', 0, 'Permanent', '2019-12-17'),
(2, 'Abib', '76543456', 'Worker', '2018-12-17', 10000, 'probation Period', NULL),
(3, 'Akram', '345678', 'Seller', '2019-09-10', 7654, 'temporary', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `exp_id` int(11) NOT NULL,
  `exp_by` varchar(100) NOT NULL DEFAULT 'Owner',
  `exp_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exp_amount` double NOT NULL,
  `exp_desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`exp_id`, `exp_by`, `exp_date`, `exp_amount`, `exp_desc`) VALUES
(2, 'Owner', '2019-12-06 21:26:35', 5000, 'business purpose'),
(3, 'Pranta Kumar Biswas', '2019-12-20 13:36:53', 10, 'For byuing pen'),
(4, 'Pranta Kumar Biswas', '2019-12-20 13:40:35', 22, 'Khabar'),
(5, 'MSD', '2019-12-30 23:13:10', 3000, 'à¦¦à§‹à¦¹à¦¾');

-- --------------------------------------------------------

--
-- Table structure for table `investment`
--

CREATE TABLE `investment` (
  `inv_id` int(11) NOT NULL,
  `inv_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inv_amount` double NOT NULL,
  `inv_by` varchar(100) DEFAULT 'Owner',
  `added_by` varchar(100) NOT NULL,
  `inv_desc` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `investment`
--

INSERT INTO `investment` (`inv_id`, `inv_date`, `inv_amount`, `inv_by`, `added_by`, `inv_desc`) VALUES
(6, '2019-12-20 13:19:57', 123123, 'MSD', 'Pranta Kumar Biswas', 'sdasaddas'),
(7, '2019-12-20 13:20:07', 2312, 'MSD', 'Pranta Kumar Biswas', 'dfssdf');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_id` int(11) NOT NULL,
  `loan_by` varchar(100) NOT NULL DEFAULT 'Owner',
  `loan_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `loan_amount` double NOT NULL,
  `borrower_name` varchar(100) NOT NULL,
  `borrower_contact` varchar(100) NOT NULL,
  `borrower_address` varchar(255) DEFAULT NULL,
  `loan_return_date` date NOT NULL,
  `loan_note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_id`, `loan_by`, `loan_date`, `loan_amount`, `borrower_name`, `borrower_contact`, `borrower_address`, `loan_return_date`, `loan_note`) VALUES
(1, 'Owner', '2019-12-06 21:29:03', 6000, 'habib', '987654', 'Dhaka', '2019-12-27', 'werty'),
(4, 'Pranta Kumar Biswas', '2019-12-21 23:53:54', 343, 'fsdafda', 'dffd', 'fdafda', '2019-12-22', 'fdfsa'),
(5, 'Pranta Kumar Biswas', '2019-12-22 00:02:59', 1111111, 'aaaaaaaaaaa', 'bbbbbbbbbbb', 'ccccccccccc', '2019-12-24', 'aaaaaaaaaaaaaaa'),
(6, 'Pranta Kumar Biswas', '2020-01-14 21:31:34', 5000, 'abcd', '0987654', 'dfghj', '2020-01-31', 'jhhyy');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(100) NOT NULL,
  `pro_code` varchar(100) NOT NULL,
  `pro_cat` int(11) NOT NULL,
  `pro_com` int(11) NOT NULL,
  `pro_type` enum('Piece','Kg','Liter') NOT NULL,
  `pro_qty` double DEFAULT '0',
  `pro_pprice` double DEFAULT '0',
  `pro_wholesale` double DEFAULT '0',
  `pro_mrp` double DEFAULT '0',
  `pro_location` varchar(100) DEFAULT NULL,
  `pro_notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pro_id`, `pro_name`, `pro_code`, `pro_cat`, `pro_com`, `pro_type`, `pro_qty`, `pro_pprice`, `pro_wholesale`, `pro_mrp`, `pro_location`, `pro_notes`) VALUES
(1, 'Urea', '1001', 18, 1, 'Kg', 95, 11305, 115, 120, 'Left Self', 'Good Review'),
(2, 'Chocolate-25gm', '1234', 18, 1, 'Kg', 50, 804.5454545454545, 20, 22, 'fgh', 'dfg'),
(3, 'Rice', '4567', 18, 1, 'Piece', -2, -27.936507936507937, 15, 20, 'Left Shelf', 'rty'),
(4, 'potato', '121', 18, 2, 'Kg', 487, 12050.357142857143, 28, 35, 'test', 'test'),
(5, 'Apple', '1231', 20, 1, 'Kg', 15, 529.25, 16, 18, '3rd row', 'under construction'),
(8, 'roton', '1223', 18, 1, 'Kg', 5, 500, 115, 120, 'wdefr', 'dwretr');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `pur_id` int(11) NOT NULL,
  `pur_code` varchar(100) NOT NULL,
  `pur_date` date NOT NULL,
  `pur_company` int(11) NOT NULL,
  `pur_supplier` int(11) NOT NULL,
  `pur_price` double DEFAULT '0',
  `pur_paid` double DEFAULT '0',
  `pur_due` double DEFAULT '0',
  `pur_discount` double DEFAULT '0',
  `added_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(100) DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`pur_id`, `pur_code`, `pur_date`, `pur_company`, `pur_supplier`, `pur_price`, `pur_paid`, `pur_due`, `pur_discount`, `added_date`, `added_by`) VALUES
(1, '1001', '2019-12-06', 1, 1, 5100, 4500, 500, 100, NULL, NULL),
(2, '1002', '2019-12-06', 1, 2, 0, 0, 0, 0, '2019-12-06 19:31:21', 'User'),
(3, '1003', '2019-12-12', 1, 3, 0, 100, 200, 100, '2019-12-06 19:31:21', 'test'),
(4, '111', '2019-12-18', 2, 2, 360, 324, 0, 36, '2019-12-06 19:31:21', 'user'),
(5, '1005', '2019-12-18', 3, 3, 300, 250, 30, 20, '2019-12-06 19:31:21', 'user'),
(6, '1006', '2019-12-19', 3, 3, 120, 108, 0, 12, '2019-12-06 19:31:21', 'user'),
(7, '1007', '2019-12-17', 1, 4, 340, 330, 0, 10, '2019-12-06 19:31:21', 'user'),
(8, '1008', '2019-12-30', 3, 3, 240, 240, 0, 0, '2019-12-06 19:31:21', 'user'),
(9, '1009', '2019-12-30', 2, 2, 200, 200, 0, 0, '2019-12-06 19:31:21', 'user'),
(10, '1010', '2019-12-30', 2, 6, 80, 80, 0, 0, '2019-12-06 19:31:21', 'user'),
(11, '1011', '2019-12-30', 2, 2, 200, 200, 0, 0, '2019-12-06 19:31:21', 'user'),
(12, '1012', '2020-01-14', 4, 7, 1500, 1400, 0, 100, '2019-12-06 19:31:21', 'user');

--
-- Triggers `purchase`
--
DELIMITER $$
CREATE TRIGGER `balance_update` AFTER INSERT ON `purchase` FOR EACH ROW update balance
set balance=balance-NEW.pur_paid
where balance_id='1'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_discount`
--

CREATE TABLE `purchase_discount` (
  `pur_dis_id` int(11) NOT NULL,
  `com_id` int(11) DEFAULT NULL,
  `dis_amount` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_discount`
--

INSERT INTO `purchase_discount` (`pur_dis_id`, `com_id`, `dis_amount`) VALUES
(1, 1, 100),
(2, 2, 20),
(3, 2, 20),
(4, 2, 36),
(5, 3, 20),
(6, 3, 12),
(7, 1, 10),
(8, 4, 100);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_due`
--

CREATE TABLE `purchase_due` (
  `pur_due_id` int(11) NOT NULL,
  `pur_com` int(11) DEFAULT NULL,
  `pur_due` double DEFAULT '0',
  `due_payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_due`
--

INSERT INTO `purchase_due` (`pur_due_id`, `pur_com`, `pur_due`, `due_payment_date`) VALUES
(1, 1, 1000, '2019-12-20'),
(2, 2, 10, '2019-12-20'),
(3, 2, 24, '2019-12-20'),
(4, 3, 30, '2019-12-20'),
(5, 3, 8, '2019-12-20'),
(6, 1, 130, '2019-12-20'),
(7, 4, 400, '2019-12-20');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_product`
--

CREATE TABLE `purchase_product` (
  `pur_pro_id` int(11) NOT NULL,
  `pur_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_qty` double NOT NULL DEFAULT '0',
  `pro_purchase_price` double NOT NULL DEFAULT '0',
  `pro_selling_price` double NOT NULL DEFAULT '0',
  `pur_price` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_product`
--

INSERT INTO `purchase_product` (`pur_pro_id`, `pur_id`, `pro_id`, `pro_qty`, `pro_purchase_price`, `pro_selling_price`, `pur_price`) VALUES
(1, 1, 1, 5, 1000, 1100, 5000),
(2, 2, 1, 2, 2, 2, 4),
(3, 4, 4, 10, 12, 15, 120),
(4, 4, 1, 20, 12, 15, 240),
(5, 5, 4, 30, 10, 12, 300),
(6, 6, 3, 10, 12, 15, 120),
(7, 7, 5, 3, 100, 110, 300),
(8, 7, 4, 2, 20, 25, 40),
(9, 8, 5, 12, 20, 20, 240),
(10, 9, 5, 10, 20, 25, 200),
(11, 10, 2, 4, 20, 25, 80),
(12, 11, 2, 10, 20, 25, 200),
(13, 12, 8, 15, 100, 120, 1500);

--
-- Triggers `purchase_product`
--
DELIMITER $$
CREATE TRIGGER `purchase` AFTER INSERT ON `purchase_product` FOR EACH ROW update product
set pro_qty=pro_qty+NEW.pro_qty,pro_pprice=pro_pprice+NEW.pur_price
where pro_id=NEW.pro_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `refund`
--

CREATE TABLE `refund` (
  `ref_id` int(11) NOT NULL,
  `ref_type` varchar(20) NOT NULL,
  `ref_number` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_qty` double NOT NULL,
  `pro_price` double NOT NULL,
  `pro_total_amount` double NOT NULL,
  `ref_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `ref_by` varchar(100) NOT NULL,
  `ref_note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `refund`
--

INSERT INTO `refund` (`ref_id`, `ref_type`, `ref_number`, `pro_id`, `pro_qty`, `pro_price`, `pro_total_amount`, `ref_date`, `ref_by`, `ref_note`) VALUES
(3, 'purchase', 10001, 4, 12, 125, 1500, '2019-12-30 23:14:15', 'MSD', 'out of date'),
(4, 'sale', 1009, 8, 1, 120, 120, '2020-01-14 21:33:21', 'MSD', 'hhyu');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `sal_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `sal_amount` double NOT NULL DEFAULT '0',
  `sal_payment` double DEFAULT NULL,
  `sal_due` double NOT NULL DEFAULT '0',
  `sal_advance` double NOT NULL DEFAULT '0',
  `advance_date` datetime DEFAULT NULL,
  `sal_month` varchar(50) NOT NULL,
  `sal_payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`sal_id`, `emp_id`, `sal_amount`, `sal_payment`, `sal_due`, `sal_advance`, `advance_date`, `sal_month`, `sal_payment_date`) VALUES
(1, 2, 10000, 10000, 0, 0, '0000-00-00 00:00:00', 'january', '2019-12-05'),
(2, 1, 5000, 3000, 2000, 3000, '2019-12-13 00:00:00', 'February', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `sale_id` int(11) NOT NULL,
  `sale_cus` int(11) NOT NULL,
  `sale_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_by` varchar(100) DEFAULT 'User',
  `sale_amount` double DEFAULT '0',
  `sale_discount` double DEFAULT '0',
  `sale_payment` double DEFAULT '0',
  `sale_due` double DEFAULT '0',
  `sale_type` varchar(50) DEFAULT 'Regular'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`sale_id`, `sale_cus`, `sale_date`, `sale_by`, `sale_amount`, `sale_discount`, `sale_payment`, `sale_due`, `sale_type`) VALUES
(1, 1, '2019-12-06 09:17:17', 'User', 4000, 100, 4000, 0, 'regular'),
(2, 2, '2019-12-18 20:37:06', 'user', 120, 12, 100, 8, 'Regular'),
(3, 2, '2019-12-18 20:39:45', 'user', 400, 20, 350, 30, 'Wholesale'),
(4, 2, '2019-12-18 20:52:52', 'user', 120, 12, 100, 8, 'Regular'),
(5, 1, '2019-12-19 10:32:47', 'user', 394, 10, 380, 4, 'Wholesale'),
(6, 3, '2019-12-19 10:34:11', 'user', 120, 10, 110, 0, 'Regular'),
(8, 3, '2019-12-30 23:36:10', 'user', 396, 6, 300, 90, 'Regular'),
(9, 3, '2019-12-30 23:51:40', 'user', 250, 0, 250, 0, 'Wholesale'),
(10, 4, '2019-12-30 23:57:33', 'user', 250, 0, 250, 0, 'Regular'),
(11, 2, '2019-12-31 00:09:37', 'user', 200, 0, 200, 0, 'Wholesale'),
(12, 2, '2019-12-31 00:17:03', 'user', 500, 0, 400, 100, 'Regular'),
(13, 3, '2019-12-31 11:46:18', 'user', 2000, 5, 1995, 0, 'Regular'),
(14, 1, '2020-01-01 23:59:30', 'user', 360, 10, 300, 50, 'Regular'),
(15, 4, '2020-01-02 00:03:35', 'user', 30, 0, 20, 10, 'Regular'),
(16, 3, '2020-01-02 00:17:15', 'user', 40, 0, 40, 0, 'Regular'),
(17, 3, '2020-01-02 12:10:47', 'user', 40, 2, 38, 0, 'Regular'),
(18, 5, '2020-01-14 21:00:56', 'user', 360, 10, 350, 0, 'Regular'),
(19, 5, '2020-01-14 21:25:34', 'user', 2095, 95, 2000, 0, 'Regular');

--
-- Triggers `sale`
--
DELIMITER $$
CREATE TRIGGER `balance_update_sale` AFTER INSERT ON `sale` FOR EACH ROW update balance
set balance=balance+NEW.sale_payment
where balance_id='1'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sale_due`
--

CREATE TABLE `sale_due` (
  `sale_due_id` int(11) NOT NULL,
  `sale_cus` int(11) NOT NULL,
  `sale_due` double DEFAULT '0',
  `due_payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_due`
--

INSERT INTO `sale_due` (`sale_due_id`, `sale_cus`, `sale_due`, `due_payment_date`) VALUES
(1, 1, 35, '2019-12-13'),
(2, 2, 8, '2019-12-20'),
(3, 2, 30, '2019-12-20'),
(4, 2, 8, '2019-12-20'),
(5, 1, 4, '2019-12-20'),
(6, 3, 90, '2019-12-20'),
(7, 4, 10, '2019-12-20'),
(8, 2, 100, '2019-12-20'),
(9, 3, 95, '2019-12-20'),
(10, 1, 50, '2019-12-20'),
(11, 4, 10, '2019-12-20'),
(12, 3, 8, '2019-12-20'),
(13, 5, 50, '2019-12-20');

-- --------------------------------------------------------

--
-- Table structure for table `sale_product`
--

CREATE TABLE `sale_product` (
  `sale_pro_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_qty` double DEFAULT '0',
  `sale_price` double DEFAULT '0',
  `sale_total_amount` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_product`
--

INSERT INTO `sale_product` (`sale_pro_id`, `sale_id`, `pro_id`, `pro_qty`, `sale_price`, `sale_total_amount`) VALUES
(1, 1, 1, 3, 150, 450),
(2, 2, 1, 10, 12, 120),
(3, 3, 4, 20, 20, 400),
(4, 4, 3, 10, 12, 120),
(5, 5, 4, 10, 25, 250),
(6, 5, 3, 12, 12, 144),
(7, 6, 3, 10, 12, 120),
(12, 9, 5, 10, 25, 250),
(13, 10, 5, 10, 25, 250),
(15, 10, 5, 10, 20, 200),
(16, 12, 1, 20, 25, 500),
(17, 13, 1, 20, 100, 2000),
(18, 14, 3, 2, 125, 250),
(19, 14, 2, 5, 10, 50),
(20, 14, 4, 3, 20, 60),
(21, 15, 3, 2, 15, 30),
(22, 16, 3, 2, 20, 40),
(23, 17, 3, 2, 20, 40),
(24, 18, 8, 3, 120, 360),
(25, 19, 1, 5, 125, 625),
(26, 19, 2, 5, 30, 150),
(27, 19, 3, 5, 50, 250),
(28, 19, 5, 5, 130, 650),
(29, 19, 8, 7, 60, 420);

--
-- Triggers `sale_product`
--
DELIMITER $$
CREATE TRIGGER `salepro` AFTER INSERT ON `sale_product` FOR EACH ROW update product
set pro_qty=pro_qty-NEW.pro_qty,pro_pprice=pro_pprice-NEW.pro_qty * proAvgPrice(pro_id)
where pro_id=NEW.pro_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sale_temp`
--

CREATE TABLE `sale_temp` (
  `sal_tmp` int(11) NOT NULL,
  `product_category` varchar(100) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `qty` double NOT NULL,
  `purchasing_price` double NOT NULL,
  `selling_price` double NOT NULL,
  `total_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `sup_id` int(11) NOT NULL,
  `sup_name` varchar(100) NOT NULL,
  `sup_com` int(11) NOT NULL,
  `sup_contact` varchar(100) NOT NULL,
  `sup_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`sup_id`, `sup_name`, `sup_com`, `sup_contact`, `sup_address`) VALUES
(1, 'Shakib', 1, '09876543', 'Barishal'),
(2, 'Arman', 2, '019666666', 'barisal,ban'),
(3, 'Imran', 3, '016252423352', 'Shatkhira'),
(4, 'pranta', 1, '01365281943', 'Magura'),
(5, 'Ripon', 3, '01591726384', 'Pabna'),
(6, 'Sarwar', 2, '0197654321', 'Rajshahi'),
(7, 'mehedi', 4, '897865', 'sdfgh');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_fullname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_phone` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_fullname`, `username`, `user_phone`, `user_email`, `user_password`, `user_level`) VALUES
(1, 'PKB', 'pranto', '01303018975', 'pranto@gmail.com', '123456', 0),
(3, 'MSD', 'doha', '098765423', 'doha@gmail.com', '123456', 1),
(4, 'Sams', 'samss', '09876543', 'sams@gmail.com', '123456', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`balance_id`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`bor_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `cat_name` (`cat_name`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`com_id`),
  ADD UNIQUE KEY `com_name` (`com_name`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cus_id`),
  ADD UNIQUE KEY `cus_identifier` (`cus_identifier`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`exp_id`);

--
-- Indexes for table `investment`
--
ALTER TABLE `investment`
  ADD PRIMARY KEY (`inv_id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pro_id`),
  ADD UNIQUE KEY `pro_code` (`pro_code`),
  ADD KEY `pro_cat_fk` (`pro_cat`),
  ADD KEY `pro_com_fk` (`pro_com`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`pur_id`),
  ADD KEY `pur_com_fk` (`pur_company`),
  ADD KEY `pur_sup_fk` (`pur_supplier`);

--
-- Indexes for table `purchase_discount`
--
ALTER TABLE `purchase_discount`
  ADD PRIMARY KEY (`pur_dis_id`),
  ADD KEY `dis_com_fk` (`com_id`);

--
-- Indexes for table `purchase_due`
--
ALTER TABLE `purchase_due`
  ADD PRIMARY KEY (`pur_due_id`),
  ADD KEY `pur_due_fk` (`pur_com`);

--
-- Indexes for table `purchase_product`
--
ALTER TABLE `purchase_product`
  ADD PRIMARY KEY (`pur_pro_id`),
  ADD KEY `pur_pro_fk` (`pro_id`),
  ADD KEY `pur_fk` (`pur_id`);

--
-- Indexes for table `refund`
--
ALTER TABLE `refund`
  ADD PRIMARY KEY (`ref_id`),
  ADD KEY `ref_pro_fk` (`pro_id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`sal_id`),
  ADD KEY `sal_emp_fk` (`emp_id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `sale_cus_fk` (`sale_cus`);

--
-- Indexes for table `sale_due`
--
ALTER TABLE `sale_due`
  ADD PRIMARY KEY (`sale_due_id`),
  ADD KEY `sale_due_fk` (`sale_cus`);

--
-- Indexes for table `sale_product`
--
ALTER TABLE `sale_product`
  ADD PRIMARY KEY (`sale_pro_id`),
  ADD KEY `sale_pro_fk` (`sale_id`),
  ADD KEY `pro_sale_fk` (`pro_id`);

--
-- Indexes for table `sale_temp`
--
ALTER TABLE `sale_temp`
  ADD PRIMARY KEY (`sal_tmp`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`sup_id`),
  ADD KEY `sup_com_fk` (`sup_com`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `uer_phone1` (`user_phone`),
  ADD UNIQUE KEY `user_email1` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
  MODIFY `balance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `bor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `exp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `investment`
--
ALTER TABLE `investment`
  MODIFY `inv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `pur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `purchase_discount`
--
ALTER TABLE `purchase_discount`
  MODIFY `pur_dis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchase_due`
--
ALTER TABLE `purchase_due`
  MODIFY `pur_due_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `purchase_product`
--
ALTER TABLE `purchase_product`
  MODIFY `pur_pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `refund`
--
ALTER TABLE `refund`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `sal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sale_due`
--
ALTER TABLE `sale_due`
  MODIFY `sale_due_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sale_product`
--
ALTER TABLE `sale_product`
  MODIFY `sale_pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `sale_temp`
--
ALTER TABLE `sale_temp`
  MODIFY `sal_tmp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `pro_cat_fk` FOREIGN KEY (`pro_cat`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pro_com_fk` FOREIGN KEY (`pro_com`) REFERENCES `company` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `pur_com_fk` FOREIGN KEY (`pur_company`) REFERENCES `company` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pur_sup_fk` FOREIGN KEY (`pur_supplier`) REFERENCES `supplier` (`sup_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_discount`
--
ALTER TABLE `purchase_discount`
  ADD CONSTRAINT `dis_com_fk` FOREIGN KEY (`com_id`) REFERENCES `company` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_due`
--
ALTER TABLE `purchase_due`
  ADD CONSTRAINT `pur_due_fk` FOREIGN KEY (`pur_com`) REFERENCES `company` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_product`
--
ALTER TABLE `purchase_product`
  ADD CONSTRAINT `pur_fk` FOREIGN KEY (`pur_id`) REFERENCES `purchase` (`pur_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pur_pro_fk` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `refund`
--
ALTER TABLE `refund`
  ADD CONSTRAINT `ref_pro_fk` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `sal_emp_fk` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_cus_fk` FOREIGN KEY (`sale_cus`) REFERENCES `customer` (`cus_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sale_due`
--
ALTER TABLE `sale_due`
  ADD CONSTRAINT `sale_due_fk` FOREIGN KEY (`sale_cus`) REFERENCES `customer` (`cus_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sale_product`
--
ALTER TABLE `sale_product`
  ADD CONSTRAINT `pro_sale_fk` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sale_pro_fk` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`sale_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `sup_com_fk` FOREIGN KEY (`sup_com`) REFERENCES `company` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
