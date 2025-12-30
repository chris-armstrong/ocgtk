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
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_g_icon_to_string(value self)
{
CAMLparam1(self);

gchar* result = g_icon_to_string(GIcon_val(self));
CAMLreturn(Val_option_string(result));
}

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
