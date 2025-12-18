/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontButton */

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

/* Type-specific conversion macros for GtkFontButton */
#ifndef Val_GtkFontButton
#define GtkFontButton_val(val) ((GtkFontButton*)ext_of_val(val))
#define Val_GtkFontButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFontButton */


CAMLexport CAMLprim value ml_gtk_font_button_new(value unit)
{
CAMLparam1(unit);
GtkFontButton *obj = gtk_font_button_new();
CAMLreturn(Val_GtkFontButton(obj));
}

CAMLexport CAMLprim value ml_gtk_font_button_new_with_font(value arg1)
{
CAMLparam1(arg1);
GtkFontButton *obj = gtk_font_button_new_with_font(String_val(arg1));
CAMLreturn(Val_GtkFontButton(obj));
}

CAMLexport CAMLprim value ml_gtk_font_button_get_modal(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "modal");
if (pspec == NULL) caml_failwith("ml_gtk_font_button_get_modal: property 'modal' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "modal", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_button_set_modal(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "modal");
if (pspec == NULL) caml_failwith("ml_gtk_font_button_set_modal: property 'modal' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "modal", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_button_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "title");
if (pspec == NULL) caml_failwith("ml_gtk_font_button_get_title: property 'title' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "title", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_button_set_title(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "title");
if (pspec == NULL) caml_failwith("ml_gtk_font_button_set_title: property 'title' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "title", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_button_get_use_font(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-font");
if (pspec == NULL) caml_failwith("ml_gtk_font_button_get_use_font: property 'use-font' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "use-font", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_button_set_use_font(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-font");
if (pspec == NULL) caml_failwith("ml_gtk_font_button_set_use_font: property 'use-font' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "use-font", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_button_get_use_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-size");
if (pspec == NULL) caml_failwith("ml_gtk_font_button_get_use_size: property 'use-size' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "use-size", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_button_set_use_size(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFontButton *obj = (GtkFontButton *)GtkFontButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-size");
if (pspec == NULL) caml_failwith("ml_gtk_font_button_set_use_size: property 'use-size' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "use-size", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
