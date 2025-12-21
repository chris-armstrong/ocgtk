/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SocketControlMessage */

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

/* Type-specific conversion macros for GSocketControlMessage */
#ifndef Val_GSocketControlMessage
#define GSocketControlMessage_val(val) ((GSocketControlMessage*)ext_of_val(val))
#define Val_GSocketControlMessage(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GSocketControlMessage */


CAMLexport CAMLprim value ml_g_socket_control_message_get_msg_type(value self)
{
CAMLparam1(self);

int result = g_socket_control_message_get_msg_type(GSocketControlMessage_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_socket_control_message_get_level(value self)
{
CAMLparam1(self);

int result = g_socket_control_message_get_level(GSocketControlMessage_val(self));
CAMLreturn(Val_int(result));
}
