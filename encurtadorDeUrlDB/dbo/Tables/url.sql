CREATE TABLE [dbo].[url](
	[chave] [char](4) NULL,
	[endereco] [varchar](1200) NOT NULL,
	[dataCriacao] [datetime] NOT NULL,
	[ip] [varchar](16) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Default [DF_url_dataCriacao]    Script Date: 07/19/2011 12:25:31 ******/
ALTER TABLE [dbo].[url] ADD  CONSTRAINT [DF_url_dataCriacao]  DEFAULT (getdate()) FOR [dataCriacao]