--testes das duas primeiras tabelas
insert into [usuario]values(newid(), 'marcelino', '09878563839', '16997522013', 'papasam', '123')
go
insert into [usuario]values(newid(), 'polyanna', '18542621816', '16981009192', 'poly', '123')

--testes tabelas [gasto_credito] e [categoria]

insert into [categoria] values(newid(), 'transporte')
insert into [categoria] values(newid(), 'alimenta��o')
insert into [categoria] values(newid(), 'sal�rio')
insert into [categoria] values(newid(), 'transporte') -- quest�o to unique testado ok


select * from [categoria]

insert into [gasto_credito] values(newid(), 'abastecimento', '1AEE85FB-B625-4CF0-A608-DF1EA2EB349C')
insert into [gasto_credito] values(newid(), 'uber', '1AEE85FB-B625-4CF0-A608-DF1EA2EB349C')
insert into [gasto_credito] values(newid(), 'cenour�o-quitanda', '912AA53F-B39B-468C-BE3D-67F960AEECEE')
insert into [gasto_credito] values(newid(), 'cenour�o-quitanda', '1AEE85FB-B625-4CF0-A608-DF1EA2EB349C')-- erro por repeti��o do nome

select * from [gasto_credito]
select * from [categoria]