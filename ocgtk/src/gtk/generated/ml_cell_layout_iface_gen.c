/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellLayoutIface */

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

/* Conversion functions for GtkCellLayoutIface (non-opaque record with fields) */
GtkCellLayoutIface *GtkCellLayoutIface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkCellLayoutIface **)Data_custom_val(v);
  } else {
    return (GtkCellLayoutIface*)ml_gir_record_ptr_val(v, "GtkCellLayoutIface");
  }
}

value Val_GtkCellLayoutIface(GtkCellLayoutIface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkCellLayoutIface), "GtkCellLayoutIface", NULL);
}

value Val_GtkCellLayoutIface_option(GtkCellLayoutIface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkCellLayoutIface(ptr));
}

