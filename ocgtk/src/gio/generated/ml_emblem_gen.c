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


CAMLexport CAMLprim value ml_g_emblem_new(value arg1)
{
CAMLparam1(arg1);
GEmblem *obj = g_emblem_new(GIcon_val(arg1));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GEmblem(obj));
}

CAMLexport CAMLprim value ml_g_emblem_new_with_origin(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GEmblem *obj = g_emblem_new_with_origin(GIcon_val(arg1), GioEmblemOrigin_val(arg2));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GEmblem(obj));
}

CAMLexport CAMLprim value ml_g_emblem_get_origin(value self)
{
CAMLparam1(self);

GEmblemOrigin result = g_emblem_get_origin(GEmblem_val(self));
CAMLreturn(Val_GioEmblemOrigin(result));
}

CAMLexport CAMLprim value ml_g_emblem_get_icon(value self)
{
CAMLparam1(self);

GIcon* result = g_emblem_get_icon(GEmblem_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GIcon(result));
}
