SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema burgerdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `burgerdb` ;
CREATE SCHEMA IF NOT EXISTS `burgerdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `burgerdb` ;

-- -----------------------------------------------------
-- Table `burger`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `burger` ;

CREATE TABLE IF NOT EXISTS `burger` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ingredient_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ingredient_type` ;

CREATE TABLE IF NOT EXISTS `ingredient_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ingredient` ;

CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ingredient_type_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ingredient_ingredient_type_idx` (`ingredient_type_id` ASC),
  CONSTRAINT `fk_ingredient_ingredient_type`
    FOREIGN KEY (`ingredient_type_id`)
    REFERENCES `ingredient_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `burger_ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `burger_ingredient` ;

CREATE TABLE IF NOT EXISTS `burger_ingredient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `burger_id` INT NOT NULL,
  `ingredient_id` INT NOT NULL,
  `position` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_burger_ingredient_burger_idx` (`burger_id` ASC),
  INDEX `fk_burger_ingredient_ingredient_idx` (`ingredient_id` ASC),
  CONSTRAINT `fk_burger_ingredient_burger`
    FOREIGN KEY (`burger_id`)
    REFERENCES `burger` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_burger_ingredient_ingredient`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO burgerchef;
 DROP USER burgerchef;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'burgerchef' IDENTIFIED BY 'burgerchef';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'burgerchef';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `burger`
-- -----------------------------------------------------
START TRANSACTION;
USE `burgerdb`;
INSERT INTO `burger` (`id`, `name`) VALUES (1, 'Cheeseburger #1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ingredient_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `burgerdb`;
INSERT INTO `ingredient_type` (`id`, `name`, `description`) VALUES (1, 'bun', 'Outer hull');
INSERT INTO `ingredient_type` (`id`, `name`, `description`) VALUES (2, 'protein', 'The \"meat\"');
INSERT INTO `ingredient_type` (`id`, `name`, `description`) VALUES (3, 'sauce', 'Extra flavor');
INSERT INTO `ingredient_type` (`id`, `name`, `description`) VALUES (4, 'cheese', 'Dairy delight');
INSERT INTO `ingredient_type` (`id`, `name`, `description`) VALUES (5, 'topping', 'Traditional add-on');
INSERT INTO `ingredient_type` (`id`, `name`, `description`) VALUES (6, 'special', 'Miscellaneous');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `burgerdb`;
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (1, 1, 'Sesame Seed Bun');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (2, 1, 'Lettuce Wrap');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (3, 1, 'Glazed Donut');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (4, 1, 'Texas Toast');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (5, 2, 'All-Beef Patty');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (6, 2, 'Chicken Breast');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (7, 2, 'Portobello');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (8, 2, 'Black-Bean Patty');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (9, 2, 'Veggie Patty');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (10, 2, 'Fried Chicken');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (11, 3, 'Mayo');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (12, 3, 'Mustard');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (13, 3, 'Ketchup');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (14, 3, 'BBQ');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (15, 4, 'American');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (16, 5, 'Lettuce');
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`) VALUES (17, 6, 'Fried Cream Cheese');

COMMIT;


-- -----------------------------------------------------
-- Data for table `burger_ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `burgerdb`;
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (1, 1, 1, 1);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (2, 1, 5, 2);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (3, 1, 13, 3);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (4, 1, 15, 4);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (5, 1, 1, 5);

COMMIT;

