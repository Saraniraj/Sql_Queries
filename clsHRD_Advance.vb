Option Explicit On

#Region "Imports"
Imports System
Imports System.Data
Imports System.Data.OleDb
Imports C1.Win.C1FlexGrid.Classic
#End Region

Public Class clsHRD_Advance

    Public Function Get_HRD_Advance_ENTRY_Details(Optional ByVal mvarEntryNo As String = "",
                                      Optional ByVal mvarAuthorize As String = "",
                                      Optional ByVal mvarDeleteMode As String = "",
                                      Optional ByVal mFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection(mvarDbasename))
            Try
                com.CommandText = "sp_GetHRDAdvanceEntry_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 20).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 20).Value = mvarLocationCode
                'com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Trans_No", OleDbType.VarChar, 100).Value = mvarEntryNo
                com.Parameters.Add("@Trans_date", OleDbType.VarChar, 100).Value = mvarAuthorize

                com.Parameters.Add("@Filter_Data", OleDbType.VarChar, 30).Value = mFilterData

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
    End Function

    Public Function Get_HRD_Advance_Main_Details(Optional ByVal mvarEntryNo As String = "",
                                      Optional ByVal mvarAuthorize As String = "",
                                      Optional ByVal mvarDeleteMode As String = "",
                                      Optional ByVal mFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection(mvarDbasename))
            Try
                com.CommandText = "sp_GetHRDAdvancemain_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 20).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 20).Value = mvarLocationCode
                'com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Trans_No", OleDbType.VarChar, 100).Value = mvarEntryNo
                'com.Parameters.Add("@Trans_No", OleDbType.VarChar, 100).Value = mvarEntryNo

                com.Parameters.Add("@Filter_Data", OleDbType.VarChar, 30).Value = mFilterData

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
    End Function
    Public Function Save_HRD_Advance_Main(ByVal mSaveString As String, ByVal mScreenMode As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mReceiptNo As String = ""

        If mInputParam(0).Trim = "" Then
            mReceiptNo = GetAutoNumber(1, mNumberType, "HRD Employee Loan Master")
        Else
            mReceiptNo = mInputParam(0)
        End If

        If Trim(mReceiptNo) = "" Or mobjGrid.Rows <= 0 Then
            Return "Error"
            Exit Function
        End If

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection(mvarDbasename))
        Try
            con.Open()
            com.CommandText = "sp_Save_HRDTransAdvance_Main"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 20).Value = mvarCompanyCode
            com.Parameters.Add("@Location_Code", OleDbType.VarChar, 20).Value = mvarLocationCode
            com.Parameters.Add("@Entry_No", OleDbType.VarChar, 100).Value = mReceiptNo
            com.Parameters.Add("@Entry_Date	", OleDbType.VarChar, 100).Value = mInputParam(1)
            com.Parameters.Add("@Loan_Date	", OleDbType.VarChar, 100).Value = mInputParam(2)
            com.Parameters.Add("@Empcode", OleDbType.VarChar, 100).Value = mInputParam(3)
            com.Parameters.Add("@Empid", OleDbType.VarChar, 100).Value = mInputParam(4)
            com.Parameters.Add("@EDID", OleDbType.VarChar, 100).Value = mInputParam(5)
            com.Parameters.Add("@Loan_Amount", OleDbType.VarChar, 100).Value = mInputParam(6)
            com.Parameters.Add("@int_Rate", OleDbType.VarChar, 100).Value = mInputParam(7)
            com.Parameters.Add("@No_Installs", OleDbType.VarChar, 100).Value = mInputParam(8)
            com.Parameters.Add("@Paid_Amount", OleDbType.VarChar, 100).Value = mInputParam(9)
            com.Parameters.Add("@Loan_balance", OleDbType.VarChar, 100).Value = mInputParam(10)
            com.Parameters.Add("@Is_Completed", OleDbType.VarChar, 100).Value = 0
            com.Parameters.Add("@End_Date", OleDbType.VarChar, 100).Value = mInputParam(11)
            com.Parameters.Add("@Others", OleDbType.VarChar, 100).Value = mInputParam(12)
            com.Parameters.Add("@Authorize", OleDbType.VarChar, 1).Value = "0"
            com.Parameters.Add("@Delete_Mode", OleDbType.VarChar, 1).Value = "0"
            com.Parameters.Add("@Screen_Mode", OleDbType.VarChar, 20).Value = mScreenMode
            com.Parameters.Add("@User_Code", OleDbType.VarChar, 15).Value = mvarUserID

            Dim OutParam As OleDbParameter = New OleDbParameter("@iSuccessFlag", OleDbType.Integer)
            OutParam.Direction = ParameterDirection.Output
            com.Parameters.Add(OutParam)
            com.ExecuteNonQuery()

            'If com.Parameters("@iSuccessFlag").Value = 1 Then
            '    SuccessFlag = 0
            '    SuccessFlag = SaveOvertimeEntry_Line(mReceiptNo, mInputParam(1), mobjGrid, mScreenMode)
            '    If SuccessFlag = 0 Then
            '        Return "Error"
            '    End If
            'Else
            '    Return "Error"
            'End If
            com.Dispose()
            con.Dispose()
            da.Dispose()
        Catch ex As Exception
            Show_Message(ex.Message)
            da.Dispose()
            com.Dispose()
            con.Dispose()
        End Try
        Return mReceiptNo
    End Function

    Public Function Get_EmpLoanAdvance_Report(ByVal selectedvalues As String, ByVal mfromdate As String, ByVal mtodate As String, ByVal mSex As String, Optional ByVal mBank As String = "", Optional ByVal mLoandate As String = "", Optional ByVal mType As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection(mvarDbasename))
            Try
                com.CommandText = "sp_GetHRDLoanAdvance_Report"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 20).Value = mvarLocationCode

                com.Parameters.Add("@Cat_name	", OleDbType.VarChar, 500).Value = selectedvalues
                com.Parameters.Add("@Gender	", OleDbType.VarChar, 50).Value = mSex
                com.Parameters.Add("@from_date", OleDbType.VarChar, 100).Value = mfromdate
                com.Parameters.Add("@to_date", OleDbType.VarChar, 100).Value = mtodate
                com.Parameters.Add("@Bank	", OleDbType.VarChar, 50).Value = mBank

                com.Parameters.Add("@Loan_Date", OleDbType.VarChar, 200).Value = mLoandate

                com.Parameters.Add("@Mode", OleDbType.VarChar, 200).Value = mType
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
    End Function
    Public Function Get_HRDPaymentReceipt_Details(Optional ByVal mvarDeptCode As String = "",
                                             Optional ByVal mvarFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection(mvarDbasename))
            Try
                com.CommandText = "sp_Get_HRDPaymentReceipt"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 20).Value = mvarLocationCode
                com.Parameters.Add("@ID", OleDbType.VarChar, 100).Value = mvarDeptCode
                com.Parameters.Add("@Filter_Data", OleDbType.VarChar, 50).Value = mvarFilterData

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
    End Function
    Public Function Save_HRDPaymentReceipt(ByVal mSaveString As String, ByVal mScreenMode As String, ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mCatcode As String = ""

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection(mvarDbasename))
        Try
            con.Open()

            If mInputParam(0).Trim = "" Then

                Dim mCode As OleDb.OleDbDataReader
                Dim cmd1 As New OleDbCommand("select isnull(Max(ID ),0)+1 from HRD_PaymentReceipt Where  Location_Code='" & mvarLocationCode & "'", con)
                mCode = cmd1.ExecuteReader()
                Dim id = 0
                If mCode.Read = True Then
                    mCatcode = mCode(0)
                End If

                ' mEmpcode = GetAutoNumber(1, mNumberType, "SMT Employee Master")
            Else
                mCatcode = mInputParam(0)
            End If

            com.CommandText = "sp_Save_HRD_PaymentReceipt"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
            com.Parameters.Add("@Location_Code", OleDbType.VarChar, 20).Value = mvarLocationCode
            com.Parameters.Add("@ID", OleDbType.VarChar, 100).Value = mCatcode
            com.Parameters.Add("@Entry_Date", OleDbType.VarChar, 150).Value = mInputParam(1)
            com.Parameters.Add("@Loan_Ref_No", OleDbType.VarChar, 150).Value = mInputParam(2)
            com.Parameters.Add("@Loan_Ref_Date", OleDbType.VarChar, 150).Value = mInputParam(3)
            com.Parameters.Add("@Loan_Date", OleDbType.VarChar, 150).Value = mInputParam(4)

            com.Parameters.Add("@Empcode", OleDbType.VarChar, 150).Value = mInputParam(5)
            com.Parameters.Add("@Empid", OleDbType.VarChar, 150).Value = mInputParam(6)
            com.Parameters.Add("@Type", OleDbType.VarChar, 150).Value = mInputParam(7)

            com.Parameters.Add("@Amount", OleDbType.VarChar, 150).Value = mInputParam(8)
            com.Parameters.Add("@Amount", OleDbType.VarChar, 150).Value = mInputParam(9)

            com.Parameters.Add("@Isactive", OleDbType.VarChar, 1).Value = mInputParam(10)
            com.Parameters.Add("@Screen_Mode", OleDbType.VarChar, 20).Value = mScreenMode
            com.Parameters.Add("@User_Code", OleDbType.VarChar, 15).Value = mvarUserID

            Dim OutParam As OleDbParameter = New OleDbParameter("@iSuccessFlag", OleDbType.Integer)
            OutParam.Direction = ParameterDirection.Output
            com.Parameters.Add(OutParam)
            com.ExecuteNonQuery()

            If com.Parameters("@iSuccessFlag").Value = 1 Then
                Return mCatcode
            Else
                Return "Error"
            End If
            com.Dispose()
            con.Dispose()
            da.Dispose()
        Catch ex As Exception
            Show_Message(ex.Message)
            da.Dispose()
            com.Dispose()
            con.Dispose()
        End Try
        Return mCatcode
    End Function


    Public Function Get_Proll_EmployeePerdaywages_Details(Optional ByVal mvarDeptCode As String = "",
                                               Optional ByVal mvarFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection(mvarDbasename))
            Try
                com.CommandText = "sp_Get_Proll_EmployeePerdaywages_Entry"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 20).Value = mvarLocationCode
                com.Parameters.Add("@ID", OleDbType.VarChar, 100).Value = mvarDeptCode
                com.Parameters.Add("@Filter_Data", OleDbType.VarChar, 50).Value = mvarFilterData

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
    End Function
    Public Function Save_Proll_EmployeePerdaywages_Entry(ByVal mSaveString As String, ByVal mScreenMode As String, ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mCatcode As String = ""

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection(mvarDbasename))
        Try
            con.Open()

            If mInputParam(0).Trim = "" Then

                Dim mCode As OleDb.OleDbDataReader
                Dim cmd1 As New OleDbCommand("select isnull(Max(ID ),0)+1 from Proll_EmployeePerdaywages_Entry Where  Location_Code='" & mvarLocationCode & "'", con)
                mCode = cmd1.ExecuteReader()
                Dim id = 0
                If mCode.Read = True Then
                    mCatcode = mCode(0)
                End If

                ' mEmpcode = GetAutoNumber(1, mNumberType, "SMT Employee Master")
            Else
                mCatcode = mInputParam(0)
            End If

            com.CommandText = "sp_Save_Proll_EmployeePerdaywages_Entry"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
            com.Parameters.Add("@Location_Code", OleDbType.VarChar, 20).Value = mvarLocationCode
            com.Parameters.Add("@ID", OleDbType.VarChar, 100).Value = mCatcode
            com.Parameters.Add("@Entry_Date", OleDbType.VarChar, 150).Value = mInputParam(1)
            com.Parameters.Add("@Loan_Ref_No", OleDbType.VarChar, 150).Value = mInputParam(2)
            com.Parameters.Add("@Loan_Ref_Date", OleDbType.VarChar, 150).Value = mInputParam(3)
            com.Parameters.Add("@Loan_Date", OleDbType.VarChar, 150).Value = mInputParam(4)

            com.Parameters.Add("@Empcode", OleDbType.VarChar, 150).Value = mInputParam(5)
            com.Parameters.Add("@Empid", OleDbType.VarChar, 150).Value = mInputParam(6)
            com.Parameters.Add("@Type", OleDbType.VarChar, 150).Value = mInputParam(7)

            com.Parameters.Add("@Amount", OleDbType.VarChar, 150).Value = mInputParam(8)
            com.Parameters.Add("@Amount", OleDbType.VarChar, 150).Value = mInputParam(9)

            com.Parameters.Add("@Isactive", OleDbType.VarChar, 1).Value = mInputParam(10)
            com.Parameters.Add("@Screen_Mode", OleDbType.VarChar, 20).Value = mScreenMode
            com.Parameters.Add("@User_Code", OleDbType.VarChar, 15).Value = mvarUserID

            Dim OutParam As OleDbParameter = New OleDbParameter("@iSuccessFlag", OleDbType.Integer)
            OutParam.Direction = ParameterDirection.Output
            com.Parameters.Add(OutParam)
            com.ExecuteNonQuery()

            If com.Parameters("@iSuccessFlag").Value = 1 Then
                Return mCatcode
            Else
                Return "Error"
            End If
            com.Dispose()
            con.Dispose()
            da.Dispose()
        Catch ex As Exception
            Show_Message(ex.Message)
            da.Dispose()
            com.Dispose()
            con.Dispose()
        End Try
        Return mCatcode
    End Function




End Class
