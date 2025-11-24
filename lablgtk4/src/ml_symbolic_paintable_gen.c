/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SymbolicPaintable */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_symbolic_paintable_snapshot_symbolic_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_symbolic_paintable_snapshot_symbolic(GtkWidget_val(self), arg1, Double_val(arg2), Double_val(arg3), arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_symbolic_paintable_snapshot_symbolic_bytecode(value * argv, int argn)
{
return ml_gtk_symbolic_paintable_snapshot_symbolic_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}
