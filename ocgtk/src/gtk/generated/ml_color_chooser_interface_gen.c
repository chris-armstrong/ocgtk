/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColorChooserInterface */

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

/* Conversion functions for GtkColorChooserInterface (non-opaque record with fields) */
GtkColorChooserInterface *GtkColorChooserInterface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkColorChooserInterface **)Data_custom_val(v);
  } else {
    return (GtkColorChooserInterface*)ml_gir_record_ptr_val(v, "GtkColorChooserInterface");
  }
}

value Val_GtkColorChooserInterface(GtkColorChooserInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkColorChooserInterface), "GtkColorChooserInterface", NULL);
}

value Val_GtkColorChooserInterface_option(GtkColorChooserInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkColorChooserInterface(ptr));
}

