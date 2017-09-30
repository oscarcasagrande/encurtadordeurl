CREATE PROC [dbo].[procAcesso_criar]
@chave	CHAR(4)		,
@ip		VARCHAR(16)
AS
INSERT INTO 
	acesso
	(
		chave	,
		ip
	)
VALUES
	(
		@chave	,
		@ip
	)