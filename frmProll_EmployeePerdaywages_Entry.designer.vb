<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmProll_EmployeePerdaywages_Entry
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
        Dim DataGridViewCellStyle1 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmProll_EmployeePerdaywages_Entry))
        Me.txtID = New System.Windows.Forms.TextBox()
        Me.Label13 = New System.Windows.Forms.Label()
        Me.btnClear = New System.Windows.Forms.Button()
        Me.btnClose = New System.Windows.Forms.Button()
        Me.btnReset = New System.Windows.Forms.Button()
        Me.btnApply = New System.Windows.Forms.Button()
        Me.GroupBox3 = New System.Windows.Forms.GroupBox()
        Me.Txtremarks = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.dgvPayment = New System.Windows.Forms.DataGridView()
        Me.TxtAmount = New System.Windows.Forms.TextBox()
        Me.Label29 = New System.Windows.Forms.Label()
        Me.dtpEntryDate = New System.Windows.Forms.DateTimePicker()
        Me.txtempid = New System.Windows.Forms.TextBox()
        Me.BtnEmployee = New System.Windows.Forms.Button()
        Me.Label15 = New System.Windows.Forms.Label()
        Me.Txtempname = New System.Windows.Forms.TextBox()
        Me.txtempcode = New System.Windows.Forms.TextBox()
        Me.chkIsActive = New System.Windows.Forms.CheckBox()
        Me.btnPickList = New System.Windows.Forms.Button()
        Me.toolPosStrip = New System.Windows.Forms.ToolStrip()
        Me.toolStripBtnPrint = New System.Windows.Forms.ToolStripButton()
        Me.cbxScreenMode = New System.Windows.Forms.ToolStripComboBox()
        Me.toolStripSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.ToolStripSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.ToolStripBtninfo = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripSeparator3 = New System.Windows.Forms.ToolStripSeparator()
        Me.ColvehicleID = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ColEntryDate = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ColEmpname = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Colempcode = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Colempid = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ColEarning = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ColAMount = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ColRemarks = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.GroupBox3.SuspendLayout()
        CType(Me.dgvPayment, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.toolPosStrip.SuspendLayout()
        Me.SuspendLayout()
        '
        'txtID
        '
        Me.txtID.BackColor = System.Drawing.Color.FromArgb(CType(CType(228, Byte), Integer), CType(CType(236, Byte), Integer), CType(CType(247, Byte), Integer))
        Me.txtID.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtID.Location = New System.Drawing.Point(102, 17)
        Me.txtID.Name = "txtID"
        Me.txtID.ReadOnly = True
        Me.txtID.Size = New System.Drawing.Size(172, 23)
        Me.txtID.TabIndex = 1
        '
        'Label13
        '
        Me.Label13.AutoSize = True
        Me.Label13.BackColor = System.Drawing.Color.Transparent
        Me.Label13.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label13.Location = New System.Drawing.Point(67, 20)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(25, 16)
        Me.Label13.TabIndex = 0
        Me.Label13.Text = "ID:"
        '
        'btnClear
        '
        Me.btnClear.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnClear.ForeColor = System.Drawing.Color.Navy
        Me.btnClear.Location = New System.Drawing.Point(349, 182)
        Me.btnClear.Name = "btnClear"
        Me.btnClear.Size = New System.Drawing.Size(64, 24)
        Me.btnClear.TabIndex = 2
        Me.btnClear.Text = "Clear"
        Me.btnClear.UseVisualStyleBackColor = True
        '
        'btnClose
        '
        Me.btnClose.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnClose.ForeColor = System.Drawing.Color.Navy
        Me.btnClose.Location = New System.Drawing.Point(430, 182)
        Me.btnClose.Name = "btnClose"
        Me.btnClose.Size = New System.Drawing.Size(64, 24)
        Me.btnClose.TabIndex = 3
        Me.btnClose.Text = "Close"
        Me.btnClose.UseVisualStyleBackColor = True
        '
        'btnReset
        '
        Me.btnReset.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnReset.ForeColor = System.Drawing.Color.Navy
        Me.btnReset.Location = New System.Drawing.Point(268, 182)
        Me.btnReset.Name = "btnReset"
        Me.btnReset.Size = New System.Drawing.Size(64, 24)
        Me.btnReset.TabIndex = 1
        Me.btnReset.Text = "Reset"
        Me.btnReset.UseVisualStyleBackColor = True
        '
        'btnApply
        '
        Me.btnApply.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnApply.ForeColor = System.Drawing.Color.Navy
        Me.btnApply.Location = New System.Drawing.Point(187, 182)
        Me.btnApply.Name = "btnApply"
        Me.btnApply.Size = New System.Drawing.Size(64, 24)
        Me.btnApply.TabIndex = 0
        Me.btnApply.Text = "Apply"
        Me.btnApply.UseVisualStyleBackColor = True
        '
        'GroupBox3
        '
        Me.GroupBox3.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.GroupBox3.Controls.Add(Me.btnClose)
        Me.GroupBox3.Controls.Add(Me.btnClear)
        Me.GroupBox3.Controls.Add(Me.Txtremarks)
        Me.GroupBox3.Controls.Add(Me.btnReset)
        Me.GroupBox3.Controls.Add(Me.Label2)
        Me.GroupBox3.Controls.Add(Me.btnApply)
        Me.GroupBox3.Controls.Add(Me.dgvPayment)
        Me.GroupBox3.Controls.Add(Me.TxtAmount)
        Me.GroupBox3.Controls.Add(Me.Label29)
        Me.GroupBox3.Controls.Add(Me.dtpEntryDate)
        Me.GroupBox3.Controls.Add(Me.txtempid)
        Me.GroupBox3.Controls.Add(Me.BtnEmployee)
        Me.GroupBox3.Controls.Add(Me.Label15)
        Me.GroupBox3.Controls.Add(Me.Txtempname)
        Me.GroupBox3.Controls.Add(Me.txtempcode)
        Me.GroupBox3.Controls.Add(Me.chkIsActive)
        Me.GroupBox3.Controls.Add(Me.Label13)
        Me.GroupBox3.Controls.Add(Me.txtID)
        Me.GroupBox3.Controls.Add(Me.btnPickList)
        Me.GroupBox3.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox3.Location = New System.Drawing.Point(2, 55)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(782, 535)
        Me.GroupBox3.TabIndex = 1
        Me.GroupBox3.TabStop = False
        '
        'Txtremarks
        '
        Me.Txtremarks.Location = New System.Drawing.Point(102, 125)
        Me.Txtremarks.Name = "Txtremarks"
        Me.Txtremarks.Size = New System.Drawing.Size(303, 23)
        Me.Txtremarks.TabIndex = 14
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.BackColor = System.Drawing.Color.Transparent
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.Label2.Location = New System.Drawing.Point(35, 125)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(63, 15)
        Me.Label2.TabIndex = 101
        Me.Label2.Text = "Remarks :"
        '
        'dgvPayment
        '
        Me.dgvPayment.AllowUserToAddRows = False
        Me.dgvPayment.AllowUserToDeleteRows = False
        Me.dgvPayment.AllowUserToResizeColumns = False
        Me.dgvPayment.AllowUserToResizeRows = False
        Me.dgvPayment.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill
        Me.dgvPayment.BackgroundColor = System.Drawing.Color.FromArgb(CType(CType(198, Byte), Integer), CType(CType(202, Byte), Integer), CType(CType(188, Byte), Integer))
        Me.dgvPayment.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgvPayment.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.ColvehicleID, Me.ColEntryDate, Me.ColEmpname, Me.Colempcode, Me.Colempid, Me.ColEarning, Me.ColAMount, Me.ColRemarks})
        Me.dgvPayment.Location = New System.Drawing.Point(6, 223)
        Me.dgvPayment.MultiSelect = False
        Me.dgvPayment.Name = "dgvPayment"
        Me.dgvPayment.ReadOnly = True
        Me.dgvPayment.RowHeadersVisible = False
        DataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.FromArgb(CType(CType(116, Byte), Integer), CType(CType(128, Byte), Integer), CType(CType(89, Byte), Integer))
        Me.dgvPayment.RowsDefaultCellStyle = DataGridViewCellStyle1
        Me.dgvPayment.Size = New System.Drawing.Size(767, 294)
        Me.dgvPayment.TabIndex = 15
        '
        'TxtAmount
        '
        Me.TxtAmount.BackColor = System.Drawing.SystemColors.Info
        Me.TxtAmount.Location = New System.Drawing.Point(102, 86)
        Me.TxtAmount.Name = "TxtAmount"
        Me.TxtAmount.Size = New System.Drawing.Size(174, 23)
        Me.TxtAmount.TabIndex = 13
        '
        'Label29
        '
        Me.Label29.AutoSize = True
        Me.Label29.BackColor = System.Drawing.Color.Transparent
        Me.Label29.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!)
        Me.Label29.Location = New System.Drawing.Point(17, 86)
        Me.Label29.Name = "Label29"
        Me.Label29.Size = New System.Drawing.Size(78, 15)
        Me.Label29.TabIndex = 88
        Me.Label29.Text = "Mini Perday :"
        '
        'dtpEntryDate
        '
        Me.dtpEntryDate.Checked = False
        Me.dtpEntryDate.CustomFormat = "dd/MM/yyyy"
        Me.dtpEntryDate.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dtpEntryDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom
        Me.dtpEntryDate.Location = New System.Drawing.Point(320, 16)
        Me.dtpEntryDate.MinDate = New Date(2011, 4, 1, 0, 0, 0, 0)
        Me.dtpEntryDate.Name = "dtpEntryDate"
        Me.dtpEntryDate.Size = New System.Drawing.Size(90, 21)
        Me.dtpEntryDate.TabIndex = 2
        Me.dtpEntryDate.Value = New Date(2011, 12, 26, 18, 17, 10, 0)
        '
        'txtempid
        '
        Me.txtempid.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.txtempid.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtempid.Location = New System.Drawing.Point(409, 50)
        Me.txtempid.Margin = New System.Windows.Forms.Padding(4)
        Me.txtempid.Name = "txtempid"
        Me.txtempid.ReadOnly = True
        Me.txtempid.Size = New System.Drawing.Size(85, 23)
        Me.txtempid.TabIndex = 10
        '
        'BtnEmployee
        '
        Me.BtnEmployee.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.BtnEmployee.BackgroundImage = Global.PowerERP.My.Resources.Resources.esearch
        Me.BtnEmployee.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.BtnEmployee.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BtnEmployee.ForeColor = System.Drawing.Color.Black
        Me.BtnEmployee.Location = New System.Drawing.Point(280, 49)
        Me.BtnEmployee.Name = "BtnEmployee"
        Me.BtnEmployee.Size = New System.Drawing.Size(28, 26)
        Me.BtnEmployee.TabIndex = 7
        Me.BtnEmployee.TabStop = False
        Me.BtnEmployee.UseVisualStyleBackColor = False
        '
        'Label15
        '
        Me.Label15.AutoSize = True
        Me.Label15.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label15.Location = New System.Drawing.Point(17, 56)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(75, 16)
        Me.Label15.TabIndex = 86
        Me.Label15.Text = "Emp Name:"
        '
        'Txtempname
        '
        Me.Txtempname.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Txtempname.Location = New System.Drawing.Point(102, 50)
        Me.Txtempname.Name = "Txtempname"
        Me.Txtempname.ReadOnly = True
        Me.Txtempname.Size = New System.Drawing.Size(173, 23)
        Me.Txtempname.TabIndex = 8
        '
        'txtempcode
        '
        Me.txtempcode.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.txtempcode.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtempcode.Location = New System.Drawing.Point(320, 51)
        Me.txtempcode.Margin = New System.Windows.Forms.Padding(4)
        Me.txtempcode.Name = "txtempcode"
        Me.txtempcode.ReadOnly = True
        Me.txtempcode.Size = New System.Drawing.Size(85, 23)
        Me.txtempcode.TabIndex = 9
        '
        'chkIsActive
        '
        Me.chkIsActive.AutoSize = True
        Me.chkIsActive.BackColor = System.Drawing.Color.Transparent
        Me.chkIsActive.Checked = True
        Me.chkIsActive.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chkIsActive.FlatAppearance.BorderColor = System.Drawing.Color.Red
        Me.chkIsActive.FlatAppearance.BorderSize = 3
        Me.chkIsActive.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.chkIsActive.ForeColor = System.Drawing.Color.Navy
        Me.chkIsActive.Location = New System.Drawing.Point(435, 14)
        Me.chkIsActive.Name = "chkIsActive"
        Me.chkIsActive.Size = New System.Drawing.Size(59, 22)
        Me.chkIsActive.TabIndex = 3
        Me.chkIsActive.Text = "Active"
        Me.chkIsActive.UseCompatibleTextRendering = True
        Me.chkIsActive.UseVisualStyleBackColor = False
        '
        'btnPickList
        '
        Me.btnPickList.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.btnPickList.BackgroundImage = Global.PowerERP.My.Resources.Resources.esearch
        Me.btnPickList.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.btnPickList.Enabled = False
        Me.btnPickList.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnPickList.ForeColor = System.Drawing.Color.Black
        Me.btnPickList.Location = New System.Drawing.Point(280, 15)
        Me.btnPickList.Name = "btnPickList"
        Me.btnPickList.Size = New System.Drawing.Size(28, 26)
        Me.btnPickList.TabIndex = 0
        Me.btnPickList.UseVisualStyleBackColor = False
        '
        'toolPosStrip
        '
        Me.toolPosStrip.AutoSize = False
        Me.toolPosStrip.BackColor = System.Drawing.Color.Khaki
        Me.toolPosStrip.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.toolStripBtnPrint, Me.cbxScreenMode, Me.toolStripSeparator1, Me.ToolStripSeparator2, Me.ToolStripBtninfo, Me.ToolStripSeparator3})
        Me.toolPosStrip.Location = New System.Drawing.Point(0, 0)
        Me.toolPosStrip.Name = "toolPosStrip"
        Me.toolPosStrip.Size = New System.Drawing.Size(787, 49)
        Me.toolPosStrip.TabIndex = 183
        Me.toolPosStrip.Text = "toolStrip1"
        '
        'toolStripBtnPrint
        '
        Me.toolStripBtnPrint.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right
        Me.toolStripBtnPrint.Image = Global.PowerERP.My.Resources.Resources.Print
        Me.toolStripBtnPrint.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None
        Me.toolStripBtnPrint.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.toolStripBtnPrint.Name = "toolStripBtnPrint"
        Me.toolStripBtnPrint.Size = New System.Drawing.Size(23, 46)
        '
        'cbxScreenMode
        '
        Me.cbxScreenMode.BackColor = System.Drawing.SystemColors.Window
        Me.cbxScreenMode.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cbxScreenMode.Name = "cbxScreenMode"
        Me.cbxScreenMode.Size = New System.Drawing.Size(121, 49)
        '
        'toolStripSeparator1
        '
        Me.toolStripSeparator1.Name = "toolStripSeparator1"
        Me.toolStripSeparator1.Size = New System.Drawing.Size(6, 49)
        '
        'ToolStripSeparator2
        '
        Me.ToolStripSeparator2.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right
        Me.ToolStripSeparator2.Name = "ToolStripSeparator2"
        Me.ToolStripSeparator2.Size = New System.Drawing.Size(6, 49)
        '
        'ToolStripBtninfo
        '
        Me.ToolStripBtninfo.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right
        Me.ToolStripBtninfo.Image = Global.PowerERP.My.Resources.Resources.i
        Me.ToolStripBtninfo.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ToolStripBtninfo.Name = "ToolStripBtninfo"
        Me.ToolStripBtninfo.Size = New System.Drawing.Size(23, 46)
        Me.ToolStripBtninfo.ToolTipText = "info"
        '
        'ToolStripSeparator3
        '
        Me.ToolStripSeparator3.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right
        Me.ToolStripSeparator3.Name = "ToolStripSeparator3"
        Me.ToolStripSeparator3.Size = New System.Drawing.Size(6, 49)
        '
        'ColvehicleID
        '
        Me.ColvehicleID.HeaderText = "ID"
        Me.ColvehicleID.Name = "ColvehicleID"
        Me.ColvehicleID.ReadOnly = True
        Me.ColvehicleID.Visible = False
        '
        'ColEntryDate
        '
        Me.ColEntryDate.HeaderText = "Date"
        Me.ColEntryDate.Name = "ColEntryDate"
        Me.ColEntryDate.ReadOnly = True
        '
        'ColEmpname
        '
        Me.ColEmpname.HeaderText = "Name"
        Me.ColEmpname.Name = "ColEmpname"
        Me.ColEmpname.ReadOnly = True
        '
        'Colempcode
        '
        Me.Colempcode.HeaderText = "Emp code"
        Me.Colempcode.Name = "Colempcode"
        Me.Colempcode.ReadOnly = True
        '
        'Colempid
        '
        Me.Colempid.HeaderText = "Emp ID"
        Me.Colempid.Name = "Colempid"
        Me.Colempid.ReadOnly = True
        Me.Colempid.Visible = False
        '
        'ColEarning
        '
        Me.ColEarning.HeaderText = "Earning"
        Me.ColEarning.Name = "ColEarning"
        Me.ColEarning.ReadOnly = True
        '
        'ColAMount
        '
        Me.ColAMount.HeaderText = "Amount"
        Me.ColAMount.Name = "ColAMount"
        Me.ColAMount.ReadOnly = True
        '
        'ColRemarks
        '
        Me.ColRemarks.HeaderText = "Remarks"
        Me.ColRemarks.Name = "ColRemarks"
        Me.ColRemarks.ReadOnly = True
        '
        'frmPaymentReceiptEntry
        '
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None
        Me.BackColor = System.Drawing.Color.SeaGreen
        Me.BackgroundImage = Global.PowerERP.My.Resources.Resources.Form_bg
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(787, 589)
        Me.Controls.Add(Me.toolPosStrip)
        Me.Controls.Add(Me.GroupBox3)
        Me.DoubleBuffered = True
        Me.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "frmPaymentReceiptEntry"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "STH Employee Minimum Wages Details"
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox3.PerformLayout()
        CType(Me.dgvPayment, System.ComponentModel.ISupportInitialize).EndInit()
        Me.toolPosStrip.ResumeLayout(False)
        Me.toolPosStrip.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents btnPickList As System.Windows.Forms.Button
    Friend WithEvents btnClear As System.Windows.Forms.Button
    Friend WithEvents btnClose As System.Windows.Forms.Button
    Friend WithEvents btnReset As System.Windows.Forms.Button
    Friend WithEvents btnApply As System.Windows.Forms.Button
    Friend WithEvents txtID As System.Windows.Forms.TextBox
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents chkIsActive As System.Windows.Forms.CheckBox
    Friend WithEvents txtempid As System.Windows.Forms.TextBox
    Friend WithEvents BtnEmployee As System.Windows.Forms.Button
    Friend WithEvents Label15 As System.Windows.Forms.Label
    Friend WithEvents Txtempname As System.Windows.Forms.TextBox
    Friend WithEvents txtempcode As System.Windows.Forms.TextBox
    Friend WithEvents dtpEntryDate As System.Windows.Forms.DateTimePicker
    Friend WithEvents TxtAmount As System.Windows.Forms.TextBox
    Friend WithEvents Label29 As System.Windows.Forms.Label
    Private WithEvents dgvPayment As System.Windows.Forms.DataGridView
    Friend WithEvents Txtremarks As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Private WithEvents toolPosStrip As ToolStrip
    Private WithEvents toolStripBtnPrint As ToolStripButton
    Friend WithEvents cbxScreenMode As ToolStripComboBox
    Private WithEvents toolStripSeparator1 As ToolStripSeparator
    Friend WithEvents ToolStripSeparator2 As ToolStripSeparator
    Friend WithEvents ToolStripBtninfo As ToolStripButton
    Friend WithEvents ToolStripSeparator3 As ToolStripSeparator
    Friend WithEvents ColvehicleID As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ColEntryDate As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ColEmpname As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Colempcode As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Colempid As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ColEarning As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ColAMount As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ColRemarks As System.Windows.Forms.DataGridViewTextBoxColumn
End Class
