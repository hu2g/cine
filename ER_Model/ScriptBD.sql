-- Generado por Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   en:        2021-08-31 15:04:19 CST
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE Cinema 
    (
     id_cinema INTEGER NOT NULL , 
     name VARCHAR (50) NOT NULL , 
     description VARCHAR (100) 
    )
GO

ALTER TABLE Cinema ADD CONSTRAINT Cinema_PK PRIMARY KEY CLUSTERED (id_cinema)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Cost 
    (
     id_cost INTEGER NOT NULL , 
     category VARCHAR (50) NOT NULL , 
     price DECIMAL (10,5) NOT NULL , 
     Type_Function_id_typefunction INTEGER NOT NULL 
    )
GO

ALTER TABLE Cost ADD CONSTRAINT Cost_PK PRIMARY KEY CLUSTERED (id_cost)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Customer 
    (
     id_customer INTEGER NOT NULL , 
     name VARCHAR (100) , 
     address VARCHAR (100) , 
     phone VARCHAR (20) , 
     nit VARCHAR (20) 
    )
GO

ALTER TABLE Customer ADD CONSTRAINT Customer_PK PRIMARY KEY CLUSTERED (id_customer)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Employee 
    (
     id_employee INTEGER NOT NULL , 
     name VARCHAR (60) NOT NULL , 
     address VARCHAR (100) NOT NULL , 
     phone INTEGER NOT NULL , 
     email VARCHAR 
    )
GO

ALTER TABLE Employee ADD CONSTRAINT Employee_PK PRIMARY KEY CLUSTERED (id_employee)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Functionc 
    (
     id_functionC INTEGER NOT NULL , 
     time DATETIME NOT NULL , 
     Movie_id_movie INTEGER NOT NULL , 
     Cinema_id_cinema INTEGER NOT NULL , 
     Cost_id_cost INTEGER NOT NULL 
    )
GO

ALTER TABLE Functionc ADD CONSTRAINT Function_PK PRIMARY KEY CLUSTERED (id_functionC)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Gender 
    (
     id_gender INTEGER NOT NULL , 
     name VARCHAR (100) NOT NULL , 
     description VARCHAR (200) 
    )
GO

ALTER TABLE Gender ADD CONSTRAINT Gender_PK PRIMARY KEY CLUSTERED (id_gender)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Movie 
    (
     id_movie INTEGER NOT NULL , 
     name VARCHAR (100) NOT NULL , 
     date_in DATETIME NOT NULL , 
     state BIT NOT NULL , 
     description VARCHAR (200) , 
     Gender_id_gender INTEGER NOT NULL 
    )
GO

ALTER TABLE Movie ADD CONSTRAINT Movie_PK PRIMARY KEY CLUSTERED (id_movie)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Pyment_Type 
    (
     id_pymenttype INTEGER NOT NULL , 
     name VARCHAR (100) , 
     description VARCHAR (200) 
    )
GO

ALTER TABLE Pyment_Type ADD CONSTRAINT Pyment_Type_PK PRIMARY KEY CLUSTERED (id_pymenttype)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Seat 
    (
     id_seat INTEGER NOT NULL , 
     row INTEGER NOT NULL , 
     "column" INTEGER NOT NULL , 
     state BIT NOT NULL , 
     Cinema_id_cinema INTEGER NOT NULL 
    )
GO

ALTER TABLE Seat ADD CONSTRAINT Seat_PK PRIMARY KEY CLUSTERED (id_seat)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Ticket 
    (
     id_ticket INTEGER NOT NULL , 
     purchase_date DATETIME NOT NULL , 
     Customer_id_customer INTEGER NOT NULL , 
     Employee_id_employee INTEGER NOT NULL , 
     Seat_id_seat INTEGER NOT NULL , 
     Pyment_Type_id_pymenttype INTEGER NOT NULL , 
     Functionc_id_functionC INTEGER NOT NULL 
    )
GO

ALTER TABLE Ticket ADD CONSTRAINT Ticket_PK PRIMARY KEY CLUSTERED (id_ticket)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Type_Function 
    (
     id_typefunction INTEGER NOT NULL , 
     name VARCHAR (100) NOT NULL , 
     description VARCHAR (200) 
    )
GO

ALTER TABLE Type_Function ADD CONSTRAINT Type_Function_PK PRIMARY KEY CLUSTERED (id_typefunction)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Cost 
    ADD CONSTRAINT Cost_Type_Function_FK FOREIGN KEY 
    ( 
     Type_Function_id_typefunction
    ) 
    REFERENCES Type_Function 
    ( 
     id_typefunction 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Functionc 
    ADD CONSTRAINT Function_Cinema_FK FOREIGN KEY 
    ( 
     Cinema_id_cinema
    ) 
    REFERENCES Cinema 
    ( 
     id_cinema 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Functionc 
    ADD CONSTRAINT Function_Cost_FK FOREIGN KEY 
    ( 
     Cost_id_cost
    ) 
    REFERENCES Cost 
    ( 
     id_cost 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Functionc 
    ADD CONSTRAINT Function_Movie_FK FOREIGN KEY 
    ( 
     Movie_id_movie
    ) 
    REFERENCES Movie 
    ( 
     id_movie 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Movie 
    ADD CONSTRAINT Movie_Gender_FK FOREIGN KEY 
    ( 
     Gender_id_gender
    ) 
    REFERENCES Gender 
    ( 
     id_gender 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Seat 
    ADD CONSTRAINT Seat_Cinema_FK FOREIGN KEY 
    ( 
     Cinema_id_cinema
    ) 
    REFERENCES Cinema 
    ( 
     id_cinema 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Ticket 
    ADD CONSTRAINT Ticket_Customer_FK FOREIGN KEY 
    ( 
     Customer_id_customer
    ) 
    REFERENCES Customer 
    ( 
     id_customer 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Ticket 
    ADD CONSTRAINT Ticket_Employee_FK FOREIGN KEY 
    ( 
     Employee_id_employee
    ) 
    REFERENCES Employee 
    ( 
     id_employee 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Ticket 
    ADD CONSTRAINT Ticket_Functionc_FK FOREIGN KEY 
    ( 
     Functionc_id_functionC
    ) 
    REFERENCES Functionc 
    ( 
     id_functionC 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Ticket 
    ADD CONSTRAINT Ticket_Pyment_Type_FK FOREIGN KEY 
    ( 
     Pyment_Type_id_pymenttype
    ) 
    REFERENCES Pyment_Type 
    ( 
     id_pymenttype 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Ticket 
    ADD CONSTRAINT Ticket_Seat_FK FOREIGN KEY 
    ( 
     Seat_id_seat
    ) 
    REFERENCES Seat 
    ( 
     id_seat 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             22
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
