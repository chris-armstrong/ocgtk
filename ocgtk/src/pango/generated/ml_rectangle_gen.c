/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Rectangle */

#include <pango/pango.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <pango/pango.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for PangoRectangle (opaque record with hidden fields) */
PangoRectangle *PangoRectangle_val(value v) {
  return *(PangoRectangle **)Data_custom_val(v);
}

value Val_PangoRectangle(const PangoRectangle *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoRectangle_option(const PangoRectangle *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoRectangle(ptr));
}

