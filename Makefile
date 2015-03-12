GCCGO=gccgo-5

INCPATH_5=/usr/lib/gcc/x86_64-linux-gnu/5/plugin
INCPATH=/usr/lib/gcc/x86_64-linux-gnu/4.9.2/plugin/include


swig :
	swig -gccgo -intgosize 64 -go -module reflector -c++ reflector.cxx

clean :
	rm *.ii *.o *.s

plugin.so : godump.c tree.c pointer-set.c gcc-internals.c
	g++-4.9 -lgcc  -o plugin.so -shared -fPIC -fno-rtti -O2 -I. -I$(INCPATH)  $^

ctypes.o : ctypes.go
	$(GCCGO) -o ctypes.o -c -g ctypes.go

check2 :  ctypes.o
	$(GCCGO) -g test.go ctypes.o

check : test4 ctypes.o
	$(GCCGO) -g test.go ctypes.o

test4: plugin.so
	g++-4.9 -c -fplugin=./plugin.so tree_input.cxx

test3: plugin.so
	g++-4.9 -c -fplugin=./plugin.so reflector.cxx

test2: plugin.so
	g++-4.9 -c -fplugin=./plugin.so test.cxx

test: plugin.so
	$(GCCGO) -fplugin=./plugin.so test2.go

#gcc-5-plugin-dev
#/usr/lib/gcc/x86_64-linux-gnu/5/plugin/include
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cp
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cp/cp-tree.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cp/cxx-pretty-print.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cp/name-lookup.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cp/type-utils.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cp/cp-tree.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/ansidecl.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/filenames.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/hashtab.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/libiberty.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/md5.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/obstack.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin-api.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/safe-ctype.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/splay-tree.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cpplib.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/line-map.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/symtab.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/ada
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/ada/gcc-interface
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/ada/gcc-interface/ada-tree.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/java
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/java/java-tree.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/objc
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/objc/objc-tree.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/alias.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/all-tree.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/alloc-pool.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/attribs.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/auto-host.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/basic-block.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/bitmap.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/builtins.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/bversion.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/c-family
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/c-family/c-common.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/c-family/c-common.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/c-family/c-objc.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/c-family/c-pragma.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/c-family/c-pretty-print.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/c-tree.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/calls.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cfg-flags.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cfg.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cfganal.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cfgbuild.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cfgcleanup.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cfgexpand.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cfghooks.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cfgloop.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cfgloopmanip.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cfgrtl.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cgraph.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/chkp-builtins.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cif-code.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cilk-builtins.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cilkplus.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/configargs.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/context.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/coretypes.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/cppdefault.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/debug.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/defaults.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/df.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/diagnostic-color.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/diagnostic-core.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/diagnostic.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/diagnostic.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/dominance.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/double-int.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/dumpfile.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/emit-rtl.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/except.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/fixed-value.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/flag-types.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/flags.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/fold-const.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/function.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gcc-plugin.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gcc-symtab.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/genrtl.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/ggc.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gimple-builder.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gimple-expr.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gimple-fold.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gimple-iterator.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gimple-low.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gimple-pretty-print.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gimple-ssa.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gimple-walk.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gimple.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gimple.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gimplify-me.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gimplify.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gsstruct.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gtm-builtins.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gtype-desc.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/hard-reg-set.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/hash-map.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/hash-set.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/hash-table.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/highlev-plugin-common.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/hwint.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/inchash.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/incpath.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/input.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/insn-codes.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/insn-constants.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/insn-flags.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/insn-modes.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/insn-notes.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/internal-fn.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/internal-fn.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/intl.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/ipa-prop.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/ipa-ref.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/ipa-reference.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/ipa-utils.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/is-a.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/langhooks.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/lcm.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/machmode.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/mode-classes.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/omp-builtins.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/options.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/opts.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/output.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/params.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/params.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/pass-instances.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/pass_manager.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin-version.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/predict.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/predict.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/prefix.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/pretty-print.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/print-rtl.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/print-tree.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/real.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/realmpfr.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/reg-notes.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/regset.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/resource.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/rtl.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/rtl.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/sanitizer.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/sbitmap.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/signop.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/ssa-iterators.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/statistics.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/stmt.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/stor-layout.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/stringpool.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/sync-builtins.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/system.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/target-hooks-macros.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/target.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/target.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/timevar.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/timevar.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm-preds.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm_p.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/toplev.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-cfg.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-cfgcleanup.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-check.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-core.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-dfa.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-dump.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-eh.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-hasher.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-inline.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-into-ssa.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-iterator.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-nested.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-object-size.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-outof-ssa.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-parloops.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-pass.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-phinodes.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-pretty-print.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssa-address.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssa-alias.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssa-coalesce.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssa-dom.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssa-loop-ivopts.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssa-loop-manip.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssa-loop-niter.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssa-loop.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssa-operands.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssa-sccvn.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssa-ter.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssa-threadedge.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssa-threadupdate.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssa.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree-ssanames.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tree.def
# /include/tree.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/treestruct.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/varasm.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/vec.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/version.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/wide-int-print.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/wide-int.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/b-header-vars
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/i386
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/i386/i386-opts.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/i386/stringop.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/i386/x86-tune.def
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/i386/att.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/i386/biarch64.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/i386/gnu-user-common.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/i386/gnu-user64.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/i386/i386-protos.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/i386/i386.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/i386/linux-common.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/i386/linux64.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/i386/unix.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/i386/x86-64.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/dbxelf.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/glibc-stdint.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/gnu-user.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/initfini-array.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/linux-android.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/linux-protos.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/linux.h
# /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/vxworks-dummy.h
