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

alter table usuario
add constraint uc_usuario_cpf UNIQUE(CPF)
alter table usuario
add constraint uc_usuario_celular UNIQUE(celular)
alter table usuario
add constraint uc_usuario_username UNIQUE(username)
GO

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


ALTER TABLE [Conta_Financeira]
ADD CONSTRAINT [ck_tipo] CHECK(tipo IN('cco', 'inv', 'ccr', 'din'))
go

select * from Conta_Financeira
go

/* criação das 3 últimas tabelas */
use [projOrca]
go

create table [categoria](
	[idCategoria]	uniqueidentifier,
	[nome] nvarchar(50),
	CONSTRAINT [pk_categoria] primary key ([idCategoria])
)
go

ALTER TABLE [categoria]
ADD CONSTRAINT [uc_categoria_nome] unique([nome])
go

create table [gasto_credito](
	[idgasto_credito] uniqueidentifier,
	[nome] nvarchar(70) not null,
	[id_categoria] uniqueidentifier not null,
	CONSTRAINT [pk_gasto_credito] primary key([idgasto_credito]),
		CONSTRAINT [fk_gasto_credito_categoria] FOREIGN KEY ([id_categoria]) REFERENCES[categoria] ([idCategoria])
)
go

ALTER TABLE [gasto_credito]
ADD constraint [uc_gasto_credito] unique([nome])
go

/*
em caso de falha sempre dropa a tabela que tenha o foreign key primeiro
drop table [gasto_credito]
drop table [categoria]
*/