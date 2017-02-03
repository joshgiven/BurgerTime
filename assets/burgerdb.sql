-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema burgerdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `burgerdb` ;

-- -----------------------------------------------------
-- Schema burgerdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `burgerdb` DEFAULT CHARACTER SET utf8 ;
USE `burgerdb` ;

-- -----------------------------------------------------
-- Table `burger`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `burger` ;

CREATE TABLE IF NOT EXISTS `burger` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
