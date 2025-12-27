/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShortcutManagerInterface */

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

/* Conversion functions for GtkShortcutManagerInterface (non-opaque record with fields) */
GtkShortcutManagerInterface *GtkShortcutManagerInterface_val(value v) {
  if (Tag_val(v) == Custom_tag) {
    return *(GtkShortcutManagerInterface **)Data_custom_val(v);
  } else {
    return (GtkShortcutManagerInterface*)ml_gir_record_ptr_val(v, "GtkShortcutManagerInterface");
  }
}

value Val_GtkShortcutManagerInterface(GtkShortcutManagerInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_alloc((ptr), sizeof(GtkShortcutManagerInterface), "GtkShortcutManagerInterface", NULL);
}

value Val_GtkShortcutManagerInterface_option(GtkShortcutManagerInterface *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkShortcutManagerInterface(ptr));
}

