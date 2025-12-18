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

CAMLexport CAMLprim value ml_gtk_media_stream_get_ended(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "ended");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_get_ended: property 'ended' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "ended", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_has_audio(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-audio");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_get_has_audio: property 'has-audio' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "has-audio", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_has_video(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-video");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_get_has_video: property 'has-video' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "has-video", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_loop(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "loop");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_get_loop: property 'loop' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "loop", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_loop(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "loop");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_set_loop: property 'loop' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "loop", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_muted(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "muted");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_get_muted: property 'muted' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "muted", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_muted(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "muted");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_set_muted: property 'muted' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "muted", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_playing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "playing");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_get_playing: property 'playing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "playing", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_playing(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "playing");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_set_playing: property 'playing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "playing", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_prepared(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "prepared");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_get_prepared: property 'prepared' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "prepared", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_prepared(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "prepared");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_set_prepared: property 'prepared' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "prepared", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_seekable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "seekable");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_get_seekable: property 'seekable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "seekable", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_seeking(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "seeking");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_get_seeking: property 'seeking' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "seeking", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_volume(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gdouble prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "volume");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_get_volume: property 'volume' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "volume", &prop_gvalue);
    prop_value = g_value_get_double(&prop_gvalue);

result = caml_copy_double(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_volume(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkMediaStream *obj = (GtkMediaStream *)GtkMediaStream_val(self);
    gdouble c_value = Double_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "volume");
if (pspec == NULL) caml_failwith("ml_gtk_media_stream_set_volume: property 'volume' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_double(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "volume", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
