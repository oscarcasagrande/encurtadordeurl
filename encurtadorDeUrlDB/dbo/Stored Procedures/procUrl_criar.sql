CREATE PROC [dbo].[procUrl_criar]
	@chave		CHAR(4)		,
	@endereco	VARCHAR(1200)	,
	@ip		VARCHAR(16)
AS
INSERT INTO
	dbo.url
	(
		chave		,
		endereco	,
		ip
	)
VALUES
	(
		@chave		,
		@endereco	,
		@ip
	)