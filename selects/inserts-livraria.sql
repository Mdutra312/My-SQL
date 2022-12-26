USE bdLivrariaBrasileira

GO

--gêneros--
INSERT INTO tbGenero(nomeGenero)
VALUES('Ficção')

INSERT INTO tbGenero(nomeGenero)
VALUES('Romance')

INSERT INTO tbGenero(nomeGenero)
VALUES('Tragédia')

--editora--
INSERT INTO tbEditora(nomeEditora)
VALUES('Melhoramentos')

INSERT INTO tbEditora(nomeEditora)
VALUES('Globo')

INSERT INTO tbEditora(nomeEditora)
VALUES('Atica')

INSERT INTO tbEditora(nomeEditora)
VALUES('Companhia das Letras')

INSERT INTO tbEditora(nomeEditora)
VALUES('Abril')

--autor--

INSERT INTO tbAutor(nomeAutor)
VALUES('Chico Buarque')

INSERT INTO tbAutor(nomeAutor)
VALUES('Jorge Amado')

INSERT INTO tbAutor(nomeAutor)
VALUES('J.K. Rowling')

INSERT INTO tbAutor(nomeAutor)
VALUES('Wiliam Shakespeare')

INSERT INTO tbAutor(nomeAutor)
VALUES('Monteiro Lobato')

INSERT INTO tbAutor(nomeAutor)
VALUES('Cora Coralina')

INSERT INTO tbAutor(nomeAutor)
VALUES('Clarice Lispector')
----------------------------------------------

--livro--

INSERT INTO tbLivro(nomeLivro, numPaginas, idGenero, idEditora, idAutor)
VALUES('Budapeste',176,2,4,1)

INSERT INTO tbLivro(nomeLivro, numPaginas, idGenero, idEditora, idAutor)
VALUES('O Bicho-da-Seda',454,2,5,3)

INSERT INTO tbLivro(nomeLivro, numPaginas, idGenero, idEditora, idAutor)
VALUES('Gabriela, Cravo e Canela',214,1,2,2)

INSERT INTO tbLivro(nomeLivro, numPaginas, idGenero, idEditora, idAutor)
VALUES('Reinações de Narizinho',143,2,2,5)

INSERT INTO tbLivro(nomeLivro, numPaginas, idGenero, idEditora, idAutor)
VALUES('Romeu e Julieta',421,1,3,4)

INSERT INTO tbLivro(nomeLivro, numPaginas, idGenero, idEditora, idAutor)
VALUES('O Irmão Alemão',478,1,4,1)

INSERT INTO tbLivro(nomeLivro, numPaginas, idGenero, idEditora, idAutor)
VALUES('Terras do Sem-Fim',125,1,3,2)

INSERT INTO tbLivro(nomeLivro, numPaginas, idGenero, idEditora, idAutor)
VALUES('Animais Fantásticos e Onde Habitam',267,2,4,3)
