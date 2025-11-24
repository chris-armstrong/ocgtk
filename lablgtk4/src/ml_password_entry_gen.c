/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PasswordEntry */

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

/* Type-specific conversion macros for GtkPasswordEntry */
#define GtkPasswordEntry_val(val) ((GtkPasswordEntry*)ext_of_val(val))
#define Val_GtkPasswordEntry(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_password_entry_new(value unit)
{
CAMLparam1(unit);
GtkPasswordEntry *obj = gtk_password_entry_new();
CAMLreturn(Val_GtkPasswordEntry(obj));
}

CAMLexport CAMLprim value ml_gtk_password_entry_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPasswordEntry *obj = (GtkPasswordEntry *)GtkPasswordEntry_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activates-default", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_password_entry_set_activates_default(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPasswordEntry *obj = (GtkPasswordEntry *)GtkPasswordEntry_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activates-default", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_password_entry_get_placeholder_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPasswordEntry *obj = (GtkPasswordEntry *)GtkPasswordEntry_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "placeholder-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_password_entry_set_placeholder_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPasswordEntry *obj = (GtkPasswordEntry *)GtkPasswordEntry_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "placeholder-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_password_entry_get_show_peek_icon(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPasswordEntry *obj = (GtkPasswordEntry *)GtkPasswordEntry_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-peek-icon", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_password_entry_set_show_peek_icon(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPasswordEntry *obj = (GtkPasswordEntry *)GtkPasswordEntry_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-peek-icon", c_value, NULL);
CAMLreturn(Val_unit);
}
