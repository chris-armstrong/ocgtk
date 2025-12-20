/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EmblemedIcon */

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

/* Type-specific conversion macros for GEmblemedIcon */
#ifndef Val_GEmblemedIcon
#define GEmblemedIcon_val(val) ((GEmblemedIcon*)ext_of_val(val))
#define Val_GEmblemedIcon(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GEmblemedIcon */


CAMLexport CAMLprim value ml_g_emblemed_icon_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GEmblemedIcon *obj = g_emblemed_icon_new(arg1, Option_val(arg2, GEmblem_val, NULL));
CAMLreturn(Val_GEmblemedIcon(obj));
}

CAMLexport CAMLprim value ml_g_emblemed_icon_clear_emblems(value self)
{
CAMLparam1(self);

g_emblemed_icon_clear_emblems(GEmblemedIcon_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_emblemed_icon_add_emblem(value self, value arg1)
{
CAMLparam2(self, arg1);

g_emblemed_icon_add_emblem(GEmblemedIcon_val(self), GEmblem_val(arg1));
CAMLreturn(Val_unit);
}
