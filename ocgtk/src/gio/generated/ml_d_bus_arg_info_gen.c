/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusArgInfo */

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

#if GLIB_CHECK_VERSION(2,26,0)
/* Conversion functions for GDBusArgInfo (opaque record with hidden fields) */
GDBusArgInfo *GDBusArgInfo_val(value v) {
  return (GDBusArgInfo *)ml_gir_record_ptr_val(v, "GDBusArgInfo");
}

value Val_GDBusArgInfo(const GDBusArgInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr_with_type(g_dbus_arg_info_get_type(), ptr);
}

value Val_GDBusArgInfo_option(const GDBusArgInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GDBusArgInfo(ptr));
}
#endif

#if GLIB_CHECK_VERSION(2,26,0)


CAMLexport CAMLprim value ml_g_dbus_arg_info_ref(value self)
{
CAMLparam1(self);

GDBusArgInfo* result = g_dbus_arg_info_ref(GDBusArgInfo_val(self));
CAMLreturn(Val_GDBusArgInfo(result));
}
\
CAMLexport CAMLprim value ml_g_d_bus_arg_info_get_ref_count(value self)
{
    CAMLparam1(self);
    GDBusArgInfo *rec = GDBusArgInfo_val(self);
    CAMLreturn(Val_int(rec->ref_count));
}

\
CAMLexport CAMLprim value ml_g_d_bus_arg_info_get_name(value self)
{
    CAMLparam1(self);
    GDBusArgInfo *rec = GDBusArgInfo_val(self);
    CAMLreturn(caml_copy_string(rec->name));
}

\
CAMLexport CAMLprim value ml_g_d_bus_arg_info_get_signature(value self)
{
    CAMLparam1(self);
    GDBusArgInfo *rec = GDBusArgInfo_val(self);
    CAMLreturn(caml_copy_string(rec->signature));
}

\
CAMLexport CAMLprim value ml_g_d_bus_arg_info_set_ref_count(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GDBusArgInfo *rec = GDBusArgInfo_val(self);
    rec->ref_count = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_d_bus_arg_info_set_name(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GDBusArgInfo *rec = GDBusArgInfo_val(self);
    g_free(rec->name);
    rec->name = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_d_bus_arg_info_set_signature(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GDBusArgInfo *rec = GDBusArgInfo_val(self);
    g_free(rec->signature);
    rec->signature = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_d_bus_arg_info_make(value v_ref_count, value v_name, value v_signature)
{
    CAMLparam3(v_ref_count, v_name, v_signature);
    GDBusArgInfo *obj = g_new0(GDBusArgInfo, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->ref_count = Int_val(v_ref_count);
    obj->name = g_strdup(String_val(v_name));
    obj->signature = g_strdup(String_val(v_signature));
    CAMLreturn(Val_GDBusArgInfo(obj));
}


CAMLprim value ml_gio_d_bus_arg_info_get_type(value unit)
{
  CAMLparam1(unit);
  CAMLreturn(Val_long(g_dbus_arg_info_get_type()));
}

#else


CAMLexport CAMLprim value ml_g_dbus_arg_info_ref(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("DBusArgInfo requires GLib >= 2.26");
return Val_unit;
}


#endif
