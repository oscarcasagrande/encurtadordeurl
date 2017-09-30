CREATE PROC [dbo].[procAcessoConsolidadoMensal_Criar]
AS
	BEGIN TRAN tranAcessoConsolidadoMensal
		BEGIN
			DELETE acessoConsolidadoMensal
			
			INSERT INTO acessoConsolidadoMensal 
			SELECT
				chave								,
				COUNT(chave)		AS Quantidade	,
				MONTH(dataCriacao)	AS	Mes			,
				YEAR(dataCriacao)	AS	Ano
			FROM
				acesso	WITH(NOLOCK)
			GROUP BY
				chave				,
				MONTH(dataCriacao)	,
				YEAR(dataCriacao)
				
		END
	IF @@ERROR = 0
		BEGIN
			COMMIT TRAN tranAcessoConsolidadoMensal
		END
	ELSE
		BEGIN
			ROLLBACK TRAN tranAcessoConsolidadoMensal
		END