create database bd_exporta;
use bd_exporta;
create table departamento (
	id int primary key auto_increment not null,
	nome varchar(50),
    locali varchar(50),
    orcam decimal (10,2)
);

insert into departamento (nome,locali,orcam) values
("Giovana","SESI",10000),("Matarato","SENAI",17000),
("Elias","SHOPPING",20000),("Lucas E","CASAS-BAHIA",100000),
("Isabella","UBER",10000),("Guhneli","Festa",30000);

SHOW VARIABLES LIKE 'secure_file_priv';


select * from departamento
into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

SET SQL_SAFE_UPDATES=0;

delete from departamento; 

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
into table departamento
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

start transaction;

update departamento set orcam = orcam + 1000.00 where nome = "Guhneli";

update departamento set orcam = orcam + 1000.00 where nome = "Isabella";

commit;

start transaction;

update departamento set orcam = orcam - 5000.00 where nome = "Giovana";

update departamento set orcam = orcam - 3000.00 where nome = "Elias";

rollback;

start transaction;

update departamento set orcam = orcam + 7000.00 where nome = "Lucas E";

savepoint ajuste_parcial;

update departamento set orcam = orcam - 3000.00 where nome = "Gunheli";

rollback;

