/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DropDown */

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


CAMLexport CAMLprim value ml_gtk_drop_down_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_drop_down_new(arg1, (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_drop_down_new_from_strings(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_drop_down_new_from_strings(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_search_match_mode(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_drop_down_set_search_match_mode(GtkWidget_val(self), GtkStringFilterMatchMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_model(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_drop_down_set_model(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_list_factory(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_drop_down_set_list_factory(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_header_factory(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_drop_down_set_header_factory(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_factory(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_drop_down_set_factory(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_expression(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_drop_down_set_expression(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_search_match_mode(value self)
{
CAMLparam1(self);


    GtkStringFilterMatchMode result = gtk_drop_down_get_search_match_mode(GtkWidget_val(self));
CAMLreturn(Val_GtkStringFilterMatchMode(result));
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_list_factory(value self)
{
CAMLparam1(self);


    GtkListItemFactory* result = gtk_drop_down_get_list_factory(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_header_factory(value self)
{
CAMLparam1(self);


    GtkListItemFactory* result = gtk_drop_down_get_header_factory(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_factory(value self)
{
CAMLparam1(self);


    GtkListItemFactory* result = gtk_drop_down_get_factory(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_expression(value self)
{
CAMLparam1(self);


    GtkExpression* result = gtk_drop_down_get_expression(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_enable_search(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "enable-search", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_enable_search(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "enable-search", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_selected(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "selected", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_selected(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "selected", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_down_get_show_arrow(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-arrow", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_drop_down_set_show_arrow(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-arrow", c_value, NULL);
CAMLreturn(Val_unit);
}
