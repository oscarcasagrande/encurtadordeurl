﻿/*
Deployment script for encurtadorDeUrlDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "encurtadorDeUrlDB"
:setvar DefaultFilePrefix "encurtadorDeUrlDB"
:setvar DefaultDataPath "C:\Users\oscar.l.casagrande\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"
:setvar DefaultLogPath "C:\Users\oscar.l.casagrande\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367)) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key 6afdedaf-bb26-483d-8995-69ffa85f3c98 is skipped, element [dbo].[acessoConsolidadoTotal].[Id] (SqlSimpleColumn) will not be renamed to chave';


GO
PRINT N'Creating [dbo].[acesso]...';


GO
CREATE TABLE [dbo].[acesso] (
    [chave]       CHAR (4)     NOT NULL,
    [ip]          VARCHAR (16) NOT NULL,
    [dataCriacao] DATETIME     NOT NULL
) ON [PRIMARY];


GO
PRINT N'Creating [dbo].[acessoConsolidadoMensal]...';


GO
CREATE TABLE [dbo].[acessoConsolidadoMensal] (
    [chave]      CHAR (4) NOT NULL,
    [quantidade] INT      NOT NULL,
    [mes]        CHAR (2) NOT NULL,
    [ano]        CHAR (4) NOT NULL
) ON [PRIMARY];


GO
PRINT N'Creating [dbo].[url]...';


GO
CREATE TABLE [dbo].[url] (
    [chave]       CHAR (4)       NULL,
    [endereco]    VARCHAR (1200) NOT NULL,
    [dataCriacao] DATETIME       NOT NULL,
    [ip]          VARCHAR (16)   NOT NULL
) ON [PRIMARY];


GO
PRINT N'Creating [dbo].[DF_acesso_dataCriacao]...';


GO
ALTER TABLE [dbo].[acesso]
    ADD CONSTRAINT [DF_acesso_dataCriacao] DEFAULT (getdate()) FOR [dataCriacao];


GO
PRINT N'Creating [dbo].[DF_url_dataCriacao]...';


GO
ALTER TABLE [dbo].[url]
    ADD CONSTRAINT [DF_url_dataCriacao] DEFAULT (getdate()) FOR [dataCriacao];


GO
PRINT N'Creating [dbo].[procAcesso_criar]...';


GO
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
GO
PRINT N'Creating [dbo].[procAcessoConsolidadoMensal_Criar]...';


GO
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
GO
PRINT N'Creating [dbo].[procAcessoConsolidadoTotal_Criar]...';


GO
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
GO
PRINT N'Creating [dbo].[procUrl_criar]...';


GO
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
GO
PRINT N'Creating [dbo].[procUrl_ler]...';


GO
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
GO
PRINT N'Creating [dbo].[procUrlEndereco_Ler]...';


GO
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
GO
PRINT N'Creating [dbo].[procUrlUltima_ler]...';


GO
CREATE PROC [dbo].[procUrlUltima_ler]
AS
	SELECT TOP 1
		chave
	FROM
		url
	ORDER BY
		dataCriacao DESC,
		chave		DESC
GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6afdedaf-bb26-483d-8995-69ffa85f3c98')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6afdedaf-bb26-483d-8995-69ffa85f3c98')

GO

GO
PRINT N'Update complete.';


GO