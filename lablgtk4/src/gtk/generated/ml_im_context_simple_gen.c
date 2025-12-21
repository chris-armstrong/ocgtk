/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IMContextSimple */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkIMContextSimple */
#ifndef Val_GtkIMContextSimple
#define GtkIMContextSimple_val(val) ((GtkIMContextSimple*)ext_of_val(val))
#define Val_GtkIMContextSimple(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkIMContextSimple */


CAMLexport CAMLprim value ml_gtk_im_context_simple_new(value unit)
{
CAMLparam1(unit);
GtkIMContextSimple *obj = gtk_im_context_simple_new();
CAMLreturn(Val_GtkIMContextSimple(obj));
}

CAMLexport CAMLprim value ml_gtk_im_context_simple_add_compose_file(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_im_context_simple_add_compose_file(GtkIMContextSimple_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
