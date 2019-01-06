1)

1.-
CREATE DATABASE Valdivia;
USE Valdivia;

CREATE TABLE PERSONA(pk_RUT VARCHAR(45) NOT NULL, 
               NOMBRE VARCHAR(45) NOT NULL, 
               EDAD SMALLINT UNSIGNED, 
               PRIMARY KEY (pk_RUT))ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE LUGAR_DE_INTERES(
        pk_Lugar int NOT NULL AUTO_INCREMENT, 
        Descripcion VARCHAR(45), 
        Categoria VARCHAR(45), 
        Latitud DECIMAL(6,3) NOT NULL, 
        Longitud DECIMAL(6,3) NOT NULL, 
        PRIMARY KEY (pk_Lugar) 
        )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE DESPLAZARSE(
    pk_RUT VARCHAR(45) NOT NULL, 
    fecha DATE NOT NULL, 
    Latitud DECIMAL(6,3) NOT NULL, 
    Longitud DECIMAL(6,3) NOT NULL, 
    FOREIGN KEY(pk_RUT) REFERENCES PERSONA(pk_RUT), 
    PRIMARY KEY(pk_RUT, fecha) 
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

2.-
INSERT INTO PERSONA (pk_RUT, NOMBRE, EDAD) VALUES ("19111111-2", "Juan", 20);
INSERT INTO PERSONA (pk_RUT, NOMBRE, EDAD) VALUES ("19111111-3", "Juan", 20);
INSERT INTO PERSONA (pk_RUT, NOMBRE, EDAD) VALUES ("19111111-4", "Juan", 20);
INSERT INTO PERSONA (pk_RUT, NOMBRE, EDAD) VALUES ("19111111-5", "Juan", 20);
INSERT INTO PERSONA (pk_RUT, NOMBRE, EDAD) VALUES ("19111111-6", "Juan", 20);


INSERT INTO LUGAR_DE_INTERES (pk_Lugar, Descripcion, Categoria, Latitud, Longitud) VALUES (NULL, "Descripcion", "Categoria", 10, 10);
INSERT INTO LUGAR_DE_INTERES (pk_Lugar, Descripcion, Categoria, Latitud, Longitud) VALUES (NULL, "Descripcion2", "Categoria2", 10, 10);
INSERT INTO LUGAR_DE_INTERES (pk_Lugar, Descripcion, Categoria, Latitud, Longitud) VALUES (NULL, "Descripcion3", "Categoria3", 10, 10);
INSERT INTO LUGAR_DE_INTERES (pk_Lugar, Descripcion, Categoria, Latitud, Longitud) VALUES (NULL, "Descripcion4", "Categoria4", 10, 10);
INSERT INTO LUGAR_DE_INTERES (pk_Lugar, Descripcion, Categoria, Latitud, Longitud) VALUES (NULL, "Descripcion5", "Categoria5", 10, 10);

INSERT INTO DESPLAZARSE (pk_RUT, fecha, Latitud, Longitud) VALUES ((SELECT pk_RUT from PERSONA where pk_RUT="19111111-2"), "2018-10-25", 10, 10);
INSERT INTO DESPLAZARSE (pk_RUT, fecha, Latitud, Longitud) VALUES ((SELECT pk_RUT from PERSONA where pk_RUT="19111111-3"), "2018-10-25", 10, 10);
INSERT INTO DESPLAZARSE (pk_RUT, fecha, Latitud, Longitud) VALUES ((SELECT pk_RUT from PERSONA where pk_RUT="19111111-4"), "2018-10-25", 10, 10);
INSERT INTO DESPLAZARSE (pk_RUT, fecha, Latitud, Longitud) VALUES ((SELECT pk_RUT from PERSONA where pk_RUT="19111111-5"), "2018-10-25", 10, 10);
INSERT INTO DESPLAZARSE (pk_RUT, fecha, Latitud, Longitud) VALUES ((SELECT pk_RUT from PERSONA where pk_RUT="19111111-6"), "2018-10-25", 10, 10);

select * from PERSONA;
select * from LUGAR_DE_INTERES;
select * from DESPLAZARSE;

3.-
Alguna aplicación que guarde información de personas y ubicaciones especiales en el cual tambien se guarde lugares en el cual las personas se hayan ubicado.

2)
1.- Es necesario para tener respaldos de la información guardada.

2.- 
mysqldump --databases Valdivia > my_databases.sql -u root -p;
El output de este comando son una serie de querys sql que reestablecerian las bases de datos respaldadas.
3.-
El formato csv consiste en un formato simple que es facil de interpretar por distintos tipos de aplicaciones y lenguajes de programacion.

SELECT * from PERSONA INTO OUTFILE '/tmp/personas.csv' FIELDS ENCLOSED BY '"' 
TERMINATED BY ';' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n';

3)
1.- 
all [privileges]	Otorga todos los privilegios excepto grant option
usage	No otorga ningún privilegio
alter	Privilegio para alterar la estructura de una tabla
create	Permite el uso de create table
delete	Permite el uso de delete
drop	Permite el uso de drop table
index	Permite el uso de index y drop index
insert	Permite el uso de insert
select	Permite el uso de select
update	Permite el uso de update
file	Permite le uso de select . . . into outfile y load data infile
process	Permite el uso de show full procces list
super	Permite la ejecución de comandos de supervisión
reload	Permite el uso de flush
replication client	Permite preguntar la localización de maestro y esclavo
replication slave	Permite leer los binlog del maestro
grant option	Permite el uso de grant y revoke
shutdown	Permite dar de baja al servidor
lock tables	Permite el uso de lock tables
show tables	Permite el uso de show tables
create temporary tables	Permite el uso de create temporary table

2.- 
CREATE USER 'nuevo'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON Valdivia.* TO 'nuevo'@'localhost'
    WITH GRANT OPTION;

3.-
CREATE USER 'nuevo2'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON Valdivia.LUGAR_DE_INTERES  TO 'nuevo2'@'localhost';
GRANT SELECT ON Valdivia.DESPLAZARSE  TO 'nuevo2'@'localhost';


4)
1.-
ALTER TABLE PERSONA ADD COLUMN NIVEL_ESTUDIO VARCHAR(45);

2.-
ALTER TABLE LUGAR_DE_INTERES DROP COLUMN Categoria;

CREATE TABLE CATEGORIA(
    pk_Lugar int NOT NULL AUTO_INCREMENT, 
    Categoria VARCHAR(45), 
    FOREIGN KEY(pk_Lugar) REFERENCES LUGAR_DE_INTERES(pk_Lugar), 
    PRIMARY KEY(pk_Lugar, Categoria) 
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;
describe CATEGORIA;

3.-

ALTER TABLE LUGAR_DE_INTERES
CHANGE COLUMN Latitud Latitud DECIMAL(6,3) NOT NULL;

ALTER TABLE LUGAR_DE_INTERES
CHANGE COLUMN Longitud Longitud DECIMAL(6,3) NOT NULL;

ALTER TABLE DESPLAZARSE
CHANGE COLUMN Latitud Latitud DECIMAL(6,3) NOT NULL;

ALTER TABLE DESPLAZARSE
CHANGE COLUMN Longitud Longitud DECIMAL(6,3) NOT NULL;