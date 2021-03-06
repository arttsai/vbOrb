VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "cCBRepository"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
'Generated by IDL2VB v123. Copyright (c) 1999-2003 Martin.Both
'Source File Name: ../include/CORBA.idl
'Target File Name: cCBRepository.cls

Option Explicit

Implements cOrbAbstractBase
Implements cOrbObject

'interface ::CORBA::Repository
Const sTypeId As String = "IDL:omg.org/CORBA/Repository:1.0"
Private oObjRef As cOrbObjRef

'Helper to get different COM interface
Friend Function thisOrbAbstractBase() As cOrbAbstractBase
    Set thisOrbAbstractBase = Me
End Function

'Helper
Private Function cOrbAbstractBase_isObjRef() As Boolean
    cOrbAbstractBase_isObjRef = True
End Function

'Helper to get different COM interface
Friend Function thisOrbObject() As cOrbObject
    Set thisOrbObject = Me
End Function

'Helper
Private Function cOrbObject_setObjRef(ByVal ObjRef As cOrbObjRef, _
    ByVal Check As Boolean) As Boolean
    On Error GoTo ErrHandler
    If ObjRef Is Nothing Then
        cOrbObject_setObjRef = True
    Else
        cOrbObject_setObjRef = False
        Call ObjRef.narrow(sTypeId, Check, False)
    End If
    Set oObjRef = ObjRef
    Exit Function
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "setObjRef")
End Function

'Helper
Private Function cOrbObject_getObjRef() As cOrbObjRef
    Set cOrbObject_getObjRef = oObjRef
End Function

'Helper
Private Function cOrbObject_getId() As String
    cOrbObject_getId = sTypeId
End Function

'readonly attribute def_kind
Public Property Get defKind() As Long
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("_get_def_kind", False)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    defKind = oIn.readUlong()
    Exit Property
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "defKind.Get")
End Property

'destroy()
Public Sub destroy()
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("destroy", False)
    Call oRequest.invokeReqst(False)
    Exit Sub
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "destroy")
End Sub

'lookup()
Public Function lookup(ByVal search_name As String) As cCBContained
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("lookup", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(search_name)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set lookup = mCBContained.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set lookup = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "lookup")
End Function

'contents()
Public Function contents(ByVal limit_type As Long, _
    ByVal exclude_inherited As Boolean) As cCBContainedSeq
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("contents", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeUlong(limit_type)
    Call oOut.writeBoolean(exclude_inherited)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set contents = New cCBContainedSeq
    Call contents.initByRead(oIn, 0)
    Exit Function
ErrHandler:
    Set contents = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "contents")
End Function

'lookup_name()
Public Function lookupName(ByVal search_name As String, _
    ByVal levels_to_search As Long, ByVal limit_type As Long, _
    ByVal exclude_inherited As Boolean) As cCBContainedSeq
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("lookup_name", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(search_name)
    Call oOut.writeLong(levels_to_search)
    Call oOut.writeUlong(limit_type)
    Call oOut.writeBoolean(exclude_inherited)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set lookupName = New cCBContainedSeq
    Call lookupName.initByRead(oIn, 0)
    Exit Function
ErrHandler:
    Set lookupName = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "lookupName")
End Function

'describe_contents()
Public Function describeContents(ByVal limit_type As Long, _
    ByVal exclude_inherited As Boolean, ByVal max_returned_objs As Long) _
    As cCBContainerDescriptionSeq
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("describe_contents", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeUlong(limit_type)
    Call oOut.writeBoolean(exclude_inherited)
    Call oOut.writeLong(max_returned_objs)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set describeContents = New cCBContainerDescriptionSeq
    Call describeContents.initByRead(oIn, 0)
    Exit Function
ErrHandler:
    Set describeContents = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "describeContents")
End Function

'create_module()
Public Function createModule(ByVal id As String, ByVal name As String, _
    ByVal version As String) As cCBModuleDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_module", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(id)
    Call oOut.writeString(name)
    Call oOut.writeString(version)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createModule = mCBModuleDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createModule = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createModule")
End Function

