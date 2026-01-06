/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Popup */

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


CAMLexport CAMLprim value ml_gdk_popup_present(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gboolean result = gdk_popup_present(GdkPopup_val(self), Int_val(arg1), Int_val(arg2), GdkPopupLayout_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_popup_get_position_y(value self)
{
CAMLparam1(self);

int result = gdk_popup_get_position_y(GdkPopup_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_popup_get_position_x(value self)
{
CAMLparam1(self);

int result = gdk_popup_get_position_x(GdkPopup_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_popup_get_parent(value self)
{
CAMLparam1(self);

GdkSurface* result = gdk_popup_get_parent(GdkPopup_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkSurface));
}

CAMLexport CAMLprim value ml_gdk_popup_get_autohide(value self)
{
CAMLparam1(self);

gboolean result = gdk_popup_get_autohide(GdkPopup_val(self));
CAMLreturn(Val_bool(result));
}
