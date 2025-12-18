/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontDialog */

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

/* Type-specific conversion macros for GtkFontDialog */
#ifndef Val_GtkFontDialog
#define GtkFontDialog_val(val) ((GtkFontDialog*)ext_of_val(val))
#define Val_GtkFontDialog(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFontDialog */


CAMLexport CAMLprim value ml_gtk_font_dialog_new(value unit)
{
CAMLparam1(unit);
GtkFontDialog *obj = gtk_font_dialog_new();
CAMLreturn(Val_GtkFontDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_set_filter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_font_dialog_set_filter(GtkFontDialog_val(self), Option_val(arg1, GtkFilter_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_get_filter(value self)
{
CAMLparam1(self);

GtkFilter* result = gtk_font_dialog_get_filter(GtkFontDialog_val(self));
CAMLreturn(Val_option(result, Val_GtkFilter));
}

CAMLexport CAMLprim value ml_gtk_font_dialog_get_modal(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontDialog *obj = (GtkFontDialog *)GtkFontDialog_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "modal");
if (pspec == NULL) caml_failwith("ml_gtk_font_dialog_get_modal: property 'modal' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "modal", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_set_modal(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFontDialog *obj = (GtkFontDialog *)GtkFontDialog_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "modal");
if (pspec == NULL) caml_failwith("ml_gtk_font_dialog_set_modal: property 'modal' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "modal", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFontDialog *obj = (GtkFontDialog *)GtkFontDialog_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "title");
if (pspec == NULL) caml_failwith("ml_gtk_font_dialog_get_title: property 'title' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "title", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_dialog_set_title(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFontDialog *obj = (GtkFontDialog *)GtkFontDialog_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "title");
if (pspec == NULL) caml_failwith("ml_gtk_font_dialog_set_title: property 'title' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "title", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
