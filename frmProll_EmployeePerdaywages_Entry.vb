#Region "Imports"
Imports System
Imports System.IO
Imports System.Globalization
Imports CrystalDecisions.CrystalReports.Engine
 
Imports System.Data.OleDb

#End Region

Public Class frmProll_EmployeePerdaywages_Entry
    Dim mobjclsEmployeeReport As New clsEmployee_Report
    Dim mobjclsHRD_Advance As New clsHRD_Advance
    Dim mobjDedution As New clsDeduction_Master

    Private mdate As String = ""

    Private Sub frmEmpPerdaywagesEntry_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Application.EnableVisualStyles()
            Me.KeyPreview = True
            Form_Clear()
            dtpEntryDate.Value = Now

            GetEmpPerdaywages_details()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try

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

    Public Sub InitializeForm(ByVal mvarScreenName As String)
        Try
            FillScreenMode(mvarScreenName, cbxScreenMode)
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub btnClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Try
            Form_Clear()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub Form_Clear()
        Try
            cbxScreenMode.SelectedIndex = 0

            txtID.Text = ""
            TxtAmount.Text = "0"
            txtempcode.Text = ""
            txtempid.Text = ""
            Txtempname.Text = ""

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub btnApply_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnApply.Click
        Dim mvarRecordStatus As Integer = Nothing
        Dim mvarMsgDialogResult As Integer = Nothing
        Dim mvarUpateStatus As Integer = Nothing

        Try
            If cbxScreenMode.Text = "View" Then Exit Sub

            If IsBlanktboxComboBox(cbxScreenMode) Then Exit Sub

            If IsBlankTextBox(txtempcode) Then Exit Sub

            If Not RemoveSingleQuotes(txtID.Text) = "" Then
                mvarRecordStatus = 1
            End If
            Dim mSaveString As String
            Dim mNetTotal As Double = 0

            Select Case cbxScreenMode.Text
                Case "Add"
                    If mvarRecordStatus >= 1 Then
                        mvarMsgDialogResult = ShowYesNo("Employee Minimum Wages Details  details are already exists." _
                                                             & vbCrLf & "Do you want to modify?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            cbxScreenMode.Text = "Modify"
                        ElseIf mvarMsgDialogResult = MsgBoxResult.No Then
                            mvarMsgDialogResult = ShowYesNo("Do you want to create new Employee Minimum Wages Master Details  ?")
                            If mvarMsgDialogResult = MsgBoxResult.Yes Then
                                txtID.Text = ""
                            Else
                                Exit Sub
                            End If
                        Else
                            Exit Sub
                        End If
                    Else
                        txtID.Text = ""
                    End If
                Case "Modify"
                    If mvarRecordStatus <= 0 Then
                        mvarMsgDialogResult = ShowYesNo("Employee Minimum Wages   Details are doesn't exist." _
                                                             & vbCrLf & "Do you want to create new Employee Minimum Wages Details?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            txtID.Text = ""
                            cbxScreenMode.Text = "Add"
                        Else
                            Exit Sub
                        End If
                    End If
                Case "Authorize"
                    If mvarRecordStatus <= 0 Then
                        Show_Message("Employee Minimum Wages Details    details are doesn't exists.")
                        Exit Sub
                    Else
                        If mvarUpateStatus = 3 Then
                            Show_Message("Authorized.")
                            Form_Clear()
                        Else
                            Show_Message("Error.")
                        End If
                        Exit Sub
                    End If
                Case "Delete"
                    If mvarRecordStatus >= 1 Then
                        mvarMsgDialogResult = ShowYesNo("Are you sure do you want to delete this record?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            'mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(tbTransNo.Text), Format(dtptransDate.Value, "yyyy/MM/dd") _
                            '                             , "Trans_No", "Trans_Date", "eStitching..SPP_FabricReceived_Line", "DELETE")
                            mvarUpateStatus = 2
                            If mvarUpateStatus = 2 Then
                                SSQL = ""
                                SSQL = "Delete from  " + mvarDbasename + "..Proll_EmployeePerdaywages_Entry"
                                SSQL &= " Where Empcode='" & Trim(txtempcode.Text) & "'"

                                SSQL &= " and Empid='" & Trim(txtempid.Text) & "'"
                                SSQL &= " And Ded_Date='" & Format(dtpEntryDate.Value, "yyyy-MM-dd") & "'"
                                SSQL &= " And Location_Code='" & mvarLocationCode & "'"
                                SSQL &= " And Type='Paid'"

                                '' SSQL &= "  AND AdvId ='0'"

                                Call InsertDeleteUpdate(SSQL, mvarDbasename)

                                Dim msg As String
                                mSaveString = ""
                                mSaveString &= txtID.Text & "||"
                            

                                msg = DeleteEmpPerdaywages(mSaveString)
                                Show_Message("Deleted.")
                                Form_Clear()
                            Else
                                Show_Message("Error.")
                            End If
                            Exit Sub
                        Else
                            Exit Sub
                        End If
                    End If
                Case Else
                    Exit Sub
            End Select
            Dim misactive As Integer = 0

            If chkIsActive.Checked = True Then
                misactive = 1
            Else
                misactive = 0

            End If
            mSaveString = ""
            mSaveString &= RemoveSingleQuotes(txtID.Text) & "||"
            mSaveString &= Format(dtpEntryDate.Value, "yyyy/MM/dd") & "||"
            mSaveString &= RemoveSingleQuotes(txtempcode.Text) & "||"
            mSaveString &= RemoveSingleQuotes(txtempid.Text) & "||"
            mSaveString &= Val(TxtAmount.Text) & "||"
            mSaveString &= Txtremarks.Text & "||"

            mSaveString &= misactive & "||"
            txtID.Text = mobjclsHRD_Advance.Save_Proll_EmployeePerdaywages_Entry(mSaveString, cbxScreenMode.Text, "")
            If txtID.Text = "Error" Then
                Show_Message("Error.")
                txtID.Text = ""
                Exit Sub
            Else
          

                Exit Sub
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Function DeleteEmpPerdaywages(ByVal mSaveString As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")

6:

        Dim msg As String
        com = New OleDbCommand
        con = New OleDbConnection(GetConnection(mvarDbasename))
        Try

            con.Open()

            com.CommandText = " UPDATE  Proll_EmployeePerdaywages_Entry SET" _
                 & "   IS_Active = 0 " _
                                                  & "   ,[Modified_By] ='" & mvarUserID & "'" _
                                    & "   ,[Modified_Date] ='" & Format(CDate(mvarServerDate), "yyyy/MM/dd") & "'" _
                                    & "  WHERE ID= '" & mInputParam(0) & "'" _
                                    & "  and Ref_No= '" & mInputParam(1) & "'"

            '& "   ,da = '" & mInputParam(2) & "'" _

            com.CommandType = CommandType.Text '',ContactNo,AudharID,Created_By,Created_Date,Modified_By,Modified_Date
            com.Connection = con
            com.ExecuteNonQuery()
            com.Dispose()
            con.Dispose()
            da.Dispose()
        Catch ex As Exception

            da.Dispose()
            com.Dispose()
            con.Dispose()
            msg = ex.Message
        End Try
        Return msg
    End Function
    Private Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClose.Click
        Try
            Me.Close()

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub btnPickList_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPickList.Click
        Try
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing
            ds = mobjclsHRD_Advance.Get_Proll_EmployeePerdaywages_Details("", "ALL")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Employee Minimum Wages Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            txtID.Text = dtPickList.Rows(0)("ID")
            dtpEntryDate.Value = dtPickList.Rows(0)("Paid_Date")
            Fill_Screen_Details()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try

    End Sub
    Public Sub Fill_Screen_Details()
        Try
            If txtID.Text.Trim = "" Then Exit Sub
            ds = Nothing
            ds = New DataSet
            ds = mobjclsHRD_Advance.Get_Proll_EmployeePerdaywages_Details(Trim(txtID.Text), "Specify")
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            If ds.Tables(0).Rows.Count <= 0 Then
                txtID.Text = ""
                Exit Sub
            End If

            txtempcode.Text = CheckNullValues(ds.Tables(0).Rows(0)("Empcode"), 1)
            txtempid.Text = CheckNullValues(ds.Tables(0).Rows(0)("Empid"), 1)
            Txtempname.Text = CheckNullValues(ds.Tables(0).Rows(0)("EmpName"), 1)
         
            TxtAmount.Text = CheckNullValues(ds.Tables(0).Rows(0)("Amount"), 1)
            Txtremarks.Text = CheckNullValues(ds.Tables(0).Rows(0)("Remarks"), 1)

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub GetDisableEnableControl()
        Try
            btnReset.Enabled = False
            If cbxScreenMode.Text = "Add" Then
                btnApply.Enabled = True
                btnClear.Enabled = True
                btnPickList.Enabled = False
                btnReset.Enabled = False
            ElseIf cbxScreenMode.Text = "Modify" Then
                btnReset.Enabled = True
                btnApply.Enabled = True
                btnClear.Enabled = True
                btnPickList.Enabled = True
            ElseIf cbxScreenMode.Text = "Delete" Then
                btnApply.Enabled = True
                btnClear.Enabled = True
                btnPickList.Enabled = True
                btnReset.Enabled = False
            ElseIf cbxScreenMode.Text = "View" Then
                btnApply.Enabled = False
                btnClear.Enabled = True
                btnPickList.Enabled = True
                btnReset.Enabled = False
            ElseIf cbxScreenMode.Text = "Authorize" Then
                btnApply.Enabled = False
                btnClear.Enabled = False
                btnPickList.Enabled = False
                btnReset.Enabled = False
            Else
                btnApply.Enabled = False
                btnClear.Enabled = False
                btnPickList.Enabled = False
                btnReset.Enabled = False
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub cbxScreenMode_SelectedIndexChanged_1(sender As Object, e As EventArgs) Handles cbxScreenMode.SelectedIndexChanged
        GetDisableEnableControl()
    End Sub

    Private Sub cbxScreenMode_Leave_1(sender As Object, e As EventArgs) Handles cbxScreenMode.Leave
        GetDisableEnableControl()
    End Sub
    Private Sub BtnEmployee_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnEmployee.Click
        Try
            mdate = Format(dtpEntryDate.Value, "yyyy/MM/dd")
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing
            ds = mobjclsEmployeeReport.Get_EmpMaster_Details("", "", "", "", "", "", "", "", mdate, "GetEmployee_DETAILSResgDate")

            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Employee Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            Txtempname.Text = dtPickList.Rows(0)("empname")

            txtempcode.Text = dtPickList.Rows(0)("empcode")
            txtempid.Text = dtPickList.Rows(0)("empid")

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

 
 

    Private Sub dgvDepartment_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dgvPayment.CellContentClick
        Try
            txtID.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(0).Value)
            dtpEntryDate.Value = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(1).Value)
            Txtempname.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(2).Value)
            txtempcode.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(3).Value)
            txtempid.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(4).Value)

            TxtAmount.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(6).Value)

            Txtremarks.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(10).Value)

        Catch
            MessageBox.Show("Problem in selecting")
        End Try
    End Sub

    Private Sub dgvDepartment_CellClick_1(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dgvPayment.CellClick

        Try
            txtID.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(0).Value)
            dtpEntryDate.Value = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(1).Value)
            Txtempname.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(2).Value)
            txtempcode.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(3).Value)
            txtempid.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(4).Value)

            TxtAmount.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(6).Value)

         
            Txtremarks.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(10).Value)

            cbxScreenMode.Text = "Modify"

        Catch
            MessageBox.Show("Problem in selecting")
        End Try
    End Sub

    Private Sub dgvDepartment_CellContentDoubleClick_1(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dgvPayment.CellContentDoubleClick

        Try
            txtID.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(0).Value)
            dtpEntryDate.Value = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(1).Value)
            Txtempname.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(2).Value)
            txtempcode.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(3).Value)
            txtempid.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(4).Value)

            TxtAmount.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(6).Value)
           
            Txtremarks.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(10).Value)

            cbxScreenMode.Text = "Modify"
        Catch
            MessageBox.Show("Problem in selecting")
        End Try
    End Sub

    Private Sub dgvDepartment_KeyDown_1(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles dgvPayment.KeyDown
        Try
            txtID.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(0).Value)
            dtpEntryDate.Value = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(1).Value)
            Txtempname.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(2).Value)
            txtempcode.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(3).Value)
            txtempid.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(4).Value)

            TxtAmount.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(6).Value)
         
            Txtremarks.Text = Convert.ToString(Me.dgvPayment.CurrentRow.Cells(10).Value)

            cbxScreenMode.Text = "Modify"
        Catch
            MessageBox.Show("Problem in selecting")
        End Try
    End Sub
    Private Sub GetEmpPerdaywages_details()
        Try
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            da = New OleDbDataAdapter(com)
            dtPickList = Nothing
            ds = mobjclsHRD_Advance.Get_Proll_EmployeePerdaywages_Details("", "ALL")

            If ds.Tables(0).Rows.Count > 0 Then
                dgvPayment.Rows.Clear()
                For Each dtRow In ds.Tables(0).Rows
                    dgvPayment.Rows.Add()
                    dgvPayment.Rows(dgvPayment.RowCount - 1).Cells("colvehicleID").Value = dtRow("ID").ToString()
                    dgvPayment.Rows(dgvPayment.RowCount - 1).Cells("ColEntryDate").Value = dtRow("Paid_Date").ToString()
                    dgvPayment.Rows(dgvPayment.RowCount - 1).Cells("ColEmpname").Value = dtRow("EmpName").ToString()
                    dgvPayment.Rows(dgvPayment.RowCount - 1).Cells("Colempcode").Value = dtRow("Empcode").ToString()
                    dgvPayment.Rows(dgvPayment.RowCount - 1).Cells("Colempid").Value = dtRow("Empid").ToString()
                    dgvPayment.Rows(dgvPayment.RowCount - 1).Cells("ColEarning").Value = dtRow("Type").ToString()
                    dgvPayment.Rows(dgvPayment.RowCount - 1).Cells("Colearnid").Value = dtRow("Ref_No").ToString()

                    dgvPayment.Rows(dgvPayment.RowCount - 1).Cells("ColLoanDate").Value = dtRow("Paid_Date").ToString()
                    dgvPayment.Rows(dgvPayment.RowCount - 1).Cells("ColAMount").Value = dtRow("Amount").ToString()
                    dgvPayment.Rows(dgvPayment.RowCount - 1).Cells("ColRemarks").Value = dtRow("Remarks").ToString()

                Next
                dgvPayment.ClearSelection()
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub



    Private Sub BtnLoanRef_Click(sender As Object, e As EventArgs)
        Try
            Dim meid As Integer = 0
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing
            ds = mobjclsHRD_Advance.Get_HRD_Advance_Main_Details("", "", "", "ALL")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Advance Loan Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
          
            Txtempname.Text = dtPickList.Rows(0)("EmpName")

            txtempcode.Text = dtPickList.Rows(0)("Empcode")
            txtempid.Text = dtPickList.Rows(0)("Empid")

        

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub GroupBox1_Enter(sender As Object, e As EventArgs)

    End Sub

End Class