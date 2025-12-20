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

/* Type-specific conversion macros for GFile */
#ifndef Val_GFile
#define GFile_val(val) ((GFile*)ext_of_val(val))
#define Val_GFile(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GFile */


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

CAMLexport CAMLprim value ml_g_file_query_filesystem_info(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

GFileInfo* result = g_file_query_filesystem_info(GFile_val(self), String_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileInfo(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_query_exists(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_file_query_exists(GFile_val(self), Option_val(arg1, GCancellable_val, NULL));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_open_readwrite(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileIOStream* result = g_file_open_readwrite(GFile_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GFileIOStream(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_make_directory_with_parents(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_make_directory_with_parents(GFile_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
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

CAMLexport CAMLprim value ml_g_file_delete(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_delete(GFile_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
