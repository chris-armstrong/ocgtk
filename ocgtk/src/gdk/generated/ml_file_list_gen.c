/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileList */

#include <gdk/gdk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for GdkFileList (opaque record with hidden fields) */
GdkFileList *GdkFileList_val(value v) {
  return *(GdkFileList **)Data_custom_val(v);
}

value Val_GdkFileList(const GdkFileList *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkFileList_option(const GdkFileList *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkFileList(ptr));
}

