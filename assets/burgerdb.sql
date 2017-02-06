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
  `description` VARCHAR(45) NULL,
  `creation_date` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ingredient_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ingredient_type` ;

CREATE TABLE IF NOT EXISTS `ingredient_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
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
  `description` VARCHAR(45) NULL,
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
GRANT USAGE ON *.* TO burgerchef@localhost;
 DROP USER burgerchef@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'burgerchef'@'localhost' IDENTIFIED BY 'burgerchef';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'burgerchef'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `burger`
-- -----------------------------------------------------
START TRANSACTION;
USE `burgerdb`;
INSERT INTO `burger` (`id`, `name`, `description`, `creation_date`) VALUES (1, 'Cheeseburger', 'An American Classic', '2017-02-03');
INSERT INTO `burger` (`id`, `name`, `description`, `creation_date`) VALUES (2, 'Bacon Blue', 'Smoky, Salty, Funky', '2017-02-05');
INSERT INTO `burger` (`id`, `name`, `description`, `creation_date`) VALUES (3, 'The Luther', 'A Cardiologist\'s Nightmare', '2017-02-05');
INSERT INTO `burger` (`id`, `name`, `description`, `creation_date`) VALUES (4, 'Big Kahuna', 'Do They Speak English in What?', '2017-02-05');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ingredient_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `burgerdb`;
INSERT INTO `ingredient_type` (`id`, `type`, `description`) VALUES (1, 'bun', 'Outer hull');
INSERT INTO `ingredient_type` (`id`, `type`, `description`) VALUES (2, 'protein', 'The \"meat\"');
INSERT INTO `ingredient_type` (`id`, `type`, `description`) VALUES (3, 'sauce', 'Extra flavor');
INSERT INTO `ingredient_type` (`id`, `type`, `description`) VALUES (4, 'cheese', 'Dairy delight');
INSERT INTO `ingredient_type` (`id`, `type`, `description`) VALUES (5, 'topping', 'Traditional add-on');
INSERT INTO `ingredient_type` (`id`, `type`, `description`) VALUES (6, 'special', 'Miscellaneous');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `burgerdb`;
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (1, 1, 'Sesame Seed Bun', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (2, 1, 'Lettuce Wrap', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (3, 1, 'Glazed Donut', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (4, 1, 'Texas Toast', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (5, 2, 'All-Beef Patty', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (6, 2, 'Chicken Breast', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (7, 2, 'Portobello', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (8, 2, 'Black-Bean Patty', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (9, 2, 'Veggie Patty', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (10, 2, 'Fried Chicken', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (11, 3, 'Mayo', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (12, 3, 'Mustard', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (13, 3, 'Ketchup', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (14, 3, 'BBQ', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (21, 4, 'American', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (30, 5, 'Lettuce', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (32, 6, 'Fried Cream Cheese', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (15, 3, 'Thousand-Island', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (16, 3, 'Relish', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (17, 3, 'Hot-Sauce', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (18, 3, 'Teriyaki', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (19, 4, 'Cheddar ', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (20, 4, 'Swiss', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (22, 4, 'Feta', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (23, 4, 'Cream Cheese', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (24, 4, 'Blue Cheese', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (25, 4, 'Pepper Jack', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (26, 5, 'Tomato', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (27, 5, 'Red Onion', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (28, 5, 'White Onion', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (29, 5, 'Yellow Onion', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (31, 5, 'Pickle', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (33, 6, 'Pinnapple', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (34, 6, 'Ruffles Chips', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (35, 6, 'Bacon', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (36, 6, 'Fried Egg', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (37, 6, 'Jalapeno', NULL);
INSERT INTO `ingredient` (`id`, `ingredient_type_id`, `name`, `description`) VALUES (38, 6, 'Jalapeno Popper', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `burger_ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `burgerdb`;
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (1, 1, 1, 1);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (2, 1, 13, 2);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (3, 1, 12, 3);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (4, 1, 19, 4);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (5, 1, 5, 5);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (6, 1, 1, 6);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (7, 2, 1, 1);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (8, 2, 24, 2);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (9, 2, 35, 3);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (10, 2, 5, 4);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (11, 2, 1, 5);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (12, 3, 3, 1);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (13, 3, 36, 2);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (14, 3, 35, 3);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (15, 3, 19, 4);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (16, 3, 5, 5);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (17, 3, 3, 6);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (18, 4, 1, 1);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (19, 4, 18, 2);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (20, 4, 33, 3);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (21, 4, 19, 4);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (22, 4, 5, 5);
INSERT INTO `burger_ingredient` (`id`, `burger_id`, `ingredient_id`, `position`) VALUES (23, 4, 1, 6);

COMMIT;

