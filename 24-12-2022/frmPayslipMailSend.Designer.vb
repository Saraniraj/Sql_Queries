<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class frmPayslipMailSend
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
        Me.components = New System.ComponentModel.Container()
        Dim DataGridViewCellStyle1 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmPayslipMailSend))
        Me.toolStripComboBox_RecordPerPage = New System.Windows.Forms.ToolStripComboBox()
        Me.CbxOrderby = New System.Windows.Forms.ComboBox()
        Me.label6 = New System.Windows.Forms.Label()
        Me.CbxDesignation = New System.Windows.Forms.ComboBox()
        Me.lbl_Company = New System.Windows.Forms.Label()
        Me.btn_Export = New System.Windows.Forms.Button()
        Me.btn_Go = New System.Windows.Forms.Button()
        Me.panel2 = New System.Windows.Forms.Panel()
        Me.Chkselectall = New System.Windows.Forms.CheckBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.chkall = New System.Windows.Forms.CheckBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Dtpfromdate = New System.Windows.Forms.DateTimePicker()
        Me.toolStripLabel2 = New System.Windows.Forms.ToolStripLabel()
        Me.toolStripSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.bindingNavigatorEditItem = New System.Windows.Forms.ToolStripButton()
        Me.bindingNavigatorSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.bindingNavigatorMoveLastItem = New System.Windows.Forms.ToolStripButton()
        Me.bindingNavigatorMoveNextItem = New System.Windows.Forms.ToolStripButton()
        Me.bindingNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.bindingNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox()
        Me.bindingNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator()
        Me.bindingNavigatorMovePreviousItem = New System.Windows.Forms.ToolStripButton()
        Me.bindingNavigatorMoveFirstItem = New System.Windows.Forms.ToolStripButton()
        Me.bindingNavigatorDeleteItem = New System.Windows.Forms.ToolStripButton()
        Me.bindingNavigatorCountItem = New System.Windows.Forms.ToolStripLabel()
        Me.bindingNavigatorAddNewItem = New System.Windows.Forms.ToolStripButton()
        Me.bindingNavigator1 = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.dgvReport = New System.Windows.Forms.DataGridView()
        Me.bindingSource1 = New System.Windows.Forms.BindingSource(Me.components)
        Me.lstopt = New System.Windows.Forms.CheckedListBox()
        Me.btmailsend = New System.Windows.Forms.Button()
        Me.Column1 = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.EmployeeId = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EmploeeCode = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EmployeeName = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.FingerId = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.CatName = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Department = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.UanNo = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ESINo = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.OldBalance = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Advance = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AdvanceLess = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Present = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.GrossAmount = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PF = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ESI = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.LOPAmount = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NetSalary = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AdvanceBalance = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.MailID = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Status = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.lblCaption = New System.Windows.Forms.Label()
        Me.panel2.SuspendLayout()
        CType(Me.bindingNavigator1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.bindingNavigator1.SuspendLayout()
        CType(Me.dgvReport, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.bindingSource1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Panel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'toolStripComboBox_RecordPerPage
        '
        Me.toolStripComboBox_RecordPerPage.BackColor = System.Drawing.SystemColors.Window
        Me.toolStripComboBox_RecordPerPage.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.toolStripComboBox_RecordPerPage.FlatStyle = System.Windows.Forms.FlatStyle.System
        Me.toolStripComboBox_RecordPerPage.Items.AddRange(New Object() {"All", "10", "20", "50", "100", "500"})
        Me.toolStripComboBox_RecordPerPage.Name = "toolStripComboBox_RecordPerPage"
        Me.toolStripComboBox_RecordPerPage.Size = New System.Drawing.Size(140, 25)
        '
        'CbxOrderby
        '
        Me.CbxOrderby.FormattingEnabled = True
        Me.CbxOrderby.Items.AddRange(New Object() {"All", "Working", "Resigned"})
        Me.CbxOrderby.Location = New System.Drawing.Point(546, 60)
        Me.CbxOrderby.Name = "CbxOrderby"
        Me.CbxOrderby.Size = New System.Drawing.Size(111, 22)
        Me.CbxOrderby.TabIndex = 57
        '
        'label6
        '
        Me.label6.AutoSize = True
        Me.label6.Location = New System.Drawing.Point(472, 62)
        Me.label6.Name = "label6"
        Me.label6.Size = New System.Drawing.Size(58, 14)
        Me.label6.TabIndex = 56
        Me.label6.Text = "Order BY"
        '
        'CbxDesignation
        '
        Me.CbxDesignation.FormattingEnabled = True
        Me.CbxDesignation.Location = New System.Drawing.Point(546, 27)
        Me.CbxDesignation.Name = "CbxDesignation"
        Me.CbxDesignation.Size = New System.Drawing.Size(114, 22)
        Me.CbxDesignation.TabIndex = 53
        '
        'lbl_Company
        '
        Me.lbl_Company.AutoSize = True
        Me.lbl_Company.Location = New System.Drawing.Point(458, 35)
        Me.lbl_Company.Name = "lbl_Company"
        Me.lbl_Company.Size = New System.Drawing.Size(72, 14)
        Me.lbl_Company.TabIndex = 52
        Me.lbl_Company.Text = "Designation"
        '
        'btn_Export
        '
        Me.btn_Export.Location = New System.Drawing.Point(762, 58)
        Me.btn_Export.Name = "btn_Export"
        Me.btn_Export.Size = New System.Drawing.Size(75, 24)
        Me.btn_Export.TabIndex = 22
        Me.btn_Export.Text = "Export"
        Me.btn_Export.UseVisualStyleBackColor = True
        '
        'btn_Go
        '
        Me.btn_Go.Location = New System.Drawing.Point(700, 58)
        Me.btn_Go.Name = "btn_Go"
        Me.btn_Go.Size = New System.Drawing.Size(56, 24)
        Me.btn_Go.TabIndex = 18
        Me.btn_Go.Text = "Go"
        Me.btn_Go.UseVisualStyleBackColor = True
        '
        'panel2
        '
        Me.panel2.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.panel2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.panel2.Controls.Add(Me.btmailsend)
        Me.panel2.Controls.Add(Me.lstopt)
        Me.panel2.Controls.Add(Me.Chkselectall)
        Me.panel2.Controls.Add(Me.Label4)
        Me.panel2.Controls.Add(Me.chkall)
        Me.panel2.Controls.Add(Me.Label1)
        Me.panel2.Controls.Add(Me.Dtpfromdate)
        Me.panel2.Controls.Add(Me.CbxOrderby)
        Me.panel2.Controls.Add(Me.label6)
        Me.panel2.Controls.Add(Me.CbxDesignation)
        Me.panel2.Controls.Add(Me.lbl_Company)
        Me.panel2.Controls.Add(Me.btn_Export)
        Me.panel2.Controls.Add(Me.btn_Go)
        Me.panel2.Location = New System.Drawing.Point(0, 72)
        Me.panel2.Name = "panel2"
        Me.panel2.Size = New System.Drawing.Size(1042, 162)
        Me.panel2.TabIndex = 17
        '
        'Chkselectall
        '
        Me.Chkselectall.AutoSize = True
        Me.Chkselectall.Checked = True
        Me.Chkselectall.CheckState = System.Windows.Forms.CheckState.Checked
        Me.Chkselectall.Font = New System.Drawing.Font("Bookman Old Style", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Chkselectall.Location = New System.Drawing.Point(11, 139)
        Me.Chkselectall.Name = "Chkselectall"
        Me.Chkselectall.Size = New System.Drawing.Size(163, 18)
        Me.Chkselectall.TabIndex = 25
        Me.Chkselectall.Text = "Select All Employees"
        Me.Chkselectall.UseVisualStyleBackColor = True
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Font = New System.Drawing.Font("Cambria", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(7, 46)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(73, 19)
        Me.Label4.TabIndex = 78
        Me.Label4.Text = "Category"
        '
        'chkall
        '
        Me.chkall.AutoSize = True
        Me.chkall.Location = New System.Drawing.Point(11, 102)
        Me.chkall.Name = "chkall"
        Me.chkall.Size = New System.Drawing.Size(77, 18)
        Me.chkall.TabIndex = 76
        Me.chkall.Text = "Select All"
        Me.chkall.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(666, 30)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(31, 14)
        Me.Label1.TabIndex = 71
        Me.Label1.Text = "Date"
        '
        'Dtpfromdate
        '
        Me.Dtpfromdate.CustomFormat = "dd-MM-yyyy"
        Me.Dtpfromdate.Format = System.Windows.Forms.DateTimePickerFormat.Custom
        Me.Dtpfromdate.Location = New System.Drawing.Point(762, 24)
        Me.Dtpfromdate.Name = "Dtpfromdate"
        Me.Dtpfromdate.Size = New System.Drawing.Size(92, 22)
        Me.Dtpfromdate.TabIndex = 70
        '
        'toolStripLabel2
        '
        Me.toolStripLabel2.BackColor = System.Drawing.Color.Black
        Me.toolStripLabel2.ForeColor = System.Drawing.Color.Black
        Me.toolStripLabel2.Name = "toolStripLabel2"
        Me.toolStripLabel2.Size = New System.Drawing.Size(128, 22)
        Me.toolStripLabel2.Text = "        Records Per Page  "
        '
        'toolStripSeparator1
        '
        Me.toolStripSeparator1.Name = "toolStripSeparator1"
        Me.toolStripSeparator1.Size = New System.Drawing.Size(6, 25)
        '
        'bindingNavigatorEditItem
        '
        Me.bindingNavigatorEditItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.bindingNavigatorEditItem.Enabled = False
        Me.bindingNavigatorEditItem.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.bindingNavigatorEditItem.Name = "bindingNavigatorEditItem"
        Me.bindingNavigatorEditItem.Size = New System.Drawing.Size(23, 22)
        Me.bindingNavigatorEditItem.Text = "Edit"
        '
        'bindingNavigatorSeparator2
        '
        Me.bindingNavigatorSeparator2.Name = "bindingNavigatorSeparator2"
        Me.bindingNavigatorSeparator2.Size = New System.Drawing.Size(6, 25)
        '
        'bindingNavigatorMoveLastItem
        '
        Me.bindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.bindingNavigatorMoveLastItem.Name = "bindingNavigatorMoveLastItem"
        Me.bindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = True
        Me.bindingNavigatorMoveLastItem.Size = New System.Drawing.Size(23, 22)
        Me.bindingNavigatorMoveLastItem.Text = "Move last"
        '
        'bindingNavigatorMoveNextItem
        '
        Me.bindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.bindingNavigatorMoveNextItem.Name = "bindingNavigatorMoveNextItem"
        Me.bindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = True
        Me.bindingNavigatorMoveNextItem.Size = New System.Drawing.Size(23, 22)
        Me.bindingNavigatorMoveNextItem.Text = "Move next"
        '
        'bindingNavigatorSeparator1
        '
        Me.bindingNavigatorSeparator1.Name = "bindingNavigatorSeparator1"
        Me.bindingNavigatorSeparator1.Size = New System.Drawing.Size(6, 25)
        '
        'bindingNavigatorPositionItem
        '
        Me.bindingNavigatorPositionItem.AccessibleName = "Position"
        Me.bindingNavigatorPositionItem.AutoSize = False
        Me.bindingNavigatorPositionItem.Name = "bindingNavigatorPositionItem"
        Me.bindingNavigatorPositionItem.Size = New System.Drawing.Size(58, 23)
        Me.bindingNavigatorPositionItem.Text = "0"
        Me.bindingNavigatorPositionItem.ToolTipText = "Current position"
        '
        'bindingNavigatorSeparator
        '
        Me.bindingNavigatorSeparator.Name = "bindingNavigatorSeparator"
        Me.bindingNavigatorSeparator.Size = New System.Drawing.Size(6, 25)
        '
        'bindingNavigatorMovePreviousItem
        '
        Me.bindingNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.bindingNavigatorMovePreviousItem.Name = "bindingNavigatorMovePreviousItem"
        Me.bindingNavigatorMovePreviousItem.RightToLeftAutoMirrorImage = True
        Me.bindingNavigatorMovePreviousItem.Size = New System.Drawing.Size(23, 22)
        Me.bindingNavigatorMovePreviousItem.Text = "Move previous"
        '
        'bindingNavigatorMoveFirstItem
        '
        Me.bindingNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.bindingNavigatorMoveFirstItem.Name = "bindingNavigatorMoveFirstItem"
        Me.bindingNavigatorMoveFirstItem.RightToLeftAutoMirrorImage = True
        Me.bindingNavigatorMoveFirstItem.Size = New System.Drawing.Size(23, 22)
        Me.bindingNavigatorMoveFirstItem.Text = "Move first"
        '
        'bindingNavigatorDeleteItem
        '
        Me.bindingNavigatorDeleteItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.bindingNavigatorDeleteItem.Enabled = False
        Me.bindingNavigatorDeleteItem.Name = "bindingNavigatorDeleteItem"
        Me.bindingNavigatorDeleteItem.RightToLeftAutoMirrorImage = True
        Me.bindingNavigatorDeleteItem.Size = New System.Drawing.Size(23, 22)
        Me.bindingNavigatorDeleteItem.Text = "Delete"
        '
        'bindingNavigatorCountItem
        '
        Me.bindingNavigatorCountItem.BackColor = System.Drawing.Color.Black
        Me.bindingNavigatorCountItem.ForeColor = System.Drawing.Color.Black
        Me.bindingNavigatorCountItem.Name = "bindingNavigatorCountItem"
        Me.bindingNavigatorCountItem.Size = New System.Drawing.Size(35, 22)
        Me.bindingNavigatorCountItem.Text = "of {0}"
        Me.bindingNavigatorCountItem.ToolTipText = "Total number of items"
        '
        'bindingNavigatorAddNewItem
        '
        Me.bindingNavigatorAddNewItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.bindingNavigatorAddNewItem.DoubleClickEnabled = True
        Me.bindingNavigatorAddNewItem.Enabled = False
        Me.bindingNavigatorAddNewItem.Name = "bindingNavigatorAddNewItem"
        Me.bindingNavigatorAddNewItem.RightToLeftAutoMirrorImage = True
        Me.bindingNavigatorAddNewItem.Size = New System.Drawing.Size(23, 22)
        Me.bindingNavigatorAddNewItem.Text = "Add new"
        '
        'bindingNavigator1
        '
        Me.bindingNavigator1.AddNewItem = Me.bindingNavigatorAddNewItem
        Me.bindingNavigator1.CountItem = Me.bindingNavigatorCountItem
        Me.bindingNavigator1.DeleteItem = Me.bindingNavigatorDeleteItem
        Me.bindingNavigator1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.bindingNavigator1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.bindingNavigatorMoveFirstItem, Me.bindingNavigatorMovePreviousItem, Me.bindingNavigatorSeparator, Me.bindingNavigatorPositionItem, Me.bindingNavigatorCountItem, Me.bindingNavigatorSeparator1, Me.bindingNavigatorMoveNextItem, Me.bindingNavigatorMoveLastItem, Me.bindingNavigatorSeparator2, Me.bindingNavigatorAddNewItem, Me.bindingNavigatorEditItem, Me.bindingNavigatorDeleteItem, Me.toolStripSeparator1, Me.toolStripLabel2, Me.toolStripComboBox_RecordPerPage})
        Me.bindingNavigator1.Location = New System.Drawing.Point(0, 509)
        Me.bindingNavigator1.MoveFirstItem = Me.bindingNavigatorMoveFirstItem
        Me.bindingNavigator1.MoveLastItem = Me.bindingNavigatorMoveLastItem
        Me.bindingNavigator1.MoveNextItem = Me.bindingNavigatorMoveNextItem
        Me.bindingNavigator1.MovePreviousItem = Me.bindingNavigatorMovePreviousItem
        Me.bindingNavigator1.Name = "bindingNavigator1"
        Me.bindingNavigator1.PositionItem = Me.bindingNavigatorPositionItem
        Me.bindingNavigator1.Size = New System.Drawing.Size(1044, 25)
        Me.bindingNavigator1.TabIndex = 18
        Me.bindingNavigator1.Text = "bindingNavigator1"
        '
        'dgvReport
        '
        Me.dgvReport.AllowUserToAddRows = False
        Me.dgvReport.AllowUserToDeleteRows = False
        Me.dgvReport.BackgroundColor = System.Drawing.Color.White
        Me.dgvReport.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Sunken
        DataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle1.BackColor = System.Drawing.Color.FromArgb(CType(CType(52, Byte), Integer), CType(CType(52, Byte), Integer), CType(CType(52, Byte), Integer))
        DataGridViewCellStyle1.Font = New System.Drawing.Font("Cambria", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.Info
        DataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.dgvReport.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle1
        Me.dgvReport.ColumnHeadersHeight = 25
        Me.dgvReport.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.Column1, Me.EmployeeId, Me.EmploeeCode, Me.EmployeeName, Me.FingerId, Me.CatName, Me.Department, Me.UanNo, Me.ESINo, Me.OldBalance, Me.Advance, Me.AdvanceLess, Me.Present, Me.GrossAmount, Me.PF, Me.ESI, Me.LOPAmount, Me.NetSalary, Me.AdvanceBalance, Me.MailID, Me.Status})
        Me.dgvReport.Location = New System.Drawing.Point(0, 240)
        Me.dgvReport.Name = "dgvReport"
        Me.dgvReport.RowHeadersVisible = False
        Me.dgvReport.RowTemplate.DefaultCellStyle.ForeColor = System.Drawing.Color.Black
        Me.dgvReport.Size = New System.Drawing.Size(1042, 269)
        Me.dgvReport.TabIndex = 19
        '
        'lstopt
        '
        Me.lstopt.FormattingEnabled = True
        Me.lstopt.Location = New System.Drawing.Point(112, 20)
        Me.lstopt.Name = "lstopt"
        Me.lstopt.Size = New System.Drawing.Size(272, 109)
        Me.lstopt.TabIndex = 79
        '
        'btmailsend
        '
        Me.btmailsend.BackColor = System.Drawing.Color.Chocolate
        Me.btmailsend.Location = New System.Drawing.Point(843, 55)
        Me.btmailsend.Name = "btmailsend"
        Me.btmailsend.Size = New System.Drawing.Size(80, 29)
        Me.btmailsend.TabIndex = 80
        Me.btmailsend.Text = "Mail"
        Me.btmailsend.UseVisualStyleBackColor = False
        '
        'Column1
        '
        Me.Column1.HeaderText = "SELECT"
        Me.Column1.Name = "Column1"
        '
        'EmployeeId
        '
        Me.EmployeeId.DataPropertyName = "EmployeeId"
        Me.EmployeeId.HeaderText = "EmployeeId"
        Me.EmployeeId.Name = "EmployeeId"
        Me.EmployeeId.Visible = False
        '
        'EmploeeCode
        '
        Me.EmploeeCode.DataPropertyName = "empcode"
        Me.EmploeeCode.HeaderText = "Emp Code"
        Me.EmploeeCode.Name = "EmploeeCode"
        Me.EmploeeCode.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic
        '
        'EmployeeName
        '
        Me.EmployeeName.DataPropertyName = "Name"
        Me.EmployeeName.HeaderText = "Name"
        Me.EmployeeName.Name = "EmployeeName"
        Me.EmployeeName.Width = 120
        '
        'FingerId
        '
        Me.FingerId.DataPropertyName = "FingerId"
        Me.FingerId.HeaderText = "fingerid"
        Me.FingerId.Name = "FingerId"
        Me.FingerId.Width = 80
        '
        'CatName
        '
        Me.CatName.DataPropertyName = "CatName"
        Me.CatName.HeaderText = "CatName"
        Me.CatName.Name = "CatName"
        Me.CatName.Width = 80
        '
        'Department
        '
        Me.Department.DataPropertyName = "Deptname"
        Me.Department.HeaderText = "DeptName"
        Me.Department.Name = "Department"
        Me.Department.Width = 80
        '
        'UanNo
        '
        Me.UanNo.DataPropertyName = "UanNo"
        Me.UanNo.HeaderText = "UanNo"
        Me.UanNo.Name = "UanNo"
        '
        'ESINo
        '
        Me.ESINo.DataPropertyName = "ESINo"
        Me.ESINo.HeaderText = "ESINo"
        Me.ESINo.Name = "ESINo"
        Me.ESINo.Width = 80
        '
        'OldBalance
        '
        Me.OldBalance.DataPropertyName = "OldBalance"
        Me.OldBalance.HeaderText = "OldBalance "
        Me.OldBalance.Name = "OldBalance"
        Me.OldBalance.Width = 80
        '
        'Advance
        '
        Me.Advance.DataPropertyName = "Advance"
        Me.Advance.HeaderText = "Advance"
        Me.Advance.Name = "Advance"
        Me.Advance.Width = 80
        '
        'AdvanceLess
        '
        Me.AdvanceLess.DataPropertyName = "AdvanceLess"
        Me.AdvanceLess.HeaderText = "AdvanceLess"
        Me.AdvanceLess.Name = "AdvanceLess"
        Me.AdvanceLess.Width = 80
        '
        'Present
        '
        Me.Present.DataPropertyName = "Present"
        Me.Present.HeaderText = "Present"
        Me.Present.Name = "Present"
        Me.Present.Width = 80
        '
        'GrossAmount
        '
        Me.GrossAmount.DataPropertyName = "GrossAmount"
        Me.GrossAmount.HeaderText = "GrossAmount"
        Me.GrossAmount.Name = "GrossAmount"
        Me.GrossAmount.Width = 80
        '
        'PF
        '
        Me.PF.DataPropertyName = "PF"
        Me.PF.HeaderText = "PF"
        Me.PF.Name = "PF"
        Me.PF.Width = 80
        '
        'ESI
        '
        Me.ESI.DataPropertyName = "ESI"
        Me.ESI.HeaderText = "ESI"
        Me.ESI.Name = "ESI"
        Me.ESI.Width = 80
        '
        'LOPAmount
        '
        Me.LOPAmount.DataPropertyName = "LOPAmount"
        Me.LOPAmount.HeaderText = "LOPAmount"
        Me.LOPAmount.Name = "LOPAmount"
        Me.LOPAmount.Width = 80
        '
        'NetSalary
        '
        Me.NetSalary.DataPropertyName = "NetSalary"
        Me.NetSalary.HeaderText = "NetSalary"
        Me.NetSalary.Name = "NetSalary"
        Me.NetSalary.Width = 80
        '
        'AdvanceBalance
        '
        Me.AdvanceBalance.DataPropertyName = "AdvanceBalance"
        Me.AdvanceBalance.HeaderText = "AdvanceBalance"
        Me.AdvanceBalance.Name = "AdvanceBalance"
        Me.AdvanceBalance.Width = 80
        '
        'MailID
        '
        Me.MailID.DataPropertyName = "MailID"
        Me.MailID.HeaderText = "MailID"
        Me.MailID.Name = "MailID"
        Me.MailID.Width = 80
        '
        'Status
        '
        Me.Status.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.Status.DataPropertyName = "Status"
        Me.Status.HeaderText = "Status"
        Me.Status.MinimumWidth = 80
        Me.Status.Name = "Status"
        '
        'Panel1
        '
        Me.Panel1.BackColor = System.Drawing.SystemColors.GradientActiveCaption
        Me.Panel1.Controls.Add(Me.lblCaption)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Top
        Me.Panel1.Location = New System.Drawing.Point(0, 0)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(1044, 67)
        Me.Panel1.TabIndex = 523
        '
        'lblCaption
        '
        Me.lblCaption.BackColor = System.Drawing.SystemColors.HotTrack
        Me.lblCaption.Dock = System.Windows.Forms.DockStyle.Top
        Me.lblCaption.Font = New System.Drawing.Font("Tahoma", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblCaption.ForeColor = System.Drawing.Color.WhiteSmoke
        Me.lblCaption.Location = New System.Drawing.Point(0, 0)
        Me.lblCaption.Name = "lblCaption"
        Me.lblCaption.Size = New System.Drawing.Size(1044, 32)
        Me.lblCaption.TabIndex = 10
        Me.lblCaption.Text = "Send Payslip Mail Send"
        Me.lblCaption.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'frmPayslipMailSend
        '
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(1044, 534)
        Me.Controls.Add(Me.Panel1)
        Me.Controls.Add(Me.dgvReport)
        Me.Controls.Add(Me.panel2)
        Me.Controls.Add(Me.bindingNavigator1)
        Me.DoubleBuffered = True
        Me.Font = New System.Drawing.Font("Cambria", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "frmPayslipMailSend"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Employee Register"
        Me.panel2.ResumeLayout(False)
        Me.panel2.PerformLayout()
        CType(Me.bindingNavigator1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.bindingNavigator1.ResumeLayout(False)
        Me.bindingNavigator1.PerformLayout()
        CType(Me.dgvReport, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.bindingSource1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Panel1.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Private WithEvents bindingSource1 As System.Windows.Forms.BindingSource
    Private WithEvents toolStripComboBox_RecordPerPage As System.Windows.Forms.ToolStripComboBox
    Private WithEvents CbxOrderby As System.Windows.Forms.ComboBox
    Private WithEvents label6 As System.Windows.Forms.Label
    Private WithEvents CbxDesignation As System.Windows.Forms.ComboBox
    Private WithEvents lbl_Company As System.Windows.Forms.Label
    Private WithEvents btn_Export As System.Windows.Forms.Button
    Private WithEvents btn_Go As System.Windows.Forms.Button
    Private WithEvents panel2 As System.Windows.Forms.Panel
    Private WithEvents toolStripLabel2 As System.Windows.Forms.ToolStripLabel
    Private WithEvents toolStripSeparator1 As System.Windows.Forms.ToolStripSeparator
    Private WithEvents bindingNavigatorEditItem As System.Windows.Forms.ToolStripButton
    Private WithEvents bindingNavigatorSeparator2 As System.Windows.Forms.ToolStripSeparator
    Private WithEvents bindingNavigatorMoveLastItem As System.Windows.Forms.ToolStripButton
    Private WithEvents bindingNavigatorMoveNextItem As System.Windows.Forms.ToolStripButton
    Private WithEvents bindingNavigatorSeparator1 As System.Windows.Forms.ToolStripSeparator
    Private WithEvents bindingNavigatorPositionItem As System.Windows.Forms.ToolStripTextBox
    Private WithEvents bindingNavigatorSeparator As System.Windows.Forms.ToolStripSeparator
    Private WithEvents bindingNavigatorMovePreviousItem As System.Windows.Forms.ToolStripButton
    Private WithEvents bindingNavigatorMoveFirstItem As System.Windows.Forms.ToolStripButton
    Private WithEvents bindingNavigatorDeleteItem As System.Windows.Forms.ToolStripButton
    Private WithEvents bindingNavigatorCountItem As System.Windows.Forms.ToolStripLabel
    Private WithEvents bindingNavigatorAddNewItem As System.Windows.Forms.ToolStripButton
    Private WithEvents bindingNavigator1 As System.Windows.Forms.BindingNavigator
    Friend WithEvents Chkselectall As System.Windows.Forms.CheckBox
    Private WithEvents dgvReport As System.Windows.Forms.DataGridView
    Private WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Dtpfromdate As System.Windows.Forms.DateTimePicker
    Private WithEvents Label4 As Label
    Friend WithEvents chkall As CheckBox
    Friend WithEvents lstopt As CheckedListBox
    Private WithEvents btmailsend As Button
    Friend WithEvents Column1 As DataGridViewCheckBoxColumn
    Friend WithEvents EmployeeId As DataGridViewTextBoxColumn
    Friend WithEvents EmploeeCode As DataGridViewTextBoxColumn
    Friend WithEvents EmployeeName As DataGridViewTextBoxColumn
    Friend WithEvents FingerId As DataGridViewTextBoxColumn
    Friend WithEvents CatName As DataGridViewTextBoxColumn
    Friend WithEvents Department As DataGridViewTextBoxColumn
    Friend WithEvents UanNo As DataGridViewTextBoxColumn
    Friend WithEvents ESINo As DataGridViewTextBoxColumn
    Friend WithEvents OldBalance As DataGridViewTextBoxColumn
    Friend WithEvents Advance As DataGridViewTextBoxColumn
    Friend WithEvents AdvanceLess As DataGridViewTextBoxColumn
    Friend WithEvents Present As DataGridViewTextBoxColumn
    Friend WithEvents GrossAmount As DataGridViewTextBoxColumn
    Friend WithEvents PF As DataGridViewTextBoxColumn
    Friend WithEvents ESI As DataGridViewTextBoxColumn
    Friend WithEvents LOPAmount As DataGridViewTextBoxColumn
    Friend WithEvents NetSalary As DataGridViewTextBoxColumn
    Friend WithEvents AdvanceBalance As DataGridViewTextBoxColumn
    Friend WithEvents MailID As DataGridViewTextBoxColumn
    Friend WithEvents Status As DataGridViewTextBoxColumn
    Friend WithEvents Panel1 As Panel
    Friend WithEvents lblCaption As Label
End Class
