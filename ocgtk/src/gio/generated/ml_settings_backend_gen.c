/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SettingsBackend */

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


CAMLexport CAMLprim value ml_g_settings_backend_writable_changed(value self, value arg1)
{
CAMLparam2(self, arg1);

g_settings_backend_writable_changed(GSettingsBackend_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_settings_backend_path_writable_changed(value self, value arg1)
{
CAMLparam2(self, arg1);

g_settings_backend_path_writable_changed(GSettingsBackend_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
