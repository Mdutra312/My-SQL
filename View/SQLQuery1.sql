CREATE DATABASE bdBancoEtec

USE bdBancoEtec

GO

CREATE TABLE tbCorrentista(
	idCorrentista INT PRIMARY KEY IDENTITY(1,1),
	nomeCorrentista varchar(60),
	dataNascCorrentista date,
	cpfCorrentista char(14),
	rgCorrentista char(14)
)

CREATE TABLE tbContaPoupanca(
	idContaPoupanca INT PRIMARY KEY IDENTITY(1,1),
	numeroAgenciaContaPoupanca char(4),
	numeroContaPoupanca char (6),
	digitoContaPoupanca char(1),
	saldoContaPoupanca MONEY,
	dataAberturaContaPoupanca date,
	idCorrentista INT FOREIGN KEY REFERENCES tbCorrentista(idCorrentista)
)

CREATE TABLE tbContaCorrente(
	idContaCorrente INT PRIMARY KEY IDENTITY(1,1),
	numeroAgenciaContaCorrente char(4),
	numeroContaCorrente char(6),
	digitoContaCorrente char(2),
	senhaNumericaContaCorrente varchar(15),
	senhaAlfanumerica varchar(20),
	saldoContaCorrente MONEY,
	dataAberturaContaCorrente date,
	idCorrentista INT FOREIGN KEY REFERENCES tbCorrentista(idCorrentista)
)



------------------------------------------------------------------------

INSERT INTO tbCorrentista(nomeCorrentista,dataNascCorrentista,cpfCorrentista,rgCorrentista)
VALUES('Rogerio Ceni','1973/01/22','123.456.789-00','12.545.122-01')

INSERT INTO tbCorrentista(nomeCorrentista,dataNascCorrentista,cpfCorrentista,rgCorrentista)
VALUES('Raí Vieira de Oliveira','1965/05/15','232.322.321-99','18.332.232-10')

INSERT INTO tbCorrentista(nomeCorrentista,dataNascCorrentista,cpfCorrentista,rgCorrentista)
VALUES('Armelindo Donizetti','1965/10/10','222.333.232-00','12.433.233-00')

select * from tbCorrentista

--------------------------------------------------------------------------
INSERT INTO tbContaCorrente(numeroAgenciaContaCorrente,numeroContaCorrente,digitoContaCorrente,senhaNumericaContaCorrente,senhaAlfanumerica,saldoContaCorrente,dataAberturaContaCorrente,idCorrentista)
VALUES(1021,'123122','11','111111','6B3L3M',100000.00,'2017/10/10',1)

INSERT INTO tbContaCorrente(numeroAgenciaContaCorrente,numeroContaCorrente,digitoContaCorrente,senhaNumericaContaCorrente,senhaAlfanumerica,saldoContaCorrente,dataAberturaContaCorrente,idCorrentista)
VALUES(1022,'212121','12','12211','2x1SP',90000.00,'2014/12/12',2)

INSERT INTO tbContaCorrente(numeroAgenciaContaCorrente,numeroContaCorrente,digitoContaCorrente,senhaNumericaContaCorrente,senhaAlfanumerica,saldoContaCorrente,dataAberturaContaCorrente,idCorrentista)
VALUES(1021,'123121','11','123456','01MITO',1200000.00,'2017/05/10',1)

INSERT INTO tbContaCorrente(numeroAgenciaContaCorrente,numeroContaCorrente,digitoContaCorrente,senhaNumericaContaCorrente,senhaAlfanumerica,saldoContaCorrente,dataAberturaContaCorrente,idCorrentista)
VALUES(1021,'324544','10','839222','ZETT01',23498.90,'2015/05/10',3)

select * from tbContaCorrente

---------------------------------------------------------------------------

INSERT INTO tbContaPoupanca(numeroAgenciaContaPoupanca,numeroContaPoupanca,digitoContaPoupanca,saldoContaPoupanca,dataAberturaContaPoupanca,idCorrentista)
VALUES(1021,434433,4,2000000.00,'2017/06/10',1)

INSERT INTO tbContaPoupanca(numeroAgenciaContaPoupanca,numeroContaPoupanca,digitoContaPoupanca,saldoContaPoupanca,dataAberturaContaPoupanca,idCorrentista)
VALUES(1022,322222,5,4000000.00,'2017/05/15',2)

INSERT INTO tbContaPoupanca(numeroAgenciaContaPoupanca,numeroContaPoupanca,digitoContaPoupanca,saldoContaPoupanca,dataAberturaContaPoupanca,idCorrentista)
VALUES(1021,232222,6,220000.00,'2017/04/10',3)

select * from tbContaPoupanca



-- LIST VIEW A SEGUIR ----------------------	

--f)Criar uma view vwContaePoupanca que exiba o nome e cpf do correntista ao lado do saldo de conta corrente e do saldo de poupança

CREATE VIEW vwContaePoupanca as

	SELECT 
		nomeCorrentista AS 'Nome do Correntista'
		,cpfCorrentista
		,saldoContaCorrente
		,saldoContaPoupanca
		
	FROM tbCorrentista

	INNER JOIN tbContaCorrente
		ON tbContaCorrente.idCorrentista = tbCorrentista.idCorrentista
	INNER JOIN tbContaPoupanca
		ON tbContaPoupanca.idCorrentista = tbCorrentista.idCorrentista

--g)Criar uma view vwClienteProdutos que exiba o nome do correntista ao lado da quantidade de contas corrente que ele possui
			
CREATE VIEW vwClienteProdutos as SELECT
	nomeCorrentista
	,COUNT(idContaCorrente) AS 'QUANTIDADE DE CONTAS CORRENTE'
FROM tbCorrentista
inner JOIN tbContaCorrente ON tbContaCorrente.idCorrentista = tbCorrentista.idCorrentista

group by tbCorrentista.nomeCorrentista

--e)Criar uma view vwCorrentistaConta que exiba o nome dos correntistas,
--o numero da conta corrente e o saldo na conta corrente,
--apenas daqueles que possuam mais de R$500.000,00 na conta corrente. Utilizar essa view para exibir os dados ordenados por saldo da conta(do maior saldo para o menor saldo)


create View vwCorrentistaConta as -- CORRIGIR --

select nomeCorrentista
	   ,numeroContaCorrente
	   ,saldoContaCorrente
	   
	   from tbCorrentista inner join tbContaCorrente on tbContaCorrente.idCorrentista = tbCorrentista.idCorrentista

	   where saldoContaCorrente>500000
	   
	   order by tbContaCorrente.saldoContaCorrente desc


--d)Criar uma view vwExibeCorrentista que exiba todos os dados da conta corrente ao lado 
--do nome do correntista(exceto a senha numérica e alfanumérica),com a data de aberturada conta corrente no formato dd/mm/aaaa  e o saldo da poupança

create View vwExibeCorrentista as

select numeroAgenciaContaCorrente,
numeroContaCorrente,
digitoContaCorrente,
saldoContaCorrente,
saldoContaPoupanca,
Convert(VARCHAR(10), dataAberturaContaCorrente,103)dataAberturaContaCorrente,
nomeCorrentista

 from tbContaCorrente inner join tbCorrentista on tbContaCorrente.idCorrentista = tbCorrentista.idCorrentista
 inner join tbContaPoupanca on tbContaPoupanca.idCorrentista = tbCorrentista.idCorrentista
	