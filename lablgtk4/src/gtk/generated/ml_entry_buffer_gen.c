/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EntryBuffer */

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

/* Type-specific conversion macros for GtkEntryBuffer */
#ifndef Val_GtkEntryBuffer
#define GtkEntryBuffer_val(val) ((GtkEntryBuffer*)ext_of_val(val))
#define Val_GtkEntryBuffer(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkEntryBuffer */


CAMLexport CAMLprim value ml_gtk_entry_buffer_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkEntryBuffer *obj = gtk_entry_buffer_new(String_option_val(arg1), Int_val(arg2));
CAMLreturn(Val_GtkEntryBuffer(obj));
}

CAMLexport CAMLprim value ml_gtk_entry_buffer_insert_text(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

guint result = gtk_entry_buffer_insert_text(GtkEntryBuffer_val(self), Int_val(arg1), String_val(arg2), Int_val(arg3));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_entry_buffer_emit_inserted_text(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_entry_buffer_emit_inserted_text(GtkEntryBuffer_val(self), Int_val(arg1), String_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_buffer_emit_deleted_text(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_entry_buffer_emit_deleted_text(GtkEntryBuffer_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_buffer_delete_text(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

guint result = gtk_entry_buffer_delete_text(GtkEntryBuffer_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_entry_buffer_get_length(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntryBuffer *obj = (GtkEntryBuffer *)GtkEntryBuffer_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "length");
if (pspec == NULL) caml_failwith("ml_gtk_entry_buffer_get_length: property 'length' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "length", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_buffer_get_max_length(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntryBuffer *obj = (GtkEntryBuffer *)GtkEntryBuffer_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-length");
if (pspec == NULL) caml_failwith("ml_gtk_entry_buffer_get_max_length: property 'max-length' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "max-length", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_buffer_set_max_length(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEntryBuffer *obj = (GtkEntryBuffer *)GtkEntryBuffer_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-length");
if (pspec == NULL) caml_failwith("ml_gtk_entry_buffer_set_max_length: property 'max-length' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "max-length", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_buffer_get_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntryBuffer *obj = (GtkEntryBuffer *)GtkEntryBuffer_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "text");
if (pspec == NULL) caml_failwith("ml_gtk_entry_buffer_get_text: property 'text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "text", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_buffer_set_text(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEntryBuffer *obj = (GtkEntryBuffer *)GtkEntryBuffer_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "text");
if (pspec == NULL) caml_failwith("ml_gtk_entry_buffer_set_text: property 'text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "text", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
