/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrLanguage */

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

/* Conversion functions for PangoAttrLanguage (opaque record with hidden fields) */
PangoAttrLanguage *PangoAttrLanguage_val(value v) {
  return *(PangoAttrLanguage **)Data_custom_val(v);
}

value Val_PangoAttrLanguage(const PangoAttrLanguage *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrLanguage_option(const PangoAttrLanguage *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrLanguage(ptr));
}

