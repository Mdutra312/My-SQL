ALTER PROCEDURE spInsereAluno 
 @nome varchar(65), @dataN smalldatetime, @rgaluno char(12),
 @naturalidade varchar(30)
 as 
	begin 

	if exists(select idAluno from tbAluno where rgAluno like @rgaluno)
	begin 
		print('Aluno já cadastrado!')
	end 
	else 
	begin

		insert into tbAluno(nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno)
		values(@nome, @dataN, @rgaluno, @naturalidade)
		declare @codigo int
		set @codigo = (select max(idAluno) from tbAluno)
		print('Aluno '+@nome+' cadastrado com sucesso! com ID igual a '+convert(varchar(6), @codigo) )
	end
end



EXEC spInsereAluno 'Gilson','20/06/2004', '34.221.211-x', 'naturalidade'
