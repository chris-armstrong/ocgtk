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

#include <gio/gio.h>
#ifdef __linux__
#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
#endif /* __linux__ */
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"

#if GLIB_CHECK_VERSION(2,30,0)
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
#endif

#if GLIB_CHECK_VERSION(2,30,0)


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

#else


CAMLexport CAMLprim value ml_g_io_module_scope_block(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("IOModuleScope requires GLib >= 2.30");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_io_module_scope_free(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("IOModuleScope requires GLib >= 2.30");
return Val_unit;
}


#endif
