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


CAMLexport CAMLprim value ml_g_dbus_annotation_info_unref(value self)
{
CAMLparam1(self);

g_dbus_annotation_info_unref(GDBusAnnotationInfo_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_dbus_annotation_info_ref(value self)
{
CAMLparam1(self);

GDBusAnnotationInfo* result = g_dbus_annotation_info_ref(GDBusAnnotationInfo_val(self));
CAMLreturn(Val_GDBusAnnotationInfo(result));
}

#else


CAMLexport CAMLprim value ml_g_dbus_annotation_info_ref(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("DBusAnnotationInfo requires GLib >= 2.26");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_dbus_annotation_info_unref(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("DBusAnnotationInfo requires GLib >= 2.26");
return Val_unit;
}


#endif
