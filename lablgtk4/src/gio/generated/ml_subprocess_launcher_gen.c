/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SubprocessLauncher */

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


CAMLexport CAMLprim value ml_g_subprocess_launcher_new(value arg1)
{
CAMLparam1(arg1);
GSubprocessLauncher *obj = g_subprocess_launcher_new(GioSubprocessFlags_val(arg1));
CAMLreturn(Val_GSubprocessLauncher(obj));
}

CAMLexport CAMLprim value ml_g_subprocess_launcher_unsetenv(value self, value arg1)
{
CAMLparam2(self, arg1);

g_subprocess_launcher_unsetenv(GSubprocessLauncher_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_subprocess_launcher_take_stdout_fd(value self, value arg1)
{
CAMLparam2(self, arg1);

g_subprocess_launcher_take_stdout_fd(GSubprocessLauncher_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_subprocess_launcher_take_stdin_fd(value self, value arg1)
{
CAMLparam2(self, arg1);

g_subprocess_launcher_take_stdin_fd(GSubprocessLauncher_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_subprocess_launcher_take_stderr_fd(value self, value arg1)
{
CAMLparam2(self, arg1);

g_subprocess_launcher_take_stderr_fd(GSubprocessLauncher_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_subprocess_launcher_take_fd(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_subprocess_launcher_take_fd(GSubprocessLauncher_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_subprocess_launcher_setenv(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

g_subprocess_launcher_setenv(GSubprocessLauncher_val(self), String_val(arg1), String_val(arg2), Bool_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_subprocess_launcher_set_stdout_file_path(value self, value arg1)
{
CAMLparam2(self, arg1);

g_subprocess_launcher_set_stdout_file_path(GSubprocessLauncher_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_subprocess_launcher_set_stdin_file_path(value self, value arg1)
{
CAMLparam2(self, arg1);

g_subprocess_launcher_set_stdin_file_path(GSubprocessLauncher_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_subprocess_launcher_set_stderr_file_path(value self, value arg1)
{
CAMLparam2(self, arg1);

g_subprocess_launcher_set_stderr_file_path(GSubprocessLauncher_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_subprocess_launcher_set_flags(value self, value arg1)
{
CAMLparam2(self, arg1);

g_subprocess_launcher_set_flags(GSubprocessLauncher_val(self), GioSubprocessFlags_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_subprocess_launcher_set_cwd(value self, value arg1)
{
CAMLparam2(self, arg1);

g_subprocess_launcher_set_cwd(GSubprocessLauncher_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_subprocess_launcher_getenv(value self, value arg1)
{
CAMLparam2(self, arg1);

const gchar* result = g_subprocess_launcher_getenv(GSubprocessLauncher_val(self), String_val(arg1));
CAMLreturn(Val_option(result, caml_copy_string));
}

CAMLexport CAMLprim value ml_g_subprocess_launcher_close(value self)
{
CAMLparam1(self);

g_subprocess_launcher_close(GSubprocessLauncher_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_subprocess_launcher_get_flags(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GSubprocessLauncher *obj = (GSubprocessLauncher *)GSubprocessLauncher_val(self);
    GSubprocessFlags prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "flags");
if (pspec == NULL) caml_failwith("ml_gtk_subprocess_launcher_get_flags: property 'flags' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "flags", &prop_gvalue);
    prop_value = (GSubprocessFlags)g_value_get_flags(&prop_gvalue);

result = Val_GioSubprocessFlags(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
