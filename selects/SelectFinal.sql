USE bdLivrariaBrasileira

--a) O total de livros que come�am com a letra P

SELECT 
	COUNT(idLivro) AS 'LIVROS QUE COME�AM COM A LETRA P'
FROM tbLivro
WHERE nomeLivro LIKE 'P%'

--b) O maior n�mero de p�ginas entre todos os livros

SELECT 
	nomeLivro AS 'LIVRO'
	,numPaginas AS 'QUANTIDADE DE P�GINAS'
FROM tbLivro 
WHERE numPaginas = 
	(

		SELECT MAX(numPaginas)
		FROM tbLivro

	)
GROUP BY tbLivro.nomeLivro, tbLivro.numPaginas

--c) O menor n�mero de p�ginas entre todos os livros

SELECT 
	nomeLivro AS 'LIVRO'
	,numPaginas AS 'QUANTIDADE DE P�GINAS'
FROM tbLivro 
WHERE numPaginas = 
	(

		SELECT MIN(numPaginas)
		FROM tbLivro

	)
GROUP BY tbLivro.nomeLivro, tbLivro.numPaginas

--d) A m�dia de p�ginas entre todos os livros

SELECT 
	AVG(numPaginas) AS 'M�DIA DE P�GINAS'
FROM tbLivro

--e) A soma do n�mero de p�ginas dos livros de editorac�digo01

SELECT
	tbEditora.idEditora,
	tbEditora.nomeEditora,
	ISNULL(SUM(numPaginas),0) AS 'SOMA N�MERO DE P�GINAS'
FROM tbEditora 
LEFT JOIN tbLivro ON tbLivro.idEditora = tbEditora.idEditora
WHERE tbEditora.idEditora = 1
GROUP BY tbEditora.nomeEditora,tbEditora.idEditora


--f) A soma dos n�meros de p�ginas dos livros que come�am com a letra A

SELECT
	SUM(numPaginas) AS 'SOMA DAS P�GINAS'
FROM tbLivro
WHERE nomeLivro LIKE 'A%'

--g) A m�dia dos n�meros de p�ginas dos livros que sejam do autorc�digo 03

SELECT
	tbAutor.idAutor AS 'ID'
	,tbAutor.nomeAutor AS 'NOME'
	,ISNULL(AVG(numPaginas),0) AS 'M�DIA DAS P�GINAS'
FROM tbAutor
LEFT JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor
WHERE tbAutor.idAutor = 3
GROUP BY tbAutor.idAutor, tbAutor.nomeAutor

--h) A quantidade de livros da editora de c�digo 04

SELECT
	tbEditora.idEditora AS 'ID'
	,nomeEditora AS 'EDITORA'
	,COUNT(idLivro) AS 'QUANTIDADE DE LIVROS'
FROM tbEditora
LEFT JOIN tbLivro ON tbLivro.idEditora = tbEditora.idEditora
WHERE tbEditora.idEditora = 4
GROUP BY tbEditora.idEditora, tbEditora.nomeEditora

--i) A m�dia do n�mero de p�ginas dos livros que tenham a palavra �estrela� em seu nome

SELECT 
	ISNULL(AVG(numPaginas),0) AS 'M�DIA DE P�GINAS'
FROM tbLivro WHERE nomeLivro LIKE 'estrela%'

--j) A quantidade de livros que tenham a palavra �poema� em seu nome

SELECT 
	ISNULL(COUNT(idLivro),0) AS 'QUANTIDADE DE LIVROS'
FROM tbLivro WHERE nomeLivro LIKE 'poema%'

--k) Aquantidade de livros agrupado pelo nome do g�nero

SELECT
	nomeGenero
	,COUNT(idLivro) AS 'QUANTIDADE DE LIVROS POR G�NERO'
FROM tbLivro
FULL JOIN tbGenero ON tbLivro.idGenero = tbGenero.idGenero
GROUP BY tbGenero.nomeGenero

--l) A soma das p�ginas agrupada pelo nome do autor

SELECT
	nomeAutor
	,ISNULL(SUM(numPaginas),0) AS 'SOMA DAS P�GINAS'
FROM tbLivro
RIGHT JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
GROUP BY tbAutor.nomeAutor

--m) A m�dia de p�ginas agrupada pelo nome do auto rem ordem alfab�tica (de A a Z)

SELECT
	nomeAutor AS 'AUTOR'
	,ISNULL(AVG(numPaginas),0) AS 'M�DIA DE P�GINAS'
FROM tbLivro
RIGHT JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
GROUP BY tbAutor.nomeAutor
ORDER BY tbAutor.nomeAutor
---------------------------------------------------------


