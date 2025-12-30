/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeDragDestIface */

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

/* Conversion functions for GtkTreeDragDestIface (non-opaque record with fields) */
GtkTreeDragDestIface *GtkTreeDragDestIface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkTreeDragDestIface **)Data_custom_val(v);
  } else {
    return (GtkTreeDragDestIface*)ml_gir_record_ptr_val(v, "GtkTreeDragDestIface");
  }
}

value Val_GtkTreeDragDestIface(GtkTreeDragDestIface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkTreeDragDestIface), "GtkTreeDragDestIface", NULL);
}

value Val_GtkTreeDragDestIface_option(GtkTreeDragDestIface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkTreeDragDestIface(ptr));
}

