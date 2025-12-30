/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeModelIface */

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

/* Conversion functions for GtkTreeModelIface (non-opaque record with fields) */
GtkTreeModelIface *GtkTreeModelIface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkTreeModelIface **)Data_custom_val(v);
  } else {
    return (GtkTreeModelIface*)ml_gir_record_ptr_val(v, "GtkTreeModelIface");
  }
}

value Val_GtkTreeModelIface(GtkTreeModelIface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkTreeModelIface), "GtkTreeModelIface", NULL);
}

value Val_GtkTreeModelIface_option(GtkTreeModelIface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkTreeModelIface(ptr));
}

