Attribute VB_Name = "mOrbInvalidName"
'Generated by IDL2VB v123. Copyright (c) 2000-2003 Martin.Both
'Source File Name: ../include/CORBA.idl

Option Explicit

'exception ::CORBA::ORB::InvalidName
Public Const TypeId As String = "IDL:omg.org/CORBA/ORB/InvalidName:1.0"

'Helper
Public Function TypeCode() As cOrbTypeCode
    On Error GoTo ErrHandler
    Dim oOrb As cOrbImpl
    Set oOrb = mVBOrb.VBOrb.defaultOrb()
    'Get previously created recursive or concrete TypeCode
    Dim oRecTC As cOrbTypeCode
    Set oRecTC = oOrb.getRecursiveTC(TypeId, 22) 'mCB.tk_except
    If oRecTC Is Nothing Then
        'Create place holder for TypeCode to avoid endless recursion
        Set oRecTC = oOrb.createRecursiveTc(TypeId)
        On Error GoTo ErrRollback
        'Describe exception members
        Dim oMemSeq As cCBStructMemberSeq
        Set oMemSeq = New cCBStructMemberSeq
        oMemSeq.Length = 0
        'Overwrite place holder
        Call oRecTC.setRecTc2ExceptionTc("InvalidName", oMemSeq)
    End If
    Set TypeCode = oRecTC
    Exit Function
ErrRollback:
    Call oRecTC.destroy
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "TypeCode")
End Function

'Helper, oAny.writeValue() -> exception.initByRead()
Public Function extractFromAny(ByVal oAny As cOrbAny) As cOrbInvalidName
    Dim oException As cOrbInvalidName
    Set oException = New cOrbInvalidName
    Call oException.initByAny(oAny)
    Set extractFromAny = oException
End Function

'Helper, exception.writeMe() -> oAny.initByReadValue()
Public Function cloneAsAny(ByVal oException As cOrbInvalidName) As cOrbAny
    On Error GoTo ErrHandler
    Dim oAny As cOrbAny
    Set oAny = New cOrbAny
    Call oAny.initByDefaultValue(TypeCode())
    Call oException.insertIntoAny(oAny)
    Set cloneAsAny = oAny
    Exit Function
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "cloneAsAny")
End Function
