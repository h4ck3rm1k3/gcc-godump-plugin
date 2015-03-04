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
