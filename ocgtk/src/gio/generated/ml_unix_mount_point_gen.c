/* GENERATED CODE - DO NOT EDIT */
/* C bindings for UnixMountPoint */

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

/* Conversion functions for GUnixMountPoint (opaque record with hidden fields) */
GUnixMountPoint *GUnixMountPoint_val(value v) {
  return *(GUnixMountPoint **)Data_custom_val(v);
}

value Val_GUnixMountPoint(const GUnixMountPoint *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GUnixMountPoint_option(const GUnixMountPoint *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GUnixMountPoint(ptr));
}


CAMLexport CAMLprim value ml_g_unix_mount_point_is_user_mountable(value self)
{
CAMLparam1(self);

gboolean result = g_unix_mount_point_is_user_mountable(GUnixMountPoint_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_unix_mount_point_is_readonly(value self)
{
CAMLparam1(self);

gboolean result = g_unix_mount_point_is_readonly(GUnixMountPoint_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_unix_mount_point_is_loopback(value self)
{
CAMLparam1(self);

gboolean result = g_unix_mount_point_is_loopback(GUnixMountPoint_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_unix_mount_point_guess_symbolic_icon(value self)
{
CAMLparam1(self);

GIcon* result = g_unix_mount_point_guess_symbolic_icon(GUnixMountPoint_val(self));
CAMLreturn(Val_GIcon(result));
}

CAMLexport CAMLprim value ml_g_unix_mount_point_guess_name(value self)
{
CAMLparam1(self);

char* result = g_unix_mount_point_guess_name(GUnixMountPoint_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_unix_mount_point_guess_icon(value self)
{
CAMLparam1(self);

GIcon* result = g_unix_mount_point_guess_icon(GUnixMountPoint_val(self));
CAMLreturn(Val_GIcon(result));
}

CAMLexport CAMLprim value ml_g_unix_mount_point_guess_can_eject(value self)
{
CAMLparam1(self);

gboolean result = g_unix_mount_point_guess_can_eject(GUnixMountPoint_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_unix_mount_point_get_options(value self)
{
CAMLparam1(self);

const char* result = g_unix_mount_point_get_options(GUnixMountPoint_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_unix_mount_point_get_mount_path(value self)
{
CAMLparam1(self);

const char* result = g_unix_mount_point_get_mount_path(GUnixMountPoint_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_unix_mount_point_get_fs_type(value self)
{
CAMLparam1(self);

const char* result = g_unix_mount_point_get_fs_type(GUnixMountPoint_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_unix_mount_point_get_device_path(value self)
{
CAMLparam1(self);

const char* result = g_unix_mount_point_get_device_path(GUnixMountPoint_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_g_unix_mount_point_free(value self)
{
CAMLparam1(self);

g_unix_mount_point_free(GUnixMountPoint_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_unix_mount_point_copy(value self)
{
CAMLparam1(self);

GUnixMountPoint* result = g_unix_mount_point_copy(GUnixMountPoint_val(self));
CAMLreturn(Val_GUnixMountPoint(result));
}

CAMLexport CAMLprim value ml_g_unix_mount_point_compare(value self, value arg1)
{
CAMLparam2(self, arg1);

gint result = g_unix_mount_point_compare(GUnixMountPoint_val(self), GUnixMountPoint_val(arg1));
CAMLreturn(Val_int(result));
}
