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

/* Type-specific conversion macros for GtkNative */
#define GtkNative_val(val) ((GtkNative*)ext_of_val(val))
#define Val_GtkNative(obj) ((value)(val_of_ext(obj)))


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
