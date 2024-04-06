/*
 --- Proyecto BASE DE DATOS 1
*/
Create database BD_DYJ
Go

Use BD_DYJ
Go

SET DATEFORMAT DMY
GO

CREATE TABLE MEDICOS
(
	Codigo_Medico Int NOT NULL,
	Nombre_Medico Varchar(50),
	Apellido_Medico Varchar(50),
	Fecha_Nacimiento_M Datetime,
	Universidad Varchar(50),
	direccion Varchar(20),
	tipo_Contrato Int,
);
ALTER TABLE MEDICOS ADD CONSTRAINT PK_Medicos PRIMARY KEY  CLUSTERED (Codigo_Medico);

CREATE TABLE PACIENTES
(
	Seguro_Social Int NOT NULL,
	Nombre_Paciente Varchar(50),
	Apellido_Paciente Varchar(50),
	Fecha_Nacimiento_P Datetime,
	direccion_P varchar(20),
);
ALTER TABLE PACIENTES ADD CONSTRAINT PK_Pacinetes PRIMARY KEY  CLUSTERED (Seguro_Social);

CREATE TABLE SISTEMAS
(
	Codigo_sistema Int NOT NULL,
	Sistemas_Corporales Varchar(15),
);
ALTER TABLE SISTEMAS ADD CONSTRAINT PK_Sistemas PRIMARY KEY  CLUSTERED (Codigo_sistema);

CREATE TABLE ENFERMEDADES 
(
	Codigo_Enfermedad Int NOT NULL,
	Nombre Varchar(20),
	Descripcion Varchar(150),
	Sistema Int NOT NULL,
);
ALTER TABLE ENFERMEDADES ADD CONSTRAINT PK_Enfermedades PRIMARY KEY  CLUSTERED (Codigo_Enfermedad);
ALTER TABLE ENFERMEDADES
ADD CONSTRAINT FK_Enfermedad_Sistema FOREIGN KEY(Sistema)
REFERENCES SISTEMAS(Codigo_sistema);

CREATE TABLE MEDICO_PACIENTE
(
	Numero_Historial Int NOT NULL,
	Codigo_Medico Int NOT NULL,
	Seguro_Social Int NOT NULL,
);
ALTER TABLE MEDICO_PACIENTE ADD CONSTRAINT PK_MedPAc PRIMARY KEY  CLUSTERED (Numero_Historial);
ALTER TABLE MEDICO_PACIENTE
ADD CONSTRAINT FK_CodMed FOREIGN KEY(Codigo_Medico)
REFERENCES MEDICOS(Codigo_Medico);
ALTER TABLE MEDICO_PACIENTE
ADD CONSTRAINT FK_SegSoc FOREIGN KEY(Seguro_Social)
REFERENCES PACIENTES(Seguro_Social);

CREATE TABLE PACIENTE_ENFERMEDAD
(
	Seguro_Social Int NOT NULL,
	Codigo_Enfermedad Int NOT NULL,
);
ALTER TABLE PACIENTE_ENFERMEDAD
ADD CONSTRAINT FK_SC FOREIGN KEY(Seguro_Social)
REFERENCES PACIENTES(Seguro_Social);
ALTER TABLE PACIENTE_ENFERMEDAD
ADD CONSTRAINT FK_CE FOREIGN KEY(Codigo_Enfermedad)
REFERENCES ENFERMEDADES(Codigo_Enfermedad);

----------------------------------------------------------------------
/* Tipo_Contrato
1. Funcionarios
2. Contrato laboral tiempo completo
3. Contrato laboral tiempo parcial
*/
----------------------------------------------------------------------

INSERT INTO [dbo].[MEDICOS]
           ([Codigo_Medico]
           ,[Nombre_Medico]
           ,[Apellido_Medico]
           ,[Fecha_Nacimiento_M]
           ,[Universidad]
           ,[direccion]
           ,[tipo_Contrato])
     VALUES
           (1001,
           'Mario',
           'Hugo',
           '2000-08-02',
           'Universidad del Istmo',
           'Calle Verano',
           1),

-----------------------------------------

	       (1002,
           'Laura',
           'Valdez',
           '1995-03-07',
           'Universidad Americana',
           'Calle Azul',
           3),

-----------------------------------------

	       (1003,
           'Ronald',
           'Perez',
           '1992-01-09',
           'Universidad de la Plata',
           'Cerro Alto',
           2),

-----------------------------------------

	       (1004,
           'Luis',
           'Hernández',
           '1997-05-03',
           'Universidad Interamericana',
           'Buena Vista 54',
           2),

-----------------------------------------

	       (1005,
           'Alicia',
           'López',
           '1990-06-08',
           'Universidad Perlas',
           'Las marcelas',
           1)

GO

Select *
FROM MEDICOS

