<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class FrmDailyOverTime_Entry
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()>
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmDailyOverTime_Entry))
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.cbxScreenMode = New System.Windows.Forms.ComboBox()
        Me.btnMail = New System.Windows.Forms.Button()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.btnPrint = New System.Windows.Forms.Button()
        Me.cbxNumberType = New System.Windows.Forms.ComboBox()
        Me.btnInformation = New System.Windows.Forms.Button()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.dtpOTdate = New System.Windows.Forms.DateTimePicker()
        Me.dtpEntryDate = New System.Windows.Forms.DateTimePicker()
        Me.btnPickList = New System.Windows.Forms.Button()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.TxtEntryno = New System.Windows.Forms.TextBox()
        Me.GroupBox5 = New System.Windows.Forms.GroupBox()
        Me.btnClose = New System.Windows.Forms.Button()
        Me.btnApply = New System.Windows.Forms.Button()
        Me.btnClear = New System.Windows.Forms.Button()
        Me.btnReset = New System.Windows.Forms.Button()
        Me.C1Tab2 = New C1.Win.C1Command.C1DockingTab()
        Me.C2TapPage1 = New C1.Win.C1Command.C1DockingTabPage()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.TxttotStitchesAmount = New System.Windows.Forms.TextBox()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.TxttotStitches = New System.Windows.Forms.TextBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.txtfingerid = New System.Windows.Forms.TextBox()
        Me.Panel5 = New System.Windows.Forms.Panel()
        Me.cbxfilter = New System.Windows.Forms.ComboBox()
        Me.Cbxfilterby = New System.Windows.Forms.ComboBox()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.Label22 = New System.Windows.Forms.Label()
        Me.txtempcode = New System.Windows.Forms.TextBox()
        Me.lblname = New System.Windows.Forms.Label()
        Me.btn_Delete = New System.Windows.Forms.Button()
        Me.btn_Add = New System.Windows.Forms.Button()
        Me.CbxOperation = New System.Windows.Forms.ComboBox()
        Me.Label25 = New System.Windows.Forms.Label()
        Me.txtNoof_Stitches = New System.Windows.Forms.TextBox()
        Me.lbl_Amount = New System.Windows.Forms.Label()
        Me.txtRatePerpiece = New System.Windows.Forms.TextBox()
        Me.CbxProductname = New System.Windows.Forms.ComboBox()
        Me.Label27 = New System.Windows.Forms.Label()
        Me.Label28 = New System.Windows.Forms.Label()
        Me.Label31 = New System.Windows.Forms.Label()
        Me.Label32 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.c1fgItems = New C1.Win.C1FlexGrid.Classic.C1FlexGridClassic()
        Me.C2TapPage2 = New C1.Win.C1Command.C1DockingTabPage()
        Me.txtOthers = New System.Windows.Forms.TextBox()
        Me.GroupBox2.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox5.SuspendLayout()
        CType(Me.C1Tab2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.C1Tab2.SuspendLayout()
        Me.C2TapPage1.SuspendLayout()
        Me.Panel5.SuspendLayout()
        CType(Me.c1fgItems, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.C2TapPage2.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupBox2
        '
        Me.GroupBox2.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.GroupBox2.Controls.Add(Me.cbxScreenMode)
        Me.GroupBox2.Controls.Add(Me.btnMail)
        Me.GroupBox2.Controls.Add(Me.Label5)
        Me.GroupBox2.Controls.Add(Me.btnPrint)
        Me.GroupBox2.Controls.Add(Me.cbxNumberType)
        Me.GroupBox2.Controls.Add(Me.btnInformation)
        Me.GroupBox2.Location = New System.Drawing.Point(1, 3)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(891, 48)
        Me.GroupBox2.TabIndex = 0
        Me.GroupBox2.TabStop = False
        '
        'cbxScreenMode
        '
        Me.cbxScreenMode.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cbxScreenMode.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbxScreenMode.FormattingEnabled = True
        Me.cbxScreenMode.Location = New System.Drawing.Point(9, 13)
        Me.cbxScreenMode.Name = "cbxScreenMode"
        Me.cbxScreenMode.Size = New System.Drawing.Size(145, 24)
        Me.cbxScreenMode.TabIndex = 0
        '
        'btnMail
        '
        Me.btnMail.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.btnMail.BackgroundImage = CType(resources.GetObject("btnMail.BackgroundImage"), System.Drawing.Image)
        Me.btnMail.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.btnMail.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnMail.ForeColor = System.Drawing.Color.Black
        Me.btnMail.Location = New System.Drawing.Point(806, 13)
        Me.btnMail.Name = "btnMail"
        Me.btnMail.Size = New System.Drawing.Size(28, 26)
        Me.btnMail.TabIndex = 4
        Me.btnMail.UseVisualStyleBackColor = False
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.BackColor = System.Drawing.Color.Transparent
        Me.Label5.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.Location = New System.Drawing.Point(259, 18)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(102, 16)
        Me.Label5.TabIndex = 1
        Me.Label5.Text = "Numbering Type"
        '
        'btnPrint
        '
        Me.btnPrint.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.btnPrint.BackgroundImage = CType(resources.GetObject("btnPrint.BackgroundImage"), System.Drawing.Image)
        Me.btnPrint.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.btnPrint.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnPrint.ForeColor = System.Drawing.Color.Black
        Me.btnPrint.Location = New System.Drawing.Point(771, 13)
        Me.btnPrint.Name = "btnPrint"
        Me.btnPrint.Size = New System.Drawing.Size(28, 26)
        Me.btnPrint.TabIndex = 3
        Me.btnPrint.UseVisualStyleBackColor = False
        '
        'cbxNumberType
        '
        Me.cbxNumberType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cbxNumberType.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbxNumberType.FormattingEnabled = True
        Me.cbxNumberType.Location = New System.Drawing.Point(374, 13)
        Me.cbxNumberType.Name = "cbxNumberType"
        Me.cbxNumberType.Size = New System.Drawing.Size(251, 24)
        Me.cbxNumberType.TabIndex = 1
        '
        'btnInformation
        '
        Me.btnInformation.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.btnInformation.BackgroundImage = CType(resources.GetObject("btnInformation.BackgroundImage"), System.Drawing.Image)
        Me.btnInformation.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.btnInformation.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnInformation.ForeColor = System.Drawing.Color.Black
        Me.btnInformation.Location = New System.Drawing.Point(738, 13)
        Me.btnInformation.Name = "btnInformation"
        Me.btnInformation.Size = New System.Drawing.Size(28, 26)
        Me.btnInformation.TabIndex = 2
        Me.btnInformation.UseVisualStyleBackColor = False
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.GroupBox1.Controls.Add(Me.dtpOTdate)
        Me.GroupBox1.Controls.Add(Me.dtpEntryDate)
        Me.GroupBox1.Controls.Add(Me.btnPickList)
        Me.GroupBox1.Controls.Add(Me.Label8)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.TxtEntryno)
        Me.GroupBox1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox1.Location = New System.Drawing.Point(1, 53)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(891, 83)
        Me.GroupBox1.TabIndex = 1
        Me.GroupBox1.TabStop = False
        '
        'dtpOTdate
        '
        Me.dtpOTdate.CustomFormat = " dd/MM/yyyy "
        Me.dtpOTdate.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dtpOTdate.Format = System.Windows.Forms.DateTimePickerFormat.Custom
        Me.dtpOTdate.Location = New System.Drawing.Point(752, 18)
        Me.dtpOTdate.Name = "dtpOTdate"
        Me.dtpOTdate.Size = New System.Drawing.Size(91, 22)
        Me.dtpOTdate.TabIndex = 3
        '
        'dtpEntryDate
        '
        Me.dtpEntryDate.Checked = False
        Me.dtpEntryDate.CustomFormat = "dd/MM/yyyy"
        Me.dtpEntryDate.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dtpEntryDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom
        Me.dtpEntryDate.Location = New System.Drawing.Point(83, 14)
        Me.dtpEntryDate.MinDate = New Date(2011, 4, 1, 0, 0, 0, 0)
        Me.dtpEntryDate.Name = "dtpEntryDate"
        Me.dtpEntryDate.Size = New System.Drawing.Size(90, 22)
        Me.dtpEntryDate.TabIndex = 2
        Me.dtpEntryDate.Value = New Date(2011, 12, 26, 18, 17, 10, 0)
        '
        'btnPickList
        '
        Me.btnPickList.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.btnPickList.BackgroundImage = CType(resources.GetObject("btnPickList.BackgroundImage"), System.Drawing.Image)
        Me.btnPickList.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.btnPickList.Enabled = False
        Me.btnPickList.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnPickList.ForeColor = System.Drawing.Color.Black
        Me.btnPickList.Location = New System.Drawing.Point(453, 8)
        Me.btnPickList.Name = "btnPickList"
        Me.btnPickList.Size = New System.Drawing.Size(28, 26)
        Me.btnPickList.TabIndex = 0
        Me.btnPickList.TabStop = False
        Me.btnPickList.UseVisualStyleBackColor = False
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label8.Location = New System.Drawing.Point(672, 24)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(62, 14)
        Me.Label8.TabIndex = 59
        Me.Label8.Text = "OT Date :"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.Location = New System.Drawing.Point(12, 20)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(66, 14)
        Me.Label3.TabIndex = 0
        Me.Label3.Text = "Entry Date"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(189, 18)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(83, 14)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Entry Number"
        '
        'TxtEntryno
        '
        Me.TxtEntryno.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.TxtEntryno.Location = New System.Drawing.Point(282, 12)
        Me.TxtEntryno.Name = "TxtEntryno"
        Me.TxtEntryno.ReadOnly = True
        Me.TxtEntryno.Size = New System.Drawing.Size(165, 22)
        Me.TxtEntryno.TabIndex = 1
        '
        'GroupBox5
        '
        Me.GroupBox5.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.GroupBox5.Controls.Add(Me.btnClose)
        Me.GroupBox5.Controls.Add(Me.btnApply)
        Me.GroupBox5.Controls.Add(Me.btnClear)
        Me.GroupBox5.Controls.Add(Me.btnReset)
        Me.GroupBox5.Location = New System.Drawing.Point(2, 521)
        Me.GroupBox5.Name = "GroupBox5"
        Me.GroupBox5.Size = New System.Drawing.Size(891, 49)
        Me.GroupBox5.TabIndex = 3
        Me.GroupBox5.TabStop = False
        '
        'btnClose
        '
        Me.btnClose.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnClose.ForeColor = System.Drawing.Color.Navy
        Me.btnClose.Location = New System.Drawing.Point(534, 14)
        Me.btnClose.Name = "btnClose"
        Me.btnClose.Size = New System.Drawing.Size(64, 24)
        Me.btnClose.TabIndex = 19
        Me.btnClose.TabStop = False
        Me.btnClose.Text = "Close"
        Me.btnClose.UseVisualStyleBackColor = True
        '
        'btnApply
        '
        Me.btnApply.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnApply.ForeColor = System.Drawing.Color.Navy
        Me.btnApply.Location = New System.Drawing.Point(291, 14)
        Me.btnApply.Name = "btnApply"
        Me.btnApply.Size = New System.Drawing.Size(64, 24)
        Me.btnApply.TabIndex = 16
        Me.btnApply.TabStop = False
        Me.btnApply.Text = "Apply"
        Me.btnApply.UseVisualStyleBackColor = True
        '
        'btnClear
        '
        Me.btnClear.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnClear.ForeColor = System.Drawing.Color.Navy
        Me.btnClear.Location = New System.Drawing.Point(453, 14)
        Me.btnClear.Name = "btnClear"
        Me.btnClear.Size = New System.Drawing.Size(64, 24)
        Me.btnClear.TabIndex = 18
        Me.btnClear.TabStop = False
        Me.btnClear.Text = "Clear"
        Me.btnClear.UseVisualStyleBackColor = True
        '
        'btnReset
        '
        Me.btnReset.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnReset.ForeColor = System.Drawing.Color.Navy
        Me.btnReset.Location = New System.Drawing.Point(372, 14)
        Me.btnReset.Name = "btnReset"
        Me.btnReset.Size = New System.Drawing.Size(64, 24)
        Me.btnReset.TabIndex = 17
        Me.btnReset.TabStop = False
        Me.btnReset.Text = "Reset"
        Me.btnReset.UseVisualStyleBackColor = True
        '
        'C1Tab2
        '
        Me.C1Tab2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.C1Tab2.Controls.Add(Me.C2TapPage1)
        Me.C1Tab2.Controls.Add(Me.C2TapPage2)
        Me.C1Tab2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.C1Tab2.Location = New System.Drawing.Point(2, 99)
        Me.C1Tab2.Name = "C1Tab2"
        Me.C1Tab2.SelectedIndex = 2
        Me.C1Tab2.SelectedTabBold = True
        Me.C1Tab2.Size = New System.Drawing.Size(889, 427)
        Me.C1Tab2.TabAreaBackColor = System.Drawing.SystemColors.ButtonFace
        Me.C1Tab2.TabIndex = 2
        Me.C1Tab2.VisualStyle = C1.Win.C1Command.VisualStyle.Custom
        Me.C1Tab2.VisualStyleBase = C1.Win.C1Command.VisualStyle.OfficeXP
        '
        'C2TapPage1
        '
        Me.C2TapPage1.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.C2TapPage1.Controls.Add(Me.Label7)
        Me.C2TapPage1.Controls.Add(Me.TxttotStitchesAmount)
        Me.C2TapPage1.Controls.Add(Me.Label9)
        Me.C2TapPage1.Controls.Add(Me.TxttotStitches)
        Me.C2TapPage1.Controls.Add(Me.Label4)
        Me.C2TapPage1.Controls.Add(Me.txtfingerid)
        Me.C2TapPage1.Controls.Add(Me.Panel5)
        Me.C2TapPage1.Controls.Add(Me.txtempcode)
        Me.C2TapPage1.Controls.Add(Me.lblname)
        Me.C2TapPage1.Controls.Add(Me.btn_Delete)
        Me.C2TapPage1.Controls.Add(Me.btn_Add)
        Me.C2TapPage1.Controls.Add(Me.CbxOperation)
        Me.C2TapPage1.Controls.Add(Me.Label25)
        Me.C2TapPage1.Controls.Add(Me.txtNoof_Stitches)
        Me.C2TapPage1.Controls.Add(Me.lbl_Amount)
        Me.C2TapPage1.Controls.Add(Me.txtRatePerpiece)
        Me.C2TapPage1.Controls.Add(Me.CbxProductname)
        Me.C2TapPage1.Controls.Add(Me.Label27)
        Me.C2TapPage1.Controls.Add(Me.Label28)
        Me.C2TapPage1.Controls.Add(Me.Label31)
        Me.C2TapPage1.Controls.Add(Me.Label32)
        Me.C2TapPage1.Controls.Add(Me.Label2)
        Me.C2TapPage1.Controls.Add(Me.c1fgItems)
        Me.C2TapPage1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.C2TapPage1.Location = New System.Drawing.Point(1, 24)
        Me.C2TapPage1.Name = "C2TapPage1"
        Me.C2TapPage1.Size = New System.Drawing.Size(887, 402)
        Me.C2TapPage1.TabBackColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.C2TapPage1.TabBackColorSelected = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.C2TapPage1.TabIndex = 0
        Me.C2TapPage1.Text = "Line Item"
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label7.Location = New System.Drawing.Point(295, 373)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(87, 14)
        Me.Label7.TabIndex = 236
        Me.Label7.Text = "Total Amount:"
        '
        'TxttotStitchesAmount
        '
        Me.TxttotStitchesAmount.BackColor = System.Drawing.Color.Cornsilk
        Me.TxttotStitchesAmount.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.TxttotStitchesAmount.Location = New System.Drawing.Point(388, 370)
        Me.TxttotStitchesAmount.Name = "TxttotStitchesAmount"
        Me.TxttotStitchesAmount.ReadOnly = True
        Me.TxttotStitchesAmount.Size = New System.Drawing.Size(91, 22)
        Me.TxttotStitchesAmount.TabIndex = 234
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label9.Location = New System.Drawing.Point(99, 370)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(87, 14)
        Me.Label9.TabIndex = 235
        Me.Label9.Text = "Total Stitches:"
        '
        'TxttotStitches
        '
        Me.TxttotStitches.BackColor = System.Drawing.Color.Cornsilk
        Me.TxttotStitches.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.TxttotStitches.Location = New System.Drawing.Point(192, 370)
        Me.TxttotStitches.Name = "TxttotStitches"
        Me.TxttotStitches.ReadOnly = True
        Me.TxttotStitches.Size = New System.Drawing.Size(97, 22)
        Me.TxttotStitches.TabIndex = 233
        '
        'Label4
        '
        Me.Label4.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.ForeColor = System.Drawing.Color.Blue
        Me.Label4.Location = New System.Drawing.Point(734, 5)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(65, 23)
        Me.Label4.TabIndex = 232
        Me.Label4.Text = "E.code"
        '
        'txtfingerid
        '
        Me.txtfingerid.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.txtfingerid.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtfingerid.Location = New System.Drawing.Point(801, 6)
        Me.txtfingerid.Margin = New System.Windows.Forms.Padding(4)
        Me.txtfingerid.Name = "txtfingerid"
        Me.txtfingerid.Size = New System.Drawing.Size(78, 23)
        Me.txtfingerid.TabIndex = 8
        '
        'Panel5
        '
        Me.Panel5.BackColor = System.Drawing.SystemColors.Info
        Me.Panel5.Controls.Add(Me.cbxfilter)
        Me.Panel5.Controls.Add(Me.Cbxfilterby)
        Me.Panel5.Controls.Add(Me.Label6)
        Me.Panel5.Controls.Add(Me.Label22)
        Me.Panel5.Location = New System.Drawing.Point(9, 0)
        Me.Panel5.Name = "Panel5"
        Me.Panel5.Size = New System.Drawing.Size(388, 32)
        Me.Panel5.TabIndex = 230
        '
        'cbxfilter
        '
        Me.cbxfilter.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.cbxfilter.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource
        Me.cbxfilter.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbxfilter.ForeColor = System.Drawing.Color.Black
        Me.cbxfilter.FormattingEnabled = True
        Me.cbxfilter.Items.AddRange(New Object() {"ALL"})
        Me.cbxfilter.Location = New System.Drawing.Point(251, 5)
        Me.cbxfilter.Name = "cbxfilter"
        Me.cbxfilter.Size = New System.Drawing.Size(122, 24)
        Me.cbxfilter.TabIndex = 5
        '
        'Cbxfilterby
        '
        Me.Cbxfilterby.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.Cbxfilterby.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource
        Me.Cbxfilterby.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Cbxfilterby.ForeColor = System.Drawing.Color.Black
        Me.Cbxfilterby.FormattingEnabled = True
        Me.Cbxfilterby.Items.AddRange(New Object() {"EmpCode", "Ecode"})
        Me.Cbxfilterby.Location = New System.Drawing.Point(65, 4)
        Me.Cbxfilterby.Name = "Cbxfilterby"
        Me.Cbxfilterby.Size = New System.Drawing.Size(112, 24)
        Me.Cbxfilterby.TabIndex = 4
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Font = New System.Drawing.Font("Cambria", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label6.Location = New System.Drawing.Point(196, 7)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(53, 19)
        Me.Label6.TabIndex = 98
        Me.Label6.Text = "Filter:"
        '
        'Label22
        '
        Me.Label22.AutoSize = True
        Me.Label22.BackColor = System.Drawing.Color.Transparent
        Me.Label22.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label22.Location = New System.Drawing.Point(3, 9)
        Me.Label22.Name = "Label22"
        Me.Label22.Size = New System.Drawing.Size(59, 16)
        Me.Label22.TabIndex = 51
        Me.Label22.Text = "Filter By:"
        '
        'txtempcode
        '
        Me.txtempcode.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.txtempcode.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtempcode.Location = New System.Drawing.Point(655, 4)
        Me.txtempcode.Margin = New System.Windows.Forms.Padding(4)
        Me.txtempcode.Name = "txtempcode"
        Me.txtempcode.Size = New System.Drawing.Size(72, 23)
        Me.txtempcode.TabIndex = 7
        '
        'lblname
        '
        Me.lblname.BackColor = System.Drawing.Color.White
        Me.lblname.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblname.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblname.Location = New System.Drawing.Point(403, 5)
        Me.lblname.Name = "lblname"
        Me.lblname.Size = New System.Drawing.Size(165, 23)
        Me.lblname.TabIndex = 6
        Me.lblname.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'btn_Delete
        '
        Me.btn_Delete.BackColor = System.Drawing.Color.LightSkyBlue
        Me.btn_Delete.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_Delete.ForeColor = System.Drawing.Color.Navy
        Me.btn_Delete.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_Delete.Location = New System.Drawing.Point(821, 84)
        Me.btn_Delete.Name = "btn_Delete"
        Me.btn_Delete.Size = New System.Drawing.Size(58, 30)
        Me.btn_Delete.TabIndex = 15
        Me.btn_Delete.TabStop = False
        Me.btn_Delete.Text = "&Clear"
        Me.btn_Delete.UseVisualStyleBackColor = False
        '
        'btn_Add
        '
        Me.btn_Add.BackColor = System.Drawing.Color.LightSkyBlue
        Me.btn_Add.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_Add.ForeColor = System.Drawing.Color.Navy
        Me.btn_Add.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_Add.Location = New System.Drawing.Point(750, 84)
        Me.btn_Add.Name = "btn_Add"
        Me.btn_Add.Size = New System.Drawing.Size(58, 30)
        Me.btn_Add.TabIndex = 14
        Me.btn_Add.TabStop = False
        Me.btn_Add.Text = "&ADD  "
        Me.btn_Add.UseVisualStyleBackColor = False
        '
        'CbxOperation
        '
        Me.CbxOperation.FormattingEnabled = True
        Me.CbxOperation.Location = New System.Drawing.Point(415, 47)
        Me.CbxOperation.Name = "CbxOperation"
        Me.CbxOperation.Size = New System.Drawing.Size(153, 24)
        Me.CbxOperation.TabIndex = 10
        '
        'Label25
        '
        Me.Label25.AutoSize = True
        Me.Label25.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label25.ForeColor = System.Drawing.Color.Blue
        Me.Label25.Location = New System.Drawing.Point(346, 51)
        Me.Label25.Name = "Label25"
        Me.Label25.Size = New System.Drawing.Size(63, 15)
        Me.Label25.TabIndex = 225
        Me.Label25.Text = "Operation"
        '
        'txtNoof_Stitches
        '
        Me.txtNoof_Stitches.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtNoof_Stitches.Location = New System.Drawing.Point(93, 84)
        Me.txtNoof_Stitches.MaxLength = 11
        Me.txtNoof_Stitches.Name = "txtNoof_Stitches"
        Me.txtNoof_Stitches.Size = New System.Drawing.Size(96, 23)
        Me.txtNoof_Stitches.TabIndex = 12
        Me.txtNoof_Stitches.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'lbl_Amount
        '
        Me.lbl_Amount.BackColor = System.Drawing.Color.White
        Me.lbl_Amount.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lbl_Amount.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lbl_Amount.Location = New System.Drawing.Point(260, 83)
        Me.lbl_Amount.Name = "lbl_Amount"
        Me.lbl_Amount.Size = New System.Drawing.Size(78, 23)
        Me.lbl_Amount.TabIndex = 13
        Me.lbl_Amount.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'txtRatePerpiece
        '
        Me.txtRatePerpiece.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtRatePerpiece.Location = New System.Drawing.Point(655, 51)
        Me.txtRatePerpiece.MaxLength = 10
        Me.txtRatePerpiece.Name = "txtRatePerpiece"
        Me.txtRatePerpiece.Size = New System.Drawing.Size(72, 23)
        Me.txtRatePerpiece.TabIndex = 11
        Me.txtRatePerpiece.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'CbxProductname
        '
        Me.CbxProductname.DropDownHeight = 200
        Me.CbxProductname.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.CbxProductname.FormattingEnabled = True
        Me.CbxProductname.IntegralHeight = False
        Me.CbxProductname.Location = New System.Drawing.Point(93, 47)
        Me.CbxProductname.Name = "CbxProductname"
        Me.CbxProductname.Size = New System.Drawing.Size(232, 23)
        Me.CbxProductname.Sorted = True
        Me.CbxProductname.TabIndex = 9
        '
        'Label27
        '
        Me.Label27.AutoSize = True
        Me.Label27.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label27.ForeColor = System.Drawing.Color.Blue
        Me.Label27.Location = New System.Drawing.Point(202, 88)
        Me.Label27.Name = "Label27"
        Me.Label27.Size = New System.Drawing.Size(52, 15)
        Me.Label27.TabIndex = 216
        Me.Label27.Text = "Amount"
        '
        'Label28
        '
        Me.Label28.AutoSize = True
        Me.Label28.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label28.ForeColor = System.Drawing.Color.Blue
        Me.Label28.Location = New System.Drawing.Point(583, 51)
        Me.Label28.Name = "Label28"
        Me.Label28.Size = New System.Drawing.Size(67, 15)
        Me.Label28.TabIndex = 217
        Me.Label28.Text = "Rate/Piece"
        '
        'Label31
        '
        Me.Label31.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label31.ForeColor = System.Drawing.Color.Blue
        Me.Label31.Location = New System.Drawing.Point(12, 83)
        Me.Label31.Name = "Label31"
        Me.Label31.Size = New System.Drawing.Size(84, 24)
        Me.Label31.TabIndex = 218
        Me.Label31.Text = "No.of.Stitches"
        '
        'Label32
        '
        Me.Label32.AutoSize = True
        Me.Label32.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label32.ForeColor = System.Drawing.Color.Blue
        Me.Label32.Location = New System.Drawing.Point(-1, 51)
        Me.Label32.Name = "Label32"
        Me.Label32.Size = New System.Drawing.Size(84, 15)
        Me.Label32.TabIndex = 219
        Me.Label32.Text = "Product name"
        '
        'Label2
        '
        Me.Label2.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.ForeColor = System.Drawing.Color.Blue
        Me.Label2.Location = New System.Drawing.Point(583, 6)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(65, 23)
        Me.Label2.TabIndex = 212
        Me.Label2.Text = "Emp code "
        '
        'c1fgItems
        '
        Me.c1fgItems.AutoSearch = C1.Win.C1FlexGrid.AutoSearchEnum.FromTop
        Me.c1fgItems.BorderStyle = C1.Win.C1FlexGrid.Util.BaseControls.BorderStyleEnum.FixedSingle
        Me.c1fgItems.ColumnInfo = "10,1,0,0,0,100,Columns:"
        Me.c1fgItems.Editable = C1.Win.C1FlexGrid.Classic.EditableSettings.flexEDKbdMouse
        Me.c1fgItems.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.c1fgItems.GridColor = System.Drawing.Color.Black
        Me.c1fgItems.GridColorFixed = System.Drawing.Color.Black
        Me.c1fgItems.GridLines = C1.Win.C1FlexGrid.Classic.GridStyleSettings.flexGridNone
        Me.c1fgItems.Location = New System.Drawing.Point(9, 120)
        Me.c1fgItems.Name = "c1fgItems"
        Me.c1fgItems.NodeClosedPicture = Nothing
        Me.c1fgItems.NodeOpenPicture = Nothing
        Me.c1fgItems.OutlineCol = -1
        Me.c1fgItems.Size = New System.Drawing.Size(872, 233)
        Me.c1fgItems.StyleInfo = resources.GetString("c1fgItems.StyleInfo")
        Me.c1fgItems.TabIndex = 12
        Me.c1fgItems.TreeColor = System.Drawing.Color.DarkGray
        Me.c1fgItems.VisualStyle = C1.Win.C1FlexGrid.VisualStyle.Office2007Blue
        '
        'C2TapPage2
        '
        Me.C2TapPage2.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.C2TapPage2.CaptionText = "Delivery Details"
        Me.C2TapPage2.Controls.Add(Me.txtOthers)
        Me.C2TapPage2.Location = New System.Drawing.Point(1, 24)
        Me.C2TapPage2.Name = "C2TapPage2"
        Me.C2TapPage2.Size = New System.Drawing.Size(887, 402)
        Me.C2TapPage2.TabBackColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.C2TapPage2.TabBackColorSelected = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.C2TapPage2.TabIndex = 0
        Me.C2TapPage2.Text = "Others"
        '
        'txtOthers
        '
        Me.txtOthers.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtOthers.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtOthers.Location = New System.Drawing.Point(130, 20)
        Me.txtOthers.Multiline = True
        Me.txtOthers.Name = "txtOthers"
        Me.txtOthers.Size = New System.Drawing.Size(596, 217)
        Me.txtOthers.TabIndex = 0
        '
        'FrmDailyOverTime_Entry
        '
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None
        Me.BackColor = System.Drawing.Color.SeaGreen
        Me.ClientSize = New System.Drawing.Size(894, 568)
        Me.Controls.Add(Me.C1Tab2)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.GroupBox5)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "FrmDailyOverTime_Entry"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Daily Production Entry"
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.GroupBox5.ResumeLayout(False)
        CType(Me.C1Tab2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.C1Tab2.ResumeLayout(False)
        Me.C2TapPage1.ResumeLayout(False)
        Me.C2TapPage1.PerformLayout()
        Me.Panel5.ResumeLayout(False)
        Me.Panel5.PerformLayout()
        CType(Me.c1fgItems, System.ComponentModel.ISupportInitialize).EndInit()
        Me.C2TapPage2.ResumeLayout(False)
        Me.C2TapPage2.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents cbxScreenMode As System.Windows.Forms.ComboBox
    Friend WithEvents btnMail As System.Windows.Forms.Button
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents btnPrint As System.Windows.Forms.Button
    Friend WithEvents cbxNumberType As System.Windows.Forms.ComboBox
    Friend WithEvents btnInformation As System.Windows.Forms.Button
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents TxtEntryno As System.Windows.Forms.TextBox
    Friend WithEvents GroupBox5 As System.Windows.Forms.GroupBox
    Friend WithEvents btnClose As System.Windows.Forms.Button
    Friend WithEvents btnApply As System.Windows.Forms.Button
    Friend WithEvents btnClear As System.Windows.Forms.Button
    Friend WithEvents btnReset As System.Windows.Forms.Button
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents btnPickList As System.Windows.Forms.Button
    Friend WithEvents C1Tab2 As C1.Win.C1Command.C1DockingTab
    Friend WithEvents C2TapPage1 As C1.Win.C1Command.C1DockingTabPage
    Friend WithEvents C2TapPage2 As C1.Win.C1Command.C1DockingTabPage
    Friend WithEvents txtOthers As System.Windows.Forms.TextBox
    Friend WithEvents c1fgItems As C1.Win.C1FlexGrid.Classic.C1FlexGridClassic
    Friend WithEvents dtpEntryDate As System.Windows.Forms.DateTimePicker
    Friend WithEvents dtpOTdate As System.Windows.Forms.DateTimePicker
    Friend WithEvents Label2 As Label
    Friend WithEvents CbxOperation As ComboBox
    Friend WithEvents Label25 As Label
    Friend WithEvents txtNoof_Stitches As TextBox
    Friend WithEvents lbl_Amount As Label
    Friend WithEvents txtRatePerpiece As TextBox
    Friend WithEvents CbxProductname As ComboBox
    Friend WithEvents Label27 As Label
    Friend WithEvents Label28 As Label
    Friend WithEvents Label31 As Label
    Friend WithEvents Label32 As Label
    Friend WithEvents btn_Delete As Button
    Friend WithEvents btn_Add As Button
    Friend WithEvents lblname As System.Windows.Forms.Label
    Friend WithEvents Panel5 As Panel
    Friend WithEvents Cbxfilterby As ComboBox
    Friend WithEvents Label6 As Label
    Friend WithEvents txtempcode As TextBox
    Friend WithEvents Label22 As Label
    Friend WithEvents cbxfilter As ComboBox
    Friend WithEvents txtfingerid As TextBox
    Friend WithEvents Label4 As Label
    Friend WithEvents Label7 As Label
    Friend WithEvents TxttotStitchesAmount As TextBox
    Friend WithEvents Label9 As Label
    Friend WithEvents TxttotStitches As TextBox
End Class
