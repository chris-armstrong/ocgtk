/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellArea */

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


CAMLexport CAMLprim value ml_gtk_cell_area_stop_editing(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_area_stop_editing(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_snapshot_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam3(arg5, arg6, arg7);


    gtk_cell_area_snapshot(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), GtkWidget_val(arg3), arg4, arg5, GtkCellRendererState_val(arg6), Bool_val(arg7));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_snapshot_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_snapshot_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_set_focus_cell(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_area_set_focus_cell(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_request_renderer_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);


    gtk_cell_area_request_renderer(GtkWidget_val(self), GtkWidget_val(arg1), GtkOrientation_val(arg2), GtkWidget_val(arg3), Int_val(arg4), arg5, arg6);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_request_renderer_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_request_renderer_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_remove_focus_sibling(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_remove_focus_sibling(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_remove(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_area_remove(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_is_focus_sibling(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_cell_area_is_focus_sibling(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_is_activatable(value self)
{
CAMLparam1(self);


    gboolean result = gtk_cell_area_is_activatable(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_inner_cell_area(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_inner_cell_area(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_has_renderer(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_cell_area_has_renderer(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_request_mode(value self)
{
CAMLparam1(self);


    GtkSizeRequestMode result = gtk_cell_area_get_request_mode(GtkWidget_val(self));
CAMLreturn(Val_GtkSizeRequestMode(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_preferred_width_for_height_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_cell_area_get_preferred_width_for_height(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), Int_val(arg3), arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_preferred_width_for_height_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_get_preferred_width_for_height_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_preferred_width(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_cell_area_get_preferred_width(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), arg3, arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_preferred_height_for_width_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_cell_area_get_preferred_height_for_width(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), Int_val(arg3), arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_preferred_height_for_width_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_get_preferred_height_for_width_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_preferred_height(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_cell_area_get_preferred_height(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), arg3, arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_focus_from_sibling(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkCellRenderer* result = gtk_cell_area_get_focus_from_sibling(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_focus_cell(value self)
{
CAMLparam1(self);


    GtkCellRenderer* result = gtk_cell_area_get_focus_cell(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_edited_cell(value self)
{
CAMLparam1(self);


    GtkCellRenderer* result = gtk_cell_area_get_edited_cell(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_edit_widget(value self)
{
CAMLparam1(self);


    GtkCellEditable* result = gtk_cell_area_get_edit_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_current_path_string(value self)
{
CAMLparam1(self);


    const char* result = gtk_cell_area_get_current_path_string(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_cell_at_position_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);


    GtkCellRenderer* result = gtk_cell_area_get_cell_at_position(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), arg3, Int_val(arg4), Int_val(arg5), arg6);
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_cell_at_position_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_get_cell_at_position_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_cell_allocation_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_cell_area_get_cell_allocation(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), GtkWidget_val(arg3), arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_get_cell_allocation_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_get_cell_allocation_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_foreach_alloc_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);


    gtk_cell_area_foreach_alloc(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), arg3, arg4, arg5, arg6);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_foreach_alloc_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_foreach_alloc_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_foreach(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_foreach(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_focus(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_cell_area_focus(GtkWidget_val(self), GtkDirectionType_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_event_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    int result = gtk_cell_area_event(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), GdkEvent_val(arg3), arg4, GtkCellRendererState_val(arg5));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_event_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_event_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_create_context(value self)
{
CAMLparam1(self);


    GtkCellAreaContext* result = gtk_cell_area_create_context(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_copy_context(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkCellAreaContext* result = gtk_cell_area_copy_context(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_cell_set_valist(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_cell_set_valist(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_cell_set_property(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_cell_set_property(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_cell_get_valist(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_cell_get_valist(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_cell_get_property(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_cell_get_property(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_attribute_get_column(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    int result = gtk_cell_area_attribute_get_column(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_attribute_disconnect(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_attribute_disconnect(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_attribute_connect(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_area_attribute_connect(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_apply_attributes(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_cell_area_apply_attributes(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), Bool_val(arg3), Bool_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_add_focus_sibling(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_area_add_focus_sibling(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_add(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_area_add(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_area_activate_cell_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gboolean result = gtk_cell_area_activate_cell(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), GdkEvent_val(arg3), arg4, GtkCellRendererState_val(arg5));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_activate_cell_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_activate_cell_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_cell_area_activate_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gboolean result = gtk_cell_area_activate(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), arg3, GtkCellRendererState_val(arg4), Bool_val(arg5));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_area_activate_bytecode(value * argv, int argn)
{
return ml_gtk_cell_area_activate_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}
