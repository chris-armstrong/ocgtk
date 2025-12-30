/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BuilderScopeInterface */

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

/* Conversion functions for GtkBuilderScopeInterface (non-opaque record with fields) */
GtkBuilderScopeInterface *GtkBuilderScopeInterface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkBuilderScopeInterface **)Data_custom_val(v);
  } else {
    return (GtkBuilderScopeInterface*)ml_gir_record_ptr_val(v, "GtkBuilderScopeInterface");
  }
}

value Val_GtkBuilderScopeInterface(GtkBuilderScopeInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkBuilderScopeInterface), "GtkBuilderScopeInterface", NULL);
}

value Val_GtkBuilderScopeInterface_option(GtkBuilderScopeInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkBuilderScopeInterface(ptr));
}

