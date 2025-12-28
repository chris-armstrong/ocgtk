/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SymbolicPaintableInterface */

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

/* Conversion functions for GtkSymbolicPaintableInterface (non-opaque record with fields) */
GtkSymbolicPaintableInterface *GtkSymbolicPaintableInterface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkSymbolicPaintableInterface **)Data_custom_val(v);
  } else {
    return (GtkSymbolicPaintableInterface*)ml_gir_record_ptr_val(v, "GtkSymbolicPaintableInterface");
  }
}

value Val_GtkSymbolicPaintableInterface(GtkSymbolicPaintableInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkSymbolicPaintableInterface), "GtkSymbolicPaintableInterface", NULL);
}

value Val_GtkSymbolicPaintableInterface_option(GtkSymbolicPaintableInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkSymbolicPaintableInterface(ptr));
}

