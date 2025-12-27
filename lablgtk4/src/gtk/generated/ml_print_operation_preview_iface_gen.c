/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PrintOperationPreviewIface */

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

/* Conversion functions for GtkPrintOperationPreviewIface (non-opaque record with fields) */
GtkPrintOperationPreviewIface *GtkPrintOperationPreviewIface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkPrintOperationPreviewIface **)Data_custom_val(v);
  } else {
    return (GtkPrintOperationPreviewIface*)ml_gir_record_ptr_val(v, "GtkPrintOperationPreviewIface");
  }
}

value Val_GtkPrintOperationPreviewIface(GtkPrintOperationPreviewIface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkPrintOperationPreviewIface), "GtkPrintOperationPreviewIface", NULL);
}

value Val_GtkPrintOperationPreviewIface_option(GtkPrintOperationPreviewIface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkPrintOperationPreviewIface(ptr));
}

