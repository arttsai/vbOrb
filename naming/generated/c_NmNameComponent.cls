VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "c_NmNameComponent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Generated by IDL2VB v121. Copyright (c) 1999-2003 Martin.Both
'Source File Name: ../naming/CosNaming.idl
'Target File Name: c_NmNameComponent.cls

Option Explicit

'struct ::CosNaming::NameComponent
Const sTypeId As String = "IDL:omg.org/CosNaming/NameComponent:1.0"

'Member(s)
Private id_ As String
Private kind_ As String

'Member: id
Public Property Get id() As String
    id = id_
End Property

Public Property Let id(ByVal idNew As String)
    id_ = idNew
End Property

'Member: kind
Public Property Get kind() As String
    kind = kind_
End Property

Public Property Let kind(ByVal kindNew As String)
    kind_ = kindNew
End Property

'Helper
Public Sub initByRead(ByVal oIn As cOrbStream)
    On Error GoTo ErrHandler
    id_ = oIn.readString()
    kind_ = oIn.readString()
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "NameComponent.read")
End Sub

'Helper
Public Sub writeMe(ByVal oOut As cOrbStream)
    On Error GoTo ErrHandler
    Call oOut.writeString(id_)
    Call oOut.writeString(kind_)
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "NameComponent.write")
End Sub

'Helper
Public Sub initByAny(ByVal oAny As cOrbAny)
    On Error GoTo ErrHandler
    id_ = oAny.getString()
    Call oAny.nextPos
    kind_ = oAny.getString()
    Call oAny.nextPos
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "initByAny")
End Sub

'Helper
Public Sub insertIntoAny(ByVal oAny As cOrbAny)
    On Error GoTo ErrHandler
    Call oAny.insertString(id_)
    Call oAny.nextPos
    Call oAny.insertString(kind_)
    Call oAny.nextPos
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "insertIntoAny")
End Sub
