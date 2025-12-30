/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ScrollableInterface */

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

/* Conversion functions for GtkScrollableInterface (non-opaque record with fields) */
GtkScrollableInterface *GtkScrollableInterface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkScrollableInterface **)Data_custom_val(v);
  } else {
    return (GtkScrollableInterface*)ml_gir_record_ptr_val(v, "GtkScrollableInterface");
  }
}

value Val_GtkScrollableInterface(GtkScrollableInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkScrollableInterface), "GtkScrollableInterface", NULL);
}

value Val_GtkScrollableInterface_option(GtkScrollableInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkScrollableInterface(ptr));
}

