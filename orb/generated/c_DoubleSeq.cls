VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "c_DoubleSeq"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
'Generated by IDL2VB v123. Copyright (c) 1999-2003 Martin.Both
'Source File Name: ../include/CORBA.idl
'Target File Name: c_DoubleSeq.cls

Option Explicit

'IDL Name: sequence<double>

Private seqLen As Long
Private seqBnd As Long
Private seqArr() As Double
Private seqIsDim As Boolean

Public Property Get Length() As Long
    Length = seqLen
End Property

Public Property Let Length(ByVal newLen As Long)
    On Error GoTo ErrHandler
    If newLen <= 0 Then
        seqLen = 0
        Erase seqArr
        seqIsDim = False
    Else
        If seqBnd > 0 And newLen > seqBnd Then
            Call mVBOrb.VBOrb.raiseBADPARAM(1, mVBOrb.VBOrb.CompletedNO, _
                CStr(newLen) & " > " & CStr(seqBnd))
        End If
        seqLen = newLen
        If seqIsDim Then
            If newLen > UBound(seqArr) + 1 Then
                Dim newSize As Long
                newSize = (UBound(seqArr) * 3& + 3&) \ 2&
                If seqBnd > 0 And newSize > seqBnd Then
                    newSize = seqBnd
                End If
                If newLen > newSize Then
                    newSize = newLen
                End If
                ReDim Preserve seqArr(0 To newSize - 1)
            End If
        Else
            ReDim seqArr(0 To newLen - 1)
            seqIsDim = True
        End If
    End If
    Exit Property
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "DoubleSeq.Length.Let")
End Property

Public Property Get Boundary() As Long
    Boundary = seqBnd
End Property

'index must be in the range of 0 to Length - 1
Public Property Get Item(ByVal index As Long) As Double
    On Error GoTo ErrHandler
    Item = seqArr(index)
    Exit Property
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "DoubleSeq.Item.Get")
End Property

'index must be in the range of 0 to Length - 1
Public Property Let Item(ByVal index As Long, ByVal Item As Double)
    On Error GoTo ErrHandler
    seqArr(index) = Item
    Exit Property
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "DoubleSeq.Item.Let")
End Property

Public Function getItems(ByRef Arr() As Double) As Long
    On Error GoTo ErrHandler
    getItems = seqLen
    Dim seqCnt As Long
    For seqCnt = 0 To seqLen - 1
        Arr(LBound(Arr) + seqCnt) = seqArr(seqCnt)
    Next seqCnt
    Exit Function
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "getItems")
End Function

Public Sub setItems(ByRef Arr() As Double, ByVal newLen As Long)
    On Error GoTo ErrHandler
    Me.Length = newLen
    Dim seqCnt As Long
    For seqCnt = 0 To seqLen - 1
        seqArr(seqCnt) = Arr(LBound(Arr) + seqCnt)
    Next seqCnt
    Exit Sub
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "setItems")
End Sub

'Helper
Public Sub initByRead(ByVal oIn As cOrbStream, ByVal maxLen As Long)
    On Error GoTo ErrHandler
    seqBnd = maxLen
    Dim newLen As Long
    newLen = oIn.readUlong()
    If seqBnd > 0 And newLen > seqBnd Then
        Call mVBOrb.VBOrb.raiseMARSHAL(1, mVBOrb.VBOrb.CompletedNO, _
            CStr(newLen) & " > " & CStr(seqBnd))
    End If
    seqIsDim = False
    Me.Length = newLen
    Dim seqCnt As Long
    For seqCnt = 0 To seqLen - 1
        seqArr(seqCnt) = oIn.readDouble()
    Next seqCnt
    Exit Sub
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "DoubleSeq.read")
End Sub

'Helper
Public Sub writeMe(ByVal oOut As cOrbStream, ByVal maxLen As Long)
    On Error GoTo ErrHandler
    seqBnd = maxLen
    If seqBnd > 0 And seqLen > seqBnd Then
        Call mVBOrb.VBOrb.raiseMARSHAL(1, mVBOrb.VBOrb.CompletedNO, _
            CStr(seqLen) & " > " & CStr(seqBnd))
    End If
    Call oOut.writeUlong(seqLen)
    Dim seqCnt As Long
    For seqCnt = 0 To seqLen - 1
        Call oOut.writeDouble(seqArr(seqCnt))
    Next seqCnt
    Exit Sub
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "DoubleSeq.write")
End Sub

'Helper
Public Sub initByAny(ByVal oAny As cOrbAny)
    On Error GoTo ErrHandler
    seqBnd = oAny.getOrigType.Length()
    Dim newLen As Long
    newLen = oAny.seqGetLength()
    If seqBnd > 0 And newLen > seqBnd Then
        Call mVBOrb.VBOrb.raiseMARSHAL(1, mVBOrb.VBOrb.CompletedNO, _
            CStr(newLen) & " > " & CStr(seqBnd))
    End If
    seqIsDim = False
    Me.Length = newLen
    Dim seqCnt As Long
    For seqCnt = 0 To seqLen - 1
        seqArr(seqCnt) = oAny.getDouble()
        Call oAny.nextPos
    Next seqCnt
    Call oAny.rewind
    Exit Sub
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "initByAny")
End Sub

'Helper
Public Sub insertIntoAny(ByVal oAny As cOrbAny)
    On Error GoTo ErrHandler
    Call oAny.seqSetLength(seqLen)
    Dim seqCnt As Long
    For seqCnt = 0 To seqLen - 1
        Call oAny.insertDouble(seqArr(seqCnt))
        Call oAny.nextPos
    Next seqCnt
    Call oAny.rewind
    Exit Sub
ErrHandler:
    Call mVBOrb.VBOrb.ErrReraise(Err, "insertIntoAny")
End Sub