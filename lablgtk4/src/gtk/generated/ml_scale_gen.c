/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Scale */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkScale */
#ifndef Val_GtkScale
#define GtkScale_val(val) ((GtkScale*)ext_of_val(val))
#define Val_GtkScale(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkScale */


CAMLexport CAMLprim value ml_gtk_scale_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkScale *obj = gtk_scale_new(GtkOrientation_val(arg1), Option_val(arg2, GtkAdjustment_val, NULL));
CAMLreturn(Val_GtkScale(obj));
}

CAMLexport CAMLprim value ml_gtk_scale_new_with_range(value arg1, value arg2, value arg3, value arg4)
{
CAMLparam4(arg1, arg2, arg3, arg4);
GtkScale *obj = gtk_scale_new_with_range(GtkOrientation_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4));
CAMLreturn(Val_GtkScale(obj));
}

CAMLexport CAMLprim value ml_gtk_scale_set_value_pos(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_scale_set_value_pos(GtkScale_val(self), GtkPositionType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_set_has_origin(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_scale_set_has_origin(GtkScale_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_set_draw_value(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_scale_set_draw_value(GtkScale_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_set_digits(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_scale_set_digits(GtkScale_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_get_value_pos(value self)
{
CAMLparam1(self);

GtkPositionType result = gtk_scale_get_value_pos(GtkScale_val(self));
CAMLreturn(Val_GtkPositionType(result));
}

CAMLexport CAMLprim value ml_gtk_scale_get_layout_offsets(value self)
{
CAMLparam1(self);
int out1;
int out2;

gtk_scale_get_layout_offsets(GtkScale_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_int(out1));
    Store_field(ret, 1, Val_int(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_scale_get_has_origin(value self)
{
CAMLparam1(self);

gboolean result = gtk_scale_get_has_origin(GtkScale_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_scale_get_draw_value(value self)
{
CAMLparam1(self);

gboolean result = gtk_scale_get_draw_value(GtkScale_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_scale_get_digits(value self)
{
CAMLparam1(self);

int result = gtk_scale_get_digits(GtkScale_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_scale_clear_marks(value self)
{
CAMLparam1(self);

gtk_scale_clear_marks(GtkScale_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_add_mark(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_scale_add_mark(GtkScale_val(self), Double_val(arg1), GtkPositionType_val(arg2), String_option_val(arg3));
CAMLreturn(Val_unit);
}
