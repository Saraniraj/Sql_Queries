#Region "Imports"
Imports System
Imports System.IO
Imports System.Data
Imports VB = Microsoft.VisualBasic
Imports System.Windows.Forms
Imports System.Drawing.Printing
Imports System.Runtime.InteropServices
Imports Microsoft.VisualBasic.PowerPacks.Printing.Compatibility.VB6
Imports CrystalDecisions.CrystalReports.Engine
Imports System.Math
Imports System.Drawing
Imports Word = Microsoft.Office.Interop.Word
Imports excel = Microsoft.Office.Interop.Excel
Imports System.Data.OleDb
Imports PQScan.BarcodeCreator
#End Region

Public Class frmSalesInvoiceYF

    Dim mobjclsCustomer As New clsCustomer
    Dim mobjclsAgent As New clsAgent
    Dim mobjclsTermsConditions As New clsTermsConditions
    Dim mobjclsNotes As New clsNotes
    Dim mobjclsProduct As New clsProduct
    Dim mobjclsEnquiry As New clsCustEnquiryYF
    Dim mobjclsPaymentTerms As New clsPaymentTerms
    Dim mobjclsCustOrder As New clsCustOrderYF
    Dim mobjclsLocation As New clsLocation
    Dim mobjclsQuotation As New clsCustQuotationYF
    Dim mobjclsProformaInvoice As New clsProformaInvoiceYF
    Dim mobjclsSalesTCDGroup As New clsSalesTCDGroup
    Dim mobjclsSupplier As New clsSupplier
    Dim mobjclsSalesInvoice As New clsSalesInvoiceYF
    Dim mobjclsEPCG As New clsEPCG
    Dim mSORevNo As String
    Dim mPINVRevNo As String
    Dim netvalue As Double = 0
    Dim eintype As String = ""
    Dim tcs As String = ""
    Dim mobjclsYarnReceipt As New clsYarnReceiptWeaving


    Private Sub frmSalesInvoiceYF_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Me.KeyPreview = True
            Fill_Numbering_Type()
            dtpARE1Date.Value = Now
            dtpEntryDate.Value = Now
            dtpEPCGDate.Value = Now
            dtpIssue.Value = Now
            dtpLRDate.Value = Now
            dtpPackDate.Value = Now
            dtpPINVDate.Value = Now
            dtpRefDocDate.Value = Now
            dtpRegnDate.Value = Now
            dtpRemoval.Value = Now
            dtpSODate.Value = Now


            Fill_TCD_Group_Details()
            Fill_Customer_Type()
            Fill_Auto_Complete_Customer(Trim(cbxCustType.Text))
            Fill_Auto_Complete_Agent()
            Fill_Auto_Complete_Banker()
            Fill_Auto_Complete_Supplier()
            Fill_UOM_Details()
            Fill_Auto_Complete_EPCG()
            Fill_Pay_Mode()
            Fill_Payment_Terms()
            Fill_Delivery_Mode()
            Fill_Packing_Details()
            Fill_Location_Details()
            Fill_Currency_Details()
            Fill_Grid_Tax_Details()
            Fill_Grid_Item_Details()
            'Fill_SalesType_Details()

            cbxInvBasedOn.SelectedIndex = 1
            cbxStock.SelectedIndex = 0
            cbxContractType.SelectedIndex = 0
            cbxInvType.SelectedIndex = 0
            cbxAgainstForm.SelectedIndex = 0
            cbxExportScheme.SelectedIndex = 0
            cbxSalesType.SelectedIndex = 0
            C1Tab2.SelectedIndex = 0

            If cbxInvBasedOn.Text = "SO BASED" Then
                btnPK_SO.Enabled = True
            Else
                btnPK_SO.Enabled = False
            End If

            btnPK_PINVNo.Enabled = False
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Auto_Complete_EPCG()
        Try
            Dim MySource As New AutoCompleteStringCollection()
            Try
                MySource = New AutoCompleteStringCollection()
                ds = Nothing
                ds = mobjclsEPCG.GetEPCGDetails("", "")

                Dim intRows As Integer = ds.Tables(0).Rows.Count

                intRows = ds.Tables(0).Rows.Count
                Dim arrEPCGNo(intRows - 1) As String
                For i2 = 0 To intRows - 1
                    arrEPCGNo(i2) = ds.Tables(0).Rows(i2).Item("EPCG_No")
                Next
                MySource.AddRange(arrEPCGNo)

                With tbEPCGNo
                    .AutoCompleteCustomSource = MySource
                    .AutoCompleteMode = AutoCompleteMode.SuggestAppend
                    .AutoCompleteSource = AutoCompleteSource.CustomSource
                End With
            Catch ex As Exception
                Show_Message(ex.Message)
            End Try
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Numbering_Type()
        Try
            cbxNumberType.DataBindings.Clear()
            cbxNumberType.DataSource = Nothing

            ds = GetNumberTypeDetails("Sales Invoice-GST", 0)

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

    Private Sub GetDisableEnableControl()
        Try
            btnReset.Enabled = False
            If cbxScreenMode.Text = "Add" Then
                btnApply.Enabled = False
                btnClear.Enabled = True
                btnPK_SInvNo.Enabled = False
                btnReset.Enabled = False
                btnPrint.Enabled = False
                btnEwaybill.Enabled = False
                btnDoc.Enabled = False
                lblcomm.Visible = False
                tbAgentComm.ReadOnly = False
            ElseIf cbxScreenMode.Text = "Modify" Then
                btnReset.Enabled = False
                btnApply.Enabled = True
                btnClear.Enabled = True
                btnPK_SInvNo.Enabled = True
                btnPrint.Enabled = True
                btnEwaybill.Enabled = False
                btnDoc.Enabled = False
                lblcomm.Visible = False
                tbAgentComm.ReadOnly = False
            ElseIf cbxScreenMode.Text = "Delete" Then
                btnApply.Enabled = True
                btnClear.Enabled = True
                btnPK_SInvNo.Enabled = True
                btnReset.Enabled = False
                btnPrint.Enabled = False
                btnEwaybill.Enabled = False
                btnDoc.Enabled = False
            ElseIf cbxScreenMode.Text = "View" Then
                btnApply.Enabled = False
                btnClear.Enabled = True
                btnPK_SInvNo.Enabled = True
                btnReset.Enabled = False
                btnPrint.Enabled = True
                btnEwaybill.Enabled = True
                btnDoc.Enabled = True
            ElseIf cbxScreenMode.Text = "Authorize" Then
                btnApply.Enabled = True
                btnClear.Enabled = False
                btnPK_SInvNo.Enabled = False
                btnReset.Enabled = False
                btnPrint.Enabled = False
                btnEwaybill.Enabled = False
                btnDoc.Enabled = False
            Else
                btnApply.Enabled = False
                btnClear.Enabled = False
                btnPK_SInvNo.Enabled = False
                btnReset.Enabled = False
                btnPrint.Enabled = False
                btnEwaybill.Enabled = False
                btnDoc.Enabled = False
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub cbxScreenMode_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles cbxScreenMode.SelectedIndexChanged
        GetDisableEnableControl()
    End Sub

    Private Sub cbxScreenMode_Leave(sender As System.Object, e As System.EventArgs) Handles cbxScreenMode.Leave
        GetDisableEnableControl()
    End Sub

    Public Sub InitializeForm(ByVal mvarScreenName As String)
        Try
            FillScreenMode(mvarScreenName, cbxScreenMode)
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnClose_Click(sender As System.Object, e As System.EventArgs) Handles btnClose.Click
        Try
            Me.Close()
            'Dim dt As DateTime
            'dt = dtpIssue.Value
            'MessageBox.Show(dt.ToString("hh:mm:ss tt"))
            'MessageBox.Show(dt.ToString("HH:mm:ss"))
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Form_Clear()
        Try
            cbxInvBasedOn.SelectedIndex = 1
            cbxStock.SelectedIndex = 0
            cbxContractType.SelectedIndex = 0
            cbxInvType.SelectedIndex = 0
            cbxAgainstForm.SelectedIndex = 0
            cbxExportScheme.SelectedIndex = 0

            Fill_TCD_Group_Details()
            Fill_Numbering_Type()
            Fill_Customer_Type()
            Fill_Auto_Complete_Customer(Trim(cbxCustType.Text))
            Fill_Auto_Complete_Agent()
            Fill_Auto_Complete_Banker()
            Fill_Auto_Complete_Supplier()
            Fill_Auto_Complete_EPCG()
            Fill_UOM_Details()
            Fill_Pay_Mode()
            Fill_Payment_Terms()
            Fill_Delivery_Mode()
            Fill_Packing_Details()
            Fill_Location_Details()
            Fill_Currency_Details()
            Fill_Grid_Tax_Details()
            Fill_Grid_Item_Details()
            ' Fill_SalesType_Details()
            C1Tab2.SelectedIndex = 0
            cbxSecLocation.SelectedIndex = 2
            cbxSalesType.SelectedIndex = 0
            cbxTCDGroupCode.DropDownStyle = ComboBoxStyle.DropDownList

            tbSINVNo.Text = "" : dtpEntryDate.Value = Now : cbxSalesType.SelectedIndex = 0 : cbxSecLocation.SelectedIndex = 2
            tbExNo.Text = "" : cbxInvBasedOn.SelectedIndex = 1 : cbxInvType.SelectedIndex = 0 : cbxStock.SelectedIndex = 0
            tbSONo.Text = "" : dtpSODate.Value = Now : tbPINVNo.Text = "" : dtpPINVDate.Value = Now : cbxCustType.SelectedIndex = 0
            tbCustName.Text = "" : tbCustCode.Text = "" : tbBillToID.Text = "0" : tbShipToID.Text = "0" : tbRefDocNo.Text = "" : dtpRefDocDate.Value = Now
            tbPackNo.Text = "" : dtpPackDate.Value = Now : tbAgentCode.Text = "" : tbAgentName.Text = "" : tbAgentComm.Text = "0" : cbxPayMode.SelectedIndex = 0
            cbxPayTerms.SelectedIndex = 0 : cbxDelvMode.SelectedIndex = 0 : cbxContractType.SelectedIndex = 0 : tbTransCode.Text = "" : tbTransName.Text = ""
            cbxSalCurCode.Text = "INR" : cbxExCurCode.Text = "INR" : tbExRate.Text = "1" : tbTotalItemDesc.Text = "" : tbTotalItems.Text = "0" : tbTotalNetWt.Text = "0"
            tbTotalGrossWt.Text = "0" : tbAssValue.Text = "0" : tbDiscDesc.Text = "" : tbDiscAmt.Text = "0" : tbChargesDesc.Text = "" : tbChargesAmt.Text = "0"
            tbTotalAmount.Text = "0" : tbRoundOff.Text = "0" : tbInvoiceValue.Text = "0" : tbBankerName.Text = ""
            dtpIssue.Value = DateTime.Now : dtpRemoval.Value = System.DateTime.Now

            tbVehNo.Text = "" : tbLRNo.Text = "" : dtpLRDate.Value = Now : tbDriverName.Text = "" : tbLicNo.Text = "" : tbLorryHire.Text = "0" : tbLorryHireTax.Text = "0"
            tbLorryHireNet.Text = "0" : tbContainerDetails.Text = "" : tbPreCarriageBy.Text = "" : tbVesselNo.Text = "" : tbPortDischarge.Text = "" : tbPlaceReceipt.Text = "INDIA"
            tbPortLoading.Text = "" : tbOrigin.Text = "" : tbFinalDestnPlace.Text = "" : tbFinalDestnCountry.Text = "" : tbUserDef1.Text = "" : tbUserDef2.Text = "" : tbUserDef3.Text = ""
            tbARE1No.Text = "" : dtpARE1Date.Value = Now : tbPODetails.Text = "" : tbDCDetails.Text = "" : tbBLDetails.Text = "" : tbSBDetails.Text = ""
            tbEPCGNo.Text = "" : dtpEPCGDate.Value = Now : tbRegnNo.Text = "" : dtpRegnDate.Value = Now : tbERCDetails.Text = ""
            tbCEDetails.Text = "" : tbTermsDesc.Text = "" : tbTermsID.Text = "" : tbNotesDesc.Text = "" ': tbNotesDesc2.Text = "" : tbNotesDesc3.Text = ""
            'tbNotesDesc4.Text = "" : tbNotesDesc5.Text = "" : tbNotesDesc6.Text = "" : tbNotesDesc7.Text = "" 
            tbTermsID.Text = "" : tbOthers.Text = ""
            tbLotNo.Text = "" : tbBagNo.Text = "" : tbPackingDetails.Text = ""
            tbIRNNo.Text = ""
            tbACKNo.Text = ""
            tbEwbno.Text = ""
            tbtdsamt.Text = ""
            cbxtdsp.Text = ""
            tbTDSval.Text = ""
            lblSales.Text = ""

            tbTransid.Text = "" : tbTranName.Text = "" : tbdistance.Text = ""
            netvalue = 0

            cbxScreenMode.Text = "Add"
            If cbxInvBasedOn.Text = "SO BASED" Then
                btnPK_SO.Enabled = True
            Else
                btnPK_SO.Enabled = True
            End If
            btnPK_PINVNo.Enabled = False
            tbAgentComm.ReadOnly = False
            lblcomm.Visible = False
            cbxtdsp.SelectedIndex = 1
            cbxScreenMode.Focus()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_TCD_Group_Details(Optional ByVal mtcs As String = "")
        Try
            ds = Nothing
            ds = New DataSet

            ds = mobjclsSalesTCDGroup.GetSalesTCDGroupDetails("", mtcs)

            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            cbxTCDGroupCode.Items.Clear()

            cbxTCDGroupCode.Items.Add("NONE")
            For iRow = 0 To ds.Tables(0).Rows.Count - 1
                cbxTCDGroupCode.Items.Add(ds.Tables(0).Rows(iRow)("TCD_Group_Code"))
            Next
            cbxTCDGroupCode.SelectedIndex = 0
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Location_Details()
        Try
            ds = Nothing
            ds = New DataSet
            ds = mobjclsLocation.GetLocationDetails(mvarCompanyCode, "ALL")
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            cbxSecLocation.DataBindings.Clear()
            cbxSecLocation.DataSource = Nothing

            With cbxSecLocation
                .Items.Clear()
                .DataSource = ds.Tables(0)
                .DisplayMember = "Location_Code"
                .SelectedIndex = 2
            End With
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Packing_Details()
        Try
            ds = Nothing
            ds = New DataSet
            ds = GetPackingDetails()
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            cbxPackingType.DataBindings.Clear()
            cbxPackingType.DataSource = Nothing

            With cbxPackingType
                .Items.Clear()
                .DataSource = ds.Tables(0)
                .DisplayMember = "Packing_Mode"
                '.SelectedIndex = 0
            End With
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Delivery_Mode()
        Try
            ds = Nothing
            ds = New DataSet
            ds = GetDeliveryModeDetails()
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            cbxDelvMode.DataBindings.Clear()
            cbxDelvMode.DataSource = Nothing

            With cbxDelvMode
                .Items.Clear()
                .DataSource = ds.Tables(0)
                .DisplayMember = "Delivery_Mode"
                .SelectedIndex = 0
            End With
            cbxDelvMode.Text = "NONE"
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Pay_Mode()
        Try
            ds = Nothing
            ds = New DataSet
            ds = GetPayModeDetails()
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            cbxPayMode.DataBindings.Clear()
            cbxPayMode.DataSource = Nothing

            With cbxPayMode
                .Items.Clear()
                .DataSource = ds.Tables(0)
                .DisplayMember = "Pay_Mode"
                .SelectedIndex = 0
            End With
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_SalesType_Details()
        Try
            ds = Nothing
            ds = New DataSet
            ds = GetSalesTypeDetails()
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            cbxSalesType.DataBindings.Clear()
            cbxSalesType.DataSource = Nothing

            With cbxSalesType
                .Items.Clear()
                .DataSource = ds.Tables(0)
                .DisplayMember = "Prod_Sales_Type"
                .SelectedIndex = 0
            End With
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_UOM_Details()
        Try
            ds = Nothing
            ds = New DataSet
            ds = GetUOMDetails()
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            cbxUOM.DataBindings.Clear()
            cbxUOM.DataSource = Nothing

            With cbxUOM
                .Items.Clear()
                .DataSource = ds.Tables(0)
                .DisplayMember = "UOM_Code"
                .SelectedIndex = 0
            End With
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Payment_Terms()
        Try
            ds = Nothing
            ds = New DataSet
            ds = mobjclsPaymentTerms.GetPaymentTerms("", "1")
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            cbxPayTerms.DataBindings.Clear()
            cbxPayTerms.DataSource = Nothing

            With cbxPayTerms
                .Items.Clear()
                .DataSource = ds.Tables(0)
                .DisplayMember = "Pay_Terms"
                .SelectedIndex = 0
            End With
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Auto_Complete_Customer(Optional ByVal mCustType As String = "")
        Dim MySource As New AutoCompleteStringCollection()
        Try
            ds = Nothing
            ds = mobjclsCustomer.GetCustomerDetails("", "", mCustType)

            Dim intRows As Integer = ds.Tables(0).Rows.Count
            Dim arrCustName(intRows - 1) As String
            Dim i2 As Integer
            For i2 = 0 To intRows - 1
                arrCustName(i2) = ds.Tables(0).Rows(i2).Item("Cust_Name")
            Next
            MySource.AddRange(arrCustName)

            With tbCustName
                .AutoCompleteCustomSource = MySource
                .AutoCompleteMode = AutoCompleteMode.SuggestAppend
                .AutoCompleteSource = AutoCompleteSource.CustomSource
            End With
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Auto_Complete_Supplier()
        Dim MySource As New AutoCompleteStringCollection()
        Try
            ds = Nothing
            ds = mobjclsSupplier.GetSupplierDetails("", "", "TRANSPORTER")

            Dim intRows As Integer = ds.Tables(0).Rows.Count
            Dim arrSupName(intRows - 1) As String
            Dim i2 As Integer
            For i2 = 0 To intRows - 1
                arrSupName(i2) = ds.Tables(0).Rows(i2).Item("Sup_Name")
            Next
            MySource.AddRange(arrSupName)

            With tbTransName
                .AutoCompleteCustomSource = MySource
                .AutoCompleteMode = AutoCompleteMode.SuggestAppend
                .AutoCompleteSource = AutoCompleteSource.CustomSource
            End With
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Auto_Complete_Banker()
        Dim MySource As New AutoCompleteStringCollection()
        Try
            ds = Nothing
            ds = GetBankerName()

            Dim intRows As Integer = ds.Tables(0).Rows.Count
            Dim arrCustName(intRows - 1) As String
            Dim i2 As Integer
            For i2 = 0 To intRows - 1
                arrCustName(i2) = ds.Tables(0).Rows(i2).Item("Banker_Name")
            Next
            MySource.AddRange(arrCustName)

            With tbBankerName
                .AutoCompleteCustomSource = MySource
                .AutoCompleteMode = AutoCompleteMode.SuggestAppend
                .AutoCompleteSource = AutoCompleteSource.CustomSource
            End With
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Auto_Complete_Agent()
        Dim MySource As New AutoCompleteStringCollection()
        Try
            MySource = New AutoCompleteStringCollection()
            ds = Nothing
            ds = mobjclsAgent.GetAgentDetails("", "")

            Dim intRows As Integer = ds.Tables(0).Rows.Count

            intRows = ds.Tables(0).Rows.Count
            Dim arrAgentName(intRows - 1) As String
            For i2 = 0 To intRows - 1
                arrAgentName(i2) = ds.Tables(0).Rows(i2).Item("Agent_Name")
            Next
            MySource.AddRange(arrAgentName)

            With tbAgentName
                .AutoCompleteCustomSource = MySource
                .AutoCompleteMode = AutoCompleteMode.SuggestAppend
                .AutoCompleteSource = AutoCompleteSource.CustomSource
            End With
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Public Sub Fill_Customer_Type()
        Try
            ds = Nothing
            ds = New DataSet
            ds = mobjclsCustomer.GetCustomerTypeDetails
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            cbxCustType.DataBindings.Clear()
            cbxCustType.DataSource = Nothing

            With cbxCustType
                .Items.Clear()
                .DataSource = ds.Tables(0)
                .DisplayMember = "Cust_Type"
                .SelectedIndex = 1
            End With
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Currency_Details()
        Try
            ds = Nothing
            ds = New DataSet
            ds = GetCountyCurrencyDetails()

            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub
            cbxSalCurCode.DataBindings.Clear()
            cbxSalCurCode.DataSource = Nothing

            With cbxSalCurCode
                .Items.Clear()
                .DataSource = ds.Tables(0)
                .DisplayMember = "Currency_Code"
                .Text = "USD"
            End With

            ds = Nothing
            ds = New DataSet
            ds = GetCountyCurrencyDetails()

            cbxExCurCode.DataBindings.Clear()
            cbxExCurCode.DataSource = Nothing

            With cbxExCurCode
                .Items.Clear()
                .DataSource = ds.Tables(0)
                .DisplayMember = "Currency_Code"
                .Text = "INR"
            End With
            tbExRate.Text = ""
            cbxExCurCode.Enabled = False
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnClear_Click(sender As System.Object, e As System.EventArgs) Handles btnClear.Click
        Try
            Form_Clear()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Grid_Tax_Details()
        Try
            With c1fgTax
                .Clear()
                .Cols = 9
                .Rows = 1

                .set_TextMatrix(0, 0, "Sno")
                .set_TextMatrix(0, 1, "TCD Code")
                .set_TextMatrix(0, 2, "TCD Type")
                .set_TextMatrix(0, 3, "TCD Value")
                .set_TextMatrix(0, 4, "TCD For")
                .set_TextMatrix(0, 5, "Add/Less")
                .set_TextMatrix(0, 6, "A/C Post")
                .set_TextMatrix(0, 7, "Tax Value")
                .set_TextMatrix(0, 8, "Net Amount")

                .set_ColWidth(0, 50)
                .set_ColWidth(1, 100)
                .set_ColWidth(2, 75)
                .set_ColWidth(3, 75)
                .set_ColWidth(4, 75)
                .set_ColWidth(5, 75)
                .set_ColWidth(6, 75)
                .set_ColWidth(7, 75)

                .Cell(C1.Win.C1FlexGrid.Classic.CellPropertySettings.flexcpAlignment, 0, 0, 0, 8) = 3
                .Cell(C1.Win.C1FlexGrid.Classic.CellPropertySettings.flexcpFontBold, 0, 0, 0, 8) = True
            End With

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Grid_Item_Details()
        Try
            With c1fgItems
                .Clear()
                .Rows = 1
                .Cols = 16
                .FixedCols = 0
                .set_TextMatrix(0, 0, "Sl.No.")
                .set_TextMatrix(0, 1, "Prod Code")
                .set_TextMatrix(0, 2, "Prod Desc")
                .set_TextMatrix(0, 3, "Customer Item Code")
                .set_TextMatrix(0, 4, "Customer Item Desc")
                .set_TextMatrix(0, 5, "Packing Mode")
                .set_TextMatrix(0, 6, "No of Items")
                .set_TextMatrix(0, 7, "UOM")
                .set_TextMatrix(0, 8, "Qty")
                .set_TextMatrix(0, 9, "Rate")
                .set_TextMatrix(0, 10, "Total")
                .set_TextMatrix(0, 11, "Dis%")
                .set_TextMatrix(0, 12, "Dis.Rate")
                .set_TextMatrix(0, 13, "Dis.Value")
                .set_TextMatrix(0, 14, "Net.Value")
                .set_TextMatrix(0, 15, "Remarks")

                .set_ColWidth(0, 50)
                .set_ColWidth(1, 150)
                .set_ColWidth(2, 150)
                .set_ColWidth(3, 150)
                .set_ColWidth(4, 100)
                .set_ColWidth(5, 75)
                .set_ColWidth(6, 75)
                .set_ColWidth(7, 75)
                .set_ColWidth(8, 75)
                .set_ColWidth(9, 75)
                .set_ColWidth(10, 75)
                .set_ColWidth(11, 75)
                .set_ColWidth(12, 75)
                .set_ColWidth(13, 100)
                .set_ColWidth(14, 150)
                .set_ColWidth(15, 100)

                .Cell(C1.Win.C1FlexGrid.Classic.CellPropertySettings.flexcpAlignment, 0, 0, 0, 11) = 3
                .Cell(C1.Win.C1FlexGrid.Classic.CellPropertySettings.flexcpFontBold, 0, 0, 0, 11) = True

                For iRow As Integer = 1 To .Rows - 1
                    .set_TextMatrix(iRow, 0, iRow)
                Next
            End With
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub tbCustName_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbCustName.LostFocus
        Try
            If Trim(tbCustName.Text) = "" Then
                tbCustCode.Text = ""
                Exit Sub
            End If

            ds = Nothing
            ds = mobjclsCustomer.GetCustomerDetails("", RemoveSingleQuotes(tbCustName.Text))
            If ds.Tables(0).Rows.Count <= 0 Then
                tbCustCode.Text = ""
                Exit Sub
            End If
            tbCustCode.Text = ds.Tables(0).Rows(0)("Cust_Code")
            cbxCustType.Text = ds.Tables(0).Rows(0)("Cust_Type")
            tbAgentCode.Focus()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPK_Customer_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_Customer.Click
        Try
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing
            ds = mobjclsCustomer.GetCustomerDetails("", "", cbxCustType.Text)
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Customer Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowDialog()
            frmPickList1.ShowInTaskbar = False
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub

            If dtPickList.Rows(0)("Cust_Type") = "LOCAL" Then

                If dtPickList.Rows(0)("Cust_Others_1") <> "" Then
                    tbCustCode.Text = dtPickList.Rows(0)("Cust_Code")
                    tbCustName.Text = dtPickList.Rows(0)("Cust_Name")
                    cbxCustType.Text = dtPickList.Rows(0)("Cust_Type")
                    'tbExRate.Text = dtPickList.Rows(0)("Comm_Per")


                    SSQL = ""
                    SSQL = "select TURN_OVER  from ecommon..customer_details a"
                    SSQL = SSQL & " where a.Cust_Code='" & Trim(tbCustCode.Text) & "'"
                    SSQL = SSQL & " and a.isactive=1 "
                    SSQL = SSQL & " and a.comp_code ='" & mvarCompanyCode & "'"

                    Dim tovr As String = ReturnSingleValue(SSQL, "eCommon")

                    If tovr = "<=100000000" Then
                        tbtdsamt.Enabled = False
                        tbtdsamt.Text = ""
                        cbxtdsp.Enabled = False
                        tbTDSval.Text = ""
                        tbTDSval.Enabled = False
                        tcs = "tcs"
                        Fill_TCD_Group_Details(tcs)

                    ElseIf tovr = ">100000000" Then
                        tbtdsamt.Enabled = True
                        tbtdsamt.Text = ""
                        cbxtdsp.Enabled = True
                        tbTDSval.Text = ""
                        tbTDSval.Enabled = True
                        tcs = ""
                        Fill_TCD_Group_Details(tcs)

                    Else
                        Show_Message("Kindly Set Turn over Limit and then select customer")
                        tbCustCode.Text = ""
                        tbCustName.Text = ""
                        Exit Sub
                    End If

                Else

                    Show_Message("This Customer Has No GST No in Customer Master Kindly Update")

                    tbCustCode.Text = ""
                    tbCustName.Text = ""

                    Exit Sub

                End If

            ElseIf dtPickList.Rows(0)("Cust_Type") = "EXPORT" Then

                tbCustCode.Text = dtPickList.Rows(0)("Cust_Code")
                tbCustName.Text = dtPickList.Rows(0)("Cust_Name")
                cbxCustType.Text = dtPickList.Rows(0)("Cust_Type")
                'tbExRate.Text = dtPickList.Rows(0)("Comm_Per")

            End If


        Catch ex As Exception
            Show_Message(ex.Message)
        End Try

    End Sub

    Private Sub btnPK_Agent_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_Agent.Click
        Try
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing

            ds = mobjclsAgent.GetAgentDetails("", "")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Agent Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            tbAgentCode.Text = dtPickList.Rows(0)("Agent_Code")
            tbAgentName.Text = dtPickList.Rows(0)("Agent_Name")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub cbxCustType_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbxCustType.LostFocus
        Try
            If cbxCustType.Text = "" Then Exit Sub
            tbCustName.Text = ""
            tbCustCode.Text = ""
            tbRefDocNo.Text = ""
            dtpRefDocDate.Value = Now
            'tbSONo.Text = ""
            dtpSODate.Value = Now
            ' Fill_Grid_Item_Details()
            tbPINVNo.Text = ""
            dtpPINVDate.Value = Now
            tbPackNo.Text = ""
            dtpPackDate.Value = Now
            Fill_Auto_Complete_Customer(cbxCustType.Text)
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPK_Product_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_Product.Click
        Try
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing

            If tbSONo.Text.Trim <> "" And cbxInvBasedOn.Text = "SO BASED" Then
                ds = mobjclsCustOrder.GetOrderDetails(RemoveSingleQuotes(tbSONo.Text.Trim), "", "", "", "", mSORevNo, "")
            ElseIf tbPINVNo.Text.Trim <> "" And cbxInvBasedOn.Text = "PROFORMA BASED" Then
                ds = mobjclsProformaInvoice.GetProformaInvoiceDetails(RemoveSingleQuotes(tbPINVNo.Text), "", "", "", "", mPINVRevNo, "")
            Else
                ds = mobjclsProduct.GetProductDetails("", "1", cbxSalesType.Text)
            End If
            If ds.Tables(0).Rows.Count <= 0 Then
                ds = mobjclsProduct.GetProductDetails("", "1", cbxSalesType.Text)
            End If

            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Product Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            tbProdCode.Text = dtPickList.Rows(0)("Prod_Code")
            tbProdDesc.Text = dtPickList.Rows(0)("Prod_Desc")

            If tbSONo.Text.Trim <> "" Then
                tbCustItemDesc.Text = dtPickList.Rows(0)("Cust_Item_Desc")
                cbxUOM.Text = dtPickList.Rows(0)("UOM_Code")
                tbQty.Text = dtPickList.Rows(0)("Order_Qty")
                tbRate.Text = dtPickList.Rows(0)("Rate_Per_Qty")
            End If
            tbDisper.Focus()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub tbAgentName_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbAgentName.LostFocus
        Try
            If Trim(tbAgentName.Text) = "" Then
                tbAgentCode.Text = ""
                Exit Sub
            End If

            ds = Nothing
            ds = mobjclsAgent.GetAgentDetails("", RemoveSingleQuotes(tbAgentName.Text))
            If ds.Tables(0).Rows.Count <= 0 Then
                tbAgentCode.Text = ""
                Exit Sub
            End If
            tbAgentCode.Text = ds.Tables(0).Rows(0)("Agent_Code")
            tbCustItemDesc.Focus()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub c1fgItems_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles c1fgItems.KeyDown

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
                tbProdCode.Text = c1fgItems.get_TextMatrix(Val(c1fgItems.RowSel), 1).Trim
                tbProdDesc.Text = c1fgItems.get_TextMatrix(Val(c1fgItems.RowSel), 2).Trim
                tbCustItemCode.Text = c1fgItems.get_TextMatrix(Val(c1fgItems.RowSel), 3)
                tbCustItemDesc.Text = c1fgItems.get_TextMatrix(Val(c1fgItems.RowSel), 4)
                'cbxPackingType.ValueMember = Trim(c1fgItems.get_TextMatrix(Val(c1fgItems.RowSel), 5)).ToString
                cbxPackingType.Text = Trim(c1fgItems.get_TextMatrix(Val(c1fgItems.RowSel), 5))
                tbNoofItems.Text = c1fgItems.get_TextMatrix(Val(c1fgItems.RowSel), 6)
                cbxUOM.Text = c1fgItems.get_TextMatrix(Val(c1fgItems.RowSel), 7)
                tbQty.Text = c1fgItems.get_TextMatrix(Val(c1fgItems.RowSel), 8)
                tbRate.Text = c1fgItems.get_TextMatrix(Val(c1fgItems.RowSel), 9)
                tbDisper.Text = c1fgItems.get_TextMatrix(Val(c1fgItems.RowSel), 11)
                tbDisRate.Text = c1fgItems.get_TextMatrix(Val(c1fgItems.RowSel), 12)
                tbRemarks.Text = c1fgItems.get_TextMatrix(Val(c1fgItems.RowSel), 15).Trim
                tbCustItemCode.Focus()
                Exit Sub
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnClear_Line_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear_Line.Click
        Try
            tbCustItemDesc.Text = ""
            tbProdCode.Text = ""
            tbProdDesc.Text = ""
            tbRemarks.Text = ""
            tbQty.Text = ""
            tbRate.Text = ""
            tbDisper.Text = ""
            tbDisRate.Text = ""
            tbNoofItems.Text = ""
            tbCustItemDesc.Focus()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Try
            If Val(Trim(tbQty.Text)) <= 0 Or Trim(tbQty.Text.Trim) = "" Or Trim(tbProdCode.Text) = "" Or Val(Trim(tbRate.Text)) <= 0 Then Exit Sub

            For iRow As Integer = 1 To c1fgItems.Rows - 1

                If c1fgItems.get_TextMatrix(iRow, 1).ToString.Trim = Trim(tbProdCode.Text) Then

                    c1fgItems.set_TextMatrix(iRow, 3, RemoveSingleQuotes(tbCustItemCode.Text))
                    c1fgItems.set_TextMatrix(iRow, 4, RemoveSingleQuotes(tbCustItemDesc.Text))
                    c1fgItems.set_TextMatrix(iRow, 5, Trim(cbxPackingType.Text))
                    c1fgItems.set_TextMatrix(iRow, 6, Val(tbNoofItems.Text))
                    c1fgItems.set_TextMatrix(iRow, 7, cbxUOM.Text)
                    c1fgItems.set_TextMatrix(iRow, 8, Val(tbQty.Text))
                    c1fgItems.set_TextMatrix(iRow, 9, Val(tbRate.Text))
                    c1fgItems.set_TextMatrix(iRow, 10, Val(tbQty.Text) * Val(tbRate.Text))
                    c1fgItems.set_TextMatrix(c1fgItems.Rows - 1, 11, Val(tbDisper.Text))
                    c1fgItems.set_TextMatrix(c1fgItems.Rows - 1, 12, Val(tbDisRate.Text))
                    c1fgItems.set_TextMatrix(c1fgItems.Rows - 1, 13, Val(tbQty.Text) * Val(tbDisRate.Text))
                    c1fgItems.set_TextMatrix(c1fgItems.Rows - 1, 14, (Val(tbQty.Text) * Val(tbRate.Text)) - (Val(tbQty.Text) * Val(tbDisRate.Text)))
                    c1fgItems.set_TextMatrix(iRow, 15, RemoveSingleQuotes(tbRemarks.Text))
                    netvalue = (Val(tbQty.Text) * Val(tbRate.Text)) - (Val(tbQty.Text) * Val(tbDisRate.Text))
                    tbCustItemCode.Text = ""
                    tbCustItemDesc.Text = ""
                    tbProdCode.Text = ""
                    tbProdDesc.Text = ""
                    ' cbxPackingType.SelectedIndex = 0
                    tbQty.Text = ""
                    tbRate.Text = ""
                    tbNoofItems.Text = ""
                    tbRemarks.Text = ""
                    cbxUOM.SelectedIndex = 0
                    tbCustItemCode.Focus()
                    Exit Sub
                End If
            Next

            With c1fgItems
                .Rows += 1
                .set_TextMatrix(c1fgItems.Rows - 1, 0, .Rows - 1)
                .set_TextMatrix(c1fgItems.Rows - 1, 1, RemoveSingleQuotes(tbProdCode.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 2, RemoveSingleQuotes(tbProdDesc.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 3, RemoveSingleQuotes(tbCustItemCode.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 4, RemoveSingleQuotes(tbCustItemDesc.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 5, Trim(cbxPackingType.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 6, Val(tbNoofItems.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 7, cbxUOM.Text)
                .set_TextMatrix(c1fgItems.Rows - 1, 8, Val(tbQty.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 9, Val(tbRate.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 10, Val(tbQty.Text) * Val(tbRate.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 11, Val(tbDisper.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 12, Val(tbDisRate.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 13, Val(tbQty.Text) * Val(tbDisRate.Text))
                .set_TextMatrix(c1fgItems.Rows - 1, 14, (Val(tbQty.Text) * Val(tbRate.Text)) - (Val(tbQty.Text) * Val(tbDisRate.Text)))
                .set_TextMatrix(c1fgItems.Rows - 1, 15, RemoveSingleQuotes(tbRemarks.Text))
            End With

            netvalue = (Val(tbQty.Text) * Val(tbRate.Text)) - (Val(tbQty.Text) * Val(tbDisRate.Text))




            tbCustItemCode.Text = ""
            tbCustItemDesc.Text = ""
            tbProdCode.Text = ""
            tbProdDesc.Text = ""
            ' cbxPackingType.SelectedIndex = 0
            tbQty.Text = ""
            tbRate.Text = ""
            tbNoofItems.Text = ""
            tbDisper.Text = ""
            tbDisRate.Text = ""
            tbRemarks.Text = ""
            cbxUOM.SelectedIndex = 0
            tbCustItemCode.Focus()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub cbxSalesType_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbxSalesType.LostFocus
        Try
            If cbxSalesType.Text = "" Then Exit Sub
            tbRefDocNo.Text = ""
            dtpRefDocDate.Value = Now
            tbSONo.Text = ""
            dtpSODate.Value = Now
            tbPINVNo.Text = ""
            dtpPINVDate.Value = Now
            tbPackNo.Text = ""
            dtpPackDate.Value = Now
            ' Fill_Grid_Item_Details()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPK_Terms_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_Terms.Click
        Try
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing

            ds = mobjclsTermsConditions.GetTermsConditions("", "1")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Terms & Conditions Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            tbTermsID.Text = dtPickList.Rows(0)(0)
            tbTermsID_LostFocus(sender, e)
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub tbTermsID_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbTermsID.LostFocus
        Try
            If Trim(tbTermsID.Text) = "" Then Exit Sub
            ds = Nothing
            ds = mobjclsTermsConditions.GetTermsConditions(RemoveSingleQuotes(tbTermsID.Text), "1")

            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            tbTermsID.Text = ds.Tables(0).Rows(0)("Terms_ID")
            tbTermsDesc.Text = ds.Tables(0).Rows(0)("Terms_Conditions_Desc")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPK_Notes_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_Notes.Click
        Try
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing

            ds = mobjclsNotes.GetNotes("", "1")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Notes Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            tbNotesID.Text = dtPickList.Rows(0)(0)
            tbNotesID_LostFocus(sender, e)
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub tbNotesID_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbNotesID.LostFocus
        Try
            If Trim(tbNotesID.Text) = "" Then Exit Sub

            ds = Nothing
            ds = New DataSet
            ds = mobjclsNotes.GetNotes(RemoveSingleQuotes(tbNotesID.Text), "1")

            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub
            tbNotesID.Text = ds.Tables(0).Rows(0)("Notes_ID")
            tbNotesDesc.Text = ds.Tables(0).Rows(0)("Notes_Desc")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPK_BillID_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_BillID.Click
        Try

            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing

            ds = mobjclsCustomer.GetCustomerDeliveryAddress(tbCustCode.Text.Trim)
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Bill To ID"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            tbBillToID.Text = dtPickList.Rows(0)("Sno")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPK_ShipID_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_ShipID.Click
        Try

            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing

            ds = mobjclsCustomer.GetCustomerDeliveryAddress(tbCustCode.Text.Trim)
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Ship To ID"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            tbShipToID.Text = dtPickList.Rows(0)("Sno")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Tab_SelectedIndexChanged()
        Try
            'If Trim(C1Tab2.SelectedTab.Text) = "Tax" Then
            tbTotalItems.Text = "0.00"
            tbTotalNetWt.Text = "0.00"
            tbAssValue.Text = "0.00"
            tbRoundOff.Text = "0.00"
            tbInvoiceValue.Text = "0.00"

            For iRow = 1 To c1fgItems.Rows - 1
                tbTotalItems.Text = Val(tbTotalItems.Text) + Val(c1fgItems.get_TextMatrix(iRow, 6))
                tbTotalNetWt.Text = Val(tbTotalNetWt.Text) + Val(c1fgItems.get_TextMatrix(iRow, 8))
                tbAssValue.Text = Val(tbAssValue.Text) + Val(c1fgItems.get_TextMatrix(iRow, 14))
            Next

            tbAssValue.Text = RoundUD(Val(tbAssValue.Text), 2, True)

            If tbtdsamt.Enabled = True Or Val(tbtdsamt.Text) > 0 Then

                tbtdsamt.Enabled = True
                cbxtdsp.Enabled = True
                tbTDSval.Enabled = True

                tbtdsamt.Text = Val(tbAssValue.Text)
                cbxtdsp.SelectedIndex = 0

            Else

                tbtdsamt.Text = 0
                tbTDSval.Text = 0
                cbxtdsp.SelectedIndex = 1

            End If

            If Val(tbAssValue.Text) > 0 Then

                'check TCS

                'If cbxScreenMode.Text <> "Modify" Then

                '    If tbCustName.Text.Trim = "" Then Exit Sub
                '    Dim dsSales As New DataSet
                '    dsSales = Nothing

                '    dsSales = mobjclsSalesInvoice.GetSalesAmountCheck(Trim(tbCustCode.Text))

                '    If dsSales.Tables(0).Rows.Count <= 0 Then Exit Sub

                '    Dim s As String = Val(IIf(IsDBNull(dsSales.Tables(0).Rows(0)("assessable_value")), 0, dsSales.Tables(0).Rows(0)("assessable_value"))) + netvalue

                '    If (Val(IIf(IsDBNull(dsSales.Tables(0).Rows(0)("assessable_value")), 0, dsSales.Tables(0).Rows(0)("assessable_value"))) + netvalue) < 5000000 Then

                '        If cbxTCDGroupCode.Text <> "NONE" Then

                '            If cbxTCDGroupCode.Text = "GST 5%-TCS 0.075%" Or cbxTCDGroupCode.Text = "IGST 5%-TCS 0.075%" Then

                '                Show_Message("This Customer Has Sales Less then 50,00000, Not Required TCS Kindly change Tax structure", "Customer Order")

                '                dsSales = Nothing

                '                Fill_Grid_Tax_Details()
                '                cbxTCDGroupCode.SelectedIndex = 0

                '                Exit Sub

                '            End If

                '        End If

                '    ElseIf (Val(IIf(IsDBNull(dsSales.Tables(0).Rows(0)("assessable_value")), 0, dsSales.Tables(0).Rows(0)("assessable_value"))) + netvalue) >= 5000000 Then

                '        If cbxTCDGroupCode.Text <> "NONE" Then

                '            If cbxTCDGroupCode.Text <> "GST 5%-TCS 0.075%" And cbxTCDGroupCode.Text <> "IGST 5%-TCS 0.075%" Then

                '                Show_Message("This Customer Has Sales Greater then or equal to 50,00000, It Required TCS Kindly change Tax structure", "Customer Order")

                '                dsSales = Nothing

                '                Fill_Grid_Tax_Details()
                '                cbxTCDGroupCode.SelectedIndex = 0


                '                Exit Sub

                '            End If

                '        End If

                '    End If
                'End If

                Calculate_Tax_Details()

            End If
            'End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub C1Tab2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles C1Tab2.SelectedIndexChanged
        Try

            Tab_SelectedIndexChanged()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Calculate_Tax_Details()
        Try

            Fill_Grid_Tax_Details()

            Dim mAfterDiscountTotal As Double = 0
            Dim mRunningTotal As Double = 0
            Dim mDigits As Double = 0

            mAfterDiscountTotal = Val(tbAssValue.Text) - Val(tbDiscAmt.Text) + Val(tbChargesAmt.Text) 'lorry freight include in tax
            mRunningTotal = mAfterDiscountTotal
            If cbxTCDGroupCode.Text = "NONE" Then
                GoTo 2
            End If

            ds = Nothing
            ds = New DataSet
            ds = mobjclsSalesTCDGroup.GetSalesTCDGroupDetails(Trim(cbxTCDGroupCode.Text))
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            c1fgTax.Rows = ds.Tables(0).Rows.Count + 1

            For iRow = 0 To ds.Tables(0).Rows.Count - 1
                With c1fgTax
                    .set_TextMatrix(iRow + 1, 0, ds.Tables(0).Rows(iRow)("Sno"))
                    .set_TextMatrix(iRow + 1, 1, ds.Tables(0).Rows(iRow)("TCD_Code"))
                    .set_TextMatrix(iRow + 1, 2, ds.Tables(0).Rows(iRow)("TCD_Type"))
                    .set_TextMatrix(iRow + 1, 3, ds.Tables(0).Rows(iRow)("TCD_Value"))
                    .set_TextMatrix(iRow + 1, 4, ds.Tables(0).Rows(iRow)("TCD_For"))
                    .set_TextMatrix(iRow + 1, 5, ds.Tables(0).Rows(iRow)("Add_Less"))
                    .set_TextMatrix(iRow + 1, 6, ds.Tables(0).Rows(iRow)("AC_Posting"))
                End With
            Next

            For irow = 1 To c1fgTax.Rows - 1
                Select Case UCase(c1fgTax.get_TextMatrix(irow, 4))
                    Case "GROSS AMOUNT"
                        If UCase(Trim(c1fgTax.get_TextMatrix(irow, 2))) = "P" Then
                            c1fgTax.set_TextMatrix(irow, 7, RoundUD((Val(c1fgTax.get_TextMatrix(irow, 3)) / 100) * mAfterDiscountTotal, 2, True))
                            mRunningTotal += RoundUD(Val(c1fgTax.get_TextMatrix(irow, 7)), 2, True)
                            c1fgTax.set_TextMatrix(irow, 8, mRunningTotal)
                            GoTo 1
                        Else
                            c1fgTax.set_TextMatrix(irow, 7, RoundUD(Val(c1fgTax.get_TextMatrix(irow, 3)) + mAfterDiscountTotal, 2, True))
                            mRunningTotal += RoundUD(Val(c1fgTax.get_TextMatrix(irow, 7)), 2, True)
                            c1fgTax.set_TextMatrix(irow, 8, mRunningTotal)
                            GoTo 1
                        End If
                    Case "RUNNING TOTAL"
                        If UCase(Trim(c1fgTax.get_TextMatrix(irow, 2))) = "P" Then
                            c1fgTax.set_TextMatrix(irow, 7, RoundUD((Val(c1fgTax.get_TextMatrix(irow, 3)) / 100) * mRunningTotal, 2, True))
                            mRunningTotal += RoundUD(Val(c1fgTax.get_TextMatrix(irow, 7)), 2, True)
                            c1fgTax.set_TextMatrix(irow, 8, mRunningTotal)
                            GoTo 1
                        Else
                            c1fgTax.set_TextMatrix(irow, 7, RoundUD(Val(c1fgTax.get_TextMatrix(irow, 3)) + mRunningTotal, 2, True))
                            mRunningTotal += RoundUD(Val(c1fgTax.get_TextMatrix(irow, 7)), 2, True)
                            c1fgTax.set_TextMatrix(irow, 8, mRunningTotal)
                            GoTo 1
                        End If
                        'Case "GROSSWITH NOCHARGE"
                        '    If UCase(Trim(c1fgTax.get_TextMatrix(irow, 2))) = "P" Then
                        '        c1fgTax.set_TextMatrix(irow, 7, RoundUD((Val(c1fgTax.get_TextMatrix(irow, 3)) / 100) * (mAfterDiscountTotal - Val(tbChargesAmt.Text)), 2, True))
                        '        mRunningTotal += RoundUD(Val(c1fgTax.get_TextMatrix(irow, 7)), 2, True)
                        '        c1fgTax.set_TextMatrix(irow, 8, mRunningTotal)
                        '        GoTo 1
                        '    Else
                        '        c1fgTax.set_TextMatrix(irow, 7, RoundUD(Val(c1fgTax.get_TextMatrix(irow, 3)) + mAfterDiscountTotal, 2, True))
                        '        mRunningTotal += RoundUD(Val(c1fgTax.get_TextMatrix(irow, 7)), 2, True)
                        '        c1fgTax.set_TextMatrix(irow, 8, mRunningTotal)
                        '        GoTo 1
                        '    End If

                    Case Else
                        Dim mOtheramount As Double = 0
                        mOtheramount = Get_Grid_Tax_Value(Trim(c1fgTax.get_TextMatrix(irow, 4)))
                        If UCase(Trim(c1fgTax.get_TextMatrix(irow, 2))) = "P" Then
                            c1fgTax.set_TextMatrix(irow, 7, RoundUD((Val(c1fgTax.get_TextMatrix(irow, 3)) / 100) * mOtheramount, 2, True))
                            mRunningTotal += RoundUD(Val(c1fgTax.get_TextMatrix(irow, 7)), 2, True)
                            c1fgTax.set_TextMatrix(irow, 8, mRunningTotal)
                            GoTo 1
                        Else
                            c1fgTax.set_TextMatrix(irow, 7, RoundUD(Val(c1fgTax.get_TextMatrix(irow, 3)) + mOtheramount, 2, True))
                            mRunningTotal += RoundUD(Val(c1fgTax.get_TextMatrix(irow, 7)), 2, True)
                            c1fgTax.set_TextMatrix(irow, 8, mRunningTotal)
                            GoTo 1
                        End If
                End Select

1:
            Next
2:

            'tbTotalAmount.Text = Val(tbChargesAmt.Text) + mRunningTotal

            tbTotalAmount.Text = mRunningTotal '+ Val(tbChargesAmt.Text)

            If cbxSalCurCode.Text = "INR" Or cbxInvType.Text = "Local" Or cbxInvType.Text = "Merch-Export" Then
                mDigits = Val(tbTotalAmount.Text) - Int(Val(tbTotalAmount.Text))
                mDigits = Round(mDigits, 2)

                If mDigits >= 0.5 Then
                    tbInvoiceValue.Text = Int(Val(tbTotalAmount.Text)) + 1
                    tbRoundOff.Text = 1 - mDigits
                Else
                    tbInvoiceValue.Text = Val(tbTotalAmount.Text) - mDigits
                    tbRoundOff.Text = -mDigits
                End If
            Else
                tbInvoiceValue.Text = tbTotalAmount.Text
                tbRoundOff.Text = "0.00"
            End If

            If tbtdsamt.Enabled = True And Val(tbtdsamt.Text) > 0 Then

                tbTDSval.Text = Round(((Val(tbtdsamt.Text) * Val(cbxtdsp.Text)) / 100))

            End If

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Function Get_Grid_Tax_Value(ByVal mTCDCode As String) As Double
        Try
            For iRow As Integer = 1 To c1fgTax.Rows - 1
                If Trim(mTCDCode) = Trim(c1fgTax.get_TextMatrix(iRow, 1)) Then
                    Return Val(c1fgTax.get_TextMatrix(iRow, 7))
                End If
            Next
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Function

    Private Sub cbxTCDGroupCode_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbxTCDGroupCode.LostFocus

        Try


            If Trim(cbxTCDGroupCode.Text) = "" Then Exit Sub

            ''check for TCS

            'If cbxScreenMode.Text <> "Modify" Then

            '    If tbCustName.Text.Trim = "" Then Exit Sub
            'Dim dsSales As New DataSet
            'dsSales = Nothing

            'dsSales = mobjclsSalesInvoice.GetSalesAmountCheck(Trim(tbCustCode.Text))

            'If dsSales.Tables(0).Rows.Count <= 0 Then Exit Sub

            'Dim s As String = Val(IIf(IsDBNull(dsSales.Tables(0).Rows(0)("assessable_value")), 0, dsSales.Tables(0).Rows(0)("assessable_value"))) + netvalue

            'If (Val(IIf(IsDBNull(dsSales.Tables(0).Rows(0)("assessable_value")), 0, dsSales.Tables(0).Rows(0)("assessable_value"))) + netvalue) < 5000000 Then

            '    If cbxTCDGroupCode.Text = "GST 5%-TCS 0.075%" Or cbxTCDGroupCode.Text = "IGST 5%-TCS 0.075%" Then

            '        Show_Message("This Customer Has Sales Less then 50,00000, Not Required TCS Kindly change Tax structure", "Customer Order")

            '        dsSales = Nothing

            '        Fill_Grid_Tax_Details()

            '        cbxTCDGroupCode.SelectedIndex = 0

            '        Exit Sub

            '    End If

            'ElseIf (Val(IIf(IsDBNull(dsSales.Tables(0).Rows(0)("assessable_value")), 0, dsSales.Tables(0).Rows(0)("assessable_value"))) + netvalue) >= 5000000 Then

            '    If cbxTCDGroupCode.Text <> "GST 5%-TCS 0.075%" And cbxTCDGroupCode.Text <> "IGST 5%-TCS 0.075%" Then

            '        Show_Message("This Customer Has Sales Greater then or equal to 50,00000, It Required TCS Kindly change Tax structure", "Customer Order")

            '        dsSales = Nothing

            '        Fill_Grid_Tax_Details()

            '        cbxTCDGroupCode.SelectedIndex = 0


            '        Exit Sub

            '    End If

            'End If

            'dsSales = Nothing

            'End If

            Calculate_Tax_Details()

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPK_SO_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_SO.Click
        Try
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing
            mSORevNo = ""
            ds = mobjclsCustOrder.GetOrderDetails("", cbxSalesType.Text, cbxCustType.Text, "1", "", "", "ALL")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Sales Order Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            tbSONo.Text = dtPickList.Rows(0)("SO_No")
            dtpSODate.Value = dtPickList.Rows(0)("SO_Date")
            mSORevNo = dtPickList.Rows(0)("Revision_No")
            ds = Nothing
            ds = New DataSet
            ds = mobjclsCustOrder.GetOrderDetails(Trim(tbSONo.Text), "", "", "1", "", mSORevNo)
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub
            tbCustCode.Text = ds.Tables(0).Rows(0)("Cust_Code")
            tbCustName.Text = ds.Tables(0).Rows(0)("Cust_Name")
            tbAgentCode.Text = ds.Tables(0).Rows(0)("Agent_Code")
            tbAgentName.Text = ds.Tables(0).Rows(0)("Agent_Name")


            'check customer turnover

            SSQL = ""
            SSQL = "select TURN_OVER  from ecommon..customer_details a"
            SSQL = SSQL & " where a.Cust_Code='" & Trim(tbCustCode.Text) & "'"
            SSQL = SSQL & " and a.isactive=1 "
            SSQL = SSQL & " and a.comp_code ='" & mvarCompanyCode & "'"

            Dim tovr As String = ReturnSingleValue(SSQL, "eCommon")


            If tovr = "<=100000000" Then
                tbtdsamt.Enabled = False
                tbtdsamt.Text = ""
                cbxtdsp.Enabled = False
                tbTDSval.Text = ""
                tbTDSval.Enabled = False
                tcs = "tcs"
                Fill_TCD_Group_Details(tcs)

            ElseIf tovr = ">100000000" Then
                tbtdsamt.Enabled = True
                tbtdsamt.Text = ""
                cbxtdsp.Enabled = True
                tbTDSval.Text = ""
                tbTDSval.Enabled = True
                tcs = ""
                Fill_TCD_Group_Details(tcs)

            Else

                tbCustName.Text = ""

                Show_Message("Kindly Set Turn over Limit and then select customer")

                Exit Sub

            End If



            SSQL = ""
            SSQL = "select Comm_Per from eCommon..Customer_Details"
            SSQL = SSQL & " where cust_code='" & Trim(tbCustCode.Text) & "'"

            Dim comm1 As Double = ReturnSingleValue(SSQL, "eCommon")

            SSQL = ""
            SSQL = "select Exchange_Rate from eSales..SOP_SalesOrder_Main"
            SSQL = SSQL & " where SO_No='" & Trim(tbSONo.Text) & "'"
            SSQL = SSQL & " And Cust_Code='" & Trim(tbCustCode.Text) & "'"
            SSQL = SSQL & " And Agent_Code='" & Trim(tbAgentCode.Text) & "'"

            Dim comm2 As Double = ReturnSingleValue(SSQL, "eSales")



            SSQL = ""
            SSQL = "select a.Tax_details,a.Revision_No from eSales..SOP_SalesOrder_Line a"
            SSQL = SSQL & " inner join(select max(revision_no) Revision_no from eSales..SOP_SalesOrder_main where Cust_Code='" & Trim(tbCustCode.Text) & "'"
            SSQL = SSQL & " and Agent_Code='" & Trim(tbAgentCode.Text) & "' and isactive=1 and SO_No ='" & Trim(tbSONo.Text) & "')"
            SSQL = SSQL & " c on a.Revision_No=c.revision_no where a.SO_No ='" & Trim(tbSONo.Text) & "'"




            Dim TAX As String = ReturnSingleValue(SSQL, "eSales")


            If cbxInvType.Text <> "EXPORT" Then

                cbxTCDGroupCode.Items.Clear()

                cbxTCDGroupCode.Items.Add(TAX)

                cbxTCDGroupCode.Text = Trim(TAX)

            End If


            If comm1 <= 0 Then Exit Sub
            If comm2 <= 0 Then Exit Sub

            If Val(comm1) = Val(comm2) Then

                'tbAgentComm.ReadOnly = True
                lblcomm.Visible = True

            Else

                'tbAgentComm.ReadOnly = False
                lblcomm.Visible = False

            End If



        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub Delete_TCD_Group_Details()

        Try
            ds = Nothing
            ds = New DataSet

            ds = mobjclsSalesTCDGroup.DeleteSalesTCDGroupDetails("")

            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            cbxTCDGroupCode.Items.Clear()

            cbxTCDGroupCode.Items.Add("NONE")
            For iRow = 0 To ds.Tables(0).Rows.Count - 1
                cbxTCDGroupCode.Items.Add(ds.Tables(0).Rows(iRow)("TCD_Group_Code"))
            Next
            cbxTCDGroupCode.SelectedIndex = 0

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try

    End Sub
    Private Sub btnApply_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnApply.Click
        Dim mvarRecordStatus As Integer = Nothing
        Dim mvarMsgDialogResult As Integer = Nothing
        Dim mvarUpateStatus As Integer = Nothing
        Dim mSaveStringMain As String = ""
        Dim mSaveStringOthers As String = ""
        Dim mTaxString As String = ""
        Dim mprodcode As String = ""
        Dim msalqty As Double = 0
        Dim mstckqty As Double = 0

        Try

            If cbxScreenMode.Text = "View" Then Exit Sub
            If IsBlankComboBox(cbxNumberType) Then Exit Sub
            If IsBlankComboBox(cbxCustType) Then Exit Sub
            If IsBlankTextBox(tbCustCode) Then Exit Sub
            If IsBlankTextBox(tbAgentCode) Then Exit Sub
            If IsBlankTextBox(tbLotNo) Then Exit Sub

            If UCase(cbxInvType.Text) = "Local" Or UCase(cbxInvType.Text) = "Merch-Export" Then
                cbxSalCurCode.Text = "INR"
            End If

            If UCase(cbxInvBasedOn.Text) = "SO BASED" Then
                If Trim(tbSONo.Text) = "" Then
                    Show_Message("Please select sales order number.")
                    btnPK_SO.Focus()
                    Exit Sub
                Else

                    If Not RemoveSingleQuotes(tbSINVNo.Text) = "" Then
                        mvarRecordStatus = GetDeleteAutorize_Status(RemoveSingleQuotes(tbSINVNo.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                                   , "SINV_No", "SINV_Date", "eSales..SOP_SalesInvoice_Main", "AUTHORIZE")
                        If mvarRecordStatus = 3 Then
                            Show_Message("Already authorized.")
                            Exit Sub
                        End If

                        mvarRecordStatus = GetDeleteAutorize_Status(RemoveSingleQuotes(tbSINVNo.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                                   , "SINV_No", "SINV_Date", "eSales..SOP_SalesInvoice_Main", "DELETE")
                        If mvarRecordStatus = 2 Then
                            Show_Message("Already deleted.")
                            Exit Sub
                        End If
                    End If

                    ds = Nothing
                    ds = New DataSet
                    ds = GetSalesOrderDetails(RemoveSingleQuotes(Trim(tbSONo.Text)), cbxSalesType.Text)
                    If ds.Tables(0).Rows.Count <= 0 Then
                        Show_Message("Sales order number is doesn't exists.")
                        tbSONo.Text = ""
                        tbSONo.Focus()
                        Exit Sub
                    Else
                        dtpSODate.Value = ds.Tables(0).Rows(0)("SO_Date")
                    End If
                End If
                'If UCase(Trim(tbCustCode.Text)) <> UCase(Trim(ds.Tables(0).Rows(0)("Cust_Code"))) Then
                'Show_Message("Customer does not match.")
                'btnPK_Customer.Focus()
                'Exit Sub
                'End If
                If UCase(Trim(cbxInvType.Text)) <> UCase(Trim(ds.Tables(0).Rows(0)("SO_Type"))) Then
                    Show_Message("Invoice type does not match.")
                    cbxInvType.Focus()
                    Exit Sub
                End If
                If UCase(Trim(cbxSalesType.Text)) <> UCase(Trim(ds.Tables(0).Rows(0)("Prod_Sales_type"))) Then
                    Show_Message("Sales type does not match.")
                    cbxSalesType.Focus()
                    Exit Sub
                End If

            ElseIf UCase(cbxInvBasedOn.Text) = "PROFORMA BASED" Then

                If Trim(tbPINVNo.Text) = "" Then
                    Show_Message("Please select Proforma invoice number.")
                    btnPK_PINVNo.Focus()
                    Exit Sub
                Else
                    ds = Nothing
                    ds = New DataSet
                    ds = GetProformaInvoiceDetails(RemoveSingleQuotes(Trim(tbPINVNo.Text)), cbxSalesType.Text)
                    If ds.Tables(0).Rows.Count <= 0 Then
                        Show_Message("Proforma invoice number is doesn't exists.")
                        tbPINVNo.Text = ""
                        tbPINVNo.Focus()
                        Exit Sub
                    Else
                        dtpPINVDate.Value = ds.Tables(0).Rows(0)("PINV_Date")
                        tbSONo.Text = ds.Tables(0).Rows(0)("SO_No")
                        dtpSODate.Text = ds.Tables(0).Rows(0)("SO_Date")
                    End If
                End If
                If UCase(Trim(tbCustCode.Text)) <> UCase(Trim(ds.Tables(0).Rows(0)("Cust_Code"))) Then
                    Show_Message("Customer does not match.")
                    btnPK_Customer.Focus()
                    Exit Sub
                End If
                If UCase(Trim(cbxInvType.Text)) <> UCase(Trim(ds.Tables(0).Rows(0)("Invoice_Type"))) Then
                    Show_Message("Invoice type does not match.")
                    cbxInvType.Focus()
                    Exit Sub
                End If
                If UCase(Trim(cbxSalesType.Text)) <> UCase(Trim(ds.Tables(0).Rows(0)("Prod_Sales_type"))) Then
                    Show_Message("Sales type does not match.")
                    cbxSalesType.Focus()
                    Exit Sub
                End If
            End If

            If Trim(tbExNo.Text) <> "" Then
                If UCase(cbxInvType.Text) = "local" Or UCase(cbxInvType.Text) = "Merch-Export" Then
                    cbxInvType.Text = "EXPORT"
                End If
            End If

            RemoveEmptyRows(c1fgItems, 1)
            RemoveEmptyRows(c1fgTax, 1)

            If c1fgItems.Rows <= 1 Then
                Show_Message("Please enter line item.")
                tbCustItemDesc.Focus()
                Exit Sub
            End If

            For iRow = 1 To c1fgItems.Rows - 1
                If Not (UCase(cbxSalesType.Text) = UCase(GetProductSalesType(Trim(c1fgItems.get_TextMatrix(iRow, 1))))) Then
                    Show_Message("Product code differ from sales type. Kindly check.")
                    cbxSalesType.Focus()
                    Exit Sub
                End If
            Next

            If IsValidDate(dtpEntryDate.Value) = False Then Exit Sub

            If Not RemoveSingleQuotes(tbSINVNo.Text) = "" Then
                mvarRecordStatus = GetDeleteAutorize_Status(RemoveSingleQuotes(tbSINVNo.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "SINV_No", "SINV_Date", "eSales..SOP_SalesInvoice_Main", "AUTHORIZE")
                If mvarRecordStatus = 3 Then
                    Show_Message("Already authorized.")
                    Exit Sub
                End If

                mvarRecordStatus = GetDeleteAutorize_Status(RemoveSingleQuotes(tbSINVNo.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "SINV_No", "SINV_Date", "eSales..SOP_SalesInvoice_Main", "DELETE")
                If mvarRecordStatus = 2 Then
                    Show_Message("Already deleted.")
                    Exit Sub
                End If

                mvarRecordStatus = GetDeleteAutorize_Status(RemoveSingleQuotes(tbSINVNo.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "SINV_No", "SINV_Date", "eSales..SOP_SalesInvoice_Main", "")
            End If

            Select Case cbxScreenMode.Text
                Case "Add"
                    If mvarRecordStatus >= 1 Then
                        mvarMsgDialogResult = ShowYesNo("Sales invoice details are already exists." _
                                                             & vbCrLf & "Do you want to modify?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            cbxScreenMode.Text = "Modify"
                        ElseIf mvarMsgDialogResult = MsgBoxResult.No Then
                            mvarMsgDialogResult = ShowYesNo("Do you want to create new sales invoice?")
                            If mvarMsgDialogResult = MsgBoxResult.Yes Then
                                tbSINVNo.Text = ""
                                tbExNo.Text = ""
                            Else
                                Exit Sub
                            End If
                        Else
                            Exit Sub
                        End If
                    End If
                Case "Modify"
                    If mvarRecordStatus <= 0 Then
                        mvarMsgDialogResult = ShowYesNo("Sales invoice details are doesn't exists." _
                                                             & vbCrLf & "Do you want to create new sales invoice?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            tbSINVNo.Text = ""
                            tbExNo.Text = ""
                            cbxScreenMode.Text = "Add"
                        Else
                            Exit Sub
                        End If
                    End If
                Case "Authorize"

                    If mvarRecordStatus <= 0 Then
                        Show_Message("Sales invoice details doesn't exists.")
                        Exit Sub
                    Else

                        Dim mEntrydate As String = ""

                        mEntrydate = Format(dtpEntryDate.Value, "yyyy/MM/dd")

                        ds = Nothing
                        ds = New DataSet

                        ds = mobjclsSalesInvoice.Get_Product(Trim(tbSINVNo.Text))

                        'If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

                        mprodcode = ds.Tables(0).Rows(0)("prod_code")

                        ds1 = Nothing
                        ds1 = New DataSet

                        'If Trim(mprodcode) = "125sCC EGY" Then

                        '    mprodcode = "125sCW EGY"

                        'End If

                        'If Trim(mprodcode) = "68sCW" Then

                        '    mprodcode = "68sCC"

                        'End If

                        'If Trim(mprodcode) = "6/125sCW EGY PLL" Then

                        '    mprodcode = "6/125sCC EGY PLL"

                        'End If



                        ds1 = mobjclsSalesInvoice.Get_Yarn_Stock(mEntrydate, mprodcode, Trim(tbSINVNo.Text), Trim(tbLotNo.Text))

                        msalqty = Val(Trim(tbTotalNetWt.Text))

                        mstckqty = IIf(IsDBNull(ds1.Tables(0).Rows(0)("stckqty")), 0, ds1.Tables(0).Rows(0)("stckqty"))

                        If Val(mstckqty) >= Val(msalqty) Then


                            '-------------------Update Sales Order Qty ------------------------------------------------------------------'

                            If mobjclsSalesInvoice.UpdateSalesOrderQty(Trim(tbSONo.Text), Format(dtpSODate.Value, "yyyy/MM/dd"), c1fgItems) = 0 Then
                                Show_Message("Error.")
                                Exit Sub
                            End If

                            '-------------------Update Sales Order Status ------------------------------------------------------------------'

                            If mobjclsSalesInvoice.UpdateSalesOrderStatus(Trim(tbSONo.Text), Format(dtpSODate.Value, "yyyy/MM/dd")) = 0 Then
                                Show_Message("Error.")
                                Exit Sub
                            End If


                            mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(tbSINVNo.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "SINV_No", "SINV_Date", "eSales..SOP_SalesInvoice_Tax", "AUTHORIZE")
                            mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(tbSINVNo.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "SINV_No", "SINV_Date", "eSales..SOP_SalesInvoice_Line", "AUTHORIZE")
                            mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(tbSINVNo.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "SINV_No", "SINV_Date", "eSales..SOP_SalesInvoice_Others", "AUTHORIZE")
                            mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(tbSINVNo.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                           , "SINV_No", "SINV_Date", "eSales..SOP_SalesInvoice_Main", "AUTHORIZE")

                            If mvarUpateStatus = 3 Then

                                '------------------- Account Posting ------------------------------------------------------------------'

                                'If UCase(Trim(cbxInvType.Text)) <> "EXPORT" Then

                                'If mobjclsYarnReceipt.SaveStockTransactionLedger(Trim(tbSINVNo.Text), Trim(cbxInvType.Text)) >= 1 Then
                                '    'mobjclsyarnReturnReceipt.SaveVomYarnTransactionLedger(Trim(tbRecNo.Text), "Return") >= 1 And
                                '    ' mobjclssizingbeamtransaction.SaveVomFabricTransactionLedger(Trim(tbRecNo.Text), "Conversion IN") >= 1 Then
                                '    'Show_Message("Authorized.")
                                '    'Form_Clear()

                                'End If

                                '------------------- Account Posting ------------------------------------------------------------------'

                                mobjclsSalesInvoice.SalesInvoiceAccountPosting(Trim(tbSINVNo.Text))

                                mobjclsSalesInvoice.RG1_Authorize(mprodcode, mEntrydate)

                                Show_Message("Authorized.")

                                Form_Clear()

                            Else


                                Show_Message("Error.")

                                Exit Sub


                            End If



                            'If mvarLocationCode <> "GUJARAT" Then

                            '    If mobjclsSalesInvoice.SalesInvoiceAccountPosting(Trim(tbSINVNo.Text)) = 0 Then
                            '        Show_Message("Error.")
                            '        Exit Sub
                            '    End If

                            'End If

                            ''End If

                            ''RG1 AUTHORIZE POSTING

                            'mobjclsSalesInvoice.RG1_Authorize(mprodcode, mEntrydate)

                        Else

                            Show_Message("Sales Qty is Greater then Stock Qty Kindly Check RG1 Stock.", "Less Stock")

                            Show_Message("This Invoice No : " & Trim(tbSINVNo.Text) & "For this Product" & mprodcode & "Not Authorized")


                        End If

                        Exit Sub

                    End If



                Case "Delete"
                    If mvarRecordStatus >= 1 Then
                        mvarMsgDialogResult = ShowYesNo("Are you sure do you want to delete this record?")
                        If mvarMsgDialogResult = MsgBoxResult.Yes Then
                            mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(tbSINVNo.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                             , "SINV_No", "SINV_Date", "eSales..SOP_SalesInvoice_Tax", "DELETE")
                            mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(tbSINVNo.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                               , "SINV_No", "SINV_Date", "eSales..SOP_SalesInvoice_Line", "DELETE")
                            mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(tbSINVNo.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                               , "SINV_No", "SINV_Date", "eSales..SOP_SalesInvoice_Others", "DELETE")
                            mvarUpateStatus = updateDeleteAutorize_Status(RemoveSingleQuotes(tbSINVNo.Text), Format(dtpEntryDate.Value, "yyyy/MM/dd") _
                                                               , "SINV_No", "SINV_Date", "eSales..SOP_SalesInvoice_Main", "DELETE")
                            If mvarUpateStatus = 2 Then

                                mobjclsYarnReceipt.DeleteTransactionLedger(Trim(tbSINVNo.Text), Trim(cbxInvType.Text)) 'Delete RG1 Entries

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

            If Trim(tbSINVNo.Text) = "" Then
                If Format(dtpEntryDate.Value, "yyyy/MM/dd") < Format(GetMaxDate("SOP_SalesInvoice_Main", "SINV_Date", "eSales"), "yyyy/MM/dd") Then
                    Show_Message("Entry date should be greater than or equal to last saved date.")
                    dtpEntryDate.Focus()
                    Exit Sub
                End If
            End If

            mSaveStringMain = ""
            mSaveStringMain = RemoveSingleQuotes(tbSINVNo.Text) & "||" : mSaveStringMain &= Format(dtpEntryDate.Value, "yyyy/MM/dd") & "||"
            mSaveStringMain &= cbxSalesType.Text & "||" : mSaveStringMain &= cbxSecLocation.Text & "||"
            mSaveStringMain &= RemoveSingleQuotes(tbExNo.Text) & "||" : mSaveStringMain &= cbxInvBasedOn.Text & "||"
            mSaveStringMain &= cbxInvType.Text & "||" : mSaveStringMain &= cbxStock.Text & "||"
            mSaveStringMain &= RemoveSingleQuotes(tbSONo.Text) & "||" : mSaveStringMain &= Format(dtpSODate.Value, "yyyy/MM/dd") & "||"
            mSaveStringMain &= RemoveSingleQuotes(tbPINVNo.Text) & "||" : mSaveStringMain &= Format(dtpPINVDate.Value, "yyyy/MM/dd") & "||"
            mSaveStringMain &= cbxCustType.Text & "||" : mSaveStringMain &= RemoveSingleQuotes(tbCustCode.Text) & "||"
            mSaveStringMain &= Val(tbBillToID.Text) & "||" : mSaveStringMain &= Val(tbShipToID.Text) & "||"
            mSaveStringMain &= RemoveSingleQuotes(tbRefDocNo.Text) & "||" : mSaveStringMain &= Format(dtpRefDocDate.Value, "yyyy/MM/dd") & "||"
            mSaveStringMain &= RemoveSingleQuotes(tbPackNo.Text) & "||" : mSaveStringMain &= Format(dtpPackDate.Value, "yyyy/MM/dd") & "||"
            mSaveStringMain &= RemoveSingleQuotes(tbAgentCode.Text) & "||" : mSaveStringMain &= Val(tbAgentComm.Text) & "||"
            mSaveStringMain &= cbxPayMode.Text & "||" : mSaveStringMain &= cbxPayTerms.Text & "||"
            mSaveStringMain &= cbxDelvMode.Text & "||" : mSaveStringMain &= cbxContractType.Text & "||"
            mSaveStringMain &= RemoveSingleQuotes(tbTransCode.Text) & "||" : mSaveStringMain &= cbxSalCurCode.Text & "||"
            mSaveStringMain &= cbxExCurCode.Text & "||" : mSaveStringMain &= Val(tbExRate.Text) & "||"
            mSaveStringMain &= RemoveSingleQuotes(tbTotalItemDesc.Text) & "||" : mSaveStringMain &= Val(tbTotalItems.Text) & "||"
            mSaveStringMain &= Val(tbTotalNetWt.Text) & "||" : mSaveStringMain &= Val(tbTotalGrossWt.Text) & "||"
            mSaveStringMain &= Val(tbAssValue.Text) & "||" : mSaveStringMain &= RemoveSingleQuotes(tbDiscDesc.Text) & "||"
            mSaveStringMain &= Val(tbDiscAmt.Text) & "||" : mSaveStringMain &= RemoveSingleQuotes(tbChargesDesc.Text) & "||"
            mSaveStringMain &= Val(tbChargesAmt.Text) & "||" : mSaveStringMain &= Val(tbTotalAmount.Text) & "||"
            mSaveStringMain &= Val(tbRoundOff.Text) & "||" : mSaveStringMain &= Val(tbInvoiceValue.Text) & "||"
            mSaveStringMain &= RemoveSingleQuotes(tbBankerName.Text) & "||" : mSaveStringMain &= Format(dtpIssue.Value, "yyyy/MM/dd HH:mm") & "||"
            mSaveStringMain &= Format(dtpRemoval.Value, "yyyy/MM/dd HH:mm") & "||"
            mSaveStringMain &= RemoveSingleQuotes(tbLotNo.Text) & "||"
            mSaveStringMain &= RemoveSingleQuotes(tbBagNo.Text) & "||"
            mSaveStringMain &= RemoveSingleQuotes(tbPackingDetails.Text) & "||"
            mSaveStringMain &= Trim(tbIRNNo.Text) & "||"
            mSaveStringMain &= RemoveSingleQuotes(tbACKNo.Text) & "||"
            mSaveStringMain &= RemoveSingleQuotes(tbEwbno.Text) & "||"

            mSaveStringMain &= Val(tbtdsamt.Text) & "||"
            mSaveStringMain &= Val(cbxtdsp.Text) & "||"
            mSaveStringMain &= Val(tbTDSval.Text) & "||"


            mSaveStringOthers = ""
            mSaveStringOthers = RemoveSingleQuotes(tbVehNo.Text) & "||" : mSaveStringOthers &= RemoveSingleQuotes(tbLRNo.Text) & "||"
            mSaveStringOthers &= Format(dtpLRDate.Value, "yyyy/MM/dd") & "||" : mSaveStringOthers &= cbxAgainstForm.Text & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbDriverName.Text) & "||" : mSaveStringOthers &= RemoveSingleQuotes(tbLicNo.Text) & "||"
            mSaveStringOthers &= Val(tbLorryHire.Text) & "||" : mSaveStringOthers &= Val(tbLorryHireTax.Text) & "||"
            If Val(tbLorryHire.Text) > 0 And Val(tbLorryHireTax.Text) > 0 Then
                mSaveStringOthers &= (Val(tbLorryHire.Text) * (Val(tbLorryHireTax.Text) / 100)) + Val(tbLorryHire.Text) & "||"
            Else
                mSaveStringOthers &= Val(tbLorryHireNet.Text) & "||"
            End If
            mSaveStringOthers &= RemoveSingleQuotes(tbContainerDetails.Text) & "||" : mSaveStringOthers &= RemoveSingleQuotes(tbPreCarriageBy.Text) & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbVesselNo.Text) & "||" : mSaveStringOthers &= RemoveSingleQuotes(tbPortDischarge.Text) & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbPlaceReceipt.Text) & "||" : mSaveStringOthers &= RemoveSingleQuotes(tbPortLoading.Text) & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbOrigin.Text) & "||" : mSaveStringOthers &= RemoveSingleQuotes(tbFinalDestnPlace.Text) & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbFinalDestnCountry.Text) & "||" : mSaveStringOthers &= RemoveSingleQuotes(tbUserDef1.Text) & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbUserDef2.Text) & "||" : mSaveStringOthers &= RemoveSingleQuotes(tbUserDef3.Text) & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbARE1No.Text) & "||" : mSaveStringOthers &= Format(dtpARE1Date.Value, "yyyy/MM/dd") & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbPODetails.Text) & "||" : mSaveStringOthers &= RemoveSingleQuotes(tbDCDetails.Text) & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbBLDetails.Text) & "||" : mSaveStringOthers &= RemoveSingleQuotes(tbSBDetails.Text) & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbEPCGNo.Text) & "||" : mSaveStringOthers &= Format(dtpEPCGDate.Value, "yyyy/MM/dd") & "||"
            mSaveStringOthers &= RemoveSingleQuotes(cbxExportScheme.Text) & "||" : mSaveStringOthers &= RemoveSingleQuotes(tbRegnNo.Text) & "||"
            mSaveStringOthers &= Format(dtpRegnDate.Value, "yyyy/MM/dd") & "||" : mSaveStringOthers &= RemoveSingleQuotes(tbERCDetails.Text) & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbCEDetails.Text) & "||" : mSaveStringOthers &= RemoveSingleQuotes(tbTermsDesc.Text) & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbNotesDesc.Text) & "||"
            'mSaveStringOthers &= RemoveSingleQuotes(tbNotesDesc.Text) & "+" & RemoveSingleQuotes(tbNotesDesc2.Text) & "+" & RemoveSingleQuotes(tbNotesDesc3.Text) & "+" & RemoveSingleQuotes(tbNotesDesc4.Text) & "+" _
            '   & RemoveSingleQuotes(tbNotesDesc5.Text) & "+" & RemoveSingleQuotes(tbNotesDesc6.Text) & "+" & RemoveSingleQuotes(tbNotesDesc7.Text) & "+" & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbOthers.Text) & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbTransid.Text) & "||"
            mSaveStringOthers &= RemoveSingleQuotes(tbTranName.Text) & "||"
            mSaveStringOthers &= Val(tbdistance.Text) & "||"

            Dim mstrSaveStatus As String
            Dim mSpltStr() As String

            mstrSaveStatus = mobjclsSalesInvoice.SaveSalesInvoiceMain(mSaveStringMain, mSaveStringOthers, cbxScreenMode.Text, c1fgItems, c1fgTax, cbxNumberType.Text, cbxTCDGroupCode.Text)

            mSpltStr = mstrSaveStatus.Split("||")

            tbSINVNo.Text = mSpltStr(0).Trim
            tbExNo.Text = mSpltStr(2).Trim

            If tbPINVNo.Text = "Error" Then
                Show_Message("Error.")
                tbSINVNo.Text = ""
                tbExNo.Text = ""
                Exit Sub
            Else
                'sTOCK uPDATE
                mobjclsYarnReceipt.SaveStockTransactionLedger(Trim(tbSINVNo.Text), Trim(cbxInvType.Text))
                Show_Message("Successfully saved.")
                cbxScreenMode.Text = "Modify"
                'Form_Clear()
                Exit Sub
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub tbEPCGNo_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbEPCGNo.LostFocus
        Try
            If Trim(tbEPCGNo.Text) = "" Then Exit Sub

            ds = Nothing
            ds = New DataSet
            ds = mobjclsEPCG.GetEPCGDetails("", RemoveSingleQuotes(Trim(tbEPCGNo.Text)))
            If ds.Tables(0).Rows.Count <= 0 Then
                Show_Message("EPCG number doesn't exists.")
                tbEPCGNo.Text = ""
                dtpEPCGDate.Value = Now
                tbRegnNo.Text = ""
                dtpRegnDate.Value = Now
                Exit Sub
            End If
            dtpEPCGDate.Value = ds.Tables(0).Rows(0)("EPCG_Date")
            tbRegnNo.Text = ds.Tables(0).Rows(0)("Reg_No")
            dtpRegnDate.Value = ds.Tables(0).Rows(0)("Reg_Date")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub tbTransName_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbTransName.LostFocus
        Try
            If Trim(tbTransName.Text) = "" Then
                tbTransCode.Text = ""
                Exit Sub
            End If

            ds = Nothing
            ds = mobjclsSupplier.GetSupplierDetails("", RemoveSingleQuotes(tbTransName.Text))
            If ds.Tables(0).Rows.Count <= 0 Then
                tbTransName.Text = ""
                tbTransCode.Text = ""
                Exit Sub
            End If
            tbTransCode.Text = ds.Tables(0).Rows(0)("Sup_Code")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPK_Trans_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_Trans.Click
        Try
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing
            ds = mobjclsSupplier.GetSupplierDetails("", "", "TRANSPORTER")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Transporter Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowDialog()
            frmPickList1.ShowInTaskbar = False
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            tbTransCode.Text = dtPickList.Rows(0)("Sup_Code")
            tbTransName.Text = dtPickList.Rows(0)("Sup_Name")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPK_SInvNo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_SInvNo.Click
        Try
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing
            ds = mobjclsSalesInvoice.GetSalesInvoiceDetails("", "", "", "", "", "")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Sales Invoice Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            tbSINVNo.Text = dtPickList.Rows(0)("SINV_No")
            dtpEntryDate.Value = dtPickList.Rows(0)("SINV_Date")
            cbxCustType.Text = dtPickList.Rows(0)("Cust_Type")
            cbxSalesType.Text = dtPickList.Rows(0)("Prod_Sales_Type")
            cbxSecLocation.Text = dtPickList.Rows(0)("Sec_Location_Code")
            tbExNo.Text = IIf(IsDBNull(dtPickList.Rows(0)("EINV_No")), "", dtPickList.Rows(0)("EINV_No"))
            Fill_Screen_Details()
            btnApply.Enabled = False
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub Fill_Screen_Details()
        Try
            Dim dr As DataRow = Nothing

            If Trim(tbSINVNo.Text) = "" Then Exit Sub

            ds = Nothing
            ds = New DataSet

            dt = Nothing
            dt = New DataTable

            ds = mobjclsSalesInvoice.GetSalesInvoiceDetails(Trim(tbSINVNo.Text), "", "", "", "", "")

            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            With ds.Tables(0)
                cbxInvBasedOn.Text = IIf(IsDBNull(.Rows(0)("Invoice_Based_On")), "", .Rows(0)("Invoice_Based_On"))
                cbxInvType.Text = IIf(IsDBNull(.Rows(0)("Invoice_Type")), "", .Rows(0)("Invoice_Type"))
                cbxStock.Text = IIf(IsDBNull(.Rows(0)("Stock_Reduction")), "", .Rows(0)("Stock_Reduction"))
                tbSONo.Text = IIf(IsDBNull(.Rows(0)("SO_No")), "", .Rows(0)("SO_No"))
                mSORevNo = 0
                dtpSODate.Value = .Rows(0)("SO_Date")
                tbPINVNo.Text = IIf(IsDBNull(.Rows(0)("PINV_No")), "", .Rows(0)("PINV_No"))
                dtpPINVDate.Value = .Rows(0)("PINV_Date")
                cbxCustType.Text = IIf(IsDBNull(.Rows(0)("Cust_Type")), "", .Rows(0)("Cust_Type"))
                tbCustCode.Text = IIf(IsDBNull(.Rows(0)("Cust_Code")), "", .Rows(0)("Cust_Code"))
                tbCustName.Text = IIf(IsDBNull(.Rows(0)("Cust_Name")), "", .Rows(0)("Cust_Name"))
                tbBillToID.Text = IIf(IsDBNull(.Rows(0)("Bill_To_ID")), "0", .Rows(0)("Bill_To_ID"))
                tbShipToID.Text = IIf(IsDBNull(.Rows(0)("Ship_To_ID")), "0", .Rows(0)("Ship_To_ID"))
                tbRefDocNo.Text = IIf(IsDBNull(.Rows(0)("Ref_Doc_No")), "", .Rows(0)("Ref_Doc_No"))
                dtpRefDocDate.Value = .Rows(0)("Ref_Doc_Date")
                tbPackNo.Text = IIf(IsDBNull(.Rows(0)("Pack_No")), "", .Rows(0)("Pack_No"))
                dtpPackDate.Value = .Rows(0)("Pack_Date")
                tbAgentCode.Text = IIf(IsDBNull(.Rows(0)("Agent_Code")), "", .Rows(0)("Agent_Code"))
                tbAgentName.Text = IIf(IsDBNull(.Rows(0)("Agent_Name")), "", .Rows(0)("Agent_Name"))
                tbAgentComm.Text = IIf(IsDBNull(.Rows(0)("Agent_Comm_Per")), "0", .Rows(0)("Agent_Comm_Per"))
                cbxPayMode.Text = IIf(IsDBNull(.Rows(0)("Pay_Mode")), "", .Rows(0)("Pay_Mode"))
                cbxPayTerms.Text = IIf(IsDBNull(.Rows(0)("Pay_Terms")), "", .Rows(0)("Pay_Terms"))
                cbxDelvMode.Text = IIf(IsDBNull(.Rows(0)("Delivery_Mode")), "", .Rows(0)("Delivery_Mode"))
                cbxContractType.Text = IIf(IsDBNull(.Rows(0)("Sales_Contract_Type")), "", .Rows(0)("Sales_Contract_Type"))
                tbTransCode.Text = IIf(IsDBNull(.Rows(0)("Sup_Code")), "", .Rows(0)("Sup_Code"))
                tbTransName.Text = IIf(IsDBNull(.Rows(0)("Sup_Name")), "", .Rows(0)("Sup_Name"))
                cbxSalCurCode.Text = IIf(IsDBNull(.Rows(0)("Sales_Currency_Code")), "", .Rows(0)("Sales_Currency_Code"))
                cbxExCurCode.Text = IIf(IsDBNull(.Rows(0)("Exchange_Currency_Code")), "", .Rows(0)("Exchange_Currency_Code"))
                tbExRate.Text = IIf(IsDBNull(.Rows(0)("Exchange_Rate")), "1.00", .Rows(0)("Exchange_Rate"))
                tbTotalItemDesc.Text = IIf(IsDBNull(.Rows(0)("Total_Items_Desc")), "", .Rows(0)("Total_Items_Desc"))
                tbTotalItems.Text = IIf(IsDBNull(.Rows(0)("Total_Items")), "0", .Rows(0)("Total_Items"))
                tbTotalNetWt.Text = IIf(IsDBNull(.Rows(0)("Total_Net_Wt")), "0", .Rows(0)("Total_Net_Wt"))
                tbTotalGrossWt.Text = IIf(IsDBNull(.Rows(0)("Total_Gross_Wt")), "0", .Rows(0)("Total_Gross_Wt"))
                tbAssValue.Text = IIf(IsDBNull(.Rows(0)("Assessable_Value")), "0", .Rows(0)("Assessable_Value"))
                tbDiscDesc.Text = IIf(IsDBNull(.Rows(0)("Discount_Desc")), "", .Rows(0)("Discount_Desc"))
                tbDiscAmt.Text = IIf(IsDBNull(.Rows(0)("Discount_Val")), "0", .Rows(0)("Discount_Val"))
                tbChargesDesc.Text = IIf(IsDBNull(.Rows(0)("Charges_Desc")), "", .Rows(0)("Charges_Desc"))
                tbChargesAmt.Text = IIf(IsDBNull(.Rows(0)("Charges_Val")), "0", .Rows(0)("Charges_Val"))
                tbTotalAmount.Text = IIf(IsDBNull(.Rows(0)("Invoice_Net")), "0", .Rows(0)("Invoice_Net"))
                tbRoundOff.Text = IIf(IsDBNull(.Rows(0)("Round_Off")), "0", .Rows(0)("Round_Off"))
                tbInvoiceValue.Text = IIf(IsDBNull(.Rows(0)("Invoice_Value")), "0", .Rows(0)("Invoice_Value"))
                tbBankerName.Text = IIf(IsDBNull(.Rows(0)("Banker_Name")), "", .Rows(0)("Banker_Name"))
                dtpIssue.Value = .Rows(0)("Inv_Issue_Date_Time")
                dtpRemoval.Value = .Rows(0)("Goods_Removal_Date_Time")
                tbLotNo.Text = Convert.ToString(IIf(IsDBNull(.Rows(0)("Lot_No")), "", .Rows(0)("Lot_No")))
                tbBagNo.Text = Convert.ToString(IIf(IsDBNull(.Rows(0)("Bag_No")), "", .Rows(0)("Bag_No")))
                tbPackingDetails.Text = Convert.ToString(IIf(IsDBNull(.Rows(0)("Packing_Details")), "", .Rows(0)("Packing_Details")))

                tbVehNo.Text = IIf(IsDBNull(.Rows(0)("Veh_No")), "", .Rows(0)("Veh_No"))
                tbLRNo.Text = IIf(IsDBNull(.Rows(0)("LR_No")), "", .Rows(0)("LR_No"))
                tbTransid.Text = IIf(IsDBNull(.Rows(0)("Trans_id")), "", .Rows(0)("Trans_id"))
                tbTranName.Text = IIf(IsDBNull(.Rows(0)("Trans_Name")), "", .Rows(0)("Trans_Name"))
                tbdistance.Text = IIf(IsDBNull(.Rows(0)("distance")), "", .Rows(0)("distance"))



                dtpLRDate.Value = .Rows(0)("LR_Date")
                cbxAgainstForm.Text = IIf(IsDBNull(.Rows(0)("Against_Form")), "", .Rows(0)("Against_Form"))
                tbDriverName.Text = IIf(IsDBNull(.Rows(0)("Driver_Name")), "", .Rows(0)("Driver_Name"))
                tbLicNo.Text = IIf(IsDBNull(.Rows(0)("Driver_Lic_No")), "", .Rows(0)("Driver_Lic_No"))
                tbLorryHire.Text = IIf(IsDBNull(.Rows(0)("Lorry_Hire")), "", .Rows(0)("Lorry_Hire"))
                tbLorryHireTax.Text = IIf(IsDBNull(.Rows(0)("Lorry_Hire_Tax_Per")), "", .Rows(0)("Lorry_Hire_Tax_Per"))
                tbLorryHireNet.Text = IIf(IsDBNull(.Rows(0)("Lorry_Hire_Net")), "", .Rows(0)("Lorry_Hire_Net"))
                tbContainerDetails.Text = IIf(IsDBNull(.Rows(0)("Container_Details")), "", .Rows(0)("Container_Details"))
                tbPreCarriageBy.Text = IIf(IsDBNull(.Rows(0)("PreCarriage_By")), "", .Rows(0)("PreCarriage_By"))
                tbVesselNo.Text = IIf(IsDBNull(.Rows(0)("Vessel_Flight_No")), "", .Rows(0)("Vessel_Flight_No"))
                tbPortDischarge.Text = IIf(IsDBNull(.Rows(0)("Port_of_Discharge")), "", .Rows(0)("Port_of_Discharge"))
                tbPlaceReceipt.Text = IIf(IsDBNull(.Rows(0)("Place_of_Receipt")), "", .Rows(0)("Place_of_Receipt"))
                tbPortLoading.Text = IIf(IsDBNull(.Rows(0)("Port_of_Loading")), "", .Rows(0)("Port_of_Loading"))
                tbOrigin.Text = IIf(IsDBNull(.Rows(0)("Country_of_Origin")), "", .Rows(0)("Country_of_Origin"))
                tbFinalDestnPlace.Text = IIf(IsDBNull(.Rows(0)("Final_Destn_Place")), "", .Rows(0)("Final_Destn_Place"))
                tbFinalDestnCountry.Text = IIf(IsDBNull(.Rows(0)("Final_Destn_Country")), "", .Rows(0)("Final_Destn_Country"))
                tbUserDef1.Text = IIf(IsDBNull(.Rows(0)("SInv_Others_1")), "", .Rows(0)("SInv_Others_1"))
                tbUserDef2.Text = IIf(IsDBNull(.Rows(0)("SInv_Others_2")), "", .Rows(0)("SInv_Others_2"))
                tbUserDef3.Text = IIf(IsDBNull(.Rows(0)("SInv_Others_3")), "", .Rows(0)("SInv_Others_3"))
                tbARE1No.Text = IIf(IsDBNull(.Rows(0)("ARE1_No")), "", .Rows(0)("ARE1_No"))
                dtpARE1Date.Value = .Rows(0)("ARE1_Date")
                tbPODetails.Text = IIf(IsDBNull(.Rows(0)("PO_Details")), "", .Rows(0)("PO_Details"))
                tbDCDetails.Text = IIf(IsDBNull(.Rows(0)("DC_Details")), "", .Rows(0)("DC_Details"))
                tbBLDetails.Text = IIf(IsDBNull(.Rows(0)("BL_Details")), "", .Rows(0)("BL_Details"))
                tbSBDetails.Text = IIf(IsDBNull(.Rows(0)("SB_Details")), "", .Rows(0)("SB_Details"))
                tbEPCGNo.Text = IIf(IsDBNull(.Rows(0)("EPCG_No")), "", .Rows(0)("EPCG_No"))
                dtpEPCGDate.Value = .Rows(0)("EPCG_Date")
                cbxExportScheme.Text = IIf(IsDBNull(.Rows(0)("Export_Scheme")), "", .Rows(0)("Export_Scheme"))
                tbRegnNo.Text = IIf(IsDBNull(.Rows(0)("Regn_No")), "", .Rows(0)("Regn_No"))
                dtpRegnDate.Value = .Rows(0)("Regn_Date")
                tbERCDetails.Text = IIf(IsDBNull(.Rows(0)("ERC_Details")), "", .Rows(0)("ERC_Details"))
                tbCEDetails.Text = IIf(IsDBNull(.Rows(0)("Central_Excise_Details")), "", .Rows(0)("Central_Excise_Details"))
                tbTermsDesc.Text = IIf(IsDBNull(.Rows(0)("Terms_Desc")), "", .Rows(0)("Terms_Desc"))
                tbNotesDesc.Text = IIf(IsDBNull(.Rows(0)("Notes_Desc")), "", .Rows(0)("Notes_Desc"))




                ''split the string

                'Dim s As String = IIf(IsDBNull(.Rows(0)("Notes_Desc")), "", .Rows(0)("Notes_Desc"))

                'Dim s1, s2, s3, s4, s5, s6, s7 As String

                'Dim p1, p2, p3, p4, p5, p6, p7 As Integer

                'p1 = InStr(1, UCase(s), "+")

                'If p1 <> 0 Then


                '    s1 = Mid(s, 1, p1 - 1)
                '    s1 = RemoveSingleQuotes(s1)

                'Else

                '    s1 = s

                'End If

                'p2 = InStr(p1 + 1, UCase(s), "+")

                'If p2 <> 0 Then

                '    s2 = Mid(s, p1 + 1, p2 - p1)
                '    s2 = RemoveSingleQuotes(s2)

                'End If

                'p3 = InStr(p2 + 1, UCase(s), "+")

                'If p3 <> 0 Then

                '    s3 = Mid(s, p2 + 1, p3 - p2)
                '    s3 = RemoveSingleQuotes(s3)

                'End If

                'p4 = InStr(p3 + 1, UCase(s), "+")

                'If p4 <> 0 Then

                '    s4 = Mid(s, p3 + 1, p4 - p3)
                '    s4 = RemoveSingleQuotes(s4)

                'End If

                'p5 = InStr(p4 + 1, UCase(s), "+")

                'If p5 <> 0 Then

                '    s5 = Mid(s, p4 + 1, p5 - p4)
                '    s5 = RemoveSingleQuotes(s5)

                'End If

                'p6 = InStr(p5 + 1, UCase(s), "+")

                'If p6 <> 0 Then

                '    s6 = Mid(s, p5 + 1, p6 - p5)
                '    s6 = RemoveSingleQuotes(s6)

                'End If

                'p7 = InStr(p6 + 1, UCase(s), "+")

                'If p7 <> 0 Then

                '    s7 = Mid(s, p6 + 1, p7 - p6)
                '    s7 = RemoveSingleQuotes(s7)

                'End If


                'tbNotesDesc.Text = s1
                'tbNotesDesc2.Text = s2
                'tbNotesDesc3.Text = s3
                'tbNotesDesc4.Text = s4
                'tbNotesDesc5.Text = s5
                'tbNotesDesc6.Text = s6
                'tbNotesDesc7.Text = s7

                tbOthers.Text = IIf(IsDBNull(.Rows(0)("Other_Instructions")), "", .Rows(0)("Other_Instructions"))

                tbIRNNo.Text = IIf(IsDBNull(.Rows(0)("IRN_No")), "", .Rows(0)("IRN_No"))
                tbACKNo.Text = IIf(IsDBNull(.Rows(0)("ACK_No")), "", .Rows(0)("ACK_No"))
                tbEwbno.Text = IIf(IsDBNull(.Rows(0)("ewb_No")), "", .Rows(0)("ewb_No"))

                tbtdsamt.Text = IIf(IsDBNull(.Rows(0)("tds_amt")), "", .Rows(0)("tds_amt"))
                cbxtdsp.Text = IIf(IsDBNull(.Rows(0)("tds_p")), "", .Rows(0)("tds_P"))
                tbTDSval.Text = IIf(IsDBNull(.Rows(0)("tds_val")), "", .Rows(0)("tds_val"))


                If Val(tbTDSval.Text) = 0 Then

                    tbtdsamt.Text = 0
                    tbtdsamt.Enabled = False
                    tbTDSval.Text = ""
                    tbTDSval.Enabled = False
                    cbxtdsp.Enabled = False

                End If


            End With


            Fill_Grid_Item_Details()

            ds = Nothing
            ds = New DataSet

            dt = Nothing
            dt = New DataTable

            ds = mobjclsSalesInvoice.GetSalesInvoiceDetails(Trim(tbSINVNo.Text), "", "", "", "", "")

            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub


            For iRow = 0 To ds.Tables(0).Rows.Count - 1
                dr = ds.Tables(0).Rows(iRow)
                With c1fgItems
                    .Rows += 1
                    .set_TextMatrix(iRow + 1, 0, dr("SNo"))
                    .set_TextMatrix(iRow + 1, 1, dr("Prod_Code"))
                    .set_TextMatrix(iRow + 1, 2, dr("Prod_Desc"))
                    .set_TextMatrix(iRow + 1, 3, dr("Cust_Item_Code"))
                    .set_TextMatrix(iRow + 1, 4, dr("Cust_Item_Desc"))
                    .set_TextMatrix(iRow + 1, 5, dr("Packing_Mode"))
                    .set_TextMatrix(iRow + 1, 6, dr("No_of_Items"))
                    .set_TextMatrix(iRow + 1, 7, dr("UOM_Code"))
                    .set_TextMatrix(iRow + 1, 8, dr("Invoice_Qty"))
                    .set_TextMatrix(iRow + 1, 9, dr("Rate_Per_Qty"))
                    .set_TextMatrix(iRow + 1, 10, dr("Line_Total"))
                    .set_TextMatrix(iRow + 1, 11, dr("Dis_Percent"))
                    .set_TextMatrix(iRow + 1, 12, dr("Dis_Rate"))
                    .set_TextMatrix(iRow + 1, 13, dr("Dis_Value"))
                    .set_TextMatrix(iRow + 1, 14, dr("Net_Value"))
                    .set_TextMatrix(iRow + 1, 15, dr("Remarks"))
                End With
            Next
            C1Tab2.SelectedIndex = 0
            ds = Nothing
            ds = New DataSet
            ds = mobjclsSalesInvoice.GetSalesInvoiceDetails(Trim(tbSINVNo.Text), "", "", "", "", "TAX")
            If ds.Tables(0).Rows.Count <= 0 Then
                cbxTCDGroupCode.ValueMember = "NONE"
                Tab_SelectedIndexChanged()
                Exit Sub
            End If
            cbxTCDGroupCode.ValueMember = "NONE"
            Dim TX As String = ds.Tables(0).Rows(0)("TCD_Group_Code")

            cbxTCDGroupCode.DropDownStyle = ComboBoxStyle.DropDown
            cbxTCDGroupCode.Text = TX


            Tab_SelectedIndexChanged()


            SSQL = ""
            SSQL = "select Comm_Per from eCommon..Customer_Details"
            SSQL = SSQL & " where cust_code='" & Trim(tbCustCode.Text) & "'"

            Dim comm1 As Double = ReturnSingleValue(SSQL, "eCommon")

            SSQL = ""
            SSQL = "select Exchange_Rate from eSales..SOP_SalesOrder_Main"
            SSQL = SSQL & " where SO_No='" & Trim(tbSONo.Text) & "'"
            SSQL = SSQL & " And Cust_Code='" & Trim(tbCustCode.Text) & "'"
            SSQL = SSQL & " And Agent_Code='" & Trim(tbAgentCode.Text) & "'"

            Dim comm2 As Double = ReturnSingleValue(SSQL, "eSales")

            'SSQL = ""
            'SSQL = "select a.Tax_details from eSales..SOP_SalesOrder_Line a"
            'SSQL = SSQL & " left join eSales..SOP_SalesOrder_main b on a.so_no=b.so_no and a.so_date=b.so_date"
            'SSQL = SSQL & " and a.fin_year_code=b.fin_year_code where a.SO_No='" & Trim(tbSONo.Text) & "'"
            ''SSQL = SSQL & " And b.Cust_Code='" & Trim(tbCustCode.Text) & "'"
            'SSQL = SSQL & " And and b.isactive=1 and a.revision_no=max(a.revision_no) and b.Agent_Code='" & Trim(tbAgentCode.Text) & "'"


            '01/07/2021
            'SSQL = ""
            'SSQL = "select a.Tax_details,a.Revision_No from eSales..SOP_SalesOrder_Line a"
            'SSQL = SSQL & " inner join(select max(revision_no) Revision_no from eSales..SOP_SalesOrder_main where Cust_Code='" & Trim(tbCustCode.Text) & "'"
            'SSQL = SSQL & " and Agent_Code='" & Trim(tbAgentCode.Text) & "' and isactive=1 and SO_No ='" & Trim(tbSONo.Text) & "')"
            'SSQL = SSQL & " c on a.Revision_No=c.revision_no where a.SO_No ='" & Trim(tbSONo.Text) & "'"


            'Dim TAX As String = ReturnSingleValue(SSQL, "eSales")

            'If TAX <> "" Then

            '    cbxTCDGroupCode.Items.Clear()

            '    cbxTCDGroupCode.Items.Add(TAX)

            '    cbxTCDGroupCode.SelectedIndex = 0

            '    'cbxTCDGroupCode.Text = Trim(TAX)

            'End If


            If comm1 <= 0 Then Exit Sub
            If comm2 <= 0 Then Exit Sub

            If Val(comm1) = Val(comm2) Then

                ' tbAgentComm.ReadOnly = True
                lblcomm.Visible = True

            Else

                tbAgentComm.ReadOnly = False
                lblcomm.Visible = False

            End If



        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPrint_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPrint.Click
        Try
            ds = Nothing
            ds = New DataSet
            ds = GeteInvoiceDetails("yarn")
            ds.Tables(0).TableName = "Yarn Sales"

            'ExportExcel(ds)

            Schema_Generate(ds)

            eintype = "eInv"

            einvoice()

            'ReadIRN()

            'ReadAckNo()



        Catch ex As Exception
            Show_Message("Error : " & ex.Message.ToString)
        End Try
    End Sub
    Public Function Schema_Generate(ByVal ds As DataSet)

        Dim mTotAmt As Double = 0
        Dim mDigits As Double = 0
        Dim mRoundOff As Double = 0
        Dim fileName As String = "c:\reports\einv.txt"
        Dim fileName1 As String = "c:\reports\ewaybill.txt"

        Try
            If tbSINVNo.Text.Trim = "" Then Exit Function

            Dim strFileLocation As String = ""

            If ds.Tables(0).Rows.Count = 0 Then Exit Function


            FileClose(1)

            FileOpen(1, fileName, OpenMode.Output) ' Open file for output.
            PrintLine(1, "{")
            PrintLine(1, "  ""Version"": ""1.1"", ")
            PrintLine(1, "  ""TranDtls"": { ")
            PrintLine(1, "    ""TaxSch"": ""GST"", ")
            If ds.Tables(0).Rows(0)("INVOICE_TYPE") = "EXPORT" Then
                PrintLine(1, "    ""SupTyp"": ""EXPWP"", ")
            Else
                PrintLine(1, "    ""SupTyp"": ""B2B"", ")
            End If
            PrintLine(1, "    ""RegRev"": ""N"", ")
            PrintLine(1, "    ""EcmGstin"": null, ")
            PrintLine(1, "    ""IgstOnIntra"": ""N"" ")
            PrintLine(1, "  },")
            PrintLine(1, "  ""DocDtls"": { ")
            PrintLine(1, "    ""No"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("SINV_NO") & VB.Chr(34) & ",")
            PrintLine(1, "    ""Typ"": ""INV"", ")
            PrintLine(1, "    ""Dt"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("SINV_Date") & VB.Chr(34) & "")
            PrintLine(1, "  },")
            PrintLine(1, "  ""SellerDtls"": {")
            PrintLine(1, "    ""Gstin"": ""33AAACL3081D1Z1"",")
            PrintLine(1, "    ""LglNm"": ""L.S. MILLS LIMITED UNIT II"",")
            PrintLine(1, "    ""TrdNm"": ""L.S. MILLS LIMITED UNIT II"",")
            PrintLine(1, "    ""Addr1"": ""#16, CUMBUM ROAD"",")
            PrintLine(1, "    ""Addr2"": ""MUTHUTHEVANPATTY"",")
            PrintLine(1, "    ""Loc"": ""THENI"",")
            PrintLine(1, "    ""Pin"": " & 625534 & ",")
            PrintLine(1, "    ""Stcd"": ""33"",")
            PrintLine(1, "    ""Ph"": ""6384401001"",")
            PrintLine(1, "    ""Em"": ""marketing@lsspinning.com""")
            PrintLine(1, "  },")
            PrintLine(1, "  ""BuyerDtls"": {")
            PrintLine(1, "    ""Gstin"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("gstno") & VB.Chr(34) & ",")
            PrintLine(1, "    ""LglNm"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("cust_name") & VB.Chr(34) & ",")
            PrintLine(1, "    ""TrdNm"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("cust_name") & VB.Chr(34) & ",")
            If ds.Tables(0).Rows(0)("INVOICE_TYPE") = "EXPORT" Then
                PrintLine(1, "    ""Pos"": " & VB.Chr(34) & 96 & VB.Chr(34) & ",")
            Else
                PrintLine(1, "    ""Pos"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("statecode") & VB.Chr(34) & ",")
            End If
            PrintLine(1, "    ""Addr1"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("cust_add1") & VB.Chr(34) & ",")
            PrintLine(1, "    ""Addr2"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("cust_add2") & VB.Chr(34) & ",")
            PrintLine(1, "    ""Loc"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("cust_city") & VB.Chr(34) & ",")
            If ds.Tables(0).Rows(0)("INVOICE_TYPE") = "EXPORT" Then
                PrintLine(1, "    ""Pin"": " & 999999 & ",")
                PrintLine(1, "    ""Stcd"": " & VB.Chr(34) & 96 & VB.Chr(34) & ",")
            Else
                PrintLine(1, "    ""Pin"": " & Replace(ds.Tables(0).Rows(0)("cust_pincode"), " ", "") & ",")
                PrintLine(1, "    ""Stcd"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("statecode") & VB.Chr(34) & ",")
            End If
            PrintLine(1, "    ""Ph"": " & IIf(ds.Tables(0).Rows(0)("cust_phone_no") = "", VB.Chr(34) & 1234567890, VB.Chr(34) & ds.Tables(0).Rows(0)("cust_phone_no")) & VB.Chr(34) & ",")
            PrintLine(1, "    ""Em"": " & VB.Chr(34) & IIf(ds.Tables(0).Rows(0)("cust_Mail_id") = "", "abcd@gmail.com", ds.Tables(0).Rows(0)("cust_Mail_id")) & VB.Chr(34) & "")
            PrintLine(1, "  },")
            PrintLine(1, "  ""DispDtls"": {")
            PrintLine(1, "    ""Nm"": ""L.S. MILLS LIMITED UNIT II"",")
            PrintLine(1, "    ""Addr1"": ""#16, CUMBUM ROAD"",")
            PrintLine(1, "    ""Addr2"": ""MUTHUTHEVANPATTY"",")
            PrintLine(1, "    ""Loc"": ""THENI"",")
            PrintLine(1, "    ""Pin"": " & 625534 & ",")
            PrintLine(1, "    ""Stcd"": ""33""")
            PrintLine(1, "  },")
            PrintLine(1, "  ""ShipDtls"": {")
            PrintLine(1, "    ""Gstin"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("gst_no") & VB.Chr(34) & ",")
            PrintLine(1, "    ""LglNm"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("Delv_add1") & VB.Chr(34) & ",")
            PrintLine(1, "    ""TrdNm"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("Delv_add1") & VB.Chr(34) & ",")
            PrintLine(1, "    ""Addr1"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("Delv_add2") & VB.Chr(34) & ",")
            PrintLine(1, "    ""Addr2"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("Delv_add3") & VB.Chr(34) & ",")
            PrintLine(1, "    ""Loc"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("Delv_city") & VB.Chr(34) & ",")
            PrintLine(1, "    ""Pin"": " & Replace(IIf(IsDBNull(ds.Tables(0).Rows(0)("Delv_pincode")), "", ds.Tables(0).Rows(0)("Delv_pincode")), " ", "") & ",")
            PrintLine(1, "    ""Stcd"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("state_code") & VB.Chr(34) & "")
            PrintLine(1, "  },")
            PrintLine(1, "  ""ItemList"": [")
            PrintLine(1, "    {")
            PrintLine(1, "      ""SlNo"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("sno") & VB.Chr(34) & ",")
            PrintLine(1, "      ""PrdDesc"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("prod_desc") & VB.Chr(34) & ",")
            PrintLine(1, "      ""IsServc"": ""N"", ")
            PrintLine(1, "      ""HsnCd"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("Hsn_Code") & VB.Chr(34) & ",")
            PrintLine(1, "      ""Barcde"": ""123456"",")
            PrintLine(1, "      ""Qty"": " & ds.Tables(0).Rows(0)("Invoice_qty") & ",")
            PrintLine(1, "      ""FreeQty"": " & 0 & ",")
            PrintLine(1, "      ""Unit"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("unit") & VB.Chr(34) & ",")

            If ds.Tables(0).Rows(0)("INVOICE_TYPE") = "EXPORT" Then
                PrintLine(1, "      ""UnitPrice"": " & Round((ds.Tables(0).Rows(0)("Rate") * ds.Tables(0).Rows(0)("Exchange_Rate")), 3) & ",")
                PrintLine(1, "      ""TotAmt"": " & Round(ds.Tables(0).Rows(0)("Invoice_qty") * (ds.Tables(0).Rows(0)("Rate") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2) & ",")
            Else
                PrintLine(1, "      ""UnitPrice"": " & Round(ds.Tables(0).Rows(0)("Rate"), 3) & ",")
                PrintLine(1, "      ""TotAmt"": " & ds.Tables(0).Rows(0)("Totamt") & ",")
            End If

            PrintLine(1, "      ""Discount"": " & ds.Tables(0).Rows(0)("discount") & ",")
            PrintLine(1, "      ""PreTaxVal"": " & 1 & ",")

            If ds.Tables(0).Rows(0)("INVOICE_TYPE") = "EXPORT" Then
                PrintLine(1, "      ""AssAmt"": " & Round(ds.Tables(0).Rows(0)("Invoice_qty") * (ds.Tables(0).Rows(0)("Rate") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2) & ",")
            Else
                PrintLine(1, "      ""AssAmt"": " & ds.Tables(0).Rows(0)("Totamt") & ",")
            End If

            PrintLine(1, "      ""GstRt"": " & ds.Tables(0).Rows(0)("Tax_p") & ",")

            If ds.Tables(0).Rows(0)("INVOICE_TYPE") = "EXPORT" Then
                PrintLine(1, "      ""IgstAmt"": " & Round((ds.Tables(0).Rows(0)("IGST") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2) & ",")
            Else
                PrintLine(1, "      ""IgstAmt"": " & ds.Tables(0).Rows(0)("IGST") & ",")
            End If

            PrintLine(1, "      ""CgstAmt"": " & ds.Tables(0).Rows(0)("CGST") & ",")
            PrintLine(1, "      ""SgstAmt"":" & ds.Tables(0).Rows(0)("SGST") & ",")
            PrintLine(1, "      ""CesRt"": " & 0 & ",")
            PrintLine(1, "      ""CesAmt"": " & 0 & ",")
            PrintLine(1, "      ""CesNonAdvlAmt"": " & 0 & ",")
            PrintLine(1, "      ""StateCesRt"": " & 0 & ",")
            PrintLine(1, "      ""StateCesAmt"": " & 0 & ",")
            PrintLine(1, "      ""StateCesNonAdvlAmt"": " & 0 & ",")
            PrintLine(1, "      ""OthChrg"": " & 0 & ",")


            If ds.Tables(0).Rows(0)("INVOICE_TYPE") = "EXPORT" Then
                PrintLine(1, "      ""TotItemVal"": " & ((Round(ds.Tables(0).Rows(0)("Invoice_qty") * (ds.Tables(0).Rows(0)("Rate") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2)) + (Round((ds.Tables(0).Rows(0)("IGST") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2))) & ",")
            Else
                PrintLine(1, "      ""TotItemVal"": " & ds.Tables(0).Rows(0)("item_total") & ",")
            End If

            PrintLine(1, "      ""OrdLineRef"": ""3256"",")
            PrintLine(1, "      ""OrgCntry"": ""  "",")
            PrintLine(1, "      ""PrdSlNo"": ""12345"",")
            PrintLine(1, "      ""BchDtls"": {")
            PrintLine(1, "        ""Nm"": ""123456"", ")
            PrintLine(1, "        ""Expdt"": ""01/08/2020"", ")
            PrintLine(1, "        ""wrDt"": ""01/09/2020""")
            PrintLine(1, "      },")
            PrintLine(1, "     ""AttribDtls"": [")
            PrintLine(1, "        {")
            PrintLine(1, "         ""Nm"": " & VB.Chr(34) & ds.Tables(0).Rows(0)("prod_desc") & VB.Chr(34) & ",")
            PrintLine(1, "         ""Val"":  ""0""")
            PrintLine(1, "        }")
            PrintLine(1, "      ]")
            PrintLine(1, "    }")
            PrintLine(1, "  ],")
            PrintLine(1, " ""ValDtls"": {")
            If ds.Tables(0).Rows(0)("INVOICE_TYPE") = "EXPORT" Then
                PrintLine(1, "   ""AssVal"": " & Round(ds.Tables(0).Rows(0)("Invoice_qty") * (ds.Tables(0).Rows(0)("Rate") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2) & ",")
            Else
                PrintLine(1, "   ""AssVal"": " & ds.Tables(0).Rows(0)("Totamt") & ",")
            End If
            PrintLine(1, "   ""CgstVal"": " & ds.Tables(0).Rows(0)("cgst") & ",")
            PrintLine(1, "   ""SgstVal"": " & ds.Tables(0).Rows(0)("sgst") & ",")
            If ds.Tables(0).Rows(0)("INVOICE_TYPE") = "EXPORT" Then
                PrintLine(1, "   ""IgstVal"": " & Round((ds.Tables(0).Rows(0)("igst") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2) & ",")
            Else
                PrintLine(1, "   ""IgstVal"": " & ds.Tables(0).Rows(0)("igst") & ",")
            End If
            PrintLine(1, "   ""CesVal"": " & 0 & ", ")
            PrintLine(1, "   ""StCesVal"": " & 0 & ", ")
            PrintLine(1, "   ""Discount"": " & ds.Tables(0).Rows(0)("discount") & ",")
            PrintLine(1, "   ""OthChrg"": " & ds.Tables(0).Rows(0)("tcs") & ",")

            Dim invval As Double = Ceiling(((Round(ds.Tables(0).Rows(0)("Invoice_qty") * (ds.Tables(0).Rows(0)("Rate") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2)) + (Round((ds.Tables(0).Rows(0)("IGST") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2))))

            Dim invval1 As Double = ((Round(ds.Tables(0).Rows(0)("Invoice_qty") * (ds.Tables(0).Rows(0)("Rate") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2)) + (Round((ds.Tables(0).Rows(0)("IGST") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2)))

            If ds.Tables(0).Rows(0)("INVOICE_TYPE") = "EXPORT" Then
                PrintLine(1, "   ""RndOffAmt"": " & Round(invval - invval1, 2) & ",")
            Else
                PrintLine(1, "   ""RndOffAmt"": " & ds.Tables(0).Rows(0)("Round_off") & ",")
            End If

            If ds.Tables(0).Rows(0)("INVOICE_TYPE") = "EXPORT" Then
                PrintLine(1, "   ""TotInvVal"": " & Ceiling(((Round(ds.Tables(0).Rows(0)("Invoice_qty") * (ds.Tables(0).Rows(0)("Rate") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2)) + (Round((ds.Tables(0).Rows(0)("IGST") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2)))) & ",")
            Else
                PrintLine(1, "   ""TotInvVal"": " & ds.Tables(0).Rows(0)("invoice_value") & ",")
            End If

            If ds.Tables(0).Rows(0)("INVOICE_TYPE") = "EXPORT" Then
                PrintLine(1, "   ""TotInvValFc"": " & ((Round(ds.Tables(0).Rows(0)("Invoice_qty") * (ds.Tables(0).Rows(0)("Rate") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2)) + (Round((ds.Tables(0).Rows(0)("IGST") * ds.Tables(0).Rows(0)("Exchange_Rate")), 2))) & "")
            Else
                PrintLine(1, "   ""TotInvValFc"": " & ds.Tables(0).Rows(0)("invoice_Net") & "")
            End If
            PrintLine(1, "  },")
            PrintLine(1, "  ""PayDtls"": {")
            PrintLine(1, "    ""Nm"": "" "" , ")
            PrintLine(1, "    ""Accdet"": "" "",")
            PrintLine(1, "    ""Mode"": "" "",")
            PrintLine(1, "    ""Fininsbr"": "" "",")
            PrintLine(1, "    ""Payterm"": "" "",")
            PrintLine(1, "    ""Payinstr"": "" "",")
            PrintLine(1, "    ""Crtrn"": "" "",")
            PrintLine(1, "    ""Dirdr"": "" "",")
            PrintLine(1, "    ""Crday"":" & 0 & ",")
            PrintLine(1, "    ""Paidamt"":" & 0 & ",")
            PrintLine(1, "    ""Paymtdue"":" & 0 & "")
            PrintLine(1, "  },")
            PrintLine(1, "  ""RefDtls"": {")
            PrintLine(1, "    ""InvRm"": ""TEST"", ")
            PrintLine(1, "    ""DocPerDtls"": {")
            PrintLine(1, "      ""InvStDt"": ""01/08/2020"",")
            PrintLine(1, "      ""InvEndDt"": ""01/08/2020""")
            PrintLine(1, "    },")
            PrintLine(1, "   ""PrecDocDtls"": [")
            PrintLine(1, "      {")
            PrintLine(1, "       ""InvNo"": ""123"" , ")
            PrintLine(1, "       ""InvDt"": ""01/08/2020"", ")
            PrintLine(1, "       ""OthfrefNo"": ""123456""")
            PrintLine(1, "      }")
            PrintLine(1, "    ],")
            PrintLine(1, "    ""ContrDtls"": [")
            PrintLine(1, "       {")
            PrintLine(1, "        ""RecAdvRefr"": "" "",")
            PrintLine(1, "        ""RecAdvDt"": ""01/08/2020"" , ")
            PrintLine(1, "        ""Tendrefr"": "" "",")
            PrintLine(1, "        ""Contrrefr"": "" "",")
            PrintLine(1, "        ""Extrefr"": "" "",")
            PrintLine(1, "        ""Projrefr"": "" "",")
            PrintLine(1, "        ""Porefr"": "" "" , ")
            PrintLine(1, "        ""poRefDt"": ""01/08/2020""")
            PrintLine(1, "      }")
            PrintLine(1, "    ]")
            PrintLine(1, "  },")
            PrintLine(1, " ""AddlDocDtls"": [")
            PrintLine(1, "   {")
            PrintLine(1, "    ""Url"": ""https://einv-apisandbox.nic.in"", ")
            PrintLine(1, "    ""Docs"": ""Test Doc"", ")
            PrintLine(1, "    ""Info"": ""Document Test""")
            PrintLine(1, "   }")
            PrintLine(1, " ],")
            PrintLine(1, " ""ExpDtls"": {")
            PrintLine(1, "   ""ShipBNo"": "" "",")
            PrintLine(1, "   ""ShipBDt"": ""01/08/2020"",")
            If ds.Tables(0).Rows(0)("INVOICE_TYPE") = "EXPORT" Then
                PrintLine(1, "   ""Port"": ""INTUT1"",")
            Else
                PrintLine(1, "   ""Port"": ""  "",")
            End If
            PrintLine(1, "   ""RefClm"": "" "",")
            PrintLine(1, "   ""ForCur"": ""   "",")
            PrintLine(1, "   ""CntCode"": ""  """)
            PrintLine(1, "  }")
            PrintLine(1, "}")


            FileClose(1)



        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Function
    Private Sub einvoice()

        Dim pHelp As New ProcessStartInfo

        Dim cmdargu As String = ""

        pHelp.FileName = Application.StartupPath & "\einvoice\einvoice.exe"

        'cmdargu = tbSINVNo.Text

        cmdargu = tbSINVNo.Text & "||" & eintype & "||"

        pHelp.Arguments = cmdargu




        pHelp.UseShellExecute = True
        pHelp.WindowStyle = ProcessWindowStyle.Normal
        Dim proc As Process = Process.Start(pHelp)
    End Sub
    Private Sub ReadIRN()
        Dim TextLine As String = ""
        FileClose(1)
        FileOpen(1, Application.StartupPath & "\einvoice\LastIRN.txt", OpenMode.Input)   ' Open file.
        Do While Not EOF(1)   ' Loop until end of file.
            TextLine = LineInput(1)   ' Read line into variable.
            tbIRNNo.Text = TextLine   ' Display the line
        Loop
        FileClose(1)   ' Close file.
        'Dim fileReader As String = ""
        'fileReader = My.Computer.FileSystem.ReadAllText(Application.StartupPath & "\einvoice\LastIRN.txt")
        'tbIRNNo.Text = fileReader
    End Sub
    Private Sub ReadAckNo()
        Dim TextLine As String = ""
        FileClose(1)
        FileOpen(1, Application.StartupPath & "\einvoice\AckNo.txt", OpenMode.Input)   ' Open file.
        Do While Not EOF(1)   ' Loop until end of file.
            TextLine = LineInput(1)   ' Read line into variable.
            tbACKNo.Text = TextLine   ' Display the line
        Loop
        FileClose(1)   ' Close file.
        'Dim fileReader As String = ""
        'fileReader = My.Computer.FileSystem.ReadAllText(Application.StartupPath & "\einvoice\AckNo.txt")
        'tbACKNo.Text = fileReader
    End Sub
    Private Sub ReadewbNo()
        Dim TextLine As String = ""
        FileClose(1)
        FileOpen(1, Application.StartupPath & "\einvoice\ewb.txt", OpenMode.Input)   ' Open file.
        Do While Not EOF(1)   ' Loop until end of file.
            TextLine = LineInput(1)   ' Read line into variable.
            tbEwbno.Text = TextLine   ' Display the line
        Loop
        FileClose(1)   ' Close file.
        'Dim fileReader As String = ""
        'fileReader = My.Computer.FileSystem.ReadAllText(Application.StartupPath & "\einvoice\AckNo.txt")
        'tbACKNo.Text = fileReader
    End Sub
    Public Function Eway_Generate(ByVal ds As DataSet)

        Dim mTotAmt As Double = 0
        Dim mDigits As Double = 0
        Dim mRoundOff As Double = 0
        Dim fileName1 As String = "c:\reports\ewaybill.txt"

        Try
            If tbSINVNo.Text.Trim = "" Then Exit Function

            Dim strFileLocation As String = ""

            If ds.Tables(0).Rows.Count = 0 Then Exit Function


            FileClose(1)

            FileOpen(1, fileName1, OpenMode.Output) ' Open file for output.
            PrintLine(1, "{")
            ' Dim t As String = Replace(ds.Tables(0).Rows(0)("irn_NO"), vbCrLf, "")
            PrintLine(1, """Irn"":" & VB.Chr(34) & Replace(ds.Tables(0).Rows(0)("irn_NO"), vbCrLf, "") & VB.Chr(34) & ",")
            PrintLine(1, """Distance"":" & ds.Tables(0).Rows(0)("Distance") & ",")
            If ds.Tables(0).Rows(0)("Trans_Id") <> "" Then
                PrintLine(1, """TransId"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("Trans_Id") & VB.Chr(34) & ",")
                PrintLine(1, """TransName"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("Trans_Name") & VB.Chr(34) & ",")
            End If
            'If ds.Tables(0).Rows(0)("Trans_Name") <> "" Then
            '    PrintLine(1, """TransName"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("Trans_Name") & VB.Chr(34) & ",")
            'End If
            If ds.Tables(0).Rows(0)("LR_NO") <> "" Then
                PrintLine(1, """TransDocNo"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("LR_No") & VB.Chr(34) & ",")
                PrintLine(1, """TransDocDt"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("LR_Date") & VB.Chr(34) & ",")
            End If
            PrintLine(1, """TransMode"":""1"",")
            PrintLine(1, """Vehno"":" & VB.Chr(34) & Replace(ds.Tables(0).Rows(0)("Veh_No"), " ", "") & VB.Chr(34) & ",")
            PrintLine(1, """VehType"":""R"",")
            PrintLine(1, """DispDtls"": {")
            PrintLine(1, "  ""Nm"": ""L.S. MILLS LIMITED UNIT II"",")
            PrintLine(1, "  ""Addr1"": ""#16, CUMBUM ROAD"",")
            PrintLine(1, "  ""Addr2"": ""MUTHUTHEVANPATTY"",")
            PrintLine(1, "  ""Loc"": ""THENI"",")
            PrintLine(1, "  ""Pin"": " & 625534 & ",")
            PrintLine(1, "  ""Stcd"": ""33""")
            PrintLine(1, " }")
            PrintLine(1, "}")

            FileClose(1)



        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Function
    'Public Function EwaySchema_Generate(ByVal ds As DataSet)

    '    Dim mTotAmt As Double = 0
    '    Dim mDigits As Double = 0
    '    Dim mRoundOff As Double = 0
    '    Dim writer As StreamWriter =
    '        New StreamWriter("c:\reports\ewaybill.txt", 1)


    '    Try
    '        If tbSINVNo.Text.Trim = "" Then Exit Function

    '        Dim strFileLocation As String = ""

    '        If ds.Tables(0).Rows.Count = 0 Then Exit Function


    '        FileClose(1)


    '        writer.WriteLine("{")
    '        writer.WriteLine("""Irn"":" & VB.Chr(34) & Trim(ds.Tables(0).Rows(0)("irn_NO")) & VB.Chr(34) & ",")
    '        writer.WriteLine("""Distance"":" & ds.Tables(0).Rows(0)("Distance") & ",")
    '        writer.WriteLine("""TransId"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("Trans_Id") & VB.Chr(34) & ",")
    '        writer.WriteLine("""TransName"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("Trans_Name") & VB.Chr(34) & ",")
    '        writer.WriteLine("""TransDocNo"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("LR_No") & VB.Chr(34) & ",")
    '        writer.WriteLine("""TransDocDt"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("LR_Date") & VB.Chr(34) & ",")
    '        writer.WriteLine("""TransMode"":" & 1 & ",")
    '        writer.WriteLine("""Vehno"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("Veh_No") & VB.Chr(34) & ",")
    '        writer.WriteLine("""VehType"":""R"",")
    '        writer.WriteLine("""DispDtls"": {")
    '        writer.WriteLine("   ""Nm"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("Delv_Add1") & VB.Chr(34) & ",")
    '        writer.WriteLine("   ""Addr1"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("Delv_Add2") & VB.Chr(34) & ",")
    '        writer.WriteLine("   ""Addr2"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("Delv_Add3") & VB.Chr(34) & ",")
    '        writer.WriteLine("   ""Loc"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("Delv_city") & VB.Chr(34) & ",")
    '        writer.WriteLine("   ""Pin"":" & ds.Tables(0).Rows(0)("Delv_pincode") & ",")
    '        writer.WriteLine("   ""Stcd"":" & VB.Chr(34) & ds.Tables(0).Rows(0)("Statecode") & VB.Chr(34) & "")
    '        writer.WriteLine("}")
    '        writer.WriteLine("}")


    '        FileClose(1)



    '    Catch ex As Exception
    '        Show_Message(ex.Message)
    '    End Try
    'End Function
    Public Sub SetReportPageSize(ByVal mPaperSize As String, ByVal PaperOrientation As Integer)
        Dim crysrep As New ReportDocument
        Try
            Dim ObjPrinterSetting As New System.Drawing.Printing.PrinterSettings
            Dim PkSize As New System.Drawing.Printing.PaperSize
            ObjPrinterSetting.PrinterName = "EPSON LQ-2090 ESC/P2"
            For i As Integer = 0 To ObjPrinterSetting.PaperSizes.Count - 1
                If ObjPrinterSetting.PaperSizes.Item(i).PaperName = mPaperSize.Trim Then
                    PkSize = ObjPrinterSetting.PaperSizes.Item(i)
                    Exit For
                End If
            Next

            If PkSize IsNot Nothing Then
                Dim myAppPrintOptions As CrystalDecisions.CrystalReports.Engine.PrintOptions = crysrep.PrintOptions
                myAppPrintOptions.PrinterName = "EPSON LQ-2090 ESC/P2"
                myAppPrintOptions.PaperSize = CType(PkSize.RawKind, CrystalDecisions.Shared.PaperSize)
                crysrep.PrintOptions.PaperOrientation = IIf(PaperOrientation = 1,
                                        CrystalDecisions.Shared.PaperOrientation.Portrait,
                                        CrystalDecisions.Shared.PaperOrientation.Landscape)
            End If
            PkSize = Nothing
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Private Sub btnDoc_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDoc.Click
        Try
            'If Trim(tbExNo.Text) = "" Then Exit Sub
            'Dim oWord As Word.Application = CreateObject("Word.Application")
            'Dim docFile As String = mvarReportPath & "\WORD\FORM_ARE_1.doc"

            'Dim oDoc As Word.Document = oWord.Documents.Open(docFile)
            'oWord.Visible = True
            'SearchAndRep("[EPCG NO]", "RAJA", oWord)
            ''oDoc.SaveAs(docFile, True)

            ''oDoc.Close()
            ''oDoc = Nothing
            ''oWord.Application.Quit()
            ''oWord = Nothing
            Gizza_INVOICE_PRINT()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub SearchAndRep(ByVal FindText, ByVal ReplaceText, ByVal WordApp)
        With WordApp.Selection.Find
            .ClearFormatting()
            .Replacement.ClearFormatting()
            .Text = FindText
            .Replacement.Text = ReplaceText
            .Forward = True
            .Wrap = Word.WdFindWrap.wdFindContinue
            .Format = False
            .MatchCase = True
            .MatchWholeWord = True
            .MatchWildcards = False
            .MatchSoundsLike = False
            .MatchAllWordForms = False
            .Execute(Replace:=Word.WdReplace.wdReplaceAll)
        End With
    End Sub

    Private Sub btnPK_PINVNo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_PINVNo.Click
        Try
            mPINVRevNo = ""
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing
            ds = mobjclsProformaInvoice.GetProformaInvoiceDetails("", cbxSalesType.Text, cbxCustType.Text, "", "", "", "", "ALL")
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Proforma Invoice Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            tbPINVNo.Text = dtPickList.Rows(0)("PINV_No")
            dtpPINVDate.Value = dtPickList.Rows(0)("PINV_Date")
            cbxCustType.Text = dtPickList.Rows(0)("Cust_Type")
            cbxSalesType.Text = dtPickList.Rows(0)("Prod_Sales_Type")
            cbxSecLocation.Text = dtPickList.Rows(0)("Sec_Location_Code")
            mPINVRevNo = dtPickList.Rows(0)("Revision_No")
            ds = Nothing
            ds = New DataSet
            ds = mobjclsProformaInvoice.GetProformaInvoiceDetails(tbPINVNo.Text, "", "", "1", "", mPINVRevNo, "")
            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub
            tbCustCode.Text = ds.Tables(0).Rows(0)("Cust_Code")
            tbCustName.Text = ds.Tables(0).Rows(0)("Cust_Name")
            tbAgentCode.Text = ds.Tables(0).Rows(0)("Agent_Code")
            tbAgentName.Text = ds.Tables(0).Rows(0)("Agent_Name")
            tbSONo.Text = ds.Tables(0).Rows(0)("SO_No")
            dtpSODate.Value = ds.Tables(0).Rows(0)("SO_Date")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub cbxInvBasedOn_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbxInvBasedOn.LostFocus
        Try
            Invoice_Based_Enabled()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub cbxInvBasedOn_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbxInvBasedOn.SelectedIndexChanged
        Try
            Invoice_Based_Enabled()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Public Sub Invoice_Based_Enabled()
        Try
            If cbxInvBasedOn.Text = "SO BASED" Then
                tbPINVNo.Text = ""
                dtpPINVDate.Value = Now
                btnPK_SO.Enabled = True
                btnPK_PINVNo.Enabled = False
            ElseIf cbxInvBasedOn.Text = "PROFORMA BASED" Then
                tbPINVNo.Text = ""
                dtpPINVDate.Value = Now
                btnPK_SO.Enabled = False
                btnPK_PINVNo.Enabled = True
            ElseIf cbxInvBasedOn.Text = "DIRECT" Then
                'tbSONo.Text = ""
                tbPINVNo.Text = ""
                dtpSODate.Value = Now
                dtpPINVDate.Value = Now
                btnPK_SO.Enabled = False
                btnPK_PINVNo.Enabled = False
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPK_Calc_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_Calc.Click
        Try
            frmRevCalc.ShowInTaskbar = False
            frmRevCalc.ShowDialog()
            frmRevCalc.StartPosition = FormStartPosition.CenterScreen
            frmRevCalc.BringToFront()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub tbRate_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbRate.LostFocus
        'Try
        '    Dim iRate As Double = 0

        '    If Val(tbRate.Text) <= 0 Then Exit Sub

        '    If Val(Trim(tbAgentComm.Text)) < 0 Then
        '        iRate = Val(tbRate.Text)
        '        tbRate.Text = iRate + (iRate * (Val(Trim(tbAgentComm.Text)) / 100))
        '    End If
        'Catch ex As Exception
        '    Show_Message(ex.Message)
        'End Try
    End Sub

    Private Sub btnGatePass_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGatePass.Click
        Try
            If (tbSINVNo.Text) = "" Then Exit Sub
            frmSalesGatePass.Fill_Screen_Details(tbSINVNo.Text, cbxInvBasedOn.Text, dtpEntryDate.Value, RemoveSingleQuotes(tbCustName.Text),
                                                 RemoveSingleQuotes(tbLotNo.Text) & vbNewLine & Trim(c1fgItems.get_TextMatrix(1, 5)) & " " & Round(Val(Trim(c1fgItems.get_TextMatrix(1, 6))), 0) _
                                                 & vbNewLine & RemoveSingleQuotes(tbBagNo.Text), cbxSecLocation.Text,
                                                 RemoveSingleQuotes(tbVehNo.Text),
                                                  IIf(Trim(c1fgItems.get_TextMatrix(1, 3)) = "", c1fgItems.get_TextMatrix(1, 4), c1fgItems.get_TextMatrix(1, 3)))
            frmSalesGatePass.ShowInTaskbar = False
            frmSalesGatePass.ShowDialog()
            frmSalesGatePass.StartPosition = FormStartPosition.CenterScreen
            frmSalesGatePass.BringToFront()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnDeliveryAddress_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDeliveryAddress.Click
        Try
            ' If Trim(tbCustCode.Text) = "" Or Trim(tbShipToID.Text) = "" Or Val(Trim(tbShipToID.Text)) = 0 Then Exit Sub

            If Trim(tbCustCode.Text) = "" Then Exit Sub

            SSQL = ""
            SSQL = "select Delv_Add1,Delv_Add2,Delv_Add3,Delv_City,Delv_State from Customer_Delivery_Address"
            SSQL &= " Where Comp_Code='" & mvarCompanyCode & "'"
            SSQL &= " And Cust_Code='" & Trim(tbCustCode.Text) & "'"
            SSQL &= " And sno='" & Trim(tbShipToID.Text) & "'"

            ds = Nothing
            ds = New DataSet

            ds = ReturnMultipleValue(SSQL, "eCommon")

            If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

            tbNotesDesc.Text = ""

            tbNotesDesc.Text = tbNotesDesc.Text & vbNewLine & Trim(ds.Tables(0).Rows(0)(0))
            tbNotesDesc.Text = tbNotesDesc.Text & vbNewLine & Trim(ds.Tables(0).Rows(0)(1))
            tbNotesDesc.Text = tbNotesDesc.Text & vbNewLine & Trim(ds.Tables(0).Rows(0)(2))
            tbNotesDesc.Text = tbNotesDesc.Text & vbNewLine & Trim(ds.Tables(0).Rows(0)(3))
            tbNotesDesc.Text = tbNotesDesc.Text & vbNewLine & Trim(ds.Tables(0).Rows(0)(4))
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub


    Private Sub btnPK_Packing_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_Packing.Click
        Try
            ds = Nothing
            ds = New DataSet
            dt = Nothing
            dt = New DataTable
            dtPickList = Nothing
            If cbxSalesType.Text = "FABRIC" Then
                ds = mobjclsSalesInvoice.GetFabPackingDetails("", "1", "", "SALES", cbxSecLocation.Text)
            Else
                Exit Sub
            End If
            dt = ds.Tables(0)
            Dim frmPickList1 As New frmSearchList
            frmPickList1.Text = "Fabric Packing Details"
            frmPickList1.Set_Information_Dataset(ds)
            frmPickList1.ShowInTaskbar = False
            frmPickList1.ShowDialog()
            frmPickList1.StartPosition = FormStartPosition.CenterScreen
            frmPickList1.BringToFront()
            If dtPickList Is Nothing OrElse dtPickList.Rows.Count <= 0 Then Exit Sub
            tbPackNo.Text = dtPickList.Rows(0)("Pack_No")
            dtpPackDate.Value = dtPickList.Rows(0)("Pack_Date")
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnPK_PackingList_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPK_PackingList.Click
        Try
            If Trim(tbPackNo.Text) = "" Then Exit Sub
            If cbxSalesType.Text = "FABRIC" Then

                Dim mSupName As String = ""
                Dim mDCDate As String = ""
                Dim mDCNo As String = ""
                Dim mLorryNo As String = ""

                SSQL = ""
                SSQL = "Select DC_No,DC_Date,Sup_Name,Lorry_No From eWeaving..WPP_DeliveryChallan_Main "
                SSQL &= " Where Comp_Code='" & mvarCompanyCode & "'"
                SSQL &= " And Location_Code='" & cbxSecLocation.Text & "'"
                SSQL &= " And Fin_Year_Code='" & mvarFinYearCode & "'"
                SSQL &= " And Pack_No='" & Trim(tbPackNo.Text) & "'"

                ds = Nothing
                ds = New DataSet
                ds = ReturnMultipleValue(SSQL, "eWeaving")

                If ds.Tables(0).Rows.Count > 0 Then
                    mSupName = ds.Tables(0).Rows(0)("Sup_Name")
                    mDCDate = Format(CDate(ds.Tables(0).Rows(0)("DC_Date")), "dd/MM/yyyy")
                    mDCNo = ds.Tables(0).Rows(0)("DC_No")
                    mLorryNo = ds.Tables(0).Rows(0)("Lorry_No")
                End If

                ds = Nothing
                ds = New DataSet
                ds = mobjclsSalesInvoice.GetFabPackingDetails(Trim(tbPackNo.Text), "", "", "PACK", cbxSecLocation.Text)
                If ds.Tables(0).Rows.Count <= 0 Then Exit Sub
                Dim crysrep As New ReportDocument
                Dim crysview As New frmRepView
                Dim strFileLocation As String = mvarReportPath & "\REPORTS\REGULAR\WEAVING\Packing_List.rpt"
                crysview.Text = "Packing List"
                crysrep.Load(strFileLocation)
                crysrep.SetDataSource(ds.Tables(0))
                crysview.CrystalReportViewer1.ReportSource = crysrep
                crysview.CrystalReportViewer1.Refresh()
                ' ''crysrep.PrintToPrinter(1, False, 1, 1)
                crysrep.DataDefinition.FormulaFields("Party_Name").Text = "'" + mSupName + "'"
                crysrep.DataDefinition.FormulaFields("Date_1").Text = "'" + mDCDate + "'"
                crysrep.DataDefinition.FormulaFields("DC_No").Text = "'" + mDCNo + "'"
                crysrep.DataDefinition.FormulaFields("Lorry_No").Text = "'" + mLorryNo + "'"
                crysview.CrystalReportViewer1.Zoom(75)
                crysview.Show()
            Else
                Exit Sub
            End If
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub

    Private Sub btnDirectPrint_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDirectPrint.Click

        Try

            GST_INVOICE_PRINT()
            'direct_print()
            'AxReportViewer1.FileName = fileName
            'AxReportViewer1.ReportTitle = "Sales Invoice"
            'AxReportViewer1.ShowPrintPreview()



        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub GST_INVOICE_PRINT()

        Dim mTotAmt As Double = 0
        Dim mDigits As Double = 0
        Dim mRoundOff As Double = 0
        Dim mtax As Double = 0

        Try
            If tbSINVNo.Text.Trim = "" Then Exit Sub
            Dim dsTax As New DataSet
            Dim dsMain As New DataSet
            Dim strFileLocation As String = ""

            dsMain = Nothing
            dsMain = New DataSet
            dsMain = ReturnMultipleValue(SSQL, "esales")

            dsMain = mobjclsSalesInvoice.GetSalesInvoiceDetails(RemoveSingleQuotes(tbSINVNo.Text), "", "", "", "", "")
            If dsMain.Tables(0).Rows.Count <= 0 Then Exit Sub
            dsTax = mobjclsSalesInvoice.GetSalesInvoiceDetails(RemoveSingleQuotes(tbSINVNo.Text), "", "", "", "", "TAX")
            Dim crysrep As New ReportDocument
            Dim crysview As New frmRepView
            Dim mAmountWords As String = ""




            Dim mdlgResult As DialogResult
            mdlgResult = MessageBox.Show("Please Select the report type from the list below." & vbNewLine & "[YES - Local Invoice]" & vbNewLine &
                                         "[No - Export Invoice]" & vbNewLine & "[Cancel - Report Cancel]" _
                                         , msgboxTitle, MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information)

            If mdlgResult = Windows.Forms.DialogResult.Yes Then

                If dsMain.Tables(0).Rows.Count <= 0 Then Exit Sub

                If dsTax.Tables(0).Rows.Count > 0 Then

                    mtax = Round(Val(dsTax.Tables(0).Rows(0)("TCD_Amount")), 2)


                End If


                If dsMain.Tables(0).Rows(0)("invoice_type") <> "EXPORT" Then

                    If dsMain.Tables(0).Rows(0)("cust_others_1") = "" Or dsMain.Tables(0).Rows(0)("cust_others_2") = "" Or dsMain.Tables(0).Rows(0)("prod_others_1") = "" Then
                        Show_Message(" Please Entre party GstNo,State code in customer master And HSNCode in Product Master Then Print")
                        Exit Sub
                    End If

                End If

                If mvarLocationCode = "GUJARAT" Then
                        strFileLocation = mvarReportPath & "\REPORTS\REGULAR\SALES\Sales_Invoice_GUJARAT_A4_new.rpt"
                    ElseIf mvarLocationCode = "UNIT II" Then

                        strFileLocation = mvarReportPath & "\REPORTS\REGULAR\SALES-UII\Sales_Invoice_Local_A4_new.rpt"

                ElseIf mvarLocationCode = "SPINNING" And dsMain.Tables(0).Rows(0)("invoice_type") = "EXPORT" Then
                    strFileLocation = mvarReportPath & "\REPORTS\REGULAR\SALES\Sales_Invoice_Local_A4_QR.rpt"


                Else

                    ''   strFileLocation = mvarReportPath & "\REPORTS\REGULAR\SALES\Sales_Invoice_Export_A4_QR.rpt"


                    strFileLocation = mvarReportPath & "\REPORTS\REGULAR\SALES\Sales_Invoice_Local_A4_QR.rpt"



                    End If

                    mAmountWords = ""

                    If Val(dsMain.Tables(0).Rows(0)("Exchange_Rate")) > 0 Then
                    mTotAmt = Round((Val(dsMain.Tables(0).Rows(0)("Invoice_Value") + Val(dsMain.Tables(0).Rows(0)("Round_Off"))) * Val(dsMain.Tables(0).Rows(0)("Exchange_Rate"))))
                Else
                        mTotAmt = Val(dsMain.Tables(0).Rows(0)("Invoice_Value"))
                    End If
                    mDigits = Val(mTotAmt) - Int(mTotAmt)
                    mDigits = Round(mDigits, 2)

                    If mDigits >= 0.5 Then
                        mTotAmt = Int(mTotAmt) + 1
                        mRoundOff = 1 - mDigits
                    Else
                        mTotAmt = Val(mTotAmt) - mDigits
                        mRoundOff = -mDigits
                    End If

                    mAmountWords = AmtInINR(mTotAmt)
                ElseIf mdlgResult = Windows.Forms.DialogResult.No Then
                    strFileLocation = mvarReportPath & "\REPORTS\REGULAR\SALES\Sales_Invoice_Export.rpt"
                    mAmountWords = ""
                    mAmountWords = AmtInUSD(dsMain.Tables(0).Rows(0)("Invoice_Value"))
                ElseIf mdlgResult = Windows.Forms.DialogResult.Cancel Then
                    Exit Sub
            End If

            Dim qrfile As String = Val(Mid(tbSINVNo.Text, 5)) & ".jpg"


            crysview.Text = "Sales Invoice"
            crysrep.Load(strFileLocation)
            crysrep.SetDataSource(dsMain.Tables(0))
            SetReportPageSize("10x12", 1)
            If dsTax.Tables(0).Rows.Count >= 1 Then
                crysrep.Subreports.Item("Proforma_Invoice_Tax").SetDataSource(dsTax.Tables(0))
            End If

            crysrep.DataDefinition.FormulaFields("Amount_Words").Text = "'" + mAmountWords + "'"

            crysrep.DataDefinition.FormulaFields("Inv_Val").Text = mTotAmt

            crysrep.DataDefinition.FormulaFields("TCD_Amount").Text = mtax

            crysrep.DataDefinition.FormulaFields("mroundoff").Text = mRoundOff


            crysrep.DataDefinition.FormulaFields("img").Text = "'" + Application.StartupPath & "\einvoice\qrcodes\" & qrfile & "'"

            crysview.CrystalReportViewer1.ReportSource = crysrep
            crysview.CrystalReportViewer1.Refresh()
            ' ''crysrep.PrintToPrinter(1, False, 1, 1)
            crysview.CrystalReportViewer1.Zoom(75)
            crysview.Show()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try

    End Sub
    Private Sub Gizza_INVOICE_PRINT()

        Dim mTotAmt As Double = 0
        Dim mDigits As Double = 0
        Dim mRoundOff As Double = 0

        Try
            If tbSINVNo.Text.Trim = "" Then Exit Sub
            Dim dsTax As New DataSet
            Dim dsMain As New DataSet
            Dim strFileLocation As String = ""
            dsTax = Nothing
            dsMain = Nothing

            dsMain = mobjclsSalesInvoice.GetSalesInvoiceDetails(RemoveSingleQuotes(tbSINVNo.Text), "", "", "", "", "")
            If dsMain.Tables(0).Rows.Count <= 0 Then Exit Sub
            dsTax = mobjclsSalesInvoice.GetSalesInvoiceDetails(RemoveSingleQuotes(tbSINVNo.Text), "", "", "", "", "TAX")
            Dim crysrep As New ReportDocument
            Dim crysview As New frmRepView
            Dim mAmountWords As String = ""

            Dim mdlgResult As DialogResult
            mdlgResult = MessageBox.Show("Please Select the report type from the list below." & vbNewLine & "[YES - Local Invoice]" & vbNewLine &
                                         "[No - Export Invoice]" & vbNewLine & "[Cancel - Report Cancel]" _
                                         , msgboxTitle, MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information)

            If mdlgResult = Windows.Forms.DialogResult.Yes Then

                If dsMain.Tables(0).Rows.Count <= 0 Then Exit Sub

                If dsMain.Tables(0).Rows(0)("INVOICE_TYPE") <> "EXPORT" Then

                    If dsMain.Tables(0).Rows(0)("cust_others_1") = "" Or dsMain.Tables(0).Rows(0)("cust_others_2") = "" Or dsMain.Tables(0).Rows(0)("prod_others_1") = "" Then
                        Show_Message(" Please Enter party gst details And product hsn code And Then Print")
                        Exit Sub
                    End If

                End If


                If mvarLocationCode = "GUJARAT" Then
                        strFileLocation = mvarReportPath & "\REPORTS\REGULAR\SALES\Sales_Invoice_GUJARAT_A4_new.rpt"
                    ElseIf mvarLocationCode = "UNIT II" Then

                        strFileLocation = mvarReportPath & "\REPORTS\REGULAR\SALES-UII\Sales_Invoice_Local_A4_new.rpt"

                    Else

                        strFileLocation = mvarReportPath & "\REPORTS\REGULAR\SALES\Sales_Invoice_Local_A4_Gizza.rpt"

                    End If


                    mAmountWords = ""

                    If Val(dsMain.Tables(0).Rows(0)("Exchange_Rate")) > 0 Then
                        mTotAmt = Round(Val(dsMain.Tables(0).Rows(0)("Invoice_Value")) * Val(dsMain.Tables(0).Rows(0)("Exchange_Rate")), 2)
                    Else
                        mTotAmt = Val(dsMain.Tables(0).Rows(0)("Invoice_Value"))
                    End If
                    mDigits = Val(mTotAmt) - Int(mTotAmt)
                    mDigits = Round(mDigits, 2)

                    If mDigits >= 0.5 Then
                        mTotAmt = Int(mTotAmt) + 1
                        mRoundOff = 1 - mDigits
                    Else
                        mTotAmt = Val(mTotAmt) - mDigits
                        mRoundOff = -mDigits
                    End If

                    mAmountWords = AmtInINR(mTotAmt)
                ElseIf mdlgResult = Windows.Forms.DialogResult.No Then
                    strFileLocation = mvarReportPath & "\REPORTS\REGULAR\SALES\Sales_Invoice_Export.rpt"
                    mAmountWords = ""
                    mAmountWords = AmtInUSD(dsMain.Tables(0).Rows(0)("Invoice_Value"))
                ElseIf mdlgResult = Windows.Forms.DialogResult.Cancel Then
                    Exit Sub
            End If

            Dim qrfile As String = Val(Mid(tbSINVNo.Text, 5)) & ".jpg"


            crysview.Text = "Sales Invoice"
            crysrep.Load(strFileLocation)
            crysrep.SetDataSource(dsMain.Tables(0))
            SetReportPageSize("10x12", 1)
            'If dsTax.Tables(0).Rows.Count >= 1 Then
            crysrep.Subreports.Item("Proforma_Invoice_Tax").SetDataSource(dsTax.Tables(0))
            'End If
            crysrep.DataDefinition.FormulaFields("Amount_Words").Text = "'" + mAmountWords + "'"
            crysrep.DataDefinition.FormulaFields("img").Text = "'" + Application.StartupPath & "\einvoice\qrcodes\" & qrfile & "'"
            crysview.CrystalReportViewer1.ReportSource = crysrep
            crysview.CrystalReportViewer1.Refresh()
            ' ''crysrep.PrintToPrinter(1, False, 1, 1)
            crysview.CrystalReportViewer1.Zoom(75)
            crysview.Show()
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Public Function IsFileOpen(ByVal xFileName As String, ByVal xFileChannel As Integer) As Boolean
        ' ************************************************************
        ' * Function: IsFileOpen
        ' * Purpose:  To determine if a file is already open.
        ' *           Can be used to determine if a file should be closed.
        ' * Syntax:
        ' *     Dim bResult as Boolean
        ' * 
        ' *     bResult = IsFileOpen("C:\Test.txt", 1) 
        ' * 
        ' *     OR
        ' * 
        ' *     If IsFileOpen("C:\Test.txt", 1) = True Then
        ' *         Microsoft.VisualBasic.FileClose(1)
        ' *     End If
        ' * 
        ' ************************************************************
        Try
            Microsoft.VisualBasic.FileOpen(xFileChannel, xFileName, OpenMode.Input, OpenAccess.Read, OpenShare.Default)
        Catch
            ' File Already Open Error Number = 55
            If Trim(Err.Number.ToString) = "55" Then
                Return True
            Else
                Return False
            End If
        End Try
    End Function
    Public Function PText_Align(ByRef StrActualTxt As String, ByRef StrAlign As String, Optional ByVal IntTxtSize As Integer = 75) As String

        Dim IntStrLen As Long
        Dim StrPrintTxt As String

        IntStrLen = Len(StrActualTxt)

        If IntStrLen > IntTxtSize Then
            StrPrintTxt = VB.Left(StrActualTxt, IntTxtSize)

            IntStrLen = IntTxtSize
        Else
            StrPrintTxt = StrActualTxt
        End If

        If StrAlign = "L" Then
            PText_Align = StrPrintTxt + Space(IntTxtSize - IntStrLen)
        ElseIf StrAlign = "R" Then
            PText_Align = Space(IntTxtSize - IntStrLen) + StrPrintTxt
        ElseIf StrAlign = "C" Then
            PText_Align = Space((IntTxtSize - IntStrLen) / 2) + StrPrintTxt + Space((IntTxtSize - IntStrLen) / 2)
        End If
    End Function

    Public Function stuff_sp(ByVal STR1 As Object, ByVal size1 As Long, ByVal lr As String) As String
        If STR1 = 0 Or IsDBNull(STR1) Then
            STR1 = ""
            '     str1 = Format(str1, "#0.00")
        ElseIf IsNumeric(STR1) > 0 Then
            STR1 = Format(STR1, "#######0.00")
        End If

        Dim tstr, ltstr
        tstr = Trim(STR1)
        ltstr = Len(tstr)

        If ltstr >= size1 Then
            stuff_sp = Mid(tstr, 1, size1)
        Else
            If lr = "L" Then
                stuff_sp = Space(size1 - ltstr) + tstr
            ElseIf lr = "R" Then
                stuff_sp = tstr + Space(size1 - ltstr)
            Else
                stuff_sp = Space((size1 - ltstr) / 2) + tstr + Space((size1 - ltstr) / 2)
            End If
        End If
        Return stuff_sp
    End Function

    Private Sub tbDisper_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbDisper.LostFocus
        tbDisRate.Text = Round((Val(tbRate.Text) * Val(tbDisper.Text)) / 100, 2)
    End Sub

    Private Sub tbDisper_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles tbDisper.TextChanged
        tbDisRate.Text = Round((Val(tbRate.Text) * Val(tbDisper.Text)) / 100, 2)
    End Sub

    Private Sub direct_print()
        Dim mTotAmt As Double = 0
        Dim mDigits As Double = 0
        Dim mRoundOff As Double = 0

        Try
            If tbSINVNo.Text.Trim = "" Then Exit Sub
            Dim dsTax As New DataSet
            Dim dsMain As New DataSet
            Dim strFileLocation As String = ""
            dsTax = Nothing
            dsMain = Nothing

            dsMain = mobjclsSalesInvoice.GetSalesInvoiceDetails(RemoveSingleQuotes(tbSINVNo.Text), "", "", "", "", "")
            If dsMain.Tables(0).Rows.Count <= 0 Then Exit Sub
            dsTax = mobjclsSalesInvoice.GetSalesInvoiceDetails(RemoveSingleQuotes(tbSINVNo.Text), "", "", "", "", "TAX")

            Dim mAmountWords As String = ""
            mAmountWords = ""

            If Val(dsMain.Tables(0).Rows(0)("Exchange_Rate")) > 0 Then
                mTotAmt = Round(Val(dsMain.Tables(0).Rows(0)("Invoice_Value")) * Val(dsMain.Tables(0).Rows(0)("Exchange_Rate")), 2)
            Else
                mTotAmt = Val(dsMain.Tables(0).Rows(0)("Invoice_Value"))
            End If

            mDigits = Val(mTotAmt) - Int(mTotAmt)
            mDigits = Round(mDigits, 2)

            If mDigits >= 0.5 Then
                mTotAmt = Int(mTotAmt) + 1
                mRoundOff = 1 - mDigits
            Else
                mTotAmt = Val(mTotAmt) - mDigits
                mRoundOff = -mDigits
            End If

            mAmountWords = AmtInINR(mTotAmt)

            FileClose(1)

            ' FileOpen(1, fileName, OpenMode.Output) ' Open file for output.
            PrintLine(1, VB.ChrW(27) & VB.ChrW(67) & VB.ChrW(72))
            'PrintLine(1, VB.ChrW(27) & VB.ChrW(69)) 'Empasized
            PrintLine(1, " ")
            'PrintLine(1, " ")
            'PrintLine(1, TAB(61), VB.Chr(14) & dsMain.Tables(0).Rows(0)("SINV_NO"))
            PrintLine(1, TAB(63), " " & dsMain.Tables(0).Rows(0)("SINV_NO"))
            PrintLine(1, " ")
            'PrintLine(1, TAB(61), VB.Chr(14) & dsMain.Tables(0).Rows(0)("SINV_Date"))
            PrintLine(1, TAB(63), " " & dsMain.Tables(0).Rows(0)("SINV_Date"))
            PrintLine(1, " ")
            PrintLine(1, " ")
            PrintLine(1, SPC(45), "Range    : " + "D.No.7, Shastri Street " + "Code: 08")
            PrintLine(1, SPC(56), "NRT Nagar, Theni - 625 531")
            PrintLine(1, SPC(45), "Division : " + "Opp.Rajendra Theatre,")
            PrintLine(1, SPC(56), "Dindigul -II Division " + "Code: 09")
            PrintLine(1, SPC(47), "/6302", SPC(4), "Commissionarate : " + "Madurai " + "Code: 24")
            PrintLine(1, SPC(56), "PAN NO          : " + "AAACL3081D ")
            PrintLine(1, SPC(30), " 30/2004 Dt. 09.07.2004  As amended 11/2013 Dt. 01.03.2013")
            PrintLine(1)
            'PrintLine(1, SPC(40), " L.R. No :" & dsMain.Tables(0).Rows(0)("LR_No") _
            '                 & " Dt." & dsMain.Tables(0).Rows(0)("LR_Date"))

            'PrintLine(1, " ")
            'PrintLine(1, " ")

            PrintLine(1, SPC(2), UCase(Trim(dsMain.Tables(0).Rows(0)("Cust_Name"))))
            PrintLine(1, SPC(2), UCase(Trim(dsMain.Tables(0).Rows(0)("Cust_Add1"))))
            If Trim(dsMain.Tables(0).Rows(0)("Cust_Add2")) <> "" Then
                PrintLine(1, SPC(2), UCase(Trim(dsMain.Tables(0).Rows(0)("Cust_Add2"))))
            Else
                PrintLine(1, " ")
            End If
            If Trim(dsMain.Tables(0).Rows(0)("Cust_Add3")) <> "" Then
                PrintLine(1, SPC(2), UCase(Trim(dsMain.Tables(0).Rows(0)("Cust_Add3"))))
            Else
                PrintLine(1, " ")
            End If

            PrintLine(1, SPC(2), Trim(dsMain.Tables(0).Rows(0)("Cust_City")), SPC(3), Trim(dsMain.Tables(0).Rows(0)("Cust_Pincode")))
            PrintLine(1, SPC(2), Trim(dsMain.Tables(0).Rows(0)("Cust_State")), SPC(3), Trim(dsMain.Tables(0).Rows(0)("Cust_Country")))
            'PrintLine(1, SPC(5), "TIN : " & Trim(dsMain.Tables(0).Rows(0)("Cust_TIN_No")), SPC(28), " Vehicle No: " & Trim(dsMain.Tables(0).Rows(0)("Veh_No")))
            PrintLine(1, SPC(2), "TIN : " & Trim(dsMain.Tables(0).Rows(0)("Cust_TIN_No")), SPC(1), "PAN : " & Trim(dsMain.Tables(0).Rows(0)("Cust_Pan_No")), SPC(15), "L.R. No    : " & dsMain.Tables(0).Rows(0)("LR_No") & " Dt." & dsMain.Tables(0).Rows(0)("LR_Date"))
            PrintLine(1, SPC(2), "CST : " & Trim(dsMain.Tables(0).Rows(0)("Cust_CST_No")), SPC(3), " " & Trim(dsMain.Tables(0).Rows(0)("Cust_CST_Date")), SPC(22), "Vehicle No : " & Trim(dsMain.Tables(0).Rows(0)("Veh_No")))

            'PrintLine(1, " ")
            PrintLine(1, SPC(20), Mid(Trim(dsMain.Tables(0).Rows(0)("Cust_Item_Desc")), 1, 61))
            PrintLine(1, SPC(16), Mid(Trim(dsMain.Tables(0).Rows(0)("Cust_Item_Desc")), 62, 70))
            If Mid(Trim(dsMain.Tables(0).Rows(0)("Cust_Item_Desc")), 132, 150) = "" Then
                PrintLine(1, " ")
            Else
                PrintLine(1, SPC(7), Mid(Trim(dsMain.Tables(0).Rows(0)("Cust_Item_Desc")), 132, 150))
            End If

            PrintLine(1, " ")
            PrintLine(1, " ")
            PrintLine(1, SPC(3), Trim(dsMain.Tables(0).Rows(0)("Packing_Mode")), SPC(53), Trim(dsMain.Tables(0).Rows(0)("UOM_Code")))
            PrintLine(1, " ")
            PrintLine(1, TAB(3), Trim(dsMain.Tables(0).Rows(0)("No_Of_Items")) _
                      , TAB(14), IIf(dsMain.Tables(0).Rows(0)("Total_Gross_Wt") = 0, Format(CType(Trim(dsMain.Tables(0).Rows(0)("Total_Net_Wt")), Double), "#####0.000"), Format(CType(Trim(dsMain.Tables(0).Rows(0)("Total_Gross_Wt")), Double), "#####0.000")) _
                , TAB(42), Format(CType(Trim(dsMain.Tables(0).Rows(0)("Total_Net_Wt")), Double), "#####0.000") _
                , TAB(57), Format(CType(Trim(dsMain.Tables(0).Rows(0)("Rate_Per_Qty")), Double), "#0.00") _
                , TAB(77), stuff_sp(Format(Val(dsMain.Tables(0).Rows(0)("Total_Net_Wt")) * Val(dsMain.Tables(0).Rows(0)("Rate_Per_Qty")), "#.00"), 10, "L"))

            PrintLine(1, " ")
            PrintLine(1, " ")
            PrintLine(1, SPC(5), "Bag Serial No: " & Trim(dsMain.Tables(0).Rows(0)("bag_No")) _
                      , TAB(77), stuff_sp(Format(Val(dsMain.Tables(0).Rows(0)("Total_Net_Wt")) * Val(dsMain.Tables(0).Rows(0)("Rate_Per_Qty")), "#.00"), 10, "L"))

            'PrintLine(1, VB.ChrW(27) & VB.ChrW(70)) 'cancel empasized

            PrintLine(1, " ")

            PrintLine(1, SPC(5), IIf(UCase(Trim(dsMain.Tables(0).Rows(0)("Against_Form"))) = "NONE", " ", UCase(Trim(dsMain.Tables(0).Rows(0)("Against_Form")))))




            Dim s As String = Trim(dsMain.Tables(0).Rows(0)("Notes_Desc"))

            Dim s1, s2, s3, s4, s5, s6, s7 As String

            Dim p1, p2, p3, p4, p5, p6, p7 As Integer

            p1 = InStr(1, UCase(s), "+")


            If p1 <> 0 Then


                s1 = Mid(s, 1, p1 - 1)
                s1 = RemoveSingleQuotes(s1)

            End If


            p2 = InStr(p1 + 1, UCase(s), "+")

            If p2 <> 0 Then

                s2 = Mid(s, p1 + 1, p2 - p1)
                s2 = RemoveSingleQuotes(s2)

            End If

            p3 = InStr(p2 + 1, UCase(s), "+")

            If p3 <> 0 Then

                s3 = Mid(s, p2 + 1, p3 - p2)
                s3 = RemoveSingleQuotes(s3)

            End If

            p4 = InStr(p3 + 1, UCase(s), "+")

            If p4 <> 0 Then

                s4 = Mid(s, p3 + 1, p4 - p3)
                s4 = RemoveSingleQuotes(s4)

            End If

            p5 = InStr(p4 + 1, UCase(s), "+")

            If p5 <> 0 Then

                s5 = Mid(s, p4 + 1, p5 - p4)
                s5 = RemoveSingleQuotes(s5)

            End If

            p6 = InStr(p5 + 1, UCase(s), "+")

            If p6 <> 0 Then

                s6 = Mid(s, p5 + 1, p6 - p5)
                s6 = RemoveSingleQuotes(s6)

            End If

            p7 = InStr(p6 + 1, UCase(s), "+")

            If p7 <> 0 Then

                s7 = Mid(s, p6 + 1, p7 - p6)
                s7 = RemoveSingleQuotes(s7)

            End If

            PrintLine(1, VB.ChrW(15)) ' This is in Condensed Mode, /15 ... 18 

            PrintLine(1, SPC(5), IIf(Trim(s1) = "", "", Trim(s1)))
            PrintLine(1, SPC(5), IIf(Trim(s2) = "", "", Trim(s2)))
            PrintLine(1, SPC(5), IIf(Trim(s3) = "", "", Trim(s3)))
            PrintLine(1, SPC(5), IIf(Trim(s4) = "", "", Trim(s4)))
            PrintLine(1, SPC(5), IIf(Trim(s5) = "", "", Trim(s5)))
            PrintLine(1, SPC(5), IIf(Trim(s6) = "", "", Trim(s6)))
            PrintLine(1, SPC(5), IIf(Trim(s7) = "", "", Trim(s7)))

            PrintLine(1, VB.ChrW(18)) 'cancel condensed





            'If dsMain.Tables(0).Rows(0)("SInv_Others_1") <> "" Then
            'PrintLine(1, SPC(5), IIf(UCase(Trim(dsMain.Tables(0).Rows(0)("SInv_Others_1"))) = "", " ", UCase(Trim(dsMain.Tables(0).Rows(0)("SInv_Others_1")))))
            'End If
            'If dsMain.Tables(0).Rows(0)("SInv_Others_2") <> "" Then
            'PrintLine(1, SPC(5), IIf(UCase(Trim(dsMain.Tables(0).Rows(0)("SInv_Others_2"))) = "", " ", UCase(Trim(dsMain.Tables(0).Rows(0)("SInv_Others_2")))))
            'End If

            'If dsMain.Tables(0).Rows(0)("SInv_Others_3") <> "" Then
            'PrintLine(1, SPC(5), IIf(UCase(Trim(dsMain.Tables(0).Rows(0)("SInv_Others_3"))) = "", " ", UCase(Trim(dsMain.Tables(0).Rows(0)("SInv_Others_3")))))
            ' End If





            'PrintLine(1, VB.ChrW(27) & VB.ChrW(69)) 'emapsized


            Dim mVATAmount As String = ""
            Dim mVATValue As String = ""
            Dim mVATDesc As String = ""

            Dim mCSTAmount As String = ""
            Dim mCSTValue As String = ""
            Dim mCSTDesc As String = ""

            If dsTax.Tables(0).Rows.Count > 0 Then
                For iRow As Integer = 0 To dsTax.Tables(0).Rows.Count - 1
                    If Trim(dsTax.Tables(0).Rows(iRow)("TCD_Code")).StartsWith("VAT") Then
                        mVATDesc = Trim(dsTax.Tables(0).Rows(iRow)("TCD_Code"))
                        mVATValue = Format(CType(Trim(dsTax.Tables(0).Rows(iRow)("TCD_Value")), Double), "#0.00")
                        mVATAmount = stuff_sp(Format(CType(dsTax.Tables(0).Rows(iRow)("TCD_Amount"), Double), "#0.00"), 10, "L")

                    ElseIf Trim(dsTax.Tables(0).Rows(iRow)("TCD_Code")).StartsWith("C.S.T.") Then
                        mCSTDesc = Trim(dsTax.Tables(0).Rows(iRow)("TCD_Code"))
                        mCSTValue = Format(CType(Trim(dsTax.Tables(0).Rows(iRow)("TCD_Value")), Double), "#0.00")
                        mCSTAmount = stuff_sp(Format(CType(dsTax.Tables(0).Rows(iRow)("TCD_Amount"), Double), "#0.00"), 10, "L")
                    End If
                Next
            End If

            If Val(mVATAmount) > 0 Then
                PrintLine(1, TAB(56), mVATDesc & "  -  " & mVATValue, SPC(1), "%", TAB(76), mVATAmount)
            Else
                PrintLine(1, " ")
            End If

            If Val(mCSTAmount) > 0 Then
                PrintLine(1, TAB(56), mCSTDesc & "  -  " & mCSTValue, SPC(1), "%", TAB(76), mCSTAmount)
            Else
                PrintLine(1, " ")
            End If

            'PrintLine(1, " ")
            PrintLine(1, SPC(5), "Lot No." & Trim(tbLotNo.Text) & " Only. Do Not Mix with other Lots.", TAB(77), stuff_sp(Format(CType(Trim(dsMain.Tables(0).Rows(0)("Round_Off")), Double), "#0.00"), 10, "L"))
            PrintLine(1, " ")
            'PrintLine(1, " ")
            'PrintLine(1, " ")
            PrintLine(1, TAB(25), Trim(dsMain.Tables(0).Rows(0)("Inv_Issue_Date_Time")))
            PrintLine(1, " ")
            PrintLine(1, TAB(25), Trim(dsMain.Tables(0).Rows(0)("Goods_Removal_Date_Time")), TAB(77), stuff_sp(Format(CType(mTotAmt, Double), "#0.00"), 10, "L"))
            'PrintLine(1, " ")
            'PrintLine(1, TAB(75), stuff_sp(Format(CType(mTotAmt, Double), "#0.00"), 10, "L"))
            PrintLine(1, " ")
            PrintLine(1, " ")
            PrintLine(1, TAB(2), Chr(27) + "E" + UCase(mAmountWords) + Chr(27) + "F")
            'PrintLine(1, " ")
            PrintLine(1, VB.ChrW(12))
            FileClose(1)

            'Process.Start("notepad.exe", fileName)
            Dim mobjclsRawPrinterHelper As New RawPrinterHelper
            Dim pd As New PrintDialog()
            Dim pr As New PrintDocument

            ' pr.DocumentName = fileName
            ' pr.Print()

            'pd.PrinterSettings = New PrinterSettings()




            'If (pd.ShowDialog() = DialogResult.OK) Then
            'RawPrinterHelper.SendFileToPrinter(pd.PrinterSettings.PrinterName, fileName)
            'Print(pd.PrinterSettings.PrinterName, fileName)
            'End If



            'AxReportViewer1.FileName = fileName
            'AxReportViewer1.ReportTitle = "Sales Invoice"
            'AxReportViewer1.ShowPrintPreview()

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    Private Sub tbAgentComm_Leave(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbAgentComm.Leave
        tbCustItemCode.Focus()
    End Sub
    Private Sub tbCustItemCode_Leave(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbCustItemCode.Leave
        cbxPackingType.Focus()
    End Sub

    Private Sub btnEinv_Click(sender As Object, e As EventArgs) Handles btnEinv.Click
        Try
            ds = Nothing
            ds = New DataSet
            ds = GetInvoiceDetails("yarn")
            ds.Tables(0).TableName = "Yarn Sales"

            ExportExcel(ds)
        Catch ex As Exception
            Show_Message("Error : " & ex.Message.ToString)
        End Try
    End Sub
    Public Function GetInvoiceDetails(ByVal mvarfilterdata As String)
        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("eSales"))
            Try
                com.CommandText = "sp_Get_eInvoice"
                '"sp_GetUpToDateStock1_Report"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@INV_NO", OleDbType.VarChar, 20).Value = Trim(tbSINVNo.Text)
                com.Parameters.Add("@FILTER_DATA", OleDbType.VarChar, 50).Value = mvarfilterdata
                ' com.Parameters.Add("@Fin_Year_code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                da = New OleDbDataAdapter(com)
                da.Fill(ds)
                da.Dispose()
                com.Dispose()
                con.Dispose()
            Catch ex As Exception
                Show_Message(ex.Message)
                da.Dispose()
                com.Dispose()
                con.Dispose()
            End Try
            Return ds
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
        Return ds
    End Function
    Public Function GeteInvoiceDetails(ByVal mvarfilterdata As String)
        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("eSales"))
            Try
                com.CommandText = "sp_Get_Schema"
                '"sp_GetUpToDateStock1_Report"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@INV_NO", OleDbType.VarChar, 20).Value = Trim(tbSINVNo.Text)
                com.Parameters.Add("@FILTER_DATA", OleDbType.VarChar, 50).Value = mvarfilterdata
                com.Parameters.Add("@Fin_Year_code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                da = New OleDbDataAdapter(com)
                da.Fill(ds)
                da.Dispose()
                com.Dispose()
                con.Dispose()
            Catch ex As Exception
                Show_Message(ex.Message)
                da.Dispose()
                com.Dispose()
                con.Dispose()
            End Try
            Return ds
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
        Return ds
    End Function
    Public Function GetEwaybillDetails(ByVal mvarfilterdata As String)
        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("eSales"))
            Try
                com.CommandText = "sp_Get_EwaySchema"
                '"sp_GetUpToDateStock1_Report"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@INV_NO", OleDbType.VarChar, 20).Value = Trim(tbSINVNo.Text)
                com.Parameters.Add("@FILTER_DATA", OleDbType.VarChar, 50).Value = mvarfilterdata
                com.Parameters.Add("@Fin_Year_code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                da = New OleDbDataAdapter(com)
                da.Fill(ds)
                da.Dispose()
                com.Dispose()
                con.Dispose()
            Catch ex As Exception
                Show_Message(ex.Message)
                da.Dispose()
                com.Dispose()
                con.Dispose()
            End Try
            Return ds
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
        Return ds
    End Function
    Public Function ExportExcel(ByVal ds As DataSet)


        Try
            If ds.Tables(0).Rows.Count = 0 Then Exit Function

            Dim xls As Object = CreateObject("Excel.Application")
            Dim strPath As String = mvarReportPath & "\EXCEL"
            Dim strFilename As String = "JSON_preperation_FormA(version1.01)(2).xlsm"
            Dim xlFileName As String = mvarReportPath & "\reports\JSON_preperation_FormA(version1.01)(2).xlsm"

            If xls Is Nothing Then
                MessageBox.Show("Excel is not installed on this machine.", "Spinone", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                Exit Function
            End If

            With xls

                .workbooks.open(xlFileName)

                .application.visible = True

                .Worksheets(3).Select()


                Dim intII As Integer = 1
                Dim intKK As Integer = 1

                intII = 5
                intKK = 1

                For intRow As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    'intKK = 1
                    'For intCol As Integer = 0 To ds.Tables(0).Columns.Count - 1

                    Dim r As String = ds.Tables(0).Rows(intRow)(2)

                    .Cells(intII, 1).value = ds.Tables(0).Rows(intRow)(0)
                    .Cells(intII, 4).value = ds.Tables(0).Rows(intRow)(1)
                    .Cells(intII, 5).value = ds.Tables(0).Rows(intRow)(2)
                    .Cells(intII, 6).value = ds.Tables(0).Rows(intRow)(3)
                    .Cells(intII, 7).value = Format(ds.Tables(0).Rows(intRow)(4), "dd/MM/yyyy")
                    .Cells(intII, 8).value = ds.Tables(0).Rows(intRow)(5)
                    .Cells(intII, 9).value = CheckName(ds.Tables(0).Rows(intRow)(6))
                    .Cells(intII, 11).value = ds.Tables(0).Rows(intRow)(7)
                    .Cells(intII, 12).value = CheckAddress(ds.Tables(0).Rows(intRow)(8))
                    .Cells(intII, 13).value = ds.Tables(0).Rows(intRow)(9)
                    .Cells(intII, 14).value = CheckName(ds.Tables(0).Rows(intRow)(10))
                    .Cells(intII, 15).value = CheckName(ds.Tables(0).Rows(intRow)(11))
                    .Cells(intII, 16).value = ds.Tables(0).Rows(intRow)(12)
                    .Cells(intII, 33).value = ds.Tables(0).Rows(intRow)(13)
                    .Cells(intII, 34).value = ds.Tables(0).Rows(intRow)(14)
                    .Cells(intII, 36).value = ds.Tables(0).Rows(intRow)(15)
                    .Cells(intII, 38).value = ds.Tables(0).Rows(intRow)(16)
                    .Cells(intII, 40).value = ds.Tables(0).Rows(intRow)(17)
                    .Cells(intII, 41).value = ds.Tables(0).Rows(intRow)(18)
                    .Cells(intII, 42).value = ds.Tables(0).Rows(intRow)(19)
                    .Cells(intII, 45).value = ds.Tables(0).Rows(intRow)(20)
                    .Cells(intII, 46).value = ds.Tables(0).Rows(intRow)(21)
                    .Cells(intII, 47).value = ds.Tables(0).Rows(intRow)(22)
                    .Cells(intII, 48).value = ds.Tables(0).Rows(intRow)(23)
                    .Cells(intII, 49).value = ds.Tables(0).Rows(intRow)(24)
                    .Cells(intII, 57).value = ds.Tables(0).Rows(intRow)(25)
                    .Cells(intII, 61).value = ds.Tables(0).Rows(intRow)(26)
                    .Cells(intII, 62).value = ds.Tables(0).Rows(intRow)(27)
                    .Cells(intII, 63).value = ds.Tables(0).Rows(intRow)(28)
                    .Cells(intII, 64).value = ds.Tables(0).Rows(intRow)(29)
                    .Cells(intII, 68).value = ds.Tables(0).Rows(intRow)(30)
                    .Cells(intII, 69).value = ds.Tables(0).Rows(intRow)(31)
                    .Cells(intII, 70).value = ds.Tables(0).Rows(intRow)(32)

                    '    intKK += 1
                    'Next
                    intII += 1
                Next


            End With

            System.Runtime.InteropServices.Marshal.ReleaseComObject(xls)
            xls = Nothing

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try

    End Function
    Private Sub btnEwaybill_Click(sender As Object, e As EventArgs) Handles btnEwaybill.Click

        Try

            ds = Nothing
            ds = New DataSet
            ds = GetEwaybillDetails("yarn")
            ds.Tables(0).TableName = "Yarn Sales"


            Eway_Generate(ds)

            eintype = "ewb"

            einvoice()


        Catch ex As Exception
            Show_Message("Error : " & ex.Message.ToString)
        End Try

    End Sub

    Private Sub btnIrnno_Click(sender As Object, e As EventArgs) Handles btnIrnno.Click
        ReadIRN()
    End Sub

    Private Sub btnAckno_Click(sender As Object, e As EventArgs) Handles btnAckno.Click
        ReadAckNo()
    End Sub

    Private Sub btnEwbno_Click(sender As Object, e As EventArgs) Handles btnEwbno.Click

        ReadewbNo()

    End Sub


    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Tab_SelectedIndexChanged()
        btnApply.Enabled = True
    End Sub
    Private Sub cbxtdsp_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbxtdsp.SelectedIndexChanged

        tbTDSval.Text = Round(((Val(tbtdsamt.Text) * Val(cbxtdsp.Text)) / 100))

    End Sub
    Private Sub tbCustCode_TextChanged(sender As Object, e As EventArgs) Handles tbCustCode.TextChanged
        Try
            'find total sales value

            SSQL = ""
            SSQL = "select sum(assessable_value) as assvalue from eSales..SOP_Salesinvoice_Main a"
            SSQL = SSQL & " where a.Cust_Code='" & Trim(tbCustCode.Text) & "'"
            SSQL = SSQL & " and a.delete_mode=0 and a.fin_year_code ='" & Trim(mvarFinYearCode) & "'"
            SSQL = SSQL & " and a.SO_date <='" & Format(dtpSODate.Value, "yyyy/MM/dd") & "'"


            lblSales.Text = ""

            Dim salesval As Double = ReturnSingleValue(SSQL, "eSales")

            lblSales.Text = salesval

            'end total sales value



            'SSQL = ""
            'SSQL = "select TURN_OVER  from ecommon..customer_details a"
            'SSQL = SSQL & " where a.Cust_Code='" & Trim(tbCustCode.Text) & "'"
            'SSQL = SSQL & " and a.isactive=1 "
            'SSQL = SSQL & " and a.comp_code ='" & mvarCompanyCode & "'"

            'Dim tovr As String = ReturnSingleValue(SSQL, "eCommon")


            'If tovr = "<=100000000" Then
            '    tbtdsamt.Enabled = False
            '    tbtdsamt.Text = ""
            '    cbxtdsp.Enabled = False
            '    tbTDSval.Text = ""
            '    tbTDSval.Enabled = False
            '    tcs = "tcs"
            '    Fill_TCD_Group_Details(tcs)

            'ElseIf tovr = ">100000000" Then
            '    tbtdsamt.Enabled = True
            '    tbtdsamt.Text = ""
            '    cbxtdsp.Enabled = True
            '    tbTDSval.Text = ""
            '    tbTDSval.Enabled = True
            '    tcs = ""
            '    Fill_TCD_Group_Details(tcs)

            'Else

            '    tbCustName.Text = ""

            '    Show_Message("Kindly Set Turn over Limit and then select customer")

            '    Exit Sub

            'End If

        Catch ex As Exception
            Show_Message(ex.Message)
        End Try


    End Sub

    'Private Sub tbCustName_TextChanged(sender As Object, e As EventArgs) Handles tbCustName.TextChanged
    'Try

    '    SSQL = ""
    '    SSQL = "select TURN_OVER,cust_others_1  from ecommon..customer_details a"
    '    SSQL = SSQL & " where a.Cust_Code='" & Trim(tbCustCode.Text) & "'"
    '    SSQL = SSQL & " and a.isactive=1 "
    '    SSQL = SSQL & " and a.comp_code ='" & mvarCompanyCode & "'"



    '    ds = ReturnMultipleValue(SSQL, "eCommon")

    '    If ds.Tables(0).Rows.Count <= 0 Then Exit Sub

    '    If ds.Tables(0).Rows(0)("cust_others_1") <> "" Then

    '        If ds.Tables(0).Rows(0)("turn_over") = "<=100000000" Then

    '            tbtdsamt.Enabled = False
    '            tbtdsamt.Text = ""
    '            cbxtdsp.Enabled = False
    '            tbTDSval.Text = ""
    '            tbTDSval.Enabled = False
    '            tcs = "tcs"
    '            Fill_TCD_Group_Details(tcs)

    '        ElseIf ds.Tables(0).Rows(0)("turn_over") = ">100000000" Then
    '            tbtdsamt.Enabled = True
    '            tbtdsamt.Text = ""
    '            cbxtdsp.Enabled = True
    '            tbTDSval.Text = ""
    '            tbTDSval.Enabled = True
    '            tcs = ""
    '            Fill_TCD_Group_Details(tcs)

    '        Else
    '            Show_Message("Kindly Set Turn over Limit and then select customer")
    '            tbCustCode.Text = ""
    '            tbCustName.Text = ""
    '            Exit Sub
    '        End If

    '    Else
    '        Show_Message("This Customer Has No GST No in Customer Master Kindly Update")

    '    End If



    'Catch ex As Exception
    '    Show_Message(ex.Message)
    'End Try

    ' End Sub

    Private Sub tbtdsamt_TextChanged(sender As Object, e As EventArgs) Handles tbtdsamt.TextChanged
        tbTDSval.Text = Round(((Val(tbtdsamt.Text) * Val(cbxtdsp.Text)) / 100))
    End Sub

    Private Sub tbCustName_TextChanged(sender As Object, e As EventArgs) Handles tbCustName.TextChanged

    End Sub





    'Private Sub tbCustCode_TextChanged(sender As Object, e As EventArgs) Handles tbCustCode.TextChanged
    '    Try
    '        If tbCustName.Text.Trim = "" Then Exit Sub
    '        Dim dsSales As New DataSet
    '        dsSales = Nothing

    '        dsSales = mobjclsSalesInvoice.GetSalesAmountCheck(Trim(tbCustCode.Text))

    '        If dsSales.Tables(0).Rows.Count <= 0 Then Exit Sub

    '        If Val(dsSales.Tables(0).Rows(0)("assessable_value")) < 5000000 Then

    '            cbxTCDGroupCode.Items.Remove("GST 5%-TCS 0.075%")
    '            cbxTCDGroupCode.Items.Remove("IGST 5% - TCS 0.075%")
    '            dsSales = Nothing
    '        Else

    '            dsSales = Nothing

    '            Exit Sub

    '        End If


    '    Catch ex As Exception
    '        Show_Message(ex.Message)
    '    End Try
    'End Sub
End Class