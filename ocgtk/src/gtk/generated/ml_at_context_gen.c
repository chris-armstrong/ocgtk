/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ATContext */

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


CAMLexport CAMLprim value ml_gtk_at_context_get_accessible_role(value self)
{
CAMLparam1(self);

GtkAccessibleRole result = gtk_at_context_get_accessible_role(GtkATContext_val(self));
CAMLreturn(Val_GtkAccessibleRole(result));
}

CAMLexport CAMLprim value ml_gtk_at_context_get_accessible(value self)
{
CAMLparam1(self);

GtkAccessible* result = gtk_at_context_get_accessible(GtkATContext_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GtkAccessible(result));
}
