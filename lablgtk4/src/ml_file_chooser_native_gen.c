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
#ifndef Val_GtkFileChooserNative
#define GtkFileChooserNative_val(val) ((GtkFileChooserNative*)ext_of_val(val))
#define Val_GtkFileChooserNative(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFileChooserNative */


CAMLexport CAMLprim value ml_gtk_file_chooser_native_new(value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(arg1, arg2, arg3, arg4, arg5);
GtkFileChooserNative *obj = gtk_file_chooser_native_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWindow_val(Some_val(arg2)) : NULL), GtkFileChooserAction_val(arg3), (Is_some(arg4) ? String_val(Some_val(arg4)) : NULL), (Is_some(arg5) ? String_val(Some_val(arg5)) : NULL));
CAMLreturn(Val_GtkFileChooserNative(obj));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_native_set_cancel_label(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_chooser_native_set_cancel_label(GtkFileChooserNative_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_native_set_accept_label(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_chooser_native_set_accept_label(GtkFileChooserNative_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_native_get_cancel_label(value self)
{
CAMLparam1(self);

const char* result = gtk_file_chooser_native_get_cancel_label(GtkFileChooserNative_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_native_get_accept_label(value self)
{
CAMLparam1(self);

const char* result = gtk_file_chooser_native_get_accept_label(GtkFileChooserNative_val(self));
CAMLreturn(caml_copy_string(result));
}
