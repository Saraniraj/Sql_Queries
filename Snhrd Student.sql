/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [cRollno]
      ,[nsno]
      ,[cadmissionno]
      ,[cstudentname]
      ,[dbirthdate]
      ,[csex]
      ,[cfathername]
      ,[cclass]
      ,[dTcissudate]
      ,[cCurrClass]
      ,[cCurrSection]
      ,[cCurrAcadmicyear]     
  FROM [PublicSchoolManagement].[dbo].[Application]
  where  
 dtcissudate IS NULL
 and cCurrAcadmicyear='2023-2024'