VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "c_DBCursorImpl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'Generated by IDL2VB v092. Copyright (c) 1999 Martin.Both
'Source File Name: ../demos/db_query/database.idl

Option Explicit

Implements cOrbSkeleton
Implements c_DBCursor

'interface ::DB::Cursor
Const sTypeId As String = "IDL:DB/Cursor:1.0"
Private oObjRef As cOrbObjRef
Private oDelegate As c_DBCursor

'Eigene Variablen
Private curPos As Long

Friend Property Get ObjRef() As cOrbObjRef
    Set ObjRef = oObjRef
End Property

Friend Property Get This() As c_DBCursor
    Dim oObj As cOrbObject
    Set oObj = New c_DBCursor
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
    Dim oImpl_ As c_DBCursor
    Set oImpl_ = IIf(oDelegate Is Nothing, Me, oDelegate)
    Select Case sOperation
    Case "open"
        Dim a1_using As c_DBColumnDataSeq
        Set a1_using = New c_DBColumnDataSeq
        Call a1_using.initByRead(oIn, 0)
        Dim a1_warns As c_DBMessageSeq
        Call oImpl_.openSub(a1_using, a1_warns)
        Call a1_warns.writeMe(oOut, 0)
    Case "fetch"
        Dim a2_func As Long
        a2_func = oIn.readLong()
        Dim a2_row As c_DBColumnDataSeq
        Dim a2_warns As c_DBMessageSeq
        Dim fetch As Long
        fetch = oImpl_.fetch(a2_func, a2_row, a2_warns)
        Call oOut.writeLong(fetch)
        Call a2_row.writeMe(oOut, 0)
        Call a2_warns.writeMe(oOut, 0)
    Case "fetchSet"
        Dim a3_rowcnt As Long
        a3_rowcnt = oIn.readLong()
        Dim a3_rows As c_DBColumnDataSeqSeq
        Dim a3_warns As c_DBMessageSeq
        Dim fetchSet As Long
        fetchSet = oImpl_.fetchSet(a3_rowcnt, a3_rows, a3_warns)
        Call oOut.writeLong(fetchSet)
        Call a3_rows.writeMe(oOut, 0)
        Call a3_warns.writeMe(oOut, 0)
    Case "close"
        Dim a4_warns As c_DBMessageSeq
        Call oImpl_.closeSub(a4_warns)
        Call a4_warns.writeMe(oOut, 0)
    Case "free"
        Dim a5_warns As c_DBMessageSeq
        Call oImpl_.free(a5_warns)
        Call a5_warns.writeMe(oOut, 0)
    Case Else
        Call VBOrb.raiseBADOPERATION(1, VBOrb.CompletedNO, sOperation)
    End Select
    cOrbSkeleton_execute = 0 'NO_EXCEPTION
    Exit Function
UserExWriter:
    Call VBOrb.getException().writeMe(oOut)
    cOrbSkeleton_execute = 1 'USER_EXCEPTION
    Exit Function
ErrHandler:
    If VBOrb.ErrIsUserEx() Then Resume UserExWriter
    Call VBOrb.ErrReraise(Err, "Cursor.execute(" & sOperation & ")")
End Function

'free() raises(c_DBErrMsgsEx)
Private Sub c_DBCursor_free(ByRef warns As c_DBMessageSeq)
    On Error GoTo ErrHandler
    'Please write your code here after copying this file
    'instead of throwing an exception
    'e.g. Call oDelegate.free(warns)
    Call VBOrb.raiseNOIMPLEMENT(1, VBOrb.CompletedNO)
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "free")
End Sub

'open() raises(c_DBErrMsgsEx)
Private Sub c_DBCursor_openSub(ByVal using As c_DBColumnDataSeq, _
    ByRef warns As c_DBMessageSeq)
    On Error GoTo ErrHandler
    Set warns = New c_DBMessageSeq
    curPos = -1
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "openSub")
End Sub

'close() raises(c_DBErrMsgsEx)
Private Sub c_DBCursor_closeSub(ByRef warns As c_DBMessageSeq)
    On Error GoTo ErrHandler
    Set warns = New c_DBMessageSeq
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "closeSub")
End Sub

'fetch() raises(c_DBErrMsgsEx)
Private Function c_DBCursor_fetch(ByVal func As Long, _
    ByRef row As c_DBColumnDataSeq, ByRef warns As c_DBMessageSeq) As Long
    On Error GoTo ErrHandler
    Set warns = New c_DBMessageSeq
    curPos = curPos + 1
    If curPos >= mDBServer.oTableRows.Length Then
        warns.Length = 1
        Set warns.Item(0) = New c_DBMessage
        warns.Item(0).sqlcode = 100
        warns.Item(0).sqlstate = "IW100"
        warns.Item(0).sqlmessage = "End of table reached"
        c_DBCursor_fetch = 100
        Set row = New c_DBColumnDataSeq
    Else
        Set row = mDBServer.oTableRows.Item(curPos)
    End If
    Exit Function
ErrHandler:
    Call VBOrb.ErrReraise(Err, "fetch")
End Function

'fetchSet() raises(c_DBErrMsgsEx)
Private Function c_DBCursor_fetchSet(ByVal rowcnt As Long, _
    ByRef rows As c_DBColumnDataSeqSeq, ByRef warns As c_DBMessageSeq) As Long
    On Error GoTo ErrHandler
    Dim oDBEx As c_DBErrMsgsEx
    Dim oErrMsg As c_DBMessage
    Set oErrMsg = New c_DBMessage
    oErrMsg.sqlcode = -999
    oErrMsg.sqlstate = "EE999"
    oErrMsg.sqlmessage = "Cursor.fetchSet is not implemented"
    Set oDBEx = New c_DBErrMsgsEx
    Set oDBEx.errs = New c_DBMessageSeq
    oDBEx.errs.Length = 1
    Set oDBEx.errs.Item(0) = oErrMsg
    Call VBOrb.raiseUserEx(oDBEx)
    Exit Function
ErrHandler:
    Call VBOrb.ErrReraise(Err, "fetchSet")
End Function
