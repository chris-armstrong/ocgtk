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

/* Type conversions - use direct cast (GObjects) */
#define GtkEventController_val(val) ((GtkEventController*)ext_of_val(val))
#define Val_GtkEventController(obj) ((value)(val_of_ext(obj)))
/* Note: GtkWidget_val and Val_GtkWidget are defined in wrappers.h */

/* Phase 5.3: Option type conversions for nullable parameters */
#define GtkWidget_option_val(v) ((v) == Val_none ? NULL : GtkWidget_val(Some_val(v)))
#define GtkEventController_option_val(v) ((v) == Val_none ? NULL : GtkEventController_val(Some_val(v)))

/* GdkEvent conversions - from ml_event_controller.c */
#define GdkEvent_val(val) ((GdkEvent*)ext_of_val(val))
#define Val_GdkEvent(obj) ((value)(val_of_ext(obj)))

/* Note: Res_Ok, Res_Error, ValUnit, and Val_GError are defined in wrappers.h */

/* Forward declarations for external namespace enum/bitfield converters */
value Val_GdkAxisUse(GdkAxisUse val);
GdkAxisUse GdkAxisUse_val(value val);
value Val_GdkCrossingMode(GdkCrossingMode val);
GdkCrossingMode GdkCrossingMode_val(value val);
value Val_GdkDevicePadFeature(GdkDevicePadFeature val);
GdkDevicePadFeature GdkDevicePadFeature_val(value val);
value Val_GdkDeviceToolType(GdkDeviceToolType val);
GdkDeviceToolType GdkDeviceToolType_val(value val);
value Val_GdkDmabufError(GdkDmabufError val);
GdkDmabufError GdkDmabufError_val(value val);
value Val_GdkDragCancelReason(GdkDragCancelReason val);
GdkDragCancelReason GdkDragCancelReason_val(value val);
value Val_GdkEventType(GdkEventType val);
GdkEventType GdkEventType_val(value val);
value Val_GdkFullscreenMode(GdkFullscreenMode val);
GdkFullscreenMode GdkFullscreenMode_val(value val);
value Val_GdkGLError(GdkGLError val);
GdkGLError GdkGLError_val(value val);
value Val_GdkGravity(GdkGravity val);
GdkGravity GdkGravity_val(value val);
value Val_GdkInputSource(GdkInputSource val);
GdkInputSource GdkInputSource_val(value val);
value Val_GdkKeyMatch(GdkKeyMatch val);
GdkKeyMatch GdkKeyMatch_val(value val);
value Val_GdkMemoryFormat(GdkMemoryFormat val);
GdkMemoryFormat GdkMemoryFormat_val(value val);
value Val_GdkNotifyType(GdkNotifyType val);
GdkNotifyType GdkNotifyType_val(value val);
value Val_GdkScrollDirection(GdkScrollDirection val);
GdkScrollDirection GdkScrollDirection_val(value val);
value Val_GdkScrollUnit(GdkScrollUnit val);
GdkScrollUnit GdkScrollUnit_val(value val);
value Val_GdkSubpixelLayout(GdkSubpixelLayout val);
GdkSubpixelLayout GdkSubpixelLayout_val(value val);
value Val_GdkSurfaceEdge(GdkSurfaceEdge val);
GdkSurfaceEdge GdkSurfaceEdge_val(value val);
value Val_GdkTextureError(GdkTextureError val);
GdkTextureError GdkTextureError_val(value val);
value Val_GdkTitlebarGesture(GdkTitlebarGesture val);
GdkTitlebarGesture GdkTitlebarGesture_val(value val);
value Val_GdkTouchpadGesturePhase(GdkTouchpadGesturePhase val);
GdkTouchpadGesturePhase GdkTouchpadGesturePhase_val(value val);
value Val_GdkVulkanError(GdkVulkanError val);
GdkVulkanError GdkVulkanError_val(value val);
value Val_PangoAlignment(PangoAlignment val);
PangoAlignment PangoAlignment_val(value val);
value Val_PangoAttrType(PangoAttrType val);
PangoAttrType PangoAttrType_val(value val);
value Val_PangoBaselineShift(PangoBaselineShift val);
PangoBaselineShift PangoBaselineShift_val(value val);
value Val_PangoBidiType(PangoBidiType val);
PangoBidiType PangoBidiType_val(value val);
value Val_PangoCoverageLevel(PangoCoverageLevel val);
PangoCoverageLevel PangoCoverageLevel_val(value val);
value Val_PangoDirection(PangoDirection val);
PangoDirection PangoDirection_val(value val);
value Val_PangoEllipsizeMode(PangoEllipsizeMode val);
PangoEllipsizeMode PangoEllipsizeMode_val(value val);
value Val_PangoFontScale(PangoFontScale val);
PangoFontScale PangoFontScale_val(value val);
value Val_PangoGravity(PangoGravity val);
PangoGravity PangoGravity_val(value val);
value Val_PangoGravityHint(PangoGravityHint val);
PangoGravityHint PangoGravityHint_val(value val);
value Val_PangoLayoutDeserializeError(PangoLayoutDeserializeError val);
PangoLayoutDeserializeError PangoLayoutDeserializeError_val(value val);
value Val_PangoOverline(PangoOverline val);
PangoOverline PangoOverline_val(value val);
value Val_PangoRenderPart(PangoRenderPart val);
PangoRenderPart PangoRenderPart_val(value val);
value Val_PangoScript(PangoScript val);
PangoScript PangoScript_val(value val);
value Val_PangoStretch(PangoStretch val);
PangoStretch PangoStretch_val(value val);
value Val_PangoStyle(PangoStyle val);
PangoStyle PangoStyle_val(value val);
value Val_PangoTabAlign(PangoTabAlign val);
PangoTabAlign PangoTabAlign_val(value val);
value Val_PangoTextTransform(PangoTextTransform val);
PangoTextTransform PangoTextTransform_val(value val);
value Val_PangoUnderline(PangoUnderline val);
PangoUnderline PangoUnderline_val(value val);
value Val_PangoVariant(PangoVariant val);
PangoVariant PangoVariant_val(value val);
value Val_PangoWeight(PangoWeight val);
PangoWeight PangoWeight_val(value val);
value Val_PangoWrapMode(PangoWrapMode val);
PangoWrapMode PangoWrapMode_val(value val);
value Val_GdkAnchorHints(GdkAnchorHints flags);
GdkAnchorHints GdkAnchorHints_val(value list);
value Val_GdkAxisFlags(GdkAxisFlags flags);
GdkAxisFlags GdkAxisFlags_val(value list);
value Val_GdkDragAction(GdkDragAction flags);
GdkDragAction GdkDragAction_val(value list);
value Val_GdkFrameClockPhase(GdkFrameClockPhase flags);
GdkFrameClockPhase GdkFrameClockPhase_val(value list);
value Val_GdkGLAPI(GdkGLAPI flags);
GdkGLAPI GdkGLAPI_val(value list);
value Val_GdkModifierType(GdkModifierType flags);
GdkModifierType GdkModifierType_val(value list);
value Val_GdkPaintableFlags(GdkPaintableFlags flags);
GdkPaintableFlags GdkPaintableFlags_val(value list);
value Val_GdkSeatCapabilities(GdkSeatCapabilities flags);
GdkSeatCapabilities GdkSeatCapabilities_val(value list);
value Val_GdkToplevelState(GdkToplevelState flags);
GdkToplevelState GdkToplevelState_val(value list);
value Val_PangoFontMask(PangoFontMask flags);
PangoFontMask PangoFontMask_val(value list);
value Val_PangoLayoutDeserializeFlags(PangoLayoutDeserializeFlags flags);
PangoLayoutDeserializeFlags PangoLayoutDeserializeFlags_val(value list);
value Val_PangoLayoutSerializeFlags(PangoLayoutSerializeFlags flags);
PangoLayoutSerializeFlags PangoLayoutSerializeFlags_val(value list);
value Val_PangoShapeFlags(PangoShapeFlags flags);
PangoShapeFlags PangoShapeFlags_val(value list);
value Val_PangoShowFlags(PangoShowFlags flags);
PangoShowFlags PangoShowFlags_val(value list);


