/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MediaStream */

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

/* Type-specific conversion macros for GtkMediaStream */
#define GtkMediaStream_val(val) ((GtkMediaStream*)ext_of_val(val))
#define Val_GtkMediaStream(obj) ((value)(val_of_ext(obj)))


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

CAMLexport CAMLprim value ml_gtk_media_stream_ended(value self)
{
CAMLparam1(self);

gtk_media_stream_ended(GtkMediaStream_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_ended(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "ended", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_has_audio(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-audio", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_has_video(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-video", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_loop(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "loop", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_loop(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "loop", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_muted(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "muted", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_muted(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "muted", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_playing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "playing", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_playing(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "playing", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_prepared(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "prepared", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_prepared(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "prepared", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_seekable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "seekable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_seeking(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "seeking", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_volume(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "volume", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_volume(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "volume", c_value, NULL);
CAMLreturn(Val_unit);
}
