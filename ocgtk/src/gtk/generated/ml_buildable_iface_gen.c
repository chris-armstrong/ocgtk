/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BuildableIface */

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

/* Conversion functions for GtkBuildableIface (non-opaque record with fields) */
GtkBuildableIface *GtkBuildableIface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkBuildableIface **)Data_custom_val(v);
  } else {
    return (GtkBuildableIface*)ml_gir_record_ptr_val(v, "GtkBuildableIface");
  }
}

value Val_GtkBuildableIface(GtkBuildableIface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkBuildableIface), "GtkBuildableIface", NULL);
}

value Val_GtkBuildableIface_option(GtkBuildableIface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkBuildableIface(ptr));
}

