
#Region "Imports"
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports CrystalDecisions.CrystalReports.Engine
Imports System.Math
Imports Microsoft.Office.Interop
Imports System.IO
Imports System.Web.UI.WebControls
Imports System.Linq
Imports System.ComponentModel

Imports System.Net.Mail
Imports System.Collections.Generic
#End Region

Public Class frmPayslipMailSend
    'Dim oReport As New clsReport
    ''  Dim mobjAttendance As New ClsAttendance
    Dim mobjclsEmployee_Report As New clsEmployee_Report
    Dim CommonFunction As New DateFormat

    Private objAttendanceLogsDataTable As DataTable

    Dim mvarReportName As String
    Private isDirtyLoad As Boolean = True
    Private i As Integer = 0

    Private Property CbxSex As Object

    Private Sub frmPayslipMailSend_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Try

            Fill_Combo_Details()

            mvarReportName = Me.Text

            Me.dgvReport.AutoGenerateColumns = False
            Me.toolStripComboBox_RecordPerPage.SelectedItem = "All"
            'CommonFunction.LoadMonth(Me.drp_Month)
            'CommonFunction.LoadYear(Me.drp_Year)
            'Me.drp_Month.Text = DateTime.Now.ToString("MMM")
            Me.isDirtyLoad = False
            CbxCategory.Text = "ALL"
            CbxDepartment.Text = "ALL"
            CbxDesignation.Text = "ALL"


        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Public Sub InitializeForm(ByVal mvarScreenName As String)
        Try
            Me.Text = mvarScreenName
            mvarReportName = Me.Text

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub Fill_Combo_Details()
        Try

            Fill_CBX_details(" select distinct catname from Category_Master  Where  Location_Code='" & mvarLocationCode & "' and is_active='1'  order by  catname   ", mvarDbasename, CbxCategory)
            Fill_CBX_details("select distinct DeptName FROM [Deptmaster]  Where  Location_Code='" & mvarLocationCode & "' and is_active='1'  order by  DeptName  ", mvarDbasename, CbxDepartment)
            Fill_CBX_details("select distinct DesgnName FROM [Designation] Where  Location_Code='" & mvarLocationCode & "' and is_active='1'  order by  DesgnName  ", mvarDbasename, CbxDesignation)

        Catch ex As Exception
            Show_Message(ex.Message)
        Finally
            If Not ds Is Nothing Then
                ds.Dispose()
            End If
        End Try
    End Sub

    Sub Fill_CBX_details(ByVal mSSQL As String, ByVal mdatabase As String, ByVal mCBX As ComboBox)
        Try

            mCBX.Items.Add("ALL")
            ds = Nothing
            ds = New DataSet
            ds = ReturnMultipleValue(mSSQL, mdatabase)
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub
            For iRow As Integer = 0 To ds.Tables(0).Rows.Count - 1
                mCBX.Items.Add(Trim(ds.Tables(0).Rows(iRow)(0)))
            Next
            ds.Dispose()
        Catch ex As Exception
            Show_Message(ex.Message)
        Finally
            If Not ds Is Nothing Then
                ds.Dispose()
            End If
        End Try
        mCBX.SelectedIndex = 0
    End Sub
    Public Sub AutoComplete(ByVal cb As ComboBox, ByVal e As System.Windows.Forms.KeyPressEventArgs)
        Dim strFindStr As String = ""
        If e.KeyChar = ChrW(8) Then
            If cb.SelectionStart <= 1 Then
                cb.Text = ""
                Return
            End If

            If cb.SelectionLength = 0 Then
                strFindStr = cb.Text.Substring(0, cb.Text.Length - 1)
            Else
                strFindStr = cb.Text.Substring(0, cb.SelectionStart - 1)
            End If
        Else
            If cb.SelectionLength = 0 Then
                strFindStr = cb.Text + e.KeyChar
            Else
                strFindStr = cb.Text.Substring(0, cb.SelectionStart) + e.KeyChar
            End If
        End If
        Dim intIdx As Integer = -1
        ' Search the string in the ComboBox list.
        intIdx = cb.FindString(strFindStr)
        If intIdx <> -1 Then
            cb.SelectedText = ""
            cb.SelectedIndex = intIdx
            cb.SelectionStart = strFindStr.Length
            cb.SelectionLength = cb.Text.Length
            e.Handled = True
        Else
            ''  e.Handled = blnLimitToList
        End If
    End Sub
    Private Sub CbxCategory_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles CbxCategory.KeyPress
        AutoComplete(Me.CbxCategory, e)
    End Sub
    Private Sub CbxDepartment_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles CbxDepartment.KeyPress
        AutoComplete(Me.CbxCategory, e)
    End Sub
    Private Sub CbxDesignation_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles CbxDesignation.KeyPress
        AutoComplete(Me.CbxCategory, e)
    End Sub

    Private Sub btn_Go_Click(sender As Object, e As EventArgs) Handles btn_Go.Click
        Try
            Dim mselectedvalues = CbxCategory.Text



            Dim memployeetype As String = ""
            Dim mempstatus As String = ""

            If chkWorking.Checked = True And chkres.Checked = True Then
                mempstatus = "ALL"
            ElseIf chkWorking.Checked = True And chkres.Checked = False Then

                mempstatus = "WORKING"

            ElseIf chkWorking.Checked = False And chkres.Checked = True Then
                mempstatus = "NOT-WORKING"

            Else
                mempstatus = "ALL"
            End If

            Employee_Report(CbxCategory.Text, CbxDepartment.Text, CbxDesignation.Text, "ALL", txt_EmpCode.Text, mempstatus)
        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub

    Private Sub Employee_Report(ByVal catname As String, ByVal Deptname As String, ByVal Desgnname As String, ByVal sex As String, ByVal empcode As String, ByVal mempstatus As String)

        Dim i
        Dim checkitemcnt = 0

        Dim staff As Boolean = False

        Dim Dtable As New DataTable
        Dim dt As New DataTable

        'dt.Columns.Add(new DataColumn("Selected", typeof(bool)));
        'Dtable.Columns.Add("Select", Type.GetType("System.bool"))

        Dtable.Columns.Add("SNO", Type.GetType("System.String"))
        Dtable.Columns.Add("EMPCODE", Type.GetType("System.String"))
        Dtable.Columns.Add("Name", Type.GetType("System.String"))

        Dtable.Columns.Add("FingerId", Type.GetType("System.String"))

        Dtable.Columns.Add("catname", Type.GetType("System.String"))
        Dtable.Columns.Add("Deptname", Type.GetType("System.String"))
        Dtable.Columns.Add("DesgnName", Type.GetType("System.String"))
        Dtable.Columns.Add("ShiftGroup", Type.GetType("System.String"))
        Dtable.Columns.Add("Sgroup", Type.GetType("System.String"))
        Dtable.Columns.Add("Address1", Type.GetType("System.String"))
        Dtable.Columns.Add("Address2", Type.GetType("System.String"))
        Dtable.Columns.Add("Address3", Type.GetType("System.String"))
        Dtable.Columns.Add("place", Type.GetType("System.String"))
        Dtable.Columns.Add("sex", Type.GetType("System.String"))
        Dtable.Columns.Add("DOB", Type.GetType("System.String"))
        Dtable.Columns.Add("DOJ", Type.GetType("System.String"))
        Dtable.Columns.Add("CasualJoinDate", Type.GetType("System.String"))
        Dtable.Columns.Add("WeeklyOff", Type.GetType("System.String"))
        Dtable.Columns.Add("BloodGroup", Type.GetType("System.String"))
        Dtable.Columns.Add("MartialStaus", Type.GetType("System.String"))
        Dtable.Columns.Add("experience", Type.GetType("System.String"))
        Dtable.Columns.Add("preComp", Type.GetType("System.String"))
        Dtable.Columns.Add("IDMark", Type.GetType("System.String"))
        Dtable.Columns.Add("ConsWages", Type.GetType("System.String"))
        Dtable.Columns.Add("Basic", Type.GetType("System.String"))
        Dtable.Columns.Add("wpday", Type.GetType("System.String"))
        Dtable.Columns.Add("PFNo", Type.GetType("System.String"))
        Dtable.Columns.Add("PFDate", Type.GetType("System.String"))
        Dtable.Columns.Add("PFNominee", Type.GetType("System.String"))
        Dtable.Columns.Add("UanNo", Type.GetType("System.String"))
        Dtable.Columns.Add("ESINo", Type.GetType("System.String"))
        Dtable.Columns.Add("ESIDate", Type.GetType("System.String"))
        Dtable.Columns.Add("ESILocation", Type.GetType("System.String"))
        Dtable.Columns.Add("AudharID", Type.GetType("System.String"))
        Dtable.Columns.Add("ContactNo", Type.GetType("System.String"))
        Dtable.Columns.Add("PanNo", Type.GetType("System.String"))
        Dtable.Columns.Add("VoteId", Type.GetType("System.String"))
        Dtable.Columns.Add("RCNo", Type.GetType("System.String"))
        Dtable.Columns.Add("Account_Type", Type.GetType("System.String"))
        Dtable.Columns.Add("AcNo", Type.GetType("System.String"))
        Dtable.Columns.Add("Branch_Code", Type.GetType("System.String"))
        Dtable.Columns.Add("IFSC_Code", Type.GetType("System.String"))
        Dtable.Columns.Add("BankName", Type.GetType("System.String"))
        Dtable.Columns.Add("Branch_Location", Type.GetType("System.String"))
 

        ''    

        Dim irows As Integer = 0

        Dim TWD = 0.0
        Dim TFH = 0.0
        Dim TLW = 0.0
        Dim TAL = 0.0
        Dim TES = 0.0
        Dim TAP = 0.0
        Dim TEL = 0.0

        Dim strDate As DateTime

        ds = mobjclsEmployee_Report.GetEmployeeRegister_Details(catname, Deptname, Desgnname, sex, empcode, mempstatus, "Emp_Abstract")
        If ds.Tables(0).Rows.Count <= 0 Then Exit Sub
        For i = 0 To ds.Tables(0).Rows.Count - 1

            If ds.Tables(0).Rows(i).Item("catname") = "ADMIN-STAFF" Then

                Dtable.Rows.Add()
                Dtable.Rows(irows)("SNO") = irows + 1
                Dtable.Rows(irows)("EmpCode") = ds.Tables(0).Rows(i).Item("EmpCode")
                Dtable.Rows(irows)("Name") = ds.Tables(0).Rows(i).Item("EmpName")

                Dtable.Rows(irows)("FingerId") = "krk.itp@gmail.com"
                Dtable.Rows(irows)("catname") = ds.Tables(0).Rows(i).Item("catname")
                Dtable.Rows(irows)("Deptname") = ds.Tables(0).Rows(i).Item("Deptname")
                Dtable.Rows(irows)("DesgnName") = ds.Tables(0).Rows(i).Item("DesgnName")
                Dtable.Rows(irows)("ShiftGroup") = ds.Tables(0).Rows(i).Item("ShiftGroup")
                Dtable.Rows(irows)("Sgroup") = ds.Tables(0).Rows(i).Item("Sgroup")
                Dtable.Rows(irows)("Address1") = ds.Tables(0).Rows(i).Item("Address1")
                Dtable.Rows(irows)("Address2") = ds.Tables(0).Rows(i).Item("Address2")
                Dtable.Rows(irows)("Address3") = ds.Tables(0).Rows(i).Item("Address3")
                Dtable.Rows(irows)("place") = ds.Tables(0).Rows(i).Item("place")
                Dtable.Rows(irows)("sex") = ds.Tables(0).Rows(i).Item("sex")
                Dtable.Rows(irows)("DOB") = ds.Tables(0).Rows(i).Item("DOB")
                Dtable.Rows(irows)("DOJ") = ds.Tables(0).Rows(i).Item("DOJ")
                Dtable.Rows(irows)("CasualJoinDate") = ds.Tables(0).Rows(i).Item("CasualJoinDate")
                Dtable.Rows(irows)("WeeklyOff") = ds.Tables(0).Rows(i).Item("WeeklyOff")
                Dtable.Rows(irows)("BloodGroup") = ds.Tables(0).Rows(i).Item("BloodGroup")
                Dtable.Rows(irows)("MartialStaus") = ds.Tables(0).Rows(i).Item("MartialStaus")
                Dtable.Rows(irows)("experience") = ds.Tables(0).Rows(i).Item("WORKINGEXP")
                Dtable.Rows(irows)("preComp") = ds.Tables(0).Rows(i).Item("preComp")
                Dtable.Rows(irows)("IDMark") = ds.Tables(0).Rows(i).Item("IDMark")
                Dtable.Rows(irows)("ConsWages") = ds.Tables(0).Rows(i).Item("ConsWages")
                Dtable.Rows(irows)("Basic") = ds.Tables(0).Rows(i).Item("Basic")
                Dtable.Rows(irows)("wpday") = ds.Tables(0).Rows(i).Item("wpday")
                Dtable.Rows(irows)("PFNo") = ds.Tables(0).Rows(i).Item("PFNo")
                Dtable.Rows(irows)("PFDate") = ds.Tables(0).Rows(i).Item("PFDate")
                Dtable.Rows(irows)("PFNominee") = ds.Tables(0).Rows(i).Item("PFNominee")
                Dtable.Rows(irows)("UanNo") = ds.Tables(0).Rows(i).Item("UanNo")
                Dtable.Rows(irows)("ESINo") = ds.Tables(0).Rows(i).Item("ESINo")
                Dtable.Rows(irows)("ESIDate") = ds.Tables(0).Rows(i).Item("ESIDate")
                Dtable.Rows(irows)("ESILocation") = ds.Tables(0).Rows(i).Item("ESILocation")
                Dtable.Rows(irows)("AudharID") = ds.Tables(0).Rows(i).Item("AudharID")
                Dtable.Rows(irows)("ContactNo") = ds.Tables(0).Rows(i).Item("ContactNo")
                Dtable.Rows(irows)("PanNo") = ds.Tables(0).Rows(i).Item("PanNo")
                Dtable.Rows(irows)("VoteId") = ds.Tables(0).Rows(i).Item("VoteId")
                Dtable.Rows(irows)("RCNo") = "krk.itp@gmail.com"
              
                irows = irows + 1

            Else

            End If

        Next

        Dim str7 As String = Me.toolStripComboBox_RecordPerPage.SelectedItem.ToString
        If (str7 = "All") Then
            Me.bindingSource1.DataSource = Dtable
        Else

            Dim query = Dtable.AsEnumerable().Skip(0).Take(str7)
            Me.bindingSource1.DataSource = query.CopyToDataTable()
            ''Return query.CopyToDataTable()

            '       Me.bindingSource1.DataSource = Dtable.Take(Of WorkDurationRow)(Convert.ToInt32(str7))
        End If
        Me.dgvReport.DataSource = Me.bindingSource1
        Me.bindingNavigator1.BindingSource = Me.bindingSource1




         

    End Sub

    Private Sub PopulateDataGrid()
        If Not Me.isDirtyLoad Then
            Dim mselectedvalues = CbxCategory.Text

            Dim sex = CbxSex.Text

            Dim memployeetype As String = ""
            Dim mempstatus As String = ""

            If chkWorking.Checked = True And chkres.Checked = True Then
                mempstatus = "ALL"
            ElseIf chkWorking.Checked = True And chkres.Checked = False Then

                mempstatus = "WORKING"

            ElseIf chkWorking.Checked = False And chkres.Checked = True Then
                mempstatus = "NOT-WORKING"

            Else
                mempstatus = "ALL"
            End If
            Dim str As String = Me.toolStripComboBox_RecordPerPage.SelectedItem.ToString
            If (str = "All") Then
                str = "0"
            End If
            Employee_Report(CbxCategory.Text, CbxDepartment.Text, CbxDesignation.Text, sex, txt_EmpCode.Text, mempstatus)

        End If
    End Sub

    Private Sub toolStripComboBox_RecordPerPage_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles toolStripComboBox_RecordPerPage.SelectedIndexChanged
        Me.PopulateDataGrid()
    End Sub
    'Public Shared Function GetDataTable(ByVal PageSize As Integer, ByVal CurrentPagea As Integer) As DataTable
    'Dim dtData As New DataTable = da_Book_Content.GetDataContent()    
    '    Dim query = dtData.AsEnumerable().Skip(CurrentPage).Take(PageSize)
    '    Return query.CopyToDataTable()
    'End Function

    'Public Shared Function GetDataTable(ByVal PageSize As Integer, ByVal CurrentPagea As Integer) As DataTable
    'Dim dtData As New DataTable = da_Book_Content.GetDataContent()    
    '    Dim query = dtData.AsEnumerable().Skip(CurrentPagea).Take(PageSize)
    '    Return query.CopyToDataTable()
    'End Function
    Private Sub RemoveEmptyRow()
        Try
            For i As Integer = 0 To dgvReport.RowCount - 1
                Dim isEmpty As [Boolean] = True
                If Me.dgvReport.RowCount = i Then
                    Exit Sub
                End If
                For j As Integer = 0 To dgvReport.Columns.Count - 1
                    If dgvReport.Rows(i).Cells(j).Value.ToString() <> "" Then
                        isEmpty = False
                        Exit For
                    End If

                Next

                If isEmpty Then
                    dgvReport.Rows.RemoveAt(i)
                    i -= 1
                End If

            Next
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private EmpCodesortOrder As String = ""
    Private Sub dgvReport_ColumnHeaderMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs)
        Try
            If (Me.dgvReport.Columns.Item(e.ColumnIndex).Name = "EmploeeCode") Then
                If (Me.EmpCodesortOrder = "desc") Then
                    Me.EmpCodesortOrder = "asc"
                Else
                    Me.EmpCodesortOrder = "desc"
                End If
                Me.bindingSource1.Sort = ("StringCode " & Me.EmpCodesortOrder & " , NumericCode " & Me.EmpCodesortOrder)
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btn_Export_Click(sender As Object, e As EventArgs) Handles btn_Export.Click
        Try

            ' RemoveEmptyRows(dgvReport, 1)
            Dim mfromdate As String = ""
            Dim mtodate As String = ""

            Export_DataGrid_Excel(" Employee Register", dgvReport, mfromdate, mtodate)
            Dim str As String = ""
            Dim str2 As String = ""
            Dim column As DataGridViewColumn
            For Each column In Me.dgvReport.Columns
                If column.Visible Then
                    str2 = (str2 & column.HeaderText & ",")
                End If
            Next
            str = (str & str2 & ChrW(10))
            Dim row As DataGridViewRow
            For Each row In DirectCast(Me.dgvReport.Rows, IEnumerable)
                str2 = ""
                Dim cell As DataGridViewCell
                For Each cell In row.Cells
                    If cell.Visible Then
                        str2 = (str2 & cell.Value.ToString & ",")
                    End If
                Next
                str = (str & str2 & ChrW(10))
            Next
            If str.EndsWith(ChrW(10)) Then
                str = str.Remove(str.LastIndexOf(ChrW(10)))
            End If
            ''   RemoveEmptyRows(dgvReport, 1)

            '' Export_DataGrid_Excel(" Employee Attendance Register", dgvReport)
            File.WriteAllLines((mvarReportPath & "\EmployeeAttendanceRegister.csv"), str.Split(New Char() {ChrW(10)}))
            MessageBox.Show(("Total " & (str.Split(New Char() {ChrW(10)}).Length - 1).ToString & " Employees Attendance Records Exported Successfully."), "Export Employee AttendanceRegister ", MessageBoxButtons.OK, MessageBoxIcon.Asterisk)
            File.Open(mvarReportPath & "\EmployeeAttendanceRegister.csv", FileMode.Append)
            'New frmExportEmployeeAttendanceRegister() With { _
            '    .ExportEmployeeAttendanceRegister = str _
            '}.ShowDialog

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub drp_Month_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub

    Private Sub label10_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub dgvReport_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles dgvReport.CellContentClick

    End Sub

    Private Sub dgvReport_CellDoubleClick(sender As Object, e As DataGridViewCellEventArgs) Handles dgvReport.CellDoubleClick
        Dim id
        Dim Hodcode
        Try

            Dim scol As System.Windows.Forms.DataGridViewColumn = Me.dgvReport.SortedColumn
            Dim sorder As ListSortDirection = Me.dgvReport.SortOrder

            id = Me.dgvReport.Item(1, Me.dgvReport.CurrentCell.RowIndex).Value
            Dim lastid = Me.dgvReport.CurrentCell.RowIndex
            'Dim nRowIndex As Integer = DgvMonthAttendance.Rows.Count - 1
            Dim nRowIndex As Integer = Me.dgvReport.CurrentCell.RowIndex
            '' Hodcode = Me.DgvMonthAttendance.Item(15, Me.DgvMonthAttendance.CurrentCell.RowIndex).Value
            'Hodcode = Me.DgvMonthAttendance.Item(13, Me.DgvMonthAttendance.CurrentCell.RowIndex).Value
            'Hodcode = Me.DgvMonthAttendance.Item(16, Me.DgvMonthAttendance.CurrentCell.RowIndex).Value
            ''If Hodcode = 0 Then
            dgvReport.Rows(nRowIndex).DefaultCellStyle.BackColor = Color.Brown
            Dim mobjempmaster As New frmEmployeeMaster(id, 2)
            mobjempmaster.StartPosition = FormStartPosition.CenterScreen
            '' LoadForm(mobjempmaster)
            '' mobjempmaster.ShowDialog()
            mobjempmaster.MdiParent = mdiMain
            mobjempmaster.BringToFront()
            mobjempmaster.Show()

            btn_Go.PerformClick()

            dgvReport.Rows(nRowIndex).Selected = True
            'DgvMonthAttendance.Rows(nRowIndex).Cells(0).Selected = True

            dgvReport.CurrentCell = dgvReport.Rows(nRowIndex).Cells(0)
            'Else
            'MessageBox.Show("Contact Admin")
            'Exit Sub
            'End If

        Catch ex As Exception

        End Try
    End Sub
    Private Sub LoadForm(ByVal frmName As Form)
        For Each currentForm As Form In Me.MdiChildren
            If frmName.GetType Is currentForm.GetType Then
                currentForm.Activate()
                Return
            End If
        Next
        frmName.MdiParent = Me
        frmName.BringToFront()
        frmName.Show()
    End Sub

    Private Sub Chkselectall_CheckedChanged(sender As Object, e As EventArgs) Handles Chkselectall.CheckedChanged
        ''  selectDGVEmployee()
        Dim num As Integer = 0
        If Me.Chkselectall.Checked = True Then
            For num = 0 To Me.dgvReport.Rows.Count - 1
                Me.dgvReport.Rows(num).Cells(0).Value = True
            Next
        Else
            For num = 0 To Me.dgvReport.Rows.Count - 1
                Me.dgvReport.Rows(num).Cells(0).Value = False
            Next
        End If
    End Sub

    Private Sub BtnMailsend_Click(sender As Object, e As EventArgs) Handles BtnMailsend.Click
       





        Dim mdates As String = ""
        mdates = Format(Dtpfromdate.Value, "MMMM-yyyy")
        Try

            For i As Integer = 0 To Me.dgvReport.Rows.Count - 1
                If Convert.ToBoolean(Me.dgvReport.Rows(i).Cells(0).Value = True) Then
                    Text = " Attendance Starts Successfully."
              


            'Check condition

            Dim mempcode As String
                    mempcode = dgvReport.Rows(i).Cells(2).Value
            Dim memailid = dgvReport.Rows(i).Cells(4).Value
            Dim mname = dgvReport.Rows(i).Cells(2).Value
            Dim crysview As New frmRepView
            Dim crysrep As New ReportDocument

            Dim dsMain As New DataSet
            Dim dsEarning As New DataSet
            Dim dsDeductions As New DataSet
            dsMain = Nothing
            dsMain = New DataSet

            SSQL = ""
                    SSQL = "select *  from  Fun_PRoll_Payslip ('2022-11-30' )   where   empcode    ='" & mempcode & " '"
            dsMain = ReturnMultipleValue(SSQL, mvarDbasename)

            'dsMain = mobjclssalaryreport.GetEmpPayslip_Report(mselectedvalues, sex, ATM, CbxEmpname.Text, mempcode, mFromDate, mvarEnddate, mfilterdata, "GetEmp_Payslip_Details")
            If dsMain.Tables(0).Rows.Count <= 0 Then Exit Sub

            SSQL = ""
                    SSQL = "select *  from  Fun_PRoll_Earnings ('2022-11-30'  ) where   empcode    ='" & mempcode & " '"
            dsEarning = ReturnMultipleValue(SSQL, mvarDbasename)

            SSQL = ""
                    SSQL = "select *  from  Fun_PRoll_Deduction ('2022-11-30' )  where   empcode    ='" & mempcode & " '"
            dsDeductions = ReturnMultipleValue(SSQL, mvarDbasename)

            'dsEarning = mobjclssalaryreport.GetEmpSalaryDetails_Report(mselectedvalues, sex, ATM, msaldate, mvarEnddate, mfilterdata, "Earning")
            'dsDeductions = mobjclssalaryreport.GetEmpSalaryDetails_Report(mselectedvalues, sex, ATM, msaldate, mvarEnddate, mfilterdata, "Deductions")

            If dsMain.Tables(0).Rows.Count <= 0 Then Exit Sub
            ''   strFileLocation = mvarReportPath & "\REPORTS\REGULAR\SALES\Sales_Invoice_Export_A4_QR.rpt"
            mvarReportName = mvarReportPath & "\REPORTS\HRD\Salary\LS_HRDSalaryPayslip_Model1.rpt"

            crysview.Text = "Sales Invoice"
            crysrep.Load(mvarReportName)
            crysrep.SetDataSource(dsMain.Tables(0))
            If dsEarning.Tables(0).Rows.Count >= 1 Then
                crysrep.Subreports.Item("Earning").SetDataSource(dsEarning.Tables(0))
            End If
            If dsDeductions.Tables(0).Rows.Count >= 1 Then
                crysrep.Subreports.Item("Deduction").SetDataSource(dsDeductions.Tables(0))
            End If

            crysview.CrystalReportViewer1.ReportSource = crysrep
            crysview.CrystalReportViewer1.Refresh()
            ' ''crysrep.PrintToPrinter(1, False, 1, 1)
            crysview.CrystalReportViewer1.Zoom(100)
            '     crysview.Show()

            crysrep.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, "D:\Reports\" + mdates + "_" + mempcode + "Payslip.pdf")
            Dim mfilename As String
            mfilename = "D:\Reports\" + mdates + "_" + mempcode + "Payslip.pdf"
            crysrep.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, mfilename)
            Dim msubject As String = "Salary Slip of " + mname + "for " + mdates + "Regards"
                    If mempcode = "BR620" Then
                        'PayslipMailSend(mname, mdates, memailid, msubject, mfilename)
                        Employee_Payslip_MailSend(mname, mdates, memailid, msubject, mfilename)


                    Else

                    End If
                Else

                End If
            Next

            'Dim Smtp_Server As New SmtpClient
            'Dim e_mail As New MailMessage()

            'Smtp_Server.UseDefaultCredentials = False
            'Smtp_Server.Credentials = New Net.NetworkCredential("R9944494264@gmail.com", "wycsupthsoeugydy")
            'Smtp_Server.Port = 587
            'Smtp_Server.EnableSsl = True
            'Smtp_Server.Host = "smtp.gmail.com"
            'e_mail = New MailMessage()
            'e_mail.From = New MailAddress("R9944494264@gmail.com")
            'e_mail.To.Add("R9944494264@gmail.com")
            'e_mail.Subject = "Pay Slip For L.S Spinning Mills  Pvt Limited..."
            'e_mail.IsBodyHtml = False
            'e_mail.Body = ""
            'Dim attachment As System.Net.Mail.Attachment
            'attachment = New System.Net.Mail.Attachment(mfilename)
            'e_mail.Attachments.Add(attachment)
            'Smtp_Server.Send(e_mail)
            'MsgBox("Mail Sent")

        Catch error_t As Exception
            MsgBox(error_t.ToString)
        End Try
    End Sub


    Private Function Employee_Payslip_MailSend(mname As String, mdates As String, memailid As String, msubject As String, mfilename As String) As Integer
        Try

            If memailid <> "" And memailid <> "0" Then

                Dim mfrommailid As String = "R9944494264@gmail.com"

                Dim mail As New MailMessage()

                Dim SmtpServer As New SmtpClient("smtp.gmail.com")
                SmtpServer.UseDefaultCredentials = False
                SmtpServer.EnableSsl = True
                SmtpServer.Host = "smtp.gmail.com"
                SmtpServer.Credentials = New Net.NetworkCredential("R9944494264@gmail.com", "wycsupthsoeugydy")
                SmtpServer.Port = 587

                mail.From = New MailAddress(mfrommailid) 'your_email_address@gmail.com
                mail.[To].Add(memailid) 'to_address
                mail.Subject = msubject

                Dim htmlString As String = "<html>" _
                    & "  <body>" _
                        & "   <p> Dear " + mname + " </br></p>" _
                        & "   <p>  Please find attached Salary Slip of " + mname + " for " + mdates + "." _
                        & "           .</p>" _
                    & "      <p> Regards,<br/>HR </br> L.S. Spinning Mills Private Limited </br> </p>" _
                    & "     </body>" _
                    & "     </html>"

                mail.IsBodyHtml = True  ' mail with attachment
                mail.Body = htmlString ' mail with attachment

                Dim attachment As System.Net.Mail.Attachment
                attachment = New System.Net.Mail.Attachment(mfilename)
                mail.Attachments.Add(attachment)


              
                SmtpServer.Send(mail)
                ''  MessageBox.Show("mail Send")
                attachment.Dispose()
            Else

            End If
        Catch ex As Exception
            Show_Message(ex.Message.ToString())
        End Try
    End Function

End Class