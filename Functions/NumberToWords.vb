Module Module1

    Function strReplicate(ByVal str As String, ByVal intD As Integer) As String
        'This fucntion padded "0" after the number to evaluate hundred, thousand and on....
        'using this function you can replicate any Charactor with given string.
        Dim i As Integer
        strReplicate = ""
        For i = 1 To intD
            strReplicate = strReplicate + str
        Next
        Return strReplicate
    End Function

    Function AmtInWord(ByVal Num As Decimal) As String
        'I have created this function for converting amount in indian rupees (INR). 
        'You can manipulate as you wish like decimal setting, Doller (any currency) Prefix.

        Dim strNum As String
        Dim strNumDec As String
        Dim StrWord As String
        strNum = Num

        If InStr(1, strNum, ".") <> 0 Then
            strNumDec = Mid(strNum, InStr(1, strNum, ".") + 1)

            If Len(strNumDec) = 1 Then
                strNumDec = strNumDec + "0"
            End If
            If Len(strNumDec) > 2 Then
                strNumDec = Mid(strNumDec, 1, 2)
            End If

            strNum = Mid(strNum, 1, InStr(1, strNum, ".") - 1)
            StrWord = IIf(CDbl(strNum) = 1, "", "") + NumToWord(CDbl(strNum)) + IIf(CDbl(strNumDec) > 0, " and Paise" + cWord3(CDbl(strNumDec)), "")
        Else
            StrWord = IIf(CDbl(strNum) = 1, "", "") + NumToWord(CDbl(strNum))
        End If
        AmtInWord = StrWord & " GHS " & " Only"
        Return AmtInWord
    End Function

    Function NumToWord(ByVal Num As Decimal) As String
        'I divided this function in two part.
        '1. Three or less digit number.
        '2. more than three digit number.
        Dim strNum As String
        Dim StrWord As String
        strNum = Num

        If Len(strNum) <= 3 Then
            StrWord = cWord3(CDbl(strNum))
        Else
            StrWord = cWordG3(CDbl(Mid(strNum, 1, Len(strNum) - 3))) + " " + cWord3(CDbl(Mid(strNum, Len(strNum) - 2)))
        End If
        NumToWord = StrWord
    End Function

    Function cWordG3(ByVal Num As Decimal) As String
        '2. more than three digit number.
        Dim strNum As String = ""
        Dim StrWord As String = ""
        Dim readNum As String = ""
        strNum = Num
        If Len(strNum) Mod 2 <> 0 Then
            readNum = CDbl(Mid(strNum, 1, 1))
            If readNum <> "0" Then
                StrWord = retWord(readNum)
                readNum = CDbl("1" + strReplicate("0", Len(strNum) - 1) + "000")
                StrWord = StrWord + " " + retWord(readNum)
            End If
            strNum = Mid(strNum, 2)
        End If
        While Not Len(strNum) = 0
            readNum = CDbl(Mid(strNum, 1, 2))
            If readNum <> "0" Then
                StrWord = StrWord + " " + cWord3(readNum)
                readNum = CDbl("1" + strReplicate("0", Len(strNum) - 2) + "000")
                StrWord = StrWord + " " + retWord(readNum)
            End If
            strNum = Mid(strNum, 3)
        End While
        cWordG3 = StrWord
        Return cWordG3
    End Function

    Function cWord3(ByVal Num As Decimal) As String
        '1. Three or less digit number.
        Dim strNum As String = ""
        Dim StrWord As String = ""
        Dim readNum As String = ""
        If Num < 0 Then Num = Num * -1
        strNum = Num

        If Len(strNum) = 3 Then
            readNum = CDbl(Mid(strNum, 1, 1))
            StrWord = retWord(readNum) + " Hundred"
            strNum = Mid(strNum, 2, Len(strNum))
        End If

        If Len(strNum) <= 2 Then
            If CDbl(strNum) >= 0 And CDbl(strNum) <= 20 Then
                StrWord = StrWord + " " + retWord(CDbl(strNum))
            Else
                StrWord = StrWord + " " + retWord(CDbl(Mid(strNum, 1, 1) + "0")) + " " + retWord(CDbl(Mid(strNum, 2, 1)))
            End If
        End If

        strNum = CStr(Num)
        cWord3 = StrWord
        Return cWord3
    End Function

    Function retWord(ByVal Num As Decimal) As String
        'This two dimensional array store the primary word convertion of number.
        retWord = ""
        Dim ArrWordList(,) As Object = {{0, ""}, {1, "One"}, {2, "Two"}, {3, "Three"}, {4, "Four"},
                                        {5, "Five"}, {6, "Six"}, {7, "Seven"}, {8, "Eight"}, {9, "Nine"},
                                        {10, "Ten"}, {11, "Eleven"}, {12, "Twelve"}, {13, "Thirteen"}, {14, "Fourteen"},
                                        {15, "Fifteen"}, {16, "Sixteen"}, {17, "Seventeen"}, {18, "Eighteen"}, {19, "Nineteen"},
                                        {20, "Twenty"}, {30, "Thirty"}, {40, "Forty"}, {50, "Fifty"}, {60, "Sixty"},
                                        {70, "Seventy"}, {80, "Eighty"}, {90, "Ninety"}, {100, "Hundred"}, {1000, "Thousand"},
                                        {100000, "Lakh"}, {10000000, "Crore"}}

        Dim i As Integer
        For i = 0 To UBound(ArrWordList)
            If Num = ArrWordList(i, 0) Then
                retWord = ArrWordList(i, 1)
                Exit For
            End If
        Next
        Return retWord
    End Function
	
    Public Sub ExportToExcel(ByRef grdAtt As System.Windows.Forms.DataGridView)

        If grdAtt Is Nothing OrElse grdAtt.RowCount <= 0 Then
            MsgBox("No record to export !!!")
            Exit Sub
        End If

        Dim xlApp As New Microsoft.Office.Interop.Excel.Application
        Dim xlWorkBook As Microsoft.Office.Interop.Excel.Workbook
        Dim misValue As Object = System.Reflection.Missing.Value

        Try

            xlWorkBook = xlApp.Workbooks.Add(misValue)
            xlApp.Visible = True
            Dim xlWorkSheet = xlWorkBook.ActiveSheet

            'Data transfer from grid to Excel. 
            With xlWorkSheet
                .Range("A1", misValue).EntireRow.Font.Bold = True

                'Set Clipboard Copy Mode
                grdAtt.ClipboardCopyMode = DataGridViewClipboardCopyMode.EnableAlwaysIncludeHeaderText

                grdAtt.SelectAll()

                'Get the content from Grid for Clipboard
                Dim str As String = TryCast(grdAtt.GetClipboardContent().GetData(DataFormats.UnicodeText), String)

                'Set the content to Clipboard
                Clipboard.SetText(str, TextDataFormat.UnicodeText)
                Dim myRowCount As Int16 = grdAtt.RowCount
                myRowCount = myRowCount + 1
                'Identifiy and select the range of cells in excel to paste the clipboard data.
                '.Range("A1:" & ConvertToLetter(grdAtt.ColumnCount) & grdAtt.RowCount, misValue).Select()
                .Range("A1:" & ConvertToLetter(grdAtt.ColumnCount) & myRowCount, misValue).Select()
                'Paste the clipboard data
                .Paste()
                Clipboard.Clear()
            End With
            releaseObjectExl(xlWorkSheet)

        Catch ex As Exception
            MessageBox.Show(ex.Message)
        Finally
            releaseObjectExl(xlWorkBook)
            releaseObjectExl(xlApp)
        End Try

    End Sub
    Private Sub releaseObjectExl(ByVal obj As Object)
        Try
            System.Runtime.InteropServices.Marshal.ReleaseComObject(obj)
            obj = Nothing
        Catch ex As Exception
            obj = Nothing
        Finally
            GC.Collect()
        End Try
    End Sub
    Public Function GetComputerName() As String
        Try
            Return System.Environment.MachineName
        Catch generatedExceptionName As Exception
            'throw new Exception(ex.Message);
            Return ""
        End Try
    End Function
    Public Function GetIPAddress() As String
        Dim mcadd As String = ""
        Try
            Dim host As IPHostEntry
            host = Dns.GetHostEntry(Dns.GetHostName())
            For Each ip As IPAddress In host.AddressList
                If ip.AddressFamily = AddressFamily.InterNetwork Then
                    mcadd = mcadd & ip.ToString()
                End If
            Next
            Return mcadd
        Catch generatedExceptionName As Exception
            'throw new Exception(ex.Message);
            Return ""
        End Try
    End Function
    Private Function ConvertToLetter(ByVal num As Integer) As String
        num = num - 1
        If num < 0 Or num >= 27 * 26 Then
            ConvertToLetter = "-"
        Else
            If num < 26 Then
                ConvertToLetter = Chr(num + 65)
            Else
                ConvertToLetter = Chr(num \ 26 + 64) + Chr(num Mod 26 + 65)
            End If
        End If
    End Function

End Module
