<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmSTH_ProductMaster
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmSTH_ProductMaster))
        Me.txtProductName = New System.Windows.Forms.TextBox()
        Me.lblId = New System.Windows.Forms.TextBox()
        Me.Label13 = New System.Windows.Forms.Label()
        Me.GroupBox3 = New System.Windows.Forms.GroupBox()
        Me.btnClear = New System.Windows.Forms.Button()
        Me.btnReset = New System.Windows.Forms.Button()
        Me.btnApply = New System.Windows.Forms.Button()
        Me.btnClose = New System.Windows.Forms.Button()
        Me.chkIsActive = New System.Windows.Forms.CheckBox()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.btnPickList = New System.Windows.Forms.Button()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.GroupBox4 = New System.Windows.Forms.GroupBox()
        Me.DgvDisplay = New System.Windows.Forms.DataGridView()
        Me.cbxScreenMode = New System.Windows.Forms.ComboBox()
        Me.btnInformation = New System.Windows.Forms.Button()
        Me.btnPrint = New System.Windows.Forms.Button()
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.lbl_Heading = New System.Windows.Forms.Label()
        Me.Txtprod_Desc = New System.Windows.Forms.TextBox()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        CType(Me.DgvDisplay, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Panel2.SuspendLayout()
        Me.SuspendLayout()
        '
        'txtProductName
        '
        Me.txtProductName.Font = New System.Drawing.Font("Tahoma", 9.75!)
        Me.txtProductName.Location = New System.Drawing.Point(151, 55)
        Me.txtProductName.Name = "txtProductName"
        Me.txtProductName.Size = New System.Drawing.Size(230, 23)
        Me.txtProductName.TabIndex = 4
        '
        'lblId
        '
        Me.lblId.BackColor = System.Drawing.Color.FromArgb(CType(CType(228, Byte), Integer), CType(CType(236, Byte), Integer), CType(CType(247, Byte), Integer))
        Me.lblId.Font = New System.Drawing.Font("Tahoma", 9.75!)
        Me.lblId.Location = New System.Drawing.Point(154, 14)
        Me.lblId.Name = "lblId"
        Me.lblId.ReadOnly = True
        Me.lblId.Size = New System.Drawing.Size(172, 23)
        Me.lblId.TabIndex = 1
        '
        'Label13
        '
        Me.Label13.AutoSize = True
        Me.Label13.BackColor = System.Drawing.Color.Transparent
        Me.Label13.Font = New System.Drawing.Font("Tahoma", 9.75!)
        Me.Label13.ForeColor = System.Drawing.Color.Navy
        Me.Label13.Location = New System.Drawing.Point(25, 20)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(55, 16)
        Me.Label13.TabIndex = 0
        Me.Label13.Text = "Prod ID:"
        '
        'GroupBox3
        '
        Me.GroupBox3.BackColor = System.Drawing.Color.LightSkyBlue
        Me.GroupBox3.Controls.Add(Me.Txtprod_Desc)
        Me.GroupBox3.Controls.Add(Me.btnClear)
        Me.GroupBox3.Controls.Add(Me.btnReset)
        Me.GroupBox3.Controls.Add(Me.btnApply)
        Me.GroupBox3.Controls.Add(Me.btnClose)
        Me.GroupBox3.Controls.Add(Me.chkIsActive)
        Me.GroupBox3.Controls.Add(Me.Label3)
        Me.GroupBox3.Controls.Add(Me.Label1)
        Me.GroupBox3.Controls.Add(Me.txtProductName)
        Me.GroupBox3.Controls.Add(Me.Label13)
        Me.GroupBox3.Controls.Add(Me.lblId)
        Me.GroupBox3.Controls.Add(Me.btnPickList)
        Me.GroupBox3.Location = New System.Drawing.Point(2, 55)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(574, 200)
        Me.GroupBox3.TabIndex = 1
        Me.GroupBox3.TabStop = False
        '
        'btnClear
        '
        Me.btnClear.BackColor = System.Drawing.Color.White
        Me.btnClear.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnClear.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnClear.ForeColor = System.Drawing.SystemColors.HotTrack
        '   Me.btnClear.Image = Global.HRD.My.Resources.Resources.Data_Erase
        Me.btnClear.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnClear.Location = New System.Drawing.Point(175, 154)
        Me.btnClear.Name = "btnClear"
        Me.btnClear.Size = New System.Drawing.Size(79, 29)
        Me.btnClear.TabIndex = 527
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
        ' Me.btnReset.Image = Global.HRD.My.Resources.Resources.Reload
        Me.btnReset.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnReset.Location = New System.Drawing.Point(261, 154)
        Me.btnReset.Name = "btnReset"
        Me.btnReset.Size = New System.Drawing.Size(96, 29)
        Me.btnReset.TabIndex = 526
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
        '   Me.btnApply.Image = Global.HRD.My.Resources.Resources.Save_01_WF_md
        Me.btnApply.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnApply.Location = New System.Drawing.Point(89, 154)
        Me.btnApply.Name = "btnApply"
        Me.btnApply.Size = New System.Drawing.Size(79, 29)
        Me.btnApply.TabIndex = 525
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
        '   Me.btnClose.Image = Global.HRD.My.Resources.Resources.Wrong_WF_md
        Me.btnClose.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnClose.Location = New System.Drawing.Point(364, 154)
        Me.btnClose.Name = "btnClose"
        Me.btnClose.Size = New System.Drawing.Size(79, 29)
        Me.btnClose.TabIndex = 524
        Me.btnClose.Text = "CLOSE"
        Me.btnClose.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnClose.UseVisualStyleBackColor = False
        '
        'chkIsActive
        '
        Me.chkIsActive.AutoSize = True
        Me.chkIsActive.BackColor = System.Drawing.Color.Transparent
        Me.chkIsActive.Checked = True
        Me.chkIsActive.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chkIsActive.FlatAppearance.BorderColor = System.Drawing.Color.Red
        Me.chkIsActive.FlatAppearance.BorderSize = 3
        Me.chkIsActive.Font = New System.Drawing.Font("Tahoma", 9.75!)
        Me.chkIsActive.ForeColor = System.Drawing.Color.Navy
        Me.chkIsActive.Location = New System.Drawing.Point(385, 15)
        Me.chkIsActive.Name = "chkIsActive"
        Me.chkIsActive.Size = New System.Drawing.Size(59, 22)
        Me.chkIsActive.TabIndex = 3
        Me.chkIsActive.Text = "Active"
        Me.chkIsActive.UseCompatibleTextRendering = True
        Me.chkIsActive.UseVisualStyleBackColor = False
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.BackColor = System.Drawing.Color.Transparent
        Me.Label3.Font = New System.Drawing.Font("Tahoma", 9.75!)
        Me.Label3.ForeColor = System.Drawing.Color.Navy
        Me.Label3.Location = New System.Drawing.Point(25, 93)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(87, 16)
        Me.Label3.TabIndex = 12
        Me.Label3.Text = "Product Desc:"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.BackColor = System.Drawing.Color.Transparent
        Me.Label1.Font = New System.Drawing.Font("Tahoma", 9.75!)
        Me.Label1.ForeColor = System.Drawing.Color.Navy
        Me.Label1.Location = New System.Drawing.Point(25, 58)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(93, 16)
        Me.Label1.TabIndex = 10
        Me.Label1.Text = "Product Name:"
        '
        'btnPickList
        '
        Me.btnPickList.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.btnPickList.BackgroundImage = Global.HRD.My.Resources.Resources.eSearch
        Me.btnPickList.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.btnPickList.Enabled = False
        Me.btnPickList.Font = New System.Drawing.Font("Tahoma", 9.75!)
        Me.btnPickList.ForeColor = System.Drawing.Color.Black
        Me.btnPickList.Location = New System.Drawing.Point(353, 10)
        Me.btnPickList.Name = "btnPickList"
        Me.btnPickList.Size = New System.Drawing.Size(28, 26)
        Me.btnPickList.TabIndex = 0
        Me.btnPickList.UseVisualStyleBackColor = False
        '
        'Label4
        '
        Me.Label4.BackColor = System.Drawing.SystemColors.HotTrack
        Me.Label4.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Label4.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.ForeColor = System.Drawing.Color.WhiteSmoke
        Me.Label4.Location = New System.Drawing.Point(0, 418)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(579, 10)
        Me.Label4.TabIndex = 519
        Me.Label4.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'GroupBox4
        '
        Me.GroupBox4.BackColor = System.Drawing.Color.White
        Me.GroupBox4.Controls.Add(Me.DgvDisplay)
        Me.GroupBox4.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.GroupBox4.Font = New System.Drawing.Font("Verdana", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox4.ForeColor = System.Drawing.Color.DarkBlue
        Me.GroupBox4.Location = New System.Drawing.Point(0, 253)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(579, 165)
        Me.GroupBox4.TabIndex = 523
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "Display"
        '
        'DgvDisplay
        '
        Me.DgvDisplay.AllowUserToAddRows = False
        Me.DgvDisplay.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill
        Me.DgvDisplay.BackgroundColor = System.Drawing.Color.White
        Me.DgvDisplay.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None
        DataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle1.BackColor = System.Drawing.Color.FromArgb(CType(CType(64, Byte), Integer), CType(CType(64, Byte), Integer), CType(CType(64, Byte), Integer))
        DataGridViewCellStyle1.Font = New System.Drawing.Font("Verdana", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle1.ForeColor = System.Drawing.Color.White
        DataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DgvDisplay.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle1
        Me.DgvDisplay.ColumnHeadersHeight = 30
        Me.DgvDisplay.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.DisableResizing
        Me.DgvDisplay.Dock = System.Windows.Forms.DockStyle.Fill
        Me.DgvDisplay.EnableHeadersVisualStyles = False
        Me.DgvDisplay.Location = New System.Drawing.Point(3, 18)
        Me.DgvDisplay.Name = "DgvDisplay"
        Me.DgvDisplay.RowHeadersVisible = False
        Me.DgvDisplay.Size = New System.Drawing.Size(573, 144)
        Me.DgvDisplay.TabIndex = 17
        '
        'cbxScreenMode
        '
        Me.cbxScreenMode.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cbxScreenMode.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbxScreenMode.FormattingEnabled = True
        Me.cbxScreenMode.Location = New System.Drawing.Point(2, 39)
        Me.cbxScreenMode.Name = "cbxScreenMode"
        Me.cbxScreenMode.Size = New System.Drawing.Size(128, 24)
        Me.cbxScreenMode.TabIndex = 0
        '
        'btnInformation
        '
        Me.btnInformation.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.btnInformation.BackgroundImage = Global.HRD.My.Resources.Resources.i
        Me.btnInformation.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.btnInformation.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnInformation.ForeColor = System.Drawing.Color.Black
        Me.btnInformation.Location = New System.Drawing.Point(508, 8)
        Me.btnInformation.Name = "btnInformation"
        Me.btnInformation.Size = New System.Drawing.Size(28, 26)
        Me.btnInformation.TabIndex = 11
        Me.btnInformation.UseVisualStyleBackColor = False
        '
        'btnPrint
        '
        Me.btnPrint.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.btnPrint.BackgroundImage = Global.HRD.My.Resources.Resources.print
        Me.btnPrint.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.btnPrint.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnPrint.ForeColor = System.Drawing.Color.Black
        Me.btnPrint.Location = New System.Drawing.Point(539, 8)
        Me.btnPrint.Name = "btnPrint"
        Me.btnPrint.Size = New System.Drawing.Size(28, 26)
        Me.btnPrint.TabIndex = 12
        Me.btnPrint.UseVisualStyleBackColor = False
        '
        'Panel2
        '
        Me.Panel2.BackColor = System.Drawing.SystemColors.GradientActiveCaption
        Me.Panel2.Controls.Add(Me.btnPrint)
        Me.Panel2.Controls.Add(Me.btnInformation)
        Me.Panel2.Controls.Add(Me.cbxScreenMode)
        Me.Panel2.Controls.Add(Me.lbl_Heading)
        Me.Panel2.Dock = System.Windows.Forms.DockStyle.Top
        Me.Panel2.Location = New System.Drawing.Point(0, 0)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Size = New System.Drawing.Size(579, 66)
        Me.Panel2.TabIndex = 518
        '
        'lbl_Heading
        '
        Me.lbl_Heading.BackColor = System.Drawing.Color.MidnightBlue
        Me.lbl_Heading.Font = New System.Drawing.Font("Calibri", 15.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lbl_Heading.ForeColor = System.Drawing.Color.White
        Me.lbl_Heading.Location = New System.Drawing.Point(0, 0)
        Me.lbl_Heading.Name = "lbl_Heading"
        Me.lbl_Heading.Size = New System.Drawing.Size(579, 39)
        Me.lbl_Heading.TabIndex = 528
        Me.lbl_Heading.Text = "PRODUCT CREATION"
        Me.lbl_Heading.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Txtprod_Desc
        '
        Me.Txtprod_Desc.Font = New System.Drawing.Font("Tahoma", 9.75!)
        Me.Txtprod_Desc.Location = New System.Drawing.Point(151, 90)
        Me.Txtprod_Desc.Name = "Txtprod_Desc"
        Me.Txtprod_Desc.Size = New System.Drawing.Size(230, 23)
        Me.Txtprod_Desc.TabIndex = 528
        '
        'frmSTH_ProductMaster
        '
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None
        Me.BackColor = System.Drawing.Color.Gainsboro
        Me.ClientSize = New System.Drawing.Size(579, 428)
        Me.Controls.Add(Me.GroupBox4)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Panel2)
        Me.Controls.Add(Me.GroupBox3)
        Me.Font = New System.Drawing.Font("Tahoma", 9.75!)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "frmSTH_ProductMaster"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Product Master"
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox3.PerformLayout()
        Me.GroupBox4.ResumeLayout(False)
        CType(Me.DgvDisplay, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Panel2.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents btnPickList As System.Windows.Forms.Button
    Friend WithEvents txtProductName As System.Windows.Forms.TextBox
    Friend WithEvents lblId As System.Windows.Forms.TextBox
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents chkIsActive As System.Windows.Forms.CheckBox
    Friend WithEvents btnClear As Button
    Friend WithEvents btnReset As Button
    Friend WithEvents btnApply As Button
    Friend WithEvents btnClose As Button
    Friend WithEvents Label4 As Label
    Private WithEvents GroupBox4 As GroupBox
    Public WithEvents DgvDisplay As DataGridView
    Friend WithEvents cbxScreenMode As System.Windows.Forms.ComboBox
    Friend WithEvents btnInformation As System.Windows.Forms.Button
    Friend WithEvents btnPrint As System.Windows.Forms.Button
    Friend WithEvents Panel2 As System.Windows.Forms.Panel
    Friend WithEvents lbl_Heading As System.Windows.Forms.Label
    Friend WithEvents Txtprod_Desc As TextBox
End Class
