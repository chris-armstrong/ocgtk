/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileMonitor */

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

/* Type-specific conversion macros for GFileMonitor */
#ifndef Val_GFileMonitor
#define GFileMonitor_val(val) ((GFileMonitor*)ext_of_val(val))
#define Val_GFileMonitor(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GFileMonitor */


CAMLexport CAMLprim value ml_g_file_monitor_set_rate_limit(value self, value arg1)
{
CAMLparam2(self, arg1);

g_file_monitor_set_rate_limit(GFileMonitor_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_file_monitor_is_cancelled(value self)
{
CAMLparam1(self);

gboolean result = g_file_monitor_is_cancelled(GFileMonitor_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_file_monitor_cancel(value self)
{
CAMLparam1(self);

gboolean result = g_file_monitor_cancel(GFileMonitor_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_file_monitor_get_cancelled(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GFileMonitor *obj = (GFileMonitor *)GFileMonitor_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "cancelled");
if (pspec == NULL) caml_failwith("ml_gtk_file_monitor_get_cancelled: property 'cancelled' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "cancelled", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
