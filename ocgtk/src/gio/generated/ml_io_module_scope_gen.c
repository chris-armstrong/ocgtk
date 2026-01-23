/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IOModuleScope */

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

/* Conversion functions for GIOModuleScope (opaque record with hidden fields) */
GIOModuleScope *GIOModuleScope_val(value v) {
  return *(GIOModuleScope **)Data_custom_val(v);
}

value Val_GIOModuleScope(const GIOModuleScope *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GIOModuleScope_option(const GIOModuleScope *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GIOModuleScope(ptr));
}


CAMLexport CAMLprim value ml_g_io_module_scope_free(value self)
{
CAMLparam1(self);

g_io_module_scope_free(GIOModuleScope_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_io_module_scope_block(value self, value arg1)
{
CAMLparam2(self, arg1);

g_io_module_scope_block(GIOModuleScope_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
