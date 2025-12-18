/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontDialogButton */

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

/* Type-specific conversion macros for GtkFontDialogButton */
#ifndef Val_GtkFontDialogButton
#define GtkFontDialogButton_val(val) ((GtkFontDialogButton*)ext_of_val(val))
#define Val_GtkFontDialogButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFontDialogButton */


CAMLexport CAMLprim value ml_gtk_font_dialog_button_new(value arg1)
{
CAMLparam1(arg1);
GtkFontDialogButton *obj = gtk_font_dialog_button_new(Option_val(arg1, GtkFontDialog_val, NULL));
CAMLreturn(Val_GtkFontDialogButton(obj));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_level(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_dialog_button_set_level(GtkFontDialogButton_val(self), GtkFontLevel_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_dialog(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_dialog_button_set_dialog(GtkFontDialogButton_val(self), GtkFontDialog_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_level(value self)
{
CAMLparam1(self);

GtkFontLevel result = gtk_font_dialog_button_get_level(GtkFontDialogButton_val(self));
CAMLreturn(Val_GtkFontLevel(result));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_dialog(value self)
{
CAMLparam1(self);

GtkFontDialog* result = gtk_font_dialog_button_get_dialog(GtkFontDialogButton_val(self));
CAMLreturn(Val_option(result, Val_GtkFontDialog));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_font_features(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontDialogButton *obj = (GtkFontDialogButton *)GtkFontDialogButton_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "font-features");
if (pspec == NULL) caml_failwith("ml_gtk_font_dialog_button_get_font_features: property 'font-features' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "font-features", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_font_features(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFontDialogButton *obj = (GtkFontDialogButton *)GtkFontDialogButton_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "font-features");
if (pspec == NULL) caml_failwith("ml_gtk_font_dialog_button_set_font_features: property 'font-features' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "font-features", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_use_font(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontDialogButton *obj = (GtkFontDialogButton *)GtkFontDialogButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-font");
if (pspec == NULL) caml_failwith("ml_gtk_font_dialog_button_get_use_font: property 'use-font' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "use-font", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_use_font(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFontDialogButton *obj = (GtkFontDialogButton *)GtkFontDialogButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-font");
if (pspec == NULL) caml_failwith("ml_gtk_font_dialog_button_set_use_font: property 'use-font' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "use-font", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_get_use_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontDialogButton *obj = (GtkFontDialogButton *)GtkFontDialogButton_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-size");
if (pspec == NULL) caml_failwith("ml_gtk_font_dialog_button_get_use_size: property 'use-size' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "use-size", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_button_set_use_size(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFontDialogButton *obj = (GtkFontDialogButton *)GtkFontDialogButton_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-size");
if (pspec == NULL) caml_failwith("ml_gtk_font_dialog_button_set_use_size: property 'use-size' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "use-size", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
