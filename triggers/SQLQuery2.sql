--triggers--

USE bdEstoque

--1) Criar uma trigger que, ao ser feita uma venda (Insert na tabela tbItensVenda), 
--todos os produtos vendidos tenham sua quantidade atualizada na tabela tbProduto. ]
--Exemplo, se foi feita uma venda de 5 unidades do produto código 01, na tabela tbProduto a quantidade desse produto será a quantidade atual –5;

CREATE TRIGGER tgVendeProduto
	ON tbItensVenda
	AFTER INSERT
	AS
		BEGIN
			DECLARE
				@quantidadeItens INT
				,@idProduto INT

			SET @idProduto = (SELECT idProduto FROM INSERTED)
			SET @quantidadeItens = (SELECT quantItensVenda FROM INSERTED)

			UPDATE tbProduto
				SET quantProduto = quantProduto - @quantidadeItens
				WHERE idProduto = @idProduto
		END
GO

INSERT INTO tbItensVenda(quantItensVenda,subTotalItensVenda,idVenda,idProduto) VALUES(100,2000,1,10)


--2)Criar um trigger que, quando for inserida uma nova entrada de produtos na tbEntradaProduto, 
--a quantidade desse produto seja atualizada e aumentada na tabela tbProduto;

CREATE TRIGGER tgInsereProduto
	ON tbEntradaProduto
	AFTER INSERT
	AS
		BEGIN
			DECLARE
				@idProduto INT
				,@quantProduto INT

			SET @idProduto = (SELECT idProduto FROM INSERTED)
			SET @quantProduto = (SELECT quantidadeEntradaProduto FROM INSERTED)

			UPDATE tbProduto	
				SET quantProduto = quantProduto + @quantProduto
				WHERE idProduto = @idProduto
		END

GO

INSERT INTO tbEntradaProduto(idProduto,quantidadeEntradaProduto) VALUES(8,160)



--Criar um trigger que, quando for feita uma venda de um determinado produto, seja feito um Insert na tbSaidaProduto.


CREATE TRIGGER tgVendaProduto
	On tbSaidaProduto
	AFTER INSERT
	tbVenda
as 
	declare @quantidadeItensVenda int
	
	set @quantidadeItensVenda = (select @quantidadeItensVenda from inserted)

	

	





	
INSERT INTO tbItensVenda(descricaoProduto,subTotalItensVenda,idVenda,idProduto) VALUES(100,2000,1,10)


select * from tbVenda

select * from tbProduto

select * from tbSaidaProduto

