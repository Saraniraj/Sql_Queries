<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmPayslipMailSend
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
        Me.components = New System.ComponentModel.Container()
        Dim DataGridViewCellStyle1 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmPayslipMailSend))
        Me.toolStripComboBox_RecordPerPage = New System.Windows.Forms.ToolStripComboBox()
        Me.txt_EmpCode = New System.Windows.Forms.TextBox()
        Me.lbl_EmployeeCode = New System.Windows.Forms.Label()
        Me.CbxDepartment = New System.Windows.Forms.ComboBox()
        Me.lbl_Department = New System.Windows.Forms.Label()
        Me.CbxOrderby = New System.Windows.Forms.ComboBox()
        Me.label6 = New System.Windows.Forms.Label()
        Me.CbxCategory = New System.Windows.Forms.ComboBox()
        Me.lbl_Category = New System.Windows.Forms.Label()
        Me.CbxDesignation = New System.Windows.Forms.ComboBox()
        Me.lbl_Company = New System.Windows.Forms.Label()
        Me.btn_Export = New System.Windows.Forms.Button()
        Me.btn_Go = New System.Windows.Forms.Button()
        Me.panel2 = New System.Windows.Forms.Panel()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Dtpfromdate = New System.Windows.Forms.DateTimePicker()
        Me.BtnMailsend = New System.Windows.Forms.Button()
        Me.chkres = New System.Windows.Forms.CheckBox()
        Me.chkWorking = New System.Windows.Forms.CheckBox()
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
        Me.bindingSource1 = New System.Windows.Forms.BindingSource(Me.components)
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Chkselectall = New System.Windows.Forms.CheckBox()
        Me.dgvReport = New System.Windows.Forms.DataGridView()
        Me.Column1 = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.EmployeeId = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EmploeeCode = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EmployeeName = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.FingerId = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.CatName = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Department = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ShiftGroup = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column20 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ConsWages = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Basic = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.wpday = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column24 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PFDate = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column26 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.UanNo = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ESINo = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ESIDate = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ESILocation = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ContactNo = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AudharID = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PanNo = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.VoteId = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.RCNo = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.panel2.SuspendLayout()
        CType(Me.bindingNavigator1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.bindingNavigator1.SuspendLayout()
        CType(Me.bindingSource1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.dgvReport, System.ComponentModel.ISupportInitialize).BeginInit()
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
        'txt_EmpCode
        '
        Me.txt_EmpCode.Location = New System.Drawing.Point(103, 54)
        Me.txt_EmpCode.Name = "txt_EmpCode"
        Me.txt_EmpCode.Size = New System.Drawing.Size(127, 22)
        Me.txt_EmpCode.TabIndex = 61
        '
        'lbl_EmployeeCode
        '
        Me.lbl_EmployeeCode.AutoSize = True
        Me.lbl_EmployeeCode.Location = New System.Drawing.Point(13, 62)
        Me.lbl_EmployeeCode.Name = "lbl_EmployeeCode"
        Me.lbl_EmployeeCode.Size = New System.Drawing.Size(91, 14)
        Me.lbl_EmployeeCode.TabIndex = 60
        Me.lbl_EmployeeCode.Text = "Employee Code"
        '
        'CbxDepartment
        '
        Me.CbxDepartment.FormattingEnabled = True
        Me.CbxDepartment.Location = New System.Drawing.Point(328, 27)
        Me.CbxDepartment.Name = "CbxDepartment"
        Me.CbxDepartment.Size = New System.Drawing.Size(124, 22)
        Me.CbxDepartment.TabIndex = 59
        '
        'lbl_Department
        '
        Me.lbl_Department.AutoSize = True
        Me.lbl_Department.Location = New System.Drawing.Point(257, 35)
        Me.lbl_Department.Name = "lbl_Department"
        Me.lbl_Department.Size = New System.Drawing.Size(72, 14)
        Me.lbl_Department.TabIndex = 58
        Me.lbl_Department.Text = "Department"
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
        'CbxCategory
        '
        Me.CbxCategory.FormattingEnabled = True
        Me.CbxCategory.Location = New System.Drawing.Point(103, 27)
        Me.CbxCategory.Name = "CbxCategory"
        Me.CbxCategory.Size = New System.Drawing.Size(127, 22)
        Me.CbxCategory.TabIndex = 55
        '
        'lbl_Category
        '
        Me.lbl_Category.AutoSize = True
        Me.lbl_Category.Location = New System.Drawing.Point(13, 35)
        Me.lbl_Category.Name = "lbl_Category"
        Me.lbl_Category.Size = New System.Drawing.Size(55, 14)
        Me.lbl_Category.TabIndex = 54
        Me.lbl_Category.Text = "Category"
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
        Me.panel2.Controls.Add(Me.Button1)
        Me.panel2.Controls.Add(Me.Label1)
        Me.panel2.Controls.Add(Me.Dtpfromdate)
        Me.panel2.Controls.Add(Me.BtnMailsend)
        Me.panel2.Controls.Add(Me.chkres)
        Me.panel2.Controls.Add(Me.chkWorking)
        Me.panel2.Controls.Add(Me.txt_EmpCode)
        Me.panel2.Controls.Add(Me.lbl_EmployeeCode)
        Me.panel2.Controls.Add(Me.CbxDepartment)
        Me.panel2.Controls.Add(Me.lbl_Department)
        Me.panel2.Controls.Add(Me.CbxOrderby)
        Me.panel2.Controls.Add(Me.label6)
        Me.panel2.Controls.Add(Me.CbxCategory)
        Me.panel2.Controls.Add(Me.lbl_Category)
        Me.panel2.Controls.Add(Me.CbxDesignation)
        Me.panel2.Controls.Add(Me.lbl_Company)
        Me.panel2.Controls.Add(Me.btn_Export)
        Me.panel2.Controls.Add(Me.btn_Go)
        Me.panel2.Location = New System.Drawing.Point(0, 72)
        Me.panel2.Name = "panel2"
        Me.panel2.Size = New System.Drawing.Size(1042, 93)
        Me.panel2.TabIndex = 17
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
        'BtnMailsend
        '
        Me.BtnMailsend.Location = New System.Drawing.Point(843, 58)
        Me.BtnMailsend.Name = "BtnMailsend"
        Me.BtnMailsend.Size = New System.Drawing.Size(56, 24)
        Me.BtnMailsend.TabIndex = 69
        Me.BtnMailsend.Text = "Mail Send"
        Me.BtnMailsend.UseVisualStyleBackColor = True
        '
        'chkres
        '
        Me.chkres.AutoSize = True
        Me.chkres.Location = New System.Drawing.Point(338, 63)
        Me.chkres.Name = "chkres"
        Me.chkres.Size = New System.Drawing.Size(76, 18)
        Me.chkres.TabIndex = 68
        Me.chkres.Text = "Resigned"
        Me.chkres.UseVisualStyleBackColor = True
        '
        'chkWorking
        '
        Me.chkWorking.AutoSize = True
        Me.chkWorking.Checked = True
        Me.chkWorking.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chkWorking.Location = New System.Drawing.Point(260, 62)
        Me.chkWorking.Name = "chkWorking"
        Me.chkWorking.Size = New System.Drawing.Size(74, 18)
        Me.chkWorking.TabIndex = 67
        Me.chkWorking.Text = "Working"
        Me.chkWorking.UseVisualStyleBackColor = True
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
        Me.bindingNavigator1.Location = New System.Drawing.Point(0, 491)
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
        'PictureBox1
        '
        Me.PictureBox1.BackColor = System.Drawing.Color.Aqua
        Me.PictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.PictureBox1.Dock = System.Windows.Forms.DockStyle.Top
        Me.PictureBox1.Location = New System.Drawing.Point(0, 0)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(1044, 69)
        Me.PictureBox1.TabIndex = 20
        Me.PictureBox1.TabStop = False
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.BackColor = System.Drawing.Color.Black
        Me.Label2.Font = New System.Drawing.Font("Times New Roman", 18.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.ForeColor = System.Drawing.Color.White
        Me.Label2.Location = New System.Drawing.Point(429, 31)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(211, 26)
        Me.Label2.TabIndex = 24
        Me.Label2.Text = "Employee  Register"
        '
        'Chkselectall
        '
        Me.Chkselectall.AutoSize = True
        Me.Chkselectall.Checked = True
        Me.Chkselectall.CheckState = System.Windows.Forms.CheckState.Checked
        Me.Chkselectall.Font = New System.Drawing.Font("Bookman Old Style", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Chkselectall.Location = New System.Drawing.Point(12, 171)
        Me.Chkselectall.Name = "Chkselectall"
        Me.Chkselectall.Size = New System.Drawing.Size(163, 18)
        Me.Chkselectall.TabIndex = 25
        Me.Chkselectall.Text = "Select All Employees"
        Me.Chkselectall.UseVisualStyleBackColor = True
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
        Me.dgvReport.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.Column1, Me.EmployeeId, Me.EmploeeCode, Me.EmployeeName, Me.FingerId, Me.CatName, Me.Department, Me.ShiftGroup, Me.Column5, Me.Column20, Me.ConsWages, Me.Basic, Me.wpday, Me.Column24, Me.PFDate, Me.Column26, Me.UanNo, Me.ESINo, Me.ESIDate, Me.ESILocation, Me.ContactNo, Me.AudharID, Me.PanNo, Me.VoteId, Me.RCNo})
        Me.dgvReport.Location = New System.Drawing.Point(0, 203)
        Me.dgvReport.Name = "dgvReport"
        Me.dgvReport.RowHeadersVisible = False
        Me.dgvReport.RowTemplate.DefaultCellStyle.ForeColor = System.Drawing.Color.Black
        Me.dgvReport.Size = New System.Drawing.Size(1042, 286)
        Me.dgvReport.TabIndex = 19
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
        'ShiftGroup
        '
        Me.ShiftGroup.DataPropertyName = "ShiftGroup"
        Me.ShiftGroup.HeaderText = "ShiftGroup"
        Me.ShiftGroup.Name = "ShiftGroup"
        Me.ShiftGroup.Width = 80
        '
        'Column5
        '
        Me.Column5.DataPropertyName = "Sgroup"
        Me.Column5.HeaderText = "SGroup"
        Me.Column5.Name = "Column5"
        Me.Column5.Width = 80
        '
        'Column20
        '
        Me.Column20.DataPropertyName = "IDMark"
        Me.Column20.HeaderText = "IDMark"
        Me.Column20.Name = "Column20"
        Me.Column20.Width = 80
        '
        'ConsWages
        '
        Me.ConsWages.DataPropertyName = "ConsWages"
        Me.ConsWages.HeaderText = "ConsWages"
        Me.ConsWages.Name = "ConsWages"
        Me.ConsWages.Width = 80
        '
        'Basic
        '
        Me.Basic.DataPropertyName = "Basic"
        Me.Basic.HeaderText = "Basic"
        Me.Basic.Name = "Basic"
        Me.Basic.Width = 80
        '
        'wpday
        '
        Me.wpday.DataPropertyName = "wpday"
        Me.wpday.HeaderText = "Perday"
        Me.wpday.Name = "wpday"
        Me.wpday.Width = 80
        '
        'Column24
        '
        Me.Column24.DataPropertyName = "PFNo"
        Me.Column24.HeaderText = "PFNo"
        Me.Column24.Name = "Column24"
        Me.Column24.Width = 80
        '
        'PFDate
        '
        Me.PFDate.DataPropertyName = "PFDate"
        Me.PFDate.HeaderText = "PFDate"
        Me.PFDate.Name = "PFDate"
        Me.PFDate.Width = 80
        '
        'Column26
        '
        Me.Column26.DataPropertyName = "PFNominee"
        Me.Column26.HeaderText = "PFNominee"
        Me.Column26.Name = "Column26"
        Me.Column26.Width = 80
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
        'ESIDate
        '
        Me.ESIDate.DataPropertyName = "ESIDate"
        Me.ESIDate.HeaderText = "ESIDate"
        Me.ESIDate.Name = "ESIDate"
        Me.ESIDate.Width = 80
        '
        'ESILocation
        '
        Me.ESILocation.DataPropertyName = "ESILocation"
        Me.ESILocation.HeaderText = "ESILocation"
        Me.ESILocation.Name = "ESILocation"
        Me.ESILocation.Width = 80
        '
        'ContactNo
        '
        Me.ContactNo.DataPropertyName = "ContactNo"
        Me.ContactNo.HeaderText = "ContactNo"
        Me.ContactNo.Name = "ContactNo"
        Me.ContactNo.Width = 80
        '
        'AudharID
        '
        Me.AudharID.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.AudharID.DataPropertyName = "AudharID"
        Me.AudharID.HeaderText = "AudharID"
        Me.AudharID.MinimumWidth = 80
        Me.AudharID.Name = "AudharID"
        '
        'PanNo
        '
        Me.PanNo.DataPropertyName = "PanNo"
        Me.PanNo.HeaderText = "PanNo"
        Me.PanNo.Name = "PanNo"
        '
        'VoteId
        '
        Me.VoteId.DataPropertyName = "VoteId"
        Me.VoteId.HeaderText = "VoteId"
        Me.VoteId.Name = "VoteId"
        '
        'RCNo
        '
        Me.RCNo.DataPropertyName = "RCNo"
        Me.RCNo.HeaderText = "RCNo"
        Me.RCNo.Name = "RCNo"
        '
        'Button1
        '
        Me.Button1.BackColor = System.Drawing.Color.Chocolate
        Me.Button1.Location = New System.Drawing.Point(860, 20)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(56, 24)
        Me.Button1.TabIndex = 72
        Me.Button1.Text = "Send"
        Me.Button1.UseVisualStyleBackColor = False
        '
        'frmPayslipMailSend
        '
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(1044, 516)
        Me.Controls.Add(Me.Chkselectall)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.PictureBox1)
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
        CType(Me.bindingSource1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.dgvReport, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Private WithEvents bindingSource1 As System.Windows.Forms.BindingSource
    Private WithEvents toolStripComboBox_RecordPerPage As System.Windows.Forms.ToolStripComboBox
    Private WithEvents txt_EmpCode As System.Windows.Forms.TextBox
    Private WithEvents lbl_EmployeeCode As System.Windows.Forms.Label
    Private WithEvents CbxDepartment As System.Windows.Forms.ComboBox
    Private WithEvents lbl_Department As System.Windows.Forms.Label
    Private WithEvents CbxOrderby As System.Windows.Forms.ComboBox
    Private WithEvents label6 As System.Windows.Forms.Label
    Private WithEvents CbxCategory As System.Windows.Forms.ComboBox
    Private WithEvents lbl_Category As System.Windows.Forms.Label
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
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents chkres As System.Windows.Forms.CheckBox
    Friend WithEvents chkWorking As System.Windows.Forms.CheckBox
    Friend WithEvents Chkselectall As System.Windows.Forms.CheckBox
    Private WithEvents BtnMailsend As System.Windows.Forms.Button
    Private WithEvents dgvReport As System.Windows.Forms.DataGridView
    Friend WithEvents Column1 As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents EmployeeId As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents EmploeeCode As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents EmployeeName As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents FingerId As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents CatName As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Department As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ShiftGroup As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Column5 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Column20 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ConsWages As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Basic As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents wpday As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Column24 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PFDate As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Column26 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents UanNo As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ESINo As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ESIDate As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ESILocation As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ContactNo As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents AudharID As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PanNo As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents VoteId As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents RCNo As System.Windows.Forms.DataGridViewTextBoxColumn
    Private WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Dtpfromdate As System.Windows.Forms.DateTimePicker
    Private WithEvents Button1 As Button
End Class
