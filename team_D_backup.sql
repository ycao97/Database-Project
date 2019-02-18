-- MySQL Script generated by MySQL Workbench
-- Wed Dec  5 21:05:24 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`developer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`developer` (
  `developer_id` INT(11) NOT NULL,
  `developer_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`developer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sales` (
  `sales_id` INT(11) NOT NULL,
  `na_sales` DECIMAL(5,2) NULL DEFAULT NULL,
  `eu_sales` DECIMAL(5,2) NULL DEFAULT NULL,
  `jp_sales` DECIMAL(5,2) NULL DEFAULT NULL,
  `other_sales` DECIMAL(5,2) NULL DEFAULT NULL,
  `global_sales` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`sales_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`scores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`scores` (
  `scores_id` INT(11) NOT NULL,
  `critic_score` DECIMAL(5,2) NULL DEFAULT NULL,
  `critic_count` INT(11) NULL DEFAULT NULL,
  `user_score` DECIMAL(5,2) NULL DEFAULT NULL,
  `user_count` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`scores_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genre` (
  `genre_id` INT(11) NOT NULL,
  `genre_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`platform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`platform` (
  `platform_id` INT(11) NOT NULL,
  `platform_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`platform_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`publishers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`publishers` (
  `publisher_id` INT(11) NOT NULL,
  `publisher_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`publisher_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`ratings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ratings` (
  `rating_id` INT(11) NOT NULL,
  `rating_name` VARCHAR(45) NULL DEFAULT NULL,
  `rating_age` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`rating_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`games` (
  `games_id` INT(11) NOT NULL,
  `game_name` VARCHAR(45) NULL DEFAULT NULL,
  `platform_id` INT(11) NOT NULL,
  `genre_id` INT(11) NOT NULL,
  `publisher_id` INT(11) NOT NULL,
  `rating_id` INT(11) NOT NULL,
  `scores_id` INT(11) NOT NULL,
  `sales_id` INT(11) NOT NULL,
  PRIMARY KEY (`games_id`),
  INDEX `fk_games_Platform_idx` (`platform_id` ASC) VISIBLE,
  INDEX `fk_games_Genre1_idx` (`genre_id` ASC) VISIBLE,
  INDEX `fk_games_Publishers1_idx` (`publisher_id` ASC) VISIBLE,
  INDEX `fk_games_Ratings1_idx` (`rating_id` ASC) VISIBLE,
  INDEX `fk_Games_Scores1_idx` (`scores_id` ASC) VISIBLE,
  INDEX `fk_Games_Sales1_idx` (`sales_id` ASC) VISIBLE,
  CONSTRAINT `fk_Games_Sales1`
    FOREIGN KEY (`sales_id`)
    REFERENCES `mydb`.`sales` (`sales_id`),
  CONSTRAINT `fk_Games_Scores1`
    FOREIGN KEY (`scores_id`)
    REFERENCES `mydb`.`scores` (`scores_id`),
  CONSTRAINT `fk_games_Genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `mydb`.`genre` (`genre_id`),
  CONSTRAINT `fk_games_Platform`
    FOREIGN KEY (`platform_id`)
    REFERENCES `mydb`.`platform` (`platform_id`),
  CONSTRAINT `fk_games_Publishers1`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `mydb`.`publishers` (`publisher_id`),
  CONSTRAINT `fk_games_Ratings1`
    FOREIGN KEY (`rating_id`)
    REFERENCES `mydb`.`ratings` (`rating_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`publishers_has_developer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`publishers_has_developer` (
  `publisher_id` INT(11) NOT NULL,
  `developer_id` INT(11) NOT NULL,
  INDEX `fk_Publishers_has_Developer_Developer1_idx` (`developer_id` ASC) VISIBLE,
  INDEX `fk_Publishers_has_Developer_Publishers1_idx` (`publisher_id` ASC) VISIBLE,
  CONSTRAINT `fk_Publishers_has_Developer_Developer1`
    FOREIGN KEY (`developer_id`)
    REFERENCES `mydb`.`developer` (`developer_id`),
  CONSTRAINT `fk_Publishers_has_Developer_Publishers1`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `mydb`.`publishers` (`publisher_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`developer_publisher_sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`developer_publisher_sales` (`Publisher` INT, `Game` INT, `Number of Developers` INT, `Global Units Sold` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`handheld_platform_game_count`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`handheld_platform_game_count` (`Total Number of Games for Handheld Platforms` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`platform_data_diff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`platform_data_diff` (`Platform` INT, `Number of Platforms in Data Set` INT, `Total Sales` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`top_global_game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`top_global_game` (`Publisher` INT, `Game` INT, `Global Sales` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`top_regional_sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`top_regional_sales` (`Regional Sales` INT, `sales_id` INT, `game_name` INT, `genre_name` INT, `eu_sales` INT, `na_sales` INT);

-- -----------------------------------------------------
-- View `mydb`.`developer_publisher_sales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`developer_publisher_sales`;
USE `mydb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mydb`.`developer_publisher_sales` AS select `mydb`.`publishers`.`publisher_name` AS `Publisher`,`mydb`.`games`.`game_name` AS `Game`,count(`mydb`.`publishers_has_developer`.`developer_id`) AS `Number of Developers`,`mydb`.`sales`.`global_sales` AS `Global Units Sold` from ((((`mydb`.`publishers` join `mydb`.`games` on((`mydb`.`publishers`.`publisher_id` = `mydb`.`games`.`publisher_id`))) join `mydb`.`publishers_has_developer` on((`mydb`.`publishers`.`publisher_id` = `mydb`.`publishers_has_developer`.`publisher_id`))) join `mydb`.`developer` on((`mydb`.`publishers_has_developer`.`developer_id` = `mydb`.`developer`.`developer_id`))) join `mydb`.`sales` on((`mydb`.`games`.`sales_id` = `mydb`.`sales`.`sales_id`))) where (`mydb`.`sales`.`global_sales` > (select avg(`mydb`.`sales`.`global_sales`) from `mydb`.`sales`)) group by `mydb`.`games`.`game_name`;

-- -----------------------------------------------------
-- View `mydb`.`handheld_platform_game_count`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`handheld_platform_game_count`;
USE `mydb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mydb`.`handheld_platform_game_count` AS select count(`mydb`.`games`.`games_id`) AS `Total Number of Games for Handheld Platforms` from (`mydb`.`games` join `mydb`.`platform` on((`mydb`.`games`.`platform_id` = `mydb`.`platform`.`platform_id`))) where ((`mydb`.`platform`.`platform_name` = '3DS') or (`mydb`.`platform`.`platform_name` = 'DS') or (`mydb`.`platform`.`platform_name` = 'PSP') or (`mydb`.`platform`.`platform_name` = 'PSV'));

-- -----------------------------------------------------
-- View `mydb`.`platform_data_diff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`platform_data_diff`;
USE `mydb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mydb`.`platform_data_diff` AS select 'Sony' AS `Platform`,count(`mydb`.`platform`.`platform_name`) AS `Number of Platforms in Data Set`,sum(`mydb`.`sales`.`global_sales`) AS `Total Sales` from ((`mydb`.`platform` join `mydb`.`games` on((`mydb`.`platform`.`platform_id` = `mydb`.`games`.`platform_id`))) join `mydb`.`sales` on((`mydb`.`games`.`sales_id` = `mydb`.`sales`.`sales_id`))) where `mydb`.`platform`.`platform_id` in (select `mydb`.`platform`.`platform_id` from `mydb`.`platform` where ((`mydb`.`platform`.`platform_name` = 'PS') or (`mydb`.`platform`.`platform_name` = 'PS2') or (`mydb`.`platform`.`platform_name` = 'PS3') or (`mydb`.`platform`.`platform_name` = 'PS4') or (`mydb`.`platform`.`platform_name` = 'PSP') or (`mydb`.`platform`.`platform_name` = 'PSV'))) union select 'Microsoft' AS `Platform`,count(`mydb`.`platform`.`platform_name`) AS `Number of Platforms in Data Set`,sum(`mydb`.`sales`.`global_sales`) AS `SUM(global_sales)` from ((`mydb`.`platform` join `mydb`.`games` on((`mydb`.`platform`.`platform_id` = `mydb`.`games`.`platform_id`))) join `mydb`.`sales` on((`mydb`.`games`.`sales_id` = `mydb`.`sales`.`sales_id`))) where `mydb`.`platform`.`platform_id` in (select `mydb`.`platform`.`platform_id` from `mydb`.`platform` where ((`mydb`.`platform`.`platform_name` = 'XOne') or (`mydb`.`platform`.`platform_name` = 'X360') or (`mydb`.`platform`.`platform_name` = 'X360')));

-- -----------------------------------------------------
-- View `mydb`.`top_global_game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`top_global_game`;
USE `mydb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mydb`.`top_global_game` AS select `mydb`.`publishers`.`publisher_name` AS `Publisher`,`mydb`.`games`.`game_name` AS `Game`,`mydb`.`sales`.`global_sales` AS `Global Sales` from ((`mydb`.`publishers` join `mydb`.`games` on((`mydb`.`publishers`.`publisher_id` = `mydb`.`games`.`publisher_id`))) join `mydb`.`sales` on((`mydb`.`games`.`sales_id` = `mydb`.`sales`.`sales_id`))) order by `mydb`.`sales`.`global_sales` desc limit 1;

-- -----------------------------------------------------
-- View `mydb`.`top_regional_sales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`top_regional_sales`;
USE `mydb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mydb`.`top_regional_sales` AS select 'North American Top Sales:' AS `Regional Sales`,`mydb`.`games`.`sales_id` AS `sales_id`,`mydb`.`games`.`game_name` AS `game_name`,`mydb`.`genre`.`genre_name` AS `genre_name`,`mydb`.`sales`.`eu_sales` AS `eu_sales`,`mydb`.`sales`.`na_sales` AS `na_sales` from ((`mydb`.`games` join `mydb`.`genre` on((`mydb`.`games`.`genre_id` = `mydb`.`genre`.`genre_id`))) join `mydb`.`sales` on((`mydb`.`games`.`sales_id` = `mydb`.`sales`.`sales_id`))) group by `mydb`.`sales`.`eu_sales` desc having (`mydb`.`sales`.`na_sales` > 6) union select 'European Top Sales:' AS `Regional Sales`,`mydb`.`games`.`sales_id` AS `sales_id`,`mydb`.`games`.`game_name` AS `game_name`,`mydb`.`genre`.`genre_name` AS `genre_name`,`mydb`.`sales`.`eu_sales` AS `eu_sales`,`mydb`.`sales`.`na_sales` AS `na_sales` from ((`mydb`.`games` join `mydb`.`genre` on((`mydb`.`games`.`genre_id` = `mydb`.`genre`.`genre_id`))) join `mydb`.`sales` on((`mydb`.`games`.`sales_id` = `mydb`.`sales`.`sales_id`))) group by `mydb`.`sales`.`na_sales` desc having (`mydb`.`sales`.`eu_sales` > 5);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `developer`
--

LOCK TABLES `developer` WRITE;
/*!40000 ALTER TABLE `developer` DISABLE KEYS */;
INSERT INTO `developer` VALUES (1,'Rob'),(2,'Jon'),(3,'Micheal'),(4,'Matt'),(5,'Maria'),(6,'Alexis'),(7,'Dwight '),(8,'Lebron '),(9,'Irochi'),(10,'Emily'),(11,'Tom '),(12,'Jake'),(13,'Donald '),(14,'Yangyang'),(15,'Satoshi');
/*!40000 ALTER TABLE `developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'Wii Sports',9,9,1,1,1,1),(2,'FIFA 17',6,9,2,1,2,2),(3,'Battlefield 1',6,8,2,4,3,3),(4,'Tekken 3',4,3,3,3,4,4),(5,'Grand Theft Auto V',5,1,4,4,5,5),(6,'The Elder Scrolls V: Skyrim',10,7,5,4,6,6),(7,'Red Dead Redemption',5,1,4,4,7,7),(8,'Call of Duty: Modern Warfare 2',5,8,6,4,8,8),(9,'NBA 2K17',12,9,4,1,9,9),(10,'NCAA March Madness 2005',13,9,7,1,10,10),(11,'007 Racing',4,6,7,3,11,11),(12,'Tactics Ogre: Let Us Cling Together',7,7,8,3,12,12),(13,'Conflict: Vietnam',13,8,9,4,13,13),(14,'Dragon\'s Crown',5,7,10,3,14,14),(15,'Super Smash Bros. Brawl',9,3,1,3,15,15),(16,'LEGO Star Wars II: The Original Trilogy',11,1,11,2,16,16),(17,'Viking: Battle for Asgard',10,1,12,4,17,17),(18,'Dynasty Warriors 6 Empires',10,1,13,3,18,18),(19,'Dragon Quest Heroes: Rocket Slime',2,1,8,1,19,19),(21,'Silent Hill 2: Restless Dreams',11,1,15,4,21,21),(22,'The Testament of Sherlock Holmes',5,2,16,4,22,22),(23,'NES Remix',9,1,1,1,23,23),(24,'Skylanders: Trap Team',1,1,6,2,24,24),(25,'Shrek SuperSlam',3,1,6,2,25,25),(26,'DJ Hero',5,4,6,3,26,26),(27,'Assassin\'s Creed III',5,1,17,4,27,27),(28,'Stormrise',5,10,18,4,28,28),(29,'Psi-Ops: The Mindgate Conspiracy',11,8,19,4,29,29),(30,'X-Men: The Official Game',10,1,6,3,30,30),(31,'SWAT: Global Strike Team',11,8,20,4,31,31),(32,'Fallout 3',10,7,5,4,32,32),(33,'Cave Story 3D',1,5,10,2,33,33),(34,'Valhalla Knights 3',8,7,21,3,34,34),(35,'Madden NFL 17',12,9,2,1,35,35),(36,'Mushroom Men: The Spore Wars',9,1,22,2,36,36),(37,'Saint Seiya: Soldiers\' Soul',6,3,23,3,37,37),(38,'Driver 2',4,1,24,3,38,38),(39,'Tony Hawk\'s Pro Skater 3',13,9,6,3,39,39),(40,'Fallout 4',12,7,5,4,40,40);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Action'),(2,'Adventure'),(3,'Fighting'),(4,'Misc'),(5,'Platform'),(6,'Racing'),(7,'Role-Playing'),(8,'Shooter'),(9,'Sports'),(10,'Strategy');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `platform`
--

LOCK TABLES `platform` WRITE;
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
INSERT INTO `platform` VALUES (1,'3DS'),(2,'DS'),(3,'GC'),(4,'PS'),(5,'PS3'),(6,'PS4'),(7,'PSP'),(8,'PSV'),(9,'Wii'),(10,'X360'),(11,'XB'),(12,'XOne'),(13,'PS2');
/*!40000 ALTER TABLE `platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Nintendo'),(2,'Electronic Arts'),(3,'Sony Computer Entertainment'),(4,'Take-Two Interactive'),(5,'Bethesda Softworks'),(6,'Activision'),(7,'Electronic Arts'),(8,'Square Enix'),(9,'SCi'),(10,'Nippon Ichi Software'),(11,'LucasArts'),(12,'Sega'),(13,'Tecmo Koei'),(14,'THQ'),(15,'Konami Digital Entertainment'),(16,'Focus Home Interactive'),(17,'Ubisoft'),(18,'Sega'),(19,'Midway Games'),(20,'Vivendi Games'),(21,'Xseed Games'),(22,'SouthPeak Games'),(23,'Namco Bandai Games'),(24,'Atari');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `publishers_has_developer`
--

LOCK TABLES `publishers_has_developer` WRITE;
/*!40000 ALTER TABLE `publishers_has_developer` DISABLE KEYS */;
INSERT INTO `publishers_has_developer` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,1),(17,2),(18,3),(19,4),(20,5),(21,6),(22,7),(23,8),(24,9),(24,9),(1,10),(2,11),(3,12),(4,13),(5,14),(6,15),(7,1),(8,2),(9,1),(10,2);
/*!40000 ALTER TABLE `publishers_has_developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,'E',6),(2,'E10+',10),(3,'T',13),(4,'M',17);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,41.36,28.96,3.77,8.45,82.53),(2,3.79,5.75,0.08,1.11,7.59),(3,2.08,2.15,0.21,0.61,4.08),(4,3.27,2.22,1.40,0.29,7.16),(5,7.02,9.09,0.98,3.96,21.04),(6,4.34,2.79,0.10,0.85,8.79),(7,3.23,2.53,0.17,0.99,6.49),(8,5.28,3.64,0.38,1.60,10.60),(9,0.51,0.06,0.00,0.11,1.02),(10,0.44,0.02,0.00,0.07,0.53),(11,0.30,0.20,0.00,0.03,0.53),(12,0.15,0.07,0.27,0.05,0.53),(13,0.26,0.20,0.00,0.07,0.53),(14,0.25,0.07,0.17,0.05,0.53),(15,6.62,2.55,2.66,1.01,12.84),(16,0.33,0.10,0.00,0.02,0.44),(17,0.16,0.23,0.00,0.05,0.44),(18,0.16,0.01,0.04,0.02,0.24),(19,0.13,0.00,0.31,0.01,0.44),(20,0.22,0.06,0.00,0.01,0.28),(21,0.21,0.06,0.00,0.01,0.28),(22,0.05,0.14,0.00,0.04,0.24),(23,0.17,0.00,0.08,0.02,0.28),(24,0.16,0.10,0.00,0.02,0.28),(25,0.17,0.04,0.00,0.01,0.22),(26,0.45,0.34,0.00,0.14,0.90),(27,2.64,2.52,0.16,1.12,6.45),(28,0.13,0.02,0.00,0.02,0.17),(29,0.13,0.04,0.00,0.01,0.17),(30,0.16,0.00,0.00,0.01,0.17),(31,0.13,0.04,0.00,0.01,0.17),(32,3.40,0.99,0.09,0.45,4.93),(33,0.09,0.03,0.01,0.01,0.14),(34,0.04,0.01,0.12,0.01,0.18),(35,0.63,0.02,0.00,0.13,1.23),(36,0.16,0.01,0.00,0.01,0.18),(37,0.00,0.12,0.04,0.02,0.18),(38,2.36,2.10,0.02,0.25,4.73),(39,2.66,1.29,0.01,0.46,4.41),(40,2.51,1.32,0.01,0.38,4.22);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
INSERT INTO `scores` VALUES (1,76.00,51,8.00,322),(2,85.00,41,5.00,398),(3,88.00,31,8.40,809),(4,96.00,15,9.10,367),(5,97.00,50,8.20,3994),(6,96.00,89,8.40,3589),(7,95.00,73,8.80,2456),(8,94.00,67,6.30,2073),(9,90.00,17,6.20,91),(10,78.00,19,8.30,13),(11,51.00,16,4.60,14),(12,87.00,49,8.80,102),(13,58.00,24,8.10,21),(14,82.00,62,8.30,288),(15,93.00,81,8.90,1662),(16,85.00,27,8.60,15),(17,68.00,67,8.00,88),(18,59.00,24,7.30,28),(19,83.00,41,7.60,45),(20,65.00,8,8.20,36),(21,84.00,23,8.30,39),(22,65.00,16,7.40,34),(23,71.00,34,7.10,133),(24,72.00,49,3.40,5),(25,70.00,11,7.80,6),(26,86.00,53,7.80,49),(27,85.00,41,6.90,1307),(28,51.00,28,5.30,20),(29,84.00,55,7.90,18),(30,52.00,57,6.10,20),(31,69.00,22,6.30,7),(32,93.00,84,8.50,1655),(33,82.00,29,7.70,72),(34,48.00,19,6.80,56),(35,83.00,30,5.90,39),(36,72.00,37,8.70,33),(37,59.00,30,7.80,45),(38,62.00,14,7.70,92),(39,97.00,34,7.50,298),(40,88.00,39,6.20,1749);
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-05 21:02:24

drop view if exists top_regional_sales;
drop view if exists top_global_game;
drop view if exists platform_data_diff;
drop view if exists handheld_platform_count;
drop view if exists developer_publisher_sales;

CREATE OR REPLACE VIEW top_regional_sales AS
	SELECT "North American Sales: " AS "Regional Sales", sales_id,
	game_name, genre_name, eu_sales, na_sales
	FROM games JOIN genre USING (genre_id)
		JOIN sales USING (sales_id)
	HAVING na_sales > 6
	UNION
	SELECT "European Sales: " AS "Regional Sales",sales_id,
	game_name, genre_name, eu_sales, na_sales
	FROM games JOIN genre USING (genre_id)
		JOIN sales USING (sales_id)
	HAVING eu_sales > 5;

CREATE OR REPLACE VIEW top_global_game AS
	SELECT publisher_name AS 'Publisher', game_name AS 'Game',
		global_sales AS 'Global Sales'
	FROM publishers JOIN games USING (publisher_id)
		JOIN sales USING (sales_id)
	ORDER BY global_sales DESC
	LIMIT 1;

CREATE OR REPLACE VIEW platform_data_diff AS
	SELECT 'Sony' AS 'Platform', COUNT(platform_name) AS 'Number of Platforms in Data Set',
	SUM(global_sales) AS 'Total Sales'
	FROM platform JOIN games USING (platform_id) JOIN sales USING (sales_id)
	WHERE platform_id IN
		(SELECT platform_id
		FROM platform
		WHERE platform_name = 'PS'
		OR platform_name = 'PS2'
		OR platform_name = 'PS3'
		OR platform_name = 'PS4'
		OR platform_name = 'PSP'
		OR platform_name = 'PSV')
	UNION
	SELECT 'Microsoft' AS 'Platform' , COUNT(platform_name) AS 'Number of Platforms in Data Set', SUM(global_sales)
	FROM platform JOIN games USING (platform_id) JOIN sales USING (sales_id)
	WHERE platform_id IN
		(SELECT platform_id
		FROM platform
		WHERE platform_name = 'XOne'
		OR platform_name = 'X360'
		OR platform_name = 'X360');

CREATE OR REPLACE VIEW handheld_platform_game_count AS
	SELECT COUNT(games_id) AS 'Total Number of Games for Handheld Platforms'
	FROM games JOIN platform USING (platform_id)
	WHERE platform_name = '3DS' OR platform_name = 'DS' OR platform_name = 'PSP'
		OR platform_name = 'PSV';

CREATE or REPLACE VIEW developer_publisher_sales AS
SELECT publisher_name AS 'Publisher', game_name AS 'Game',
	 COUNT(developer_id) as 'Developer Number', global_sales AS 'Global Units Sold'
FROM publishers JOIN games USING (publisher_id) JOIN publishers_has_developer USING (publisher_id)
    JOIN developer USING (developer_id) JOIN sales USING (sales_id)
WHERE global_sales >
    (SELECT AVG(global_sales)
    FROM sales)
GROUP BY game_name;