----------------------------------------------------------------------

INSERT INTO [dbo].[PACIENTES]
           ([Seguro_Social]
           ,[Nombre_Paciente]
           ,[Apellido_Paciente]
           ,[Fecha_Nacimiento_P]
           ,[direccion_P])
     VALUES
           (2001,
           'Selena',
           'Morales',
           '1993-07-05',
           'Calle 51'),

-----------------------------------------

           (2002,
           'Kevin',
           'González',
           '1990-03-09',
           'Los Corrales'),

-----------------------------------------

           (2003,
           'Jhonas',
           'Sánchez',
           '2000-02-08',
           'Loma Alta'),

-----------------------------------------

           (2004,
           'Sergio',
           'Ruíz',
           '1997-02-04',
           'Las Veraneras'),

-----------------------------------------

           (2005,
           'Maria',
           'Solís',
           '2000-08-05',
           'Cabo Santo'),

-----------------------------------------

           (2006,
           'Guillermo',
           'Cárdenas',
           '1996-01-02',
           'Calle Quinta'),

-----------------------------------------

		   (2007,
           'Mario',
           'Savedra',
           '1999-07-03',
           'Los Lagos')

GO

Select *
FROM PACIENTES

----------------------------------------------------------------------

INSERT INTO [dbo].[SISTEMAS]
           ([Codigo_sistema]
           ,[Sistemas_Corporales])
     VALUES
           (01,
           'Respirator'),

-----------------------------------------

           (02,
           'Circulator'),

-----------------------------------------

           (03,
           'Digestivo'),

-----------------------------------------

           (04,
           'Inmunológico')

GO

Select *
FROM SISTEMAS

----------------------------------------------------------------------

INSERT INTO [dbo].[ENFERMEDADES]
           ([Codigo_Enfermedad]
           ,[Nombre]
           ,[Descripcion]
           ,[Sistema])
     VALUES
           (3001,
           'Rinitis',
           'Conjunto de síntomas que afectan la nariz',
           01),

-----------------------------------------

           (3002,
           'Faringitis',
           'Hinchazón de la parte posterior de la garganta',
           01),

-----------------------------------------

           (3003,
           'Gripe',
           'Es una infección de las vías respiratorias',
           01),

-----------------------------------------

           (3004,
           'Hipertensión',
           'Presión arterial alta',
           02),

-----------------------------------------

           (3005,
           'Arritmia',
           'Problemas de ritmo cardíaco',
           02),

-----------------------------------------

           (3006,
           'Hipotensión postural',
           'Caída en la presión arterial',
           02),

-----------------------------------------

           (3007,
           'Gastritis',
           'La inflamación del revestimiento del estómago',
           03),

-----------------------------------------

           (3008,
           'Gastroenteritis',
           'Infección intestinal',
           03),

-----------------------------------------

           (3009,
           'Cirrosis Hepática',
           'Se refiere a la cicatrización del hígado',
           03),

-----------------------------------------

           (3010,
           'Alergia estacional',
           'Síntomas alérgicos durante ciertas épocas del año',
           04),

-----------------------------------------

           (3011,
           'Taquicardia esencial',
           'Aumento de la frecuencia cardiaca',
           02),

-----------------------------------------

           (3012,
           'Dispepsia',
           'Dolor en la parte alta del vientre',
           03)

GO

Select *
FROM ENFERMEDADES

----------------------------------------------------------------------

INSERT INTO [dbo].[MEDICO_PACIENTE]
           ([Numero_Historial]
           ,[Codigo_Medico]
           ,[Seguro_Social])
     VALUES
           (1234,
           1001,
           2001),

-----------------------------------------

           (5678,
           1001,
           2002),

-----------------------------------------

           (9101,
           1002,
           2003),

-----------------------------------------

           (1213,
           1002,
           2004),

-----------------------------------------

           (1415,
           1003,
           2005),

-----------------------------------------

           (1617,
           1004,
           2006),

-----------------------------------------

           (1819,
           1005,
           2007)

GO

Select *
FROM MEDICO_PACIENTE

----------------------------------------------------------------------

INSERT INTO [dbo].[PACIENTE_ENFERMEDAD]
           ([Seguro_Social]
           ,[Codigo_Enfermedad])
     VALUES
           (2001,
           3001),

----------------------------------------

           (2001,
           3003),

----------------------------------------

           (2002,
           3002),

----------------------------------------

           (2003,
           3004),

----------------------------------------

           (2003,
           3005),

----------------------------------------

           (2004,
           3006),

----------------------------------------

           (2005,
           3007),

----------------------------------------

           (2005,
           3008),

----------------------------------------

           (2006,
           3009),

----------------------------------------

           (2006,
           3010),

----------------------------------------

           (2007,
           3011),

----------------------------------------

           (2007,
           3012)

GO

