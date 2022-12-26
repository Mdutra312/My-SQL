CREATE DATABASE bdEstoque
GO

USE bdEstoque

CREATE TABLE tbFabricante(
	idFabricante INT PRIMARY KEY IDENTITY(1,1)
	,nomeFabricante VARCHAR(60) NOT NULL
	)

CREATE TABLE tbFornecedor(
	idFornecedor INT PRIMARY KEY IDENTITY(1,1)
	,nomeFornecedor VARCHAR(60) NOT NULL
	,contatoFornecedor VARCHAR(60) NOT NULL
	)
	
CREATE TABLE tbCliente(
	idCliente INT PRIMARY KEY IDENTITY(1,1)
	,nomeCliente VARCHAR(60) NOT NULL
	,cpfCliente CHAR(11) NOT NULL
	,emailCliente VARCHAR(60) NOT NULL
	,generoCliente CHAR(1) NOT NULL
	,dtNascimentoCliente SMALLDATETIME NOT NULL
	)
	
CREATE TABLE tbVenda(
	idVenda INT PRIMARY KEY IDENTITY(1,1)
	,dataVenda SMALLDATETIME NOT NULL
	,valorTotalVenda MONEY NOT NULL
	,idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)
	)

CREATE TABLE tbProduto(
	idProduto INT PRIMARY KEY IDENTITY(1,1)
	,descProduto VARCHAR(60) NOT NULL
	,valorProduto MONEY NOT NULL
	,quantProduto INT NOT NULL
	,idFabricante INT FOREIGN KEY REFERENCES tbFabricante(idFabricante)
	,idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(idFornecedor)
	)

CREATE TABLE tbItensVenda(
	idItensVenda INT PRIMARY KEY IDENTITY(1,1)
	,quantItensVenda INT NOT NULL
	,subTotalItensVenda MONEY NOT NULL
	,idVenda INT FOREIGN KEY REFERENCES tbVenda(idVenda)
	,idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto)
	)

CREATE TABLE tbEntradaProduto(
	idEntradaProduto INT PRIMARY KEY IDENTITY(1,1)
	,dataEntradaProduto DATETIME
	,idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto)
	,quantidadeEntradaProduto INT
)

CREATE TABLE tbSaidaProduto(
	idSaidaProduto INT PRIMARY KEY IDENTITY(1,1)
	,descricaoProduto VARCHAR(80)
	,valorProduto MONEY
	,quantidadeProduto INT
	,idFabricante INT FOREIGN KEY REFERENCES tbFabricante(idFabricante)
	,idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(idFornecedor)
)

select * from tbSaidaProduto