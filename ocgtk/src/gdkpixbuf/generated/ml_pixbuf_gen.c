/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Pixbuf */

#include <gdk-pixbuf/gdk-pixbuf.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk-pixbuf/gdk-pixbuf.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gdk_pixbuf_new(value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(arg1, arg2, arg3, arg4, arg5);

GdkPixbuf *obj = gdk_pixbuf_new(GdkpixbufColorspace_val(arg1), Bool_val(arg2), Int_val(arg3), Int_val(arg4), Int_val(arg5));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GdkPixbuf(obj));
}
CAMLexport CAMLprim value ml_gdk_pixbuf_new_from_xpm_data(value arg1)
{
CAMLparam1(arg1);
    int arg1_length = Wosize_val(arg1);
    char** c_arg1 = (char**)g_malloc(sizeof(char*) * (arg1_length + 1));
    for (int i = 0; i < arg1_length; i++) {
      c_arg1[i] = String_val(Field(arg1, i));
    }
    c_arg1[arg1_length] = NULL;

GdkPixbuf *obj = gdk_pixbuf_new_from_xpm_data(c_arg1);
if (obj) g_object_ref_sink(obj);

    g_free(c_arg1);
CAMLreturn(Val_GdkPixbuf(obj));
}
CAMLexport CAMLprim value ml_gdk_pixbuf_set_option(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = gdk_pixbuf_set_option(GdkPixbuf_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_scale_simple(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

GdkPixbuf* result = gdk_pixbuf_scale_simple(GdkPixbuf_val(self), Int_val(arg1), Int_val(arg2), GdkpixbufInterpType_val(arg3));
CAMLreturn(Val_option(result, Val_GdkPixbuf));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_scale_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7, value arg8, value arg9, value arg10)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam6(arg5, arg6, arg7, arg8, arg9, arg10);

gdk_pixbuf_scale(GdkPixbuf_val(self), GdkPixbuf_val(arg1), Int_val(arg2), Int_val(arg3), Int_val(arg4), Int_val(arg5), Double_val(arg6), Double_val(arg7), Double_val(arg8), Double_val(arg9), GdkpixbufInterpType_val(arg10));
CAMLreturn(Val_unit);}

CAMLexport CAMLprim value ml_gdk_pixbuf_scale_bytecode(value * argv, int argn)
{
return ml_gdk_pixbuf_scale_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8], argv[9], argv[10]);
}

