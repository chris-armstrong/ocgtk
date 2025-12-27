/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BuildableParser */

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

/* Conversion functions for GtkBuildableParser (non-opaque record with fields) */
GtkBuildableParser *GtkBuildableParser_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkBuildableParser **)Data_custom_val(v);
  } else {
    return (GtkBuildableParser*)ml_gir_record_ptr_val(v, "GtkBuildableParser");
  }
}

value Val_GtkBuildableParser(GtkBuildableParser *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkBuildableParser), "GtkBuildableParser", NULL);
}

value Val_GtkBuildableParser_option(GtkBuildableParser *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkBuildableParser(ptr));
}

