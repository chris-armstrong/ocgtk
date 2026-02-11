/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrColor */

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

/* Conversion functions for PangoAttrColor (opaque record with hidden fields) */
PangoAttrColor *PangoAttrColor_val(value v) {
  return *(PangoAttrColor **)Data_custom_val(v);
}

value Val_PangoAttrColor(const PangoAttrColor *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrColor_option(const PangoAttrColor *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrColor(ptr));
}

