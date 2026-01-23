/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CssLocation */

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

/* Conversion functions for GtkCssLocation (opaque record with hidden fields) */
GtkCssLocation *GtkCssLocation_val(value v) {
  return *(GtkCssLocation **)Data_custom_val(v);
}

value Val_GtkCssLocation(const GtkCssLocation *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkCssLocation_option(const GtkCssLocation *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkCssLocation(ptr));
}

