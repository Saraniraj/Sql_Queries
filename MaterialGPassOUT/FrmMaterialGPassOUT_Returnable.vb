#Region "Imports"
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports CrystalDecisions.CrystalReports.Engine

#End Region
Public Class FrmMaterialGPassOUT_Returnable
    Dim mobjCls_CommonDetails As New Cls_CommonMasterDetails
    Dim mobjclsDeliverychallan As New clsDeliverychallan

    Dim mobjclsLogin As New clsLogin

    Dim mobjclsGatepass As New clsGatepass
    Dim returntype, Return_Mode As String
    Dim mDcnewno As String
    Dim mvarReportName As String
    Private Sub FrmMaterialGatePassOUT_Returnable_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Application.EnableVisualStyles()
            Me.KeyPreview = True
            Fill_Grid_Title()
            Fill_Numbering_Type()

            C1Tab2.SelectedIndex = 0
            dtpGatepassDate.Value = Now
            DtpDCDate.Value = Now
            RdlNotreturn.Checked = False
            RdlNotreturn.Visible = False
            RdlReturn.Checked = True
            fill_Combobox_Details()
            CbxIssuedDept.Text = mvarUserID

            ''  FillProductDetails()
            ''  FIllBearerDetails()
            ''   FillUOMDetails()

            Me.InitializeForm("Material Gatepass OUT")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub fill_Combobox_Details()
        Try

            Fill_CBX_details("  SELECT   distinct [DeptName]  FROM [DB_Common].[dbo].[Dept_master] order by  DeptName        ", "DB_Common", CbxIssuedDept)

            'Fill_CBX_details("  SELECT   distinct [Sender_Recvr_Name]  FROM [DB_General].[dbo].[GEN_Party_Master] where type='Sender' order by  Sender_Recvr_Name        ", "DB_General", CbxFromCompany)
            CbxFromCompany.Text = mvarCompanyName

            'Fill_CBX_details("  SELECT   distinct [Sender_Recvr_Name]  FROM [DB_General].[dbo].[GEN_Party_Master] where type='Receiver' order by  Sender_Recvr_Name        ", "DB_General", CbxTOCompany)
            'Fill_CBX_details("  SELECT   distinct [Party_Name]  FROM [DB_Common].[dbo].[Party_Details] order by  Party_name  ", "DB_Common", CbxTOCompany)
            Fill_CBX_details("  SELECT   distinct [To_Company]  FROM [DB_General].[dbo].[GEN_MaterialpassOUT_Main] order by  To_Company  ", "DB_General", CbxTOCompany)

            Fill_CBX_details("  SELECT   distinct [Vehicle_No]  FROM [DB_General].[dbo].[GEN_MaterialpassOUT_Main] order by  Vehicle_No        ", "DB_General", CbxMaterialfrom)

            Fill_CBX_details("  SELECT   distinct Prod_Code as Prod_Code  FROM [DB_General].[dbo].[GEN_MaterialpassOUT_Line] order by  Prod_Code        ", "DB_General", cbxProdDesc)
            ''distinct[]as

            Fill_CBX_details("  SELECT   distinct Delivered_By as Delivered_By  FROM [DB_General].[dbo].[GEN_MaterialpassOUT_Main] order by  Delivered_By        ", "DB_General", CbxDeliveredBy)

            'Fill_CBX_details("  SELECT   distinct UOM_Code as UOM_Code  FROM [DB_General].[dbo].[GEN_MaterialpassOUT_Line] order by  UOM_Code        ", "DB_General", CbxUOM)
            Fill_CBX_details("  SELECT   distinct UOM_Code as UOM_Code  FROM [DB_Common].[dbo].[UOM_Details] order by  UOM_Code        ", "DB_Common", CbxUOM)

        Catch ex As Exception
            Show_Message(ex.Message)
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
    Private Sub Fill_Grid_Title()
        Try
            With c1fgItems
                .Clear()
                .Rows = 1
                .Cols = 9
                .FixedCols = 0
                .set_TextMatrix(0, 0, "Sl.No.")
                .set_TextMatrix(0, 1, "Prod Desc")
                .set_TextMatrix(0, 2, "Issue Dept")
                .set_TextMatrix(0, 3, "Recd Dept")
                .set_TextMatrix(0, 4, "Return Type")
                .set_TextMatrix(0, 5, "Delivered By")
                .set_TextMatrix(0, 6, "UOM Code")
                .set_TextMatrix(0, 7, "No of Items")
                .set_TextMatrix(0, 8, "Net Wt")

                .set_ColWidth(0, 50)
                .set_ColWidth(1, 100)
                .set_ColWidth(2, 100)
                .set_ColWidth(3, 130)
                .set_ColWidth(4, 100)
                .set_ColWidth(5, 100)
                .set_ColWidth(6, 60)
                .set_ColWidth(7, 60)
                .set_ColWidth(8, 60)

                .Cell(C1.Win.C1FlexGrid.Classic.CellPropertySettings.flexcpAlignment, 0, 0, 0, 8) = 3
                .Cell(C1.Win.C1FlexGrid.Classic.CellPropertySettings.flexcpFontBold, 0, 0, 0, 8) = True

                For iRow As Integer = 1 To .Rows - 1
                    .set_TextMatrix(iRow, 0, iRow)
                Next

            End With
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub Fill_Numbering_Type()
        Try
            cbxNumberType.DataBindings.Clear()
            cbxNumberType.DataSource = Nothing

            ds = GetNumberTypeDetails("Material OUT(Returnable)", 0)
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
            mvarReportName = Me.Text
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
                btnPK_Gatepass.Enabled = False
                btnReset.Enabled = False
                ''Form_Clear()
            ElseIf cbxScreenMode.Text = "Modify" Then
                btnReset.Enabled = True
                btnApply.Enabled = True
                btnClear.Enabled = True
                btnPK_Gatepass.Enabled = True

            ElseIf cbxScreenMode.Text = "Delete" Then
                btnApply.Enabled = True
                btnClear.Enabled = True
                btnPK_Gatepass.Enabled = True
                btnReset.Enabled = False
            ElseIf cbxScreenMode.Text = "View" Then
                btnApply.Enabled = False
                btnClear.Enabled = True
                btnPK_Gatepass.Enabled = True
                btnReset.Enabled = False
            ElseIf cbxScreenMode.Text = "Authorize" Then
                btnApply.Enabled = True
                btnClear.Enabled = False
                btnPK_Gatepass.Enabled = False
                btnReset.Enabled = False
            Else
                btnApply.Enabled = False
                btnClear.Enabled = False
                btnPK_Gatepass.Enabled = False
                btnReset.Enabled = False
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnClear_Line_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear_Line.Click
        Try
            txtNoofitem.Text = ""
            TxtNetwt.Text = ""
            cbxProdDesc.Text = ""
            CbxUOM.Text = ""
            cbxProdDesc.Focus()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAdd.Click

        Try
            If IsBlankComboBox(cbxProdDesc) Then Exit Sub
            If IsBlankTextBox(txtNoofitem) Then Exit Sub
            If IsBlankComboBox(CbxUOM) Then Exit Sub
            If IsBlankTextBox(txtNoofitem) Then Exit Sub

            If Val(txtNoofitem.Text) < 1 Then
                txtNoofitem.Focus()
                Exit Sub
            End If

            If CbxIssuedDept.Text = CbxTOCompany.Text Then
                Show_Message("Issued company and received company are same..pls check it .")
                Exit Sub
            Else

            End If

            With c1fgItems
                .Rows += 1
                .set_TextMatrix(c1fgItems.Rows - 1, 0, .Rows - 1)
                .set_TextMatrix(c1fgItems.Rows - 1, 1, cbxProdDesc.Text)
                .set_TextMatrix(c1fgItems.Rows - 1, 2, CbxIssuedDept.Text)
                .set_TextMatrix(c1fgItems.Rows - 1, 3, CbxTOCompany.Text)
                .set_TextMatrix(c1fgItems.Rows - 1, 4, returntype)
                .set_TextMatrix(c1fgItems.Rows - 1, 5, CbxDeliveredBy.Text)
                .set_TextMatrix(c1fgItems.Rows - 1, 6, CbxUOM.Text)
                .set_TextMatrix(c1fgItems.Rows - 1, 7, Val(txtNoofitem.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 8, Val(TxtNetwt.Text))

                cbxProdDesc.Text = ""
                CbxUOM.Text = ""
                txtNoofitem.Text = ""
                TxtNetwt.Text = ""

            End With
            Calctotalval()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub CbxIssuedcompany_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles CbxIssuedDept.KeyPress
        Me.AutoComplete(Me.CbxIssuedDept, e)
    End Sub

    Private Sub CbxRecdCompany_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles CbxTOCompany.KeyPress
        Me.AutoComplete(Me.CbxTOCompany, e)
    End Sub

    Private Sub CbxDeliveredBy_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles CbxDeliveredBy.KeyPress
        Me.AutoComplete(Me.CbxDeliveredBy, e)
    End Sub

    Private Sub cbxProdDesc_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles cbxProdDesc.KeyPress
        Me.AutoComplete(Me.cbxProdDesc, e)
    End Sub

    Private Sub CbxUOM_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles CbxUOM.KeyPress
        Me.AutoComplete(Me.CbxUOM, e)
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

    Private Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClose.Click
        Try
            Me.Close()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Try
            Form_Clear()
            cbxScreenMode.Text = "ADD"
            CbxFromCompany.Text = mvarCompanyName
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub Form_Clear()
        Try
            Fill_Grid_Title()
            Fill_Numbering_Type()
            C1Tab2.SelectedIndex = 0
            dtpGatepassDate.Value = Now
            CbxDcNo.Checked = True
            '' btnPK_Supplier.Enabled = False
            tbOthers.Text = ""
            TbTotalitem.Text = ""
            txtNoofitem.Text = ""
            TxtNetwt.Text = ""
            txtRefinvno.Text = ""
            dtpRefinvDate.Value = Now
            tbGatepassNo.Text = ""
            tbDcno.Text = ""
            mDcnewno = ""
            CbxDeliveredBy.Text = ""
            'CbxIssuedDept.Text = ""
            CbxTOCompany.Text = ""
            'CbxFromCompany.Text = ""
            Cbxvehicleno.Text = ""
            CbxDelivery.Text = ""
            CbxMaterialfrom.text = ""
            'CbxFromCompany.ResetText()
            'CbxIssuedDept.ResetText()

            CbxTOCompany.ResetText()
            cbxProdDesc.Text = ""
            cbxScreenMode.Text = ""
            cbxScreenMode.Focus()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub c1fgItems_KeyUp(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles c1fgItems.KeyUp
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
                cbxProdDesc.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 1)
                If c1fgItems.get_TextMatrix(c1fgItems.RowSel, 4).ToString = "RETURNABLE" Then
                    RdlReturn.Checked = True
                Else
                    RdlNotreturn.Checked = True

                End If
                CbxUOM.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 6)
                txtNoofitem.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 7)
                TxtNetwt.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 8)

                ''Remove Row Sels
                c1fgItems.RemoveItem(c1fgItems.RowSel)
                For iRow As Integer = 1 To c1fgItems.Rows - 1
                    c1fgItems.set_TextMatrix(iRow, 0, iRow)
                Next

                cbxProdDesc.Focus()

            End If
            Calctotalval()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub btnPK_Gatepass_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_Gatepass.Click
        Try

            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing
            ds = mobjclsGatepass.GetGen_MaterialpassOUTDetails("", "", "", "ALL")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = " Gatepass Out Transaction  Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            tbGatepassNo.Text = dtPickList.Rows(0)("Gpass_No")
            dtpGatepassDate.Value = dtPickList.Rows(0)("Gpass_Date")
            Fill_Screen_Details()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub Fill_Screen_Details()
        Try
            If Trim(tbGatepassNo.Text) = "" Then Exit Sub
            ds = Nothing
            ds = New DataSet
            ds = mobjclsGatepass.GetGen_MaterialpassOUTDetails(Trim(tbGatepassNo.Text), "", "", "SPECIFY")
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            CbxIssuedDept.Text = ds.Tables(0).Rows(0)("Department")
            CbxFromCompany.Text = ds.Tables(0).Rows(0)("From_Company")

            CbxTOCompany.Text = ds.Tables(0).Rows(0)("To_Company")
            CbxDelivery.Text = ds.Tables(0).Rows(0)("Delivery_Location")
            CbxDeliveredBy.Text = ds.Tables(0).Rows(0)("Delivered_By")
            Cbxvehicleno.Text = ds.Tables(0).Rows(0)("vehicle_no")
            txtRefinvno.Text = ds.Tables(0).Rows(0)("Ref_inv_no")
            dtpRefinvDate.Value = ds.Tables(0).Rows(0)("Ref_inv_Date")
            TbTotalitem.Text = ds.Tables(0).Rows(0)("Total_Items")
            Txttotnetwt.Text = ds.Tables(0).Rows(0)("Total_NetWt")
            tbOthers.Text = ds.Tables(0).Rows(0)("Remarks").ToString
            CbxMaterialfrom.Text = ds.Tables(0).Rows(0)("Material_From")

            Fill_Grid_Title()
            c1fgItems.Rows = ds.Tables(0).Rows.Count + 1

            For iRow As Integer = 0 To ds.Tables(0).Rows.Count - 1
                With c1fgItems
                    .set_TextMatrix(iRow + 1, 0, ds.Tables(0).Rows(iRow)("SNo"))
                    .set_TextMatrix(iRow + 1, 1, ds.Tables(0).Rows(iRow)("Prod_Code"))
                    .set_TextMatrix(iRow + 1, 2, ds.Tables(0).Rows(iRow)("From_Company"))
                    .set_TextMatrix(iRow + 1, 3, ds.Tables(0).Rows(iRow)("To_Company"))
                    .set_TextMatrix(iRow + 1, 4, ds.Tables(0).Rows(iRow)("Return_Type"))
                    .set_TextMatrix(iRow + 1, 5, ds.Tables(0).Rows(iRow)("Delivered_By"))
                    .set_TextMatrix(iRow + 1, 6, ds.Tables(0).Rows(iRow)("UOM_Code"))
                    .set_TextMatrix(iRow + 1, 7, ds.Tables(0).Rows(iRow)("No_Of_Qty"))
                    .set_TextMatrix(iRow + 1, 8, ds.Tables(0).Rows(iRow)("Net_wt"))

                End With
            Next
            If ds.Tables(0).Rows(0)("DC_No").ToString = "0" Then
                CbxDcNo.Checked = False
                tbDcno.Text = 0
                mDcnewno = 0
            Else
                CbxDcNo.Checked = True
                tbDcno.Text = ds.Tables(0).Rows(0)("DC_No").ToString
                mDcnewno = ds.Tables(0).Rows(0)("DC_No").ToString
            End If
            cbxScreenMode.Text = "Modify"
            cbxProdDesc.Focus()
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

            If IsBlankComboBox(cbxNumberType) Then Exit Sub
            If IsBlankComboBox(CbxIssuedDept) Then Exit Sub
            If IsBlankComboBox(CbxTOCompany) Then Exit Sub

            If Not RemoveSingleQuotes(tbGatepassNo.Text) = "" Then
                mvarRecordStatus = GetDeleteAutorize_Status(RemoveSingleQuotes(tbGatepassNo.Text), Format(dtpGatepassDate.Value, "yyyy/MM/dd") _
                                                           , "Gpass_No", "Gpass_Date", "DB_General..GEN_MaterialpassOUT_Main", "AUTHORIZE")
                If mvarRecordStatus = 3 Then
                    Show_Message("Already authorized.")
                    Exit Sub
                End If
                mvarRecordStatus = GetDeleteAutorize_Status(RemoveSingleQuotes(tbGatepassNo.Text), Format(dtpGatepassDate.Value, "yyyy/MM/dd") _
                                                           , "Gpass_No", "Gpass_Date", "DB_General..GEN_MaterialpassOUT_Main", "DELETE")
                If mvarRecordStatus = 2 Then
                    Show_Message("Already deleted.")
                    Exit Sub
                End If

                mvarRecordStatus = GetDeleteAutorize_Status(RemoveSingleQuotes(tbGatepassNo.Text), Format(dtpGatepassDate.Value, "yyyy/MM/dd") _
                                                           , "Gpass_No", "Gpass_Date", "DB_General..GEN_MaterialpassOUT_Main", "")
            End If

            '   If IsValidDate(Format(dtpGatepassDate.Value, "yyyy/MM/dd")) = False Then Exit Sub

            RemoveEmptyRows(c1fgItems, 1)

            If c1fgItems.Rows <= 1 Then
                Show_Message("Please enter line item.")
                cbxProdDesc.Focus()
                Exit Sub
            End If
            Dim mSaveString As String
            Dim mNetTotal As Double = 0

            Select Case cbxScreenMode.Text
                Case "Add"
                    If CbxDcNo.Checked = True Then
                        DCNOChange()
                    Else
                        mDcnewno = ""
                    End If
                    If mvarRecordStatus >= 1 Then
                        mvarMsgDialogResult = ShowYesNo("GatePass OUT Receipt Details are already exists." _
                                                             & vbCrLf & "Do you want to modify?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            cbxScreenMode.Text = "Modify"
                        ElseIf mvarMsgDialogResult = MsgBoxResult.No Then
                            mvarMsgDialogResult = ShowYesNo("Do you want to create new Gatepass Out Receipt ?")
                            If mvarMsgDialogResult = MsgBoxResult.Yes Then
                                tbGatepassNo.Text = ""
                            Else
                                Exit Sub
                            End If
                        Else
                            Exit Sub
                        End If
                    End If
                Case "Modify"

                    If mvarRecordStatus <= 0 Then
                        mvarMsgDialogResult = ShowYesNo("Gatepass Out  receipt details are doesn't exist." _
                                                             & vbCrLf & "Do you want to create Gatepass Out  receipt?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            tbGatepassNo.Text = ""
                            cbxScreenMode.Text = "Add"
                        Else
                            Exit Sub
                        End If
                    End If
                Case "Authorize"
                    If mvarRecordStatus <= 0 Then
                        Show_Message(" Gatepass Out  receipt details are doesn't exists.")
                        Exit Sub
                    Else
                        mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(tbGatepassNo.Text), Format(dtpGatepassDate.Value, "yyyy/MM/dd") _
                                                           , "Gpass_No", "Gpass_Date", "DB_General..GEN_MaterialpassOUT_Line", "AUTHORIZE")
                        mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(tbGatepassNo.Text), Format(dtpGatepassDate.Value, "yyyy/MM/dd") _
                                                            , "Gpass_No", "Gpass_Date", "DB_General..GEN_MaterialpassOUT_Main", "AUTHORIZE")

                        If mvarUpateStatus = 3 Then
                            Dim Type As String = " Gatepass Out"
                            Show_Message("Authorized.")
                        Else
                            Show_Message("Error.")
                        End If
                        Exit Sub
                    End If
                Case "Delete"
                    If mvarRecordStatus >= 1 Then
                        mvarMsgDialogResult = ShowYesNo("Are you sure do you want to delete this record?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(tbGatepassNo.Text), Format(dtpGatepassDate.Value, "yyyy/MM/dd") _
                                                           , "Gpass_No", "Gpass_Date", "DB_General..GEN_MaterialpassOUT_Line", "DELETE")
                            mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(tbGatepassNo.Text), Format(dtpGatepassDate.Value, "yyyy/MM/dd") _
                                                             , "Gpass_No", "Gpass_Date", "DB_General..GEN_MaterialpassOUT_Main", "DELETE")
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

            If Trim(tbGatepassNo.Text) = "" Then
                If Format(dtpGatepassDate.Value, "yyyy/MM/dd") < Format(GetMaxDate("GEN_MaterialpassOUT_Main", "Gpass_Date", "DB_General"), "yyyy/MM/dd") Then
                    Show_Message("Entry date should be greater than or equal to last saved date.")
                    dtpGatepassDate.Focus()
                    Exit Sub
                End If
            End If
            If (dtpGatepassDate.Value.AddDays(+3)) >= Format(Now, "yyyy/MM/dd") Then

            Else
                Show_Message("You Cannot Modified in this Gatepass .This Gatepass was created More than 3 Days !.Please Contact Administrator")
                Exit Sub

            End If

            mSaveString = ""
            mSaveString = RemoveSingleQuotes(tbGatepassNo.Text) & "||"
            mSaveString &= Format(dtpGatepassDate.Value, "yyyy/MM/dd hh:mm:ss") & "||"
            mSaveString &= RemoveSingleQuotes(txtRefinvno.Text) & "||"
            mSaveString &= Format(dtpRefinvDate.Value, "yyyy/MM/dd") & "||"
            mSaveString &= mDcnewno & "||"
            mSaveString &= Format(DtpDCDate.Value, "yyyy/MM/dd") & "||"

            mSaveString &= RemoveSingleQuotes(CbxIssuedDept.Text) & "||"
            mSaveString &= RemoveSingleQuotes(CbxFromCompany.Text) & "||"

            mSaveString &= RemoveSingleQuotes(CbxTOCompany.Text) & "||"
            mSaveString &= RemoveSingleQuotes(CbxDeliveredBy.Text) & "||"
            mSaveString &= RemoveSingleQuotes(Cbxvehicleno.Text) & "||"
            mSaveString &= RemoveSingleQuotes(CbxDelivery.Text) & "||"
            mSaveString &= RemoveSingleQuotes(returntype) & "||"
            mSaveString &= Return_Mode & "||"

            mSaveString &= Val(TbTotalitem.Text) & "||"
            mSaveString &= Val(Txttotnetwt.Text) & "||"

            mSaveString &= RemoveSingleQuotes(tbOthers.Text) & "||"
            mSaveString &= RemoveSingleQuotes(CbxMaterialfrom.Text) & "||"

            tbGatepassNo.Text = mobjclsGatepass.SaveGen_MaterialpassOUT_Main(mSaveString, cbxScreenMode.Text, c1fgItems, cbxNumberType.Text)

            If tbGatepassNo.Text = "Error" Then
                Show_Message("Error.")
                tbGatepassNo.Text = ""
                Exit Sub
            Else
                Show_Message("Successfully saved.")
                cbxScreenMode.Text = "Modify"
                'GetGatepassPrint()
                'Form_Clear()
                Exit Sub
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub FIllISSuedDepartment()
        Try
            ds = mobjclsGatepass.GetGppartyDetails("", "", "", "Department")
            If ds.Tables(0).Rows.Count > 0 Then
                CbxIssuedDept.Items.Clear()
                CbxIssuedDept.Items.Add("")
                For irow As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    CbxIssuedDept.Items.Add(ds.Tables(0).Rows(irow)(2))
                Next

            End If

            Dim col As New AutoCompleteStringCollection
            Dim i As Integer
            For i = 0 To ds.Tables(0).Rows.Count - 1
                col.Add(ds.Tables(0).Rows(i)(2).ToString())
            Next
            CbxIssuedDept.AutoCompleteSource = AutoCompleteSource.CustomSource
            CbxIssuedDept.AutoCompleteCustomSource = col
            CbxIssuedDept.AutoCompleteMode = AutoCompleteMode.Suggest
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        Finally

        End Try
    End Sub

    Private Sub FIllRecdDepartment()
        Try
            ds = mobjclsGatepass.GetGppartyDetails("", "", "", "ALL")

            If ds.Tables(0).Rows.Count > 0 Then
                CbxTOCompany.Items.Clear()
                CbxTOCompany.Items.Add("")
                For irow As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    CbxTOCompany.Items.Add(ds.Tables(0).Rows(irow)(2))
                Next
            End If
            Dim col As New AutoCompleteStringCollection
            Dim i As Integer
            For i = 0 To ds.Tables(0).Rows.Count - 1
                col.Add(ds.Tables(0).Rows(i)(2).ToString())
            Next
            CbxTOCompany.AutoCompleteSource = AutoCompleteSource.CustomSource
            CbxTOCompany.AutoCompleteCustomSource = col
            CbxTOCompany.AutoCompleteMode = AutoCompleteMode.Suggest
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        Finally

        End Try
    End Sub
    Private Sub FillProductDetails()
        Try

            ds = mobjclsGatepass.GetProductDescDetails("")
            If ds.Tables(0).Rows.Count > 0 Then
                cbxProdDesc.Items.Clear()
                For irow As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    cbxProdDesc.Items.Add(ds.Tables(0).Rows(irow)(0))
                Next
            End If
            Dim col As New AutoCompleteStringCollection
            Dim i As Integer
            For i = 0 To ds.Tables(0).Rows.Count - 1
                col.Add(ds.Tables(0).Rows(i)(0).ToString())
            Next
            cbxProdDesc.AutoCompleteSource = AutoCompleteSource.CustomSource
            cbxProdDesc.AutoCompleteCustomSource = col
            cbxProdDesc.AutoCompleteMode = AutoCompleteMode.Suggest

        Catch ex As Exception
            MessageBox.Show(ex.Message)
        Finally

        End Try
    End Sub

    Private Sub FIllBearerDetails()
        Try

            ds = mobjclsGatepass.GetBearerDetails("")
            If ds.Tables(0).Rows.Count > 0 Then
                CbxDeliveredBy.Items.Clear()
                For irow As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    CbxDeliveredBy.Items.Add(ds.Tables(0).Rows(irow)(0))
                Next
            End If
            Dim col As New AutoCompleteStringCollection
            Dim i As Integer
            For i = 0 To ds.Tables(0).Rows.Count - 1
                col.Add(ds.Tables(0).Rows(i)(0).ToString())
            Next
            CbxDeliveredBy.AutoCompleteSource = AutoCompleteSource.CustomSource
            CbxDeliveredBy.AutoCompleteCustomSource = col
            CbxDeliveredBy.AutoCompleteMode = AutoCompleteMode.Suggest

        Catch ex As Exception
            MessageBox.Show(ex.Message)
        Finally

        End Try
    End Sub

    Private Sub FillUOMDetails()
        Try

            ds = mobjclsGatepass.GetUOMCodeDetails("")
            If ds.Tables(0).Rows.Count > 0 Then
                CbxUOM.Items.Clear()
                For irow As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    CbxUOM.Items.Add(ds.Tables(0).Rows(irow)(0))
                Next
            End If
            Dim col As New AutoCompleteStringCollection
            Dim i As Integer
            For i = 0 To ds.Tables(0).Rows.Count - 1
                col.Add(ds.Tables(0).Rows(i)(0).ToString())
            Next
            CbxUOM.AutoCompleteSource = AutoCompleteSource.CustomSource
            CbxUOM.AutoCompleteCustomSource = col
            CbxUOM.AutoCompleteMode = AutoCompleteMode.Suggest

        Catch ex As Exception
            MessageBox.Show(ex.Message)
        Finally

        End Try
    End Sub

    Private Sub Calctotalval()
        Dim mtotitems As Decimal = 0
        Dim mtotnetwt As Decimal = 0

        For iRow As Integer = 1 To c1fgItems.Rows - 1
            mtotitems += c1fgItems.get_TextMatrix(iRow, 7).ToString
            mtotnetwt += c1fgItems.get_TextMatrix(iRow, 8).ToString

        Next
        TbTotalitem.Text = mtotitems
        Txttotnetwt.Text = mtotnetwt

    End Sub
    Private Sub GetMaxDCNO()
        Try
            Dim lbl_id As String = ""
            Dim NewId As Integer = 1
            Dim strnewid As String = " "
            Dim Mdcno As String = ""

            SSQL = ""
            SSQL = " select Max(DC_No)as DC_No  "
            SSQL &= "  from  [DB_General].[dbo].[GEN_MaterialpassOUT_Main]   "
            SSQL &= "  Where Comp_Code='" & mvarCompanyCode & "' And Location_Code='" & mvarLocationCode & "'"
            SSQL &= " And Fin_Year_code='" & mvarFinYearCode & "'  "

            'SSQL &= " And Warehouse_Code='" & RemoveSingleQuotes(c1fgItems.get_TextMatrix(iRow, 6)) & "'"
            ds = Nothing
            ds = New DataSet

            ds = ReturnMultipleValue(SSQL, "DB_General")

            '' ds = mobjclsGatepass.GetMaxDCNODetails("")
            If ds.Tables(0).Rows.Count > 0 Then
                If IsDBNull(ds.Tables(0).Rows(0)(0)) Then
                    Mdcno = 0

                Else

                    Mdcno = ds.Tables(0).Rows(0)(0)
                End If
            Else
                Mdcno = 0
            End If

            'DataSet Invoke from DBConnection class
            If Mdcno.ToString() <> "" Then
                NewId = Convert.ToInt32(Mdcno.ToString()) + 1
                strnewid = NewId.ToString()
            Else
                strnewid = "001"
            End If
            tbDcno.Text = strnewid.ToString()
            mDcnewno = strnewid.ToString()
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        Finally

        End Try
    End Sub

    Private Sub RdlReturn_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RdlReturn.CheckedChanged
        returnMode()
    End Sub

    Private Sub RdlNotreturn_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        returnMode()
    End Sub
    Private Sub CbxDcNo_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CbxDcNo.CheckedChanged
        DCNOChange()
    End Sub

    Private Sub returnMode()
        If RdlReturn.Checked = True Then
            returntype = "RETURNABLE"
            Return_Mode = "1"
        ElseIf RdlNotreturn.Checked = True Then
            returntype = "NOT RETURN"
            Return_Mode = "0"
        End If

    End Sub

    Private Sub DCNOChange()
        If cbxScreenMode.Text = "Add" Then

            If CbxDcNo.Checked = True Then
                GetMaxDCNO()
            Else
                tbDcno.Text = 0
                mDcnewno = 0
            End If

        ElseIf cbxScreenMode.Text = "Modify" Then
            If tbDcno.Text = "" Then Exit Sub

            If CbxDcNo.Checked = True And Val(tbDcno.Text) = 0 Then
                GetMaxDCNO()

            Else
                tbDcno.Text = ""
            End If
        Else

            tbDcno.Text = 0
            mDcnewno = 0
        End If

    End Sub

    Private Sub GetGatepassPrint()
        If mvarReportName = "" Then Exit Sub
        Try
            Dim crysrep As New ReportDocument
            Dim crysview As New frmRepView
            If IsBlankTextBox(tbGatepassNo) Then Exit Sub

            ds1 = Nothing
            ds1 = New DataSet

            ds1 = mobjclsLogin.GetLocationDetails(mvarCompanyCode, mvarLocationCode)
            Dim maddress As String = ds1.Tables(0).Rows(0)("Location_Add1") + " ," + ds1.Tables(0).Rows(0)("Location_Add2") + " , " + ds1.Tables(0).Rows(0)("Location_city") + ""

            ds = Nothing
            ds = New DataSet

            ''  ELSEIF  mvarLocationCode = "SPINNING" Then
            mvarReportName = mvarReportPath & "\Reports\Gatepass\mGatepassOut.rpt"

            Dim Type As String = "Gatepass_OUT"

            If mvarLocationCode = "WEAVING" Or mvarLocationCode = "PALLADAM" Then
                ds = mobjclsGatepass.GetGen_MaterialpassOUTDetails(Trim(tbGatepassNo.Text), "", "", "Gatepass_Print_Authorized")
                If ds.Tables(0).Rows.Count <= 0 Then
                    Show_Message("Kindly Authorize Entry or  record Missing.")
                    Exit Sub
                End If
            Else
                ds = mobjclsGatepass.GetGen_MaterialpassOUTDetails(Trim(tbGatepassNo.Text), "", "", "Gatepass_Print_ALL")

                If ds.Tables(0).Rows.Count <= 0 Then
                    Show_Message("No record found.")
                    Exit Sub
                End If
            End If

            crysview.Text = Me.Text
            crysrep.Load(mvarReportName)
            crysrep.SummaryInfo.ReportTitle = mvarCompanyName
            crysrep.SetDataSource(ds.Tables(0))
            'crysrep.DataDefinition.FormulaFields("Fdate").Text = "'" + ds.Tables(0).Rows(0)("Modified_Date") + "'"
            crysrep.DataDefinition.FormulaFields("maddress").Text = "'" + maddress + "'"

            crysview.CrystalReportViewer1.ReportSource = crysrep
            crysview.CrystalReportViewer1.Refresh()
            crysview.CrystalReportViewer1.Zoom(100)
            crysview.Show()

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPrint_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPrint.Click
        If mvarReportName = "" Then Exit Sub
        Try
            Dim crysrep As New ReportDocument
            Dim crysview As New frmRepView
            If IsBlankTextBox(tbGatepassNo) Then Exit Sub

            ds1 = Nothing
            ds1 = New DataSet

            ds1 = mobjclsLogin.GetLocationDetails(mvarCompanyCode, mvarLocationCode)
            Dim maddress As String = ds1.Tables(0).Rows(0)("Location_Add1") + " ," + ds1.Tables(0).Rows(0)("Location_Add2") + " , " + ds1.Tables(0).Rows(0)("Location_city") + ""

            ds = Nothing
            ds = New DataSet

            If cbxScreenMode.Text = "View" Or cbxScreenMode.Text = "Modify" Then

                mvarReportName = mvarReportPath & "\Reports\Gatepass\MDChallan.rpt"

            End If

            Dim Type As String = "Gatepass_OUT"

            If mvarLocationCode = "WEAVING" Or mvarLocationCode = "PALLADAM" Then
                ds = mobjclsGatepass.GetGen_MaterialpassOUTDetails(Trim(tbGatepassNo.Text), "", "", "Gatepass_Print_Authorized")
                If ds.Tables(0).Rows.Count <= 0 Then
                    Show_Message("Kindly Authorize Entry or  record Missing.")
                    Exit Sub
                End If
            Else
                ds = mobjclsGatepass.GetGen_MaterialpassOUTDetails(Trim(tbGatepassNo.Text), "", "", "Gatepass_Print_ALL")

                If ds.Tables(0).Rows.Count <= 0 Then
                    Show_Message("No record found.")
                    Exit Sub
                End If
            End If

            'Dim Type As String = "Gatepass_OUT"
            'ds = mobjclsGatepass.GetGatepassOUTDetails_Report(Trim(tbGatepassNo.Text), "", "", "")
            'If ds.Tables(0).Rows.Count <= 0 Then
            '    Show_Message("No record found.")
            '    Exit Sub
            'ElseIf ds.Tables(0).Rows(0)("DC_No") = 0 Then
            '    Show_Message("No record found.")
            '    Exit Sub
            'End If
            crysview.Text = Me.Text
            crysrep.Load(mvarReportName)
            crysrep.SummaryInfo.ReportTitle = mvarCompanyName
            crysrep.SetDataSource(ds.Tables(0))
            crysrep.DataDefinition.FormulaFields("Fdate").Text = "'" + ds.Tables(0).Rows(0)("Modified_Date") + "'"
            crysrep.DataDefinition.FormulaFields("maddress").Text = "'" + maddress + "'"

            crysview.CrystalReportViewer1.ReportSource = crysrep
            crysview.CrystalReportViewer1.Refresh()
            crysview.CrystalReportViewer1.Zoom(100)
            crysview.Show()

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub BtnGpass_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnGpass.Click
        GetGatepassPrint()

    End Sub

    Private Sub btnPK_Screen_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_Screen.Click
        Frm_Gpass_partyMaster.InitializeForm("GP Party Master")
        Frm_Gpass_partyMaster.Activate()
        Frm_Gpass_partyMaster.MdiParent = mdiMain
        Frm_Gpass_partyMaster.BringToFront()
        Frm_Gpass_partyMaster.Show()

    End Sub

    Private Sub btnInformation_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnInformation.Click
        FrmGp_PendingList_Rep.InitializeForm("Pending List")
        FrmGp_PendingList_Rep.Activate()
        FrmGp_PendingList_Rep.MdiParent = mdiMain
        FrmGp_PendingList_Rep.BringToFront()
        FrmGp_PendingList_Rep.Show()
    End Sub

    Private Sub cbxScreenMode_KeyUp(sender As System.Object, e As System.Windows.Forms.KeyEventArgs) Handles cbxScreenMode.KeyUp, CbxDcNo.KeyUp, CbxDeliveredBy.KeyUp, CbxDeliveredBy.KeyUp, CbxIssuedDept.KeyUp, cbxNumberType.KeyUp, cbxProdDesc.KeyUp, CbxTOCompany.KeyUp, cbxScreenMode.KeyUp, CbxUOM.KeyUp, btnClear.KeyUp, btnClear_Line.KeyUp, btnClose.KeyUp, tbDcno.KeyUp, tbGatepassNo.KeyUp, txtNoofitem.KeyUp, tbOthers.KeyUp, TbTotalitem.KeyUp

        If e.KeyCode = Keys.Enter Then
            SendKeys.Send("{TAB}")
        End If
    End Sub

    Private Sub CbxIssuedcompany_Leave(sender As System.Object, e As System.EventArgs) Handles CbxIssuedDept.Leave
        For irow As Integer = 0 To CbxIssuedDept.Items.Count - 1

            If CbxIssuedDept.SelectedItem = CbxIssuedDept.Text Then
                Exit For
            Else
                CbxIssuedDept.Text = ""
            End If

        Next
    End Sub

    Private Sub btnReset_Click(sender As Object, e As EventArgs) Handles btnReset.Click

    End Sub

    Private Sub btnsadviceno_Click(sender As Object, e As EventArgs) Handles btnsadviceno.Click
        Try
            If IsBlankComboBox(CbxIssuedDept) Then Exit Sub
            If IsBlankComboBox(CbxDeliveredBy) Then Exit Sub
            Dim mauthorize As Integer = 0

            mauthorize = 0

            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing

            ds = mobjclsDeliverychallan.GetDeliverychallanDetails("", mauthorize, "", "ALL")

            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Delivery Challan Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            txtRefinvno.Text = dtPickList.Rows(0)("DC_No")
            dtpRefinvDate.Value = dtPickList.Rows(0)("DC_Date")

            CbxFromCompany.Text = mvarCompanyName

            CbxTOCompany.Text = dtPickList.Rows(0)("ShipTo_Name")

            CbxIssuedDept.Text = dtPickList.Rows(0)("Department")

            CbxDelivery.Text = dtPickList.Rows(0)("Place_Of_Supply")
            Cbxvehicleno.Text = dtPickList.Rows(0)("Lorry_no")

            If Trim(txtRefinvno.Text) = "" Then Exit Sub
            ds = Nothing
            ds = New DataSet
            ds = mobjclsDeliverychallan.GetDeliverychallanDetails(Trim(txtRefinvno.Text), "", "", "SPECIFY")
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            Fill_Grid_Title()

            c1fgItems.Rows = ds.Tables(0).Rows.Count + 1

            For iRow As Integer = 0 To ds.Tables(0).Rows.Count - 1
                With c1fgItems
                    .set_TextMatrix(iRow + 1, 0, ds.Tables(0).Rows(iRow)("SNo"))

                    .set_TextMatrix(iRow + 1, 1, ds.Tables(0).Rows(iRow)("Prod_Desc"))
                    .set_TextMatrix(iRow + 1, 2, CbxIssuedDept.Text)
                    .set_TextMatrix(iRow + 1, 3, ds.Tables(0).Rows(iRow)("ShipTo_Name"))

                    .set_TextMatrix(c1fgItems.Rows - 1, 4, returntype)
                    .set_TextMatrix(c1fgItems.Rows - 1, 5, CbxDeliveredBy.Text)

                    '.set_TextMatrix(iRow + 1, 6, ds.Tables(0).Rows(iRow)("UOM_Code"))
                    .set_TextMatrix(iRow + 1, 6, ds.Tables(0).Rows(iRow)("Packing_Mode"))
                    .set_TextMatrix(iRow + 1, 7, ds.Tables(0).Rows(iRow)("No_Of_Bags"))

                    .set_TextMatrix(iRow + 1, 8, ds.Tables(0).Rows(iRow)("Net_Wt"))
                    '.set_TextMatrix(iRow + 1, 9, ds.Tables(0).Rows(iRow)("Net_meters"))

                End With
            Next
            Calctotalval()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub BtnVehicleno_Click(sender As Object, e As EventArgs) Handles BtnVehicleno.Click
        Try

            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing
            ds = mobjCls_CommonDetails.GetVehicle_Master_Details("", "", "", "ALL")

            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = " Vehicle Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            Cbxvehicleno.Text = dtPickList.Rows(0)("Vehicle_No")

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub GroupBox1_Enter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GroupBox1.Enter

    End Sub

    Private Sub Label29_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label29.Click

    End Sub
End Class