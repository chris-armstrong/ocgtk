/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Native */

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


CAMLexport CAMLprim value ml_gtk_native_unrealize(value self)
{
CAMLparam1(self);

gtk_native_unrealize(GtkNative_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_native_realize(value self)
{
CAMLparam1(self);

gtk_native_realize(GtkNative_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_native_get_surface_transform(value self)
{
CAMLparam1(self);
double out1;
double out2;

gtk_native_get_surface_transform(GtkNative_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, caml_copy_double(out1));
    Store_field(ret, 1, caml_copy_double(out2));
    CAMLreturn(ret);
}
