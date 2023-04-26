Option Explicit On
#Region "Imports"
Imports System
Imports System.Data
Imports System.Data.OleDb
Imports C1.Win.C1FlexGrid.Classic
#End Region

Public Class clsGatepass

    Public Function GetGPParty_master_Details(Optional ByVal mvarTransid As String = "",
                                  Optional ByVal mvarAuthorize As String = "",
                                  Optional ByVal mvarActive As String = "",
                                  Optional ByVal mFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                com.CommandText = "sp_Gen_GetParty_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 25).Value = mvarCompanyCode
                com.Parameters.Add("@Trans_ID", OleDbType.VarChar, 100).Value = mvarTransid
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

    Public Function SaveGPParty_master(ByVal mSaveString As String, ByVal mScreenMode As String, ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mCatcode As String = ""

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))
        Try
            con.Open()

            If mInputParam(0).Trim = "" Then

                Dim mCode As OleDb.OleDbDataReader
                Dim cmd1 As New OleDbCommand("select isnull(Max(Party_Code),0)+1 from GEN_Party_Master", con)
                mCode = cmd1.ExecuteReader()
                Dim id = 0
                If mCode.Read = True Then
                    mCatcode = mCode(0)
                End If

                ' mEmpcode = GetAutoNumber(1, mNumberType, "SMT Employee Master")
            Else
                mCatcode = mInputParam(0)
            End If

            com.CommandText = "sp_Gen_Saveparty_Details"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 25).Value = mvarCompanyCode
            '   com.Parameters.Add("@Location_Code", OleDbType.VarChar, 20).Value = mvarLocationCode
            com.Parameters.Add("@Party_Code", OleDbType.VarChar, 100).Value = mCatcode

            com.Parameters.Add("@Sender_Recvr_Name", OleDbType.VarChar, 50).Value = mInputParam(1)
            com.Parameters.Add("@Type", OleDbType.VarChar, 50).Value = mInputParam(2)

            com.Parameters.Add("@Isactive", OleDbType.VarChar, 1).Value = 1
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

    Public Function GetMaterialpassDetails_View(ByVal mDepartment As String, ByVal Mfromcompany As String, ByVal mtocompany As String, ByVal mprodname As String, ByVal mvehicleno As String, ByVal mvarFromDate As String, ByVal mvarToDate As String, Optional ByVal morderby As String = "", Optional ByVal mode As String = "") As DataTable

        Try

            Dim sqlexpression As String
            If morderby = "NONE" Or morderby = "" Then
                sqlexpression = ""
            Else
                sqlexpression = "Order By" + morderby
            End If

            com = New OleDbCommand
            Dim dt As New DataTable
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try

                com.CommandText = "sp_GEN_GetMaterialpass_Report"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@mDepartment", OleDbType.VarChar, 500).Value = mDepartment

                com.Parameters.Add("@Mfromcompany", OleDbType.VarChar, 500).Value = Mfromcompany
                com.Parameters.Add("@mtocompany", OleDbType.VarChar, 500).Value = mtocompany

                com.Parameters.Add("@mprodname", OleDbType.VarChar, 500).Value = mprodname
                com.Parameters.Add("@mvehicleno", OleDbType.VarChar, 500).Value = mvehicleno
                ''  com.Parameters.Add("@mtype", OleDbType.VarChar, 500).Value = mtype

                com.Parameters.Add("@From_Date", OleDbType.VarChar, 10).Value = mvarFromDate
                com.Parameters.Add("@To_Date", OleDbType.VarChar, 10).Value = mvarToDate
                com.Parameters.Add("@Filter", OleDbType.VarChar, 10).Value = sqlexpression

                com.Parameters.Add("@mode", OleDbType.VarChar, 100).Value = mode

                da = New OleDbDataAdapter(com)
                da.Fill(dt)
                da.Dispose()
                com.Dispose()
                con.Dispose()
            Catch ex As Exception
                Show_Message(ex.Message)
                da.Dispose()
                com.Dispose()
                con.Dispose()
            End Try
            Return dt
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
    End Function

    Public Function GetMISMaterialGatepass_Report(ByVal mDepartment As String, ByVal Mfromcompany As String, ByVal mtocompany As String, ByVal mprodname As String, ByVal mvehicleno As String, ByVal mvarFromDate As String, ByVal mvarToDate As String, Optional ByVal mlocation As String = "", Optional ByVal mode As String = "") As DataTable

        Try

            Dim sqlexpression As String

            sqlexpression = ""

            com = New OleDbCommand
            Dim dt As New DataTable
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try

                com.CommandText = "sp_GEN_GetMaterialpass_Report"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mlocation
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@mDepartment", OleDbType.VarChar, 500).Value = mDepartment

                com.Parameters.Add("@Mfromcompany", OleDbType.VarChar, 500).Value = Mfromcompany
                com.Parameters.Add("@mtocompany", OleDbType.VarChar, 500).Value = mtocompany

                com.Parameters.Add("@mprodname", OleDbType.VarChar, 500).Value = mprodname
                com.Parameters.Add("@mvehicleno", OleDbType.VarChar, 500).Value = mvehicleno
                ''  com.Parameters.Add("@mtype", OleDbType.VarChar, 500).Value = mtype

                com.Parameters.Add("@From_Date", OleDbType.VarChar, 10).Value = mvarFromDate
                com.Parameters.Add("@To_Date", OleDbType.VarChar, 10).Value = mvarToDate
                com.Parameters.Add("@Filter", OleDbType.VarChar, 10).Value = sqlexpression

                com.Parameters.Add("@mode", OleDbType.VarChar, 100).Value = mode

                da = New OleDbDataAdapter(com)
                da.Fill(dt)
                da.Dispose()
                com.Dispose()
                con.Dispose()
            Catch ex As Exception
                Show_Message(ex.Message)
                da.Dispose()
                com.Dispose()
                con.Dispose()
            End Try
            Return dt
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
    End Function

    Public Function GetMaterialOUTNOTReturn_Details(Optional ByVal mvarReceiptNo As String = "",
                                        Optional ByVal mvarAuthorize As String = "",
                                        Optional ByVal mvarDeleteMode As String = "",
                                        Optional ByVal mFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                com.CommandText = "sp_GEN_GetMaterialOUTNOTReturn_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Trans_No", OleDbType.VarChar, 100).Value = mvarReceiptNo
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

    Public Function SaveGEN_MaterialOUTNOTReturn_Main(ByVal mSaveString As String, ByVal mScreenMode As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mReceiptNo As String = ""

        If mInputParam(0).Trim = "" Then
            mReceiptNo = GetAutoNumber(1, mNumberType, "Material Gatepass OUT")
        Else
            mReceiptNo = mInputParam(0)
        End If

        If Trim(mReceiptNo) = "" Or mobjGrid.Rows <= 0 Then
            Return "Error"
            Exit Function
        End If

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))
        Try
            con.Open()
            com.CommandText = "sp_Gen_SaveGEN_MaterialOUTNOTReturn_Main"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
            com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
            com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
            com.Parameters.Add("@GatePass_OUT_No", OleDbType.VarChar, 100).Value = mReceiptNo
            com.Parameters.Add("@GatePass_OUT_Date	", OleDbType.VarChar, 20).Value = mInputParam(1)
            com.Parameters.Add("@Ref_in_No", OleDbType.VarChar, 100).Value = mInputParam(2)
            com.Parameters.Add("@Ref_in_Date", OleDbType.VarChar, 20).Value = mInputParam(3)
            com.Parameters.Add("@DC_No", OleDbType.VarChar, 100).Value = mInputParam(4)
            com.Parameters.Add("@DC_Date", OleDbType.VarChar, 20).Value = mInputParam(5)
            com.Parameters.Add("@Issued_Dept", OleDbType.VarChar, 500).Value = mInputParam(6)
            com.Parameters.Add("@From_Company", OleDbType.VarChar, 500).Value = mInputParam(7)

            com.Parameters.Add("@To_Company", OleDbType.VarChar, 500).Value = mInputParam(8)
            com.Parameters.Add("@Delivered_By", OleDbType.VarChar, 300).Value = mInputParam(9)
            com.Parameters.Add("@Vehicle_no", OleDbType.VarChar, 300).Value = mInputParam(10)
            com.Parameters.Add("@Delivery", OleDbType.VarChar, 300).Value = mInputParam(11)

            com.Parameters.Add("@Total_Items", OleDbType.VarChar, 10).Value = mInputParam(14)
            com.Parameters.Add("@Total_Netwt", OleDbType.VarChar, 10).Value = mInputParam(15)
            com.Parameters.Add("@Remarks", OleDbType.VarChar, 1000).Value = mInputParam(16)
            com.Parameters.Add("@Materialfrom", OleDbType.VarChar, 1000).Value = mInputParam(17)

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
                SuccessFlag = SaveGEN_MaterialOUTNOTReturn_Line(mReceiptNo, mInputParam(1), mobjGrid, mScreenMode)
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

    Private Function SaveGEN_MaterialOUTNOTReturn_Line(ByVal mReceiptNo As String, ByVal mReceiptDate As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mScreenMode As String) As Long

        Dim SuccessFlag As Integer = 0
        Dim return_mode As Integer

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))

        Try
            If Trim(mReceiptNo) = "" Or mobjGrid.Rows <= 0 Then
                Return SuccessFlag
            End If

            com.CommandText = "sp_Gen_SaveGEN_MaterialOUTNOTReturn_Line"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con

            For iRow As Integer = 1 To mobjGrid.Rows - 1
                con.Open()
                com.Parameters.Clear()
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@GatePass_OUT_No", OleDbType.VarChar, 100).Value = mReceiptNo
                com.Parameters.Add("@GatePass_OUT_Date", OleDbType.VarChar, 10).Value = mReceiptDate

                com.Parameters.Add("@SNo", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 0))
                com.Parameters.Add("@Prod_Code", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 1))

                com.Parameters.Add("@UOM_Code", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 6))
                com.Parameters.Add("@Return_Type	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 4))
                If Trim(mobjGrid.get_TextMatrix(iRow, 4)).ToString = "Return" Then
                    return_mode = 1
                Else
                    return_mode = 0
                End If

                com.Parameters.Add("@Return_Mode", OleDbType.VarChar, 10).Value = Trim(return_mode)
                com.Parameters.Add("@IS_Closed", OleDbType.VarChar, 10).Value = "0"
                com.Parameters.Add("@Close_Reason", OleDbType.VarChar, 150).Value = ""

                com.Parameters.Add("@No_Of_QTY	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 7))
                com.Parameters.Add("@Net_Wt	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 8))
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
    Public Function GetGen_MaterialpassOUTDetails(Optional ByVal mvarReceiptNo As String = "",
                                         Optional ByVal mvarAuthorize As String = "",
                                         Optional ByVal mvarDeleteMode As String = "",
                                         Optional ByVal mFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                com.CommandText = "sp_GEN_GetMaterialpassOUT_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Trans_No", OleDbType.VarChar, 100).Value = mvarReceiptNo
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
    Public Function SaveGen_MaterialpassOUT_Main(ByVal mSaveString As String, ByVal mScreenMode As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mReceiptNo As String = ""

        If mInputParam(0).Trim = "" Then
            mReceiptNo = GetAutoNumber(1, mNumberType, "Material OUT(Returnable)")
        Else
            mReceiptNo = mInputParam(0)
        End If

        If Trim(mReceiptNo) = "" Or mobjGrid.Rows <= 0 Then
            Return "Error"
            Exit Function
        End If

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))
        Try
            con.Open()
            com.CommandText = "sp_Gen_SaveGEN_MaterialpassOUT_Main"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
            com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
            com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
            com.Parameters.Add("@GatePass_OUT_No", OleDbType.VarChar, 100).Value = mReceiptNo
            com.Parameters.Add("@GatePass_OUT_Date	", OleDbType.VarChar, 20).Value = mInputParam(1)
            com.Parameters.Add("@Ref_in_No", OleDbType.VarChar, 100).Value = mInputParam(2)
            com.Parameters.Add("@Ref_in_Date", OleDbType.VarChar, 20).Value = mInputParam(3)
            com.Parameters.Add("@DC_No", OleDbType.VarChar, 100).Value = mInputParam(4)
            com.Parameters.Add("@DC_Date", OleDbType.VarChar, 20).Value = mInputParam(5)
            com.Parameters.Add("@Issued_Dept", OleDbType.VarChar, 500).Value = mInputParam(6)
            com.Parameters.Add("@From_Company", OleDbType.VarChar, 500).Value = mInputParam(7)

            com.Parameters.Add("@To_Company", OleDbType.VarChar, 500).Value = mInputParam(8)
            com.Parameters.Add("@Delivered_By", OleDbType.VarChar, 300).Value = mInputParam(9)
            com.Parameters.Add("@Vehicle_no", OleDbType.VarChar, 300).Value = mInputParam(10)
            com.Parameters.Add("@Delivery", OleDbType.VarChar, 300).Value = mInputParam(11)

            com.Parameters.Add("@Total_Items", OleDbType.VarChar, 10).Value = mInputParam(14)
            com.Parameters.Add("@Total_Netwt", OleDbType.VarChar, 10).Value = mInputParam(15)
            com.Parameters.Add("@Remarks", OleDbType.VarChar, 1000).Value = mInputParam(16)
            com.Parameters.Add("@Materialfrom", OleDbType.VarChar, 1000).Value = mInputParam(17)

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
                SuccessFlag = SaveGen_materialpassOUT_Line(mReceiptNo, mInputParam(1), mobjGrid, mScreenMode)
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

    Private Function SaveGen_materialpassOUT_Line(ByVal mReceiptNo As String, ByVal mReceiptDate As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mScreenMode As String) As Long

        Dim SuccessFlag As Integer = 0
        Dim return_mode As Integer

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))

        Try
            If Trim(mReceiptNo) = "" Or mobjGrid.Rows <= 0 Then
                Return SuccessFlag
            End If

            com.CommandText = "sp_Gen_SaveGEN_MaterialpassOUT_Line"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con

            For iRow As Integer = 1 To mobjGrid.Rows - 1
                con.Open()
                com.Parameters.Clear()
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@GatePass_OUT_No", OleDbType.VarChar, 100).Value = mReceiptNo
                com.Parameters.Add("@GatePass_OUT_Date", OleDbType.VarChar, 10).Value = mReceiptDate

                com.Parameters.Add("@SNo", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 0))
                com.Parameters.Add("@Prod_Code", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 1))

                com.Parameters.Add("@UOM_Code", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 6))
                com.Parameters.Add("@Return_Type	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 4))
                If Trim(mobjGrid.get_TextMatrix(iRow, 4)).ToString = "Return" Then
                    return_mode = 1
                Else
                    return_mode = 0
                End If

                com.Parameters.Add("@Return_Mode", OleDbType.VarChar, 10).Value = Trim(return_mode)
                com.Parameters.Add("@IS_Closed", OleDbType.VarChar, 10).Value = "0"
                com.Parameters.Add("@Close_Reason", OleDbType.VarChar, 150).Value = ""

                com.Parameters.Add("@No_Of_QTY	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 7))
                com.Parameters.Add("@Net_Wt	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 8))
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
    Public Function GetGen_VehiclepassOUTDetails(Optional ByVal mvarReceiptNo As String = "",
                                         Optional ByVal mvarAuthorize As String = "",
                                         Optional ByVal mvarDeleteMode As String = "",
                                         Optional ByVal mFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                com.CommandText = "sp_GEN_GetVehiclepassOUT_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Trans_No", OleDbType.VarChar, 100).Value = mvarReceiptNo
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
    Public Function SaveGen_VehiclepassOUT_Main(ByVal mSaveString As String, ByVal mScreenMode As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mReceiptNo As String = ""

        If mInputParam(0).Trim = "" Then
            mReceiptNo = GetAutoNumber(1, mNumberType, "Vehicle Gatepass OUT")
        Else
            mReceiptNo = mInputParam(0)
        End If

        If Trim(mReceiptNo) = "" Or mobjGrid.Rows <= 0 Then
            Return "Error"
            Exit Function
        End If

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))
        Try
            con.Open()
            com.CommandText = "sp_Gen_SaveGEN_VehiclepassOUT_Main"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
            com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
            com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
            com.Parameters.Add("@GatePass_OUT_No", OleDbType.VarChar, 100).Value = mReceiptNo
            com.Parameters.Add("@GatePass_OUT_Date	", OleDbType.VarChar, 20).Value = mInputParam(1)
            com.Parameters.Add("@Ref_in_No", OleDbType.VarChar, 100).Value = mInputParam(2)
            com.Parameters.Add("@Ref_in_Date", OleDbType.VarChar, 20).Value = mInputParam(3)
            com.Parameters.Add("@DC_No", OleDbType.VarChar, 100).Value = mInputParam(4)
            com.Parameters.Add("@DC_Date", OleDbType.VarChar, 20).Value = mInputParam(5)
            com.Parameters.Add("@Issued_Dept", OleDbType.VarChar, 500).Value = mInputParam(6)
            com.Parameters.Add("@From_Company", OleDbType.VarChar, 500).Value = mInputParam(7)

            com.Parameters.Add("@To_Company", OleDbType.VarChar, 500).Value = mInputParam(8)
            com.Parameters.Add("@Delivered_By", OleDbType.VarChar, 300).Value = mInputParam(9)
            com.Parameters.Add("@Vehicle_no", OleDbType.VarChar, 300).Value = mInputParam(10)
            com.Parameters.Add("@Delivery", OleDbType.VarChar, 300).Value = mInputParam(11)

            com.Parameters.Add("@Total_Items", OleDbType.VarChar, 10).Value = mInputParam(14)
            com.Parameters.Add("@Total_Netwt", OleDbType.VarChar, 10).Value = mInputParam(15)
            com.Parameters.Add("@Remarks", OleDbType.VarChar, 1000).Value = mInputParam(16)

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
                SuccessFlag = SaveGen_VehiclepassOUT_Line(mReceiptNo, mInputParam(1), mobjGrid, mScreenMode)
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

    Private Function SaveGen_VehiclepassOUT_Line(ByVal mReceiptNo As String, ByVal mReceiptDate As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mScreenMode As String) As Long

        Dim SuccessFlag As Integer = 0
        Dim return_mode As Integer

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))

        Try
            If Trim(mReceiptNo) = "" Or mobjGrid.Rows <= 0 Then
                Return SuccessFlag
            End If

            com.CommandText = "sp_Gen_SaveGEN_VehiclepassOUT_Line"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con

            For iRow As Integer = 1 To mobjGrid.Rows - 1
                con.Open()
                com.Parameters.Clear()
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@GatePass_OUT_No", OleDbType.VarChar, 100).Value = mReceiptNo
                com.Parameters.Add("@GatePass_OUT_Date", OleDbType.VarChar, 10).Value = mReceiptDate

                com.Parameters.Add("@SNo", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 0))
                com.Parameters.Add("@Prod_Code", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 1))
                com.Parameters.Add("@TxtnetMeters", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 9))

                com.Parameters.Add("@UOM_Code", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 6))
                com.Parameters.Add("@Return_Type	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 4))
                If Trim(mobjGrid.get_TextMatrix(iRow, 4)).ToString = "Return" Then
                    return_mode = 1
                Else
                    return_mode = 0
                End If

                com.Parameters.Add("@Return_Mode", OleDbType.VarChar, 10).Value = Trim(return_mode)
                com.Parameters.Add("@IS_Closed", OleDbType.VarChar, 10).Value = "0"
                com.Parameters.Add("@Close_Reason", OleDbType.VarChar, 150).Value = ""

                com.Parameters.Add("@No_Of_QTY	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 7))
                com.Parameters.Add("@Net_Wt	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 8))
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
    Public Function GetGen_VehiclepassTransactionDetails(Optional ByVal mvarReceiptNo As String = "",
                                                   Optional ByVal mvarfromCompany As String = "",
                                       Optional ByVal mvarAuthorize As String = "",
                                       Optional ByVal mvarDeleteMode As String = "",
                                       Optional ByVal mFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                com.CommandText = "sp_GEN_GetVehiclepassTrans_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Trans_No", OleDbType.VarChar, 100).Value = mvarReceiptNo
                com.Parameters.Add("@From_Company", OleDbType.VarChar, 100).Value = mvarfromCompany
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
    Public Function GetGen_MaterialpassTransactionDetails(Optional ByVal mvarReceiptNo As String = "",
                                                   Optional ByVal mvarfromCompany As String = "",
                                       Optional ByVal mvarAuthorize As String = "",
                                       Optional ByVal mvarDeleteMode As String = "",
                                       Optional ByVal mFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                com.CommandText = "sp_GEN_GetMaterialpassTrans_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Trans_No", OleDbType.VarChar, 100).Value = mvarReceiptNo
                com.Parameters.Add("@From_Company", OleDbType.VarChar, 100).Value = mvarfromCompany
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
    Public Function GetGen_VehiclepassINDetails(Optional ByVal mvarReceiptNo As String = "",
                                       Optional ByVal mvarAuthorize As String = "",
                                       Optional ByVal mvarDeleteMode As String = "",
                                       Optional ByVal mFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                com.CommandText = "sp_GEN_GetVehiclepassIN_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Trans_No", OleDbType.VarChar, 100).Value = mvarReceiptNo
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

    Public Function GetGen_MaterialpassINDetails(Optional ByVal mvarReceiptNo As String = "",
                                       Optional ByVal mvarAuthorize As String = "",
                                       Optional ByVal mvarDeleteMode As String = "",
                                       Optional ByVal mFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                com.CommandText = "sp_GEN_GetMaterialpassIN_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Trans_No", OleDbType.VarChar, 100).Value = mvarReceiptNo
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
    Function SaveGen_VehiclepassIN_ReceiptMain(ByVal mSaveString As String, ByVal mScreenMode As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mReceiptNo As String = ""

        If mInputParam(0).Trim = "" Then
            mReceiptNo = GetAutoNumber(1, mNumberType, "Vehicle Gatepass Return")
        Else
            mReceiptNo = mInputParam(0)
        End If

        If Trim(mReceiptNo) = "" Or mobjGrid.Rows <= 0 Then
            Return "Error"
            Exit Function
        End If

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))
        Try
            con.Open()
            com.CommandText = "sp_Gen_SaveGEN_VehiclepassIN_Main"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
            com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
            com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
            com.Parameters.Add("@GatePass_IN_No	", OleDbType.VarChar, 100).Value = mReceiptNo
            com.Parameters.Add("@GatePass_IN_Date	", OleDbType.VarChar, 10).Value = mInputParam(1)
            com.Parameters.Add("@From_Company	", OleDbType.VarChar, 100).Value = mInputParam(3)
            com.Parameters.Add("@Total_Items", OleDbType.VarChar, 10).Value = mInputParam(6)
            com.Parameters.Add("@Remarks", OleDbType.VarChar, 1000).Value = mInputParam(5)
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
                SuccessFlag = SaveGen_VehiclepassIN_ReceiptLine(mReceiptNo, mInputParam(1), mobjGrid, mScreenMode)
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
    Private Function SaveGen_VehiclepassIN_ReceiptLine(ByVal mReceiptNo As String, ByVal mReceiptDate As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mScreenMode As String) As Long

        Dim SuccessFlag As Integer = 0
        Dim mrow As Integer = 0
        Dim strDate As DateTime
        Dim mstringdate As String
        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))

        Try
            If Trim(mReceiptNo) = "" Or mobjGrid.Rows <= 0 Then
                Return SuccessFlag
            End If

            com.CommandText = "[sp_Gen_SaveGEN_VehiclepassIN_Line]"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            If mScreenMode = "Add" Then
                For iRow As Integer = 1 To mobjGrid.Rows - 1

                    If Trim(mobjGrid.get_TextMatrix(iRow, 8)).ToString = "" Then
                    Else
                        mrow += 1
                        con.Open()
                        com.Parameters.Clear()
                        com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                        com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                        com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                        com.Parameters.Add("@GatePass_IN_No", OleDbType.VarChar, 100).Value = mReceiptNo
                        com.Parameters.Add("@GatePass_IN_Date", OleDbType.VarChar, 10).Value = mReceiptDate
                        com.Parameters.Add("@SNo", OleDbType.VarChar, 10).Value = mrow
                        '  com.Parameters.Add("@SNo", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 0))
                        com.Parameters.Add("@GatePass_OUT_No", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 1))
                        strDate = Trim(mobjGrid.get_TextMatrix(iRow, 2))
                        mstringdate = Format(strDate, "yyyy/MM/dd")

                        com.Parameters.Add("@GatePass_OUT_Date", OleDbType.VarChar, 10).Value = mstringdate
                        com.Parameters.Add("@Prod_Code", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 4))
                        com.Parameters.Add("@UOM_Code", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 5))
                        com.Parameters.Add("@No_Of_QTY	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 8))
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
                    End If
                Next
            Else
                For iRow As Integer = 1 To mobjGrid.Rows - 1
                    If Trim(mobjGrid.get_TextMatrix(iRow, 8)).ToString = "" And Trim(mobjGrid.get_TextMatrix(iRow, 7)).ToString = "" Then
                    Else
                        mrow += 1
                        con.Open()
                        com.Parameters.Clear()
                        com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                        com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                        com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                        com.Parameters.Add("@GatePass_IN_No", OleDbType.VarChar, 100).Value = mReceiptNo
                        com.Parameters.Add("@GatePass_IN_Date", OleDbType.VarChar, 10).Value = mReceiptDate

                        '  com.Parameters.Add("@SNo", OleDbType.VarChar, 10).Value = mrow
                        com.Parameters.Add("@SNo", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 0))

                        com.Parameters.Add("@GatePass_OUT_No", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 1))
                        strDate = Trim(mobjGrid.get_TextMatrix(iRow, 2))
                        mstringdate = Format(strDate, "yyyy/MM/dd")

                        com.Parameters.Add("@GatePass_OUT_Date", OleDbType.VarChar, 10).Value = mstringdate

                        com.Parameters.Add("@Prod_Code", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 4))
                        com.Parameters.Add("@UOM_Code", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 5))

                        If Trim(mobjGrid.get_TextMatrix(iRow, 8)).ToString = "" Then
                            com.Parameters.Add("@No_Of_QTY	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 7))
                        Else
                            com.Parameters.Add("@No_Of_QTY	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 8))
                        End If
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
                    End If
                Next

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
        Return SuccessFlag
    End Function

    Function SaveGen_MaterialpassIN_ReceiptMain(ByVal mSaveString As String, ByVal mScreenMode As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mReceiptNo As String = ""

        If mInputParam(0).Trim = "" Then
            mReceiptNo = GetAutoNumber(1, mNumberType, "Material Gatepass Return")
        Else
            mReceiptNo = mInputParam(0)
        End If

        If Trim(mReceiptNo) = "" Or mobjGrid.Rows <= 0 Then
            Return "Error"
            Exit Function
        End If

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))
        Try
            con.Open()
            com.CommandText = "sp_Gen_SaveGEN_MaterialpassIN_Main"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
            com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
            com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
            com.Parameters.Add("@GatePass_IN_No	", OleDbType.VarChar, 100).Value = mReceiptNo
            com.Parameters.Add("@GatePass_IN_Date	", OleDbType.VarChar, 10).Value = mInputParam(1)
            com.Parameters.Add("@From_Company	", OleDbType.VarChar, 100).Value = mInputParam(3)
            com.Parameters.Add("@Total_Items", OleDbType.VarChar, 10).Value = mInputParam(6)
            com.Parameters.Add("@Remarks", OleDbType.VarChar, 1000).Value = mInputParam(5)
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
                SuccessFlag = SaveGen_MaterialpassIN_ReceiptLine(mReceiptNo, mInputParam(1), mobjGrid, mScreenMode)
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
    Private Function SaveGen_MaterialpassIN_ReceiptLine(ByVal mReceiptNo As String, ByVal mReceiptDate As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mScreenMode As String) As Long

        Dim SuccessFlag As Integer = 0
        Dim mrow As Integer = 0
        Dim strDate As DateTime
        Dim mstringdate As String
        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))

        Try
            If Trim(mReceiptNo) = "" Or mobjGrid.Rows <= 0 Then
                Return SuccessFlag
            End If

            com.CommandText = "[sp_Gen_SaveGEN_MaterialpassIN_Line]"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            If mScreenMode = "Add" Then
                For iRow As Integer = 1 To mobjGrid.Rows - 1

                    If Trim(mobjGrid.get_TextMatrix(iRow, 8)).ToString = "" Then
                    Else
                        mrow += 1
                        con.Open()
                        com.Parameters.Clear()
                        com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                        com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                        com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                        com.Parameters.Add("@GatePass_IN_No", OleDbType.VarChar, 100).Value = mReceiptNo
                        com.Parameters.Add("@GatePass_IN_Date", OleDbType.VarChar, 10).Value = mReceiptDate
                        com.Parameters.Add("@SNo", OleDbType.VarChar, 10).Value = mrow
                        '  com.Parameters.Add("@SNo", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 0))
                        com.Parameters.Add("@GatePass_OUT_No", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 1))
                        strDate = Trim(mobjGrid.get_TextMatrix(iRow, 2))
                        mstringdate = Format(strDate, "yyyy/MM/dd")

                        com.Parameters.Add("@GatePass_OUT_Date", OleDbType.VarChar, 10).Value = mstringdate
                        com.Parameters.Add("@Prod_Code", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 4))
                        com.Parameters.Add("@UOM_Code", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 5))
                        com.Parameters.Add("@No_Of_QTY	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 8))
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
                    End If
                Next
            Else
                For iRow As Integer = 1 To mobjGrid.Rows - 1
                    If Trim(mobjGrid.get_TextMatrix(iRow, 8)).ToString = "" And Trim(mobjGrid.get_TextMatrix(iRow, 7)).ToString = "" Then
                    Else
                        mrow += 1
                        con.Open()
                        com.Parameters.Clear()
                        com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                        com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                        com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                        com.Parameters.Add("@GatePass_IN_No", OleDbType.VarChar, 100).Value = mReceiptNo
                        com.Parameters.Add("@GatePass_IN_Date", OleDbType.VarChar, 10).Value = mReceiptDate

                        '  com.Parameters.Add("@SNo", OleDbType.VarChar, 10).Value = mrow
                        com.Parameters.Add("@SNo", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 0))

                        com.Parameters.Add("@GatePass_OUT_No", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 1))
                        strDate = Trim(mobjGrid.get_TextMatrix(iRow, 2))
                        mstringdate = Format(strDate, "yyyy/MM/dd")

                        com.Parameters.Add("@GatePass_OUT_Date", OleDbType.VarChar, 10).Value = mstringdate

                        com.Parameters.Add("@Prod_Code", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 4))
                        com.Parameters.Add("@UOM_Code", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 5))

                        If Trim(mobjGrid.get_TextMatrix(iRow, 8)).ToString = "" Then
                            com.Parameters.Add("@No_Of_QTY	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 7))
                        Else
                            com.Parameters.Add("@No_Of_QTY	", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 8))
                        End If
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
                    End If
                Next

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
        Return SuccessFlag
    End Function
    Public Function SaveManualClosedVehiclepassOUT_Line(ByVal mScreenMode As String, ByVal mSaveString As String, ByVal mNumberType As String) As Long
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0

        Dim mReceiptNo As String = ""
        mReceiptNo = mInputParam(0)

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))
        Try

            com.CommandText = "sp_SaveGatepassOUTReceipt_line"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            con.Open()
            com.Parameters.Clear()
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
            com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
            com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
            com.Parameters.Add("@GatePass_OUT_No", OleDbType.VarChar, 100).Value = mReceiptNo

            com.Parameters.Add("@GatePass_OUT_Date", OleDbType.VarChar, 10).Value = mInputParam(1)
            com.Parameters.Add("@SNo", OleDbType.VarChar, 10).Value = ""
            com.Parameters.Add("@Prod_Code", OleDbType.VarChar, 100).Value = mInputParam(3)
            com.Parameters.Add("@UOM_Code", OleDbType.VarChar, 10).Value = mInputParam(4)
            com.Parameters.Add("@Return_Type	", OleDbType.VarChar, 10).Value = ""
            com.Parameters.Add("@Return_Mode", OleDbType.VarChar, 10).Value = ""
            If mNumberType = "GatePass Manual" Then
                com.Parameters.Add("@IS_Closed", OleDbType.VarChar, 10).Value = "2"
                com.Parameters.Add("@Close_Reason", OleDbType.VarChar, 150).Value = mInputParam(5)

            Else
                com.Parameters.Add("@IS_Closed", OleDbType.VarChar, 10).Value = "1"
                com.Parameters.Add("@Close_Reason", OleDbType.VarChar, 150).Value = "Automatic"

            End If

            com.Parameters.Add("@No_Of_QTY	", OleDbType.VarChar, 10).Value = ""
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

    Public Function GetVehiclepassDetails_View(ByVal mDepartment As String, ByVal Mfromcompany As String, ByVal mtocompany As String, ByVal mprodname As String, ByVal mvehicleno As String, ByVal mvarFromDate As String, ByVal mvarToDate As String, Optional ByVal morderby As String = "", Optional ByVal mode As String = "") As DataTable

        Try

            Dim sqlexpression As String
            If morderby = "NONE" Or morderby = "" Then
                sqlexpression = ""
            Else
                sqlexpression = "Order By" + morderby
            End If

            com = New OleDbCommand
            Dim dt As New DataTable
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try

                com.CommandText = "sp_GEN_GetVehiclepass_Report"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@mDepartment", OleDbType.VarChar, 500).Value = mDepartment

                com.Parameters.Add("@Mfromcompany", OleDbType.VarChar, 500).Value = Mfromcompany
                com.Parameters.Add("@mtocompany", OleDbType.VarChar, 500).Value = mtocompany

                com.Parameters.Add("@mprodname", OleDbType.VarChar, 500).Value = mprodname
                com.Parameters.Add("@mvehicleno", OleDbType.VarChar, 500).Value = mvehicleno
                ''  com.Parameters.Add("@mtype", OleDbType.VarChar, 500).Value = mtype

                com.Parameters.Add("@From_Date", OleDbType.VarChar, 10).Value = mvarFromDate
                com.Parameters.Add("@To_Date", OleDbType.VarChar, 10).Value = mvarToDate
                com.Parameters.Add("@Filter", OleDbType.VarChar, 10).Value = sqlexpression

                com.Parameters.Add("@mode", OleDbType.VarChar, 100).Value = mode

                da = New OleDbDataAdapter(com)
                da.Fill(dt)
                da.Dispose()
                com.Dispose()
                con.Dispose()
            Catch ex As Exception
                Show_Message(ex.Message)
                da.Dispose()
                com.Dispose()
                con.Dispose()
            End Try
            Return dt
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
    End Function
    Public Function GetMISVehicleGatepass_Report(ByVal mDepartment As String, ByVal Mfromcompany As String, ByVal mtocompany As String, ByVal mprodname As String, ByVal mvehicleno As String, ByVal mvarFromDate As String, ByVal mvarToDate As String, Optional ByVal mlocation As String = "", Optional ByVal mode As String = "") As DataTable

        Try

            Dim sqlexpression As String

            sqlexpression = ""

            com = New OleDbCommand
            Dim dt As New DataTable
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try

                com.CommandText = "sp_GEN_GetVehiclepass_Report"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mlocation
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@mDepartment", OleDbType.VarChar, 500).Value = mDepartment

                com.Parameters.Add("@Mfromcompany", OleDbType.VarChar, 500).Value = Mfromcompany
                com.Parameters.Add("@mtocompany", OleDbType.VarChar, 500).Value = mtocompany

                com.Parameters.Add("@mprodname", OleDbType.VarChar, 500).Value = mprodname
                com.Parameters.Add("@mvehicleno", OleDbType.VarChar, 500).Value = mvehicleno
                ''  com.Parameters.Add("@mtype", OleDbType.VarChar, 500).Value = mtype

                com.Parameters.Add("@From_Date", OleDbType.VarChar, 10).Value = mvarFromDate
                com.Parameters.Add("@To_Date", OleDbType.VarChar, 10).Value = mvarToDate
                com.Parameters.Add("@Filter", OleDbType.VarChar, 10).Value = sqlexpression

                com.Parameters.Add("@mode", OleDbType.VarChar, 100).Value = mode

                da = New OleDbDataAdapter(com)
                da.Fill(dt)
                da.Dispose()
                com.Dispose()
                con.Dispose()
            Catch ex As Exception
                Show_Message(ex.Message)
                da.Dispose()
                com.Dispose()
                con.Dispose()
            End Try
            Return dt
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
    End Function

    Function GetVehiclepassChecklistDetails(ByVal mFromDate As String, ByVal mToDate As String, ByVal mdeptname As String, ByVal mparty As String, ByVal mproduct As String, ByVal mode As String) As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                'If msuppliername = String.Empty Or msuppliername = "" Then
                '    msuppliername = "ALL"sp_GetGatepassTrans_Details
                'End If
                com.CommandText = "[sp_GEN_GetVehiclepass_Report]"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code	", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Deptname", OleDbType.VarChar, 250).Value = mdeptname
                com.Parameters.Add("@Partyname", OleDbType.VarChar, 250).Value = mparty
                com.Parameters.Add("@Productname", OleDbType.VarChar, 250).Value = mproduct
                com.Parameters.Add("@from_Date", OleDbType.VarChar, 10).Value = mFromDate
                com.Parameters.Add("@To_Date", OleDbType.VarChar, 10).Value = mToDate

                com.Parameters.Add("@Mode", OleDbType.VarChar, 50).Value = mode
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

    Function GetVehiclepassPendingProduct_Report(ByVal mFromDate As String, ByVal mToDate As String, ByVal mPartyname As String, ByVal mIssuedDept As String) As DataSet
        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                If mPartyname = String.Empty Or mPartyname = "" Then
                    mPartyname = "ALL"
                End If
                If mIssuedDept = String.Empty Or mIssuedDept = "" Then
                    mIssuedDept = "ALL"
                End If
                com.CommandText = "sp_GEN_GetVehiclepassPendingList"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Location_Code	", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Party_name", OleDbType.VarChar, 250).Value = mPartyname
                com.Parameters.Add("@Issued_Dept", OleDbType.VarChar, 50).Value = mIssuedDept

                com.Parameters.Add("@From_Date", OleDbType.VarChar, 10).Value = mFromDate
                com.Parameters.Add("@To_Date", OleDbType.VarChar, 10).Value = mToDate
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

    Function GetFillRecdDeptDetails(ByVal Department As String) As DataSet
        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                com.CommandText = "sp_GetGatepassRecdDept_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 50).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 50).Value = mvarFinYearCode
                com.Parameters.Add("@Dept_Code", OleDbType.VarChar, 100).Value = Department
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

    Function GetFillIssuedDeptDetails(ByVal Department As String) As DataSet
        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                com.CommandText = "sp_GetGatepassIssDept_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 50).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 50).Value = mvarFinYearCode
                com.Parameters.Add("@Dept_Code", OleDbType.VarChar, 100).Value = Department
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
    Function GetProductDescDetails(ByVal productCode As String) As DataSet
        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                com.CommandText = "sp_GetGatepassProduct_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 50).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 50).Value = mvarFinYearCode
                com.Parameters.Add("@Product_Code", OleDbType.VarChar, 100).Value = productCode
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

    Function GetBearerDetails(ByVal Bearer As String) As DataSet
        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("eGeneral"))
            Try
                com.CommandText = "sp_GetGatepassBearer_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 50).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 50).Value = mvarFinYearCode
                com.Parameters.Add("@Bearer_Code", OleDbType.VarChar, 100).Value = Bearer
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

    Function GetUOMCodeDetails(ByVal UOMCode As String) As DataSet
        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("eGeneral"))
            Try
                com.CommandText = "sp_GetGatepassUOMCode_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 50).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 50).Value = mvarFinYearCode
                com.Parameters.Add("@UOM_Code", OleDbType.VarChar, 100).Value = UOMCode
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

    Function GetMaxDCNODetails(ByVal DcNo As String) As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("eGeneral"))
            Try
                com.CommandText = "sp_GetGatepass_DCNO_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 50).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 50).Value = mvarFinYearCode
                com.Parameters.Add("@DC_NO", OleDbType.VarChar, 100).Value = DcNo
                ''   iDcNo = Convert.ToString(com.ExecuteScalar())
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
            '       Return iDcNo
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try

    End Function

    Public Function SaveClosedGatepassOUT_ReceiptLine(ByVal mScreenMode As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mNumberType As String) As Long

        Dim SuccessFlag As Integer = 0
        Dim strDate As DateTime
        Dim mstringdate As String
        Dim mvalue1, mvalue2 As Integer

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("eGeneral"))

        Try
            If mobjGrid.Rows <= 0 Then
                Return SuccessFlag
            End If

            com.CommandText = "sp_SaveGatepassOUTReceipt_line"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con

            For iRow As Integer = 1 To mobjGrid.Rows - 1

                mvalue1 = 0
                mvalue2 = 0

                mvalue1 = Val(mobjGrid.get_TextMatrix(iRow, 7)) + (Val(mobjGrid.get_TextMatrix(iRow, 8)))
                mvalue2 = Val(mobjGrid.get_TextMatrix(iRow, 6))
                If mvalue2 = mvalue1 Then

                    con.Open()
                    com.Parameters.Clear()
                    com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                    com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                    com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                    com.Parameters.Add("@GatePass_OUT_No", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 1))

                    strDate = Trim(mobjGrid.get_TextMatrix(iRow, 2))
                    mstringdate = Format(strDate, "yyyy/MM/dd")
                    com.Parameters.Add("@GatePass_OUT_Date", OleDbType.VarChar, 10).Value = mstringdate
                    com.Parameters.Add("@SNo", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 0))
                    com.Parameters.Add("@Prod_Code", OleDbType.VarChar, 500).Value = Trim(mobjGrid.get_TextMatrix(iRow, 4))
                    com.Parameters.Add("@UOM_Code", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 5))
                    com.Parameters.Add("@Return_Type	", OleDbType.VarChar, 10).Value = ""
                    com.Parameters.Add("@Return_Mode", OleDbType.VarChar, 10).Value = ""
                    If mNumberType = "GatePass Manual" Then
                        com.Parameters.Add("@IS_Closed", OleDbType.VarChar, 10).Value = "2"
                        com.Parameters.Add("@Close_Reason", OleDbType.VarChar, 150).Value = Trim(mobjGrid.get_TextMatrix(iRow, 9))

                    Else
                        com.Parameters.Add("@IS_Closed", OleDbType.VarChar, 10).Value = "1"
                        com.Parameters.Add("@Close_Reason", OleDbType.VarChar, 150).Value = "Automatic"

                    End If

                    com.Parameters.Add("@No_Of_QTY	", OleDbType.VarChar, 10).Value = ""
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
                Else

                End If
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

    Public Function SaveClosedMaterialGatepassOUT_ReceiptLine(ByVal mScreenMode As String, ByVal mobjGrid As C1FlexGridClassic, ByVal mNumberType As String) As Long

        Dim SuccessFlag As Integer = 0
        Dim strDate As DateTime
        Dim mstringdate As String
        Dim mvalue1, mvalue2 As Integer

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))

        Try
            If mobjGrid.Rows <= 0 Then
                Return SuccessFlag
            End If

            'com.CommandText = "sp_SaveGatepassOUTReceipt_line"
            com.CommandText = "sp_Gen_SaveGEN_MaterialpassOUT_Line"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con

            For iRow As Integer = 1 To mobjGrid.Rows - 1

                mvalue1 = 0
                mvalue2 = 0

                mvalue1 = Val(mobjGrid.get_TextMatrix(iRow, 7)) + (Val(mobjGrid.get_TextMatrix(iRow, 8)))
                mvalue2 = Val(mobjGrid.get_TextMatrix(iRow, 6))
                If mvalue2 = mvalue1 Then

                    con.Open()
                    com.Parameters.Clear()
                    com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                    com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                    com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                    com.Parameters.Add("@GatePass_OUT_No", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 1))

                    strDate = Trim(mobjGrid.get_TextMatrix(iRow, 2))
                    mstringdate = Format(strDate, "yyyy/MM/dd")
                    com.Parameters.Add("@GatePass_OUT_Date", OleDbType.VarChar, 10).Value = mstringdate
                    com.Parameters.Add("@SNo", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 0))
                    com.Parameters.Add("@Prod_Code", OleDbType.VarChar, 500).Value = Trim(mobjGrid.get_TextMatrix(iRow, 4))
                    com.Parameters.Add("@UOM_Code", OleDbType.VarChar, 10).Value = Trim(mobjGrid.get_TextMatrix(iRow, 5))
                    com.Parameters.Add("@Return_Type	", OleDbType.VarChar, 10).Value = ""
                    com.Parameters.Add("@Return_Mode", OleDbType.VarChar, 10).Value = ""
                    If mNumberType = "GatePass Manual" Then
                        com.Parameters.Add("@IS_Closed", OleDbType.VarChar, 10).Value = "2"
                        com.Parameters.Add("@Close_Reason", OleDbType.VarChar, 150).Value = Trim(mobjGrid.get_TextMatrix(iRow, 9))

                    Else
                        com.Parameters.Add("@IS_Closed", OleDbType.VarChar, 10).Value = "1"
                        com.Parameters.Add("@Close_Reason", OleDbType.VarChar, 150).Value = "Automatic"

                    End If

                    com.Parameters.Add("@No_Of_QTY	", OleDbType.VarChar, 10).Value = ""
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
                Else

                End If
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

    Public Function GetGatepassOUTDetails_Report(Optional ByVal mvarReceiptNo As String = "",
                                       Optional ByVal mvarAuthorize As String = "",
                                       Optional ByVal mvarDeleteMode As String = "",
                                       Optional ByVal mFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("eGeneral"))
            Try
                com.CommandText = "[sp_GetGatepassOUTDetails_Report]"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Trans_No", OleDbType.VarChar, 100).Value = mvarReceiptNo
                com.Parameters.Add("@Mode", OleDbType.VarChar, 30).Value = mvarAuthorize

                com.Parameters.Add("@Filter_Data", OleDbType.VarChar, 100).Value = mFilterData

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

    Function Gen_Gatepass_Report(ByVal mgatepassNo As String, ByVal mode As String) As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("eReports"))
            Try
                'If msuppliername = String.Empty Or msuppliername = "" Then
                '    msuppliername = "ALL"
                'End If
                com.CommandText = "[sp_Get_GenGatepassOut_Report]"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Location_Code	", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@GatepassNo", OleDbType.VarChar, 250).Value = mgatepassNo
                com.Parameters.Add("@Mode", OleDbType.VarChar, 50).Value = mode
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
    Public Function SaveGppartyDetails(ByVal mSaveString As String) As Long
        Dim mInputParam As String() = Split(mSaveString, "||")

        Dim mOutput As Integer

        'If mInputParam.Length <> 18 Then
        '    Throw New Exception("Database Field Mismatch Please Check the Value")
        'End If

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("eGeneral"))
        Try
            con.Open()
            com.CommandText = "sp_SaveGpparty_Details"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
            com.Parameters.Add("@Party_Code	", OleDbType.VarChar, 10).Value = mInputParam(0)
            com.Parameters.Add("@Sender_Recvr_Name", OleDbType.VarChar, 50).Value = mInputParam(1)
            com.Parameters.Add("@Type		", OleDbType.VarChar, 300).Value = mInputParam(2)
            com.Parameters.Add("@User_Code", OleDbType.VarChar, 15).Value = mvarUserID

            Dim OutParam As New OleDbParameter("@iSuccessFlag", OleDbType.Integer)
            OutParam.Direction = ParameterDirection.Output
            com.Parameters.Add(OutParam)
            com.ExecuteNonQuery()
            mOutput = CInt(com.Parameters("@iSuccessFlag").Value)
            com.Dispose()
            con.Dispose()
            da.Dispose()
        Catch ex As Exception
            Show_Message(ex.Message)
            da.Dispose()
            com.Dispose()
            con.Dispose()
        End Try
        Return mOutput
    End Function

    Public Function GetGppartyDetails(Optional ByVal mvarPartyname As String = "",
                                         Optional ByVal mvarAuthorize As String = "",
                                         Optional ByVal mvarActive As String = "",
                                         Optional ByVal mFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("eGeneral"))
            Try
                com.CommandText = "sp_GetGpparty_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@party_Name", OleDbType.VarChar, 100).Value = mvarPartyname
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

    Function GetGpDeliveryChecklist_Report(ByVal mFromDate As String, ByVal mToDate As String, ByVal mPartyname As String, ByVal mIssuedDept As String, ByVal Mproduct As String, ByVal Type As String) As DataSet
        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("eGeneral"))
            Try
                If mPartyname = String.Empty Or mPartyname = "" Then
                    mPartyname = "ALL"
                End If
                If mIssuedDept = String.Empty Or mIssuedDept = "" Then
                    mIssuedDept = "ALL"
                End If
                com.CommandText = "sp_Get_GpassDeliveryCheckList_Report]"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Location_Code	", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Party_name", OleDbType.VarChar, 250).Value = mPartyname
                com.Parameters.Add("@Issued_Dept", OleDbType.VarChar, 50).Value = mIssuedDept
                com.Parameters.Add("@Product_Desc", OleDbType.VarChar, 50).Value = mIssuedDept
                com.Parameters.Add("@Type", OleDbType.VarChar, 50).Value = mIssuedDept
                com.Parameters.Add("@From_Date", OleDbType.VarChar, 10).Value = mFromDate
                com.Parameters.Add("@To_Date", OleDbType.VarChar, 10).Value = mToDate
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
    ''' <summary>
    ''' '''''Vehice Expense Entry , Reporte Start
    ''' </summary>
    ''' <param name="mvarInvEntryNo"></param>
    ''' <param name="mvarAuthorize"></param>
    ''' <param name="mvarDeleteMode"></param>
    ''' <param name="mFilterData"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function GetVehicleExpenses_Details(Optional ByVal mvarInvEntryNo As String = "",
                                          Optional ByVal mvarAuthorize As String = "",
                                          Optional ByVal mvarDeleteMode As String = "",
                                          Optional ByVal mFilterData As String = ""
                                                                                ) As DataSet
        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                com.CommandText = "sp_GEN_GetVehicleExpenses_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Entry_No", OleDbType.VarChar, 100).Value = mvarInvEntryNo
                com.Parameters.Add("@Authorize", OleDbType.VarChar, 1).Value = mvarAuthorize
                com.Parameters.Add("@Delete_Mode", OleDbType.VarChar, 1).Value = mvarDeleteMode
                com.Parameters.Add("@Filter_Data", OleDbType.VarChar, 100).Value = mFilterData

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
    Public Function SaveGEN_VehicleExpenses_Main(ByVal mSaveString As String, ByVal mScreenMode As String,
                                              ByVal mobjGrid As C1FlexGridClassic,
                                              ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mInvEntryNo As String = ""

        If mInputParam(0).Trim = "" Then
            mInvEntryNo = GetAutoNumber(1, mNumberType, "Vehicle Expenses Entry")
        Else
            mInvEntryNo = mInputParam(0)
        End If

        If Trim(mInvEntryNo) = "" Or mobjGrid.Rows <= 0 Then
            Return "Error"
            Exit Function
        End If

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))
        Try

            con.Open()
            com.CommandText = "sp_Gen_SaveGEN_VehicleExpenses_Main"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
            com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
            com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
            com.Parameters.Add("@Entry_No", OleDbType.VarChar, 100).Value = mInvEntryNo
            com.Parameters.Add("@Entry_Date", OleDbType.VarChar, 10).Value = mInputParam(1)
            com.Parameters.Add("@Expense_Type", OleDbType.VarChar, 10).Value = mInputParam(2)

            com.Parameters.Add("@Vehicle_no", OleDbType.VarChar, 100).Value = mInputParam(3)

            com.Parameters.Add("@Bill_From ", OleDbType.VarChar, 100).Value = mInputParam(4)

            com.Parameters.Add("@Ref_Inv_No", OleDbType.VarChar, 200).Value = mInputParam(5)

            com.Parameters.Add("@Ref_Inv_Date", OleDbType.VarChar, 20).Value = mInputParam(6)
            com.Parameters.Add("@Tot_Invoice_Value", OleDbType.VarChar, 200).Value = mInputParam(7)
            com.Parameters.Add("@Remarks", OleDbType.VarChar, 200).Value = mInputParam(8)

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
                SuccessFlag = SaveGEN_VehicleExpenses_Line(mInvEntryNo, mInputParam(1), mSaveString, mobjGrid, mScreenMode)

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
        Return mInvEntryNo
    End Function

    Private Function SaveGEN_VehicleExpenses_Line(ByVal mInvNo As String, ByVal mInvDate As String,
                                                   ByVal mSaveString As String,
                                               ByVal mobjGrid As C1FlexGridClassic, ByVal mScreenMode As String) As Long

        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mperrate As Integer = 0

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))

        Try
            If Trim(mInvNo) = "" Or mobjGrid.Rows <= 0 Then
                Return SuccessFlag
            End If

            com.CommandText = "sp_Gen_SaveGEN_VehicleExpenses_Line"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con

            For iRow As Integer = 1 To mobjGrid.Rows - 1

                con.Open()
                com.Parameters.Clear()
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Entry_No", OleDbType.VarChar, 100).Value = mInvNo
                com.Parameters.Add("@Entry_Date", OleDbType.VarChar, 10).Value = mInvDate

                ' com.Parameters.Add("@SNo", OleDbType.VarChar, 3).Value = Val(mobjGrid.get_TextMatrix(iRow, 0))
                com.Parameters.Add("@SNo", OleDbType.VarChar, 3).Value = iRow
                com.Parameters.Add("@Description", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 1))
                com.Parameters.Add("@qTY", OleDbType.VarChar, 1000).Value = Val(mobjGrid.get_TextMatrix(iRow, 2))
                com.Parameters.Add("@Amount", OleDbType.VarChar, 500).Value = Val(mobjGrid.get_TextMatrix(iRow, 3))

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
    ''' <summary>
    ''' '''''Vehice Fuel Entry , Reporte Start
    ''' </summary>
    ''' <param name="mvarInvEntryNo"></param>
    ''' <param name="mvarAuthorize"></param>
    ''' <param name="mvarDeleteMode"></param>
    ''' <param name="mFilterData"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function GetVehiclFuelEntry_Details(Optional ByVal mvarInvEntryNo As String = "",
                                          Optional ByVal mvarAuthorize As String = "",
                                          Optional ByVal mvarDeleteMode As String = "",
                                          Optional ByVal mFilterData As String = ""
                                                                                ) As DataSet
        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                com.CommandText = "sp_GEN_GetVehiclFuelEntry_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Entry_No", OleDbType.VarChar, 100).Value = mvarInvEntryNo
                com.Parameters.Add("@Authorize", OleDbType.VarChar, 1).Value = mvarAuthorize
                com.Parameters.Add("@Delete_Mode", OleDbType.VarChar, 1).Value = mvarDeleteMode
                com.Parameters.Add("@Filter_Data", OleDbType.VarChar, 100).Value = mFilterData

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
    Public Function SaveGEN_VehicleFuelEntry_Main(ByVal mSaveString As String, ByVal mScreenMode As String,
                                              ByVal mobjGrid As C1FlexGridClassic,
                                              ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mInvEntryNo As String = ""

        If mInputParam(0).Trim = "" Then
            mInvEntryNo = GetAutoNumber(1, mNumberType, "Vehicle Fuel Expenses")
        Else
            mInvEntryNo = mInputParam(0)
        End If

        If Trim(mInvEntryNo) = "" Or mobjGrid.Rows <= 0 Then
            Return "Error"
            Exit Function
        End If

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))
        Try

            con.Open()
            com.CommandText = "sp_Gen_SaveGEN_VehicleFuelEntry_Main"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
            com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
            com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
            com.Parameters.Add("@Entry_No", OleDbType.VarChar, 100).Value = mInvEntryNo
            com.Parameters.Add("@Entry_Date", OleDbType.VarChar, 10).Value = mInputParam(1)
            com.Parameters.Add("@Vehicle_no", OleDbType.VarChar, 100).Value = mInputParam(2)

            com.Parameters.Add("@Ref_Inv_No", OleDbType.VarChar, 200).Value = mInputParam(3)

            com.Parameters.Add("@Ref_Inv_Date", OleDbType.VarChar, 20).Value = mInputParam(4)
            com.Parameters.Add("@Tot_Invoice_Value", OleDbType.VarChar, 200).Value = mInputParam(5)
            com.Parameters.Add("@Remarks", OleDbType.VarChar, 200).Value = mInputParam(6)

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
                SuccessFlag = SaveGEN_VehicleFuelEntry_Line(mInvEntryNo, mInputParam(1), mSaveString, mobjGrid, mScreenMode)

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
        Return mInvEntryNo
    End Function

    Private Function SaveGEN_VehicleFuelEntry_Line(ByVal mInvNo As String, ByVal mInvDate As String,
                                                   ByVal mSaveString As String,
                                               ByVal mobjGrid As C1FlexGridClassic, ByVal mScreenMode As String) As Long

        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mperrate As Integer = 0

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))

        Try
            If Trim(mInvNo) = "" Or mobjGrid.Rows <= 0 Then
                Return SuccessFlag
            End If

            com.CommandText = "sp_Gen_SaveGEN_VehicleFuelEntry_Line"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con

            For iRow As Integer = 1 To mobjGrid.Rows - 1

                con.Open()
                com.Parameters.Clear()
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 10).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 10).Value = mvarLocationCode
                com.Parameters.Add("@Fin_Year_Code", OleDbType.VarChar, 10).Value = mvarFinYearCode
                com.Parameters.Add("@Entry_No", OleDbType.VarChar, 100).Value = mInvNo
                com.Parameters.Add("@Entry_Date", OleDbType.VarChar, 10).Value = mInvDate

                ' com.Parameters.Add("@SNo", OleDbType.VarChar, 3).Value = Val(mobjGrid.get_TextMatrix(iRow, 0))
                com.Parameters.Add("@SNo", OleDbType.VarChar, 3).Value = iRow
                com.Parameters.Add("@Trans_type", OleDbType.VarChar, 100).Value = Trim(mobjGrid.get_TextMatrix(iRow, 1))
                com.Parameters.Add("@Description", OleDbType.VarChar, 1000).Value = Trim(mobjGrid.get_TextMatrix(iRow, 2))

                com.Parameters.Add("@UOM", OleDbType.VarChar, 1000).Value = Trim(mobjGrid.get_TextMatrix(iRow, 3))
                com.Parameters.Add("@Start_Reading", OleDbType.VarChar, 1000).Value = Trim(mobjGrid.get_TextMatrix(iRow, 4))
                com.Parameters.Add("@End_Reading", OleDbType.VarChar, 1000).Value = Trim(mobjGrid.get_TextMatrix(iRow, 5))
                com.Parameters.Add("@Fuel_Qty", OleDbType.VarChar, 1000).Value = Trim(mobjGrid.get_TextMatrix(iRow, 6))
                com.Parameters.Add("@Fuel_Cost", OleDbType.VarChar, 1000).Value = Trim(mobjGrid.get_TextMatrix(iRow, 7))

                com.Parameters.Add("@Amount", OleDbType.VarChar, 500).Value = Val(mobjGrid.get_TextMatrix(iRow, 8))

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

    Public Function GetVehicleFuelBillEntry_Details(Optional ByVal mvarTransid As String = "",
                                   Optional ByVal mvarAuthorize As String = "",
                                   Optional ByVal mvarActive As String = "",
                                   Optional ByVal mFilterData As String = "") As DataSet

        Try
            com = New OleDbCommand
            ds = New DataSet
            da = New OleDbDataAdapter
            con = New OleDbConnection(GetConnection("DB_General"))
            Try
                com.CommandText = "sp_tbl_GetVehicleFuelBillEntry_Details"
                com.CommandType = CommandType.StoredProcedure
                com.Connection = con
                com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 25).Value = mvarCompanyCode
                com.Parameters.Add("@Location_Code", OleDbType.VarChar, 25).Value = mvarLocationCode

                com.Parameters.Add("@Trans_ID", OleDbType.VarChar, 100).Value = mvarTransid
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
    Public Function Savetbl_VehicleFuelBillEntry(ByVal mSaveString As String, ByVal mScreenMode As String, ByVal mNumberType As String) As String
        Dim mInputParam As String() = Split(mSaveString, "||")
        Dim SuccessFlag As Integer = 0
        Dim mCatcode As String = ""

        com = New OleDbCommand
        con = New OleDbConnection(GetConnection("DB_General"))
        Try
            con.Open()

            If mInputParam(0).Trim = "" Then

                Dim mCode As OleDb.OleDbDataReader
                Dim cmd1 As New OleDbCommand("select isnull(Max(Entry_No),0)+1 from tbl_VehicleFuelBillEntry", con)
                mCode = cmd1.ExecuteReader()
                Dim id = 0
                If mCode.Read = True Then
                    mCatcode = mCode(0)
                End If

                ' mEmpcode = GetAutoNumber(1, mNumberType, "SMT Employee Master")
            Else
                mCatcode = mInputParam(0)
            End If

            com.CommandText = "sp_tbl_Savetbl_VehicleFuelBillEntry"
            com.CommandType = CommandType.StoredProcedure
            com.Connection = con
            com.Parameters.Add("@Comp_Code", OleDbType.VarChar, 25).Value = mvarCompanyCode
            com.Parameters.Add("@Location_Code", OleDbType.VarChar, 20).Value = mvarLocationCode
            com.Parameters.Add("@FinYearCode", OleDbType.VarChar, 20).Value = mvarFinYearCode

            com.Parameters.Add("@Entry_No", OleDbType.VarChar, 100).Value = mCatcode
            com.Parameters.Add("@Entry_Date", OleDbType.VarChar, 50).Value = mInputParam(1)
            com.Parameters.Add("@Unit_Name", OleDbType.VarChar, 50).Value = mInputParam(2)
            com.Parameters.Add("@Party_Name", OleDbType.VarChar, 50).Value = mInputParam(3)
            com.Parameters.Add("@inv_No", OleDbType.VarChar, 50).Value = mInputParam(4)
            com.Parameters.Add("@inv_Date", OleDbType.VarChar, 50).Value = mInputParam(5)
            com.Parameters.Add("@Indent_NO", OleDbType.VarChar, 50).Value = mInputParam(6)
            com.Parameters.Add("@Vehicle_no", OleDbType.VarChar, 50).Value = mInputParam(7)
            com.Parameters.Add("@Fuel_Type", OleDbType.VarChar, 50).Value = mInputParam(8)
            com.Parameters.Add("@Start_Reading", OleDbType.VarChar, 50).Value = mInputParam(9)
            com.Parameters.Add("@End_Reading", OleDbType.VarChar, 50).Value = mInputParam(10)
            com.Parameters.Add("@Running_Kms", OleDbType.VarChar, 50).Value = mInputParam(11)
            com.Parameters.Add("@Fuel_Qty", OleDbType.VarChar, 50).Value = mInputParam(12)
            com.Parameters.Add("@Rate_Per_Ltr", OleDbType.VarChar, 50).Value = mInputParam(13)
            com.Parameters.Add("@Bill_Amt", OleDbType.VarChar, 50).Value = mInputParam(14)
            com.Parameters.Add("@mileage_Kmphr", OleDbType.VarChar, 50).Value = mInputParam(15)
            com.Parameters.Add("@Driver_Name", OleDbType.VarChar, 50).Value = mInputParam(16)
            com.Parameters.Add("@Remarks", OleDbType.VarChar, 50).Value = mInputParam(17)

            com.Parameters.Add("@Isactive", OleDbType.VarChar, 1).Value = 1
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
