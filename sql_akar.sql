/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.4.28-MariaDB : Database - sql_kuadrat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sql_kuadrat` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `sql_kuadrat`;

/*Table structure for table `akar_kuadrat` */

DROP TABLE IF EXISTS `akar_kuadrat`;

CREATE TABLE `akar_kuadrat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nilai_input` float DEFAULT NULL,
  `akar_kuadrat` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `akar_kuadrat` */

insert  into `akar_kuadrat`(`id`,`nilai_input`,`akar_kuadrat`) values 
(1,25,5),
(2,1.22396,1.10633),
(3,1.23457,1.11111),
(4,20.5,4.52769),
(5,50,7.07107),
(6,16,4),
(7,0,0),
(8,1.24676,1.11658),
(9,25,5),
(10,25.5,5.04975),
(11,145,12.0416),
(12,12,3.4641);

/* Procedure structure for procedure `hitung_akar_kuadrat` */

/*!50003 DROP PROCEDURE IF EXISTS  `hitung_akar_kuadrat` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `hitung_akar_kuadrat`(IN nilai_input float)
BEGIN
    DECLARE akar float;
    DECLARE iterasi INT;
    
    SET akar = nilai_input / 2;
    SET iterasi = 0;
    
    WHILE ABS(nilai_input - (akar * akar)) > 0.0001 DO
        SET akar = (akar + (nilai_input / akar)) / 2;
        SET iterasi = iterasi + 1;
    END WHILE;
    
    INSERT INTO akar_kuadrat (nilai_input, akar_kuadrat) VALUES (nilai_input, akar);
    
    SELECT akar AS hasil, iterasi AS jumlah_iterasi;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
