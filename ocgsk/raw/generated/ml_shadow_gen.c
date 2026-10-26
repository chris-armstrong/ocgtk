/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Shadow */

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

/* Conversion functions for GskShadow (opaque record with hidden fields) */
GskShadow *GskShadow_val(value v) {
  return (GskShadow *)ml_gir_record_ptr_val(v, "GskShadow");
}

value Val_GskShadow(const GskShadow *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GskShadow_option(const GskShadow *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GskShadow(ptr));
}

