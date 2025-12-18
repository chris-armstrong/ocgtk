/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EntryCompletion */

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

/* Type-specific conversion macros for GtkEntryCompletion */
#ifndef Val_GtkEntryCompletion
#define GtkEntryCompletion_val(val) ((GtkEntryCompletion*)ext_of_val(val))
#define Val_GtkEntryCompletion(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkEntryCompletion */


CAMLexport CAMLprim value ml_gtk_entry_completion_new(value unit)
{
CAMLparam1(unit);
GtkEntryCompletion *obj = gtk_entry_completion_new();
CAMLreturn(Val_GtkEntryCompletion(obj));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_new_with_area(value arg1)
{
CAMLparam1(arg1);
GtkEntryCompletion *obj = gtk_entry_completion_new_with_area(GtkCellArea_val(arg1));
CAMLreturn(Val_GtkEntryCompletion(obj));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_model(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_completion_set_model(GtkEntryCompletion_val(self), Option_val(arg1, GtkTreeModel_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_insert_prefix(value self)
{
CAMLparam1(self);

gtk_entry_completion_insert_prefix(GtkEntryCompletion_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_model(value self)
{
CAMLparam1(self);

GtkTreeModel* result = gtk_entry_completion_get_model(GtkEntryCompletion_val(self));
CAMLreturn(Val_option(result, Val_GtkTreeModel));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_entry(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_entry_completion_get_entry(GtkEntryCompletion_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_completion_prefix(value self)
{
CAMLparam1(self);

const char* result = gtk_entry_completion_get_completion_prefix(GtkEntryCompletion_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_entry_completion_complete(value self)
{
CAMLparam1(self);

gtk_entry_completion_complete(GtkEntryCompletion_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_inline_completion(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntryCompletion *obj = (GtkEntryCompletion *)GtkEntryCompletion_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "inline-completion");
if (pspec == NULL) caml_failwith("ml_gtk_entry_completion_get_inline_completion: property 'inline-completion' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "inline-completion", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_inline_completion(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEntryCompletion *obj = (GtkEntryCompletion *)GtkEntryCompletion_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "inline-completion");
if (pspec == NULL) caml_failwith("ml_gtk_entry_completion_set_inline_completion: property 'inline-completion' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "inline-completion", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_inline_selection(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntryCompletion *obj = (GtkEntryCompletion *)GtkEntryCompletion_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "inline-selection");
if (pspec == NULL) caml_failwith("ml_gtk_entry_completion_get_inline_selection: property 'inline-selection' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "inline-selection", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_inline_selection(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEntryCompletion *obj = (GtkEntryCompletion *)GtkEntryCompletion_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "inline-selection");
if (pspec == NULL) caml_failwith("ml_gtk_entry_completion_set_inline_selection: property 'inline-selection' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "inline-selection", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_minimum_key_length(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntryCompletion *obj = (GtkEntryCompletion *)GtkEntryCompletion_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "minimum-key-length");
if (pspec == NULL) caml_failwith("ml_gtk_entry_completion_get_minimum_key_length: property 'minimum-key-length' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "minimum-key-length", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_minimum_key_length(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEntryCompletion *obj = (GtkEntryCompletion *)GtkEntryCompletion_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "minimum-key-length");
if (pspec == NULL) caml_failwith("ml_gtk_entry_completion_set_minimum_key_length: property 'minimum-key-length' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "minimum-key-length", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_popup_completion(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntryCompletion *obj = (GtkEntryCompletion *)GtkEntryCompletion_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "popup-completion");
if (pspec == NULL) caml_failwith("ml_gtk_entry_completion_get_popup_completion: property 'popup-completion' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "popup-completion", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_popup_completion(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEntryCompletion *obj = (GtkEntryCompletion *)GtkEntryCompletion_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "popup-completion");
if (pspec == NULL) caml_failwith("ml_gtk_entry_completion_set_popup_completion: property 'popup-completion' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "popup-completion", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_popup_set_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntryCompletion *obj = (GtkEntryCompletion *)GtkEntryCompletion_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "popup-set-width");
if (pspec == NULL) caml_failwith("ml_gtk_entry_completion_get_popup_set_width: property 'popup-set-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "popup-set-width", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_popup_set_width(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEntryCompletion *obj = (GtkEntryCompletion *)GtkEntryCompletion_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "popup-set-width");
if (pspec == NULL) caml_failwith("ml_gtk_entry_completion_set_popup_set_width: property 'popup-set-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "popup-set-width", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_popup_single_match(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntryCompletion *obj = (GtkEntryCompletion *)GtkEntryCompletion_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "popup-single-match");
if (pspec == NULL) caml_failwith("ml_gtk_entry_completion_get_popup_single_match: property 'popup-single-match' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "popup-single-match", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_popup_single_match(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEntryCompletion *obj = (GtkEntryCompletion *)GtkEntryCompletion_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "popup-single-match");
if (pspec == NULL) caml_failwith("ml_gtk_entry_completion_set_popup_single_match: property 'popup-single-match' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "popup-single-match", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_get_text_column(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntryCompletion *obj = (GtkEntryCompletion *)GtkEntryCompletion_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "text-column");
if (pspec == NULL) caml_failwith("ml_gtk_entry_completion_get_text_column: property 'text-column' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "text-column", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_completion_set_text_column(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEntryCompletion *obj = (GtkEntryCompletion *)GtkEntryCompletion_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "text-column");
if (pspec == NULL) caml_failwith("ml_gtk_entry_completion_set_text_column: property 'text-column' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "text-column", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
