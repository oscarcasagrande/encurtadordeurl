CREATE TABLE [dbo].[acesso](
	[chave] [char](4) NOT NULL,
	[ip] [varchar](16) NOT NULL,
	[dataCriacao] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Default [DF_acesso_dataCriacao]    Script Date: 07/19/2011 12:25:31 ******/
ALTER TABLE [dbo].[acesso] ADD  CONSTRAINT [DF_acesso_dataCriacao]  DEFAULT (getdate()) FOR [dataCriacao]