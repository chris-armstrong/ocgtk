/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TestDBus */

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


CAMLexport CAMLprim value ml_g_test_dbus_new(value arg1)
{
CAMLparam1(arg1);
GTestDBus *obj = g_test_dbus_new(GioTestDBusFlags_val(arg1));
CAMLreturn(Val_GTestDBus(obj));
}

CAMLexport CAMLprim value ml_g_test_dbus_up(value self)
{
CAMLparam1(self);

g_test_dbus_up(GTestDBus_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_test_dbus_stop(value self)
{
CAMLparam1(self);

g_test_dbus_stop(GTestDBus_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_test_dbus_get_flags(value self)
{
CAMLparam1(self);

GTestDBusFlags result = g_test_dbus_get_flags(GTestDBus_val(self));
CAMLreturn(Val_GioTestDBusFlags(result));
}

CAMLexport CAMLprim value ml_g_test_dbus_get_bus_address(value self)
{
CAMLparam1(self);

const gchar* result = g_test_dbus_get_bus_address(GTestDBus_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_test_dbus_down(value self)
{
CAMLparam1(self);

g_test_dbus_down(GTestDBus_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_test_dbus_add_service_dir(value self, value arg1)
{
CAMLparam2(self, arg1);

g_test_dbus_add_service_dir(GTestDBus_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
