/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileChooserNative */

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

/* Type-specific conversion macros for GtkFileChooserNative */
#ifndef Val_GtkFileChooserNative
#define GtkFileChooserNative_val(val) ((GtkFileChooserNative*)ext_of_val(val))
#define Val_GtkFileChooserNative(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFileChooserNative */


CAMLexport CAMLprim value ml_gtk_file_chooser_native_new(value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(arg1, arg2, arg3, arg4, arg5);
GtkFileChooserNative *obj = gtk_file_chooser_native_new(String_option_val(arg1), Option_val(arg2, GtkWindow_val, NULL), GtkFileChooserAction_val(arg3), String_option_val(arg4), String_option_val(arg5));
CAMLreturn(Val_GtkFileChooserNative(obj));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_native_get_accept_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileChooserNative *obj = (GtkFileChooserNative *)GtkFileChooserNative_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "accept-label");
if (pspec == NULL) caml_failwith("ml_gtk_file_chooser_native_get_accept_label: property 'accept-label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "accept-label", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_native_set_accept_label(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFileChooserNative *obj = (GtkFileChooserNative *)GtkFileChooserNative_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "accept-label");
if (pspec == NULL) caml_failwith("ml_gtk_file_chooser_native_set_accept_label: property 'accept-label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "accept-label", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_native_get_cancel_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileChooserNative *obj = (GtkFileChooserNative *)GtkFileChooserNative_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "cancel-label");
if (pspec == NULL) caml_failwith("ml_gtk_file_chooser_native_get_cancel_label: property 'cancel-label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "cancel-label", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_native_set_cancel_label(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkFileChooserNative *obj = (GtkFileChooserNative *)GtkFileChooserNative_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "cancel-label");
if (pspec == NULL) caml_failwith("ml_gtk_file_chooser_native_set_cancel_label: property 'cancel-label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "cancel-label", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
