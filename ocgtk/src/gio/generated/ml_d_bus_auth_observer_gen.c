/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DBusAuthObserver */

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


CAMLexport CAMLprim value ml_g_dbus_auth_observer_new(value unit)
{
CAMLparam1(unit);
GDBusAuthObserver *obj = g_dbus_auth_observer_new();
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GDBusAuthObserver(obj));
}

CAMLexport CAMLprim value ml_g_dbus_auth_observer_authorize_authenticated_peer(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = g_dbus_auth_observer_authorize_authenticated_peer(GDBusAuthObserver_val(self), GIOStream_val(arg1), Option_val(arg2, GCredentials_val, NULL));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_dbus_auth_observer_allow_mechanism(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_dbus_auth_observer_allow_mechanism(GDBusAuthObserver_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}
