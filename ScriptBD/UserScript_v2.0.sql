
REM ----------------------------------------------------------------
REM -------------------- CREACIÓN DE USUARIOS ----------------------


REM ----------------------------------------------------------------
REM --------------------------- DBAE5 ------------------------------
REM PRIVILEGIOS: Privilegios de un DBA
REM ----------------------------------------------------------------

CREATE USER DBAE5 IDENTIFIED BY elemental5 ;

GRANT CREATE TRIGGER TO DBAE5 ;
GRANT CREATE SEQUENCE TO DBAE5 ;
GRANT CREATE TABLE TO DBAE5 ;
GRANT CREATE PROCEDURE TO DBAE5 ;
GRANT CREATE SYNONYM TO DBAE5 ;
GRANT CREATE VIEW TO DBAE5 ;
GRANT CREATE TYPE TO DBAE5 ;
GRANT CREATE PUBLIC SYNONYM TO DBAE5 ;
GRANT CREATE ROLE TO DBAE5 ;
GRANT CREATE SESSION TO DBAE5 ;
GRANT UNLIMITED TABLESPACE TO DBAE5 ;
GRANT CREATE MATERIALIZED VIEW TO DBAE5 ;
GRANT CREATE DATABASE LINK TO DBAE5 ;
GRANT ALTER SESSION TO DBAE5 ;

GRANT DBA TO DBAE5; -- permisos de admin de bd a dbae5

REM ----------------------------------------------------------------
REM -------------------------- APP ---------------------------------
REM PRIVILEGIOS A PACKAGE (OJO: EJECUTAR DESDE DBAE5)
REM ----------------------------------------------------------------

CREATE USER APPE5 IDENTIFIED BY elemental5 ;

GRANT CREATE SESSION TO APPE5;
GRANT EXECUTE ON principalPackage TO APPE5;