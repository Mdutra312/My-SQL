use bdEstoque

--triggers--

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


--3) Criar um trigger que, quando for feita uma venda de um determinado produto, seja feito um Insert na tbSaidaProduto.

create trigger tgAtualizaSaida8 on tbItensVenda 
after insert
as
    declare @quantidadeProduto int, @idProduto int, @dataSaidaProduto datetime, @idVenda int
    set @idVenda = (select idVenda from inserted)
    set @quantidadeProduto = (select quantItensVenda from inserted)
    set @dataSaidaProduto = getdate()
    set @idProduto = (select idProduto from tbItensVenda where idVenda = @idVenda)
	insert into tbSaidaProduto4 (dataSaidaProduto, quantidadeSaidaProduto, idProduto)
    values (@dataSaidaProduto, @quantidadeProduto, @idProduto)


insert into tbItensVenda (idProduto,idVenda, quantItensVenda, subTotalItensVenda)
values (2, 5, 10, 27.00)

   
select * from tbSaidaProduto4



select * from tbItensVenda

select * from tbItensVenda