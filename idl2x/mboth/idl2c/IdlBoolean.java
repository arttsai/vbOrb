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
package mboth.idl2c;
import mboth.util.*;
/** <boolean_type> ::= "boolean"
 *
 *  @author  Martin Both
 */
public class IdlBoolean extends IdlIdentifier implements IdlSwitchType
{
 /** Read a <boolean_type>
	 *
	 *  @param	idlScope	Information about the surrounding scope
	 *  @param	filePos		File position of the identifier
	 */
 public static IdlBoolean readIdlBoolean(IdlScope idlScope,
  TxtFilePos filePos)
 { return new IdlBoolean(idlScope, filePos);
 }
 /**
	 *  @param	surScope	Surrounding scope, IdlSpecification or null
	 *  @param	filePos		File position of the identifier
	 */
 protected IdlBoolean(IdlScope surScope, TxtFilePos filePos)
 { super(surScope, IdlSpecification.BOOLEAN, filePos);
 }
 /** (IdlType:IdlDefinition)
	 *  Get an IDL name to identify the definition uniquely
	 *  for a specific language mapping
	 *
	 *  @return		<sequence ::T>
	 */
 public String getIdlName()
 { return IdlSpecification.BOOLEAN;
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
 /** (IdlConstType)
	 *  Read <const_exp>
	 *
	 *  @param	idlScope	Information about the surrounding scope
	 *  @param	tRef		Next TxtToken, unread() is not allowed because
	 *						it is maybe already used to unread ´>>´ operator!
	 *  @param	idlRd		TxtTokenReader
	 *  @return				Result value
	 *
	 *	@exception	TxtReadException	With fromFilePos
	 */
 public IdlConstValue readIdlConstValue(IdlScope idlScope, TxtTokenRef tRef,
  TxtTokenReader idlRd) throws TxtReadException
 { IdlConstValue iConstValue= IdlConstValue.readConstExpression(this,
   idlScope, tRef, idlRd, IdlConstValue.PRIOR_EX);
  if(iConstValue.getBoolean() == null) // IDL boolean is Java Boolean
  { throw new TxtReadException(tRef.value.getFilePos(),
    "Type mismatch. Constant value must match boolean type.");
  }
  iConstValue.setConstType(this);
  return iConstValue;
 }
 /** (IdlConstType)
	 *  Read a subexpression until finding an operator with less or equal
	 *  priority of prevPrior or unexpected token. If there is no value token
	 *  an exception is thrown.
	 *
	 *  @param	idlScope	Information about the surrounding scope
	 *  @param	tRef		Next TxtToken, unread() is not allowed because
	 *						it is maybe already used to unread ´>>´ operator!
	 *  @param	idlRd		TxtTokenReader
	 *	@param	prevPrior
	 *  @return				Result value
	 *
	 *	@exception	TxtReadException	With fromFilePos
	 */
 public IdlConstValue readSubExpression(IdlScope idlScope, TxtTokenRef tRef,
  TxtTokenReader idlRd, int prevPrior) throws TxtReadException
 { IdlConstValue iConstValue= IdlConstValue.readConstExpression(this,
   idlScope, tRef, idlRd, prevPrior);
  if(iConstValue.getBoolean() == null)
  { throw new TxtReadException(tRef.value.getFilePos(),
    "Type mismatch. Constant value must match boolean type.");
  }
  return iConstValue;
 }
 /** (IdlDefinition)
	 *  Set the C Name
	 *
	 *	@param	CName		Can be "" if not IdlType
	 *	@return		== null, It was not too late to set
	 *				== CName, It is unsetable
	 *				otherwise, The old name: Cannot set twice
	 */
 public String setCName(String CName)
 { return CName;
 }
 /** (IdlDefinition)
	 *  Get the C Name to identify the definition
	 *
	 *	@param	withPrefix	With final prefix? The name without prefix is used
	 *  				to build complex names.
	 *	@return		C Name
	 */
 public String getCName(boolean withPrefix)
 { //if(withPrefix)
   return CWriter.CORBA_ + IdlSpecification.BOOLEAN;
  //return IdlSpecification.BOOLEAN;
 }
}
