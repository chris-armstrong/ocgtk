/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Drive */

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

/* Type-specific conversion macros for GDrive */
#ifndef Val_GDrive
#define GDrive_val(val) ((GDrive*)ext_of_val(val))
#define Val_GDrive(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GDrive */


CAMLexport CAMLprim value ml_g_drive_is_removable(value self)
{
CAMLparam1(self);

gboolean result = g_drive_is_removable(GDrive_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_drive_is_media_removable(value self)
{
CAMLparam1(self);

gboolean result = g_drive_is_media_removable(GDrive_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_drive_is_media_check_automatic(value self)
{
CAMLparam1(self);

gboolean result = g_drive_is_media_check_automatic(GDrive_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_drive_has_volumes(value self)
{
CAMLparam1(self);

gboolean result = g_drive_has_volumes(GDrive_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_drive_has_media(value self)
{
CAMLparam1(self);

gboolean result = g_drive_has_media(GDrive_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_drive_get_start_stop_type(value self)
{
CAMLparam1(self);

GDriveStartStopType result = g_drive_get_start_stop_type(GDrive_val(self));
CAMLreturn(Val_GioDriveStartStopType(result));
}

CAMLexport CAMLprim value ml_g_drive_get_sort_key(value self)
{
CAMLparam1(self);

const gchar* result = g_drive_get_sort_key(GDrive_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_drive_get_name(value self)
{
CAMLparam1(self);

char* result = g_drive_get_name(GDrive_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_drive_get_identifier(value self, value arg1)
{
CAMLparam2(self, arg1);

char* result = g_drive_get_identifier(GDrive_val(self), String_val(arg1));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_drive_can_stop(value self)
{
CAMLparam1(self);

gboolean result = g_drive_can_stop(GDrive_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_drive_can_start_degraded(value self)
{
CAMLparam1(self);

gboolean result = g_drive_can_start_degraded(GDrive_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_drive_can_start(value self)
{
CAMLparam1(self);

gboolean result = g_drive_can_start(GDrive_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_drive_can_poll_for_media(value self)
{
CAMLparam1(self);

gboolean result = g_drive_can_poll_for_media(GDrive_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_drive_can_eject(value self)
{
CAMLparam1(self);

gboolean result = g_drive_can_eject(GDrive_val(self));
CAMLreturn(Val_bool(result));
}
