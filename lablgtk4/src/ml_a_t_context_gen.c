/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ATContext */

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

/* Type-specific conversion macros for GtkATContext */
#ifndef Val_GtkATContext
#define GtkATContext_val(val) ((GtkATContext*)ext_of_val(val))
#define Val_GtkATContext(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkATContext */


CAMLexport CAMLprim value ml_gtk_at_context_create(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkATContext *obj = gtk_at_context_create(GtkAccessibleRole_val(arg1), GtkWidget_val(arg2), arg3);
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
CAMLreturn(Val_GtkWidget(result));
}
