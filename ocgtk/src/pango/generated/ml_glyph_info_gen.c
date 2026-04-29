/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GlyphInfo */

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

/* Conversion functions for PangoGlyphInfo (opaque record with hidden fields) */
PangoGlyphInfo *PangoGlyphInfo_val(value v) {
  return (PangoGlyphInfo *)ml_gir_record_ptr_val(v, "PangoGlyphInfo");
}

value Val_PangoGlyphInfo(const PangoGlyphInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoGlyphInfo_option(const PangoGlyphInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoGlyphInfo(ptr));
}

