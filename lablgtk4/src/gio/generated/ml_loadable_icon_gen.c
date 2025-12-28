/* GENERATED CODE - DO NOT EDIT */
/* C bindings for LoadableIcon */

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


CAMLexport CAMLprim value ml_g_loadable_icon_load_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;
char* out2;

GInputStream* result = g_loadable_icon_load_finish(GLoadableIcon_val(self), GAsyncResult_val(arg1), &out2, &error);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_GInputStream(result));
    Store_field(ret, 1, caml_copy_string(out2));
    if (error == NULL) CAMLreturn(Res_Ok(ret)); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_loadable_icon_load(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;
char* out2;

GInputStream* result = g_loadable_icon_load(GLoadableIcon_val(self), Int_val(arg1), &out2, Option_val(arg2, GCancellable_val, NULL), &error);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_GInputStream(result));
    Store_field(ret, 1, caml_copy_string(out2));
    if (error == NULL) CAMLreturn(Res_Ok(ret)); else CAMLreturn(Res_Error(Val_GError(error)));
}
