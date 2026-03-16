/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrShape */

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

/* Conversion functions for PangoAttrShape (opaque record with hidden fields) */
PangoAttrShape *PangoAttrShape_val(value v) {
  return *(PangoAttrShape **)Data_custom_val(v);
}

value Val_PangoAttrShape(const PangoAttrShape *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrShape_option(const PangoAttrShape *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrShape(ptr));
}

