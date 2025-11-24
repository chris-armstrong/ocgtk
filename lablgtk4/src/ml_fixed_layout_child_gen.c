/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FixedLayoutChild */

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


CAMLexport CAMLprim value ml_gtk_fixed_layout_child_set_transform(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_fixed_layout_child_set_transform(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}
