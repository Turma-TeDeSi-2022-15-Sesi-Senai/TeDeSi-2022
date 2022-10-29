CREATE TABLE IF NOT EXISTS `mydb`.`estadio` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`jogo` (
  `id` INT NOT NULL,
  `estadio_id` INT NOT NULL,
  `horario` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_jogo_estadio1_idx` (`estadio_id` ASC) VISIBLE,
  CONSTRAINT `fk_jogo_estadio1`
    FOREIGN KEY (`estadio_id`)
    REFERENCES `mydb`.`estadio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Arbitragem` (
  `id` INT NOT NULL,
  `jogo_id` INT NOT NULL,
  `pais` VARCHAR(45) NULL,
  `CPF` VARCHAR(14) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Arbitragem_jogo1_idx` (`jogo_id` ASC) VISIBLE,
  CONSTRAINT `fk_Arbitragem_jogo1`
    FOREIGN KEY (`jogo_id`)
    REFERENCES `mydb`.`jogo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Torcedor` (
  `id` INT NOT NULL,
  `CPF` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`reserva` (
  `id` INT NOT NULL,
  `Torcedor_id` INT NOT NULL,
  `jogo_id` INT NOT NULL,
  INDEX `fk_reserva_jogo1_idx` (`jogo_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_reserva_jogo1`
    FOREIGN KEY (`jogo_id`)
    REFERENCES `mydb`.`jogo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_Torcedor1`
    FOREIGN KEY (`Torcedor_id`)
    REFERENCES `mydb`.`Torcedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`resultado` (
  `jogo_id` INT NOT NULL,
  `gols_time_1` INT NULL,
  `gols_time_2` INT NULL,
  `time_ganhador` VARCHAR(45) NULL,
  PRIMARY KEY (`jogo_id`),
  CONSTRAINT `fk_resultado_jogo1`
    FOREIGN KEY (`jogo_id`)
    REFERENCES `mydb`.`jogo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`time` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`time_has_jogo` (
  `time_id` INT NOT NULL,
  `jogo_id` INT NOT NULL,
  PRIMARY KEY (`time_id`, `jogo_id`),
  INDEX `fk_time_has_jogo_jogo1_idx` (`jogo_id` ASC) VISIBLE,
  INDEX `fk_time_has_jogo_time1_idx` (`time_id` ASC) VISIBLE,
  CONSTRAINT `fk_time_has_jogo_time1`
    FOREIGN KEY (`time_id`)
    REFERENCES `mydb`.`time` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_time_has_jogo_jogo1`
    FOREIGN KEY (`jogo_id`)
    REFERENCES `mydb`.`jogo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`substituicao` (
  `id` INT NOT NULL,
  `time_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_substituicao_time1_idx` (`time_id` ASC) VISIBLE,
  CONSTRAINT `fk_substituicao_time1`
    FOREIGN KEY (`time_id`)
    REFERENCES `mydb`.`time` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`jogador` (
  `id` INT NOT NULL,
  `time_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `Numero-Camisa` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_jogador_time1_idx` (`time_id` ASC) VISIBLE,
  CONSTRAINT `fk_jogador_time1`
    FOREIGN KEY (`time_id`)
    REFERENCES `mydb`.`time` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`jogador_has_substituicao` (
  `jogador_id` INT NOT NULL,
  `substituicao_id` INT NOT NULL,
  PRIMARY KEY (`jogador_id`, `substituicao_id`),
  INDEX `fk_jogador_has_substituicao_substituicao1_idx` (`substituicao_id` ASC) VISIBLE,
  INDEX `fk_jogador_has_substituicao_jogador1_idx` (`jogador_id` ASC) VISIBLE,
  CONSTRAINT `fk_jogador_has_substituicao_jogador1`
    FOREIGN KEY (`jogador_id`)
    REFERENCES `mydb`.`jogador` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jogador_has_substituicao_substituicao1`
    FOREIGN KEY (`substituicao_id`)
    REFERENCES `mydb`.`substituicao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`cartoes` (
  `jogador_id` INT NOT NULL,
  `cartoes-amarelos` INT NULL,
  `cartoes-vermelhos` INT NULL,
  INDEX `fk_cartoes_jogador1_idx` (`jogador_id` ASC) VISIBLE,
  PRIMARY KEY (`jogador_id`),
  CONSTRAINT `fk_cartoes_jogador1`
    FOREIGN KEY (`jogador_id`)
    REFERENCES `mydb`.`jogador` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`informacoes-jogador-em-jogo` (
  `jogo_id` INT NOT NULL,
  `jogador_id` INT NOT NULL,
  `gols_afavor` INT NULL,
  `gols_contra` INT NULL,
  `penaltis` INT NULL,
  `chutes` INT NULL,
  `chutes_ao_gol` INT NULL,
  `impedimentos` INT NULL,
  `escanteio` INT NULL,
  `faltas_cometidas` INT NULL,
  `faltas_sofridas` INT NULL,
  `cartoes_amarelos` INT NULL,
  `cartoes_vermelhos` INT NULL,
  `expulcoes` INT NULL,
  `expulcoes_por_2_cartoes_amarelos` INT NULL,
  `tempo_em_campo` INT NULL,
  `media_de_gols` INT NULL,
  PRIMARY KEY (`jogo_id`, `jogador_id`),
  INDEX `fk_informacoes-jogador-em-jogo_jogador1_idx` (`jogador_id` ASC) VISIBLE,
  CONSTRAINT `fk_informacoes-jogador-em-jogo_jogo1`
    FOREIGN KEY (`jogo_id`)
    REFERENCES `mydb`.`jogo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_informacoes-jogador-em-jogo_jogador1`
    FOREIGN KEY (`jogador_id`)
    REFERENCES `mydb`.`jogador` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB