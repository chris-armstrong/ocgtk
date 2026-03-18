/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PixbufAnimation */

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
/* Include library-specific type conversions and forward declarations */
#include "gdkpixbuf_decls.h"


CAMLexport CAMLprim value ml_gdk_pixbuf_animation_is_static_image(value self)
{
CAMLparam1(self);

gboolean result = gdk_pixbuf_animation_is_static_image(GdkPixbufAnimation_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_animation_get_width(value self)
{
CAMLparam1(self);

int result = gdk_pixbuf_animation_get_width(GdkPixbufAnimation_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_animation_get_static_image(value self)
{
CAMLparam1(self);

GdkPixbuf* result = gdk_pixbuf_animation_get_static_image(GdkPixbufAnimation_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GdkPixbuf(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_animation_get_height(value self)
{
CAMLparam1(self);

int result = gdk_pixbuf_animation_get_height(GdkPixbufAnimation_val(self));
CAMLreturn(Val_int(result));
}
