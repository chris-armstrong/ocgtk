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

#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gio.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GDBusAnnotationInfo */
#ifndef Val_GDBusAnnotationInfo
#define GDBusAnnotationInfo_val(val) ((GDBusAnnotationInfo*)ext_of_val(val))
#define Val_GDBusAnnotationInfo(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GDBusAnnotationInfo */


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
