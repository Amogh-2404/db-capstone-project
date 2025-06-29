-- MySQL Script generated by MySQL Workbench
-- Tue Jun 17 23:52:41 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `LittleLemonDM` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `contact_details` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Bookings` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `table_number` INT NOT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `customer_id` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `bookings_ibfk_1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `LittleLemonDM`.`Customer` (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Menu` (
  `menu_id` INT NOT NULL AUTO_INCREMENT,
  `cuisine` VARCHAR(100) NULL DEFAULT NULL,
  `starter` VARCHAR(100) NULL DEFAULT NULL,
  `course` VARCHAR(100) NULL DEFAULT NULL,
  `drink` VARCHAR(100) NULL DEFAULT NULL,
  `dessert` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Staff` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `role` VARCHAR(100) NULL DEFAULT NULL,
  `salary` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATE NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `total_cost` DECIMAL(10,2) NULL DEFAULT NULL,
  `booking_id` INT NULL DEFAULT NULL,
  `staff_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `booking_id` (`booking_id` ASC) VISIBLE,
  INDEX `staff_id` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`booking_id`)
    REFERENCES `LittleLemonDM`.`Bookings` (`booking_id`),
  CONSTRAINT `orders_ibfk_2`
    FOREIGN KEY (`staff_id`)
    REFERENCES `LittleLemonDM`.`Staff` (`staff_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Order_Delivery_Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Order_Delivery_Status` (
  `delivery_id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NULL DEFAULT NULL,
  `delivery_date` DATE NULL DEFAULT NULL,
  `status` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  INDEX `order_id` (`order_id` ASC) VISIBLE,
  CONSTRAINT `order_delivery_status_ibfk_1`
    FOREIGN KEY (`order_id`)
    REFERENCES `LittleLemonDM`.`Orders` (`order_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
