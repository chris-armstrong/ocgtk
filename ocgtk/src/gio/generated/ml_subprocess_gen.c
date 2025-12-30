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


CAMLexport CAMLprim value ml_g_subprocess_wait_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_subprocess_wait_finish(GSubprocess_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_subprocess_wait_check_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_subprocess_wait_check_finish(GSubprocess_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

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
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GInputStream));
}

CAMLexport CAMLprim value ml_g_subprocess_get_stdin_pipe(value self)
{
CAMLparam1(self);

GOutputStream* result = g_subprocess_get_stdin_pipe(GSubprocess_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GOutputStream));
}

CAMLexport CAMLprim value ml_g_subprocess_get_stderr_pipe(value self)
{
CAMLparam1(self);

GInputStream* result = g_subprocess_get_stderr_pipe(GSubprocess_val(self));
if (result) g_object_ref_sink(result);
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

CAMLexport CAMLprim value ml_g_subprocess_communicate_utf8_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;
char* out2;
char* out3;

gboolean result = g_subprocess_communicate_utf8_finish(GSubprocess_val(self), GAsyncResult_val(arg1), &out2, &out3, &error);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, caml_copy_string(out2));
    Store_field(ret, 2, caml_copy_string(out3));
    if (error == NULL) CAMLreturn(Res_Ok(ret)); else CAMLreturn(Res_Error(Val_GError(error)));
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

CAMLexport CAMLprim value ml_gtk_subprocess_get_flags(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GSubprocess *obj = (GSubprocess *)GSubprocess_val(self);
    GSubprocessFlags prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "flags");
if (pspec == NULL) caml_failwith("ml_gtk_subprocess_get_flags: property 'flags' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "flags", &prop_gvalue);
    prop_value = (GSubprocessFlags)g_value_get_flags(&prop_gvalue);

result = Val_GioSubprocessFlags(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
