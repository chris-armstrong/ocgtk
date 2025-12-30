/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AccessibleTextInterface */

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

/* Conversion functions for GtkAccessibleTextInterface (non-opaque record with fields) */
GtkAccessibleTextInterface *GtkAccessibleTextInterface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkAccessibleTextInterface **)Data_custom_val(v);
  } else {
    return (GtkAccessibleTextInterface*)ml_gir_record_ptr_val(v, "GtkAccessibleTextInterface");
  }
}

value Val_GtkAccessibleTextInterface(GtkAccessibleTextInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkAccessibleTextInterface), "GtkAccessibleTextInterface", NULL);
}

value Val_GtkAccessibleTextInterface_option(GtkAccessibleTextInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkAccessibleTextInterface(ptr));
}

