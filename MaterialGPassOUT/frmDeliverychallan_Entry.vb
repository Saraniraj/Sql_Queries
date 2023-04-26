Imports CrystalDecisions.CrystalReports.Engine
Imports System.Math
Imports C1.Win.C1FlexGrid.Classic
Public Class frmDeliverychallan_Entry
    Dim mobjclsSupplier As New clsPartyMaster
    Dim mobjclsSalesadvice As New clsDeliverychallan
    Dim mobjCls_CommonDetails As New Cls_CommonMasterDetails

    Dim mobjclsLogin As New clsLogin

    Dim mvarReportName As String
    Dim DataCollection As New AutoCompleteStringCollection()

    Private Sub frmDeliverychallan_Entry_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Application.EnableVisualStyles()
            Me.KeyPreview = True
            Fill_Grid_Title()
            Fill_Numbering_Type()
            Fill_Combo_Details()
            Fill_TextBOX_details()
            C1Tab2.SelectedIndex = 0
            CbxTranstype.SelectedIndex = 0
            Form_Clear()
            CbxIssueddept.Text = mvarUserID
            'If mvarFinYearEndDate <= dtpadvDate.Value Then
            '    dtpadvDate.Value = mvarFinYearEndDate
            'Else
            '    dtpadvDate.Value = Load_LastSavedEntry_Date("GEN_DeliveryChallan_Main", "DC_Date", "DB_General")
            'End If

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub Fill_Combo_Details()
        'Fill_CBX_details("SELECT distinct(TC_Code)FROM eCommon.[dbo].Thread_Count_Details where IsActive = 1", "eCommon", cbxTC)
        'Fill_CBX_details("SELECT distinct(Variety_Name)FROM eStitching.[dbo].SPP_Variety_Master where Is_Active = 1", "eStitching", cbxvariety)
        'Fill_CBX_details("SELECT distinct([Color_Name])FROM eStitching.[dbo].SPP_Color_Master where Is_Active = 1", "eStitching", cbxcolor)
        ' Fill_CBX_details("SELECT   distinct [DeptName]  FROM [DB_Common].[dbo].[Dept_master] where comp_code='" & mvarCompanyCode & "' and location_code='" & mvarLocationCode & "' order by  DeptName        ", "DB_Common", CbxIssueddept)
        Fill_CBX_details("SELECT   distinct [DeptName]  FROM [DB_Common].[dbo].[Dept_master]  order by  DeptName        ", "DB_Common", CbxIssueddept)

    End Sub
    Private Sub Fill_TextBOX_details()
        'Fill_TextBOX_details("SELECT distinct(Packing_Purpose ) FROM  GEN_DeliveryChallan_Main order by Packing_Purpose ", "DB_General", TxtPackingpurpose, DataCollection)
        Fill_TextBOX_details("SELECT distinct(Place_Of_Supply  ) FROM  GEN_DeliveryChallan_Main order by Place_Of_Supply", "DB_General", TxtPlaceofsupply, DataCollection)
        'Fill_TextBOX_details("SELECT distinct(Lorry_no) FROM  GEN_DeliveryChallan_Main order by Lorry_no", "DB_General", TxtLorryno, DataCollection)
        Fill_TextBOX_details("SELECT distinct(UOM_Code) FROM  GEN_DeliveryChallan_Line order by UOM_Code", "DB_General", TxtUomcode, DataCollection)

        Fill_TextBOX_details("SELECT distinct(HSN_Code) FROM  GEN_DeliveryChallan_Line order by HSN_Code", "DB_General", TxtHSNCode, DataCollection)

        Fill_TextBOX_details("SELECT distinct(Packing_mode) FROM  GEN_DeliveryChallan_Line order by Packing_mode", "DB_General", txtpackingmode, DataCollection)

        'Fill_TextBOX_details("SELECT distinct(Prod_code) FROM  GEN_DeliveryChallan_Line Where comp_code='" & mvarCompanyCode & "' and location_code='" & mvarLocationCode & "' and created_by='" & mvarUserID & "'  order by Prod_code", "DB_General", txtProdCode, DataCollection)
        Fill_TextBOX_details("SELECT distinct(Prod_code) FROM  GEN_DeliveryChallan_Line Where  created_by='" & mvarUserID & "'  order by Prod_code", "DB_General", txtProdCode, DataCollection)

        ''' 
        'Fill_TextBOX_details("SELECT distinct(Actual_Ends) FROM eWeaving.dbo.WPP_FabInward_Main order by Actual_Ends", "eGeneral", txtpackingmode, DataCollection)

    End Sub
    Sub Fill_TextBOX_details(ByVal mSSQL As String, ByVal mdatabase As String, ByVal mtxtboxname As TextBox, ByVal dataCollection As AutoCompleteStringCollection)
        Try
            Dim MySource As New AutoCompleteStringCollection()

            ds = Nothing
            ds = New DataSet
            ds = ReturnMultipleValue(mSSQL, mdatabase)
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub
            For Each row As DataRow In ds.Tables(0).Rows
                dataCollection.Add(row(0).ToString())
                MySource.Add(row(0).ToString())
            Next
            If mtxtboxname.Name = TxtPackingpurpose.Name Then
                With TxtPackingpurpose
                    .AutoCompleteCustomSource = MySource
                    .AutoCompleteMode = AutoCompleteMode.SuggestAppend
                    .AutoCompleteSource = AutoCompleteSource.CustomSource
                End With

            ElseIf mtxtboxname.Name = TxtPlaceofsupply.Name Then
                With TxtPlaceofsupply
                    .AutoCompleteCustomSource = MySource
                    .AutoCompleteMode = AutoCompleteMode.SuggestAppend
                    .AutoCompleteSource = AutoCompleteSource.CustomSource
                End With

                'ElseIf mtxtboxname.Name = TxtLorryno.Name Then
                '    With TxtLorryno
                '        .AutoCompleteCustomSource = MySource
                '        .AutoCompleteMode = AutoCompleteMode.SuggestAppend
                '        .AutoCompleteSource = AutoCompleteSource.CustomSource
                '    End With

            ElseIf mtxtboxname.Name = TxtUomcode.Name Then
                With TxtUomcode
                    .AutoCompleteCustomSource = MySource
                    .AutoCompleteMode = AutoCompleteMode.SuggestAppend
                    .AutoCompleteSource = AutoCompleteSource.CustomSource
                End With

            ElseIf mtxtboxname.Name = txtpackingmode.Name Then
                With txtpackingmode
                    .AutoCompleteCustomSource = MySource
                    .AutoCompleteMode = AutoCompleteMode.SuggestAppend
                    .AutoCompleteSource = AutoCompleteSource.CustomSource
                End With

            ElseIf mtxtboxname.Name = TxtHSNCode.Name Then
                With TxtHSNCode
                    .AutoCompleteCustomSource = MySource
                    .AutoCompleteMode = AutoCompleteMode.SuggestAppend
                    .AutoCompleteSource = AutoCompleteSource.CustomSource
                End With

            ElseIf mtxtboxname.Name = txtProdCode.Name Then
                With txtProdCode
                    .AutoCompleteCustomSource = MySource
                    .AutoCompleteMode = AutoCompleteMode.SuggestAppend
                    .AutoCompleteSource = AutoCompleteSource.CustomSource
                End With

            Else

            End If

            ds.Dispose()
        Catch ex As Exception

        Finally

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

    Private Sub GetDisableEnableControl()
        Try
            btnReset.Enabled = False
            If cbxScreenMode.Text = "Add" Then
                btnApply.Enabled = True
                btnClear.Enabled = True
                btnPK_advno.Enabled = False
                btnReset.Enabled = False
                txtDCNo.Text = ""
            ElseIf cbxScreenMode.Text = "Modify" Then
                btnReset.Enabled = True
                btnApply.Enabled = True
                btnClear.Enabled = True
                btnPK_advno.Enabled = True
            ElseIf cbxScreenMode.Text = "Delete" Then
                btnApply.Enabled = True
                btnClear.Enabled = True
                btnPK_advno.Enabled = True
                btnReset.Enabled = False
            ElseIf cbxScreenMode.Text = "View" Then
                btnApply.Enabled = False
                btnClear.Enabled = True
                btnPK_advno.Enabled = True
                btnReset.Enabled = False
            ElseIf cbxScreenMode.Text = "Authorize" Then
                btnApply.Enabled = True
                btnClear.Enabled = False
                btnPK_advno.Enabled = False
                btnReset.Enabled = False
            Else
                btnApply.Enabled = False
                btnClear.Enabled = False
                btnPK_advno.Enabled = False
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

    Public Sub InitializeForm(ByVal mvarScreenName As String)
        Try
            FillScreenMode(mvarScreenName, cbxScreenMode)
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Grid_Title()
        Try
            With c1fgItems
                .Clear()
                .Rows = 1
                .Cols = 19
                .FixedCols = 0

                .set_TextMatrix(0, 0, "Sl.No.")
                .set_TextMatrix(0, 1, "Trans type")
                .set_TextMatrix(0, 2, "Item Name")
                .set_TextMatrix(0, 3, "ID Marks")
                .set_TextMatrix(0, 4, "HSN Code")
                .set_TextMatrix(0, 5, "UOM")
                .set_TextMatrix(0, 6, "Packing Mode")

                .set_TextMatrix(0, 7, "No Of Items")
                .set_TextMatrix(0, 8, "Net Meters")

                .set_TextMatrix(0, 9, "Net Wt")
                .set_TextMatrix(0, 10, "Rate/Qty")
                .set_TextMatrix(0, 11, "Amount")
                .set_TextMatrix(0, 12, "Freight")
                .set_TextMatrix(0, 13, "Taxable")
                .set_TextMatrix(0, 14, "GST %")
                .set_TextMatrix(0, 15, "CGST")
                .set_TextMatrix(0, 16, "SGST")
                .set_TextMatrix(0, 17, "IGST")
                .set_TextMatrix(0, 18, "Tot GST.")

                .set_ColWidth(0, 50)
                .set_ColWidth(1, 120)
                .set_ColWidth(2, 100)
                .set_ColWidth(3, 100)
                .set_ColWidth(4, 100)
                .set_ColWidth(5, 100)
                .set_ColWidth(6, 100)
                .set_ColWidth(7, 80)
                .set_ColWidth(8, 80)
                .set_ColWidth(9, 80)
                .set_ColWidth(10, 80)
                .set_ColWidth(11, 80)
                .set_ColWidth(12, 80)
                .set_ColWidth(13, 80)
                .set_ColWidth(14, 80)
                .set_ColWidth(15, 80)
                .set_ColWidth(16, 80)
                .set_ColWidth(17, 80)

                .Cell(C1.Win.C1FlexGrid.Classic.CellPropertySettings.flexcpAlignment, 0, 0, 0, 17) = 3
                .Cell(C1.Win.C1FlexGrid.Classic.CellPropertySettings.flexcpFontBold, 0, 0, 0, 17) = True

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

            ds = GetNumberTypeDetails("Delivery Challan Entry", 0)

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

    Private Sub btnPK_Party_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_Billedto.Click
        Try

            clearLIneitems()

            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing

            ds = mobjclsSupplier.GetPartyDetails("", "", "", "ALL")

            '' ds = mobjclsSupplier.GetSupplierDetails("", "")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Party Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            'txtsupCode.Text = dtPickList.Rows(0)("Sup_Code")
            'TxtSupName.Text = dtPickList.Rows(0)("Sup_Name")

            TxtBilledtoCode.Text = dtPickList.Rows(0)("Party_Code")
            TxtBilledtoName.Text = dtPickList.Rows(0)("Party_Name")
            LblBilledtoName.Text = dtPickList.Rows(0)("Party_Lookup") + "  " + dtPickList.Rows(0)("Party_add1")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub BtnShipto_Click(sender As Object, e As EventArgs) Handles BtnShipto.Click
        Try

            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing

            ds = mobjclsSupplier.GetPartyDetails("", "", "", "ALL")

            '' ds = mobjclsSupplier.GetSupplierDetails("", "")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Ship To Party Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            'txtsupCode.Text = dtPickList.Rows(0)("Sup_Code")
            'TxtSupName.Text = dtPickList.Rows(0)("Sup_Name")

            Txtshiptocode.Text = dtPickList.Rows(0)("Party_Code")
            TxtshiptoName.Text = dtPickList.Rows(0)("Party_Name")
            LblshiptoName.Text = dtPickList.Rows(0)("Party_Lookup") + "  " + dtPickList.Rows(0)("Party_add1")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Try
            Dim mtotgst As Double = 0
            Dim mgross_amt As Double = 0

            If IsBlankTextBox(txtProdCode) Then Exit Sub
            If IsBlankTextBox(TxtUomcode) Then Exit Sub

            If IsBlankTextBox(TxtHSNCode) Then Exit Sub
            If IsBlankTextBox(TxtNetwt) Then Exit Sub
            ''   If IsBlankTextBox(TxtBagWt) Then Exit Sub
            If IsBlankTextBox(txtRateQty) Then Exit Sub

            If Val(TxtNetwt.Text) <= 0 Then
                TxtNetwt.Focus()
                Exit Sub
            End If
            'If Val(TxtBagWt.Text) <= 0 Then
            '    TxtBagWt.Focus()
            '    Exit Sub
            'Else

            '  End If
            If Val(txtRateQty.Text) < 1 Then
                txtRateQty.Focus()
                Exit Sub
            End If
            Dim minvtotnetmtrs As Double = 0

            Dim minvtotnetwgt As Double = 0
            Dim minvtotBoxwgt As Double = 0
            Dim minvtotalcones As Double = 0
            Dim minvtotalbox As Double = 0
            Dim minvtotalExmill As Double = 0
            Dim minvtotalCGST As Double = 0
            Dim minvtotalSGST As Double = 0
            Dim minvtotalIGST As Double = 0
            Dim minvtotalGSTAmt As Double = 0

            For iRow As Integer = 1 To c1fgItems.Rows - 1
                If Trim(c1fgItems.get_TextMatrix(iRow, 1)) = Trim(txtProdCode.Text) _
                                               AndAlso Trim(c1fgItems.get_TextMatrix(iRow, 2)) = TxtIDMarks.Text AndAlso Trim(c1fgItems.get_TextMatrix(iRow, 9)) = Val(TxtNetwt.Text) Then
                    c1fgItems.set_TextMatrix(iRow, 3, RemoveSingleQuotes(TxtIDMarks.Text))
                    c1fgItems.set_TextMatrix(iRow, 4, TxtHSNCode.Text)
                    c1fgItems.set_TextMatrix(iRow, 5, TxtUomcode.Text)
                    c1fgItems.set_TextMatrix(iRow, 6, txtpackingmode.Text)

                    c1fgItems.set_TextMatrix(iRow, 7, Val(Txtnoofitems.Text))
                    c1fgItems.set_TextMatrix(iRow, 8, Val(Txtqtymtrs.Text))

                    c1fgItems.set_TextMatrix(iRow, 9, Val(TxtNetwt.Text))
                    c1fgItems.set_TextMatrix(iRow, 10, Val(txtRateQty.Text))
                    c1fgItems.set_TextMatrix(iRow, 11, Val(txtINvExmill.Text))

                    c1fgItems.set_TextMatrix(iRow, 14, Val(txtgst_pers.Text))
                    'c1fgItems.set_TextMatrix(iRow, 15, Val(Txtcgstval.Text))
                    'c1fgItems.set_TextMatrix(iRow, 16, Val(Txtsgstval.Text))
                    'c1fgItems.set_TextMatrix(iRow, 17, Val(Txtigstval.Text))
                    'c1fgItems.set_TextMatrix(iRow, 18, Val(TxttotGSTTax.Text))

                    For iRows As Integer = 1 To c1fgItems.Rows - 1

                        'minvtotBoxwgt = Val(minvtotBoxwgt) + Val(c1fgLineItems.get_TextMatrix(iRow, 9))
                        minvtotalbox = Val(minvtotalbox) + Val(c1fgItems.get_TextMatrix(iRows, 7))
                        minvtotnetmtrs = Val(minvtotnetmtrs) + Val(c1fgItems.get_TextMatrix(iRows, 8))
                        minvtotnetwgt = Val(minvtotnetwgt) + Val(c1fgItems.get_TextMatrix(iRows, 9))
                        minvtotalExmill = Val(minvtotalExmill) + Val(c1fgItems.get_TextMatrix(iRows, 11))
                        'minvtotalCGST = Val(minvtotalCGST) + Val(c1fgItems.get_TextMatrix(iRows, 15))
                        'minvtotalSGST = Val(minvtotalSGST) + Val(c1fgItems.get_TextMatrix(iRows, 16))
                        'minvtotalIGST = Val(minvtotalIGST) + Val(c1fgItems.get_TextMatrix(iRows, 17))
                        'minvtotalGSTAmt = Val(minvtotalGSTAmt) + Val(c1fgItems.get_TextMatrix(iRows, 18))

                    Next
                    Txtinvtotbox.Text = minvtotalbox
                    txtTotNetwt.Text = minvtotnetwgt
                    TxtinvtotTaxable.Text = minvtotalExmill

                    'TxttotCgst.Text = minvtotalCGST
                    'TxttotSgst.Text = minvtotalSGST
                    'TxttotIgst.Text = minvtotalIGST
                    'txtTotalTax.Text = minvtotalGSTAmt

                    '  TxtInv_Amt.Text = Val(TxtinvtotTaxable.Text) + Val(txtTotalTax.Text)

                    Exit Sub
                End If
            Next

            With c1fgItems
                .Rows += 1
                .set_TextMatrix(c1fgItems.Rows - 1, 0, .Rows - 1)

                .set_TextMatrix(c1fgItems.Rows - 1, 1, CbxTranstype.Text)
                .set_TextMatrix(c1fgItems.Rows - 1, 2, txtProdCode.Text)
                .set_TextMatrix(c1fgItems.Rows - 1, 3, TxtIDMarks.Text)

                .set_TextMatrix(c1fgItems.Rows - 1, 4, TxtHSNCode.Text)
                .set_TextMatrix(c1fgItems.Rows - 1, 5, TxtUomcode.Text)
                .set_TextMatrix(c1fgItems.Rows - 1, 6, txtpackingmode.Text)

                .set_TextMatrix(c1fgItems.Rows - 1, 7, Val(Txtnoofitems.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 8, Val(Txtqtymtrs.Text))

                .set_TextMatrix(c1fgItems.Rows - 1, 9, Val(TxtNetwt.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 10, Val(txtRateQty.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 11, Val(txtINvExmill.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 14, Val(txtgst_pers.Text))
                '.set_TextMatrix(c1fgItems.Rows - 1, 15, Val(Txtcgstval.Text))
                '.set_TextMatrix(c1fgItems.Rows - 1, 16, Val(Txtsgstval.Text))
                '.set_TextMatrix(c1fgItems.Rows - 1, 17, Val(Txtigstval.Text))
                '.set_TextMatrix(c1fgItems.Rows - 1, 18, Val(TxttotGSTTax.Text))
            End With
            minvtotBoxwgt = 0
            minvtotnetmtrs = 0
            minvtotalbox = 0
            minvtotalcones = 0
            minvtotnetwgt = 0

            minvtotalExmill = 0
            minvtotalCGST = 0
            minvtotalSGST = 0
            minvtotalIGST = 0

            minvtotalGSTAmt = 0

            For iRow As Integer = 1 To c1fgItems.Rows - 1
                minvtotalbox = Val(minvtotalbox) + Val(c1fgItems.get_TextMatrix(iRow, 7))
                minvtotnetmtrs = Val(minvtotnetmtrs) + Val(c1fgItems.get_TextMatrix(iRow, 8))
                minvtotnetwgt = Val(minvtotnetwgt) + Val(c1fgItems.get_TextMatrix(iRow, 9))
                minvtotalExmill = Val(minvtotalExmill) + Val(c1fgItems.get_TextMatrix(iRow, 11))
                'minvtotalCGST = Val(minvtotalCGST) + Val(c1fgItems.get_TextMatrix(iRow, 15))
                'minvtotalSGST = Val(minvtotalSGST) + Val(c1fgItems.get_TextMatrix(iRow, 16))
                'minvtotalIGST = Val(minvtotalIGST) + Val(c1fgItems.get_TextMatrix(iRow, 17))
                'minvtotalGSTAmt = Val(minvtotalGSTAmt) + Val(c1fgItems.get_TextMatrix(iRow, 18))
            Next
            Txtinvtotbox.Text = minvtotalbox

            txtTotNetwt.Text = minvtotnetwgt
            TxtinvtotTaxable.Text = minvtotalExmill
            'TxttotCgst.Text = minvtotalCGST
            'TxttotSgst.Text = minvtotalSGST
            'TxttotIgst.Text = minvtotalIGST
            'txtTotalTax.Text = minvtotalGSTAmt
            'TxtInv_Amt.Text = Val(TxtinvtotTaxable.Text) + Val(txtTotalTax.Text)

            txtProdCode.Text = ""
            CbxTranstype.Text = ""
            TxtUomcode.Text = ""
            TxtHSNCode.Text = ""
            txtpackingmode.Text = ""
            TxtIDMarks.Text = ""
            Txtnoofitems.Text = ""
            TxtNetwt.Text = "0"
            Txtqtymtrs.Text = "0"
            txtINvExmill.Text = 0
            txtgst_pers.Text = 0
            Txtcgstval.Text = 0
            Txtsgstval.Text = 0
            Txtigstval.Text = 0
            TxttotGSTTax.Text = 0
            txtProdCode.Focus()
            Calculate_Total_Qty()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub Calculate_Total_Qty()
        Try

            Dim minvtotalbox As Double = 0
            Dim minvtotalmtrs As Double = 0

            Dim minvtotnetwgt As Double = 0
            Dim minvtotalExmill As Double = 0
            Dim minvtotalCGST As Double = 0
            Dim minvtotalSGST As Double = 0
            Dim minvtotalIGST As Double = 0
            Dim minvtotalGSTAmt As Double = 0
            Dim RoundOff As Double = 0.0
            Dim mtotTaxable As Double = 0.0
            Txtinvtotbox.Text = 0
            txtTotNetwt.Text = 0
            TxtinvtotTaxable.Text = 0
            txtTotalTax.Text = 0
            TxtInv_Amt.Text = 0
            Dim mtot_Amt As Double = 0
            Dim mItem_Freight As Double = 0
            Dim mtotalamt As Double = 0
            Dim mPackamt As Double = 0
            Dim mitemtotal As Double = 0

            Dim mexmill As Double = 0
            Dim mFreight_cost As Double = 0
            Dim mGsttaxable As Double = 0
            Dim mcgst As Double = 0
            Dim msgst As Double = 0
            Dim migst As Double = 0

            Dim mtaxable As Double = 0

            For iRow As Integer = 1 To c1fgItems.Rows - 1
                minvtotalbox = Val(minvtotalbox) + Val(c1fgItems.get_TextMatrix(iRow, 7))
                minvtotalmtrs = Val(minvtotalmtrs) + Val(c1fgItems.get_TextMatrix(iRow, 8))
                minvtotnetwgt = Val(minvtotnetwgt) + Val(c1fgItems.get_TextMatrix(iRow, 9))
                mexmill = Val(mexmill) + Val(c1fgItems.get_TextMatrix(iRow, 11))

            Next

            mFreight_cost = Val(txtlorryfr.Text) / mexmill

            For iRow As Integer = 1 To c1fgItems.Rows - 1
                mItem_Freight = 0
                mItem_Freight = Math.Round(Val(c1fgItems.get_TextMatrix(iRow, 11)) * mFreight_cost, 3)
                mGsttaxable = Val(c1fgItems.get_TextMatrix(iRow, 11))

                '    mGsttaxable = Val(c1fgItems.get_TextMatrix(iRow, 11)) + mItem_Freight

                Dim gst_Pers As Double = 0
                gst_Pers = Val(c1fgItems.get_TextMatrix(iRow, 14))

                If Val(gst_Pers > 0) And Val(mGsttaxable > 0) And Chkigst.Checked = False Then
                    Dim cgst_Pers = Val(c1fgItems.get_TextMatrix(iRow, 14)) / 2

                    mcgst = (Val(mGsttaxable) * (cgst_Pers / 100))
                    msgst = (Val(mGsttaxable) * (cgst_Pers / 100))

                ElseIf Val(gst_Pers > 0) And Val(mGsttaxable > 0) And Chkigst.Checked = True Then
                    Dim migstpers As Double
                    migstpers = Val(c1fgItems.get_TextMatrix(iRow, 14))
                    migst = (Val(mGsttaxable) * (migstpers / 100))

                Else
                    mcgst = 0
                    msgst = 0
                    migst = 0

                End If

                'mcgst = Math.Round(mGsttaxable * Format(Val(c1fgItems.get_TextMatrix(iRow, 14)), "#.00") / 100, 2)
                'msgst = Math.Round(mGsttaxable * Format(Val(c1fgItems.get_TextMatrix(iRow, 14)), "#.00") / 100, 2)
                'migst = Math.Round(mGsttaxable * Format(Val(c1fgItems.get_TextMatrix(iRow, 14)), "#.00") / 100, 2)

                mitemtotal = mGsttaxable + mcgst + msgst + migst + mItem_Freight
                c1fgItems.set_TextMatrix(iRow, 12, Format(Val(mItem_Freight), "#.000"))
                c1fgItems.set_TextMatrix(iRow, 13, Format(Val(mGsttaxable), "#.000"))
                c1fgItems.set_TextMatrix(iRow, 15, mcgst)
                c1fgItems.set_TextMatrix(iRow, 16, msgst)
                c1fgItems.set_TextMatrix(iRow, 17, migst)
                c1fgItems.set_TextMatrix(iRow, 18, mcgst + msgst + migst)

            Next
            minvtotalbox = 0
            minvtotalmtrs = 0
            minvtotnetwgt = 0
            minvtotalExmill = 0
            mtotTaxable = 0
            minvtotalCGST = 0
            minvtotalSGST = 0
            minvtotalIGST = 0
            minvtotalGSTAmt = 0
            For iRow As Integer = 1 To c1fgItems.Rows - 1
                minvtotalbox = Val(minvtotalbox) + Val(c1fgItems.get_TextMatrix(iRow, 7))
                minvtotalmtrs = Val(minvtotalmtrs) + Val(c1fgItems.get_TextMatrix(iRow, 8))

                minvtotnetwgt = Val(minvtotnetwgt) + Val(c1fgItems.get_TextMatrix(iRow, 9))
                minvtotalExmill = Val(minvtotalExmill) + Val(c1fgItems.get_TextMatrix(iRow, 11))
                mtotTaxable = Val(mtotTaxable) + Val(c1fgItems.get_TextMatrix(iRow, 13))

                minvtotalCGST = Val(minvtotalCGST) + Val(c1fgItems.get_TextMatrix(iRow, 15))
                minvtotalSGST = Val(minvtotalSGST) + Val(c1fgItems.get_TextMatrix(iRow, 16))
                minvtotalIGST = Val(minvtotalIGST) + Val(c1fgItems.get_TextMatrix(iRow, 17))
                minvtotalGSTAmt = Val(minvtotalGSTAmt) + Val(c1fgItems.get_TextMatrix(iRow, 18))
            Next

            Txtinvtotbox.Text = minvtotalbox
            txtTotNetwt.Text = Math.Round(mexmill, 2)
            TxtinvtotTaxable.Text = Math.Round(mtotTaxable, 2)
            TxttotCgst.Text = minvtotalCGST
            TxttotSgst.Text = minvtotalSGST
            TxttotIgst.Text = minvtotalIGST
            ' txtTotalTax.Text = minvtotalGSTAmt

            txtTotalTax.Text = Math.Round((Val(TxttotCgst.Text) + Val(TxttotSgst.Text) + Val(TxttotIgst.Text)), 2)
            TxtInv_Amt.Text = Math.Round(Val(TxtinvtotTaxable.Text) + Val(txtTotalTax.Text) + Val(txtlorryfr.Text), 0)
            RoundOff = Math.Round(Val(TxtinvtotTaxable.Text) + Val(txtTotalTax.Text), 2)
            Dim var2 As Decimal = Math.Round(RoundOff)
            Dim var3 As Decimal = var2 - RoundOff
            If Math.Round(var3, 2) < 0 Then
                lblRoundOff.ForeColor = Color.Red
                'lblAddLess.Text = "Less "
                lblRoundOff.Text = Convert.ToString(Math.Round(var3, 2))
                lblRoundOff.Visible = True
            ElseIf Math.Round(var3, 2) > 0 Then
                lblRoundOff.ForeColor = Color.Green
                'lblAddLess.Text = "Add "
                lblRoundOff.Text = Convert.ToString(Math.Round(var3, 2))
                lblRoundOff.Visible = True
            ElseIf Math.Round(var3, 2) = 0 Then
                lblRoundOff.Text = 0
            End If

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
            ''  C1Tab2.SelectedIndex = 0
            Fill_Grid_Title()

            txtDCNo.Text = ""
            If mvarFinYearEndDate <= dtpDCDate.Value Then
                dtpDCDate.Value = mvarFinYearEndDate
            Else
                dtpDCDate.Value = Now
            End If
            TxtBilledtoCode.Text = ""
            TxtBilledtoName.Text = ""
            LblBilledtoName.Text = ""
            LblshiptoName.Text = ""
            TxtrefNo.Text = ""
            dtpRefDate.Value = Now

            Txtshiptocode.Text = ""
            TxtshiptoName.Text = ""
            'TxtPackingpurpose.Text = ""

            TxtPlaceofsupply.Text = ""
            TxtLorryno.Text = ""

            txtProdCode.Text = ""
            CbxTranstype.Text = ""
            TxtUomcode.Text = ""
            TxtHSNCode.Text = ""
            txtpackingmode.Text = ""
            TxtIDMarks.Text = ""

            TxtHSNCode.Text = ""
            TxtUomcode.Text = ""
            TxtNetwt.Text = "0"
            Txtqtymtrs.Text = "0"

            tbOthers.Text = ""

            cbxScreenMode.SelectedIndex = 0
            cbxScreenMode.Text = "Add"

            txtINvExmill.Text = 0
            txtgst_pers.Text = 0
            Txtcgstval.Text = 0
            Txtsgstval.Text = 0
            Txtigstval.Text = 0
            TxttotGSTTax.Text = 0
            TxtHSNCode.Text = ""

            Txtinvtotbox.Text = 0

            txtTotNetwt.Text = 0
            TxtinvtotTaxable.Text = 0
            txtTotalTax.Text = 0
            TxttotCgst.Text = 0
            TxttotSgst.Text = 0
            TxttotIgst.Text = 0
            TxtInv_Amt.Text = 0
            txtRateQty.Text = "1"

            'btnApply.Enabled = False
            txtDCNo.Focus()
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

    Private Sub btnClear_Line_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear_Line.Click
        Try
            clearLIneitems()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub clearLIneitems()
        Try

            txtProdCode.Text = ""
            CbxTranstype.Text = ""
            TxtUomcode.Text = ""
            TxtHSNCode.Text = ""
            txtpackingmode.Text = ""
            TxtIDMarks.Text = ""

            Txtnoofitems.Text = "0"
            TxtHSNCode.Text = ""
            TxtUomcode.Text = ""
            TxtNetwt.Text = "0"
            Txtqtymtrs.Text = "0"
            txtRateQty.Text = "1"
            txtINvExmill.Text = 0
            txtgst_pers.Text = 0
            Txtcgstval.Text = 0
            Txtsgstval.Text = 0
            Txtigstval.Text = 0
            TxttotGSTTax.Text = 0
            txtProdCode.Focus()
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

                CbxTranstype.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 1)
                txtProdCode.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 2)
                TxtIDMarks.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 3)

                TxtHSNCode.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 4)
                TxtUomcode.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 5)
                txtpackingmode.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 6)
                Txtqtymtrs.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 8)
                Txtnoofitems.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 7)

                TxtNetwt.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 9)
                txtRateQty.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 10)

                txtINvExmill.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 11)
                Txtcgstval.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 15)
                Txtsgstval.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 16)
                Txtigstval.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 17)

                txtgst_pers.Text = c1fgItems.get_TextMatrix(c1fgItems.RowSel, 14)

                ''Remove Row Sels
                c1fgItems.RemoveItem(c1fgItems.RowSel)
                For iRow As Integer = 1 To c1fgItems.Rows - 1
                    c1fgItems.set_TextMatrix(iRow, 0, iRow)
                Next
                Calculate_Total_Qty()
                txtProdCode.Focus()
                Exit Sub

            End If

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnApply_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnApply.Click
        Dim mvarRecordStatus As Integer = Nothing
        Dim mvarMsgDialogResult As Integer = Nothing
        Dim mvarUpateStatus As Integer = Nothing
        Dim mSaveString As String = ""
        Dim mTaxString As String = ""

        Try

            If cbxScreenMode.Text = "View" Then Exit Sub
            If IsBlankComboBox(cbxNumberType) Then Exit Sub
            If IsBlankTextBox(TxtBilledtoCode) Then Exit Sub
            If IsBlankTextBox(TxtLorryno) Then Exit Sub

            Dim indate As String = ""
            indate = Format(dtpDCDate.Value, "yyyy/MM/dd")

            'Calculate_Total_Qty()

            'If Val(tbNetRound.Text) > 1 Then
            '    Show_Message("Kindly check party invoice value.")
            '    tbPartyBillValue.Focus()
            '    Exit Sub
            'End If
            If mvarCompanyCode = "102" And Trim(TxtBilledtoName.Text) = "THENI KRISHNA MILLS (P) LTD" Then
                Show_Message("Company Name and Billed to Same, Kindly check")
                TxtBilledtoName.Focus()
                Exit Sub
            End If
            RemoveEmptyRows(c1fgItems, 0)

            If c1fgItems.Rows <= 1 Then
                Show_Message("Please enter line item.")
                txtProdCode.Focus()
                Exit Sub
            End If
            '  If IsValidDate(dtpadvDate.Value) = False Then Exit Sub

            If Not RemoveSingleQuotes(txtDCNo.Text) = "" Then

                mvarRecordStatus = GetDeleteAutorize_Status(RemoveSingleQuotes(txtDCNo.Text), Format(dtpDCDate.Value, "yyyy/MM/dd") _
                                                           , "DC_No", "DC_Date", "DB_General..GEN_DeliveryChallan_Main", "AUTHORIZE")
                If mvarRecordStatus = 3 Then
                    Show_Message("Already authorized.")
                    Exit Sub
                End If

                mvarRecordStatus = GetDeleteAutorize_Status(RemoveSingleQuotes(txtDCNo.Text), Format(dtpDCDate.Value, "yyyy/MM/dd") _
                                                           , "DC_No", "DC_Date", "DB_General..GEN_DeliveryChallan_Main", "DELETE")
                If mvarRecordStatus = 2 Then
                    Show_Message("Already deleted.")
                    Exit Sub
                End If

                mvarRecordStatus = GetDeleteAutorize_Status(RemoveSingleQuotes(txtDCNo.Text), Format(dtpDCDate.Value, "yyyy/MM/dd") _
                                                           , "DC_No", "DC_Date", "DB_General..GEN_DeliveryChallan_Main", "")
            End If

            ds = Nothing
            ds = New DataSet

            '  Dim indate As String = ""

            '   indate = Format(dtpadvDate.Value, "yyyy/MM/dd")

            Dim mNetTotal As Double = 0

            Select Case cbxScreenMode.Text
                Case "Add"
                    If mvarRecordStatus >= 1 Then
                        mvarMsgDialogResult = ShowYesNo("  Delivery Challan Entry details are already exists." _
                                                             & vbCrLf & "Do you want to modify?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            cbxScreenMode.Text = "Modify"
                        ElseIf mvarMsgDialogResult = MsgBoxResult.No Then
                            mvarMsgDialogResult = ShowYesNo("Do you want to create new   Delivery Challan Entry?")
                            If mvarMsgDialogResult = MsgBoxResult.Yes Then
                                txtDCNo.Text = ""
                            Else
                                Exit Sub
                            End If
                        Else
                            Exit Sub
                        End If
                    End If

                Case "Modify"

                    If mvarRecordStatus <= 0 Then
                        mvarMsgDialogResult = ShowYesNo("Delivery Challan Entry details are doesn't exist." _
                                                             & vbCrLf & "Do you want to create new Delivery Challan Entry?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            txtDCNo.Text = ""
                            cbxScreenMode.Text = "Add"
                        Else
                            Exit Sub
                        End If
                    End If
                Case "Authorize"
                    If mvarRecordStatus <= 0 Then
                        Show_Message(" Delivery Challan Entry  details are doesn't exists.")
                        Exit Sub
                    Else

                        mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(txtDCNo.Text), Format(dtpDCDate.Value, "yyyy/MM/dd") _
                                                           , "DC_No", "DC_Date", "DB_General..GEN_DeliveryChallan_Line", "AUTHORIZE")
                        mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(txtDCNo.Text), Format(dtpDCDate.Value, "yyyy/MM/dd") _
                                                            , "DC_No", "DC_Date", "DB_General..GEN_DeliveryChallan_Main", "AUTHORIZE")

                        If mvarUpateStatus = 3 Then
                            ''------------------- Account Posting ------------------------------------------------------------------'
                            'If mobjclsProcessingInvoice.ProcessingInvoiceAccountPosting(Trim(tbEntryNo.Text)) = 0 Then
                            '    Show_Message("Error.")
                            '    Exit Sub
                            'End If
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
                            'mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(txtEntryNo.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                            '                         , "DC_No", "DC_Date", " SPP_FabProcessingInvoice_Tax", "DELETE")

                            mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(txtDCNo.Text), Format(dtpDCDate.Value, "yyyy/MM/dd") _
                                                         , "DC_No", "DC_Date", "DB_General..GEN_DeliveryChallan_Line", "DELETE")
                            mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(txtDCNo.Text), Format(dtpDCDate.Value, "yyyy/MM/dd") _
                                                          , "DC_No", "DC_Date", "DB_General..GEN_DeliveryChallan_Main", "DELETE")
                            'If mvarUpateStatus = 2 Then

                            '    SSQL = ""
                            '    SSQL = "Delete From  _DeliveryChallan_Main Where Comp_Code='" & mvarCompanyCode & "'"
                            '    SSQL &= " And Receipt_No='" & txtEntryNo.Text.Trim & "'"
                            '    SSQL &= " And [Receipt_Date]='" & Format(dtpEntryDate.Value, "yyyy/MM/dd") & "'"
                            '    SSQL &= " And Invoice_No='" & tbPartyInvNo.Text.Trim & "'"
                            '    SSQL &= " And Invoice_Date='" & Format(dtpEntryDate.Value, "yyyy/MM/dd") & "'"
                            '    SSQL &= " And Sup_Code='" & Trim(tbPartyCode.Text) & "'"
                            '    SSQL &= " And Acc_Post='N'"

                            '    InsertDeleteUpdate(SSQL, "eAccount ")
                            '    Show_Message("Deleted.")
                            '    Form_Clear()
                            'Else
                            '    Show_Message("Error.")
                            'End If
                            Exit Sub
                        Else
                            Exit Sub
                        End If
                    End If
                Case Else
                    Exit Sub
            End Select

            mSaveString = ""
            mSaveString = RemoveSingleQuotes(txtDCNo.Text) & "||"
            mSaveString &= Format(dtpDCDate.Value, "yyyy/MM/dd") & "||"

            mSaveString &= "LOCAL" & "||"
            mSaveString &= RemoveSingleQuotes(Trim(TxtBilledtoCode.Text)) & "||"

            mSaveString &= RemoveSingleQuotes(Trim(TxtBilledtoName.Text)) & "||"
            mSaveString &= RemoveSingleQuotes(Trim(Txtshiptocode.Text)) & "||"
            mSaveString &= RemoveSingleQuotes(Trim(TxtPlaceofsupply.Text)) & "||"
            'mSaveString &= RemoveSingleQuotes(Trim(TxtPackingpurpose.Text)) & "||"
            mSaveString &= RemoveSingleQuotes(Trim(CbxIssueddept.Text)) & "||"
            mSaveString &= RemoveSingleQuotes(Trim(TxtLorryno.Text)) & "||"

            mSaveString &= RemoveSingleQuotes(Trim(TxtrefNo.Text)) & "||"
            mSaveString &= Format(dtpRefDate.Value, "yyyy/MM/dd") & "||"

            mSaveString &= Val(txtlorryfr.Text) & "||"

            mSaveString &= Val(TxtinvtotTaxable.Text) & "||"
            mSaveString &= Val(TxttotCgst.Text) & "||"
            mSaveString &= Val(TxttotSgst.Text) & "||"
            mSaveString &= Val(TxttotIgst.Text) & "||"
            mSaveString &= Val(txtTotalTax.Text) & "||"
            mSaveString &= Val(lblRoundOff.Text) & "||"

            mSaveString &= Val(TxtInv_Amt.Text) & "||"
            mSaveString &= Trim(tbOthers.Text) & "||"

            mSaveString &= "" & "||"

            mSaveString &= "0" & "||"

            txtDCNo.Text = mobjclsSalesadvice.SaveGEN_DeliveryChallan_Main(mSaveString, cbxScreenMode.Text, c1fgItems, cbxNumberType.Text)

            If txtDCNo.Text = "Error" Then
                Show_Message("Error.")
                txtDCNo.Text = ""
                Exit Sub
            Else

                ''   ------------------- Account Posting ------------------------------------------------------------------'
                'If mobjclsProcessingInvoice.ProcessingInvoiceAccountPosting(Trim(tbEntryNo.Text)) = 0 Then
                '    Show_Message("Error.")
                '    Exit Sub
                'End If
                Show_Message("Successfully saved.")
                cbxScreenMode.Text = "Modify"
                ' Form_Clear()
                Exit Sub
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPK_Entryno_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_advno.Click
        Try

            Dim mauthorize As Integer = 0
            If cbxScreenMode.Text = "View" Then
                mauthorize = 1
            ElseIf cbxScreenMode.Text = "Modify" Or cbxScreenMode.Text = "Authorize" Then
                mauthorize = 0
            End If
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing

            ds = mobjclsSalesadvice.GetDeliverychallanDetails("", mauthorize, "", "ALL")

            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Delivery Challan Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            txtDCNo.Text = dtPickList.Rows(0)("DC_No")
            dtpDCDate.Value = dtPickList.Rows(0)("DC_Date")
            TxtBilledtoCode.Text = dtPickList.Rows(0)("Party_Code")
            TxtBilledtoName.Text = dtPickList.Rows(0)("Party_Name")

            Txtshiptocode.Text = dtPickList.Rows(0)("Delivered_To")

            TxtshiptoName.Text = dtPickList.Rows(0)("ShipTo_Name")

            TxtrefNo.Text = dtPickList.Rows(0)("Ref_Doc_No")
            dtpRefDate.Value = dtPickList.Rows(0)("Ref_Doc_Date")

            'CbxIssueddept.Text = dtPickList.Rows(0)("Packing_Purpose")
            CbxIssueddept.Text = dtPickList.Rows(0)("Department")
            TxtPlaceofsupply.Text = dtPickList.Rows(0)("Place_Of_Supply")
            TxtLorryno.Text = dtPickList.Rows(0)("Lorry_no")

            tbOthers.Text = dtPickList.Rows(0)("Others_Desc")
            TxtinvtotTaxable.Text = dtPickList.Rows(0)("Tot_Taxable_Value")
            TxttotCgst.Text = dtPickList.Rows(0)("Tot_CGST")
            TxttotSgst.Text = dtPickList.Rows(0)("Tot_SGST")
            TxttotIgst.Text = dtPickList.Rows(0)("Tot_IGST")
            txtTotalTax.Text = dtPickList.Rows(0)("Tot_GST_Value")

            TxtInv_Amt.Text = dtPickList.Rows(0)("Invoice_Value")
            Fill_Screen_Details()

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Screen_Details()
        Try
            If Trim(txtDCNo.Text) = "" Then Exit Sub
            ds = Nothing
            ds = New DataSet
            ds = mobjclsSalesadvice.GetDeliverychallanDetails(Trim(txtDCNo.Text), "", "", "SPECIFY")
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            Fill_Grid_Title()

            c1fgItems.Rows = ds.Tables(0).Rows.Count + 1

            For iRow As Integer = 0 To ds.Tables(0).Rows.Count - 1
                With c1fgItems
                    .set_TextMatrix(iRow + 1, 0, ds.Tables(0).Rows(iRow)("SNo"))

                    .set_TextMatrix(iRow + 1, 1, ds.Tables(0).Rows(iRow)("Trans_Type"))
                    .set_TextMatrix(iRow + 1, 2, ds.Tables(0).Rows(iRow)("Prod_Desc"))
                    .set_TextMatrix(iRow + 1, 3, ds.Tables(0).Rows(iRow)("ID_Mark"))
                    .set_TextMatrix(iRow + 1, 4, ds.Tables(0).Rows(iRow)("HSN_Code"))
                    .set_TextMatrix(iRow + 1, 5, ds.Tables(0).Rows(iRow)("UOM_Code"))

                    .set_TextMatrix(iRow + 1, 6, ds.Tables(0).Rows(iRow)("Packing_Mode"))
                    .set_TextMatrix(iRow + 1, 7, ds.Tables(0).Rows(iRow)("No_Of_Bags"))

                    .set_TextMatrix(iRow + 1, 8, ds.Tables(0).Rows(iRow)("Net_Meters"))

                    .set_TextMatrix(iRow + 1, 9, ds.Tables(0).Rows(iRow)("Net_Wt"))
                    .set_TextMatrix(iRow + 1, 10, ds.Tables(0).Rows(iRow)("Rate_Per_Qty"))
                    .set_TextMatrix(iRow + 1, 11, ds.Tables(0).Rows(iRow)("Line_Total"))
                    .set_TextMatrix(iRow + 1, 12, ds.Tables(0).Rows(iRow)("Lorry_Frieght"))
                    .set_TextMatrix(iRow + 1, 13, ds.Tables(0).Rows(iRow)("Taxable_Amt"))

                    .set_TextMatrix(iRow + 1, 14, ds.Tables(0).Rows(iRow)("GST_per"))
                    .set_TextMatrix(iRow + 1, 15, ds.Tables(0).Rows(iRow)("CGST"))
                    .set_TextMatrix(iRow + 1, 16, ds.Tables(0).Rows(iRow)("SGST"))
                    .set_TextMatrix(iRow + 1, 17, ds.Tables(0).Rows(iRow)("IGST"))
                    .set_TextMatrix(iRow + 1, 18, ds.Tables(0).Rows(iRow)("Tot_GST"))

                End With
            Next

            'ds = Nothing
            'ds = New DataSet
            'ds = mobjclsSalesadvice.GetGSTVoucherInvoiceDetails(Trim(txtEntryNo.Text), "", "", "TAX")

            'If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            'Calculate_Charges()

            cbxScreenMode.Text = "Modify"
            txtProdCode.Focus()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub cbxYear_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            Fill_Grid_Title()

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub tbratemeter_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles Txtqtymtrs.LostFocus
        Try
            If (Txtqtymtrs.Text = "") Then
                Txtqtymtrs.Text = 0
            Else
                If Val(Txtqtymtrs.Text > 0) Then
                    ''    Cal_DCMeter_Amount()
                End If
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub tbDCMeter_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles TxtNetwt.LostFocus
        Try
            'Dim mOutput As String = ""

            If (TxtNetwt.Text = "") Then
                TxtNetwt.Text = 0
            Else
                'mOutput = CheckOnlyNumeric(tbDCMeter.Text)
                If Val(TxtNetwt.Text > 0) Then

                End If
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub BtnDCPrint_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnDCPrint.Click
        'If mvarReportName = "" Then Exit Sub
        Try
            If IsBlankTextBox(txtDCNo) Then Exit Sub
            If Trim(txtDCNo.Text) = "" Then Exit Sub

            Dim crysrep As New ReportDocument
            Dim crysview As New frmRepView
            Dim mvarRecordStatus As Integer = Nothing

            ds1 = Nothing
            ds1 = New DataSet

            'ds1 = mobjclsLogin.GetCompanyDetails(mvarCompanyCode)
            'Dim maddress As String = ds1.Tables(0).Rows(0)("Comp_Add1") + " ," + ds1.Tables(0).Rows(0)("Comp_Add2") + " , " + ds1.Tables(0).Rows(0)("Comp_Add3") + " - " + ds1.Tables(0).Rows(0)("Comp_zipcode") + "          GSTIN :" + ds1.Tables(0).Rows(0)("Comp_gst_No") + ""
            '' MsgBox(maddress)

            ds1 = mobjclsLogin.GetLocationDetails(mvarCompanyCode, mvarLocationCode)
            Dim maddress As String = ds1.Tables(0).Rows(0)("Location_Add1") + " ," + ds1.Tables(0).Rows(0)("Location_Add2") + " , " + ds1.Tables(0).Rows(0)("Location_city") + " - " + ds1.Tables(0).Rows(0)("Location_zipcode") + "          GSTIN :" + ds1.Tables(0).Rows(0)("Location_gst_No") + ""

            Dim mdctype As String = ""

            Dim partycode As String = ""
            Dim Type As String = "Delivery_Challan"

            Dim dsMain As New DataSet
            Dim dsTax As New DataSet

            dsMain = Nothing
            dsMain = New DataSet

            dsTax = Nothing
            dsTax = New DataSet

            dsMain = mobjclsSalesadvice.GetDeliverychallanDetails(Trim(txtDCNo.Text), "", "", "Delivery_challan")

            If dsMain.Tables(0).Rows.Count <= 0 Then
                Show_Message("No record found.")
                Exit Sub

            Else
                dsTax = mobjclsSalesadvice.GetDeliverychallanDetails(Trim(txtDCNo.Text), "", "", "Delivery_Challan_Tax")

            End If

            If dsMain.Tables(0).Rows.Count <= 0 Then Exit Sub

            ''   strFileLocation = mvarReportPath & "\REPORTS\REGULAR\SALES\Sales_Invoice_Export_A4_QR.rpt"
            mvarReportName = mvarReportPath & "\REPORTS\General\SPG_DELIVERYNote.rpt"

            crysview.Text = "Delivery Challan"
            crysrep.Load(mvarReportName)
            crysrep.SetDataSource(dsMain.Tables(0))
            If dsTax.Tables(0).Rows.Count >= 1 Then
                crysrep.Subreports.Item("TaxReport").SetDataSource(dsTax.Tables(0))
                '  crysrep.Subreports.Item("TaxReport.rpt").SetDataSource(dsTax.Tables(0))

            End If

            crysview.CrystalReportViewer1.ReportSource = crysrep
            crysview.CrystalReportViewer1.Refresh()
            ' ''crysrep.PrintToPrinter(1, False, 1, 1)
            crysview.CrystalReportViewer1.Zoom(100)
            crysview.Show()
            Exit Sub

            Exit Sub
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnDuplicate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDuplicate.Click
        'If mvarReportName = "" Then Exit Sub
        Try
            If IsBlankTextBox(txtDCNo) Then Exit Sub
            If Trim(txtDCNo.Text) = "" Then Exit Sub

            Dim crysrep As New ReportDocument
            Dim crysview As New frmRepView
            Dim mvarRecordStatus As Integer = Nothing

            ds1 = Nothing
            ds1 = New DataSet

            'ds1 = mobjclsLogin.GetCompanyDetails(mvarCompanyCode)
            'Dim maddress As String = ds1.Tables(0).Rows(0)("Comp_Add1") + " ," + ds1.Tables(0).Rows(0)("Comp_Add2") + " , " + ds1.Tables(0).Rows(0)("Comp_Add3") + " - " + ds1.Tables(0).Rows(0)("Comp_zipcode") + "          GSTIN :" + ds1.Tables(0).Rows(0)("Comp_gst_No") + ""
            '' MsgBox(maddress)

            ds1 = mobjclsLogin.GetLocationDetails(mvarCompanyCode, mvarLocationCode)
            Dim maddress As String = ds1.Tables(0).Rows(0)("Location_Add1") + " ," + ds1.Tables(0).Rows(0)("Location_Add2") + " , " + ds1.Tables(0).Rows(0)("Location_city") + " - " + ds1.Tables(0).Rows(0)("Location_zipcode") + "          GSTIN :" + ds1.Tables(0).Rows(0)("Location_gst_No") + ""

            Dim mdctype As String = ""

            Dim partycode As String = ""
            Dim Type As String = "Delivery_Challan"

            Dim dsMain As New DataSet
            Dim dsTax As New DataSet

            dsMain = Nothing
            dsMain = New DataSet

            dsTax = Nothing
            dsTax = New DataSet

            dsMain = mobjclsSalesadvice.GetDeliverychallanDetails(Trim(txtDCNo.Text), "", "", "Delivery_challan")

            If dsMain.Tables(0).Rows.Count <= 0 Then
                Show_Message("No record found.")
                Exit Sub

            Else
                dsTax = mobjclsSalesadvice.GetDeliverychallanDetails(Trim(txtDCNo.Text), "", "", "Delivery_Challan_Tax")

            End If

            If dsMain.Tables(0).Rows.Count <= 0 Then Exit Sub

            ''   strFileLocation = mvarReportPath & "\REPORTS\REGULAR\SALES\Sales_Invoice_Export_A4_QR.rpt"
            mvarReportName = mvarReportPath & "\REPORTS\General\SPG_DELIVERYNote.rpt"

            crysview.Text = "Delivery Challan"
            crysrep.Load(mvarReportName)
            crysrep.SetDataSource(dsMain.Tables(0))
            If dsTax.Tables(0).Rows.Count >= 1 Then
                crysrep.Subreports.Item("TaxReport").SetDataSource(dsTax.Tables(0))
            End If

            crysview.CrystalReportViewer1.ReportSource = crysrep
            crysview.CrystalReportViewer1.Refresh()
            ' ''crysrep.PrintToPrinter(1, False, 1, 1)
            crysview.CrystalReportViewer1.Zoom(100)
            crysview.Show()
            Exit Sub

            Exit Sub
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click
        'If mvarReportName = "" Then Exit Sub
        Try
            If IsBlankTextBox(txtDCNo) Then Exit Sub
            If Trim(txtDCNo.Text) = "" Then Exit Sub

            Dim crysrep As New ReportDocument
            Dim crysview As New frmRepView

            Dim mdctype As String = ""

            Dim partycode As String = ""

            Dim Type As String = "DeliveryChallan_Report"
            mvarReportName = mvarReportPath & "\REPORTS\REGULAR\Invoice\Gatepass_Print.rpt"

            ds = Nothing
            ds = New DataSet
            ds = mobjclsSalesadvice.GetDeliverychallanDetails(Trim(txtDCNo.Text), "", "", "Delivery_challan")

            If ds.Tables(0).Rows.Count <= 0 Then
                Show_Message("No record found.")
                Exit Sub
            End If
            crysview.Text = Me.Text
            crysrep.Load(mvarReportName)
            crysrep.SetDataSource(ds.Tables(0))
            'crysrep.DataDefinition.FormulaFields("Fdate").Text = "'" + Format(dtpFromDate.Value, "dd/MM/yyyy") + "'"
            'crysrep.DataDefinition.FormulaFields("Tdate").Text = "'" + Format(DtpTodate.Value, "dd/MM/yyyy") + "'"

            'crysrep.PrintOptions.PaperSize = CrystalDecisions.[Shared].PaperSize.PaperA4
            'crysrep.PrintOptions.ApplyPageMargins(New CrystalDecisions.Shared.PageMargins(0, 0, 0, 0))
            crysview.CrystalReportViewer1.ReportSource = crysrep
            crysview.CrystalReportViewer1.Refresh()
            crysview.CrystalReportViewer1.Zoom(100)
            crysview.Show()

            ' crysview.getPrintOutputController().modifyUserPaperSize(50000, 50000)
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub cbxtranstype_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try

            TxtNetwt.ReadOnly = False
            Txtnoofitems.ReadOnly = False
            Txtqtymtrs.ReadOnly = False

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnInformation_Click(sender As Object, e As EventArgs) Handles btnInformation.Click
        'If mvarReportName = "" Then Exit Sub
        Try
            If IsBlankTextBox(txtDCNo) Then Exit Sub
            If Trim(txtDCNo.Text) = "" Then Exit Sub

            Dim crysrep As New ReportDocument
            Dim crysview As New frmRepView

            Dim mdctype As String = ""

            Dim partycode As String = ""

            Dim Type As String = "DeliveryChallan_Report"
            mvarReportName = mvarReportPath & "\REPORTS\REGULAR\Invoice\LS_Gatepass_Print.rpt"

            ds = Nothing
            ds = New DataSet
            ds = mobjclsSalesadvice.GetDeliverychallanDetails(Trim(txtDCNo.Text), "", "", "Delivery_Challan")

            If ds.Tables(0).Rows.Count <= 0 Then
                Show_Message("No record found.")
                Exit Sub
            End If
            crysview.Text = Me.Text
            crysrep.Load(mvarReportName)
            crysrep.SetDataSource(ds.Tables(0))
            'crysrep.DataDefinition.FormulaFields("Fdate").Text = "'" + Format(dtpFromDate.Value, "dd/MM/yyyy") + "'"
            'crysrep.DataDefinition.FormulaFields("Tdate").Text = "'" + Format(DtpTodate.Value, "dd/MM/yyyy") + "'"

            'crysrep.PrintOptions.PaperSize = CrystalDecisions.[Shared].PaperSize.PaperA4
            'crysrep.PrintOptions.ApplyPageMargins(New CrystalDecisions.Shared.PageMargins(0, 0, 0, 0))
            crysview.CrystalReportViewer1.ReportSource = crysrep
            crysview.CrystalReportViewer1.Refresh()
            crysview.CrystalReportViewer1.Zoom(100)
            crysview.Show()

            ' crysview.getPrintOutputController().modifyUserPaperSize(50000, 50000)
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub C2TapPage1_Click(sender As Object, e As EventArgs) Handles C2TapPage1.Click

    End Sub

    Private Sub Txtnoofitems_Leave(sender As Object, e As EventArgs) Handles Txtnoofitems.Leave, Txtqtymtrs.Leave
        Try
            ''Dim mOutput As String = ""
            'Dim mnetwt, msgst, mgstpers As Double
            'If Val(Txtnoofitems.Text) > 0 Or Val(TxtBagWt.Text) > 0 Then
            '    mnetwt = Val(Txtnoofitems.Text) * Val(TxtBagWt.Text)
            'Else
            '    mnetwt = ""

            'End If
            'TxtNetwt.Text = Val(mnetwt)

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Txtnoofitems_KeyDown(sender As Object, e As KeyEventArgs) Handles Txtnoofitems.KeyDown, Txtqtymtrs.KeyDown
        'Try
        '    'Dim mOutput As String = ""
        '    Dim mnetwt As Double
        '    If Val(Txtnoofitems.Text) > 0 Or Val(TxtBagwt.Text) > 0 Then
        '        mnetwt = Val(Txtnoofitems.Text) * Val(TxtBagwt.Text)
        '    Else
        '        mnetwt = ""

        '    End If
        '    TxtNetwt.Text = Val(mnetwt)

        'Catch ex As Exception
        '    Show_Message(ex.Message)
        'End Try
    End Sub

    Private Sub txtgst_pers_Leave(sender As Object, e As EventArgs) Handles txtgst_pers.Leave
        Try
            If Trim(txtgst_pers.Text) = "" Or Val(txtgst_pers.Text) = 0 Or Val(txtgst_pers.Text) = 5 Or Val(txtgst_pers.Text) = 12 Or Val(txtgst_pers.Text) = 18 Then
                Gst_Tax_calculation()
            Else
                MsgBox("Wrong Tax")
                txtgst_pers.Focus()
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub txtgst_pers_KeyDown(sender As Object, e As KeyEventArgs) Handles txtgst_pers.KeyDown
        'Try
        '    If Trim(txtgst_pers.Text) = "" Or Val(txtgst_pers.Text) = 0 Or Val(txtgst_pers.Text) = 5 Or Val(txtgst_pers.Text) = 12 Or Val(txtgst_pers.Text) = 18 Then
        '        Gst_Tax_calculation()
        '    Else
        '        MsgBox("Wrong Tax")
        '        txtgst_pers.Focus()
        '    End If

        'Catch ex As Exception
        '    Show_Message(ex.Message)
        'End Try
    End Sub

    Private Sub Chkigst_CheckedChanged(sender As Object, e As EventArgs) Handles Chkigst.CheckedChanged
        Try
            If Trim(txtgst_pers.Text) = "" Or Val(txtgst_pers.Text) = 0 Or Val(txtgst_pers.Text) = 5 Or Val(txtgst_pers.Text) = 12 Or Val(txtgst_pers.Text) = 18 Then
                Gst_Tax_calculation()
            Else
                MsgBox("Wrong Tax")
                txtgst_pers.Focus()
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub txtINvExmill_Leave(sender As Object, e As EventArgs) Handles txtINvExmill.Leave
        Try
            If Trim(txtgst_pers.Text) = "" Or Val(txtgst_pers.Text) = 0 Or Val(txtgst_pers.Text) = 5 Or Val(txtgst_pers.Text) = 12 Or Val(txtgst_pers.Text) = 18 Then
                Gst_Tax_calculation()
            Else
                MsgBox("Wrong Tax")
                txtgst_pers.Focus()
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub Gst_Tax_calculation()
        Try
            Txtcgstval.Text = 0
            Txtsgstval.Text = 0
            Txtigstval.Text = 0
            TxttotGSTTax.Text = 0

            lblcgstp.Text = (txtgst_pers.Text / 2) & "% CGST:"
            lblsgstp.Text = (txtgst_pers.Text / 2) & "% SGST:"
            lbligstp.Text = (txtgst_pers.Text) & "% IGST:"

            'Dim mOutput As String = ""

            Dim mcsgt, msgst, mgstpers As Double
            If (txtgst_pers.Text = "") Then
                '   txtgst_pers.Text = 0
                Exit Sub
            Else
                mgstpers = Val(txtgst_pers.Text) / 2

                'mOutput = CheckOnlyNumeric(tbDCMeter.Text)
                If Val(txtgst_pers.Text > 0) And Val(txtINvExmill.Text > 0) And Chkigst.Checked = False Then
                    mcsgt = (Val(txtINvExmill.Text) * (mgstpers / 100))
                    msgst = (Val(txtINvExmill.Text) * (mgstpers / 100))
                    Txtcgstval.Text = Round(mcsgt, 2)
                    Txtsgstval.Text = Round(msgst, 2)
                    Txtigstval.Text = 0
                ElseIf Val(txtgst_pers.Text > 0) And Val(txtINvExmill.Text > 0) And Chkigst.Checked = True Then
                    Dim migstpers, migst As Double
                    migstpers = Val(txtgst_pers.Text)
                    migst = (Val(txtINvExmill.Text) * (migstpers / 100))

                    Txtcgstval.Text = 0
                    Txtsgstval.Text = 0
                    Txtigstval.Text = Round(migst, 2)
                Else
                    Exit Sub

                End If
            End If

            TxttotGSTTax.Text = Val(Txtcgstval.Text) + Val(Txtsgstval.Text) + Val(Txtigstval.Text)

        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub
    Private Sub TxtNetwt_Leave(sender As Object, e As EventArgs) Handles TxtNetwt.Leave
        'Try
        '    Calculate_Inv_Tot()
        '    Gst_Tax_calculation()
        'Catch ex As Exception
        '    Show_Message(ex.Message)

        'End Try
    End Sub
    Private Sub Calculate_Inv_Tot()
        Try

            'If IsBlankTextBox(TxtInvnetwt) Then Exit Sub
            If CbxTranstype.Text = "Meter" Or CbxTranstype.Text = "Pieces" Then

                If Val(TxtNetwt.Text) < 0.001 Then
                    ' TxtInvnetwt.Focus()
                    Exit Sub
                End If
                'If TxtInvTarewt.Text.Trim = "" Or Val(TxtInvTarewt.Text) = 0 Then Exit Sub
                If TxtNetwt.Text.Trim = "" Then Exit Sub

                txtINvExmill.Text = Val(Txtqtymtrs.Text) * Val(txtRateQty.Text)
            ElseIf CbxTranstype.Text = "Nos" Then
                If Val(Txtnoofitems.Text) < 1 Then Exit Sub
                If Txtnoofitems.Text = "" Then Exit Sub

                txtINvExmill.Text = Val(Txtnoofitems.Text) * Val(txtRateQty.Text)
            ElseIf CbxTranstype.Text = "Weight" Then
                If Val(TxtNetwt.Text) < 0.001 Then Exit Sub
                If TxtNetwt.Text = "" Then Exit Sub

                txtINvExmill.Text = Val(TxtNetwt.Text) * Val(txtRateQty.Text)
                '    txtINvExmill.Focus()
            Else
                Exit Sub
            End If

            Gst_Tax_calculation()

        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub
    Private Sub TxtNetwt_KeyDown(sender As Object, e As KeyEventArgs) Handles TxtNetwt.KeyDown

    End Sub

    Private Sub txtRateQty_Leave(sender As Object, e As EventArgs) Handles txtRateQty.Leave
        Try
            Calculate_Inv_Tot()
        Catch ex As Exception
            Show_Message(ex.Message)

        End Try
    End Sub

    Private Sub txtRateQty_KeyDown(sender As Object, e As KeyEventArgs) Handles txtRateQty.KeyDown

    End Sub

    Private Sub txtINvExmill_KeyDown(sender As Object, e As KeyEventArgs) Handles txtINvExmill.KeyDown

    End Sub

    'Private Sub cbxTaxType_SelectedIndexChanged(sender As Object, e As EventArgs)
    '    If cbxGSTType.Text = "Inter-State" Then
    '        Chkigst.Checked = True
    '    ElseIf cbxGSTType.Text = "Intra-State" Then
    '        Chkigst.Checked = False

    '    Else
    '        Exit Sub
    '    End If
    'End Sub

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
            TxtLorryno.Text = dtPickList.Rows(0)("Vehicle_No")

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Label43_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label43.Click

    End Sub

    Private Sub TxtNetwt_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TxtNetwt.TextChanged

    End Sub

    Private Sub txtRateQty_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtRateQty.TextChanged

    End Sub

    Private Sub TxtHSNCode_Leave(ByVal sender As Object, ByVal e As System.EventArgs) Handles TxtHSNCode.Leave
        'Select Case CbxTranstype.Text
        '    Case "Fabric"
        '        TxtUomcode.Text = "MTR"
        '    Case "Yarn"
        '        TxtUomcode.Text = "KGS"
        '    Case "Towel"
        '        TxtUomcode.Text = "KGS"
        '    Case "Beam"
        '        TxtUomcode.Text = "KGS"
        '    Case "Madeups"
        '        TxtUomcode.Text = "PCS"
        '    Case "Others"
        '        TxtUomcode.Text = "NOS"
        'End Select

    End Sub

    Private Sub TxtHSNCode_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TxtHSNCode.TextChanged

    End Sub

    Private Sub CbxTranstype_Leave(ByVal sender As Object, ByVal e As System.EventArgs) Handles CbxTranstype.Leave
        Select Case CbxTranstype.Text
            Case "Weight"
                TxtUomcode.Text = "KGS"
            Case "Meter"
                TxtUomcode.Text = "MTR"
            Case "Pieces"
                TxtUomcode.Text = "PCS"
            Case "Nos"
                TxtUomcode.Text = "NOS"

        End Select
    End Sub

    Private Sub CbxTranstype_SelectedIndexChanged_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CbxTranstype.SelectedIndexChanged

    End Sub

    Private Sub GroupBox3_Enter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GroupBox3.Enter

    End Sub

    Private Sub ChxOV_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles ChxOV.CheckedChanged
        If ChxOV.Checked = True Then
            TxtLorryno.ReadOnly = False
        Else
            TxtLorryno.ReadOnly = True
        End If
    End Sub

    Private Sub txtgst_pers_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtgst_pers.TextChanged

    End Sub

    Private Sub c1fgItems_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles c1fgItems.Click

    End Sub

    Private Sub txtProdCode_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtProdCode.TextChanged

    End Sub

    Private Sub txtpackingmode_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtpackingmode.TextChanged

    End Sub
End Class