/* GENERATED CODE - DO NOT EDIT */
/* C bindings for NetworkMonitor */

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

/* Type-specific conversion macros for GNetworkMonitor */
#ifndef Val_GNetworkMonitor
#define GNetworkMonitor_val(val) ((GNetworkMonitor*)ext_of_val(val))
#define Val_GNetworkMonitor(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GNetworkMonitor */


CAMLexport CAMLprim value ml_g_network_monitor_get_network_metered(value self)
{
CAMLparam1(self);

gboolean result = g_network_monitor_get_network_metered(GNetworkMonitor_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_network_monitor_get_network_available(value self)
{
CAMLparam1(self);

gboolean result = g_network_monitor_get_network_available(GNetworkMonitor_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_network_monitor_get_connectivity(value self)
{
CAMLparam1(self);

GNetworkConnectivity result = g_network_monitor_get_connectivity(GNetworkMonitor_val(self));
CAMLreturn(Val_GioNetworkConnectivity(result));
}
