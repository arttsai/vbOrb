VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "c_SpAbsvalueExample"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Generated by IDL2VB v096. Copyright (c) 1999 Martin.Both
'Source File Name: ../demos/obv/valuetype/valuetype.idl

Option Explicit

'You can use this class as a value example:
' Rename class to c_SpAbsvalueExample and save the file as c_SpAbsvalueExample.cls.
' Finally write your own local value operations.

Implements cOrbAbstractBase
Implements cOrbValueBase
Implements c_SpAbsAnAbstractInterface

'valuetype ::obv::support_abstract::valueExample
Const sTypeId As String = "IDL:obv/support_abstract/valueExample:1.0"

Public name_state As String

'Helper to get different COM interface
Friend Function thisOrbAbstractBase() As cOrbAbstractBase
    Set thisOrbAbstractBase = Me
End Function

'Helper
Private Function cOrbAbstractBase_isObjRef() As Boolean
    cOrbAbstractBase_isObjRef = False
End Function

'Helper to get different COM interface
Friend Function thisOrbValueBase() As cOrbValueBase
    Set thisOrbValueBase = Me
End Function

Private Function cOrbValueBase_UniqueId() As Long
    cOrbValueBase_UniqueId = VBOrb.getNextUniqueID()
End Function

'Helper
Private Sub cOrbValueBase_initByRead(ByVal oIn As cOrbStream)
    On Error GoTo ErrHandler
    name_state = oIn.readString()
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "valueExample.read")
End Sub

'Helper
Private Sub cOrbValueBase_writeMe(ByVal oOut As cOrbStream)
    On Error GoTo ErrHandler
    Call oOut.writeString(name_state)
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "valueExample.write")
End Sub

Private Function cOrbValueBase_getIds(ByVal Item As Integer) As String
    Select Case Item
    Case 0: cOrbValueBase_getIds = sTypeId
    End Select
End Function

Private Function cOrbValueBase_isCustom() As Boolean
    cOrbValueBase_isCustom = False
End Function

'Helper to get different COM interface
Friend Function thisSpAbsAnAbstractInterface() As c_SpAbsAnAbstractInterface
    Set thisSpAbsAnAbstractInterface = Me
End Function

'print()
Private Sub c_SpAbsAnAbstractInterface_printSub()
    Call printSub
End Sub

'print()
Public Sub printSub()
    On Error GoTo ErrHandler
    Call frmValType.printLine(". I'm a local operation of abstract value example")
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "printSub")
End Sub