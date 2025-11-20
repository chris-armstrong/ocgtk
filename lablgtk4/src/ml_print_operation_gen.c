/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PrintOperation */

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


CAMLexport CAMLprim value ml_gtk_print_operation_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_print_operation_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_unit(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_operation_set_unit(GtkWidget_val(self), GtkUnit_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_print_settings(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_operation_set_print_settings(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_defer_drawing(value self)
{
CAMLparam1(self);


    gtk_print_operation_set_defer_drawing(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_default_page_setup(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_operation_set_default_page_setup(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_run(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;


    GtkPrintOperationResult result = gtk_print_operation_run(GtkWidget_val(self), GtkPrintOperationAction_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GtkPrintOperationResult(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_print_operation_is_finished(value self)
{
CAMLparam1(self);


    gboolean result = gtk_print_operation_is_finished(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_status(value self)
{
CAMLparam1(self);


    GtkPrintStatus result = gtk_print_operation_get_status(GtkWidget_val(self));
CAMLreturn(Val_GtkPrintStatus(result));
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_print_settings(value self)
{
CAMLparam1(self);


    GtkPrintSettings* result = gtk_print_operation_get_print_settings(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_error(value self)
{
CAMLparam1(self);
GError *error = NULL;


    gtk_print_operation_get_error(GtkWidget_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(ValUnit)); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_default_page_setup(value self)
{
CAMLparam1(self);


    GtkPageSetup* result = gtk_print_operation_get_default_page_setup(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_print_operation_draw_page_finish(value self)
{
CAMLparam1(self);


    gtk_print_operation_draw_page_finish(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_cancel(value self)
{
CAMLparam1(self);


    gtk_print_operation_cancel(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_allow_async(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "allow-async", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_allow_async(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "allow-async", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_current_page(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "current-page", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_current_page(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "current-page", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_custom_tab_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "custom-tab-label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_custom_tab_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "custom-tab-label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_embed_page_setup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "embed-page-setup", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_embed_page_setup(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "embed-page-setup", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_export_filename(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "export-filename", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_export_filename(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "export-filename", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_has_selection(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-selection", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_has_selection(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-selection", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_job_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "job-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_job_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "job-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_n_pages(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "n-pages", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_n_pages(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "n-pages", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_n_pages_to_print(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "n-pages-to-print", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_show_progress(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-progress", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_show_progress(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-progress", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_status_string(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "status-string", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_support_selection(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "support-selection", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_support_selection(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "support-selection", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_track_print_status(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "track-print-status", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_track_print_status(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "track-print-status", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_use_full_page(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-full-page", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_use_full_page(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-full-page", c_value, NULL);
CAMLreturn(Val_unit);
}
