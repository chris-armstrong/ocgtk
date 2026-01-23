/* GENERATED CODE - DO NOT EDIT */
/* C bindings for UnixFDMessage */

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


CAMLexport CAMLprim value ml_g_unix_fd_message_new(value unit)
{
CAMLparam1(unit);

GUnixFDMessage *obj = g_unix_fd_message_new();
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GUnixFDMessage(obj));
}
CAMLexport CAMLprim value ml_g_unix_fd_message_new_with_fd_list(value arg1)
{
CAMLparam1(arg1);

GUnixFDMessage *obj = g_unix_fd_message_new_with_fd_list(GUnixFDList_val(arg1));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GUnixFDMessage(obj));
}
CAMLexport CAMLprim value ml_g_unix_fd_message_steal_fds(value self)
{
CAMLparam1(self);
gint out1;

gint* result = g_unix_fd_message_steal_fds(GUnixFDMessage_val(self), &out1);
    int result_length = out1;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, Val_int(result[i]));
    }
    g_free(result);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, ml_result);
    Store_field(ret, 1, Val_int(out1));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_g_unix_fd_message_get_fd_list(value self)
{
CAMLparam1(self);

GUnixFDList* result = g_unix_fd_message_get_fd_list(GUnixFDMessage_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GUnixFDList(result));
}

CAMLexport CAMLprim value ml_g_unix_fd_message_append_fd(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_unix_fd_message_append_fd(GUnixFDMessage_val(self), Int_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
