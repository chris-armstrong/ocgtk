/* GENERATED CODE - DO NOT EDIT */
/* C bindings for RequestedSize */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for GtkRequestedSize (opaque record with hidden fields) */
GtkRequestedSize *GtkRequestedSize_val(value v) {
  return *(GtkRequestedSize **)Data_custom_val(v);
}

value Val_GtkRequestedSize(const GtkRequestedSize *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkRequestedSize_option(const GtkRequestedSize *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkRequestedSize(ptr));
}

