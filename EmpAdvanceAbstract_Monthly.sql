select
COMP_CODE	,Empcode	,EmpName,	CatName	,sex,	SHIFT,	Deptname,	Desgnname
,	D1,	D2	,D3	,D4,	D5,	D6	,D7,	D8,	D9	,D10	
,D11,	D12,	D13,	D14	,D15,	D16,	D17	,D18	,D19,	D20	
,D21,	D22	,D23,	D24,	D25	,D26,	D27,	D28,	D29,	D30	,D31 
,D1+D2+D3+D4+D5+D6+D7+D8+D9+D10
+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20	
+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31  as Total
from [Fun_EmpAdvanceAbstract_Monthly] ('2023-03-01','2023-03-31') 
ORDER BY Empcode
