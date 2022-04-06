USE college_fees

/*******************Students Audit Table************/
CREATE TABLE Student_details_audit
   (ID INT ,
    Inserted_By Varchar(100)/*Records who inserted the record*/
)
GO

SELECT*FROM Student_details_audit/***Displays the students audit table**/

/************** Trigger for INSERT Event in Student_details table******/
CREATE TRIGGER TRG_INSERT_AUDIT
ON Student_details
FOR INSERT
AS
BEGIN
     declare @ID int

	 SELECT @ID=USER_ID() from inserted/**Inserts new column ID in the ID variable**/
	 insert into Student_details_audit(ID,Inserted_By)
	 values(@ID, ORIGINAL_LOGIN())/**Inserts ID value into audit table**/
	 PRINT 'Insert Trigger Executed'/**Confirms that the trigger was executed**/
END
GO

DROP TRIGGER TRG_INSERT_AUDIT/**Removes Trigger**/


/*******************Payment_details Audit Table************/
CREATE TABLE Payment_details_audit
   (ID INT ,
    Inserted_By Varchar(100)/*Records who inserted the record*/
)
GO

SELECT*FROM Payment_details_audit/***Displays the payments audit table**/

/************** Trigger for INSERT Event******/
CREATE TRIGGER TRG_INSERT_AUDIT_2
ON Payment_details
FOR INSERT
AS
BEGIN
     declare @ID int

	 SELECT @ID=USER_ID() from inserted/**Inserts new column ID in the ID variable**/
	 insert into Payment_details_audit(ID,Inserted_By)
	 values(@ID, ORIGINAL_LOGIN())/**Inserts ID value into audit table**/
	 PRINT 'Insert Trigger Executed'/**Confirms that the trigger was executed**/
END
GO

DROP TRIGGER TRG_INSERT_AUDIT_2/**Removes Trigger**/



  /**************** Trigger for DELETE EVENT ON PAYMENTS TABLE***********/

  CREATE TRIGGER TRG_Delete_Rule
  ON Payment_details
  FOR DELETE
  AS
  BEGIN
       Rollback
	   PRINT '******************************************************'
	   PRINT 'You can not delete records from this table'
	   PRINT '******************************************************'
END
GO
Delete from Payment_details/**Test for trigger**/
DROP TRIGGER TRG_Delete_Rule/**Removes trigger**/


/*******************Programmes Audit Table************/
CREATE TABLE Programmes_audit
   (ID INT ,
    Inserted_By Varchar(100)/*Records who inserted the record*/
)
GO

SELECT*FROM Programmes_audit/***Displays the programmes audit table**/

/************** Trigger for INSERT Event******/
CREATE TRIGGER TRG_INSERT_AUDIT_3
ON Programmes
FOR INSERT
AS
BEGIN
     declare @ID int

	 SELECT @ID=USER_ID() from inserted/**Inserts new column ID in the ID variable**/
	 insert into Payment_details_audit(ID,Inserted_By)
	 values(@ID, ORIGINAL_LOGIN())/**Inserts ID value into audit table**/
	 PRINT 'Insert Trigger Executed'/**Confirms that the trigger was executed**/
END
GO

DROP TRIGGER TRG_INSERT_AUDIT_3/**Removes Trigger**/


  /**************** Trigger for DELETE EVENT ON PAYMENTS TABLE***********/

  CREATE TRIGGER TRG_Delete_Rule_3
  ON Programmes
  FOR DELETE
  AS
  BEGIN
       Rollback
	   PRINT '******************************************************'
	   PRINT 'You can not delete records from this table'
	   PRINT '******************************************************'
END
GO
Delete from Programmes/**Test for trigger**/
DROP TRIGGER TRG_Delete_Rule_3/**Removes trigger**/




/********DDL(Data Definition Language) TRIGGERs*********/

--For creating tables
CREATE TRIGGER Trg_Create_Table
ON DATABASE
FOR CREATE_TABLE
AS 
BEGIN
     ROLLBACK
	 PRINT 'You are not allowed to create tables'
END
GO

--For dropping tables
CREATE TRIGGER Trg_Drop_Table
ON DATABASE
FOR DROP_TABLE
AS 
BEGIN
     ROLLBACK
	 PRINT 'You are not allowed to drop this table'
END
GO

DROP TABLE Payment_details/***Test for drop table trigger***/

/***************Lists all triggers**********/

select*from sys.triggers


/***** DISABLES/ENABLES TRIGGERS******/

--For student_details
DISABLE TRIGGER TRG_INSERT_AUDIT ON Student_details
GO

ENABLE TRIGGER TRG_INSERT_AUDIT ON Student_details
GO

--For payment details
DISABLE TRIGGER TRG_INSERT_AUDIT_2 ON Payment_details
GO

ENABLE TRIGGER TRG_INSERT_AUDIT_2 ON Payment_details
GO

DISABLE TRIGGER TRG_Delete_Rule ON Payment_details
GO

ENABLE TRIGGER TRG_Delete_Rule ON Payment_details
GO

--For programmes
DISABLE TRIGGER TRG_INSERT_AUDIT_3 ON Programmes
GO

ENABLE TRIGGER TRG_INSERT_AUDIT_3 ON Programmes
GO

DISABLE TRIGGER TRG_Delete_Rule_3 ON Programmes
GO

ENABLE TRIGGER TRG_Delete_Rule_3 ON Programmes
GO



--For the database
DISABLE TRIGGER Trg_Create_Table ON DATABASE
GO

ENABLE TRIGGER Trg_Create_Table ON DATABASE
GO

ENABLE TRIGGER TRG_Drop_Table ON DATABASE
GO

DISABLE TRIGGER TRG_Drop_Table ON DATABASE
GO





