--BORRANDO EL TABLESPACE, USUARIO Y ROL, SI EXISTIERAN

DROP ROLE PERMITIR14;
DROP USER USER14;
DROP TABLESPACE SEMANA14 INCLUDING CONTENTS;

--1 Creando el TableSpace
Create TableSpace SEMANA14 DataFile 'C:\IDAT\IDAT_14.DBF' Size 150M;

--2 Verificando la creación del TableSpace
Select * From v$tablespace;

--3 Ahora crearemos al usuario USER14, cuya contraseña será: 123456
Create User USER14 Identified by "123456"
Default TableSpace SEMANA14
Temporary TableSpace TEMP
Quota unlimited on SEMANA14;

--4 Creamos un Rol el cual contendrá los permisos, en este caso
-- el Role tendrá el nombre PERMITIR14.
Create Role PERMITIR14;

--5 Asignaremos los permisos (GRANT) al rol creado.
Grant CONNECT, CREATE TABLE, RESOURCE, 
      ALTER ANY INDEX, ALTER ANY SEQUENCE, ALTER ANY TABLE,
      ALTER ANY TRIGGER, CREATE ANY INDEX, CREATE ANY SEQUENCE,
      CREATE ANY SYNONYM, CREATE ANY TABLE, CREATE ANY TRIGGER,
      CREATE ANY VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, 
      CREATE TRIGGER, CREATE VIEW, DROP ANY INDEX,
      DROP ANY SEQUENCE, DROP ANY TABLE, DROP ANY TRIGGER, DROP ANY VIEW,
      INSERT ANY TABLE, QUERY REWRITE, SELECT ANY TABLE,
      UNLIMITED TABLESPACE To PERMITIR14;
      
--6 Asociamos (GRANT) el Rol PERMITIR13 con el usuario USER14,
--de esta manera el usuario USER14, podrá realizar las tareas
--i/o permisos que el Rol tiene.
Grant PERMITIR14 To USER14;

--7. CERRAR TODO, DESCONECTAR E INICIAR NUEVAMENTE, EN ESTA OCASION USAR
--   AL USUARIO USER14.

