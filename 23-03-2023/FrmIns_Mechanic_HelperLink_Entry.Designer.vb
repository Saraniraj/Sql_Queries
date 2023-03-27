<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmIns_Mechanic_HelperLink_Entry
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
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
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmIns_Mechanic_HelperLink_Entry))
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.CbxEarning = New System.Windows.Forms.ComboBox()
        Me.btnExcel = New System.Windows.Forms.Button()
        Me.Btnprocess = New System.Windows.Forms.Button()
        Me.dtpEntryDate = New System.Windows.Forms.DateTimePicker()
        Me.btnPickList = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.TxtEntryno = New System.Windows.Forms.TextBox()
        Me.CbxCategory = New System.Windows.Forms.ComboBox()
        Me.Label29 = New System.Windows.Forms.Label()
        Me.GroupBox5 = New System.Windows.Forms.GroupBox()
        Me.btnClear = New System.Windows.Forms.Button()
        Me.btnReset = New System.Windows.Forms.Button()
        Me.btnApply = New System.Windows.Forms.Button()
        Me.btnClose = New System.Windows.Forms.Button()
        Me.C1Tab2 = New C1.Win.C1Command.C1DockingTab()
        Me.C2TapPage1 = New C1.Win.C1Command.C1DockingTabPage()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.TxttotOT_Amt = New System.Windows.Forms.TextBox()
        Me.c1fgItems = New C1.Win.C1FlexGrid.Classic.C1FlexGridClassic()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.lblTotalCount = New System.Windows.Forms.Label()
        Me.Label23 = New System.Windows.Forms.Label()
        Me.C2TapPage2 = New C1.Win.C1Command.C1DockingTabPage()
        Me.txtOthers = New System.Windows.Forms.TextBox()
        Me.OpenFileSelect = New System.Windows.Forms.OpenFileDialog()
        Me.Label60 = New System.Windows.Forms.Label()
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.btnMail = New System.Windows.Forms.Button()
        Me.btnprint = New System.Windows.Forms.Button()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.btnInformation = New System.Windows.Forms.Button()
        Me.cbxNumberType = New System.Windows.Forms.ComboBox()
        Me.cbxScreenMode = New System.Windows.Forms.ComboBox()
        Me.lblCaption = New System.Windows.Forms.Label()
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox5.SuspendLayout()
        CType(Me.C1Tab2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.C1Tab2.SuspendLayout()
        Me.C2TapPage1.SuspendLayout()
        CType(Me.c1fgItems, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.C2TapPage2.SuspendLayout()
        Me.Panel2.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.GroupBox1.Controls.Add(Me.Label9)
        Me.GroupBox1.Controls.Add(Me.CbxEarning)
        Me.GroupBox1.Controls.Add(Me.btnExcel)
        Me.GroupBox1.Controls.Add(Me.Btnprocess)
        Me.GroupBox1.Controls.Add(Me.dtpEntryDate)
        Me.GroupBox1.Controls.Add(Me.btnPickList)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.TxtEntryno)
        Me.GroupBox1.Controls.Add(Me.CbxCategory)
        Me.GroupBox1.Controls.Add(Me.Label29)
        Me.GroupBox1.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox1.Location = New System.Drawing.Point(1, 74)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(833, 134)
        Me.GroupBox1.TabIndex = 1
        Me.GroupBox1.TabStop = False
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label9.Location = New System.Drawing.Point(18, 89)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(51, 16)
        Me.Label9.TabIndex = 175
        Me.Label9.Text = "Earning"
        '
        'CbxEarning
        '
        Me.CbxEarning.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.CbxEarning.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.CbxEarning.FormattingEnabled = True
        Me.CbxEarning.Location = New System.Drawing.Point(91, 89)
        Me.CbxEarning.Name = "CbxEarning"
        Me.CbxEarning.Size = New System.Drawing.Size(159, 24)
        Me.CbxEarning.TabIndex = 174
        '
        'btnExcel
        '
        Me.btnExcel.BackColor = System.Drawing.Color.Green
        Me.btnExcel.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnExcel.ForeColor = System.Drawing.Color.White
        Me.btnExcel.Location = New System.Drawing.Point(437, 89)
        Me.btnExcel.Name = "btnExcel"
        Me.btnExcel.Size = New System.Drawing.Size(75, 28)
        Me.btnExcel.TabIndex = 170
        Me.btnExcel.Text = "Excel"
        Me.btnExcel.UseVisualStyleBackColor = False
        '
        'Btnprocess
        '
        Me.Btnprocess.BackColor = System.Drawing.Color.Crimson
        Me.Btnprocess.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Btnprocess.ForeColor = System.Drawing.SystemColors.ButtonHighlight
        Me.Btnprocess.Location = New System.Drawing.Point(326, 89)
        Me.Btnprocess.Name = "Btnprocess"
        Me.Btnprocess.Size = New System.Drawing.Size(96, 28)
        Me.Btnprocess.TabIndex = 169
        Me.Btnprocess.Text = "Process"
        Me.Btnprocess.UseVisualStyleBackColor = False
        '
        'dtpEntryDate
        '
        Me.dtpEntryDate.Checked = False
        Me.dtpEntryDate.CustomFormat = "dd/MM/yyyy"
        Me.dtpEntryDate.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dtpEntryDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom
        Me.dtpEntryDate.Location = New System.Drawing.Point(302, 29)
        Me.dtpEntryDate.MinDate = New Date(2011, 4, 1, 0, 0, 0, 0)
        Me.dtpEntryDate.Name = "dtpEntryDate"
        Me.dtpEntryDate.Size = New System.Drawing.Size(97, 23)
        Me.dtpEntryDate.TabIndex = 2
        Me.dtpEntryDate.Value = New Date(2011, 12, 26, 18, 17, 10, 0)
        '
        'btnPickList
        '
        Me.btnPickList.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.btnPickList.BackgroundImage = Global.LS_HRD.My.Resources.Resources.eSearch
        Me.btnPickList.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.btnPickList.Enabled = False
        Me.btnPickList.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnPickList.ForeColor = System.Drawing.Color.Black
        Me.btnPickList.Location = New System.Drawing.Point(256, 26)
        Me.btnPickList.Name = "btnPickList"
        Me.btnPickList.Size = New System.Drawing.Size(28, 26)
        Me.btnPickList.TabIndex = 0
        Me.btnPickList.TabStop = False
        Me.btnPickList.UseVisualStyleBackColor = False
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(18, 26)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(61, 16)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Entry No:"
        '
        'TxtEntryno
        '
        Me.TxtEntryno.BackColor = System.Drawing.SystemColors.Info
        Me.TxtEntryno.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.TxtEntryno.Location = New System.Drawing.Point(91, 26)
        Me.TxtEntryno.Name = "TxtEntryno"
        Me.TxtEntryno.ReadOnly = True
        Me.TxtEntryno.Size = New System.Drawing.Size(159, 23)
        Me.TxtEntryno.TabIndex = 1
        '
        'CbxCategory
        '
        Me.CbxCategory.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.CbxCategory.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.CbxCategory.FormattingEnabled = True
        Me.CbxCategory.Location = New System.Drawing.Point(91, 55)
        Me.CbxCategory.Name = "CbxCategory"
        Me.CbxCategory.Size = New System.Drawing.Size(159, 24)
        Me.CbxCategory.TabIndex = 1
        '
        'Label29
        '
        Me.Label29.AutoSize = True
        Me.Label29.BackColor = System.Drawing.Color.Transparent
        Me.Label29.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label29.Location = New System.Drawing.Point(1, 58)
        Me.Label29.Name = "Label29"
        Me.Label29.Size = New System.Drawing.Size(84, 16)
        Me.Label29.TabIndex = 0
        Me.Label29.Text = "Department :"
        '
        'GroupBox5
        '
        Me.GroupBox5.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.GroupBox5.Controls.Add(Me.btnClear)
        Me.GroupBox5.Controls.Add(Me.btnReset)
        Me.GroupBox5.Controls.Add(Me.btnApply)
        Me.GroupBox5.Controls.Add(Me.btnClose)
        Me.GroupBox5.Location = New System.Drawing.Point(1, 545)
        Me.GroupBox5.Name = "GroupBox5"
        Me.GroupBox5.Size = New System.Drawing.Size(833, 58)
        Me.GroupBox5.TabIndex = 3
        Me.GroupBox5.TabStop = False
        '
        'btnClear
        '
        Me.btnClear.BackColor = System.Drawing.Color.White
        Me.btnClear.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnClear.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnClear.ForeColor = System.Drawing.SystemColors.HotTrack
        Me.btnClear.Image = Global.LS_HRD.My.Resources.Resources.Data_Erase
        Me.btnClear.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnClear.Location = New System.Drawing.Point(302, 22)
        Me.btnClear.Name = "btnClear"
        Me.btnClear.Size = New System.Drawing.Size(79, 29)
        Me.btnClear.TabIndex = 535
        Me.btnClear.Text = "CLEAR"
        Me.btnClear.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnClear.UseVisualStyleBackColor = False
        '
        'btnReset
        '
        Me.btnReset.BackColor = System.Drawing.Color.White
        Me.btnReset.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnReset.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnReset.ForeColor = System.Drawing.SystemColors.HotTrack
        Me.btnReset.Image = Global.LS_HRD.My.Resources.Resources.reload
        Me.btnReset.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnReset.Location = New System.Drawing.Point(388, 22)
        Me.btnReset.Name = "btnReset"
        Me.btnReset.Size = New System.Drawing.Size(96, 29)
        Me.btnReset.TabIndex = 534
        Me.btnReset.Text = "REFRESH"
        Me.btnReset.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnReset.UseVisualStyleBackColor = False
        '
        'btnApply
        '
        Me.btnApply.BackColor = System.Drawing.Color.White
        Me.btnApply.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnApply.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnApply.ForeColor = System.Drawing.SystemColors.HotTrack
        Me.btnApply.Image = Global.LS_HRD.My.Resources.Resources.Save_01_WF_md
        Me.btnApply.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnApply.Location = New System.Drawing.Point(216, 22)
        Me.btnApply.Name = "btnApply"
        Me.btnApply.Size = New System.Drawing.Size(79, 29)
        Me.btnApply.TabIndex = 533
        Me.btnApply.Text = "Apply"
        Me.btnApply.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnApply.UseVisualStyleBackColor = False
        '
        'btnClose
        '
        Me.btnClose.BackColor = System.Drawing.Color.White
        Me.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnClose.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnClose.ForeColor = System.Drawing.SystemColors.HotTrack
        Me.btnClose.Image = Global.LS_HRD.My.Resources.Resources.Wrong_WF_md
        Me.btnClose.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnClose.Location = New System.Drawing.Point(491, 22)
        Me.btnClose.Name = "btnClose"
        Me.btnClose.Size = New System.Drawing.Size(79, 29)
        Me.btnClose.TabIndex = 532
        Me.btnClose.Text = "CLOSE"
        Me.btnClose.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnClose.UseVisualStyleBackColor = False
        '
        'C1Tab2
        '
        Me.C1Tab2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.C1Tab2.Controls.Add(Me.C2TapPage1)
        Me.C1Tab2.Controls.Add(Me.C2TapPage2)
        Me.C1Tab2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.C1Tab2.Location = New System.Drawing.Point(4, 207)
        Me.C1Tab2.Name = "C1Tab2"
        Me.C1Tab2.SelectedIndex = 4
        Me.C1Tab2.SelectedTabBold = True
        Me.C1Tab2.Size = New System.Drawing.Size(830, 336)
        Me.C1Tab2.TabAreaBackColor = System.Drawing.SystemColors.ButtonFace
        Me.C1Tab2.TabIndex = 2
        Me.C1Tab2.TabsSpacing = 0
        Me.C1Tab2.VisualStyle = C1.Win.C1Command.VisualStyle.Custom
        '
        'C2TapPage1
        '
        Me.C2TapPage1.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.C2TapPage1.Controls.Add(Me.Label4)
        Me.C2TapPage1.Controls.Add(Me.TxttotOT_Amt)
        Me.C2TapPage1.Controls.Add(Me.c1fgItems)
        Me.C2TapPage1.Controls.Add(Me.Label2)
        Me.C2TapPage1.Controls.Add(Me.lblTotalCount)
        Me.C2TapPage1.Controls.Add(Me.Label23)
        Me.C2TapPage1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.C2TapPage1.Location = New System.Drawing.Point(1, 24)
        Me.C2TapPage1.Name = "C2TapPage1"
        Me.C2TapPage1.Size = New System.Drawing.Size(828, 311)
        Me.C2TapPage1.TabBackColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.C2TapPage1.TabBackColorSelected = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.C2TapPage1.TabIndex = 0
        Me.C2TapPage1.Text = "Line Item"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.BackColor = System.Drawing.Color.Transparent
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(471, 291)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(112, 16)
        Me.Label4.TabIndex = 204
        Me.Label4.Text = "Total OT Amount:"
        '
        'TxttotOT_Amt
        '
        Me.TxttotOT_Amt.BackColor = System.Drawing.SystemColors.Info
        Me.TxttotOT_Amt.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.TxttotOT_Amt.Location = New System.Drawing.Point(642, 284)
        Me.TxttotOT_Amt.Name = "TxttotOT_Amt"
        Me.TxttotOT_Amt.Size = New System.Drawing.Size(97, 22)
        Me.TxttotOT_Amt.TabIndex = 203
        '
        'c1fgItems
        '
        Me.c1fgItems.BorderStyle = C1.Win.C1FlexGrid.Util.BaseControls.BorderStyleEnum.FixedSingle
        Me.c1fgItems.ColumnInfo = "10,1,0,0,0,105,Columns:"
        Me.c1fgItems.Editable = C1.Win.C1FlexGrid.Classic.EditableSettings.flexEDKbdMouse
        Me.c1fgItems.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.c1fgItems.GridColorFixed = System.Drawing.SystemColors.ControlDark
        Me.c1fgItems.Location = New System.Drawing.Point(3, 3)
        Me.c1fgItems.Name = "c1fgItems"
        Me.c1fgItems.NodeClosedPicture = Nothing
        Me.c1fgItems.NodeOpenPicture = Nothing
        Me.c1fgItems.OutlineCol = -1
        Me.c1fgItems.RowHeightMin = 25
        Me.c1fgItems.Rows = 25
        Me.c1fgItems.ShowSortPosition = C1.Win.C1FlexGrid.ShowSortPositionEnum.None
        Me.c1fgItems.Size = New System.Drawing.Size(814, 278)
        Me.c1fgItems.StyleInfo = resources.GetString("c1fgItems.StyleInfo")
        Me.c1fgItems.TabIndex = 200
        Me.c1fgItems.TreeColor = System.Drawing.Color.DarkGray
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.BackColor = System.Drawing.Color.Transparent
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(7, 288)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(45, 16)
        Me.Label2.TabIndex = 164
        Me.Label2.Text = "Count:"
        '
        'lblTotalCount
        '
        Me.lblTotalCount.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.lblTotalCount.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblTotalCount.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblTotalCount.ForeColor = System.Drawing.Color.Blue
        Me.lblTotalCount.Location = New System.Drawing.Point(56, 278)
        Me.lblTotalCount.Name = "lblTotalCount"
        Me.lblTotalCount.Size = New System.Drawing.Size(47, 32)
        Me.lblTotalCount.TabIndex = 13
        Me.lblTotalCount.Text = "0"
        Me.lblTotalCount.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label23
        '
        Me.Label23.AutoSize = True
        Me.Label23.BackColor = System.Drawing.Color.Transparent
        Me.Label23.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label23.Location = New System.Drawing.Point(256, 13)
        Me.Label23.Name = "Label23"
        Me.Label23.Size = New System.Drawing.Size(11, 16)
        Me.Label23.TabIndex = 47
        Me.Label23.Text = " "
        '
        'C2TapPage2
        '
        Me.C2TapPage2.CaptionText = "Delivery Details"
        Me.C2TapPage2.Controls.Add(Me.txtOthers)
        Me.C2TapPage2.Location = New System.Drawing.Point(1, 24)
        Me.C2TapPage2.Name = "C2TapPage2"
        Me.C2TapPage2.Size = New System.Drawing.Size(828, 311)
        Me.C2TapPage2.TabBackColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.C2TapPage2.TabBackColorSelected = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.C2TapPage2.TabIndex = 0
        Me.C2TapPage2.Text = "Others"
        '
        'txtOthers
        '
        Me.txtOthers.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtOthers.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtOthers.Location = New System.Drawing.Point(134, 38)
        Me.txtOthers.Multiline = True
        Me.txtOthers.Name = "txtOthers"
        Me.txtOthers.Size = New System.Drawing.Size(434, 177)
        Me.txtOthers.TabIndex = 0
        '
        'OpenFileSelect
        '
        Me.OpenFileSelect.FileName = "Select "
        '
        'Label60
        '
        Me.Label60.BackColor = System.Drawing.SystemColors.HotTrack
        Me.Label60.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Label60.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label60.ForeColor = System.Drawing.Color.WhiteSmoke
        Me.Label60.Location = New System.Drawing.Point(0, 606)
        Me.Label60.Name = "Label60"
        Me.Label60.Size = New System.Drawing.Size(834, 5)
        Me.Label60.TabIndex = 521
        Me.Label60.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Panel2
        '
        Me.Panel2.BackColor = System.Drawing.SystemColors.GradientActiveCaption
        Me.Panel2.Controls.Add(Me.btnMail)
        Me.Panel2.Controls.Add(Me.btnprint)
        Me.Panel2.Controls.Add(Me.Label5)
        Me.Panel2.Controls.Add(Me.btnInformation)
        Me.Panel2.Controls.Add(Me.cbxNumberType)
        Me.Panel2.Controls.Add(Me.cbxScreenMode)
        Me.Panel2.Controls.Add(Me.lblCaption)
        Me.Panel2.Dock = System.Windows.Forms.DockStyle.Top
        Me.Panel2.Location = New System.Drawing.Point(0, 0)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Size = New System.Drawing.Size(834, 67)
        Me.Panel2.TabIndex = 522
        '
        'btnMail
        '
        Me.btnMail.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.btnMail.BackgroundImage = Global.LS_HRD.My.Resources.Resources.mail
        Me.btnMail.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.btnMail.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnMail.ForeColor = System.Drawing.Color.Black
        Me.btnMail.Location = New System.Drawing.Point(794, 3)
        Me.btnMail.Name = "btnMail"
        Me.btnMail.Size = New System.Drawing.Size(28, 26)
        Me.btnMail.TabIndex = 13
        Me.btnMail.UseVisualStyleBackColor = False
        '
        'btnprint
        '
        Me.btnprint.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.btnprint.BackgroundImage = Global.LS_HRD.My.Resources.Resources.print
        Me.btnprint.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.btnprint.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnprint.ForeColor = System.Drawing.Color.Black
        Me.btnprint.Location = New System.Drawing.Point(760, 3)
        Me.btnprint.Name = "btnprint"
        Me.btnprint.Size = New System.Drawing.Size(28, 26)
        Me.btnprint.TabIndex = 12
        Me.btnprint.UseVisualStyleBackColor = False
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.BackColor = System.Drawing.Color.Transparent
        Me.Label5.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.Location = New System.Drawing.Point(214, 41)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(102, 16)
        Me.Label5.TabIndex = 1
        Me.Label5.Text = "Numbering Type"
        '
        'btnInformation
        '
        Me.btnInformation.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.btnInformation.BackgroundImage = Global.LS_HRD.My.Resources.Resources.i
        Me.btnInformation.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.btnInformation.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnInformation.ForeColor = System.Drawing.Color.Black
        Me.btnInformation.Location = New System.Drawing.Point(726, 3)
        Me.btnInformation.Name = "btnInformation"
        Me.btnInformation.Size = New System.Drawing.Size(28, 26)
        Me.btnInformation.TabIndex = 11
        Me.btnInformation.UseVisualStyleBackColor = False
        '
        'cbxNumberType
        '
        Me.cbxNumberType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cbxNumberType.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbxNumberType.FormattingEnabled = True
        Me.cbxNumberType.Location = New System.Drawing.Point(327, 38)
        Me.cbxNumberType.Name = "cbxNumberType"
        Me.cbxNumberType.Size = New System.Drawing.Size(251, 24)
        Me.cbxNumberType.TabIndex = 1
        '
        'cbxScreenMode
        '
        Me.cbxScreenMode.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cbxScreenMode.Font = New System.Drawing.Font("Tahoma", 9.75!)
        Me.cbxScreenMode.FormattingEnabled = True
        Me.cbxScreenMode.Location = New System.Drawing.Point(13, 38)
        Me.cbxScreenMode.Name = "cbxScreenMode"
        Me.cbxScreenMode.Size = New System.Drawing.Size(102, 24)
        Me.cbxScreenMode.TabIndex = 0
        '
        'lblCaption
        '
        Me.lblCaption.BackColor = System.Drawing.SystemColors.HotTrack
        Me.lblCaption.Dock = System.Windows.Forms.DockStyle.Top
        Me.lblCaption.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblCaption.ForeColor = System.Drawing.Color.WhiteSmoke
        Me.lblCaption.Location = New System.Drawing.Point(0, 0)
        Me.lblCaption.Name = "lblCaption"
        Me.lblCaption.Size = New System.Drawing.Size(834, 32)
        Me.lblCaption.TabIndex = 10
        Me.lblCaption.Text = "Mechanic Incentive Entry"
        Me.lblCaption.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'FrmIns_MechanicIncentive_Entry
        '
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None
        Me.BackColor = System.Drawing.Color.Gainsboro
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(834, 611)
        Me.Controls.Add(Me.Panel2)
        Me.Controls.Add(Me.Label60)
        Me.Controls.Add(Me.C1Tab2)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.GroupBox5)
        Me.DoubleBuffered = True
        Me.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "FrmIns_MechanicIncentive_Entry"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Mechanic Incentive Entry"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.GroupBox5.ResumeLayout(False)
        CType(Me.C1Tab2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.C1Tab2.ResumeLayout(False)
        Me.C2TapPage1.ResumeLayout(False)
        Me.C2TapPage1.PerformLayout()
        CType(Me.c1fgItems, System.ComponentModel.ISupportInitialize).EndInit()
        Me.C2TapPage2.ResumeLayout(False)
        Me.C2TapPage2.PerformLayout()
        Me.Panel2.ResumeLayout(False)
        Me.Panel2.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents TxtEntryno As System.Windows.Forms.TextBox
    Friend WithEvents GroupBox5 As System.Windows.Forms.GroupBox
    Friend WithEvents btnPickList As System.Windows.Forms.Button
    Friend WithEvents C1Tab2 As C1.Win.C1Command.C1DockingTab
    Friend WithEvents C2TapPage1 As C1.Win.C1Command.C1DockingTabPage
    Friend WithEvents Label23 As System.Windows.Forms.Label
    Friend WithEvents Label29 As System.Windows.Forms.Label
    Friend WithEvents C2TapPage2 As C1.Win.C1Command.C1DockingTabPage
    Friend WithEvents txtOthers As System.Windows.Forms.TextBox
    Friend WithEvents CbxCategory As System.Windows.Forms.ComboBox
    Friend WithEvents dtpEntryDate As System.Windows.Forms.DateTimePicker
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents lblTotalCount As System.Windows.Forms.Label
    Friend WithEvents Btnprocess As System.Windows.Forms.Button
    Friend WithEvents c1fgItems As C1.Win.C1FlexGrid.Classic.C1FlexGridClassic
    Friend WithEvents btnExcel As System.Windows.Forms.Button
    Friend WithEvents OpenFileSelect As System.Windows.Forms.OpenFileDialog
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents TxttotOT_Amt As System.Windows.Forms.TextBox
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents CbxEarning As System.Windows.Forms.ComboBox
    Friend WithEvents btnClear As System.Windows.Forms.Button
    Friend WithEvents btnReset As System.Windows.Forms.Button
    Friend WithEvents btnApply As System.Windows.Forms.Button
    Friend WithEvents btnClose As System.Windows.Forms.Button
    Friend WithEvents Label60 As System.Windows.Forms.Label
    Friend WithEvents Panel2 As System.Windows.Forms.Panel
    Friend WithEvents btnMail As System.Windows.Forms.Button
    Friend WithEvents btnprint As System.Windows.Forms.Button
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents btnInformation As System.Windows.Forms.Button
    Friend WithEvents cbxNumberType As System.Windows.Forms.ComboBox
    Friend WithEvents cbxScreenMode As System.Windows.Forms.ComboBox
    Friend WithEvents lblCaption As System.Windows.Forms.Label
End Class
