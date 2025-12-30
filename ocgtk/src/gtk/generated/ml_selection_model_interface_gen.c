/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SelectionModelInterface */

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

/* Conversion functions for GtkSelectionModelInterface (non-opaque record with fields) */
GtkSelectionModelInterface *GtkSelectionModelInterface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkSelectionModelInterface **)Data_custom_val(v);
  } else {
    return (GtkSelectionModelInterface*)ml_gir_record_ptr_val(v, "GtkSelectionModelInterface");
  }
}

value Val_GtkSelectionModelInterface(GtkSelectionModelInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkSelectionModelInterface), "GtkSelectionModelInterface", NULL);
}

value Val_GtkSelectionModelInterface_option(GtkSelectionModelInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkSelectionModelInterface(ptr));
}

