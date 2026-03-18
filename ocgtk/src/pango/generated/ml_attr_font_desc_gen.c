/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrFontDesc */

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

/* Conversion functions for PangoAttrFontDesc (opaque record with hidden fields) */
PangoAttrFontDesc *PangoAttrFontDesc_val(value v) {
  return *(PangoAttrFontDesc **)Data_custom_val(v);
}

value Val_PangoAttrFontDesc(const PangoAttrFontDesc *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrFontDesc_option(const PangoAttrFontDesc *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrFontDesc(ptr));
}

