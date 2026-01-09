/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileInfo */

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


CAMLexport CAMLprim value ml_g_file_info_new(value unit)
{
CAMLparam1(unit);
GFileInfo *obj = g_file_info_new();
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GFileInfo(obj));
}

CAMLexport CAMLprim value ml_g_file_info_unset_attribute_mask(value self)
{
CAMLparam1(self);

g_file_info_unset_attribute_mask(GFileInfo_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_symlink_target(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_info_set_symlink_target(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_symbolic_icon(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_info_set_symbolic_icon(GFileInfo_val(self), GIcon_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_name(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_info_set_name(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_is_symlink(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_info_set_is_symlink(GFileInfo_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_is_hidden(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_info_set_is_hidden(GFileInfo_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_icon(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_info_set_icon(GFileInfo_val(self), GIcon_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_file_type(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_info_set_file_type(GFileInfo_val(self), GioFileType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_edit_name(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_info_set_edit_name(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_display_name(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_info_set_display_name(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_content_type(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_info_set_content_type(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_attribute_string(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_file_info_set_attribute_string(GFileInfo_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_attribute_status(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = g_file_info_set_attribute_status(GFileInfo_val(self), String_val(arg1), GioFileAttributeStatus_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_info_set_attribute_mask(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_info_set_attribute_mask(GFileInfo_val(self), GFileAttributeMatcher_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_attribute_file_path(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_file_info_set_attribute_file_path(GFileInfo_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_attribute_byte_string(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_file_info_set_attribute_byte_string(GFileInfo_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_set_attribute_boolean(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_file_info_set_attribute_boolean(GFileInfo_val(self), String_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_remove_attribute(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_info_remove_attribute(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_has_namespace(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_file_info_has_namespace(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_info_has_attribute(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_file_info_has_attribute(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_symlink_target(value self)
{
CAMLparam1(self);

const char* result = g_file_info_get_symlink_target(GFileInfo_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_symbolic_icon(value self)
{
CAMLparam1(self);

GIcon* result = g_file_info_get_symbolic_icon(GFileInfo_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GIcon));
}

CAMLexport CAMLprim value ml_g_file_info_get_name(value self)
{
CAMLparam1(self);

const char* result = g_file_info_get_name(GFileInfo_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_is_symlink(value self)
{
CAMLparam1(self);

gboolean result = g_file_info_get_is_symlink(GFileInfo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_is_hidden(value self)
{
CAMLparam1(self);

gboolean result = g_file_info_get_is_hidden(GFileInfo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_is_backup(value self)
{
CAMLparam1(self);

gboolean result = g_file_info_get_is_backup(GFileInfo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_icon(value self)
{
CAMLparam1(self);

GIcon* result = g_file_info_get_icon(GFileInfo_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GIcon));
}

CAMLexport CAMLprim value ml_g_file_info_get_file_type(value self)
{
CAMLparam1(self);

GFileType result = g_file_info_get_file_type(GFileInfo_val(self));
CAMLreturn(Val_GioFileType(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_etag(value self)
{
CAMLparam1(self);

const char* result = g_file_info_get_etag(GFileInfo_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_edit_name(value self)
{
CAMLparam1(self);

const char* result = g_file_info_get_edit_name(GFileInfo_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_display_name(value self)
{
CAMLparam1(self);

const char* result = g_file_info_get_display_name(GFileInfo_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_content_type(value self)
{
CAMLparam1(self);

const char* result = g_file_info_get_content_type(GFileInfo_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_attribute_type(value self, value arg1)
{
CAMLparam2(self, arg1);

GFileAttributeType result = g_file_info_get_attribute_type(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_GioFileAttributeType(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_attribute_string(value self, value arg1)
{
CAMLparam2(self, arg1);

const char* result = g_file_info_get_attribute_string(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_attribute_status(value self, value arg1)
{
CAMLparam2(self, arg1);

GFileAttributeStatus result = g_file_info_get_attribute_status(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_GioFileAttributeStatus(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_attribute_file_path(value self, value arg1)
{
CAMLparam2(self, arg1);

const char* result = g_file_info_get_attribute_file_path(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_attribute_byte_string(value self, value arg1)
{
CAMLparam2(self, arg1);

const char* result = g_file_info_get_attribute_byte_string(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_attribute_boolean(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_file_info_get_attribute_boolean(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_info_get_attribute_as_string(value self, value arg1)
{
CAMLparam2(self, arg1);

char* result = g_file_info_get_attribute_as_string(GFileInfo_val(self), String_val(arg1));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_file_info_dup(value self)
{
CAMLparam1(self);

GFileInfo* result = g_file_info_dup(GFileInfo_val(self));
CAMLreturn(Val_GFileInfo(result));
}

CAMLexport CAMLprim value ml_g_file_info_copy_into(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_info_copy_into(GFileInfo_val(self), GFileInfo_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_info_clear_status(value self)
{
CAMLparam1(self);

g_file_info_clear_status(GFileInfo_val(self));
CAMLreturn(Val_unit);
}
