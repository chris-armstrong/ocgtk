/* Hand-written C stubs for GIO special cases */

#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/fail.h>
#include <gio/gio.h>

/* Add custom bindings not handled by gir_gen here */

/* ml_g_volume_monitor_get: returns the singleton GVolumeMonitor.
   g_volume_monitor_get() is a free function (not a GIR constructor), so we
   hand-write this stub.  Transfer: full — the caller owns the reference. */
#include "wrappers.h"
#include "generated/gio_decls.h"

CAMLprim value ml_g_volume_monitor_get(value unit)
{
    CAMLparam1(unit);
    GVolumeMonitor *monitor = g_volume_monitor_get();
    CAMLreturn(Val_GVolumeMonitor(monitor));
}
