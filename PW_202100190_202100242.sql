DROP DATABASE IF EXISTS proj_pw_202100190_202100242;
create database if not exists proj_pw_202100190_202100242;
use proj_pw_202100190_202100242;

create table IF NOT EXISTS tipo_utilizador(
	tipo_utilizador varchar(20) PRIMARY KEY NOT NULL
);

create table IF NOT EXISTS utilizador(
	id int auto_increment primary key,
    email varchar(150) UNIQUE NOT NULL,
	nome varchar(50) NOT NULL,
    pass varchar(100) NOT NULL,
    tipo_utilizador varchar(20),
    approved boolean NOT NULL,
	CONSTRAINT FK_tipoUtilizadorAdmin FOREIGN KEY (tipo_utilizador)
	REFERENCES tipo_utilizador(tipo_utilizador) ON DELETE CASCADE ON UPDATE CASCADE
);

create table IF NOT EXISTS profissional(
	email varchar(150) UNIQUE NOT NULL,
    nome varchar(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero varchar(20) NOT NULL,
    headline varchar(100) default "",
    descricao varchar(255) default "",
    localidade varchar(255) default "",
	visualizacao_empresas boolean default 0,
	CONSTRAINT FK_email_utilizadorProfissional FOREIGN KEY (email)
	REFERENCES utilizador(email) ON DELETE CASCADE ON UPDATE CASCADE
);

create table IF NOT EXISTS empresa(
	email varchar(150) UNIQUE NOT NULL,
    nome varchar(255) NOT NULL,
    descricao varchar(255) default "",
    site varchar(2083) default "",
	CONSTRAINT FK_email_utilizadorEmpresa FOREIGN KEY (email)
	REFERENCES utilizador(email) ON DELETE CASCADE ON UPDATE CASCADE
);

create table IF NOT EXISTS experiencia_trabalho(
	id int PRIMARY KEY AUTO_INCREMENT,
	email_profissional varchar(150) NOT NULL,
    nome_empresa varchar(150) NOT NULL,
    descricao varchar(255) default "",
    regime varchar(50) NOT NULL,
    localizacao varchar(50) NOT NULL,
    tipo_localizacao varchar(50) NOT NULL, /*hibrido, on-site, remoto*/
    trabalho_atual boolean NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    cargo varchar(255) NOT NULL,
	CONSTRAINT FK_empresaEmailUtilizador FOREIGN KEY(email_profissional)
    REFERENCES profissional(email) ON DELETE CASCADE ON UPDATE CASCADE
);

create table IF NOT EXISTS amigo(
	email_utilizador varchar(150),
    email_amigo varchar(150),
    CONSTRAINT FK_email1 FOREIGN KEY(email_utilizador)
    REFERENCES profissional(email) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_email2 FOREIGN KEY(email_amigo)
    REFERENCES profissional(email) ON DELETE CASCADE ON UPDATE CASCADE
);

create table IF NOT EXISTS pedido_amizade(
	id_origem int NOT NULL,
    id_destino int NOT NULL,
    aprovado boolean NOT NULL,
    CONSTRAINT FK_origem FOREIGN KEY(id_origem)
    REFERENCES utilizador(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_destino FOREIGN KEY(id_destino)
    REFERENCES utilizador(id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table IF NOT EXISTS educacao(
	id int PRIMARY KEY AUTO_INCREMENT,
    email_profissional varchar(150) NOT NULL,
    descricao varchar(255) default "",
    atividades varchar(255) default "",
    media decimal,
    atual boolean NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    nome_curso varchar(255) NOT NULL,
    tipo_curso varchar(255) NOT NULL,
	estabelecimento_ensino varchar(255) NOT NULL,
	CONSTRAINT FK_profissionalFormacaoEmail FOREIGN KEY(email_profissional)
    REFERENCES profissional(email) ON DELETE CASCADE ON UPDATE CASCADE
);

insert into tipo_utilizador(tipo_utilizador)
values('Profissional');

insert into tipo_utilizador(tipo_utilizador)
values('Admin');

insert into tipo_utilizador(tipo_utilizador)
values('Empresa');


insert into utilizador(email, nome, pass, tipo_utilizador, approved) values('microsoft@gmail.com', 'Microsoft', '12345678','Empresa', '0');
insert into utilizador(email, nome, pass, tipo_utilizador, approved) values('teste@gmail.com', 'Microsoft1', '12345678','Empresa', '0');
insert into utilizador(email, nome, pass, tipo_utilizador, approved) values ('admin@folio.com','admin' , 'admin', 'Admin', '1');

## PROFESSIONAL 1 ##
INSERT INTO utilizador(email, nome, pass, tipo_utilizador, approved)
VALUES("lauracosta@gmail.com", "Laura Costa", "12345678", "Profissional", "1");
INSERT INTO profissional
VALUES("lauracosta@gmail.com", "Laura Costa", "2001-03-31", "Feminino", "Student", "I'm 21 years old currently studying Computer Science and Engineering at IPS.", "Setúbal, Portugal", "1");
INSERT INTO experiencia_trabalho(email_profissional, nome_empresa, descricao, regime, localizacao, tipo_localizacao, trabalho_atual, data_inicio, data_fim, cargo)
VALUES("lauracosta@gmail.com", "ATLAS", "Estagiária", "Estágio", "Lisboa, Portugal", "Remote", "0", "2020-04-01", "2020-07-15", "Web Development");
INSERT INTO educacao(email_profissional, atual, data_inicio, nome_curso, tipo_curso, estabelecimento_ensino)
VALUES("lauracosta@gmail.com", "1", "2021-10-06", "Engenharia Informática", "Licenciatura", "IPS");
INSERT INTO educacao(email_profissional, media, atual, data_inicio, data_fim, nome_curso, tipo_curso, estabelecimento_ensino)
VALUES("lauracosta@gmail.com", "14", "0", "2017-09-12", "2020-07-16", "Informática", "12º ano", "IDJV");
## PROFESSIONAL 2 ##
INSERT INTO utilizador(email, nome, pass, tipo_utilizador, approved)
VALUES("joanasilva@gmail.com", "Joana Silva", "12345678", "Profissional", "1");
INSERT INTO profissional
VALUES("joanasilva@gmail.com", "Joana Silva", "2002-07-28", "Feminino", "Student", "I'm 20 years old currently studying Computer Science and Engineering at IPS.", "Alverca, Portugal", "1");
INSERT INTO educacao(email_profissional, atual, data_inicio, nome_curso, tipo_curso, estabelecimento_ensino)
VALUES("joanasilva@gmail.com", "1", "2021-10-06", "Engenharia Informática", "Licenciatura", "IPS");
INSERT INTO educacao(email_profissional, atual, data_inicio,data_fim, nome_curso, tipo_curso, estabelecimento_ensino)
VALUES("joanasilva@gmail.com", "0", "2018-09-01","2021-06-06", "Informática", "12º ano", "Escola secundária gago coutinho");
## PROFESSIONAL 3 ##
INSERT INTO utilizador(email, nome, pass, tipo_utilizador, approved)
VALUES("albertino_maria@gmail.com", "Albertino Maria", "12345678", "Profissional", "1");
INSERT INTO profissional
VALUES("albertino_maria@gmail.com", "Albertino Maria", "1997-11-08", "Masculino", "Web Designer", "I work for Google.", "Utah, USA", "0");
INSERT INTO experiencia_trabalho(email_profissional, nome_empresa, descricao, regime, localizacao, tipo_localizacao, trabalho_atual, data_inicio, cargo)
VALUES("albertino_maria@gmail.com", "Google", "Computer Engineer", "Full-time", "Utah, USA", "Hybrid", "1", "2019-08-08", "Developer");
## PROFESSIONAL 4 ##
INSERT INTO utilizador(email, nome, pass, tipo_utilizador, approved)
VALUES("filipe_furtado@gmail.com", "Filipe Furtado", "furtadinho", "Profissional", "1");
INSERT INTO profissional
VALUES("filipe_furtado@gmail.com", "Filipe Furtado", "1981-08-22", "Masculino", "Computer Engineer", "I've been working at Caltech for 11 years.", "California, USA", "1");
INSERT INTO experiencia_trabalho(email_profissional, nome_empresa, descricao, regime, localizacao, tipo_localizacao, trabalho_atual, data_inicio, cargo)
VALUES("filipe_furtado@gmail.com", "Caltech", "Computer Engineer", "Full-time", "California, USA", "On-site", "1", "2014-02-16", "Programming");
## PROFESSIONAL 5 ##
INSERT INTO utilizador(email, nome, pass, tipo_utilizador, approved)
VALUES("jennifer@gmail.com", "Jennifer Gomez", "!#$%&", "Profissional", "1");
INSERT INTO profissional
VALUES("jennifer@gmail.com", "Jennifer Gomez", "1999-02-05", "Feminino", "Videogame Developer", "I'm starting my career as a videogame developer.", "Berlin, Germany", "0");

## EMPRESA 1 ##
INSERT INTO utilizador(email, nome, pass, tipo_utilizador, approved)
VALUES("google@gmail.com", "Google", "!#$%&", "Empresa", "1");
INSERT INTO empresa
VALUES("google@gmail.com", "Google", "Tech Company", "google.com");
## EMPRESA 2 ##
INSERT INTO utilizador(email, nome, pass, tipo_utilizador, approved)
VALUES("apple@hotmail.com", "Apple Inc.", "123", "Empresa", "0");
INSERT INTO empresa
VALUES("apple@hotmail.com", "Apple Inc.", "Tech Company", "apple.com");
## EMPRESA 3 ##
INSERT INTO utilizador(email, nome, pass, tipo_utilizador, approved)
VALUES("backbone@hotmail.com", "Backbone Co.", "123", "Empresa", "0");
INSERT INTO empresa
VALUES("backbone@hotmail.com", "Backbone Co.", "BackEnd Company", "backbone.com");
## EMPRESA 4 ##
INSERT INTO utilizador(email, nome, pass, tipo_utilizador, approved)
VALUES("oversea@gmail.com", "Oversea", "123", "Empresa", "0");
INSERT INTO empresa
VALUES("oversea@gmail.com", "Oversea", "Remote Work Company", "oversea.com");
## EMPRESA 5 ##
INSERT INTO utilizador(email, nome, pass, tipo_utilizador, approved)
VALUES("platinum@office.com", "Platinum Office", "123", "Empresa", "1");
INSERT INTO empresa
VALUES("platinum@office.com", "Platinum Office", "A tech company focused on quality", "platinum-office.com");