CAMLexport CAMLprim value ml_gdk_pixbuf_savev(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
GError *error = NULL;
    char** c_arg3 = NULL;
    
    if (Is_some(arg3)) {
        value array = Some_val(arg3);
        int arg3_length = Wosize_val(array);
        c_arg3 = (char**)g_malloc(sizeof(char*) * (arg3_length + 1));
        for (int i = 0; i < arg3_length; i++) {
          c_arg3[i] = String_val(Field(array, i));
        }
        c_arg3[arg3_length] = NULL;
    }
    char** c_arg4 = NULL;
    
    if (Is_some(arg4)) {
        value array = Some_val(arg4);
        int arg4_length = Wosize_val(array);
        c_arg4 = (char**)g_malloc(sizeof(char*) * (arg4_length + 1));
        for (int i = 0; i < arg4_length; i++) {
          c_arg4[i] = String_val(Field(array, i));
        }
        c_arg4[arg4_length] = NULL;
    }

gboolean result = gdk_pixbuf_savev(GdkPixbuf_val(self), String_val(arg1), String_val(arg2), c_arg3, c_arg4, &error);
    if (c_arg3) g_free(c_arg3);
    if (c_arg4) g_free(c_arg4);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_saturate_and_pixelate(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gdk_pixbuf_saturate_and_pixelate(GdkPixbuf_val(self), GdkPixbuf_val(arg1), Double_val(arg2), Bool_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_pixbuf_rotate_simple(value self, value arg1)
{
CAMLparam2(self, arg1);

GdkPixbuf* result = gdk_pixbuf_rotate_simple(GdkPixbuf_val(self), GdkpixbufPixbufRotation_val(arg1));
CAMLreturn(Val_option(result, Val_GdkPixbuf));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_remove_option(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_pixbuf_remove_option(GdkPixbuf_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_new_subpixbuf(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

GdkPixbuf* result = gdk_pixbuf_new_subpixbuf(GdkPixbuf_val(self), Int_val(arg1), Int_val(arg2), Int_val(arg3), Int_val(arg4));
CAMLreturn(Val_GdkPixbuf(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_get_width(value self)
{
CAMLparam1(self);

int result = gdk_pixbuf_get_width(GdkPixbuf_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_get_rowstride(value self)
{
CAMLparam1(self);

int result = gdk_pixbuf_get_rowstride(GdkPixbuf_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_get_option(value self, value arg1)
{
CAMLparam2(self, arg1);

const gchar* result = gdk_pixbuf_get_option(GdkPixbuf_val(self), String_val(arg1));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_get_n_channels(value self)
{
CAMLparam1(self);

int result = gdk_pixbuf_get_n_channels(GdkPixbuf_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_get_height(value self)
{
CAMLparam1(self);

int result = gdk_pixbuf_get_height(GdkPixbuf_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_get_has_alpha(value self)
{
CAMLparam1(self);

gboolean result = gdk_pixbuf_get_has_alpha(GdkPixbuf_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_get_colorspace(value self)
{
CAMLparam1(self);

GdkColorspace result = gdk_pixbuf_get_colorspace(GdkPixbuf_val(self));
CAMLreturn(Val_GdkpixbufColorspace(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_get_bits_per_sample(value self)
{
CAMLparam1(self);

int result = gdk_pixbuf_get_bits_per_sample(GdkPixbuf_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_flip(value self, value arg1)
{
CAMLparam2(self, arg1);

GdkPixbuf* result = gdk_pixbuf_flip(GdkPixbuf_val(self), Bool_val(arg1));
CAMLreturn(Val_option(result, Val_GdkPixbuf));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_copy_options(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_pixbuf_copy_options(GdkPixbuf_val(self), GdkPixbuf_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_copy_area_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam3(arg5, arg6, arg7);

gdk_pixbuf_copy_area(GdkPixbuf_val(self), Int_val(arg1), Int_val(arg2), Int_val(arg3), Int_val(arg4), GdkPixbuf_val(arg5), Int_val(arg6), Int_val(arg7));
CAMLreturn(Val_unit);}

CAMLexport CAMLprim value ml_gdk_pixbuf_copy_area_bytecode(value * argv, int argn)
{
return ml_gdk_pixbuf_copy_area_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]);
}

CAMLexport CAMLprim value ml_gdk_pixbuf_copy(value self)
{
CAMLparam1(self);

GdkPixbuf* result = gdk_pixbuf_copy(GdkPixbuf_val(self));
CAMLreturn(Val_option(result, Val_GdkPixbuf));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_composite_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7, value arg8, value arg9, value arg10, value arg11)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam7(arg5, arg6, arg7, arg8, arg9, arg10, arg11);

gdk_pixbuf_composite(GdkPixbuf_val(self), GdkPixbuf_val(arg1), Int_val(arg2), Int_val(arg3), Int_val(arg4), Int_val(arg5), Double_val(arg6), Double_val(arg7), Double_val(arg8), Double_val(arg9), GdkpixbufInterpType_val(arg10), Int_val(arg11));
CAMLreturn(Val_unit);}

CAMLexport CAMLprim value ml_gdk_pixbuf_composite_bytecode(value * argv, int argn)
{
return ml_gdk_pixbuf_composite_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8], argv[9], argv[10], argv[11]);
}

CAMLexport CAMLprim value ml_gdk_pixbuf_apply_embedded_orientation(value self)
{
CAMLparam1(self);

GdkPixbuf* result = gdk_pixbuf_apply_embedded_orientation(GdkPixbuf_val(self));
CAMLreturn(Val_option(result, Val_GdkPixbuf));
}
