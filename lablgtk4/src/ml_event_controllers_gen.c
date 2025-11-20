/* GENERATED CODE - DO NOT EDIT */
/* Generated from Gtk-4.0.gir */

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

/* Convert GtkAccessibleAnnouncementPriority to OCaml value */
value Val_GtkAccessibleAnnouncementPriority(GtkAccessibleAnnouncementPriority val) {
  switch (val) {
    case GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_LOW: return Val_int(1031179617); /* `LOW */
    case GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_MEDIUM: return Val_int(57925782); /* `MEDIUM */
    case GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_HIGH: return Val_int(418746517); /* `HIGH */
    default: return Val_int(1031179617); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleAnnouncementPriority */
GtkAccessibleAnnouncementPriority GtkAccessibleAnnouncementPriority_val(value val) {
  int tag = Int_val(val);
  if (tag == 1031179617) return GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_LOW; /* `LOW */
  else if (tag == 57925782) return GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_MEDIUM; /* `MEDIUM */
  else if (tag == 418746517) return GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_HIGH; /* `HIGH */
  else return GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_LOW; /* fallback to first value */
}

/* Convert GtkAccessibleAutocomplete to OCaml value */
value Val_GtkAccessibleAutocomplete(GtkAccessibleAutocomplete val) {
  switch (val) {
    case GTK_ACCESSIBLE_AUTOCOMPLETE_NONE: return Val_int(37469934); /* `NONE */
    case GTK_ACCESSIBLE_AUTOCOMPLETE_INLINE: return Val_int(169111525); /* `INLINE */
    case GTK_ACCESSIBLE_AUTOCOMPLETE_LIST: return Val_int(447133042); /* `LIST */
    case GTK_ACCESSIBLE_AUTOCOMPLETE_BOTH: return Val_int(85085456); /* `BOTH */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleAutocomplete */
GtkAccessibleAutocomplete GtkAccessibleAutocomplete_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_ACCESSIBLE_AUTOCOMPLETE_NONE; /* `NONE */
  else if (tag == 169111525) return GTK_ACCESSIBLE_AUTOCOMPLETE_INLINE; /* `INLINE */
  else if (tag == 447133042) return GTK_ACCESSIBLE_AUTOCOMPLETE_LIST; /* `LIST */
  else if (tag == 85085456) return GTK_ACCESSIBLE_AUTOCOMPLETE_BOTH; /* `BOTH */
  else return GTK_ACCESSIBLE_AUTOCOMPLETE_NONE; /* fallback to first value */
}

/* Convert GtkAccessibleInvalidState to OCaml value */
value Val_GtkAccessibleInvalidState(GtkAccessibleInvalidState val) {
  switch (val) {
    case GTK_ACCESSIBLE_INVALID_FALSE: return Val_int(605455126); /* `FALSE */
    case GTK_ACCESSIBLE_INVALID_TRUE: return Val_int(584682644); /* `TRUE */
    case GTK_ACCESSIBLE_INVALID_GRAMMAR: return Val_int(610298207); /* `GRAMMAR */
    case GTK_ACCESSIBLE_INVALID_SPELLING: return Val_int(601127279); /* `SPELLING */
    default: return Val_int(605455126); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleInvalidState */
GtkAccessibleInvalidState GtkAccessibleInvalidState_val(value val) {
  int tag = Int_val(val);
  if (tag == 605455126) return GTK_ACCESSIBLE_INVALID_FALSE; /* `FALSE */
  else if (tag == 584682644) return GTK_ACCESSIBLE_INVALID_TRUE; /* `TRUE */
  else if (tag == 610298207) return GTK_ACCESSIBLE_INVALID_GRAMMAR; /* `GRAMMAR */
  else if (tag == 601127279) return GTK_ACCESSIBLE_INVALID_SPELLING; /* `SPELLING */
  else return GTK_ACCESSIBLE_INVALID_FALSE; /* fallback to first value */
}

/* Convert GtkAccessiblePlatformState to OCaml value */
value Val_GtkAccessiblePlatformState(GtkAccessiblePlatformState val) {
  switch (val) {
    case GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSABLE: return Val_int(1039811737); /* `FOCUSABLE */
    case GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSED: return Val_int(759380304); /* `FOCUSED */
    case GTK_ACCESSIBLE_PLATFORM_STATE_ACTIVE: return Val_int(1031974070); /* `ACTIVE */
    default: return Val_int(1039811737); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessiblePlatformState */
GtkAccessiblePlatformState GtkAccessiblePlatformState_val(value val) {
  int tag = Int_val(val);
  if (tag == 1039811737) return GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSABLE; /* `FOCUSABLE */
  else if (tag == 759380304) return GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSED; /* `FOCUSED */
  else if (tag == 1031974070) return GTK_ACCESSIBLE_PLATFORM_STATE_ACTIVE; /* `ACTIVE */
  else return GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSABLE; /* fallback to first value */
}

/* Convert GtkAccessibleProperty to OCaml value */
value Val_GtkAccessibleProperty(GtkAccessibleProperty val) {
  switch (val) {
    case GTK_ACCESSIBLE_PROPERTY_AUTOCOMPLETE: return Val_int(98351298); /* `AUTOCOMPLETE */
    case GTK_ACCESSIBLE_PROPERTY_DESCRIPTION: return Val_int(585667230); /* `DESCRIPTION */
    case GTK_ACCESSIBLE_PROPERTY_HAS_POPUP: return Val_int(607988674); /* `HAS_POPUP */
    case GTK_ACCESSIBLE_PROPERTY_KEY_SHORTCUTS: return Val_int(801583629); /* `KEY_SHORTCUTS */
    case GTK_ACCESSIBLE_PROPERTY_LABEL: return Val_int(153566446); /* `LABEL */
    case GTK_ACCESSIBLE_PROPERTY_LEVEL: return Val_int(95082182); /* `LEVEL */
    case GTK_ACCESSIBLE_PROPERTY_MODAL: return Val_int(1053440038); /* `MODAL */
    case GTK_ACCESSIBLE_PROPERTY_MULTI_LINE: return Val_int(153589072); /* `MULTI_LINE */
    case GTK_ACCESSIBLE_PROPERTY_MULTI_SELECTABLE: return Val_int(525220273); /* `MULTI_SELECTABLE */
    case GTK_ACCESSIBLE_PROPERTY_ORIENTATION: return Val_int(869290037); /* `ORIENTATION */
    case GTK_ACCESSIBLE_PROPERTY_PLACEHOLDER: return Val_int(929206018); /* `PLACEHOLDER */
    case GTK_ACCESSIBLE_PROPERTY_READ_ONLY: return Val_int(656961452); /* `READ_ONLY */
    case GTK_ACCESSIBLE_PROPERTY_REQUIRED: return Val_int(518474020); /* `REQUIRED */
    case GTK_ACCESSIBLE_PROPERTY_ROLE_DESCRIPTION: return Val_int(414154459); /* `ROLE_DESCRIPTION */
    case GTK_ACCESSIBLE_PROPERTY_SORT: return Val_int(365905844); /* `SORT */
    case GTK_ACCESSIBLE_PROPERTY_VALUE_MAX: return Val_int(812067172); /* `VALUE_MAX */
    case GTK_ACCESSIBLE_PROPERTY_VALUE_MIN: return Val_int(695519634); /* `VALUE_MIN */
    case GTK_ACCESSIBLE_PROPERTY_VALUE_NOW: return Val_int(791822956); /* `VALUE_NOW */
    case GTK_ACCESSIBLE_PROPERTY_VALUE_TEXT: return Val_int(577081840); /* `VALUE_TEXT */
    default: return Val_int(98351298); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleProperty */
GtkAccessibleProperty GtkAccessibleProperty_val(value val) {
  int tag = Int_val(val);
  if (tag == 98351298) return GTK_ACCESSIBLE_PROPERTY_AUTOCOMPLETE; /* `AUTOCOMPLETE */
  else if (tag == 585667230) return GTK_ACCESSIBLE_PROPERTY_DESCRIPTION; /* `DESCRIPTION */
  else if (tag == 607988674) return GTK_ACCESSIBLE_PROPERTY_HAS_POPUP; /* `HAS_POPUP */
  else if (tag == 801583629) return GTK_ACCESSIBLE_PROPERTY_KEY_SHORTCUTS; /* `KEY_SHORTCUTS */
  else if (tag == 153566446) return GTK_ACCESSIBLE_PROPERTY_LABEL; /* `LABEL */
  else if (tag == 95082182) return GTK_ACCESSIBLE_PROPERTY_LEVEL; /* `LEVEL */
  else if (tag == 1053440038) return GTK_ACCESSIBLE_PROPERTY_MODAL; /* `MODAL */
  else if (tag == 153589072) return GTK_ACCESSIBLE_PROPERTY_MULTI_LINE; /* `MULTI_LINE */
  else if (tag == 525220273) return GTK_ACCESSIBLE_PROPERTY_MULTI_SELECTABLE; /* `MULTI_SELECTABLE */
  else if (tag == 869290037) return GTK_ACCESSIBLE_PROPERTY_ORIENTATION; /* `ORIENTATION */
  else if (tag == 929206018) return GTK_ACCESSIBLE_PROPERTY_PLACEHOLDER; /* `PLACEHOLDER */
  else if (tag == 656961452) return GTK_ACCESSIBLE_PROPERTY_READ_ONLY; /* `READ_ONLY */
  else if (tag == 518474020) return GTK_ACCESSIBLE_PROPERTY_REQUIRED; /* `REQUIRED */
  else if (tag == 414154459) return GTK_ACCESSIBLE_PROPERTY_ROLE_DESCRIPTION; /* `ROLE_DESCRIPTION */
  else if (tag == 365905844) return GTK_ACCESSIBLE_PROPERTY_SORT; /* `SORT */
  else if (tag == 812067172) return GTK_ACCESSIBLE_PROPERTY_VALUE_MAX; /* `VALUE_MAX */
  else if (tag == 695519634) return GTK_ACCESSIBLE_PROPERTY_VALUE_MIN; /* `VALUE_MIN */
  else if (tag == 791822956) return GTK_ACCESSIBLE_PROPERTY_VALUE_NOW; /* `VALUE_NOW */
  else if (tag == 577081840) return GTK_ACCESSIBLE_PROPERTY_VALUE_TEXT; /* `VALUE_TEXT */
  else return GTK_ACCESSIBLE_PROPERTY_AUTOCOMPLETE; /* fallback to first value */
}

/* Convert GtkAccessibleRelation to OCaml value */
value Val_GtkAccessibleRelation(GtkAccessibleRelation val) {
  switch (val) {
    case GTK_ACCESSIBLE_RELATION_ACTIVE_DESCENDANT: return Val_int(329690456); /* `ACTIVE_DESCENDANT */
    case GTK_ACCESSIBLE_RELATION_COL_COUNT: return Val_int(237539836); /* `COL_COUNT */
    case GTK_ACCESSIBLE_RELATION_COL_INDEX: return Val_int(817291654); /* `COL_INDEX */
    case GTK_ACCESSIBLE_RELATION_COL_INDEX_TEXT: return Val_int(164938722); /* `COL_INDEX_TEXT */
    case GTK_ACCESSIBLE_RELATION_COL_SPAN: return Val_int(291720906); /* `COL_SPAN */
    case GTK_ACCESSIBLE_RELATION_CONTROLS: return Val_int(883641607); /* `CONTROLS */
    case GTK_ACCESSIBLE_RELATION_DESCRIBED_BY: return Val_int(267913042); /* `DESCRIBED_BY */
    case GTK_ACCESSIBLE_RELATION_DETAILS: return Val_int(961912293); /* `DETAILS */
    case GTK_ACCESSIBLE_RELATION_ERROR_MESSAGE: return Val_int(951237781); /* `ERROR_MESSAGE */
    case GTK_ACCESSIBLE_RELATION_FLOW_TO: return Val_int(200157689); /* `FLOW_TO */
    case GTK_ACCESSIBLE_RELATION_LABELLED_BY: return Val_int(1062778041); /* `LABELLED_BY */
    case GTK_ACCESSIBLE_RELATION_OWNS: return Val_int(325362685); /* `OWNS */
    case GTK_ACCESSIBLE_RELATION_POS_IN_SET: return Val_int(708352399); /* `POS_IN_SET */
    case GTK_ACCESSIBLE_RELATION_ROW_COUNT: return Val_int(130881613); /* `ROW_COUNT */
    case GTK_ACCESSIBLE_RELATION_ROW_INDEX: return Val_int(975410065); /* `ROW_INDEX */
    case GTK_ACCESSIBLE_RELATION_ROW_INDEX_TEXT: return Val_int(1056846402); /* `ROW_INDEX_TEXT */
    case GTK_ACCESSIBLE_RELATION_ROW_SPAN: return Val_int(601428686); /* `ROW_SPAN */
    case GTK_ACCESSIBLE_RELATION_SET_SIZE: return Val_int(773014800); /* `SET_SIZE */
    default: return Val_int(329690456); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleRelation */
GtkAccessibleRelation GtkAccessibleRelation_val(value val) {
  int tag = Int_val(val);
  if (tag == 329690456) return GTK_ACCESSIBLE_RELATION_ACTIVE_DESCENDANT; /* `ACTIVE_DESCENDANT */
  else if (tag == 237539836) return GTK_ACCESSIBLE_RELATION_COL_COUNT; /* `COL_COUNT */
  else if (tag == 817291654) return GTK_ACCESSIBLE_RELATION_COL_INDEX; /* `COL_INDEX */
  else if (tag == 164938722) return GTK_ACCESSIBLE_RELATION_COL_INDEX_TEXT; /* `COL_INDEX_TEXT */
  else if (tag == 291720906) return GTK_ACCESSIBLE_RELATION_COL_SPAN; /* `COL_SPAN */
  else if (tag == 883641607) return GTK_ACCESSIBLE_RELATION_CONTROLS; /* `CONTROLS */
  else if (tag == 267913042) return GTK_ACCESSIBLE_RELATION_DESCRIBED_BY; /* `DESCRIBED_BY */
  else if (tag == 961912293) return GTK_ACCESSIBLE_RELATION_DETAILS; /* `DETAILS */
  else if (tag == 951237781) return GTK_ACCESSIBLE_RELATION_ERROR_MESSAGE; /* `ERROR_MESSAGE */
  else if (tag == 200157689) return GTK_ACCESSIBLE_RELATION_FLOW_TO; /* `FLOW_TO */
  else if (tag == 1062778041) return GTK_ACCESSIBLE_RELATION_LABELLED_BY; /* `LABELLED_BY */
  else if (tag == 325362685) return GTK_ACCESSIBLE_RELATION_OWNS; /* `OWNS */
  else if (tag == 708352399) return GTK_ACCESSIBLE_RELATION_POS_IN_SET; /* `POS_IN_SET */
  else if (tag == 130881613) return GTK_ACCESSIBLE_RELATION_ROW_COUNT; /* `ROW_COUNT */
  else if (tag == 975410065) return GTK_ACCESSIBLE_RELATION_ROW_INDEX; /* `ROW_INDEX */
  else if (tag == 1056846402) return GTK_ACCESSIBLE_RELATION_ROW_INDEX_TEXT; /* `ROW_INDEX_TEXT */
  else if (tag == 601428686) return GTK_ACCESSIBLE_RELATION_ROW_SPAN; /* `ROW_SPAN */
  else if (tag == 773014800) return GTK_ACCESSIBLE_RELATION_SET_SIZE; /* `SET_SIZE */
  else return GTK_ACCESSIBLE_RELATION_ACTIVE_DESCENDANT; /* fallback to first value */
}

/* Convert GtkAccessibleRole to OCaml value */
value Val_GtkAccessibleRole(GtkAccessibleRole val) {
  switch (val) {
    case GTK_ACCESSIBLE_ROLE_ALERT: return Val_int(231927082); /* `ALERT */
    case GTK_ACCESSIBLE_ROLE_ALERT_DIALOG: return Val_int(393243050); /* `ALERT_DIALOG */
    case GTK_ACCESSIBLE_ROLE_BANNER: return Val_int(1033603728); /* `BANNER */
    case GTK_ACCESSIBLE_ROLE_BUTTON: return Val_int(536988399); /* `BUTTON */
    case GTK_ACCESSIBLE_ROLE_CAPTION: return Val_int(925298702); /* `CAPTION */
    case GTK_ACCESSIBLE_ROLE_CELL: return Val_int(294115967); /* `CELL */
    case GTK_ACCESSIBLE_ROLE_CHECKBOX: return Val_int(810490032); /* `CHECKBOX */
    case GTK_ACCESSIBLE_ROLE_COLUMN_HEADER: return Val_int(346339614); /* `COLUMN_HEADER */
    case GTK_ACCESSIBLE_ROLE_COMBO_BOX: return Val_int(972446394); /* `COMBO_BOX */
    case GTK_ACCESSIBLE_ROLE_COMMAND: return Val_int(839472956); /* `COMMAND */
    case GTK_ACCESSIBLE_ROLE_COMPOSITE: return Val_int(75245936); /* `COMPOSITE */
    case GTK_ACCESSIBLE_ROLE_DIALOG: return Val_int(653792617); /* `DIALOG */
    case GTK_ACCESSIBLE_ROLE_DOCUMENT: return Val_int(1070368755); /* `DOCUMENT */
    case GTK_ACCESSIBLE_ROLE_FEED: return Val_int(979987503); /* `FEED */
    case GTK_ACCESSIBLE_ROLE_FORM: return Val_int(854496763); /* `FORM */
    case GTK_ACCESSIBLE_ROLE_GENERIC: return Val_int(504479289); /* `GENERIC */
    case GTK_ACCESSIBLE_ROLE_GRID: return Val_int(262421716); /* `GRID */
    case GTK_ACCESSIBLE_ROLE_GRID_CELL: return Val_int(34797617); /* `GRID_CELL */
    case GTK_ACCESSIBLE_ROLE_GROUP: return Val_int(880735546); /* `GROUP */
    case GTK_ACCESSIBLE_ROLE_HEADING: return Val_int(186703449); /* `HEADING */
    case GTK_ACCESSIBLE_ROLE_IMG: return Val_int(378083867); /* `IMG */
    case GTK_ACCESSIBLE_ROLE_INPUT: return Val_int(668464415); /* `INPUT */
    case GTK_ACCESSIBLE_ROLE_LABEL: return Val_int(153566446); /* `LABEL */
    case GTK_ACCESSIBLE_ROLE_LANDMARK: return Val_int(234268572); /* `LANDMARK */
    case GTK_ACCESSIBLE_ROLE_LEGEND: return Val_int(173414741); /* `LEGEND */
    case GTK_ACCESSIBLE_ROLE_LINK: return Val_int(869638750); /* `LINK */
    case GTK_ACCESSIBLE_ROLE_LIST: return Val_int(447133042); /* `LIST */
    case GTK_ACCESSIBLE_ROLE_LIST_BOX: return Val_int(676098803); /* `LIST_BOX */
    case GTK_ACCESSIBLE_ROLE_LIST_ITEM: return Val_int(272885002); /* `LIST_ITEM */
    case GTK_ACCESSIBLE_ROLE_LOG: return Val_int(97704467); /* `LOG */
    case GTK_ACCESSIBLE_ROLE_MAIN: return Val_int(908043586); /* `MAIN */
    case GTK_ACCESSIBLE_ROLE_MARQUEE: return Val_int(80160723); /* `MARQUEE */
    case GTK_ACCESSIBLE_ROLE_MATH: return Val_int(629453739); /* `MATH */
    case GTK_ACCESSIBLE_ROLE_METER: return Val_int(1066941833); /* `METER */
    case GTK_ACCESSIBLE_ROLE_MENU: return Val_int(132107627); /* `MENU */
    case GTK_ACCESSIBLE_ROLE_MENU_BAR: return Val_int(513770443); /* `MENU_BAR */
    case GTK_ACCESSIBLE_ROLE_MENU_ITEM: return Val_int(398709394); /* `MENU_ITEM */
    case GTK_ACCESSIBLE_ROLE_MENU_ITEM_CHECKBOX: return Val_int(764639143); /* `MENU_ITEM_CHECKBOX */
    case GTK_ACCESSIBLE_ROLE_MENU_ITEM_RADIO: return Val_int(820766485); /* `MENU_ITEM_RADIO */
    case GTK_ACCESSIBLE_ROLE_NAVIGATION: return Val_int(577115963); /* `NAVIGATION */
    case GTK_ACCESSIBLE_ROLE_NONE: return Val_int(37469934); /* `NONE */
    case GTK_ACCESSIBLE_ROLE_NOTE: return Val_int(900641892); /* `NOTE */
    case GTK_ACCESSIBLE_ROLE_OPTION: return Val_int(1009334281); /* `OPTION */
    case GTK_ACCESSIBLE_ROLE_PRESENTATION: return Val_int(259023094); /* `PRESENTATION */
    case GTK_ACCESSIBLE_ROLE_PROGRESS_BAR: return Val_int(91324598); /* `PROGRESS_BAR */
    case GTK_ACCESSIBLE_ROLE_RADIO: return Val_int(157462220); /* `RADIO */
    case GTK_ACCESSIBLE_ROLE_RADIO_GROUP: return Val_int(829441459); /* `RADIO_GROUP */
    case GTK_ACCESSIBLE_ROLE_RANGE: return Val_int(541071338); /* `RANGE */
    case GTK_ACCESSIBLE_ROLE_REGION: return Val_int(579215179); /* `REGION */
    case GTK_ACCESSIBLE_ROLE_ROW: return Val_int(732717544); /* `ROW */
    case GTK_ACCESSIBLE_ROLE_ROW_GROUP: return Val_int(32797801); /* `ROW_GROUP */
    case GTK_ACCESSIBLE_ROLE_ROW_HEADER: return Val_int(493125700); /* `ROW_HEADER */
    case GTK_ACCESSIBLE_ROLE_SCROLLBAR: return Val_int(883138067); /* `SCROLLBAR */
    case GTK_ACCESSIBLE_ROLE_SEARCH: return Val_int(622394263); /* `SEARCH */
    case GTK_ACCESSIBLE_ROLE_SEARCH_BOX: return Val_int(693850972); /* `SEARCH_BOX */
    case GTK_ACCESSIBLE_ROLE_SECTION: return Val_int(825760877); /* `SECTION */
    case GTK_ACCESSIBLE_ROLE_SECTION_HEAD: return Val_int(38054874); /* `SECTION_HEAD */
    case GTK_ACCESSIBLE_ROLE_SELECT: return Val_int(455248459); /* `SELECT */
    case GTK_ACCESSIBLE_ROLE_SEPARATOR: return Val_int(28044232); /* `SEPARATOR */
    case GTK_ACCESSIBLE_ROLE_SLIDER: return Val_int(32742794); /* `SLIDER */
    case GTK_ACCESSIBLE_ROLE_SPIN_BUTTON: return Val_int(100151920); /* `SPIN_BUTTON */
    case GTK_ACCESSIBLE_ROLE_STATUS: return Val_int(462200104); /* `STATUS */
    case GTK_ACCESSIBLE_ROLE_STRUCTURE: return Val_int(323761272); /* `STRUCTURE */
    case GTK_ACCESSIBLE_ROLE_SWITCH: return Val_int(161129457); /* `SWITCH */
    case GTK_ACCESSIBLE_ROLE_TAB: return Val_int(789765117); /* `TAB */
    case GTK_ACCESSIBLE_ROLE_TABLE: return Val_int(885532417); /* `TABLE */
    case GTK_ACCESSIBLE_ROLE_TAB_LIST: return Val_int(623574907); /* `TAB_LIST */
    case GTK_ACCESSIBLE_ROLE_TAB_PANEL: return Val_int(275228458); /* `TAB_PANEL */
    case GTK_ACCESSIBLE_ROLE_TEXT_BOX: return Val_int(858770883); /* `TEXT_BOX */
    case GTK_ACCESSIBLE_ROLE_TIME: return Val_int(266835411); /* `TIME */
    case GTK_ACCESSIBLE_ROLE_TIMER: return Val_int(361670535); /* `TIMER */
    case GTK_ACCESSIBLE_ROLE_TOOLBAR: return Val_int(449593786); /* `TOOLBAR */
    case GTK_ACCESSIBLE_ROLE_TOOLTIP: return Val_int(554566771); /* `TOOLTIP */
    case GTK_ACCESSIBLE_ROLE_TREE: return Val_int(488644235); /* `TREE */
    case GTK_ACCESSIBLE_ROLE_TREE_GRID: return Val_int(967674080); /* `TREE_GRID */
    case GTK_ACCESSIBLE_ROLE_TREE_ITEM: return Val_int(808264190); /* `TREE_ITEM */
    case GTK_ACCESSIBLE_ROLE_WIDGET: return Val_int(867734171); /* `WIDGET */
    case GTK_ACCESSIBLE_ROLE_WINDOW: return Val_int(775151744); /* `WINDOW */
    case GTK_ACCESSIBLE_ROLE_TOGGLE_BUTTON: return Val_int(979100784); /* `TOGGLE_BUTTON */
    case GTK_ACCESSIBLE_ROLE_APPLICATION: return Val_int(120859527); /* `APPLICATION */
    case GTK_ACCESSIBLE_ROLE_PARAGRAPH: return Val_int(97513912); /* `PARAGRAPH */
    case GTK_ACCESSIBLE_ROLE_BLOCK_QUOTE: return Val_int(520500281); /* `BLOCK_QUOTE */
    case GTK_ACCESSIBLE_ROLE_ARTICLE: return Val_int(941365415); /* `ARTICLE */
    case GTK_ACCESSIBLE_ROLE_COMMENT: return Val_int(211256400); /* `COMMENT */
    case GTK_ACCESSIBLE_ROLE_TERMINAL: return Val_int(288631146); /* `TERMINAL */
    default: return Val_int(231927082); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleRole */
GtkAccessibleRole GtkAccessibleRole_val(value val) {
  int tag = Int_val(val);
  if (tag == 231927082) return GTK_ACCESSIBLE_ROLE_ALERT; /* `ALERT */
  else if (tag == 393243050) return GTK_ACCESSIBLE_ROLE_ALERT_DIALOG; /* `ALERT_DIALOG */
  else if (tag == 1033603728) return GTK_ACCESSIBLE_ROLE_BANNER; /* `BANNER */
  else if (tag == 536988399) return GTK_ACCESSIBLE_ROLE_BUTTON; /* `BUTTON */
  else if (tag == 925298702) return GTK_ACCESSIBLE_ROLE_CAPTION; /* `CAPTION */
  else if (tag == 294115967) return GTK_ACCESSIBLE_ROLE_CELL; /* `CELL */
  else if (tag == 810490032) return GTK_ACCESSIBLE_ROLE_CHECKBOX; /* `CHECKBOX */
  else if (tag == 346339614) return GTK_ACCESSIBLE_ROLE_COLUMN_HEADER; /* `COLUMN_HEADER */
  else if (tag == 972446394) return GTK_ACCESSIBLE_ROLE_COMBO_BOX; /* `COMBO_BOX */
  else if (tag == 839472956) return GTK_ACCESSIBLE_ROLE_COMMAND; /* `COMMAND */
  else if (tag == 75245936) return GTK_ACCESSIBLE_ROLE_COMPOSITE; /* `COMPOSITE */
  else if (tag == 653792617) return GTK_ACCESSIBLE_ROLE_DIALOG; /* `DIALOG */
  else if (tag == 1070368755) return GTK_ACCESSIBLE_ROLE_DOCUMENT; /* `DOCUMENT */
  else if (tag == 979987503) return GTK_ACCESSIBLE_ROLE_FEED; /* `FEED */
  else if (tag == 854496763) return GTK_ACCESSIBLE_ROLE_FORM; /* `FORM */
  else if (tag == 504479289) return GTK_ACCESSIBLE_ROLE_GENERIC; /* `GENERIC */
  else if (tag == 262421716) return GTK_ACCESSIBLE_ROLE_GRID; /* `GRID */
  else if (tag == 34797617) return GTK_ACCESSIBLE_ROLE_GRID_CELL; /* `GRID_CELL */
  else if (tag == 880735546) return GTK_ACCESSIBLE_ROLE_GROUP; /* `GROUP */
  else if (tag == 186703449) return GTK_ACCESSIBLE_ROLE_HEADING; /* `HEADING */
  else if (tag == 378083867) return GTK_ACCESSIBLE_ROLE_IMG; /* `IMG */
  else if (tag == 668464415) return GTK_ACCESSIBLE_ROLE_INPUT; /* `INPUT */
  else if (tag == 153566446) return GTK_ACCESSIBLE_ROLE_LABEL; /* `LABEL */
  else if (tag == 234268572) return GTK_ACCESSIBLE_ROLE_LANDMARK; /* `LANDMARK */
  else if (tag == 173414741) return GTK_ACCESSIBLE_ROLE_LEGEND; /* `LEGEND */
  else if (tag == 869638750) return GTK_ACCESSIBLE_ROLE_LINK; /* `LINK */
  else if (tag == 447133042) return GTK_ACCESSIBLE_ROLE_LIST; /* `LIST */
  else if (tag == 676098803) return GTK_ACCESSIBLE_ROLE_LIST_BOX; /* `LIST_BOX */
  else if (tag == 272885002) return GTK_ACCESSIBLE_ROLE_LIST_ITEM; /* `LIST_ITEM */
  else if (tag == 97704467) return GTK_ACCESSIBLE_ROLE_LOG; /* `LOG */
  else if (tag == 908043586) return GTK_ACCESSIBLE_ROLE_MAIN; /* `MAIN */
  else if (tag == 80160723) return GTK_ACCESSIBLE_ROLE_MARQUEE; /* `MARQUEE */
  else if (tag == 629453739) return GTK_ACCESSIBLE_ROLE_MATH; /* `MATH */
  else if (tag == 1066941833) return GTK_ACCESSIBLE_ROLE_METER; /* `METER */
  else if (tag == 132107627) return GTK_ACCESSIBLE_ROLE_MENU; /* `MENU */
  else if (tag == 513770443) return GTK_ACCESSIBLE_ROLE_MENU_BAR; /* `MENU_BAR */
  else if (tag == 398709394) return GTK_ACCESSIBLE_ROLE_MENU_ITEM; /* `MENU_ITEM */
  else if (tag == 764639143) return GTK_ACCESSIBLE_ROLE_MENU_ITEM_CHECKBOX; /* `MENU_ITEM_CHECKBOX */
  else if (tag == 820766485) return GTK_ACCESSIBLE_ROLE_MENU_ITEM_RADIO; /* `MENU_ITEM_RADIO */
  else if (tag == 577115963) return GTK_ACCESSIBLE_ROLE_NAVIGATION; /* `NAVIGATION */
  else if (tag == 37469934) return GTK_ACCESSIBLE_ROLE_NONE; /* `NONE */
  else if (tag == 900641892) return GTK_ACCESSIBLE_ROLE_NOTE; /* `NOTE */
  else if (tag == 1009334281) return GTK_ACCESSIBLE_ROLE_OPTION; /* `OPTION */
  else if (tag == 259023094) return GTK_ACCESSIBLE_ROLE_PRESENTATION; /* `PRESENTATION */
  else if (tag == 91324598) return GTK_ACCESSIBLE_ROLE_PROGRESS_BAR; /* `PROGRESS_BAR */
  else if (tag == 157462220) return GTK_ACCESSIBLE_ROLE_RADIO; /* `RADIO */
  else if (tag == 829441459) return GTK_ACCESSIBLE_ROLE_RADIO_GROUP; /* `RADIO_GROUP */
  else if (tag == 541071338) return GTK_ACCESSIBLE_ROLE_RANGE; /* `RANGE */
  else if (tag == 579215179) return GTK_ACCESSIBLE_ROLE_REGION; /* `REGION */
  else if (tag == 732717544) return GTK_ACCESSIBLE_ROLE_ROW; /* `ROW */
  else if (tag == 32797801) return GTK_ACCESSIBLE_ROLE_ROW_GROUP; /* `ROW_GROUP */
  else if (tag == 493125700) return GTK_ACCESSIBLE_ROLE_ROW_HEADER; /* `ROW_HEADER */
  else if (tag == 883138067) return GTK_ACCESSIBLE_ROLE_SCROLLBAR; /* `SCROLLBAR */
  else if (tag == 622394263) return GTK_ACCESSIBLE_ROLE_SEARCH; /* `SEARCH */
  else if (tag == 693850972) return GTK_ACCESSIBLE_ROLE_SEARCH_BOX; /* `SEARCH_BOX */
  else if (tag == 825760877) return GTK_ACCESSIBLE_ROLE_SECTION; /* `SECTION */
  else if (tag == 38054874) return GTK_ACCESSIBLE_ROLE_SECTION_HEAD; /* `SECTION_HEAD */
  else if (tag == 455248459) return GTK_ACCESSIBLE_ROLE_SELECT; /* `SELECT */
  else if (tag == 28044232) return GTK_ACCESSIBLE_ROLE_SEPARATOR; /* `SEPARATOR */
  else if (tag == 32742794) return GTK_ACCESSIBLE_ROLE_SLIDER; /* `SLIDER */
  else if (tag == 100151920) return GTK_ACCESSIBLE_ROLE_SPIN_BUTTON; /* `SPIN_BUTTON */
  else if (tag == 462200104) return GTK_ACCESSIBLE_ROLE_STATUS; /* `STATUS */
  else if (tag == 323761272) return GTK_ACCESSIBLE_ROLE_STRUCTURE; /* `STRUCTURE */
  else if (tag == 161129457) return GTK_ACCESSIBLE_ROLE_SWITCH; /* `SWITCH */
  else if (tag == 789765117) return GTK_ACCESSIBLE_ROLE_TAB; /* `TAB */
  else if (tag == 885532417) return GTK_ACCESSIBLE_ROLE_TABLE; /* `TABLE */
  else if (tag == 623574907) return GTK_ACCESSIBLE_ROLE_TAB_LIST; /* `TAB_LIST */
  else if (tag == 275228458) return GTK_ACCESSIBLE_ROLE_TAB_PANEL; /* `TAB_PANEL */
  else if (tag == 858770883) return GTK_ACCESSIBLE_ROLE_TEXT_BOX; /* `TEXT_BOX */
  else if (tag == 266835411) return GTK_ACCESSIBLE_ROLE_TIME; /* `TIME */
  else if (tag == 361670535) return GTK_ACCESSIBLE_ROLE_TIMER; /* `TIMER */
  else if (tag == 449593786) return GTK_ACCESSIBLE_ROLE_TOOLBAR; /* `TOOLBAR */
  else if (tag == 554566771) return GTK_ACCESSIBLE_ROLE_TOOLTIP; /* `TOOLTIP */
  else if (tag == 488644235) return GTK_ACCESSIBLE_ROLE_TREE; /* `TREE */
  else if (tag == 967674080) return GTK_ACCESSIBLE_ROLE_TREE_GRID; /* `TREE_GRID */
  else if (tag == 808264190) return GTK_ACCESSIBLE_ROLE_TREE_ITEM; /* `TREE_ITEM */
  else if (tag == 867734171) return GTK_ACCESSIBLE_ROLE_WIDGET; /* `WIDGET */
  else if (tag == 775151744) return GTK_ACCESSIBLE_ROLE_WINDOW; /* `WINDOW */
  else if (tag == 979100784) return GTK_ACCESSIBLE_ROLE_TOGGLE_BUTTON; /* `TOGGLE_BUTTON */
  else if (tag == 120859527) return GTK_ACCESSIBLE_ROLE_APPLICATION; /* `APPLICATION */
  else if (tag == 97513912) return GTK_ACCESSIBLE_ROLE_PARAGRAPH; /* `PARAGRAPH */
  else if (tag == 520500281) return GTK_ACCESSIBLE_ROLE_BLOCK_QUOTE; /* `BLOCK_QUOTE */
  else if (tag == 941365415) return GTK_ACCESSIBLE_ROLE_ARTICLE; /* `ARTICLE */
  else if (tag == 211256400) return GTK_ACCESSIBLE_ROLE_COMMENT; /* `COMMENT */
  else if (tag == 288631146) return GTK_ACCESSIBLE_ROLE_TERMINAL; /* `TERMINAL */
  else return GTK_ACCESSIBLE_ROLE_ALERT; /* fallback to first value */
}

/* Convert GtkAccessibleSort to OCaml value */
value Val_GtkAccessibleSort(GtkAccessibleSort val) {
  switch (val) {
    case GTK_ACCESSIBLE_SORT_NONE: return Val_int(37469934); /* `NONE */
    case GTK_ACCESSIBLE_SORT_ASCENDING: return Val_int(659141842); /* `ASCENDING */
    case GTK_ACCESSIBLE_SORT_DESCENDING: return Val_int(739271559); /* `DESCENDING */
    case GTK_ACCESSIBLE_SORT_OTHER: return Val_int(615852999); /* `OTHER */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleSort */
GtkAccessibleSort GtkAccessibleSort_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_ACCESSIBLE_SORT_NONE; /* `NONE */
  else if (tag == 659141842) return GTK_ACCESSIBLE_SORT_ASCENDING; /* `ASCENDING */
  else if (tag == 739271559) return GTK_ACCESSIBLE_SORT_DESCENDING; /* `DESCENDING */
  else if (tag == 615852999) return GTK_ACCESSIBLE_SORT_OTHER; /* `OTHER */
  else return GTK_ACCESSIBLE_SORT_NONE; /* fallback to first value */
}

/* Convert GtkAccessibleState to OCaml value */
value Val_GtkAccessibleState(GtkAccessibleState val) {
  switch (val) {
    case GTK_ACCESSIBLE_STATE_BUSY: return Val_int(315097720); /* `BUSY */
    case GTK_ACCESSIBLE_STATE_CHECKED: return Val_int(230867372); /* `CHECKED */
    case GTK_ACCESSIBLE_STATE_DISABLED: return Val_int(510375555); /* `DISABLED */
    case GTK_ACCESSIBLE_STATE_EXPANDED: return Val_int(865473550); /* `EXPANDED */
    case GTK_ACCESSIBLE_STATE_HIDDEN: return Val_int(835860439); /* `HIDDEN */
    case GTK_ACCESSIBLE_STATE_INVALID: return Val_int(21795536); /* `INVALID */
    case GTK_ACCESSIBLE_STATE_PRESSED: return Val_int(572815890); /* `PRESSED */
    case GTK_ACCESSIBLE_STATE_SELECTED: return Val_int(514267004); /* `SELECTED */
    case GTK_ACCESSIBLE_STATE_VISITED: return Val_int(961432375); /* `VISITED */
    default: return Val_int(315097720); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleState */
GtkAccessibleState GtkAccessibleState_val(value val) {
  int tag = Int_val(val);
  if (tag == 315097720) return GTK_ACCESSIBLE_STATE_BUSY; /* `BUSY */
  else if (tag == 230867372) return GTK_ACCESSIBLE_STATE_CHECKED; /* `CHECKED */
  else if (tag == 510375555) return GTK_ACCESSIBLE_STATE_DISABLED; /* `DISABLED */
  else if (tag == 865473550) return GTK_ACCESSIBLE_STATE_EXPANDED; /* `EXPANDED */
  else if (tag == 835860439) return GTK_ACCESSIBLE_STATE_HIDDEN; /* `HIDDEN */
  else if (tag == 21795536) return GTK_ACCESSIBLE_STATE_INVALID; /* `INVALID */
  else if (tag == 572815890) return GTK_ACCESSIBLE_STATE_PRESSED; /* `PRESSED */
  else if (tag == 514267004) return GTK_ACCESSIBLE_STATE_SELECTED; /* `SELECTED */
  else if (tag == 961432375) return GTK_ACCESSIBLE_STATE_VISITED; /* `VISITED */
  else return GTK_ACCESSIBLE_STATE_BUSY; /* fallback to first value */
}

/* Convert GtkAccessibleTextContentChange to OCaml value */
value Val_GtkAccessibleTextContentChange(GtkAccessibleTextContentChange val) {
  switch (val) {
    case GTK_ACCESSIBLE_TEXT_CONTENT_CHANGE_INSERT: return Val_int(16637105); /* `INSERT */
    case GTK_ACCESSIBLE_TEXT_CONTENT_CHANGE_REMOVE: return Val_int(538959286); /* `REMOVE */
    default: return Val_int(16637105); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleTextContentChange */
GtkAccessibleTextContentChange GtkAccessibleTextContentChange_val(value val) {
  int tag = Int_val(val);
  if (tag == 16637105) return GTK_ACCESSIBLE_TEXT_CONTENT_CHANGE_INSERT; /* `INSERT */
  else if (tag == 538959286) return GTK_ACCESSIBLE_TEXT_CONTENT_CHANGE_REMOVE; /* `REMOVE */
  else return GTK_ACCESSIBLE_TEXT_CONTENT_CHANGE_INSERT; /* fallback to first value */
}

/* Convert GtkAccessibleTextGranularity to OCaml value */
value Val_GtkAccessibleTextGranularity(GtkAccessibleTextGranularity val) {
  switch (val) {
    case GTK_ACCESSIBLE_TEXT_GRANULARITY_CHARACTER: return Val_int(840084187); /* `CHARACTER */
    case GTK_ACCESSIBLE_TEXT_GRANULARITY_WORD: return Val_int(777616121); /* `WORD */
    case GTK_ACCESSIBLE_TEXT_GRANULARITY_SENTENCE: return Val_int(336540193); /* `SENTENCE */
    case GTK_ACCESSIBLE_TEXT_GRANULARITY_LINE: return Val_int(452458406); /* `LINE */
    case GTK_ACCESSIBLE_TEXT_GRANULARITY_PARAGRAPH: return Val_int(97513912); /* `PARAGRAPH */
    default: return Val_int(840084187); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleTextGranularity */
GtkAccessibleTextGranularity GtkAccessibleTextGranularity_val(value val) {
  int tag = Int_val(val);
  if (tag == 840084187) return GTK_ACCESSIBLE_TEXT_GRANULARITY_CHARACTER; /* `CHARACTER */
  else if (tag == 777616121) return GTK_ACCESSIBLE_TEXT_GRANULARITY_WORD; /* `WORD */
  else if (tag == 336540193) return GTK_ACCESSIBLE_TEXT_GRANULARITY_SENTENCE; /* `SENTENCE */
  else if (tag == 452458406) return GTK_ACCESSIBLE_TEXT_GRANULARITY_LINE; /* `LINE */
  else if (tag == 97513912) return GTK_ACCESSIBLE_TEXT_GRANULARITY_PARAGRAPH; /* `PARAGRAPH */
  else return GTK_ACCESSIBLE_TEXT_GRANULARITY_CHARACTER; /* fallback to first value */
}

/* Convert GtkAccessibleTristate to OCaml value */
value Val_GtkAccessibleTristate(GtkAccessibleTristate val) {
  switch (val) {
    case GTK_ACCESSIBLE_TRISTATE_FALSE: return Val_int(605455126); /* `FALSE */
    case GTK_ACCESSIBLE_TRISTATE_TRUE: return Val_int(584682644); /* `TRUE */
    case GTK_ACCESSIBLE_TRISTATE_MIXED: return Val_int(46636679); /* `MIXED */
    default: return Val_int(605455126); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleTristate */
GtkAccessibleTristate GtkAccessibleTristate_val(value val) {
  int tag = Int_val(val);
  if (tag == 605455126) return GTK_ACCESSIBLE_TRISTATE_FALSE; /* `FALSE */
  else if (tag == 584682644) return GTK_ACCESSIBLE_TRISTATE_TRUE; /* `TRUE */
  else if (tag == 46636679) return GTK_ACCESSIBLE_TRISTATE_MIXED; /* `MIXED */
  else return GTK_ACCESSIBLE_TRISTATE_FALSE; /* fallback to first value */
}

/* Convert GtkAlign to OCaml value */
value Val_GtkAlign(GtkAlign val) {
  switch (val) {
    case GTK_ALIGN_FILL: return Val_int(263377307); /* `FILL */
    case GTK_ALIGN_START: return Val_int(23743610); /* `START */
    case GTK_ALIGN_END: return Val_int(735747473); /* `END */
    case GTK_ALIGN_CENTER: return Val_int(428864253); /* `CENTER */
    case GTK_ALIGN_BASELINE_FILL: return Val_int(10542953); /* `BASELINE_FILL */
    case GTK_ALIGN_BASELINE_CENTER: return Val_int(539314122); /* `BASELINE_CENTER */
    default: return Val_int(263377307); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAlign */
GtkAlign GtkAlign_val(value val) {
  int tag = Int_val(val);
  if (tag == 263377307) return GTK_ALIGN_FILL; /* `FILL */
  else if (tag == 23743610) return GTK_ALIGN_START; /* `START */
  else if (tag == 735747473) return GTK_ALIGN_END; /* `END */
  else if (tag == 428864253) return GTK_ALIGN_CENTER; /* `CENTER */
  else if (tag == 10542953) return GTK_ALIGN_BASELINE_FILL; /* `BASELINE_FILL */
  else if (tag == 84124105) return GTK_ALIGN_BASELINE; /* `BASELINE */
  else if (tag == 539314122) return GTK_ALIGN_BASELINE_CENTER; /* `BASELINE_CENTER */
  else return GTK_ALIGN_FILL; /* fallback to first value */
}

/* Convert GtkArrowType to OCaml value */
value Val_GtkArrowType(GtkArrowType val) {
  switch (val) {
    case GTK_ARROW_UP: return Val_int(160130855); /* `UP */
    case GTK_ARROW_DOWN: return Val_int(878985997); /* `DOWN */
    case GTK_ARROW_LEFT: return Val_int(28713888); /* `LEFT */
    case GTK_ARROW_RIGHT: return Val_int(961111566); /* `RIGHT */
    case GTK_ARROW_NONE: return Val_int(37469934); /* `NONE */
    default: return Val_int(160130855); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkArrowType */
GtkArrowType GtkArrowType_val(value val) {
  int tag = Int_val(val);
  if (tag == 160130855) return GTK_ARROW_UP; /* `UP */
  else if (tag == 878985997) return GTK_ARROW_DOWN; /* `DOWN */
  else if (tag == 28713888) return GTK_ARROW_LEFT; /* `LEFT */
  else if (tag == 961111566) return GTK_ARROW_RIGHT; /* `RIGHT */
  else if (tag == 37469934) return GTK_ARROW_NONE; /* `NONE */
  else return GTK_ARROW_UP; /* fallback to first value */
}

/* Convert GtkAssistantPageType to OCaml value */
value Val_GtkAssistantPageType(GtkAssistantPageType val) {
  switch (val) {
    case GTK_ASSISTANT_PAGE_CONTENT: return Val_int(82881461); /* `CONTENT */
    case GTK_ASSISTANT_PAGE_INTRO: return Val_int(327321335); /* `INTRO */
    case GTK_ASSISTANT_PAGE_CONFIRM: return Val_int(45013425); /* `CONFIRM */
    case GTK_ASSISTANT_PAGE_SUMMARY: return Val_int(276969134); /* `SUMMARY */
    case GTK_ASSISTANT_PAGE_PROGRESS: return Val_int(45134048); /* `PROGRESS */
    case GTK_ASSISTANT_PAGE_CUSTOM: return Val_int(88208206); /* `CUSTOM */
    default: return Val_int(82881461); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAssistantPageType */
GtkAssistantPageType GtkAssistantPageType_val(value val) {
  int tag = Int_val(val);
  if (tag == 82881461) return GTK_ASSISTANT_PAGE_CONTENT; /* `CONTENT */
  else if (tag == 327321335) return GTK_ASSISTANT_PAGE_INTRO; /* `INTRO */
  else if (tag == 45013425) return GTK_ASSISTANT_PAGE_CONFIRM; /* `CONFIRM */
  else if (tag == 276969134) return GTK_ASSISTANT_PAGE_SUMMARY; /* `SUMMARY */
  else if (tag == 45134048) return GTK_ASSISTANT_PAGE_PROGRESS; /* `PROGRESS */
  else if (tag == 88208206) return GTK_ASSISTANT_PAGE_CUSTOM; /* `CUSTOM */
  else return GTK_ASSISTANT_PAGE_CONTENT; /* fallback to first value */
}

/* Convert GtkBaselinePosition to OCaml value */
value Val_GtkBaselinePosition(GtkBaselinePosition val) {
  switch (val) {
    case GTK_BASELINE_POSITION_TOP: return Val_int(281490397); /* `TOP */
    case GTK_BASELINE_POSITION_CENTER: return Val_int(428864253); /* `CENTER */
    case GTK_BASELINE_POSITION_BOTTOM: return Val_int(585108400); /* `BOTTOM */
    default: return Val_int(281490397); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkBaselinePosition */
GtkBaselinePosition GtkBaselinePosition_val(value val) {
  int tag = Int_val(val);
  if (tag == 281490397) return GTK_BASELINE_POSITION_TOP; /* `TOP */
  else if (tag == 428864253) return GTK_BASELINE_POSITION_CENTER; /* `CENTER */
  else if (tag == 585108400) return GTK_BASELINE_POSITION_BOTTOM; /* `BOTTOM */
  else return GTK_BASELINE_POSITION_TOP; /* fallback to first value */
}

/* Convert GtkBorderStyle to OCaml value */
value Val_GtkBorderStyle(GtkBorderStyle val) {
  switch (val) {
    case GTK_BORDER_STYLE_NONE: return Val_int(37469934); /* `NONE */
    case GTK_BORDER_STYLE_HIDDEN: return Val_int(835860439); /* `HIDDEN */
    case GTK_BORDER_STYLE_SOLID: return Val_int(147301874); /* `SOLID */
    case GTK_BORDER_STYLE_INSET: return Val_int(374023637); /* `INSET */
    case GTK_BORDER_STYLE_OUTSET: return Val_int(514522448); /* `OUTSET */
    case GTK_BORDER_STYLE_DOTTED: return Val_int(777930731); /* `DOTTED */
    case GTK_BORDER_STYLE_DASHED: return Val_int(538078138); /* `DASHED */
    case GTK_BORDER_STYLE_DOUBLE: return Val_int(686870806); /* `DOUBLE */
    case GTK_BORDER_STYLE_GROOVE: return Val_int(678132001); /* `GROOVE */
    case GTK_BORDER_STYLE_RIDGE: return Val_int(424834806); /* `RIDGE */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkBorderStyle */
GtkBorderStyle GtkBorderStyle_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_BORDER_STYLE_NONE; /* `NONE */
  else if (tag == 835860439) return GTK_BORDER_STYLE_HIDDEN; /* `HIDDEN */
  else if (tag == 147301874) return GTK_BORDER_STYLE_SOLID; /* `SOLID */
  else if (tag == 374023637) return GTK_BORDER_STYLE_INSET; /* `INSET */
  else if (tag == 514522448) return GTK_BORDER_STYLE_OUTSET; /* `OUTSET */
  else if (tag == 777930731) return GTK_BORDER_STYLE_DOTTED; /* `DOTTED */
  else if (tag == 538078138) return GTK_BORDER_STYLE_DASHED; /* `DASHED */
  else if (tag == 686870806) return GTK_BORDER_STYLE_DOUBLE; /* `DOUBLE */
  else if (tag == 678132001) return GTK_BORDER_STYLE_GROOVE; /* `GROOVE */
  else if (tag == 424834806) return GTK_BORDER_STYLE_RIDGE; /* `RIDGE */
  else return GTK_BORDER_STYLE_NONE; /* fallback to first value */
}

/* Convert GtkBuilderError to OCaml value */
value Val_GtkBuilderError(GtkBuilderError val) {
  switch (val) {
    case GTK_BUILDER_ERROR_INVALID_TYPE_FUNCTION: return Val_int(243024970); /* `INVALID_TYPE_FUNCTION */
    case GTK_BUILDER_ERROR_UNHANDLED_TAG: return Val_int(290670564); /* `UNHANDLED_TAG */
    case GTK_BUILDER_ERROR_MISSING_ATTRIBUTE: return Val_int(103074591); /* `MISSING_ATTRIBUTE */
    case GTK_BUILDER_ERROR_INVALID_ATTRIBUTE: return Val_int(43839400); /* `INVALID_ATTRIBUTE */
    case GTK_BUILDER_ERROR_INVALID_TAG: return Val_int(301736243); /* `INVALID_TAG */
    case GTK_BUILDER_ERROR_MISSING_PROPERTY_VALUE: return Val_int(982359009); /* `MISSING_PROPERTY_VALUE */
    case GTK_BUILDER_ERROR_INVALID_VALUE: return Val_int(12173541); /* `INVALID_VALUE */
    case GTK_BUILDER_ERROR_VERSION_MISMATCH: return Val_int(601663192); /* `VERSION_MISMATCH */
    case GTK_BUILDER_ERROR_DUPLICATE_ID: return Val_int(577435532); /* `DUPLICATE_ID */
    case GTK_BUILDER_ERROR_OBJECT_TYPE_REFUSED: return Val_int(983879626); /* `OBJECT_TYPE_REFUSED */
    case GTK_BUILDER_ERROR_TEMPLATE_MISMATCH: return Val_int(511356577); /* `TEMPLATE_MISMATCH */
    case GTK_BUILDER_ERROR_INVALID_PROPERTY: return Val_int(751535560); /* `INVALID_PROPERTY */
    case GTK_BUILDER_ERROR_INVALID_SIGNAL: return Val_int(844872078); /* `INVALID_SIGNAL */
    case GTK_BUILDER_ERROR_INVALID_ID: return Val_int(412654749); /* `INVALID_ID */
    case GTK_BUILDER_ERROR_INVALID_FUNCTION: return Val_int(885636885); /* `INVALID_FUNCTION */
    default: return Val_int(243024970); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkBuilderError */
GtkBuilderError GtkBuilderError_val(value val) {
  int tag = Int_val(val);
  if (tag == 243024970) return GTK_BUILDER_ERROR_INVALID_TYPE_FUNCTION; /* `INVALID_TYPE_FUNCTION */
  else if (tag == 290670564) return GTK_BUILDER_ERROR_UNHANDLED_TAG; /* `UNHANDLED_TAG */
  else if (tag == 103074591) return GTK_BUILDER_ERROR_MISSING_ATTRIBUTE; /* `MISSING_ATTRIBUTE */
  else if (tag == 43839400) return GTK_BUILDER_ERROR_INVALID_ATTRIBUTE; /* `INVALID_ATTRIBUTE */
  else if (tag == 301736243) return GTK_BUILDER_ERROR_INVALID_TAG; /* `INVALID_TAG */
  else if (tag == 982359009) return GTK_BUILDER_ERROR_MISSING_PROPERTY_VALUE; /* `MISSING_PROPERTY_VALUE */
  else if (tag == 12173541) return GTK_BUILDER_ERROR_INVALID_VALUE; /* `INVALID_VALUE */
  else if (tag == 601663192) return GTK_BUILDER_ERROR_VERSION_MISMATCH; /* `VERSION_MISMATCH */
  else if (tag == 577435532) return GTK_BUILDER_ERROR_DUPLICATE_ID; /* `DUPLICATE_ID */
  else if (tag == 983879626) return GTK_BUILDER_ERROR_OBJECT_TYPE_REFUSED; /* `OBJECT_TYPE_REFUSED */
  else if (tag == 511356577) return GTK_BUILDER_ERROR_TEMPLATE_MISMATCH; /* `TEMPLATE_MISMATCH */
  else if (tag == 751535560) return GTK_BUILDER_ERROR_INVALID_PROPERTY; /* `INVALID_PROPERTY */
  else if (tag == 844872078) return GTK_BUILDER_ERROR_INVALID_SIGNAL; /* `INVALID_SIGNAL */
  else if (tag == 412654749) return GTK_BUILDER_ERROR_INVALID_ID; /* `INVALID_ID */
  else if (tag == 885636885) return GTK_BUILDER_ERROR_INVALID_FUNCTION; /* `INVALID_FUNCTION */
  else return GTK_BUILDER_ERROR_INVALID_TYPE_FUNCTION; /* fallback to first value */
}

/* Convert GtkButtonsType to OCaml value */
value Val_GtkButtonsType(GtkButtonsType val) {
  switch (val) {
    case GTK_BUTTONS_NONE: return Val_int(37469934); /* `NONE */
    case GTK_BUTTONS_OK: return Val_int(453997984); /* `OK */
    case GTK_BUTTONS_CLOSE: return Val_int(518650144); /* `CLOSE */
    case GTK_BUTTONS_CANCEL: return Val_int(809667861); /* `CANCEL */
    case GTK_BUTTONS_YES_NO: return Val_int(88999547); /* `YES_NO */
    case GTK_BUTTONS_OK_CANCEL: return Val_int(773620077); /* `OK_CANCEL */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkButtonsType */
GtkButtonsType GtkButtonsType_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_BUTTONS_NONE; /* `NONE */
  else if (tag == 453997984) return GTK_BUTTONS_OK; /* `OK */
  else if (tag == 518650144) return GTK_BUTTONS_CLOSE; /* `CLOSE */
  else if (tag == 809667861) return GTK_BUTTONS_CANCEL; /* `CANCEL */
  else if (tag == 88999547) return GTK_BUTTONS_YES_NO; /* `YES_NO */
  else if (tag == 773620077) return GTK_BUTTONS_OK_CANCEL; /* `OK_CANCEL */
  else return GTK_BUTTONS_NONE; /* fallback to first value */
}

/* Convert GtkCellRendererAccelMode to OCaml value */
value Val_GtkCellRendererAccelMode(GtkCellRendererAccelMode val) {
  switch (val) {
    case GTK_CELL_RENDERER_ACCEL_MODE_GTK: return Val_int(160069716); /* `GTK */
    case GTK_CELL_RENDERER_ACCEL_MODE_OTHER: return Val_int(615852999); /* `OTHER */
    default: return Val_int(160069716); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkCellRendererAccelMode */
GtkCellRendererAccelMode GtkCellRendererAccelMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 160069716) return GTK_CELL_RENDERER_ACCEL_MODE_GTK; /* `GTK */
  else if (tag == 615852999) return GTK_CELL_RENDERER_ACCEL_MODE_OTHER; /* `OTHER */
  else return GTK_CELL_RENDERER_ACCEL_MODE_GTK; /* fallback to first value */
}

/* Convert GtkCellRendererMode to OCaml value */
value Val_GtkCellRendererMode(GtkCellRendererMode val) {
  switch (val) {
    case GTK_CELL_RENDERER_MODE_INERT: return Val_int(122783495); /* `INERT */
    case GTK_CELL_RENDERER_MODE_ACTIVATABLE: return Val_int(236227721); /* `ACTIVATABLE */
    case GTK_CELL_RENDERER_MODE_EDITABLE: return Val_int(167806173); /* `EDITABLE */
    default: return Val_int(122783495); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkCellRendererMode */
GtkCellRendererMode GtkCellRendererMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 122783495) return GTK_CELL_RENDERER_MODE_INERT; /* `INERT */
  else if (tag == 236227721) return GTK_CELL_RENDERER_MODE_ACTIVATABLE; /* `ACTIVATABLE */
  else if (tag == 167806173) return GTK_CELL_RENDERER_MODE_EDITABLE; /* `EDITABLE */
  else return GTK_CELL_RENDERER_MODE_INERT; /* fallback to first value */
}

/* Convert GtkCollation to OCaml value */
value Val_GtkCollation(GtkCollation val) {
  switch (val) {
    case GTK_COLLATION_NONE: return Val_int(37469934); /* `NONE */
    case GTK_COLLATION_UNICODE: return Val_int(744269357); /* `UNICODE */
    case GTK_COLLATION_FILENAME: return Val_int(355818944); /* `FILENAME */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkCollation */
GtkCollation GtkCollation_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_COLLATION_NONE; /* `NONE */
  else if (tag == 744269357) return GTK_COLLATION_UNICODE; /* `UNICODE */
  else if (tag == 355818944) return GTK_COLLATION_FILENAME; /* `FILENAME */
  else return GTK_COLLATION_NONE; /* fallback to first value */
}

/* Convert GtkConstraintAttribute to OCaml value */
value Val_GtkConstraintAttribute(GtkConstraintAttribute val) {
  switch (val) {
    case GTK_CONSTRAINT_ATTRIBUTE_NONE: return Val_int(37469934); /* `NONE */
    case GTK_CONSTRAINT_ATTRIBUTE_LEFT: return Val_int(28713888); /* `LEFT */
    case GTK_CONSTRAINT_ATTRIBUTE_RIGHT: return Val_int(961111566); /* `RIGHT */
    case GTK_CONSTRAINT_ATTRIBUTE_TOP: return Val_int(281490397); /* `TOP */
    case GTK_CONSTRAINT_ATTRIBUTE_BOTTOM: return Val_int(585108400); /* `BOTTOM */
    case GTK_CONSTRAINT_ATTRIBUTE_START: return Val_int(23743610); /* `START */
    case GTK_CONSTRAINT_ATTRIBUTE_END: return Val_int(735747473); /* `END */
    case GTK_CONSTRAINT_ATTRIBUTE_WIDTH: return Val_int(521323844); /* `WIDTH */
    case GTK_CONSTRAINT_ATTRIBUTE_HEIGHT: return Val_int(383606433); /* `HEIGHT */
    case GTK_CONSTRAINT_ATTRIBUTE_CENTER_X: return Val_int(486210514); /* `CENTER_X */
    case GTK_CONSTRAINT_ATTRIBUTE_CENTER_Y: return Val_int(843037265); /* `CENTER_Y */
    case GTK_CONSTRAINT_ATTRIBUTE_BASELINE: return Val_int(84124105); /* `BASELINE */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkConstraintAttribute */
GtkConstraintAttribute GtkConstraintAttribute_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_CONSTRAINT_ATTRIBUTE_NONE; /* `NONE */
  else if (tag == 28713888) return GTK_CONSTRAINT_ATTRIBUTE_LEFT; /* `LEFT */
  else if (tag == 961111566) return GTK_CONSTRAINT_ATTRIBUTE_RIGHT; /* `RIGHT */
  else if (tag == 281490397) return GTK_CONSTRAINT_ATTRIBUTE_TOP; /* `TOP */
  else if (tag == 585108400) return GTK_CONSTRAINT_ATTRIBUTE_BOTTOM; /* `BOTTOM */
  else if (tag == 23743610) return GTK_CONSTRAINT_ATTRIBUTE_START; /* `START */
  else if (tag == 735747473) return GTK_CONSTRAINT_ATTRIBUTE_END; /* `END */
  else if (tag == 521323844) return GTK_CONSTRAINT_ATTRIBUTE_WIDTH; /* `WIDTH */
  else if (tag == 383606433) return GTK_CONSTRAINT_ATTRIBUTE_HEIGHT; /* `HEIGHT */
  else if (tag == 486210514) return GTK_CONSTRAINT_ATTRIBUTE_CENTER_X; /* `CENTER_X */
  else if (tag == 843037265) return GTK_CONSTRAINT_ATTRIBUTE_CENTER_Y; /* `CENTER_Y */
  else if (tag == 84124105) return GTK_CONSTRAINT_ATTRIBUTE_BASELINE; /* `BASELINE */
  else return GTK_CONSTRAINT_ATTRIBUTE_NONE; /* fallback to first value */
}

/* Convert GtkConstraintRelation to OCaml value */
value Val_GtkConstraintRelation(GtkConstraintRelation val) {
  switch (val) {
    case GTK_CONSTRAINT_RELATION_LE: return Val_int(633442369); /* `LE */
    case GTK_CONSTRAINT_RELATION_EQ: return Val_int(551539569); /* `EQ */
    case GTK_CONSTRAINT_RELATION_GE: return Val_int(620103353); /* `GE */
    default: return Val_int(633442369); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkConstraintRelation */
GtkConstraintRelation GtkConstraintRelation_val(value val) {
  int tag = Int_val(val);
  if (tag == 633442369) return GTK_CONSTRAINT_RELATION_LE; /* `LE */
  else if (tag == 551539569) return GTK_CONSTRAINT_RELATION_EQ; /* `EQ */
  else if (tag == 620103353) return GTK_CONSTRAINT_RELATION_GE; /* `GE */
  else return GTK_CONSTRAINT_RELATION_LE; /* fallback to first value */
}

/* Convert GtkConstraintStrength to OCaml value */
value Val_GtkConstraintStrength(GtkConstraintStrength val) {
  switch (val) {
    case GTK_CONSTRAINT_STRENGTH_REQUIRED: return Val_int(518474020); /* `REQUIRED */
    case GTK_CONSTRAINT_STRENGTH_STRONG: return Val_int(953257587); /* `STRONG */
    case GTK_CONSTRAINT_STRENGTH_MEDIUM: return Val_int(57925782); /* `MEDIUM */
    case GTK_CONSTRAINT_STRENGTH_WEAK: return Val_int(782389184); /* `WEAK */
    default: return Val_int(518474020); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkConstraintStrength */
GtkConstraintStrength GtkConstraintStrength_val(value val) {
  int tag = Int_val(val);
  if (tag == 518474020) return GTK_CONSTRAINT_STRENGTH_REQUIRED; /* `REQUIRED */
  else if (tag == 953257587) return GTK_CONSTRAINT_STRENGTH_STRONG; /* `STRONG */
  else if (tag == 57925782) return GTK_CONSTRAINT_STRENGTH_MEDIUM; /* `MEDIUM */
  else if (tag == 782389184) return GTK_CONSTRAINT_STRENGTH_WEAK; /* `WEAK */
  else return GTK_CONSTRAINT_STRENGTH_REQUIRED; /* fallback to first value */
}

/* Convert GtkConstraintVflParserError to OCaml value */
value Val_GtkConstraintVflParserError(GtkConstraintVflParserError val) {
  switch (val) {
    case GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_SYMBOL: return Val_int(610945656); /* `SYMBOL */
    case GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_ATTRIBUTE: return Val_int(828969362); /* `ATTRIBUTE */
    case GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_VIEW: return Val_int(615535483); /* `VIEW */
    case GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_METRIC: return Val_int(124653817); /* `METRIC */
    case GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_PRIORITY: return Val_int(479657530); /* `PRIORITY */
    case GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_RELATION: return Val_int(316075881); /* `RELATION */
    default: return Val_int(610945656); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkConstraintVflParserError */
GtkConstraintVflParserError GtkConstraintVflParserError_val(value val) {
  int tag = Int_val(val);
  if (tag == 610945656) return GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_SYMBOL; /* `SYMBOL */
  else if (tag == 828969362) return GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_ATTRIBUTE; /* `ATTRIBUTE */
  else if (tag == 615535483) return GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_VIEW; /* `VIEW */
  else if (tag == 124653817) return GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_METRIC; /* `METRIC */
  else if (tag == 479657530) return GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_PRIORITY; /* `PRIORITY */
  else if (tag == 316075881) return GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_RELATION; /* `RELATION */
  else return GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_SYMBOL; /* fallback to first value */
}

/* Convert GtkContentFit to OCaml value */
value Val_GtkContentFit(GtkContentFit val) {
  switch (val) {
    case GTK_CONTENT_FIT_FILL: return Val_int(263377307); /* `FILL */
    case GTK_CONTENT_FIT_CONTAIN: return Val_int(567603277); /* `CONTAIN */
    case GTK_CONTENT_FIT_COVER: return Val_int(462944702); /* `COVER */
    case GTK_CONTENT_FIT_SCALE_DOWN: return Val_int(1026785767); /* `SCALE_DOWN */
    default: return Val_int(263377307); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkContentFit */
GtkContentFit GtkContentFit_val(value val) {
  int tag = Int_val(val);
  if (tag == 263377307) return GTK_CONTENT_FIT_FILL; /* `FILL */
  else if (tag == 567603277) return GTK_CONTENT_FIT_CONTAIN; /* `CONTAIN */
  else if (tag == 462944702) return GTK_CONTENT_FIT_COVER; /* `COVER */
  else if (tag == 1026785767) return GTK_CONTENT_FIT_SCALE_DOWN; /* `SCALE_DOWN */
  else return GTK_CONTENT_FIT_FILL; /* fallback to first value */
}

/* Convert GtkCornerType to OCaml value */
value Val_GtkCornerType(GtkCornerType val) {
  switch (val) {
    case GTK_CORNER_TOP_LEFT: return Val_int(892618403); /* `TOP_LEFT */
    case GTK_CORNER_BOTTOM_LEFT: return Val_int(1024975575); /* `BOTTOM_LEFT */
    case GTK_CORNER_TOP_RIGHT: return Val_int(205854740); /* `TOP_RIGHT */
    case GTK_CORNER_BOTTOM_RIGHT: return Val_int(371482052); /* `BOTTOM_RIGHT */
    default: return Val_int(892618403); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkCornerType */
GtkCornerType GtkCornerType_val(value val) {
  int tag = Int_val(val);
  if (tag == 892618403) return GTK_CORNER_TOP_LEFT; /* `TOP_LEFT */
  else if (tag == 1024975575) return GTK_CORNER_BOTTOM_LEFT; /* `BOTTOM_LEFT */
  else if (tag == 205854740) return GTK_CORNER_TOP_RIGHT; /* `TOP_RIGHT */
  else if (tag == 371482052) return GTK_CORNER_BOTTOM_RIGHT; /* `BOTTOM_RIGHT */
  else return GTK_CORNER_TOP_LEFT; /* fallback to first value */
}

/* Convert GtkCssParserError to OCaml value */
value Val_GtkCssParserError(GtkCssParserError val) {
  switch (val) {
    case GTK_CSS_PARSER_ERROR_FAILED: return Val_int(925697929); /* `FAILED */
    case GTK_CSS_PARSER_ERROR_SYNTAX: return Val_int(484804011); /* `SYNTAX */
    case GTK_CSS_PARSER_ERROR_IMPORT: return Val_int(299628439); /* `IMPORT */
    case GTK_CSS_PARSER_ERROR_NAME: return Val_int(506353843); /* `NAME */
    case GTK_CSS_PARSER_ERROR_UNKNOWN_VALUE: return Val_int(803985612); /* `UNKNOWN_VALUE */
    default: return Val_int(925697929); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkCssParserError */
GtkCssParserError GtkCssParserError_val(value val) {
  int tag = Int_val(val);
  if (tag == 925697929) return GTK_CSS_PARSER_ERROR_FAILED; /* `FAILED */
  else if (tag == 484804011) return GTK_CSS_PARSER_ERROR_SYNTAX; /* `SYNTAX */
  else if (tag == 299628439) return GTK_CSS_PARSER_ERROR_IMPORT; /* `IMPORT */
  else if (tag == 506353843) return GTK_CSS_PARSER_ERROR_NAME; /* `NAME */
  else if (tag == 803985612) return GTK_CSS_PARSER_ERROR_UNKNOWN_VALUE; /* `UNKNOWN_VALUE */
  else return GTK_CSS_PARSER_ERROR_FAILED; /* fallback to first value */
}

/* Convert GtkCssParserWarning to OCaml value */
value Val_GtkCssParserWarning(GtkCssParserWarning val) {
  switch (val) {
    case GTK_CSS_PARSER_WARNING_DEPRECATED: return Val_int(745807152); /* `DEPRECATED */
    case GTK_CSS_PARSER_WARNING_SYNTAX: return Val_int(484804011); /* `SYNTAX */
    case GTK_CSS_PARSER_WARNING_UNIMPLEMENTED: return Val_int(783301922); /* `UNIMPLEMENTED */
    default: return Val_int(745807152); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkCssParserWarning */
GtkCssParserWarning GtkCssParserWarning_val(value val) {
  int tag = Int_val(val);
  if (tag == 745807152) return GTK_CSS_PARSER_WARNING_DEPRECATED; /* `DEPRECATED */
  else if (tag == 484804011) return GTK_CSS_PARSER_WARNING_SYNTAX; /* `SYNTAX */
  else if (tag == 783301922) return GTK_CSS_PARSER_WARNING_UNIMPLEMENTED; /* `UNIMPLEMENTED */
  else return GTK_CSS_PARSER_WARNING_DEPRECATED; /* fallback to first value */
}

/* Convert GtkDeleteType to OCaml value */
value Val_GtkDeleteType(GtkDeleteType val) {
  switch (val) {
    case GTK_DELETE_CHARS: return Val_int(250932212); /* `CHARS */
    case GTK_DELETE_WORD_ENDS: return Val_int(597915683); /* `WORD_ENDS */
    case GTK_DELETE_WORDS: return Val_int(152256805); /* `WORDS */
    case GTK_DELETE_DISPLAY_LINES: return Val_int(914655016); /* `DISPLAY_LINES */
    case GTK_DELETE_DISPLAY_LINE_ENDS: return Val_int(637616606); /* `DISPLAY_LINE_ENDS */
    case GTK_DELETE_PARAGRAPH_ENDS: return Val_int(501024956); /* `PARAGRAPH_ENDS */
    case GTK_DELETE_PARAGRAPHS: return Val_int(357076166); /* `PARAGRAPHS */
    case GTK_DELETE_WHITESPACE: return Val_int(258542475); /* `WHITESPACE */
    default: return Val_int(250932212); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkDeleteType */
GtkDeleteType GtkDeleteType_val(value val) {
  int tag = Int_val(val);
  if (tag == 250932212) return GTK_DELETE_CHARS; /* `CHARS */
  else if (tag == 597915683) return GTK_DELETE_WORD_ENDS; /* `WORD_ENDS */
  else if (tag == 152256805) return GTK_DELETE_WORDS; /* `WORDS */
  else if (tag == 914655016) return GTK_DELETE_DISPLAY_LINES; /* `DISPLAY_LINES */
  else if (tag == 637616606) return GTK_DELETE_DISPLAY_LINE_ENDS; /* `DISPLAY_LINE_ENDS */
  else if (tag == 501024956) return GTK_DELETE_PARAGRAPH_ENDS; /* `PARAGRAPH_ENDS */
  else if (tag == 357076166) return GTK_DELETE_PARAGRAPHS; /* `PARAGRAPHS */
  else if (tag == 258542475) return GTK_DELETE_WHITESPACE; /* `WHITESPACE */
  else return GTK_DELETE_CHARS; /* fallback to first value */
}

/* Convert GtkDialogError to OCaml value */
value Val_GtkDialogError(GtkDialogError val) {
  switch (val) {
    case GTK_DIALOG_ERROR_FAILED: return Val_int(925697929); /* `FAILED */
    case GTK_DIALOG_ERROR_CANCELLED: return Val_int(919468448); /* `CANCELLED */
    case GTK_DIALOG_ERROR_DISMISSED: return Val_int(108014969); /* `DISMISSED */
    default: return Val_int(925697929); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkDialogError */
GtkDialogError GtkDialogError_val(value val) {
  int tag = Int_val(val);
  if (tag == 925697929) return GTK_DIALOG_ERROR_FAILED; /* `FAILED */
  else if (tag == 919468448) return GTK_DIALOG_ERROR_CANCELLED; /* `CANCELLED */
  else if (tag == 108014969) return GTK_DIALOG_ERROR_DISMISSED; /* `DISMISSED */
  else return GTK_DIALOG_ERROR_FAILED; /* fallback to first value */
}

/* Convert GtkDirectionType to OCaml value */
value Val_GtkDirectionType(GtkDirectionType val) {
  switch (val) {
    case GTK_DIR_TAB_FORWARD: return Val_int(977316497); /* `TAB_FORWARD */
    case GTK_DIR_TAB_BACKWARD: return Val_int(654793144); /* `TAB_BACKWARD */
    case GTK_DIR_UP: return Val_int(160130855); /* `UP */
    case GTK_DIR_DOWN: return Val_int(878985997); /* `DOWN */
    case GTK_DIR_LEFT: return Val_int(28713888); /* `LEFT */
    case GTK_DIR_RIGHT: return Val_int(961111566); /* `RIGHT */
    default: return Val_int(977316497); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkDirectionType */
GtkDirectionType GtkDirectionType_val(value val) {
  int tag = Int_val(val);
  if (tag == 977316497) return GTK_DIR_TAB_FORWARD; /* `TAB_FORWARD */
  else if (tag == 654793144) return GTK_DIR_TAB_BACKWARD; /* `TAB_BACKWARD */
  else if (tag == 160130855) return GTK_DIR_UP; /* `UP */
  else if (tag == 878985997) return GTK_DIR_DOWN; /* `DOWN */
  else if (tag == 28713888) return GTK_DIR_LEFT; /* `LEFT */
  else if (tag == 961111566) return GTK_DIR_RIGHT; /* `RIGHT */
  else return GTK_DIR_TAB_FORWARD; /* fallback to first value */
}

/* Convert GtkEditableProperties to OCaml value */
value Val_GtkEditableProperties(GtkEditableProperties val) {
  switch (val) {
    case GTK_EDITABLE_PROP_TEXT: return Val_int(1061297078); /* `PROP_TEXT */
    case GTK_EDITABLE_PROP_CURSOR_POSITION: return Val_int(5144363); /* `PROP_CURSOR_POSITION */
    case GTK_EDITABLE_PROP_SELECTION_BOUND: return Val_int(488236354); /* `PROP_SELECTION_BOUND */
    case GTK_EDITABLE_PROP_EDITABLE: return Val_int(926368059); /* `PROP_EDITABLE */
    case GTK_EDITABLE_PROP_WIDTH_CHARS: return Val_int(55763340); /* `PROP_WIDTH_CHARS */
    case GTK_EDITABLE_PROP_MAX_WIDTH_CHARS: return Val_int(748480760); /* `PROP_MAX_WIDTH_CHARS */
    case GTK_EDITABLE_PROP_XALIGN: return Val_int(182351922); /* `PROP_XALIGN */
    case GTK_EDITABLE_PROP_ENABLE_UNDO: return Val_int(813866473); /* `PROP_ENABLE_UNDO */
    case GTK_EDITABLE_NUM_PROPERTIES: return Val_int(574192620); /* `NUM_PROPERTIES */
    default: return Val_int(1061297078); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkEditableProperties */
GtkEditableProperties GtkEditableProperties_val(value val) {
  int tag = Int_val(val);
  if (tag == 1061297078) return GTK_EDITABLE_PROP_TEXT; /* `PROP_TEXT */
  else if (tag == 5144363) return GTK_EDITABLE_PROP_CURSOR_POSITION; /* `PROP_CURSOR_POSITION */
  else if (tag == 488236354) return GTK_EDITABLE_PROP_SELECTION_BOUND; /* `PROP_SELECTION_BOUND */
  else if (tag == 926368059) return GTK_EDITABLE_PROP_EDITABLE; /* `PROP_EDITABLE */
  else if (tag == 55763340) return GTK_EDITABLE_PROP_WIDTH_CHARS; /* `PROP_WIDTH_CHARS */
  else if (tag == 748480760) return GTK_EDITABLE_PROP_MAX_WIDTH_CHARS; /* `PROP_MAX_WIDTH_CHARS */
  else if (tag == 182351922) return GTK_EDITABLE_PROP_XALIGN; /* `PROP_XALIGN */
  else if (tag == 813866473) return GTK_EDITABLE_PROP_ENABLE_UNDO; /* `PROP_ENABLE_UNDO */
  else if (tag == 574192620) return GTK_EDITABLE_NUM_PROPERTIES; /* `NUM_PROPERTIES */
  else return GTK_EDITABLE_PROP_TEXT; /* fallback to first value */
}

/* Convert GtkEntryIconPosition to OCaml value */
value Val_GtkEntryIconPosition(GtkEntryIconPosition val) {
  switch (val) {
    case GTK_ENTRY_ICON_PRIMARY: return Val_int(804397948); /* `PRIMARY */
    case GTK_ENTRY_ICON_SECONDARY: return Val_int(511358720); /* `SECONDARY */
    default: return Val_int(804397948); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkEntryIconPosition */
GtkEntryIconPosition GtkEntryIconPosition_val(value val) {
  int tag = Int_val(val);
  if (tag == 804397948) return GTK_ENTRY_ICON_PRIMARY; /* `PRIMARY */
  else if (tag == 511358720) return GTK_ENTRY_ICON_SECONDARY; /* `SECONDARY */
  else return GTK_ENTRY_ICON_PRIMARY; /* fallback to first value */
}

/* Convert GtkEventSequenceState to OCaml value */
value Val_GtkEventSequenceState(GtkEventSequenceState val) {
  switch (val) {
    case GTK_EVENT_SEQUENCE_NONE: return Val_int(37469934); /* `NONE */
    case GTK_EVENT_SEQUENCE_CLAIMED: return Val_int(620167260); /* `CLAIMED */
    case GTK_EVENT_SEQUENCE_DENIED: return Val_int(930758746); /* `DENIED */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkEventSequenceState */
GtkEventSequenceState GtkEventSequenceState_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_EVENT_SEQUENCE_NONE; /* `NONE */
  else if (tag == 620167260) return GTK_EVENT_SEQUENCE_CLAIMED; /* `CLAIMED */
  else if (tag == 930758746) return GTK_EVENT_SEQUENCE_DENIED; /* `DENIED */
  else return GTK_EVENT_SEQUENCE_NONE; /* fallback to first value */
}

/* Convert GtkFileChooserAction to OCaml value */
value Val_GtkFileChooserAction(GtkFileChooserAction val) {
  switch (val) {
    case GTK_FILE_CHOOSER_ACTION_OPEN: return Val_int(485712552); /* `OPEN */
    case GTK_FILE_CHOOSER_ACTION_SAVE: return Val_int(230002821); /* `SAVE */
    case GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER: return Val_int(753529900); /* `SELECT_FOLDER */
    default: return Val_int(485712552); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkFileChooserAction */
GtkFileChooserAction GtkFileChooserAction_val(value val) {
  int tag = Int_val(val);
  if (tag == 485712552) return GTK_FILE_CHOOSER_ACTION_OPEN; /* `OPEN */
  else if (tag == 230002821) return GTK_FILE_CHOOSER_ACTION_SAVE; /* `SAVE */
  else if (tag == 753529900) return GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER; /* `SELECT_FOLDER */
  else return GTK_FILE_CHOOSER_ACTION_OPEN; /* fallback to first value */
}

/* Convert GtkFileChooserError to OCaml value */
value Val_GtkFileChooserError(GtkFileChooserError val) {
  switch (val) {
    case GTK_FILE_CHOOSER_ERROR_NONEXISTENT: return Val_int(144886956); /* `NONEXISTENT */
    case GTK_FILE_CHOOSER_ERROR_BAD_FILENAME: return Val_int(958220628); /* `BAD_FILENAME */
    case GTK_FILE_CHOOSER_ERROR_ALREADY_EXISTS: return Val_int(323346212); /* `ALREADY_EXISTS */
    case GTK_FILE_CHOOSER_ERROR_INCOMPLETE_HOSTNAME: return Val_int(283083233); /* `INCOMPLETE_HOSTNAME */
    default: return Val_int(144886956); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkFileChooserError */
GtkFileChooserError GtkFileChooserError_val(value val) {
  int tag = Int_val(val);
  if (tag == 144886956) return GTK_FILE_CHOOSER_ERROR_NONEXISTENT; /* `NONEXISTENT */
  else if (tag == 958220628) return GTK_FILE_CHOOSER_ERROR_BAD_FILENAME; /* `BAD_FILENAME */
  else if (tag == 323346212) return GTK_FILE_CHOOSER_ERROR_ALREADY_EXISTS; /* `ALREADY_EXISTS */
  else if (tag == 283083233) return GTK_FILE_CHOOSER_ERROR_INCOMPLETE_HOSTNAME; /* `INCOMPLETE_HOSTNAME */
  else return GTK_FILE_CHOOSER_ERROR_NONEXISTENT; /* fallback to first value */
}

/* Convert GtkFilterChange to OCaml value */
value Val_GtkFilterChange(GtkFilterChange val) {
  switch (val) {
    case GTK_FILTER_CHANGE_DIFFERENT: return Val_int(163830453); /* `DIFFERENT */
    case GTK_FILTER_CHANGE_LESS_STRICT: return Val_int(620736805); /* `LESS_STRICT */
    case GTK_FILTER_CHANGE_MORE_STRICT: return Val_int(429188853); /* `MORE_STRICT */
    default: return Val_int(163830453); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkFilterChange */
GtkFilterChange GtkFilterChange_val(value val) {
  int tag = Int_val(val);
  if (tag == 163830453) return GTK_FILTER_CHANGE_DIFFERENT; /* `DIFFERENT */
  else if (tag == 620736805) return GTK_FILTER_CHANGE_LESS_STRICT; /* `LESS_STRICT */
  else if (tag == 429188853) return GTK_FILTER_CHANGE_MORE_STRICT; /* `MORE_STRICT */
  else return GTK_FILTER_CHANGE_DIFFERENT; /* fallback to first value */
}

/* Convert GtkFilterMatch to OCaml value */
value Val_GtkFilterMatch(GtkFilterMatch val) {
  switch (val) {
    case GTK_FILTER_MATCH_SOME: return Val_int(241945431); /* `SOME */
    case GTK_FILTER_MATCH_NONE: return Val_int(37469934); /* `NONE */
    case GTK_FILTER_MATCH_ALL: return Val_int(96450141); /* `ALL */
    default: return Val_int(241945431); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkFilterMatch */
GtkFilterMatch GtkFilterMatch_val(value val) {
  int tag = Int_val(val);
  if (tag == 241945431) return GTK_FILTER_MATCH_SOME; /* `SOME */
  else if (tag == 37469934) return GTK_FILTER_MATCH_NONE; /* `NONE */
  else if (tag == 96450141) return GTK_FILTER_MATCH_ALL; /* `ALL */
  else return GTK_FILTER_MATCH_SOME; /* fallback to first value */
}

/* Convert GtkFontLevel to OCaml value */
value Val_GtkFontLevel(GtkFontLevel val) {
  switch (val) {
    case GTK_FONT_LEVEL_FAMILY: return Val_int(690675795); /* `FAMILY */
    case GTK_FONT_LEVEL_FACE: return Val_int(498684657); /* `FACE */
    case GTK_FONT_LEVEL_FONT: return Val_int(29042317); /* `FONT */
    case GTK_FONT_LEVEL_FEATURES: return Val_int(816931048); /* `FEATURES */
    default: return Val_int(690675795); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkFontLevel */
GtkFontLevel GtkFontLevel_val(value val) {
  int tag = Int_val(val);
  if (tag == 690675795) return GTK_FONT_LEVEL_FAMILY; /* `FAMILY */
  else if (tag == 498684657) return GTK_FONT_LEVEL_FACE; /* `FACE */
  else if (tag == 29042317) return GTK_FONT_LEVEL_FONT; /* `FONT */
  else if (tag == 816931048) return GTK_FONT_LEVEL_FEATURES; /* `FEATURES */
  else return GTK_FONT_LEVEL_FAMILY; /* fallback to first value */
}

/* Convert GtkGraphicsOffloadEnabled to OCaml value */
value Val_GtkGraphicsOffloadEnabled(GtkGraphicsOffloadEnabled val) {
  switch (val) {
    case GTK_GRAPHICS_OFFLOAD_ENABLED: return Val_int(150757190); /* `ENABLED */
    case GTK_GRAPHICS_OFFLOAD_DISABLED: return Val_int(510375555); /* `DISABLED */
    default: return Val_int(150757190); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkGraphicsOffloadEnabled */
GtkGraphicsOffloadEnabled GtkGraphicsOffloadEnabled_val(value val) {
  int tag = Int_val(val);
  if (tag == 150757190) return GTK_GRAPHICS_OFFLOAD_ENABLED; /* `ENABLED */
  else if (tag == 510375555) return GTK_GRAPHICS_OFFLOAD_DISABLED; /* `DISABLED */
  else return GTK_GRAPHICS_OFFLOAD_ENABLED; /* fallback to first value */
}

/* Convert GtkIconSize to OCaml value */
value Val_GtkIconSize(GtkIconSize val) {
  switch (val) {
    case GTK_ICON_SIZE_INHERIT: return Val_int(178543076); /* `INHERIT */
    case GTK_ICON_SIZE_NORMAL: return Val_int(888717969); /* `NORMAL */
    case GTK_ICON_SIZE_LARGE: return Val_int(363805903); /* `LARGE */
    default: return Val_int(178543076); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkIconSize */
GtkIconSize GtkIconSize_val(value val) {
  int tag = Int_val(val);
  if (tag == 178543076) return GTK_ICON_SIZE_INHERIT; /* `INHERIT */
  else if (tag == 888717969) return GTK_ICON_SIZE_NORMAL; /* `NORMAL */
  else if (tag == 363805903) return GTK_ICON_SIZE_LARGE; /* `LARGE */
  else return GTK_ICON_SIZE_INHERIT; /* fallback to first value */
}

/* Convert GtkIconThemeError to OCaml value */
value Val_GtkIconThemeError(GtkIconThemeError val) {
  switch (val) {
    case GTK_ICON_THEME_NOT_FOUND: return Val_int(420710559); /* `NOT_FOUND */
    case GTK_ICON_THEME_FAILED: return Val_int(925697929); /* `FAILED */
    default: return Val_int(420710559); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkIconThemeError */
GtkIconThemeError GtkIconThemeError_val(value val) {
  int tag = Int_val(val);
  if (tag == 420710559) return GTK_ICON_THEME_NOT_FOUND; /* `NOT_FOUND */
  else if (tag == 925697929) return GTK_ICON_THEME_FAILED; /* `FAILED */
  else return GTK_ICON_THEME_NOT_FOUND; /* fallback to first value */
}

/* Convert GtkIconViewDropPosition to OCaml value */
value Val_GtkIconViewDropPosition(GtkIconViewDropPosition val) {
  switch (val) {
    case GTK_ICON_VIEW_NO_DROP: return Val_int(197049853); /* `NO_DROP */
    case GTK_ICON_VIEW_DROP_INTO: return Val_int(408959092); /* `DROP_INTO */
    case GTK_ICON_VIEW_DROP_LEFT: return Val_int(1001050367); /* `DROP_LEFT */
    case GTK_ICON_VIEW_DROP_RIGHT: return Val_int(851495417); /* `DROP_RIGHT */
    case GTK_ICON_VIEW_DROP_ABOVE: return Val_int(1058996709); /* `DROP_ABOVE */
    case GTK_ICON_VIEW_DROP_BELOW: return Val_int(95114347); /* `DROP_BELOW */
    default: return Val_int(197049853); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkIconViewDropPosition */
GtkIconViewDropPosition GtkIconViewDropPosition_val(value val) {
  int tag = Int_val(val);
  if (tag == 197049853) return GTK_ICON_VIEW_NO_DROP; /* `NO_DROP */
  else if (tag == 408959092) return GTK_ICON_VIEW_DROP_INTO; /* `DROP_INTO */
  else if (tag == 1001050367) return GTK_ICON_VIEW_DROP_LEFT; /* `DROP_LEFT */
  else if (tag == 851495417) return GTK_ICON_VIEW_DROP_RIGHT; /* `DROP_RIGHT */
  else if (tag == 1058996709) return GTK_ICON_VIEW_DROP_ABOVE; /* `DROP_ABOVE */
  else if (tag == 95114347) return GTK_ICON_VIEW_DROP_BELOW; /* `DROP_BELOW */
  else return GTK_ICON_VIEW_NO_DROP; /* fallback to first value */
}

/* Convert GtkImageType to OCaml value */
value Val_GtkImageType(GtkImageType val) {
  switch (val) {
    case GTK_IMAGE_EMPTY: return Val_int(1034534598); /* `EMPTY */
    case GTK_IMAGE_ICON_NAME: return Val_int(27050754); /* `ICON_NAME */
    case GTK_IMAGE_GICON: return Val_int(999378045); /* `GICON */
    case GTK_IMAGE_PAINTABLE: return Val_int(205282152); /* `PAINTABLE */
    default: return Val_int(1034534598); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkImageType */
GtkImageType GtkImageType_val(value val) {
  int tag = Int_val(val);
  if (tag == 1034534598) return GTK_IMAGE_EMPTY; /* `EMPTY */
  else if (tag == 27050754) return GTK_IMAGE_ICON_NAME; /* `ICON_NAME */
  else if (tag == 999378045) return GTK_IMAGE_GICON; /* `GICON */
  else if (tag == 205282152) return GTK_IMAGE_PAINTABLE; /* `PAINTABLE */
  else return GTK_IMAGE_EMPTY; /* fallback to first value */
}

/* Convert GtkInputPurpose to OCaml value */
value Val_GtkInputPurpose(GtkInputPurpose val) {
  switch (val) {
    case GTK_INPUT_PURPOSE_FREE_FORM: return Val_int(446413297); /* `FREE_FORM */
    case GTK_INPUT_PURPOSE_ALPHA: return Val_int(295494798); /* `ALPHA */
    case GTK_INPUT_PURPOSE_DIGITS: return Val_int(703304934); /* `DIGITS */
    case GTK_INPUT_PURPOSE_NUMBER: return Val_int(462561074); /* `NUMBER */
    case GTK_INPUT_PURPOSE_PHONE: return Val_int(633200257); /* `PHONE */
    case GTK_INPUT_PURPOSE_URL: return Val_int(614915363); /* `URL */
    case GTK_INPUT_PURPOSE_EMAIL: return Val_int(484070473); /* `EMAIL */
    case GTK_INPUT_PURPOSE_NAME: return Val_int(506353843); /* `NAME */
    case GTK_INPUT_PURPOSE_PASSWORD: return Val_int(513137247); /* `PASSWORD */
    case GTK_INPUT_PURPOSE_PIN: return Val_int(291004019); /* `PIN */
    case GTK_INPUT_PURPOSE_TERMINAL: return Val_int(288631146); /* `TERMINAL */
    default: return Val_int(446413297); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkInputPurpose */
GtkInputPurpose GtkInputPurpose_val(value val) {
  int tag = Int_val(val);
  if (tag == 446413297) return GTK_INPUT_PURPOSE_FREE_FORM; /* `FREE_FORM */
  else if (tag == 295494798) return GTK_INPUT_PURPOSE_ALPHA; /* `ALPHA */
  else if (tag == 703304934) return GTK_INPUT_PURPOSE_DIGITS; /* `DIGITS */
  else if (tag == 462561074) return GTK_INPUT_PURPOSE_NUMBER; /* `NUMBER */
  else if (tag == 633200257) return GTK_INPUT_PURPOSE_PHONE; /* `PHONE */
  else if (tag == 614915363) return GTK_INPUT_PURPOSE_URL; /* `URL */
  else if (tag == 484070473) return GTK_INPUT_PURPOSE_EMAIL; /* `EMAIL */
  else if (tag == 506353843) return GTK_INPUT_PURPOSE_NAME; /* `NAME */
  else if (tag == 513137247) return GTK_INPUT_PURPOSE_PASSWORD; /* `PASSWORD */
  else if (tag == 291004019) return GTK_INPUT_PURPOSE_PIN; /* `PIN */
  else if (tag == 288631146) return GTK_INPUT_PURPOSE_TERMINAL; /* `TERMINAL */
  else return GTK_INPUT_PURPOSE_FREE_FORM; /* fallback to first value */
}

/* Convert GtkInscriptionOverflow to OCaml value */
value Val_GtkInscriptionOverflow(GtkInscriptionOverflow val) {
  switch (val) {
    case GTK_INSCRIPTION_OVERFLOW_CLIP: return Val_int(348623802); /* `CLIP */
    case GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_START: return Val_int(1067525362); /* `ELLIPSIZE_START */
    case GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_MIDDLE: return Val_int(393443084); /* `ELLIPSIZE_MIDDLE */
    case GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_END: return Val_int(154012781); /* `ELLIPSIZE_END */
    default: return Val_int(348623802); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkInscriptionOverflow */
GtkInscriptionOverflow GtkInscriptionOverflow_val(value val) {
  int tag = Int_val(val);
  if (tag == 348623802) return GTK_INSCRIPTION_OVERFLOW_CLIP; /* `CLIP */
  else if (tag == 1067525362) return GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_START; /* `ELLIPSIZE_START */
  else if (tag == 393443084) return GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_MIDDLE; /* `ELLIPSIZE_MIDDLE */
  else if (tag == 154012781) return GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_END; /* `ELLIPSIZE_END */
  else return GTK_INSCRIPTION_OVERFLOW_CLIP; /* fallback to first value */
}

/* Convert GtkJustification to OCaml value */
value Val_GtkJustification(GtkJustification val) {
  switch (val) {
    case GTK_JUSTIFY_LEFT: return Val_int(28713888); /* `LEFT */
    case GTK_JUSTIFY_RIGHT: return Val_int(961111566); /* `RIGHT */
    case GTK_JUSTIFY_CENTER: return Val_int(428864253); /* `CENTER */
    case GTK_JUSTIFY_FILL: return Val_int(263377307); /* `FILL */
    default: return Val_int(28713888); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkJustification */
GtkJustification GtkJustification_val(value val) {
  int tag = Int_val(val);
  if (tag == 28713888) return GTK_JUSTIFY_LEFT; /* `LEFT */
  else if (tag == 961111566) return GTK_JUSTIFY_RIGHT; /* `RIGHT */
  else if (tag == 428864253) return GTK_JUSTIFY_CENTER; /* `CENTER */
  else if (tag == 263377307) return GTK_JUSTIFY_FILL; /* `FILL */
  else return GTK_JUSTIFY_LEFT; /* fallback to first value */
}

/* Convert GtkLevelBarMode to OCaml value */
value Val_GtkLevelBarMode(GtkLevelBarMode val) {
  switch (val) {
    case GTK_LEVEL_BAR_MODE_CONTINUOUS: return Val_int(430544503); /* `CONTINUOUS */
    case GTK_LEVEL_BAR_MODE_DISCRETE: return Val_int(644866580); /* `DISCRETE */
    default: return Val_int(430544503); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkLevelBarMode */
GtkLevelBarMode GtkLevelBarMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 430544503) return GTK_LEVEL_BAR_MODE_CONTINUOUS; /* `CONTINUOUS */
  else if (tag == 644866580) return GTK_LEVEL_BAR_MODE_DISCRETE; /* `DISCRETE */
  else return GTK_LEVEL_BAR_MODE_CONTINUOUS; /* fallback to first value */
}

/* Convert GtkListTabBehavior to OCaml value */
value Val_GtkListTabBehavior(GtkListTabBehavior val) {
  switch (val) {
    case GTK_LIST_TAB_ALL: return Val_int(96450141); /* `ALL */
    case GTK_LIST_TAB_ITEM: return Val_int(698841792); /* `ITEM */
    case GTK_LIST_TAB_CELL: return Val_int(294115967); /* `CELL */
    default: return Val_int(96450141); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkListTabBehavior */
GtkListTabBehavior GtkListTabBehavior_val(value val) {
  int tag = Int_val(val);
  if (tag == 96450141) return GTK_LIST_TAB_ALL; /* `ALL */
  else if (tag == 698841792) return GTK_LIST_TAB_ITEM; /* `ITEM */
  else if (tag == 294115967) return GTK_LIST_TAB_CELL; /* `CELL */
  else return GTK_LIST_TAB_ALL; /* fallback to first value */
}

/* Convert GtkMessageType to OCaml value */
value Val_GtkMessageType(GtkMessageType val) {
  switch (val) {
    case GTK_MESSAGE_INFO: return Val_int(698867640); /* `INFO */
    case GTK_MESSAGE_WARNING: return Val_int(928678842); /* `WARNING */
    case GTK_MESSAGE_QUESTION: return Val_int(945786767); /* `QUESTION */
    case GTK_MESSAGE_ERROR: return Val_int(1064539868); /* `ERROR */
    case GTK_MESSAGE_OTHER: return Val_int(615852999); /* `OTHER */
    default: return Val_int(698867640); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkMessageType */
GtkMessageType GtkMessageType_val(value val) {
  int tag = Int_val(val);
  if (tag == 698867640) return GTK_MESSAGE_INFO; /* `INFO */
  else if (tag == 928678842) return GTK_MESSAGE_WARNING; /* `WARNING */
  else if (tag == 945786767) return GTK_MESSAGE_QUESTION; /* `QUESTION */
  else if (tag == 1064539868) return GTK_MESSAGE_ERROR; /* `ERROR */
  else if (tag == 615852999) return GTK_MESSAGE_OTHER; /* `OTHER */
  else return GTK_MESSAGE_INFO; /* fallback to first value */
}

/* Convert GtkMovementStep to OCaml value */
value Val_GtkMovementStep(GtkMovementStep val) {
  switch (val) {
    case GTK_MOVEMENT_LOGICAL_POSITIONS: return Val_int(65746232); /* `LOGICAL_POSITIONS */
    case GTK_MOVEMENT_VISUAL_POSITIONS: return Val_int(1002865074); /* `VISUAL_POSITIONS */
    case GTK_MOVEMENT_WORDS: return Val_int(152256805); /* `WORDS */
    case GTK_MOVEMENT_DISPLAY_LINES: return Val_int(914655016); /* `DISPLAY_LINES */
    case GTK_MOVEMENT_DISPLAY_LINE_ENDS: return Val_int(637616606); /* `DISPLAY_LINE_ENDS */
    case GTK_MOVEMENT_PARAGRAPHS: return Val_int(357076166); /* `PARAGRAPHS */
    case GTK_MOVEMENT_PARAGRAPH_ENDS: return Val_int(501024956); /* `PARAGRAPH_ENDS */
    case GTK_MOVEMENT_PAGES: return Val_int(577252077); /* `PAGES */
    case GTK_MOVEMENT_BUFFER_ENDS: return Val_int(747603512); /* `BUFFER_ENDS */
    case GTK_MOVEMENT_HORIZONTAL_PAGES: return Val_int(691824062); /* `HORIZONTAL_PAGES */
    default: return Val_int(65746232); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkMovementStep */
GtkMovementStep GtkMovementStep_val(value val) {
  int tag = Int_val(val);
  if (tag == 65746232) return GTK_MOVEMENT_LOGICAL_POSITIONS; /* `LOGICAL_POSITIONS */
  else if (tag == 1002865074) return GTK_MOVEMENT_VISUAL_POSITIONS; /* `VISUAL_POSITIONS */
  else if (tag == 152256805) return GTK_MOVEMENT_WORDS; /* `WORDS */
  else if (tag == 914655016) return GTK_MOVEMENT_DISPLAY_LINES; /* `DISPLAY_LINES */
  else if (tag == 637616606) return GTK_MOVEMENT_DISPLAY_LINE_ENDS; /* `DISPLAY_LINE_ENDS */
  else if (tag == 357076166) return GTK_MOVEMENT_PARAGRAPHS; /* `PARAGRAPHS */
  else if (tag == 501024956) return GTK_MOVEMENT_PARAGRAPH_ENDS; /* `PARAGRAPH_ENDS */
  else if (tag == 577252077) return GTK_MOVEMENT_PAGES; /* `PAGES */
  else if (tag == 747603512) return GTK_MOVEMENT_BUFFER_ENDS; /* `BUFFER_ENDS */
  else if (tag == 691824062) return GTK_MOVEMENT_HORIZONTAL_PAGES; /* `HORIZONTAL_PAGES */
  else return GTK_MOVEMENT_LOGICAL_POSITIONS; /* fallback to first value */
}

/* Convert GtkNaturalWrapMode to OCaml value */
value Val_GtkNaturalWrapMode(GtkNaturalWrapMode val) {
  switch (val) {
    case GTK_NATURAL_WRAP_INHERIT: return Val_int(178543076); /* `INHERIT */
    case GTK_NATURAL_WRAP_NONE: return Val_int(37469934); /* `NONE */
    case GTK_NATURAL_WRAP_WORD: return Val_int(777616121); /* `WORD */
    default: return Val_int(178543076); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkNaturalWrapMode */
GtkNaturalWrapMode GtkNaturalWrapMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 178543076) return GTK_NATURAL_WRAP_INHERIT; /* `INHERIT */
  else if (tag == 37469934) return GTK_NATURAL_WRAP_NONE; /* `NONE */
  else if (tag == 777616121) return GTK_NATURAL_WRAP_WORD; /* `WORD */
  else return GTK_NATURAL_WRAP_INHERIT; /* fallback to first value */
}

/* Convert GtkNotebookTab to OCaml value */
value Val_GtkNotebookTab(GtkNotebookTab val) {
  switch (val) {
    case GTK_NOTEBOOK_TAB_FIRST: return Val_int(1037544970); /* `FIRST */
    case GTK_NOTEBOOK_TAB_LAST: return Val_int(82545625); /* `LAST */
    default: return Val_int(1037544970); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkNotebookTab */
GtkNotebookTab GtkNotebookTab_val(value val) {
  int tag = Int_val(val);
  if (tag == 1037544970) return GTK_NOTEBOOK_TAB_FIRST; /* `FIRST */
  else if (tag == 82545625) return GTK_NOTEBOOK_TAB_LAST; /* `LAST */
  else return GTK_NOTEBOOK_TAB_FIRST; /* fallback to first value */
}

/* Convert GtkNumberUpLayout to OCaml value */
value Val_GtkNumberUpLayout(GtkNumberUpLayout val) {
  switch (val) {
    case GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_TOP_TO_BOTTOM: return Val_int(141132891); /* `LRTB */
    case GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_BOTTOM_TO_TOP: return Val_int(429305310); /* `LRBT */
    case GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_TOP_TO_BOTTOM: return Val_int(647195449); /* `RLTB */
    case GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_BOTTOM_TO_TOP: return Val_int(143634541); /* `RLBT */
    case GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_LEFT_TO_RIGHT: return Val_int(803249837); /* `TBLR */
    case GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_RIGHT_TO_LEFT: return Val_int(373398230); /* `TBRL */
    case GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_LEFT_TO_RIGHT: return Val_int(618441906); /* `BTLR */
    case GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_RIGHT_TO_LEFT: return Val_int(521298163); /* `BTRL */
    default: return Val_int(141132891); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkNumberUpLayout */
GtkNumberUpLayout GtkNumberUpLayout_val(value val) {
  int tag = Int_val(val);
  if (tag == 141132891) return GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_TOP_TO_BOTTOM; /* `LRTB */
  else if (tag == 429305310) return GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_BOTTOM_TO_TOP; /* `LRBT */
  else if (tag == 647195449) return GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_TOP_TO_BOTTOM; /* `RLTB */
  else if (tag == 143634541) return GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_BOTTOM_TO_TOP; /* `RLBT */
  else if (tag == 803249837) return GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_LEFT_TO_RIGHT; /* `TBLR */
  else if (tag == 373398230) return GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_RIGHT_TO_LEFT; /* `TBRL */
  else if (tag == 618441906) return GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_LEFT_TO_RIGHT; /* `BTLR */
  else if (tag == 521298163) return GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_RIGHT_TO_LEFT; /* `BTRL */
  else return GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_TOP_TO_BOTTOM; /* fallback to first value */
}

/* Convert GtkOrdering to OCaml value */
value Val_GtkOrdering(GtkOrdering val) {
  switch (val) {
    case GTK_ORDERING_SMALLER: return Val_int(812358654); /* `SMALLER */
    case GTK_ORDERING_EQUAL: return Val_int(997378661); /* `EQUAL */
    case GTK_ORDERING_LARGER: return Val_int(868880378); /* `LARGER */
    default: return Val_int(812358654); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkOrdering */
GtkOrdering GtkOrdering_val(value val) {
  int tag = Int_val(val);
  if (tag == 812358654) return GTK_ORDERING_SMALLER; /* `SMALLER */
  else if (tag == 997378661) return GTK_ORDERING_EQUAL; /* `EQUAL */
  else if (tag == 868880378) return GTK_ORDERING_LARGER; /* `LARGER */
  else return GTK_ORDERING_SMALLER; /* fallback to first value */
}

/* Convert GtkOrientation to OCaml value */
value Val_GtkOrientation(GtkOrientation val) {
  switch (val) {
    case GTK_ORIENTATION_HORIZONTAL: return Val_int(691710922); /* `HORIZONTAL */
    case GTK_ORIENTATION_VERTICAL: return Val_int(721220360); /* `VERTICAL */
    default: return Val_int(691710922); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkOrientation */
GtkOrientation GtkOrientation_val(value val) {
  int tag = Int_val(val);
  if (tag == 691710922) return GTK_ORIENTATION_HORIZONTAL; /* `HORIZONTAL */
  else if (tag == 721220360) return GTK_ORIENTATION_VERTICAL; /* `VERTICAL */
  else return GTK_ORIENTATION_HORIZONTAL; /* fallback to first value */
}

/* Convert GtkOverflow to OCaml value */
value Val_GtkOverflow(GtkOverflow val) {
  switch (val) {
    case GTK_OVERFLOW_VISIBLE: return Val_int(975881643); /* `VISIBLE */
    case GTK_OVERFLOW_HIDDEN: return Val_int(835860439); /* `HIDDEN */
    default: return Val_int(975881643); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkOverflow */
GtkOverflow GtkOverflow_val(value val) {
  int tag = Int_val(val);
  if (tag == 975881643) return GTK_OVERFLOW_VISIBLE; /* `VISIBLE */
  else if (tag == 835860439) return GTK_OVERFLOW_HIDDEN; /* `HIDDEN */
  else return GTK_OVERFLOW_VISIBLE; /* fallback to first value */
}

/* Convert GtkPackType to OCaml value */
value Val_GtkPackType(GtkPackType val) {
  switch (val) {
    case GTK_PACK_START: return Val_int(23743610); /* `START */
    case GTK_PACK_END: return Val_int(735747473); /* `END */
    default: return Val_int(23743610); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPackType */
GtkPackType GtkPackType_val(value val) {
  int tag = Int_val(val);
  if (tag == 23743610) return GTK_PACK_START; /* `START */
  else if (tag == 735747473) return GTK_PACK_END; /* `END */
  else return GTK_PACK_START; /* fallback to first value */
}

/* Convert GtkPadActionType to OCaml value */
value Val_GtkPadActionType(GtkPadActionType val) {
  switch (val) {
    case GTK_PAD_ACTION_BUTTON: return Val_int(536988399); /* `BUTTON */
    case GTK_PAD_ACTION_RING: return Val_int(696651259); /* `RING */
    case GTK_PAD_ACTION_STRIP: return Val_int(491817462); /* `STRIP */
    default: return Val_int(536988399); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPadActionType */
GtkPadActionType GtkPadActionType_val(value val) {
  int tag = Int_val(val);
  if (tag == 536988399) return GTK_PAD_ACTION_BUTTON; /* `BUTTON */
  else if (tag == 696651259) return GTK_PAD_ACTION_RING; /* `RING */
  else if (tag == 491817462) return GTK_PAD_ACTION_STRIP; /* `STRIP */
  else return GTK_PAD_ACTION_BUTTON; /* fallback to first value */
}

/* Convert GtkPageOrientation to OCaml value */
value Val_GtkPageOrientation(GtkPageOrientation val) {
  switch (val) {
    case GTK_PAGE_ORIENTATION_PORTRAIT: return Val_int(104085318); /* `PORTRAIT */
    case GTK_PAGE_ORIENTATION_LANDSCAPE: return Val_int(318748164); /* `LANDSCAPE */
    case GTK_PAGE_ORIENTATION_REVERSE_PORTRAIT: return Val_int(521497845); /* `REVERSE_PORTRAIT */
    case GTK_PAGE_ORIENTATION_REVERSE_LANDSCAPE: return Val_int(303010604); /* `REVERSE_LANDSCAPE */
    default: return Val_int(104085318); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPageOrientation */
GtkPageOrientation GtkPageOrientation_val(value val) {
  int tag = Int_val(val);
  if (tag == 104085318) return GTK_PAGE_ORIENTATION_PORTRAIT; /* `PORTRAIT */
  else if (tag == 318748164) return GTK_PAGE_ORIENTATION_LANDSCAPE; /* `LANDSCAPE */
  else if (tag == 521497845) return GTK_PAGE_ORIENTATION_REVERSE_PORTRAIT; /* `REVERSE_PORTRAIT */
  else if (tag == 303010604) return GTK_PAGE_ORIENTATION_REVERSE_LANDSCAPE; /* `REVERSE_LANDSCAPE */
  else return GTK_PAGE_ORIENTATION_PORTRAIT; /* fallback to first value */
}

/* Convert GtkPageSet to OCaml value */
value Val_GtkPageSet(GtkPageSet val) {
  switch (val) {
    case GTK_PAGE_SET_ALL: return Val_int(96450141); /* `ALL */
    case GTK_PAGE_SET_EVEN: return Val_int(762840102); /* `EVEN */
    case GTK_PAGE_SET_ODD: return Val_int(631167757); /* `ODD */
    default: return Val_int(96450141); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPageSet */
GtkPageSet GtkPageSet_val(value val) {
  int tag = Int_val(val);
  if (tag == 96450141) return GTK_PAGE_SET_ALL; /* `ALL */
  else if (tag == 762840102) return GTK_PAGE_SET_EVEN; /* `EVEN */
  else if (tag == 631167757) return GTK_PAGE_SET_ODD; /* `ODD */
  else return GTK_PAGE_SET_ALL; /* fallback to first value */
}

/* Convert GtkPanDirection to OCaml value */
value Val_GtkPanDirection(GtkPanDirection val) {
  switch (val) {
    case GTK_PAN_DIRECTION_LEFT: return Val_int(28713888); /* `LEFT */
    case GTK_PAN_DIRECTION_RIGHT: return Val_int(961111566); /* `RIGHT */
    case GTK_PAN_DIRECTION_UP: return Val_int(160130855); /* `UP */
    case GTK_PAN_DIRECTION_DOWN: return Val_int(878985997); /* `DOWN */
    default: return Val_int(28713888); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPanDirection */
GtkPanDirection GtkPanDirection_val(value val) {
  int tag = Int_val(val);
  if (tag == 28713888) return GTK_PAN_DIRECTION_LEFT; /* `LEFT */
  else if (tag == 961111566) return GTK_PAN_DIRECTION_RIGHT; /* `RIGHT */
  else if (tag == 160130855) return GTK_PAN_DIRECTION_UP; /* `UP */
  else if (tag == 878985997) return GTK_PAN_DIRECTION_DOWN; /* `DOWN */
  else return GTK_PAN_DIRECTION_LEFT; /* fallback to first value */
}

/* Convert GtkPolicyType to OCaml value */
value Val_GtkPolicyType(GtkPolicyType val) {
  switch (val) {
    case GTK_POLICY_ALWAYS: return Val_int(21963510); /* `ALWAYS */
    case GTK_POLICY_AUTOMATIC: return Val_int(162159565); /* `AUTOMATIC */
    case GTK_POLICY_NEVER: return Val_int(267988731); /* `NEVER */
    case GTK_POLICY_EXTERNAL: return Val_int(753002325); /* `EXTERNAL */
    default: return Val_int(21963510); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPolicyType */
GtkPolicyType GtkPolicyType_val(value val) {
  int tag = Int_val(val);
  if (tag == 21963510) return GTK_POLICY_ALWAYS; /* `ALWAYS */
  else if (tag == 162159565) return GTK_POLICY_AUTOMATIC; /* `AUTOMATIC */
  else if (tag == 267988731) return GTK_POLICY_NEVER; /* `NEVER */
  else if (tag == 753002325) return GTK_POLICY_EXTERNAL; /* `EXTERNAL */
  else return GTK_POLICY_ALWAYS; /* fallback to first value */
}

/* Convert GtkPositionType to OCaml value */
value Val_GtkPositionType(GtkPositionType val) {
  switch (val) {
    case GTK_POS_LEFT: return Val_int(28713888); /* `LEFT */
    case GTK_POS_RIGHT: return Val_int(961111566); /* `RIGHT */
    case GTK_POS_TOP: return Val_int(281490397); /* `TOP */
    case GTK_POS_BOTTOM: return Val_int(585108400); /* `BOTTOM */
    default: return Val_int(28713888); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPositionType */
GtkPositionType GtkPositionType_val(value val) {
  int tag = Int_val(val);
  if (tag == 28713888) return GTK_POS_LEFT; /* `LEFT */
  else if (tag == 961111566) return GTK_POS_RIGHT; /* `RIGHT */
  else if (tag == 281490397) return GTK_POS_TOP; /* `TOP */
  else if (tag == 585108400) return GTK_POS_BOTTOM; /* `BOTTOM */
  else return GTK_POS_LEFT; /* fallback to first value */
}

/* Convert GtkPrintDuplex to OCaml value */
value Val_GtkPrintDuplex(GtkPrintDuplex val) {
  switch (val) {
    case GTK_PRINT_DUPLEX_SIMPLEX: return Val_int(654609252); /* `SIMPLEX */
    case GTK_PRINT_DUPLEX_HORIZONTAL: return Val_int(691710922); /* `HORIZONTAL */
    case GTK_PRINT_DUPLEX_VERTICAL: return Val_int(721220360); /* `VERTICAL */
    default: return Val_int(654609252); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPrintDuplex */
GtkPrintDuplex GtkPrintDuplex_val(value val) {
  int tag = Int_val(val);
  if (tag == 654609252) return GTK_PRINT_DUPLEX_SIMPLEX; /* `SIMPLEX */
  else if (tag == 691710922) return GTK_PRINT_DUPLEX_HORIZONTAL; /* `HORIZONTAL */
  else if (tag == 721220360) return GTK_PRINT_DUPLEX_VERTICAL; /* `VERTICAL */
  else return GTK_PRINT_DUPLEX_SIMPLEX; /* fallback to first value */
}

/* Convert GtkPrintError to OCaml value */
value Val_GtkPrintError(GtkPrintError val) {
  switch (val) {
    case GTK_PRINT_ERROR_GENERAL: return Val_int(687201147); /* `GENERAL */
    case GTK_PRINT_ERROR_INTERNAL_ERROR: return Val_int(193188089); /* `INTERNAL_ERROR */
    case GTK_PRINT_ERROR_NOMEM: return Val_int(810241942); /* `NOMEM */
    case GTK_PRINT_ERROR_INVALID_FILE: return Val_int(661826884); /* `INVALID_FILE */
    default: return Val_int(687201147); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPrintError */
GtkPrintError GtkPrintError_val(value val) {
  int tag = Int_val(val);
  if (tag == 687201147) return GTK_PRINT_ERROR_GENERAL; /* `GENERAL */
  else if (tag == 193188089) return GTK_PRINT_ERROR_INTERNAL_ERROR; /* `INTERNAL_ERROR */
  else if (tag == 810241942) return GTK_PRINT_ERROR_NOMEM; /* `NOMEM */
  else if (tag == 661826884) return GTK_PRINT_ERROR_INVALID_FILE; /* `INVALID_FILE */
  else return GTK_PRINT_ERROR_GENERAL; /* fallback to first value */
}

/* Convert GtkPrintOperationAction to OCaml value */
value Val_GtkPrintOperationAction(GtkPrintOperationAction val) {
  switch (val) {
    case GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG: return Val_int(6879993); /* `PRINT_DIALOG */
    case GTK_PRINT_OPERATION_ACTION_PRINT: return Val_int(474918946); /* `PRINT */
    case GTK_PRINT_OPERATION_ACTION_PREVIEW: return Val_int(630775797); /* `PREVIEW */
    case GTK_PRINT_OPERATION_ACTION_EXPORT: return Val_int(72232104); /* `EXPORT */
    default: return Val_int(6879993); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPrintOperationAction */
GtkPrintOperationAction GtkPrintOperationAction_val(value val) {
  int tag = Int_val(val);
  if (tag == 6879993) return GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG; /* `PRINT_DIALOG */
  else if (tag == 474918946) return GTK_PRINT_OPERATION_ACTION_PRINT; /* `PRINT */
  else if (tag == 630775797) return GTK_PRINT_OPERATION_ACTION_PREVIEW; /* `PREVIEW */
  else if (tag == 72232104) return GTK_PRINT_OPERATION_ACTION_EXPORT; /* `EXPORT */
  else return GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG; /* fallback to first value */
}

/* Convert GtkPrintOperationResult to OCaml value */
value Val_GtkPrintOperationResult(GtkPrintOperationResult val) {
  switch (val) {
    case GTK_PRINT_OPERATION_RESULT_ERROR: return Val_int(1064539868); /* `ERROR */
    case GTK_PRINT_OPERATION_RESULT_APPLY: return Val_int(1008837130); /* `APPLY */
    case GTK_PRINT_OPERATION_RESULT_CANCEL: return Val_int(809667861); /* `CANCEL */
    case GTK_PRINT_OPERATION_RESULT_IN_PROGRESS: return Val_int(581965257); /* `IN_PROGRESS */
    default: return Val_int(1064539868); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPrintOperationResult */
GtkPrintOperationResult GtkPrintOperationResult_val(value val) {
  int tag = Int_val(val);
  if (tag == 1064539868) return GTK_PRINT_OPERATION_RESULT_ERROR; /* `ERROR */
  else if (tag == 1008837130) return GTK_PRINT_OPERATION_RESULT_APPLY; /* `APPLY */
  else if (tag == 809667861) return GTK_PRINT_OPERATION_RESULT_CANCEL; /* `CANCEL */
  else if (tag == 581965257) return GTK_PRINT_OPERATION_RESULT_IN_PROGRESS; /* `IN_PROGRESS */
  else return GTK_PRINT_OPERATION_RESULT_ERROR; /* fallback to first value */
}

/* Convert GtkPrintPages to OCaml value */
value Val_GtkPrintPages(GtkPrintPages val) {
  switch (val) {
    case GTK_PRINT_PAGES_ALL: return Val_int(96450141); /* `ALL */
    case GTK_PRINT_PAGES_CURRENT: return Val_int(463469311); /* `CURRENT */
    case GTK_PRINT_PAGES_RANGES: return Val_int(139286057); /* `RANGES */
    case GTK_PRINT_PAGES_SELECTION: return Val_int(472521137); /* `SELECTION */
    default: return Val_int(96450141); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPrintPages */
GtkPrintPages GtkPrintPages_val(value val) {
  int tag = Int_val(val);
  if (tag == 96450141) return GTK_PRINT_PAGES_ALL; /* `ALL */
  else if (tag == 463469311) return GTK_PRINT_PAGES_CURRENT; /* `CURRENT */
  else if (tag == 139286057) return GTK_PRINT_PAGES_RANGES; /* `RANGES */
  else if (tag == 472521137) return GTK_PRINT_PAGES_SELECTION; /* `SELECTION */
  else return GTK_PRINT_PAGES_ALL; /* fallback to first value */
}

/* Convert GtkPrintQuality to OCaml value */
value Val_GtkPrintQuality(GtkPrintQuality val) {
  switch (val) {
    case GTK_PRINT_QUALITY_LOW: return Val_int(1031179617); /* `LOW */
    case GTK_PRINT_QUALITY_NORMAL: return Val_int(888717969); /* `NORMAL */
    case GTK_PRINT_QUALITY_HIGH: return Val_int(418746517); /* `HIGH */
    case GTK_PRINT_QUALITY_DRAFT: return Val_int(561222414); /* `DRAFT */
    default: return Val_int(1031179617); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPrintQuality */
GtkPrintQuality GtkPrintQuality_val(value val) {
  int tag = Int_val(val);
  if (tag == 1031179617) return GTK_PRINT_QUALITY_LOW; /* `LOW */
  else if (tag == 888717969) return GTK_PRINT_QUALITY_NORMAL; /* `NORMAL */
  else if (tag == 418746517) return GTK_PRINT_QUALITY_HIGH; /* `HIGH */
  else if (tag == 561222414) return GTK_PRINT_QUALITY_DRAFT; /* `DRAFT */
  else return GTK_PRINT_QUALITY_LOW; /* fallback to first value */
}

/* Convert GtkPrintStatus to OCaml value */
value Val_GtkPrintStatus(GtkPrintStatus val) {
  switch (val) {
    case GTK_PRINT_STATUS_INITIAL: return Val_int(884385228); /* `INITIAL */
    case GTK_PRINT_STATUS_PREPARING: return Val_int(1063147796); /* `PREPARING */
    case GTK_PRINT_STATUS_GENERATING_DATA: return Val_int(234114575); /* `GENERATING_DATA */
    case GTK_PRINT_STATUS_SENDING_DATA: return Val_int(935472944); /* `SENDING_DATA */
    case GTK_PRINT_STATUS_PENDING: return Val_int(861083968); /* `PENDING */
    case GTK_PRINT_STATUS_PENDING_ISSUE: return Val_int(987728438); /* `PENDING_ISSUE */
    case GTK_PRINT_STATUS_PRINTING: return Val_int(510965512); /* `PRINTING */
    case GTK_PRINT_STATUS_FINISHED: return Val_int(3585446); /* `FINISHED */
    case GTK_PRINT_STATUS_FINISHED_ABORTED: return Val_int(246635882); /* `FINISHED_ABORTED */
    default: return Val_int(884385228); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPrintStatus */
GtkPrintStatus GtkPrintStatus_val(value val) {
  int tag = Int_val(val);
  if (tag == 884385228) return GTK_PRINT_STATUS_INITIAL; /* `INITIAL */
  else if (tag == 1063147796) return GTK_PRINT_STATUS_PREPARING; /* `PREPARING */
  else if (tag == 234114575) return GTK_PRINT_STATUS_GENERATING_DATA; /* `GENERATING_DATA */
  else if (tag == 935472944) return GTK_PRINT_STATUS_SENDING_DATA; /* `SENDING_DATA */
  else if (tag == 861083968) return GTK_PRINT_STATUS_PENDING; /* `PENDING */
  else if (tag == 987728438) return GTK_PRINT_STATUS_PENDING_ISSUE; /* `PENDING_ISSUE */
  else if (tag == 510965512) return GTK_PRINT_STATUS_PRINTING; /* `PRINTING */
  else if (tag == 3585446) return GTK_PRINT_STATUS_FINISHED; /* `FINISHED */
  else if (tag == 246635882) return GTK_PRINT_STATUS_FINISHED_ABORTED; /* `FINISHED_ABORTED */
  else return GTK_PRINT_STATUS_INITIAL; /* fallback to first value */
}

/* Convert GtkPropagationLimit to OCaml value */
value Val_GtkPropagationLimit(GtkPropagationLimit val) {
  switch (val) {
    case GTK_LIMIT_NONE: return Val_int(37469934); /* `NONE */
    case GTK_LIMIT_SAME_NATIVE: return Val_int(14915700); /* `SAME_NATIVE */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPropagationLimit */
GtkPropagationLimit GtkPropagationLimit_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_LIMIT_NONE; /* `NONE */
  else if (tag == 14915700) return GTK_LIMIT_SAME_NATIVE; /* `SAME_NATIVE */
  else return GTK_LIMIT_NONE; /* fallback to first value */
}

/* Convert GtkPropagationPhase to OCaml value */
value Val_GtkPropagationPhase(GtkPropagationPhase val) {
  switch (val) {
    case GTK_PHASE_NONE: return Val_int(37469934); /* `NONE */
    case GTK_PHASE_CAPTURE: return Val_int(928956893); /* `CAPTURE */
    case GTK_PHASE_BUBBLE: return Val_int(477126522); /* `BUBBLE */
    case GTK_PHASE_TARGET: return Val_int(780720412); /* `TARGET */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPropagationPhase */
GtkPropagationPhase GtkPropagationPhase_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_PHASE_NONE; /* `NONE */
  else if (tag == 928956893) return GTK_PHASE_CAPTURE; /* `CAPTURE */
  else if (tag == 477126522) return GTK_PHASE_BUBBLE; /* `BUBBLE */
  else if (tag == 780720412) return GTK_PHASE_TARGET; /* `TARGET */
  else return GTK_PHASE_NONE; /* fallback to first value */
}

/* Convert GtkRecentManagerError to OCaml value */
value Val_GtkRecentManagerError(GtkRecentManagerError val) {
  switch (val) {
    case GTK_RECENT_MANAGER_ERROR_NOT_FOUND: return Val_int(420710559); /* `NOT_FOUND */
    case GTK_RECENT_MANAGER_ERROR_INVALID_URI: return Val_int(899860309); /* `INVALID_URI */
    case GTK_RECENT_MANAGER_ERROR_INVALID_ENCODING: return Val_int(350674057); /* `INVALID_ENCODING */
    case GTK_RECENT_MANAGER_ERROR_NOT_REGISTERED: return Val_int(523215897); /* `NOT_REGISTERED */
    case GTK_RECENT_MANAGER_ERROR_READ: return Val_int(841826074); /* `READ */
    case GTK_RECENT_MANAGER_ERROR_WRITE: return Val_int(255473302); /* `WRITE */
    case GTK_RECENT_MANAGER_ERROR_UNKNOWN: return Val_int(140725159); /* `UNKNOWN */
    default: return Val_int(420710559); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkRecentManagerError */
GtkRecentManagerError GtkRecentManagerError_val(value val) {
  int tag = Int_val(val);
  if (tag == 420710559) return GTK_RECENT_MANAGER_ERROR_NOT_FOUND; /* `NOT_FOUND */
  else if (tag == 899860309) return GTK_RECENT_MANAGER_ERROR_INVALID_URI; /* `INVALID_URI */
  else if (tag == 350674057) return GTK_RECENT_MANAGER_ERROR_INVALID_ENCODING; /* `INVALID_ENCODING */
  else if (tag == 523215897) return GTK_RECENT_MANAGER_ERROR_NOT_REGISTERED; /* `NOT_REGISTERED */
  else if (tag == 841826074) return GTK_RECENT_MANAGER_ERROR_READ; /* `READ */
  else if (tag == 255473302) return GTK_RECENT_MANAGER_ERROR_WRITE; /* `WRITE */
  else if (tag == 140725159) return GTK_RECENT_MANAGER_ERROR_UNKNOWN; /* `UNKNOWN */
  else return GTK_RECENT_MANAGER_ERROR_NOT_FOUND; /* fallback to first value */
}

/* Convert GtkResponseType to OCaml value */
value Val_GtkResponseType(GtkResponseType val) {
  switch (val) {
    case GTK_RESPONSE_NONE: return Val_int(37469934); /* `NONE */
    case GTK_RESPONSE_REJECT: return Val_int(404865596); /* `REJECT */
    case GTK_RESPONSE_ACCEPT: return Val_int(675319165); /* `ACCEPT */
    case GTK_RESPONSE_DELETE_EVENT: return Val_int(122266486); /* `DELETE_EVENT */
    case GTK_RESPONSE_OK: return Val_int(453997984); /* `OK */
    case GTK_RESPONSE_CANCEL: return Val_int(809667861); /* `CANCEL */
    case GTK_RESPONSE_CLOSE: return Val_int(518650144); /* `CLOSE */
    case GTK_RESPONSE_YES: return Val_int(779609024); /* `YES */
    case GTK_RESPONSE_NO: return Val_int(36581335); /* `NO */
    case GTK_RESPONSE_APPLY: return Val_int(1008837130); /* `APPLY */
    case GTK_RESPONSE_HELP: return Val_int(530246342); /* `HELP */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkResponseType */
GtkResponseType GtkResponseType_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_RESPONSE_NONE; /* `NONE */
  else if (tag == 404865596) return GTK_RESPONSE_REJECT; /* `REJECT */
  else if (tag == 675319165) return GTK_RESPONSE_ACCEPT; /* `ACCEPT */
  else if (tag == 122266486) return GTK_RESPONSE_DELETE_EVENT; /* `DELETE_EVENT */
  else if (tag == 453997984) return GTK_RESPONSE_OK; /* `OK */
  else if (tag == 809667861) return GTK_RESPONSE_CANCEL; /* `CANCEL */
  else if (tag == 518650144) return GTK_RESPONSE_CLOSE; /* `CLOSE */
  else if (tag == 779609024) return GTK_RESPONSE_YES; /* `YES */
  else if (tag == 36581335) return GTK_RESPONSE_NO; /* `NO */
  else if (tag == 1008837130) return GTK_RESPONSE_APPLY; /* `APPLY */
  else if (tag == 530246342) return GTK_RESPONSE_HELP; /* `HELP */
  else return GTK_RESPONSE_NONE; /* fallback to first value */
}

/* Convert GtkRevealerTransitionType to OCaml value */
value Val_GtkRevealerTransitionType(GtkRevealerTransitionType val) {
  switch (val) {
    case GTK_REVEALER_TRANSITION_TYPE_NONE: return Val_int(37469934); /* `NONE */
    case GTK_REVEALER_TRANSITION_TYPE_CROSSFADE: return Val_int(53473499); /* `CROSSFADE */
    case GTK_REVEALER_TRANSITION_TYPE_SLIDE_RIGHT: return Val_int(555513390); /* `SLIDE_RIGHT */
    case GTK_REVEALER_TRANSITION_TYPE_SLIDE_LEFT: return Val_int(258644160); /* `SLIDE_LEFT */
    case GTK_REVEALER_TRANSITION_TYPE_SLIDE_UP: return Val_int(196330409); /* `SLIDE_UP */
    case GTK_REVEALER_TRANSITION_TYPE_SLIDE_DOWN: return Val_int(613934471); /* `SLIDE_DOWN */
    case GTK_REVEALER_TRANSITION_TYPE_SWING_RIGHT: return Val_int(89543304); /* `SWING_RIGHT */
    case GTK_REVEALER_TRANSITION_TYPE_SWING_LEFT: return Val_int(153725606); /* `SWING_LEFT */
    case GTK_REVEALER_TRANSITION_TYPE_SWING_UP: return Val_int(783055415); /* `SWING_UP */
    case GTK_REVEALER_TRANSITION_TYPE_SWING_DOWN: return Val_int(865984518); /* `SWING_DOWN */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkRevealerTransitionType */
GtkRevealerTransitionType GtkRevealerTransitionType_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_REVEALER_TRANSITION_TYPE_NONE; /* `NONE */
  else if (tag == 53473499) return GTK_REVEALER_TRANSITION_TYPE_CROSSFADE; /* `CROSSFADE */
  else if (tag == 555513390) return GTK_REVEALER_TRANSITION_TYPE_SLIDE_RIGHT; /* `SLIDE_RIGHT */
  else if (tag == 258644160) return GTK_REVEALER_TRANSITION_TYPE_SLIDE_LEFT; /* `SLIDE_LEFT */
  else if (tag == 196330409) return GTK_REVEALER_TRANSITION_TYPE_SLIDE_UP; /* `SLIDE_UP */
  else if (tag == 613934471) return GTK_REVEALER_TRANSITION_TYPE_SLIDE_DOWN; /* `SLIDE_DOWN */
  else if (tag == 89543304) return GTK_REVEALER_TRANSITION_TYPE_SWING_RIGHT; /* `SWING_RIGHT */
  else if (tag == 153725606) return GTK_REVEALER_TRANSITION_TYPE_SWING_LEFT; /* `SWING_LEFT */
  else if (tag == 783055415) return GTK_REVEALER_TRANSITION_TYPE_SWING_UP; /* `SWING_UP */
  else if (tag == 865984518) return GTK_REVEALER_TRANSITION_TYPE_SWING_DOWN; /* `SWING_DOWN */
  else return GTK_REVEALER_TRANSITION_TYPE_NONE; /* fallback to first value */
}

/* Convert GtkScrollStep to OCaml value */
value Val_GtkScrollStep(GtkScrollStep val) {
  switch (val) {
    case GTK_SCROLL_STEPS: return Val_int(376198200); /* `STEPS */
    case GTK_SCROLL_PAGES: return Val_int(577252077); /* `PAGES */
    case GTK_SCROLL_ENDS: return Val_int(511964072); /* `ENDS */
    case GTK_SCROLL_HORIZONTAL_STEPS: return Val_int(62617039); /* `HORIZONTAL_STEPS */
    case GTK_SCROLL_HORIZONTAL_PAGES: return Val_int(691824062); /* `HORIZONTAL_PAGES */
    case GTK_SCROLL_HORIZONTAL_ENDS: return Val_int(200174926); /* `HORIZONTAL_ENDS */
    default: return Val_int(376198200); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkScrollStep */
GtkScrollStep GtkScrollStep_val(value val) {
  int tag = Int_val(val);
  if (tag == 376198200) return GTK_SCROLL_STEPS; /* `STEPS */
  else if (tag == 577252077) return GTK_SCROLL_PAGES; /* `PAGES */
  else if (tag == 511964072) return GTK_SCROLL_ENDS; /* `ENDS */
  else if (tag == 62617039) return GTK_SCROLL_HORIZONTAL_STEPS; /* `HORIZONTAL_STEPS */
  else if (tag == 691824062) return GTK_SCROLL_HORIZONTAL_PAGES; /* `HORIZONTAL_PAGES */
  else if (tag == 200174926) return GTK_SCROLL_HORIZONTAL_ENDS; /* `HORIZONTAL_ENDS */
  else return GTK_SCROLL_STEPS; /* fallback to first value */
}

/* Convert GtkScrollType to OCaml value */
value Val_GtkScrollType(GtkScrollType val) {
  switch (val) {
    case GTK_SCROLL_NONE: return Val_int(37469934); /* `NONE */
    case GTK_SCROLL_JUMP: return Val_int(316494588); /* `JUMP */
    case GTK_SCROLL_STEP_BACKWARD: return Val_int(893450588); /* `STEP_BACKWARD */
    case GTK_SCROLL_STEP_FORWARD: return Val_int(428781258); /* `STEP_FORWARD */
    case GTK_SCROLL_PAGE_BACKWARD: return Val_int(228922162); /* `PAGE_BACKWARD */
    case GTK_SCROLL_PAGE_FORWARD: return Val_int(581293774); /* `PAGE_FORWARD */
    case GTK_SCROLL_STEP_UP: return Val_int(102460343); /* `STEP_UP */
    case GTK_SCROLL_STEP_DOWN: return Val_int(97688373); /* `STEP_DOWN */
    case GTK_SCROLL_PAGE_UP: return Val_int(40311632); /* `PAGE_UP */
    case GTK_SCROLL_PAGE_DOWN: return Val_int(865949998); /* `PAGE_DOWN */
    case GTK_SCROLL_STEP_LEFT: return Val_int(446322310); /* `STEP_LEFT */
    case GTK_SCROLL_STEP_RIGHT: return Val_int(867377049); /* `STEP_RIGHT */
    case GTK_SCROLL_PAGE_LEFT: return Val_int(163620576); /* `PAGE_LEFT */
    case GTK_SCROLL_PAGE_RIGHT: return Val_int(946127041); /* `PAGE_RIGHT */
    case GTK_SCROLL_START: return Val_int(23743610); /* `START */
    case GTK_SCROLL_END: return Val_int(735747473); /* `END */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkScrollType */
GtkScrollType GtkScrollType_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_SCROLL_NONE; /* `NONE */
  else if (tag == 316494588) return GTK_SCROLL_JUMP; /* `JUMP */
  else if (tag == 893450588) return GTK_SCROLL_STEP_BACKWARD; /* `STEP_BACKWARD */
  else if (tag == 428781258) return GTK_SCROLL_STEP_FORWARD; /* `STEP_FORWARD */
  else if (tag == 228922162) return GTK_SCROLL_PAGE_BACKWARD; /* `PAGE_BACKWARD */
  else if (tag == 581293774) return GTK_SCROLL_PAGE_FORWARD; /* `PAGE_FORWARD */
  else if (tag == 102460343) return GTK_SCROLL_STEP_UP; /* `STEP_UP */
  else if (tag == 97688373) return GTK_SCROLL_STEP_DOWN; /* `STEP_DOWN */
  else if (tag == 40311632) return GTK_SCROLL_PAGE_UP; /* `PAGE_UP */
  else if (tag == 865949998) return GTK_SCROLL_PAGE_DOWN; /* `PAGE_DOWN */
  else if (tag == 446322310) return GTK_SCROLL_STEP_LEFT; /* `STEP_LEFT */
  else if (tag == 867377049) return GTK_SCROLL_STEP_RIGHT; /* `STEP_RIGHT */
  else if (tag == 163620576) return GTK_SCROLL_PAGE_LEFT; /* `PAGE_LEFT */
  else if (tag == 946127041) return GTK_SCROLL_PAGE_RIGHT; /* `PAGE_RIGHT */
  else if (tag == 23743610) return GTK_SCROLL_START; /* `START */
  else if (tag == 735747473) return GTK_SCROLL_END; /* `END */
  else return GTK_SCROLL_NONE; /* fallback to first value */
}

/* Convert GtkScrollablePolicy to OCaml value */
value Val_GtkScrollablePolicy(GtkScrollablePolicy val) {
  switch (val) {
    case GTK_SCROLL_MINIMUM: return Val_int(409346596); /* `MINIMUM */
    case GTK_SCROLL_NATURAL: return Val_int(934000437); /* `NATURAL */
    default: return Val_int(409346596); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkScrollablePolicy */
GtkScrollablePolicy GtkScrollablePolicy_val(value val) {
  int tag = Int_val(val);
  if (tag == 409346596) return GTK_SCROLL_MINIMUM; /* `MINIMUM */
  else if (tag == 934000437) return GTK_SCROLL_NATURAL; /* `NATURAL */
  else return GTK_SCROLL_MINIMUM; /* fallback to first value */
}

/* Convert GtkSelectionMode to OCaml value */
value Val_GtkSelectionMode(GtkSelectionMode val) {
  switch (val) {
    case GTK_SELECTION_NONE: return Val_int(37469934); /* `NONE */
    case GTK_SELECTION_SINGLE: return Val_int(155377302); /* `SINGLE */
    case GTK_SELECTION_BROWSE: return Val_int(552799969); /* `BROWSE */
    case GTK_SELECTION_MULTIPLE: return Val_int(832841979); /* `MULTIPLE */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSelectionMode */
GtkSelectionMode GtkSelectionMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_SELECTION_NONE; /* `NONE */
  else if (tag == 155377302) return GTK_SELECTION_SINGLE; /* `SINGLE */
  else if (tag == 552799969) return GTK_SELECTION_BROWSE; /* `BROWSE */
  else if (tag == 832841979) return GTK_SELECTION_MULTIPLE; /* `MULTIPLE */
  else return GTK_SELECTION_NONE; /* fallback to first value */
}

/* Convert GtkSensitivityType to OCaml value */
value Val_GtkSensitivityType(GtkSensitivityType val) {
  switch (val) {
    case GTK_SENSITIVITY_AUTO: return Val_int(736658275); /* `AUTO */
    case GTK_SENSITIVITY_ON: return Val_int(358689837); /* `ON */
    case GTK_SENSITIVITY_OFF: return Val_int(1012881152); /* `OFF */
    default: return Val_int(736658275); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSensitivityType */
GtkSensitivityType GtkSensitivityType_val(value val) {
  int tag = Int_val(val);
  if (tag == 736658275) return GTK_SENSITIVITY_AUTO; /* `AUTO */
  else if (tag == 358689837) return GTK_SENSITIVITY_ON; /* `ON */
  else if (tag == 1012881152) return GTK_SENSITIVITY_OFF; /* `OFF */
  else return GTK_SENSITIVITY_AUTO; /* fallback to first value */
}

/* Convert GtkShortcutScope to OCaml value */
value Val_GtkShortcutScope(GtkShortcutScope val) {
  switch (val) {
    case GTK_SHORTCUT_SCOPE_LOCAL: return Val_int(472786094); /* `LOCAL */
    case GTK_SHORTCUT_SCOPE_MANAGED: return Val_int(825938836); /* `MANAGED */
    case GTK_SHORTCUT_SCOPE_GLOBAL: return Val_int(855540574); /* `GLOBAL */
    default: return Val_int(472786094); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkShortcutScope */
GtkShortcutScope GtkShortcutScope_val(value val) {
  int tag = Int_val(val);
  if (tag == 472786094) return GTK_SHORTCUT_SCOPE_LOCAL; /* `LOCAL */
  else if (tag == 825938836) return GTK_SHORTCUT_SCOPE_MANAGED; /* `MANAGED */
  else if (tag == 855540574) return GTK_SHORTCUT_SCOPE_GLOBAL; /* `GLOBAL */
  else return GTK_SHORTCUT_SCOPE_LOCAL; /* fallback to first value */
}

/* Convert GtkShortcutType to OCaml value */
value Val_GtkShortcutType(GtkShortcutType val) {
  switch (val) {
    case GTK_SHORTCUT_ACCELERATOR: return Val_int(753791409); /* `ACCELERATOR */
    case GTK_SHORTCUT_GESTURE_PINCH: return Val_int(881161433); /* `GESTURE_PINCH */
    case GTK_SHORTCUT_GESTURE_STRETCH: return Val_int(750102179); /* `GESTURE_STRETCH */
    case GTK_SHORTCUT_GESTURE_ROTATE_CLOCKWISE: return Val_int(979252607); /* `GESTURE_ROTATE_CLOCKWISE */
    case GTK_SHORTCUT_GESTURE_ROTATE_COUNTERCLOCKWISE: return Val_int(832250388); /* `GESTURE_ROTATE_COUNTERCLOCKWISE */
    case GTK_SHORTCUT_GESTURE_TWO_FINGER_SWIPE_LEFT: return Val_int(67947912); /* `GESTURE_TWO_FINGER_SWIPE_LEFT */
    case GTK_SHORTCUT_GESTURE_TWO_FINGER_SWIPE_RIGHT: return Val_int(930608050); /* `GESTURE_TWO_FINGER_SWIPE_RIGHT */
    case GTK_SHORTCUT_GESTURE: return Val_int(334958500); /* `GESTURE */
    case GTK_SHORTCUT_GESTURE_SWIPE_LEFT: return Val_int(662763316); /* `GESTURE_SWIPE_LEFT */
    case GTK_SHORTCUT_GESTURE_SWIPE_RIGHT: return Val_int(310210217); /* `GESTURE_SWIPE_RIGHT */
    default: return Val_int(753791409); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkShortcutType */
GtkShortcutType GtkShortcutType_val(value val) {
  int tag = Int_val(val);
  if (tag == 753791409) return GTK_SHORTCUT_ACCELERATOR; /* `ACCELERATOR */
  else if (tag == 881161433) return GTK_SHORTCUT_GESTURE_PINCH; /* `GESTURE_PINCH */
  else if (tag == 750102179) return GTK_SHORTCUT_GESTURE_STRETCH; /* `GESTURE_STRETCH */
  else if (tag == 979252607) return GTK_SHORTCUT_GESTURE_ROTATE_CLOCKWISE; /* `GESTURE_ROTATE_CLOCKWISE */
  else if (tag == 832250388) return GTK_SHORTCUT_GESTURE_ROTATE_COUNTERCLOCKWISE; /* `GESTURE_ROTATE_COUNTERCLOCKWISE */
  else if (tag == 67947912) return GTK_SHORTCUT_GESTURE_TWO_FINGER_SWIPE_LEFT; /* `GESTURE_TWO_FINGER_SWIPE_LEFT */
  else if (tag == 930608050) return GTK_SHORTCUT_GESTURE_TWO_FINGER_SWIPE_RIGHT; /* `GESTURE_TWO_FINGER_SWIPE_RIGHT */
  else if (tag == 334958500) return GTK_SHORTCUT_GESTURE; /* `GESTURE */
  else if (tag == 662763316) return GTK_SHORTCUT_GESTURE_SWIPE_LEFT; /* `GESTURE_SWIPE_LEFT */
  else if (tag == 310210217) return GTK_SHORTCUT_GESTURE_SWIPE_RIGHT; /* `GESTURE_SWIPE_RIGHT */
  else return GTK_SHORTCUT_ACCELERATOR; /* fallback to first value */
}

/* Convert GtkSizeGroupMode to OCaml value */
value Val_GtkSizeGroupMode(GtkSizeGroupMode val) {
  switch (val) {
    case GTK_SIZE_GROUP_NONE: return Val_int(37469934); /* `NONE */
    case GTK_SIZE_GROUP_HORIZONTAL: return Val_int(691710922); /* `HORIZONTAL */
    case GTK_SIZE_GROUP_VERTICAL: return Val_int(721220360); /* `VERTICAL */
    case GTK_SIZE_GROUP_BOTH: return Val_int(85085456); /* `BOTH */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSizeGroupMode */
GtkSizeGroupMode GtkSizeGroupMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_SIZE_GROUP_NONE; /* `NONE */
  else if (tag == 691710922) return GTK_SIZE_GROUP_HORIZONTAL; /* `HORIZONTAL */
  else if (tag == 721220360) return GTK_SIZE_GROUP_VERTICAL; /* `VERTICAL */
  else if (tag == 85085456) return GTK_SIZE_GROUP_BOTH; /* `BOTH */
  else return GTK_SIZE_GROUP_NONE; /* fallback to first value */
}

/* Convert GtkSizeRequestMode to OCaml value */
value Val_GtkSizeRequestMode(GtkSizeRequestMode val) {
  switch (val) {
    case GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH: return Val_int(141946488); /* `HEIGHT_FOR_WIDTH */
    case GTK_SIZE_REQUEST_WIDTH_FOR_HEIGHT: return Val_int(751195212); /* `WIDTH_FOR_HEIGHT */
    case GTK_SIZE_REQUEST_CONSTANT_SIZE: return Val_int(160571541); /* `CONSTANT_SIZE */
    default: return Val_int(141946488); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSizeRequestMode */
GtkSizeRequestMode GtkSizeRequestMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 141946488) return GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH; /* `HEIGHT_FOR_WIDTH */
  else if (tag == 751195212) return GTK_SIZE_REQUEST_WIDTH_FOR_HEIGHT; /* `WIDTH_FOR_HEIGHT */
  else if (tag == 160571541) return GTK_SIZE_REQUEST_CONSTANT_SIZE; /* `CONSTANT_SIZE */
  else return GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH; /* fallback to first value */
}

/* Convert GtkSortType to OCaml value */
value Val_GtkSortType(GtkSortType val) {
  switch (val) {
    case GTK_SORT_ASCENDING: return Val_int(659141842); /* `ASCENDING */
    case GTK_SORT_DESCENDING: return Val_int(739271559); /* `DESCENDING */
    default: return Val_int(659141842); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSortType */
GtkSortType GtkSortType_val(value val) {
  int tag = Int_val(val);
  if (tag == 659141842) return GTK_SORT_ASCENDING; /* `ASCENDING */
  else if (tag == 739271559) return GTK_SORT_DESCENDING; /* `DESCENDING */
  else return GTK_SORT_ASCENDING; /* fallback to first value */
}

/* Convert GtkSorterChange to OCaml value */
value Val_GtkSorterChange(GtkSorterChange val) {
  switch (val) {
    case GTK_SORTER_CHANGE_DIFFERENT: return Val_int(163830453); /* `DIFFERENT */
    case GTK_SORTER_CHANGE_INVERTED: return Val_int(878663356); /* `INVERTED */
    case GTK_SORTER_CHANGE_LESS_STRICT: return Val_int(620736805); /* `LESS_STRICT */
    case GTK_SORTER_CHANGE_MORE_STRICT: return Val_int(429188853); /* `MORE_STRICT */
    default: return Val_int(163830453); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSorterChange */
GtkSorterChange GtkSorterChange_val(value val) {
  int tag = Int_val(val);
  if (tag == 163830453) return GTK_SORTER_CHANGE_DIFFERENT; /* `DIFFERENT */
  else if (tag == 878663356) return GTK_SORTER_CHANGE_INVERTED; /* `INVERTED */
  else if (tag == 620736805) return GTK_SORTER_CHANGE_LESS_STRICT; /* `LESS_STRICT */
  else if (tag == 429188853) return GTK_SORTER_CHANGE_MORE_STRICT; /* `MORE_STRICT */
  else return GTK_SORTER_CHANGE_DIFFERENT; /* fallback to first value */
}

/* Convert GtkSorterOrder to OCaml value */
value Val_GtkSorterOrder(GtkSorterOrder val) {
  switch (val) {
    case GTK_SORTER_ORDER_PARTIAL: return Val_int(543851302); /* `PARTIAL */
    case GTK_SORTER_ORDER_NONE: return Val_int(37469934); /* `NONE */
    case GTK_SORTER_ORDER_TOTAL: return Val_int(927925646); /* `TOTAL */
    default: return Val_int(543851302); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSorterOrder */
GtkSorterOrder GtkSorterOrder_val(value val) {
  int tag = Int_val(val);
  if (tag == 543851302) return GTK_SORTER_ORDER_PARTIAL; /* `PARTIAL */
  else if (tag == 37469934) return GTK_SORTER_ORDER_NONE; /* `NONE */
  else if (tag == 927925646) return GTK_SORTER_ORDER_TOTAL; /* `TOTAL */
  else return GTK_SORTER_ORDER_PARTIAL; /* fallback to first value */
}

/* Convert GtkSpinButtonUpdatePolicy to OCaml value */
value Val_GtkSpinButtonUpdatePolicy(GtkSpinButtonUpdatePolicy val) {
  switch (val) {
    case GTK_UPDATE_ALWAYS: return Val_int(21963510); /* `ALWAYS */
    case GTK_UPDATE_IF_VALID: return Val_int(1048476729); /* `IF_VALID */
    default: return Val_int(21963510); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSpinButtonUpdatePolicy */
GtkSpinButtonUpdatePolicy GtkSpinButtonUpdatePolicy_val(value val) {
  int tag = Int_val(val);
  if (tag == 21963510) return GTK_UPDATE_ALWAYS; /* `ALWAYS */
  else if (tag == 1048476729) return GTK_UPDATE_IF_VALID; /* `IF_VALID */
  else return GTK_UPDATE_ALWAYS; /* fallback to first value */
}

/* Convert GtkSpinType to OCaml value */
value Val_GtkSpinType(GtkSpinType val) {
  switch (val) {
    case GTK_SPIN_STEP_FORWARD: return Val_int(428781258); /* `STEP_FORWARD */
    case GTK_SPIN_STEP_BACKWARD: return Val_int(893450588); /* `STEP_BACKWARD */
    case GTK_SPIN_PAGE_FORWARD: return Val_int(581293774); /* `PAGE_FORWARD */
    case GTK_SPIN_PAGE_BACKWARD: return Val_int(228922162); /* `PAGE_BACKWARD */
    case GTK_SPIN_HOME: return Val_int(530406630); /* `HOME */
    case GTK_SPIN_END: return Val_int(735747473); /* `END */
    case GTK_SPIN_USER_DEFINED: return Val_int(108981112); /* `USER_DEFINED */
    default: return Val_int(428781258); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSpinType */
GtkSpinType GtkSpinType_val(value val) {
  int tag = Int_val(val);
  if (tag == 428781258) return GTK_SPIN_STEP_FORWARD; /* `STEP_FORWARD */
  else if (tag == 893450588) return GTK_SPIN_STEP_BACKWARD; /* `STEP_BACKWARD */
  else if (tag == 581293774) return GTK_SPIN_PAGE_FORWARD; /* `PAGE_FORWARD */
  else if (tag == 228922162) return GTK_SPIN_PAGE_BACKWARD; /* `PAGE_BACKWARD */
  else if (tag == 530406630) return GTK_SPIN_HOME; /* `HOME */
  else if (tag == 735747473) return GTK_SPIN_END; /* `END */
  else if (tag == 108981112) return GTK_SPIN_USER_DEFINED; /* `USER_DEFINED */
  else return GTK_SPIN_STEP_FORWARD; /* fallback to first value */
}

/* Convert GtkStackTransitionType to OCaml value */
value Val_GtkStackTransitionType(GtkStackTransitionType val) {
  switch (val) {
    case GTK_STACK_TRANSITION_TYPE_NONE: return Val_int(37469934); /* `NONE */
    case GTK_STACK_TRANSITION_TYPE_CROSSFADE: return Val_int(53473499); /* `CROSSFADE */
    case GTK_STACK_TRANSITION_TYPE_SLIDE_RIGHT: return Val_int(555513390); /* `SLIDE_RIGHT */
    case GTK_STACK_TRANSITION_TYPE_SLIDE_LEFT: return Val_int(258644160); /* `SLIDE_LEFT */
    case GTK_STACK_TRANSITION_TYPE_SLIDE_UP: return Val_int(196330409); /* `SLIDE_UP */
    case GTK_STACK_TRANSITION_TYPE_SLIDE_DOWN: return Val_int(613934471); /* `SLIDE_DOWN */
    case GTK_STACK_TRANSITION_TYPE_SLIDE_LEFT_RIGHT: return Val_int(517166315); /* `SLIDE_LEFT_RIGHT */
    case GTK_STACK_TRANSITION_TYPE_SLIDE_UP_DOWN: return Val_int(302784890); /* `SLIDE_UP_DOWN */
    case GTK_STACK_TRANSITION_TYPE_OVER_UP: return Val_int(54458930); /* `OVER_UP */
    case GTK_STACK_TRANSITION_TYPE_OVER_DOWN: return Val_int(624750337); /* `OVER_DOWN */
    case GTK_STACK_TRANSITION_TYPE_OVER_LEFT: return Val_int(288391652); /* `OVER_LEFT */
    case GTK_STACK_TRANSITION_TYPE_OVER_RIGHT: return Val_int(270193913); /* `OVER_RIGHT */
    case GTK_STACK_TRANSITION_TYPE_UNDER_UP: return Val_int(88259060); /* `UNDER_UP */
    case GTK_STACK_TRANSITION_TYPE_UNDER_DOWN: return Val_int(939788063); /* `UNDER_DOWN */
    case GTK_STACK_TRANSITION_TYPE_UNDER_LEFT: return Val_int(347881455); /* `UNDER_LEFT */
    case GTK_STACK_TRANSITION_TYPE_UNDER_RIGHT: return Val_int(342578694); /* `UNDER_RIGHT */
    case GTK_STACK_TRANSITION_TYPE_OVER_UP_DOWN: return Val_int(621561043); /* `OVER_UP_DOWN */
    case GTK_STACK_TRANSITION_TYPE_OVER_DOWN_UP: return Val_int(443281368); /* `OVER_DOWN_UP */
    case GTK_STACK_TRANSITION_TYPE_OVER_LEFT_RIGHT: return Val_int(585776344); /* `OVER_LEFT_RIGHT */
    case GTK_STACK_TRANSITION_TYPE_OVER_RIGHT_LEFT: return Val_int(628104188); /* `OVER_RIGHT_LEFT */
    case GTK_STACK_TRANSITION_TYPE_ROTATE_LEFT: return Val_int(150687672); /* `ROTATE_LEFT */
    case GTK_STACK_TRANSITION_TYPE_ROTATE_RIGHT: return Val_int(335114260); /* `ROTATE_RIGHT */
    case GTK_STACK_TRANSITION_TYPE_ROTATE_LEFT_RIGHT: return Val_int(473822719); /* `ROTATE_LEFT_RIGHT */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkStackTransitionType */
GtkStackTransitionType GtkStackTransitionType_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_STACK_TRANSITION_TYPE_NONE; /* `NONE */
  else if (tag == 53473499) return GTK_STACK_TRANSITION_TYPE_CROSSFADE; /* `CROSSFADE */
  else if (tag == 555513390) return GTK_STACK_TRANSITION_TYPE_SLIDE_RIGHT; /* `SLIDE_RIGHT */
  else if (tag == 258644160) return GTK_STACK_TRANSITION_TYPE_SLIDE_LEFT; /* `SLIDE_LEFT */
  else if (tag == 196330409) return GTK_STACK_TRANSITION_TYPE_SLIDE_UP; /* `SLIDE_UP */
  else if (tag == 613934471) return GTK_STACK_TRANSITION_TYPE_SLIDE_DOWN; /* `SLIDE_DOWN */
  else if (tag == 517166315) return GTK_STACK_TRANSITION_TYPE_SLIDE_LEFT_RIGHT; /* `SLIDE_LEFT_RIGHT */
  else if (tag == 302784890) return GTK_STACK_TRANSITION_TYPE_SLIDE_UP_DOWN; /* `SLIDE_UP_DOWN */
  else if (tag == 54458930) return GTK_STACK_TRANSITION_TYPE_OVER_UP; /* `OVER_UP */
  else if (tag == 624750337) return GTK_STACK_TRANSITION_TYPE_OVER_DOWN; /* `OVER_DOWN */
  else if (tag == 288391652) return GTK_STACK_TRANSITION_TYPE_OVER_LEFT; /* `OVER_LEFT */
  else if (tag == 270193913) return GTK_STACK_TRANSITION_TYPE_OVER_RIGHT; /* `OVER_RIGHT */
  else if (tag == 88259060) return GTK_STACK_TRANSITION_TYPE_UNDER_UP; /* `UNDER_UP */
  else if (tag == 939788063) return GTK_STACK_TRANSITION_TYPE_UNDER_DOWN; /* `UNDER_DOWN */
  else if (tag == 347881455) return GTK_STACK_TRANSITION_TYPE_UNDER_LEFT; /* `UNDER_LEFT */
  else if (tag == 342578694) return GTK_STACK_TRANSITION_TYPE_UNDER_RIGHT; /* `UNDER_RIGHT */
  else if (tag == 621561043) return GTK_STACK_TRANSITION_TYPE_OVER_UP_DOWN; /* `OVER_UP_DOWN */
  else if (tag == 443281368) return GTK_STACK_TRANSITION_TYPE_OVER_DOWN_UP; /* `OVER_DOWN_UP */
  else if (tag == 585776344) return GTK_STACK_TRANSITION_TYPE_OVER_LEFT_RIGHT; /* `OVER_LEFT_RIGHT */
  else if (tag == 628104188) return GTK_STACK_TRANSITION_TYPE_OVER_RIGHT_LEFT; /* `OVER_RIGHT_LEFT */
  else if (tag == 150687672) return GTK_STACK_TRANSITION_TYPE_ROTATE_LEFT; /* `ROTATE_LEFT */
  else if (tag == 335114260) return GTK_STACK_TRANSITION_TYPE_ROTATE_RIGHT; /* `ROTATE_RIGHT */
  else if (tag == 473822719) return GTK_STACK_TRANSITION_TYPE_ROTATE_LEFT_RIGHT; /* `ROTATE_LEFT_RIGHT */
  else return GTK_STACK_TRANSITION_TYPE_NONE; /* fallback to first value */
}

/* Convert GtkStringFilterMatchMode to OCaml value */
value Val_GtkStringFilterMatchMode(GtkStringFilterMatchMode val) {
  switch (val) {
    case GTK_STRING_FILTER_MATCH_MODE_EXACT: return Val_int(863737765); /* `EXACT */
    case GTK_STRING_FILTER_MATCH_MODE_SUBSTRING: return Val_int(334670662); /* `SUBSTRING */
    case GTK_STRING_FILTER_MATCH_MODE_PREFIX: return Val_int(243036487); /* `PREFIX */
    default: return Val_int(863737765); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkStringFilterMatchMode */
GtkStringFilterMatchMode GtkStringFilterMatchMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 863737765) return GTK_STRING_FILTER_MATCH_MODE_EXACT; /* `EXACT */
  else if (tag == 334670662) return GTK_STRING_FILTER_MATCH_MODE_SUBSTRING; /* `SUBSTRING */
  else if (tag == 243036487) return GTK_STRING_FILTER_MATCH_MODE_PREFIX; /* `PREFIX */
  else return GTK_STRING_FILTER_MATCH_MODE_EXACT; /* fallback to first value */
}

/* Convert GtkSymbolicColor to OCaml value */
value Val_GtkSymbolicColor(GtkSymbolicColor val) {
  switch (val) {
    case GTK_SYMBOLIC_COLOR_FOREGROUND: return Val_int(351117237); /* `FOREGROUND */
    case GTK_SYMBOLIC_COLOR_ERROR: return Val_int(1064539868); /* `ERROR */
    case GTK_SYMBOLIC_COLOR_WARNING: return Val_int(928678842); /* `WARNING */
    case GTK_SYMBOLIC_COLOR_SUCCESS: return Val_int(414243364); /* `SUCCESS */
    default: return Val_int(351117237); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSymbolicColor */
GtkSymbolicColor GtkSymbolicColor_val(value val) {
  int tag = Int_val(val);
  if (tag == 351117237) return GTK_SYMBOLIC_COLOR_FOREGROUND; /* `FOREGROUND */
  else if (tag == 1064539868) return GTK_SYMBOLIC_COLOR_ERROR; /* `ERROR */
  else if (tag == 928678842) return GTK_SYMBOLIC_COLOR_WARNING; /* `WARNING */
  else if (tag == 414243364) return GTK_SYMBOLIC_COLOR_SUCCESS; /* `SUCCESS */
  else return GTK_SYMBOLIC_COLOR_FOREGROUND; /* fallback to first value */
}

/* Convert GtkSystemSetting to OCaml value */
value Val_GtkSystemSetting(GtkSystemSetting val) {
  switch (val) {
    case GTK_SYSTEM_SETTING_DPI: return Val_int(511308664); /* `DPI */
    case GTK_SYSTEM_SETTING_FONT_NAME: return Val_int(12153804); /* `FONT_NAME */
    case GTK_SYSTEM_SETTING_FONT_CONFIG: return Val_int(578417707); /* `FONT_CONFIG */
    case GTK_SYSTEM_SETTING_DISPLAY: return Val_int(717839303); /* `DISPLAY */
    case GTK_SYSTEM_SETTING_ICON_THEME: return Val_int(999611675); /* `ICON_THEME */
    default: return Val_int(511308664); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSystemSetting */
GtkSystemSetting GtkSystemSetting_val(value val) {
  int tag = Int_val(val);
  if (tag == 511308664) return GTK_SYSTEM_SETTING_DPI; /* `DPI */
  else if (tag == 12153804) return GTK_SYSTEM_SETTING_FONT_NAME; /* `FONT_NAME */
  else if (tag == 578417707) return GTK_SYSTEM_SETTING_FONT_CONFIG; /* `FONT_CONFIG */
  else if (tag == 717839303) return GTK_SYSTEM_SETTING_DISPLAY; /* `DISPLAY */
  else if (tag == 999611675) return GTK_SYSTEM_SETTING_ICON_THEME; /* `ICON_THEME */
  else return GTK_SYSTEM_SETTING_DPI; /* fallback to first value */
}

/* Convert GtkTextDirection to OCaml value */
value Val_GtkTextDirection(GtkTextDirection val) {
  switch (val) {
    case GTK_TEXT_DIR_NONE: return Val_int(37469934); /* `NONE */
    case GTK_TEXT_DIR_LTR: return Val_int(1043707392); /* `LTR */
    case GTK_TEXT_DIR_RTL: return Val_int(286034419); /* `RTL */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkTextDirection */
GtkTextDirection GtkTextDirection_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_TEXT_DIR_NONE; /* `NONE */
  else if (tag == 1043707392) return GTK_TEXT_DIR_LTR; /* `LTR */
  else if (tag == 286034419) return GTK_TEXT_DIR_RTL; /* `RTL */
  else return GTK_TEXT_DIR_NONE; /* fallback to first value */
}

/* Convert GtkTextExtendSelection to OCaml value */
value Val_GtkTextExtendSelection(GtkTextExtendSelection val) {
  switch (val) {
    case GTK_TEXT_EXTEND_SELECTION_WORD: return Val_int(777616121); /* `WORD */
    case GTK_TEXT_EXTEND_SELECTION_LINE: return Val_int(452458406); /* `LINE */
    default: return Val_int(777616121); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkTextExtendSelection */
GtkTextExtendSelection GtkTextExtendSelection_val(value val) {
  int tag = Int_val(val);
  if (tag == 777616121) return GTK_TEXT_EXTEND_SELECTION_WORD; /* `WORD */
  else if (tag == 452458406) return GTK_TEXT_EXTEND_SELECTION_LINE; /* `LINE */
  else return GTK_TEXT_EXTEND_SELECTION_WORD; /* fallback to first value */
}

/* Convert GtkTextViewLayer to OCaml value */
value Val_GtkTextViewLayer(GtkTextViewLayer val) {
  switch (val) {
    case GTK_TEXT_VIEW_LAYER_BELOW_TEXT: return Val_int(443612387); /* `BELOW_TEXT */
    case GTK_TEXT_VIEW_LAYER_ABOVE_TEXT: return Val_int(114488273); /* `ABOVE_TEXT */
    default: return Val_int(443612387); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkTextViewLayer */
GtkTextViewLayer GtkTextViewLayer_val(value val) {
  int tag = Int_val(val);
  if (tag == 443612387) return GTK_TEXT_VIEW_LAYER_BELOW_TEXT; /* `BELOW_TEXT */
  else if (tag == 114488273) return GTK_TEXT_VIEW_LAYER_ABOVE_TEXT; /* `ABOVE_TEXT */
  else return GTK_TEXT_VIEW_LAYER_BELOW_TEXT; /* fallback to first value */
}

/* Convert GtkTextWindowType to OCaml value */
value Val_GtkTextWindowType(GtkTextWindowType val) {
  switch (val) {
    case GTK_TEXT_WINDOW_WIDGET: return Val_int(867734171); /* `WIDGET */
    case GTK_TEXT_WINDOW_TEXT: return Val_int(130184766); /* `TEXT */
    case GTK_TEXT_WINDOW_LEFT: return Val_int(28713888); /* `LEFT */
    case GTK_TEXT_WINDOW_RIGHT: return Val_int(961111566); /* `RIGHT */
    case GTK_TEXT_WINDOW_TOP: return Val_int(281490397); /* `TOP */
    case GTK_TEXT_WINDOW_BOTTOM: return Val_int(585108400); /* `BOTTOM */
    default: return Val_int(867734171); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkTextWindowType */
GtkTextWindowType GtkTextWindowType_val(value val) {
  int tag = Int_val(val);
  if (tag == 867734171) return GTK_TEXT_WINDOW_WIDGET; /* `WIDGET */
  else if (tag == 130184766) return GTK_TEXT_WINDOW_TEXT; /* `TEXT */
  else if (tag == 28713888) return GTK_TEXT_WINDOW_LEFT; /* `LEFT */
  else if (tag == 961111566) return GTK_TEXT_WINDOW_RIGHT; /* `RIGHT */
  else if (tag == 281490397) return GTK_TEXT_WINDOW_TOP; /* `TOP */
  else if (tag == 585108400) return GTK_TEXT_WINDOW_BOTTOM; /* `BOTTOM */
  else return GTK_TEXT_WINDOW_WIDGET; /* fallback to first value */
}

/* Convert GtkTreeViewColumnSizing to OCaml value */
value Val_GtkTreeViewColumnSizing(GtkTreeViewColumnSizing val) {
  switch (val) {
    case GTK_TREE_VIEW_COLUMN_GROW_ONLY: return Val_int(1055511427); /* `GROW_ONLY */
    case GTK_TREE_VIEW_COLUMN_AUTOSIZE: return Val_int(602028811); /* `AUTOSIZE */
    case GTK_TREE_VIEW_COLUMN_FIXED: return Val_int(1055799355); /* `FIXED */
    default: return Val_int(1055511427); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkTreeViewColumnSizing */
GtkTreeViewColumnSizing GtkTreeViewColumnSizing_val(value val) {
  int tag = Int_val(val);
  if (tag == 1055511427) return GTK_TREE_VIEW_COLUMN_GROW_ONLY; /* `GROW_ONLY */
  else if (tag == 602028811) return GTK_TREE_VIEW_COLUMN_AUTOSIZE; /* `AUTOSIZE */
  else if (tag == 1055799355) return GTK_TREE_VIEW_COLUMN_FIXED; /* `FIXED */
  else return GTK_TREE_VIEW_COLUMN_GROW_ONLY; /* fallback to first value */
}

/* Convert GtkTreeViewDropPosition to OCaml value */
value Val_GtkTreeViewDropPosition(GtkTreeViewDropPosition val) {
  switch (val) {
    case GTK_TREE_VIEW_DROP_BEFORE: return Val_int(976625365); /* `BEFORE */
    case GTK_TREE_VIEW_DROP_AFTER: return Val_int(1029660537); /* `AFTER */
    case GTK_TREE_VIEW_DROP_INTO_OR_BEFORE: return Val_int(956560000); /* `INTO_OR_BEFORE */
    case GTK_TREE_VIEW_DROP_INTO_OR_AFTER: return Val_int(350344266); /* `INTO_OR_AFTER */
    default: return Val_int(976625365); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkTreeViewDropPosition */
GtkTreeViewDropPosition GtkTreeViewDropPosition_val(value val) {
  int tag = Int_val(val);
  if (tag == 976625365) return GTK_TREE_VIEW_DROP_BEFORE; /* `BEFORE */
  else if (tag == 1029660537) return GTK_TREE_VIEW_DROP_AFTER; /* `AFTER */
  else if (tag == 956560000) return GTK_TREE_VIEW_DROP_INTO_OR_BEFORE; /* `INTO_OR_BEFORE */
  else if (tag == 350344266) return GTK_TREE_VIEW_DROP_INTO_OR_AFTER; /* `INTO_OR_AFTER */
  else return GTK_TREE_VIEW_DROP_BEFORE; /* fallback to first value */
}

/* Convert GtkTreeViewGridLines to OCaml value */
value Val_GtkTreeViewGridLines(GtkTreeViewGridLines val) {
  switch (val) {
    case GTK_TREE_VIEW_GRID_LINES_NONE: return Val_int(37469934); /* `NONE */
    case GTK_TREE_VIEW_GRID_LINES_HORIZONTAL: return Val_int(691710922); /* `HORIZONTAL */
    case GTK_TREE_VIEW_GRID_LINES_VERTICAL: return Val_int(721220360); /* `VERTICAL */
    case GTK_TREE_VIEW_GRID_LINES_BOTH: return Val_int(85085456); /* `BOTH */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkTreeViewGridLines */
GtkTreeViewGridLines GtkTreeViewGridLines_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_TREE_VIEW_GRID_LINES_NONE; /* `NONE */
  else if (tag == 691710922) return GTK_TREE_VIEW_GRID_LINES_HORIZONTAL; /* `HORIZONTAL */
  else if (tag == 721220360) return GTK_TREE_VIEW_GRID_LINES_VERTICAL; /* `VERTICAL */
  else if (tag == 85085456) return GTK_TREE_VIEW_GRID_LINES_BOTH; /* `BOTH */
  else return GTK_TREE_VIEW_GRID_LINES_NONE; /* fallback to first value */
}

/* Convert GtkUnit to OCaml value */
value Val_GtkUnit(GtkUnit val) {
  switch (val) {
    case GTK_UNIT_NONE: return Val_int(37469934); /* `NONE */
    case GTK_UNIT_POINTS: return Val_int(403443644); /* `POINTS */
    case GTK_UNIT_INCH: return Val_int(687648425); /* `INCH */
    case GTK_UNIT_MM: return Val_int(202694556); /* `MM */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkUnit */
GtkUnit GtkUnit_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_UNIT_NONE; /* `NONE */
  else if (tag == 403443644) return GTK_UNIT_POINTS; /* `POINTS */
  else if (tag == 687648425) return GTK_UNIT_INCH; /* `INCH */
  else if (tag == 202694556) return GTK_UNIT_MM; /* `MM */
  else return GTK_UNIT_NONE; /* fallback to first value */
}

/* Convert GtkWrapMode to OCaml value */
value Val_GtkWrapMode(GtkWrapMode val) {
  switch (val) {
    case GTK_WRAP_NONE: return Val_int(37469934); /* `NONE */
    case GTK_WRAP_CHAR: return Val_int(673743267); /* `CHAR */
    case GTK_WRAP_WORD: return Val_int(777616121); /* `WORD */
    case GTK_WRAP_WORD_CHAR: return Val_int(647176300); /* `WORD_CHAR */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkWrapMode */
GtkWrapMode GtkWrapMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_WRAP_NONE; /* `NONE */
  else if (tag == 673743267) return GTK_WRAP_CHAR; /* `CHAR */
  else if (tag == 777616121) return GTK_WRAP_WORD; /* `WORD */
  else if (tag == 647176300) return GTK_WRAP_WORD_CHAR; /* `WORD_CHAR */
  else return GTK_WRAP_NONE; /* fallback to first value */
}

/* Convert GtkApplicationInhibitFlags to OCaml flag list */
value Val_GtkApplicationInhibitFlags(GtkApplicationInhibitFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_APPLICATION_INHIBIT_LOGOUT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(793174275)); /* `LOGOUT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_APPLICATION_INHIBIT_SWITCH) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(161129457)); /* `SWITCH */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_APPLICATION_INHIBIT_SUSPEND) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(90307700)); /* `SUSPEND */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_APPLICATION_INHIBIT_IDLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(554016934)); /* `IDLE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkApplicationInhibitFlags */
GtkApplicationInhibitFlags GtkApplicationInhibitFlags_val(value list) {
  GtkApplicationInhibitFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 793174275) result |= GTK_APPLICATION_INHIBIT_LOGOUT; /* `LOGOUT */
    else if (tag == 161129457) result |= GTK_APPLICATION_INHIBIT_SWITCH; /* `SWITCH */
    else if (tag == 90307700) result |= GTK_APPLICATION_INHIBIT_SUSPEND; /* `SUSPEND */
    else if (tag == 554016934) result |= GTK_APPLICATION_INHIBIT_IDLE; /* `IDLE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkBuilderClosureFlags to OCaml flag list */
value Val_GtkBuilderClosureFlags(GtkBuilderClosureFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_BUILDER_CLOSURE_SWAPPED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(33727952)); /* `SWAPPED */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkBuilderClosureFlags */
GtkBuilderClosureFlags GtkBuilderClosureFlags_val(value list) {
  GtkBuilderClosureFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 33727952) result |= GTK_BUILDER_CLOSURE_SWAPPED; /* `SWAPPED */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkCellRendererState to OCaml flag list */
value Val_GtkCellRendererState(GtkCellRendererState flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_CELL_RENDERER_SELECTED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(514267004)); /* `SELECTED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_CELL_RENDERER_PRELIT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(19035766)); /* `PRELIT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_CELL_RENDERER_INSENSITIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(214858768)); /* `INSENSITIVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_CELL_RENDERER_SORTED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(114341230)); /* `SORTED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_CELL_RENDERER_FOCUSED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(759380304)); /* `FOCUSED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_CELL_RENDERER_EXPANDABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(46740241)); /* `EXPANDABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_CELL_RENDERER_EXPANDED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(865473550)); /* `EXPANDED */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkCellRendererState */
GtkCellRendererState GtkCellRendererState_val(value list) {
  GtkCellRendererState result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 514267004) result |= GTK_CELL_RENDERER_SELECTED; /* `SELECTED */
    else if (tag == 19035766) result |= GTK_CELL_RENDERER_PRELIT; /* `PRELIT */
    else if (tag == 214858768) result |= GTK_CELL_RENDERER_INSENSITIVE; /* `INSENSITIVE */
    else if (tag == 114341230) result |= GTK_CELL_RENDERER_SORTED; /* `SORTED */
    else if (tag == 759380304) result |= GTK_CELL_RENDERER_FOCUSED; /* `FOCUSED */
    else if (tag == 46740241) result |= GTK_CELL_RENDERER_EXPANDABLE; /* `EXPANDABLE */
    else if (tag == 865473550) result |= GTK_CELL_RENDERER_EXPANDED; /* `EXPANDED */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkDebugFlags to OCaml flag list */
value Val_GtkDebugFlags(GtkDebugFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_DEBUG_TEXT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(130184766)); /* `TEXT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_TREE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(488644235)); /* `TREE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_KEYBINDINGS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(652827284)); /* `KEYBINDINGS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_MODULES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(943434978)); /* `MODULES */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_GEOMETRY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(603783573)); /* `GEOMETRY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_ICONTHEME) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1045171906)); /* `ICONTHEME */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_PRINTING) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(510965512)); /* `PRINTING */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_BUILDER) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(797073081)); /* `BUILDER */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_SIZE_REQUEST) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(748862521)); /* `SIZE_REQUEST */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_NO_CSS_CACHE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(911299570)); /* `NO_CSS_CACHE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_INTERACTIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(574105747)); /* `INTERACTIVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_ACTIONS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(442850401)); /* `ACTIONS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_LAYOUT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(666518986)); /* `LAYOUT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_SNAPSHOT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(205189192)); /* `SNAPSHOT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_CONSTRAINTS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(894566833)); /* `CONSTRAINTS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_BUILDER_OBJECTS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(544318392)); /* `BUILDER_OBJECTS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_A11Y) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(614281989)); /* `A11Y */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_ICONFALLBACK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(479128279)); /* `ICONFALLBACK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_INVERT_TEXT_DIR) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(389527549)); /* `INVERT_TEXT_DIR */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkDebugFlags */
GtkDebugFlags GtkDebugFlags_val(value list) {
  GtkDebugFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 130184766) result |= GTK_DEBUG_TEXT; /* `TEXT */
    else if (tag == 488644235) result |= GTK_DEBUG_TREE; /* `TREE */
    else if (tag == 652827284) result |= GTK_DEBUG_KEYBINDINGS; /* `KEYBINDINGS */
    else if (tag == 943434978) result |= GTK_DEBUG_MODULES; /* `MODULES */
    else if (tag == 603783573) result |= GTK_DEBUG_GEOMETRY; /* `GEOMETRY */
    else if (tag == 1045171906) result |= GTK_DEBUG_ICONTHEME; /* `ICONTHEME */
    else if (tag == 510965512) result |= GTK_DEBUG_PRINTING; /* `PRINTING */
    else if (tag == 797073081) result |= GTK_DEBUG_BUILDER; /* `BUILDER */
    else if (tag == 748862521) result |= GTK_DEBUG_SIZE_REQUEST; /* `SIZE_REQUEST */
    else if (tag == 911299570) result |= GTK_DEBUG_NO_CSS_CACHE; /* `NO_CSS_CACHE */
    else if (tag == 574105747) result |= GTK_DEBUG_INTERACTIVE; /* `INTERACTIVE */
    else if (tag == 442850401) result |= GTK_DEBUG_ACTIONS; /* `ACTIONS */
    else if (tag == 666518986) result |= GTK_DEBUG_LAYOUT; /* `LAYOUT */
    else if (tag == 205189192) result |= GTK_DEBUG_SNAPSHOT; /* `SNAPSHOT */
    else if (tag == 894566833) result |= GTK_DEBUG_CONSTRAINTS; /* `CONSTRAINTS */
    else if (tag == 544318392) result |= GTK_DEBUG_BUILDER_OBJECTS; /* `BUILDER_OBJECTS */
    else if (tag == 614281989) result |= GTK_DEBUG_A11Y; /* `A11Y */
    else if (tag == 479128279) result |= GTK_DEBUG_ICONFALLBACK; /* `ICONFALLBACK */
    else if (tag == 389527549) result |= GTK_DEBUG_INVERT_TEXT_DIR; /* `INVERT_TEXT_DIR */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkDialogFlags to OCaml flag list */
value Val_GtkDialogFlags(GtkDialogFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_DIALOG_MODAL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1053440038)); /* `MODAL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DIALOG_DESTROY_WITH_PARENT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(158530669)); /* `DESTROY_WITH_PARENT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DIALOG_USE_HEADER_BAR) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(767719913)); /* `USE_HEADER_BAR */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkDialogFlags */
GtkDialogFlags GtkDialogFlags_val(value list) {
  GtkDialogFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 1053440038) result |= GTK_DIALOG_MODAL; /* `MODAL */
    else if (tag == 158530669) result |= GTK_DIALOG_DESTROY_WITH_PARENT; /* `DESTROY_WITH_PARENT */
    else if (tag == 767719913) result |= GTK_DIALOG_USE_HEADER_BAR; /* `USE_HEADER_BAR */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkEventControllerScrollFlags to OCaml flag list */
value Val_GtkEventControllerScrollFlags(GtkEventControllerScrollFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_EVENT_CONTROLLER_SCROLL_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(37469934)); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_EVENT_CONTROLLER_SCROLL_VERTICAL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(721220360)); /* `VERTICAL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(691710922)); /* `HORIZONTAL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_EVENT_CONTROLLER_SCROLL_DISCRETE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(644866580)); /* `DISCRETE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_EVENT_CONTROLLER_SCROLL_KINETIC) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(498919076)); /* `KINETIC */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(650074375)); /* `BOTH_AXES */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkEventControllerScrollFlags */
GtkEventControllerScrollFlags GtkEventControllerScrollFlags_val(value list) {
  GtkEventControllerScrollFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 37469934) result |= GTK_EVENT_CONTROLLER_SCROLL_NONE; /* `NONE */
    else if (tag == 721220360) result |= GTK_EVENT_CONTROLLER_SCROLL_VERTICAL; /* `VERTICAL */
    else if (tag == 691710922) result |= GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL; /* `HORIZONTAL */
    else if (tag == 644866580) result |= GTK_EVENT_CONTROLLER_SCROLL_DISCRETE; /* `DISCRETE */
    else if (tag == 498919076) result |= GTK_EVENT_CONTROLLER_SCROLL_KINETIC; /* `KINETIC */
    else if (tag == 650074375) result |= GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES; /* `BOTH_AXES */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkFontChooserLevel to OCaml flag list */
value Val_GtkFontChooserLevel(GtkFontChooserLevel flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_FONT_CHOOSER_LEVEL_FAMILY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(690675795)); /* `FAMILY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_FONT_CHOOSER_LEVEL_STYLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(994234501)); /* `STYLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_FONT_CHOOSER_LEVEL_SIZE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(583873574)); /* `SIZE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_FONT_CHOOSER_LEVEL_VARIATIONS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(54227459)); /* `VARIATIONS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_FONT_CHOOSER_LEVEL_FEATURES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(816931048)); /* `FEATURES */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkFontChooserLevel */
GtkFontChooserLevel GtkFontChooserLevel_val(value list) {
  GtkFontChooserLevel result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 690675795) result |= GTK_FONT_CHOOSER_LEVEL_FAMILY; /* `FAMILY */
    else if (tag == 994234501) result |= GTK_FONT_CHOOSER_LEVEL_STYLE; /* `STYLE */
    else if (tag == 583873574) result |= GTK_FONT_CHOOSER_LEVEL_SIZE; /* `SIZE */
    else if (tag == 54227459) result |= GTK_FONT_CHOOSER_LEVEL_VARIATIONS; /* `VARIATIONS */
    else if (tag == 816931048) result |= GTK_FONT_CHOOSER_LEVEL_FEATURES; /* `FEATURES */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkIconLookupFlags to OCaml flag list */
value Val_GtkIconLookupFlags(GtkIconLookupFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_ICON_LOOKUP_FORCE_REGULAR) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(81188267)); /* `FORCE_REGULAR */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_ICON_LOOKUP_FORCE_SYMBOLIC) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1058164380)); /* `FORCE_SYMBOLIC */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_ICON_LOOKUP_PRELOAD) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(144436011)); /* `PRELOAD */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkIconLookupFlags */
GtkIconLookupFlags GtkIconLookupFlags_val(value list) {
  GtkIconLookupFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 81188267) result |= GTK_ICON_LOOKUP_FORCE_REGULAR; /* `FORCE_REGULAR */
    else if (tag == 1058164380) result |= GTK_ICON_LOOKUP_FORCE_SYMBOLIC; /* `FORCE_SYMBOLIC */
    else if (tag == 144436011) result |= GTK_ICON_LOOKUP_PRELOAD; /* `PRELOAD */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkInputHints to OCaml flag list */
value Val_GtkInputHints(GtkInputHints flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_INPUT_HINT_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(37469934)); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_SPELLCHECK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(905547503)); /* `SPELLCHECK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_NO_SPELLCHECK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(962856549)); /* `NO_SPELLCHECK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_WORD_COMPLETION) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(2986617)); /* `WORD_COMPLETION */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_LOWERCASE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(700654046)); /* `LOWERCASE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_UPPERCASE_CHARS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(530894489)); /* `UPPERCASE_CHARS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_UPPERCASE_WORDS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(597985190)); /* `UPPERCASE_WORDS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_UPPERCASE_SENTENCES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(704557274)); /* `UPPERCASE_SENTENCES */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_INHIBIT_OSK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(980711174)); /* `INHIBIT_OSK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_VERTICAL_WRITING) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1001740318)); /* `VERTICAL_WRITING */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_EMOJI) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(784130908)); /* `EMOJI */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_NO_EMOJI) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(461957134)); /* `NO_EMOJI */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_PRIVATE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(983917035)); /* `PRIVATE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkInputHints */
GtkInputHints GtkInputHints_val(value list) {
  GtkInputHints result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 37469934) result |= GTK_INPUT_HINT_NONE; /* `NONE */
    else if (tag == 905547503) result |= GTK_INPUT_HINT_SPELLCHECK; /* `SPELLCHECK */
    else if (tag == 962856549) result |= GTK_INPUT_HINT_NO_SPELLCHECK; /* `NO_SPELLCHECK */
    else if (tag == 2986617) result |= GTK_INPUT_HINT_WORD_COMPLETION; /* `WORD_COMPLETION */
    else if (tag == 700654046) result |= GTK_INPUT_HINT_LOWERCASE; /* `LOWERCASE */
    else if (tag == 530894489) result |= GTK_INPUT_HINT_UPPERCASE_CHARS; /* `UPPERCASE_CHARS */
    else if (tag == 597985190) result |= GTK_INPUT_HINT_UPPERCASE_WORDS; /* `UPPERCASE_WORDS */
    else if (tag == 704557274) result |= GTK_INPUT_HINT_UPPERCASE_SENTENCES; /* `UPPERCASE_SENTENCES */
    else if (tag == 980711174) result |= GTK_INPUT_HINT_INHIBIT_OSK; /* `INHIBIT_OSK */
    else if (tag == 1001740318) result |= GTK_INPUT_HINT_VERTICAL_WRITING; /* `VERTICAL_WRITING */
    else if (tag == 784130908) result |= GTK_INPUT_HINT_EMOJI; /* `EMOJI */
    else if (tag == 461957134) result |= GTK_INPUT_HINT_NO_EMOJI; /* `NO_EMOJI */
    else if (tag == 983917035) result |= GTK_INPUT_HINT_PRIVATE; /* `PRIVATE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkListScrollFlags to OCaml flag list */
value Val_GtkListScrollFlags(GtkListScrollFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_LIST_SCROLL_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(37469934)); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_LIST_SCROLL_FOCUS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(652711140)); /* `FOCUS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_LIST_SCROLL_SELECT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(455248459)); /* `SELECT */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkListScrollFlags */
GtkListScrollFlags GtkListScrollFlags_val(value list) {
  GtkListScrollFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 37469934) result |= GTK_LIST_SCROLL_NONE; /* `NONE */
    else if (tag == 652711140) result |= GTK_LIST_SCROLL_FOCUS; /* `FOCUS */
    else if (tag == 455248459) result |= GTK_LIST_SCROLL_SELECT; /* `SELECT */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkPickFlags to OCaml flag list */
value Val_GtkPickFlags(GtkPickFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_PICK_DEFAULT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1054500001)); /* `DEFAULT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_PICK_INSENSITIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(214858768)); /* `INSENSITIVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_PICK_NON_TARGETABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(804968302)); /* `NON_TARGETABLE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkPickFlags */
GtkPickFlags GtkPickFlags_val(value list) {
  GtkPickFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 1054500001) result |= GTK_PICK_DEFAULT; /* `DEFAULT */
    else if (tag == 214858768) result |= GTK_PICK_INSENSITIVE; /* `INSENSITIVE */
    else if (tag == 804968302) result |= GTK_PICK_NON_TARGETABLE; /* `NON_TARGETABLE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkPopoverMenuFlags to OCaml flag list */
value Val_GtkPopoverMenuFlags(GtkPopoverMenuFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_POPOVER_MENU_SLIDING) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(459201746)); /* `SLIDING */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_POPOVER_MENU_NESTED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(702546816)); /* `NESTED */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkPopoverMenuFlags */
GtkPopoverMenuFlags GtkPopoverMenuFlags_val(value list) {
  GtkPopoverMenuFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 459201746) result |= GTK_POPOVER_MENU_SLIDING; /* `SLIDING */
    else if (tag == 702546816) result |= GTK_POPOVER_MENU_NESTED; /* `NESTED */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkShortcutActionFlags to OCaml flag list */
value Val_GtkShortcutActionFlags(GtkShortcutActionFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_SHORTCUT_ACTION_EXCLUSIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(82263211)); /* `EXCLUSIVE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkShortcutActionFlags */
GtkShortcutActionFlags GtkShortcutActionFlags_val(value list) {
  GtkShortcutActionFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 82263211) result |= GTK_SHORTCUT_ACTION_EXCLUSIVE; /* `EXCLUSIVE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkStateFlags to OCaml flag list */
value Val_GtkStateFlags(GtkStateFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_STATE_FLAG_NORMAL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(888717969)); /* `NORMAL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_ACTIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1031974070)); /* `ACTIVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_PRELIGHT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(291344210)); /* `PRELIGHT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_SELECTED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(514267004)); /* `SELECTED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_INSENSITIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(214858768)); /* `INSENSITIVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_INCONSISTENT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(149472872)); /* `INCONSISTENT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_FOCUSED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(759380304)); /* `FOCUSED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_BACKDROP) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(259279064)); /* `BACKDROP */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_DIR_LTR) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(41887561)); /* `DIR_LTR */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_DIR_RTL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1030586614)); /* `DIR_RTL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_LINK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(869638750)); /* `LINK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_VISITED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(961432375)); /* `VISITED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_CHECKED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(230867372)); /* `CHECKED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_DROP_ACTIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(207677118)); /* `DROP_ACTIVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_FOCUS_VISIBLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(399686954)); /* `FOCUS_VISIBLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_FOCUS_WITHIN) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(357354864)); /* `FOCUS_WITHIN */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkStateFlags */
GtkStateFlags GtkStateFlags_val(value list) {
  GtkStateFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 888717969) result |= GTK_STATE_FLAG_NORMAL; /* `NORMAL */
    else if (tag == 1031974070) result |= GTK_STATE_FLAG_ACTIVE; /* `ACTIVE */
    else if (tag == 291344210) result |= GTK_STATE_FLAG_PRELIGHT; /* `PRELIGHT */
    else if (tag == 514267004) result |= GTK_STATE_FLAG_SELECTED; /* `SELECTED */
    else if (tag == 214858768) result |= GTK_STATE_FLAG_INSENSITIVE; /* `INSENSITIVE */
    else if (tag == 149472872) result |= GTK_STATE_FLAG_INCONSISTENT; /* `INCONSISTENT */
    else if (tag == 759380304) result |= GTK_STATE_FLAG_FOCUSED; /* `FOCUSED */
    else if (tag == 259279064) result |= GTK_STATE_FLAG_BACKDROP; /* `BACKDROP */
    else if (tag == 41887561) result |= GTK_STATE_FLAG_DIR_LTR; /* `DIR_LTR */
    else if (tag == 1030586614) result |= GTK_STATE_FLAG_DIR_RTL; /* `DIR_RTL */
    else if (tag == 869638750) result |= GTK_STATE_FLAG_LINK; /* `LINK */
    else if (tag == 961432375) result |= GTK_STATE_FLAG_VISITED; /* `VISITED */
    else if (tag == 230867372) result |= GTK_STATE_FLAG_CHECKED; /* `CHECKED */
    else if (tag == 207677118) result |= GTK_STATE_FLAG_DROP_ACTIVE; /* `DROP_ACTIVE */
    else if (tag == 399686954) result |= GTK_STATE_FLAG_FOCUS_VISIBLE; /* `FOCUS_VISIBLE */
    else if (tag == 357354864) result |= GTK_STATE_FLAG_FOCUS_WITHIN; /* `FOCUS_WITHIN */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkStyleContextPrintFlags to OCaml flag list */
value Val_GtkStyleContextPrintFlags(GtkStyleContextPrintFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_STYLE_CONTEXT_PRINT_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(37469934)); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STYLE_CONTEXT_PRINT_RECURSE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(70592385)); /* `RECURSE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STYLE_CONTEXT_PRINT_SHOW_STYLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(565179340)); /* `SHOW_STYLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STYLE_CONTEXT_PRINT_SHOW_CHANGE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(963286364)); /* `SHOW_CHANGE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkStyleContextPrintFlags */
GtkStyleContextPrintFlags GtkStyleContextPrintFlags_val(value list) {
  GtkStyleContextPrintFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 37469934) result |= GTK_STYLE_CONTEXT_PRINT_NONE; /* `NONE */
    else if (tag == 70592385) result |= GTK_STYLE_CONTEXT_PRINT_RECURSE; /* `RECURSE */
    else if (tag == 565179340) result |= GTK_STYLE_CONTEXT_PRINT_SHOW_STYLE; /* `SHOW_STYLE */
    else if (tag == 963286364) result |= GTK_STYLE_CONTEXT_PRINT_SHOW_CHANGE; /* `SHOW_CHANGE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkTextSearchFlags to OCaml flag list */
value Val_GtkTextSearchFlags(GtkTextSearchFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_TEXT_SEARCH_VISIBLE_ONLY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(737768767)); /* `VISIBLE_ONLY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_TEXT_SEARCH_TEXT_ONLY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(769407366)); /* `TEXT_ONLY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_TEXT_SEARCH_CASE_INSENSITIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(155614466)); /* `CASE_INSENSITIVE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkTextSearchFlags */
GtkTextSearchFlags GtkTextSearchFlags_val(value list) {
  GtkTextSearchFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 737768767) result |= GTK_TEXT_SEARCH_VISIBLE_ONLY; /* `VISIBLE_ONLY */
    else if (tag == 769407366) result |= GTK_TEXT_SEARCH_TEXT_ONLY; /* `TEXT_ONLY */
    else if (tag == 155614466) result |= GTK_TEXT_SEARCH_CASE_INSENSITIVE; /* `CASE_INSENSITIVE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkTreeModelFlags to OCaml flag list */
value Val_GtkTreeModelFlags(GtkTreeModelFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_TREE_MODEL_ITERS_PERSIST) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(691929692)); /* `ITERS_PERSIST */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_TREE_MODEL_LIST_ONLY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1037614639)); /* `LIST_ONLY */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GtkTreeModelFlags */
GtkTreeModelFlags GtkTreeModelFlags_val(value list) {
  GtkTreeModelFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 691929692) result |= GTK_TREE_MODEL_ITERS_PERSIST; /* `ITERS_PERSIST */
    else if (tag == 1037614639) result |= GTK_TREE_MODEL_LIST_ONLY; /* `LIST_ONLY */
    list = Field(list, 1);
  }
  return result;
}


CAMLexport CAMLprim value ml_gtk_adjustment_new_native(value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(arg1, arg2, arg3, arg4, arg5);
CAMLxparam1(arg6);
GtkWidget *widget = gtk_adjustment_new(Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5), Double_val(arg6));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_adjustment_new_bytecode(value * argv, int argn)
{
return ml_gtk_adjustment_new_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_adjustment_get_minimum_increment(value self)
{
CAMLparam1(self);


    double result = gtk_adjustment_get_minimum_increment(GtkWidget_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_adjustment_configure_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);


    gtk_adjustment_configure(GtkWidget_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5), Double_val(arg6));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_adjustment_configure_bytecode(value * argv, int argn)
{
return ml_gtk_adjustment_configure_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gtk_adjustment_clamp_page(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_adjustment_clamp_page(GtkWidget_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_adjustment_get_lower(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "lower", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_adjustment_set_lower(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "lower", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_adjustment_get_page_increment(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "page-increment", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_adjustment_set_page_increment(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "page-increment", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_adjustment_get_page_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "page-size", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_adjustment_set_page_size(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "page-size", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_adjustment_get_step_increment(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "step-increment", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_adjustment_set_step_increment(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "step-increment", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_adjustment_get_upper(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "upper", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_adjustment_set_upper(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "upper", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_adjustment_get_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "value", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_adjustment_set_value(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "value", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_button_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_button_new_from_icon_name(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_button_new_from_icon_name(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_button_new_with_label(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_button_new_with_label(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_button_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_button_new_with_mnemonic(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_button_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_button_set_child(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_get_child(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_button_get_child(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_button_get_can_shrink(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "can-shrink", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_button_set_can_shrink(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "can-shrink", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-frame", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_button_set_has_frame(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-frame", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "icon-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_button_set_icon_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_button_set_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_button_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-underline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_button_set_use_underline(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-underline", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_check_button_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_check_button_new_with_label(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_check_button_new_with_label((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_check_button_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_check_button_new_with_mnemonic((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_check_button_set_group(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_check_button_set_group(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_check_button_set_child(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_get_child(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_check_button_get_child(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_check_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "active", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_active(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "active", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_get_inconsistent(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "inconsistent", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_inconsistent(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "inconsistent", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_check_button_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-underline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_check_button_set_use_underline(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-underline", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_entry_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_entry_new_with_buffer(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_entry_new_with_buffer(GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_entry_unset_invisible_char(value self)
{
CAMLparam1(self);


    gtk_entry_unset_invisible_char(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_tabs(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_entry_set_tabs(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_input_purpose(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_entry_set_input_purpose(GtkWidget_val(self), GtkInputPurpose_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_input_hints(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_entry_set_input_hints(GtkWidget_val(self), GtkInputHints_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_icon_tooltip_text(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_entry_set_icon_tooltip_text(GtkWidget_val(self), GtkEntryIconPosition_val(arg1), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_icon_tooltip_markup(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_entry_set_icon_tooltip_markup(GtkWidget_val(self), GtkEntryIconPosition_val(arg1), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_icon_sensitive(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_entry_set_icon_sensitive(GtkWidget_val(self), GtkEntryIconPosition_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_icon_from_paintable(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_entry_set_icon_from_paintable(GtkWidget_val(self), GtkEntryIconPosition_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_icon_from_icon_name(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_entry_set_icon_from_icon_name(GtkWidget_val(self), GtkEntryIconPosition_val(arg1), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_icon_from_gicon(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_entry_set_icon_from_gicon(GtkWidget_val(self), GtkEntryIconPosition_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_icon_drag_source(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_entry_set_icon_drag_source(GtkWidget_val(self), GtkEntryIconPosition_val(arg1), arg2, GdkDragAction_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_icon_activatable(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_entry_set_icon_activatable(GtkWidget_val(self), GtkEntryIconPosition_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_extra_menu(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_entry_set_extra_menu(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_completion(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_entry_set_completion(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_buffer(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_entry_set_buffer(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_attributes(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_entry_set_attributes(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_alignment(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_entry_set_alignment(GtkWidget_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_reset_im_context(value self)
{
CAMLparam1(self);


    gtk_entry_reset_im_context(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_progress_pulse(value self)
{
CAMLparam1(self);


    gtk_entry_progress_pulse(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_grab_focus_without_selecting(value self)
{
CAMLparam1(self);


    gboolean result = gtk_entry_grab_focus_without_selecting(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_tabs(value self)
{
CAMLparam1(self);


    void *result = gtk_entry_get_tabs(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_entry_get_input_purpose(value self)
{
CAMLparam1(self);


    GtkInputPurpose result = gtk_entry_get_input_purpose(GtkWidget_val(self));
CAMLreturn(Val_GtkInputPurpose(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_input_hints(value self)
{
CAMLparam1(self);


    GtkInputHints result = gtk_entry_get_input_hints(GtkWidget_val(self));
CAMLreturn(Val_GtkInputHints(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_tooltip_text(value self, value arg1)
{
CAMLparam2(self, arg1);


    void *result = gtk_entry_get_icon_tooltip_text(GtkWidget_val(self), GtkEntryIconPosition_val(arg1));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_tooltip_markup(value self, value arg1)
{
CAMLparam2(self, arg1);


    void *result = gtk_entry_get_icon_tooltip_markup(GtkWidget_val(self), GtkEntryIconPosition_val(arg1));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_storage_type(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkImageType result = gtk_entry_get_icon_storage_type(GtkWidget_val(self), GtkEntryIconPosition_val(arg1));
CAMLreturn(Val_GtkImageType(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_sensitive(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_entry_get_icon_sensitive(GtkWidget_val(self), GtkEntryIconPosition_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_paintable(value self, value arg1)
{
CAMLparam2(self, arg1);


    void *result = gtk_entry_get_icon_paintable(GtkWidget_val(self), GtkEntryIconPosition_val(arg1));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_name(value self, value arg1)
{
CAMLparam2(self, arg1);


    const char* result = gtk_entry_get_icon_name(GtkWidget_val(self), GtkEntryIconPosition_val(arg1));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_gicon(value self, value arg1)
{
CAMLparam2(self, arg1);


    void *result = gtk_entry_get_icon_gicon(GtkWidget_val(self), GtkEntryIconPosition_val(arg1));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_at_pos(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    int result = gtk_entry_get_icon_at_pos(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_area(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_entry_get_icon_area(GtkWidget_val(self), GtkEntryIconPosition_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_activatable(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_entry_get_icon_activatable(GtkWidget_val(self), GtkEntryIconPosition_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_extra_menu(value self)
{
CAMLparam1(self);


    void *result = gtk_entry_get_extra_menu(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_entry_get_current_icon_drag_source(value self)
{
CAMLparam1(self);


    int result = gtk_entry_get_current_icon_drag_source(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_completion(value self)
{
CAMLparam1(self);


    GtkEntryCompletion* result = gtk_entry_get_completion(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_buffer(value self)
{
CAMLparam1(self);


    GtkEntryBuffer* result = gtk_entry_get_buffer(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_attributes(value self)
{
CAMLparam1(self);


    void *result = gtk_entry_get_attributes(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_entry_get_alignment(value self)
{
CAMLparam1(self);


    float result = gtk_entry_get_alignment(GtkWidget_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activates-default", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_activates_default(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activates-default", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_enable_emoji_completion(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "enable-emoji-completion", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_enable_emoji_completion(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "enable-emoji-completion", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-frame", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_has_frame(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-frame", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_im_module(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "im-module", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_im_module(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "im-module", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_invisible_char(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "invisible-char", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_invisible_char(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "invisible-char", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_invisible_char_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "invisible-char-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_invisible_char_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "invisible-char-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_max_length(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "max-length", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_max_length(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-length", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_overwrite_mode(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "overwrite-mode", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_overwrite_mode(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "overwrite-mode", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_placeholder_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "placeholder-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_placeholder_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "placeholder-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_primary_icon_activatable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "primary-icon-activatable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_primary_icon_activatable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-activatable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_primary_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "primary-icon-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_primary_icon_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_primary_icon_sensitive(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "primary-icon-sensitive", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_primary_icon_sensitive(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-sensitive", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_primary_icon_tooltip_markup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "primary-icon-tooltip-markup", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_primary_icon_tooltip_markup(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-tooltip-markup", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_primary_icon_tooltip_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "primary-icon-tooltip-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_primary_icon_tooltip_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-tooltip-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_progress_fraction(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "progress-fraction", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_progress_fraction(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "progress-fraction", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_progress_pulse_step(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "progress-pulse-step", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_progress_pulse_step(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "progress-pulse-step", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_scroll_offset(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "scroll-offset", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_get_secondary_icon_activatable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "secondary-icon-activatable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_secondary_icon_activatable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-activatable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_secondary_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "secondary-icon-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_secondary_icon_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_secondary_icon_sensitive(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "secondary-icon-sensitive", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_secondary_icon_sensitive(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-sensitive", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_secondary_icon_tooltip_markup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "secondary-icon-tooltip-markup", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_secondary_icon_tooltip_markup(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-tooltip-markup", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_secondary_icon_tooltip_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "secondary-icon-tooltip-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_secondary_icon_tooltip_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-tooltip-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_show_emoji_icon(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-emoji-icon", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_show_emoji_icon(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-emoji-icon", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_text_length(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "text-length", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_get_truncate_multiline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "truncate-multiline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_truncate_multiline(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "truncate-multiline", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_visibility(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "visibility", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_visibility(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "visibility", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_set_static_name(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_event_controller_set_static_name(GtkEventController_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_set_propagation_phase(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_event_controller_set_propagation_phase(GtkEventController_val(self), GtkPropagationPhase_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_set_propagation_limit(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_event_controller_set_propagation_limit(GtkEventController_val(self), GtkPropagationLimit_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_reset(value self)
{
CAMLparam1(self);


    gtk_event_controller_reset(GtkEventController_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_event_controller_get_widget(GtkEventController_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_propagation_phase(value self)
{
CAMLparam1(self);


    GtkPropagationPhase result = gtk_event_controller_get_propagation_phase(GtkEventController_val(self));
CAMLreturn(Val_GtkPropagationPhase(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_propagation_limit(value self)
{
CAMLparam1(self);


    GtkPropagationLimit result = gtk_event_controller_get_propagation_limit(GtkEventController_val(self));
CAMLreturn(Val_GtkPropagationLimit(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_current_event_time(value self)
{
CAMLparam1(self);


    void *result = gtk_event_controller_get_current_event_time(GtkEventController_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_current_event_state(value self)
{
CAMLparam1(self);


    GdkModifierType result = gtk_event_controller_get_current_event_state(GtkEventController_val(self));
CAMLreturn(Val_GdkModifierType(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_current_event_device(value self)
{
CAMLparam1(self);


    void *result = gtk_event_controller_get_current_event_device(GtkEventController_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_current_event(value self)
{
CAMLparam1(self);


    GdkEvent* result = gtk_event_controller_get_current_event(GtkEventController_val(self));
CAMLreturn(Val_GdkEvent(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_get_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_event_controller_set_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_focus_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_event_controller_focus_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_event_controller_focus_is_focus(value self)
{
CAMLparam1(self);


    gboolean result = gtk_event_controller_focus_is_focus(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_focus_contains_focus(value self)
{
CAMLparam1(self);


    gboolean result = gtk_event_controller_focus_contains_focus(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_focus_get_contains_focus(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "contains-focus", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_event_controller_focus_get_is_focus(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "is-focus", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_event_controller_key_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_event_controller_key_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_event_controller_key_set_im_context(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_event_controller_key_set_im_context(GtkEventController_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_key_get_im_context(value self)
{
CAMLparam1(self);


    GtkIMContext* result = gtk_event_controller_key_get_im_context(GtkEventController_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_key_get_group(value self)
{
CAMLparam1(self);


    guint result = gtk_event_controller_key_get_group(GtkEventController_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_key_forward(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_event_controller_key_forward(GtkEventController_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_legacy_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_event_controller_legacy_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_event_controller_motion_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_event_controller_motion_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_event_controller_motion_is_pointer(value self)
{
CAMLparam1(self);


    gboolean result = gtk_event_controller_motion_is_pointer(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_motion_contains_pointer(value self)
{
CAMLparam1(self);


    gboolean result = gtk_event_controller_motion_contains_pointer(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_motion_get_contains_pointer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "contains-pointer", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_event_controller_motion_get_is_pointer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "is-pointer", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_event_controller_scroll_new(value arg1)
{
CAMLparam1(arg1);
GtkEventController *controller = gtk_event_controller_scroll_new(GtkEventControllerScrollFlags_val(arg1));
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_event_controller_scroll_set_flags(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_event_controller_scroll_set_flags(GtkEventController_val(self), GtkEventControllerScrollFlags_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_scroll_get_unit(value self)
{
CAMLparam1(self);


    GdkScrollUnit result = gtk_event_controller_scroll_get_unit(GtkEventController_val(self));
CAMLreturn(Val_GdkScrollUnit(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_scroll_get_flags(value self)
{
CAMLparam1(self);


    GtkEventControllerScrollFlags result = gtk_event_controller_scroll_get_flags(GtkEventController_val(self));
CAMLreturn(Val_GtkEventControllerScrollFlags(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_click_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_click_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_gesture_drag_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_drag_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_gesture_drag_get_start_point(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_gesture_drag_get_start_point(GtkEventController_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_drag_get_offset(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_gesture_drag_get_offset(GtkEventController_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_long_press_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_long_press_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_gesture_long_press_get_delay_factor(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "delay-factor", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_long_press_set_delay_factor(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "delay-factor", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_pan_new(value arg1)
{
CAMLparam1(arg1);
GtkEventController *controller = gtk_gesture_pan_new(GtkOrientation_val(arg1));
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_gesture_pan_set_orientation(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_gesture_pan_set_orientation(GtkEventController_val(self), GtkOrientation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_pan_get_orientation(value self)
{
CAMLparam1(self);


    GtkOrientation result = gtk_gesture_pan_get_orientation(GtkEventController_val(self));
CAMLreturn(Val_GtkOrientation(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_rotate_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_rotate_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_gesture_rotate_get_angle_delta(value self)
{
CAMLparam1(self);


    double result = gtk_gesture_rotate_get_angle_delta(GtkEventController_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_current_sequence(value self)
{
CAMLparam1(self);


    void *result = gtk_gesture_single_get_current_sequence(GtkEventController_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_current_button(value self)
{
CAMLparam1(self);


    guint result = gtk_gesture_single_get_current_button(GtkEventController_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_button(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "button", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_set_button(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "button", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_exclusive(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "exclusive", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_set_exclusive(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "exclusive", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_touch_only(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "touch-only", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_set_touch_only(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "touch-only", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_stylus_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_stylus_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_gesture_stylus_get_device_tool(value self)
{
CAMLparam1(self);


    void *result = gtk_gesture_stylus_get_device_tool(GtkEventController_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_gesture_stylus_get_backlog(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_gesture_stylus_get_backlog(GtkEventController_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_stylus_get_axis(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_gesture_stylus_get_axis(GtkEventController_val(self), GdkAxisUse_val(arg1), arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_stylus_get_axes(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_gesture_stylus_get_axes(GtkEventController_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_stylus_get_stylus_only(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "stylus-only", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_stylus_set_stylus_only(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "stylus-only", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_swipe_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_swipe_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_gesture_swipe_get_velocity(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_gesture_swipe_get_velocity(GtkEventController_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_zoom_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_zoom_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_gesture_zoom_get_scale_delta(value self)
{
CAMLparam1(self);


    double result = gtk_gesture_zoom_get_scale_delta(GtkEventController_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_image_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_image_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_image_new_from_file(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_image_new_from_file(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_image_new_from_gicon(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_image_new_from_gicon(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_image_new_from_icon_name(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_image_new_from_icon_name((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_image_new_from_paintable(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_image_new_from_paintable(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_image_new_from_pixbuf(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_image_new_from_pixbuf(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_image_new_from_resource(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_image_new_from_resource(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_image_set_icon_size(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_image_set_icon_size(GtkWidget_val(self), GtkIconSize_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_set_from_resource(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_image_set_from_resource(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_set_from_pixbuf(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_image_set_from_pixbuf(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_set_from_paintable(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_image_set_from_paintable(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_set_from_icon_name(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_image_set_from_icon_name(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_set_from_gicon(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_image_set_from_gicon(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_set_from_file(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_image_set_from_file(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_get_storage_type(value self)
{
CAMLparam1(self);


    GtkImageType result = gtk_image_get_storage_type(GtkWidget_val(self));
CAMLreturn(Val_GtkImageType(result));
}

CAMLexport CAMLprim value ml_gtk_image_get_paintable(value self)
{
CAMLparam1(self);


    void *result = gtk_image_get_paintable(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_image_get_icon_size(value self)
{
CAMLparam1(self);


    GtkIconSize result = gtk_image_get_icon_size(GtkWidget_val(self));
CAMLreturn(Val_GtkIconSize(result));
}

CAMLexport CAMLprim value ml_gtk_image_get_gicon(value self)
{
CAMLparam1(self);


    void *result = gtk_image_get_gicon(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_image_clear(value self)
{
CAMLparam1(self);


    gtk_image_clear(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_get_file(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "file", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_image_set_file(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "file", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "icon-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_image_set_icon_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_get_pixel_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixel-size", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_image_set_pixel_size(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixel-size", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_get_resource(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "resource", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_image_set_resource(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "resource", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_get_use_fallback(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-fallback", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_image_set_use_fallback(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-fallback", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_label_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_label_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_label_new_with_mnemonic((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_label_set_wrap_mode(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_wrap_mode(GtkWidget_val(self), PangoWrapMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_text_with_mnemonic(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_text_with_mnemonic(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_text(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_text(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_tabs(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_tabs(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_natural_wrap_mode(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_natural_wrap_mode(GtkWidget_val(self), GtkNaturalWrapMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_mnemonic_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_mnemonic_widget(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_markup_with_mnemonic(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_markup_with_mnemonic(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_markup(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_markup(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_justify(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_justify(GtkWidget_val(self), GtkJustification_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_extra_menu(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_extra_menu(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_ellipsize(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_ellipsize(GtkWidget_val(self), PangoEllipsizeMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_attributes(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_attributes(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_select_region(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_label_select_region(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_wrap_mode(value self)
{
CAMLparam1(self);


    PangoWrapMode result = gtk_label_get_wrap_mode(GtkWidget_val(self));
CAMLreturn(Val_PangoWrapMode(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_text(value self)
{
CAMLparam1(self);


    const char* result = gtk_label_get_text(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_tabs(value self)
{
CAMLparam1(self);


    void *result = gtk_label_get_tabs(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_label_get_selection_bounds(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_label_get_selection_bounds(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_natural_wrap_mode(value self)
{
CAMLparam1(self);


    GtkNaturalWrapMode result = gtk_label_get_natural_wrap_mode(GtkWidget_val(self));
CAMLreturn(Val_GtkNaturalWrapMode(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_mnemonic_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_label_get_mnemonic_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_layout_offsets(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_label_get_layout_offsets(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_layout(value self)
{
CAMLparam1(self);


    void *result = gtk_label_get_layout(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_label_get_justify(value self)
{
CAMLparam1(self);


    GtkJustification result = gtk_label_get_justify(GtkWidget_val(self));
CAMLreturn(Val_GtkJustification(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_extra_menu(value self)
{
CAMLparam1(self);


    void *result = gtk_label_get_extra_menu(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_label_get_ellipsize(value self)
{
CAMLparam1(self);


    PangoEllipsizeMode result = gtk_label_get_ellipsize(GtkWidget_val(self));
CAMLreturn(Val_PangoEllipsizeMode(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_current_uri(value self)
{
CAMLparam1(self);


    const char* result = gtk_label_get_current_uri(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_attributes(value self)
{
CAMLparam1(self);


    void *result = gtk_label_get_attributes(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_label_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "lines", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_lines(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "lines", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_max_width_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "max-width-chars", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_max_width_chars(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-width-chars", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_mnemonic_keyval(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "mnemonic-keyval", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_get_selectable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "selectable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_selectable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "selectable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_single_line_mode(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "single-line-mode", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_single_line_mode(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "single-line-mode", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_use_markup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-markup", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_use_markup(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-markup", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-underline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_use_underline(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-underline", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_width_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "width-chars", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_width_chars(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "width-chars", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_wrap(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "wrap", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_wrap(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "wrap", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_xalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "xalign", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_xalign(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "xalign", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_yalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "yalign", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_yalign(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "yalign", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_level_bar_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_level_bar_new_for_interval(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_level_bar_new_for_interval(Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_level_bar_set_mode(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_level_bar_set_mode(GtkWidget_val(self), GtkLevelBarMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_remove_offset_value(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_level_bar_remove_offset_value(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_offset_value(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_level_bar_get_offset_value(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_mode(value self)
{
CAMLparam1(self);


    GtkLevelBarMode result = gtk_level_bar_get_mode(GtkWidget_val(self));
CAMLreturn(Val_GtkLevelBarMode(result));
}

CAMLexport CAMLprim value ml_gtk_level_bar_add_offset_value(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_level_bar_add_offset_value(GtkWidget_val(self), String_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_inverted(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "inverted", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_level_bar_set_inverted(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "inverted", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_max_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "max-value", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_level_bar_set_max_value(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "max-value", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_min_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "min-value", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_level_bar_set_min_value(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "min-value", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_level_bar_get_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "value", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_level_bar_set_value(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "value", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_link_button_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_link_button_new(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_link_button_new_with_label(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_link_button_new_with_label(String_val(arg1), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_link_button_get_uri(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "uri", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_link_button_set_uri(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "uri", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_link_button_get_visited(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "visited", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_link_button_set_visited(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "visited", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_menu_button_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_popover(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_menu_button_set_popover(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_menu_model(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_menu_button_set_menu_model(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_direction(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_menu_button_set_direction(GtkWidget_val(self), GtkArrowType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_create_popup_func(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_menu_button_set_create_popup_func(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_menu_button_set_child(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_popup(value self)
{
CAMLparam1(self);


    gtk_menu_button_popup(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_popdown(value self)
{
CAMLparam1(self);


    gtk_menu_button_popdown(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_popover(value self)
{
CAMLparam1(self);


    GtkPopover* result = gtk_menu_button_get_popover(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_menu_model(value self)
{
CAMLparam1(self);


    void *result = gtk_menu_button_get_menu_model(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_direction(value self)
{
CAMLparam1(self);


    GtkArrowType result = gtk_menu_button_get_direction(GtkWidget_val(self));
CAMLreturn(Val_GtkArrowType(result));
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_child(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_menu_button_get_child(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "active", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_active(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "active", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_always_show_arrow(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "always-show-arrow", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_always_show_arrow(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "always-show-arrow", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_can_shrink(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "can-shrink", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_can_shrink(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "can-shrink", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-frame", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_has_frame(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-frame", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "icon-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_icon_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_primary(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "primary", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_primary(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "primary", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_menu_button_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-underline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_menu_button_set_use_underline(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-underline", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_password_entry_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_password_entry_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_password_entry_set_extra_menu(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_password_entry_set_extra_menu(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_password_entry_get_extra_menu(value self)
{
CAMLparam1(self);


    void *result = gtk_password_entry_get_extra_menu(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_password_entry_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activates-default", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_password_entry_set_activates_default(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activates-default", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_password_entry_get_placeholder_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "placeholder-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_password_entry_set_placeholder_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "placeholder-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_password_entry_get_show_peek_icon(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-peek-icon", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_password_entry_set_show_peek_icon(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-peek-icon", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_progress_bar_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_ellipsize(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_progress_bar_set_ellipsize(GtkWidget_val(self), PangoEllipsizeMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_pulse(value self)
{
CAMLparam1(self);


    gtk_progress_bar_pulse(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_ellipsize(value self)
{
CAMLparam1(self);


    PangoEllipsizeMode result = gtk_progress_bar_get_ellipsize(GtkWidget_val(self));
CAMLreturn(Val_PangoEllipsizeMode(result));
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_fraction(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "fraction", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_fraction(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "fraction", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_inverted(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "inverted", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_inverted(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "inverted", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_pulse_step(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "pulse-step", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_pulse_step(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "pulse-step", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_show_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-text", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_show_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_get_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_progress_bar_set_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_set_value(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_range_set_value(GtkWidget_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_set_slider_size_fixed(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_range_set_slider_size_fixed(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_set_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_range_set_range(GtkWidget_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_set_increments(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_range_set_increments(GtkWidget_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_set_flippable(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_range_set_flippable(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_set_adjustment(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_range_set_adjustment(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_get_value(value self)
{
CAMLparam1(self);


    double result = gtk_range_get_value(GtkWidget_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_range_get_slider_size_fixed(value self)
{
CAMLparam1(self);


    gboolean result = gtk_range_get_slider_size_fixed(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_range_get_slider_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_range_get_slider_range(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_get_range_rect(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_range_get_range_rect(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_get_flippable(value self)
{
CAMLparam1(self);


    gboolean result = gtk_range_get_flippable(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_range_get_adjustment(value self)
{
CAMLparam1(self);


    GtkAdjustment* result = gtk_range_get_adjustment(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_range_get_fill_level(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "fill-level", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_range_set_fill_level(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "fill-level", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_get_inverted(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "inverted", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_range_set_inverted(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "inverted", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_get_restrict_to_fill_level(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "restrict-to-fill-level", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_range_set_restrict_to_fill_level(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "restrict-to-fill-level", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_get_round_digits(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "round-digits", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_range_set_round_digits(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "round-digits", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_range_get_show_fill_level(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-fill-level", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_range_set_show_fill_level(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-fill-level", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_scale_new(GtkOrientation_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_scale_new_with_range(value arg1, value arg2, value arg3, value arg4)
{
CAMLparam4(arg1, arg2, arg3, arg4);
GtkWidget *widget = gtk_scale_new_with_range(GtkOrientation_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_scale_set_value_pos(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_scale_set_value_pos(GtkWidget_val(self), GtkPositionType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_set_format_value_func(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_scale_set_format_value_func(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_get_value_pos(value self)
{
CAMLparam1(self);


    GtkPositionType result = gtk_scale_get_value_pos(GtkWidget_val(self));
CAMLreturn(Val_GtkPositionType(result));
}

CAMLexport CAMLprim value ml_gtk_scale_get_layout_offsets(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_scale_get_layout_offsets(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_get_layout(value self)
{
CAMLparam1(self);


    void *result = gtk_scale_get_layout(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_scale_clear_marks(value self)
{
CAMLparam1(self);


    gtk_scale_clear_marks(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_add_mark(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_scale_add_mark(GtkWidget_val(self), Double_val(arg1), GtkPositionType_val(arg2), (Is_some(arg3) ? String_val(Some_val(arg3)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_get_digits(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "digits", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scale_set_digits(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "digits", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_get_draw_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "draw-value", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scale_set_draw_value(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "draw-value", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scale_get_has_origin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-origin", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_scale_set_has_origin(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-origin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_entry_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_search_entry_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_search_entry_set_key_capture_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_search_entry_set_key_capture_widget(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_entry_set_input_purpose(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_search_entry_set_input_purpose(GtkWidget_val(self), GtkInputPurpose_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_entry_set_input_hints(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_search_entry_set_input_hints(GtkWidget_val(self), GtkInputHints_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_entry_get_key_capture_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_search_entry_get_key_capture_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_search_entry_get_input_purpose(value self)
{
CAMLparam1(self);


    GtkInputPurpose result = gtk_search_entry_get_input_purpose(GtkWidget_val(self));
CAMLreturn(Val_GtkInputPurpose(result));
}

CAMLexport CAMLprim value ml_gtk_search_entry_get_input_hints(value self)
{
CAMLparam1(self);


    GtkInputHints result = gtk_search_entry_get_input_hints(GtkWidget_val(self));
CAMLreturn(Val_GtkInputHints(result));
}

CAMLexport CAMLprim value ml_gtk_search_entry_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activates-default", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_search_entry_set_activates_default(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activates-default", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_entry_get_placeholder_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "placeholder-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_search_entry_set_placeholder_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "placeholder-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_entry_get_search_delay(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "search-delay", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_search_entry_set_search_delay(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "search-delay", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkWidget *widget = gtk_spin_button_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), Double_val(arg2), Int_val(arg3));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_spin_button_new_with_range(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkWidget *widget = gtk_spin_button_new_with_range(Double_val(arg1), Double_val(arg2), Double_val(arg3));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_spin_button_update(value self)
{
CAMLparam1(self);


    gtk_spin_button_update(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_spin(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_spin_button_spin(GtkWidget_val(self), GtkSpinType_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_update_policy(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_spin_button_set_update_policy(GtkWidget_val(self), GtkSpinButtonUpdatePolicy_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_spin_button_set_range(GtkWidget_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_increments(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_spin_button_set_increments(GtkWidget_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_adjustment(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_spin_button_set_adjustment(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_value_as_int(value self)
{
CAMLparam1(self);


    int result = gtk_spin_button_get_value_as_int(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_update_policy(value self)
{
CAMLparam1(self);


    GtkSpinButtonUpdatePolicy result = gtk_spin_button_get_update_policy(GtkWidget_val(self));
CAMLreturn(Val_GtkSpinButtonUpdatePolicy(result));
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_spin_button_get_range(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_increments(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_spin_button_get_increments(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_adjustment(value self)
{
CAMLparam1(self);


    GtkAdjustment* result = gtk_spin_button_get_adjustment(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_spin_button_configure(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_spin_button_configure(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), Double_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activates-default", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_activates_default(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activates-default", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_climb_rate(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "climb-rate", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_climb_rate(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "climb-rate", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_digits(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "digits", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_digits(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "digits", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_numeric(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "numeric", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_numeric(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "numeric", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_snap_to_ticks(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "snap-to-ticks", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_snap_to_ticks(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "snap-to-ticks", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "value", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_value(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "value", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spin_button_get_wrap(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "wrap", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_spin_button_set_wrap(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "wrap", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_switch_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_switch_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_switch_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "active", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_switch_set_active(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "active", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_switch_get_state(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "state", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_switch_set_state(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "state", c_value, NULL);
CAMLreturn(Val_unit);
}

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

CAMLexport CAMLprim value ml_gtk_text_buffer_get_slice(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    void *result = gtk_text_buffer_get_slice(GtkWidget_val(self), arg1, arg2, Bool_val(arg3));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_selection_content(value self)
{
CAMLparam1(self);


    void *result = gtk_text_buffer_get_selection_content(GtkWidget_val(self));
CAMLreturn((value)result);
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

CAMLexport CAMLprim value ml_gtk_text_tag_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_text_tag_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_priority(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_tag_set_priority(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_priority(value self)
{
CAMLparam1(self);


    int result = gtk_text_tag_get_priority(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_text_tag_changed(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_tag_changed(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_accumulative_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "accumulative-margin", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_accumulative_margin(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "accumulative-margin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_allow_breaks(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "allow-breaks", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_allow_breaks(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "allow-breaks", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_allow_breaks_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "allow-breaks-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_allow_breaks_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "allow-breaks-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_background(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "background", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_background(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "background", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_background_full_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "background-full-height", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_background_full_height(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "background-full-height", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_background_full_height_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "background-full-height-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_background_full_height_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "background-full-height-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_background_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "background-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_background_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "background-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_editable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "editable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_editable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "editable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_editable_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "editable-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_editable_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "editable-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_fallback(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "fallback", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_fallback(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "fallback", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_fallback_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "fallback-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_fallback_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "fallback-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_family(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "family", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_family(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "family", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_family_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "family-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_family_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "family-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_font(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "font", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_font(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "font", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_font_features(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "font-features", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_font_features(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "font-features", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_font_features_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "font-features-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_font_features_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "font-features-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_foreground(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "foreground", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_foreground(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "foreground", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_foreground_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "foreground-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_foreground_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "foreground-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_indent(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "indent", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_indent(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "indent", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_indent_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "indent-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_indent_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "indent-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_insert_hyphens(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "insert-hyphens", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_insert_hyphens(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "insert-hyphens", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_insert_hyphens_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "insert-hyphens-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_insert_hyphens_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "insert-hyphens-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_invisible(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "invisible", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_invisible(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "invisible", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_invisible_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "invisible-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_invisible_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "invisible-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_justification_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "justification-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_justification_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "justification-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_language(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "language", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_language(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "language", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_language_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "language-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_language_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "language-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_left_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "left-margin", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_left_margin(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "left-margin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_left_margin_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "left-margin-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_left_margin_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "left-margin-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_letter_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "letter-spacing", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_letter_spacing(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "letter-spacing", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_letter_spacing_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "letter-spacing-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_letter_spacing_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "letter-spacing-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_line_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "line-height", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_line_height(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "line-height", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_line_height_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "line-height-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_line_height_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "line-height-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_overline_rgba_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "overline-rgba-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_overline_rgba_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "overline-rgba-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_overline_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "overline-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_overline_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "overline-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_paragraph_background(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "paragraph-background", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_paragraph_background(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "paragraph-background", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_paragraph_background_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "paragraph-background-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_paragraph_background_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "paragraph-background-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_pixels_above_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixels-above-lines", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_pixels_above_lines(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-above-lines", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_pixels_above_lines_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "pixels-above-lines-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_pixels_above_lines_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-above-lines-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_pixels_below_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixels-below-lines", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_pixels_below_lines(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-below-lines", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_pixels_below_lines_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "pixels-below-lines-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_pixels_below_lines_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-below-lines-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_pixels_inside_wrap(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixels-inside-wrap", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_pixels_inside_wrap(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-inside-wrap", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_pixels_inside_wrap_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "pixels-inside-wrap-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_pixels_inside_wrap_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-inside-wrap-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_right_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "right-margin", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_right_margin(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "right-margin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_right_margin_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "right-margin-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_right_margin_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "right-margin-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_rise(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "rise", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_rise(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "rise", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_rise_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "rise-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_rise_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "rise-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_scale(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "scale", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_scale(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "scale", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_scale_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "scale-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_scale_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "scale-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_sentence(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "sentence", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_sentence(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "sentence", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_sentence_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "sentence-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_sentence_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "sentence-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_show_spaces_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-spaces-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_show_spaces_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-spaces-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "size", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_size(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "size", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_size_points(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "size-points", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_size_points(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "size-points", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_size_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "size-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_size_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "size-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_stretch_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "stretch-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_stretch_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "stretch-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_strikethrough(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "strikethrough", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_strikethrough(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "strikethrough", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_strikethrough_rgba_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "strikethrough-rgba-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_strikethrough_rgba_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "strikethrough-rgba-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_strikethrough_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "strikethrough-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_strikethrough_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "strikethrough-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_style_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "style-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_style_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "style-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_tabs_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "tabs-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_tabs_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "tabs-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_text_transform_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "text-transform-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_text_transform_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "text-transform-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_underline_rgba_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "underline-rgba-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_underline_rgba_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "underline-rgba-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_underline_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "underline-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_underline_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "underline-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_variant_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "variant-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_variant_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "variant-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_weight(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "weight", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_weight(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "weight", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_weight_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "weight-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_weight_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "weight-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_word(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "word", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_word(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "word", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_word_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "word-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_word_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "word-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_get_wrap_mode_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "wrap-mode-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_tag_set_wrap_mode_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "wrap-mode-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_text_tag_table_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_remove(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_tag_table_remove(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_lookup(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkTextTag* result = gtk_text_tag_table_lookup(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_get_size(value self)
{
CAMLparam1(self);


    int result = gtk_text_tag_table_get_size(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_foreach(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_tag_table_foreach(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_tag_table_add(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_text_tag_table_add(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_text_view_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_text_view_new_with_buffer(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_text_view_new_with_buffer(GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_text_view_window_to_buffer_coords_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_text_view_window_to_buffer_coords(GtkWidget_val(self), GtkTextWindowType_val(arg1), Int_val(arg2), Int_val(arg3), arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_window_to_buffer_coords_bytecode(value * argv, int argn)
{
return ml_gtk_text_view_window_to_buffer_coords_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_text_view_starts_display_line(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_text_view_starts_display_line(GtkWidget_val(self), arg1);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_set_wrap_mode(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_view_set_wrap_mode(GtkWidget_val(self), GtkWrapMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_tabs(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_view_set_tabs(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_justification(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_view_set_justification(GtkWidget_val(self), GtkJustification_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_input_purpose(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_view_set_input_purpose(GtkWidget_val(self), GtkInputPurpose_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_input_hints(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_view_set_input_hints(GtkWidget_val(self), GtkInputHints_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_gutter(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_view_set_gutter(GtkWidget_val(self), GtkTextWindowType_val(arg1), GtkWidget_option_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_extra_menu(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_view_set_extra_menu(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_buffer(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_view_set_buffer(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_scroll_to_mark_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_text_view_scroll_to_mark(GtkWidget_val(self), GtkWidget_val(arg1), Double_val(arg2), Bool_val(arg3), Double_val(arg4), Double_val(arg5));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_scroll_to_mark_bytecode(value * argv, int argn)
{
return ml_gtk_text_view_scroll_to_mark_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_text_view_scroll_to_iter_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gboolean result = gtk_text_view_scroll_to_iter(GtkWidget_val(self), GtkWidget_val(arg1), Double_val(arg2), Bool_val(arg3), Double_val(arg4), Double_val(arg5));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_scroll_to_iter_bytecode(value * argv, int argn)
{
return ml_gtk_text_view_scroll_to_iter_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_text_view_scroll_mark_onscreen(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_view_scroll_mark_onscreen(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_reset_im_context(value self)
{
CAMLparam1(self);


    gtk_text_view_reset_im_context(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_reset_cursor_blink(value self)
{
CAMLparam1(self);


    gtk_text_view_reset_cursor_blink(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_remove(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_view_remove(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_place_cursor_onscreen(value self)
{
CAMLparam1(self);


    gboolean result = gtk_text_view_place_cursor_onscreen(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_move_visually(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_text_view_move_visually(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_move_overlay(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_view_move_overlay(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_move_mark_onscreen(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_text_view_move_mark_onscreen(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_im_context_filter_keypress(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_text_view_im_context_filter_keypress(GtkWidget_val(self), GdkEvent_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_get_wrap_mode(value self)
{
CAMLparam1(self);


    GtkWrapMode result = gtk_text_view_get_wrap_mode(GtkWidget_val(self));
CAMLreturn(Val_GtkWrapMode(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_get_visible_rect(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_view_get_visible_rect(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_tabs(value self)
{
CAMLparam1(self);


    void *result = gtk_text_view_get_tabs(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_rtl_context(value self)
{
CAMLparam1(self);


    void *result = gtk_text_view_get_rtl_context(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_ltr_context(value self)
{
CAMLparam1(self);


    void *result = gtk_text_view_get_ltr_context(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_line_yrange(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_view_get_line_yrange(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_line_at_y(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_view_get_line_at_y(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_justification(value self)
{
CAMLparam1(self);


    GtkJustification result = gtk_text_view_get_justification(GtkWidget_val(self));
CAMLreturn(Val_GtkJustification(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_get_iter_location(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_view_get_iter_location(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_iter_at_position(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gboolean result = gtk_text_view_get_iter_at_position(GtkWidget_val(self), GtkWidget_val(arg1), arg2, Int_val(arg3), Int_val(arg4));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_get_iter_at_location(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_text_view_get_iter_at_location(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_get_input_purpose(value self)
{
CAMLparam1(self);


    GtkInputPurpose result = gtk_text_view_get_input_purpose(GtkWidget_val(self));
CAMLreturn(Val_GtkInputPurpose(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_get_input_hints(value self)
{
CAMLparam1(self);


    GtkInputHints result = gtk_text_view_get_input_hints(GtkWidget_val(self));
CAMLreturn(Val_GtkInputHints(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_get_gutter(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkWidget* result = gtk_text_view_get_gutter(GtkWidget_val(self), GtkTextWindowType_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_get_extra_menu(value self)
{
CAMLparam1(self);


    void *result = gtk_text_view_get_extra_menu(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_cursor_locations(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_view_get_cursor_locations(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_buffer(value self)
{
CAMLparam1(self);


    GtkTextBuffer* result = gtk_text_view_get_buffer(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_forward_display_line_end(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_text_view_forward_display_line_end(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_forward_display_line(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_text_view_forward_display_line(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_buffer_to_window_coords_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_text_view_buffer_to_window_coords(GtkWidget_val(self), GtkTextWindowType_val(arg1), Int_val(arg2), Int_val(arg3), arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_buffer_to_window_coords_bytecode(value * argv, int argn)
{
return ml_gtk_text_view_buffer_to_window_coords_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_text_view_backward_display_line_start(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_text_view_backward_display_line_start(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_backward_display_line(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_text_view_backward_display_line(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_view_add_overlay(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_view_add_overlay(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_add_child_at_anchor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_view_add_child_at_anchor(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_accepts_tab(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "accepts-tab", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_accepts_tab(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "accepts-tab", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_bottom_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "bottom-margin", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_bottom_margin(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "bottom-margin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_cursor_visible(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "cursor-visible", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_cursor_visible(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "cursor-visible", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_editable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "editable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_editable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "editable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_im_module(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "im-module", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_im_module(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "im-module", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_indent(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "indent", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_indent(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "indent", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_left_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "left-margin", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_left_margin(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "left-margin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_monospace(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "monospace", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_monospace(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "monospace", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_overwrite(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "overwrite", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_overwrite(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "overwrite", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_pixels_above_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixels-above-lines", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_pixels_above_lines(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-above-lines", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_pixels_below_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixels-below-lines", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_pixels_below_lines(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-below-lines", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_pixels_inside_wrap(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixels-inside-wrap", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_pixels_inside_wrap(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-inside-wrap", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_right_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "right-margin", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_right_margin(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "right-margin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_view_get_top_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "top-margin", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_view_set_top_margin(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "top-margin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_toggle_button_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_toggle_button_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_toggle_button_new_with_label(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_toggle_button_new_with_label(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_toggle_button_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_toggle_button_new_with_mnemonic(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_toggle_button_toggled(value self)
{
CAMLparam1(self);


    gtk_toggle_button_toggled(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_toggle_button_set_group(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_toggle_button_set_group(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_toggle_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "active", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_toggle_button_set_active(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "active", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_update_state_value(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_accessible_update_state_value(GtkWidget_val(self), Int_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_update_relation_value(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_accessible_update_relation_value(GtkWidget_val(self), Int_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_update_property_value(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_accessible_update_property_value(GtkWidget_val(self), Int_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_update_next_accessible_sibling(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_accessible_update_next_accessible_sibling(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_set_accessible_parent(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_accessible_set_accessible_parent(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_reset_state(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_accessible_reset_state(GtkWidget_val(self), GtkAccessibleState_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_reset_relation(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_accessible_reset_relation(GtkWidget_val(self), GtkAccessibleRelation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_reset_property(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_accessible_reset_property(GtkWidget_val(self), GtkAccessibleProperty_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_get_platform_state(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_accessible_get_platform_state(GtkWidget_val(self), GtkAccessiblePlatformState_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_next_accessible_sibling(value self)
{
CAMLparam1(self);


    GtkAccessible* result = gtk_accessible_get_next_accessible_sibling(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_first_accessible_child(value self)
{
CAMLparam1(self);


    GtkAccessible* result = gtk_accessible_get_first_accessible_child(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_bounds(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gboolean result = gtk_accessible_get_bounds(GtkWidget_val(self), arg1, arg2, arg3, arg4);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_at_context(value self)
{
CAMLparam1(self);


    GtkATContext* result = gtk_accessible_get_at_context(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_accessible_role(value self)
{
CAMLparam1(self);


    GtkAccessibleRole result = gtk_accessible_get_accessible_role(GtkWidget_val(self));
CAMLreturn(Val_GtkAccessibleRole(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_accessible_parent(value self)
{
CAMLparam1(self);


    GtkAccessible* result = gtk_accessible_get_accessible_parent(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_announce(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_accessible_announce(GtkWidget_val(self), String_val(arg1), GtkAccessibleAnnouncementPriority_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_text_update_selection_bound(value self)
{
CAMLparam1(self);


    gtk_accessible_text_update_selection_bound(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_text_update_contents(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_accessible_text_update_contents(GtkWidget_val(self), GtkAccessibleTextContentChange_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_text_update_caret_position(value self)
{
CAMLparam1(self);


    gtk_accessible_text_update_caret_position(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_actionable_set_detailed_action_name(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_actionable_set_detailed_action_name(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_actionable_set_action_target_value(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_actionable_set_action_target_value(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_actionable_get_action_target_value(value self)
{
CAMLparam1(self);


    void *result = gtk_actionable_get_action_target_value(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_actionable_get_action_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "action-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_actionable_set_action_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "action-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_refresh(value self)
{
CAMLparam1(self);


    gtk_app_chooser_refresh(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_get_app_info(value self)
{
CAMLparam1(self);


    void *result = gtk_app_chooser_get_app_info(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_get_content_type(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "content-type", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_buildable_get_buildable_id(value self)
{
CAMLparam1(self);


    const char* result = gtk_buildable_get_buildable_id(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_cell_editable_start_editing(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_editable_start_editing(GtkWidget_val(self), (Is_some(arg1) ? GdkEvent_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_editable_remove_widget(value self)
{
CAMLparam1(self);


    gtk_cell_editable_remove_widget(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_editable_editing_done(value self)
{
CAMLparam1(self);


    gtk_cell_editable_editing_done(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_editable_get_editing_canceled(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "editing-canceled", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_editable_set_editing_canceled(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "editing-canceled", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_set_cell_data_func(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_cell_layout_set_cell_data_func(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3, arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_reorder(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_layout_reorder(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_pack_start(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_layout_pack_start(GtkWidget_val(self), GtkWidget_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_pack_end(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_cell_layout_pack_end(GtkWidget_val(self), GtkWidget_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_get_cells(value self)
{
CAMLparam1(self);


    void *result = gtk_cell_layout_get_cells(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_get_area(value self)
{
CAMLparam1(self);


    GtkCellArea* result = gtk_cell_layout_get_area(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_cell_layout_clear_attributes(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_cell_layout_clear_attributes(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_clear(value self)
{
CAMLparam1(self);


    gtk_cell_layout_clear(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_layout_add_attribute(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_cell_layout_add_attribute(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_chooser_set_rgba(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_color_chooser_set_rgba(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_chooser_get_rgba(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_color_chooser_get_rgba(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_chooser_add_palette(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_color_chooser_add_palette(GtkWidget_val(self), GtkOrientation_val(arg1), Int_val(arg2), Int_val(arg3), arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_chooser_get_use_alpha(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-alpha", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_color_chooser_set_use_alpha(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-alpha", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_set_position(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_editable_set_position(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_set_alignment(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_editable_set_alignment(GtkWidget_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_select_region(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_editable_select_region(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_insert_text(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_editable_insert_text(GtkWidget_val(self), String_val(arg1), Int_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_init_delegate(value self)
{
CAMLparam1(self);


    gtk_editable_init_delegate(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_get_selection_bounds(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_editable_get_selection_bounds(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_editable_get_position(value self)
{
CAMLparam1(self);


    int result = gtk_editable_get_position(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_editable_get_delegate(value self)
{
CAMLparam1(self);


    GtkEditable* result = gtk_editable_get_delegate(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_editable_get_chars(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    void *result = gtk_editable_get_chars(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_editable_get_alignment(value self)
{
CAMLparam1(self);


    float result = gtk_editable_get_alignment(GtkWidget_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_editable_finish_delegate(value self)
{
CAMLparam1(self);


    gtk_editable_finish_delegate(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_delete_text(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_editable_delete_text(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_delete_selection(value self)
{
CAMLparam1(self);


    gtk_editable_delete_selection(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_delegate_get_accessible_platform_state(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_editable_delegate_get_accessible_platform_state(GtkWidget_val(self), GtkAccessiblePlatformState_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_editable_get_cursor_position(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "cursor-position", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_get_editable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "editable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_set_editable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "editable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_get_enable_undo(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "enable-undo", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_set_enable_undo(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "enable-undo", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_get_max_width_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "max-width-chars", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_set_max_width_chars(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-width-chars", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_get_selection_bound(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "selection-bound", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_get_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_set_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_get_width_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "width-chars", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_set_width_chars(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "width-chars", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_get_xalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "xalign", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_set_xalign(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "xalign", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_filter(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_file_chooser_set_filter(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_file(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;


    gboolean result = gtk_file_chooser_set_file(GtkWidget_val(self), arg1, &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_current_name(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_file_chooser_set_current_name(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_current_folder(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;


    gboolean result = gtk_file_chooser_set_current_folder(GtkWidget_val(self), arg1, &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_choice(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_file_chooser_set_choice(GtkWidget_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_action(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_file_chooser_set_action(GtkWidget_val(self), GtkFileChooserAction_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_remove_shortcut_folder(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;


    gboolean result = gtk_file_chooser_remove_shortcut_folder(GtkWidget_val(self), arg1, &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_remove_filter(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_file_chooser_remove_filter(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_remove_choice(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_file_chooser_remove_choice(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_shortcut_folders(value self)
{
CAMLparam1(self);


    void *result = gtk_file_chooser_get_shortcut_folders(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_filters(value self)
{
CAMLparam1(self);


    void *result = gtk_file_chooser_get_filters(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_filter(value self)
{
CAMLparam1(self);


    GtkFileFilter* result = gtk_file_chooser_get_filter(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_files(value self)
{
CAMLparam1(self);


    void *result = gtk_file_chooser_get_files(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_file(value self)
{
CAMLparam1(self);


    void *result = gtk_file_chooser_get_file(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_current_name(value self)
{
CAMLparam1(self);


    void *result = gtk_file_chooser_get_current_name(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_current_folder(value self)
{
CAMLparam1(self);


    void *result = gtk_file_chooser_get_current_folder(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_choice(value self, value arg1)
{
CAMLparam2(self, arg1);


    const char* result = gtk_file_chooser_get_choice(GtkWidget_val(self), String_val(arg1));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_action(value self)
{
CAMLparam1(self);


    GtkFileChooserAction result = gtk_file_chooser_get_action(GtkWidget_val(self));
CAMLreturn(Val_GtkFileChooserAction(result));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_add_shortcut_folder(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;


    gboolean result = gtk_file_chooser_add_shortcut_folder(GtkWidget_val(self), arg1, &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_add_filter(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_file_chooser_add_filter(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_add_choice(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_file_chooser_add_choice(GtkWidget_val(self), String_val(arg1), String_val(arg2), arg3, arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_create_folders(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "create-folders", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_create_folders(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "create-folders", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_select_multiple(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "select-multiple", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_select_multiple(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "select-multiple", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_level(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_font_chooser_set_level(GtkWidget_val(self), GtkFontChooserLevel_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_font_map(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_font_chooser_set_font_map(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_font_desc(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_font_chooser_set_font_desc(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_filter_func(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_font_chooser_set_filter_func(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_level(value self)
{
CAMLparam1(self);


    GtkFontChooserLevel result = gtk_font_chooser_get_level(GtkWidget_val(self));
CAMLreturn(Val_GtkFontChooserLevel(result));
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_font_size(value self)
{
CAMLparam1(self);


    int result = gtk_font_chooser_get_font_size(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_font_map(value self)
{
CAMLparam1(self);


    void *result = gtk_font_chooser_get_font_map(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_font_family(value self)
{
CAMLparam1(self);


    void *result = gtk_font_chooser_get_font_family(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_font_face(value self)
{
CAMLparam1(self);


    void *result = gtk_font_chooser_get_font_face(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_font_desc(value self)
{
CAMLparam1(self);


    void *result = gtk_font_chooser_get_font_desc(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_font(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "font", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_font(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "font", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_font_features(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "font-features", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_language(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "language", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_language(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "language", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_preview_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "preview-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_preview_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "preview-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_get_show_preview_entry(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-preview-entry", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_font_chooser_set_show_preview_entry(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-preview-entry", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_native_unrealize(value self)
{
CAMLparam1(self);


    gtk_native_unrealize(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_native_realize(value self)
{
CAMLparam1(self);


    gtk_native_realize(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_native_get_surface_transform(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_native_get_surface_transform(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_native_get_surface(value self)
{
CAMLparam1(self);


    void *result = gtk_native_get_surface(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_native_get_renderer(value self)
{
CAMLparam1(self);


    void *result = gtk_native_get_renderer(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_orientable_set_orientation(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_orientable_set_orientation(GtkWidget_val(self), GtkOrientation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_orientable_get_orientation(value self)
{
CAMLparam1(self);


    GtkOrientation result = gtk_orientable_get_orientation(GtkWidget_val(self));
CAMLreturn(Val_GtkOrientation(result));
}

CAMLexport CAMLprim value ml_gtk_print_operation_preview_render_page(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_operation_preview_render_page(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_preview_is_selected(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_print_operation_preview_is_selected(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_print_operation_preview_end_preview(value self)
{
CAMLparam1(self);


    gtk_print_operation_preview_end_preview(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_root_set_focus(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_root_set_focus(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_root_get_focus(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_root_get_focus(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_root_get_display(value self)
{
CAMLparam1(self);


    void *result = gtk_root_get_display(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_scrollable_set_vscroll_policy(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_scrollable_set_vscroll_policy(GtkWidget_val(self), GtkScrollablePolicy_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrollable_set_vadjustment(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_scrollable_set_vadjustment(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrollable_set_hscroll_policy(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_scrollable_set_hscroll_policy(GtkWidget_val(self), GtkScrollablePolicy_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrollable_set_hadjustment(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_scrollable_set_hadjustment(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrollable_get_vscroll_policy(value self)
{
CAMLparam1(self);


    GtkScrollablePolicy result = gtk_scrollable_get_vscroll_policy(GtkWidget_val(self));
CAMLreturn(Val_GtkScrollablePolicy(result));
}

CAMLexport CAMLprim value ml_gtk_scrollable_get_vadjustment(value self)
{
CAMLparam1(self);


    GtkAdjustment* result = gtk_scrollable_get_vadjustment(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_scrollable_get_hscroll_policy(value self)
{
CAMLparam1(self);


    GtkScrollablePolicy result = gtk_scrollable_get_hscroll_policy(GtkWidget_val(self));
CAMLreturn(Val_GtkScrollablePolicy(result));
}

CAMLexport CAMLprim value ml_gtk_scrollable_get_hadjustment(value self)
{
CAMLparam1(self);


    GtkAdjustment* result = gtk_scrollable_get_hadjustment(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_scrollable_get_border(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_scrollable_get_border(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_section_model_sections_changed(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_section_model_sections_changed(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_section_model_get_section(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_section_model_get_section(GtkWidget_val(self), Int_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_selection_model_unselect_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_selection_model_unselect_range(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_unselect_item(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_selection_model_unselect_item(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_unselect_all(value self)
{
CAMLparam1(self);


    gboolean result = gtk_selection_model_unselect_all(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_set_selection(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_selection_model_set_selection(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_selection_changed(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_selection_model_selection_changed(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_selection_model_select_range(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_selection_model_select_range(GtkWidget_val(self), Int_val(arg1), Int_val(arg2), Bool_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_select_item(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_selection_model_select_item(GtkWidget_val(self), Int_val(arg1), Bool_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_select_all(value self)
{
CAMLparam1(self);


    gboolean result = gtk_selection_model_select_all(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_is_selected(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_selection_model_is_selected(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_get_selection_in_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    GtkBitset* result = gtk_selection_model_get_selection_in_range(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_selection_model_get_selection(value self)
{
CAMLparam1(self);


    GtkBitset* result = gtk_selection_model_get_selection(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_symbolic_paintable_snapshot_symbolic_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_symbolic_paintable_snapshot_symbolic(GtkWidget_val(self), arg1, Double_val(arg2), Double_val(arg3), arg4, arg5);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_symbolic_paintable_snapshot_symbolic_bytecode(value * argv, int argn)
{
return ml_gtk_symbolic_paintable_snapshot_symbolic_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_tree_drag_dest_row_drop_possible(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_drag_dest_row_drop_possible(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_drag_dest_drag_data_received(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_drag_dest_drag_data_received(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_drag_source_row_draggable(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_drag_source_row_draggable(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_drag_source_drag_data_get(value self, value arg1)
{
CAMLparam2(self, arg1);


    void *result = gtk_tree_drag_source_drag_data_get(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_tree_drag_source_drag_data_delete(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_drag_source_drag_data_delete(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_unref_node(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_model_unref_node(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_rows_reordered_with_length(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_tree_model_rows_reordered_with_length(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), arg3, Int_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_rows_reordered(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_tree_model_rows_reordered(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_row_inserted(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_model_row_inserted(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_row_has_child_toggled(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_model_row_has_child_toggled(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_row_deleted(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_model_row_deleted(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_row_changed(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_model_row_changed(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_ref_node(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tree_model_ref_node(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_previous(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_model_iter_previous(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_parent(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_model_iter_parent(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_nth_child(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_tree_model_iter_nth_child(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), Int_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_next(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_model_iter_next(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_n_children(value self, value arg1)
{
CAMLparam2(self, arg1);


    int result = gtk_tree_model_iter_n_children(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_has_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_model_iter_has_child(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_iter_children(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_model_iter_children(GtkWidget_val(self), GtkWidget_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_value(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_tree_model_get_value(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_valist(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_model_get_valist(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_string_from_iter(value self, value arg1)
{
CAMLparam2(self, arg1);


    void *result = gtk_tree_model_get_string_from_iter(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_path(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkTreePath* result = gtk_tree_model_get_path(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_n_columns(value self)
{
CAMLparam1(self);


    int result = gtk_tree_model_get_n_columns(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_iter_from_string(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_model_get_iter_from_string(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_iter_first(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_tree_model_get_iter_first(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_iter(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_model_get_iter(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_flags(value self)
{
CAMLparam1(self);


    GtkTreeModelFlags result = gtk_tree_model_get_flags(GtkWidget_val(self));
CAMLreturn(Val_GtkTreeModelFlags(result));
}

CAMLexport CAMLprim value ml_gtk_tree_model_get_column_type(value self, value arg1)
{
CAMLparam2(self, arg1);


    void *result = gtk_tree_model_get_column_type(GtkWidget_val(self), Int_val(arg1));
CAMLreturn((value)result);
}

CAMLexport CAMLprim value ml_gtk_tree_model_foreach(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_model_foreach(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_model_filter_new(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkTreeModel* result = gtk_tree_model_filter_new(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_tree_sortable_sort_column_changed(value self)
{
CAMLparam1(self);


    gtk_tree_sortable_sort_column_changed(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_sortable_set_sort_func(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_tree_sortable_set_sort_func(GtkWidget_val(self), Int_val(arg1), arg2, arg3, arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_sortable_set_sort_column_id(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_tree_sortable_set_sort_column_id(GtkWidget_val(self), Int_val(arg1), GtkSortType_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_sortable_set_default_sort_func(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_tree_sortable_set_default_sort_func(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_sortable_has_default_sort_func(value self)
{
CAMLparam1(self);


    gboolean result = gtk_tree_sortable_has_default_sort_func(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_sortable_get_sort_column_id(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_tree_sortable_get_sort_column_id(GtkWidget_val(self), arg1, GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}
