/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrFloat */

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

/* Conversion functions for PangoAttrFloat (opaque record with hidden fields) */
PangoAttrFloat *PangoAttrFloat_val(value v) {
  return (PangoAttrFloat *)ml_gir_record_ptr_val(v, "PangoAttrFloat");
}

value Val_PangoAttrFloat(const PangoAttrFloat *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrFloat_option(const PangoAttrFloat *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrFloat(ptr));
}

