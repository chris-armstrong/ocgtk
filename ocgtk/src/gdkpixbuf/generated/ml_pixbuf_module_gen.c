/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PixbufModule */

#include <gdk-pixbuf/gdk-pixbuf.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk-pixbuf/gdk-pixbuf.h>
/* Include library-specific type conversions and forward declarations */
#include "gdkpixbuf_decls.h"

/* Conversion functions for GdkPixbufModule (opaque record with hidden fields) */
GdkPixbufModule *GdkPixbufModule_val(value v) {
  return *(GdkPixbufModule **)Data_custom_val(v);
}

value Val_GdkPixbufModule(const GdkPixbufModule *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkPixbufModule_option(const GdkPixbufModule *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkPixbufModule(ptr));
}

