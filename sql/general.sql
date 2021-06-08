CREATE SCHEMA IF NOT EXISTS `exhibitions` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `exhibitions`;

-- -----------------------------------------------------
-- Table `exhibitions`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exhibitions`.`roles` ;

CREATE TABLE IF NOT EXISTS `exhibitions`.`roles` (
  `id` INT NOT NULL,
  `role` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `role` (`role` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `exhibitions`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exhibitions`.`users` ;

CREATE TABLE IF NOT EXISTS `exhibitions`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(256) NOT NULL,
  `password` VARCHAR(256) NOT NULL,
  `role_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `email` (`email` ASC) VISIBLE,
  INDEX `role_id` (`role_id` ASC) VISIBLE,
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE,
  CONSTRAINT `users_ibfk_1`
    FOREIGN KEY (`role_id`)
    REFERENCES `exhibitions`.`roles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `exhibitions`.`topics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exhibitions`.`topics` ;

CREATE TABLE IF NOT EXISTS `exhibitions`.`topics` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `exhibitions`.`exhibitions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exhibitions`.`exhibitions` ;

CREATE TABLE IF NOT EXISTS `exhibitions`.`exhibitions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `topic_id` INT NOT NULL,
  `date_from` DATE NOT NULL,
  `date_to` DATE NOT NULL,
  `time_from` TIME NULL,
  `time_to` TIME NULL,
  `status` ENUM('active', 'canceled') NULL,
  PRIMARY KEY (`id`),
  INDEX `topic_id_idx` (`topic_id` ASC) VISIBLE,
  CONSTRAINT `topic_id`
    FOREIGN KEY (`topic_id`)
    REFERENCES `exhibitions`.`topics` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `exhibitions`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exhibitions`.`orders` ;

CREATE TABLE IF NOT EXISTS `exhibitions`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `exhibition_id` INT UNSIGNED NOT NULL,
  `seat_amount` INT UNSIGNED NOT NULL,
  `status` ENUM('active', 'disabled') NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_exhibitions1_idx` (`exhibition_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `exhibition_id`
    FOREIGN KEY (`exhibition_id`)
    REFERENCES `exhibitions`.`exhibitions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `exhibitions`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `exhibitions`.`halls`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exhibitions`.`halls` ;

CREATE TABLE IF NOT EXISTS `exhibitions`.`halls` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `capacity` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exhibitions`.`exhibition_halls`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exhibitions`.`exhibition_halls` ;

CREATE TABLE IF NOT EXISTS `exhibitions`.`exhibition_halls` (
  `exhibitions_id` INT UNSIGNED NOT NULL,
  `halls_id` INT NOT NULL,
  PRIMARY KEY (`exhibitions_id`, `halls_id`),
  INDEX `fk_exhibitions_has_halls_halls1_idx` (`halls_id` ASC) VISIBLE,
  INDEX `fk_exhibitions_has_halls_exhibitions1_idx` (`exhibitions_id` ASC) VISIBLE,
  CONSTRAINT `fk_exhibitions_has_halls_exhibitions1`
    FOREIGN KEY (`exhibitions_id`)
    REFERENCES `exhibitions`.`exhibitions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exhibitions_has_halls_halls1`
    FOREIGN KEY (`halls_id`)
    REFERENCES `exhibitions`.`halls` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
