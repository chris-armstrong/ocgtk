/* GENERATED CODE - DO NOT EDIT */
/* C bindings for WindowControls */

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

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkWindowControls */
#ifndef Val_GtkWindowControls
#define GtkWindowControls_val(val) ((GtkWindowControls*)ext_of_val(val))
#define Val_GtkWindowControls(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkWindowControls */


CAMLexport CAMLprim value ml_gtk_window_controls_new(value arg1)
{
CAMLparam1(arg1);
GtkWindowControls *obj = gtk_window_controls_new(GtkPackType_val(arg1));
CAMLreturn(Val_GtkWindowControls(obj));
}

CAMLexport CAMLprim value ml_gtk_window_controls_set_side(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_controls_set_side(GtkWindowControls_val(self), GtkPackType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_controls_set_decoration_layout(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_controls_set_decoration_layout(GtkWindowControls_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_controls_get_side(value self)
{
CAMLparam1(self);

GtkPackType result = gtk_window_controls_get_side(GtkWindowControls_val(self));
CAMLreturn(Val_GtkPackType(result));
}

CAMLexport CAMLprim value ml_gtk_window_controls_get_empty(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_controls_get_empty(GtkWindowControls_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_controls_get_decoration_layout(value self)
{
CAMLparam1(self);

const char* result = gtk_window_controls_get_decoration_layout(GtkWindowControls_val(self));
CAMLreturn(Val_option_string(result));
}
