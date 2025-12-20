/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Subprocess */

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

/* Type-specific conversion macros for GSubprocess */
#ifndef Val_GSubprocess
#define GSubprocess_val(val) ((GSubprocess*)ext_of_val(val))
#define Val_GSubprocess(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GSubprocess */


CAMLexport CAMLprim value ml_g_subprocess_wait_check(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_subprocess_wait_check(GSubprocess_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_subprocess_wait(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_subprocess_wait(GSubprocess_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_subprocess_send_signal(value self, value arg1)
{
CAMLparam2(self, arg1);

g_subprocess_send_signal(GSubprocess_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_subprocess_get_term_sig(value self)
{
CAMLparam1(self);

gint result = g_subprocess_get_term_sig(GSubprocess_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_subprocess_get_successful(value self)
{
CAMLparam1(self);

gboolean result = g_subprocess_get_successful(GSubprocess_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_subprocess_get_stdout_pipe(value self)
{
CAMLparam1(self);

GInputStream* result = g_subprocess_get_stdout_pipe(GSubprocess_val(self));
CAMLreturn(Val_option(result, Val_GInputStream));
}

CAMLexport CAMLprim value ml_g_subprocess_get_stdin_pipe(value self)
{
CAMLparam1(self);

GOutputStream* result = g_subprocess_get_stdin_pipe(GSubprocess_val(self));
CAMLreturn(Val_option(result, Val_GOutputStream));
}

CAMLexport CAMLprim value ml_g_subprocess_get_stderr_pipe(value self)
{
CAMLparam1(self);

GInputStream* result = g_subprocess_get_stderr_pipe(GSubprocess_val(self));
CAMLreturn(Val_option(result, Val_GInputStream));
}

CAMLexport CAMLprim value ml_g_subprocess_get_status(value self)
{
CAMLparam1(self);

gint result = g_subprocess_get_status(GSubprocess_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_subprocess_get_if_signaled(value self)
{
CAMLparam1(self);

gboolean result = g_subprocess_get_if_signaled(GSubprocess_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_subprocess_get_if_exited(value self)
{
CAMLparam1(self);

gboolean result = g_subprocess_get_if_exited(GSubprocess_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_subprocess_get_identifier(value self)
{
CAMLparam1(self);

const gchar* result = g_subprocess_get_identifier(GSubprocess_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_subprocess_get_exit_status(value self)
{
CAMLparam1(self);

gint result = g_subprocess_get_exit_status(GSubprocess_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_subprocess_force_exit(value self)
{
CAMLparam1(self);

g_subprocess_force_exit(GSubprocess_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_subprocess_communicate_utf8(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;
char* out3;
char* out4;

gboolean result = g_subprocess_communicate_utf8(GSubprocess_val(self), String_option_val(arg1), Option_val(arg2, GCancellable_val, NULL), &out3, &out4, &error);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, caml_copy_string(out3));
    Store_field(ret, 2, caml_copy_string(out4));
    if (error == NULL) CAMLreturn(Res_Ok(ret)); else CAMLreturn(Res_Error(Val_GError(error)));
}
