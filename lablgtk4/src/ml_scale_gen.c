/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Scale */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkScale */
#define GtkScale_val(val) ((GtkScale*)ext_of_val(val))
#define Val_GtkScale(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_scale_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkScale *obj = gtk_scale_new(GtkOrientation_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
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

CAMLexport CAMLprim value ml_gtk_scale_get_value_pos(value self)
{
CAMLparam1(self);

GtkPositionType result = gtk_scale_get_value_pos(GtkScale_val(self));
CAMLreturn(Val_GtkPositionType(result));
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

gtk_scale_add_mark(GtkScale_val(self), Double_val(arg1), GtkPositionType_val(arg2), (Is_some(arg3) ? String_val(Some_val(arg3)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_get_digits(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScale *obj = (GtkScale *)GtkScale_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "digits", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scale_set_digits(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkScale *obj = (GtkScale *)GtkScale_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "digits", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_get_draw_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScale *obj = (GtkScale *)GtkScale_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "draw-value", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scale_set_draw_value(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkScale *obj = (GtkScale *)GtkScale_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "draw-value", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_get_has_origin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkScale *obj = (GtkScale *)GtkScale_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-origin", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scale_set_has_origin(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkScale *obj = (GtkScale *)GtkScale_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-origin", c_value, NULL);
CAMLreturn(Val_unit);
}
