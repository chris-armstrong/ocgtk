/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileAttributeInfoList */

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

/* Conversion functions for GFileAttributeInfoList (opaque record with hidden fields) */
GFileAttributeInfoList *GFileAttributeInfoList_val(value v) {
  return *(GFileAttributeInfoList **)Data_custom_val(v);
}

value Val_GFileAttributeInfoList(const GFileAttributeInfoList *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GFileAttributeInfoList_option(const GFileAttributeInfoList *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GFileAttributeInfoList(ptr));
}


CAMLexport CAMLprim value ml_g_file_attribute_info_list_new(value unit)
{
CAMLparam1(unit);

GFileAttributeInfoList *obj = g_file_attribute_info_list_new();

CAMLreturn(Val_GFileAttributeInfoList(obj));
}
CAMLexport CAMLprim value ml_g_file_attribute_info_list_unref(value self)
{
CAMLparam1(self);

g_file_attribute_info_list_unref(GFileAttributeInfoList_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_attribute_info_list_ref(value self)
{
CAMLparam1(self);

GFileAttributeInfoList* result = g_file_attribute_info_list_ref(GFileAttributeInfoList_val(self));
CAMLreturn(Val_GFileAttributeInfoList(result));
}

CAMLexport CAMLprim value ml_g_file_attribute_info_list_lookup(value self, value arg1)
{
CAMLparam2(self, arg1);

const GFileAttributeInfo* result = g_file_attribute_info_list_lookup(GFileAttributeInfoList_val(self), String_val(arg1));
CAMLreturn(Val_GFileAttributeInfo(result));
}

CAMLexport CAMLprim value ml_g_file_attribute_info_list_dup(value self)
{
CAMLparam1(self);

GFileAttributeInfoList* result = g_file_attribute_info_list_dup(GFileAttributeInfoList_val(self));
CAMLreturn(Val_GFileAttributeInfoList(result));
}

CAMLexport CAMLprim value ml_g_file_attribute_info_list_add(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

g_file_attribute_info_list_add(GFileAttributeInfoList_val(self), String_val(arg1), GioFileAttributeType_val(arg2), GioFileAttributeInfoFlags_val(arg3));
CAMLreturn(Val_unit);
}
