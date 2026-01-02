/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DevicePad */

#include <gdk/gdk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gdk_device_pad_get_n_groups(value self)
{
CAMLparam1(self);

int result = gdk_device_pad_get_n_groups(GdkDevicePad_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_device_pad_get_n_features(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gdk_device_pad_get_n_features(GdkDevicePad_val(self), GdkDevicePadFeature_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_device_pad_get_group_n_modes(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gdk_device_pad_get_group_n_modes(GdkDevicePad_val(self), Int_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_device_pad_get_feature_group(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

int result = gdk_device_pad_get_feature_group(GdkDevicePad_val(self), GdkDevicePadFeature_val(arg1), Int_val(arg2));
CAMLreturn(Val_int(result));
}
