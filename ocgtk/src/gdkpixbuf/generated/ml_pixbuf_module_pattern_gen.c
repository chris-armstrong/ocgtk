/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PixbufModulePattern */

#include <gdk-pixbuf/gdk-pixbuf.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk-pixbuf/gdk-pixbuf.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for GdkPixbufModulePattern (opaque record with hidden fields) */
GdkPixbufModulePattern *GdkPixbufModulePattern_val(value v) {
  return *(GdkPixbufModulePattern **)Data_custom_val(v);
}

value Val_GdkPixbufModulePattern(const GdkPixbufModulePattern *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkPixbufModulePattern_option(const GdkPixbufModulePattern *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkPixbufModulePattern(ptr));
}

