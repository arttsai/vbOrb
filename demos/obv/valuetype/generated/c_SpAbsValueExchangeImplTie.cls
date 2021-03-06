VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "c_SpAbsValueExchangeImplTie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Generated by IDL2VB v121. Copyright (c) 1999-2003 Martin.Both
'Source File Name: ../demos/obv/valuetype/valuetype.idl
'Target File Name: c_SpAbsValueExchangeImplTie.cls

Option Explicit

'You can use this class as a tie to your servant or as a servant example.
'Using as a tie:
' Your servant has to implement c_SpAbsValueExchange
' To activate a servant via tie write following:
'  Dim oSpAbsValueExchangeImplTie As c_SpAbsValueExchangeImplTie
'  Set oSpAbsValueExchangeImplTie = New c_SpAbsValueExchangeImplTie
'  Call oSpAbsValueExchangeImplTie.setDelegate(oServant)
'  Call oOrb.Connect(oSpAbsValueExchangeImplTie)
'Using as a servant example:
' Rename class to c_SpAbsValueExchangeImpl and save the file as c_SpAbsValueExchangeImpl.cls.
' Remove delegate stuff and write your own servant operations.
' To activate a servant write following:
'  Dim oSpAbsValueExchangeImpl As c_SpAbsValueExchangeImpl
'  Set oSpAbsValueExchangeImpl = New c_SpAbsValueExchangeImpl
'  Call oOrb.Connect(oSpAbsValueExchangeImpl)

Implements cOrbSkeleton
Implements c_SpAbsValueExchange

'interface ::obv::support_abstract::ValueExchange
Const sTypeId As String = "IDL:obv/support_abstract/ValueExchange:1.0"
Private oObjRef As cOrbObjRef
Private oDelegate As c_SpAbsValueExchange

'Each tie contains a delegate object, to which all operations are forwarded.
'You can remove this if you use this class as an example for your servant.
Public Sub setDelegate(ByVal Delegate As c_SpAbsValueExchange)
    Set oDelegate = Delegate
End Sub

Public Function getDelegate() As c_SpAbsValueExchange
    Set getDelegate = oDelegate
End Function

Friend Property Get ObjRef() As cOrbObjRef
    Set ObjRef = oObjRef
End Property

Friend Property Get This() As c_SpAbsValueExchange
    Dim oObj As cOrbObject
    Set oObj = New c_SpAbsValueExchange
    If oObj.setObjRef(oObjRef, False) Then
        Set This = Nothing
    Else
        Set This = oObj
    End If
End Property

Private Property Get cOrbSkeleton_TypeId(ByVal Item As Integer) As String
    Select Case Item
    Case 0: cOrbSkeleton_TypeId = sTypeId
    Case 1: cOrbSkeleton_TypeId = "IDL:omg.org/CORBA/Object:1.0"
    End Select
End Property

Private Property Get cOrbSkeleton_ObjRef() As cOrbObjRef
    Set cOrbSkeleton_ObjRef = oObjRef
End Property

Private Property Set cOrbSkeleton_ObjRef(ByVal newObjRef As cOrbObjRef)
    Set oObjRef = newObjRef
End Property

'Helper
Private Function cOrbSkeleton_execute(ByVal sOperation As String, _
    ByVal oIn As cOrbStream, ByVal oOut As cOrbStream) As Long
    On Error GoTo ErrHandler
    Dim oImpl_ As c_SpAbsValueExchange
    Set oImpl_ = IIf(oDelegate Is Nothing, Me, oDelegate)
    Select Case sOperation
    Case "getInterface"
        Dim a1_byValue As Boolean
        a1_byValue = oIn.readBoolean()
        Dim getInterface As c_SpAbsAnAbstractInterface
        Set getInterface = oImpl_.getInterface(a1_byValue)
        Call oOut.writeAbstract(getInterface)
    Case Else
        Call VBOrb.raiseBADOPERATION(1, VBOrb.CompletedNO, sOperation)
    End Select
    cOrbSkeleton_execute = 0 'NO_EXCEPTION
    Exit Function
ErrHandler:
    Call VBOrb.ErrReraise(Err, "ValueExchange.execute(" & sOperation & ")")
End Function

'Implements c_SpAbsValueExchange

'getInterface()
Private Function c_SpAbsValueExchange_getInterface(ByVal byValue As Boolean) _
    As c_SpAbsAnAbstractInterface
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Set c_SpAbsValueExchange_getInterface = oDelegate.getInterface(byValue)
    End If
    Exit Function
ErrHandler:
    Set c_SpAbsValueExchange_getInterface = Nothing
    Call VBOrb.ErrReraise(Err, "getInterface")
End Function
