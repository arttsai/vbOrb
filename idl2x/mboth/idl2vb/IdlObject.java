/* Copyright (C) 1991-2012 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* We do support the IEC 559 math functionality, real and complex.  */
/* wchar_t uses ISO/IEC 10646 (2nd ed., published 2011-03-15) /
   Unicode 6.0.  */
/* We do not support C11 <threads.h>.  */
/*
   Copyright (c) 1999-2003 Martin.Both

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Library General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   Library General Public License for more details.
*/
package mboth.idl2vb;
import mboth.util.*;
/** <object_type> ::= "Object"
 *
 *  @author  Martin Both
 */
public class IdlObject extends IdlIdentifier implements IdlType
{
 /** Read a <object_type>
	 *
	 *  @param	idlScope	Information about the surrounding scope
	 *  @param	filePos		File position of the identifier
	 */
 public static IdlObject readIdlObject(IdlScope idlScope, TxtFilePos filePos)
 { return new IdlObject(idlScope, filePos);
 }
 /**
	 *  @param	surScope	Surrounding scope, IdlSpecification or null
	 *  @param	filePos		File position of the identifier
	 */
 protected IdlObject(IdlScope surScope, TxtFilePos filePos)
 { super(surScope, IdlSpecification.OBJECT, filePos);
 }
 /** (IdlType:IdlDefinition)
	 *  Get an IDL name to identify the definition uniquely
	 *  for a specific language mapping
	 *
	 *  @return		<sequence ::T>
	 */
 public String getIdlName()
 { return IdlSpecification.OBJECT;
 }
 /** (IdlType)
	 *  Is a (structure or union) type currently under definition?
	 *
	 *	@return		isUnderDefinitionType
	 */
 public boolean isUnderDefinitionType()
 { return false;
 }
 /** (IdlType)
	 *  Is a complete type (e.g. to be a member of structure or union)?
	 *
	 *	@return		isCompleteType
	 */
 public boolean isCompleteType()
 { return true;
 }
 /** (IdlType)
	 *  Get the incomplete type (e.g. member of a sequence).
	 *
	 *	@return		Incomplete type or null
	 */
 public IdlType getIncompleteType()
 { return null; // isCompleteType()? null: this;
 }
 /** (IdlType)
	 *  Is an anonymous type?
	 *
	 *	@return		isAnonymousType
	 */
 public boolean isAnonymousType()
 { return false;
 }
 /** (IdlType)
	 *  Is a local type?
	 *	@return		isLocalType
	 */
 public boolean isLocalType()
 { return false;
 }
 /** (IdlType)
	 *  Get the origin type of a typedef if not an array declarator.
	 *
	 *	@return		iType
	 */
 public IdlType getOriginIdlType()
 { return this;
 }
 /** (IdlDefinition)
	 *  Set the Visual Basic Name
	 *
	 *	@param	sVbName		Can be "" if not IdlType
	 *	@return		== null, It was not too late to set
	 *				== sVbName, It is unsetable
	 *				otherwise, The old name: Cannot set twice
	 */
 public String setVbName(String sVbName)
 {
  return sVbName;
 }
 /** (IdlDefinition)
	 *  Get the Visual Basic Name to identify the definition
	 *
	 *	@param	bPrefix	With final prefix? The name without prefix is used
	 *  				to build complex names.
	 *	@return		Visual Basic Name
	 */
 public String getVbName(boolean bPrefix)
 { return bPrefix? VbWriter.CORBOBJECT: IdlSpecification.OBJECT;
 }
 /** (IdlType)
	 *
	 *  @return				Assign by SET or LET?
	 */
 public boolean isVbSet()
 { return true;
 }
 /** (IdlType)
	 *
	 *  @param	out		
	 *  @param	vbVariable	Name of the VB variable
	 *
	 *	@exception	java.io.IOException	
	 */
 public void writeVbRead(VbClsWriter out, String vbVariable)
   throws java.io.IOException
 {
  out.writeLine(VbWriter.SET + VbWriter.SP + vbVariable + " = "
   + VbWriter.OIN + ".readObject()");
 }
 /** (IdlType)
	 *
	 *  @param	out		
	 *  @param	vbVariable	Name of the VB variable
	 *
	 *	@exception	java.io.IOException	
	 */
 public void writeVbWrite(VbClsWriter out, String vbVariable)
   throws java.io.IOException
 {
  out.writeLine(VbWriter.CALL + " " + VbWriter.OOUT
   + ".writeObject(" + vbVariable + ")");
 }
 /** (IdlType)
	 *  Write VB code assigning the TypeCode to a VB variable
	 *  @param	out		
	 *  @param	vbVariable	Name of the VB variable getting the TypeCode
	 *
	 *	@exception	java.io.IOException	
	 */
 public void writeVbAssignTypeCode(VbWriter out, String vbVariable)
   throws java.io.IOException
 {
  out.writeAssign(vbVariable, true);
  // mCB.tk_objref = 14
  out.writeLine("oOrb.createPrimitiveTc(14) 'VBOrb.TCObject");
 }
 /** (IdlType)
	 *  Write VB code extracting the value from an oAny to a VB variable
	 *  @param	out		
	 *  @param	vbVariable	Name of the VB variable getting the value
	 *
	 *	@exception	java.io.IOException	
	 */
 public void writeVbFromAny(VbWriter out, String vbVariable)
   throws java.io.IOException
 {
  out.writeAssign(vbVariable, false);
  out.writeLine(VbWriter.OANY + ".getReference()");
 }
 /** (IdlType)
	 *  Write VB code inserting the value into an oAny
	 *  @param	out		
	 *  @param	vbVariable	Name of the VB variable containing the value
	 *
	 *	@exception	java.io.IOException	
	 */
 public void writeVbIntoAny(VbWriter out, String vbVariable)
   throws java.io.IOException
 {
  out.writeLine(VbWriter.CALL + " " + VbWriter.OANY
   + ".insertReference(" + vbVariable + ")");
 }
}
