/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StringFilter */

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


CAMLexport CAMLprim value ml_gtk_string_filter_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_string_filter_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_string_filter_set_match_mode(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_string_filter_set_match_mode(GtkWidget_val(self), GtkStringFilterMatchMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_filter_set_expression(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_string_filter_set_expression(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_filter_get_match_mode(value self)
{
CAMLparam1(self);


    GtkStringFilterMatchMode result = gtk_string_filter_get_match_mode(GtkWidget_val(self));
CAMLreturn(Val_GtkStringFilterMatchMode(result));
}

CAMLexport CAMLprim value ml_gtk_string_filter_get_expression(value self)
{
CAMLparam1(self);


    GtkExpression* result = gtk_string_filter_get_expression(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_string_filter_get_ignore_case(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "ignore-case", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_string_filter_set_ignore_case(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "ignore-case", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_filter_get_search(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "search", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_string_filter_set_search(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "search", c_value, NULL);
CAMLreturn(Val_unit);
}
