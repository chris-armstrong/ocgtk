/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ActionEntry */

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

/* Conversion functions for GActionEntry (opaque record with hidden fields) */
GActionEntry *GActionEntry_val(value v) {
  return (GActionEntry *)ml_gir_record_ptr_val(v, "GActionEntry");
}

value Val_GActionEntry(const GActionEntry *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GActionEntry_option(const GActionEntry *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GActionEntry(ptr));
}

\
CAMLexport CAMLprim value ml_g_action_entry_get_name(value self)
{
    CAMLparam1(self);
    GActionEntry *rec = GActionEntry_val(self);
    CAMLreturn(caml_copy_string(rec->name));
}

\
CAMLexport CAMLprim value ml_g_action_entry_get_parameter_type(value self)
{
    CAMLparam1(self);
    GActionEntry *rec = GActionEntry_val(self);
    CAMLreturn(caml_copy_string(rec->parameter_type));
}

\
CAMLexport CAMLprim value ml_g_action_entry_get_state(value self)
{
    CAMLparam1(self);
    GActionEntry *rec = GActionEntry_val(self);
    CAMLreturn(caml_copy_string(rec->state));
}

\
CAMLexport CAMLprim value ml_g_action_entry_set_name(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GActionEntry *rec = GActionEntry_val(self);
    g_free(rec->name);
    rec->name = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_action_entry_set_parameter_type(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GActionEntry *rec = GActionEntry_val(self);
    g_free(rec->parameter_type);
    rec->parameter_type = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_action_entry_set_state(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GActionEntry *rec = GActionEntry_val(self);
    g_free(rec->state);
    rec->state = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_action_entry_make(value v_name, value v_parameter_type, value v_state)
{
    CAMLparam3(v_name, v_parameter_type, v_state);
    GActionEntry *obj = g_new0(GActionEntry, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->name = g_strdup(String_val(v_name));
    obj->parameter_type = g_strdup(String_val(v_parameter_type));
    obj->state = g_strdup(String_val(v_state));
    CAMLreturn(Val_GActionEntry(obj));
}

