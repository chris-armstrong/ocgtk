/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Icon */

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


#if GLIB_CHECK_VERSION(2,20,0)

CAMLexport CAMLprim value ml_g_icon_to_string(value self)
{
CAMLparam1(self);

gchar* result = g_icon_to_string(GIcon_val(self));
CAMLreturn(Val_option_string(result));
}

#else

CAMLexport CAMLprim value ml_g_icon_to_string(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Icon requires GLib >= 2.20");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,38,0)

CAMLexport CAMLprim value ml_g_icon_serialize(value self)
{
CAMLparam1(self);

GVariant* result = g_icon_serialize(GIcon_val(self));
CAMLreturn(Val_option(result, Val_GVariant));
}

#else

CAMLexport CAMLprim value ml_g_icon_serialize(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Icon requires GLib >= 2.38");
return Val_unit;
}
#endif

CAMLexport CAMLprim value ml_g_icon_hash(value self)
{
CAMLparam1(self);

guint result = g_icon_hash(GIcon_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_icon_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_icon_equal(GIcon_val(self), Option_val(arg1, GIcon_val, NULL));
CAMLreturn(Val_bool(result));
}
