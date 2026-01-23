/* GENERATED CODE - DO NOT EDIT */
/* C bindings for RGBA */

#include <gdk/gdk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Copy function for GdkRGBA (value-like record with copy method) */
value copy_GdkRGBA(const GdkRGBA *ptr) {
  if (ptr == NULL) return Val_none;
  GdkRGBA *copy = gdk_rgba_copy((GdkRGBA*)ptr);
  return ml_gir_record_val_ptr(g_new0(GdkRGBA, 1));
}


CAMLexport CAMLprim value ml_gdk_rgba_to_string(value self)
{
CAMLparam1(self);

char* result = gdk_rgba_to_string(GdkRGBA_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gdk_rgba_parse(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_rgba_parse(GdkRGBA_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_rgba_is_opaque(value self)
{
CAMLparam1(self);

gboolean result = gdk_rgba_is_opaque(GdkRGBA_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_rgba_is_clear(value self)
{
CAMLparam1(self);

gboolean result = gdk_rgba_is_clear(GdkRGBA_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_rgba_hash(value self)
{
CAMLparam1(self);

guint result = gdk_rgba_hash(GdkRGBA_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_rgba_free(value self)
{
CAMLparam1(self);

gdk_rgba_free(GdkRGBA_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_rgba_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_rgba_equal(GdkRGBA_val(self), GdkRGBA_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_rgba_copy(value self)
{
CAMLparam1(self);

GdkRGBA* result = gdk_rgba_copy(GdkRGBA_val(self));
CAMLreturn(Val_GdkRGBA(result));
}
