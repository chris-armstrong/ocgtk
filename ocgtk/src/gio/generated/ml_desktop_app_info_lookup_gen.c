/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DesktopAppInfoLookup */

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


CAMLexport CAMLprim value ml_g_desktop_app_info_lookup_get_default_for_uri_scheme(value self, value arg1)
{
CAMLparam2(self, arg1);

GAppInfo* result = g_desktop_app_info_lookup_get_default_for_uri_scheme(GDesktopAppInfoLookup_val(self), String_val(arg1));
CAMLreturn(Val_option(result, Val_GAppInfo));
}
