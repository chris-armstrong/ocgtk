/* GENERATED CODE - DO NOT EDIT */
/* C bindings for InputMessage */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gio.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for GInputMessage (opaque record with hidden fields) */
GInputMessage *GInputMessage_val(value v) {
  return *(GInputMessage **)Data_custom_val(v);
}

value Val_GInputMessage(const GInputMessage *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GInputMessage_option(const GInputMessage *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GInputMessage(ptr));
}

