/****** Script do comando SelectTopNRows de SSMS  ******/
select * from usuario 
go

insert into [usuario]values(newid(), 'marcelino', '09878563839', '16997522013', 'papasam', '123')
go
insert into [usuario]values(newid(), 'polyanna', '18542621816', '16981009192', 'poly', '123')

--delete from usuario