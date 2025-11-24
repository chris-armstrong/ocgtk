/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileDialog */

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

/* Type-specific conversion macros for GtkFileDialog */
#define GtkFileDialog_val(val) ((GtkFileDialog*)ext_of_val(val))
#define Val_GtkFileDialog(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_file_dialog_new(value unit)
{
CAMLparam1(unit);
GtkFileDialog *obj = gtk_file_dialog_new();
CAMLreturn(Val_GtkFileDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_file_dialog_set_default_filter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_dialog_set_default_filter(GtkFileDialog_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_dialog_get_default_filter(value self)
{
CAMLparam1(self);

GtkFileFilter* result = gtk_file_dialog_get_default_filter(GtkFileDialog_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_file_dialog_get_accept_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileDialog *obj = (GtkFileDialog *)GtkFileDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "accept-label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_dialog_set_accept_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFileDialog *obj = (GtkFileDialog *)GtkFileDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "accept-label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_dialog_get_initial_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileDialog *obj = (GtkFileDialog *)GtkFileDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "initial-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_dialog_set_initial_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFileDialog *obj = (GtkFileDialog *)GtkFileDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "initial-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_dialog_get_modal(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileDialog *obj = (GtkFileDialog *)GtkFileDialog_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "modal", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_dialog_set_modal(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFileDialog *obj = (GtkFileDialog *)GtkFileDialog_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "modal", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_dialog_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileDialog *obj = (GtkFileDialog *)GtkFileDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "title", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_dialog_set_title(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFileDialog *obj = (GtkFileDialog *)GtkFileDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "title", c_value, NULL);
CAMLreturn(Val_unit);
}