Select *
FROM PACIENTE_ENFERMEDAD


/*Edad promedio de los pacientes que padecen enfermedades del aparato 
circulatorio */
/*SELECT        PACIENTES.Nombre_Paciente, PACIENTES.Apellido_Paciente, PACIENTES.Fecha_Nacimiento_P, ENFERMEDADES.Sistema */
/*SELECT AVG( YEAR([Fecha_Nacimiento_P]))*/
/*SELECT AVG(DATEDIFF(YEAR ,CURRENT_TIMESTAMP, ([Fecha_Nacimiento_P]))) */
 set dateformat dmy;
 SELECT AVG(DATEDIFF(YEAR ,([Fecha_Nacimiento_P]),CURRENT_TIMESTAMP )) as Fecha_promedio


FROM            ENFERMEDADES INNER JOIN
 PACIENTE_ENFERMEDAD ON ENFERMEDADES.Codigo_Enfermedad = PACIENTE_ENFERMEDAD.Codigo_Enfermedad INNER JOIN
 PACIENTES ON PACIENTE_ENFERMEDAD.Seguro_Social = PACIENTES.Seguro_Social
 Where Sistema =2
 
 /*Número de pacientes que tiene asignado cada médico*/

SELECT        Codigo_Medico, Count(1) as Pacientes 
FROM            MEDICO_PACIENTE
group by Codigo_Medico
/*Nombre y dirección de los pacientes por médico*/

SELECT        MEDICO_PACIENTE.Codigo_Medico, PACIENTES.Nombre_Paciente, PACIENTES.Apellido_Paciente, PACIENTES.direccion_P
FROM            MEDICO_PACIENTE INNER JOIN
                         PACIENTES ON MEDICO_PACIENTE.Seguro_Social = PACIENTES.Seguro_Social

/*Lista de enfermedades que padecen por pacientes*/	

SELECT        PACIENTES.Seguro_Social, PACIENTES.Nombre_Paciente, PACIENTES.Apellido_Paciente, PACIENTE_ENFERMEDAD.Codigo_Enfermedad, ENFERMEDADES.Nombre, ENFERMEDADES.Descripcion, 
                         ENFERMEDADES.Sistema
FROM            ENFERMEDADES INNER JOIN
                         PACIENTE_ENFERMEDAD ON ENFERMEDADES.Codigo_Enfermedad = PACIENTE_ENFERMEDAD.Codigo_Enfermedad INNER JOIN
                         PACIENTES ON PACIENTE_ENFERMEDAD.Seguro_Social = PACIENTES.Seguro_Social

/* Cantidad de médicos con menos de 30 años*/
SELECT   Count (1)  As edad_m
FROM   MEDICOS
where (DATEDIFF(YEAR ,([Fecha_Nacimiento_M]),CURRENT_TIMESTAMP )) <30

Group by Codigo_Medico


/* Listado en el que aparezca para cada paciente el número de enfermedades que 
padece, indicando apellidos y nombre del paciente y número de enfermedades.*/

SELECT       PACIENTES.Seguro_Social, PACIENTES.Nombre_Paciente, PACIENTES.Apellido_Paciente , count(PACIENTE_ENFERMEDAD.Seguro_Social) as total_enfermedades
FROM            PACIENTE_ENFERMEDAD INNER JOIN
                         PACIENTES ON PACIENTE_ENFERMEDAD.Seguro_Social = PACIENTES.Seguro_Social
						 Group by PACIENTES.Seguro_Social,PACIENTES.Nombre_Paciente ,PACIENTES.Apellido_Paciente

/*Realizar un reporte en el que aparezca la información concerniente a los médicos 
del centro en el siguiente orden: apellido, nombre, código, dirección, contrato y 
Universidad donde obtuvo su título, ordenados alfabéticamente por el apellido. */

Select Apellido_Medico,Nombre_Medico,Codigo_Medico,direccion,tipo_Contrato,Universidad
from medicos
 order by 
 Apellido_Medico asc;

 /*Realizar un reporte en el que aparezca para cada enfermedad los pacientes que la 
han sufrido y el número total de pacientes.*/
SELECT        PACIENTE_ENFERMEDAD.Codigo_Enfermedad, ENFERMEDADES.Nombre,count(PACIENTE_ENFERMEDAD.Codigo_Enfermedad) as Pacientes_por_enfermedad
FROM            ENFERMEDADES INNER JOIN
                         PACIENTE_ENFERMEDAD ON ENFERMEDADES.Codigo_Enfermedad = PACIENTE_ENFERMEDAD.Codigo_Enfermedad
						 Group by PACIENTE_ENFERMEDAD.Codigo_Enfermedad, ENFERMEDADES.Nombre
						 Select count(*)as total_de_pacientes from PACIENTE_ENFERMEDAD 