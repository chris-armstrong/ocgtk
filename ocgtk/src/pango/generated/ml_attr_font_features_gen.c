/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrFontFeatures */

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

/* Conversion functions for PangoAttrFontFeatures (opaque record with hidden fields) */
PangoAttrFontFeatures *PangoAttrFontFeatures_val(value v) {
  return *(PangoAttrFontFeatures **)Data_custom_val(v);
}

value Val_PangoAttrFontFeatures(const PangoAttrFontFeatures *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrFontFeatures_option(const PangoAttrFontFeatures *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrFontFeatures(ptr));
}

