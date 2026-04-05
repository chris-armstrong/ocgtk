/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PrintBackend */

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

/* Conversion functions for GtkPrintBackend (opaque record with hidden fields) */
GtkPrintBackend *GtkPrintBackend_val(value v) {
  return *(GtkPrintBackend **)Data_custom_val(v);
}

value Val_GtkPrintBackend(const GtkPrintBackend *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkPrintBackend_option(const GtkPrintBackend *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkPrintBackend(ptr));
}

