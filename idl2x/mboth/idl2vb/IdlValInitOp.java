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
import java.io.IOException;
import mboth.util.*;
/** Initializer (or constructor) for non abstract value types.
 *  Initializers are prefixed with the keyword "factory". have no return type,
 *  and must use only "in" parameters.
 *
 *  @author  Martin Both
 */
public class IdlValInitOp extends IdlOperation
{
 /** <init_parameter_dcls> or null, see IdlOperation
	 */
 //protected IdlOpParameter idlOpParameters;
 /** Raises expressions or null, see IdlOperation
	 */
 //protected IdlException rExceptions[];
 /** Read initializer head
	 *
	 *  @param	idlScope	
	 *  @param	tRef		Maybe next token
	 *  @param	idlRd		IdlFile
	 *	@return				iValInitOp (never null)
	 *
	 *	@exception	TxtReadException	With fromFilePos
	 */
 public static IdlValInitOp readIdlHead(IdlScope idlScope, TxtTokenRef tRef,
  TxtTokenReader idlRd) throws TxtReadException
 {
  // <identifier>
  TxtToken token= tRef.getOrReadToken(idlRd);
  IdlIdentifier iWord= IdlIdentifier.readNewIdlWord(idlScope, token);
  IdlValInitOp iValInitOp= new IdlValInitOp(iWord);
  idlScope.putIdentifier(iValInitOp, true);
  return iValInitOp;
 }
 /** 
	 *  @param	iWord		Identifier
	 */
 public IdlValInitOp(IdlIdentifier iWord)
 {
  super(iWord, /* oneway= */ false, /* return type= */
   IdlVoid.readIdlVoid(iWord.getSurScope(), iWord.getFilePos()));
 }
 /** "(" [ <init_param_decls> ] ")" [<raises_expr>] ";"
	 *  Read rest of initializer declaration
	 *
	 *  @param	tRef		Maybe next token
	 *  @param	idlRd		IdlFile
	 *
	 *	@exception	TxtReadException	With fromFilePos
	 */
 public void readIdl(TxtTokenRef tRef, TxtTokenReader idlRd)
  throws TxtReadException
 {
  // "("
  TxtToken token= tRef.getOrReadToken(idlRd);
  if(!(token instanceof TxtTokSepChar) ||
   ((TxtTokSepChar)token).getChar() != '(')
  { throw new TxtReadException(token.getFilePos(),
    "\"(\" of parameter declaration expected");
  }
  // [ <init_param_decls> ] ")"
  token= idlRd.readToken();
  if(!(token instanceof TxtTokSepChar) ||
   ((TxtTokSepChar)token).getChar() != ')')
  { // <init_param_decls> ::= <init_param_decl> { "," <init_param_dcl> }*
   // <init_param_decl> ::= <init_param_attribute> <param_type_spec>
   //                       <simple_declarator>
   for(; ; )
   { IdlOpParameter iOpParameter= IdlOpParameter.readIdlHead(
     this, token, idlRd);
    if(iOpParameter.isOut())
    { throw new TxtReadException(token.getFilePos(),
      "Initializer operation must use only in parameters");
    }
    addIdlOpParameter(iOpParameter);
    //iOpParameter.readIdl(idlRd);
    token= idlRd.readToken();
    if(!(token instanceof TxtTokSepChar)
     || ((TxtTokSepChar)token).getChar() != ',')
     break;
    token= idlRd.readToken();
   }
   if(!(token instanceof TxtTokSepChar) ||
    ((TxtTokSepChar)token).getChar() != ')')
   { throw new TxtReadException(token.getFilePos(),
     "\",\" or \")\" of parameter declaration expected");
   }
  }
  // [<raises_expr>]
  //
  token= idlRd.readToken();
  String keyword= IdlSpecification.readKeyword(token, true);
  if(keyword == IdlSpecification.RAISES)
  { token= idlRd.readToken();
   if(!(token instanceof TxtTokSepChar) ||
    ((TxtTokSepChar)token).getChar() != '(')
   { throw new TxtReadException(token.getFilePos(),
     "\"(\" of raises expression expected");
   }
   do
   { token= tRef.getOrReadToken(idlRd);
    tRef.ungetToken(token);
    // (12) <scoped_name>
    IdlIdentifier identifier;
    identifier= getSurScope().readScopedName(tRef, idlRd, false, false);
    if(!(identifier instanceof IdlException))
    { TxtReadException ex= new TxtReadException(token.getFilePos(),
      "Scoped name of an IDL exception expected");
     ex.setNextException(new TxtReadException(identifier.getFilePos(),
      "Position where the last identifier "
      + "of the given scoped name is defined"));
     throw ex;
    }
    addRaiseException((IdlException)identifier);
    token= tRef.getOrReadToken(idlRd);
   }while(token instanceof TxtTokSepChar
    && ((TxtTokSepChar)token).getChar() == ',');
   if(!(token instanceof TxtTokSepChar) ||
    ((TxtTokSepChar)token).getChar() != ')')
   { throw new TxtReadException(token.getFilePos(),
     "\",\" or \")\" of raises expression expected");
   }
   token= idlRd.readToken();
  }
  // ";"
  if(!(token instanceof TxtTokSepChar) ||
   ((TxtTokSepChar)token).getChar() != ';')
  { throw new TxtReadException(token.getFilePos(),
    "\";\" of initializer declaration expected");
  }
  // Register the operation as a new IDL definition
  //
  getIdlSpecification().registerIdlDef(this);
 }
}
