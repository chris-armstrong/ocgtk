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

/* Type-specific conversion macros for GSubprocessLauncher */
#ifndef Val_GSubprocessLauncher
#define GSubprocessLauncher_val(val) ((GSubprocessLauncher*)ext_of_val(val))
#define Val_GSubprocessLauncher(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GSubprocessLauncher */


CAMLexport CAMLprim value ml_g_subprocess_launcher_new(value arg1)
{
CAMLparam1(arg1);
GSubprocessLauncher *obj = g_subprocess_launcher_new(arg1);
CAMLreturn(Val_GSubprocessLauncher(obj));
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

CAMLexport CAMLprim value ml_g_subprocess_launcher_close(value self)
{
CAMLparam1(self);

g_subprocess_launcher_close(GSubprocessLauncher_val(self));
CAMLreturn(Val_unit);
}
