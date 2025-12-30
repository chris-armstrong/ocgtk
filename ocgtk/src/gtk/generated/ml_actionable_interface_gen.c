/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ActionableInterface */

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

/* Conversion functions for GtkActionableInterface (non-opaque record with fields) */
GtkActionableInterface *GtkActionableInterface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkActionableInterface **)Data_custom_val(v);
  } else {
    return (GtkActionableInterface*)ml_gir_record_ptr_val(v, "GtkActionableInterface");
  }
}

value Val_GtkActionableInterface(GtkActionableInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkActionableInterface), "GtkActionableInterface", NULL);
}

value Val_GtkActionableInterface_option(GtkActionableInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkActionableInterface(ptr));
}

