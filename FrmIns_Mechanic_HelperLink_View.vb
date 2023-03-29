Imports C1.Win.C1FlexGrid
'Imports C1.Win.C1Win7Pack.C1TaskDialog
'Imports C1.Win.C1Win7Pack

Imports System.Windows.Forms
Imports C1.Win.C1Command
Public Class FrmIns_Mechanic_HelperLink_View
    Public querystring As String = ""
    Dim mobjdeptmaster As New clsDepartment_Master

    Private newstringcollec As New System.Collections.Specialized.StringCollection
    Public Sub InitializeForm(ByVal mvarScreenName As String)
        Try
            ' FillScreenMode(mvarScreenName, cbxScreenMode)
        Catch ex As Exception
            Show_Message(ex.Message)
        End Try
    End Sub
    'Public Sub loadallcommands(ByVal classname As String, ByVal storedproc As String)
    '    Try
    '        connect()
    '        con.open()
    '        Dim adapter As New mysqldataadapter
    '        Dim ds As New dataset
    '        adapter = New mysqldataadapter(storedproc, con)
    '        adapter.selectcommand.commandtype = commandtype.storedprocedure
    '        adapter.selectcommand.parameters.addwithvalue("@id", APCESMainForm.employeeid.text)
    '        adapter.selectcommand.parameters.addwithvalue("@classnames", classname)
    '        adapter.fill(ds)
    '        con.close()
    '        newstringcollec.clear()
    '        For Each row As datarow In ds.tables(0).rows
    '            newstringcollec.add(row.item("commandname").tostring.tolower)
    '        Next
    '        For Each x As c1.win.c1command.c1command In Me.c1commandholder1.commands
    '            If x.name.tolower.contains("c1contextmenu") Then
    '                x.enabled = True
    '            ElseIf x.name.tolower = "c1command1" Or x.name.contains("runcmd") Then
    '                x.enabled = True
    '            ElseIf newstringcollec.contains(x.name.tolower) Then
    '                x.enabled = True
    '            Else
    '                x.enabled = False
    '            End If
    '        Next
    '    Catch ex As exception
    '        showmessage(ex.message, "exception found", application.productname.tostring, 1)
    '    End Try
    'End Sub
    Private Sub inputbutton1_click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles InputButtonSearch.Click
        Dim i As String = " where DeptName like '%" & Me.DepartmentCombo.Text &
            "%' and GroupName like '%" & Me.DescriptionTextbox.Text &
            "%' "
        Dim isactive = ""
        If Me.ActiveBoth.Checked = True Then isactive = "" Else isactive = " and active=" & Convert.ToSingle(Me.ActiveYes.Checked)
        queryall(i & isactive)
    End Sub
    Private Sub queryall(ByVal a As String)
        querystring = a
        loaddata("departments_gridmain", a, Me.C1FlexGrid1)
    End Sub
    Private Sub c1flexgrid1_mouseclick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles C1FlexGrid1.MouseClick
        DataGridView1_MouseClick(sender, e, Me.C1FlexGrid1, Me.C1ContextMenu1)
        If (e.Button = Windows.Forms.MouseButtons.Right) Then

            C1ContextMenu1.ShowContextMenu(C1FlexGrid1, e.Location)
        End If
    End Sub
    Private Sub FrmIns_Mechanic_HelperLink_View_load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        queryall("")
    End Sub
    Private Sub addnewcommand_click(ByVal sender As System.Object, ByVal e As C1.Win.C1Command.ClickEventArgs) Handles AddNewCommand.Click
        Dim x As New frmDeptMaster(0, 2)
        With x
            .StartPosition = FormStartPosition.CenterScreen
            .ShowDialog()
        End With

        'Dim mobjtransattendance As New FrmTransAttendance(id, 2)
        'mobjtransattendance.StartPosition = FormStartPosition.CenterScreen
        'mobjtransattendance.ShowDialog()

    End Sub
    'Private Sub deleterecordcommand_click(ByVal sender As system.object, ByVal e As c1.win.c1command.clickeventargs) Handles deleterecordcommand.click
    '    Try
    '        Dim sagot As msgboxresult = messagebox.show("performing the command will delete the selected record. are you sure you want to proceed?", "delete record?", messageboxbuttons.yesnocancel, messageboxicon.stop)
    '        If sagot = msgboxresult.yes Then
    '            saveeditdelete("delete from departments where departmentid=" & Me.c1flexgrid1.rows(Me.c1flexgrid1.rowsel).item("departmentid"), "deleted")
    '            refreshform()
    '        End If
    '    Catch ex As exception
    '    End Try
    'End Sub
    Public Sub refreshform()
        queryall("")
        ''  loaddata("departments_gridmain", Me.querystring, Me.C1FlexGrid1)
    End Sub

    Private Sub editrecordcommand_click(ByVal sender As Object, ByVal e As C1.Win.C1Command.ClickEventArgs) Handles EditRecordCommand.Click
        Try
            Dim id As Integer = Me.C1FlexGrid1.Rows(Me.C1FlexGrid1.RowSel).Item("DeptCode")

            'Dim x As New frmDeptMaster(id, 2)
            'With x
            '    .StartPosition = FormStartPosition.CenterScreen
            '    .showdialog()
            'End With

            Dim mobjfrmDeptMaster As New frmDeptMaster(id, 2)
            mobjfrmDeptMaster.StartPosition = FormStartPosition.CenterScreen
            mobjfrmDeptMaster.ShowDialog()

        Catch ex As Exception
        End Try
    End Sub

    Private Sub refreshcommand_click(ByVal sender As System.Object, ByVal e As C1.Win.C1Command.ClickEventArgs) Handles RefreshCommand.Click
        Me.refreshform()
    End Sub

    Private Sub inputbutton2_click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles InputButtonRefresh.Click
        Me.ActiveBoth.Checked = True
        Me.DepartmentCombo.Text = Nothing
        Me.DescriptionTextbox.Text = Nothing
    End Sub

    Private Sub inputbutton3_click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles InputButtonClearFields.Click
        Me.refreshform()
    End Sub

    Private Sub exportgriddatalist_click(ByVal sender As System.Object, ByVal e As C1.Win.C1Command.ClickEventArgs) Handles ExportGridDataList.Click
        ExportGridData(Me.C1FlexGrid1)
    End Sub
    Public Sub ExportGridData(ByVal datagridview1 As C1.Win.C1FlexGrid.C1FlexGrid)
        Try
            Dim saveFileDialog1 As New SaveFileDialog()
            saveFileDialog1.Filter = "Excel files (*.xls)|*.xls"
            saveFileDialog1.FilterIndex = 2
            saveFileDialog1.RestoreDirectory = True
            If saveFileDialog1.ShowDialog() = Windows.Forms.DialogResult.OK And saveFileDialog1.FileName <> "" Then
                datagridview1.SaveExcel(saveFileDialog1.FileName, C1.Win.C1FlexGrid.FileFlags.IncludeFixedCells Or C1.Win.C1FlexGrid.FileFlags.VisibleOnly)
            Else
                Exit Sub
            End If

            showMessage("The file you have requested has been successfully exported to " & saveFileDialog1.FileName, "Export completed", "Export success!", 3)
        Catch ex As Exception
        End Try
    End Sub
    Public Sub loaddata(ByVal Sql As String, ByVal FilterQuery As String, ByVal flexgrid As C1FlexGrid)
        Try

            ds = Nothing
            ds = New DataSet
            SSQL = ""
            SSQL = " select DeptCode,DeptName,GroupName,Sudeptgroup,San_strength,SlNo,IS_Active"
            SSQL &= "  From  Deptmaster as a "
            SSQL &= FilterQuery
            SSQL &= " order by DeptCode"
            ds = ReturnMultipleValue(SSQL, mvarDbasename)

            With flexgrid
                .Redraw = False
                .DataSource = ds.Tables(0)
                .Styles.EmptyArea.BackColor = Color.White
                .Styles.EmptyArea.Border.Style = C1.Win.C1FlexGrid.BorderStyleEnum.None
                .Styles.Alternate.BackColor = Color.White
                .Styles.Alternate.Border.Direction = BorderDirEnum.Both
                .Styles.Alternate.Border.Color = Color.Gray
                .Styles.Alternate.ForeColor = Color.Black
                .Styles.Alternate.Border.Style = C1.Win.C1FlexGrid.BorderStyleEnum.Dotted
                .Styles.Normal.BackColor = Color.White
                .Styles.Normal.Border.Direction = BorderDirEnum.Both
                .Styles.Normal.Border.Color = Color.Gray
                .Styles.Normal.Border.Style = C1.Win.C1FlexGrid.BorderStyleEnum.Dotted
                .Styles.Normal.ForeColor = Color.Black
                .SelectionMode = SelectionModeEnum.Row
                .FocusRect = FocusRectEnum.None
                .ExtendLastCol = True
                If .Cols.Fixed = 1 Then
                    .Cols(1).Visible = False
                Else
                    .Cols(0).Visible = False
                End If

                .Redraw = True
            End With
            formatGrid(flexgrid)
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub
    Public Sub formatGrid(ByVal grid As C1FlexGrid)
        With grid
            '  .Styles.Normal.Font = New Font(APCESMainForm.RibbonFontComboBox1.Text, APCESMainForm.statusTrackBar.Value, FontStyle.Regular)
            '  .Styles.Fixed.Font = New Font("Arial", APCESMainForm.statusTrackBar.Value, FontStyle.Bold)
            If grid.SelectionMode = SelectionModeEnum.Default Then .FocusRect = FocusRectEnum.Solid Else .FocusRect = FocusRectEnum.None
            '.Styles.EmptyArea.BackColor = StudentsMain.C1NavBarPanel1.BackColor
            .AutoSizeCols()
            .AutoSizeRows()
        End With
    End Sub
    Public Function DataGridView1_MouseClick(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs, ByVal DataGridView1 As C1FlexGrid, ByVal C1ContextMenu1 As C1ContextMenu) As Integer
        If (e.Button = Windows.Forms.MouseButtons.Right) Then
            Dim x As Integer = DataGridView1.HitTest(e.Location.X, e.Location.Y).Row
            DataGridView1.Row = x
            Return x
            Exit Function
        End If
        Return 0
    End Function

End Class

