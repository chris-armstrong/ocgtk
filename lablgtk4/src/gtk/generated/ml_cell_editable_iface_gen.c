/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellEditableIface */

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

/* Conversion functions for GtkCellEditableIface (non-opaque record with fields) */
GtkCellEditableIface *GtkCellEditableIface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkCellEditableIface **)Data_custom_val(v);
  } else {
    return (GtkCellEditableIface*)ml_gir_record_ptr_val(v, "GtkCellEditableIface");
  }
}

value Val_GtkCellEditableIface(GtkCellEditableIface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkCellEditableIface), "GtkCellEditableIface", NULL);
}

value Val_GtkCellEditableIface_option(GtkCellEditableIface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkCellEditableIface(ptr));
}

