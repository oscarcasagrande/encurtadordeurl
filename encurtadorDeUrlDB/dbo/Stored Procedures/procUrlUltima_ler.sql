CREATE PROC [dbo].[procUrlUltima_ler]
AS
	SELECT TOP 1
		chave
	FROM
		url
	ORDER BY
		dataCriacao DESC,
		chave		DESC