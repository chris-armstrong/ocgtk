/* GENERATED CODE - DO NOT EDIT */
/* Generated from Gtk-4.0.gir for Phase 3 & Phase 5 */

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

/* Convert GtkAccessibleAnnouncementPriority to OCaml value */
static value Val_AccessibleAnnouncementPriority(GtkAccessibleAnnouncementPriority val) {
  switch (val) {
    case GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_LOW: return Val_int(1031179617); /* `LOW */
    case GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_MEDIUM: return Val_int(57925782); /* `MEDIUM */
    case GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_HIGH: return Val_int(418746517); /* `HIGH */
    default: return Val_int(1031179617); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleAnnouncementPriority */
static GtkAccessibleAnnouncementPriority AccessibleAnnouncementPriority_val(value val) {
  int tag = Int_val(val);
  if (tag == 1031179617) return GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_LOW; /* `LOW */
  else if (tag == 57925782) return GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_MEDIUM; /* `MEDIUM */
  else if (tag == 418746517) return GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_HIGH; /* `HIGH */
  else return GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_LOW; /* fallback to first value */
}

/* Convert GtkAccessibleAutocomplete to OCaml value */
static value Val_AccessibleAutocomplete(GtkAccessibleAutocomplete val) {
  switch (val) {
    case GTK_ACCESSIBLE_AUTOCOMPLETE_NONE: return Val_int(37469934); /* `NONE */
    case GTK_ACCESSIBLE_AUTOCOMPLETE_INLINE: return Val_int(169111525); /* `INLINE */
    case GTK_ACCESSIBLE_AUTOCOMPLETE_LIST: return Val_int(447133042); /* `LIST */
    case GTK_ACCESSIBLE_AUTOCOMPLETE_BOTH: return Val_int(85085456); /* `BOTH */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleAutocomplete */
static GtkAccessibleAutocomplete AccessibleAutocomplete_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_ACCESSIBLE_AUTOCOMPLETE_NONE; /* `NONE */
  else if (tag == 169111525) return GTK_ACCESSIBLE_AUTOCOMPLETE_INLINE; /* `INLINE */
  else if (tag == 447133042) return GTK_ACCESSIBLE_AUTOCOMPLETE_LIST; /* `LIST */
  else if (tag == 85085456) return GTK_ACCESSIBLE_AUTOCOMPLETE_BOTH; /* `BOTH */
  else return GTK_ACCESSIBLE_AUTOCOMPLETE_NONE; /* fallback to first value */
}

/* Convert GtkAccessibleInvalidState to OCaml value */
static value Val_AccessibleInvalidState(GtkAccessibleInvalidState val) {
  switch (val) {
    case GTK_ACCESSIBLE_INVALID_FALSE: return Val_int(605455126); /* `FALSE */
    case GTK_ACCESSIBLE_INVALID_TRUE: return Val_int(584682644); /* `TRUE */
    case GTK_ACCESSIBLE_INVALID_GRAMMAR: return Val_int(610298207); /* `GRAMMAR */
    case GTK_ACCESSIBLE_INVALID_SPELLING: return Val_int(601127279); /* `SPELLING */
    default: return Val_int(605455126); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleInvalidState */
static GtkAccessibleInvalidState AccessibleInvalidState_val(value val) {
  int tag = Int_val(val);
  if (tag == 605455126) return GTK_ACCESSIBLE_INVALID_FALSE; /* `FALSE */
  else if (tag == 584682644) return GTK_ACCESSIBLE_INVALID_TRUE; /* `TRUE */
  else if (tag == 610298207) return GTK_ACCESSIBLE_INVALID_GRAMMAR; /* `GRAMMAR */
  else if (tag == 601127279) return GTK_ACCESSIBLE_INVALID_SPELLING; /* `SPELLING */
  else return GTK_ACCESSIBLE_INVALID_FALSE; /* fallback to first value */
}

/* Convert GtkAccessiblePlatformState to OCaml value */
static value Val_AccessiblePlatformState(GtkAccessiblePlatformState val) {
  switch (val) {
    case GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSABLE: return Val_int(1039811737); /* `FOCUSABLE */
    case GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSED: return Val_int(759380304); /* `FOCUSED */
    case GTK_ACCESSIBLE_PLATFORM_STATE_ACTIVE: return Val_int(1031974070); /* `ACTIVE */
    default: return Val_int(1039811737); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessiblePlatformState */
static GtkAccessiblePlatformState AccessiblePlatformState_val(value val) {
  int tag = Int_val(val);
  if (tag == 1039811737) return GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSABLE; /* `FOCUSABLE */
  else if (tag == 759380304) return GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSED; /* `FOCUSED */
  else if (tag == 1031974070) return GTK_ACCESSIBLE_PLATFORM_STATE_ACTIVE; /* `ACTIVE */
  else return GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSABLE; /* fallback to first value */
}

/* Convert GtkAccessibleProperty to OCaml value */
static value Val_AccessibleProperty(GtkAccessibleProperty val) {
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
static GtkAccessibleProperty AccessibleProperty_val(value val) {
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
static value Val_AccessibleRelation(GtkAccessibleRelation val) {
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
static GtkAccessibleRelation AccessibleRelation_val(value val) {
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
static value Val_AccessibleRole(GtkAccessibleRole val) {
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
static GtkAccessibleRole AccessibleRole_val(value val) {
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
static value Val_AccessibleSort(GtkAccessibleSort val) {
  switch (val) {
    case GTK_ACCESSIBLE_SORT_NONE: return Val_int(37469934); /* `NONE */
    case GTK_ACCESSIBLE_SORT_ASCENDING: return Val_int(659141842); /* `ASCENDING */
    case GTK_ACCESSIBLE_SORT_DESCENDING: return Val_int(739271559); /* `DESCENDING */
    case GTK_ACCESSIBLE_SORT_OTHER: return Val_int(615852999); /* `OTHER */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleSort */
static GtkAccessibleSort AccessibleSort_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_ACCESSIBLE_SORT_NONE; /* `NONE */
  else if (tag == 659141842) return GTK_ACCESSIBLE_SORT_ASCENDING; /* `ASCENDING */
  else if (tag == 739271559) return GTK_ACCESSIBLE_SORT_DESCENDING; /* `DESCENDING */
  else if (tag == 615852999) return GTK_ACCESSIBLE_SORT_OTHER; /* `OTHER */
  else return GTK_ACCESSIBLE_SORT_NONE; /* fallback to first value */
}

/* Convert GtkAccessibleState to OCaml value */
static value Val_AccessibleState(GtkAccessibleState val) {
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
static GtkAccessibleState AccessibleState_val(value val) {
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
static value Val_AccessibleTextContentChange(GtkAccessibleTextContentChange val) {
  switch (val) {
    case GTK_ACCESSIBLE_TEXT_CONTENT_CHANGE_INSERT: return Val_int(16637105); /* `INSERT */
    case GTK_ACCESSIBLE_TEXT_CONTENT_CHANGE_REMOVE: return Val_int(538959286); /* `REMOVE */
    default: return Val_int(16637105); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleTextContentChange */
static GtkAccessibleTextContentChange AccessibleTextContentChange_val(value val) {
  int tag = Int_val(val);
  if (tag == 16637105) return GTK_ACCESSIBLE_TEXT_CONTENT_CHANGE_INSERT; /* `INSERT */
  else if (tag == 538959286) return GTK_ACCESSIBLE_TEXT_CONTENT_CHANGE_REMOVE; /* `REMOVE */
  else return GTK_ACCESSIBLE_TEXT_CONTENT_CHANGE_INSERT; /* fallback to first value */
}

/* Convert GtkAccessibleTextGranularity to OCaml value */
static value Val_AccessibleTextGranularity(GtkAccessibleTextGranularity val) {
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
static GtkAccessibleTextGranularity AccessibleTextGranularity_val(value val) {
  int tag = Int_val(val);
  if (tag == 840084187) return GTK_ACCESSIBLE_TEXT_GRANULARITY_CHARACTER; /* `CHARACTER */
  else if (tag == 777616121) return GTK_ACCESSIBLE_TEXT_GRANULARITY_WORD; /* `WORD */
  else if (tag == 336540193) return GTK_ACCESSIBLE_TEXT_GRANULARITY_SENTENCE; /* `SENTENCE */
  else if (tag == 452458406) return GTK_ACCESSIBLE_TEXT_GRANULARITY_LINE; /* `LINE */
  else if (tag == 97513912) return GTK_ACCESSIBLE_TEXT_GRANULARITY_PARAGRAPH; /* `PARAGRAPH */
  else return GTK_ACCESSIBLE_TEXT_GRANULARITY_CHARACTER; /* fallback to first value */
}

/* Convert GtkAccessibleTristate to OCaml value */
static value Val_AccessibleTristate(GtkAccessibleTristate val) {
  switch (val) {
    case GTK_ACCESSIBLE_TRISTATE_FALSE: return Val_int(605455126); /* `FALSE */
    case GTK_ACCESSIBLE_TRISTATE_TRUE: return Val_int(584682644); /* `TRUE */
    case GTK_ACCESSIBLE_TRISTATE_MIXED: return Val_int(46636679); /* `MIXED */
    default: return Val_int(605455126); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkAccessibleTristate */
static GtkAccessibleTristate AccessibleTristate_val(value val) {
  int tag = Int_val(val);
  if (tag == 605455126) return GTK_ACCESSIBLE_TRISTATE_FALSE; /* `FALSE */
  else if (tag == 584682644) return GTK_ACCESSIBLE_TRISTATE_TRUE; /* `TRUE */
  else if (tag == 46636679) return GTK_ACCESSIBLE_TRISTATE_MIXED; /* `MIXED */
  else return GTK_ACCESSIBLE_TRISTATE_FALSE; /* fallback to first value */
}

/* Convert GtkAlign to OCaml value */
static value Val_Align(GtkAlign val) {
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
static GtkAlign Align_val(value val) {
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
static value Val_ArrowType(GtkArrowType val) {
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
static GtkArrowType ArrowType_val(value val) {
  int tag = Int_val(val);
  if (tag == 160130855) return GTK_ARROW_UP; /* `UP */
  else if (tag == 878985997) return GTK_ARROW_DOWN; /* `DOWN */
  else if (tag == 28713888) return GTK_ARROW_LEFT; /* `LEFT */
  else if (tag == 961111566) return GTK_ARROW_RIGHT; /* `RIGHT */
  else if (tag == 37469934) return GTK_ARROW_NONE; /* `NONE */
  else return GTK_ARROW_UP; /* fallback to first value */
}

/* Convert GtkAssistantPageType to OCaml value */
static value Val_AssistantPageType(GtkAssistantPageType val) {
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
static GtkAssistantPageType AssistantPageType_val(value val) {
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
static value Val_BaselinePosition(GtkBaselinePosition val) {
  switch (val) {
    case GTK_BASELINE_POSITION_TOP: return Val_int(281490397); /* `TOP */
    case GTK_BASELINE_POSITION_CENTER: return Val_int(428864253); /* `CENTER */
    case GTK_BASELINE_POSITION_BOTTOM: return Val_int(585108400); /* `BOTTOM */
    default: return Val_int(281490397); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkBaselinePosition */
static GtkBaselinePosition BaselinePosition_val(value val) {
  int tag = Int_val(val);
  if (tag == 281490397) return GTK_BASELINE_POSITION_TOP; /* `TOP */
  else if (tag == 428864253) return GTK_BASELINE_POSITION_CENTER; /* `CENTER */
  else if (tag == 585108400) return GTK_BASELINE_POSITION_BOTTOM; /* `BOTTOM */
  else return GTK_BASELINE_POSITION_TOP; /* fallback to first value */
}

/* Convert GtkBorderStyle to OCaml value */
static value Val_BorderStyle(GtkBorderStyle val) {
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
static GtkBorderStyle BorderStyle_val(value val) {
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
static value Val_BuilderError(GtkBuilderError val) {
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
static GtkBuilderError BuilderError_val(value val) {
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
static value Val_ButtonsType(GtkButtonsType val) {
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
static GtkButtonsType ButtonsType_val(value val) {
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
static value Val_CellRendererAccelMode(GtkCellRendererAccelMode val) {
  switch (val) {
    case GTK_CELL_RENDERER_ACCEL_MODE_GTK: return Val_int(160069716); /* `GTK */
    case GTK_CELL_RENDERER_ACCEL_MODE_OTHER: return Val_int(615852999); /* `OTHER */
    default: return Val_int(160069716); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkCellRendererAccelMode */
static GtkCellRendererAccelMode CellRendererAccelMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 160069716) return GTK_CELL_RENDERER_ACCEL_MODE_GTK; /* `GTK */
  else if (tag == 615852999) return GTK_CELL_RENDERER_ACCEL_MODE_OTHER; /* `OTHER */
  else return GTK_CELL_RENDERER_ACCEL_MODE_GTK; /* fallback to first value */
}

/* Convert GtkCellRendererMode to OCaml value */
static value Val_CellRendererMode(GtkCellRendererMode val) {
  switch (val) {
    case GTK_CELL_RENDERER_MODE_INERT: return Val_int(122783495); /* `INERT */
    case GTK_CELL_RENDERER_MODE_ACTIVATABLE: return Val_int(236227721); /* `ACTIVATABLE */
    case GTK_CELL_RENDERER_MODE_EDITABLE: return Val_int(167806173); /* `EDITABLE */
    default: return Val_int(122783495); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkCellRendererMode */
static GtkCellRendererMode CellRendererMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 122783495) return GTK_CELL_RENDERER_MODE_INERT; /* `INERT */
  else if (tag == 236227721) return GTK_CELL_RENDERER_MODE_ACTIVATABLE; /* `ACTIVATABLE */
  else if (tag == 167806173) return GTK_CELL_RENDERER_MODE_EDITABLE; /* `EDITABLE */
  else return GTK_CELL_RENDERER_MODE_INERT; /* fallback to first value */
}

/* Convert GtkCollation to OCaml value */
static value Val_Collation(GtkCollation val) {
  switch (val) {
    case GTK_COLLATION_NONE: return Val_int(37469934); /* `NONE */
    case GTK_COLLATION_UNICODE: return Val_int(744269357); /* `UNICODE */
    case GTK_COLLATION_FILENAME: return Val_int(355818944); /* `FILENAME */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkCollation */
static GtkCollation Collation_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_COLLATION_NONE; /* `NONE */
  else if (tag == 744269357) return GTK_COLLATION_UNICODE; /* `UNICODE */
  else if (tag == 355818944) return GTK_COLLATION_FILENAME; /* `FILENAME */
  else return GTK_COLLATION_NONE; /* fallback to first value */
}

/* Convert GtkConstraintAttribute to OCaml value */
static value Val_ConstraintAttribute(GtkConstraintAttribute val) {
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
static GtkConstraintAttribute ConstraintAttribute_val(value val) {
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
static value Val_ConstraintRelation(GtkConstraintRelation val) {
  switch (val) {
    case GTK_CONSTRAINT_RELATION_LE: return Val_int(633442369); /* `LE */
    case GTK_CONSTRAINT_RELATION_EQ: return Val_int(551539569); /* `EQ */
    case GTK_CONSTRAINT_RELATION_GE: return Val_int(620103353); /* `GE */
    default: return Val_int(633442369); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkConstraintRelation */
static GtkConstraintRelation ConstraintRelation_val(value val) {
  int tag = Int_val(val);
  if (tag == 633442369) return GTK_CONSTRAINT_RELATION_LE; /* `LE */
  else if (tag == 551539569) return GTK_CONSTRAINT_RELATION_EQ; /* `EQ */
  else if (tag == 620103353) return GTK_CONSTRAINT_RELATION_GE; /* `GE */
  else return GTK_CONSTRAINT_RELATION_LE; /* fallback to first value */
}

/* Convert GtkConstraintStrength to OCaml value */
static value Val_ConstraintStrength(GtkConstraintStrength val) {
  switch (val) {
    case GTK_CONSTRAINT_STRENGTH_REQUIRED: return Val_int(518474020); /* `REQUIRED */
    case GTK_CONSTRAINT_STRENGTH_STRONG: return Val_int(953257587); /* `STRONG */
    case GTK_CONSTRAINT_STRENGTH_MEDIUM: return Val_int(57925782); /* `MEDIUM */
    case GTK_CONSTRAINT_STRENGTH_WEAK: return Val_int(782389184); /* `WEAK */
    default: return Val_int(518474020); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkConstraintStrength */
static GtkConstraintStrength ConstraintStrength_val(value val) {
  int tag = Int_val(val);
  if (tag == 518474020) return GTK_CONSTRAINT_STRENGTH_REQUIRED; /* `REQUIRED */
  else if (tag == 953257587) return GTK_CONSTRAINT_STRENGTH_STRONG; /* `STRONG */
  else if (tag == 57925782) return GTK_CONSTRAINT_STRENGTH_MEDIUM; /* `MEDIUM */
  else if (tag == 782389184) return GTK_CONSTRAINT_STRENGTH_WEAK; /* `WEAK */
  else return GTK_CONSTRAINT_STRENGTH_REQUIRED; /* fallback to first value */
}

/* Convert GtkConstraintVflParserError to OCaml value */
static value Val_ConstraintVflParserError(GtkConstraintVflParserError val) {
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
static GtkConstraintVflParserError ConstraintVflParserError_val(value val) {
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
static value Val_ContentFit(GtkContentFit val) {
  switch (val) {
    case GTK_CONTENT_FIT_FILL: return Val_int(263377307); /* `FILL */
    case GTK_CONTENT_FIT_CONTAIN: return Val_int(567603277); /* `CONTAIN */
    case GTK_CONTENT_FIT_COVER: return Val_int(462944702); /* `COVER */
    case GTK_CONTENT_FIT_SCALE_DOWN: return Val_int(1026785767); /* `SCALE_DOWN */
    default: return Val_int(263377307); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkContentFit */
static GtkContentFit ContentFit_val(value val) {
  int tag = Int_val(val);
  if (tag == 263377307) return GTK_CONTENT_FIT_FILL; /* `FILL */
  else if (tag == 567603277) return GTK_CONTENT_FIT_CONTAIN; /* `CONTAIN */
  else if (tag == 462944702) return GTK_CONTENT_FIT_COVER; /* `COVER */
  else if (tag == 1026785767) return GTK_CONTENT_FIT_SCALE_DOWN; /* `SCALE_DOWN */
  else return GTK_CONTENT_FIT_FILL; /* fallback to first value */
}

/* Convert GtkCornerType to OCaml value */
static value Val_CornerType(GtkCornerType val) {
  switch (val) {
    case GTK_CORNER_TOP_LEFT: return Val_int(892618403); /* `TOP_LEFT */
    case GTK_CORNER_BOTTOM_LEFT: return Val_int(1024975575); /* `BOTTOM_LEFT */
    case GTK_CORNER_TOP_RIGHT: return Val_int(205854740); /* `TOP_RIGHT */
    case GTK_CORNER_BOTTOM_RIGHT: return Val_int(371482052); /* `BOTTOM_RIGHT */
    default: return Val_int(892618403); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkCornerType */
static GtkCornerType CornerType_val(value val) {
  int tag = Int_val(val);
  if (tag == 892618403) return GTK_CORNER_TOP_LEFT; /* `TOP_LEFT */
  else if (tag == 1024975575) return GTK_CORNER_BOTTOM_LEFT; /* `BOTTOM_LEFT */
  else if (tag == 205854740) return GTK_CORNER_TOP_RIGHT; /* `TOP_RIGHT */
  else if (tag == 371482052) return GTK_CORNER_BOTTOM_RIGHT; /* `BOTTOM_RIGHT */
  else return GTK_CORNER_TOP_LEFT; /* fallback to first value */
}

/* Convert GtkCssParserError to OCaml value */
static value Val_CssParserError(GtkCssParserError val) {
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
static GtkCssParserError CssParserError_val(value val) {
  int tag = Int_val(val);
  if (tag == 925697929) return GTK_CSS_PARSER_ERROR_FAILED; /* `FAILED */
  else if (tag == 484804011) return GTK_CSS_PARSER_ERROR_SYNTAX; /* `SYNTAX */
  else if (tag == 299628439) return GTK_CSS_PARSER_ERROR_IMPORT; /* `IMPORT */
  else if (tag == 506353843) return GTK_CSS_PARSER_ERROR_NAME; /* `NAME */
  else if (tag == 803985612) return GTK_CSS_PARSER_ERROR_UNKNOWN_VALUE; /* `UNKNOWN_VALUE */
  else return GTK_CSS_PARSER_ERROR_FAILED; /* fallback to first value */
}

/* Convert GtkCssParserWarning to OCaml value */
static value Val_CssParserWarning(GtkCssParserWarning val) {
  switch (val) {
    case GTK_CSS_PARSER_WARNING_DEPRECATED: return Val_int(745807152); /* `DEPRECATED */
    case GTK_CSS_PARSER_WARNING_SYNTAX: return Val_int(484804011); /* `SYNTAX */
    case GTK_CSS_PARSER_WARNING_UNIMPLEMENTED: return Val_int(783301922); /* `UNIMPLEMENTED */
    default: return Val_int(745807152); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkCssParserWarning */
static GtkCssParserWarning CssParserWarning_val(value val) {
  int tag = Int_val(val);
  if (tag == 745807152) return GTK_CSS_PARSER_WARNING_DEPRECATED; /* `DEPRECATED */
  else if (tag == 484804011) return GTK_CSS_PARSER_WARNING_SYNTAX; /* `SYNTAX */
  else if (tag == 783301922) return GTK_CSS_PARSER_WARNING_UNIMPLEMENTED; /* `UNIMPLEMENTED */
  else return GTK_CSS_PARSER_WARNING_DEPRECATED; /* fallback to first value */
}

/* Convert GtkDeleteType to OCaml value */
static value Val_DeleteType(GtkDeleteType val) {
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
static GtkDeleteType DeleteType_val(value val) {
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
static value Val_DialogError(GtkDialogError val) {
  switch (val) {
    case GTK_DIALOG_ERROR_FAILED: return Val_int(925697929); /* `FAILED */
    case GTK_DIALOG_ERROR_CANCELLED: return Val_int(919468448); /* `CANCELLED */
    case GTK_DIALOG_ERROR_DISMISSED: return Val_int(108014969); /* `DISMISSED */
    default: return Val_int(925697929); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkDialogError */
static GtkDialogError DialogError_val(value val) {
  int tag = Int_val(val);
  if (tag == 925697929) return GTK_DIALOG_ERROR_FAILED; /* `FAILED */
  else if (tag == 919468448) return GTK_DIALOG_ERROR_CANCELLED; /* `CANCELLED */
  else if (tag == 108014969) return GTK_DIALOG_ERROR_DISMISSED; /* `DISMISSED */
  else return GTK_DIALOG_ERROR_FAILED; /* fallback to first value */
}

/* Convert GtkDirectionType to OCaml value */
static value Val_DirectionType(GtkDirectionType val) {
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
static GtkDirectionType DirectionType_val(value val) {
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
static value Val_EditableProperties(GtkEditableProperties val) {
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
static GtkEditableProperties EditableProperties_val(value val) {
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
static value Val_EntryIconPosition(GtkEntryIconPosition val) {
  switch (val) {
    case GTK_ENTRY_ICON_PRIMARY: return Val_int(804397948); /* `PRIMARY */
    case GTK_ENTRY_ICON_SECONDARY: return Val_int(511358720); /* `SECONDARY */
    default: return Val_int(804397948); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkEntryIconPosition */
static GtkEntryIconPosition EntryIconPosition_val(value val) {
  int tag = Int_val(val);
  if (tag == 804397948) return GTK_ENTRY_ICON_PRIMARY; /* `PRIMARY */
  else if (tag == 511358720) return GTK_ENTRY_ICON_SECONDARY; /* `SECONDARY */
  else return GTK_ENTRY_ICON_PRIMARY; /* fallback to first value */
}

/* Convert GtkEventSequenceState to OCaml value */
static value Val_EventSequenceState(GtkEventSequenceState val) {
  switch (val) {
    case GTK_EVENT_SEQUENCE_NONE: return Val_int(37469934); /* `NONE */
    case GTK_EVENT_SEQUENCE_CLAIMED: return Val_int(620167260); /* `CLAIMED */
    case GTK_EVENT_SEQUENCE_DENIED: return Val_int(930758746); /* `DENIED */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkEventSequenceState */
static GtkEventSequenceState EventSequenceState_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_EVENT_SEQUENCE_NONE; /* `NONE */
  else if (tag == 620167260) return GTK_EVENT_SEQUENCE_CLAIMED; /* `CLAIMED */
  else if (tag == 930758746) return GTK_EVENT_SEQUENCE_DENIED; /* `DENIED */
  else return GTK_EVENT_SEQUENCE_NONE; /* fallback to first value */
}

/* Convert GtkFileChooserAction to OCaml value */
static value Val_FileChooserAction(GtkFileChooserAction val) {
  switch (val) {
    case GTK_FILE_CHOOSER_ACTION_OPEN: return Val_int(485712552); /* `OPEN */
    case GTK_FILE_CHOOSER_ACTION_SAVE: return Val_int(230002821); /* `SAVE */
    case GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER: return Val_int(753529900); /* `SELECT_FOLDER */
    default: return Val_int(485712552); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkFileChooserAction */
static GtkFileChooserAction FileChooserAction_val(value val) {
  int tag = Int_val(val);
  if (tag == 485712552) return GTK_FILE_CHOOSER_ACTION_OPEN; /* `OPEN */
  else if (tag == 230002821) return GTK_FILE_CHOOSER_ACTION_SAVE; /* `SAVE */
  else if (tag == 753529900) return GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER; /* `SELECT_FOLDER */
  else return GTK_FILE_CHOOSER_ACTION_OPEN; /* fallback to first value */
}

/* Convert GtkFileChooserError to OCaml value */
static value Val_FileChooserError(GtkFileChooserError val) {
  switch (val) {
    case GTK_FILE_CHOOSER_ERROR_NONEXISTENT: return Val_int(144886956); /* `NONEXISTENT */
    case GTK_FILE_CHOOSER_ERROR_BAD_FILENAME: return Val_int(958220628); /* `BAD_FILENAME */
    case GTK_FILE_CHOOSER_ERROR_ALREADY_EXISTS: return Val_int(323346212); /* `ALREADY_EXISTS */
    case GTK_FILE_CHOOSER_ERROR_INCOMPLETE_HOSTNAME: return Val_int(283083233); /* `INCOMPLETE_HOSTNAME */
    default: return Val_int(144886956); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkFileChooserError */
static GtkFileChooserError FileChooserError_val(value val) {
  int tag = Int_val(val);
  if (tag == 144886956) return GTK_FILE_CHOOSER_ERROR_NONEXISTENT; /* `NONEXISTENT */
  else if (tag == 958220628) return GTK_FILE_CHOOSER_ERROR_BAD_FILENAME; /* `BAD_FILENAME */
  else if (tag == 323346212) return GTK_FILE_CHOOSER_ERROR_ALREADY_EXISTS; /* `ALREADY_EXISTS */
  else if (tag == 283083233) return GTK_FILE_CHOOSER_ERROR_INCOMPLETE_HOSTNAME; /* `INCOMPLETE_HOSTNAME */
  else return GTK_FILE_CHOOSER_ERROR_NONEXISTENT; /* fallback to first value */
}

/* Convert GtkFilterChange to OCaml value */
static value Val_FilterChange(GtkFilterChange val) {
  switch (val) {
    case GTK_FILTER_CHANGE_DIFFERENT: return Val_int(163830453); /* `DIFFERENT */
    case GTK_FILTER_CHANGE_LESS_STRICT: return Val_int(620736805); /* `LESS_STRICT */
    case GTK_FILTER_CHANGE_MORE_STRICT: return Val_int(429188853); /* `MORE_STRICT */
    default: return Val_int(163830453); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkFilterChange */
static GtkFilterChange FilterChange_val(value val) {
  int tag = Int_val(val);
  if (tag == 163830453) return GTK_FILTER_CHANGE_DIFFERENT; /* `DIFFERENT */
  else if (tag == 620736805) return GTK_FILTER_CHANGE_LESS_STRICT; /* `LESS_STRICT */
  else if (tag == 429188853) return GTK_FILTER_CHANGE_MORE_STRICT; /* `MORE_STRICT */
  else return GTK_FILTER_CHANGE_DIFFERENT; /* fallback to first value */
}

/* Convert GtkFilterMatch to OCaml value */
static value Val_FilterMatch(GtkFilterMatch val) {
  switch (val) {
    case GTK_FILTER_MATCH_SOME: return Val_int(241945431); /* `SOME */
    case GTK_FILTER_MATCH_NONE: return Val_int(37469934); /* `NONE */
    case GTK_FILTER_MATCH_ALL: return Val_int(96450141); /* `ALL */
    default: return Val_int(241945431); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkFilterMatch */
static GtkFilterMatch FilterMatch_val(value val) {
  int tag = Int_val(val);
  if (tag == 241945431) return GTK_FILTER_MATCH_SOME; /* `SOME */
  else if (tag == 37469934) return GTK_FILTER_MATCH_NONE; /* `NONE */
  else if (tag == 96450141) return GTK_FILTER_MATCH_ALL; /* `ALL */
  else return GTK_FILTER_MATCH_SOME; /* fallback to first value */
}

/* Convert GtkFontLevel to OCaml value */
static value Val_FontLevel(GtkFontLevel val) {
  switch (val) {
    case GTK_FONT_LEVEL_FAMILY: return Val_int(690675795); /* `FAMILY */
    case GTK_FONT_LEVEL_FACE: return Val_int(498684657); /* `FACE */
    case GTK_FONT_LEVEL_FONT: return Val_int(29042317); /* `FONT */
    case GTK_FONT_LEVEL_FEATURES: return Val_int(816931048); /* `FEATURES */
    default: return Val_int(690675795); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkFontLevel */
static GtkFontLevel FontLevel_val(value val) {
  int tag = Int_val(val);
  if (tag == 690675795) return GTK_FONT_LEVEL_FAMILY; /* `FAMILY */
  else if (tag == 498684657) return GTK_FONT_LEVEL_FACE; /* `FACE */
  else if (tag == 29042317) return GTK_FONT_LEVEL_FONT; /* `FONT */
  else if (tag == 816931048) return GTK_FONT_LEVEL_FEATURES; /* `FEATURES */
  else return GTK_FONT_LEVEL_FAMILY; /* fallback to first value */
}

/* Convert GtkGraphicsOffloadEnabled to OCaml value */
static value Val_GraphicsOffloadEnabled(GtkGraphicsOffloadEnabled val) {
  switch (val) {
    case GTK_GRAPHICS_OFFLOAD_ENABLED: return Val_int(150757190); /* `ENABLED */
    case GTK_GRAPHICS_OFFLOAD_DISABLED: return Val_int(510375555); /* `DISABLED */
    default: return Val_int(150757190); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkGraphicsOffloadEnabled */
static GtkGraphicsOffloadEnabled GraphicsOffloadEnabled_val(value val) {
  int tag = Int_val(val);
  if (tag == 150757190) return GTK_GRAPHICS_OFFLOAD_ENABLED; /* `ENABLED */
  else if (tag == 510375555) return GTK_GRAPHICS_OFFLOAD_DISABLED; /* `DISABLED */
  else return GTK_GRAPHICS_OFFLOAD_ENABLED; /* fallback to first value */
}

/* Convert GtkIconSize to OCaml value */
static value Val_IconSize(GtkIconSize val) {
  switch (val) {
    case GTK_ICON_SIZE_INHERIT: return Val_int(178543076); /* `INHERIT */
    case GTK_ICON_SIZE_NORMAL: return Val_int(888717969); /* `NORMAL */
    case GTK_ICON_SIZE_LARGE: return Val_int(363805903); /* `LARGE */
    default: return Val_int(178543076); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkIconSize */
static GtkIconSize IconSize_val(value val) {
  int tag = Int_val(val);
  if (tag == 178543076) return GTK_ICON_SIZE_INHERIT; /* `INHERIT */
  else if (tag == 888717969) return GTK_ICON_SIZE_NORMAL; /* `NORMAL */
  else if (tag == 363805903) return GTK_ICON_SIZE_LARGE; /* `LARGE */
  else return GTK_ICON_SIZE_INHERIT; /* fallback to first value */
}

/* Convert GtkIconThemeError to OCaml value */
static value Val_IconThemeError(GtkIconThemeError val) {
  switch (val) {
    case GTK_ICON_THEME_NOT_FOUND: return Val_int(420710559); /* `NOT_FOUND */
    case GTK_ICON_THEME_FAILED: return Val_int(925697929); /* `FAILED */
    default: return Val_int(420710559); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkIconThemeError */
static GtkIconThemeError IconThemeError_val(value val) {
  int tag = Int_val(val);
  if (tag == 420710559) return GTK_ICON_THEME_NOT_FOUND; /* `NOT_FOUND */
  else if (tag == 925697929) return GTK_ICON_THEME_FAILED; /* `FAILED */
  else return GTK_ICON_THEME_NOT_FOUND; /* fallback to first value */
}

/* Convert GtkIconViewDropPosition to OCaml value */
static value Val_IconViewDropPosition(GtkIconViewDropPosition val) {
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
static GtkIconViewDropPosition IconViewDropPosition_val(value val) {
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
static value Val_ImageType(GtkImageType val) {
  switch (val) {
    case GTK_IMAGE_EMPTY: return Val_int(1034534598); /* `EMPTY */
    case GTK_IMAGE_ICON_NAME: return Val_int(27050754); /* `ICON_NAME */
    case GTK_IMAGE_GICON: return Val_int(999378045); /* `GICON */
    case GTK_IMAGE_PAINTABLE: return Val_int(205282152); /* `PAINTABLE */
    default: return Val_int(1034534598); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkImageType */
static GtkImageType ImageType_val(value val) {
  int tag = Int_val(val);
  if (tag == 1034534598) return GTK_IMAGE_EMPTY; /* `EMPTY */
  else if (tag == 27050754) return GTK_IMAGE_ICON_NAME; /* `ICON_NAME */
  else if (tag == 999378045) return GTK_IMAGE_GICON; /* `GICON */
  else if (tag == 205282152) return GTK_IMAGE_PAINTABLE; /* `PAINTABLE */
  else return GTK_IMAGE_EMPTY; /* fallback to first value */
}

/* Convert GtkInputPurpose to OCaml value */
static value Val_InputPurpose(GtkInputPurpose val) {
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
static GtkInputPurpose InputPurpose_val(value val) {
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
static value Val_InscriptionOverflow(GtkInscriptionOverflow val) {
  switch (val) {
    case GTK_INSCRIPTION_OVERFLOW_CLIP: return Val_int(348623802); /* `CLIP */
    case GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_START: return Val_int(1067525362); /* `ELLIPSIZE_START */
    case GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_MIDDLE: return Val_int(393443084); /* `ELLIPSIZE_MIDDLE */
    case GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_END: return Val_int(154012781); /* `ELLIPSIZE_END */
    default: return Val_int(348623802); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkInscriptionOverflow */
static GtkInscriptionOverflow InscriptionOverflow_val(value val) {
  int tag = Int_val(val);
  if (tag == 348623802) return GTK_INSCRIPTION_OVERFLOW_CLIP; /* `CLIP */
  else if (tag == 1067525362) return GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_START; /* `ELLIPSIZE_START */
  else if (tag == 393443084) return GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_MIDDLE; /* `ELLIPSIZE_MIDDLE */
  else if (tag == 154012781) return GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_END; /* `ELLIPSIZE_END */
  else return GTK_INSCRIPTION_OVERFLOW_CLIP; /* fallback to first value */
}

/* Convert GtkJustification to OCaml value */
static value Val_Justification(GtkJustification val) {
  switch (val) {
    case GTK_JUSTIFY_LEFT: return Val_int(28713888); /* `LEFT */
    case GTK_JUSTIFY_RIGHT: return Val_int(961111566); /* `RIGHT */
    case GTK_JUSTIFY_CENTER: return Val_int(428864253); /* `CENTER */
    case GTK_JUSTIFY_FILL: return Val_int(263377307); /* `FILL */
    default: return Val_int(28713888); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkJustification */
static GtkJustification Justification_val(value val) {
  int tag = Int_val(val);
  if (tag == 28713888) return GTK_JUSTIFY_LEFT; /* `LEFT */
  else if (tag == 961111566) return GTK_JUSTIFY_RIGHT; /* `RIGHT */
  else if (tag == 428864253) return GTK_JUSTIFY_CENTER; /* `CENTER */
  else if (tag == 263377307) return GTK_JUSTIFY_FILL; /* `FILL */
  else return GTK_JUSTIFY_LEFT; /* fallback to first value */
}

/* Convert GtkLevelBarMode to OCaml value */
static value Val_LevelBarMode(GtkLevelBarMode val) {
  switch (val) {
    case GTK_LEVEL_BAR_MODE_CONTINUOUS: return Val_int(430544503); /* `CONTINUOUS */
    case GTK_LEVEL_BAR_MODE_DISCRETE: return Val_int(644866580); /* `DISCRETE */
    default: return Val_int(430544503); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkLevelBarMode */
static GtkLevelBarMode LevelBarMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 430544503) return GTK_LEVEL_BAR_MODE_CONTINUOUS; /* `CONTINUOUS */
  else if (tag == 644866580) return GTK_LEVEL_BAR_MODE_DISCRETE; /* `DISCRETE */
  else return GTK_LEVEL_BAR_MODE_CONTINUOUS; /* fallback to first value */
}

/* Convert GtkListTabBehavior to OCaml value */
static value Val_ListTabBehavior(GtkListTabBehavior val) {
  switch (val) {
    case GTK_LIST_TAB_ALL: return Val_int(96450141); /* `ALL */
    case GTK_LIST_TAB_ITEM: return Val_int(698841792); /* `ITEM */
    case GTK_LIST_TAB_CELL: return Val_int(294115967); /* `CELL */
    default: return Val_int(96450141); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkListTabBehavior */
static GtkListTabBehavior ListTabBehavior_val(value val) {
  int tag = Int_val(val);
  if (tag == 96450141) return GTK_LIST_TAB_ALL; /* `ALL */
  else if (tag == 698841792) return GTK_LIST_TAB_ITEM; /* `ITEM */
  else if (tag == 294115967) return GTK_LIST_TAB_CELL; /* `CELL */
  else return GTK_LIST_TAB_ALL; /* fallback to first value */
}

/* Convert GtkMessageType to OCaml value */
static value Val_MessageType(GtkMessageType val) {
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
static GtkMessageType MessageType_val(value val) {
  int tag = Int_val(val);
  if (tag == 698867640) return GTK_MESSAGE_INFO; /* `INFO */
  else if (tag == 928678842) return GTK_MESSAGE_WARNING; /* `WARNING */
  else if (tag == 945786767) return GTK_MESSAGE_QUESTION; /* `QUESTION */
  else if (tag == 1064539868) return GTK_MESSAGE_ERROR; /* `ERROR */
  else if (tag == 615852999) return GTK_MESSAGE_OTHER; /* `OTHER */
  else return GTK_MESSAGE_INFO; /* fallback to first value */
}

/* Convert GtkMovementStep to OCaml value */
static value Val_MovementStep(GtkMovementStep val) {
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
static GtkMovementStep MovementStep_val(value val) {
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
static value Val_NaturalWrapMode(GtkNaturalWrapMode val) {
  switch (val) {
    case GTK_NATURAL_WRAP_INHERIT: return Val_int(178543076); /* `INHERIT */
    case GTK_NATURAL_WRAP_NONE: return Val_int(37469934); /* `NONE */
    case GTK_NATURAL_WRAP_WORD: return Val_int(777616121); /* `WORD */
    default: return Val_int(178543076); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkNaturalWrapMode */
static GtkNaturalWrapMode NaturalWrapMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 178543076) return GTK_NATURAL_WRAP_INHERIT; /* `INHERIT */
  else if (tag == 37469934) return GTK_NATURAL_WRAP_NONE; /* `NONE */
  else if (tag == 777616121) return GTK_NATURAL_WRAP_WORD; /* `WORD */
  else return GTK_NATURAL_WRAP_INHERIT; /* fallback to first value */
}

/* Convert GtkNotebookTab to OCaml value */
static value Val_NotebookTab(GtkNotebookTab val) {
  switch (val) {
    case GTK_NOTEBOOK_TAB_FIRST: return Val_int(1037544970); /* `FIRST */
    case GTK_NOTEBOOK_TAB_LAST: return Val_int(82545625); /* `LAST */
    default: return Val_int(1037544970); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkNotebookTab */
static GtkNotebookTab NotebookTab_val(value val) {
  int tag = Int_val(val);
  if (tag == 1037544970) return GTK_NOTEBOOK_TAB_FIRST; /* `FIRST */
  else if (tag == 82545625) return GTK_NOTEBOOK_TAB_LAST; /* `LAST */
  else return GTK_NOTEBOOK_TAB_FIRST; /* fallback to first value */
}

/* Convert GtkNumberUpLayout to OCaml value */
static value Val_NumberUpLayout(GtkNumberUpLayout val) {
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
static GtkNumberUpLayout NumberUpLayout_val(value val) {
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
static value Val_Ordering(GtkOrdering val) {
  switch (val) {
    case GTK_ORDERING_SMALLER: return Val_int(812358654); /* `SMALLER */
    case GTK_ORDERING_EQUAL: return Val_int(997378661); /* `EQUAL */
    case GTK_ORDERING_LARGER: return Val_int(868880378); /* `LARGER */
    default: return Val_int(812358654); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkOrdering */
static GtkOrdering Ordering_val(value val) {
  int tag = Int_val(val);
  if (tag == 812358654) return GTK_ORDERING_SMALLER; /* `SMALLER */
  else if (tag == 997378661) return GTK_ORDERING_EQUAL; /* `EQUAL */
  else if (tag == 868880378) return GTK_ORDERING_LARGER; /* `LARGER */
  else return GTK_ORDERING_SMALLER; /* fallback to first value */
}

/* Convert GtkOrientation to OCaml value */
static value Val_Orientation(GtkOrientation val) {
  switch (val) {
    case GTK_ORIENTATION_HORIZONTAL: return Val_int(691710922); /* `HORIZONTAL */
    case GTK_ORIENTATION_VERTICAL: return Val_int(721220360); /* `VERTICAL */
    default: return Val_int(691710922); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkOrientation */
static GtkOrientation Orientation_val(value val) {
  int tag = Int_val(val);
  if (tag == 691710922) return GTK_ORIENTATION_HORIZONTAL; /* `HORIZONTAL */
  else if (tag == 721220360) return GTK_ORIENTATION_VERTICAL; /* `VERTICAL */
  else return GTK_ORIENTATION_HORIZONTAL; /* fallback to first value */
}

/* Convert GtkOverflow to OCaml value */
static value Val_Overflow(GtkOverflow val) {
  switch (val) {
    case GTK_OVERFLOW_VISIBLE: return Val_int(975881643); /* `VISIBLE */
    case GTK_OVERFLOW_HIDDEN: return Val_int(835860439); /* `HIDDEN */
    default: return Val_int(975881643); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkOverflow */
static GtkOverflow Overflow_val(value val) {
  int tag = Int_val(val);
  if (tag == 975881643) return GTK_OVERFLOW_VISIBLE; /* `VISIBLE */
  else if (tag == 835860439) return GTK_OVERFLOW_HIDDEN; /* `HIDDEN */
  else return GTK_OVERFLOW_VISIBLE; /* fallback to first value */
}

/* Convert GtkPackType to OCaml value */
static value Val_PackType(GtkPackType val) {
  switch (val) {
    case GTK_PACK_START: return Val_int(23743610); /* `START */
    case GTK_PACK_END: return Val_int(735747473); /* `END */
    default: return Val_int(23743610); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPackType */
static GtkPackType PackType_val(value val) {
  int tag = Int_val(val);
  if (tag == 23743610) return GTK_PACK_START; /* `START */
  else if (tag == 735747473) return GTK_PACK_END; /* `END */
  else return GTK_PACK_START; /* fallback to first value */
}

/* Convert GtkPadActionType to OCaml value */
static value Val_PadActionType(GtkPadActionType val) {
  switch (val) {
    case GTK_PAD_ACTION_BUTTON: return Val_int(536988399); /* `BUTTON */
    case GTK_PAD_ACTION_RING: return Val_int(696651259); /* `RING */
    case GTK_PAD_ACTION_STRIP: return Val_int(491817462); /* `STRIP */
    default: return Val_int(536988399); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPadActionType */
static GtkPadActionType PadActionType_val(value val) {
  int tag = Int_val(val);
  if (tag == 536988399) return GTK_PAD_ACTION_BUTTON; /* `BUTTON */
  else if (tag == 696651259) return GTK_PAD_ACTION_RING; /* `RING */
  else if (tag == 491817462) return GTK_PAD_ACTION_STRIP; /* `STRIP */
  else return GTK_PAD_ACTION_BUTTON; /* fallback to first value */
}

/* Convert GtkPageOrientation to OCaml value */
static value Val_PageOrientation(GtkPageOrientation val) {
  switch (val) {
    case GTK_PAGE_ORIENTATION_PORTRAIT: return Val_int(104085318); /* `PORTRAIT */
    case GTK_PAGE_ORIENTATION_LANDSCAPE: return Val_int(318748164); /* `LANDSCAPE */
    case GTK_PAGE_ORIENTATION_REVERSE_PORTRAIT: return Val_int(521497845); /* `REVERSE_PORTRAIT */
    case GTK_PAGE_ORIENTATION_REVERSE_LANDSCAPE: return Val_int(303010604); /* `REVERSE_LANDSCAPE */
    default: return Val_int(104085318); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPageOrientation */
static GtkPageOrientation PageOrientation_val(value val) {
  int tag = Int_val(val);
  if (tag == 104085318) return GTK_PAGE_ORIENTATION_PORTRAIT; /* `PORTRAIT */
  else if (tag == 318748164) return GTK_PAGE_ORIENTATION_LANDSCAPE; /* `LANDSCAPE */
  else if (tag == 521497845) return GTK_PAGE_ORIENTATION_REVERSE_PORTRAIT; /* `REVERSE_PORTRAIT */
  else if (tag == 303010604) return GTK_PAGE_ORIENTATION_REVERSE_LANDSCAPE; /* `REVERSE_LANDSCAPE */
  else return GTK_PAGE_ORIENTATION_PORTRAIT; /* fallback to first value */
}

/* Convert GtkPageSet to OCaml value */
static value Val_PageSet(GtkPageSet val) {
  switch (val) {
    case GTK_PAGE_SET_ALL: return Val_int(96450141); /* `ALL */
    case GTK_PAGE_SET_EVEN: return Val_int(762840102); /* `EVEN */
    case GTK_PAGE_SET_ODD: return Val_int(631167757); /* `ODD */
    default: return Val_int(96450141); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPageSet */
static GtkPageSet PageSet_val(value val) {
  int tag = Int_val(val);
  if (tag == 96450141) return GTK_PAGE_SET_ALL; /* `ALL */
  else if (tag == 762840102) return GTK_PAGE_SET_EVEN; /* `EVEN */
  else if (tag == 631167757) return GTK_PAGE_SET_ODD; /* `ODD */
  else return GTK_PAGE_SET_ALL; /* fallback to first value */
}

/* Convert GtkPanDirection to OCaml value */
static value Val_PanDirection(GtkPanDirection val) {
  switch (val) {
    case GTK_PAN_DIRECTION_LEFT: return Val_int(28713888); /* `LEFT */
    case GTK_PAN_DIRECTION_RIGHT: return Val_int(961111566); /* `RIGHT */
    case GTK_PAN_DIRECTION_UP: return Val_int(160130855); /* `UP */
    case GTK_PAN_DIRECTION_DOWN: return Val_int(878985997); /* `DOWN */
    default: return Val_int(28713888); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPanDirection */
static GtkPanDirection PanDirection_val(value val) {
  int tag = Int_val(val);
  if (tag == 28713888) return GTK_PAN_DIRECTION_LEFT; /* `LEFT */
  else if (tag == 961111566) return GTK_PAN_DIRECTION_RIGHT; /* `RIGHT */
  else if (tag == 160130855) return GTK_PAN_DIRECTION_UP; /* `UP */
  else if (tag == 878985997) return GTK_PAN_DIRECTION_DOWN; /* `DOWN */
  else return GTK_PAN_DIRECTION_LEFT; /* fallback to first value */
}

/* Convert GtkPolicyType to OCaml value */
static value Val_PolicyType(GtkPolicyType val) {
  switch (val) {
    case GTK_POLICY_ALWAYS: return Val_int(21963510); /* `ALWAYS */
    case GTK_POLICY_AUTOMATIC: return Val_int(162159565); /* `AUTOMATIC */
    case GTK_POLICY_NEVER: return Val_int(267988731); /* `NEVER */
    case GTK_POLICY_EXTERNAL: return Val_int(753002325); /* `EXTERNAL */
    default: return Val_int(21963510); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPolicyType */
static GtkPolicyType PolicyType_val(value val) {
  int tag = Int_val(val);
  if (tag == 21963510) return GTK_POLICY_ALWAYS; /* `ALWAYS */
  else if (tag == 162159565) return GTK_POLICY_AUTOMATIC; /* `AUTOMATIC */
  else if (tag == 267988731) return GTK_POLICY_NEVER; /* `NEVER */
  else if (tag == 753002325) return GTK_POLICY_EXTERNAL; /* `EXTERNAL */
  else return GTK_POLICY_ALWAYS; /* fallback to first value */
}

/* Convert GtkPositionType to OCaml value */
static value Val_PositionType(GtkPositionType val) {
  switch (val) {
    case GTK_POS_LEFT: return Val_int(28713888); /* `LEFT */
    case GTK_POS_RIGHT: return Val_int(961111566); /* `RIGHT */
    case GTK_POS_TOP: return Val_int(281490397); /* `TOP */
    case GTK_POS_BOTTOM: return Val_int(585108400); /* `BOTTOM */
    default: return Val_int(28713888); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPositionType */
static GtkPositionType PositionType_val(value val) {
  int tag = Int_val(val);
  if (tag == 28713888) return GTK_POS_LEFT; /* `LEFT */
  else if (tag == 961111566) return GTK_POS_RIGHT; /* `RIGHT */
  else if (tag == 281490397) return GTK_POS_TOP; /* `TOP */
  else if (tag == 585108400) return GTK_POS_BOTTOM; /* `BOTTOM */
  else return GTK_POS_LEFT; /* fallback to first value */
}

/* Convert GtkPrintDuplex to OCaml value */
static value Val_PrintDuplex(GtkPrintDuplex val) {
  switch (val) {
    case GTK_PRINT_DUPLEX_SIMPLEX: return Val_int(654609252); /* `SIMPLEX */
    case GTK_PRINT_DUPLEX_HORIZONTAL: return Val_int(691710922); /* `HORIZONTAL */
    case GTK_PRINT_DUPLEX_VERTICAL: return Val_int(721220360); /* `VERTICAL */
    default: return Val_int(654609252); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPrintDuplex */
static GtkPrintDuplex PrintDuplex_val(value val) {
  int tag = Int_val(val);
  if (tag == 654609252) return GTK_PRINT_DUPLEX_SIMPLEX; /* `SIMPLEX */
  else if (tag == 691710922) return GTK_PRINT_DUPLEX_HORIZONTAL; /* `HORIZONTAL */
  else if (tag == 721220360) return GTK_PRINT_DUPLEX_VERTICAL; /* `VERTICAL */
  else return GTK_PRINT_DUPLEX_SIMPLEX; /* fallback to first value */
}

/* Convert GtkPrintError to OCaml value */
static value Val_PrintError(GtkPrintError val) {
  switch (val) {
    case GTK_PRINT_ERROR_GENERAL: return Val_int(687201147); /* `GENERAL */
    case GTK_PRINT_ERROR_INTERNAL_ERROR: return Val_int(193188089); /* `INTERNAL_ERROR */
    case GTK_PRINT_ERROR_NOMEM: return Val_int(810241942); /* `NOMEM */
    case GTK_PRINT_ERROR_INVALID_FILE: return Val_int(661826884); /* `INVALID_FILE */
    default: return Val_int(687201147); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPrintError */
static GtkPrintError PrintError_val(value val) {
  int tag = Int_val(val);
  if (tag == 687201147) return GTK_PRINT_ERROR_GENERAL; /* `GENERAL */
  else if (tag == 193188089) return GTK_PRINT_ERROR_INTERNAL_ERROR; /* `INTERNAL_ERROR */
  else if (tag == 810241942) return GTK_PRINT_ERROR_NOMEM; /* `NOMEM */
  else if (tag == 661826884) return GTK_PRINT_ERROR_INVALID_FILE; /* `INVALID_FILE */
  else return GTK_PRINT_ERROR_GENERAL; /* fallback to first value */
}

/* Convert GtkPrintOperationAction to OCaml value */
static value Val_PrintOperationAction(GtkPrintOperationAction val) {
  switch (val) {
    case GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG: return Val_int(6879993); /* `PRINT_DIALOG */
    case GTK_PRINT_OPERATION_ACTION_PRINT: return Val_int(474918946); /* `PRINT */
    case GTK_PRINT_OPERATION_ACTION_PREVIEW: return Val_int(630775797); /* `PREVIEW */
    case GTK_PRINT_OPERATION_ACTION_EXPORT: return Val_int(72232104); /* `EXPORT */
    default: return Val_int(6879993); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPrintOperationAction */
static GtkPrintOperationAction PrintOperationAction_val(value val) {
  int tag = Int_val(val);
  if (tag == 6879993) return GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG; /* `PRINT_DIALOG */
  else if (tag == 474918946) return GTK_PRINT_OPERATION_ACTION_PRINT; /* `PRINT */
  else if (tag == 630775797) return GTK_PRINT_OPERATION_ACTION_PREVIEW; /* `PREVIEW */
  else if (tag == 72232104) return GTK_PRINT_OPERATION_ACTION_EXPORT; /* `EXPORT */
  else return GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG; /* fallback to first value */
}

/* Convert GtkPrintOperationResult to OCaml value */
static value Val_PrintOperationResult(GtkPrintOperationResult val) {
  switch (val) {
    case GTK_PRINT_OPERATION_RESULT_ERROR: return Val_int(1064539868); /* `ERROR */
    case GTK_PRINT_OPERATION_RESULT_APPLY: return Val_int(1008837130); /* `APPLY */
    case GTK_PRINT_OPERATION_RESULT_CANCEL: return Val_int(809667861); /* `CANCEL */
    case GTK_PRINT_OPERATION_RESULT_IN_PROGRESS: return Val_int(581965257); /* `IN_PROGRESS */
    default: return Val_int(1064539868); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPrintOperationResult */
static GtkPrintOperationResult PrintOperationResult_val(value val) {
  int tag = Int_val(val);
  if (tag == 1064539868) return GTK_PRINT_OPERATION_RESULT_ERROR; /* `ERROR */
  else if (tag == 1008837130) return GTK_PRINT_OPERATION_RESULT_APPLY; /* `APPLY */
  else if (tag == 809667861) return GTK_PRINT_OPERATION_RESULT_CANCEL; /* `CANCEL */
  else if (tag == 581965257) return GTK_PRINT_OPERATION_RESULT_IN_PROGRESS; /* `IN_PROGRESS */
  else return GTK_PRINT_OPERATION_RESULT_ERROR; /* fallback to first value */
}

/* Convert GtkPrintPages to OCaml value */
static value Val_PrintPages(GtkPrintPages val) {
  switch (val) {
    case GTK_PRINT_PAGES_ALL: return Val_int(96450141); /* `ALL */
    case GTK_PRINT_PAGES_CURRENT: return Val_int(463469311); /* `CURRENT */
    case GTK_PRINT_PAGES_RANGES: return Val_int(139286057); /* `RANGES */
    case GTK_PRINT_PAGES_SELECTION: return Val_int(472521137); /* `SELECTION */
    default: return Val_int(96450141); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPrintPages */
static GtkPrintPages PrintPages_val(value val) {
  int tag = Int_val(val);
  if (tag == 96450141) return GTK_PRINT_PAGES_ALL; /* `ALL */
  else if (tag == 463469311) return GTK_PRINT_PAGES_CURRENT; /* `CURRENT */
  else if (tag == 139286057) return GTK_PRINT_PAGES_RANGES; /* `RANGES */
  else if (tag == 472521137) return GTK_PRINT_PAGES_SELECTION; /* `SELECTION */
  else return GTK_PRINT_PAGES_ALL; /* fallback to first value */
}

/* Convert GtkPrintQuality to OCaml value */
static value Val_PrintQuality(GtkPrintQuality val) {
  switch (val) {
    case GTK_PRINT_QUALITY_LOW: return Val_int(1031179617); /* `LOW */
    case GTK_PRINT_QUALITY_NORMAL: return Val_int(888717969); /* `NORMAL */
    case GTK_PRINT_QUALITY_HIGH: return Val_int(418746517); /* `HIGH */
    case GTK_PRINT_QUALITY_DRAFT: return Val_int(561222414); /* `DRAFT */
    default: return Val_int(1031179617); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPrintQuality */
static GtkPrintQuality PrintQuality_val(value val) {
  int tag = Int_val(val);
  if (tag == 1031179617) return GTK_PRINT_QUALITY_LOW; /* `LOW */
  else if (tag == 888717969) return GTK_PRINT_QUALITY_NORMAL; /* `NORMAL */
  else if (tag == 418746517) return GTK_PRINT_QUALITY_HIGH; /* `HIGH */
  else if (tag == 561222414) return GTK_PRINT_QUALITY_DRAFT; /* `DRAFT */
  else return GTK_PRINT_QUALITY_LOW; /* fallback to first value */
}

/* Convert GtkPrintStatus to OCaml value */
static value Val_PrintStatus(GtkPrintStatus val) {
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
static GtkPrintStatus PrintStatus_val(value val) {
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
static value Val_PropagationLimit(GtkPropagationLimit val) {
  switch (val) {
    case GTK_LIMIT_NONE: return Val_int(37469934); /* `NONE */
    case GTK_LIMIT_SAME_NATIVE: return Val_int(14915700); /* `SAME_NATIVE */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPropagationLimit */
static GtkPropagationLimit PropagationLimit_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_LIMIT_NONE; /* `NONE */
  else if (tag == 14915700) return GTK_LIMIT_SAME_NATIVE; /* `SAME_NATIVE */
  else return GTK_LIMIT_NONE; /* fallback to first value */
}

/* Convert GtkPropagationPhase to OCaml value */
static value Val_PropagationPhase(GtkPropagationPhase val) {
  switch (val) {
    case GTK_PHASE_NONE: return Val_int(37469934); /* `NONE */
    case GTK_PHASE_CAPTURE: return Val_int(928956893); /* `CAPTURE */
    case GTK_PHASE_BUBBLE: return Val_int(477126522); /* `BUBBLE */
    case GTK_PHASE_TARGET: return Val_int(780720412); /* `TARGET */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkPropagationPhase */
static GtkPropagationPhase PropagationPhase_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_PHASE_NONE; /* `NONE */
  else if (tag == 928956893) return GTK_PHASE_CAPTURE; /* `CAPTURE */
  else if (tag == 477126522) return GTK_PHASE_BUBBLE; /* `BUBBLE */
  else if (tag == 780720412) return GTK_PHASE_TARGET; /* `TARGET */
  else return GTK_PHASE_NONE; /* fallback to first value */
}

/* Convert GtkRecentManagerError to OCaml value */
static value Val_RecentManagerError(GtkRecentManagerError val) {
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
static GtkRecentManagerError RecentManagerError_val(value val) {
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
static value Val_ResponseType(GtkResponseType val) {
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
static GtkResponseType ResponseType_val(value val) {
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
static value Val_RevealerTransitionType(GtkRevealerTransitionType val) {
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
static GtkRevealerTransitionType RevealerTransitionType_val(value val) {
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
static value Val_ScrollStep(GtkScrollStep val) {
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
static GtkScrollStep ScrollStep_val(value val) {
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
static value Val_ScrollType(GtkScrollType val) {
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
static GtkScrollType ScrollType_val(value val) {
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
static value Val_ScrollablePolicy(GtkScrollablePolicy val) {
  switch (val) {
    case GTK_SCROLL_MINIMUM: return Val_int(409346596); /* `MINIMUM */
    case GTK_SCROLL_NATURAL: return Val_int(934000437); /* `NATURAL */
    default: return Val_int(409346596); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkScrollablePolicy */
static GtkScrollablePolicy ScrollablePolicy_val(value val) {
  int tag = Int_val(val);
  if (tag == 409346596) return GTK_SCROLL_MINIMUM; /* `MINIMUM */
  else if (tag == 934000437) return GTK_SCROLL_NATURAL; /* `NATURAL */
  else return GTK_SCROLL_MINIMUM; /* fallback to first value */
}

/* Convert GtkSelectionMode to OCaml value */
static value Val_SelectionMode(GtkSelectionMode val) {
  switch (val) {
    case GTK_SELECTION_NONE: return Val_int(37469934); /* `NONE */
    case GTK_SELECTION_SINGLE: return Val_int(155377302); /* `SINGLE */
    case GTK_SELECTION_BROWSE: return Val_int(552799969); /* `BROWSE */
    case GTK_SELECTION_MULTIPLE: return Val_int(832841979); /* `MULTIPLE */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSelectionMode */
static GtkSelectionMode SelectionMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_SELECTION_NONE; /* `NONE */
  else if (tag == 155377302) return GTK_SELECTION_SINGLE; /* `SINGLE */
  else if (tag == 552799969) return GTK_SELECTION_BROWSE; /* `BROWSE */
  else if (tag == 832841979) return GTK_SELECTION_MULTIPLE; /* `MULTIPLE */
  else return GTK_SELECTION_NONE; /* fallback to first value */
}

/* Convert GtkSensitivityType to OCaml value */
static value Val_SensitivityType(GtkSensitivityType val) {
  switch (val) {
    case GTK_SENSITIVITY_AUTO: return Val_int(736658275); /* `AUTO */
    case GTK_SENSITIVITY_ON: return Val_int(358689837); /* `ON */
    case GTK_SENSITIVITY_OFF: return Val_int(1012881152); /* `OFF */
    default: return Val_int(736658275); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSensitivityType */
static GtkSensitivityType SensitivityType_val(value val) {
  int tag = Int_val(val);
  if (tag == 736658275) return GTK_SENSITIVITY_AUTO; /* `AUTO */
  else if (tag == 358689837) return GTK_SENSITIVITY_ON; /* `ON */
  else if (tag == 1012881152) return GTK_SENSITIVITY_OFF; /* `OFF */
  else return GTK_SENSITIVITY_AUTO; /* fallback to first value */
}

/* Convert GtkShortcutScope to OCaml value */
static value Val_ShortcutScope(GtkShortcutScope val) {
  switch (val) {
    case GTK_SHORTCUT_SCOPE_LOCAL: return Val_int(472786094); /* `LOCAL */
    case GTK_SHORTCUT_SCOPE_MANAGED: return Val_int(825938836); /* `MANAGED */
    case GTK_SHORTCUT_SCOPE_GLOBAL: return Val_int(855540574); /* `GLOBAL */
    default: return Val_int(472786094); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkShortcutScope */
static GtkShortcutScope ShortcutScope_val(value val) {
  int tag = Int_val(val);
  if (tag == 472786094) return GTK_SHORTCUT_SCOPE_LOCAL; /* `LOCAL */
  else if (tag == 825938836) return GTK_SHORTCUT_SCOPE_MANAGED; /* `MANAGED */
  else if (tag == 855540574) return GTK_SHORTCUT_SCOPE_GLOBAL; /* `GLOBAL */
  else return GTK_SHORTCUT_SCOPE_LOCAL; /* fallback to first value */
}

/* Convert GtkShortcutType to OCaml value */
static value Val_ShortcutType(GtkShortcutType val) {
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
static GtkShortcutType ShortcutType_val(value val) {
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
static value Val_SizeGroupMode(GtkSizeGroupMode val) {
  switch (val) {
    case GTK_SIZE_GROUP_NONE: return Val_int(37469934); /* `NONE */
    case GTK_SIZE_GROUP_HORIZONTAL: return Val_int(691710922); /* `HORIZONTAL */
    case GTK_SIZE_GROUP_VERTICAL: return Val_int(721220360); /* `VERTICAL */
    case GTK_SIZE_GROUP_BOTH: return Val_int(85085456); /* `BOTH */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSizeGroupMode */
static GtkSizeGroupMode SizeGroupMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_SIZE_GROUP_NONE; /* `NONE */
  else if (tag == 691710922) return GTK_SIZE_GROUP_HORIZONTAL; /* `HORIZONTAL */
  else if (tag == 721220360) return GTK_SIZE_GROUP_VERTICAL; /* `VERTICAL */
  else if (tag == 85085456) return GTK_SIZE_GROUP_BOTH; /* `BOTH */
  else return GTK_SIZE_GROUP_NONE; /* fallback to first value */
}

/* Convert GtkSizeRequestMode to OCaml value */
static value Val_SizeRequestMode(GtkSizeRequestMode val) {
  switch (val) {
    case GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH: return Val_int(141946488); /* `HEIGHT_FOR_WIDTH */
    case GTK_SIZE_REQUEST_WIDTH_FOR_HEIGHT: return Val_int(751195212); /* `WIDTH_FOR_HEIGHT */
    case GTK_SIZE_REQUEST_CONSTANT_SIZE: return Val_int(160571541); /* `CONSTANT_SIZE */
    default: return Val_int(141946488); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSizeRequestMode */
static GtkSizeRequestMode SizeRequestMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 141946488) return GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH; /* `HEIGHT_FOR_WIDTH */
  else if (tag == 751195212) return GTK_SIZE_REQUEST_WIDTH_FOR_HEIGHT; /* `WIDTH_FOR_HEIGHT */
  else if (tag == 160571541) return GTK_SIZE_REQUEST_CONSTANT_SIZE; /* `CONSTANT_SIZE */
  else return GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH; /* fallback to first value */
}

/* Convert GtkSortType to OCaml value */
static value Val_SortType(GtkSortType val) {
  switch (val) {
    case GTK_SORT_ASCENDING: return Val_int(659141842); /* `ASCENDING */
    case GTK_SORT_DESCENDING: return Val_int(739271559); /* `DESCENDING */
    default: return Val_int(659141842); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSortType */
static GtkSortType SortType_val(value val) {
  int tag = Int_val(val);
  if (tag == 659141842) return GTK_SORT_ASCENDING; /* `ASCENDING */
  else if (tag == 739271559) return GTK_SORT_DESCENDING; /* `DESCENDING */
  else return GTK_SORT_ASCENDING; /* fallback to first value */
}

/* Convert GtkSorterChange to OCaml value */
static value Val_SorterChange(GtkSorterChange val) {
  switch (val) {
    case GTK_SORTER_CHANGE_DIFFERENT: return Val_int(163830453); /* `DIFFERENT */
    case GTK_SORTER_CHANGE_INVERTED: return Val_int(878663356); /* `INVERTED */
    case GTK_SORTER_CHANGE_LESS_STRICT: return Val_int(620736805); /* `LESS_STRICT */
    case GTK_SORTER_CHANGE_MORE_STRICT: return Val_int(429188853); /* `MORE_STRICT */
    default: return Val_int(163830453); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSorterChange */
static GtkSorterChange SorterChange_val(value val) {
  int tag = Int_val(val);
  if (tag == 163830453) return GTK_SORTER_CHANGE_DIFFERENT; /* `DIFFERENT */
  else if (tag == 878663356) return GTK_SORTER_CHANGE_INVERTED; /* `INVERTED */
  else if (tag == 620736805) return GTK_SORTER_CHANGE_LESS_STRICT; /* `LESS_STRICT */
  else if (tag == 429188853) return GTK_SORTER_CHANGE_MORE_STRICT; /* `MORE_STRICT */
  else return GTK_SORTER_CHANGE_DIFFERENT; /* fallback to first value */
}

/* Convert GtkSorterOrder to OCaml value */
static value Val_SorterOrder(GtkSorterOrder val) {
  switch (val) {
    case GTK_SORTER_ORDER_PARTIAL: return Val_int(543851302); /* `PARTIAL */
    case GTK_SORTER_ORDER_NONE: return Val_int(37469934); /* `NONE */
    case GTK_SORTER_ORDER_TOTAL: return Val_int(927925646); /* `TOTAL */
    default: return Val_int(543851302); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSorterOrder */
static GtkSorterOrder SorterOrder_val(value val) {
  int tag = Int_val(val);
  if (tag == 543851302) return GTK_SORTER_ORDER_PARTIAL; /* `PARTIAL */
  else if (tag == 37469934) return GTK_SORTER_ORDER_NONE; /* `NONE */
  else if (tag == 927925646) return GTK_SORTER_ORDER_TOTAL; /* `TOTAL */
  else return GTK_SORTER_ORDER_PARTIAL; /* fallback to first value */
}

/* Convert GtkSpinButtonUpdatePolicy to OCaml value */
static value Val_SpinButtonUpdatePolicy(GtkSpinButtonUpdatePolicy val) {
  switch (val) {
    case GTK_UPDATE_ALWAYS: return Val_int(21963510); /* `ALWAYS */
    case GTK_UPDATE_IF_VALID: return Val_int(1048476729); /* `IF_VALID */
    default: return Val_int(21963510); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSpinButtonUpdatePolicy */
static GtkSpinButtonUpdatePolicy SpinButtonUpdatePolicy_val(value val) {
  int tag = Int_val(val);
  if (tag == 21963510) return GTK_UPDATE_ALWAYS; /* `ALWAYS */
  else if (tag == 1048476729) return GTK_UPDATE_IF_VALID; /* `IF_VALID */
  else return GTK_UPDATE_ALWAYS; /* fallback to first value */
}

/* Convert GtkSpinType to OCaml value */
static value Val_SpinType(GtkSpinType val) {
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
static GtkSpinType SpinType_val(value val) {
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
static value Val_StackTransitionType(GtkStackTransitionType val) {
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
static GtkStackTransitionType StackTransitionType_val(value val) {
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
static value Val_StringFilterMatchMode(GtkStringFilterMatchMode val) {
  switch (val) {
    case GTK_STRING_FILTER_MATCH_MODE_EXACT: return Val_int(863737765); /* `EXACT */
    case GTK_STRING_FILTER_MATCH_MODE_SUBSTRING: return Val_int(334670662); /* `SUBSTRING */
    case GTK_STRING_FILTER_MATCH_MODE_PREFIX: return Val_int(243036487); /* `PREFIX */
    default: return Val_int(863737765); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkStringFilterMatchMode */
static GtkStringFilterMatchMode StringFilterMatchMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 863737765) return GTK_STRING_FILTER_MATCH_MODE_EXACT; /* `EXACT */
  else if (tag == 334670662) return GTK_STRING_FILTER_MATCH_MODE_SUBSTRING; /* `SUBSTRING */
  else if (tag == 243036487) return GTK_STRING_FILTER_MATCH_MODE_PREFIX; /* `PREFIX */
  else return GTK_STRING_FILTER_MATCH_MODE_EXACT; /* fallback to first value */
}

/* Convert GtkSymbolicColor to OCaml value */
static value Val_SymbolicColor(GtkSymbolicColor val) {
  switch (val) {
    case GTK_SYMBOLIC_COLOR_FOREGROUND: return Val_int(351117237); /* `FOREGROUND */
    case GTK_SYMBOLIC_COLOR_ERROR: return Val_int(1064539868); /* `ERROR */
    case GTK_SYMBOLIC_COLOR_WARNING: return Val_int(928678842); /* `WARNING */
    case GTK_SYMBOLIC_COLOR_SUCCESS: return Val_int(414243364); /* `SUCCESS */
    default: return Val_int(351117237); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkSymbolicColor */
static GtkSymbolicColor SymbolicColor_val(value val) {
  int tag = Int_val(val);
  if (tag == 351117237) return GTK_SYMBOLIC_COLOR_FOREGROUND; /* `FOREGROUND */
  else if (tag == 1064539868) return GTK_SYMBOLIC_COLOR_ERROR; /* `ERROR */
  else if (tag == 928678842) return GTK_SYMBOLIC_COLOR_WARNING; /* `WARNING */
  else if (tag == 414243364) return GTK_SYMBOLIC_COLOR_SUCCESS; /* `SUCCESS */
  else return GTK_SYMBOLIC_COLOR_FOREGROUND; /* fallback to first value */
}

/* Convert GtkSystemSetting to OCaml value */
static value Val_SystemSetting(GtkSystemSetting val) {
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
static GtkSystemSetting SystemSetting_val(value val) {
  int tag = Int_val(val);
  if (tag == 511308664) return GTK_SYSTEM_SETTING_DPI; /* `DPI */
  else if (tag == 12153804) return GTK_SYSTEM_SETTING_FONT_NAME; /* `FONT_NAME */
  else if (tag == 578417707) return GTK_SYSTEM_SETTING_FONT_CONFIG; /* `FONT_CONFIG */
  else if (tag == 717839303) return GTK_SYSTEM_SETTING_DISPLAY; /* `DISPLAY */
  else if (tag == 999611675) return GTK_SYSTEM_SETTING_ICON_THEME; /* `ICON_THEME */
  else return GTK_SYSTEM_SETTING_DPI; /* fallback to first value */
}

/* Convert GtkTextDirection to OCaml value */
static value Val_TextDirection(GtkTextDirection val) {
  switch (val) {
    case GTK_TEXT_DIR_NONE: return Val_int(37469934); /* `NONE */
    case GTK_TEXT_DIR_LTR: return Val_int(1043707392); /* `LTR */
    case GTK_TEXT_DIR_RTL: return Val_int(286034419); /* `RTL */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkTextDirection */
static GtkTextDirection TextDirection_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_TEXT_DIR_NONE; /* `NONE */
  else if (tag == 1043707392) return GTK_TEXT_DIR_LTR; /* `LTR */
  else if (tag == 286034419) return GTK_TEXT_DIR_RTL; /* `RTL */
  else return GTK_TEXT_DIR_NONE; /* fallback to first value */
}

/* Convert GtkTextExtendSelection to OCaml value */
static value Val_TextExtendSelection(GtkTextExtendSelection val) {
  switch (val) {
    case GTK_TEXT_EXTEND_SELECTION_WORD: return Val_int(777616121); /* `WORD */
    case GTK_TEXT_EXTEND_SELECTION_LINE: return Val_int(452458406); /* `LINE */
    default: return Val_int(777616121); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkTextExtendSelection */
static GtkTextExtendSelection TextExtendSelection_val(value val) {
  int tag = Int_val(val);
  if (tag == 777616121) return GTK_TEXT_EXTEND_SELECTION_WORD; /* `WORD */
  else if (tag == 452458406) return GTK_TEXT_EXTEND_SELECTION_LINE; /* `LINE */
  else return GTK_TEXT_EXTEND_SELECTION_WORD; /* fallback to first value */
}

/* Convert GtkTextViewLayer to OCaml value */
static value Val_TextViewLayer(GtkTextViewLayer val) {
  switch (val) {
    case GTK_TEXT_VIEW_LAYER_BELOW_TEXT: return Val_int(443612387); /* `BELOW_TEXT */
    case GTK_TEXT_VIEW_LAYER_ABOVE_TEXT: return Val_int(114488273); /* `ABOVE_TEXT */
    default: return Val_int(443612387); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkTextViewLayer */
static GtkTextViewLayer TextViewLayer_val(value val) {
  int tag = Int_val(val);
  if (tag == 443612387) return GTK_TEXT_VIEW_LAYER_BELOW_TEXT; /* `BELOW_TEXT */
  else if (tag == 114488273) return GTK_TEXT_VIEW_LAYER_ABOVE_TEXT; /* `ABOVE_TEXT */
  else return GTK_TEXT_VIEW_LAYER_BELOW_TEXT; /* fallback to first value */
}

/* Convert GtkTextWindowType to OCaml value */
static value Val_TextWindowType(GtkTextWindowType val) {
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
static GtkTextWindowType TextWindowType_val(value val) {
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
static value Val_TreeViewColumnSizing(GtkTreeViewColumnSizing val) {
  switch (val) {
    case GTK_TREE_VIEW_COLUMN_GROW_ONLY: return Val_int(1055511427); /* `GROW_ONLY */
    case GTK_TREE_VIEW_COLUMN_AUTOSIZE: return Val_int(602028811); /* `AUTOSIZE */
    case GTK_TREE_VIEW_COLUMN_FIXED: return Val_int(1055799355); /* `FIXED */
    default: return Val_int(1055511427); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkTreeViewColumnSizing */
static GtkTreeViewColumnSizing TreeViewColumnSizing_val(value val) {
  int tag = Int_val(val);
  if (tag == 1055511427) return GTK_TREE_VIEW_COLUMN_GROW_ONLY; /* `GROW_ONLY */
  else if (tag == 602028811) return GTK_TREE_VIEW_COLUMN_AUTOSIZE; /* `AUTOSIZE */
  else if (tag == 1055799355) return GTK_TREE_VIEW_COLUMN_FIXED; /* `FIXED */
  else return GTK_TREE_VIEW_COLUMN_GROW_ONLY; /* fallback to first value */
}

/* Convert GtkTreeViewDropPosition to OCaml value */
static value Val_TreeViewDropPosition(GtkTreeViewDropPosition val) {
  switch (val) {
    case GTK_TREE_VIEW_DROP_BEFORE: return Val_int(976625365); /* `BEFORE */
    case GTK_TREE_VIEW_DROP_AFTER: return Val_int(1029660537); /* `AFTER */
    case GTK_TREE_VIEW_DROP_INTO_OR_BEFORE: return Val_int(956560000); /* `INTO_OR_BEFORE */
    case GTK_TREE_VIEW_DROP_INTO_OR_AFTER: return Val_int(350344266); /* `INTO_OR_AFTER */
    default: return Val_int(976625365); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkTreeViewDropPosition */
static GtkTreeViewDropPosition TreeViewDropPosition_val(value val) {
  int tag = Int_val(val);
  if (tag == 976625365) return GTK_TREE_VIEW_DROP_BEFORE; /* `BEFORE */
  else if (tag == 1029660537) return GTK_TREE_VIEW_DROP_AFTER; /* `AFTER */
  else if (tag == 956560000) return GTK_TREE_VIEW_DROP_INTO_OR_BEFORE; /* `INTO_OR_BEFORE */
  else if (tag == 350344266) return GTK_TREE_VIEW_DROP_INTO_OR_AFTER; /* `INTO_OR_AFTER */
  else return GTK_TREE_VIEW_DROP_BEFORE; /* fallback to first value */
}

/* Convert GtkTreeViewGridLines to OCaml value */
static value Val_TreeViewGridLines(GtkTreeViewGridLines val) {
  switch (val) {
    case GTK_TREE_VIEW_GRID_LINES_NONE: return Val_int(37469934); /* `NONE */
    case GTK_TREE_VIEW_GRID_LINES_HORIZONTAL: return Val_int(691710922); /* `HORIZONTAL */
    case GTK_TREE_VIEW_GRID_LINES_VERTICAL: return Val_int(721220360); /* `VERTICAL */
    case GTK_TREE_VIEW_GRID_LINES_BOTH: return Val_int(85085456); /* `BOTH */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkTreeViewGridLines */
static GtkTreeViewGridLines TreeViewGridLines_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_TREE_VIEW_GRID_LINES_NONE; /* `NONE */
  else if (tag == 691710922) return GTK_TREE_VIEW_GRID_LINES_HORIZONTAL; /* `HORIZONTAL */
  else if (tag == 721220360) return GTK_TREE_VIEW_GRID_LINES_VERTICAL; /* `VERTICAL */
  else if (tag == 85085456) return GTK_TREE_VIEW_GRID_LINES_BOTH; /* `BOTH */
  else return GTK_TREE_VIEW_GRID_LINES_NONE; /* fallback to first value */
}

/* Convert GtkUnit to OCaml value */
static value Val_Unit(GtkUnit val) {
  switch (val) {
    case GTK_UNIT_NONE: return Val_int(37469934); /* `NONE */
    case GTK_UNIT_POINTS: return Val_int(403443644); /* `POINTS */
    case GTK_UNIT_INCH: return Val_int(687648425); /* `INCH */
    case GTK_UNIT_MM: return Val_int(202694556); /* `MM */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkUnit */
static GtkUnit Unit_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_UNIT_NONE; /* `NONE */
  else if (tag == 403443644) return GTK_UNIT_POINTS; /* `POINTS */
  else if (tag == 687648425) return GTK_UNIT_INCH; /* `INCH */
  else if (tag == 202694556) return GTK_UNIT_MM; /* `MM */
  else return GTK_UNIT_NONE; /* fallback to first value */
}

/* Convert GtkWrapMode to OCaml value */
static value Val_WrapMode(GtkWrapMode val) {
  switch (val) {
    case GTK_WRAP_NONE: return Val_int(37469934); /* `NONE */
    case GTK_WRAP_CHAR: return Val_int(673743267); /* `CHAR */
    case GTK_WRAP_WORD: return Val_int(777616121); /* `WORD */
    case GTK_WRAP_WORD_CHAR: return Val_int(647176300); /* `WORD_CHAR */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GtkWrapMode */
static GtkWrapMode WrapMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GTK_WRAP_NONE; /* `NONE */
  else if (tag == 673743267) return GTK_WRAP_CHAR; /* `CHAR */
  else if (tag == 777616121) return GTK_WRAP_WORD; /* `WORD */
  else if (tag == 647176300) return GTK_WRAP_WORD_CHAR; /* `WORD_CHAR */
  else return GTK_WRAP_NONE; /* fallback to first value */
}

/* Convert GtkApplicationInhibitFlags to OCaml flag list */
static value Val_ApplicationInhibitFlags(GtkApplicationInhibitFlags flags) {
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
static GtkApplicationInhibitFlags ApplicationInhibitFlags_val(value list) {
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
static value Val_BuilderClosureFlags(GtkBuilderClosureFlags flags) {
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
static GtkBuilderClosureFlags BuilderClosureFlags_val(value list) {
  GtkBuilderClosureFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 33727952) result |= GTK_BUILDER_CLOSURE_SWAPPED; /* `SWAPPED */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkCellRendererState to OCaml flag list */
static value Val_CellRendererState(GtkCellRendererState flags) {
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
static GtkCellRendererState CellRendererState_val(value list) {
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
static value Val_DebugFlags(GtkDebugFlags flags) {
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
static GtkDebugFlags DebugFlags_val(value list) {
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
static value Val_DialogFlags(GtkDialogFlags flags) {
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
static GtkDialogFlags DialogFlags_val(value list) {
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
static value Val_EventControllerScrollFlags(GtkEventControllerScrollFlags flags) {
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
static GtkEventControllerScrollFlags EventControllerScrollFlags_val(value list) {
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
static value Val_FontChooserLevel(GtkFontChooserLevel flags) {
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
static GtkFontChooserLevel FontChooserLevel_val(value list) {
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
static value Val_IconLookupFlags(GtkIconLookupFlags flags) {
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
static GtkIconLookupFlags IconLookupFlags_val(value list) {
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
static value Val_InputHints(GtkInputHints flags) {
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
static GtkInputHints InputHints_val(value list) {
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
static value Val_ListScrollFlags(GtkListScrollFlags flags) {
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
static GtkListScrollFlags ListScrollFlags_val(value list) {
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
static value Val_PickFlags(GtkPickFlags flags) {
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
static GtkPickFlags PickFlags_val(value list) {
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
static value Val_PopoverMenuFlags(GtkPopoverMenuFlags flags) {
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
static GtkPopoverMenuFlags PopoverMenuFlags_val(value list) {
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
static value Val_ShortcutActionFlags(GtkShortcutActionFlags flags) {
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
static GtkShortcutActionFlags ShortcutActionFlags_val(value list) {
  GtkShortcutActionFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 82263211) result |= GTK_SHORTCUT_ACTION_EXCLUSIVE; /* `EXCLUSIVE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GtkStateFlags to OCaml flag list */
static value Val_StateFlags(GtkStateFlags flags) {
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
static GtkStateFlags StateFlags_val(value list) {
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
static value Val_StyleContextPrintFlags(GtkStyleContextPrintFlags flags) {
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
static GtkStyleContextPrintFlags StyleContextPrintFlags_val(value list) {
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
static value Val_TextSearchFlags(GtkTextSearchFlags flags) {
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
static GtkTextSearchFlags TextSearchFlags_val(value list) {
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
static value Val_TreeModelFlags(GtkTreeModelFlags flags) {
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
static GtkTreeModelFlags TreeModelFlags_val(value list) {
  GtkTreeModelFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == 691929692) result |= GTK_TREE_MODEL_ITERS_PERSIST; /* `ITERS_PERSIST */
    else if (tag == 1037614639) result |= GTK_TREE_MODEL_LIST_ONLY; /* `LIST_ONLY */
    list = Field(list, 1);
  }
  return result;
}


CAMLprim value ml_gtk_event_controller_set_static_name(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_event_controller_set_static_name(GtkEventController_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_event_controller_set_propagation_phase(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_event_controller_set_propagation_phase(GtkEventController_val(self), PropagationPhase_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_event_controller_set_propagation_limit(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_event_controller_set_propagation_limit(GtkEventController_val(self), PropagationLimit_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_event_controller_set_name(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_event_controller_set_name(GtkEventController_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_event_controller_reset(value self)
{
CAMLparam1(self);
gtk_event_controller_reset(GtkEventController_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_event_controller_get_widget(value self)
{
CAMLparam1(self);
GtkWidget* result = gtk_event_controller_get_widget(GtkEventController_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_event_controller_get_propagation_phase(value self)
{
CAMLparam1(self);
GtkPropagationPhase result = gtk_event_controller_get_propagation_phase(GtkEventController_val(self));
CAMLreturn(Val_PropagationPhase(result));
}

CAMLprim value ml_gtk_event_controller_get_propagation_limit(value self)
{
CAMLparam1(self);
GtkPropagationLimit result = gtk_event_controller_get_propagation_limit(GtkEventController_val(self));
CAMLreturn(Val_PropagationLimit(result));
}

CAMLprim value ml_gtk_event_controller_get_name(value self)
{
CAMLparam1(self);
const char* result = gtk_event_controller_get_name(GtkEventController_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_event_controller_get_current_event_time(value self)
{
CAMLparam1(self);
void *result = gtk_event_controller_get_current_event_time(GtkEventController_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_event_controller_get_current_event_state(value self)
{
CAMLparam1(self);
GdkModifierType result = gtk_event_controller_get_current_event_state(GtkEventController_val(self));
CAMLreturn(Val_ModifierType(result));
}

CAMLprim value ml_gtk_event_controller_get_current_event_device(value self)
{
CAMLparam1(self);
void *result = gtk_event_controller_get_current_event_device(GtkEventController_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_event_controller_get_current_event(value self)
{
CAMLparam1(self);
GdkEvent* result = gtk_event_controller_get_current_event(GtkEventController_val(self));
CAMLreturn(Val_GdkEvent(result));
}

CAMLprim value ml_gtk_event_controller_focus_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_event_controller_focus_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_event_controller_focus_is_focus(value self)
{
CAMLparam1(self);
gboolean result = gtk_event_controller_focus_is_focus(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_event_controller_focus_contains_focus(value self)
{
CAMLparam1(self);
gboolean result = gtk_event_controller_focus_contains_focus(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_event_controller_focus_get_contains_focus(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "contains-focus", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_event_controller_focus_get_is_focus(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "is-focus", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_event_controller_key_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_event_controller_key_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_event_controller_key_set_im_context(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_event_controller_key_set_im_context(GtkEventController_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_event_controller_key_get_im_context(value self)
{
CAMLparam1(self);
GtkIMContext* result = gtk_event_controller_key_get_im_context(GtkEventController_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_event_controller_key_get_group(value self)
{
CAMLparam1(self);
guint result = gtk_event_controller_key_get_group(GtkEventController_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_event_controller_key_forward(value self, value arg1)
{
CAMLparam2(self, arg1);
gboolean result = gtk_event_controller_key_forward(GtkEventController_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_event_controller_legacy_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_event_controller_legacy_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_event_controller_motion_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_event_controller_motion_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_event_controller_motion_is_pointer(value self)
{
CAMLparam1(self);
gboolean result = gtk_event_controller_motion_is_pointer(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_event_controller_motion_contains_pointer(value self)
{
CAMLparam1(self);
gboolean result = gtk_event_controller_motion_contains_pointer(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_event_controller_motion_get_contains_pointer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "contains-pointer", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_event_controller_motion_get_is_pointer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "is-pointer", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_event_controller_scroll_new(value arg1)
{
CAMLparam1(arg1);
GtkEventController *controller = gtk_event_controller_scroll_new(EventControllerScrollFlags_val(arg1));
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_event_controller_scroll_set_flags(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_event_controller_scroll_set_flags(GtkEventController_val(self), EventControllerScrollFlags_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_event_controller_scroll_get_unit(value self)
{
CAMLparam1(self);
GdkScrollUnit result = gtk_event_controller_scroll_get_unit(GtkEventController_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_event_controller_scroll_get_flags(value self)
{
CAMLparam1(self);
GtkEventControllerScrollFlags result = gtk_event_controller_scroll_get_flags(GtkEventController_val(self));
CAMLreturn(Val_EventControllerScrollFlags(result));
}

CAMLprim value ml_gtk_gesture_click_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_click_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_gesture_drag_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_drag_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_gesture_drag_get_start_point(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gboolean result = gtk_gesture_drag_get_start_point(GtkEventController_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_gesture_drag_get_offset(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gboolean result = gtk_gesture_drag_get_offset(GtkEventController_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_gesture_long_press_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_long_press_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_gesture_long_press_get_delay_factor(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "delay-factor", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_gesture_long_press_set_delay_factor(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "delay-factor", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_gesture_pan_new(value arg1)
{
CAMLparam1(arg1);
GtkEventController *controller = gtk_gesture_pan_new(Orientation_val(arg1));
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_gesture_pan_set_orientation(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_gesture_pan_set_orientation(GtkEventController_val(self), Orientation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_gesture_pan_get_orientation(value self)
{
CAMLparam1(self);
GtkOrientation result = gtk_gesture_pan_get_orientation(GtkEventController_val(self));
CAMLreturn(Val_Orientation(result));
}

CAMLprim value ml_gtk_gesture_rotate_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_rotate_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_gesture_rotate_get_angle_delta(value self)
{
CAMLparam1(self);
double result = gtk_gesture_rotate_get_angle_delta(GtkEventController_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLprim value ml_gtk_gesture_single_get_current_sequence(value self)
{
CAMLparam1(self);
void *result = gtk_gesture_single_get_current_sequence(GtkEventController_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_gesture_single_get_current_button(value self)
{
CAMLparam1(self);
guint result = gtk_gesture_single_get_current_button(GtkEventController_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_gesture_single_get_button(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "button", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_gesture_single_set_button(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "button", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_gesture_single_get_exclusive(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "exclusive", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_gesture_single_set_exclusive(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "exclusive", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_gesture_single_get_touch_only(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "touch-only", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_gesture_single_set_touch_only(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "touch-only", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_gesture_stylus_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_stylus_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_gesture_stylus_get_device_tool(value self)
{
CAMLparam1(self);
void *result = gtk_gesture_stylus_get_device_tool(GtkEventController_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_gesture_stylus_get_backlog(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gboolean result = gtk_gesture_stylus_get_backlog(GtkEventController_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_gesture_stylus_get_axis(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gboolean result = gtk_gesture_stylus_get_axis(GtkEventController_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_gesture_stylus_get_axes(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gboolean result = gtk_gesture_stylus_get_axes(GtkEventController_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_gesture_stylus_get_stylus_only(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "stylus-only", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_gesture_stylus_set_stylus_only(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEventController *obj = (GtkEventController *)GtkEventController_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "stylus-only", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_gesture_swipe_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_swipe_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_gesture_swipe_get_velocity(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gboolean result = gtk_gesture_swipe_get_velocity(GtkEventController_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_gesture_zoom_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_gesture_zoom_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_gesture_zoom_get_scale_delta(value self)
{
CAMLparam1(self);
double result = gtk_gesture_zoom_get_scale_delta(GtkEventController_val(self));
CAMLreturn(caml_copy_double(result));
}
