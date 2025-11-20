/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TextBuffer */

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


CAMLexport CAMLprim value ml_gtk_text_buffer_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_text_buffer_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_undo(value self)
{
CAMLparam1(self);


    gtk_text_buffer_undo(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_set_modified(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_set_modified(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_set_max_undo_levels(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_set_max_undo_levels(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_select_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_select_range(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_remove_tag_by_name(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_buffer_remove_tag_by_name(GtkWidget_val(self), String_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_remove_tag(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_buffer_remove_tag(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_remove_selection_clipboard(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_remove_selection_clipboard(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_remove_all_tags(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_remove_all_tags(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_redo(value self)
{
CAMLparam1(self);


    gtk_text_buffer_redo(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_place_cursor(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_place_cursor(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_paste_clipboard(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_buffer_paste_clipboard(GtkWidget_val(self), arg1, (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), Bool_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_move_mark_by_name(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_move_mark_by_name(GtkWidget_val(self), String_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_move_mark(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_move_mark(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert_range_interactive(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gboolean result = gtk_text_buffer_insert_range_interactive(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3, Bool_val(arg4));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert_range(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_buffer_insert_range(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert_paintable(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_insert_paintable(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert_markup(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_buffer_insert_markup(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert_interactive_at_cursor(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_text_buffer_insert_interactive_at_cursor(GtkWidget_val(self), String_val(arg1), Int_val(arg2), Bool_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert_interactive(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gboolean result = gtk_text_buffer_insert_interactive(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), Int_val(arg3), Bool_val(arg4));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert_child_anchor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_insert_child_anchor(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert_at_cursor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_insert_at_cursor(GtkWidget_val(self), String_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_buffer_insert(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_tag_table(value self)
{
CAMLparam1(self);


    GtkTextTagTable* result = gtk_text_buffer_get_tag_table(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_start_iter(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_get_start_iter(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_selection_bounds(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_text_buffer_get_selection_bounds(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_selection_bound(value self)
{
CAMLparam1(self);


    GtkTextMark* result = gtk_text_buffer_get_selection_bound(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_modified(value self)
{
CAMLparam1(self);


    gboolean result = gtk_text_buffer_get_modified(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_max_undo_levels(value self)
{
CAMLparam1(self);


    guint result = gtk_text_buffer_get_max_undo_levels(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_mark(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkTextMark* result = gtk_text_buffer_get_mark(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_line_count(value self)
{
CAMLparam1(self);


    int result = gtk_text_buffer_get_line_count(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_iter_at_offset(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_get_iter_at_offset(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_iter_at_mark(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_get_iter_at_mark(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_iter_at_line_offset(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_text_buffer_get_iter_at_line_offset(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_iter_at_line_index(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_text_buffer_get_iter_at_line_index(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_iter_at_line(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_text_buffer_get_iter_at_line(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_iter_at_child_anchor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_get_iter_at_child_anchor(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_insert(value self)
{
CAMLparam1(self);


    GtkTextMark* result = gtk_text_buffer_get_insert(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_end_iter(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_get_end_iter(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_char_count(value self)
{
CAMLparam1(self);


    int result = gtk_text_buffer_get_char_count(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_bounds(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_get_bounds(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_end_user_action(value self)
{
CAMLparam1(self);


    gtk_text_buffer_end_user_action(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_end_irreversible_action(value self)
{
CAMLparam1(self);


    gtk_text_buffer_end_irreversible_action(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_delete_selection(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_text_buffer_delete_selection(GtkWidget_val(self), Bool_val(arg1), Bool_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_delete_mark_by_name(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_delete_mark_by_name(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_delete_mark(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_delete_mark(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_delete_interactive(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_text_buffer_delete_interactive(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), Bool_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_delete(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_delete(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_cut_clipboard(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_cut_clipboard(GtkWidget_val(self), arg1, Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_create_mark(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    GtkTextMark* result = gtk_text_buffer_create_mark(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), arg2, Bool_val(arg3));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_create_child_anchor(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkTextChildAnchor* result = gtk_text_buffer_create_child_anchor(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_copy_clipboard(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_copy_clipboard(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_begin_user_action(value self)
{
CAMLparam1(self);


    gtk_text_buffer_begin_user_action(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_begin_irreversible_action(value self)
{
CAMLparam1(self);


    gtk_text_buffer_begin_irreversible_action(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_backspace(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_text_buffer_backspace(GtkWidget_val(self), GtkWidget_val(arg1), Bool_val(arg2), Bool_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_apply_tag_by_name(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_buffer_apply_tag_by_name(GtkWidget_val(self), String_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_apply_tag(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_buffer_apply_tag(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_add_selection_clipboard(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_add_selection_clipboard(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_add_mark(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_add_mark(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_can_redo(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "can-redo", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_can_undo(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "can-undo", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_cursor_position(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "cursor-position", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_enable_undo(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "enable-undo", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_set_enable_undo(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "enable-undo", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_has_selection(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-selection", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_set_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "text", c_value, NULL);
CAMLreturn(Val_unit);
}
