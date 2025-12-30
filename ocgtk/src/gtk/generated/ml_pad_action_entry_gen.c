/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PadActionEntry */

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

/* Conversion functions for GtkPadActionEntry (non-opaque record with fields) */
GtkPadActionEntry *GtkPadActionEntry_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkPadActionEntry **)Data_custom_val(v);
  } else {
    return (GtkPadActionEntry*)ml_gir_record_ptr_val(v, "GtkPadActionEntry");
  }
}

value Val_GtkPadActionEntry(GtkPadActionEntry *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkPadActionEntry), "GtkPadActionEntry", NULL);
}

value Val_GtkPadActionEntry_option(GtkPadActionEntry *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkPadActionEntry(ptr));
}

