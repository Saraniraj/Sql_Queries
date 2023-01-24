
--  [SP_HRD_SalaryProcess] '100','MAIN UNIT' ,'2022-11-30' ,'STAFF', '','admin'     

select  empcode
,basic+hraamount1+ washamount1 as Cons
,basic,hraamount1,washamount1

,present,leave,absent,weeklyoff,totaldays,paid_days
,PFSource ,MaxPFSalary
 ,[PFAmount],[EPFAmount],[EPSAmount],[ESIAmount],[EmpESIAmount],[MDESIAmount]

,basic,attnearning,hraamount1,hraamount
,washamount1,washamount 
,daamount1,daamount,rsperday
,* from tmpSalProcess
where Empcode ='ATM150'


select * from Emp_Master where EmpName like '%NARENDRAN R%'
select Entry_No from PFESISettings
select * from Location_Details