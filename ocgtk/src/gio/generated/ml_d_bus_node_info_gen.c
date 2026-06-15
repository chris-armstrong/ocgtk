/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusNodeInfo */

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
/* Conversion functions for GDBusNodeInfo (opaque record with hidden fields) */
GDBusNodeInfo *GDBusNodeInfo_val(value v) {
  return (GDBusNodeInfo *)ml_gir_record_ptr_val(v, "GDBusNodeInfo");
}

value Val_GDBusNodeInfo(const GDBusNodeInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr_with_type(g_dbus_node_info_get_type(), ptr);
}

value Val_GDBusNodeInfo_option(const GDBusNodeInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GDBusNodeInfo(ptr));
}
#endif

#if GLIB_CHECK_VERSION(2,26,0)


CAMLexport CAMLprim value ml_g_dbus_node_info_new_for_xml(value arg1)
{
CAMLparam1(arg1);
GError *error = NULL;
    
GDBusNodeInfo *obj = g_dbus_node_info_new_for_xml(String_val(arg1), &error);

if (error == NULL) CAMLreturn(Res_Ok(Val_GDBusNodeInfo(obj))); else CAMLreturn(Res_Error(Val_GError(error)));
}
CAMLexport CAMLprim value ml_g_dbus_node_info_ref(value self)
{
CAMLparam1(self);

GDBusNodeInfo* result = g_dbus_node_info_ref(GDBusNodeInfo_val(self));
CAMLreturn(Val_GDBusNodeInfo(result));
}

CAMLexport CAMLprim value ml_g_dbus_node_info_lookup_interface(value self, value arg1)
{
CAMLparam2(self, arg1);

GDBusInterfaceInfo* result = g_dbus_node_info_lookup_interface(GDBusNodeInfo_val(self), String_val(arg1));
CAMLreturn(Val_option(result, Val_GDBusInterfaceInfo));
}
\
CAMLexport CAMLprim value ml_g_d_bus_node_info_get_ref_count(value self)
{
    CAMLparam1(self);
    GDBusNodeInfo *rec = GDBusNodeInfo_val(self);
    CAMLreturn(Val_int(rec->ref_count));
}

\
CAMLexport CAMLprim value ml_g_d_bus_node_info_get_path(value self)
{
    CAMLparam1(self);
    GDBusNodeInfo *rec = GDBusNodeInfo_val(self);
    CAMLreturn(caml_copy_string(rec->path));
}

\
CAMLexport CAMLprim value ml_g_d_bus_node_info_set_ref_count(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GDBusNodeInfo *rec = GDBusNodeInfo_val(self);
    rec->ref_count = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_d_bus_node_info_set_path(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GDBusNodeInfo *rec = GDBusNodeInfo_val(self);
    g_free(rec->path);
    rec->path = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_d_bus_node_info_make(value v_ref_count, value v_path)
{
    CAMLparam2(v_ref_count, v_path);
    GDBusNodeInfo *obj = g_new0(GDBusNodeInfo, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->ref_count = Int_val(v_ref_count);
    obj->path = g_strdup(String_val(v_path));
    CAMLreturn(Val_GDBusNodeInfo(obj));
}


#else


CAMLexport CAMLprim value ml_g_dbus_node_info_new_for_xml(value arg1)
{
CAMLparam1(arg1);
(void)arg1;
caml_failwith("DBusNodeInfo requires GLib >= 2.26");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_dbus_node_info_lookup_interface(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("DBusNodeInfo requires GLib >= 2.26");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_dbus_node_info_ref(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("DBusNodeInfo requires GLib >= 2.26");
return Val_unit;
}


#endif
