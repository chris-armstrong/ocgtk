/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MediaFile */

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


CAMLexport CAMLprim value ml_gtk_media_file_new(value unit)
{
CAMLparam1(unit);
GtkMediaFile *obj = gtk_media_file_new();
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkMediaFile(obj));
}

CAMLexport CAMLprim value ml_gtk_media_file_new_for_file(value arg1)
{
CAMLparam1(arg1);
GtkMediaFile *obj = gtk_media_file_new_for_file(arg1);
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkMediaFile(obj));
}

CAMLexport CAMLprim value ml_gtk_media_file_new_for_filename(value arg1)
{
CAMLparam1(arg1);
GtkMediaFile *obj = gtk_media_file_new_for_filename(String_val(arg1));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkMediaFile(obj));
}

CAMLexport CAMLprim value ml_gtk_media_file_new_for_input_stream(value arg1)
{
CAMLparam1(arg1);
GtkMediaFile *obj = gtk_media_file_new_for_input_stream(arg1);
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkMediaFile(obj));
}

CAMLexport CAMLprim value ml_gtk_media_file_new_for_resource(value arg1)
{
CAMLparam1(arg1);
GtkMediaFile *obj = gtk_media_file_new_for_resource(String_val(arg1));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkMediaFile(obj));
}

CAMLexport CAMLprim value ml_gtk_media_file_set_resource(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_media_file_set_resource(GtkMediaFile_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_file_set_filename(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_media_file_set_filename(GtkMediaFile_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_file_clear(value self)
{
CAMLparam1(self);

gtk_media_file_clear(GtkMediaFile_val(self));
CAMLreturn(Val_unit);
}
