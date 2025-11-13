/**************************************************************************/
/*                Lablgtk4                                                */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License as published by the Free Software Foundation         */
/*    version 2, with the exception described in file COPYING which       */
/*    comes with the library.                                             */
/*                                                                        */
/*    This program is distributed in the hope that it will be useful,     */
/*    but WITHOUT ANY WARRANTY; without even the implied warranty of      */
/*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the       */
/*    GNU Library General Public License for more details.                */
/*                                                                        */
/*    You should have received a copy of the GNU Library General          */
/*    Public License along with this program; if not, write to the        */
/*    Free Software Foundation, Inc., 59 Temple Place, Suite 330,         */
/*    Boston, MA 02111-1307  USA                                          */
/*                                                                        */
/**************************************************************************/

#include <string.h>
#include <gdk-pixbuf/gdk-pixbuf.h>
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/fail.h>

#include "wrappers.h"
#include "gdkpixbuf_tags.h"

#include "gdkpixbuf_tags.c"

/* Custom block with finalization for GdkPixbufs */
static void ml_final_GdkPixbuf(value val)
{
    GdkPixbuf *pb = GdkPixbuf_val(val);
    if (pb) g_object_unref(pb);
}

static struct custom_operations ml_custom_GdkPixbuf = {
    "GdkPixbuf/4.0/",
    ml_final_GdkPixbuf,
    custom_compare_default,
    custom_hash_default,
    custom_serialize_default,
    custom_deserialize_default,
    custom_compare_ext_default,
    custom_fixed_length_default
};

value Val_GdkPixbuf_(GdkPixbuf *pb, gboolean ref)
{
    GdkPixbuf **p;
    value ret;
    if (pb == NULL) {
        caml_failwith("GdkPixbuf_val: NULL pointer");
    }
    ret = caml_alloc_custom(&ml_custom_GdkPixbuf, sizeof(pb), 100, 1000);
    p = Data_custom_val(ret);
    *p = ref ? g_object_ref(pb) : pb;
    return ret;
}

Make_Val_option(GdkPixbuf)

/* Simple GError to OCaml exception conversion */
static void ml_raise_gdkpixbuf_error(GError *err)
{
    char *msg;
    if (err == NULL) return;
    msg = g_strdup_printf("GdkPixbuf error: %s", err->message);
    g_error_free(err);
    caml_failwith(msg);
    g_free(msg);
}

CAMLprim value ml_gdkpixbuf_init(value unit)
{
    CAMLparam1(unit);
    /* No custom initialization needed for now */
    CAMLreturn(Val_unit);
}

/* GdkPixbuf accessors */
ML_1(gdk_pixbuf_get_n_channels, GdkPixbuf_val, Val_int)
ML_1(gdk_pixbuf_get_has_alpha, GdkPixbuf_val, Val_bool)
ML_1(gdk_pixbuf_get_bits_per_sample, GdkPixbuf_val, Val_int)
ML_1(gdk_pixbuf_get_width, GdkPixbuf_val, Val_int)
ML_1(gdk_pixbuf_get_height, GdkPixbuf_val, Val_int)
ML_1(gdk_pixbuf_get_rowstride, GdkPixbuf_val, Val_int)

/* Creation */
ML_5(gdk_pixbuf_new, GDK_COLORSPACE_RGB Ignore, Int_val, Int_val,
     Int_val, Int_val, Val_GdkPixbuf_new)

ML_1(gdk_pixbuf_copy, GdkPixbuf_val, Val_GdkPixbuf_new)

CAMLprim value ml_gdk_pixbuf_new_from_file(value f)
{
    GError *err = NULL;
    GdkPixbuf *res = gdk_pixbuf_new_from_file(String_val(f), &err);
    if (err) ml_raise_gdkpixbuf_error(err);
    return Val_GdkPixbuf_new(res);
}

CAMLprim value ml_gdk_pixbuf_new_from_file_at_size(value f, value w, value h)
{
    GError *err = NULL;
    GdkPixbuf *res = gdk_pixbuf_new_from_file_at_size(String_val(f),
                                                       Int_val(w), Int_val(h),
                                                       &err);
    if (err) ml_raise_gdkpixbuf_error(err);
    return Val_GdkPixbuf_new(res);
}

CAMLprim value ml_gdk_pixbuf_get_file_info(value f)
{
    CAMLparam0();
    CAMLlocal1(v);
    gint w, h;
    GdkPixbufFormat *fmt;
    fmt = gdk_pixbuf_get_file_info(String_val(f), &w, &h);
    if (fmt == NULL) {
        caml_failwith("GdkPixbuf.get_file_info: unable to get file info");
    }
    v = caml_alloc_tuple(3);
    Store_field(v, 0, caml_copy_string(gdk_pixbuf_format_get_name(fmt)));
    Store_field(v, 1, Val_int(w));
    Store_field(v, 2, Val_int(h));
    CAMLreturn(v);
}

