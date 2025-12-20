/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SrvTarget */

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

/* Type-specific conversion macros for GSrvTarget */
#ifndef Val_GSrvTarget
#define GSrvTarget_val(val) ((GSrvTarget*)ext_of_val(val))
#define Val_GSrvTarget(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GSrvTarget */


CAMLexport CAMLprim value ml_g_srv_target_new(value arg1, value arg2, value arg3, value arg4)
{
CAMLparam4(arg1, arg2, arg3, arg4);
GSrvTarget *obj = g_srv_target_new(String_val(arg1), arg2, arg3, arg4);
CAMLreturn(Val_GSrvTarget(obj));
}

CAMLexport CAMLprim value ml_g_srv_target_get_hostname(value self)
{
CAMLparam1(self);

const gchar* result = g_srv_target_get_hostname(GSrvTarget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_srv_target_free(value self)
{
CAMLparam1(self);

g_srv_target_free(GSrvTarget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_srv_target_copy(value self)
{
CAMLparam1(self);

GSrvTarget* result = g_srv_target_copy(GSrvTarget_val(self));
CAMLreturn(Val_GSrvTarget(result));
}
