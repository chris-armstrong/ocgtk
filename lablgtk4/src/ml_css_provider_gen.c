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


CAMLexport CAMLprim value ml_gtk_css_provider_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_css_provider_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_css_provider_load_named(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_css_provider_load_named(GtkWidget_val(self), String_val(arg1), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_css_provider_load_from_string(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_css_provider_load_from_string(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_css_provider_load_from_resource(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_css_provider_load_from_resource(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_css_provider_load_from_path(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_css_provider_load_from_path(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_css_provider_load_from_file(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_css_provider_load_from_file(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_css_provider_load_from_data(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_css_provider_load_from_data(GtkWidget_val(self), String_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_css_provider_load_from_bytes(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_css_provider_load_from_bytes(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}
