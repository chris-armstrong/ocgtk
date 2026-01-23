/* GENERATED CODE - DO NOT EDIT */
/* C bindings for KeymapKey */

#include <gdk/gdk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for GdkKeymapKey (opaque record with hidden fields) */
GdkKeymapKey *GdkKeymapKey_val(value v) {
  return *(GdkKeymapKey **)Data_custom_val(v);
}

value Val_GdkKeymapKey(const GdkKeymapKey *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkKeymapKey_option(const GdkKeymapKey *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkKeymapKey(ptr));
}

