/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BuilderCScope */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkBuilderCScope */
#ifndef Val_GtkBuilderCScope
#define GtkBuilderCScope_val(val) ((GtkBuilderCScope*)ext_of_val(val))
#define Val_GtkBuilderCScope(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkBuilderCScope */


CAMLexport CAMLprim value ml_gtk_builder_cscope_new(value unit)
{
CAMLparam1(unit);
GtkBuilderCScope *obj = gtk_builder_cscope_new();
CAMLreturn(Val_GtkBuilderCScope(obj));
}
