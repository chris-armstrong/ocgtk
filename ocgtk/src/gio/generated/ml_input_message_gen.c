/* GENERATED CODE - DO NOT EDIT */
/* C bindings for InputMessage */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gio.h>
#ifdef __linux__
#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
#endif /* __linux__ */
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"

#if GLIB_CHECK_VERSION(2,48,0)
/* Conversion functions for GInputMessage (opaque record with hidden fields) */
GInputMessage *GInputMessage_val(value v) {
  return (GInputMessage *)ml_gir_record_ptr_val(v, "GInputMessage");
}

value Val_GInputMessage(const GInputMessage *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GInputMessage_option(const GInputMessage *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GInputMessage(ptr));
}
#endif

#if GLIB_CHECK_VERSION(2,48,0)

\
CAMLexport CAMLprim value ml_g_input_message_get_address(value self)
{
    CAMLparam1(self);
    GInputMessage *rec = GInputMessage_val(self);
    CAMLreturn(Val_GSocketAddress(rec->address));
}

\
CAMLexport CAMLprim value ml_g_input_message_get_num_vectors(value self)
{
    CAMLparam1(self);
    GInputMessage *rec = GInputMessage_val(self);
    CAMLreturn(Val_int(rec->num_vectors));
}

\
CAMLexport CAMLprim value ml_g_input_message_get_bytes_received(value self)
{
    CAMLparam1(self);
    GInputMessage *rec = GInputMessage_val(self);
    CAMLreturn(Val_gsize(rec->bytes_received));
}

\
CAMLexport CAMLprim value ml_g_input_message_get_flags(value self)
{
    CAMLparam1(self);
    GInputMessage *rec = GInputMessage_val(self);
    CAMLreturn(Val_int(rec->flags));
}

\
CAMLexport CAMLprim value ml_g_input_message_get_num_control_messages(value self)
{
    CAMLparam1(self);
    GInputMessage *rec = GInputMessage_val(self);
    CAMLreturn(Val_int(rec->num_control_messages));
}

\
CAMLexport CAMLprim value ml_g_input_message_set_address(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GInputMessage *rec = GInputMessage_val(self);
    rec->address = GSocketAddress_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_input_message_set_num_vectors(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GInputMessage *rec = GInputMessage_val(self);
    rec->num_vectors = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_input_message_set_bytes_received(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GInputMessage *rec = GInputMessage_val(self);
    rec->bytes_received = Gsize_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_input_message_set_flags(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GInputMessage *rec = GInputMessage_val(self);
    rec->flags = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_input_message_set_num_control_messages(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GInputMessage *rec = GInputMessage_val(self);
    rec->num_control_messages = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_input_message_make(value v_address, value v_num_vectors, value v_bytes_received, value v_flags, value v_num_control_messages)
{
    CAMLparam5(v_address, v_num_vectors, v_bytes_received, v_flags, v_num_control_messages);
    GInputMessage *obj = g_new0(GInputMessage, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->address = GSocketAddress_val(v_address);
    obj->num_vectors = Int_val(v_num_vectors);
    obj->bytes_received = Gsize_val(v_bytes_received);
    obj->flags = Int_val(v_flags);
    obj->num_control_messages = Int_val(v_num_control_messages);
    CAMLreturn(Val_GInputMessage(obj));
}


#else


#endif
