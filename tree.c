#include "gcc-plugin.h"
#include <stdlib.h>
#include "config.h"
#include "system.h"
#include "coretypes.h"
#include "tree.h"
#include "tree-pass.h"
#include "intl.h"
/* reqs */
#include "tm.h"
/* gcc/ headers. */
#include "cp/cp-tree.h"
#include "c-family/c-common.h"


#include "c-family/c-pretty-print.h"
#include "tree-iterator.h"
#include "plugin.h"
//#include "c-family/tree-flow.h"
#include "langhooks.h"

#include "cp/cxx-pretty-print.h"
#include "cp/name-lookup.h"
#include "diagnostic.h"
int plugin_is_GPL_compatible;

void dump_go_spec_init (const char *filename, 
                   struct plugin_name_args *plugin_info
                        );

int plugin_init (struct plugin_name_args *plugin_info,
struct plugin_gcc_version *version)
{
  //debug_hooks = 
  dump_go_spec_init ("test.go", plugin_info);

  return 0;
}

/* #define USED_FOR_TARGET */
/* #define GATHER_STATISTICS 1 */
/* #include "include/ansidecl.h" */
/* #include "include/coretypes.h" */
/* //#include <stdint.h> */
/* //#include <stddef.h> */
/* //#include <stdio.h> */
/* #define INT64_T_IS_LONG   1 */
/* #define HAVE_LONG_LONG 1 */

/* #include "include/config.h" */
/* //#include "include/system.h" */
/* #include "include/coretypes.h" */

/* #undef IN_GCC */
/* #include "include/gcc-plugin.h" */

/* /\* #include "include/insn-modes.h" *\/ */
/* /\* //#include "include/hash-set.h" *\/ */
/* /\* //#include "include/tree.h" *\/ */

/* //#include "include/tree.h" */
/* #include "include/tree-pass.h" */
/* #include "include/intl.h" */
