/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GlyphGeometry */

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

/* Conversion functions for PangoGlyphGeometry (opaque record with hidden fields) */
PangoGlyphGeometry *PangoGlyphGeometry_val(value v) {
  return *(PangoGlyphGeometry **)Data_custom_val(v);
}

value Val_PangoGlyphGeometry(const PangoGlyphGeometry *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoGlyphGeometry_option(const PangoGlyphGeometry *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoGlyphGeometry(ptr));
}

