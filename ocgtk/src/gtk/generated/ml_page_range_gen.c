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

/* Conversion functions for GtkPageRange (non-opaque record with fields) */
GtkPageRange *GtkPageRange_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkPageRange **)Data_custom_val(v);
  } else {
    return (GtkPageRange*)ml_gir_record_ptr_val(v, "GtkPageRange");
  }
}

value Val_GtkPageRange(GtkPageRange *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkPageRange), "GtkPageRange", NULL);
}

value Val_GtkPageRange_option(GtkPageRange *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkPageRange(ptr));
}

