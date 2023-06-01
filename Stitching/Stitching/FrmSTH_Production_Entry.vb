#Region "Imports"
Imports System
Imports System.IO
Imports System.Globalization
Imports CrystalDecisions.CrystalReports.Engine

Imports C1.Win.C1FlexGrid

#End Region

Public Class FrmDailyOverTime_Entry
    Dim mvarReportName As String
    Dim mobjclsEmployeeReport As New clsEmployee_Report
    Dim mobjclsHRD_Stitching As New clsHRD_Stitching

    Private mothours, Rsperday, motAmount, mShiftallow, motallow, mTotal As Double
    Private mempcode, mempid, mempname As String
    'Public  Columns As  C1.Win.C1FlexGrid.ColumnCollection
    Private _flex As C1.Win.C1FlexGrid.C1FlexGrid

    Private Sub FrmOverTime_Entry_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Application.EnableVisualStyles()
            Me.KeyPreview = True
            Fill_Grid_Title()

            '  Form_Clear()
            Fill_Combo_Details()

            ''     FillList_Details(lstArea, "")
            Fill_Numbering_Type()
            C1Tab2.SelectedIndex = 0
            dtpEntryDate.Value = Now
            dtpEntryDate.Enabled = True
            dtpOTdate.MaxDate = DateTime.Now()

            Me.InitializeForm("STH Production Entry")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Grid_Title()
        Try
            With c1fgItems
                .Clear()

                .Cols = 11
                .Rows = 1
                .FixedCols = 3

                .AllowDragging = C1.Win.C1FlexGrid.AllowDraggingEnum.None
                .Editable = C1.Win.C1FlexGrid.Classic.EditableSettings.flexEDKbd

                .set_TextMatrix(0, 0, "Sl.No.")
                .set_TextMatrix(0, 1, "Emp Code")
                .set_TextMatrix(0, 2, "Token No")
                .set_TextMatrix(0, 3, "SDate")
                .set_TextMatrix(0, 4, "Emp Name")
                .set_TextMatrix(0, 5, "Ops_Code")
                .set_TextMatrix(0, 6, "Operation")

                .set_TextMatrix(0, 7, "Product Name")
                .set_TextMatrix(0, 8, "Rate Per Pcs")
                .set_TextMatrix(0, 9, "No Of Pcs")
                .set_TextMatrix(0, 10, "Amount")

                .set_ColWidth(0, 50)
                .set_ColWidth(1, 0)
                .set_ColWidth(2, 100)
                .set_ColWidth(3, 0)
                .set_ColWidth(4, 100)
                .set_ColWidth(5, 100)
                .set_ColWidth(6, 100)
                .set_ColWidth(7, 100)
                .set_ColWidth(8, 100)
                .set_ColWidth(9, 100)
                .set_ColWidth(10, 100)

                '.set_ColComboList(1, "|A|L")
                '.set_ColComboList(0, strComboList)
                .Cell(C1.Win.C1FlexGrid.Classic.CellPropertySettings.flexcpAlignment, 0, 0, 0, 10) = 3
                .Cell(C1.Win.C1FlexGrid.Classic.CellPropertySettings.flexcpFontBold, 0, 0, 0, 10) = True

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

    Private Sub FillList(ByVal lst As ListBox, ByVal ColName1 As String, ByVal ColName2 As String)
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add(ColName1)
        dt.Columns.Add(ColName2)
        lst.DisplayMember = dt.Columns(1).ColumnName
        lst.ValueMember = dt.Columns(0).ColumnName
        lst.DataSource = dt
    End Sub
    Private Sub FillList_Details(ByVal lst As ListBox, ByVal Str As String)
        ds = Nothing
        ds = New DataSet
        SSQL = ""
        SSQL = "SELECT   EmpCodeId,EmpCode FROM Emp_Master order by empcode"
        ds = ReturnMultipleValue(SSQL, mvarDbasename)

        lst.DataSource = ds.Tables(0)
        lst.DisplayMember = ds.Tables(0).Columns(1).ColumnName
        lst.ValueMember = ds.Tables(0).Columns(0).ColumnName
    End Sub

    Private Sub Fill_Combo_Details()

        Try

            ds = Nothing
            ds = New DataSet
            SSQL = ""
            SSQL = "SELECT  Product_Name,STH_Prod_Code  FROM  STH_Product_Master"
            ds = ReturnMultipleValue(SSQL, mvarDbasename)
            If ds.Tables(0).Rows.Count <= 0 Then
                '   Show_Message("Please Enter  Dept Sub Group Master.")
            Else
                Dim newRow As DataRow = ds.Tables(0).NewRow()
                newRow(0) = "NONE"
                newRow(1) = "0"
                ds.Tables(0).Rows.Add(newRow)
                CbxProductname.DataSource = ds.Tables(0).DefaultView
                CbxProductname.DisplayMember = "Product_Name"
                CbxProductname.ValueMember = "STH_Prod_Code"
                ds.Dispose()
            End If

            CbxProductname.Text = "NONE"

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

    'Private Sub LoadEmp_Details()
    '    Try
    '        Dim mdate As String
    '        mdate = Format(dtpOTdate.Value, "yyyy/MM/dd")
    '        CbxEmployeename.Items.Clear()
    '        Dim mCbxCategory, mdept
    '        ds = Nothing
    '        ds = New DataSet

    '        ds = mobjclsEmployeeReport.Get_EmpMaster_Details(Trim(mCbxCategory), Trim(mdept), "", "", "", "", "", "", mdate, "GetOTEmployee_DETAILSResgDate")
    '        If ds.Tables(0).Rows.Count <= 0 Then
    '            '   Show_Message("Please Enter  Dept Sub Group Master.")
    '        Else
    '            For irow As Integer = 0 To ds.Tables(0).Rows.Count - 1
    '                CbxEmployeename.Items.Add(ds.Tables(0).Rows(irow)(1) & " |#| " & ds.Tables(0).Rows(irow)(0) & " |#| " & ds.Tables(0).Rows(irow)(4))
    '            Next

    '            ds.Dispose()
    '        End If

    '    Catch ex As Exception
    '        Show_Message(ex.Message)
    '    Finally
    '        If Not ds Is Nothing Then
    '            ds.Dispose()
    '        End If
    '    End Try
    'End Sub

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

            ds = GetNumberTypeDetails("STH Production Entry", 0)
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
        dtpOTdate.Value = Today
        TxttotStitchesAmount.Text = 0
        TxttotStitches.Text = 0
        txtempcode.Text = ""
        lblname.Text = ""
        CbxProductname.Text = ""

        CbxOperation.Text = ""
        txtRatePerpiece.Text = ""
        txtNoof_Stitches.Text = ""
        lbl_Amount.Text = ""

        Form_Line_Clear()
        Fill_Grid_Title()

    End Sub

    Sub Form_Line_Clear()
        '  CbxOperatorName.Text = ""

        txtempcode.Text = ""
        lblname.Text = ""
        txtfingerid.Text = ""

        CbxProductname.Text = ""

        CbxOperation.Text = ""
        txtRatePerpiece.Text = ""
        txtNoof_Stitches.Text = ""
        lbl_Amount.Text = ""
        'lblintime.Text = ""
        'lblouttime.Text = ""

    End Sub
    Private Sub btnClear_Line_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_Delete.Click
        Form_Line_Clear()
    End Sub
    Private Sub btnClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Form_Clear()
    End Sub

    Private Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClose.Click
        Me.Close()
    End Sub

    Private Sub CbxEmployeeName_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Try
            'If CbxOperatorName.Text = "" Then Exit Sub

            'Dim empcode() = Split(CbxEmployeeName.Text, "|#|")
            'If CbxEmployeeName.Text = "" Then
            '    txtempcode.Text = ""

            'Else
            '    txtempcode.Visible = True
            '    txtempcode.Text = empcode(1)

            'End If
        Catch ex As Exception
        End Try
    End Sub

    Private Sub CbxEmployeeName_SelectedValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        'Try
        '    'If CbxOperatorName.Text = "" Then Exit Sub
        '    Dim empcode() = Split(CbxEmployeeName.Text, "|#|")
        '    If CbxEmployeeName.Text = "" Then
        '        txtempcode.Text = ""

        '    Else
        '        txtempcode.Visible = True
        '        txtempcode.Text = empcode(1)

        '    End If
        'Catch ex As Exception
        'End Try
    End Sub
    Private Sub CbxCategory_SelectedValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Try

            ' LoadEmp_Details()
        Catch ex As Exception
        End Try
    End Sub
    Private Sub CbxCategory_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Try

            '   LoadEmp_Details()
        Catch ex As Exception
        End Try
    End Sub

    Private Sub btnPickList_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPickList.Click
        Try
            dtpOTdate.Enabled = True
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing
            ds = mobjclsHRD_Stitching.GetSTH_DailyStitching_Details("", "", "", "ALL")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Daily Overtime Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            TxtEntryno.Text = dtPickList.Rows(0)("Entry_No")
            dtpEntryDate.Value = dtPickList.Rows(0)("Entry_Date")
            dtpOTdate.Value = dtPickList.Rows(0)("STH_Date")
            TxttotStitches.Text = dtPickList.Rows(0)("Total_Stitched")
            TxttotStitchesAmount.Text = dtPickList.Rows(0)("Total_Amount")

            dtpEntryDate.Enabled = False
            Fill_Screen_Details()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub Fill_Screen_Details()
        Try
            If Trim(TxtEntryno.Text) = "" Then Exit Sub
            Fill_Grid_Title()

            ds = Nothing
            ds = New DataSet
            ds = mobjclsHRD_Stitching.GetSTH_DailyStitching_Details(Trim(TxtEntryno.Text), "", "", "Specify")
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            Dim sno As Integer = 0
            For iRow As Integer = 0 To ds.Tables(0).Rows.Count - 1
                With c1fgItems
                    .Rows = .Rows + 1
                    sno = sno + 1

                    '.set_TextMatrix(iRow + 1, 1, .Rows - 1)
                    .set_TextMatrix(iRow + 1, 0, sno)
                    '.set_TextMatrix(iRow + 1, 1, ds.Tables(0).Rows(iRow)("SNo"))

                    .set_TextMatrix(iRow + 1, 1, ds.Tables(0).Rows(iRow)("EmpCode"))
                    .set_TextMatrix(iRow + 1, 2, ds.Tables(0).Rows(iRow)("Tokenno"))
                    .set_TextMatrix(iRow + 1, 3, ds.Tables(0).Rows(iRow)("STH_Date"))
                    .set_TextMatrix(iRow + 1, 4, ds.Tables(0).Rows(iRow)("EmpName"))
                    .set_TextMatrix(iRow + 1, 5, ds.Tables(0).Rows(iRow)("Ops_Code"))
                    .set_TextMatrix(iRow + 1, 6, ds.Tables(0).Rows(iRow)("Operation_Name"))
                    .set_TextMatrix(iRow + 1, 7, ds.Tables(0).Rows(iRow)("Product_Name"))
                    .set_TextMatrix(iRow + 1, 8, ds.Tables(0).Rows(iRow)("Rate_Per_Pcs"))
                    .set_TextMatrix(iRow + 1, 9, ds.Tables(0).Rows(iRow)("NO_of_Stitched"))
                    .set_TextMatrix(iRow + 1, 10, ds.Tables(0).Rows(iRow)("Stitched_Amount"))

                End With

            Next
            '  lblTotalCount.Text = c1fgItems.Rows - 1

        Catch ex As Exception
            Show_Message(ex.Message)
            'Form_Clear()
        End Try
    End Sub

    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_Add.Click
        Try
            Try
                Dim mtotgst As Double = 0
                Dim mgross_amt As Double = 0

                If IsBlankTextBox(txtempcode) Then Exit Sub
                If IsBlankTextBox(txtRatePerpiece) Then Exit Sub
                If IsBlankTextBox(txtNoof_Stitches) Then Exit Sub

                If IsBlankComboBox(CbxOperation) Then Exit Sub
                If IsBlankComboBox(CbxProductname) Then Exit Sub

                If Val(txtNoof_Stitches.Text) < 1 Then
                    txtNoof_Stitches.Focus()
                    Exit Sub
                End If
                Dim minvtotamount As Double = 0
                Dim mempname As String = ""

                mempname = lblname.Text

                For iRow As Integer = 1 To c1fgItems.Rows - 1
                    If Trim(c1fgItems.get_TextMatrix(iRow, 2)) = Trim(txtempcode.Text) And Trim(c1fgItems.get_TextMatrix(iRow, 7)) = Trim(CbxProductname.Text) And Trim(c1fgItems.get_TextMatrix(iRow, 6)) = Trim(CbxOperation.Text) Then

                        c1fgItems.set_TextMatrix(iRow, 1, txtempcode.Text)
                        c1fgItems.set_TextMatrix(iRow, 2, txtempcode.Text)
                        c1fgItems.set_TextMatrix(iRow, 3, dtpOTdate.Value)
                        c1fgItems.set_TextMatrix(iRow, 4, lblname.Text)
                        c1fgItems.set_TextMatrix(iRow, 5, CbxOperation.SelectedValue)
                        c1fgItems.set_TextMatrix(iRow, 6, (CbxOperation.Text))
                        c1fgItems.set_TextMatrix(iRow, 7, (CbxProductname.Text))
                        c1fgItems.set_TextMatrix(iRow, 8, (txtRatePerpiece.Text))
                        c1fgItems.set_TextMatrix(iRow, 9, (txtNoof_Stitches.Text))
                        c1fgItems.set_TextMatrix(iRow, 10, (lbl_Amount.Text))

                        Exit Sub
                    End If
                Next

                With c1fgItems
                    .Rows += 1
                    .set_TextMatrix(c1fgItems.Rows - 1, 0, .Rows - 1)

                    .set_TextMatrix(c1fgItems.Rows - 1, 1, txtempcode.Text)
                    .set_TextMatrix(c1fgItems.Rows - 1, 2, txtempcode.Text)
                    .set_TextMatrix(c1fgItems.Rows - 1, 3, dtpOTdate.Value)
                    .set_TextMatrix(c1fgItems.Rows - 1, 4, lblname.Text)
                    .set_TextMatrix(c1fgItems.Rows - 1, 5, CbxOperation.SelectedValue)
                    .set_TextMatrix(c1fgItems.Rows - 1, 6, (CbxOperation.Text))
                    .set_TextMatrix(c1fgItems.Rows - 1, 7, (CbxProductname.Text))
                    .set_TextMatrix(c1fgItems.Rows - 1, 8, (txtRatePerpiece.Text))
                    .set_TextMatrix(c1fgItems.Rows - 1, 9, (txtNoof_Stitches.Text))
                    .set_TextMatrix(c1fgItems.Rows - 1, 10, (lbl_Amount.Text))

                End With
                Calculate_Total()

                txtempcode.Focus()

            Catch ex As Exception
                Show_Message(ex.Message)
            End Try

        Catch ex As Exception
        End Try

    End Sub
    Private Sub Calculate_Total()
        Try

            Dim lblmtotstitches As Double = 0
            Dim lblmtotamount As Double = 0

            Dim mTotAmt As Double = 0
            For iRow As Integer = 1 To c1fgItems.Rows - 1
                lblmtotstitches = Val(lblmtotstitches) + Val(c1fgItems.get_TextMatrix(iRow, 9))
                lblmtotamount = Val(lblmtotamount) + Val(c1fgItems.get_TextMatrix(iRow, 10))

            Next
            TxttotStitches.Text = Format(Val(lblmtotstitches), "########.00")
            TxttotStitchesAmount.Text = Format(Val(lblmtotamount), "########.00")

            Dim cs As CellStyle = c1fgItems.Styles.Add("emp")

            cs = c1fgItems.Styles.Add("curr")
            cs.DataType = GetType(Decimal)
            cs.Format = "0.00"
            cs.ForeColor = Color.DarkGreen
            cs.Font = New Font(Font, FontStyle.Bold)

            Dim rg As CellRange = c1fgItems.GetCellRange(1, 1)
            rg.Style = c1fgItems.Styles("emp")

            rg = c1fgItems.GetCellRange(c1fgItems.Row, 9, c1fgItems.Row, 10)
            rg.Style = c1fgItems.Styles("curr")

        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub
    Private Sub c1fgItems_KeyUp(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles c1fgItems.KeyUp
        Try
            If e.KeyCode = Keys.Delete Then
                If c1fgItems.Rows = 1 Then Exit Sub
                c1fgItems.RemoveItem(c1fgItems.RowSel)
                For iRow As Integer = 1 To c1fgItems.Rows - 1
                    c1fgItems.set_TextMatrix(iRow, 0, iRow)
                Next
            End If

            If e.KeyCode = Keys.Home Then
                If c1fgItems.Rows = 1 Then Exit Sub

                txtempcode.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 1)
                lblname.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 4)
                CbxOperation.SelectedValue = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 5)

                CbxOperation.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 6)
                CbxProductname.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 7)

                txtRatePerpiece.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 8)
                txtNoof_Stitches.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 9)
                lbl_Amount.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 10)

                ''Remove Row Sels
                c1fgItems.RemoveItem(c1fgItems.RowSel)
                For iRow As Integer = 1 To c1fgItems.Rows - 1
                    c1fgItems.set_TextMatrix(iRow, 0, iRow)
                Next

                txtempcode.Focus()
                Exit Sub

            End If

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub GridViewSno_update()
        Try
            Dim sno As Integer
            Dim Tot_Amt, Tot_Hours As Integer

            sno = 1
            For iRow As Integer = 1 To c1fgItems.Rows - 1
                c1fgItems.set_TextMatrix(iRow, 1, sno)
                sno = sno + 1
            Next
            Tot_Amt = 0
            Tot_Hours = 0
            sno = 1
            For iRow As Integer = 1 To c1fgItems.Rows - 1
                c1fgItems.set_TextMatrix(iRow, 1, sno)

                Tot_Hours += c1fgItems.get_TextMatrix(iRow, 7)
                Tot_Amt += c1fgItems.get_TextMatrix(iRow, 11)

                sno = sno + 1
            Next
            TxttotStitches.Text = Tot_Hours
            TxttotStitchesAmount.Text = Tot_Amt
            c1fgItems.set_ColSort(1, C1.Win.C1FlexGrid.Classic.SortSettings.flexSortNumericDescending)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub CbxProductname_Leave(sender As Object, e As EventArgs) Handles CbxProductname.Leave
        Try
            Load_Operation_Details()
        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub
    Private Sub CbxProductname_SelectedValueChanged(sender As Object, e As EventArgs) Handles CbxProductname.SelectedValueChanged
        Try
            '  Load_Operation_Details()
        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub
    Private Sub Load_Operation_Details()
        Try
            CbxOperation.DataSource = Nothing
            CbxOperation.Items.Clear()
            If CbxProductname.Text = "NONE" Or CbxProductname.Text = "ALL" Or CbxProductname.Text = "" Then Exit Sub

            ds = Nothing
            ds = New DataSet
            SSQL = ""
            SSQL = "SELECT  Operation_Name,Ops_Code   FROM  STH_Operation_Master where Product_Name  = '" & CbxProductname.Text & "'"
            ds = ReturnMultipleValue(SSQL, mvarDbasename)
            If ds.Tables(0).Rows.Count <= 0 Then
                '   Show_Message("Please Enter  Dept Sub Group Master.")
            Else
                Dim newRow As DataRow = ds.Tables(0).NewRow()
                newRow(0) = "NONE"
                newRow(1) = "0"
                ds.Tables(0).Rows.Add(newRow)
                CbxOperation.DataSource = ds.Tables(0).DefaultView
                CbxOperation.DisplayMember = "Operation_Name"
                CbxOperation.ValueMember = "Ops_Code"
                ds.Dispose()
            End If

        Catch ex As Exception
            Show_Message(ex.Message)
        Finally
            If Not ds Is Nothing Then
                ds.Dispose()
            End If
        End Try
    End Sub
    Private Sub CbxOperation_Leave(sender As Object, e As EventArgs) Handles CbxOperation.Leave

        Try
            If CbxOperation.Text = "NONE" Or CbxOperation.Text = "ALL" Or CbxOperation.Text = "" Then

                Exit Sub
            Else
                LoadRatePerPiecesDetails()

            End If
        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub
    Private Sub LoadRatePerPiecesDetails()
        Try
            If CbxOperation.Text = "NONE" Or CbxOperation.Text = "ALL" Or CbxOperation.Text = "" Then Exit Sub

            ds = Nothing
            ds = New DataSet
            SSQL = ""
            SSQL = "SELECT  Rate_Per_Pcs   FROM  STH_Operation_Master where Ops_Code  = '" & CbxOperation.SelectedValue & "'"

            ds = ReturnMultipleValue(SSQL, mvarDbasename)
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            txtRatePerpiece.Text = ds.Tables(0).Rows(0).Item("Rate_Per_Pcs")

            ds.Dispose()
        Catch ex As Exception
            Show_Message(ex.Message)
        Finally
            If Not ds Is Nothing Then
                ds.Dispose()
            End If
        End Try

    End Sub
    Private Sub txtRatePerpiece_Leave(sender As Object, e As EventArgs) Handles txtRatePerpiece.Leave
        Try
            Calculate_Amount()
        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub

    Private Sub txtRatePerpiece_MouseDown(sender As Object, e As MouseEventArgs) Handles txtRatePerpiece.MouseDown
        Try
            Calculate_Amount()
        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub

    Private Sub txtNoof_Stitches_KeyDown(sender As Object, e As KeyEventArgs) Handles txtNoof_Stitches.KeyDown
        Try
            '    Calculate_Amount()
        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub

    Private Sub txtNoof_Stitches_Leave(sender As Object, e As EventArgs) Handles txtNoof_Stitches.Leave
        Try
            Calculate_Amount()
        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub
    Private Sub Calculate_Amount()
        Try
            lbl_Amount.Text = 0

            'Dim mOutput As String = ""
            Dim mamount As Double

            'mOutput = CheckOnlyNumeric(tbDCMeter.Text)
            If (Val(txtRatePerpiece.Text) > 0 And Val(txtNoof_Stitches.Text) > 0) Then

                mamount = Val(txtRatePerpiece.Text) * Val(txtNoof_Stitches.Text)
                lbl_Amount.Text = mamount
            Else
                Exit Sub
            End If

        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub

    'Private Sub lstArea_KeyPress(sender As Object, e As KeyPressEventArgs)
    '    Try
    '        If e.KeyChar = ChrW(13) Then

    '            Txtempcode1.Text = lstArea.Text
    '            Txtempcode1.Focus()
    '            pnlEmployee.Visible = False
    '        End If

    '    Catch ex As Exception

    '        Show_Message(ex.Message)

    '    End Try
    'End Sub

    'Private Sub Txtempcode_KeyPress(sender As Object, e As KeyPressEventArgs)
    '    If e.KeyChar = Convert.ToChar(Keys.Enter) Then

    '        If Txtempcode1.Text = "" Then
    '            pnlEmployee.Visible = True
    '            lstArea.Focus()
    '            lstArea.SelectedIndex = 0
    '        Else
    '            pnlEmployee.Visible = False
    '            Txtempcode1.Focus()
    '        End If
    '    ElseIf e.KeyChar = Convert.ToChar(Keys.Back) Then
    '        Txtempcode1.Text = ""
    '    Else
    '        e.KeyChar = Convert.ToChar(0)
    '    End If
    'End Sub
    'Private Sub lstArea_KeyDown(ByVal sender As Object, ByVal e As KeyEventArgs)
    '    If e.KeyCode = Keys.Enter Then

    '        Try
    '            e.SuppressKeyPress = True
    '            Txtempcode1.Text = lstArea.Text
    '            Txtempcode1.Focus()
    '            pnlEmployee.Visible = False
    '        Catch ex As Exception
    '            Show_Message(ex.Message)

    '        End Try
    '    ElseIf e.KeyCode = Keys.Escape Then
    '        e.SuppressKeyPress = True
    '        lstArea.Focus()
    '        lstArea.SelectedIndex = 0
    '        pnlEmployee.Visible = False
    '    End If
    'End Sub
    'Private Sub Txtempcode_KeyDown(sender As Object, e As KeyEventArgs)
    '    If e.KeyCode = Keys.Enter Then

    '        Try
    '            e.SuppressKeyPress = True
    '            Txtempcode1.Text = lstArea.Text
    '            Txtempcode1.Focus()
    '            pnlEmployee.Visible = False
    '        Catch ex As Exception
    '            Show_Message(ex.Message)

    '        End Try
    '    ElseIf e.KeyCode = Keys.Escape Then
    '        e.SuppressKeyPress = True
    '        lstArea.Focus()
    '        lstArea.SelectedIndex = 0
    '        pnlEmployee.Visible = False
    '    End If
    'End Sub

    Private Sub txtempcode_Leave(sender As Object, e As EventArgs) Handles txtempcode.Leave

    End Sub
    Private Sub GetEmployee_Details()
        Try

            Dim mtotshiftallow As Integer = 0
            Dim mtotOTallow As Integer = 0
            Dim mcatname, msex, mdepartment, mempcode As String

            If cbxfilter.Text = "" Then
                mempcode = ""
            Else
                mempcode = LTrim(RTrim(cbxfilter.Text))
            End If
            lblname.Text = ""
            txtempcode.Text = ""
            txtfingerid.Text = ""
            Dim msaldate As String = ""
            msaldate = Format(dtpOTdate.Value, "yyyy/MM/dd")

            If cbxfilter.Text = "NONE" Then
                cbxfilter.Text = ""
            End If
            Dim mempfilter = ""

            ''    Dim empcode() = Split(CbxEmployeename.Text, "|#|")
            If Cbxfilterby.Text = "NONE" Then
                mempfilter = Trim(cbxfilter.Text)
            ElseIf Cbxfilterby.Text = "Ecode" Then
                mempcode = Trim(cbxfilter.Text)
                mempfilter = " and  ecode ='" & mempcode & "'"

            ElseIf Cbxfilterby.Text = "Empid" Then
                mempcode = Trim(cbxfilter.Text)
                mempfilter = "  and Empid ='" & mempcode & "'"

            ElseIf Cbxfilterby.Text = "EmpCode" Then
                mempcode = Trim(cbxfilter.Text)
                mempfilter = " and  EmpCode ='" & mempcode & "'"

            ElseIf Cbxfilterby.Text = "empoldcode" Then

                mempcode = Trim(cbxfilter.Text)
                mempfilter = "  and empoldcode ='" & mempcode & "'"

            Else
                mempfilter = "   "

            End If

            'ds = Nothing
            'ds = New DataSet
            'ds = mobjSalaryReport.Get_EmpRsperday_Details(Trim(CbxCategory.Text), Trim(cbxDept.Text), Trim(CbxDesignation.Text), Trim(txtempcode.Text), msaldate, "", "GetRsperdayBYOTEmp_Details")

            ds = Nothing
            ds = New DataSet

            SSQL = ""
            SSQL &= "  select    "
            SSQL &= "   a.empcode,a.ecode , a.EmpName   "


            SSQL &= "   from  [192.168.68.3].[TGKPayV2].[dbo].[empmas] As a    "
            SSQL &= "    where working=1 and UnitCode=1   "

            SSQL &= "   "
            SSQL &= mempfilter
            'SSQL &= "   EmpCode ='" & mempcode & "'"

            ds = ReturnMultipleValue(SSQL, mvarDbasename)

            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub
            lblname.Text = ds.Tables(0).Rows(0)("EmpName")
            txtempcode.Text = ds.Tables(0).Rows(0)("empcode")
            txtfingerid.Text = ds.Tables(0).Rows(0)("ecode")

        Catch ex As Exception
            Show_Message(ex.Message)
        Finally
            If Not ds Is Nothing Then
                ds.Dispose()
            End If
        End Try

    End Sub

    Private Sub cbxfilter_Leave(sender As Object, e As EventArgs) Handles cbxfilter.Leave
        Try

            GetEmployee_Details()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub txtfingerid_TextChanged(sender As Object, e As EventArgs) Handles txtfingerid.TextChanged

    End Sub

    Private Sub cbxfilter_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbxfilter.SelectedIndexChanged

    End Sub

    Private Sub btnApply_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnApply.Click

        Dim mvarRecordStatus As Integer = Nothing
        Dim mvarMsgDialogResult As Integer = Nothing
        Dim mvarUpateStatus As Integer = Nothing

        Try
            If cbxScreenMode.Text = "View" Then Exit Sub

            If IsBlankComboBox(cbxScreenMode) Then Exit Sub

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
                                                           , "Entry_No", "Entry_Date", mvarDbasename & "..STH_DailyStitchingEntry_Main", "AUTHORIZE")
                If mvarRecordStatus = 3 Then
                    Show_Message("Already authorized.")
                    Exit Sub
                End If

                mvarRecordStatus = GetHRDDeleteAutorize_Status(RemoveSingleQuotes(TxtEntryno.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "Entry_No", "Entry_Date", mvarDbasename & "..STH_DailyStitchingEntry_Main", "DELETE")
                If mvarRecordStatus = 2 Then
                    Show_Message("Already deleted.")
                    Exit Sub
                End If

                mvarRecordStatus = GetHRDDeleteAutorize_Status(RemoveSingleQuotes(TxtEntryno.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "Entry_No", "Entry_Date", mvarDbasename & "..STH_DailyStitchingEntry_Main", "")
            End If

            ''    If IsValidDate(Format(dtpEntryDate.Value, "yyyy/MM/dd")) = False Then Exit Sub
            '   RemoveEmptyRows(c1fgItems, 1)
            If c1fgItems.Rows <= 1 Then
                Show_Message("Please enter line item.")
                Exit Sub
            End If

            Dim mSaveString As String
            Dim mNetTotal As Double = 0

            Select Case cbxScreenMode.Text
                Case "Add"
                    If mvarRecordStatus >= 1 Then
                        mvarMsgDialogResult = ShowYesNo(" Daily Production  Entry Details   are already exists." _
                                                             & vbCrLf & "Do you want to modify?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            cbxScreenMode.Text = "Modify"
                        ElseIf mvarMsgDialogResult = MsgBoxResult.No Then
                            mvarMsgDialogResult = ShowYesNo("Do you want to create new Daily Production  Entry Details  ?")
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
                        mvarMsgDialogResult = ShowYesNo(" Daily Production  Entry Details  are doesn't exist." _
                                                             & vbCrLf & "Do you want to create new Daily Production Entry Details?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then

                            cbxScreenMode.Text = "Add"
                        Else
                            Exit Sub
                        End If
                    End If
                Case "Authorize"

                    If mvarRecordStatus <= 0 Then
                        Show_Message("  Daily Production details are doesn't exists.")
                        Exit Sub
                    Else
                        mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(TxtEntryno.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "Entry_No", "Entry_Date", mvarDbasename & "..STH_DailyStitchingEntry_Line", "AUTHORIZE")
                        mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(TxtEntryno.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                            , "Entry_No", "Entry_Date", mvarDbasename & "..STH_DailyStitchingEntry_Main", "AUTHORIZE")

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
                                                           , "Entry_No", "Entry_Date", mvarDbasename & "..STH_DailyStitchingEntry_Main", "DELETE")
                            mvarUpateStatus = HRDupdateDeleteAutorize_Status(RemoveSingleQuotes(TxtEntryno.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                             , "Entry_No", "Entry_Date", mvarDbasename & "..STH_DailyStitchingEntry_Line", "DELETE")
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
            mSaveString &= Format(dtpOTdate.Value, "yyyy/MM/dd") & "||"

            mSaveString &= RemoveSingleQuotes(Val(TxttotStitches.Text)) & "||"
            mSaveString &= RemoveSingleQuotes(Val(TxttotStitchesAmount.Text)) & "||"
            mSaveString &= "" & "||"

            mSaveString &= RemoveSingleQuotes(txtOthers.Text) & "||"

            TxtEntryno.Text = mobjclsHRD_Stitching.SaveSTH_DailyStitchingEntry_Main(mSaveString, cbxScreenMode.Text, c1fgItems, cbxNumberType.Text)
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

    Private Sub Txt_OTHours_Enter(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Try

        Catch ex As Exception

        End Try
    End Sub

    Private Sub c1fgRight_AfterSort(ByVal sender As System.Object, ByVal e As C1.Win.C1FlexGrid.SortColEventArgs) Handles c1fgItems.AfterSort
        If e.Col = 0 Then
            e.Cancel = True                         'For supressing default sorting behaviour
        End If
    End Sub

    Private Sub c1fgRight_BeforeSort(ByVal sender As System.Object, ByVal e As C1.Win.C1FlexGrid.SortColEventArgs) Handles c1fgItems.BeforeSort
        'If e.Col = 1 Then

        '    ' c1fgRight.set_ColSort(1, C1.Win.C1FlexGrid.Classic.SortSettings.flexSortGenericDescending)
        '    ' c1fgRight.Select(1, 1, 9, 3)
        '    '   c1fgRight.Sort = C1.Win.C1FlexGrid.Classic.SortSettings.flexSortUseColSort

        '    'c1fgRight.set_ColSort(1, C1.Win.C1FlexGrid.Classic.SortSettings.flexSortNumericAscending)

        '    ''c1fgRight.Cell(C1.Win.C1FlexGrid.Classic.CellPropertySettings.flexcpText, 1, 1) = 1
        '    ''c1fgRight.Sort = SortSettings.flexSortNumericAscending

        '    c1fgRight.AllowSorting = C1.Win.C1FlexGrid.AllowSortingEnum.SingleColumn
        '    c1fgRight.ColumnCollection(e.Col).AllowSorting = True
        '    c1fgRight.Select(1, e.Col)
        '    c1fgRight.Sort = C1.Win.C1FlexGrid.Classic.SortSettings.flexSortNumericAscending
        '    c1fgRight.Select(1, 1, 9, 3)

        'Else
        '    c1fgRight.set_ColSort(1, C1.Win.C1FlexGrid.Classic.SortSettings.flexSortStringAscending)

        'End If
    End Sub

    Private Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click

    End Sub

    Private Sub CbxCategory_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub

    Private Sub CbxEtype_SelectedIndexChanged(sender As Object, e As EventArgs)
        Form_Clear()
    End Sub
End Class