--n) A quantidade de livros agrupada pelo nome da editora  em ordem alfab�tica inversa (de Z a A)


SELECT
sum(numPaginas) AS 'QUANTIDADE DE P�GINAS',
    nomeEditora
    FROM tbEditora inner join tbLivro on tbLivro.idEditora = tbEditora.idEditora
        
    where numPaginas between 200 and 500
    
GROUP BY tbEditora.nomeEditora
order by tbEditora.nomeEditora desc



---o) A  soma  de  p�ginas dos livros agrupados  pelo  nome  do autor  que  sejam  de  autores  cujo nome comece com a letra �C�

SELECT
sum(numPaginas) AS 'QUANTIDADE DE P�GINAS',
    nomeAutor
    FROM tbAutor inner join tbLivro on tbLivro.idAutor = tbAutor.idAutor
	where nomeAutor like 'C%'
GROUP BY tbAutor.nomeAutor


--p) A quantidade de livros agrupados pelo nome do autor, cujo nome do autor seja �Machado de Assis� ou �Cora Coralina�ou�Graciliano Ramos� ou �Clarice Lispector�

SELECT
sum(numPaginas) AS 'QUANTIDADE DE P�GINAS',
    nomeAutor
    FROM tbAutor inner join tbLivro on tbLivro.idAutor = tbAutor.idAutor
	where nomeAutor like 'Machado de Assis%'
	or
    nomeAutor like 'Cora Coralina%'
	or 
	nomeAutor like 'Graciliano Ramos%'
	or 
	nomeAutor like 'Clarice Lispector%'
GROUP BY tbAutor.nomeAutor


--q)  A  soma  das  p�ginas  dos  livros  agrupadas  pelo  nome  da  editora  cujo  n�mero  de  p�ginas esteja entre 200 e 500 (inclusive):  falta terminar


SELECT
sum(numPaginas) AS 'QUANTIDADE DE P�GINAS',
    nomeEditora
    FROM tbEditora inner join tbLivro on tbLivro.idEditora = tbEditora.idEditora
        
    where numPaginas between 200 and 500
    
GROUP BY tbEditora.nomeEditora


--r) O nome dos livros ao lado do nome das editoras e do nome dos autores
select nomeLivro, nomeEditora, nomeAutor from tbLivro inner join tbEditora on
tbLivro.idEditora = tbEditora.idEditora inner join tbAutor 
on tbLivro.idAutor = tbAutor.idAutor



--s) O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for �Cia das Letras�
select nomeLivro, nomeAutor from tbLivro inner join tbAutor on
tbLivro.idAutor = tbAutor.idAutor inner join tbEditora on tbLivro.idEditora = tbEditora.idEditora
where nomeEditora = 'Cia das Letras'


--t)  O nome dos  livros  ao  lado  dos  nomes dos  autores,  somente  dos  livros que n�o  forem do autor ��rico Ver�ssimo�
select nomeLivro, nomeAutor from tbLivro inner join tbAutor on
tbLivro.idAutor = tbAutor.idAutor
where nomeAutor != '�rico Ver�ssimo'


--u) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que n�o tem livros cadastrados


	select nomeAutor, (nomeLivro) from tbAutor full join
tbLivro on tbLivro.idAutor = tbAutor.idAutor



--v)  Os  nomes  dos  autores  ao  lado  dos  nomes  dos  livros,  inclusive  daqueles  que  n�o  tem autores cadastrados
select nomeAutor, nomeLivro from tbAutor right join
tbLivro on tbLivro.idAutor = tbLivro.idLivro



--w)  O  nome dos  autores  ao  lado  dos nomes  dos  livros,  indiferente  do  autor  ter  ou  n�o  livro publicado, e indiferente do livro pertencer a algum autor

select nomeLivro, nomeAutor from tbLivro right join tbAutor on
tbLivro.idAutor = tbAutor.idAutor




--x) A editora �tica ir� publicar todos os t�tulos dessa livraria. Criar um select que associe os nomes de todos os livros ao lado do nome da editora �tica.

select tbEditora.nomeEditora, tbLivro.nomeLivro
from tbEditora cross join tbLivro
where tbEditora.idEditora = 3

--y) Somente os nomes dos autores que n�o tem livros cadastrados
	
	select nomeAutor, (nomeLivro) from tbAutor full join
tbLivro on tbLivro.idAutor = tbAutor.idAutor
where nomeLivro is null

--z) Os nomes dos g�neros que n�o possuem nenhum livro cadastrado - 
select nomeGenero, (nomeLivro) from tbGenero full join
tbLivro on tbLivro.idGenero = tbGenero.idGenero
where nomeLivro is null









