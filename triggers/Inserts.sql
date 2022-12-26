use bdEstoque

insert into tbCliente(nomeCliente, cpfCliente, emailCliente, generoCliente, dtNascimentoCliente)
values('Gabriel', '11122233396', 'gabrielgtr@gmail.com', 'H', '29/04/2003')

insert into tbVenda2(dataVenda, valorTotalVenda, idCliente)
values('29/06/2004', 100, 2)



insert into tbFabricante(nomeFabricante)
values('P&G')


insert into tbFornecedor(nomeFornecedor, contatoFornecedor)
values('Fernandinho', '1197857034')

insert into tbProduto(descProduto, valorProduto, quantProduto, idFabricante, idFornecedor)
values('Smart TV', 1000, 1, 1, 1)


INSERT INTO tbEntradaProduto(idProduto,quantidadeEntradaProduto) VALUES(1,160)

INSERT INTO tbItensVenda(quantItensVenda,subTotalItensVenda,idVenda,idProduto) VALUES(100,2000,5,2)


select * from tbVenda2


select * from tbSaidaProduto4
