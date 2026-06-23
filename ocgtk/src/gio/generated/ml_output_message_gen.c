/* GENERATED CODE - DO NOT EDIT */
/* C bindings for OutputMessage */

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

#if GLIB_CHECK_VERSION(2,44,0)
/* Conversion functions for GOutputMessage (opaque record with hidden fields) */
GOutputMessage *GOutputMessage_val(value v) {
  return (GOutputMessage *)ml_gir_record_ptr_val(v, "GOutputMessage");
}

value Val_GOutputMessage(const GOutputMessage *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GOutputMessage_option(const GOutputMessage *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GOutputMessage(ptr));
}
#endif

#if GLIB_CHECK_VERSION(2,44,0)

\
CAMLexport CAMLprim value ml_g_output_message_get_address(value self)
{
    CAMLparam1(self);
    GOutputMessage *rec = GOutputMessage_val(self);
    CAMLreturn(Val_GSocketAddress(rec->address));
}

\
CAMLexport CAMLprim value ml_g_output_message_get_vectors(value self)
{
    CAMLparam1(self);
    GOutputMessage *rec = GOutputMessage_val(self);
    CAMLreturn(Val_GOutputVector(rec->vectors));
}

\
CAMLexport CAMLprim value ml_g_output_message_get_num_vectors(value self)
{
    CAMLparam1(self);
    GOutputMessage *rec = GOutputMessage_val(self);
    CAMLreturn(Val_int(rec->num_vectors));
}

\
CAMLexport CAMLprim value ml_g_output_message_get_bytes_sent(value self)
{
    CAMLparam1(self);
    GOutputMessage *rec = GOutputMessage_val(self);
    CAMLreturn(Val_int(rec->bytes_sent));
}

\
CAMLexport CAMLprim value ml_g_output_message_get_num_control_messages(value self)
{
    CAMLparam1(self);
    GOutputMessage *rec = GOutputMessage_val(self);
    CAMLreturn(Val_int(rec->num_control_messages));
}

\
CAMLexport CAMLprim value ml_g_output_message_set_address(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GOutputMessage *rec = GOutputMessage_val(self);
    rec->address = GSocketAddress_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_output_message_set_vectors(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GOutputMessage *rec = GOutputMessage_val(self);
    rec->vectors = GOutputVector_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_output_message_set_num_vectors(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GOutputMessage *rec = GOutputMessage_val(self);
    rec->num_vectors = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_output_message_set_bytes_sent(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GOutputMessage *rec = GOutputMessage_val(self);
    rec->bytes_sent = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_output_message_set_num_control_messages(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GOutputMessage *rec = GOutputMessage_val(self);
    rec->num_control_messages = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_output_message_make(value v_address, value v_vectors, value v_num_vectors, value v_bytes_sent, value v_num_control_messages)
{
    CAMLparam5(v_address, v_vectors, v_num_vectors, v_bytes_sent, v_num_control_messages);
    GOutputMessage *obj = g_new0(GOutputMessage, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->address = GSocketAddress_val(v_address);
    obj->vectors = GOutputVector_val(v_vectors);
    obj->num_vectors = Int_val(v_num_vectors);
    obj->bytes_sent = Int_val(v_bytes_sent);
    obj->num_control_messages = Int_val(v_num_control_messages);
    CAMLreturn(Val_GOutputMessage(obj));
}


#else


#endif
