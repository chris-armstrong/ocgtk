/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Shadow */

#include <gsk/gsk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gsk/gsk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for GskShadow (opaque record with hidden fields) */
GskShadow *GskShadow_val(value v) {
  return *(GskShadow **)Data_custom_val(v);
}

value Val_GskShadow(const GskShadow *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GskShadow_option(const GskShadow *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GskShadow(ptr));
}

