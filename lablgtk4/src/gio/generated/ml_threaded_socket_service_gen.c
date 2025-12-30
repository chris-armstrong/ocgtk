/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ThreadedSocketService */

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


CAMLexport CAMLprim value ml_g_threaded_socket_service_new(value arg1)
{
CAMLparam1(arg1);
GThreadedSocketService *obj = g_threaded_socket_service_new(Int_val(arg1));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GThreadedSocketService(obj));
}

CAMLexport CAMLprim value ml_gtk_threaded_socket_service_get_max_threads(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GThreadedSocketService *obj = (GThreadedSocketService *)GThreadedSocketService_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-threads");
if (pspec == NULL) caml_failwith("ml_gtk_threaded_socket_service_get_max_threads: property 'max-threads' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "max-threads", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
