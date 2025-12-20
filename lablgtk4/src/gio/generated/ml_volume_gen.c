/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Volume */

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

/* Type-specific conversion macros for GVolume */
#ifndef Val_GVolume
#define GVolume_val(val) ((GVolume*)ext_of_val(val))
#define Val_GVolume(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GVolume */


CAMLexport CAMLprim value ml_g_volume_should_automount(value self)
{
CAMLparam1(self);

gboolean result = g_volume_should_automount(GVolume_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_volume_get_uuid(value self)
{
CAMLparam1(self);

char* result = g_volume_get_uuid(GVolume_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_volume_get_sort_key(value self)
{
CAMLparam1(self);

const gchar* result = g_volume_get_sort_key(GVolume_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_volume_get_name(value self)
{
CAMLparam1(self);

char* result = g_volume_get_name(GVolume_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_volume_get_identifier(value self, value arg1)
{
CAMLparam2(self, arg1);

char* result = g_volume_get_identifier(GVolume_val(self), String_val(arg1));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_volume_can_mount(value self)
{
CAMLparam1(self);

gboolean result = g_volume_can_mount(GVolume_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_volume_can_eject(value self)
{
CAMLparam1(self);

gboolean result = g_volume_can_eject(GVolume_val(self));
CAMLreturn(Val_bool(result));
}
