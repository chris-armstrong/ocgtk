/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileAttributeInfo */

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

/* Conversion functions for GFileAttributeInfo (opaque record with hidden fields) */
GFileAttributeInfo *GFileAttributeInfo_val(value v) {
  return (GFileAttributeInfo *)ml_gir_record_ptr_val(v, "GFileAttributeInfo");
}

value Val_GFileAttributeInfo(const GFileAttributeInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GFileAttributeInfo_option(const GFileAttributeInfo *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GFileAttributeInfo(ptr));
}

\
CAMLexport CAMLprim value ml_g_file_attribute_info_get_name(value self)
{
    CAMLparam1(self);
    GFileAttributeInfo *rec = GFileAttributeInfo_val(self);
    CAMLreturn(caml_copy_string(rec->name));
}

\
CAMLexport CAMLprim value ml_g_file_attribute_info_get_type(value self)
{
    CAMLparam1(self);
    GFileAttributeInfo *rec = GFileAttributeInfo_val(self);
    CAMLreturn(Val_GioFileAttributeType(rec->type));
}

\
CAMLexport CAMLprim value ml_g_file_attribute_info_get_flags(value self)
{
    CAMLparam1(self);
    GFileAttributeInfo *rec = GFileAttributeInfo_val(self);
    CAMLreturn(Val_GioFileAttributeInfoFlags(rec->flags));
}

\
CAMLexport CAMLprim value ml_g_file_attribute_info_set_name(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GFileAttributeInfo *rec = GFileAttributeInfo_val(self);
    g_free(rec->name);
    rec->name = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_file_attribute_info_set_type(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GFileAttributeInfo *rec = GFileAttributeInfo_val(self);
    rec->type = GioFileAttributeType_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_file_attribute_info_set_flags(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GFileAttributeInfo *rec = GFileAttributeInfo_val(self);
    rec->flags = GioFileAttributeInfoFlags_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_g_file_attribute_info_make(value v_name, value v_type, value v_flags)
{
    CAMLparam3(v_name, v_type, v_flags);
    GFileAttributeInfo *obj = g_new0(GFileAttributeInfo, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->name = g_strdup(String_val(v_name));
    obj->type = GioFileAttributeType_val(v_type);
    obj->flags = GioFileAttributeInfoFlags_val(v_flags);
    CAMLreturn(Val_GFileAttributeInfo(obj));
}

