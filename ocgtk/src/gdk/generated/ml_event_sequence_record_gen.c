/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EventSequence */

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

/* Conversion functions for GdkEventSequence (opaque record with hidden fields) */
GdkEventSequence *GdkEventSequence_val(value v) {
  return *(GdkEventSequence **)Data_custom_val(v);
}

value Val_GdkEventSequence(GdkEventSequence *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkEventSequence_option(GdkEventSequence *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkEventSequence(ptr));
}

