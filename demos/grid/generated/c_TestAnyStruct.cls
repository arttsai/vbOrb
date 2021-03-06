VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "c_TestAnyStruct"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Generated by IDL2VB v121. Copyright (c) 1999-2003 Martin.Both
'Source File Name: ../demos/grid/grid.idl
'Target File Name: c_TestAnyStruct.cls

Option Explicit

'struct ::TestAnyStruct
Const sTypeId As String = "IDL:TestAnyStruct:1.0"

'Member(s)
Private string_value_ As String
Private long_value_ As Long

'Member: string_value
Public Property Get string_value() As String
    string_value = string_value_
End Property

Public Property Let string_value(ByVal string_valueNew As String)
    string_value_ = string_valueNew
End Property

'Member: long_value
Public Property Get long_value() As Long
    long_value = long_value_
End Property

Public Property Let long_value(ByVal long_valueNew As Long)
    long_value_ = long_valueNew
End Property

'Helper
Public Sub initByRead(ByVal oIn As cOrbStream)
    On Error GoTo ErrHandler
    string_value_ = oIn.readString(20)
    long_value_ = oIn.readLong()
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "TestAnyStruct.read")
End Sub

'Helper
Public Sub writeMe(ByVal oOut As cOrbStream)
    On Error GoTo ErrHandler
    Call oOut.writeString(string_value_)
    Call oOut.writeLong(long_value_)
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "TestAnyStruct.write")
End Sub

'Helper
Public Sub initByAny(ByVal oAny As cOrbAny)
    On Error GoTo ErrHandler
    string_value_ = oAny.getString()
    Call oAny.nextPos
    long_value_ = oAny.getLong()
    Call oAny.nextPos
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "initByAny")
End Sub

'Helper
Public Sub insertIntoAny(ByVal oAny As cOrbAny)
    On Error GoTo ErrHandler
    Call oAny.insertString(string_value_)
    Call oAny.nextPos
    Call oAny.insertLong(long_value_)
    Call oAny.nextPos
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "insertIntoAny")
End Sub
