/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeSortableIface */

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

/* Conversion functions for GtkTreeSortableIface (non-opaque record with fields) */
GtkTreeSortableIface *GtkTreeSortableIface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkTreeSortableIface **)Data_custom_val(v);
  } else {
    return (GtkTreeSortableIface*)ml_gir_record_ptr_val(v, "GtkTreeSortableIface");
  }
}

value Val_GtkTreeSortableIface(GtkTreeSortableIface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkTreeSortableIface), "GtkTreeSortableIface", NULL);
}

value Val_GtkTreeSortableIface_option(GtkTreeSortableIface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkTreeSortableIface(ptr));
}

