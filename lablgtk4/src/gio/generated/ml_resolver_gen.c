/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Resolver */

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


CAMLexport CAMLprim value ml_g_resolver_set_timeout(value self, value arg1)
{
CAMLparam2(self, arg1);

g_resolver_set_timeout(GResolver_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_resolver_set_default(value self)
{
CAMLparam1(self);

g_resolver_set_default(GResolver_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_resolver_lookup_by_address_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gchar* result = g_resolver_lookup_by_address_finish(GResolver_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(caml_copy_string(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_resolver_lookup_by_address(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

gchar* result = g_resolver_lookup_by_address(GResolver_val(self), GInetAddress_val(arg1), Option_val(arg2, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(caml_copy_string(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_resolver_get_timeout(value self)
{
CAMLparam1(self);

unsigned result = g_resolver_get_timeout(GResolver_val(self));
CAMLreturn(Val_int(result));
}
