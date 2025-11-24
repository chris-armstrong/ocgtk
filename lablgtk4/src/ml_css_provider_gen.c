/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CssProvider */

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

/* Type-specific conversion macros for GtkCssProvider */
#define GtkCssProvider_val(val) ((GtkCssProvider*)ext_of_val(val))
#define Val_GtkCssProvider(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_css_provider_new(value unit)
{
CAMLparam1(unit);
GtkCssProvider *obj = gtk_css_provider_new();
CAMLreturn(Val_GtkCssProvider(obj));
}

CAMLexport CAMLprim value ml_gtk_css_provider_load_named(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_css_provider_load_named(GtkCssProvider_val(self), String_val(arg1), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_css_provider_load_from_string(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_css_provider_load_from_string(GtkCssProvider_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_css_provider_load_from_resource(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_css_provider_load_from_resource(GtkCssProvider_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_css_provider_load_from_path(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_css_provider_load_from_path(GtkCssProvider_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
