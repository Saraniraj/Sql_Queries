#Region "Imports"
Imports System
Imports System.IO
Imports System.Globalization
Imports CrystalDecisions.CrystalReports.Engine

Imports C1.Win.C1FlexGrid
Imports C1.Win.C1FlexGrid.Classic
Imports System.Data.OleDb

#End Region

Public Class FrmIns_Mechanic_HelperLink_Entry
    Dim mvarReportName As String

    Dim mobjclsEmployeeReport As New clsEmployee_Report

    Dim mobjclsIncentive_Entry As New clsIncentive_Entry

    Private mempcode, mempid, mempname As String
    'Public  Columns As  C1.Win.C1FlexGrid.ColumnCollection
    Private _flex As C1.Win.C1FlexGrid.C1FlexGrid
    Dim strFilename As String
    Dim intCol, intRow As Integer
    Dim xlFileName As String
    Dim str As String

    Private Sub FrmIns_Mechanic_HelperLink_Entry_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Application.EnableVisualStyles()
            Me.KeyPreview = True

            '  Form_Clear()
            Fill_Combo_Details()

            Fill_Grid_Title()
            Fill_Numbering_Type()
            C1Tab2.SelectedIndex = 0
            dtpEntryDate.Value = Now
            dtpEntryDate.Enabled = True

            Load_Earn_Details()

            ' dtpSaldate.Value = mtodate.AddMonths(-1)
            Me.InitializeForm("Mechanic Helper Link Entry")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub Load_Earn_Details()
        Try

            CbxEarning.Items.Clear()

            CbxEarning.Items.Add("Allowance")

            CbxEarning.Text = CbxEarning.Items(0)
            CbxEarning.Sorted = True

        Catch ex As Exception
            Show_Message(ex.Message.ToString())
        End Try
    End Sub
    Private Sub Fill_Grid_Title()
        Try
            With c1fgItems
                .Clear()

                .Cols = 4
                .Rows = 1
                .FixedCols = 9

                .AllowDragging = C1.Win.C1FlexGrid.AllowDraggingEnum.None
                .Editable = C1.Win.C1FlexGrid.Classic.EditableSettings.flexEDKbd
                .set_TextMatrix(0, 0, "Sl.No.")
                .set_TextMatrix(0, 1, "Mech_EmpCode")
                .set_TextMatrix(0, 2, "Mech_EmpID")
                .set_TextMatrix(0, 3, "Mech_EmpName")
                .set_TextMatrix(0, 4, "Mech_Percentage")

                .set_TextMatrix(0, 5, "Helper_EmpCode")
                .set_TextMatrix(0, 6, "Helper_EmpID")
                .set_TextMatrix(0, 7, "Helper_EmpName")
                .set_TextMatrix(0, 8, "Helper_Percentage")
 
    
                .set_ColWidth(0, 50)
                .set_ColWidth(1, 80)
                .set_ColWidth(2, 0)
                .set_ColWidth(3, 150)
                .set_ColWidth(4, 120)
                .set_ColWidth(5, 80)
                .set_ColWidth(6, 80)
                .set_ColWidth(7, 80)
                .set_ColWidth(8, 80)
              

                '.set_ColComboList(1, "|A|L")
                '.set_ColComboList(0, strComboList)
                .Cell(C1.Win.C1FlexGrid.Classic.CellPropertySettings.flexcpAlignment, 0, 0, 0, 7) = 3
                .Cell(C1.Win.C1FlexGrid.Classic.CellPropertySettings.flexcpFontBold, 0, 0, 0, 7) = True
                .ShowErrors = True

                '' make the grid look nice
                .ShowCursor = True

                '.Rows = .Rows + 1

                '.set_TextMatrix(1, 0, .Rows)
                '.Col = 1
                '.Editable = C1.Win.C1FlexGrid.Classic.EditableSettings.flexEDKbd
                ' ''     .Focus()

                Dim cs As CellStyle = .Styles.Add("emp")

                cs = .Styles.Add("curr")
                cs.DataType = GetType(Integer)
                cs.Format = "0.00"
                cs.ForeColor = Color.DarkGreen
                cs.Font = New Font(Font, FontStyle.Bold)

                'Dim rg As CellRange = .GetCellRange(1, 1)
                'rg.Style = .Styles("emp")

                'For iRow As Integer = 1 To .Rows - 1
                '    .set_TextMatrix(iRow, 0, iRow)
                '    rg = .GetCellRange(iRow, 2, iRow, 3)
                '    rg.Style = .Styles("curr")
                'Next
                '   '' Fill_Auto_Complete_Accounts("")
            End With

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    '    Private Sub c1fgRight_OwnerDrawCell(ByVal sender As System.Object, ByVal e As C1.Win.C1FlexGrid.OwnerDrawCellEventArgs) Handles c1fgRight.OwnerDrawCell
    '        'Dim cs As CellStyle = .Styles.Add("emp")
    '        Dim cs As CellStyle = c1fgRight.Styles.Add("emp")

    '        cs = c1fgRight.Styles.Add("curr")
    '        cs.DataType = GetType(Integer)
    '        cs.Format = "0.00"
    '        cs.ForeColor = Color.DarkGreen
    '        cs.Font = New Font(Font, FontStyle.Bold)

    '        Dim CustomStyle As C1.Win.C1FlexGrid.Classic.CellStyle = C1.Win.C1FlexGrid.Classic.Styles.Add("CustomStyle")
    '        CustomStyle.BackColor = Color.DarkGreen
    'c1FlexGrid1.Cols[4].Style = CustomStyle

    '        c1fgRight.Cols(e.Col).StyleNew.BackColor = Color.White

    '        If e.Col = 0 And e.Row = 0 Then
    '            c1fgRight.Cols(e.Col).StyleNew.BackColor = Color.Blue
    '        End If
    '        If e.Col = 0 And e.Row = 1 Then
    '            c1fgRight.Cols(e.Col).StyleNew.BackColor = Color.Red
    '        End If

    '    End Sub
    Private Sub Fill_Combo_Details()
        ''  Fill_CBX_details("select distinct (groupname),deptgroupcode from deptgroup", dbNames, CbxDeptGroup)

        Try

            ds = Nothing
            ds = New DataSet
            SSQL = ""
            SSQL = "select DeptName,DeptCode from Deptmaster  Where  Location_Code='" & mvarLocationCode & "'  and is_active='1'   ORDER BY DeptName "
            ds = ReturnMultipleValue(SSQL, mvarDbasename)
            If ds.Tables(0).Rows.Count <= 0 Then
                '  Show_Message("Please Enter  Dept Group Master.")
            Else

                Dim newRow As DataRow = ds.Tables(0).NewRow()
                newRow(0) = "ALL"
                newRow(1) = "0"
                ds.Tables(0).Rows.Add(newRow)
                CbxCategory.DataSource = ds.Tables(0).DefaultView
                CbxCategory.DisplayMember = "DeptName"
                CbxCategory.ValueMember = "DeptCode"
                ds.Dispose()
            End If

            ''    CbxCategory.Text = "ALL"

        Catch ex As Exception
            Show_Message(ex.Message)
        Finally
            If Not ds Is Nothing Then
                ds.Dispose()
            End If
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

    Private Sub Fill_Numbering_Type()
        Try
            cbxNumberType.DataBindings.Clear()
            cbxNumberType.DataSource = Nothing

            ds = GetNumberTypeDetails("Mechanic Helper Link Entry", 0)
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub
            With cbxNumberType
                .Items.Clear()
                .DataSource = ds.Tables(0)
                .DisplayMember = "Number_Type"
                .SelectedIndex = 0
            End With
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Public Sub InitializeForm(ByVal mvarScreenName As String)
        Try
            FillScreenMode(mvarScreenName, cbxScreenMode)
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub cbxScreenMode_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbxScreenMode.SelectedIndexChanged
        GetDisableEnableControl()
    End Sub

    Private Sub cbxScreenMode_Leave(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbxScreenMode.Leave
        GetDisableEnableControl()
    End Sub
    Private Sub GetDisableEnableControl()
        Try
            btnReset.Enabled = False
            If cbxScreenMode.Text = "Add" Then
                btnApply.Enabled = True
                btnClear.Enabled = True
                btnPickList.Enabled = False
                btnReset.Enabled = False
                ''Form_Clear()
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
                btnApply.Enabled = True
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
    Sub Form_Clear()

        TxtEntryno.Text = ""
        dtpEntryDate.Value = Today
        dtpEntryDate.Enabled = True

        lblTotalCount.Text = ""
        TxttotOT_Amt.Text = ""
        CbxCategory.SelectedValue = 0
        CbxEarning.SelectedValue = 0

        CbxEarning.Text = ""
        CbxCategory.Text = ""
        Fill_Grid_Title()
        CbxCategory.Focus()

    End Sub

    Private Sub btnClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnReset.Click, btnClear.Click
        Form_Clear()
    End Sub

    Private Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClose.Click
        Me.Close()
    End Sub

    Private Sub btnPickList_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPickList.Click
        Try

            Fill_Grid_Title()
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing
            ds = mobjclsIncentive_Entry.GetIns_MechanicIncentive_Details("", "", "", "ALL")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Mechanic Incentive Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            TxtEntryno.Text = dtPickList.Rows(0)("Entry_No")
            dtpEntryDate.Value = dtPickList.Rows(0)("Entry_Date")

            CbxCategory.Text = dtPickList.Rows(0)("Deptname")
            CbxEarning.Text = dtPickList.Rows(0)("Allow_Name")

            '  TxtShiftallow.Text = dtPickList.Rows(0)("Total_Hours")
            '  TxtTrainTopic.Text = dtPickList.Rows(0)("Train_Topic")

            dtpEntryDate.Enabled = False
            Fill_Screen_Details()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub Fill_Screen_Details()
        Try
            If Trim(TxtEntryno.Text) = "" Then Exit Sub

            ds = Nothing
            ds = New DataSet
            ds = mobjclsIncentive_Entry.GetIns_MechanicIncentive_Details(Trim(TxtEntryno.Text), "", "", "Specify")
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            ''   dtpOTdate.Value = CheckNullValues(ds.Tables(0).Rows(0)("OT_Date"), 1)
            Dim sno As Integer = 0
            For iRow As Integer = 0 To ds.Tables(0).Rows.Count - 1
                With c1fgItems
                    .Rows = .Rows + 1
                    sno = sno + 1
                    '.set_TextMatrix(iRow + 1, 1, .Rows - 1)
                    .set_TextMatrix(iRow + 1, 0, sno)
                    ''   .set_TextMatrix(iRow + 1, 1, ds.Tables(0).Rows(iRow)("SNo"))
                    .set_TextMatrix(iRow + 1, 1, ds.Tables(0).Rows(iRow)("EmpCode"))
                    .set_TextMatrix(iRow + 1, 2, ds.Tables(0).Rows(iRow)("EmpID"))
                    .set_TextMatrix(iRow + 1, 3, ds.Tables(0).Rows(iRow)("EmpName"))
                    .set_TextMatrix(iRow + 1, 4, ds.Tables(0).Rows(iRow)("Deptname"))
                    .set_TextMatrix(iRow + 1, 5, ds.Tables(0).Rows(iRow)("Amount"))
                    .set_TextMatrix(iRow + 1, 6, ds.Tables(0).Rows(iRow)("DeptCode"))
                End With
            Next
            lblTotalCount.Text = c1fgItems.Rows - 1
            Calculate_Charges()
        Catch ex As Exception
            Show_Message(ex.Message)
            'Form_Clear()
        End Try
    End Sub

    Private Sub Calculate_Charges()

        Try
            TxttotOT_Amt.Text = "0.0"
            Dim mtotOT_AMt As Double = 0
            For iRow As Integer = 1 To c1fgItems.Rows - 1
                mtotOT_AMt = Val(mtotOT_AMt) + Val(c1fgItems.get_TextMatrix(iRow, 5))
            Next
            TxttotOT_Amt.Text = mtotOT_AMt

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try

    End Sub

    Private Sub GridViewSno_update()
        Try
            Dim sno As Integer
            sno = 1
            For iRow As Integer = 1 To c1fgItems.Rows - 1
                c1fgItems.set_TextMatrix(iRow, 0, sno)
                sno = sno + 1

            Next

            sno = 1
            For iRow As Integer = 1 To c1fgItems.Rows - 1
                c1fgItems.set_TextMatrix(iRow, 0, sno)

                sno = sno + 1
            Next

            c1fgItems.set_ColSort(1, C1.Win.C1FlexGrid.Classic.SortSettings.flexSortNumericDescending)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub c1fgRight_KeyUp(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles c1fgItems.KeyUp
        Try
            If e.KeyCode = Keys.Delete Then
                If c1fgItems.Rows = 1 Then Exit Sub
                If ShowYesNo(" Do you want to delete?." _
                                                  & vbCrLf & c1fgItems.get_TextMatrix(c1fgItems.RowSel, 2) & "   " & c1fgItems.get_TextMatrix(c1fgItems.RowSel, 4)) = MsgBoxResult.Yes Then

                    c1fgItems.RemoveItem(c1fgItems.RowSel)
                Else
                End If

            End If

            If e.KeyCode = Keys.Home Then

                Exit Sub
            End If
            lblTotalCount.Text = c1fgItems.Rows - 1
            Calculate_Charges()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub c1fgRight_GetCellErrorInfo(ByVal sender As System.Object, ByVal e As C1.Win.C1FlexGrid.GetErrorInfoEventArgs) Handles c1fgItems.GetCellErrorInfo
        If c1fgItems.ColSel = 5 Then

        End If
    End Sub

    Private Sub c1fgRight_BeforeEdit(ByVal sender As System.Object, ByVal e As C1.Win.C1FlexGrid.RowColEventArgs) Handles c1fgItems.BeforeEdit
        Try
            If e.Col = 0 Or (e.Col = 5) Then

                'With c1fgItems
                '    Dim NewStyle1 As C1.Win.C1FlexGrid.CellStyle
                '    NewStyle1 = .Styles.Add("NewStyle1")
                '    NewStyle1.BackColor = System.Drawing.Color.Blue
                '    .SetCellStyle(e.Row, e.Col, NewStyle1)

                '    'Dim NewStyle2 As C1.Win.C1FlexGrid.CellStyle
                '    'NewStyle2 = .Styles.Add("NewStyle2")
                '    'NewStyle2.BackColor = System.Drawing.Color.Red
                '    '.SetCellStyle(1, 0, NewStyle2)
                'End With

                e.Cancel = False
            Else
                e.Cancel = True
            End If

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub c1fgRight_AfterEdit(ByVal sender As System.Object, ByVal e As C1.Win.C1FlexGrid.RowColEventArgs) Handles c1fgItems.AfterEdit

        'Dim infostyle As C1.Win.C1FlexGrid.CellStyle
        'infostyle = c1fgItems.Styles.Add("info")
        'infostyle.BackColor = System.Drawing.Color.LightYellow

        If c1fgItems.RowSel < c1fgItems.Rows Then
            If c1fgItems.ColSel <= c1fgItems.Cols - 1 Then
                c1fgItems.KeyActionEnter = C1.Win.C1FlexGrid.KeyActionEnum.MoveAcross
                Dim mrout = c1fgItems.ColSel
                If (c1fgItems.ColSel = 5) Then

                    Dim Allowance As Double = Val(c1fgItems.get_TextMatrix(c1fgItems.RowSel, 5))
                    'Dim OT_Amount As Double = Val(c1fgItems.get_TextMatrix(c1fgItems.RowSel, 6))

                    Dim OTher_Amount As Double = Allowance
                    c1fgItems.set_TextMatrix(c1fgItems.RowSel, 5, OTher_Amount)

                    With c1fgItems
                        Dim NewStyle1 As C1.Win.C1FlexGrid.CellStyle
                        NewStyle1 = .Styles.Add("NewStyle1")
                        NewStyle1.BackColor = System.Drawing.Color.AliceBlue
                        .SetCellStyle(e.Row, e.Col, NewStyle1)

                    End With
                    Calculate_Charges()
                Else
                    'c1fgRight.set_TextMatrix(c1fgRight.RowSel, 8, "")
                    Exit Sub

                End If
            End If
            Exit Sub
        Else
            If (c1fgItems.RowSel = c1fgItems.Rows - 1 And c1fgItems.ColSel = c1fgItems.Cols - 1) Then
                c1fgItems.Rows = c1fgItems.Rows + 1
                c1fgItems.Select(c1fgItems.RowSel + 1, 0)
                c1fgItems.KeyActionEnter = C1.Win.C1FlexGrid.KeyActionEnum.MoveDown
            End If
            Exit Sub
        End If
    End Sub
    Private Sub btnApply_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnApply.Click

        Dim mvarRecordStatus As Integer = Nothing
        Dim mvarMsgDialogResult As Integer = Nothing
        Dim mvarUpateStatus As Integer = Nothing

        Try
            If cbxScreenMode.Text = "View" Then Exit Sub

            If IsBlankComboBox(cbxScreenMode) Then Exit Sub

            If IsBlankComboBox(CbxEarning) Then Exit Sub
            'mvarRecordStatus = 0

            'If cbxScreenMode.Text = "Delete" Then
            '    mvarRecordStatus = 1

            'Else
            '    'If Val(TxtAmount.Text <= 0) Then
            '    '    Exit Sub
            '    'End If

            'End If

            If Not RemoveSingleQuotes(TxtEntryno.Text) = "" Then
                mvarRecordStatus = GetHRDDeleteAutorize_Status(RemoveSingleQuotes(TxtEntryno.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "Entry_No", "Entry_Date", mvarDbasename & "..Ins_Mechanic_HelperLink_Main", "AUTHORIZE")
                If mvarRecordStatus = 3 Then
                    Show_Message("Already authorized.")
                    Exit Sub
                End If

                mvarRecordStatus = GetHRDDeleteAutorize_Status(RemoveSingleQuotes(TxtEntryno.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "Entry_No", "Entry_Date", mvarDbasename & "..Ins_Mechanic_HelperLink_Main", "DELETE")
                If mvarRecordStatus = 2 Then
                    Show_Message("Already deleted.")
                    Exit Sub
                End If

                mvarRecordStatus = GetHRDDeleteAutorize_Status(RemoveSingleQuotes(TxtEntryno.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "Entry_No", "Entry_Date", mvarDbasename & "..Ins_Mechanic_HelperLink_Main", "")
            End If

            If IsValidDate(Format(dtpEntryDate.Value, "yyyy/MM/dd")) = False Then Exit Sub
            RemoveEmptyRows(c1fgItems, 1)
            If c1fgItems.Rows <= 1 Then
                Show_Message("Please enter line item.")
                Exit Sub
            End If

            Dim mSaveString As String
            Dim mNetTotal As Double = 0

            Select Case cbxScreenMode.Text
                Case "Add"
                    If mvarRecordStatus >= 1 Then
                        mvarMsgDialogResult = ShowYesNo("Fixed Allowance Entry Details   are already exists." _
                                                             & vbCrLf & "Do you want to modify?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            cbxScreenMode.Text = "Modify"
                        ElseIf mvarMsgDialogResult = MsgBoxResult.No Then
                            mvarMsgDialogResult = ShowYesNo("Do you want to create newFixed Allowance Entry Details  ?")
                            If mvarMsgDialogResult = MsgBoxResult.Yes Then

                            Else
                                Exit Sub
                            End If
                        Else
                            Exit Sub
                        End If
                    Else

                    End If
                Case "Modify"
                    If mvarRecordStatus <= 0 Then
                        mvarMsgDialogResult = ShowYesNo("Fixed Allowance Entry Details  are doesn't exist." _
                                                             & vbCrLf & "Do you want to create newFixed Allowance Entry Details?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then

                            cbxScreenMode.Text = "Add"
                        Else
                            Exit Sub
                        End If
                    End If
                Case "Authorize"

                    If mvarRecordStatus <= 0 Then
                        Show_Message("OT details are doesn't exists.")
                        Exit Sub
                    Else
                        mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(TxtEntryno.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "Entry_No", "Entry_Date", mvarDbasename & "..Ins_Mechanic_HelperLink_Line", "AUTHORIZE")
                        mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(TxtEntryno.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                            , "Entry_No", "Entry_Date", mvarDbasename & "..Ins_Mechanic_HelperLink_Main", "AUTHORIZE")

                        If mvarUpateStatus = 3 Then
                            '------------------- Account Posting ------------------------------------------------------------------'

                            Show_Message("Authorized.")
                            Form_Clear()
                        Else
                            Show_Message("Error.")
                        End If
                        Exit Sub
                    End If

                    'If mvarRecordStatus <= 0 Then
                    '    Show_Message(" HRD Manual Attendance  Entry   details are doesn't exists.")
                    '    Exit Sub
                    'Else

                    '    If mvarUpateStatus = 3 Then
                    '        Show_Message("Authorized.")
                    '        Form_Clear()
                    '    Else
                    '        Show_Message("Error.")
                    '    End If
                    '    Exit Sub
                    'End If
                Case "Delete"
                    If mvarRecordStatus >= 1 Then
                        mvarMsgDialogResult = ShowYesNo("Are you sure do you want to delete this record?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            mvarUpateStatus = HRDupdateDeleteAutorize_Status(RemoveSingleQuotes(TxtEntryno.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "Entry_No", "Entry_Date", mvarDbasename & "..Ins_Mechanic_HelperLink_Main", "DELETE")
                            mvarUpateStatus = HRDupdateDeleteAutorize_Status(RemoveSingleQuotes(TxtEntryno.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                             , "Entry_No", "Entry_Date", mvarDbasename & "..Ins_Mechanic_HelperLink_Line", "DELETE")
                            If mvarUpateStatus = 2 Then
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

            mSaveString = ""
            mSaveString = RemoveSingleQuotes(TxtEntryno.Text) & "||"
            mSaveString &= Format(dtpEntryDate.Value, "yyyy/MM/dd") & "||"

            mSaveString &= RemoveSingleQuotes(CbxCategory.SelectedValue) & "||"
            mSaveString &= RemoveSingleQuotes(CbxEarning.Text) & "||"
            mSaveString &= Val(TxttotOT_Amt.Text) & "||"
            mSaveString &= RemoveSingleQuotes(txtOthers.Text) & "||"

            TxtEntryno.Text = mobjclsIncentive_Entry.Save_Ins_Mechanic_HelperLink_Main(mSaveString, cbxScreenMode.Text, c1fgItems, cbxNumberType.Text)
            If TxtEntryno.Text = "Error" Then
                Show_Message("Error.")
                TxtEntryno.Text = ""
                Exit Sub
            Else
                Show_Message("Successfully saved.")
                cbxScreenMode.Text = "Add"
                Form_Clear()
                Exit Sub
            End If

            'Form_Clear()

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try

    End Sub

    Private Sub CbxEarning_KeyDown(sender As Object, e As KeyEventArgs) Handles CbxEarning.KeyDown
        Try

            Get_OtherEarning_Details()
        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub

    Private Sub CbxEarning_Enter(sender As Object, e As EventArgs) Handles CbxEarning.Enter

    End Sub

    Private Sub c1fgRight_AfterSort(ByVal sender As System.Object, ByVal e As C1.Win.C1FlexGrid.SortColEventArgs)
        If e.Col = 0 Then
            e.Cancel = True                         'For supressing default sorting behaviour
        End If
    End Sub

    Private Sub Btnprocess_Click(sender As Object, e As EventArgs) Handles Btnprocess.Click
        Try
            Fill_Grid_Data_Left()
        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub
    Private Sub Fill_Grid_Data_Left()
        Try
            If CbxCategory.SelectedValue Is Nothing Or CbxCategory.SelectedIndex = -1 Then
                MsgBox("Required: Category", MsgBoxStyle.Information, "Information")
                '       ElseIf CbxYear.SelectedValue Is Nothing Or CbxYear.SelectedIndex = -1 Then
                '    MsgBox("Required: Year", MsgBoxStyle.Information, "Information")
                'ElseIf CbxMonth.SelectedValue Is Nothing Or CbxMonth.SelectedIndex = -1 Then
                '    MsgBox("Required: Month", MsgBoxStyle.Information, "Information")
            ElseIf CbxEarning.Text = "" Then
                MsgBox("Required: Earning", MsgBoxStyle.Information, "Information")
            Else
                If IsBlankComboBox(CbxCategory) Then Exit Sub
                If IsBlankComboBox(CbxEarning) Then Exit Sub
                Dim infostyle As C1.Win.C1FlexGrid.CellStyle
                infostyle = c1fgItems.Styles.Add("info")
                infostyle.BackColor = System.Drawing.Color.LightYellow
                If CbxCategory.Text = "" Or CbxCategory.Text = "NONE" Or CbxCategory.Text = "ALL" Then
                    Show_Message("Please Select Department List.")
                    Form_Clear()
                    Exit Sub
                End If
                Fill_Grid_Title()
                Dim sdates As DateTime
                sdates = DateAdd("m", 1, DateSerial(Year(dtpEntryDate.Value), Month(dtpEntryDate.Value), 0))
                ds = Nothing
                ds = New DataSet
                ds = mobjclsEmployeeReport.Get_EmpMaster_Details("", Trim(CbxCategory.Text), "", "", "", "", "", "", Format(sdates, "yyy/MM/dd"), "GetEmployee_DETAILSResgDate")
                If ds.Tables(0).Rows.Count <= 0 Then Exit Sub
                Dim sno As Integer = 0
                Dim NewStyle1 As C1.Win.C1FlexGrid.CellStyle
                NewStyle1 = c1fgItems.Styles.Add("NewStyle1")
                NewStyle1.BackColor = System.Drawing.Color.LightBlue
                NewStyle1.ForeColor = System.Drawing.Color.OrangeRed

                For iRow As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    c1fgItems.Rows = c1fgItems.Rows + 1

                    sno = sno + 1

                    c1fgItems.set_TextMatrix(iRow + 1, 0, sno)
                    c1fgItems.set_TextMatrix(iRow + 1, 1, ds.Tables(0).Rows(iRow)("EmpCode"))
                    c1fgItems.set_TextMatrix(iRow + 1, 2, ds.Tables(0).Rows(iRow)("empid"))

                    c1fgItems.set_TextMatrix(iRow + 1, 3, ds.Tables(0).Rows(iRow)("EmpName"))
                    c1fgItems.set_TextMatrix(iRow + 1, 4, ds.Tables(0).Rows(iRow)("DeptName"))
                    '' c1fgItems.set_TextMatrix(iRow + 1, 7, ds.Tables(0).Rows(iRow)("DeptCOde"))

                    '  c1fgItems.SetCellStyle(iRow + 1, 6, infostyle)
                    c1fgItems.SetCellStyle(iRow + 1, 5, NewStyle1)

                Next
                GridViewSno_update()
                Calculate_Charges()

            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub c1fgRight_KeyPress(sender As Object, e As KeyPressEventArgs) Handles c1fgItems.KeyPress

    End Sub

    Private Sub c1fgRight_KeyPressEdit(sender As Object, e As KeyPressEditEventArgs) Handles c1fgItems.KeyPressEdit
        Try

            If (c1fgItems.ColSel >= 4 Or c1fgItems.ColSel <= 15) Then

                ' If not the characters 0-9, PERIOD, DELETE, or BACKSPACE.
                If Not (e.KeyChar = Chr(48) Or e.KeyChar = Chr(49) Or
                  e.KeyChar = Chr(50) Or e.KeyChar = Chr(51) Or
                  e.KeyChar = Chr(52) Or e.KeyChar = Chr(53) Or
                  e.KeyChar = Chr(54) Or e.KeyChar = Chr(55) Or
                  e.KeyChar = Chr(56) Or e.KeyChar = Chr(57) Or
                  e.KeyChar = Chr(46) Or e.KeyChar = Chr(127) Or
                  e.KeyChar = Chr(8)) Then

                    ' Stop the character from being entered into the
                    ' control since it is an invalid key.
                    e.Handled = True
                End If
            End If

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnExcel_Click(sender As Object, e As EventArgs) Handles btnExcel.Click
        Try
            Export_Excel(c1fgItems)
            Exit Sub
        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub
    Private Sub Export_Excel(ByVal mobjGrid As C1FlexGridClassic)
        Try
            Dim xls As Object = CreateObject("Excel.Application")
            Dim strPath As String = mvarReportPath & "\EXCEL"

            If xls Is Nothing Then
                MessageBox.Show("Excel is not installed on this machine.", "Altius", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                Exit Sub
            End If

            With xls
                .application.visible = True
                .SheetsInNewWorkbook = 3
                .Workbooks.Add()
                .Worksheets(1).Select()

                .Range("A1:I1").MergeCells = True
                .cells(1, 1).value = Format(CDate(mvarServerDate), "dd/MMM/yyyy") & " " & C1Tab2.Text
                .cells(1, 4).EntireRow.Font.Bold = True

                Dim intI As Integer = 1
                Dim intK As Integer = 1

                For intCol As Integer = 0 To mobjGrid.Cols - 1
                    .cells(2, intI).value = mobjGrid.get_TextMatrix(0, intCol)
                    .cells(2, intI).EntireRow.Font.Bold = True
                    intI += 1
                Next

                intI = 3
                intK = 1

                For intRow As Integer = 1 To mobjGrid.Rows - 1
                    intK = 1
                    For intCol As Integer = 0 To mobjGrid.Cols - 1
                        .Cells(intI, intK).value = mobjGrid.get_TextMatrix(intRow, intCol)
                        intK += 1
                    Next
                    intI += 1
                Next

                If Mid$(strPath, strPath.Length, 1) <> "\" Then
                    strPath = strPath & "\"
                End If
                xlFileName = "Manual_OT_Register"
                strFilename = strPath & xlFileName & ".xls"
                .Application.DisplayAlerts = False
                .ActiveCell.Worksheet.SaveAs(strFilename)
                .Application.DisplayAlerts = True
                .application.visible = True
            End With
            System.Runtime.InteropServices.Marshal.ReleaseComObject(xls)
            xls = Nothing
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Get_OtherEarning_Details()
        Try
            ''   If Trim(TxtEntryno.Text) = "" Then Exit Sub

            ds = Nothing
            ds = New DataSet
            SSQL = ""
            SSQL &= "SELECT          "
            SSQL &= " a.Comp_Code,a.Location_Code "
            SSQL &= " ,a.Entry_No,a.Entry_Date "
            SSQL &= " ,a.DeptCode,d.DeptName ,a.Others_Desc "
            SSQL &= "  ,a.Allow_Name         "
            SSQL &= " ,b.Entry_No,b.Entry_Date "
            SSQL &= " ,b.Sno,b.EmpCode,b.EmpID "
            SSQL &= " ,b.Amount"
            SSQL &= " ,d.DeptName,h.DeptCode ,h.EmpName "
            SSQL &= " FROM  Ins_Mechanic_HelperLink_Main as a "
            SSQL &= " left join  Ins_Mechanic_HelperLink_Line as b "
            SSQL &= " on b.Entry_No=a.Entry_No and b.Entry_Date=a.Entry_Date"
            SSQL &= " and b.Location_Code=a.Location_Code "
            SSQL &= " Right join  Emp_Master as h "
            SSQL &= " on h.EmpCode=b.empcode and h.Empid=b.Empid and h.Location_Code=a.Location_Code         "
            SSQL &= " left join Category_Master as c    on c.Location_Code =b.location_code and c.CatCode =h.catcode    "
            SSQL &= " left join Deptmaster as d"
            SSQL &= " on d.Location_Code =b.location_code and d.DeptCode =h.Deptcode"
            SSQL &= " left join Designation as e"
            SSQL &= " on e.Location_Code =b.location_code and e.DesgnCode =h.Desgncode"
            SSQL &= " Where a.Comp_Code='" & mvarCompanyCode & "' "
            SSQL &= " And a.Location_Code ='" & mvarLocationCode & "' "
            SSQL &= " and c.CatName='" & CbxCategory.Text & "' "
            SSQL &= " and a.Allow_Name='" & CbxEarning.Text & "' "

            'SSQL &= " and b.Sdate ='" & Format(dtpSaldate.Value, "yyyy-MM-dd") & "' "

            SSQL &= " And a.Delete_Mode=0     "
            SSQL &= " Order by h.Empid asc       "

            ds = ReturnMultipleValue(SSQL, mvarDbasename)

            If ds.Tables(0).Rows.Count <= 0 Then
                cbxScreenMode.Text = "Add"
                If CbxCategory.Text = "" Or CbxCategory.Text = "ALL" Then
                Else
                    TxtEntryno.Text = ""
                    dtpEntryDate.Value = Now
                    Fill_Grid_Data_Left()

                End If

            Else
                cbxScreenMode.Text = "Modify"
                Fill_Grid_Title()

                TxtEntryno.Text = ds.Tables(0).Rows(1)("Entry_No")
                dtpEntryDate.Value = ds.Tables(0).Rows(1)("Entry_Date")

                CbxCategory.Text = ds.Tables(0).Rows(1)("DeptName")
                CbxEarning.Text = ds.Tables(0).Rows(1)("Allow_Name")
                ''  dtpSaldate.Value = dtPickList.Rows(0)("Sdate")

                Dim sno As Integer = 0
                For iRow As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    With c1fgItems
                        .Rows = .Rows + 1
                        sno = sno + 1
                        '.set_TextMatrix(iRow + 1, 1, .Rows - 1)
                        .set_TextMatrix(iRow + 1, 0, sno)
                        ''   .set_TextMatrix(iRow + 1, 1, ds.Tables(0).Rows(iRow)("SNo"))
                        .set_TextMatrix(iRow + 1, 1, ds.Tables(0).Rows(iRow)("EmpCode"))
                        .set_TextMatrix(iRow + 1, 2, ds.Tables(0).Rows(iRow)("EmpID"))
                        .set_TextMatrix(iRow + 1, 3, ds.Tables(0).Rows(iRow)("EmpName"))
                        .set_TextMatrix(iRow + 1, 4, ds.Tables(0).Rows(iRow)("Deptname"))
                        .set_TextMatrix(iRow + 1, 5, ds.Tables(0).Rows(iRow)("Amount"))
                        .set_TextMatrix(iRow + 1, 6, ds.Tables(0).Rows(iRow)("DeptCode"))
                    End With
                Next
                lblTotalCount.Text = c1fgItems.Rows - 1
            End If

        Catch ex As Exception
            Show_Message(ex.Message)
            'Form_Clear()
        End Try

    End Sub

    Private Sub CbxCategory_Leave(sender As Object, e As EventArgs) Handles CbxCategory.Leave
        Try
            Get_OtherEarning_Details()
        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub

    Private Sub CbxCategory_KeyDown(sender As Object, e As KeyEventArgs) Handles CbxCategory.KeyDown
        Try
            Get_OtherEarning_Details()
        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub

End Class