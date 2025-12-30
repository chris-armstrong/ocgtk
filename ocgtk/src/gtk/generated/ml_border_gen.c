/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Border */

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


CAMLexport CAMLprim value ml_gtk_border_new(value unit)
{
CAMLparam1(unit);
GtkBorder *obj = gtk_border_new();
CAMLreturn(Val_GtkBorder(obj));
}

CAMLexport CAMLprim value ml_gtk_border_free(value self)
{
CAMLparam1(self);

gtk_border_free(GtkBorder_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_border_copy(value self)
{
CAMLparam1(self);

GtkBorder* result = gtk_border_copy(GtkBorder_val(self));
CAMLreturn(Val_GtkBorder(result));
}
