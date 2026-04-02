/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Action */

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


#if GLIB_CHECK_VERSION(2,28,0)

CAMLexport CAMLprim value ml_g_action_get_name(value self)
{
CAMLparam1(self);

const gchar* result = g_action_get_name(GAction_val(self));
CAMLreturn(caml_copy_string(result));
}

#else

CAMLexport CAMLprim value ml_g_action_get_name(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Action requires GLib >= 2.28");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,28,0)

CAMLexport CAMLprim value ml_g_action_get_enabled(value self)
{
CAMLparam1(self);

gboolean result = g_action_get_enabled(GAction_val(self));
CAMLreturn(Val_bool(result));
}

#else

CAMLexport CAMLprim value ml_g_action_get_enabled(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Action requires GLib >= 2.28");
return Val_unit;
}
#endif
