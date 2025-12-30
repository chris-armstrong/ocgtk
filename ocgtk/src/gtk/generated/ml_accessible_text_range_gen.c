/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AccessibleTextRange */

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

/* Conversion functions for GtkAccessibleTextRange (non-opaque record with fields) */
GtkAccessibleTextRange *GtkAccessibleTextRange_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkAccessibleTextRange **)Data_custom_val(v);
  } else {
    return (GtkAccessibleTextRange*)ml_gir_record_ptr_val(v, "GtkAccessibleTextRange");
  }
}

value Val_GtkAccessibleTextRange(GtkAccessibleTextRange *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkAccessibleTextRange), "GtkAccessibleTextRange", NULL);
}

value Val_GtkAccessibleTextRange_option(GtkAccessibleTextRange *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkAccessibleTextRange(ptr));
}

