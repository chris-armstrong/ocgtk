/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SearchBar */

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

/* Type-specific conversion macros for GtkSearchBar */
#ifndef Val_GtkSearchBar
#define GtkSearchBar_val(val) ((GtkSearchBar*)ext_of_val(val))
#define Val_GtkSearchBar(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSearchBar */


CAMLexport CAMLprim value ml_gtk_search_bar_new(value unit)
{
CAMLparam1(unit);
GtkSearchBar *obj = gtk_search_bar_new();
CAMLreturn(Val_GtkSearchBar(obj));
}

CAMLexport CAMLprim value ml_gtk_search_bar_set_show_close_button(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_search_bar_set_show_close_button(GtkSearchBar_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_bar_set_search_mode(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_search_bar_set_search_mode(GtkSearchBar_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_bar_set_key_capture_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_search_bar_set_key_capture_widget(GtkSearchBar_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_bar_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_search_bar_set_child(GtkSearchBar_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_bar_get_show_close_button(value self)
{
CAMLparam1(self);

gboolean result = gtk_search_bar_get_show_close_button(GtkSearchBar_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_search_bar_get_search_mode(value self)
{
CAMLparam1(self);

gboolean result = gtk_search_bar_get_search_mode(GtkSearchBar_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_search_bar_get_key_capture_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_search_bar_get_key_capture_widget(GtkSearchBar_val(self));
CAMLreturn(Val_option(result, Val_GtkWidget));
}

CAMLexport CAMLprim value ml_gtk_search_bar_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_search_bar_get_child(GtkSearchBar_val(self));
CAMLreturn(Val_option(result, Val_GtkWidget));
}

CAMLexport CAMLprim value ml_gtk_search_bar_get_search_mode_enabled(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSearchBar *obj = (GtkSearchBar *)GtkSearchBar_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "search-mode-enabled");
if (pspec == NULL) caml_failwith("ml_gtk_search_bar_get_search_mode_enabled: property 'search-mode-enabled' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "search-mode-enabled", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_search_bar_set_search_mode_enabled(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkSearchBar *obj = (GtkSearchBar *)GtkSearchBar_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "search-mode-enabled");
if (pspec == NULL) caml_failwith("ml_gtk_search_bar_set_search_mode_enabled: property 'search-mode-enabled' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "search-mode-enabled", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
