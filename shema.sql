-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb2` DEFAULT CHARACTER SET utf8 ;
USE `mydb2` ;

-- -----------------------------------------------------
-- Table `mydb2`.`Clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb2`.`Clients` ;

CREATE TABLE IF NOT EXISTS `mydb2`.`Clients` (
  `idClients` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idClients`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb2`.`Orders` ;

CREATE TABLE IF NOT EXISTS `mydb2`.`Orders` (
  `idOrders` INT NOT NULL AUTO_INCREMENT,
  `Orders_Dates` DATE NOT NULL,
  `Clients_id` INT NOT NULL,
  PRIMARY KEY (`idOrders`),
  INDEX `fk_Orders_Client_idx` (`Clients_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Client`
    FOREIGN KEY (`Clients_id`)
    REFERENCES `mydb2`.`Clients` (`idClients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb2`.`Products` ;

CREATE TABLE IF NOT EXISTS `mydb2`.`Products` (
  `idProducts` INT NOT NULL AUTO_INCREMENT,
  `Products_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProducts`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Orders_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb2`.`Orders_details` ;

CREATE TABLE IF NOT EXISTS `mydb2`.`Orders_details` (
  `idOrders_details` INT NOT NULL AUTO_INCREMENT,
  `Orders_id` INT NOT NULL,
  `Products_id` INT NOT NULL,
  `Quantity` INT NOT NULL,
  INDEX `fk_id_4_idx` (`Orders_id` ASC) INVISIBLE,
  INDEX `fk_prod_id_idx` (`Products_id` ASC) VISIBLE,
  PRIMARY KEY (`idOrders_details`),
  CONSTRAINT `fk_id_4`
    FOREIGN KEY (`Orders_id`)
    REFERENCES `mydb2`.`Orders` (`idOrders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prod_id`
    FOREIGN KEY (`Products_id`)
    REFERENCES `mydb2`.`Products` (`idProducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
