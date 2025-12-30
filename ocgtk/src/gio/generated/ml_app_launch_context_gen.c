/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AppLaunchContext */

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


CAMLexport CAMLprim value ml_g_app_launch_context_new(value unit)
{
CAMLparam1(unit);
GAppLaunchContext *obj = g_app_launch_context_new();
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GAppLaunchContext(obj));
}

CAMLexport CAMLprim value ml_g_app_launch_context_unsetenv(value self, value arg1)
{
CAMLparam2(self, arg1);

g_app_launch_context_unsetenv(GAppLaunchContext_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_app_launch_context_setenv(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_app_launch_context_setenv(GAppLaunchContext_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_app_launch_context_launch_failed(value self, value arg1)
{
CAMLparam2(self, arg1);

g_app_launch_context_launch_failed(GAppLaunchContext_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
