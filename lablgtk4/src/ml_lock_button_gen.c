/* GENERATED CODE - DO NOT EDIT */
/* C bindings for LockButton */

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

/* Type-specific conversion macros for GtkLockButton */
#define GtkLockButton_val(val) ((GtkLockButton*)ext_of_val(val))
#define Val_GtkLockButton(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_lock_button_new(value arg1)
{
CAMLparam1(arg1);
GtkLockButton *obj = gtk_lock_button_new(arg1);
CAMLreturn(Val_GtkLockButton(obj));
}

CAMLexport CAMLprim value ml_gtk_lock_button_get_text_lock(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLockButton *obj = (GtkLockButton *)GtkLockButton_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "text-lock", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_lock_button_set_text_lock(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLockButton *obj = (GtkLockButton *)GtkLockButton_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "text-lock", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_lock_button_get_text_unlock(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLockButton *obj = (GtkLockButton *)GtkLockButton_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "text-unlock", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_lock_button_set_text_unlock(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLockButton *obj = (GtkLockButton *)GtkLockButton_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "text-unlock", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_lock_button_get_tooltip_lock(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLockButton *obj = (GtkLockButton *)GtkLockButton_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "tooltip-lock", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_lock_button_set_tooltip_lock(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLockButton *obj = (GtkLockButton *)GtkLockButton_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "tooltip-lock", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_lock_button_get_tooltip_not_authorized(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLockButton *obj = (GtkLockButton *)GtkLockButton_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "tooltip-not-authorized", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_lock_button_set_tooltip_not_authorized(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLockButton *obj = (GtkLockButton *)GtkLockButton_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "tooltip-not-authorized", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_lock_button_get_tooltip_unlock(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLockButton *obj = (GtkLockButton *)GtkLockButton_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "tooltip-unlock", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_lock_button_set_tooltip_unlock(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLockButton *obj = (GtkLockButton *)GtkLockButton_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "tooltip-unlock", c_value, NULL);
CAMLreturn(Val_unit);
}
