/*
SQLyog Ultimate v12.09 (32 bit)
MySQL - 5.5.30 : Database - socialnetwork
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`socialnetwork` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `socialnetwork`;

/*Table structure for table `blockchain` */

DROP TABLE IF EXISTS `blockchain`;

CREATE TABLE `blockchain` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `index` int(11) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `data` blob,
  `previousHash` varchar(64) DEFAULT NULL,
  `hash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `blockchain` */

/*Table structure for table `friendlist` */

DROP TABLE IF EXISTS `friendlist`;

CREATE TABLE `friendlist` (
  `USERNAME` varchar(20) DEFAULT NULL,
  `FRIEND` varchar(20) DEFAULT NULL,
  `REQ_STATUS` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `friendlist` */

/*Table structure for table `image_category` */

DROP TABLE IF EXISTS `image_category`;

CREATE TABLE `image_category` (
  `CATEGORY` varchar(100) DEFAULT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  UNIQUE KEY `IMAGE_CATEGORY_PK` (`CATEGORY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `image_category` */

/*Table structure for table `image_likes` */

DROP TABLE IF EXISTS `image_likes`;

CREATE TABLE `image_likes` (
  `IMAGE_ID` decimal(5,0) DEFAULT NULL,
  `LIKE_BY` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `image_likes` */

/*Table structure for table `image_rating` */

DROP TABLE IF EXISTS `image_rating`;

CREATE TABLE `image_rating` (
  `IMAGE_ID` decimal(5,0) DEFAULT NULL,
  `RATE_BY` varchar(50) DEFAULT NULL,
  `RATING` decimal(1,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `image_rating` */

/*Table structure for table `image_type` */

DROP TABLE IF EXISTS `image_type`;

CREATE TABLE `image_type` (
  `TYPE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `image_type` */

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `USERNAME` varchar(100) DEFAULT NULL,
  `MESSAGE` varchar(1000) DEFAULT NULL,
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `notifications` */

/*Table structure for table `uploaded_image` */

DROP TABLE IF EXISTS `uploaded_image`;

CREATE TABLE `uploaded_image` (
  `IMAGE_NAME` varchar(100) DEFAULT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `CATEGORY` varchar(100) DEFAULT NULL,
  `IMG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PATH` longblob,
  KEY `IMG_ID` (`IMG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `uploaded_image` */

/*Table structure for table `user_details` */

DROP TABLE IF EXISTS `user_details`;

CREATE TABLE `user_details` (
  `USERNAME` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `MOBILE` decimal(12,0) DEFAULT NULL,
  `GENDER` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_details` */

insert  into `user_details`(`USERNAME`,`NAME`,`EMAIL`,`DOB`,`MOBILE`,`GENDER`) values ('sujatha','sujatha','sujatha@gmail.com','2000-02-05','8866554411','Female');

/*Table structure for table `user_requests` */

DROP TABLE IF EXISTS `user_requests`;

CREATE TABLE `user_requests` (
  `USERNAME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `P_KEY` varchar(50) DEFAULT NULL,
  `STATUS` decimal(1,0) DEFAULT NULL,
  UNIQUE KEY `USER_REQUESTS_PK` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_requests` */

insert  into `user_requests`(`USERNAME`,`EMAIL`,`P_KEY`,`STATUS`) values ('admin','admin@gmail.com','SNfHXEMF7MkmtK4CdA==','1'),('sujatha','sujatha@gmail.com','SNfHXEMF7MkmtK4CdA==','1');

/*Table structure for table `userlist` */

DROP TABLE IF EXISTS `userlist`;

CREATE TABLE `userlist` (
  `USERNAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `ROLE` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  UNIQUE KEY `USERLIST_PK` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userlist` */

insert  into `userlist`(`USERNAME`,`PASSWORD`,`ROLE`,`EMAIL`) values ('admin','crg+SNfHXEMF7MkmtK4CdA==\r\n','admin','admin@gmail.com'),('sujatha','DoDLlGbuwCMkLvvpeyIB0g==\r\n','user','sujatha@gmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
