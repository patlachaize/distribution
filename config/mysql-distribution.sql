DROP DATABASE distribution;
CREATE DATABASE distribution;
create user if not exists 'adm'@'localhost' identified by 'adm'; 
grant all privileges on distribution.* to 'adm'@'localhost'; 

use distribution;
create table villes (
  vil_num integer not null,
  nom varchar(10),
  primary key (vil_num)
);
alter table villes add unique (nom);

create table camions (
  cmn_num integer not null,
  charge integer not null,
  charge_max integer not null,
  primary key (cmn_num)
);

create table produits (
  prd_num integer not null auto_increment,
  description varchar(20),
  poids integer not null,
  vil_num integer,
  cmn_num integer,
  primary key (prd_num)
);
alter table produits add foreign key (vil_num) references villes(vil_num);
alter table produits add foreign key (cmn_num) references camions(cmn_num);


insert into villes(vil_num,nom) values(1,'Yverdon');
insert into villes(vil_num,nom) values(2,'Fribourg');
insert into villes(vil_num,nom) values(3,'Vevey');
insert into villes(vil_num,nom) values(4,'Lausanne');
insert into villes(vil_num,nom) values(5,'Aubonne');
insert into villes(vil_num,nom) values(6,'Biere');

insert into produits(description,poids,vil_num)
values('Dalles 50x50',300,6);
insert into produits(description,poids,vil_num)
values('Poele',400,5);
insert into produits(description,poids,vil_num)
values('Sacs gravier',200,1);
insert into produits(description,poids,vil_num)
values('Parpaings',200,4);
insert into produits(description,poids,vil_num)
values('Truc lourd',500,2);

insert into camions (cmn_num, charge, charge_max) values (1,450,0);

select * from villes;
select * from produits;
select * from camions;

  