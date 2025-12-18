/* GENERATED CODE - DO NOT EDIT */
/* C bindings for HeaderBar */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkHeaderBar */
#ifndef Val_GtkHeaderBar
#define GtkHeaderBar_val(val) ((GtkHeaderBar*)ext_of_val(val))
#define Val_GtkHeaderBar(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkHeaderBar */


CAMLexport CAMLprim value ml_gtk_header_bar_new(value unit)
{
CAMLparam1(unit);
GtkHeaderBar *obj = gtk_header_bar_new();
CAMLreturn(Val_GtkHeaderBar(obj));
}

CAMLexport CAMLprim value ml_gtk_header_bar_set_title_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_header_bar_set_title_widget(GtkHeaderBar_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_header_bar_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_header_bar_remove(GtkHeaderBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_header_bar_pack_start(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_header_bar_pack_start(GtkHeaderBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_header_bar_pack_end(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_header_bar_pack_end(GtkHeaderBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_header_bar_get_title_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_header_bar_get_title_widget(GtkHeaderBar_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_header_bar_get_decoration_layout(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkHeaderBar *obj = (GtkHeaderBar *)GtkHeaderBar_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "decoration-layout");
if (pspec == NULL) caml_failwith("ml_gtk_header_bar_get_decoration_layout: property 'decoration-layout' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "decoration-layout", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_header_bar_set_decoration_layout(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkHeaderBar *obj = (GtkHeaderBar *)GtkHeaderBar_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "decoration-layout");
if (pspec == NULL) caml_failwith("ml_gtk_header_bar_set_decoration_layout: property 'decoration-layout' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "decoration-layout", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_header_bar_get_show_title_buttons(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkHeaderBar *obj = (GtkHeaderBar *)GtkHeaderBar_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-title-buttons");
if (pspec == NULL) caml_failwith("ml_gtk_header_bar_get_show_title_buttons: property 'show-title-buttons' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-title-buttons", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_header_bar_set_show_title_buttons(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkHeaderBar *obj = (GtkHeaderBar *)GtkHeaderBar_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-title-buttons");
if (pspec == NULL) caml_failwith("ml_gtk_header_bar_set_show_title_buttons: property 'show-title-buttons' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-title-buttons", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
