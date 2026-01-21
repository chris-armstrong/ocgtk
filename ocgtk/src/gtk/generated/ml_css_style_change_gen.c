/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CssStyleChange */

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

/* Conversion functions for GtkCssStyleChange (opaque record with hidden fields) */
GtkCssStyleChange *GtkCssStyleChange_val(value v) {
  return *(GtkCssStyleChange **)Data_custom_val(v);
}

value Val_GtkCssStyleChange(const GtkCssStyleChange *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkCssStyleChange_option(const GtkCssStyleChange *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkCssStyleChange(ptr));
}

