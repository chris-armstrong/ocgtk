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

/* Type-specific conversion macros for GIOModuleScope */
#ifndef Val_GIOModuleScope
#define GIOModuleScope_val(val) ((GIOModuleScope*)ext_of_val(val))
#define Val_GIOModuleScope(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GIOModuleScope */


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
