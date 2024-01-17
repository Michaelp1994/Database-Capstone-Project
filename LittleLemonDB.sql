-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little_lemon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon` DEFAULT CHARACTER SET utf8 ;
USE `little_lemon` ;

-- -----------------------------------------------------
-- Table `little_lemon`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`employees` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `position` VARCHAR(45) NULL,
  `salary` DECIMAL NULL,
  `employeescol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`customers` (
  `id` INT NOT NULL,
  `name` VARCHAR(200) NULL,
  `contact_number` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`bookings` (
  `id` INT NOT NULL,
  `date` DATE NULL,
  `table_number` VARCHAR(45) NULL,
  `employees_id` INT NOT NULL,
  `customers_id` INT NOT NULL,
  PRIMARY KEY (`id`, `employees_id`, `customers_id`),
  INDEX `fk_bookings_employees_idx` (`employees_id` ASC) VISIBLE,
  INDEX `fk_bookings_customers1_idx` (`customers_id` ASC) VISIBLE,
  CONSTRAINT `fk_bookings_employees`
    FOREIGN KEY (`employees_id`)
    REFERENCES `little_lemon`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bookings_customers1`
    FOREIGN KEY (`customers_id`)
    REFERENCES `little_lemon`.`customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`orders` (
  `id` INT NOT NULL,
  `order_date` DATE NULL,
  `quantity` INT NULL,
  `total_cost` DECIMAL NULL,
  `customers_id` INT NOT NULL,
  `employees_id` INT NOT NULL,
  PRIMARY KEY (`id`, `customers_id`, `employees_id`),
  INDEX `fk_orders_customers1_idx` (`customers_id` ASC) VISIBLE,
  INDEX `fk_orders_employees1_idx` (`employees_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`customers_id`)
    REFERENCES `little_lemon`.`customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `little_lemon`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`menus` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon`.`menu_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`menu_items` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `price` DECIMAL NULL,
  `menus_id` INT NOT NULL,
  PRIMARY KEY (`id`, `menus_id`),
  INDEX `fk_menu_items_menus1_idx` (`menus_id` ASC) VISIBLE,
  CONSTRAINT `fk_menu_items_menus1`
    FOREIGN KEY (`menus_id`)
    REFERENCES `little_lemon`.`menus` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon`.`order_delivery_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`order_delivery_status` (
  `id` INT NOT NULL,
  `date` DATE NULL,
  `status` VARCHAR(45) NULL,
  `order_delivery_statuscol` VARCHAR(45) NULL,
  `orders_id` INT NOT NULL,
  PRIMARY KEY (`id`, `orders_id`),
  INDEX `fk_order_delivery_status_orders1_idx` (`orders_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_delivery_status_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `little_lemon`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon`.`order_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`order_item` (
  `id` INT NOT NULL,
  `price` DECIMAL NULL,
  `orders_id` INT NOT NULL,
  `menu_items_id` INT NOT NULL,
  PRIMARY KEY (`id`, `orders_id`, `menu_items_id`),
  INDEX `fk_order_item_orders1_idx` (`orders_id` ASC) VISIBLE,
  INDEX `fk_order_item_menu_items1_idx` (`menu_items_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_item_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `little_lemon`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_item_menu_items1`
    FOREIGN KEY (`menu_items_id`)
    REFERENCES `little_lemon`.`menu_items` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
