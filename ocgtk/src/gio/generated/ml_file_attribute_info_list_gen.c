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

/* Type-specific conversion macros for GFileAttributeInfoList */
#ifndef Val_GFileAttributeInfoList
#define GFileAttributeInfoList_val(val) ((GFileAttributeInfoList*)ext_of_val(val))
#define Val_GFileAttributeInfoList(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GFileAttributeInfoList */


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

CAMLexport CAMLprim value ml_g_file_attribute_info_list_dup(value self)
{
CAMLparam1(self);

GFileAttributeInfoList* result = g_file_attribute_info_list_dup(GFileAttributeInfoList_val(self));
CAMLreturn(Val_GFileAttributeInfoList(result));
}
