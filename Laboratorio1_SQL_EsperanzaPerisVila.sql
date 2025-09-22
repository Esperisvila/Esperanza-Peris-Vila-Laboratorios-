-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TikTokDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TikTokDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TikTokDB` DEFAULT CHARACTER SET utf8 ;
USE `TikTokDB` ;

-- -----------------------------------------------------
-- Table `TikTokDB`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`Usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(30) NOT NULL,
  `Correoelectrónico` VARCHAR(250) NOT NULL,
  `Fecha_registro` DATETIME NOT NULL,
  `Pais_origen` CHAR(2) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`Videos` (
  `idVideo` INT NOT NULL AUTO_INCREMENT,
  `idUsuario_videos` INT NOT NULL,
  `Título_video` VARCHAR(255) NOT NULL,
  `Descripción` TEXT NULL,
  `Fecha_publicación` DATETIME NOT NULL,
  `Duración_segundos` INT NOT NULL,
  PRIMARY KEY (`idVideo`),
  INDEX `idUsuarios_idx` (`idUsuario_videos` ASC) VISIBLE,
  CONSTRAINT `idUsuarios`
    FOREIGN KEY (`idUsuario_videos`)
    REFERENCES `TikTokDB`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`Comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`Comentarios` (
  `idComentario` INT NOT NULL AUTO_INCREMENT,
  `idUsuario_comentarios` INT NOT NULL,
  `idVideo_comentarios` INT NOT NULL,
  `Texto` TEXT NOT NULL,
  `Fecha_comentario` DATETIME NOT NULL,
  PRIMARY KEY (`idComentario`),
  INDEX `idVideo_idx` (`idVideo_comentarios` ASC) VISIBLE,
  INDEX `idUsuario_idx` (`idUsuario_comentarios` ASC) VISIBLE,
  CONSTRAINT `idVideo_comentarios`
    FOREIGN KEY (`idVideo_comentarios`)
    REFERENCES `TikTokDB`.`Videos` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario_comentarios`
    FOREIGN KEY (`idUsuario_comentarios`)
    REFERENCES `TikTokDB`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`Likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`Likes` (
  `idLike` INT NOT NULL AUTO_INCREMENT,
  `idVideo_likes` INT NOT NULL,
  `idUsuario_likes` INT NOT NULL,
  `Fecha_like` DATETIME NOT NULL,
  PRIMARY KEY (`idLike`),
  INDEX `idVideo_idx` (`idVideo_likes` ASC) VISIBLE,
  INDEX `idUsuario_idx` (`idUsuario_likes` ASC) VISIBLE,
  CONSTRAINT `idVideo_likes`
    FOREIGN KEY (`idVideo_likes`)
    REFERENCES `TikTokDB`.`Videos` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario_likes`
    FOREIGN KEY (`idUsuario_likes`)
    REFERENCES `TikTokDB`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`Seguidores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`Seguidores` (
  `idSeguidor` INT NOT NULL AUTO_INCREMENT,
  `id_usuario_seguidor` INT NOT NULL,
  `id_usuario_seguido` INT NOT NULL,
  `Fecha_inicio` DATETIME NOT NULL,
  PRIMARY KEY (`idSeguidor`),
  INDEX `id_usuario_seguidor_idx` (`id_usuario_seguidor` ASC) VISIBLE,
  INDEX `id_usuario_seguido_idx` (`id_usuario_seguido` ASC) VISIBLE,
  CONSTRAINT `id_usuario_seguidor`
    FOREIGN KEY (`id_usuario_seguidor`)
    REFERENCES `TikTokDB`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_usuario_seguido`
    FOREIGN KEY (`id_usuario_seguido`)
    REFERENCES `TikTokDB`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
