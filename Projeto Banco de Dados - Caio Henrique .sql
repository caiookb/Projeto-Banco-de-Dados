create database projetobanco;
use projetobanco;

/* Lógico_4: */

CREATE TABLE Cliente (
    IdCliente int PRIMARY KEY,
    CPF int (14),
    Nome varchar(100),
    fk_Veiculo_idVeiculo int,
    fk_Contato_NumeroCelular int,
    fk_Endereco_idEndereco int);

CREATE TABLE Mecanico (
    idMecanico int PRIMARY KEY,
    Nome varchar(100),
    CTPS varchar(30));

CREATE TABLE OS (
    idServico int PRIMARY KEY,
    idOs int,
    idVeiculo int,
    FK_Servico_idServico int);

CREATE TABLE Veiculo (
    Chassi varchar(100),
    Modelo varchar(100),
    Placa varchar(100),
    Cor varchar(100),
    Marca varchar(100),
    idVeiculo int PRIMARY KEY,
    fk_OS_idServico int);

CREATE TABLE Atendente (
    idAtendente int PRIMARY KEY,
    Nome varchar(100),
    CPF int (11));

CREATE TABLE Servico (
    idServico int PRIMARY KEY,
    idMecanico int,
    idPecas int,
    Valor double);

CREATE TABLE Pecas (
    idPecas int PRIMARY KEY,
    Nome varchar(100),
    Valor double);

CREATE TABLE Oficina (
    Nome varchar(100),
    idOficina int PRIMARY KEY,
    fk_Atendente_idAtendente int,
    fk_Cliente_IdCliente int,
    fk_Pecas_idPecas int,
    fk_Mecanico_idMecanico int);

CREATE TABLE Contato (
    Email varchar(100),
    NumeroCelular int(12) PRIMARY KEY);

CREATE TABLE Endereco (
    Rua varchar(100),
    Bairro varchar(100),
    CEP int(8),
    Complemento varchar(100),
    Numero int,
    idEndereco int PRIMARY KEY);

CREATE TABLE Executa (
    fk_Atendente_idAtendente int,
    fk_OS_idServico int);

CREATE TABLE Porta (
    fk_Pecas_idPecas int,
    fk_OS_idServico int);

CREATE TABLE Ha (
    fk_Mecanico_idMecanico int,
    fk_OS_idServico int);
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_2
    FOREIGN KEY (fk_Veiculo_idVeiculo)
    REFERENCES Veiculo (idVeiculo)
    ON DELETE RESTRICT;
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_3
    FOREIGN KEY (fk_Contato_NumeroCelular)
    REFERENCES Contato (NumeroCelular)
    ON DELETE RESTRICT;
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_4
    FOREIGN KEY (fk_Endereco_idEndereco)
    REFERENCES Endereco (idEndereco)
    ON DELETE RESTRICT;
 
ALTER TABLE OS ADD CONSTRAINT FK_OS_2
    FOREIGN KEY (FK_Servico_idServico)
    REFERENCES Servico (idServico)
    ON DELETE RESTRICT;
 
ALTER TABLE Veiculo ADD CONSTRAINT FK_Veiculo_2
    FOREIGN KEY (fk_OS_idServico)
    REFERENCES OS (idServico)
    ON DELETE RESTRICT;
 
ALTER TABLE Oficina ADD CONSTRAINT FK_Oficina_2
    FOREIGN KEY (fk_Atendente_idAtendente)
    REFERENCES Atendente (idAtendente)
    ON DELETE RESTRICT;
 
ALTER TABLE Oficina ADD CONSTRAINT FK_Oficina_3
    FOREIGN KEY (fk_Cliente_IdCliente)
    REFERENCES Cliente (IdCliente)
    ON DELETE RESTRICT;
 
ALTER TABLE Oficina ADD CONSTRAINT FK_Oficina_4
    FOREIGN KEY (fk_Pecas_idPecas)
    REFERENCES Pecas (idPecas)
    ON DELETE RESTRICT;
 
ALTER TABLE Oficina ADD CONSTRAINT FK_Oficina_5
    FOREIGN KEY (fk_Mecanico_idMecanico)
    REFERENCES Mecanico (idMecanico)
    ON DELETE RESTRICT;
 
ALTER TABLE Executa ADD CONSTRAINT FK_Executa_1
    FOREIGN KEY (fk_Atendente_idAtendente)
    REFERENCES Atendente (idAtendente)
    ON DELETE RESTRICT;
 
ALTER TABLE Executa ADD CONSTRAINT FK_Executa_2
    FOREIGN KEY (fk_OS_idServico)
    REFERENCES OS (idServico)
    ON DELETE RESTRICT;
 
ALTER TABLE Porta ADD CONSTRAINT FK_Porta_1
    FOREIGN KEY (fk_Pecas_idPecas)
    REFERENCES Pecas (idPecas)
    ON DELETE RESTRICT;
 
ALTER TABLE Porta ADD CONSTRAINT FK_Porta_2
    FOREIGN KEY (fk_OS_idServico)
    REFERENCES OS (idServico)
    ON DELETE RESTRICT;
 
ALTER TABLE Ha ADD CONSTRAINT FK_Ha_1
    FOREIGN KEY (fk_Mecanico_idMecanico)
    REFERENCES Mecanico (idMecanico)
    ON DELETE RESTRICT;
 
