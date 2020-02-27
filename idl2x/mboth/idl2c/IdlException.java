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
/** Exception declarations permit the declaration of struct-like
 *  data structures which may be returned to indicate that an exceptional
 *  condition has occurred during the performance of a request.
 *
 *  @author  Martin Both
 */
public class IdlException extends IdlContainer implements IdlDefinition
{
 /** Members
	 */
 private IdlDeclarator idlMembers;
 /** Read exception head
	 *
	 *  @param	idlScope	
	 *  @param	token		Last token
	 *  @param	idlRd		IdlFile
	 *	@return				iException (not null)
	 *
	 *	@exception	TxtReadException	With fromFilePos
	 */
 public static IdlException readIdlHead(IdlScope idlScope, TxtToken token,
  TxtTokenReader idlRd) throws TxtReadException
 {
  // <identifier>
  IdlIdentifier iWord= IdlIdentifier.readNewIdlWord(idlScope, token);
  IdlException iException= new IdlException(iWord);
  idlScope.putIdentifier(iException, true);
  // The name of an interface, valuetype, struct, union, exception
  // or a module may not be redefined within the immediate scope of
  // the interface, valuetype, struct, union, exception, or the
  // module. That's why we introduce the identifier now.
  iException.putIdentifier(iException, false);
  return iException;
 }
 /** 
	 *  @param	identifier		Identifier
	 */
 private IdlException(IdlIdentifier identifier)
 {
  super(identifier);
 }
 /** Read exception members
	 *
	 *  @param	idlRd		IdlFile
	 *
	 *	@exception	TxtReadException	With fromFilePos
	 */
 public void readIdl(TxtTokenReader idlRd) throws TxtReadException
 {
  // "{" <member>* "}"
  // "{"
  TxtToken token= idlRd.readToken();
  if(!(token instanceof TxtTokSepChar) ||
   ((TxtTokSepChar)token).getChar() != '{')
  { throw new TxtReadException(token.getFilePos(),
    "\"{\" of exception declaration expected");
  }
  // "}"
  TxtTokenRef tRef= new TxtTokenRef();
  token= tRef.getOrReadToken(idlRd);
  while(!(token instanceof TxtTokSepChar) ||
   ((TxtTokSepChar)token).getChar() != '}')
  {
   // <member> ::= <type_spec> <declarators> ";"
   // <type_spec>
   tRef.ungetToken(token);
   IdlType iType= IdlBaseType.readTypeSpec(this, tRef, idlRd);
   if(!iType.isCompleteType())
    throw IdlBaseType.buildIncompleteTypeEx(token.getFilePos(), iType);
   // if(iType.isAnonymousType()) later in IdlDeclarator.readIdlDcl()
   do
   { // <identifier> [ "[" <positive_int_const> "]" + ]
    IdlDeclarator iMember= IdlDeclarator.readIdlDcl(iType,
     this, tRef, idlRd);
    // Add member
    if(idlMembers == null)
    { idlMembers= iMember;
    }else
    { idlMembers.addNext(iMember);
    }
    token= tRef.getOrReadToken(idlRd);
   }while(token instanceof TxtTokSepChar
    && ((TxtTokSepChar)token).getChar() == ',');
   if(!(token instanceof TxtTokSepChar) ||
    ((TxtTokSepChar)token).getChar() != ';')
   { throw new TxtReadException(token.getFilePos(),
     "\";\" of member declaration expected");
   }
   token= idlRd.readToken();
  }
  // Register the exception as a new IDL definition
  //
  getIdlSpecification().registerIdlDef(this);
 }
}
