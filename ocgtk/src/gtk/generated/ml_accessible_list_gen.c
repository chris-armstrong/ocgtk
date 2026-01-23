/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AccessibleList */

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

/* Conversion functions for GtkAccessibleList (opaque record with hidden fields) */
GtkAccessibleList *GtkAccessibleList_val(value v) {
  return *(GtkAccessibleList **)Data_custom_val(v);
}

value Val_GtkAccessibleList(const GtkAccessibleList *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkAccessibleList_option(const GtkAccessibleList *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkAccessibleList(ptr));
}

