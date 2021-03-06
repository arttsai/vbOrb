Attribute VB_Name = "m_obvvalueboxIValueExchangetest"
'Generated by IDL2VB v121. Copyright (c) 2000-2003 Martin.Both
'Source File Name: ../demos/obv/valuebox/box.idl

Option Explicit

'struct ::obv::valuebox::IValueExchange::test
Public Const TypeId As String = "IDL:obv/valuebox/IValueExchange/test:1.0"

'Helper
Public Function TypeCode() As cOrbTypeCode
    On Error GoTo ErrHandler
    Dim oOrb As cOrbImpl
    Set oOrb = VBOrb.defaultOrb()
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
        oMemSeq.Length = 1
        Set oMemSeq.Item(0) = New cCBStructMember
        oMemSeq.Item(0).name = "aaa"
        Set oMemSeq.Item(0).p_type = oOrb.createPrimitiveTc(29) 'VBOrb.TCValueBase
        'Overwrite place holder
        Call oRecTC.setRecTc2StructTc("test", oMemSeq)
    End If
    Set TypeCode = oRecTC
    Exit Function
ErrRollback:
    Call oRecTC.destroy
ErrHandler:
    Call VBOrb.ErrReraise(Err, "TypeCode")
End Function

'Helper, oAny.writeValue() -> struct.initByRead()
Public Function extractFromAny(ByVal oAny As cOrbAny) _
    As c_obvvalueboxIValueExchangetest
    Dim oStruct As c_obvvalueboxIValueExchangetest
    Set oStruct = New c_obvvalueboxIValueExchangetest
    Call oStruct.initByAny(oAny)
    Set extractFromAny = oStruct
End Function

'Helper, struct.writeMe() -> oAny.initByReadValue()
Public Function cloneAsAny(ByVal oStruct As c_obvvalueboxIValueExchangetest) _
    As cOrbAny
    On Error GoTo ErrHandler
    Dim oAny As cOrbAny
    Set oAny = New cOrbAny
    Call oAny.initByDefaultValue(TypeCode())
    Call oStruct.insertIntoAny(oAny)
    Set cloneAsAny = oAny
    Exit Function
ErrHandler:
    Call VBOrb.ErrReraise(Err, "cloneAsAny")
End Function
