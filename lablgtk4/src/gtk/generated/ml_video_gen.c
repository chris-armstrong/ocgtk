/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Video */

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

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkVideo */
#ifndef Val_GtkVideo
#define GtkVideo_val(val) ((GtkVideo*)ext_of_val(val))
#define Val_GtkVideo(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkVideo */


CAMLexport CAMLprim value ml_gtk_video_new(value unit)
{
CAMLparam1(unit);
GtkVideo *obj = gtk_video_new();
CAMLreturn(Val_GtkVideo(obj));
}

CAMLexport CAMLprim value ml_gtk_video_new_for_file(value arg1)
{
CAMLparam1(arg1);
GtkVideo *obj = gtk_video_new_for_file(arg1);
CAMLreturn(Val_GtkVideo(obj));
}

CAMLexport CAMLprim value ml_gtk_video_new_for_filename(value arg1)
{
CAMLparam1(arg1);
GtkVideo *obj = gtk_video_new_for_filename(arg1);
CAMLreturn(Val_GtkVideo(obj));
}

CAMLexport CAMLprim value ml_gtk_video_new_for_media_stream(value arg1)
{
CAMLparam1(arg1);
GtkVideo *obj = gtk_video_new_for_media_stream(Option_val(arg1, GtkMediaStream_val, NULL));
CAMLreturn(Val_GtkVideo(obj));
}

CAMLexport CAMLprim value ml_gtk_video_new_for_resource(value arg1)
{
CAMLparam1(arg1);
GtkVideo *obj = gtk_video_new_for_resource(String_option_val(arg1));
CAMLreturn(Val_GtkVideo(obj));
}

CAMLexport CAMLprim value ml_gtk_video_set_resource(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_video_set_resource(GtkVideo_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_video_set_media_stream(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_video_set_media_stream(GtkVideo_val(self), Option_val(arg1, GtkMediaStream_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_video_set_loop(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_video_set_loop(GtkVideo_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_video_set_graphics_offload(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_video_set_graphics_offload(GtkVideo_val(self), GtkGraphicsOffloadEnabled_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_video_set_autoplay(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_video_set_autoplay(GtkVideo_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_video_get_media_stream(value self)
{
CAMLparam1(self);

GtkMediaStream* result = gtk_video_get_media_stream(GtkVideo_val(self));
CAMLreturn(Val_option(result, Val_GtkMediaStream));
}

CAMLexport CAMLprim value ml_gtk_video_get_loop(value self)
{
CAMLparam1(self);

gboolean result = gtk_video_get_loop(GtkVideo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_video_get_graphics_offload(value self)
{
CAMLparam1(self);

GtkGraphicsOffloadEnabled result = gtk_video_get_graphics_offload(GtkVideo_val(self));
CAMLreturn(Val_GtkGraphicsOffloadEnabled(result));
}

CAMLexport CAMLprim value ml_gtk_video_get_autoplay(value self)
{
CAMLparam1(self);

gboolean result = gtk_video_get_autoplay(GtkVideo_val(self));
CAMLreturn(Val_bool(result));
}
