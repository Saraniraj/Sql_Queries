USE [eCotton]
GO
/****** Object:  StoredProcedure [dbo].[Get_MainServer_Receipt_Data]    Script Date: 02-Feb-2023 17:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================        
-- Author:  Rajkumar  
-- Create date:11-12-2021  
-- Modified date:30-05-2022  

-- Description: <Description,,>        
-- =============================================        
-- exec Get_MainServer_Receipt_Data '108','SUPIMA', 'CC/000111/21-22','2'  ,'spinning'  ,'1'    
ALTER PROCEDURE [dbo].[Get_MainServer_Receipt_Data]        
 -- Add the parameters for the stored procedure here        
 (@LotNo varchar(100),        
 @Varietycode varchar(50),        
 @Receipt_no varchar(50),        
      
 @FinYearCode varchar(20),         
 @LocationCode varchar(50),        
 @iSuccessFlag  bit output)        
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
 SET NOCOUNT ON;        
 Declare @sqlstr   Varchar(8000)        
 declare @count nvarchar(20)        
        
 set @count = (select COUNT(*) from eCotton.dbo.Cotton_Receipt  where MillLot_No =@LotNo  and Variety_Code =@Varietycode and Fin_Year_Code = @FinYearCode and Location_Code=@LocationCode and Receipt_No =@Receipt_no )        
BEGIN TRAN TRAN1        
    -- Insert statements for procedure here        
    IF @count <=0         
 begin        
 insert into eCotton.dbo.Cotton_Receipt  SELECT * from [LS-SPIN-MAIN].eCotton.dbo.Cotton_Receipt  where MillLot_No =@LotNo and Variety_Code =@Varietycode and Fin_Year_Code = @FinYearCode   and Receipt_No =@Receipt_no       
 and Cotton_Type <> 'Waste'         
         
        
 update eCotton.dbo.Cotton_Receipt set Location_Code = @LocationCode where MillLot_No =@LotNo and Variety_Code =@Varietycode and Fin_Year_Code = @FinYearCode   and Receipt_No =@Receipt_no       
 End        
 else        
 begin        
 select @iSuccessFlag='Lot Number already exists'        
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