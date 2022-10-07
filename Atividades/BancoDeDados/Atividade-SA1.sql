--@block estadio
CREATE TABLE Estadio(
     id INT PRIMARY KEY AUTO_INCREMENT
);

--@block Torcedor
CREATE TABLE Torcedor(
     id INT PRIMARY KEY AUTO_INCREMENT,
     cpf VARCHAR(14),
     nome VARCHAR(45)
);

--@block Jogo
CREATE TABLE Jogo(
     id INT AUTO_INCREMENT,
     estadio_id INT NOT NULL,
     horario DATE,
     PRIMARY KEY (id),
     Foreign Key (estadio_id) REFERENCES Estadio(id)
);

--@block Arbitragem
CREATE TABLE Arbitragem(
     id INT AUTO_INCREMENT,
     jogo_id INT NOT NULL,
     pais VARCHAR(45),
     cpf VARCHAR(14),
     PRIMARY KEY (id),
     Foreign Key (jogo_id) REFERENCES Jogo(id)
);

--@block Resultado
CREATE TABLE Resultado(
     jogo_id INT NOT NULL,
     gols_time_1 INT,
     gols_time_2 INT,
     time_ganhador VARCHAR(45)
     Foreign Key (jogo_id) REFERENCES Jogo(id)
);

--@block Seleção
CREATE TABLE Selecao(
     id INT PRIMARY KEY AUTO_INCREMENT,
     nome VARCHAR(45),
     pais VARCHAR(45)
);

--@block Seleção tem Jogo
CREATE TABLE selecao_has_jogo(
     selecao_id INT NOT NULL,
     jogo_id INT NOT NULL,
     Foreign Key (selecao_id) REFERENCES Selecao(id),
     Foreign Key (jogo_id) REFERENCES Jogo(id)
);

--@block Reserva
CREATE TABLE Reserva(
     id INT AUTO_INCREMENT,
     torcedor_id INT NOT NULL,
     jogo_id INT NOT NULL,
     PRIMARY KEY (id),
     Foreign Key (torcedor_id) REFERENCES Torcedor(id),
     Foreign Key (jogo_id) REFERENCES Jogo(id)
);

--@block Jogador
CREATE TABLE Jogador(
     id INT AUTO_INCREMENT,
     selecao_id INT NOT NULL,
     nome VARCHAR(45),
     numero_camisa INT,
     Foreign Key (selecao_id) REFERENCES Selecao(id)
);

--@block cartões
CREATE TABLE Cartoes(
     jogador_id INT AUTO_INCREMENT,
     cartoes_amarelos INT,
     cartoes_vermelhos INT,
     Foreign Key (jogador_id) REFERENCES Jogador(id)
);

--@block substituicao
CREATE TABLE Substituicao(
     id INT AUTO_INCREMENT,
     selecao_id INT NOT NULL,
     PRIMARY KEY (id),
     Foreign Key (selecao_id) REFERENCES Selecao(id)
);

--@block Jogador tem Substituição
CREATE TABLE Jogador_has_Substituicao(
     jogador_id INT NOT NULL,
     substituicao_id INT NOT NULL,
     Foreign Key (jogador_id) REFERENCES Jogador(id)
     Foreign Key (substituicao_id) REFERENCES Substituicao(id)
);