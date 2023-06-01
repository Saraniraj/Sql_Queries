Option Explicit On
#Region "Imports"
Imports System
Imports System.Data
Imports System.Data.OleDb
Imports C1.Win.C1FlexGrid.Classic
#End Region

Public Class clsHRD_Stitching
    Public Function Get_STH_Productmaster_Details(Optional ByVal mvarDeptCode As String = "",
                                              Optional ByVal mvarFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection(mvarDbasename))
            Try
                com.CommandText = "sp_Get_STH_Product_Master"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 20).Value = mvarLocationCode
                com.Parameters.Add("@Dept_Code", OleDbType.VarChar, 100).Value = mvarDeptCode
                com.Parameters.Add("@Filter_Data", OleDbType.VarChar, 10).Value = mvarFilterData

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
    Public Function Save_STH_Productmaster(ByVal mSaveString As String, ByVal mScreenMode As String, ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mCatcode As String = ""

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection(mvarDbasename))
        Try
            con.Open()

            If mInputParam(0).Trim = "" Then

                Dim mCode As OleDb.OleDbDataReader
                Dim cmd1 As New OleDbCommand("select isnull(Max(STH_Prod_Code ),0)+1 from STH_Product_Master Where  Location_Code='" & mvarLocationCode & "'", con)
                mCode = cmd1.ExecuteReader()
                Dim id = 0
                If mCode.Read = True Then
                    mCatcode = mCode(0)
                End If

                ' mEmpcode = GetAutoNumber(1, mNumberType, "SMT Employee Master")
            Else
                mCatcode = mInputParam(0)
            End If

            com.CommandText = "sp_Save_STH_Product_Master"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
            com.Parameters.Add("@Location_Code", OleDbType.VarChar, 20).Value = mvarLocationCode
            com.Parameters.Add("@STH_Prod_Code", OleDbType.VarChar, 100).Value = mCatcode
            com.Parameters.Add("@Product_Name", OleDbType.VarChar, 150).Value = mInputParam(1)
            com.Parameters.Add("@Product_Desc", OleDbType.VarChar, 150).Value = mInputParam(2)
            com.Parameters.Add("@Isactive", OleDbType.VarChar, 1).Value = mInputParam(3)
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
    Public Function Get_STH_Operationmaster_Details(Optional ByVal mvarDeptCode As String = "",
                                            Optional ByVal mvarFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection(mvarDbasename))
            Try
                com.CommandText = "sp_Get_STH_Operation_Master"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 20).Value = mvarLocationCode
                com.Parameters.Add("@ID", OleDbType.VarChar, 100).Value = mvarDeptCode
                com.Parameters.Add("@Filter_Data", OleDbType.VarChar, 10).Value = mvarFilterData

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
    Public Function Save_STH_Operationmaster(ByVal mSaveString As String, ByVal mScreenMode As String, ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mCatcode As String = ""

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection(mvarDbasename))
        Try
            con.Open()

            If mInputParam(0).Trim = "" Then

                Dim mCode As OleDb.OleDbDataReader
                Dim cmd1 As New OleDbCommand("select isnull(Max(Ops_Code ),0)+1 from STH_Operation_Master Where  Location_Code='" & mvarLocationCode & "'", con)
                mCode = cmd1.ExecuteReader()
                Dim id = 0
                If mCode.Read = True Then
                    mCatcode = mCode(0)
                End If

                ' mEmpcode = GetAutoNumber(1, mNumberType, "SMT Employee Master")
            Else
                mCatcode = mInputParam(0)
            End If

            com.CommandText = "sp_Save_STH_Operation_Master"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
            com.Parameters.Add("@Location_Code", OleDbType.VarChar, 20).Value = mvarLocationCode
            com.Parameters.Add("@Ops_Code", OleDbType.VarChar, 100).Value = mCatcode
            com.Parameters.Add("@Operation_Name", OleDbType.VarChar, 150).Value = mInputParam(1)
            com.Parameters.Add("@Product_Name", OleDbType.VarChar, 150).Value = mInputParam(2)
            com.Parameters.Add("@Rate_Per_Pcs", OleDbType.VarChar, 150).Value = mInputParam(3)

            com.Parameters.Add("@Isactive", OleDbType.VarChar, 1).Value = mInputParam(4)
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
    Public Function GetSTH_DailyStitching_Details(Optional ByVal mvarEntryNo As String = "",
                                 Optional ByVal mvarAuthorize As String = "",
                                 Optional ByVal mvarDeleteMode As String = "",
                                 Optional ByVal mFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection(mvarDbasename))
            Try
                com.CommandText = "sp_GetSTH_DailyStitching_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
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

    Public Function SaveSTH_DailyStitchingEntry_Main(ByVal mSaveString As String, ByVal mScreenMode As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mReceiptNo As String = ""

        If mInputParam(0).Trim = "" Then
            mReceiptNo = GetAutoNumber(1, mNumberType, "STH Production Entry")
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
            com.CommandText = "sp_Save_STH_DailyStitchingEntry_Main"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
            com.Parameters.Add("@Location_code", OleDbType.VarChar, 10).Value = mvarLocationCode

            com.Parameters.Add("@Entry_No", OleDbType.VarChar, 100).Value = mReceiptNo
            com.Parameters.Add("@Entry_Date	", OleDbType.VarChar, 100).Value = mInputParam(1)
            com.Parameters.Add("@STH_Date", OleDbType.VarChar, 100).Value = mInputParam(2)
            com.Parameters.Add("@Total_Stitched", OleDbType.VarChar, 100).Value = mInputParam(3)
            com.Parameters.Add("@Total_Amount", OleDbType.VarChar, 100).Value = mInputParam(4)
            com.Parameters.Add("@Unit", OleDbType.VarChar, 100).Value = mInputParam(5)
            com.Parameters.Add("@Others", OleDbType.VarChar, 100).Value = mInputParam(6)
            com.Parameters.Add("@Authorize", OleDbType.VarChar, 1).Value = "0"
            com.Parameters.Add("@Delete_Mode", OleDbType.VarChar, 1).Value = "0"
            com.Parameters.Add("@Screen_Mode", OleDbType.VarChar, 20).Value = mScreenMode
            com.Parameters.Add("@User_Code", OleDbType.VarChar, 15).Value = mvarUserID

            Dim OutParam As OleDbParameter = New OleDbParameter("@iSuccessFlag", OleDbType.Integer)
            OutParam.Direction = ParameterDirection.Output
            com.Parameters.Add(OutParam)
            com.ExecuteNonQuery()

            If com.Parameters("@iSuccessFlag").Value = 1 Then
                SuccessFlag = 0
                SuccessFlag = Save_STH_DailyStitchingEntry_Line(mReceiptNo, mInputParam(1), mInputParam(2), mobjGrid, mScreenMode)
                If SuccessFlag = 0 Then
                    Return "Error"
                End If
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
        Return mReceiptNo
    End Function
    Private Function Save_STH_DailyStitchingEntry_Line(ByVal mReceiptNo As String, ByVal mReceiptDate As String, ByVal msthdate As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mScreenMode As String) As Long
        Dim SuccessFlag As Integer = 0
        com = New OleDbCommand
        con = New OleDbConnection(GetConnection(mvarDbasename))
        Try
            If Trim(mReceiptNo) = "" Or mobjGrid.Rows <= 0 Then
                Return SuccessFlag
            End If

            com.CommandText = "sp_Save_STH_DailyStitchingEntry_Line"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            Dim msno As Integer = 0

            For iRow As Integer = 1 To mobjGrid.Rows - 1
                msno = msno + 1
                con.Open()
                com.Parameters.Clear()
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_code", OleDbType.VarChar, 10).Value = mvarLocationCode

                com.Parameters.Add("@Entry_No", OleDbType.VarChar, 100).Value = mReceiptNo
                com.Parameters.Add("@Entry_Date", OleDbType.VarChar, 100).Value = mReceiptDate
                com.Parameters.Add("@STH_Date", OleDbType.VarChar, 250).Value = msthdate

                com.Parameters.Add("@Sno", OleDbType.VarChar, 100).Value = msno
                com.Parameters.Add("@EmpCode", OleDbType.VarChar, 250).Value = Trim(mobjGrid.get_TextMatrix(iRow, 2))
                com.Parameters.Add("@Tokenno", OleDbType.VarChar, 250).Value = Trim(mobjGrid.get_TextMatrix(iRow, 2))
                com.Parameters.Add("@Ops_Code", OleDbType.VarChar, 250).Value = Trim(mobjGrid.get_TextMatrix(iRow, 5))
                com.Parameters.Add("@Operation_Name", OleDbType.VarChar, 250).Value = Trim(mobjGrid.get_TextMatrix(iRow, 6))
                com.Parameters.Add("@Product_Name", OleDbType.VarChar, 250).Value = Trim(mobjGrid.get_TextMatrix(iRow, 7))
                com.Parameters.Add("@Rate_Per_Pcs", OleDbType.VarChar, 250).Value = Val(mobjGrid.get_TextMatrix(iRow, 8))
                com.Parameters.Add("@NO_of_Stitched", OleDbType.VarChar, 250).Value = Val(mobjGrid.get_TextMatrix(iRow, 9))
                com.Parameters.Add("@Stitched_Amount", OleDbType.VarChar, 100).Value = Val(mobjGrid.get_TextMatrix(iRow, 10))
                com.Parameters.Add("@Authorize", OleDbType.VarChar, 1).Value = "0"
                com.Parameters.Add("@Delete_Mode", OleDbType.VarChar, 1).Value = "0"
                com.Parameters.Add("@Screen_Mode", OleDbType.VarChar, 20).Value = mScreenMode
                com.Parameters.Add("@User_Code", OleDbType.VarChar, 15).Value = mvarUserID

                Dim parm As OleDbParameter = New OleDbParameter("@iSuccessFlag", OleDbType.Integer)
                parm.Direction = ParameterDirection.Output
                com.Parameters.Add(parm)
                com.ExecuteNonQuery()

                If com.Parameters("@iSuccessFlag").Value = 1 Then
                    SuccessFlag = 1
                Else
                    SuccessFlag = 0
                End If
                con.Close()
            Next
            com.Dispose()
            con.Dispose()
            da.Dispose()
        Catch ex As Exception
            Show_Message(ex.Message)
            da.Dispose()
            com.Dispose()
            con.Dispose()
        End Try
        Return SuccessFlag
    End Function
End Class