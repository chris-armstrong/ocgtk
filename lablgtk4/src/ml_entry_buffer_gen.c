/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EntryBuffer */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkEntryBuffer */
#define GtkEntryBuffer_val(val) ((GtkEntryBuffer*)ext_of_val(val))
#define Val_GtkEntryBuffer(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_entry_buffer_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkEntryBuffer *obj = gtk_entry_buffer_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), Int_val(arg2));
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
g_object_get(G_OBJECT(obj), "length", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_buffer_get_max_length(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntryBuffer *obj = (GtkEntryBuffer *)GtkEntryBuffer_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "max-length", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_buffer_set_max_length(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntryBuffer *obj = (GtkEntryBuffer *)GtkEntryBuffer_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-length", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_buffer_get_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntryBuffer *obj = (GtkEntryBuffer *)GtkEntryBuffer_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_buffer_set_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntryBuffer *obj = (GtkEntryBuffer *)GtkEntryBuffer_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "text", c_value, NULL);
CAMLreturn(Val_unit);
}
