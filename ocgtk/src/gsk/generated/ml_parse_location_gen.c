/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ParseLocation */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gsk/gsk.h>
/* Include library-specific type conversions and forward declarations */
#include "gsk_decls.h"

/* Conversion functions for GskParseLocation (opaque record with hidden fields) */
GskParseLocation *GskParseLocation_val(value v) {
  return (GskParseLocation *)ml_gir_record_ptr_val(v, "GskParseLocation");
}

value Val_GskParseLocation(const GskParseLocation *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GskParseLocation_option(const GskParseLocation *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GskParseLocation(ptr));
}

\
CAMLexport CAMLprim value ml_gsk_parse_location_get_bytes(value self)
{
    CAMLparam1(self);
    GskParseLocation *rec = GskParseLocation_val(self);
    CAMLreturn(Val_gsize(rec->bytes));
}

\
CAMLexport CAMLprim value ml_gsk_parse_location_get_chars(value self)
{
    CAMLparam1(self);
    GskParseLocation *rec = GskParseLocation_val(self);
    CAMLreturn(Val_gsize(rec->chars));
}

\
CAMLexport CAMLprim value ml_gsk_parse_location_get_lines(value self)
{
    CAMLparam1(self);
    GskParseLocation *rec = GskParseLocation_val(self);
    CAMLreturn(Val_gsize(rec->lines));
}

\
CAMLexport CAMLprim value ml_gsk_parse_location_get_line_bytes(value self)
{
    CAMLparam1(self);
    GskParseLocation *rec = GskParseLocation_val(self);
    CAMLreturn(Val_gsize(rec->line_bytes));
}

\
CAMLexport CAMLprim value ml_gsk_parse_location_get_line_chars(value self)
{
    CAMLparam1(self);
    GskParseLocation *rec = GskParseLocation_val(self);
    CAMLreturn(Val_gsize(rec->line_chars));
}

\
CAMLexport CAMLprim value ml_gsk_parse_location_set_bytes(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GskParseLocation *rec = GskParseLocation_val(self);
    rec->bytes = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gsk_parse_location_set_chars(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GskParseLocation *rec = GskParseLocation_val(self);
    rec->chars = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gsk_parse_location_set_lines(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GskParseLocation *rec = GskParseLocation_val(self);
    rec->lines = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gsk_parse_location_set_line_bytes(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GskParseLocation *rec = GskParseLocation_val(self);
    rec->line_bytes = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gsk_parse_location_set_line_chars(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GskParseLocation *rec = GskParseLocation_val(self);
    rec->line_chars = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gsk_parse_location_make(value v_bytes, value v_chars, value v_lines, value v_line_bytes, value v_line_chars)
{
    CAMLparam5(v_bytes, v_chars, v_lines, v_line_bytes, v_line_chars);
    GskParseLocation *obj = g_new0(GskParseLocation, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->bytes = Gsize_val(v_bytes);
    obj->chars = Gsize_val(v_chars);
    obj->lines = Gsize_val(v_lines);
    obj->line_bytes = Gsize_val(v_line_bytes);
    obj->line_chars = Gsize_val(v_line_chars);
    CAMLreturn(Val_GskParseLocation(obj));
}

