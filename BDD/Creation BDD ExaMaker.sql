-- MySQL Script generated by MySQL Workbench
-- 11/01/16 23:39:22
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ExaMaker
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ExaMaker
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ExaMaker` DEFAULT CHARACTER SET utf8 ;
USE `ExaMaker` ;

-- -----------------------------------------------------
-- Table `ExaMaker`.`Examens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExaMaker`.`Examens` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(255) NULL,
  `Slug` VARCHAR(255) NULL,
  `DateCreation` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModification` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Nom_UNIQUE` (`Nom` ASC))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `ExaMaker`.`Exercices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExaMaker`.`Exercices` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ExamenID` INT NOT NULL,
  `Nom` VARCHAR(255) NULL,
  `Points` INT UNSIGNED NOT NULL,
  `DateCreation` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModification` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Nom_UNIQUE` (`Nom` ASC),
  INDEX `fk_Exercices_Examens1_idx` (`ExamenID` ASC))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `ExaMaker`.`Questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExaMaker`.`Questions` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ExerciceID` INT NOT NULL,
  `Question` LONGTEXT NOT NULL,
  `Points` INT UNSIGNED NOT NULL,
  `DateCreation` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModification` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  INDEX `fk_Questions_Exercices_idx` (`ExerciceID` ASC))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `ExaMaker`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExaMaker`.`Users` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Login` VARCHAR(255) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  `Type` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Login_UNIQUE` (`Login` ASC),
  UNIQUE INDEX `Password_UNIQUE` (`Password` ASC))
ENGINE = MYISAM;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