ALTER TABLE Ha ADD CONSTRAINT FK_Ha_2
    FOREIGN KEY (fk_OS_idServico)
    REFERENCES OS (idServico)
    ON DELETE RESTRICT;
    
    INSERT INTO atendente values(1, 'Luiz', 1234567890);
	UPDATE atendente SET nome="Luis", CPF= 111111111 WHERE idAtendente= 1;
	DELETE FROM atendente WHERE idAtendente= 1;
    select * from atendente;
    
	INSERT INTO mecanico (idMecanico, Nome, CTPS) VALUES (1, "Cláudio", 1234512345);
    UPDATE mecanico SET Nome="Márcio", CTPS= 132434 WHERE idMecanico= 1;
	DELETE FROM mecanico WHERE idMecanico= 1;
	select * from mecanico;

    
    INSERT INTO contato(Email, NumeroCelular) VALUES("caio@gmail.com", 819987564);
    UPDATE contato SET Email= "caio@gmail.com.br", NumeroCelular= 81548741 WHERE NumeroCelular= 819987564;
    DELETE FROM contato WHERE NumeroCelular= 819987564;
    select * from contato;
    
    INSERT INTO endereco (Rua, Bairro, CEP, Complemento, Numero, idEndereco) 
    VALUES ("Rua Ana", "Macaxeira", 53401040, "Casa", 45, 1);
    UPDATE endereco SET Rua= "Rua João", Bairro= "Casa Forte", CEP=55555555, Complemento= "AP201", Numero= 9 WHERE idEndereco = 1;
	DELETE FROM endereco WHERE idEndereco = 1;
	select * from endereco;    
    
	INSERT INTO servico (idServico, idMecanico, idPecas, Valor) VALUES (1, 1, 1, 1200);
    UPDATE servico SET Valor = 1700 WHERE idServico = 1;
    DELETE FROM servico WHERE idServico = 1;
    select * from servico;    
  
    INSERT INTO os(idServico, idOs, idVeiculo, FK_Servico_idServico) VALUES (1, 1, 1, 12);
    UPDATE os SET idServico= 2, idVeiculo= 2, FK_Servico_idServico =2 WHERE idOs = 1;
	DELETE FROM os WHERE idOs = 1;
    select * from os;  
    
	INSERT INTO veiculo(Chassi, Modelo, Placa, Cor, Marca, idVeiculo, fk_OS_idServico)
    VALUES ('14QWEt78', "Modell", "AAA1111", "Preto", "Marc", 1, 1);
    UPDATE veiculo SET Chassi= "15asdAF", Modelo= "VMM", Placa= "AAA2222", Cor= "Prata", Marca= "BGD", fk_OS_idServico= 2 WHERE idVeiculo = 1;
	DELETE FROM veiculo WHERE idVeiculo = 1;
	select * from veiculo;
    
	INSERT INTO pecas (idPecas, Nome, Valor) VALUES (1, "Ferramenta", 105);
    UPDATE pecas SET Nome= "Parafuso", Valor = 12 WHERE idPecas= 1;
	DELETE FROM pecas WHERE idPecas= 1;   
	select * from pecas;
    
    INSERT INTO cliente (IdCliente, CPF, Nome, fk_Veiculo_idVeiculo,fk_Contato_NumeroCelular, fk_Endereco_idEndereco) 
    VALUES (1 ,1234567890, 'Caio', 1, 819987564, 1);
    UPDATE cliente SET CPF= 22131232, Nome="Julia", fk_Veiculo_idVeiculo= 2, fk_Contato_NumeroCelular= 81548741, fk_Endereco_idEndereco= 2 
    WHERE idCliente = 1;
    DELETE FROM cliente WHERE idCliente = 1;
  	select * from cliente;
    
	INSERT INTO oficina (Nome, idOficina, fk_Atendente_idAtendente, fk_Cliente_IdCliente, fk_Pecas_idPecas, fk_Mecanico_idMecanico)
	VALUES("Oficida BD", 1, 1, 1, 1, 1);
    UPDATE oficina SET Nome= "Oficina Web", idOficina= 2, fk_Atendente_idAtendente= 2, fk_Cliente_IdCliente = 2, fk_Pecas_idPecas= 2, fk_Mecanico_idMecanico=2
    WHERE idOficina =1;
    DELETE FROM oficina WHERE idOficina =1;
	select * from oficina;
    
    INSERT INTO executa(fk_Atendente_idAtendente, fk_OS_idServico) VALUES (1 , 1);  
    UPDATE executa SET fk_Atendente_idAtendente= 2, fk_OS_idServico = 2 WHERE  fk_OS_idServico = 1 ;
	DELETE FROM executa where fk_OS_idServico = 1;
	select * from executa;
   
	INSERT INTO porta(fk_Pecas_idPecas,fk_OS_idServico) VALUES (1, 1);
    UPDATE porta SET fk_Pecas_idPecas= 2, fk_OS_idServico= 2 WHERE fk_OS_idServico = 1;
    DELETE FROM porta where fk_OS_idServico = 1;
	select * from porta;
    
    INSERT INTO ha(fk_Mecanico_idMecanico, fk_OS_idServico) VALUES (1, 1);  
	UPDATE ha SET fk_Mecanico_idMecanico= 2, fk_OS_idServico = 2 WHERE fk_OS_idServico = 1;
    DELETE FROM ha where fk_OS_idServico = 1;
	select * from ha;
   
	select cliente.idCliente as IDCliente, cliente.nome as Nome,
	cliente.fk_Veiculo_idVeiculo as IDVeiculo,
	os.idServico as IDServico, pecas.Nome as Peça, 
	os.FK_Servico_idServico as OS,
	servico.valor as Valor from cliente, os, pecas, servico;
	 
	select cliente.idCliente as IDCliente, cliente.nome as Nome,
	cliente.fk_Veiculo_idVeiculo as IDVeiculo,
	os.FK_Servico_idServico as OS,
	servico.valor as Valor from cliente, os, servico;
    
    select * from cliente inner join veiculo on veiculo.idVeiculo = cliente.fk_Veiculo_idVeiculo; 
	select * from servico left join os on servico.idServico = os.fk_Servico_idServico; 

    
    
