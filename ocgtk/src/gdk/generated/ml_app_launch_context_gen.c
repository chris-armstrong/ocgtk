/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AppLaunchContext */

#include <gdk/gdk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gdk_app_launch_context_set_icon_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_app_launch_context_set_icon_name(GdkAppLaunchContext_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_app_launch_context_set_desktop(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_app_launch_context_set_desktop(GdkAppLaunchContext_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_app_launch_context_get_display(value self)
{
CAMLparam1(self);

GdkDisplay* result = gdk_app_launch_context_get_display(GdkAppLaunchContext_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GdkDisplay(result));
}
