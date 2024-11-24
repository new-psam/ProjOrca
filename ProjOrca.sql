create database projOrca
go

use [projOrca]
go

create table [usuario](
	[idUsuario] UNIQUEIDENTIFIER NOT NULL,
	[nome] nvarchar(120) not null,
	[cpf] nvarchar(12) not null unique,
	[celular] nvarchar(15) not null unique,
	[username] nvarchar(30) not null unique,
	[senha] nvarchar(10) not null
	CONSTRAINT [pk_usuario] primary key([idUsuario])
)
go

select * from [usuario]
go

create table [Conta_Financeira](
	[idCFinanceiro] UNIQUEIDENTIFIER not null,
	[nickname] nvarchar(50) not null,
	[instituicao] nvarchar(50) not null,
	[numero] nvarchar(20),
	[tipo] char(3),
	[saldo] money,
	[id_usuario] uniqueidentifier not null,
	CONSTRAINT [pk_CFinanceira] primary key([idCFinanceiro]),
		CONSTRAINT [fk_CFinanceira_usuario] foreign key([id_usuario]) REFERENCES[usuario] ([idUsuario]),
)
go

/*
CONSTRAINT [PK_CareerItem] PRIMARY KEY ([CourseId], [CareerId]),
    CONSTRAINT [FK_CareerItem_Career] FOREIGN KEY ([CareerId]) REFERENCES[Career] ([Id]),
    CONSTRAINT [FK_CarrerItem_Course] FOREIGN KEY ([CourseId]) REFERENCES[Course] ([Id])

ALTER TABLE ALUNO
ADD CONSTRAINT CK_SEXO CHECK (SEXO IN('M', 'F'))
CHECK (UF IN('RJ', 'SP', 'MG')),
*/

ALTER TABLE [Conta_Financeira]
ADD CONSTRAINT [ck_tipo] CHECK(tipo IN('cco', 'inv', 'ccr', 'din'))
go

select * from Conta_Financeira
go