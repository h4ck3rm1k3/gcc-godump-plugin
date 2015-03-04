/* 
   Copyright (C) 2008-2013 Free Software Foundation, Inc.

This file was part of GCC.
has been ported to be a plugin.

GCC is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free
Software Foundation; either version 3, or (at your option) any later
version.

GCC is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING3.  If not see
<http://www.gnu.org/licenses/>.  */


#include "config.h"
#include "system.h"
#include "coretypes.h"
#include "diagnostic-core.h"
#include "tree.h"
//gcc/tree.h:
#include "ggc.h"
//#include "pointer-set.h"
#include "obstack.h"
#include "debug.h"
#include "gcc-internals.h"
#include "gcc-plugin.h"
void * ggc_realloc_stat(void*, unsigned long int)
{
  printf("oops");
  return 0;

}

int
host_integerp (const_tree t, int pos)
{
  if (t == NULL_TREE)
    return 0;

  return (TREE_CODE (t) == INTEGER_CST
	  && ((TREE_INT_CST_HIGH (t) == 0
	       && (HOST_WIDE_INT) TREE_INT_CST_LOW (t) >= 0)
	      || (! pos && TREE_INT_CST_HIGH (t) == -1
		  && (HOST_WIDE_INT) TREE_INT_CST_LOW (t) < 0
		  && !TYPE_UNSIGNED (TREE_TYPE (t)))
	      || (pos && TREE_INT_CST_HIGH (t) == 0)));
}

HOST_WIDE_INT
tree_low_cst (const_tree t, int pos)
{
  //gcc_assert (host_integerp (t, pos));
  return TREE_INT_CST_LOW (t);
}
