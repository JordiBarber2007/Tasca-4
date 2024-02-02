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
-- Table `mydb`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alumne` (
  `Expedient` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `DNI` VARCHAR(9) NULL,
  `Telefon` VARCHAR(9) NULL,
  `Correu` VARCHAR(45) NULL,
  `Data_Naixement` DATE NULL,
  PRIMARY KEY (`Expedient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departaments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departaments` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(45) NULL,
  `Ubicacio` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profresors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profresors` (
  `NIF` INT(9) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Correu` VARCHAR(45) NULL,
  `Telefon` INT(9) NULL,
  `Departaments_ID` INT NOT NULL,
  PRIMARY KEY (`NIF`, `Departaments_ID`),
  INDEX `fk_Profresors_Departaments1_idx` (`Departaments_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Profresors_Departaments1`
    FOREIGN KEY (`Departaments_ID`)
    REFERENCES `mydb`.`Departaments` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matricula` (
  `ID` INT NOT NULL,
  `Data` VARCHAR(45) NULL,
  `Nivell` VARCHAR(45) NULL,
  `Curs` VARCHAR(45) NULL,
  `Grup` VARCHAR(45) NULL,
  `Alumne_Expedient` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`, `Alumne_Expedient`),
  INDEX `fk_Matricula_Alumne_idx` (`Alumne_Expedient` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumne`
    FOREIGN KEY (`Alumne_Expedient`)
    REFERENCES `mydb`.`Alumne` (`Expedient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Assignatura` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(45) NULL,
  `Criteri_Avaluacio` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Assignatura/Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Assignatura/Matricula` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Avaluacio` VARCHAR(45) NULL,
  `Calendari` DATE NULL,
  `Matricula_ID` INT NOT NULL,
  `Matricula_Alumne_Expedient` VARCHAR(45) NOT NULL,
  `Assignatura_ID` INT NOT NULL,
  `Profresors_NIF` INT(9) NOT NULL,
  PRIMARY KEY (`ID`, `Matricula_ID`, `Matricula_Alumne_Expedient`, `Assignatura_ID`, `Profresors_NIF`),
  INDEX `fk_Assignatura/Matricula_Matricula1_idx` (`Matricula_ID` ASC, `Matricula_Alumne_Expedient` ASC) VISIBLE,
  INDEX `fk_Assignatura/Matricula_Assignatura1_idx` (`Assignatura_ID` ASC) VISIBLE,
  INDEX `fk_Assignatura/Matricula_Profresors1_idx` (`Profresors_NIF` ASC) VISIBLE,
  CONSTRAINT `fk_Assignatura/Matricula_Matricula1`
    FOREIGN KEY (`Matricula_ID` , `Matricula_Alumne_Expedient`)
    REFERENCES `mydb`.`Matricula` (`ID` , `Alumne_Expedient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignatura/Matricula_Assignatura1`
    FOREIGN KEY (`Assignatura_ID`)
    REFERENCES `mydb`.`Assignatura` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignatura/Matricula_Profresors1`
    FOREIGN KEY (`Profresors_NIF`)
    REFERENCES `mydb`.`Profresors` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