'create_constant()
Public Function createConstant(ByVal id As String, ByVal name As String, _
    ByVal version As String, ByVal type_ As cCBIDLType, ByVal value As cOrbAny) _
    As cCBConstantDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_constant", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(id)
    Call oOut.writeString(name)
    Call oOut.writeString(version)
    Call oOut.writeObject(type_)
    Call oOut.writeAny(value)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createConstant = mCBConstantDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createConstant = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createConstant")
End Function

'create_struct()
Public Function createStruct(ByVal id As String, ByVal name As String, _
    ByVal version As String, ByVal members As cCBStructMemberSeq) _
    As cCBStructDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_struct", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(id)
    Call oOut.writeString(name)
    Call oOut.writeString(version)
    Call members.writeMe(oOut, 0)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createStruct = mCBStructDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createStruct = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createStruct")
End Function

'create_union()
Public Function createUnion(ByVal id As String, ByVal name As String, _
    ByVal version As String, ByVal discriminator_type As cCBIDLType, _
    ByVal members As cCBUnionMemberSeq) As cCBUnionDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_union", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(id)
    Call oOut.writeString(name)
    Call oOut.writeString(version)
    Call oOut.writeObject(discriminator_type)
    Call members.writeMe(oOut, 0)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createUnion = mCBUnionDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createUnion = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createUnion")
End Function

'create_enum()
Public Function createEnum(ByVal id As String, ByVal name As String, _
    ByVal version As String, ByVal members As c_StringSeq) As cCBEnumDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_enum", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(id)
    Call oOut.writeString(name)
    Call oOut.writeString(version)
    Call members.writeMe(oOut, 0)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createEnum = mCBEnumDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createEnum = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createEnum")
End Function

'create_alias()
Public Function createAlias(ByVal id As String, ByVal name As String, _
    ByVal version As String, ByVal original_type As cCBIDLType) As cCBAliasDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_alias", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(id)
    Call oOut.writeString(name)
    Call oOut.writeString(version)
    Call oOut.writeObject(original_type)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createAlias = mCBAliasDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createAlias = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createAlias")
End Function

'create_interface()
Public Function createInterface(ByVal id As String, ByVal name As String, _
    ByVal version As String, ByVal base_interfaces As cCBInterfaceDefSeq) _
    As cCBInterfaceDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_interface", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(id)
    Call oOut.writeString(name)
    Call oOut.writeString(version)
    Call base_interfaces.writeMe(oOut, 0)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createInterface = mCBInterfaceDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createInterface = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createInterface")
End Function

'create_value()
Public Function createValue(ByVal id As String, ByVal name As String, _
    ByVal version As String, ByVal is_custom As Boolean, _
    ByVal is_abstract As Boolean, ByVal base_value As cCBValueDef, _
    ByVal is_truncatable As Boolean, ByVal abstract_base_values As cCBValueDefSeq, _
    ByVal supported_interfaces As cCBInterfaceDefSeq, _
    ByVal initializers As cCBInitializerSeq) As cCBValueDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_value", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(id)
    Call oOut.writeString(name)
    Call oOut.writeString(version)
    Call oOut.writeBoolean(is_custom)
    Call oOut.writeBoolean(is_abstract)
    Call oOut.writeObject(base_value)
    Call oOut.writeBoolean(is_truncatable)
    Call abstract_base_values.writeMe(oOut, 0)
    Call supported_interfaces.writeMe(oOut, 0)
    Call initializers.writeMe(oOut, 0)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createValue = mCBValueDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createValue = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createValue")
End Function

'create_value_box()
Public Function createValueBox(ByVal id As String, ByVal name As String, _
    ByVal version As String, ByVal original_type_def As cCBIDLType) _
    As cCBValueBoxDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_value_box", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(id)
    Call oOut.writeString(name)
    Call oOut.writeString(version)
    Call oOut.writeObject(original_type_def)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createValueBox = mCBValueBoxDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createValueBox = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createValueBox")
End Function

'create_exception()
Public Function createException(ByVal id As String, ByVal name As String, _
    ByVal version As String, ByVal members As cCBStructMemberSeq) _
    As cCBExceptionDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_exception", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(id)
    Call oOut.writeString(name)
    Call oOut.writeString(version)
    Call members.writeMe(oOut, 0)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createException = mCBExceptionDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createException = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createException")
