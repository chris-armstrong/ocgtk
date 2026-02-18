/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PixbufFormat */

#include <gdk-pixbuf/gdk-pixbuf.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk-pixbuf/gdk-pixbuf.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Copy function for GdkPixbufFormat (value-like record with copy method) */
value copy_GdkPixbufFormat(const GdkPixbufFormat *ptr)
{
  if (ptr == NULL) return Val_none;
  GdkPixbufFormat *copy = gdk_pixbuf_format_copy((GdkPixbufFormat*)ptr);
  return ml_gir_record_val_ptr(copy);
}


CAMLexport CAMLprim value ml_gdk_pixbuf_format_set_disabled(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_pixbuf_format_set_disabled(GdkPixbufFormat_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_pixbuf_format_is_writable(value self)
{
CAMLparam1(self);

gboolean result = gdk_pixbuf_format_is_writable(GdkPixbufFormat_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_format_is_scalable(value self)
{
CAMLparam1(self);

gboolean result = gdk_pixbuf_format_is_scalable(GdkPixbufFormat_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_format_is_save_option_supported(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_pixbuf_format_is_save_option_supported(GdkPixbufFormat_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_format_is_disabled(value self)
{
CAMLparam1(self);

gboolean result = gdk_pixbuf_format_is_disabled(GdkPixbufFormat_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_format_get_name(value self)
{
CAMLparam1(self);

gchar* result = gdk_pixbuf_format_get_name(GdkPixbufFormat_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_format_get_mime_types(value self)
{
CAMLparam1(self);

gchar** result = gdk_pixbuf_format_get_mime_types(GdkPixbufFormat_val(self));
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_string(result[i]));
    }
    for (int i = 0; i < result_length; i++) {
      g_free((gpointer)result[i]);
    }
    g_free(result);
CAMLreturn(ml_result);
}

CAMLexport CAMLprim value ml_gdk_pixbuf_format_get_license(value self)
{
CAMLparam1(self);

gchar* result = gdk_pixbuf_format_get_license(GdkPixbufFormat_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_format_get_extensions(value self)
{
CAMLparam1(self);

gchar** result = gdk_pixbuf_format_get_extensions(GdkPixbufFormat_val(self));
    int result_length = 0;
    while (result[result_length] != NULL) result_length++;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_string(result[i]));
    }
    for (int i = 0; i < result_length; i++) {
      g_free((gpointer)result[i]);
    }
    g_free(result);
CAMLreturn(ml_result);
}

CAMLexport CAMLprim value ml_gdk_pixbuf_format_get_description(value self)
{
CAMLparam1(self);

gchar* result = gdk_pixbuf_format_get_description(GdkPixbufFormat_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_format_free(value self)
{
CAMLparam1(self);

gdk_pixbuf_format_free(GdkPixbufFormat_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_pixbuf_format_copy(value self)
{
CAMLparam1(self);

GdkPixbufFormat* result = gdk_pixbuf_format_copy(GdkPixbufFormat_val(self));
CAMLreturn(Val_GdkPixbufFormat(result));
}
