Attribute VB_Name = "mCBModuleDef"
'Generated by IDL2VB v123. Copyright (c) 2000-2003 Martin.Both
'Source File Name: ../include/CORBA.idl

Option Explicit

'interface ::CORBA::ModuleDef
Public Const TypeId As String = "IDL:omg.org/CORBA/ModuleDef:1.0"

'Helper
Public Function narrow(ByVal Obj As cOrbObject) As cCBModuleDef
    On Error GoTo ErrHandler
    If Obj Is Nothing Then
        Set narrow = Nothing
    Else
        Dim oObj As cOrbObject
        Set oObj = New cCBModuleDef
        If oObj.setObjRef(Obj.getObjRef(), True) Then
            Set narrow = Nothing
        Else
            Set narrow = oObj
        End If
    End If
    Exit Function
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "narrow")
End Function

'Helper
Public Function uncheckedNarrow(ByVal Obj As cOrbObject) As cCBModuleDef
    On Error GoTo ErrHandler
    If Obj Is Nothing Then
        Set uncheckedNarrow = Nothing
    Else
        Dim oObj As cOrbObject
        Set oObj = New cCBModuleDef
        If oObj.setObjRef(Obj.getObjRef(), False) Then
            Set uncheckedNarrow = Nothing
        Else
            Set uncheckedNarrow = oObj
        End If
    End If
    Exit Function
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "uncheckedNarrow")
End Function
