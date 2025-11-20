/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeViewColumn */

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


CAMLexport CAMLprim value ml_gtk_tree_view_column_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_tree_view_column_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_new_with_area(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_tree_view_column_new_with_area(GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_new_with_attributes(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkWidget *widget = gtk_tree_view_column_new_with_attributes(String_val(arg1), GtkWidget_val(arg2), arg3);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_view_column_set_widget(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_sort_order(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_view_column_set_sort_order(GtkWidget_val(self), GtkSortType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_sizing(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_view_column_set_sizing(GtkWidget_val(self), GtkTreeViewColumnSizing_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_cell_data_func(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_tree_view_column_set_cell_data_func(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3, arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_queue_resize(value self)
{
CAMLparam1(self);


    gtk_tree_view_column_queue_resize(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_pack_start(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_view_column_pack_start(GtkWidget_val(self), GtkWidget_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_pack_end(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_view_column_pack_end(GtkWidget_val(self), GtkWidget_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_tree_view_column_get_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_tree_view(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_tree_view_column_get_tree_view(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_sort_order(value self)
{
CAMLparam1(self);


    GtkSortType result = gtk_tree_view_column_get_sort_order(GtkWidget_val(self));
CAMLreturn(Val_GtkSortType(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_sizing(value self)
{
CAMLparam1(self);


    GtkTreeViewColumnSizing result = gtk_tree_view_column_get_sizing(GtkWidget_val(self));
CAMLreturn(Val_GtkTreeViewColumnSizing(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_button(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_tree_view_column_get_button(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_focus_cell(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_view_column_focus_cell(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_clicked(value self)
{
CAMLparam1(self);


    gtk_tree_view_column_clicked(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_clear_attributes(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_view_column_clear_attributes(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_clear(value self)
{
CAMLparam1(self);


    gtk_tree_view_column_clear(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_cell_set_cell_data(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_tree_view_column_cell_set_cell_data(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), Bool_val(arg3), Bool_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_cell_is_visible(value self)
{
CAMLparam1(self);


    gboolean result = gtk_tree_view_column_cell_is_visible(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_cell_get_size(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_tree_view_column_cell_get_size(GtkWidget_val(self), arg1, arg2, arg3, arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_cell_get_position(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_tree_view_column_cell_get_position(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_add_attribute(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_tree_view_column_add_attribute(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_alignment(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "alignment", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_alignment(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "alignment", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_clickable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "clickable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_clickable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "clickable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_expand(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "expand", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_expand(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "expand", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_fixed_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "fixed-width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_fixed_width(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "fixed-width", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_max_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "max-width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_max_width(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-width", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_min_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "min-width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_min_width(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "min-width", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_reorderable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "reorderable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_reorderable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "reorderable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_resizable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "resizable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_resizable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "resizable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_sort_column_id(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "sort-column-id", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_sort_column_id(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "sort-column-id", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_sort_indicator(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "sort-indicator", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_sort_indicator(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "sort-indicator", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "spacing", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_spacing(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "spacing", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "title", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_title(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "title", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_visible(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "visible", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_set_visible(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "visible", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tree_view_column_get_x_offset(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "x-offset", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
