/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileFilter */

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

/* Type-specific conversion macros for GtkFileFilter */
#ifndef Val_GtkFileFilter
#define GtkFileFilter_val(val) ((GtkFileFilter*)ext_of_val(val))
#define Val_GtkFileFilter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFileFilter */


CAMLexport CAMLprim value ml_gtk_file_filter_new(value unit)
{
CAMLparam1(unit);
GtkFileFilter *obj = gtk_file_filter_new();
CAMLreturn(Val_GtkFileFilter(obj));
}

CAMLexport CAMLprim value ml_gtk_file_filter_new_from_gvariant(value arg1)
{
CAMLparam1(arg1);
GtkFileFilter *obj = gtk_file_filter_new_from_gvariant(arg1);
CAMLreturn(Val_GtkFileFilter(obj));
}

CAMLexport CAMLprim value ml_gtk_file_filter_set_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_filter_set_name(GtkFileFilter_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_filter_get_name(value self)
{
CAMLparam1(self);

const char* result = gtk_file_filter_get_name(GtkFileFilter_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_file_filter_add_suffix(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_filter_add_suffix(GtkFileFilter_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_filter_add_pixbuf_formats(value self)
{
CAMLparam1(self);

gtk_file_filter_add_pixbuf_formats(GtkFileFilter_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_filter_add_pattern(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_filter_add_pattern(GtkFileFilter_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_filter_add_mime_type(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_filter_add_mime_type(GtkFileFilter_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
