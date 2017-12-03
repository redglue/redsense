-- MySQL Script generated by MySQL Workbench
-- Sat Nov 11 17:42:23 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `redatasense` DEFAULT CHARACTER SET utf8 ;
USE `redatasense` ;

-- -----------------------------------------------------
-- Table `mydb`.`FILE_PROPERTIES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `redatasense`.`FILE_PROPERTIES` (
  `RKEY` VARCHAR(256) NULL,
  `RVALUE` VARCHAR(4000) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FILE_RESULTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `redatasense`.`FILE_RESULTS` (
  `ID_FILE` INT NOT NULL AUTO_INCREMENT,
  `RUN_ID` VARCHAR(64) NOT NULL,
  `RUN_TIMESTAMP` TIMESTAMP NOT NULL,
  `DIRECTORY` VARCHAR(1024) NOT NULL,
  `FILENAME` VARCHAR(256) NOT NULL,
  `PROBABILITY` VARCHAR(6) NULL,
  `MODEL` VARCHAR(45) NULL,
  `DICTIONARY` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_FILE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DB_PROPERTIES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `redatasense`.`DB_PROPERTIES` (
  `ID_DB` INT NOT NULL AUTO_INCREMENT,
  `VENDOR` VARCHAR(45) NOT NULL,
  `DRIVER` VARCHAR(45) NOT NULL,
  `USERNAME` VARCHAR(45) NULL,
  `PASSWORD` VARCHAR(45) NULL,
  `DBSCHEMA` VARCHAR(45) NULL,
  `URL` VARCHAR(4000) NOT NULL,
  `ISACTIVE` BOOLEAN NOT NULL,
  PRIMARY KEY (`ID_DB`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`COLUMN_RESULTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `redatasense`.`COLUMN_RESULTS` (
  `ID_COLUMN` INT NOT NULL AUTO_INCREMENT,
  `ID_DB` INT NULL,
  `COLUMN_NAME` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_COLUMN`),
  INDEX `ID_DB_FK_idx` (`ID_DB` ASC),
  CONSTRAINT `ID_DB_FK`
    FOREIGN KEY (`ID_DB`)
    REFERENCES `redatasense`.`DB_PROPERTIES` (`ID_DB`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DATADISCOVERY_PROPERTIES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `redatasense`.`DATADISCOVERY_PROPERTIES` (
  `RKEY` VARCHAR(256) NULL,
  `RVALUE` VARCHAR(4000) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DATA_RESULTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `redatasense`.`DATA_RESULTS` (
  `ID_DATA` INT NOT NULL AUTO_INCREMENT,
  `ID_DB` INT NOT NULL,
  `RUN_ID` VARCHAR(64) NOT NULL,
  `RUN_TIMESTAMP` TIMESTAMP NOT NULL,
  `COLUMN` VARCHAR(45) NULL,
  `PROBABILITY` DOUBLE NULL,
  `MODEL` VARCHAR(45) NULL,
  `DICTIONARY` VARCHAR(45) NULL,
  `NUM_ROWS` INT NULL,
  `SCORE` DOUBLE NULL,
  `SAMPLE_DATA` VARCHAR(4000) NULL,
  PRIMARY KEY (`ID_DATA`),
  INDEX `ID_DB_FK_idx` (`ID_DB` ASC),
  CONSTRAINT `ID_DB_DATARESULTS_FK`
    FOREIGN KEY (`ID_DB`)
    REFERENCES `redatasense`.`DB_PROPERTIES` (`ID_DB`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
