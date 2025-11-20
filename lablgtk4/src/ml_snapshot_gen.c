/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Snapshot */

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


CAMLexport CAMLprim value ml_gtk_snapshot_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_snapshot_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_snapshot_translate_3d(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_snapshot_translate_3d(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_translate(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_snapshot_translate(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_transform_matrix(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_snapshot_transform_matrix(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_transform(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_snapshot_transform(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_scale_3d(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_snapshot_scale_3d(GtkWidget_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_scale(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_snapshot_scale(GtkWidget_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_save(value self)
{
CAMLparam1(self);


    gtk_snapshot_save(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_rotate_3d(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_snapshot_rotate_3d(GtkWidget_val(self), Double_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_rotate(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_snapshot_rotate(GtkWidget_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_restore(value self)
{
CAMLparam1(self);


    gtk_snapshot_restore(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_layout(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_snapshot_render_layout(GtkWidget_val(self), GtkWidget_val(arg1), Double_val(arg2), Double_val(arg3), arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_insertion_cursor_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);


    gtk_snapshot_render_insertion_cursor(GtkWidget_val(self), GtkWidget_val(arg1), Double_val(arg2), Double_val(arg3), arg4, Int_val(arg5), PangoDirection_val(arg6));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_insertion_cursor_bytecode(value * argv, int argn)
{
return ml_gtk_snapshot_render_insertion_cursor_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_frame_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_snapshot_render_frame(GtkWidget_val(self), GtkWidget_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_frame_bytecode(value * argv, int argn)
{
return ml_gtk_snapshot_render_frame_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_focus_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_snapshot_render_focus(GtkWidget_val(self), GtkWidget_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_focus_bytecode(value * argv, int argn)
{
return ml_gtk_snapshot_render_focus_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_background_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_snapshot_render_background(GtkWidget_val(self), GtkWidget_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_background_bytecode(value * argv, int argn)
{
return ml_gtk_snapshot_render_background_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_stroke(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_snapshot_push_stroke(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_shadow(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_snapshot_push_shadow(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_rounded_clip(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_snapshot_push_rounded_clip(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_repeat(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_snapshot_push_repeat(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_opacity(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_snapshot_push_opacity(GtkWidget_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_mask(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_snapshot_push_mask(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_gl_shader(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_snapshot_push_gl_shader(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_fill(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_snapshot_push_fill(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_cross_fade(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_snapshot_push_cross_fade(GtkWidget_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_color_matrix(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_snapshot_push_color_matrix(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_clip(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_snapshot_push_clip(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_blur(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_snapshot_push_blur(GtkWidget_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_blend(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_snapshot_push_blend(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_pop(value self)
{
CAMLparam1(self);


    gtk_snapshot_pop(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_perspective(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_snapshot_perspective(GtkWidget_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_gl_shader_pop_texture(value self)
{
CAMLparam1(self);


    gtk_snapshot_gl_shader_pop_texture(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_texture(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_snapshot_append_texture(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_stroke(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_snapshot_append_stroke(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_scaled_texture(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_snapshot_append_scaled_texture(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_repeating_radial_gradient_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7, value arg8)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam4(arg5, arg6, arg7, arg8);


    gtk_snapshot_append_repeating_radial_gradient(GtkWidget_val(self), arg1, arg2, Double_val(arg3), Double_val(arg4), Double_val(arg5), Double_val(arg6), arg7, arg8);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_repeating_radial_gradient_bytecode(value * argv, int argn)
{
return ml_gtk_snapshot_append_repeating_radial_gradient_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8]);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_repeating_linear_gradient_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_snapshot_append_repeating_linear_gradient(GtkWidget_val(self), arg1, arg2, arg3, arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_repeating_linear_gradient_bytecode(value * argv, int argn)
{
return ml_gtk_snapshot_append_repeating_linear_gradient_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_radial_gradient_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7, value arg8)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam4(arg5, arg6, arg7, arg8);


    gtk_snapshot_append_radial_gradient(GtkWidget_val(self), arg1, arg2, Double_val(arg3), Double_val(arg4), Double_val(arg5), Double_val(arg6), arg7, arg8);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_radial_gradient_bytecode(value * argv, int argn)
{
return ml_gtk_snapshot_append_radial_gradient_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8]);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_outset_shadow_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);


    gtk_snapshot_append_outset_shadow(GtkWidget_val(self), arg1, arg2, Double_val(arg3), Double_val(arg4), Double_val(arg5), Double_val(arg6));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_outset_shadow_bytecode(value * argv, int argn)
{
return ml_gtk_snapshot_append_outset_shadow_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_node(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_snapshot_append_node(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_linear_gradient_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_snapshot_append_linear_gradient(GtkWidget_val(self), arg1, arg2, arg3, arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_linear_gradient_bytecode(value * argv, int argn)
{
return ml_gtk_snapshot_append_linear_gradient_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_layout(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_snapshot_append_layout(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_inset_shadow_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);


    gtk_snapshot_append_inset_shadow(GtkWidget_val(self), arg1, arg2, Double_val(arg3), Double_val(arg4), Double_val(arg5), Double_val(arg6));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_inset_shadow_bytecode(value * argv, int argn)
{
return ml_gtk_snapshot_append_inset_shadow_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_fill(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_snapshot_append_fill(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_conic_gradient_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_snapshot_append_conic_gradient(GtkWidget_val(self), arg1, arg2, Double_val(arg3), arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_conic_gradient_bytecode(value * argv, int argn)
{
return ml_gtk_snapshot_append_conic_gradient_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_color(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_snapshot_append_color(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_append_border(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_snapshot_append_border(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}
