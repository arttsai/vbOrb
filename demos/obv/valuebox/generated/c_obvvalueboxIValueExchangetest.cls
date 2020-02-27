VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "c_obvvalueboxIValueExchangetest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Generated by IDL2VB v121. Copyright (c) 1999-2003 Martin.Both
'Source File Name: ../demos/obv/valuebox/box.idl
'Target File Name: c_obvvalueboxIValueExchangetest.cls

Option Explicit

'struct ::obv::valuebox::IValueExchange::test
Const sTypeId As String = "IDL:obv/valuebox/IValueExchange/test:1.0"

'Member(s)
Private aaa_ As cOrbValueBase

'Member: aaa
Public Property Get aaa() As cOrbValueBase
    Set aaa = aaa_
End Property

Public Property Set aaa(ByVal aaaNew As cOrbValueBase)
    Set aaa_ = aaaNew
End Property

'Helper
Public Sub initByRead(ByVal oIn As cOrbStream)
    On Error GoTo ErrHandler
    Set aaa_ = oIn.readValue(Nothing)
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "test.read")
End Sub

'Helper
Public Sub writeMe(ByVal oOut As cOrbStream)
    On Error GoTo ErrHandler
    Call oOut.writeValue(aaa_)
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "test.write")
End Sub

'Helper
Public Sub initByAny(ByVal oAny As cOrbAny)
    On Error GoTo ErrHandler
    Set aaa_ = oAny.getVal()
    Call oAny.nextPos
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "initByAny")
End Sub

'Helper
Public Sub insertIntoAny(ByVal oAny As cOrbAny)
    On Error GoTo ErrHandler
    Call oAny.insertVal(aaa_)
    Call oAny.nextPos
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "insertIntoAny")
End Sub