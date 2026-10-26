/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileAttributeInfo */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gio.h>
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"

/* Conversion functions for GFileAttributeInfo (opaque record with hidden fields) */
GFileAttributeInfo *GFileAttributeInfo_val(value v) {
  return (GFileAttributeInfo *)ml_gir_record_ptr_val(v, "GFileAttributeInfo");
}

value Val_GFileAttributeInfo(const GFileAttributeInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GFileAttributeInfo_option(const GFileAttributeInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GFileAttributeInfo(ptr));
}

