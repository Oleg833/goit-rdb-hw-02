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
-- Table `mydb2`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Client` (
  `idClient` INT NOT NULL DEFAULT 1,
  `Adress` VARCHAR(45) NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Orders_Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Orders_Clients` (
  `Clients_id` INT NOT NULL,
  `Order_id` INT NOT NULL DEFAULT 101,
  `Order_Dates` DATE NOT NULL,
  PRIMARY KEY (`Order_id`, `Order_Dates`),
  INDEX `pk_client_idx` (`Clients_id` ASC) INVISIBLE,
  INDEX `pk_Order` (`Order_id` ASC, `Order_Dates` ASC) VISIBLE,
  CONSTRAINT `Orders_clients_client`
    FOREIGN KEY (`Clients_id`)
    REFERENCES `mydb2`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Orders` (
  `idOrders` INT NOT NULL,
  `Item` VARCHAR(45) NULL,
  `Quantity` INT NULL,
  `Dates` DATE NOT NULL,
  INDEX `pk_id_idx` (`idOrders` ASC, `Dates` ASC) VISIBLE,
  CONSTRAINT `fk_orders_clients`
    FOREIGN KEY (`idOrders` , `Dates`)
    REFERENCES `mydb2`.`Orders_Clients` (`Order_id` , `Order_Dates`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
