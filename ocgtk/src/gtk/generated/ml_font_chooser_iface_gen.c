/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FontChooserIface */

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

/* Conversion functions for GtkFontChooserIface (non-opaque record with fields) */
GtkFontChooserIface *GtkFontChooserIface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkFontChooserIface **)Data_custom_val(v);
  } else {
    return (GtkFontChooserIface*)ml_gir_record_ptr_val(v, "GtkFontChooserIface");
  }
}

value Val_GtkFontChooserIface(GtkFontChooserIface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkFontChooserIface), "GtkFontChooserIface", NULL);
}

value Val_GtkFontChooserIface_option(GtkFontChooserIface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkFontChooserIface(ptr));
}

