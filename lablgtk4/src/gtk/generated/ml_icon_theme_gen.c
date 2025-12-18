/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IconTheme */

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

/* Type-specific conversion macros for GtkIconTheme */
#ifndef Val_GtkIconTheme
#define GtkIconTheme_val(val) ((GtkIconTheme*)ext_of_val(val))
#define Val_GtkIconTheme(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkIconTheme */


CAMLexport CAMLprim value ml_gtk_icon_theme_new(value unit)
{
CAMLparam1(unit);
GtkIconTheme *obj = gtk_icon_theme_new();
CAMLreturn(Val_GtkIconTheme(obj));
}

CAMLexport CAMLprim value ml_gtk_icon_theme_has_icon(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_icon_theme_has_icon(GtkIconTheme_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_search_path(value self)
{
CAMLparam1(self);

gtk_icon_theme_get_search_path(GtkIconTheme_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_resource_path(value self)
{
CAMLparam1(self);

gtk_icon_theme_get_resource_path(GtkIconTheme_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_icon_sizes(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_theme_get_icon_sizes(GtkIconTheme_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_icon_names(value self)
{
CAMLparam1(self);

gtk_icon_theme_get_icon_names(GtkIconTheme_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_add_search_path(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_theme_add_search_path(GtkIconTheme_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_add_resource_path(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_icon_theme_add_resource_path(GtkIconTheme_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_get_theme_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconTheme *obj = (GtkIconTheme *)GtkIconTheme_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "theme-name");
if (pspec == NULL) caml_failwith("ml_gtk_icon_theme_get_theme_name: property 'theme-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "theme-name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_theme_set_theme_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkIconTheme *obj = (GtkIconTheme *)GtkIconTheme_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "theme-name");
if (pspec == NULL) caml_failwith("ml_gtk_icon_theme_set_theme_name: property 'theme-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "theme-name", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
