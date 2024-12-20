/****** Script do comando SelectTopNRows de SSMS  ******/
SELECT TOP 1000 [idCategoria]
      ,[nome]
  FROM [projOrca].[dbo].[categoria]
GO

USE projOrca
GO

INSERT INTO [categoria] VALUES(NEWID(), 'MORADIA')
INSERT INTO [categoria] VALUES(NEWID(), 'SAÚDE')
INSERT INTO [categoria] VALUES(NEWID(), 'EDUCAÇÃO')
INSERT INTO [categoria] VALUES(NEWID(), 'LAZER')
INSERT INTO [categoria] VALUES(NEWID(), 'VESTUÁRIO')
INSERT INTO [categoria] VALUES(NEWID(), 'PESSOAIS')
INSERT INTO [categoria] VALUES(NEWID(), 'IMPOSTO E TAXAS')
INSERT INTO [categoria] VALUES(NEWID(), 'DIVIDAS')
GO


go

INSERT INTO [subcategoria] VALUES(NEWID(), 'VIAGEM', (SELECT [idcategoria] FROM [categoria]
where [nome] = 'LAZER'))
GO


SELECT * FROM [subcategoria]
GO

/* DROP PROC INSERT_SUBCATEGORIA
GO */

CREATE PROC insert_subcategoria @nome NVARCHAR(70), @nome_categoria NVARCHAR(50) 
AS
	INSERT INTO [subcategoria] 
		VALUES(NEWID(), @nome, 
				(SELECT [idcategoria] 
				FROM [categoria]
				where [nome] = @nome_categoria))
GO


EXEC insert_subcategoria 'roupas', 'VESTUÁRIO'
go

SELECT * FROM subcategoria

SELECT * FROM transacao

SELECT * FROM Conta_Financeira

SELECT * FROM usuario

insert into Conta_Financeira values(NEWID(), 'bb', 'Banco do Brasil', '01452-9', 'cco', 0,
(select [idusuario] from [usuario] where [nome] = 'marcelino'))
