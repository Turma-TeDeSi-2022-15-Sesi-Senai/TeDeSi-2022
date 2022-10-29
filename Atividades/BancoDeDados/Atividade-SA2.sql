-- feito por @gabriel-fresan @Robsonro no github
CREATE DATABASE TeDeSiFIFAS2;
USE TeDeSiFIFAS2;
CREATE TABLE Estadio(
     id INT PRIMARY KEY AUTO_INCREMENT,
     nome varchar(45)
);
CREATE TABLE Torcedor(
     id INT PRIMARY KEY AUTO_INCREMENT,
     cpf VARCHAR(14),
     nome VARCHAR(45)
);
CREATE TABLE Jogo(
     id INT AUTO_INCREMENT,
     estadio_id INT NOT NULL,
     horario VARCHAR(12),
     gols_time_1 INT,
     gols_time_2 INT,
     PRIMARY KEY (id),
     Foreign Key (estadio_id) REFERENCES Estadio(id)
);
CREATE TABLE Arbitragem(
     id INT AUTO_INCREMENT,
     jogo_id INT NOT NULL,
     nome VARCHAR(45),
     pais VARCHAR(45),
     cpf VARCHAR(14),
     PRIMARY KEY (id),
     Foreign Key (jogo_id) REFERENCES Jogo(id)
);
CREATE TABLE Selecao(
     id INT PRIMARY KEY AUTO_INCREMENT,
     nome VARCHAR(45),
     pais VARCHAR(45)
);
CREATE TABLE selecao_has_jogo(
     selecao_id INT NOT NULL,
     jogo_id INT NOT NULL,
     Foreign Key (selecao_id) REFERENCES Selecao(id),
     Foreign Key (jogo_id) REFERENCES Jogo(id)
);
CREATE TABLE Reserva(
     id INT AUTO_INCREMENT,
     torcedor_id INT NOT NULL,
     jogo_id INT NOT NULL,
     PRIMARY KEY (id),
     Foreign Key (torcedor_id) REFERENCES Torcedor(id),
     Foreign Key (jogo_id) REFERENCES Jogo(id)
);
CREATE TABLE Jogador(
     id INT AUTO_INCREMENT,
     selecao_id INT NOT NULL,
     nome VARCHAR(45),
     numero_camisa INT,
     PRIMARY KEY (id),
     Foreign Key (selecao_id) REFERENCES Selecao(id)
);
CREATE TABLE Cartoes(
     jogador_id INT,
     cartoes_amarelos INT,
     cartoes_vermelhos INT,
     Foreign Key (jogador_id) REFERENCES Jogador(id)
);
CREATE TABLE Substituicao(
     id INT AUTO_INCREMENT,
     selecao_id INT NOT NULL,
     jogador_saiu INT NOT NULL,
     jogador_entrou INT NOT NULL,
     PRIMARY KEY (id),
     Foreign Key (selecao_id) REFERENCES Selecao(id),
     Foreign Key (jogador_saiu) REFERENCES Jogador(id),
     Foreign Key (jogador_entrou) REFERENCES Jogador(id)
);


CREATE TABLE InformacoesSelecaoEmJogo(
  jogo_id INT NOT NULL,
  gols_afavor INT,
  gols_contra INT,
  penaltis INT,
  chutes INT,
  chutes_ao_gol INT,
  impedimentos INT,
  escanteio INT,
  faltas_cometidas INT,
  faltas_sofridas INT,
  cartoes_amarelos INT,
  cartoes_vermelhos INT,
  expulcoes INT,
  expulcoes_por_2_cartoes_amarelos INT,
  selecao_id INT NOT NULL,
  Foreign Key (jogo_id) REFERENCES Jogo(id),
  Foreign Key (selecao_id) REFERENCES Selecao(id)
);






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

INSERT INTO Jogo VALUES(NULL , 1 , '10/08/2022' , 4 , 2);
INSERT INTO Jogo VALUES(NULL , 1 , '11/08/2022' , 1 , 7);
INSERT INTO Jogo VALUES(NULL , 2 , '10/08/2022' , 0 , 3);
INSERT INTO Jogo VALUES(NULL , 2 , '11/08/2022' , 0 , 1);

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
INSERT INTO Substituicao VALUES ( NULL , 4 , 84 , 92);


INSERT INTO selecao_has_jogo VALUES (2 , 1);
INSERT INTO selecao_has_jogo VALUES (2 , 3);
INSERT INTO selecao_has_jogo VALUES (1 , 2);
INSERT INTO selecao_has_jogo VALUES (1 , 4);

INSERT INTO selecao_has_jogo VALUES (3 , 1);
INSERT INTO selecao_has_jogo VALUES (3 , 2);

INSERT INTO selecao_has_jogo VALUES (4 , 3); 
INSERT INTO selecao_has_jogo VALUES (4 , 4);


INSERT INTO InformacoesSelecaoEmJogo VALUES ('2' , '1' , '0' , '0' , '17', '8' , '2' , '5' , '12' , '13' , '1' , '0' , '0' , '0' , '1');
INSERT INTO InformacoesSelecaoEmJogo VALUES ('2' , '7' , '0' , '0' , '15' , '11' , '0' , '5' , '13' , '12' , '0' , '0' , '0' , '0' , '3');

INSERT INTO InformacoesSelecaoEmJogo VALUES ('1' , '2' , '0' , '5' , '3' , '8' , '4' , '3' , '11' , '9' , '2' , '0' , '0' , '0' , '2');
INSERT INTO InformacoesSelecaoEmJogo VALUES ('1' , '4' , '0' , '5' , '11' , '6' , '4' , '3' , '9' , '11' , '1' , '0' , '0' , '0' , '4');

INSERT INTO InformacoesSelecaoEmJogo VALUES ('3' , '0' , '0' , '0' , '8' , '1' , '1' , '4' , '15' , '20' , '3' , '0' , '0' , '0' , '1');
INSERT INTO InformacoesSelecaoEmJogo VALUES ('3' , '3' , '0' , '0' , '6' , '4' , '2' , '1' , '20' , '15' , '2' , '0' , '0' , '0' , '2');

INSERT INTO InformacoesSelecaoEmJogo VALUES ('4' , '1' , '0' , '0' , '7' , '4' , '1' , '6' , '13' , '9' , '2' , '0' , '0' , '0' , '3');
INSERT INTO InformacoesSelecaoEmJogo VALUES ('4' , '0' , '0' , '0' , '6' , '0' , '2' , '3' , '9' , '13' , '2' , '0' , '0' , '0' , '4');
