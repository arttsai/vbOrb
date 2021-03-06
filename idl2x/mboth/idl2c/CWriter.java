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
   Copyright (c) 1999 Martin.Both

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
import java.util.Hashtable;
import java.io.*;
/**
 * @author  Martin Both
 */
public class CWriter
{
 /** C keywords
	 */
 public final static String CHAR= "char";
 public final static String DOUBLE= "double";
 public final static String FLOAT= "float";
 public final static String INT= "int";
 public final static String LONG= "long";
 public final static String SHORT= "short";
 public final static String VOID= "void";
 /** Reserved words
	 */
 public final static String ANY= "any";
 public final static String ARRAY= "array";
 public final static String BOOLEAN= "boolean";
 public final static String CORBA= "CORBA";
 public final static String CORBA_= "CORBA_";
 public final static String ENVIRONMENT= "Environment";
 public final static String OBJECT= "Object";
 public final static String OCTET= "octet";
 public final static String LONG_DOUBLE= "long_double";
 public final static String LONG_LONG= "long_long";
 public final static String SLICE= "slice";
 public final static String STRING= "string";
 public final static String WSTRING= "wstring";
 public final static String UNSIGNED_LONG= "unsigned_long";
 public final static String UNSIGNED_LONG_LONG= "unsigned_long_long";
 public final static String UNSIGNED_SHORT= "unsigned_short";
 public final static String WCHAR= "wchar";
 /** Keyword table
	 */
 private static Hashtable keywords;
 static
 { String keystrs[]=
  { ANY, ARRAY, BOOLEAN, CHAR, CORBA,
   DOUBLE, FLOAT, INT, LONG, LONG_DOUBLE, LONG_LONG, SHORT,
   SLICE, STRING, WSTRING,
   UNSIGNED_LONG, UNSIGNED_LONG_LONG, UNSIGNED_SHORT, WCHAR,
   VOID
  };
  keywords= new Hashtable(50);
  for(int i= 0; i < keystrs.length; i++)
   keywords.put(keystrs[i].toLowerCase(), keystrs[i]);
 }
 /** Hash a C reserved word
	 *
	 *  @param	word		Word (with inconsistent capitalization)
	 *	@return				Possible keyword or null
	 */
 public static String hashResWord(String word)
 { return (String)keywords.get(word.toLowerCase());
 }
 /**
	 */
 private String clsName;
 /**
	 */
 private BufferedWriter out;
 /**
	 */
 private int indents;
 /**
	 */
 private int column;
 /** 
	 *  @param	path		
	 *  @param	clsName		
	 *  @param	srcName		
	 *
	 *	@exception	IOException
	 */
 public CWriter(String path, String clsName, String srcName)
  throws IOException
 {
  this.clsName= clsName;
  out= new BufferedWriter(new FileWriter(new File(path, clsName + ".c")));
  writeLine("'Generated by IDL2C v" + IDL2C.version
   + ". Copyright (c) 1999 Martin.Both");
  writeLine("'Source File Name: " + srcName);
 }
 /**
	 */
 public void close() throws IOException
 {
  out.close();
  if(column > 0)
   throw new InternalError("column > 0");
  if(indents > 0)
   throw new InternalError("indents > 0");
 }
 /** 
	 *	@exception	IOException
	 */
 public void indent(boolean indent)
 {
  if(indent)
  { indents += 1;
  }else
  { indents -= 1;
   if(indents < 0)
    throw new InternalError("indents < 0");
  }
 }
 /** 
	 *	@exception	IOException
	 */
 public void writeLine() throws IOException
 {
  out.write('\r');
  out.write('\n');
  column= 0;
 }
 /** 
	 *  @param	str		
	 *
	 *	@exception	IOException
	 */
 public void write(String str) throws IOException
 {
  int wrIndents= indents;
  if(column > 80)
  { out.write(' ');
   out.write('_');
   writeLine();
   wrIndents++;
  }
  if(column == 0)
  { if(wrIndents > 0)
   { for(int i= 0; i < wrIndents; i++)
    { column += 4;
     out.write("    ", 0, 4);
    }
   }
  }
  int len= str.length();
  column += len;
  out.write(str, 0, len);
 }
 /** 
	 *  @param	str		
	 *
	 *	@exception	IOException
	 */
 public void writeLine(String str) throws IOException
 {
  write(str);
  writeLine();
 }
}
