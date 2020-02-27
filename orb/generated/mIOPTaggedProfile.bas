Attribute VB_Name = "mIOPTaggedProfile"
'Generated by IDL2VB v123. Copyright (c) 2000-2003 Martin.Both
'Source File Name: ../include/IOP.idl

Option Explicit

'struct ::IOP::TaggedProfile
Public Const TypeId As String = "IDL:omg.org/IOP/TaggedProfile:1.0"

'Helper
Public Function TypeCode() As cOrbTypeCode
    On Error GoTo ErrHandler
    Dim oOrb As cOrbImpl
    Set oOrb = mVBOrb.VBOrb.defaultOrb()
    'Get previously created recursive or concrete TypeCode
    Dim oRecTC As cOrbTypeCode
    Set oRecTC = oOrb.getRecursiveTC(TypeId, 15) 'mCB.tk_struct
    If oRecTC Is Nothing Then
        'Create place holder for TypeCode to avoid endless recursion
        Set oRecTC = oOrb.createRecursiveTc(TypeId)
        On Error GoTo ErrRollback
        'Describe struct members
        Dim oMemSeq As cCBStructMemberSeq
        Set oMemSeq = New cCBStructMemberSeq
        oMemSeq.Length = 2
        Set oMemSeq.Item(0) = New cCBStructMember
        oMemSeq.Item(0).name = "tag"
        Set oMemSeq.Item(0).p_type = oOrb.createPrimitiveTc(5) 'VBOrb.TCUlong
        Set oMemSeq.Item(0).p_type = oOrb.createAliasTc("IDL:omg.org/IOP/ProfileId:1.0", "ProfileId", oMemSeq.Item(0).p_type)
        Set oMemSeq.Item(1) = New cCBStructMember
        oMemSeq.Item(1).name = "profile_data"
        Set oMemSeq.Item(1).p_type = oOrb.createPrimitiveTc(10) 'VBOrb.TCOctet
        Set oMemSeq.Item(1).p_type = oOrb.createSequenceTc(0, oMemSeq.Item(1).p_type)
        'Overwrite place holder
        Call oRecTC.setRecTc2StructTc("TaggedProfile", oMemSeq)
    End If
    Set TypeCode = oRecTC
    Exit Function
ErrRollback:
    Call oRecTC.destroy
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "TypeCode")
End Function

'Helper, oAny.writeValue() -> struct.initByRead()
Public Function extractFromAny(ByVal oAny As cOrbAny) As cIOPTaggedProfile
    Dim oStruct As cIOPTaggedProfile
    Set oStruct = New cIOPTaggedProfile
    Call oStruct.initByAny(oAny)
    Set extractFromAny = oStruct
End Function

'Helper, struct.writeMe() -> oAny.initByReadValue()
Public Function cloneAsAny(ByVal oStruct As cIOPTaggedProfile) As cOrbAny
    On Error GoTo ErrHandler
    Dim oAny As cOrbAny
    Set oAny = New cOrbAny
    Call oAny.initByDefaultValue(TypeCode())
    Call oStruct.insertIntoAny(oAny)
    Set cloneAsAny = oAny
    Exit Function
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "cloneAsAny")
End Function
