/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Video */

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

/* Type-specific conversion macros for GtkVideo */
#define GtkVideo_val(val) ((GtkVideo*)ext_of_val(val))
#define Val_GtkVideo(obj) ((value)(val_of_ext(obj)))


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
GtkVideo *obj = gtk_video_new_for_filename((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkVideo(obj));
}

CAMLexport CAMLprim value ml_gtk_video_new_for_media_stream(value arg1)
{
CAMLparam1(arg1);
GtkVideo *obj = gtk_video_new_for_media_stream((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkVideo(obj));
}

CAMLexport CAMLprim value ml_gtk_video_new_for_resource(value arg1)
{
CAMLparam1(arg1);
GtkVideo *obj = gtk_video_new_for_resource((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkVideo(obj));
}

CAMLexport CAMLprim value ml_gtk_video_set_resource(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_video_set_resource(GtkVideo_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_video_set_media_stream(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_video_set_media_stream(GtkVideo_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_video_set_graphics_offload(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_video_set_graphics_offload(GtkVideo_val(self), GtkGraphicsOffloadEnabled_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_video_set_filename(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_video_set_filename(GtkVideo_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_video_get_media_stream(value self)
{
CAMLparam1(self);


    GtkMediaStream* result = gtk_video_get_media_stream(GtkVideo_val(self));
CAMLreturn(Val_GtkWidget(result));
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
CAMLlocal1(result);
GtkVideo *obj = (GtkVideo *)GtkVideo_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "autoplay", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_video_set_autoplay(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkVideo *obj = (GtkVideo *)GtkVideo_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "autoplay", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_video_get_loop(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkVideo *obj = (GtkVideo *)GtkVideo_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "loop", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_video_set_loop(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkVideo *obj = (GtkVideo *)GtkVideo_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "loop", c_value, NULL);
CAMLreturn(Val_unit);
}
