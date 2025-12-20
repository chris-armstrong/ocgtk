/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PowerProfileMonitor */

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

/* Type-specific conversion macros for GPowerProfileMonitor */
#ifndef Val_GPowerProfileMonitor
#define GPowerProfileMonitor_val(val) ((GPowerProfileMonitor*)ext_of_val(val))
#define Val_GPowerProfileMonitor(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GPowerProfileMonitor */


CAMLexport CAMLprim value ml_g_power_profile_monitor_get_power_saver_enabled(value self)
{
CAMLparam1(self);

gboolean result = g_power_profile_monitor_get_power_saver_enabled(GPowerProfileMonitor_val(self));
CAMLreturn(Val_bool(result));
}
