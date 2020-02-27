Attribute VB_Name = "m_DBManager"
'Generated by IDL2VB v121. Copyright (c) 2000-2003 Martin.Both
'Source File Name: ../demos/db_query/database.idl

Option Explicit

'interface ::DB::Manager
Public Const TypeId As String = "IDL:DB/Manager:1.0"

'Helper
Public Function narrow(ByVal Obj As cOrbObject) As c_DBManager
    On Error GoTo ErrHandler
    If Obj Is Nothing Then
        Set narrow = Nothing
    Else
        Dim oObj As cOrbObject
        Set oObj = New c_DBManager
        If oObj.setObjRef(Obj.getObjRef(), True) Then
            Set narrow = Nothing
        Else
            Set narrow = oObj
        End If
    End If
    Exit Function
ErrHandler:
    Call VBOrb.ErrReraise(Err, "narrow")
End Function

'Helper
Public Function uncheckedNarrow(ByVal Obj As cOrbObject) As c_DBManager
    On Error GoTo ErrHandler
    If Obj Is Nothing Then
        Set uncheckedNarrow = Nothing
    Else
        Dim oObj As cOrbObject
        Set oObj = New c_DBManager
        If oObj.setObjRef(Obj.getObjRef(), False) Then
            Set uncheckedNarrow = Nothing
        Else
            Set uncheckedNarrow = oObj
        End If
    End If
    Exit Function
ErrHandler:
    Call VBOrb.ErrReraise(Err, "uncheckedNarrow")
End Function