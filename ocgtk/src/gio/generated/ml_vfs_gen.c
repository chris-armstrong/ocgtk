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


CAMLexport CAMLprim value ml_g_vfs_unregister_uri_scheme(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_vfs_unregister_uri_scheme(GVfs_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_vfs_parse_name(value self, value arg1)
{
CAMLparam2(self, arg1);

GFile* result = g_vfs_parse_name(GVfs_val(self), String_val(arg1));
CAMLreturn(Val_GFile(result));
}

CAMLexport CAMLprim value ml_g_vfs_is_active(value self)
{
CAMLparam1(self);

gboolean result = g_vfs_is_active(GVfs_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_vfs_get_file_for_uri(value self, value arg1)
{
CAMLparam2(self, arg1);

GFile* result = g_vfs_get_file_for_uri(GVfs_val(self), String_val(arg1));
CAMLreturn(Val_GFile(result));
}

CAMLexport CAMLprim value ml_g_vfs_get_file_for_path(value self, value arg1)
{
CAMLparam2(self, arg1);

GFile* result = g_vfs_get_file_for_path(GVfs_val(self), String_val(arg1));
CAMLreturn(Val_GFile(result));
}
