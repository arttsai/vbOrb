Attribute VB_Name = "mOrbTypeCode"
'Generated by IDL2VB v123. Copyright (c) 2000-2003 Martin.Both
'Source File Name: ../include/TypeCode.idl

Option Explicit

'valuetype ::CORBA::TypeCode
Public Const TypeId As String = "IDL:omg.org/CORBA/TypeCode:1.0"

'Helper
Public Function TypeCode() As cOrbTypeCode
    On Error GoTo ErrHandler
    Dim oOrb As cOrbImpl
    Set oOrb = mVBOrb.VBOrb.defaultOrb()
    'Get previously created recursive or concrete TypeCode
    Dim oRecTC As cOrbTypeCode
    Set oRecTC = oOrb.getRecursiveTC(TypeId, 29) 'mCB.tk_value
    If oRecTC Is Nothing Then
        'Create place holder for TypeCode to avoid endless recursion
        Set oRecTC = oOrb.createRecursiveTc(TypeId)
        On Error GoTo ErrRollback
        'Describe value members
        Dim oMemSeq As cCBValueMemberSeq
        Set oMemSeq = New cCBValueMemberSeq
        oMemSeq.Length = 3
        Set oMemSeq.Item(0) = New cCBValueMember
        oMemSeq.Item(0).name = "lTCKind"
        Set oMemSeq.Item(0).p_type = mCB.TCKind_TypeCode()
        oMemSeq.Item(0).access = 0 'PRIVATE_MEMBER
        Set oMemSeq.Item(1) = New cCBValueMember
        oMemSeq.Item(1).name = "sTCId"
        Set oMemSeq.Item(1).p_type = oOrb.createStringTc(0)
        Set oMemSeq.Item(1).p_type = oOrb.createAliasTc("IDL:omg.org/CORBA/RepositoryId:1.0", "RepositoryId", oMemSeq.Item(1).p_type)
        oMemSeq.Item(1).access = 0 'PRIVATE_MEMBER
        Set oMemSeq.Item(2) = New cCBValueMember
        oMemSeq.Item(2).name = "sTCName"
        Set oMemSeq.Item(2).p_type = oOrb.createStringTc(0)
        Set oMemSeq.Item(2).p_type = oOrb.createAliasTc("IDL:omg.org/CORBA/Identifier:1.0", "Identifier", oMemSeq.Item(2).p_type)
        oMemSeq.Item(2).access = 0 'PRIVATE_MEMBER
        'Overwrite place holder
        Dim iTypeModifier As Integer
        iTypeModifier = 0 'VM_NONE
        Dim oConcreteBase As cOrbTypeCode
        Set oConcreteBase = Nothing
        Call oRecTC.setRecTc2ValueTc("TypeCode", iTypeModifier, oConcreteBase, oMemSeq)
    End If
    Set TypeCode = oRecTC
    Exit Function
ErrRollback:
    Call oRecTC.destroy
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "TypeCode")
End Function
