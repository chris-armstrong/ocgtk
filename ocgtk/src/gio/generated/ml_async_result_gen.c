/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AsyncResult */

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


#if GLIB_CHECK_VERSION(2,34,0)

CAMLexport CAMLprim value ml_g_async_result_legacy_propagate_error(value self)
{
CAMLparam1(self);
GError *error = NULL;

gboolean result = g_async_result_legacy_propagate_error(GAsyncResult_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

#else

CAMLexport CAMLprim value ml_g_async_result_legacy_propagate_error(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("AsyncResult requires GLib >= 2.34");
return Val_unit;
}
#endif

CAMLexport CAMLprim value ml_g_async_result_get_source_object(value self)
{
CAMLparam1(self);

GObject* result = g_async_result_get_source_object(GAsyncResult_val(self));
CAMLreturn(Val_option(result, ml_gobject_val_of_ext));
}
