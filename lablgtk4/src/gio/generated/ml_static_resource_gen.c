/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StaticResource */

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

/* Type-specific conversion macros for GStaticResource */
#ifndef Val_GStaticResource
#define GStaticResource_val(val) ((GStaticResource*)ext_of_val(val))
#define Val_GStaticResource(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GStaticResource */


CAMLexport CAMLprim value ml_g_static_resource_init(value self)
{
CAMLparam1(self);

g_static_resource_init(GStaticResource_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_static_resource_get_resource(value self)
{
CAMLparam1(self);

GResource* result = g_static_resource_get_resource(GStaticResource_val(self));
CAMLreturn(Val_GResource(result));
}

CAMLexport CAMLprim value ml_g_static_resource_fini(value self)
{
CAMLparam1(self);

g_static_resource_fini(GStaticResource_val(self));
CAMLreturn(Val_unit);
}
