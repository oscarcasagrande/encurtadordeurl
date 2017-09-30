CREATE PROC [dbo].[procAcessoConsolidadoTotal_Criar]
AS
	BEGIN TRAN tranAcessoCosolidadoTotal
		BEGIN
			DELETE acessoConsolidadoTotal
			
			INSERT INTO acessoConsolidadoTotal 
			SELECT
				chave,
				COUNT(chave)	AS Quantidade
			FROM
				acesso	WITH(NOLOCK)
			GROUP BY
				chave
		END
	IF @@ERROR = 0
		BEGIN
			COMMIT TRAN tranAcessoCosolidadoTotal
		END
	ELSE
		BEGIN
			ROLLBACK TRAN tranAcessoCosolidadoTotal
		END