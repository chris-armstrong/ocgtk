/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IOModule */

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

/* Type-specific conversion macros for GIOModule */
#ifndef Val_GIOModule
#define GIOModule_val(val) ((GIOModule*)ext_of_val(val))
#define Val_GIOModule(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GIOModule */


CAMLexport CAMLprim value ml_g_io_module_new(value arg1)
{
CAMLparam1(arg1);
GIOModule *obj = g_io_module_new(arg1);
CAMLreturn(Val_GIOModule(obj));
}

CAMLexport CAMLprim value ml_g_io_module_unload(value self)
{
CAMLparam1(self);

g_io_module_unload(GIOModule_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_io_module_load(value self)
{
CAMLparam1(self);

g_io_module_load(GIOModule_val(self));
CAMLreturn(Val_unit);
}
