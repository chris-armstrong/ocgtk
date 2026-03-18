/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Simd4X4F */

#include <graphene.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <graphene-gobject.h>
/* Include library-specific type conversions and forward declarations */
#include "graphene_decls.h"

/* Conversion functions for graphene_simd4x4f_t (opaque record with hidden fields) */
graphene_simd4x4f_t *graphene_simd4x4f_t_val(value v) {
  return *(graphene_simd4x4f_t **)Data_custom_val(v);
}

value Val_graphene_simd4x4f_t(const graphene_simd4x4f_t *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_graphene_simd4x4f_t_option(const graphene_simd4x4f_t *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_graphene_simd4x4f_t(ptr));
}

