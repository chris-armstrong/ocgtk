/* GENERATED CODE - DO NOT EDIT */
/* C bindings for RGBA */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include library-specific type conversions and forward declarations */
#include "gdk_decls.h"

/* Copy function for GdkRGBA (value-like record with copy method) */
value copy_GdkRGBA(const GdkRGBA *ptr)
{
  if (ptr == NULL) return Val_none;
  GdkRGBA *copy = gdk_rgba_copy((GdkRGBA*)ptr);
  return ml_gir_record_val_ptr_with_type(gdk_rgba_get_type(), copy);
}


CAMLexport CAMLprim value ml_gdk_rgba_to_string(value self)
{
CAMLparam1(self);

char* result = gdk_rgba_to_string(GdkRGBA_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gdk_rgba_parse(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_rgba_parse(GdkRGBA_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_rgba_is_opaque(value self)
{
CAMLparam1(self);

gboolean result = gdk_rgba_is_opaque(GdkRGBA_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_rgba_is_clear(value self)
{
CAMLparam1(self);

gboolean result = gdk_rgba_is_clear(GdkRGBA_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_rgba_hash(value self)
{
CAMLparam1(self);

guint result = gdk_rgba_hash(GdkRGBA_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_rgba_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_rgba_equal(GdkRGBA_val(self), GdkRGBA_val(arg1));
CAMLreturn(Val_bool(result));
}
\
CAMLexport CAMLprim value ml_gdk_rgb_a_get_red(value self)
{
    CAMLparam1(self);
    GdkRGBA *rec = GdkRGBA_val(self);
    CAMLreturn(caml_copy_double(rec->red));
}

\
CAMLexport CAMLprim value ml_gdk_rgb_a_get_green(value self)
{
    CAMLparam1(self);
    GdkRGBA *rec = GdkRGBA_val(self);
    CAMLreturn(caml_copy_double(rec->green));
}

\
CAMLexport CAMLprim value ml_gdk_rgb_a_get_blue(value self)
{
    CAMLparam1(self);
    GdkRGBA *rec = GdkRGBA_val(self);
    CAMLreturn(caml_copy_double(rec->blue));
}

\
CAMLexport CAMLprim value ml_gdk_rgb_a_get_alpha(value self)
{
    CAMLparam1(self);
    GdkRGBA *rec = GdkRGBA_val(self);
    CAMLreturn(caml_copy_double(rec->alpha));
}

\
CAMLexport CAMLprim value ml_gdk_rgb_a_set_red(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GdkRGBA *rec = GdkRGBA_val(self);
    rec->red = Double_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gdk_rgb_a_set_green(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GdkRGBA *rec = GdkRGBA_val(self);
    rec->green = Double_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gdk_rgb_a_set_blue(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GdkRGBA *rec = GdkRGBA_val(self);
    rec->blue = Double_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gdk_rgb_a_set_alpha(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GdkRGBA *rec = GdkRGBA_val(self);
    rec->alpha = Double_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gdk_rgb_a_make(value v_red, value v_green, value v_blue, value v_alpha)
{
    CAMLparam4(v_red, v_green, v_blue, v_alpha);
    GdkRGBA *obj = g_new0(GdkRGBA, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->red = Double_val(v_red);
    obj->green = Double_val(v_green);
    obj->blue = Double_val(v_blue);
    obj->alpha = Double_val(v_alpha);
    CAMLreturn(Val_GdkRGBA(obj));
}

