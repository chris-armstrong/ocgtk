/* GENERATED CODE - DO NOT EDIT */
/* C bindings for NativeDialog */

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

/* Type-specific conversion macros for GtkNativeDialog */
#define GtkNativeDialog_val(val) ((GtkNativeDialog*)ext_of_val(val))
#define Val_GtkNativeDialog(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_native_dialog_show(value self)
{
CAMLparam1(self);

gtk_native_dialog_show(GtkNativeDialog_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_native_dialog_set_transient_for(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_native_dialog_set_transient_for(GtkNativeDialog_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_native_dialog_hide(value self)
{
CAMLparam1(self);

gtk_native_dialog_hide(GtkNativeDialog_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_native_dialog_get_transient_for(value self)
{
CAMLparam1(self);

GtkWindow* result = gtk_native_dialog_get_transient_for(GtkNativeDialog_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_native_dialog_destroy(value self)
{
CAMLparam1(self);

gtk_native_dialog_destroy(GtkNativeDialog_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_native_dialog_get_modal(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkNativeDialog *obj = (GtkNativeDialog *)GtkNativeDialog_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "modal", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_native_dialog_set_modal(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkNativeDialog *obj = (GtkNativeDialog *)GtkNativeDialog_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "modal", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_native_dialog_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkNativeDialog *obj = (GtkNativeDialog *)GtkNativeDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "title", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_native_dialog_set_title(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkNativeDialog *obj = (GtkNativeDialog *)GtkNativeDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "title", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_native_dialog_get_visible(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkNativeDialog *obj = (GtkNativeDialog *)GtkNativeDialog_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "visible", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_native_dialog_set_visible(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkNativeDialog *obj = (GtkNativeDialog *)GtkNativeDialog_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "visible", c_value, NULL);
CAMLreturn(Val_unit);
}
