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

/* Type-specific conversion macros for GUnixFDMessage */
#ifndef Val_GUnixFDMessage
#define GUnixFDMessage_val(val) ((GUnixFDMessage*)ext_of_val(val))
#define Val_GUnixFDMessage(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GUnixFDMessage */


CAMLexport CAMLprim value ml_g_unix_fd_message_new(value unit)
{
CAMLparam1(unit);
GUnixFDMessage *obj = g_unix_fd_message_new();
CAMLreturn(Val_GUnixFDMessage(obj));
}

CAMLexport CAMLprim value ml_g_unix_fd_message_new_with_fd_list(value arg1)
{
CAMLparam1(arg1);
GUnixFDMessage *obj = g_unix_fd_message_new_with_fd_list(GUnixFDList_val(arg1));
CAMLreturn(Val_GUnixFDMessage(obj));
}

CAMLexport CAMLprim value ml_g_unix_fd_message_get_fd_list(value self)
{
CAMLparam1(self);

GUnixFDList* result = g_unix_fd_message_get_fd_list(GUnixFDMessage_val(self));
CAMLreturn(Val_GUnixFDList(result));
}

CAMLexport CAMLprim value ml_g_unix_fd_message_append_fd(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_unix_fd_message_append_fd(GUnixFDMessage_val(self), Int_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
