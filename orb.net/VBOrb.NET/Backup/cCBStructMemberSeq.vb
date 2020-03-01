Option Strict Off
Option Explicit On
<System.Runtime.InteropServices.ProgId("cCBStructMemberSeq_NET.cCBStructMemberSeq")> Public Class cCBStructMemberSeq
	'Generated by IDL2VB v123. Copyright (c) 1999-2003 Martin.Both
	'Source File Name: ../include/CORBA.idl
	'Target File Name: cCBStructMemberSeq.cls
	
	
	'IDL Name: sequence<::CORBA::StructMember>
	
	Private seqLen As Integer
	Private seqBnd As Integer
	Private seqArr() As cCBStructMember
	Private seqIsDim As Boolean
	
	
	Public Property Length() As Integer
		Get
			Length = seqLen
		End Get
		Set(ByVal Value As Integer)
			On Error GoTo ErrHandler
			Dim newSize As Integer
			If Value <= 0 Then
				seqLen = 0
				Erase seqArr
				seqIsDim = False
			Else
				If seqBnd > 0 And Value > seqBnd Then
					Call mVBOrb.VBOrb.raiseBADPARAM(1, mVBOrb.VBOrb.CompletedNO, CStr(Value) & " > " & CStr(seqBnd))
				End If
				seqLen = Value
				If seqIsDim Then
					If Value > UBound(seqArr) + 1 Then
						newSize = (UBound(seqArr) * 3 + 3) \ 2
						If seqBnd > 0 And newSize > seqBnd Then
							newSize = seqBnd
						End If
						If Value > newSize Then
							newSize = Value
						End If
						ReDim Preserve seqArr(newSize - 1)
					End If
				Else
					ReDim seqArr(Value - 1)
					seqIsDim = True
				End If
			End If
			Exit Property
ErrHandler: 
			Call mVBOrb.VBOrb.ErrReraise(Err, "CBStructMemberSeq.Length.Let")
		End Set
	End Property
	
	Public ReadOnly Property Boundary() As Integer
		Get
			Boundary = seqBnd
		End Get
	End Property
	
	'index must be in the range of 0 to Length - 1
	
	'index must be in the range of 0 to Length - 1
	Public Property Item(ByVal index As Integer) As cCBStructMember
		Get
			On Error GoTo ErrHandler
			Item = seqArr(index)
			Exit Property
ErrHandler: 
			Call mVBOrb.VBOrb.ErrReraise(Err, "CBStructMemberSeq.Item.Get")
		End Get
		Set(ByVal Value As cCBStructMember)
			On Error GoTo ErrHandler
			seqArr(index) = Value
			Exit Property
ErrHandler: 
			Call mVBOrb.VBOrb.ErrReraise(Err, "CBStructMemberSeq.Item.Set")
		End Set
	End Property
	
	Public Function getItems(ByRef Arr() As cCBStructMember) As Integer
		On Error GoTo ErrHandler
		getItems = seqLen
		Dim seqCnt As Integer
		For seqCnt = 0 To seqLen - 1
			Arr(LBound(Arr) + seqCnt) = seqArr(seqCnt)
		Next seqCnt
		Exit Function
ErrHandler: 
		Call mVBOrb.VBOrb.ErrReraise(Err, "getItems")
	End Function
	
	Public Sub setItems(ByRef Arr() As cCBStructMember, ByVal newLen As Integer)
		On Error GoTo ErrHandler
		Me.Length = newLen
		Dim seqCnt As Integer
		For seqCnt = 0 To seqLen - 1
			seqArr(seqCnt) = Arr(LBound(Arr) + seqCnt)
		Next seqCnt
		Exit Sub
ErrHandler: 
		Call mVBOrb.VBOrb.ErrReraise(Err, "setItems")
	End Sub
	
	'Helper
	Public Sub initByRead(ByVal oIn As cOrbStream, ByVal maxLen As Integer)
		On Error GoTo ErrHandler
		seqBnd = maxLen
		Dim newLen As Integer
		newLen = oIn.readUlong()
		If seqBnd > 0 And newLen > seqBnd Then
			Call mVBOrb.VBOrb.raiseMARSHAL(1, mVBOrb.VBOrb.CompletedNO, CStr(newLen) & " > " & CStr(seqBnd))
		End If
		seqIsDim = False
		Me.Length = newLen
		Dim seqCnt As Integer
		For seqCnt = 0 To seqLen - 1
			seqArr(seqCnt) = New cCBStructMember
			Call seqArr(seqCnt).initByRead(oIn)
		Next seqCnt
		Exit Sub
ErrHandler: 
		Call mVBOrb.VBOrb.ErrReraise(Err, "CBStructMemberSeq.read")
	End Sub
	
	'Helper
	Public Sub writeMe(ByVal oOut As cOrbStream, ByVal maxLen As Integer)
		On Error GoTo ErrHandler
		seqBnd = maxLen
		If seqBnd > 0 And seqLen > seqBnd Then
			Call mVBOrb.VBOrb.raiseMARSHAL(1, mVBOrb.VBOrb.CompletedNO, CStr(seqLen) & " > " & CStr(seqBnd))
		End If
		Call oOut.writeUlong(seqLen)
		Dim seqCnt As Integer
		For seqCnt = 0 To seqLen - 1
			Call seqArr(seqCnt).writeMe(oOut)
		Next seqCnt
		Exit Sub
ErrHandler: 
		Call mVBOrb.VBOrb.ErrReraise(Err, "CBStructMemberSeq.write")
	End Sub
	
	'Helper
	Public Sub initByAny(ByVal oAny As cOrbAny)
		On Error GoTo ErrHandler
		seqBnd = oAny.getOrigType.Length()
		Dim newLen As Integer
		newLen = oAny.seqGetLength()
		If seqBnd > 0 And newLen > seqBnd Then
			Call mVBOrb.VBOrb.raiseMARSHAL(1, mVBOrb.VBOrb.CompletedNO, CStr(newLen) & " > " & CStr(seqBnd))
		End If
		seqIsDim = False
		Me.Length = newLen
		Dim seqCnt As Integer
		For seqCnt = 0 To seqLen - 1
			seqArr(seqCnt) = New cCBStructMember
			Call seqArr(seqCnt).initByAny(oAny.currentComponent())
			Call oAny.nextPos()
		Next seqCnt
		Call oAny.rewind()
		Exit Sub
ErrHandler: 
		Call mVBOrb.VBOrb.ErrReraise(Err, "initByAny")
	End Sub
	
	'Helper
	Public Sub insertIntoAny(ByVal oAny As cOrbAny)
		On Error GoTo ErrHandler
		Call oAny.seqSetLength(seqLen)
		Dim seqCnt As Integer
		For seqCnt = 0 To seqLen - 1
			Call seqArr(seqCnt).insertIntoAny(oAny.currentComponent())
			Call oAny.nextPos()
		Next seqCnt
		Call oAny.rewind()
		Exit Sub
ErrHandler: 
		Call mVBOrb.VBOrb.ErrReraise(Err, "insertIntoAny")
	End Sub
End Class