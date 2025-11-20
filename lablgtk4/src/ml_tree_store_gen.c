/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeStore */

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


CAMLexport CAMLprim value ml_gtk_tree_store_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_tree_store_new(Int_val(arg1), arg2);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_tree_store_newv(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_tree_store_newv(Int_val(arg1), arg2);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_tree_store_swap(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_store_swap(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_set_valuesv(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_tree_store_set_valuesv(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3, Int_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_set_value(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_tree_store_set_value(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_set_valist(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_store_set_valist(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_set_column_types(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_store_set_column_types(GtkWidget_val(self), Int_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_reorder(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_store_reorder(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_remove(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_store_remove(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_store_prepend(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_store_prepend(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_move_before(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_store_move_before(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_move_after(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_store_move_after(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_iter_is_valid(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_store_iter_is_valid(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_store_iter_depth(value self, value arg1)
{
CAMLparam2(self, arg1);


    int result = gtk_tree_store_iter_depth(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_store_is_ancestor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_store_is_ancestor(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_store_insert_with_valuesv_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);


    gtk_tree_store_insert_with_valuesv(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), Int_val(arg3), arg4, arg5, Int_val(arg6));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_insert_with_valuesv_bytecode(value * argv, int argn)
{
return ml_gtk_tree_store_insert_with_valuesv_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_tree_store_insert_before(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_tree_store_insert_before(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), (Is_some(arg3) ? GtkWidget_val(Some_val(arg3)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_insert_after(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_tree_store_insert_after(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), (Is_some(arg3) ? GtkWidget_val(Some_val(arg3)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_insert(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_tree_store_insert(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_clear(value self)
{
CAMLparam1(self);


    gtk_tree_store_clear(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_store_append(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_store_append(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}
