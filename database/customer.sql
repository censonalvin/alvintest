`users_authentication`/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.5-10.5.15-MariaDB-cll-lve : Database - customer
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
  `salesID` VARCHAR(225) DEFAULT NULL,
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(225) DEFAULT NULL,
  `lastName` VARCHAR(225) DEFAULT NULL,
  `address` VARCHAR(225) DEFAULT NULL,
  `postal` BIGINT(20) DEFAULT NULL,
  `country` VARCHAR(225) DEFAULT NULL,
  `creationDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `accountType` VARCHAR(225) DEFAULT NULL,
  `miles` BIGINT(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `users_authentication` */

DROP TABLE IF EXISTS `users_authentication`;

CREATE TABLE `users_authentication` (
  `id` INT(11) NOT NULL,
  `users_id` INT(11) NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `expired_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `users_authentication` */

insert  into `users_authentication`(`id`,`users_id`,`token`,`expired_at`,`created_at`,`updated_at`) values (1,1,'$1$6fjNSBRR$7lx.mxo/q1LbNO7f5.7w8.','2034-06-13 23:28:00','2015-12-27 11:28:00','2015-12-27 11:28:00');
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
