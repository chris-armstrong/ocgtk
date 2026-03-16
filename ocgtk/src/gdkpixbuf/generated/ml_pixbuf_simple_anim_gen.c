/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PixbufSimpleAnim */

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


CAMLexport CAMLprim value ml_gdk_pixbuf_simple_anim_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);

GdkPixbufSimpleAnim *obj = gdk_pixbuf_simple_anim_new(Int_val(arg1), Int_val(arg2), Double_val(arg3));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GdkPixbufSimpleAnim(obj));
}
CAMLexport CAMLprim value ml_gdk_pixbuf_simple_anim_set_loop(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_pixbuf_simple_anim_set_loop(GdkPixbufSimpleAnim_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_pixbuf_simple_anim_get_loop(value self)
{
CAMLparam1(self);

gboolean result = gdk_pixbuf_simple_anim_get_loop(GdkPixbufSimpleAnim_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_pixbuf_simple_anim_add_frame(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_pixbuf_simple_anim_add_frame(GdkPixbufSimpleAnim_val(self), GdkPixbuf_val(arg1));
CAMLreturn(Val_unit);
}
