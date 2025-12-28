/* GENERATED CODE - DO NOT EDIT */
/* C bindings for UnixMountMonitor */

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


CAMLexport CAMLprim value ml_g_unix_mount_monitor_new(value unit)
{
CAMLparam1(unit);
GUnixMountMonitor *obj = g_unix_mount_monitor_new();
CAMLreturn(Val_GUnixMountMonitor(obj));
}

CAMLexport CAMLprim value ml_g_unix_mount_monitor_set_rate_limit(value self, value arg1)
{
CAMLparam2(self, arg1);

g_unix_mount_monitor_set_rate_limit(GUnixMountMonitor_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}
