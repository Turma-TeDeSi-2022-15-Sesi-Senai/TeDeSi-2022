CREATE DATABASE TeDeSiFIFA;
USE TeDeSiFIFA;
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



INSERT INTO Selecao VAlUES (1 , 'Brasil', 'Brasil');
INSERT INTO Selecao VAlUES (2 , 'Portugal', 'Portugal');
INSERT INTO Selecao VAlUES (3 , 'Alemanha', 'Alemanha');
INSERT INTO Selecao VAlUES (4 , 'Uruguai', 'Uruguai');




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




INSERT INTO Jogador VAlUES(null,2,'Rui Patrício','1');
INSERT INTO Jogador VAlUES(null,2,'Nélson Semedo','2');
INSERT INTO Jogador VAlUES(null,2,'Pepe','3');
INSERT INTO Jogador VAlUES(null,2,'Rúben Dias','4');
INSERT INTO Jogador VAlUES(null,2,'Raphael Guerreiro','5');
INSERT INTO Jogador VAlUES(null,2,'José Fonte','6');
INSERT INTO Jogador VAlUES(null,2,'Cristiano Ronaldo','7');
INSERT INTO Jogador VAlUES(null,2,'João Moutinho','8');
INSERT INTO Jogador VAlUES(null,2,'André Silva','9');
INSERT INTO Jogador VAlUES(null,2,'Bernardo Silva','10');
INSERT INTO Jogador VAlUES(null,2,'Bruno Fernandes','11');
INSERT INTO Jogador VAlUES(null,2,'Anthony Lopes','12');
INSERT INTO Jogador VAlUES(null,2,'Danilo','13');
INSERT INTO Jogador VAlUES(null,2,'William Carvalho','14');
INSERT INTO Jogador VAlUES(null,2,'Rafa Silva','15');
INSERT INTO Jogador VAlUES(null,2,'Renato Sanches','16');
INSERT INTO Jogador VAlUES(null,2,'Gonçalo Guedes','17');
INSERT INTO Jogador VAlUES(null,2,'Rúben Neves','18');
INSERT INTO Jogador VAlUES(null,2,'Pedro Gonçalves','19');
INSERT INTO Jogador VAlUES(null,2,'João Cancelo','20');
INSERT INTO Jogador VAlUES(null,2,'Diogo Jota','21');
INSERT INTO Jogador VAlUES(null,2,'Rui Silva','22');
INSERT INTO Jogador VAlUES(null,2,'João Félix','23');
INSERT INTO Jogador VAlUES(null,2,'Sérgio Oliveira','24');
INSERT INTO Jogador VAlUES(null,2,'Nuno Mendes','25');
INSERT INTO Jogador VAlUES(null,2,'João Palhinha','25');





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





INSERT INTO Jogador VAlUES(null,4,'Fernando Muslera','1');
INSERT INTO Jogador VAlUES(null,4,'Sergio Rochet','2');
INSERT INTO Jogador VAlUES(null,4,'Sebastian Sosa','3');
INSERT INTO Jogador VAlUES(null,4,'Ronald Araújo','4');
INSERT INTO Jogador VAlUES(null,4,'Agustín Rogel','5');
INSERT INTO Jogador VAlUES(null,4,'Sebastián Cáceres','6');
INSERT INTO Jogador VAlUES(null,4,'Leandro Cabrera','7');
INSERT INTO Jogador VAlUES(null,4,'Martín Cáceres','8');
INSERT INTO Jogador VAlUES(null,4,'Mathias Olivera','9');
INSERT INTO Jogador VAlUES(null,4,'Matías Viña','10');
INSERT INTO Jogador VAlUES(null,4,'Guillermo Varela','11');
INSERT INTO Jogador VAlUES(null,4,'Damián Suárez','12');
INSERT INTO Jogador VAlUES(null,4,'Lucas Torreira','13');
INSERT INTO Jogador VAlUES(null,4,'Manuel Ugarte','14');
INSERT INTO Jogador VAlUES(null,4,'Federico Valverde','15');
INSERT INTO Jogador VAlUES(null,4,'Rodrigo Bentancur','16');
INSERT INTO Jogador VAlUES(null,4,'Nicolás De la Cruz','17');
INSERT INTO Jogador VAlUES(null,4,'Matías Vecino','18');
INSERT INTO Jogador VAlUES(null,4,'Giorgian de Arrascaeta','19');
INSERT INTO Jogador VAlUES(null,4,'Diego Rossi','20');
INSERT INTO Jogador VAlUES(null,4,'Agustín Canobbio','21');
INSERT INTO Jogador VAlUES(null,4,'Facundo Pellistri','22');
INSERT INTO Jogador VAlUES(null,4,'Brian Ocampo','23');
INSERT INTO Jogador VAlUES(null,4,'Luis Suárez','24');
INSERT INTO Jogador VAlUES(null,4,'Darwin Núñez','25');
INSERT INTO Jogador VAlUES(null,4,'Martín Satriano','26');
INSERT INTO Jogador VAlUES(null,4,'Sergio Rocket','27');
INSERT INTO Jogador VAlUES(null,4,'Sebastián Sosa','28');




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
INSERT INTO selecao_has_jogo VALUES (4 , 1);
INSERT INTO selecao_has_jogo VALUES (1 , 2);
INSERT INTO selecao_has_jogo VALUES (3 , 2);
INSERT INTO selecao_has_jogo VALUES (1 , 3);
INSERT INTO selecao_has_jogo VALUES (3 , 3);
INSERT INTO selecao_has_jogo VALUES (2 , 4);
INSERT INTO selecao_has_jogo VALUES (4 , 4);