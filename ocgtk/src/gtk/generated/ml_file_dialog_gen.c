/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileDialog */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_file_dialog_new(value unit)
{
CAMLparam1(unit);
GtkFileDialog *obj = gtk_file_dialog_new();
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkFileDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_file_dialog_set_title(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_dialog_set_title(GtkFileDialog_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_dialog_set_modal(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_dialog_set_modal(GtkFileDialog_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_dialog_set_initial_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_dialog_set_initial_name(GtkFileDialog_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_dialog_set_default_filter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_dialog_set_default_filter(GtkFileDialog_val(self), Option_val(arg1, GtkFileFilter_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_dialog_set_accept_label(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_dialog_set_accept_label(GtkFileDialog_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_dialog_get_title(value self)
{
CAMLparam1(self);

const char* result = gtk_file_dialog_get_title(GtkFileDialog_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_file_dialog_get_modal(value self)
{
CAMLparam1(self);

gboolean result = gtk_file_dialog_get_modal(GtkFileDialog_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_file_dialog_get_initial_name(value self)
{
CAMLparam1(self);

const char* result = gtk_file_dialog_get_initial_name(GtkFileDialog_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_file_dialog_get_default_filter(value self)
{
CAMLparam1(self);

GtkFileFilter* result = gtk_file_dialog_get_default_filter(GtkFileDialog_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GtkFileFilter));
}

CAMLexport CAMLprim value ml_gtk_file_dialog_get_accept_label(value self)
{
CAMLparam1(self);

const char* result = gtk_file_dialog_get_accept_label(GtkFileDialog_val(self));
CAMLreturn(Val_option_string(result));
}
