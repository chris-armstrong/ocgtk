/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IOExtensionPoint */

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

/* Conversion functions for GIOExtensionPoint (opaque record with hidden fields) */
GIOExtensionPoint *GIOExtensionPoint_val(value v) {
  return *(GIOExtensionPoint **)Data_custom_val(v);
}

value Val_GIOExtensionPoint(const GIOExtensionPoint *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GIOExtensionPoint_option(const GIOExtensionPoint *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GIOExtensionPoint(ptr));
}


CAMLexport CAMLprim value ml_g_io_extension_point_set_required_type(value self, value arg1)
{
CAMLparam2(self, arg1);

g_io_extension_point_set_required_type(GIOExtensionPoint_val(self), GType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_io_extension_point_get_required_type(value self)
{
CAMLparam1(self);

GType result = g_io_extension_point_get_required_type(GIOExtensionPoint_val(self));
CAMLreturn(Val_GType(result));
}

CAMLexport CAMLprim value ml_g_io_extension_point_get_extensions(value self)
{
CAMLparam1(self);

CAMLlocal3(result, item, cell);
    GList* c_result = g_io_extension_point_get_extensions(GIOExtensionPoint_val(self));
Val_GList_with(c_result, result, item, cell, Val_GIOExtension((gpointer)_tmp->data));
    g_list_free(c_result);
    CAMLreturn(result);
}

CAMLexport CAMLprim value ml_g_io_extension_point_get_extension_by_name(value self, value arg1)
{
CAMLparam2(self, arg1);

GIOExtension* result = g_io_extension_point_get_extension_by_name(GIOExtensionPoint_val(self), String_val(arg1));
CAMLreturn(Val_GIOExtension(result));
}
