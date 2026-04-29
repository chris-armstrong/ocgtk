/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColorStop */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gsk/gsk.h>
/* Include library-specific type conversions and forward declarations */
#include "gsk_decls.h"

/* Conversion functions for GskColorStop (opaque record with hidden fields) */
GskColorStop *GskColorStop_val(value v) {
  return (GskColorStop *)ml_gir_record_ptr_val(v, "GskColorStop");
}

value Val_GskColorStop(const GskColorStop *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GskColorStop_option(const GskColorStop *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GskColorStop(ptr));
}

