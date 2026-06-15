/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusAnnotationInfo */

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
/* Conversion functions for GDBusAnnotationInfo (opaque record with hidden fields) */
GDBusAnnotationInfo *GDBusAnnotationInfo_val(value v) {
  return (GDBusAnnotationInfo *)ml_gir_record_ptr_val(v, "GDBusAnnotationInfo");
}

value Val_GDBusAnnotationInfo(const GDBusAnnotationInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr_with_type(g_dbus_annotation_info_get_type(), ptr);
}

value Val_GDBusAnnotationInfo_option(const GDBusAnnotationInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GDBusAnnotationInfo(ptr));
}
#endif

#if GLIB_CHECK_VERSION(2,26,0)


CAMLexport CAMLprim value ml_g_dbus_annotation_info_ref(value self)
{
CAMLparam1(self);

GDBusAnnotationInfo* result = g_dbus_annotation_info_ref(GDBusAnnotationInfo_val(self));
CAMLreturn(Val_GDBusAnnotationInfo(result));
}
\
CAMLexport CAMLprim value ml_g_d_bus_annotation_info_get_ref_count(value self)
{
    CAMLparam1(self);
    GDBusAnnotationInfo *rec = GDBusAnnotationInfo_val(self);
    CAMLreturn(Val_int(rec->ref_count));
}

\
CAMLexport CAMLprim value ml_g_d_bus_annotation_info_get_key(value self)
{
    CAMLparam1(self);
    GDBusAnnotationInfo *rec = GDBusAnnotationInfo_val(self);
    CAMLreturn(caml_copy_string(rec->key));
}

\
CAMLexport CAMLprim value ml_g_d_bus_annotation_info_get_value(value self)
{
    CAMLparam1(self);
    GDBusAnnotationInfo *rec = GDBusAnnotationInfo_val(self);
    CAMLreturn(caml_copy_string(rec->value));
}

\
CAMLexport CAMLprim value ml_g_d_bus_annotation_info_set_ref_count(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GDBusAnnotationInfo *rec = GDBusAnnotationInfo_val(self);
    rec->ref_count = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_d_bus_annotation_info_set_key(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GDBusAnnotationInfo *rec = GDBusAnnotationInfo_val(self);
    g_free(rec->key);
    rec->key = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_d_bus_annotation_info_set_value(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GDBusAnnotationInfo *rec = GDBusAnnotationInfo_val(self);
    g_free(rec->value);
    rec->value = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_d_bus_annotation_info_make(value v_ref_count, value v_key, value v_value)
{
    CAMLparam3(v_ref_count, v_key, v_value);
    GDBusAnnotationInfo *obj = g_new0(GDBusAnnotationInfo, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->ref_count = Int_val(v_ref_count);
    obj->key = g_strdup(String_val(v_key));
    obj->value = g_strdup(String_val(v_value));
    CAMLreturn(Val_GDBusAnnotationInfo(obj));
}


#else


CAMLexport CAMLprim value ml_g_dbus_annotation_info_ref(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("DBusAnnotationInfo requires GLib >= 2.26");
return Val_unit;
}


#endif
