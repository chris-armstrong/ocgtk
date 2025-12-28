/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EditableInterface */

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

/* Conversion functions for GtkEditableInterface (non-opaque record with fields) */
GtkEditableInterface *GtkEditableInterface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkEditableInterface **)Data_custom_val(v);
  } else {
    return (GtkEditableInterface*)ml_gir_record_ptr_val(v, "GtkEditableInterface");
  }
}

value Val_GtkEditableInterface(GtkEditableInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkEditableInterface), "GtkEditableInterface", NULL);
}

value Val_GtkEditableInterface_option(GtkEditableInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkEditableInterface(ptr));
}

