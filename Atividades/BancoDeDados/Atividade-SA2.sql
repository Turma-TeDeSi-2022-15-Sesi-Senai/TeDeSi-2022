-- feito por @gabriel-fresan @Robsonro no github
CREATE DATABASE TeDeSiFIFA-s2;
USE TeDeSiFIFA-s2;

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
  `gols_selecao_1` INT NULL,
  `gols_selecao_2` INT NULL,
  `selecao_ganhador` VARCHAR(45) NULL,
  PRIMARY KEY (`jogo_id`),
  CONSTRAINT `fk_resultado_jogo1`
    FOREIGN KEY (`jogo_id`)
    REFERENCES `mydb`.`jogo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`selecao` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`selecao_has_jogo` (
  `selecao_id` INT NOT NULL,
  `jogo_id` INT NOT NULL,
  PRIMARY KEY (`selecao_id`, `jogo_id`),
  INDEX `fk_selecao_has_jogo_jogo1_idx` (`jogo_id` ASC) VISIBLE,
  INDEX `fk_selecao_has_jogo_selecao1_idx` (`selecao_id` ASC) VISIBLE,
  CONSTRAINT `fk_selecao_has_jogo_selecao1`
    FOREIGN KEY (`selecao_id`)
    REFERENCES `mydb`.`selecao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_selecao_has_jogo_jogo1`
    FOREIGN KEY (`jogo_id`)
    REFERENCES `mydb`.`jogo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`substituicao` (
  `id` INT NOT NULL,
  `selecao_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_substituicao_selecao1_idx` (`selecao_id` ASC) VISIBLE,
  CONSTRAINT `fk_substituicao_selecao1`
    FOREIGN KEY (`selecao_id`)
    REFERENCES `mydb`.`selecao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`jogador` (
  `id` INT NOT NULL,
  `selecao_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `Numero-Camisa` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_jogador_selecao1_idx` (`selecao_id` ASC) VISIBLE,
  CONSTRAINT `fk_jogador_selecao1`
    FOREIGN KEY (`selecao_id`)
    REFERENCES `mydb`.`selecao` (`id`)
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

CREATE TABLE IF NOT EXISTS `mydb`.`informacoes-selecao-em-jogo` (
  `jogo_id` INT NOT NULL,
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
  `time_id` INT NOT NULL,
  PRIMARY KEY (`jogo_id`, `time_id`),
  INDEX `fk_informacoes-jogador-em-jogo_time1_idx` (`time_id` ASC) VISIBLE,
  CONSTRAINT `fk_informacoes-jogador-em-jogo_jogo1`
    FOREIGN KEY (`jogo_id`)
    REFERENCES `mydb`.`jogo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_informacoes-jogador-em-jogo_time1`
    FOREIGN KEY (`time_id`)
    REFERENCES `mydb`.`time` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB






INSERT INTO Selecao VAlUES (1 , 'Brasil', 'Brasil');
INSERT INTO Selecao VAlUES (2 , 'Holanda', 'Holanda');
INSERT INTO Selecao VAlUES (3 , 'Alemanha', 'Alemanha');
INSERT INTO Selecao VAlUES (4 , 'Argentina ', 'Argentina');




INSERT INTO Jogador VAlUES(null,1,'Alisson','1');
INSERT INTO Jogador VAlUES(null,1,'Danilo','2');
INSERT INTO Jogador VAlUES(null,1,'Rodrigo Caio','3');
INSERT INTO Jogador VAlUES(null,1,'Marquinhos','4');
INSERT INTO Jogador VAlUES(null,1,'Casemiro','5');
INSERT INTO Jogador VAlUES(null,1,'Alex Sandro','6');
INSERT INTO Jogador VAlUES(null,1,'Richarlison','7');
INSERT INTO Jogador VAlUES(null,1,'Fred','8');
INSERT INTO Jogador VAlUES(null,1,'Gabriel Jesus','9');
INSERT INTO Jogador VAlUES(null,1,'Neymar Jr.','10');
INSERT INTO Jogador VAlUES(null,1,'Everton Ribeiro','11');
INSERT INTO Jogador VAlUES(null,1,'Weverton','12');
INSERT INTO Jogador VAlUES(null,1,'Emerson','13');
INSERT INTO Jogador VAlUES(null,1,'Eder Militão','14');
INSERT INTO Jogador VAlUES(null,1,'Fabinho','15');
INSERT INTO Jogador VAlUES(null,1,'Renan Lodi','16');
INSERT INTO Jogador VAlUES(null,1,'Lucas Paquetá','17');
INSERT INTO Jogador VAlUES(null,1,'Vinicius Junior','18');
INSERT INTO Jogador VAlUES(null,1,'Everton Cebolinha','19');
INSERT INTO Jogador VAlUES(null,1,'Roberto Firmino','20');
INSERT INTO Jogador VAlUES(null,1,'Gabriel Barbosa','21');
INSERT INTO Jogador VAlUES(null,1,'Felipe','22');
INSERT INTO Jogador VAlUES(null,1,'Ederson','23');


INSERT INTO Jogador VAlUES(null,2,'Jasper Cillessen' , '1');
INSERT INTO Jogador VAlUES(null,2,'Michel Vorm' , '22');
INSERT INTO Jogador VAlUES(null,2,'Tim Krul' , '23');
INSERT INTO Jogador VAlUES(null,2,'Ron Vlaar' , '2');
INSERT INTO Jogador VAlUES(null,2,'Stefan de Vrij' , '3');
INSERT INTO Jogador VAlUES(null,2,'Bruno Martins Indi' , '4');
INSERT INTO Jogador VAlUES(null,2,'Daley Blind' , '5');
INSERT INTO Jogador VAlUES(null,2,'Daryl Janmaat' , '7');
INSERT INTO Jogador VAlUES(null,2,'Paul Verhaegh' , '12');
INSERT INTO Jogador VAlUES(null,2,'Joel Veltman' , '13');
INSERT INTO Jogador VAlUES(null,2,'Terence Kongolo' , '14');
INSERT INTO Jogador VAlUES(null,2,'Nigel de Jong' , '6');
INSERT INTO Jogador VAlUES(null,2,'Jonathan de Guzmán' , '8');
INSERT INTO Jogador VAlUES(null,2,'Wesley Sneijder' , '10');
INSERT INTO Jogador VAlUES(null,2,'Jordy Clasie' , '16');
INSERT INTO Jogador VAlUES(null,2,'Leroy Fer' , '18');
INSERT INTO Jogador VAlUES(null,2,'Gini Wijnaldum' , '20');
INSERT INTO Jogador VAlUES(null,2,'Robin van Persie' , '9');
INSERT INTO Jogador VAlUES(null,2,'Arjen Robben' , '11');
INSERT INTO Jogador VAlUES(null,2,'Dirk Kuyt' , '15');
INSERT INTO Jogador VAlUES(null,2,'Jeremain Lens' , '17');
INSERT INTO Jogador VAlUES(null,2,'Klaas-Jan Huntelaar' , '19');
INSERT INTO Jogador VAlUES(null,2,'Memphis Depay' , '21');





INSERT INTO Jogador VAlUES(null,3,'Marc-André ter Stegen','22');
INSERT INTO Jogador VAlUES(null,3,'Antonio Rudiger','2');
INSERT INTO Jogador VAlUES(null,3,'Matthias Ginter','4');
INSERT INTO Jogador VAlUES(null,3,'Niklas Sule','15');
INSERT INTO Jogador VAlUES(null,3,'Robin Gosens','20');
INSERT INTO Jogador VAlUES(null,3,'Thilo Kehrer','5');
INSERT INTO Jogador VAlUES(null,3,'Benjamin Henrichs','16');
INSERT INTO Jogador VAlUES(null,3,'David Raum','3');
INSERT INTO Jogador VAlUES(null,3,'Armel Bella-Kotchap','17');
INSERT INTO Jogador VAlUES(null,3,'Nico Schlotterbeck','23');
INSERT INTO Jogador VAlUES(null,3,'lllkay Gundogan','21');
INSERT INTO Jogador VAlUES(null,3,'Maximilian Arnold','8');
INSERT INTO Jogador VAlUES(null,3,'Jonas Hofmann','18');
INSERT INTO Jogador VAlUES(null,3,'Joshua Kimmich','6');
INSERT INTO Jogador VAlUES(null,3,'Kai Havetz','7');
INSERT INTO Jogador VAlUES(null,3,'Thomas Muller','13');
INSERT INTO Jogador VAlUES(null,3,'Serge Gnabry','10');
INSERT INTO Jogador VAlUES(null,3,'Timo Werner','9');
INSERT INTO Jogador VAlUES(null,3,'Leroy Sané','19');
INSERT INTO Jogador VAlUES(null,3,'Lukas Nmecha','11');
INSERT INTO Jogador VAlUES(null,3,'Jamal Musiala','14');
INSERT INTO Jogador VAlUES(null,3,'Oliver Baumann','1');
INSERT INTO Jogador VAlUES(null,3,'Kevin Trapp','12');


INSERT INTO Jogador VAlUES(null, 4 ,'Sergio Romero' ,'1');
INSERT INTO Jogador VAlUES(null, 4 ,'Agustín Orión', '12');
INSERT INTO Jogador VAlUES(null, 4 ,'Mariano Andújar', '21');
INSERT INTO Jogador VAlUES(null, 4 ,'Ezequiel Garay' ,'2');
INSERT INTO Jogador VAlUES(null, 4 ,'Hugo Campagnaro' ,'3');
INSERT INTO Jogador VAlUES(null, 4 ,'Pablo Zabaleta' ,'4');
INSERT INTO Jogador VAlUES(null, 4 ,'Martín Demichelis', '15');
INSERT INTO Jogador VAlUES(null, 4 ,'Marcos Rojo', '16');
INSERT INTO Jogador VAlUES(null, 4 ,'Fede Fernández', '17');
INSERT INTO Jogador VAlUES(null, 4 ,'José María Basanta', '23');
INSERT INTO Jogador VAlUES(null, 4 ,'Fernando Gago' ,'5');
INSERT INTO Jogador VAlUES(null, 4 ,'Lucas Biglia' ,'6');
INSERT INTO Jogador VAlUES(null, 4 ,'Ángel Di María' ,'7');
INSERT INTO Jogador VAlUES(null, 4 ,'Enzo Pérez','8');
INSERT INTO Jogador VAlUES(null, 4 ,'Maxi Rodríguez', '11');
INSERT INTO Jogador VAlUES(null, 4 ,'Augusto Fernández', '13');
INSERT INTO Jogador VAlUES(null, 4 ,'Javier Mascherano', '14');
INSERT INTO Jogador VAlUES(null, 4 ,'Ricky Álvarez', '19');
INSERT INTO Jogador VAlUES(null, 4 ,'Gonzalo Higuaín' ,'9');
INSERT INTO Jogador VAlUES(null, 4 ,'Lionel Messi', '10');
INSERT INTO Jogador VAlUES(null, 4 ,'Rodrigo Palacio', '18');
INSERT INTO Jogador VAlUES(null, 4 ,'Sergio Agüero', '20');
INSERT INTO Jogador VAlUES(null, 4 ,'Ezequiel Lavezzi', '22');



INSERT INTO Estadio VALUES(NULL , 'Al Bayt');
INSERT INTO Estadio VALUES(NULL , 'Al Thumama');


INSERT INTO Torcedor VALUES(NULL , '893.463.790-06' ,'Felipe');
INSERT INTO Torcedor VALUES(NULL , '079.027.220-22' ,'Norel');
INSERT INTO Torcedor VALUES(NULL , '011.277.870-47' ,'Aror');
INSERT INTO Torcedor VALUES(NULL , '992.813.710-22' ,'Zuecei');

INSERT INTO Jogo VALUES(NULL , 1 , '10/08/2022' , 0 , 10);
INSERT INTO Jogo VALUES(NULL , 1 , '11/08/2022' , 2 , 8);
INSERT INTO Jogo VALUES(NULL , 2 , '10/08/2022' , 5 , 2);
INSERT INTO Jogo VALUES(NULL , 2 , '11/08/2022' , 4 , 3);

INSERT INTO Arbitragem VALUES(NULL , 1 , 'Neuza Back' , 'Brasil' , '188.659.150-48');
INSERT INTO Arbitragem VALUES(NULL , 2 , 'Kathryn Nesbitt' , 'Estados Unidos' , '923.436.650-60');
INSERT INTO Arbitragem VALUES(NULL , 3 , 'Karen Díaz Medina' , 'Mexico' , '114.275.460-02');
INSERT INTO Arbitragem VALUES(NULL , 4 , 'Stéphanie Frappart' , 'França' , '003.860.110-95');

INSERT INTO Reserva VALUES(NULL , 1 , 1);
INSERT INTO Reserva VALUES(NULL , 1 , 2);
INSERT INTO Reserva VALUES(NULL , 1 , 3);
INSERT INTO Reserva VALUES(NULL , 1 , 4);
INSERT INTO Reserva VALUES(NULL , 2 , 1);
INSERT INTO Reserva VALUES(NULL , 2 , 2);
INSERT INTO Reserva VALUES(NULL , 2 , 3);
INSERT INTO Reserva VALUES(NULL , 2 , 4);
INSERT INTO Reserva VALUES(NULL , 3 , 1);
INSERT INTO Reserva VALUES(NULL , 3 , 2);
INSERT INTO Reserva VALUES(NULL , 3 , 3);
INSERT INTO Reserva VALUES(NULL , 3 , 4);
INSERT INTO Reserva VALUES(NULL , 4 , 1);
INSERT INTO Reserva VALUES(NULL , 4 , 2);
INSERT INTO Reserva VALUES(NULL , 4 , 3);
INSERT INTO Reserva VALUES(NULL , 4 , 4);

INSERT INTO Cartoes VALUES ( 5 , 1 , 0);
INSERT INTO Cartoes VALUES ( 2 , 3 , 1);
INSERT INTO Cartoes VALUES ( 52 , 2 , 2);
INSERT INTO Cartoes VALUES ( 86 , 0 , 3);


INSERT INTO Substituicao VALUES ( NULL , 1 , 1 , 5);
INSERT INTO Substituicao VALUES ( NULL , 2 , 31 , 42);
INSERT INTO Substituicao VALUES ( NULL , 3 , 53 , 64);
INSERT INTO Substituicao VALUES ( NULL , 4 , 84 , 99);


INSERT INTO selecao_has_jogo VALUES (2 , 1);
INSERT INTO selecao_has_jogo VALUES (2 , 3);
INSERT INTO selecao_has_jogo VALUES (1 , 2);
INSERT INTO selecao_has_jogo VALUES (1 , 4);

INSERT INTO selecao_has_jogo VALUES (3 , 1);
INSERT INTO selecao_has_jogo VALUES (3 , 2);

INSERT INTO selecao_has_jogo VALUES (4 , 3); 
INSERT INTO selecao_has_jogo VALUES (4 , 4);


INSERT INTO informacoes-selecao-em-jogo VALUES ('2' , '1' , '0' , '0' , '17', '8' , '2' , '5' , '12' , '13' , '1' , '0' , '0' , '0' , '1');
INSERT INTO informacoes-selecao-em-jogo VALUES ('2' , '7' , '0' , '0' , '15' , '11' , '0' , '5' , '13' , '12' , '0' , '0' , '0' , '0' , '3');

INSERT INTO informacoes-selecao-em-jogo VALUES ('1' , '2' , '0' , '5' , '3' , '8' , '4' , '3' , '11' , '9' , '2' , '0' , '0' , '0' , '2');
INSERT INTO informacoes-selecao-em-jogo VALUES ('1' , '4' , '0' , '5' , '11' , '6' , '4' , '3' , '9' , '11' , '1' , '0' , '0' , '0' , '4');

INSERT INTO informacoes-selecao-em-jogo VALUES ('3' , '0' , '0' , '0' , '8' , '1' , '1' , '4' , '15' , '20' , '3' , '0' , '0' , '0' , '1');
INSERT INTO informacoes-selecao-em-jogo VALUES ('3' , '3' , '0' , '0' , '6' , '4' , '2' , '1' , '20' , '15' , '2' , '0' , '0' , '0' , '2');

INSERT INTO informacoes-selecao-em-jogo VALUES ('4' , '1' , '0' , '0' , '7' , '4' , '1' , '6' , '13' , '9' , '2' , '0' , '0' , '0' , '3');
INSERT INTO informacoes-selecao-em-jogo VALUES ('4' , '0' , '0' , '0' , '6' , '0' , '2' , '3' , '9' , '13' , '2' , '0' , '0' , '0' , '4');
