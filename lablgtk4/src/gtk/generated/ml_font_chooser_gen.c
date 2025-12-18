/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontChooser */

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

/* Type-specific conversion macros for GtkFontChooser */
#ifndef Val_GtkFontChooser
#define GtkFontChooser_val(val) ((GtkFontChooser*)ext_of_val(val))
#define Val_GtkFontChooser(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFontChooser */


CAMLexport CAMLprim value ml_gtk_font_chooser_set_level(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_chooser_set_level(GtkFontChooser_val(self), GtkFontChooserLevel_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_level(value self)
{
CAMLparam1(self);

GtkFontChooserLevel result = gtk_font_chooser_get_level(GtkFontChooser_val(self));
CAMLreturn(Val_GtkFontChooserLevel(result));
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_font_size(value self)
{
CAMLparam1(self);

int result = gtk_font_chooser_get_font_size(GtkFontChooser_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_font(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "font");
if (pspec == NULL) caml_failwith("ml_gtk_font_chooser_get_font: property 'font' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "font", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_font(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "font");
if (pspec == NULL) caml_failwith("ml_gtk_font_chooser_set_font: property 'font' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "font", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_font_features(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "font-features");
if (pspec == NULL) caml_failwith("ml_gtk_font_chooser_get_font_features: property 'font-features' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "font-features", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_language(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "language");
if (pspec == NULL) caml_failwith("ml_gtk_font_chooser_get_language: property 'language' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "language", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_language(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "language");
if (pspec == NULL) caml_failwith("ml_gtk_font_chooser_set_language: property 'language' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "language", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_preview_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "preview-text");
if (pspec == NULL) caml_failwith("ml_gtk_font_chooser_get_preview_text: property 'preview-text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "preview-text", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_preview_text(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "preview-text");
if (pspec == NULL) caml_failwith("ml_gtk_font_chooser_set_preview_text: property 'preview-text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "preview-text", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_show_preview_entry(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-preview-entry");
if (pspec == NULL) caml_failwith("ml_gtk_font_chooser_get_show_preview_entry: property 'show-preview-entry' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-preview-entry", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_show_preview_entry(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFontChooser *obj = (GtkFontChooser *)GtkFontChooser_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-preview-entry");
if (pspec == NULL) caml_failwith("ml_gtk_font_chooser_set_show_preview_entry: property 'show-preview-entry' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-preview-entry", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
