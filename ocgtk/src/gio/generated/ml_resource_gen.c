/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Resource */

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

/* Type-specific conversion macros for GResource */
#ifndef Val_GResource
#define GResource_val(val) ((GResource*)ext_of_val(val))
#define Val_GResource(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GResource */


CAMLexport CAMLprim value ml_g_resource_unref(value self)
{
CAMLparam1(self);

g_resource_unref(GResource_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_resource_ref(value self)
{
CAMLparam1(self);

GResource* result = g_resource_ref(GResource_val(self));
CAMLreturn(Val_GResource(result));
}

CAMLexport CAMLprim value ml_g_resources_unregister(value self)
{
CAMLparam1(self);

g_resources_unregister(GResource_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_resources_register(value self)
{
CAMLparam1(self);

g_resources_register(GResource_val(self));
CAMLreturn(Val_unit);
}
