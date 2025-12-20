/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Mount */

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

/* Type-specific conversion macros for GMount */
#ifndef Val_GMount
#define GMount_val(val) ((GMount*)ext_of_val(val))
#define Val_GMount(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GMount */


CAMLexport CAMLprim value ml_g_mount_unshadow(value self)
{
CAMLparam1(self);

g_mount_unshadow(GMount_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_mount_shadow(value self)
{
CAMLparam1(self);

g_mount_shadow(GMount_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_mount_is_shadowed(value self)
{
CAMLparam1(self);

gboolean result = g_mount_is_shadowed(GMount_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_mount_get_uuid(value self)
{
CAMLparam1(self);

char* result = g_mount_get_uuid(GMount_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_mount_get_sort_key(value self)
{
CAMLparam1(self);

const gchar* result = g_mount_get_sort_key(GMount_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_mount_get_name(value self)
{
CAMLparam1(self);

char* result = g_mount_get_name(GMount_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_mount_can_unmount(value self)
{
CAMLparam1(self);

gboolean result = g_mount_can_unmount(GMount_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_mount_can_eject(value self)
{
CAMLparam1(self);

gboolean result = g_mount_can_eject(GMount_val(self));
CAMLreturn(Val_bool(result));
}
