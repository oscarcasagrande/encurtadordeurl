CREATE PROC [dbo].[procUrl_ler]
	@chave	CHAR(4)
AS
	SELECT
		chave		,
		endereco	,
		dataCriacao
	FROM
		url
	WHERE
		chave	=	@chave