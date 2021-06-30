select * from [Product]
where [Name] like '%lá ngón%'
order by [Id]
offset 6 row
fetch first 6 rows only

-----------------------
select COUNT (*) from [Product]
where [Name] like '%lá ngón%'
------------
select * from [User]
order by [Email]
offset 0 row
fetch first 6 rows only

select * from [Role]