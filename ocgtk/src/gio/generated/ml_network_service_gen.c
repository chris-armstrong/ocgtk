/* GENERATED CODE - DO NOT EDIT */
/* C bindings for NetworkService */

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


CAMLexport CAMLprim value ml_g_network_service_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GNetworkService *obj = g_network_service_new(String_val(arg1), String_val(arg2), String_val(arg3));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GNetworkService(obj));
}

CAMLexport CAMLprim value ml_g_network_service_set_scheme(value self, value arg1)
{
CAMLparam2(self, arg1);

g_network_service_set_scheme(GNetworkService_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_network_service_get_service(value self)
{
CAMLparam1(self);

const gchar* result = g_network_service_get_service(GNetworkService_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_network_service_get_scheme(value self)
{
CAMLparam1(self);

const gchar* result = g_network_service_get_scheme(GNetworkService_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_network_service_get_protocol(value self)
{
CAMLparam1(self);

const gchar* result = g_network_service_get_protocol(GNetworkService_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_network_service_get_domain(value self)
{
CAMLparam1(self);

const gchar* result = g_network_service_get_domain(GNetworkService_val(self));
CAMLreturn(caml_copy_string(result));
}
