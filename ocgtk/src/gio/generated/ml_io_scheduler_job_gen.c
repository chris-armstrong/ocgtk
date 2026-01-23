/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IOSchedulerJob */

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

/* Conversion functions for GIOSchedulerJob (opaque record with hidden fields) */
GIOSchedulerJob *GIOSchedulerJob_val(value v) {
  return *(GIOSchedulerJob **)Data_custom_val(v);
}

value Val_GIOSchedulerJob(const GIOSchedulerJob *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GIOSchedulerJob_option(const GIOSchedulerJob *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GIOSchedulerJob(ptr));
}

