/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Emblem */

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

/* Type-specific conversion macros for GEmblem */
#ifndef Val_GEmblem
#define GEmblem_val(val) ((GEmblem*)ext_of_val(val))
#define Val_GEmblem(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GEmblem */


CAMLexport CAMLprim value ml_g_emblem_new(value arg1)
{
CAMLparam1(arg1);
GEmblem *obj = g_emblem_new(arg1);
CAMLreturn(Val_GEmblem(obj));
}

CAMLexport CAMLprim value ml_g_emblem_new_with_origin(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GEmblem *obj = g_emblem_new_with_origin(arg1, GioEmblemOrigin_val(arg2));
CAMLreturn(Val_GEmblem(obj));
}

CAMLexport CAMLprim value ml_g_emblem_get_origin(value self)
{
CAMLparam1(self);

GEmblemOrigin result = g_emblem_get_origin(GEmblem_val(self));
CAMLreturn(Val_GioEmblemOrigin(result));
}
