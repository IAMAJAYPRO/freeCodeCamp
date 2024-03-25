alter table properties rename column melting_point to melting_point_celsius;
alter table properties rename column weight to atomic_mass;
alter table properties rename column boiling_point to boiling_point_celsius;
alter table properties alter column melting_point_celsius set not null;
alter table properties alter column boiling_point_celsius set not null;
alter table elements add unique(symbol),add unique(name);
alter table elements alter column symbol set not null, alter column name set not null;
alter table properties add foreign key(atomic_number) references elements(atomic_number);
--
create table types (type_id serial primary key,
type varchar(30) not null
);
insert into types (type) select distinct type from properties;
alter table properties add column type_id int references types(type_id);
update properties set type_id=types.type_id from types where types.type=properties.type;
alter table properties alter column type_id set not null;
alter table properties drop column type;
--
UPDATE elements
SET symbol = CONCAT(UPPER(SUBSTRING(symbol, 1, 1)), SUBSTRING(symbol, 2));
--
INSERT INTO elements (atomic_number, symbol, name)
VALUES (9, 'F', 'Fluorine'),
       (10, 'Ne', 'Neon');
INSERT INTO properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id)
VALUES 
(9, 18.998, -220, -188.1, 3),
(10, 20.18, -248.6, -246.1, 3);
--
delete from properties where atomic_number=1000;
delete from elements where atomic_number=1000;
--
alter table properties alter column atomic_mass type float;

