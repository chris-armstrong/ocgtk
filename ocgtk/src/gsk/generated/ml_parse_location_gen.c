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
  return *(GskParseLocation **)Data_custom_val(v);
}

value Val_GskParseLocation(const GskParseLocation *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GskParseLocation_option(const GskParseLocation *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GskParseLocation(ptr));
}

