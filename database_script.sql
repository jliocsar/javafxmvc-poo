DROP DATABASE IF EXISTS javafxmvc;
CREATE DATABASE IF NOT EXISTS javafxmvc;
USE javafxmvc;

CREATE TABLE categorias(
   cdCategoria int NOT NULL auto_increment,
   descricao  varchar(50) NOT NULL,
   CONSTRAINT pk_categorias
      PRIMARY KEY(cdCategoria)
);

CREATE TABLE produtos(
   cdProduto int NOT NULL auto_increment,
   nome varchar(50) NOT NULL,
   preco float     NOT NULL,
   quantidade int     NOT NULL,
   cdCategoria int  NOT NULL ,
   CONSTRAINT pk_produtos
      PRIMARY KEY(cdProduto),
   CONSTRAINT fk_produtos_categorias
      FOREIGN KEY(cdCategoria)
      REFERENCES categorias(cdCategoria)
);

CREATE TABLE clientes(
   cdCliente int NOT NULL auto_increment,
   nome varchar(50) NOT NULL,
   cpf varchar(50) NOT NULL,
   telefone varchar(50) NOT NULL,
   CONSTRAINT pk_clientes
      PRIMARY KEY(cdCliente)
);

CREATE TABLE vendas(
   cdVenda int NOT NULL auto_increment,
   data date NOT NULL,
   valor float NOT NULL,
   pago boolean NOT NULL,
   cdCliente int,
   CONSTRAINT pk_vendas
      PRIMARY KEY(cdVenda),
   CONSTRAINT fk_vendas_clientes
      FOREIGN KEY(cdCliente)
      REFERENCES clientes(cdCliente)
);

CREATE TABLE itensdevenda(
   cdItemDeVenda int NOT NULL auto_increment,
   quantidade int NOT NULL,
   valor float NOT NULL,
   cdProduto int,
   cdVenda int,
   CONSTRAINT pk_itensdevenda
      PRIMARY KEY(cdItemDeVenda),
   CONSTRAINT fk_itensdevenda_produtos
      FOREIGN KEY(cdProduto)
      REFERENCES produtos(cdProduto),
   CONSTRAINT fk_itensdevenda_vendas
      FOREIGN KEY(cdVenda)
      REFERENCES vendas(cdVenda)
);

INSERT INTO clientes(nome, cpf, telefone) VALUES('Agostinho Carrara','111.111.111-11','(11) 1111-1111');
INSERT INTO clientes(nome, cpf, telefone) VALUES('Bebel'  ,'222.222.222-22','(22) 2222-2222');
INSERT INTO clientes(nome, cpf, telefone) VALUES('Jacquin' ,'333.333.333-33','(33) 3333-3333');
INSERT INTO clientes(nome, cpf, telefone) VALUES('Reckful' ,'444.444.444-44','(44) 4444-4444');
INSERT INTO clientes(nome, cpf, telefone) VALUES('Beiçola' ,'555.555.555-55','(55) 5555-5555');

INSERT INTO categorias(descricao) VALUES('Tecnologia');
INSERT INTO categorias(descricao) VALUES('Moda');
INSERT INTO categorias(descricao) VALUES('Saúde');

INSERT INTO produtos(nome, preco, quantidade, cdCategoria) VALUES('Notebook Dell', '3500.00', '2', '1');
INSERT INTO produtos(nome, preco, quantidade, cdCategoria) VALUES('TV 52 Samsung', '6000.00', '12', '1');
INSERT INTO produtos(nome, preco, quantidade, cdCategoria) VALUES('Calça Jeans preta', '50.00', '20', '2');
INSERT INTO produtos(nome, preco, quantidade, cdCategoria) VALUES('Creme Dental Sorriso', '10.00', '40', '3');

INSERT INTO vendas(data, valor, pago, cdCliente) VALUES('2020/05/20', '5000.00', false, '1');
INSERT INTO vendas(data, valor, pago, cdCliente) VALUES('2020/06/06', '10000.00' , true, '2');
INSERT INTO vendas(data, valor, pago, cdCliente) VALUES('2020/02/03', '500.00' , true, '3');

INSERT INTO itensdevenda(quantidade, valor, cdProduto, cdVenda) VALUES('5', '1000.00', '1', '1');
INSERT INTO itensdevenda(quantidade, valor, cdProduto, cdVenda) VALUES('10', '1000.00' , '3', '2');
INSERT INTO itensdevenda(quantidade, valor, cdProduto, cdVenda) VALUES('10', '50.00' , '4', '3');
