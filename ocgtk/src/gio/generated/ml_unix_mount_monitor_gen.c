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
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"


CAMLexport CAMLprim value ml_g_unix_mount_monitor_new(value unit)
{
CAMLparam1(unit);

GUnixMountMonitor *obj = g_unix_mount_monitor_new();
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GUnixMountMonitor(obj));
}
#if GLIB_CHECK_VERSION(2,18,0)

CAMLexport CAMLprim value ml_g_unix_mount_monitor_set_rate_limit(value self, value arg1)
{
CAMLparam2(self, arg1);

g_unix_mount_monitor_set_rate_limit(GUnixMountMonitor_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

#else

CAMLexport CAMLprim value ml_g_unix_mount_monitor_set_rate_limit(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("UnixMountMonitor requires GLib >= 2.18");
return Val_unit;
}
#endif