CAMLexport CAMLprim value ml_gtk_media_stream_update(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_media_stream_update(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_unrealize(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_media_stream_unrealize(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_unprepared(value self)
{
CAMLparam1(self);


    gtk_media_stream_unprepared(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_stream_unprepared(value self)
{
CAMLparam1(self);


    gtk_media_stream_stream_unprepared(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_stream_prepared(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_media_stream_stream_prepared(GtkWidget_val(self), Bool_val(arg1), Bool_val(arg2), Bool_val(arg3), arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_stream_ended(value self)
{
CAMLparam1(self);


    gtk_media_stream_stream_ended(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_seek_success(value self)
{
CAMLparam1(self);


    gtk_media_stream_seek_success(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_seek_failed(value self)
{
CAMLparam1(self);


    gtk_media_stream_seek_failed(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_seek(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_media_stream_seek(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_realize(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_media_stream_realize(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_prepared(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_media_stream_prepared(GtkWidget_val(self), Bool_val(arg1), Bool_val(arg2), Bool_val(arg3), arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_play(value self)
{
CAMLparam1(self);


    gtk_media_stream_play(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_pause(value self)
{
CAMLparam1(self);


    gtk_media_stream_pause(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_is_seeking(value self)
{
CAMLparam1(self);


    gboolean result = gtk_media_stream_is_seeking(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_is_seekable(value self)
{
CAMLparam1(self);


    gboolean result = gtk_media_stream_is_seekable(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_is_prepared(value self)
{
CAMLparam1(self);


    gboolean result = gtk_media_stream_is_prepared(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_has_video(value self)
{
CAMLparam1(self);


    gboolean result = gtk_media_stream_has_video(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_has_audio(value self)
{
CAMLparam1(self);


    gboolean result = gtk_media_stream_has_audio(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_media_stream_gerror(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_media_stream_gerror(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_error_valist(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_media_stream_error_valist(GtkWidget_val(self), arg1, Int_val(arg2), String_val(arg3), arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_ended(value self)
{
CAMLparam1(self);


    gtk_media_stream_ended(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_ended(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "ended", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_has_audio(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-audio", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_has_video(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-video", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_loop(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "loop", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_loop(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "loop", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_muted(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "muted", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_muted(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "muted", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_playing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "playing", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_playing(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "playing", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_prepared(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "prepared", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_prepared(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "prepared", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_seekable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "seekable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_seeking(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "seeking", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_get_volume(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "volume", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_media_stream_set_volume(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "volume", c_value, NULL);
CAMLreturn(Val_unit);
}
