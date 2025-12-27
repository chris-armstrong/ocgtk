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

/* Conversion functions for GtkCssLocation (non-opaque record with fields) */
GtkCssLocation *GtkCssLocation_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkCssLocation **)Data_custom_val(v);
  } else {
    return (GtkCssLocation*)ml_gir_record_ptr_val(v, "GtkCssLocation");
  }
}

value Val_GtkCssLocation(GtkCssLocation *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkCssLocation), "GtkCssLocation", NULL);
}

value Val_GtkCssLocation_option(GtkCssLocation *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkCssLocation(ptr));
}

