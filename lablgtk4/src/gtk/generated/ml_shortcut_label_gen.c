/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShortcutLabel */

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

/* Type-specific conversion macros for GtkShortcutLabel */
#ifndef Val_GtkShortcutLabel
#define GtkShortcutLabel_val(val) ((GtkShortcutLabel*)ext_of_val(val))
#define Val_GtkShortcutLabel(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkShortcutLabel */


CAMLexport CAMLprim value ml_gtk_shortcut_label_new(value arg1)
{
CAMLparam1(arg1);
GtkShortcutLabel *obj = gtk_shortcut_label_new(String_val(arg1));
CAMLreturn(Val_GtkShortcutLabel(obj));
}

CAMLexport CAMLprim value ml_gtk_shortcut_label_get_accelerator(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkShortcutLabel *obj = (GtkShortcutLabel *)GtkShortcutLabel_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "accelerator");
if (pspec == NULL) caml_failwith("ml_gtk_shortcut_label_get_accelerator: property 'accelerator' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "accelerator", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_shortcut_label_set_accelerator(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkShortcutLabel *obj = (GtkShortcutLabel *)GtkShortcutLabel_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "accelerator");
if (pspec == NULL) caml_failwith("ml_gtk_shortcut_label_set_accelerator: property 'accelerator' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "accelerator", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_label_get_disabled_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkShortcutLabel *obj = (GtkShortcutLabel *)GtkShortcutLabel_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "disabled-text");
if (pspec == NULL) caml_failwith("ml_gtk_shortcut_label_get_disabled_text: property 'disabled-text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "disabled-text", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_shortcut_label_set_disabled_text(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkShortcutLabel *obj = (GtkShortcutLabel *)GtkShortcutLabel_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "disabled-text");
if (pspec == NULL) caml_failwith("ml_gtk_shortcut_label_set_disabled_text: property 'disabled-text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "disabled-text", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