End Function

'create_native()
Public Function createNative(ByVal id As String, ByVal name As String, _
    ByVal version As String) As cCBNativeDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_native", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(id)
    Call oOut.writeString(name)
    Call oOut.writeString(version)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createNative = mCBNativeDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createNative = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createNative")
End Function

'create_abstract_interface()
Public Function createAbstractInterface(ByVal id As String, ByVal name As String, _
    ByVal version As String, ByVal base_interfaces As cCBAbstractInterfaceDefSeq) _
    As cCBAbstractInterfaceDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_abstract_interface", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(id)
    Call oOut.writeString(name)
    Call oOut.writeString(version)
    Call base_interfaces.writeMe(oOut, 0)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createAbstractInterface = mCBAbstractInterfaceDef.narrow( _
        oIn.readObject())
    Exit Function
ErrHandler:
    Set createAbstractInterface = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createAbstractInterface")
End Function

'create_local_interface()
Public Function createLocalInterface(ByVal id As String, ByVal name As String, _
    ByVal version As String, ByVal base_interfaces As cCBInterfaceDefSeq) _
    As cCBLocalInterfaceDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_local_interface", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(id)
    Call oOut.writeString(name)
    Call oOut.writeString(version)
    Call base_interfaces.writeMe(oOut, 0)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createLocalInterface = mCBLocalInterfaceDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createLocalInterface = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createLocalInterface")
End Function

'lookup_id()
Public Function lookupId(ByVal search_id As String) As cCBContained
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("lookup_id", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeString(search_id)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set lookupId = mCBContained.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set lookupId = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "lookupId")
End Function

'get_canonical_typecode()
Public Function getCanonicalTypecode(ByVal tc As cOrbTypeCode) As cOrbTypeCode
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("get_canonical_typecode", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeTypeCode(tc)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set getCanonicalTypecode = oIn.readTypeCode()
    Exit Function
ErrHandler:
    Set getCanonicalTypecode = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "getCanonicalTypecode")
End Function

'get_primitive()
Public Function getPrimitive(ByVal kind As Long) As cCBPrimitiveDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("get_primitive", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeUlong(kind)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set getPrimitive = mCBPrimitiveDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set getPrimitive = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "getPrimitive")
End Function

'create_string()
Public Function createString(ByVal bound As Long) As cCBStringDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_string", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeUlong(bound)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createString = mCBStringDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createString = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createString")
End Function

'create_wstring()
Public Function createWstring(ByVal bound As Long) As cCBWstringDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_wstring", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeUlong(bound)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createWstring = mCBWstringDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createWstring = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createWstring")
End Function

'create_sequence()
Public Function createSequence(ByVal bound As Long, _
    ByVal element_type As cCBIDLType) As cCBSequenceDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_sequence", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeUlong(bound)
    Call oOut.writeObject(element_type)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createSequence = mCBSequenceDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createSequence = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createSequence")
End Function

'create_array()
Public Function createArray(ByVal length As Long, _
    ByVal element_type As cCBIDLType) As cCBArrayDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_array", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeUlong(length)
    Call oOut.writeObject(element_type)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createArray = mCBArrayDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createArray = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createArray")
End Function

'create_fixed()
Public Function createFixed(ByVal digits As Integer, ByVal scale_ As Integer) _
    As cCBFixedDef
    On Error GoTo ErrHandler
    Dim oRequest As cOrbRequest
    Set oRequest = oObjRef.request("create_fixed", False)
    Dim oOut As cOrbStream
    Set oOut = oRequest.InArg
    Call oOut.writeUshort(digits)
    Call oOut.writeShort(scale_)
    Dim oIn As cOrbStream
    Call oRequest.invokeReqst(False)
    Set oIn = oRequest.OutRes
    Set createFixed = mCBFixedDef.narrow(oIn.readObject())
    Exit Function
ErrHandler:
    Set createFixed = Nothing
    Call mVBOrb.VBOrb.ErrReraise(Err, "createFixed")
End Function
