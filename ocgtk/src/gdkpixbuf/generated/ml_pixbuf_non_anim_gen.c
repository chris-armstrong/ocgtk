/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PixbufNonAnim */

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


CAMLexport CAMLprim value ml_gdk_pixbuf_non_anim_new(value arg1)
{
CAMLparam1(arg1);

GdkPixbufNonAnim *obj = gdk_pixbuf_non_anim_new(GdkPixbuf_val(arg1));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GdkPixbufNonAnim(obj));
}