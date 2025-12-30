/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeDragSourceIface */

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

/* Conversion functions for GtkTreeDragSourceIface (non-opaque record with fields) */
GtkTreeDragSourceIface *GtkTreeDragSourceIface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkTreeDragSourceIface **)Data_custom_val(v);
  } else {
    return (GtkTreeDragSourceIface*)ml_gir_record_ptr_val(v, "GtkTreeDragSourceIface");
  }
}

value Val_GtkTreeDragSourceIface(GtkTreeDragSourceIface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkTreeDragSourceIface), "GtkTreeDragSourceIface", NULL);
}

value Val_GtkTreeDragSourceIface_option(GtkTreeDragSourceIface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkTreeDragSourceIface(ptr));
}

