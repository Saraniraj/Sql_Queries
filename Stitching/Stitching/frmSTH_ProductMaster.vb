#Region "Imports"
Imports System
Imports System.IO
Imports System.Globalization
Imports CrystalDecisions.CrystalReports.Engine

#End Region

Public Class frmSTH_ProductMaster

    '  Dim mobjDeptmas As New clsdeptgroup
    Dim mobjRD_Stitching As New clsHRD_Stitching
    Dim x, y As Integer
    Dim newpoint As New Point
    Private Sub lblCaption_MouseDown(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs)
        x = Control.MousePosition.X - Me.Location.X
        y = Control.MousePosition.Y - Me.Location.Y
    End Sub

    Private Sub lblCaption_MouseMove(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs)
        If e.Button = Windows.Forms.MouseButtons.Left Then
            newpoint = Control.MousePosition
            newpoint.X -= x
            newpoint.Y -= y
            Me.Location = newpoint
            Application.DoEvents()
        End If
    End Sub

    Public Sub New(ByVal id As Long, ByVal Action As Integer)
        InitializeComponent()
        FillScreenMode("STH Product Master", cbxScreenMode)
        If Action = 1 Then
            cbxScreenMode.Text = "Add"

        ElseIf Action = 2 Then
            cbxScreenMode.Text = "Modify"

        ElseIf Action = 3 Then
            cbxScreenMode.Text = "View"

        End If

        If id = 0 Then Exit Sub
        lblId.Text = id
        GetDisableEnableControl()

        Fill_Screen_Details()

        ''   loadexisting(id)
    End Sub
    Public Sub New()
        InitializeComponent()
        FillScreenMode("STH Product Master", cbxScreenMode)

        GetDisableEnableControl()

        Fill_Screen_Details()

        ''   loadexisting(id)
    End Sub
    Private Sub frmDepartmentMaster_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Application.EnableVisualStyles()
            Me.KeyPreview = True
            'Form_Clear()
            'Fill_Combo_Details()
            'Cbxdeptgroup.Text = "NONE"
            'CbxSubdept.Text = "NONE"
            LoadData()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try

    End Sub
    Private Sub LoadData()
        ''  FillDataComboBox("SELECT * FROM HeadOfAccounts", "HACCID", "HeadOfAccountsName", cmbHeadOfAc)
        FillDataGrid(" select  STH_Prod_Code,Product_Name,Product_Desc,[IS_Active] FROM  STH_Product_Master  order by Product_Name", DgvDisplay, mvarDbasename)
        Me.DgvDisplay.Columns(0).Visible = False
        Me.DgvDisplay.Columns(0).HeaderText = "ID"
    End Sub
    Public Sub LoadDG()
        Try
            ds = Nothing
            ds = New DataSet()
            dt = Nothing
            dt = New DataTable()
            ds = mobjRD_Stitching.Get_STH_Productmaster_Details("", "")
            dt = ds.Tables(0)
            Me.DgvDisplay.DataSource = dt

            Me.DgvDisplay.Columns(0).Visible = False

            'Me.DgvDisplay.Columns(0).HeaderText = "accountGroupId"
            'Me.DgvDisplay.Columns(1).HeaderText = "accountGroupName"
            'Me.DgvDisplay.Columns(2).HeaderText = "groupUnder"
            'Me.DgvDisplay.Columns(3).HeaderText = "GroupunderName"
            'Me.DgvDisplay.Columns(4).HeaderText = "affectGrossProfit"
            'Me.DgvDisplay.Columns(5).HeaderText = "IsActive"

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
    Private Sub btnClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear.Click, btnReset.Click
        Try
            Form_Clear()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub Form_Clear()
        Try
            cbxScreenMode.SelectedIndex = 0
            txtProductName.Text = ""
            lblId.Text = ""
            Txtprod_Desc.Text = ""

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

            If IsBlankComboBox(cbxScreenMode) Then Exit Sub
            If IsBlankTextBox(txtProductName) Then Exit Sub

            If Not RemoveSingleQuotes(lblId.Text) = "" Then
                mvarRecordStatus = 1
            End If
            Dim mSaveString As String
            Dim mNetTotal As Double = 0

            Select Case cbxScreenMode.Text
                Case "Add"
                    If mvarRecordStatus >= 1 Then
                        mvarMsgDialogResult = ShowYesNo("STH Product Master Details  details are already exists." _
                                                             & vbCrLf & "Do you want to modify?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            cbxScreenMode.Text = "Modify"
                        ElseIf mvarMsgDialogResult = MsgBoxResult.No Then
                            mvarMsgDialogResult = ShowYesNo("Do you want to create new STH Product Master Details  ?")
                            If mvarMsgDialogResult = MsgBoxResult.Yes Then
                                lblId.Text = ""
                            Else
                                Exit Sub
                            End If
                        Else
                            Exit Sub
                        End If
                    Else
                        lblId.Text = ""
                    End If
                Case "Modify"
                    If mvarRecordStatus <= 0 Then
                        mvarMsgDialogResult = ShowYesNo("STH Product Master Details are doesn't exist." _
                                                             & vbCrLf & "Do you want to create new STH Product Master  Details?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            lblId.Text = ""
                            cbxScreenMode.Text = "Add"
                        Else
                            Exit Sub
                        End If
                    End If
                Case "Authorize"
                    If mvarRecordStatus <= 0 Then
                        Show_Message("STH Product Master  Details    details are doesn't exists.")
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
            Dim misactive As Integer = 0

            If chkIsActive.Checked = True Then
                misactive = 1
            Else
                misactive = 0

            End If
            mSaveString = ""
            mSaveString &= RemoveSingleQuotes(lblId.Text) & "||"
            mSaveString &= RemoveSingleQuotes(txtProductName.Text) & "||"
            mSaveString &= RemoveSingleQuotes(Txtprod_Desc.Text) & "||"

            mSaveString &= misactive & "||"
            lblId.Text = mobjRD_Stitching.Save_STH_Productmaster(mSaveString, cbxScreenMode.Text, "")
            If lblId.Text = "Error" Then
                Show_Message("Error.")
                lblId.Text = ""
                Exit Sub
            Else
                Show_Message("Successfully saved.")
                cbxScreenMode.Text = "Modify"
                LoadData()
                Form_Clear()
                Exit Sub
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

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
            ds = mobjRD_Stitching.Get_STH_Productmaster_Details("", "")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Department Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            lblId.Text = dtPickList.Rows(0)("STH_Prod_Code")
            Fill_Screen_Details()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try

    End Sub
    Public Sub Fill_Screen_Details()
        Try
            If lblId.Text.Trim = "" Then Exit Sub
            ds = Nothing
            ds = New DataSet
            ds = mobjRD_Stitching.Get_STH_Productmaster_Details(Trim(lblId.Text), "")
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            If ds.Tables(0).Rows.Count <= 0 Then
                lblId.Text = ""
                Exit Sub
            End If
            txtProductName.Text = CheckNullValues(ds.Tables(0).Rows(0)("Product_Name"), 1)
            lblId.Text = CheckNullValues(ds.Tables(0).Rows(0)("STH_Prod_Code"), 1)
            Txtprod_Desc.Text = CheckNullValues(ds.Tables(0).Rows(0)("Product_Desc"), 1)

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub GetDisableEnableControl()
        Try
            btnReset.Enabled = False
            If cbxScreenMode.Text = "Add" Then
                btnApply.Enabled = True
                btnReset.Enabled = True
                btnPickList.Enabled = False
                btnReset.Enabled = False
            ElseIf cbxScreenMode.Text = "Modify" Then
                btnReset.Enabled = True
                btnApply.Enabled = True
                btnReset.Enabled = True
                btnPickList.Enabled = True
            ElseIf cbxScreenMode.Text = "Delete" Then
                btnApply.Enabled = True
                btnReset.Enabled = True
                btnPickList.Enabled = True
                btnReset.Enabled = False
            ElseIf cbxScreenMode.Text = "View" Then
                btnApply.Enabled = False
                btnReset.Enabled = True
                btnPickList.Enabled = True
                btnReset.Enabled = False
            ElseIf cbxScreenMode.Text = "Authorize" Then
                btnApply.Enabled = False
                btnReset.Enabled = False
                btnPickList.Enabled = False
                btnReset.Enabled = False
            Else
                btnApply.Enabled = False
                btnReset.Enabled = False
                btnPickList.Enabled = False
                btnReset.Enabled = False
            End If
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

    Private Sub DGVDisplay_CellClick(ByVal sender As Object, ByVal e As DataGridViewCellEventArgs) Handles DgvDisplay.CellClick
        Try

            If (e.RowIndex <> -1) AndAlso (e.ColumnIndex <> -1) Then
                Me.lblId.Text = Convert.ToString(Me.DgvDisplay.CurrentRow.Cells(0).Value)
                Me.txtProductName.Text = Convert.ToString(Me.DgvDisplay.CurrentRow.Cells(1).Value)

                cbxScreenMode.Text = "Modify"
                Fill_Screen_Details()
            End If

        Catch
            MessageBox.Show("Problem in selecting")
        End Try
    End Sub
    Private Sub DgvDisplay_CellDoubleClick(sender As Object, e As DataGridViewCellEventArgs) Handles DgvDisplay.CellContentDoubleClick
        Try

            If (e.RowIndex <> -1) AndAlso (e.ColumnIndex <> -1) Then
                Me.lblId.Text = Convert.ToString(Me.DgvDisplay.CurrentRow.Cells(0).Value)
                Me.txtProductName.Text = Convert.ToString(Me.DgvDisplay.CurrentRow.Cells(1).Value)

                Fill_Screen_Details()

            End If

        Catch
            MessageBox.Show("Problem in selecting")
        End Try
    End Sub

    Private Sub DgvDisplay_KeyDown(sender As Object, e As KeyEventArgs) Handles DgvDisplay.KeyDown
        Try

            Me.lblId.Text = Convert.ToString(Me.DgvDisplay.CurrentRow.Cells(0).Value)
            Me.txtProductName.Text = Convert.ToString(Me.DgvDisplay.CurrentRow.Cells(1).Value)

            Fill_Screen_Details()
        Catch
            MessageBox.Show("Problem in selecting")
        End Try
    End Sub

    Private Sub DgvDisplay_CellContentClick(sender As System.Object, e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DgvDisplay.CellContentClick

    End Sub

End Class