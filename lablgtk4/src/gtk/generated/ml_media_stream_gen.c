/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MediaStream */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkMediaStream */
#ifndef Val_GtkMediaStream
#define GtkMediaStream_val(val) ((GtkMediaStream*)ext_of_val(val))
#define Val_GtkMediaStream(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkMediaStream */


CAMLexport CAMLprim value ml_gtk_media_stream_unprepared(value self)
{
CAMLparam1(self);

gtk_media_stream_unprepared(GtkMediaStream_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_stream_unprepared(value self)
{
CAMLparam1(self);

gtk_media_stream_stream_unprepared(GtkMediaStream_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_stream_ended(value self)
{
CAMLparam1(self);

gtk_media_stream_stream_ended(GtkMediaStream_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_volume(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_media_stream_set_volume(GtkMediaStream_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_playing(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_media_stream_set_playing(GtkMediaStream_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_muted(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_media_stream_set_muted(GtkMediaStream_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_loop(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_media_stream_set_loop(GtkMediaStream_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_seek_success(value self)
{
CAMLparam1(self);

gtk_media_stream_seek_success(GtkMediaStream_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_seek_failed(value self)
{
CAMLparam1(self);

gtk_media_stream_seek_failed(GtkMediaStream_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_play(value self)
{
CAMLparam1(self);

gtk_media_stream_play(GtkMediaStream_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_pause(value self)
{
CAMLparam1(self);

gtk_media_stream_pause(GtkMediaStream_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_is_seeking(value self)
{
CAMLparam1(self);

gboolean result = gtk_media_stream_is_seeking(GtkMediaStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_is_seekable(value self)
{
CAMLparam1(self);

gboolean result = gtk_media_stream_is_seekable(GtkMediaStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_is_prepared(value self)
{
CAMLparam1(self);

gboolean result = gtk_media_stream_is_prepared(GtkMediaStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_has_video(value self)
{
CAMLparam1(self);

gboolean result = gtk_media_stream_has_video(GtkMediaStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_has_audio(value self)
{
CAMLparam1(self);

gboolean result = gtk_media_stream_has_audio(GtkMediaStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_volume(value self)
{
CAMLparam1(self);

double result = gtk_media_stream_get_volume(GtkMediaStream_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_playing(value self)
{
CAMLparam1(self);

gboolean result = gtk_media_stream_get_playing(GtkMediaStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_muted(value self)
{
CAMLparam1(self);

gboolean result = gtk_media_stream_get_muted(GtkMediaStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_loop(value self)
{
CAMLparam1(self);

gboolean result = gtk_media_stream_get_loop(GtkMediaStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_ended(value self)
{
CAMLparam1(self);

gboolean result = gtk_media_stream_get_ended(GtkMediaStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_ended(value self)
{
CAMLparam1(self);

gtk_media_stream_ended(GtkMediaStream_val(self));
CAMLreturn(Val_unit);
}
