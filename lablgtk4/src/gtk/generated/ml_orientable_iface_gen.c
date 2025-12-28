/* GENERATED CODE - DO NOT EDIT */
/* C bindings for OrientableIface */

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

/* Conversion functions for GtkOrientableIface (non-opaque record with fields) */
GtkOrientableIface *GtkOrientableIface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkOrientableIface **)Data_custom_val(v);
  } else {
    return (GtkOrientableIface*)ml_gir_record_ptr_val(v, "GtkOrientableIface");
  }
}

value Val_GtkOrientableIface(GtkOrientableIface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkOrientableIface), "GtkOrientableIface", NULL);
}

value Val_GtkOrientableIface_option(GtkOrientableIface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkOrientableIface(ptr));
}

