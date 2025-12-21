/* GENERATED CODE - DO NOT EDIT */
/* C bindings for UnixFDList */

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

/* Type-specific conversion macros for GUnixFDList */
#ifndef Val_GUnixFDList
#define GUnixFDList_val(val) ((GUnixFDList*)ext_of_val(val))
#define Val_GUnixFDList(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GUnixFDList */


CAMLexport CAMLprim value ml_g_unix_fd_list_new(value unit)
{
CAMLparam1(unit);
GUnixFDList *obj = g_unix_fd_list_new();
CAMLreturn(Val_GUnixFDList(obj));
}

CAMLexport CAMLprim value ml_g_unix_fd_list_new_from_array(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GUnixFDList *obj = g_unix_fd_list_new_from_array(arg1, Int_val(arg2));
CAMLreturn(Val_GUnixFDList(obj));
}

CAMLexport CAMLprim value ml_g_unix_fd_list_get_length(value self)
{
CAMLparam1(self);

gint result = g_unix_fd_list_get_length(GUnixFDList_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_unix_fd_list_get(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gint result = g_unix_fd_list_get(GUnixFDList_val(self), Int_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_int(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_unix_fd_list_append(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gint result = g_unix_fd_list_append(GUnixFDList_val(self), Int_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_int(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
