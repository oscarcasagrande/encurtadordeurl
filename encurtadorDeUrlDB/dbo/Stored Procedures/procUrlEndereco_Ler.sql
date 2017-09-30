CREATE PROC [dbo].[procUrlEndereco_Ler]
	@endereco VARCHAR(1200)
AS
	SELECT
		endereco	,
		chave		,
		dataCriacao
	FROM
		url
	WHERE
		endereco = @endereco