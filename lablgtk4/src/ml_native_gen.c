/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Native */

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


CAMLexport CAMLprim value ml_gtk_native_unrealize(value self)
{
CAMLparam1(self);


    gtk_native_unrealize(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_native_realize(value self)
{
CAMLparam1(self);


    gtk_native_realize(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_native_get_surface_transform(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_native_get_surface_transform(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}
