/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AccessibleInterface */

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

/* Conversion functions for GtkAccessibleInterface (non-opaque record with fields) */
GtkAccessibleInterface *GtkAccessibleInterface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkAccessibleInterface **)Data_custom_val(v);
  } else {
    return (GtkAccessibleInterface*)ml_gir_record_ptr_val(v, "GtkAccessibleInterface");
  }
}

value Val_GtkAccessibleInterface(GtkAccessibleInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkAccessibleInterface), "GtkAccessibleInterface", NULL);
}

value Val_GtkAccessibleInterface_option(GtkAccessibleInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkAccessibleInterface(ptr));
}

