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
-- Table `mydb`.`CINE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CINE` (
  `NIF` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Ubicació` VARCHAR(45) NULL,
  `Num_Salas` INT(25) NULL,
  `Horari` DATETIME NULL,
  `Telefon` INT(9) NULL,
  `Localitat` VARCHAR(45) NULL,
  `Codi_Postal` VARCHAR(45) NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pelicules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pelicules` (
  `ISBN` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Director` VARCHAR(45) NULL,
  `Protagonista` VARCHAR(45) NULL,
  `Actor_Secundari` VARCHAR(45) NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tarifa` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Preu` VARCHAR(45) NULL,
  `Descripció` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Projeccions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Projeccions` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Sala` VARCHAR(45) NULL,
  `Horari_Inici` TIME NULL,
  `Horari_Fi` TIME NULL,
  `Pelicules_ISBN` INT(20) NULL,
  `Tarifa_ID` INT NULL,
  `CINE_NIF` VARCHAR(9) NULL,
  INDEX `fk_Projeccions_Pelicules1_idx` (`Pelicules_ISBN` ASC) VISIBLE,
  INDEX `fk_Projeccions_Tarifa1_idx` (`Tarifa_ID` ASC) VISIBLE,
  INDEX `fk_Projeccions_CINE1_idx` (`CINE_NIF` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_Projeccions_Pelicules1`
    FOREIGN KEY (`Pelicules_ISBN`)
    REFERENCES `mydb`.`Pelicules` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccions_Tarifa1`
    FOREIGN KEY (`Tarifa_ID`)
    REFERENCES `mydb`.`Tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccions_CINE1`
    FOREIGN KEY (`CINE_NIF`)
    REFERENCES `mydb`.`CINE` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
