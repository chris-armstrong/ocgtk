/* GENERATED CODE - DO NOT EDIT */
/* C bindings for File */

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


CAMLexport CAMLprim value ml_g_file_unmount_mountable_with_operation_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_unmount_mountable_with_operation_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_unmount_mountable_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_unmount_mountable_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_trash_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_trash_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_trash(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_trash(GFile_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_supports_thread_contexts(value self)
{
CAMLparam1(self);

gboolean result = g_file_supports_thread_contexts(GFile_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_stop_mountable_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_stop_mountable_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_start_mountable_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_start_mountable_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_set_display_name_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFile* result = g_file_set_display_name_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFile(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_set_display_name(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

GFile* result = g_file_set_display_name(GFile_val(self), String_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFile(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_set_attributes_from_info(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
GError *error = NULL;

gboolean result = g_file_set_attributes_from_info(GFile_val(self), GFileInfo_val(arg1), GioFileQueryInfoFlags_val(arg2), Option_val(arg3, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_set_attributes_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;
GFileInfo* out2;

gboolean result = g_file_set_attributes_finish(GFile_val(self), GAsyncResult_val(arg1), &out2, &error);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, Val_GFileInfo(out2));
    if (error == NULL) CAMLreturn(Res_Ok(ret)); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_set_attribute_string(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
GError *error = NULL;

gboolean result = g_file_set_attribute_string(GFile_val(self), String_val(arg1), String_val(arg2), GioFileQueryInfoFlags_val(arg3), Option_val(arg4, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_set_attribute_byte_string(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
GError *error = NULL;

gboolean result = g_file_set_attribute_byte_string(GFile_val(self), String_val(arg1), String_val(arg2), GioFileQueryInfoFlags_val(arg3), Option_val(arg4, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_resolve_relative_path(value self, value arg1)
{
CAMLparam2(self, arg1);

GFile* result = g_file_resolve_relative_path(GFile_val(self), String_val(arg1));
CAMLreturn(Val_GFile(result));
}

CAMLexport CAMLprim value ml_g_file_replace_readwrite_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileIOStream* result = g_file_replace_readwrite_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileIOStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_replace_readwrite(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
GError *error = NULL;

GFileIOStream* result = g_file_replace_readwrite(GFile_val(self), String_option_val(arg1), Bool_val(arg2), GioFileCreateFlags_val(arg3), Option_val(arg4, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileIOStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_replace_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileOutputStream* result = g_file_replace_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileOutputStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_replace_contents_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;
char* out2;

gboolean result = g_file_replace_contents_finish(GFile_val(self), GAsyncResult_val(arg1), &out2, &error);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, caml_copy_string(out2));
    if (error == NULL) CAMLreturn(Res_Ok(ret)); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_replace(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
GError *error = NULL;

GFileOutputStream* result = g_file_replace(GFile_val(self), String_option_val(arg1), Bool_val(arg2), GioFileCreateFlags_val(arg3), Option_val(arg4, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileOutputStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_read_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileInputStream* result = g_file_read_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileInputStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_read(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileInputStream* result = g_file_read(GFile_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileInputStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_query_writable_namespaces(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileAttributeInfoList* result = g_file_query_writable_namespaces(GFile_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileAttributeInfoList(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_query_settable_attributes(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileAttributeInfoList* result = g_file_query_settable_attributes(GFile_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileAttributeInfoList(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_query_info_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileInfo* result = g_file_query_info_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileInfo(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_query_info(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
GError *error = NULL;

GFileInfo* result = g_file_query_info(GFile_val(self), String_val(arg1), GioFileQueryInfoFlags_val(arg2), Option_val(arg3, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileInfo(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_query_filesystem_info_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileInfo* result = g_file_query_filesystem_info_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileInfo(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_query_filesystem_info(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

GFileInfo* result = g_file_query_filesystem_info(GFile_val(self), String_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileInfo(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_query_file_type(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GFileType result = g_file_query_file_type(GFile_val(self), GioFileQueryInfoFlags_val(arg1), Option_val(arg2, GCancellable_val, NULL));
CAMLreturn(Val_GioFileType(result));
}

CAMLexport CAMLprim value ml_g_file_query_exists(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_file_query_exists(GFile_val(self), Option_val(arg1, GCancellable_val, NULL));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_query_default_handler_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GAppInfo* result = g_file_query_default_handler_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GAppInfo(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_query_default_handler(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GAppInfo* result = g_file_query_default_handler(GFile_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GAppInfo(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_poll_mountable_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_poll_mountable_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_peek_path(value self)
{
CAMLparam1(self);

const char* result = g_file_peek_path(GFile_val(self));
CAMLreturn(Val_option(result, caml_copy_string));
}

CAMLexport CAMLprim value ml_g_file_open_readwrite_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileIOStream* result = g_file_open_readwrite_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileIOStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_open_readwrite(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileIOStream* result = g_file_open_readwrite(GFile_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileIOStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_move_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_move_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_mount_mountable_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFile* result = g_file_mount_mountable_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFile(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_mount_enclosing_volume_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_mount_enclosing_volume_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_monitor_file(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

GFileMonitor* result = g_file_monitor_file(GFile_val(self), GioFileMonitorFlags_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileMonitor(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_monitor_directory(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

GFileMonitor* result = g_file_monitor_directory(GFile_val(self), GioFileMonitorFlags_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileMonitor(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_monitor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

GFileMonitor* result = g_file_monitor(GFile_val(self), GioFileMonitorFlags_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileMonitor(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_make_symbolic_link_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_make_symbolic_link_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_make_symbolic_link(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

gboolean result = g_file_make_symbolic_link(GFile_val(self), String_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_make_directory_with_parents(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_make_directory_with_parents(GFile_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_make_directory_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_make_directory_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_make_directory(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_make_directory(GFile_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_is_native(value self)
{
CAMLparam1(self);

gboolean result = g_file_is_native(GFile_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_hash(value self)
{
CAMLparam1(self);

guint result = g_file_hash(GFile_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_file_has_uri_scheme(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_file_has_uri_scheme(GFile_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_has_prefix(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_file_has_prefix(GFile_val(self), GFile_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_has_parent(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_file_has_parent(GFile_val(self), Option_val(arg1, GFile_val, NULL));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_get_uri_scheme(value self)
{
CAMLparam1(self);

char* result = g_file_get_uri_scheme(GFile_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_file_get_uri(value self)
{
CAMLparam1(self);

char* result = g_file_get_uri(GFile_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_file_get_parse_name(value self)
{
CAMLparam1(self);

char* result = g_file_get_parse_name(GFile_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_file_get_parent(value self)
{
CAMLparam1(self);

GFile* result = g_file_get_parent(GFile_val(self));
CAMLreturn(Val_option(result, Val_GFile));
}

CAMLexport CAMLprim value ml_g_file_get_child_for_display_name(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFile* result = g_file_get_child_for_display_name(GFile_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFile(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_get_child(value self, value arg1)
{
CAMLparam2(self, arg1);

GFile* result = g_file_get_child(GFile_val(self), String_val(arg1));
CAMLreturn(Val_GFile(result));
}

CAMLexport CAMLprim value ml_g_file_find_enclosing_mount_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GMount* result = g_file_find_enclosing_mount_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GMount(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_find_enclosing_mount(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GMount* result = g_file_find_enclosing_mount(GFile_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GMount(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_file_equal(GFile_val(self), GFile_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_enumerate_children_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileEnumerator* result = g_file_enumerate_children_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileEnumerator(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_enumerate_children(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
GError *error = NULL;

GFileEnumerator* result = g_file_enumerate_children(GFile_val(self), String_val(arg1), GioFileQueryInfoFlags_val(arg2), Option_val(arg3, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileEnumerator(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_eject_mountable_with_operation_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_eject_mountable_with_operation_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_eject_mountable_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_eject_mountable_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_dup(value self)
{
CAMLparam1(self);

GFile* result = g_file_dup(GFile_val(self));
CAMLreturn(Val_GFile(result));
}

CAMLexport CAMLprim value ml_g_file_delete_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_delete_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_delete(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_delete(GFile_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_create_readwrite_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileIOStream* result = g_file_create_readwrite_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileIOStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_create_readwrite(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

GFileIOStream* result = g_file_create_readwrite(GFile_val(self), GioFileCreateFlags_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileIOStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_create_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileOutputStream* result = g_file_create_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileOutputStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_create(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

GFileOutputStream* result = g_file_create(GFile_val(self), GioFileCreateFlags_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileOutputStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_copy_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_copy_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_copy_attributes(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
GError *error = NULL;

gboolean result = g_file_copy_attributes(GFile_val(self), GFile_val(arg1), GioFileCopyFlags_val(arg2), Option_val(arg3, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_build_attribute_list_for_copy(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

char* result = g_file_build_attribute_list_for_copy(GFile_val(self), GioFileCopyFlags_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(caml_copy_string(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_append_to_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileOutputStream* result = g_file_append_to_finish(GFile_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileOutputStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_append_to(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

GFileOutputStream* result = g_file_append_to(GFile_val(self), GioFileCreateFlags_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileOutputStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
