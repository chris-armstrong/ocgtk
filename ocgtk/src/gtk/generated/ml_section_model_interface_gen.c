/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SectionModelInterface */

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

/* Conversion functions for GtkSectionModelInterface (non-opaque record with fields) */
GtkSectionModelInterface *GtkSectionModelInterface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkSectionModelInterface **)Data_custom_val(v);
  } else {
    return (GtkSectionModelInterface*)ml_gir_record_ptr_val(v, "GtkSectionModelInterface");
  }
}

value Val_GtkSectionModelInterface(GtkSectionModelInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkSectionModelInterface), "GtkSectionModelInterface", NULL);
}

value Val_GtkSectionModelInterface_option(GtkSectionModelInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkSectionModelInterface(ptr));
}

