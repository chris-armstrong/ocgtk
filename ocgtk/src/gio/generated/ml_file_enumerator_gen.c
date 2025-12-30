/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileEnumerator */

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


CAMLexport CAMLprim value ml_g_file_enumerator_set_pending(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_enumerator_set_pending(GFileEnumerator_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_enumerator_next_file(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

GFileInfo* result = g_file_enumerator_next_file(GFileEnumerator_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_option(result, Val_GFileInfo))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_enumerator_is_closed(value self)
{
CAMLparam1(self);

gboolean result = g_file_enumerator_is_closed(GFileEnumerator_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_enumerator_has_pending(value self)
{
CAMLparam1(self);

gboolean result = g_file_enumerator_has_pending(GFileEnumerator_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_enumerator_get_container(value self)
{
CAMLparam1(self);

GFile* result = g_file_enumerator_get_container(GFileEnumerator_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GFile(result));
}

CAMLexport CAMLprim value ml_g_file_enumerator_get_child(value self, value arg1)
{
CAMLparam2(self, arg1);

GFile* result = g_file_enumerator_get_child(GFileEnumerator_val(self), GFileInfo_val(arg1));
CAMLreturn(Val_GFile(result));
}

CAMLexport CAMLprim value ml_g_file_enumerator_close_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_enumerator_close_finish(GFileEnumerator_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_file_enumerator_close(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_file_enumerator_close(GFileEnumerator_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
