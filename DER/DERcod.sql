-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_aquarelando
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_aquarelando
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_aquarelando` DEFAULT CHARACTER SET utf8 ;
USE `db_aquarelando` ;

-- -----------------------------------------------------
-- Table `db_aquarelando`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aquarelando`.`tb_usuario` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `cpf` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_aquarelando`.`tb_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aquarelando`.`tb_categoria` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `disponivel` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_aquarelando`.`tb_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_aquarelando`.`tb_produto` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `data_validade` DATE NULL,
  `quantidade` INT NOT NULL,
  `foto` VARCHAR(255) NULL,
  `selo_inmetro` TINYINT NULL,
  `tb_categoria_id` BIGINT NOT NULL,
  `tb_usuario_id` BIGINT NULL,
  PRIMARY KEY (`id`, `tb_categoria_id`),
  INDEX `fk_tb_produto_tb_categoria_idx` (`tb_categoria_id` ASC) VISIBLE,
  INDEX `fk_tb_produto_tb_usuario1_idx` (`tb_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_produto_tb_categoria`
    FOREIGN KEY (`tb_categoria_id`)
    REFERENCES `db_aquarelando`.`tb_categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produto_tb_usuario1`
    FOREIGN KEY (`tb_usuario_id`)
    REFERENCES `db_aquarelando`.`tb_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
