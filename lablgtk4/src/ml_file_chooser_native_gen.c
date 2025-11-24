/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileChooserNative */

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

/* Type-specific conversion macros for GtkFileChooserNative */
#define GtkFileChooserNative_val(val) ((GtkFileChooserNative*)ext_of_val(val))
#define Val_GtkFileChooserNative(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_file_chooser_native_new(value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(arg1, arg2, arg3, arg4, arg5);
GtkFileChooserNative *obj = gtk_file_chooser_native_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), GtkFileChooserAction_val(arg3), (Is_some(arg4) ? String_val(Some_val(arg4)) : NULL), (Is_some(arg5) ? String_val(Some_val(arg5)) : NULL));
CAMLreturn(Val_GtkFileChooserNative(obj));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_native_get_accept_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileChooserNative *obj = (GtkFileChooserNative *)GtkFileChooserNative_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "accept-label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_native_set_accept_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFileChooserNative *obj = (GtkFileChooserNative *)GtkFileChooserNative_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "accept-label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_native_get_cancel_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileChooserNative *obj = (GtkFileChooserNative *)GtkFileChooserNative_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "cancel-label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_native_set_cancel_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFileChooserNative *obj = (GtkFileChooserNative *)GtkFileChooserNative_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "cancel-label", c_value, NULL);
CAMLreturn(Val_unit);
}
