/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SimplePermission */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gio.h>
#ifdef __linux__
#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
#endif /* __linux__ */
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"


#if GLIB_CHECK_VERSION(2,26,0)

CAMLexport CAMLprim value ml_g_simple_permission_new(value arg1)
{
CAMLparam1(arg1);

GSimplePermission *obj = g_simple_permission_new(Bool_val(arg1));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GSimplePermission(obj));
}
#else

CAMLexport CAMLprim value ml_g_simple_permission_new(value arg1)
{
CAMLparam1(arg1);
(void)arg1;
caml_failwith("SimplePermission requires GLib >= 2.26");
return Val_unit;
}
#endif
