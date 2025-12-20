/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Vfs */

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

/* Type-specific conversion macros for GVfs */
#ifndef Val_GVfs
#define GVfs_val(val) ((GVfs*)ext_of_val(val))
#define Val_GVfs(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GVfs */


CAMLexport CAMLprim value ml_g_vfs_unregister_uri_scheme(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_vfs_unregister_uri_scheme(GVfs_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_vfs_is_active(value self)
{
CAMLparam1(self);

gboolean result = g_vfs_is_active(GVfs_val(self));
CAMLreturn(Val_bool(result));
}
