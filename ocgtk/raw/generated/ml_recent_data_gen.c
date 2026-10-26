/* GENERATED CODE - DO NOT EDIT */
/* C bindings for RecentData */

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
/* Include library-specific type conversions and forward declarations */
#include "gtk_decls.h"

/* Conversion functions for GtkRecentData (opaque record with hidden fields) */
GtkRecentData *GtkRecentData_val(value v) {
  return (GtkRecentData *)ml_gir_record_ptr_val(v, "GtkRecentData");
}

value Val_GtkRecentData(const GtkRecentData *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkRecentData_option(const GtkRecentData *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkRecentData(ptr));
}

