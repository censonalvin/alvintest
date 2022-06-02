/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 10.2.6-MariaDB-log : Database - customer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`customer` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `customer`;

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `salesID` varchar(225) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(225) DEFAULT NULL,
  `lastName` varchar(225) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `postal` bigint(20) DEFAULT NULL,
  `country` varchar(225) DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT current_timestamp(),
  `accountType` varchar(225) DEFAULT NULL,
  `miles` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `customers` */

insert  into `customers`(`salesID`,`id`,`firstName`,`lastName`,`address`,`postal`,`country`,`creationDate`,`accountType`,`miles`) values 
('kenneth vargas2022-06-02 07:39:59',4,'kenneth two','vargas two','valenzuela',1234,'ph','2022-06-02 08:11:01',NULL,NULL),
('5kenneth vargas2022-06-02 08:11:01',5,'kenneth three','vargas three','valenzuela',1234,'ph','2022-06-02 08:11:01',NULL,NULL),
('6naruto vargas2022-06-02 08:11:19',6,'naruto','vargas','valenzuela',1234,'ph','2022-06-02 08:11:19',NULL,NULL),
('7 2022-06-02 08:43:33',7,NULL,NULL,NULL,NULL,NULL,'2022-06-02 08:43:33',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