ML_1(gdk_pixbuf_new_from_xpm_data, (const char**), Val_GdkPixbuf_new)

/* Create sub-region */
ML_5(gdk_pixbuf_new_subpixbuf, GdkPixbuf_val, Int_val, Int_val, Int_val, Int_val, Val_GdkPixbuf_new)

/* Transform */

/* Adding an alpha channel */
ML_5(gdk_pixbuf_add_alpha, GdkPixbuf_val, Int_val, Int_val, Int_val, Int_val,
     Val_GdkPixbuf_new)

/* Fill a pixbuf */
ML_2(gdk_pixbuf_fill, GdkPixbuf_val, Int32_val, Unit)

/* Modifies saturation and optionally pixelates */
ML_4(gdk_pixbuf_saturate_and_pixelate, GdkPixbuf_val, GdkPixbuf_val, Double_val, Bool_val, Unit)

/* Copy an area */
ML_8(gdk_pixbuf_copy_area, GdkPixbuf_val, Int_val, Int_val, Int_val, Int_val,
     GdkPixbuf_val, Int_val, Int_val, Unit)
ML_bc8(ml_gdk_pixbuf_copy_area)

/* Scaling */
ML_11(gdk_pixbuf_scale, GdkPixbuf_val, GdkPixbuf_val, Int_val, Int_val,
      Int_val, Int_val, Double_val, Double_val, Double_val, Double_val,
      Interpolation_val, Unit)
ML_bc11(ml_gdk_pixbuf_scale)

ML_12(gdk_pixbuf_composite, GdkPixbuf_val, GdkPixbuf_val, Int_val, Int_val,
      Int_val, Int_val, Double_val, Double_val, Double_val, Double_val,
      Interpolation_val, Int_val, Unit)
ML_bc12(ml_gdk_pixbuf_composite)

/* Saving */

static int list_length(value l)
{
    int i = 0;
    while (l != Val_emptylist) {
        l = Field(l, 1);
        i++;
    }
    return i;
}

static void
convert_gdk_pixbuf_options(value options, char ***opt_k, char ***opt_v, gboolean copy)
{
    if (Is_block(options)) {
        value cell = Field(options, 0);
        unsigned int i, len = list_length(cell);
        *opt_k = malloc(sizeof(char *) * (len + 1));
        *opt_v = malloc(sizeof(char *) * (len + 1));
        for (i = 0; i < len; i++) {
            const gchar *s;
            value pair = Field(cell, 0);
            s = (gchar*)String_val(Field(pair, 0));
            (*opt_k)[i] = (copy ? g_strdup(s) : (gchar*)s);
            s = (gchar*)String_val(Field(pair, 1));
            (*opt_v)[i] = (copy ? g_strdup(s) : (gchar*)s);
            cell = Field(cell, 1);
        }
        (*opt_k)[len] = NULL;
        (*opt_v)[len] = NULL;
    } else {
        *opt_k = NULL;
        *opt_v = NULL;
    }
}

CAMLprim value ml_gdk_pixbuf_save(value fname, value type, value options, value pixbuf)
{
    GError *err = NULL;
    char **opt_k;
    char **opt_v;
    convert_gdk_pixbuf_options(options, &opt_k, &opt_v, FALSE);
    gdk_pixbuf_savev(GdkPixbuf_val(pixbuf), String_val(fname), String_val(type), opt_k, opt_v, &err);
    if (opt_k) free(opt_k);
    if (opt_v) free(opt_v);
    if (err) ml_raise_gdkpixbuf_error(err);
    return Val_unit;
}

/* Save to callback */
static gboolean
ml_gdkpixbuf_savefunc(const gchar *buf, gsize count, GError **error, gpointer data)
{
    value *cb = data;
    value res, s;
    s = caml_alloc_string(count);
    memcpy(Bytes_val(s), buf, count);
    res = caml_callback_exn(*cb, s);
    if (Is_exception_result(res)) {
        g_set_error(error, GDK_PIXBUF_ERROR, GDK_PIXBUF_ERROR_FAILED,
                   "OCaml callback raised an exception");
        return FALSE;
    } else {
        return TRUE;
    }
}

CAMLprim value
ml_gdk_pixbuf_save_to_callback(value pixbuf, value type, value options, value cb)
{
    CAMLparam4(pixbuf, type, options, cb);
    GError *err = NULL;
    char **opt_k;
    char **opt_v;
    convert_gdk_pixbuf_options(options, &opt_k, &opt_v, TRUE);
    gdk_pixbuf_save_to_callbackv(GdkPixbuf_val(pixbuf),
                                  ml_gdkpixbuf_savefunc, &cb,
                                  String_val(type),
                                  opt_k, opt_v,
                                  &err);
    g_strfreev(opt_k);
    g_strfreev(opt_v);
    if (err) ml_raise_gdkpixbuf_error(err);
    CAMLreturn(Val_unit);
}
