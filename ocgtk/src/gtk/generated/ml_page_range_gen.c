/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PageRange */

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

/* Conversion functions for GtkPageRange (opaque record with hidden fields) */
GtkPageRange *GtkPageRange_val(value v) {
  return *(GtkPageRange **)Data_custom_val(v);
}

value Val_GtkPageRange(const GtkPageRange *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkPageRange_option(const GtkPageRange *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkPageRange(ptr));
}

