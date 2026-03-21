/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrSize */

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
/* Include library-specific type conversions and forward declarations */
#include "pango_decls.h"

/* Conversion functions for PangoAttrSize (opaque record with hidden fields) */
PangoAttrSize *PangoAttrSize_val(value v) {
  return *(PangoAttrSize **)Data_custom_val(v);
}

value Val_PangoAttrSize(const PangoAttrSize *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrSize_option(const PangoAttrSize *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrSize(ptr));
}

