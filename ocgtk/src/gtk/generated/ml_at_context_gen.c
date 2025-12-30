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


CAMLexport CAMLprim value ml_gtk_at_context_create(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkATContext *obj = gtk_at_context_create(GtkAccessibleRole_val(arg1), GtkAccessible_val(arg2), arg3);
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkATContext(obj));
}

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
