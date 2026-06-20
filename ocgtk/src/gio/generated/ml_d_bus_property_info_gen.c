/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusPropertyInfo */

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
/* Conversion functions for GDBusPropertyInfo (opaque record with hidden fields) */
GDBusPropertyInfo *GDBusPropertyInfo_val(value v) {
  return (GDBusPropertyInfo *)ml_gir_record_ptr_val(v, "GDBusPropertyInfo");
}

value Val_GDBusPropertyInfo(const GDBusPropertyInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr_with_type(g_dbus_property_info_get_type(), ptr);
}

value Val_GDBusPropertyInfo_option(const GDBusPropertyInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GDBusPropertyInfo(ptr));
}
#endif

#if GLIB_CHECK_VERSION(2,26,0)


CAMLexport CAMLprim value ml_g_dbus_property_info_ref(value self)
{
CAMLparam1(self);

GDBusPropertyInfo* result = g_dbus_property_info_ref(GDBusPropertyInfo_val(self));
CAMLreturn(Val_GDBusPropertyInfo(result));
}
\
CAMLexport CAMLprim value ml_g_d_bus_property_info_get_ref_count(value self)
{
    CAMLparam1(self);
    GDBusPropertyInfo *rec = GDBusPropertyInfo_val(self);
    CAMLreturn(Val_int(rec->ref_count));
}

\
CAMLexport CAMLprim value ml_g_d_bus_property_info_get_name(value self)
{
    CAMLparam1(self);
    GDBusPropertyInfo *rec = GDBusPropertyInfo_val(self);
    CAMLreturn(caml_copy_string(rec->name));
}

\
CAMLexport CAMLprim value ml_g_d_bus_property_info_get_signature(value self)
{
    CAMLparam1(self);
    GDBusPropertyInfo *rec = GDBusPropertyInfo_val(self);
    CAMLreturn(caml_copy_string(rec->signature));
}

\
CAMLexport CAMLprim value ml_g_d_bus_property_info_get_flags(value self)
{
    CAMLparam1(self);
    GDBusPropertyInfo *rec = GDBusPropertyInfo_val(self);
    CAMLreturn(Val_GioDBusPropertyInfoFlags(rec->flags));
}

\
CAMLexport CAMLprim value ml_g_d_bus_property_info_set_ref_count(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GDBusPropertyInfo *rec = GDBusPropertyInfo_val(self);
    rec->ref_count = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_d_bus_property_info_set_name(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GDBusPropertyInfo *rec = GDBusPropertyInfo_val(self);
    g_free(rec->name);
    rec->name = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_d_bus_property_info_set_signature(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GDBusPropertyInfo *rec = GDBusPropertyInfo_val(self);
    g_free(rec->signature);
    rec->signature = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_d_bus_property_info_set_flags(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GDBusPropertyInfo *rec = GDBusPropertyInfo_val(self);
    rec->flags = GioDBusPropertyInfoFlags_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_d_bus_property_info_make(value v_ref_count, value v_name, value v_signature, value v_flags)
{
    CAMLparam4(v_ref_count, v_name, v_signature, v_flags);
    GDBusPropertyInfo *obj = g_new0(GDBusPropertyInfo, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->ref_count = Int_val(v_ref_count);
    obj->name = g_strdup(String_val(v_name));
    obj->signature = g_strdup(String_val(v_signature));
    obj->flags = GioDBusPropertyInfoFlags_val(v_flags);
    CAMLreturn(Val_GDBusPropertyInfo(obj));
}


CAMLprim value ml_gio_d_bus_property_info_get_type(value unit)
{
  CAMLparam1(unit);
  CAMLreturn(Val_long(g_dbus_property_info_get_type()));
}

#else


CAMLexport CAMLprim value ml_g_dbus_property_info_ref(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("DBusPropertyInfo requires GLib >= 2.26");
return Val_unit;
}


#endif
