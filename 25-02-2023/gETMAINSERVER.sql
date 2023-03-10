USE [DB_HRMS]
GO
/****** Object:  StoredProcedure [dbo].[Get_MainServer_Employee_Data]    Script Date: 04-Feb-2023 17:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================        
-- Author:  Rajkumar  
-- Create date:03-01-2023  
-- Modified date:03-01-2023  

-- Description: <Description,,>        
-- =============================================        
-- exec Get_MainServer_Employee_Data '100','THeni',  '1'    
ALTER PROCEDURE [dbo].[Get_MainServer_Employee_Data]        
 -- Add the parameters for the stored procedure here        
 (
  @Comp_Code varchar(50),    
 @LocationCode varchar(50),        
         
 @iSuccessFlag  bit output)        
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
 SET NOCOUNT ON;        
 Declare @sqlstr   Varchar(8000)        
 declare @count nvarchar(20)        
        ----------************** Unhide this check this coding


		--set @count = (select COUNT(*)   from DB_HRMS.dbo.empmas_atk )

 set @count = (select COUNT(*)   from [192.168.68.3].[TGKPayV2].[dbo].[empmas]  as a
 where a.unitcode=0 and a.working=1 and a.ecode not in (select ecode from empmas_atk) )        
BEGIN TRAN TRAN1        
--    -- Insert statements for procedure here        
   IF @count <=0         
 begin        
insert into DB_HRMS.dbo.empmas_atk 
  
  SELECT *   from [192.168.68.3].[TGKPayV2].[dbo].[empmas]  as a
 where a.unitcode=0 and a.working=1 and a.ecode not in (select ecode from empmas_atk)
order by ecode
        ----------************** Unhide this check this coding


        ----------************** hide this check this coding

	--	select *from DB_HRMS.dbo.empmas_atk as a where a.ecode=0
        ----------************** hide this check this coding





----------**************Dont Remove******************
        
 ----          select MillLot_No,Cotton_Type,Variety_Code,Receipt_No ,Receipt_Date   from  [LS-SPIN-MAIN].[eCotton].[dbo].[Cotton_Receipt]  where Fin_Year_Code ='" + mvarFinYearCode + "' and Cotton_Type <> 'Waste' "
 ----           and Receipt_No  not in (select  Receipt_No   from   [eCotton].[dbo].[Cotton_Receipt]  where Fin_Year_Code ='" + mvarFinYearCode + "' )"

 ----           SSQL &= " order by   Receipt_Date  desc ,MillLot_No"
        
 ----update eCotton.dbo.Cotton_Receipt set Location_Code = @LocationCode where MillLot_No =@LotNo and Variety_Code =@Varietycode and Fin_Year_Code = @FinYearCode   and Receipt_No =@Receipt_no 
----------**************Dont Remove******************
       
 End        
 else        
 begin        
 select @iSuccessFlag='Employees already exists'        
 end        
  IF (@@error <> 0) goto ErrHand        
COMMIT TRAN TRAN1        
select @iSuccessFlag=1        
return        
ErrHand:        
BEGIN        
ROLLBACK TRAN TRAN1        
select @iSuccessFlag=0        
END        
END