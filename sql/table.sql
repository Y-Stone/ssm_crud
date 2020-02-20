/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.3-m13 : Database - ssm_crud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_crud` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm_crud`;

/*Table structure for table `tb_dept` */

DROP TABLE IF EXISTS `tb_dept`;

CREATE TABLE `tb_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tb_dept` */

insert  into `tb_dept`(`dept_id`,`dept_name`) values (1,'开发部'),(2,'测试部');

/*Table structure for table `tb_emp` */

DROP TABLE IF EXISTS `tb_emp`;

CREATE TABLE `tb_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(100) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_emp_dept` (`d_id`),
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`d_id`) REFERENCES `tb_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

/*Data for the table `tb_emp` */

insert  into `tb_emp`(`emp_id`,`emp_name`,`gender`,`email`,`d_id`) values (12,'6d27f','M','6d27f@qq.com',1),(13,'a4eaa','M','a4eaa@qq.com',1),(14,'3abe7','M','3abe7@qq.com',1),(15,'79e97','M','79e97@qq.com',1),(16,'a9d5d','M','a9d5d@qq.com',1),(17,'f76d6','M','f76d6@qq.com',1),(18,'532f6','M','532f6@qq.com',1),(19,'65db1','M','65db1@qq.com',1),(20,'7e5bd','M','7e5bd@qq.com',1),(21,'2b188','M','2b188@qq.com',1),(22,'f43c2','M','f43c2@qq.com',1),(23,'b9629','M','b9629@qq.com',1),(24,'1a866','M','1a866@qq.com',1),(25,'7cb63','F','tomcat@qq.com',2),(26,'6ebbd','M','6ebbd@qq.com',1),(27,'58965','M','58965@qq.com',1),(28,'ec641','M','ec641@qq.com',1),(29,'e3b90','M','e3b90@qq.com',1),(30,'2962e','M','2962e@qq.com',1),(32,'6ccae','M','6ccae@qq.com',1),(33,'db67c','M','db67c@qq.com',1),(34,'2e58a','M','2e58a@qq.com',1),(35,'aa9c0','M','aa9c0@qq.com',1),(36,'bdae4','M','bdae4@qq.com',1),(37,'8bc5a','M','8bc5a@qq.com',1),(38,'cb0cd','M','cb0cd@qq.com',1),(39,'e1785','M','e1785@qq.com',1),(40,'0d4c1','M','0d4c1@qq.com',1),(41,'6a8e2','M','6a8e2@qq.com',1),(42,'dcebf','M','dcebf@qq.com',1),(43,'366cc','M','366cc@qq.com',1),(44,'87b8e','M','87b8e@qq.com',1),(45,'2b8d4','M','2b8d4@qq.com',1),(46,'f231b','M','f231b@qq.com',1),(47,'91004','M','91004@qq.com',1),(48,'fceb6','M','fceb6@qq.com',1),(49,'6f52a','M','6f52a@qq.com',1),(50,'fb67b','M','fb67b@qq.com',1),(51,'5338b','M','5338b@qq.com',1),(52,'55b08','M','55b08@qq.com',1),(53,'db05b','M','db05b@qq.com',1),(54,'3de3d','M','3de3d@qq.com',1),(55,'0c8c0','M','0c8c0@qq.com',1),(56,'aa884','M','aa884@qq.com',1),(57,'8aede','M','8aede@qq.com',1),(58,'f4f51','M','f4f51@qq.com',1),(59,'3d9bf','M','3d9bf@qq.com',1),(60,'99aa0','M','99aa0@qq.com',1),(61,'d9768','M','d9768@qq.com',1),(62,'337a2','M','337a2@qq.com',1),(63,'70706','M','70706@qq.com',1),(64,'8f488','M','8f488@qq.com',1),(65,'d7890','M','d7890@qq.com',1),(66,'2dd36','M','2dd36@qq.com',1),(67,'6c813','M','6c813@qq.com',1),(68,'6236b','M','6236b@qq.com',1),(69,'039ac','M','039ac@qq.com',1),(70,'f61d3','M','f61d3@qq.com',1),(71,'b96dc','M','b96dc@qq.com',1),(72,'024b6','M','024b6@qq.com',1),(73,'035d5','M','035d5@qq.com',1),(74,'0baf8','M','0baf8@qq.com',1),(75,'204f0','M','204f0@qq.com',1),(76,'86fe8','M','86fe8@qq.com',1),(77,'45716','M','45716@qq.com',1),(78,'7b483','M','7b483@qq.com',1),(79,'10ff2','M','10ff2@qq.com',1),(80,'93f91','M','93f91@qq.com',1),(81,'7a7f2','M','7a7f2@qq.com',1),(82,'7a8ac','M','7a8ac@qq.com',1),(83,'cbe7b','M','cbe7b@qq.com',1),(84,'1a515','M','1a515@qq.com',1),(85,'e7c49','M','e7c49@qq.com',1),(86,'918aa','M','918aa@qq.com',1),(87,'1c579','M','1c579@qq.com',1),(88,'a0ca8','M','a0ca8@qq.com',1),(89,'4ef23','M','4ef23@qq.com',1),(90,'e7eef','M','e7eef@qq.com',1),(91,'88c01','M','88c01@qq.com',1),(92,'58880','M','58880@qq.com',1),(93,'f2f58','M','f2f58@qq.com',1),(94,'d7b47','M','d7b47@qq.com',1),(95,'e1835','M','e1835@qq.com',1),(96,'0522e','M','0522e@qq.com',1),(97,'05d48','M','05d48@qq.com',1),(98,'f48ab','M','f48ab@qq.com',1),(99,'25d92','M','25d92@qq.com',1),(100,'90d9a','M','90d9a@qq.com',1),(101,'0f0b8','M','0f0b8@qq.com',1),(102,'tomcat','M','tomcat21@qq.com',1),(103,'tomcat2','M','tomcat2@qq.con',2),(104,'aaaaaa','M','452504970@qq.com',1),(105,'haha2','M','452504970@qq.com',1),(106,'111111','M','452504970@qq.com',1),(107,'jack11','M','452504970@qq.com',1),(108,'jack11','M','452504970@qq.com',1),(109,'jack11','M','452504970@qq.com',1),(110,'jack11','M','452504970@qq.com',1),(111,'jack11','M','452504970@qq.com',1),(112,'jack2a','M','2i21@qq.com',1),(113,'jack2a','M','2i21@qq.com',1),(114,'jack2k','M','452504970@qq.com',1),(115,'dqwdwq','M','dqwdwq@qq.com',1),(116,'aaa231','M','123@qq.com',1),(117,'测试','F','22223@qq.com',1);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`username`,`password`) values (1,'admin','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
