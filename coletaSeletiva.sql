-- MySQL Script generated by MySQL Workbench
-- Wed Apr 27 21:29:26 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_coleta_seletiva
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_coleta_seletiva
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_coleta_seletiva` DEFAULT CHARACTER SET utf8 ;
USE `db_coleta_seletiva` ;

-- -----------------------------------------------------
-- Table `db_coleta_seletiva`.`tb_temas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coleta_seletiva`.`tb_temas` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `topico` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coleta_seletiva`.`tb_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coleta_seletiva`.`tb_usuarios` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coleta_seletiva`.`tb_postagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coleta_seletiva`.`tb_postagens` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(155) NOT NULL,
  `texto` VARCHAR(1000) NOT NULL,
  `midia` VARCHAR(1000) NULL,
  `data` DATE NOT NULL,
  `regioes` VARCHAR(100) NOT NULL,
  `curtir` INT NULL,
  `tb_usuarios_id` BIGINT NOT NULL,
  `tb_temas_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_postagens_tb_usuarios_idx` (`tb_usuarios_id` ASC) VISIBLE,
  INDEX `fk_tb_postagens_tb_temas1_idx` (`tb_temas_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_postagens_tb_usuarios`
    FOREIGN KEY (`tb_usuarios_id`)
    REFERENCES `db_coleta_seletiva`.`tb_usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_postagens_tb_temas1`
    FOREIGN KEY (`tb_temas_id`)
    REFERENCES `db_coleta_seletiva`.`tb_temas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
PACK_KEYS = 1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;