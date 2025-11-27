/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GTK enums and bitfields */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Convert GtkAccessibleAnnouncementPriority to OCaml value */
value Val_GtkAccessibleAnnouncementPriority(GtkAccessibleAnnouncementPriority val) {
  switch (val) {
    case GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_LOW: return caml_hash_variant("LOW"); /* `LOW */
    case GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_MEDIUM: return caml_hash_variant("MEDIUM"); /* `MEDIUM */
    case GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_HIGH: return caml_hash_variant("HIGH"); /* `HIGH */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleAnnouncementPriority value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkAccessibleAnnouncementPriority */
GtkAccessibleAnnouncementPriority GtkAccessibleAnnouncementPriority_val(value val) {
  if (val == caml_hash_variant("LOW")) return GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_LOW; /* `LOW */
  else if (val == caml_hash_variant("MEDIUM")) return GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_MEDIUM; /* `MEDIUM */
  else if (val == caml_hash_variant("HIGH")) return GTK_ACCESSIBLE_ANNOUNCEMENT_PRIORITY_HIGH; /* `HIGH */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleAnnouncementPriority tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkAccessibleAutocomplete to OCaml value */
value Val_GtkAccessibleAutocomplete(GtkAccessibleAutocomplete val) {
  switch (val) {
    case GTK_ACCESSIBLE_AUTOCOMPLETE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_ACCESSIBLE_AUTOCOMPLETE_INLINE: return caml_hash_variant("INLINE"); /* `INLINE */
    case GTK_ACCESSIBLE_AUTOCOMPLETE_LIST: return caml_hash_variant("LIST"); /* `LIST */
    case GTK_ACCESSIBLE_AUTOCOMPLETE_BOTH: return caml_hash_variant("BOTH"); /* `BOTH */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleAutocomplete value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkAccessibleAutocomplete */
GtkAccessibleAutocomplete GtkAccessibleAutocomplete_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_ACCESSIBLE_AUTOCOMPLETE_NONE; /* `NONE */
  else if (val == caml_hash_variant("INLINE")) return GTK_ACCESSIBLE_AUTOCOMPLETE_INLINE; /* `INLINE */
  else if (val == caml_hash_variant("LIST")) return GTK_ACCESSIBLE_AUTOCOMPLETE_LIST; /* `LIST */
  else if (val == caml_hash_variant("BOTH")) return GTK_ACCESSIBLE_AUTOCOMPLETE_BOTH; /* `BOTH */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleAutocomplete tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkAccessibleInvalidState to OCaml value */
value Val_GtkAccessibleInvalidState(GtkAccessibleInvalidState val) {
  switch (val) {
    case GTK_ACCESSIBLE_INVALID_FALSE: return caml_hash_variant("FALSE"); /* `FALSE */
    case GTK_ACCESSIBLE_INVALID_TRUE: return caml_hash_variant("TRUE"); /* `TRUE */
    case GTK_ACCESSIBLE_INVALID_GRAMMAR: return caml_hash_variant("GRAMMAR"); /* `GRAMMAR */
    case GTK_ACCESSIBLE_INVALID_SPELLING: return caml_hash_variant("SPELLING"); /* `SPELLING */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleInvalidState value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkAccessibleInvalidState */
GtkAccessibleInvalidState GtkAccessibleInvalidState_val(value val) {
  if (val == caml_hash_variant("FALSE")) return GTK_ACCESSIBLE_INVALID_FALSE; /* `FALSE */
  else if (val == caml_hash_variant("TRUE")) return GTK_ACCESSIBLE_INVALID_TRUE; /* `TRUE */
  else if (val == caml_hash_variant("GRAMMAR")) return GTK_ACCESSIBLE_INVALID_GRAMMAR; /* `GRAMMAR */
  else if (val == caml_hash_variant("SPELLING")) return GTK_ACCESSIBLE_INVALID_SPELLING; /* `SPELLING */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleInvalidState tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkAccessiblePlatformState to OCaml value */
value Val_GtkAccessiblePlatformState(GtkAccessiblePlatformState val) {
  switch (val) {
    case GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSABLE: return caml_hash_variant("FOCUSABLE"); /* `FOCUSABLE */
    case GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSED: return caml_hash_variant("FOCUSED"); /* `FOCUSED */
    case GTK_ACCESSIBLE_PLATFORM_STATE_ACTIVE: return caml_hash_variant("ACTIVE"); /* `ACTIVE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkAccessiblePlatformState value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkAccessiblePlatformState */
GtkAccessiblePlatformState GtkAccessiblePlatformState_val(value val) {
  if (val == caml_hash_variant("FOCUSABLE")) return GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSABLE; /* `FOCUSABLE */
  else if (val == caml_hash_variant("FOCUSED")) return GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSED; /* `FOCUSED */
  else if (val == caml_hash_variant("ACTIVE")) return GTK_ACCESSIBLE_PLATFORM_STATE_ACTIVE; /* `ACTIVE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkAccessiblePlatformState tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkAccessibleProperty to OCaml value */
value Val_GtkAccessibleProperty(GtkAccessibleProperty val) {
  switch (val) {
    case GTK_ACCESSIBLE_PROPERTY_AUTOCOMPLETE: return caml_hash_variant("AUTOCOMPLETE"); /* `AUTOCOMPLETE */
    case GTK_ACCESSIBLE_PROPERTY_DESCRIPTION: return caml_hash_variant("DESCRIPTION"); /* `DESCRIPTION */
    case GTK_ACCESSIBLE_PROPERTY_HAS_POPUP: return caml_hash_variant("HAS_POPUP"); /* `HAS_POPUP */
    case GTK_ACCESSIBLE_PROPERTY_KEY_SHORTCUTS: return caml_hash_variant("KEY_SHORTCUTS"); /* `KEY_SHORTCUTS */
    case GTK_ACCESSIBLE_PROPERTY_LABEL: return caml_hash_variant("LABEL"); /* `LABEL */
    case GTK_ACCESSIBLE_PROPERTY_LEVEL: return caml_hash_variant("LEVEL"); /* `LEVEL */
    case GTK_ACCESSIBLE_PROPERTY_MODAL: return caml_hash_variant("MODAL"); /* `MODAL */
    case GTK_ACCESSIBLE_PROPERTY_MULTI_LINE: return caml_hash_variant("MULTI_LINE"); /* `MULTI_LINE */
    case GTK_ACCESSIBLE_PROPERTY_MULTI_SELECTABLE: return caml_hash_variant("MULTI_SELECTABLE"); /* `MULTI_SELECTABLE */
    case GTK_ACCESSIBLE_PROPERTY_ORIENTATION: return caml_hash_variant("ORIENTATION"); /* `ORIENTATION */
    case GTK_ACCESSIBLE_PROPERTY_PLACEHOLDER: return caml_hash_variant("PLACEHOLDER"); /* `PLACEHOLDER */
    case GTK_ACCESSIBLE_PROPERTY_READ_ONLY: return caml_hash_variant("READ_ONLY"); /* `READ_ONLY */
    case GTK_ACCESSIBLE_PROPERTY_REQUIRED: return caml_hash_variant("REQUIRED"); /* `REQUIRED */
    case GTK_ACCESSIBLE_PROPERTY_ROLE_DESCRIPTION: return caml_hash_variant("ROLE_DESCRIPTION"); /* `ROLE_DESCRIPTION */
    case GTK_ACCESSIBLE_PROPERTY_SORT: return caml_hash_variant("SORT"); /* `SORT */
    case GTK_ACCESSIBLE_PROPERTY_VALUE_MAX: return caml_hash_variant("VALUE_MAX"); /* `VALUE_MAX */
    case GTK_ACCESSIBLE_PROPERTY_VALUE_MIN: return caml_hash_variant("VALUE_MIN"); /* `VALUE_MIN */
    case GTK_ACCESSIBLE_PROPERTY_VALUE_NOW: return caml_hash_variant("VALUE_NOW"); /* `VALUE_NOW */
    case GTK_ACCESSIBLE_PROPERTY_VALUE_TEXT: return caml_hash_variant("VALUE_TEXT"); /* `VALUE_TEXT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleProperty value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkAccessibleProperty */
GtkAccessibleProperty GtkAccessibleProperty_val(value val) {
  if (val == caml_hash_variant("AUTOCOMPLETE")) return GTK_ACCESSIBLE_PROPERTY_AUTOCOMPLETE; /* `AUTOCOMPLETE */
  else if (val == caml_hash_variant("DESCRIPTION")) return GTK_ACCESSIBLE_PROPERTY_DESCRIPTION; /* `DESCRIPTION */
  else if (val == caml_hash_variant("HAS_POPUP")) return GTK_ACCESSIBLE_PROPERTY_HAS_POPUP; /* `HAS_POPUP */
  else if (val == caml_hash_variant("KEY_SHORTCUTS")) return GTK_ACCESSIBLE_PROPERTY_KEY_SHORTCUTS; /* `KEY_SHORTCUTS */
  else if (val == caml_hash_variant("LABEL")) return GTK_ACCESSIBLE_PROPERTY_LABEL; /* `LABEL */
  else if (val == caml_hash_variant("LEVEL")) return GTK_ACCESSIBLE_PROPERTY_LEVEL; /* `LEVEL */
  else if (val == caml_hash_variant("MODAL")) return GTK_ACCESSIBLE_PROPERTY_MODAL; /* `MODAL */
  else if (val == caml_hash_variant("MULTI_LINE")) return GTK_ACCESSIBLE_PROPERTY_MULTI_LINE; /* `MULTI_LINE */
  else if (val == caml_hash_variant("MULTI_SELECTABLE")) return GTK_ACCESSIBLE_PROPERTY_MULTI_SELECTABLE; /* `MULTI_SELECTABLE */
  else if (val == caml_hash_variant("ORIENTATION")) return GTK_ACCESSIBLE_PROPERTY_ORIENTATION; /* `ORIENTATION */
  else if (val == caml_hash_variant("PLACEHOLDER")) return GTK_ACCESSIBLE_PROPERTY_PLACEHOLDER; /* `PLACEHOLDER */
  else if (val == caml_hash_variant("READ_ONLY")) return GTK_ACCESSIBLE_PROPERTY_READ_ONLY; /* `READ_ONLY */
  else if (val == caml_hash_variant("REQUIRED")) return GTK_ACCESSIBLE_PROPERTY_REQUIRED; /* `REQUIRED */
  else if (val == caml_hash_variant("ROLE_DESCRIPTION")) return GTK_ACCESSIBLE_PROPERTY_ROLE_DESCRIPTION; /* `ROLE_DESCRIPTION */
  else if (val == caml_hash_variant("SORT")) return GTK_ACCESSIBLE_PROPERTY_SORT; /* `SORT */
  else if (val == caml_hash_variant("VALUE_MAX")) return GTK_ACCESSIBLE_PROPERTY_VALUE_MAX; /* `VALUE_MAX */
  else if (val == caml_hash_variant("VALUE_MIN")) return GTK_ACCESSIBLE_PROPERTY_VALUE_MIN; /* `VALUE_MIN */
  else if (val == caml_hash_variant("VALUE_NOW")) return GTK_ACCESSIBLE_PROPERTY_VALUE_NOW; /* `VALUE_NOW */
  else if (val == caml_hash_variant("VALUE_TEXT")) return GTK_ACCESSIBLE_PROPERTY_VALUE_TEXT; /* `VALUE_TEXT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleProperty tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkAccessibleRelation to OCaml value */
value Val_GtkAccessibleRelation(GtkAccessibleRelation val) {
  switch (val) {
    case GTK_ACCESSIBLE_RELATION_ACTIVE_DESCENDANT: return caml_hash_variant("ACTIVE_DESCENDANT"); /* `ACTIVE_DESCENDANT */
    case GTK_ACCESSIBLE_RELATION_COL_COUNT: return caml_hash_variant("COL_COUNT"); /* `COL_COUNT */
    case GTK_ACCESSIBLE_RELATION_COL_INDEX: return caml_hash_variant("COL_INDEX"); /* `COL_INDEX */
    case GTK_ACCESSIBLE_RELATION_COL_INDEX_TEXT: return caml_hash_variant("COL_INDEX_TEXT"); /* `COL_INDEX_TEXT */
    case GTK_ACCESSIBLE_RELATION_COL_SPAN: return caml_hash_variant("COL_SPAN"); /* `COL_SPAN */
    case GTK_ACCESSIBLE_RELATION_CONTROLS: return caml_hash_variant("CONTROLS"); /* `CONTROLS */
    case GTK_ACCESSIBLE_RELATION_DESCRIBED_BY: return caml_hash_variant("DESCRIBED_BY"); /* `DESCRIBED_BY */
    case GTK_ACCESSIBLE_RELATION_DETAILS: return caml_hash_variant("DETAILS"); /* `DETAILS */
    case GTK_ACCESSIBLE_RELATION_ERROR_MESSAGE: return caml_hash_variant("ERROR_MESSAGE"); /* `ERROR_MESSAGE */
    case GTK_ACCESSIBLE_RELATION_FLOW_TO: return caml_hash_variant("FLOW_TO"); /* `FLOW_TO */
    case GTK_ACCESSIBLE_RELATION_LABELLED_BY: return caml_hash_variant("LABELLED_BY"); /* `LABELLED_BY */
    case GTK_ACCESSIBLE_RELATION_OWNS: return caml_hash_variant("OWNS"); /* `OWNS */
    case GTK_ACCESSIBLE_RELATION_POS_IN_SET: return caml_hash_variant("POS_IN_SET"); /* `POS_IN_SET */
    case GTK_ACCESSIBLE_RELATION_ROW_COUNT: return caml_hash_variant("ROW_COUNT"); /* `ROW_COUNT */
    case GTK_ACCESSIBLE_RELATION_ROW_INDEX: return caml_hash_variant("ROW_INDEX"); /* `ROW_INDEX */
    case GTK_ACCESSIBLE_RELATION_ROW_INDEX_TEXT: return caml_hash_variant("ROW_INDEX_TEXT"); /* `ROW_INDEX_TEXT */
    case GTK_ACCESSIBLE_RELATION_ROW_SPAN: return caml_hash_variant("ROW_SPAN"); /* `ROW_SPAN */
    case GTK_ACCESSIBLE_RELATION_SET_SIZE: return caml_hash_variant("SET_SIZE"); /* `SET_SIZE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleRelation value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkAccessibleRelation */
GtkAccessibleRelation GtkAccessibleRelation_val(value val) {
  if (val == caml_hash_variant("ACTIVE_DESCENDANT")) return GTK_ACCESSIBLE_RELATION_ACTIVE_DESCENDANT; /* `ACTIVE_DESCENDANT */
  else if (val == caml_hash_variant("COL_COUNT")) return GTK_ACCESSIBLE_RELATION_COL_COUNT; /* `COL_COUNT */
  else if (val == caml_hash_variant("COL_INDEX")) return GTK_ACCESSIBLE_RELATION_COL_INDEX; /* `COL_INDEX */
  else if (val == caml_hash_variant("COL_INDEX_TEXT")) return GTK_ACCESSIBLE_RELATION_COL_INDEX_TEXT; /* `COL_INDEX_TEXT */
  else if (val == caml_hash_variant("COL_SPAN")) return GTK_ACCESSIBLE_RELATION_COL_SPAN; /* `COL_SPAN */
  else if (val == caml_hash_variant("CONTROLS")) return GTK_ACCESSIBLE_RELATION_CONTROLS; /* `CONTROLS */
  else if (val == caml_hash_variant("DESCRIBED_BY")) return GTK_ACCESSIBLE_RELATION_DESCRIBED_BY; /* `DESCRIBED_BY */
  else if (val == caml_hash_variant("DETAILS")) return GTK_ACCESSIBLE_RELATION_DETAILS; /* `DETAILS */
  else if (val == caml_hash_variant("ERROR_MESSAGE")) return GTK_ACCESSIBLE_RELATION_ERROR_MESSAGE; /* `ERROR_MESSAGE */
  else if (val == caml_hash_variant("FLOW_TO")) return GTK_ACCESSIBLE_RELATION_FLOW_TO; /* `FLOW_TO */
  else if (val == caml_hash_variant("LABELLED_BY")) return GTK_ACCESSIBLE_RELATION_LABELLED_BY; /* `LABELLED_BY */
  else if (val == caml_hash_variant("OWNS")) return GTK_ACCESSIBLE_RELATION_OWNS; /* `OWNS */
  else if (val == caml_hash_variant("POS_IN_SET")) return GTK_ACCESSIBLE_RELATION_POS_IN_SET; /* `POS_IN_SET */
  else if (val == caml_hash_variant("ROW_COUNT")) return GTK_ACCESSIBLE_RELATION_ROW_COUNT; /* `ROW_COUNT */
  else if (val == caml_hash_variant("ROW_INDEX")) return GTK_ACCESSIBLE_RELATION_ROW_INDEX; /* `ROW_INDEX */
  else if (val == caml_hash_variant("ROW_INDEX_TEXT")) return GTK_ACCESSIBLE_RELATION_ROW_INDEX_TEXT; /* `ROW_INDEX_TEXT */
  else if (val == caml_hash_variant("ROW_SPAN")) return GTK_ACCESSIBLE_RELATION_ROW_SPAN; /* `ROW_SPAN */
  else if (val == caml_hash_variant("SET_SIZE")) return GTK_ACCESSIBLE_RELATION_SET_SIZE; /* `SET_SIZE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleRelation tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkAccessibleRole to OCaml value */
value Val_GtkAccessibleRole(GtkAccessibleRole val) {
  switch (val) {
    case GTK_ACCESSIBLE_ROLE_ALERT: return caml_hash_variant("ALERT"); /* `ALERT */
    case GTK_ACCESSIBLE_ROLE_ALERT_DIALOG: return caml_hash_variant("ALERT_DIALOG"); /* `ALERT_DIALOG */
    case GTK_ACCESSIBLE_ROLE_BANNER: return caml_hash_variant("BANNER"); /* `BANNER */
    case GTK_ACCESSIBLE_ROLE_BUTTON: return caml_hash_variant("BUTTON"); /* `BUTTON */
    case GTK_ACCESSIBLE_ROLE_CAPTION: return caml_hash_variant("CAPTION"); /* `CAPTION */
    case GTK_ACCESSIBLE_ROLE_CELL: return caml_hash_variant("CELL"); /* `CELL */
    case GTK_ACCESSIBLE_ROLE_CHECKBOX: return caml_hash_variant("CHECKBOX"); /* `CHECKBOX */
    case GTK_ACCESSIBLE_ROLE_COLUMN_HEADER: return caml_hash_variant("COLUMN_HEADER"); /* `COLUMN_HEADER */
    case GTK_ACCESSIBLE_ROLE_COMBO_BOX: return caml_hash_variant("COMBO_BOX"); /* `COMBO_BOX */
    case GTK_ACCESSIBLE_ROLE_COMMAND: return caml_hash_variant("COMMAND"); /* `COMMAND */
    case GTK_ACCESSIBLE_ROLE_COMPOSITE: return caml_hash_variant("COMPOSITE"); /* `COMPOSITE */
    case GTK_ACCESSIBLE_ROLE_DIALOG: return caml_hash_variant("DIALOG"); /* `DIALOG */
    case GTK_ACCESSIBLE_ROLE_DOCUMENT: return caml_hash_variant("DOCUMENT"); /* `DOCUMENT */
    case GTK_ACCESSIBLE_ROLE_FEED: return caml_hash_variant("FEED"); /* `FEED */
    case GTK_ACCESSIBLE_ROLE_FORM: return caml_hash_variant("FORM"); /* `FORM */
    case GTK_ACCESSIBLE_ROLE_GENERIC: return caml_hash_variant("GENERIC"); /* `GENERIC */
    case GTK_ACCESSIBLE_ROLE_GRID: return caml_hash_variant("GRID"); /* `GRID */
    case GTK_ACCESSIBLE_ROLE_GRID_CELL: return caml_hash_variant("GRID_CELL"); /* `GRID_CELL */
    case GTK_ACCESSIBLE_ROLE_GROUP: return caml_hash_variant("GROUP"); /* `GROUP */
    case GTK_ACCESSIBLE_ROLE_HEADING: return caml_hash_variant("HEADING"); /* `HEADING */
    case GTK_ACCESSIBLE_ROLE_IMG: return caml_hash_variant("IMG"); /* `IMG */
    case GTK_ACCESSIBLE_ROLE_INPUT: return caml_hash_variant("INPUT"); /* `INPUT */
    case GTK_ACCESSIBLE_ROLE_LABEL: return caml_hash_variant("LABEL"); /* `LABEL */
    case GTK_ACCESSIBLE_ROLE_LANDMARK: return caml_hash_variant("LANDMARK"); /* `LANDMARK */
    case GTK_ACCESSIBLE_ROLE_LEGEND: return caml_hash_variant("LEGEND"); /* `LEGEND */
    case GTK_ACCESSIBLE_ROLE_LINK: return caml_hash_variant("LINK"); /* `LINK */
    case GTK_ACCESSIBLE_ROLE_LIST: return caml_hash_variant("LIST"); /* `LIST */
    case GTK_ACCESSIBLE_ROLE_LIST_BOX: return caml_hash_variant("LIST_BOX"); /* `LIST_BOX */
    case GTK_ACCESSIBLE_ROLE_LIST_ITEM: return caml_hash_variant("LIST_ITEM"); /* `LIST_ITEM */
    case GTK_ACCESSIBLE_ROLE_LOG: return caml_hash_variant("LOG"); /* `LOG */
    case GTK_ACCESSIBLE_ROLE_MAIN: return caml_hash_variant("MAIN"); /* `MAIN */
    case GTK_ACCESSIBLE_ROLE_MARQUEE: return caml_hash_variant("MARQUEE"); /* `MARQUEE */
    case GTK_ACCESSIBLE_ROLE_MATH: return caml_hash_variant("MATH"); /* `MATH */
    case GTK_ACCESSIBLE_ROLE_METER: return caml_hash_variant("METER"); /* `METER */
    case GTK_ACCESSIBLE_ROLE_MENU: return caml_hash_variant("MENU"); /* `MENU */
    case GTK_ACCESSIBLE_ROLE_MENU_BAR: return caml_hash_variant("MENU_BAR"); /* `MENU_BAR */
    case GTK_ACCESSIBLE_ROLE_MENU_ITEM: return caml_hash_variant("MENU_ITEM"); /* `MENU_ITEM */
    case GTK_ACCESSIBLE_ROLE_MENU_ITEM_CHECKBOX: return caml_hash_variant("MENU_ITEM_CHECKBOX"); /* `MENU_ITEM_CHECKBOX */
    case GTK_ACCESSIBLE_ROLE_MENU_ITEM_RADIO: return caml_hash_variant("MENU_ITEM_RADIO"); /* `MENU_ITEM_RADIO */
    case GTK_ACCESSIBLE_ROLE_NAVIGATION: return caml_hash_variant("NAVIGATION"); /* `NAVIGATION */
    case GTK_ACCESSIBLE_ROLE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_ACCESSIBLE_ROLE_NOTE: return caml_hash_variant("NOTE"); /* `NOTE */
    case GTK_ACCESSIBLE_ROLE_OPTION: return caml_hash_variant("OPTION"); /* `OPTION */
    case GTK_ACCESSIBLE_ROLE_PRESENTATION: return caml_hash_variant("PRESENTATION"); /* `PRESENTATION */
    case GTK_ACCESSIBLE_ROLE_PROGRESS_BAR: return caml_hash_variant("PROGRESS_BAR"); /* `PROGRESS_BAR */
    case GTK_ACCESSIBLE_ROLE_RADIO: return caml_hash_variant("RADIO"); /* `RADIO */
    case GTK_ACCESSIBLE_ROLE_RADIO_GROUP: return caml_hash_variant("RADIO_GROUP"); /* `RADIO_GROUP */
    case GTK_ACCESSIBLE_ROLE_RANGE: return caml_hash_variant("RANGE"); /* `RANGE */
    case GTK_ACCESSIBLE_ROLE_REGION: return caml_hash_variant("REGION"); /* `REGION */
    case GTK_ACCESSIBLE_ROLE_ROW: return caml_hash_variant("ROW"); /* `ROW */
    case GTK_ACCESSIBLE_ROLE_ROW_GROUP: return caml_hash_variant("ROW_GROUP"); /* `ROW_GROUP */
    case GTK_ACCESSIBLE_ROLE_ROW_HEADER: return caml_hash_variant("ROW_HEADER"); /* `ROW_HEADER */
    case GTK_ACCESSIBLE_ROLE_SCROLLBAR: return caml_hash_variant("SCROLLBAR"); /* `SCROLLBAR */
    case GTK_ACCESSIBLE_ROLE_SEARCH: return caml_hash_variant("SEARCH"); /* `SEARCH */
    case GTK_ACCESSIBLE_ROLE_SEARCH_BOX: return caml_hash_variant("SEARCH_BOX"); /* `SEARCH_BOX */
    case GTK_ACCESSIBLE_ROLE_SECTION: return caml_hash_variant("SECTION"); /* `SECTION */
    case GTK_ACCESSIBLE_ROLE_SECTION_HEAD: return caml_hash_variant("SECTION_HEAD"); /* `SECTION_HEAD */
    case GTK_ACCESSIBLE_ROLE_SELECT: return caml_hash_variant("SELECT"); /* `SELECT */
    case GTK_ACCESSIBLE_ROLE_SEPARATOR: return caml_hash_variant("SEPARATOR"); /* `SEPARATOR */
    case GTK_ACCESSIBLE_ROLE_SLIDER: return caml_hash_variant("SLIDER"); /* `SLIDER */
    case GTK_ACCESSIBLE_ROLE_SPIN_BUTTON: return caml_hash_variant("SPIN_BUTTON"); /* `SPIN_BUTTON */
    case GTK_ACCESSIBLE_ROLE_STATUS: return caml_hash_variant("STATUS"); /* `STATUS */
    case GTK_ACCESSIBLE_ROLE_STRUCTURE: return caml_hash_variant("STRUCTURE"); /* `STRUCTURE */
    case GTK_ACCESSIBLE_ROLE_SWITCH: return caml_hash_variant("SWITCH"); /* `SWITCH */
    case GTK_ACCESSIBLE_ROLE_TAB: return caml_hash_variant("TAB"); /* `TAB */
    case GTK_ACCESSIBLE_ROLE_TABLE: return caml_hash_variant("TABLE"); /* `TABLE */
    case GTK_ACCESSIBLE_ROLE_TAB_LIST: return caml_hash_variant("TAB_LIST"); /* `TAB_LIST */
    case GTK_ACCESSIBLE_ROLE_TAB_PANEL: return caml_hash_variant("TAB_PANEL"); /* `TAB_PANEL */
    case GTK_ACCESSIBLE_ROLE_TEXT_BOX: return caml_hash_variant("TEXT_BOX"); /* `TEXT_BOX */
    case GTK_ACCESSIBLE_ROLE_TIME: return caml_hash_variant("TIME"); /* `TIME */
    case GTK_ACCESSIBLE_ROLE_TIMER: return caml_hash_variant("TIMER"); /* `TIMER */
    case GTK_ACCESSIBLE_ROLE_TOOLBAR: return caml_hash_variant("TOOLBAR"); /* `TOOLBAR */
    case GTK_ACCESSIBLE_ROLE_TOOLTIP: return caml_hash_variant("TOOLTIP"); /* `TOOLTIP */
    case GTK_ACCESSIBLE_ROLE_TREE: return caml_hash_variant("TREE"); /* `TREE */
    case GTK_ACCESSIBLE_ROLE_TREE_GRID: return caml_hash_variant("TREE_GRID"); /* `TREE_GRID */
    case GTK_ACCESSIBLE_ROLE_TREE_ITEM: return caml_hash_variant("TREE_ITEM"); /* `TREE_ITEM */
    case GTK_ACCESSIBLE_ROLE_WIDGET: return caml_hash_variant("WIDGET"); /* `WIDGET */
    case GTK_ACCESSIBLE_ROLE_WINDOW: return caml_hash_variant("WINDOW"); /* `WINDOW */
    case GTK_ACCESSIBLE_ROLE_TOGGLE_BUTTON: return caml_hash_variant("TOGGLE_BUTTON"); /* `TOGGLE_BUTTON */
    case GTK_ACCESSIBLE_ROLE_APPLICATION: return caml_hash_variant("APPLICATION"); /* `APPLICATION */
    case GTK_ACCESSIBLE_ROLE_PARAGRAPH: return caml_hash_variant("PARAGRAPH"); /* `PARAGRAPH */
    case GTK_ACCESSIBLE_ROLE_BLOCK_QUOTE: return caml_hash_variant("BLOCK_QUOTE"); /* `BLOCK_QUOTE */
    case GTK_ACCESSIBLE_ROLE_ARTICLE: return caml_hash_variant("ARTICLE"); /* `ARTICLE */
    case GTK_ACCESSIBLE_ROLE_COMMENT: return caml_hash_variant("COMMENT"); /* `COMMENT */
    case GTK_ACCESSIBLE_ROLE_TERMINAL: return caml_hash_variant("TERMINAL"); /* `TERMINAL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleRole value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkAccessibleRole */
GtkAccessibleRole GtkAccessibleRole_val(value val) {
  if (val == caml_hash_variant("ALERT")) return GTK_ACCESSIBLE_ROLE_ALERT; /* `ALERT */
  else if (val == caml_hash_variant("ALERT_DIALOG")) return GTK_ACCESSIBLE_ROLE_ALERT_DIALOG; /* `ALERT_DIALOG */
  else if (val == caml_hash_variant("BANNER")) return GTK_ACCESSIBLE_ROLE_BANNER; /* `BANNER */
  else if (val == caml_hash_variant("BUTTON")) return GTK_ACCESSIBLE_ROLE_BUTTON; /* `BUTTON */
  else if (val == caml_hash_variant("CAPTION")) return GTK_ACCESSIBLE_ROLE_CAPTION; /* `CAPTION */
  else if (val == caml_hash_variant("CELL")) return GTK_ACCESSIBLE_ROLE_CELL; /* `CELL */
  else if (val == caml_hash_variant("CHECKBOX")) return GTK_ACCESSIBLE_ROLE_CHECKBOX; /* `CHECKBOX */
  else if (val == caml_hash_variant("COLUMN_HEADER")) return GTK_ACCESSIBLE_ROLE_COLUMN_HEADER; /* `COLUMN_HEADER */
  else if (val == caml_hash_variant("COMBO_BOX")) return GTK_ACCESSIBLE_ROLE_COMBO_BOX; /* `COMBO_BOX */
  else if (val == caml_hash_variant("COMMAND")) return GTK_ACCESSIBLE_ROLE_COMMAND; /* `COMMAND */
  else if (val == caml_hash_variant("COMPOSITE")) return GTK_ACCESSIBLE_ROLE_COMPOSITE; /* `COMPOSITE */
  else if (val == caml_hash_variant("DIALOG")) return GTK_ACCESSIBLE_ROLE_DIALOG; /* `DIALOG */
  else if (val == caml_hash_variant("DOCUMENT")) return GTK_ACCESSIBLE_ROLE_DOCUMENT; /* `DOCUMENT */
  else if (val == caml_hash_variant("FEED")) return GTK_ACCESSIBLE_ROLE_FEED; /* `FEED */
  else if (val == caml_hash_variant("FORM")) return GTK_ACCESSIBLE_ROLE_FORM; /* `FORM */
  else if (val == caml_hash_variant("GENERIC")) return GTK_ACCESSIBLE_ROLE_GENERIC; /* `GENERIC */
  else if (val == caml_hash_variant("GRID")) return GTK_ACCESSIBLE_ROLE_GRID; /* `GRID */
  else if (val == caml_hash_variant("GRID_CELL")) return GTK_ACCESSIBLE_ROLE_GRID_CELL; /* `GRID_CELL */
  else if (val == caml_hash_variant("GROUP")) return GTK_ACCESSIBLE_ROLE_GROUP; /* `GROUP */
  else if (val == caml_hash_variant("HEADING")) return GTK_ACCESSIBLE_ROLE_HEADING; /* `HEADING */
  else if (val == caml_hash_variant("IMG")) return GTK_ACCESSIBLE_ROLE_IMG; /* `IMG */
  else if (val == caml_hash_variant("INPUT")) return GTK_ACCESSIBLE_ROLE_INPUT; /* `INPUT */
  else if (val == caml_hash_variant("LABEL")) return GTK_ACCESSIBLE_ROLE_LABEL; /* `LABEL */
  else if (val == caml_hash_variant("LANDMARK")) return GTK_ACCESSIBLE_ROLE_LANDMARK; /* `LANDMARK */
  else if (val == caml_hash_variant("LEGEND")) return GTK_ACCESSIBLE_ROLE_LEGEND; /* `LEGEND */
  else if (val == caml_hash_variant("LINK")) return GTK_ACCESSIBLE_ROLE_LINK; /* `LINK */
  else if (val == caml_hash_variant("LIST")) return GTK_ACCESSIBLE_ROLE_LIST; /* `LIST */
  else if (val == caml_hash_variant("LIST_BOX")) return GTK_ACCESSIBLE_ROLE_LIST_BOX; /* `LIST_BOX */
  else if (val == caml_hash_variant("LIST_ITEM")) return GTK_ACCESSIBLE_ROLE_LIST_ITEM; /* `LIST_ITEM */
  else if (val == caml_hash_variant("LOG")) return GTK_ACCESSIBLE_ROLE_LOG; /* `LOG */
  else if (val == caml_hash_variant("MAIN")) return GTK_ACCESSIBLE_ROLE_MAIN; /* `MAIN */
  else if (val == caml_hash_variant("MARQUEE")) return GTK_ACCESSIBLE_ROLE_MARQUEE; /* `MARQUEE */
  else if (val == caml_hash_variant("MATH")) return GTK_ACCESSIBLE_ROLE_MATH; /* `MATH */
  else if (val == caml_hash_variant("METER")) return GTK_ACCESSIBLE_ROLE_METER; /* `METER */
  else if (val == caml_hash_variant("MENU")) return GTK_ACCESSIBLE_ROLE_MENU; /* `MENU */
  else if (val == caml_hash_variant("MENU_BAR")) return GTK_ACCESSIBLE_ROLE_MENU_BAR; /* `MENU_BAR */
  else if (val == caml_hash_variant("MENU_ITEM")) return GTK_ACCESSIBLE_ROLE_MENU_ITEM; /* `MENU_ITEM */
  else if (val == caml_hash_variant("MENU_ITEM_CHECKBOX")) return GTK_ACCESSIBLE_ROLE_MENU_ITEM_CHECKBOX; /* `MENU_ITEM_CHECKBOX */
  else if (val == caml_hash_variant("MENU_ITEM_RADIO")) return GTK_ACCESSIBLE_ROLE_MENU_ITEM_RADIO; /* `MENU_ITEM_RADIO */
  else if (val == caml_hash_variant("NAVIGATION")) return GTK_ACCESSIBLE_ROLE_NAVIGATION; /* `NAVIGATION */
  else if (val == caml_hash_variant("NONE")) return GTK_ACCESSIBLE_ROLE_NONE; /* `NONE */
  else if (val == caml_hash_variant("NOTE")) return GTK_ACCESSIBLE_ROLE_NOTE; /* `NOTE */
  else if (val == caml_hash_variant("OPTION")) return GTK_ACCESSIBLE_ROLE_OPTION; /* `OPTION */
  else if (val == caml_hash_variant("PRESENTATION")) return GTK_ACCESSIBLE_ROLE_PRESENTATION; /* `PRESENTATION */
  else if (val == caml_hash_variant("PROGRESS_BAR")) return GTK_ACCESSIBLE_ROLE_PROGRESS_BAR; /* `PROGRESS_BAR */
  else if (val == caml_hash_variant("RADIO")) return GTK_ACCESSIBLE_ROLE_RADIO; /* `RADIO */
  else if (val == caml_hash_variant("RADIO_GROUP")) return GTK_ACCESSIBLE_ROLE_RADIO_GROUP; /* `RADIO_GROUP */
  else if (val == caml_hash_variant("RANGE")) return GTK_ACCESSIBLE_ROLE_RANGE; /* `RANGE */
  else if (val == caml_hash_variant("REGION")) return GTK_ACCESSIBLE_ROLE_REGION; /* `REGION */
  else if (val == caml_hash_variant("ROW")) return GTK_ACCESSIBLE_ROLE_ROW; /* `ROW */
  else if (val == caml_hash_variant("ROW_GROUP")) return GTK_ACCESSIBLE_ROLE_ROW_GROUP; /* `ROW_GROUP */
  else if (val == caml_hash_variant("ROW_HEADER")) return GTK_ACCESSIBLE_ROLE_ROW_HEADER; /* `ROW_HEADER */
  else if (val == caml_hash_variant("SCROLLBAR")) return GTK_ACCESSIBLE_ROLE_SCROLLBAR; /* `SCROLLBAR */
  else if (val == caml_hash_variant("SEARCH")) return GTK_ACCESSIBLE_ROLE_SEARCH; /* `SEARCH */
  else if (val == caml_hash_variant("SEARCH_BOX")) return GTK_ACCESSIBLE_ROLE_SEARCH_BOX; /* `SEARCH_BOX */
  else if (val == caml_hash_variant("SECTION")) return GTK_ACCESSIBLE_ROLE_SECTION; /* `SECTION */
  else if (val == caml_hash_variant("SECTION_HEAD")) return GTK_ACCESSIBLE_ROLE_SECTION_HEAD; /* `SECTION_HEAD */
  else if (val == caml_hash_variant("SELECT")) return GTK_ACCESSIBLE_ROLE_SELECT; /* `SELECT */
  else if (val == caml_hash_variant("SEPARATOR")) return GTK_ACCESSIBLE_ROLE_SEPARATOR; /* `SEPARATOR */
  else if (val == caml_hash_variant("SLIDER")) return GTK_ACCESSIBLE_ROLE_SLIDER; /* `SLIDER */
  else if (val == caml_hash_variant("SPIN_BUTTON")) return GTK_ACCESSIBLE_ROLE_SPIN_BUTTON; /* `SPIN_BUTTON */
  else if (val == caml_hash_variant("STATUS")) return GTK_ACCESSIBLE_ROLE_STATUS; /* `STATUS */
  else if (val == caml_hash_variant("STRUCTURE")) return GTK_ACCESSIBLE_ROLE_STRUCTURE; /* `STRUCTURE */
  else if (val == caml_hash_variant("SWITCH")) return GTK_ACCESSIBLE_ROLE_SWITCH; /* `SWITCH */
  else if (val == caml_hash_variant("TAB")) return GTK_ACCESSIBLE_ROLE_TAB; /* `TAB */
  else if (val == caml_hash_variant("TABLE")) return GTK_ACCESSIBLE_ROLE_TABLE; /* `TABLE */
  else if (val == caml_hash_variant("TAB_LIST")) return GTK_ACCESSIBLE_ROLE_TAB_LIST; /* `TAB_LIST */
  else if (val == caml_hash_variant("TAB_PANEL")) return GTK_ACCESSIBLE_ROLE_TAB_PANEL; /* `TAB_PANEL */
  else if (val == caml_hash_variant("TEXT_BOX")) return GTK_ACCESSIBLE_ROLE_TEXT_BOX; /* `TEXT_BOX */
  else if (val == caml_hash_variant("TIME")) return GTK_ACCESSIBLE_ROLE_TIME; /* `TIME */
  else if (val == caml_hash_variant("TIMER")) return GTK_ACCESSIBLE_ROLE_TIMER; /* `TIMER */
  else if (val == caml_hash_variant("TOOLBAR")) return GTK_ACCESSIBLE_ROLE_TOOLBAR; /* `TOOLBAR */
  else if (val == caml_hash_variant("TOOLTIP")) return GTK_ACCESSIBLE_ROLE_TOOLTIP; /* `TOOLTIP */
  else if (val == caml_hash_variant("TREE")) return GTK_ACCESSIBLE_ROLE_TREE; /* `TREE */
  else if (val == caml_hash_variant("TREE_GRID")) return GTK_ACCESSIBLE_ROLE_TREE_GRID; /* `TREE_GRID */
  else if (val == caml_hash_variant("TREE_ITEM")) return GTK_ACCESSIBLE_ROLE_TREE_ITEM; /* `TREE_ITEM */
  else if (val == caml_hash_variant("WIDGET")) return GTK_ACCESSIBLE_ROLE_WIDGET; /* `WIDGET */
  else if (val == caml_hash_variant("WINDOW")) return GTK_ACCESSIBLE_ROLE_WINDOW; /* `WINDOW */
  else if (val == caml_hash_variant("TOGGLE_BUTTON")) return GTK_ACCESSIBLE_ROLE_TOGGLE_BUTTON; /* `TOGGLE_BUTTON */
  else if (val == caml_hash_variant("APPLICATION")) return GTK_ACCESSIBLE_ROLE_APPLICATION; /* `APPLICATION */
  else if (val == caml_hash_variant("PARAGRAPH")) return GTK_ACCESSIBLE_ROLE_PARAGRAPH; /* `PARAGRAPH */
  else if (val == caml_hash_variant("BLOCK_QUOTE")) return GTK_ACCESSIBLE_ROLE_BLOCK_QUOTE; /* `BLOCK_QUOTE */
  else if (val == caml_hash_variant("ARTICLE")) return GTK_ACCESSIBLE_ROLE_ARTICLE; /* `ARTICLE */
  else if (val == caml_hash_variant("COMMENT")) return GTK_ACCESSIBLE_ROLE_COMMENT; /* `COMMENT */
  else if (val == caml_hash_variant("TERMINAL")) return GTK_ACCESSIBLE_ROLE_TERMINAL; /* `TERMINAL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleRole tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkAccessibleSort to OCaml value */
value Val_GtkAccessibleSort(GtkAccessibleSort val) {
  switch (val) {
    case GTK_ACCESSIBLE_SORT_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_ACCESSIBLE_SORT_ASCENDING: return caml_hash_variant("ASCENDING"); /* `ASCENDING */
    case GTK_ACCESSIBLE_SORT_DESCENDING: return caml_hash_variant("DESCENDING"); /* `DESCENDING */
    case GTK_ACCESSIBLE_SORT_OTHER: return caml_hash_variant("OTHER"); /* `OTHER */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleSort value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkAccessibleSort */
GtkAccessibleSort GtkAccessibleSort_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_ACCESSIBLE_SORT_NONE; /* `NONE */
  else if (val == caml_hash_variant("ASCENDING")) return GTK_ACCESSIBLE_SORT_ASCENDING; /* `ASCENDING */
  else if (val == caml_hash_variant("DESCENDING")) return GTK_ACCESSIBLE_SORT_DESCENDING; /* `DESCENDING */
  else if (val == caml_hash_variant("OTHER")) return GTK_ACCESSIBLE_SORT_OTHER; /* `OTHER */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleSort tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkAccessibleState to OCaml value */
value Val_GtkAccessibleState(GtkAccessibleState val) {
  switch (val) {
    case GTK_ACCESSIBLE_STATE_BUSY: return caml_hash_variant("BUSY"); /* `BUSY */
    case GTK_ACCESSIBLE_STATE_CHECKED: return caml_hash_variant("CHECKED"); /* `CHECKED */
    case GTK_ACCESSIBLE_STATE_DISABLED: return caml_hash_variant("DISABLED"); /* `DISABLED */
    case GTK_ACCESSIBLE_STATE_EXPANDED: return caml_hash_variant("EXPANDED"); /* `EXPANDED */
    case GTK_ACCESSIBLE_STATE_HIDDEN: return caml_hash_variant("HIDDEN"); /* `HIDDEN */
    case GTK_ACCESSIBLE_STATE_INVALID: return caml_hash_variant("INVALID"); /* `INVALID */
    case GTK_ACCESSIBLE_STATE_PRESSED: return caml_hash_variant("PRESSED"); /* `PRESSED */
    case GTK_ACCESSIBLE_STATE_SELECTED: return caml_hash_variant("SELECTED"); /* `SELECTED */
    case GTK_ACCESSIBLE_STATE_VISITED: return caml_hash_variant("VISITED"); /* `VISITED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleState value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkAccessibleState */
GtkAccessibleState GtkAccessibleState_val(value val) {
  if (val == caml_hash_variant("BUSY")) return GTK_ACCESSIBLE_STATE_BUSY; /* `BUSY */
  else if (val == caml_hash_variant("CHECKED")) return GTK_ACCESSIBLE_STATE_CHECKED; /* `CHECKED */
  else if (val == caml_hash_variant("DISABLED")) return GTK_ACCESSIBLE_STATE_DISABLED; /* `DISABLED */
  else if (val == caml_hash_variant("EXPANDED")) return GTK_ACCESSIBLE_STATE_EXPANDED; /* `EXPANDED */
  else if (val == caml_hash_variant("HIDDEN")) return GTK_ACCESSIBLE_STATE_HIDDEN; /* `HIDDEN */
  else if (val == caml_hash_variant("INVALID")) return GTK_ACCESSIBLE_STATE_INVALID; /* `INVALID */
  else if (val == caml_hash_variant("PRESSED")) return GTK_ACCESSIBLE_STATE_PRESSED; /* `PRESSED */
  else if (val == caml_hash_variant("SELECTED")) return GTK_ACCESSIBLE_STATE_SELECTED; /* `SELECTED */
  else if (val == caml_hash_variant("VISITED")) return GTK_ACCESSIBLE_STATE_VISITED; /* `VISITED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleState tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkAccessibleTextContentChange to OCaml value */
value Val_GtkAccessibleTextContentChange(GtkAccessibleTextContentChange val) {
  switch (val) {
    case GTK_ACCESSIBLE_TEXT_CONTENT_CHANGE_INSERT: return caml_hash_variant("INSERT"); /* `INSERT */
    case GTK_ACCESSIBLE_TEXT_CONTENT_CHANGE_REMOVE: return caml_hash_variant("REMOVE"); /* `REMOVE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleTextContentChange value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkAccessibleTextContentChange */
GtkAccessibleTextContentChange GtkAccessibleTextContentChange_val(value val) {
  if (val == caml_hash_variant("INSERT")) return GTK_ACCESSIBLE_TEXT_CONTENT_CHANGE_INSERT; /* `INSERT */
  else if (val == caml_hash_variant("REMOVE")) return GTK_ACCESSIBLE_TEXT_CONTENT_CHANGE_REMOVE; /* `REMOVE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleTextContentChange tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkAccessibleTextGranularity to OCaml value */
value Val_GtkAccessibleTextGranularity(GtkAccessibleTextGranularity val) {
  switch (val) {
    case GTK_ACCESSIBLE_TEXT_GRANULARITY_CHARACTER: return caml_hash_variant("CHARACTER"); /* `CHARACTER */
    case GTK_ACCESSIBLE_TEXT_GRANULARITY_WORD: return caml_hash_variant("WORD"); /* `WORD */
    case GTK_ACCESSIBLE_TEXT_GRANULARITY_SENTENCE: return caml_hash_variant("SENTENCE"); /* `SENTENCE */
    case GTK_ACCESSIBLE_TEXT_GRANULARITY_LINE: return caml_hash_variant("LINE"); /* `LINE */
    case GTK_ACCESSIBLE_TEXT_GRANULARITY_PARAGRAPH: return caml_hash_variant("PARAGRAPH"); /* `PARAGRAPH */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleTextGranularity value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkAccessibleTextGranularity */
GtkAccessibleTextGranularity GtkAccessibleTextGranularity_val(value val) {
  if (val == caml_hash_variant("CHARACTER")) return GTK_ACCESSIBLE_TEXT_GRANULARITY_CHARACTER; /* `CHARACTER */
  else if (val == caml_hash_variant("WORD")) return GTK_ACCESSIBLE_TEXT_GRANULARITY_WORD; /* `WORD */
  else if (val == caml_hash_variant("SENTENCE")) return GTK_ACCESSIBLE_TEXT_GRANULARITY_SENTENCE; /* `SENTENCE */
  else if (val == caml_hash_variant("LINE")) return GTK_ACCESSIBLE_TEXT_GRANULARITY_LINE; /* `LINE */
  else if (val == caml_hash_variant("PARAGRAPH")) return GTK_ACCESSIBLE_TEXT_GRANULARITY_PARAGRAPH; /* `PARAGRAPH */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleTextGranularity tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkAccessibleTristate to OCaml value */
value Val_GtkAccessibleTristate(GtkAccessibleTristate val) {
  switch (val) {
    case GTK_ACCESSIBLE_TRISTATE_FALSE: return caml_hash_variant("FALSE"); /* `FALSE */
    case GTK_ACCESSIBLE_TRISTATE_TRUE: return caml_hash_variant("TRUE"); /* `TRUE */
    case GTK_ACCESSIBLE_TRISTATE_MIXED: return caml_hash_variant("MIXED"); /* `MIXED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleTristate value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkAccessibleTristate */
GtkAccessibleTristate GtkAccessibleTristate_val(value val) {
  if (val == caml_hash_variant("FALSE")) return GTK_ACCESSIBLE_TRISTATE_FALSE; /* `FALSE */
  else if (val == caml_hash_variant("TRUE")) return GTK_ACCESSIBLE_TRISTATE_TRUE; /* `TRUE */
  else if (val == caml_hash_variant("MIXED")) return GTK_ACCESSIBLE_TRISTATE_MIXED; /* `MIXED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkAccessibleTristate tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkAlign to OCaml value */
value Val_GtkAlign(GtkAlign val) {
  switch (val) {
    case GTK_ALIGN_FILL: return caml_hash_variant("FILL"); /* `FILL */
    case GTK_ALIGN_START: return caml_hash_variant("START"); /* `START */
    case GTK_ALIGN_END: return caml_hash_variant("END"); /* `END */
    case GTK_ALIGN_CENTER: return caml_hash_variant("CENTER"); /* `CENTER */
    case GTK_ALIGN_BASELINE_FILL: return caml_hash_variant("BASELINE_FILL"); /* `BASELINE_FILL */
    case GTK_ALIGN_BASELINE_CENTER: return caml_hash_variant("BASELINE_CENTER"); /* `BASELINE_CENTER */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkAlign value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkAlign */
GtkAlign GtkAlign_val(value val) {
  if (val == caml_hash_variant("FILL")) return GTK_ALIGN_FILL; /* `FILL */
  else if (val == caml_hash_variant("START")) return GTK_ALIGN_START; /* `START */
  else if (val == caml_hash_variant("END")) return GTK_ALIGN_END; /* `END */
  else if (val == caml_hash_variant("CENTER")) return GTK_ALIGN_CENTER; /* `CENTER */
  else if (val == caml_hash_variant("BASELINE_FILL")) return GTK_ALIGN_BASELINE_FILL; /* `BASELINE_FILL */
  else if (val == caml_hash_variant("BASELINE")) return GTK_ALIGN_BASELINE; /* `BASELINE */
  else if (val == caml_hash_variant("BASELINE_CENTER")) return GTK_ALIGN_BASELINE_CENTER; /* `BASELINE_CENTER */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkAlign tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkArrowType to OCaml value */
value Val_GtkArrowType(GtkArrowType val) {
  switch (val) {
    case GTK_ARROW_UP: return caml_hash_variant("UP"); /* `UP */
    case GTK_ARROW_DOWN: return caml_hash_variant("DOWN"); /* `DOWN */
    case GTK_ARROW_LEFT: return caml_hash_variant("LEFT"); /* `LEFT */
    case GTK_ARROW_RIGHT: return caml_hash_variant("RIGHT"); /* `RIGHT */
    case GTK_ARROW_NONE: return caml_hash_variant("NONE"); /* `NONE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkArrowType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkArrowType */
GtkArrowType GtkArrowType_val(value val) {
  if (val == caml_hash_variant("UP")) return GTK_ARROW_UP; /* `UP */
  else if (val == caml_hash_variant("DOWN")) return GTK_ARROW_DOWN; /* `DOWN */
  else if (val == caml_hash_variant("LEFT")) return GTK_ARROW_LEFT; /* `LEFT */
  else if (val == caml_hash_variant("RIGHT")) return GTK_ARROW_RIGHT; /* `RIGHT */
  else if (val == caml_hash_variant("NONE")) return GTK_ARROW_NONE; /* `NONE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkArrowType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkAssistantPageType to OCaml value */
value Val_GtkAssistantPageType(GtkAssistantPageType val) {
  switch (val) {
    case GTK_ASSISTANT_PAGE_CONTENT: return caml_hash_variant("CONTENT"); /* `CONTENT */
    case GTK_ASSISTANT_PAGE_INTRO: return caml_hash_variant("INTRO"); /* `INTRO */
    case GTK_ASSISTANT_PAGE_CONFIRM: return caml_hash_variant("CONFIRM"); /* `CONFIRM */
    case GTK_ASSISTANT_PAGE_SUMMARY: return caml_hash_variant("SUMMARY"); /* `SUMMARY */
    case GTK_ASSISTANT_PAGE_PROGRESS: return caml_hash_variant("PROGRESS"); /* `PROGRESS */
    case GTK_ASSISTANT_PAGE_CUSTOM: return caml_hash_variant("CUSTOM"); /* `CUSTOM */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkAssistantPageType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkAssistantPageType */
GtkAssistantPageType GtkAssistantPageType_val(value val) {
  if (val == caml_hash_variant("CONTENT")) return GTK_ASSISTANT_PAGE_CONTENT; /* `CONTENT */
  else if (val == caml_hash_variant("INTRO")) return GTK_ASSISTANT_PAGE_INTRO; /* `INTRO */
  else if (val == caml_hash_variant("CONFIRM")) return GTK_ASSISTANT_PAGE_CONFIRM; /* `CONFIRM */
  else if (val == caml_hash_variant("SUMMARY")) return GTK_ASSISTANT_PAGE_SUMMARY; /* `SUMMARY */
  else if (val == caml_hash_variant("PROGRESS")) return GTK_ASSISTANT_PAGE_PROGRESS; /* `PROGRESS */
  else if (val == caml_hash_variant("CUSTOM")) return GTK_ASSISTANT_PAGE_CUSTOM; /* `CUSTOM */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkAssistantPageType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkBaselinePosition to OCaml value */
value Val_GtkBaselinePosition(GtkBaselinePosition val) {
  switch (val) {
    case GTK_BASELINE_POSITION_TOP: return caml_hash_variant("TOP"); /* `TOP */
    case GTK_BASELINE_POSITION_CENTER: return caml_hash_variant("CENTER"); /* `CENTER */
    case GTK_BASELINE_POSITION_BOTTOM: return caml_hash_variant("BOTTOM"); /* `BOTTOM */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkBaselinePosition value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkBaselinePosition */
GtkBaselinePosition GtkBaselinePosition_val(value val) {
  if (val == caml_hash_variant("TOP")) return GTK_BASELINE_POSITION_TOP; /* `TOP */
  else if (val == caml_hash_variant("CENTER")) return GTK_BASELINE_POSITION_CENTER; /* `CENTER */
  else if (val == caml_hash_variant("BOTTOM")) return GTK_BASELINE_POSITION_BOTTOM; /* `BOTTOM */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkBaselinePosition tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkBorderStyle to OCaml value */
value Val_GtkBorderStyle(GtkBorderStyle val) {
  switch (val) {
    case GTK_BORDER_STYLE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_BORDER_STYLE_HIDDEN: return caml_hash_variant("HIDDEN"); /* `HIDDEN */
    case GTK_BORDER_STYLE_SOLID: return caml_hash_variant("SOLID"); /* `SOLID */
    case GTK_BORDER_STYLE_INSET: return caml_hash_variant("INSET"); /* `INSET */
    case GTK_BORDER_STYLE_OUTSET: return caml_hash_variant("OUTSET"); /* `OUTSET */
    case GTK_BORDER_STYLE_DOTTED: return caml_hash_variant("DOTTED"); /* `DOTTED */
    case GTK_BORDER_STYLE_DASHED: return caml_hash_variant("DASHED"); /* `DASHED */
    case GTK_BORDER_STYLE_DOUBLE: return caml_hash_variant("DOUBLE"); /* `DOUBLE */
    case GTK_BORDER_STYLE_GROOVE: return caml_hash_variant("GROOVE"); /* `GROOVE */
    case GTK_BORDER_STYLE_RIDGE: return caml_hash_variant("RIDGE"); /* `RIDGE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkBorderStyle value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkBorderStyle */
GtkBorderStyle GtkBorderStyle_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_BORDER_STYLE_NONE; /* `NONE */
  else if (val == caml_hash_variant("HIDDEN")) return GTK_BORDER_STYLE_HIDDEN; /* `HIDDEN */
  else if (val == caml_hash_variant("SOLID")) return GTK_BORDER_STYLE_SOLID; /* `SOLID */
  else if (val == caml_hash_variant("INSET")) return GTK_BORDER_STYLE_INSET; /* `INSET */
  else if (val == caml_hash_variant("OUTSET")) return GTK_BORDER_STYLE_OUTSET; /* `OUTSET */
  else if (val == caml_hash_variant("DOTTED")) return GTK_BORDER_STYLE_DOTTED; /* `DOTTED */
  else if (val == caml_hash_variant("DASHED")) return GTK_BORDER_STYLE_DASHED; /* `DASHED */
  else if (val == caml_hash_variant("DOUBLE")) return GTK_BORDER_STYLE_DOUBLE; /* `DOUBLE */
  else if (val == caml_hash_variant("GROOVE")) return GTK_BORDER_STYLE_GROOVE; /* `GROOVE */
  else if (val == caml_hash_variant("RIDGE")) return GTK_BORDER_STYLE_RIDGE; /* `RIDGE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkBorderStyle tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkBuilderError to OCaml value */
value Val_GtkBuilderError(GtkBuilderError val) {
  switch (val) {
    case GTK_BUILDER_ERROR_INVALID_TYPE_FUNCTION: return caml_hash_variant("INVALID_TYPE_FUNCTION"); /* `INVALID_TYPE_FUNCTION */
    case GTK_BUILDER_ERROR_UNHANDLED_TAG: return caml_hash_variant("UNHANDLED_TAG"); /* `UNHANDLED_TAG */
    case GTK_BUILDER_ERROR_MISSING_ATTRIBUTE: return caml_hash_variant("MISSING_ATTRIBUTE"); /* `MISSING_ATTRIBUTE */
    case GTK_BUILDER_ERROR_INVALID_ATTRIBUTE: return caml_hash_variant("INVALID_ATTRIBUTE"); /* `INVALID_ATTRIBUTE */
    case GTK_BUILDER_ERROR_INVALID_TAG: return caml_hash_variant("INVALID_TAG"); /* `INVALID_TAG */
    case GTK_BUILDER_ERROR_MISSING_PROPERTY_VALUE: return caml_hash_variant("MISSING_PROPERTY_VALUE"); /* `MISSING_PROPERTY_VALUE */
    case GTK_BUILDER_ERROR_INVALID_VALUE: return caml_hash_variant("INVALID_VALUE"); /* `INVALID_VALUE */
    case GTK_BUILDER_ERROR_VERSION_MISMATCH: return caml_hash_variant("VERSION_MISMATCH"); /* `VERSION_MISMATCH */
    case GTK_BUILDER_ERROR_DUPLICATE_ID: return caml_hash_variant("DUPLICATE_ID"); /* `DUPLICATE_ID */
    case GTK_BUILDER_ERROR_OBJECT_TYPE_REFUSED: return caml_hash_variant("OBJECT_TYPE_REFUSED"); /* `OBJECT_TYPE_REFUSED */
    case GTK_BUILDER_ERROR_TEMPLATE_MISMATCH: return caml_hash_variant("TEMPLATE_MISMATCH"); /* `TEMPLATE_MISMATCH */
    case GTK_BUILDER_ERROR_INVALID_PROPERTY: return caml_hash_variant("INVALID_PROPERTY"); /* `INVALID_PROPERTY */
    case GTK_BUILDER_ERROR_INVALID_SIGNAL: return caml_hash_variant("INVALID_SIGNAL"); /* `INVALID_SIGNAL */
    case GTK_BUILDER_ERROR_INVALID_ID: return caml_hash_variant("INVALID_ID"); /* `INVALID_ID */
    case GTK_BUILDER_ERROR_INVALID_FUNCTION: return caml_hash_variant("INVALID_FUNCTION"); /* `INVALID_FUNCTION */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkBuilderError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkBuilderError */
GtkBuilderError GtkBuilderError_val(value val) {
  if (val == caml_hash_variant("INVALID_TYPE_FUNCTION")) return GTK_BUILDER_ERROR_INVALID_TYPE_FUNCTION; /* `INVALID_TYPE_FUNCTION */
  else if (val == caml_hash_variant("UNHANDLED_TAG")) return GTK_BUILDER_ERROR_UNHANDLED_TAG; /* `UNHANDLED_TAG */
  else if (val == caml_hash_variant("MISSING_ATTRIBUTE")) return GTK_BUILDER_ERROR_MISSING_ATTRIBUTE; /* `MISSING_ATTRIBUTE */
  else if (val == caml_hash_variant("INVALID_ATTRIBUTE")) return GTK_BUILDER_ERROR_INVALID_ATTRIBUTE; /* `INVALID_ATTRIBUTE */
  else if (val == caml_hash_variant("INVALID_TAG")) return GTK_BUILDER_ERROR_INVALID_TAG; /* `INVALID_TAG */
  else if (val == caml_hash_variant("MISSING_PROPERTY_VALUE")) return GTK_BUILDER_ERROR_MISSING_PROPERTY_VALUE; /* `MISSING_PROPERTY_VALUE */
  else if (val == caml_hash_variant("INVALID_VALUE")) return GTK_BUILDER_ERROR_INVALID_VALUE; /* `INVALID_VALUE */
  else if (val == caml_hash_variant("VERSION_MISMATCH")) return GTK_BUILDER_ERROR_VERSION_MISMATCH; /* `VERSION_MISMATCH */
  else if (val == caml_hash_variant("DUPLICATE_ID")) return GTK_BUILDER_ERROR_DUPLICATE_ID; /* `DUPLICATE_ID */
  else if (val == caml_hash_variant("OBJECT_TYPE_REFUSED")) return GTK_BUILDER_ERROR_OBJECT_TYPE_REFUSED; /* `OBJECT_TYPE_REFUSED */
  else if (val == caml_hash_variant("TEMPLATE_MISMATCH")) return GTK_BUILDER_ERROR_TEMPLATE_MISMATCH; /* `TEMPLATE_MISMATCH */
  else if (val == caml_hash_variant("INVALID_PROPERTY")) return GTK_BUILDER_ERROR_INVALID_PROPERTY; /* `INVALID_PROPERTY */
  else if (val == caml_hash_variant("INVALID_SIGNAL")) return GTK_BUILDER_ERROR_INVALID_SIGNAL; /* `INVALID_SIGNAL */
  else if (val == caml_hash_variant("INVALID_ID")) return GTK_BUILDER_ERROR_INVALID_ID; /* `INVALID_ID */
  else if (val == caml_hash_variant("INVALID_FUNCTION")) return GTK_BUILDER_ERROR_INVALID_FUNCTION; /* `INVALID_FUNCTION */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkBuilderError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkButtonsType to OCaml value */
value Val_GtkButtonsType(GtkButtonsType val) {
  switch (val) {
    case GTK_BUTTONS_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_BUTTONS_OK: return caml_hash_variant("OK"); /* `OK */
    case GTK_BUTTONS_CLOSE: return caml_hash_variant("CLOSE"); /* `CLOSE */
    case GTK_BUTTONS_CANCEL: return caml_hash_variant("CANCEL"); /* `CANCEL */
    case GTK_BUTTONS_YES_NO: return caml_hash_variant("YES_NO"); /* `YES_NO */
    case GTK_BUTTONS_OK_CANCEL: return caml_hash_variant("OK_CANCEL"); /* `OK_CANCEL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkButtonsType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkButtonsType */
GtkButtonsType GtkButtonsType_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_BUTTONS_NONE; /* `NONE */
  else if (val == caml_hash_variant("OK")) return GTK_BUTTONS_OK; /* `OK */
  else if (val == caml_hash_variant("CLOSE")) return GTK_BUTTONS_CLOSE; /* `CLOSE */
  else if (val == caml_hash_variant("CANCEL")) return GTK_BUTTONS_CANCEL; /* `CANCEL */
  else if (val == caml_hash_variant("YES_NO")) return GTK_BUTTONS_YES_NO; /* `YES_NO */
  else if (val == caml_hash_variant("OK_CANCEL")) return GTK_BUTTONS_OK_CANCEL; /* `OK_CANCEL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkButtonsType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkCellRendererAccelMode to OCaml value */
value Val_GtkCellRendererAccelMode(GtkCellRendererAccelMode val) {
  switch (val) {
    case GTK_CELL_RENDERER_ACCEL_MODE_GTK: return caml_hash_variant("GTK"); /* `GTK */
    case GTK_CELL_RENDERER_ACCEL_MODE_OTHER: return caml_hash_variant("OTHER"); /* `OTHER */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkCellRendererAccelMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkCellRendererAccelMode */
GtkCellRendererAccelMode GtkCellRendererAccelMode_val(value val) {
  if (val == caml_hash_variant("GTK")) return GTK_CELL_RENDERER_ACCEL_MODE_GTK; /* `GTK */
  else if (val == caml_hash_variant("OTHER")) return GTK_CELL_RENDERER_ACCEL_MODE_OTHER; /* `OTHER */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkCellRendererAccelMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkCellRendererMode to OCaml value */
value Val_GtkCellRendererMode(GtkCellRendererMode val) {
  switch (val) {
    case GTK_CELL_RENDERER_MODE_INERT: return caml_hash_variant("INERT"); /* `INERT */
    case GTK_CELL_RENDERER_MODE_ACTIVATABLE: return caml_hash_variant("ACTIVATABLE"); /* `ACTIVATABLE */
    case GTK_CELL_RENDERER_MODE_EDITABLE: return caml_hash_variant("EDITABLE"); /* `EDITABLE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkCellRendererMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkCellRendererMode */
GtkCellRendererMode GtkCellRendererMode_val(value val) {
  if (val == caml_hash_variant("INERT")) return GTK_CELL_RENDERER_MODE_INERT; /* `INERT */
  else if (val == caml_hash_variant("ACTIVATABLE")) return GTK_CELL_RENDERER_MODE_ACTIVATABLE; /* `ACTIVATABLE */
  else if (val == caml_hash_variant("EDITABLE")) return GTK_CELL_RENDERER_MODE_EDITABLE; /* `EDITABLE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkCellRendererMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkCollation to OCaml value */
value Val_GtkCollation(GtkCollation val) {
  switch (val) {
    case GTK_COLLATION_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_COLLATION_UNICODE: return caml_hash_variant("UNICODE"); /* `UNICODE */
    case GTK_COLLATION_FILENAME: return caml_hash_variant("FILENAME"); /* `FILENAME */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkCollation value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkCollation */
GtkCollation GtkCollation_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_COLLATION_NONE; /* `NONE */
  else if (val == caml_hash_variant("UNICODE")) return GTK_COLLATION_UNICODE; /* `UNICODE */
  else if (val == caml_hash_variant("FILENAME")) return GTK_COLLATION_FILENAME; /* `FILENAME */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkCollation tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkConstraintAttribute to OCaml value */
value Val_GtkConstraintAttribute(GtkConstraintAttribute val) {
  switch (val) {
    case GTK_CONSTRAINT_ATTRIBUTE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_CONSTRAINT_ATTRIBUTE_LEFT: return caml_hash_variant("LEFT"); /* `LEFT */
    case GTK_CONSTRAINT_ATTRIBUTE_RIGHT: return caml_hash_variant("RIGHT"); /* `RIGHT */
    case GTK_CONSTRAINT_ATTRIBUTE_TOP: return caml_hash_variant("TOP"); /* `TOP */
    case GTK_CONSTRAINT_ATTRIBUTE_BOTTOM: return caml_hash_variant("BOTTOM"); /* `BOTTOM */
    case GTK_CONSTRAINT_ATTRIBUTE_START: return caml_hash_variant("START"); /* `START */
    case GTK_CONSTRAINT_ATTRIBUTE_END: return caml_hash_variant("END"); /* `END */
    case GTK_CONSTRAINT_ATTRIBUTE_WIDTH: return caml_hash_variant("WIDTH"); /* `WIDTH */
    case GTK_CONSTRAINT_ATTRIBUTE_HEIGHT: return caml_hash_variant("HEIGHT"); /* `HEIGHT */
    case GTK_CONSTRAINT_ATTRIBUTE_CENTER_X: return caml_hash_variant("CENTER_X"); /* `CENTER_X */
    case GTK_CONSTRAINT_ATTRIBUTE_CENTER_Y: return caml_hash_variant("CENTER_Y"); /* `CENTER_Y */
    case GTK_CONSTRAINT_ATTRIBUTE_BASELINE: return caml_hash_variant("BASELINE"); /* `BASELINE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkConstraintAttribute value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkConstraintAttribute */
GtkConstraintAttribute GtkConstraintAttribute_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_CONSTRAINT_ATTRIBUTE_NONE; /* `NONE */
  else if (val == caml_hash_variant("LEFT")) return GTK_CONSTRAINT_ATTRIBUTE_LEFT; /* `LEFT */
  else if (val == caml_hash_variant("RIGHT")) return GTK_CONSTRAINT_ATTRIBUTE_RIGHT; /* `RIGHT */
  else if (val == caml_hash_variant("TOP")) return GTK_CONSTRAINT_ATTRIBUTE_TOP; /* `TOP */
  else if (val == caml_hash_variant("BOTTOM")) return GTK_CONSTRAINT_ATTRIBUTE_BOTTOM; /* `BOTTOM */
  else if (val == caml_hash_variant("START")) return GTK_CONSTRAINT_ATTRIBUTE_START; /* `START */
  else if (val == caml_hash_variant("END")) return GTK_CONSTRAINT_ATTRIBUTE_END; /* `END */
  else if (val == caml_hash_variant("WIDTH")) return GTK_CONSTRAINT_ATTRIBUTE_WIDTH; /* `WIDTH */
  else if (val == caml_hash_variant("HEIGHT")) return GTK_CONSTRAINT_ATTRIBUTE_HEIGHT; /* `HEIGHT */
  else if (val == caml_hash_variant("CENTER_X")) return GTK_CONSTRAINT_ATTRIBUTE_CENTER_X; /* `CENTER_X */
  else if (val == caml_hash_variant("CENTER_Y")) return GTK_CONSTRAINT_ATTRIBUTE_CENTER_Y; /* `CENTER_Y */
  else if (val == caml_hash_variant("BASELINE")) return GTK_CONSTRAINT_ATTRIBUTE_BASELINE; /* `BASELINE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkConstraintAttribute tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkConstraintRelation to OCaml value */
value Val_GtkConstraintRelation(GtkConstraintRelation val) {
  switch (val) {
    case GTK_CONSTRAINT_RELATION_LE: return caml_hash_variant("LE"); /* `LE */
    case GTK_CONSTRAINT_RELATION_EQ: return caml_hash_variant("EQ"); /* `EQ */
    case GTK_CONSTRAINT_RELATION_GE: return caml_hash_variant("GE"); /* `GE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkConstraintRelation value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkConstraintRelation */
GtkConstraintRelation GtkConstraintRelation_val(value val) {
  if (val == caml_hash_variant("LE")) return GTK_CONSTRAINT_RELATION_LE; /* `LE */
  else if (val == caml_hash_variant("EQ")) return GTK_CONSTRAINT_RELATION_EQ; /* `EQ */
  else if (val == caml_hash_variant("GE")) return GTK_CONSTRAINT_RELATION_GE; /* `GE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkConstraintRelation tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkConstraintStrength to OCaml value */
value Val_GtkConstraintStrength(GtkConstraintStrength val) {
  switch (val) {
    case GTK_CONSTRAINT_STRENGTH_REQUIRED: return caml_hash_variant("REQUIRED"); /* `REQUIRED */
    case GTK_CONSTRAINT_STRENGTH_STRONG: return caml_hash_variant("STRONG"); /* `STRONG */
    case GTK_CONSTRAINT_STRENGTH_MEDIUM: return caml_hash_variant("MEDIUM"); /* `MEDIUM */
    case GTK_CONSTRAINT_STRENGTH_WEAK: return caml_hash_variant("WEAK"); /* `WEAK */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkConstraintStrength value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkConstraintStrength */
GtkConstraintStrength GtkConstraintStrength_val(value val) {
  if (val == caml_hash_variant("REQUIRED")) return GTK_CONSTRAINT_STRENGTH_REQUIRED; /* `REQUIRED */
  else if (val == caml_hash_variant("STRONG")) return GTK_CONSTRAINT_STRENGTH_STRONG; /* `STRONG */
  else if (val == caml_hash_variant("MEDIUM")) return GTK_CONSTRAINT_STRENGTH_MEDIUM; /* `MEDIUM */
  else if (val == caml_hash_variant("WEAK")) return GTK_CONSTRAINT_STRENGTH_WEAK; /* `WEAK */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkConstraintStrength tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkConstraintVflParserError to OCaml value */
value Val_GtkConstraintVflParserError(GtkConstraintVflParserError val) {
  switch (val) {
    case GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_SYMBOL: return caml_hash_variant("SYMBOL"); /* `SYMBOL */
    case GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_ATTRIBUTE: return caml_hash_variant("ATTRIBUTE"); /* `ATTRIBUTE */
    case GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_VIEW: return caml_hash_variant("VIEW"); /* `VIEW */
    case GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_METRIC: return caml_hash_variant("METRIC"); /* `METRIC */
    case GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_PRIORITY: return caml_hash_variant("PRIORITY"); /* `PRIORITY */
    case GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_RELATION: return caml_hash_variant("RELATION"); /* `RELATION */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkConstraintVflParserError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkConstraintVflParserError */
GtkConstraintVflParserError GtkConstraintVflParserError_val(value val) {
  if (val == caml_hash_variant("SYMBOL")) return GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_SYMBOL; /* `SYMBOL */
  else if (val == caml_hash_variant("ATTRIBUTE")) return GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_ATTRIBUTE; /* `ATTRIBUTE */
  else if (val == caml_hash_variant("VIEW")) return GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_VIEW; /* `VIEW */
  else if (val == caml_hash_variant("METRIC")) return GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_METRIC; /* `METRIC */
  else if (val == caml_hash_variant("PRIORITY")) return GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_PRIORITY; /* `PRIORITY */
  else if (val == caml_hash_variant("RELATION")) return GTK_CONSTRAINT_VFL_PARSER_ERROR_INVALID_RELATION; /* `RELATION */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkConstraintVflParserError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkContentFit to OCaml value */
value Val_GtkContentFit(GtkContentFit val) {
  switch (val) {
    case GTK_CONTENT_FIT_FILL: return caml_hash_variant("FILL"); /* `FILL */
    case GTK_CONTENT_FIT_CONTAIN: return caml_hash_variant("CONTAIN"); /* `CONTAIN */
    case GTK_CONTENT_FIT_COVER: return caml_hash_variant("COVER"); /* `COVER */
    case GTK_CONTENT_FIT_SCALE_DOWN: return caml_hash_variant("SCALE_DOWN"); /* `SCALE_DOWN */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkContentFit value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkContentFit */
GtkContentFit GtkContentFit_val(value val) {
  if (val == caml_hash_variant("FILL")) return GTK_CONTENT_FIT_FILL; /* `FILL */
  else if (val == caml_hash_variant("CONTAIN")) return GTK_CONTENT_FIT_CONTAIN; /* `CONTAIN */
  else if (val == caml_hash_variant("COVER")) return GTK_CONTENT_FIT_COVER; /* `COVER */
  else if (val == caml_hash_variant("SCALE_DOWN")) return GTK_CONTENT_FIT_SCALE_DOWN; /* `SCALE_DOWN */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkContentFit tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkCornerType to OCaml value */
value Val_GtkCornerType(GtkCornerType val) {
  switch (val) {
    case GTK_CORNER_TOP_LEFT: return caml_hash_variant("TOP_LEFT"); /* `TOP_LEFT */
    case GTK_CORNER_BOTTOM_LEFT: return caml_hash_variant("BOTTOM_LEFT"); /* `BOTTOM_LEFT */
    case GTK_CORNER_TOP_RIGHT: return caml_hash_variant("TOP_RIGHT"); /* `TOP_RIGHT */
    case GTK_CORNER_BOTTOM_RIGHT: return caml_hash_variant("BOTTOM_RIGHT"); /* `BOTTOM_RIGHT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkCornerType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkCornerType */
GtkCornerType GtkCornerType_val(value val) {
  if (val == caml_hash_variant("TOP_LEFT")) return GTK_CORNER_TOP_LEFT; /* `TOP_LEFT */
  else if (val == caml_hash_variant("BOTTOM_LEFT")) return GTK_CORNER_BOTTOM_LEFT; /* `BOTTOM_LEFT */
  else if (val == caml_hash_variant("TOP_RIGHT")) return GTK_CORNER_TOP_RIGHT; /* `TOP_RIGHT */
  else if (val == caml_hash_variant("BOTTOM_RIGHT")) return GTK_CORNER_BOTTOM_RIGHT; /* `BOTTOM_RIGHT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkCornerType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkCssParserError to OCaml value */
value Val_GtkCssParserError(GtkCssParserError val) {
  switch (val) {
    case GTK_CSS_PARSER_ERROR_FAILED: return caml_hash_variant("FAILED"); /* `FAILED */
    case GTK_CSS_PARSER_ERROR_SYNTAX: return caml_hash_variant("SYNTAX"); /* `SYNTAX */
    case GTK_CSS_PARSER_ERROR_IMPORT: return caml_hash_variant("IMPORT"); /* `IMPORT */
    case GTK_CSS_PARSER_ERROR_NAME: return caml_hash_variant("NAME"); /* `NAME */
    case GTK_CSS_PARSER_ERROR_UNKNOWN_VALUE: return caml_hash_variant("UNKNOWN_VALUE"); /* `UNKNOWN_VALUE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkCssParserError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkCssParserError */
GtkCssParserError GtkCssParserError_val(value val) {
  if (val == caml_hash_variant("FAILED")) return GTK_CSS_PARSER_ERROR_FAILED; /* `FAILED */
  else if (val == caml_hash_variant("SYNTAX")) return GTK_CSS_PARSER_ERROR_SYNTAX; /* `SYNTAX */
  else if (val == caml_hash_variant("IMPORT")) return GTK_CSS_PARSER_ERROR_IMPORT; /* `IMPORT */
  else if (val == caml_hash_variant("NAME")) return GTK_CSS_PARSER_ERROR_NAME; /* `NAME */
  else if (val == caml_hash_variant("UNKNOWN_VALUE")) return GTK_CSS_PARSER_ERROR_UNKNOWN_VALUE; /* `UNKNOWN_VALUE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkCssParserError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkCssParserWarning to OCaml value */
value Val_GtkCssParserWarning(GtkCssParserWarning val) {
  switch (val) {
    case GTK_CSS_PARSER_WARNING_DEPRECATED: return caml_hash_variant("DEPRECATED"); /* `DEPRECATED */
    case GTK_CSS_PARSER_WARNING_SYNTAX: return caml_hash_variant("SYNTAX"); /* `SYNTAX */
    case GTK_CSS_PARSER_WARNING_UNIMPLEMENTED: return caml_hash_variant("UNIMPLEMENTED"); /* `UNIMPLEMENTED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkCssParserWarning value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkCssParserWarning */
GtkCssParserWarning GtkCssParserWarning_val(value val) {
  if (val == caml_hash_variant("DEPRECATED")) return GTK_CSS_PARSER_WARNING_DEPRECATED; /* `DEPRECATED */
  else if (val == caml_hash_variant("SYNTAX")) return GTK_CSS_PARSER_WARNING_SYNTAX; /* `SYNTAX */
  else if (val == caml_hash_variant("UNIMPLEMENTED")) return GTK_CSS_PARSER_WARNING_UNIMPLEMENTED; /* `UNIMPLEMENTED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkCssParserWarning tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkDeleteType to OCaml value */
value Val_GtkDeleteType(GtkDeleteType val) {
  switch (val) {
    case GTK_DELETE_CHARS: return caml_hash_variant("CHARS"); /* `CHARS */
    case GTK_DELETE_WORD_ENDS: return caml_hash_variant("WORD_ENDS"); /* `WORD_ENDS */
    case GTK_DELETE_WORDS: return caml_hash_variant("WORDS"); /* `WORDS */
    case GTK_DELETE_DISPLAY_LINES: return caml_hash_variant("DISPLAY_LINES"); /* `DISPLAY_LINES */
    case GTK_DELETE_DISPLAY_LINE_ENDS: return caml_hash_variant("DISPLAY_LINE_ENDS"); /* `DISPLAY_LINE_ENDS */
    case GTK_DELETE_PARAGRAPH_ENDS: return caml_hash_variant("PARAGRAPH_ENDS"); /* `PARAGRAPH_ENDS */
    case GTK_DELETE_PARAGRAPHS: return caml_hash_variant("PARAGRAPHS"); /* `PARAGRAPHS */
    case GTK_DELETE_WHITESPACE: return caml_hash_variant("WHITESPACE"); /* `WHITESPACE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkDeleteType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkDeleteType */
GtkDeleteType GtkDeleteType_val(value val) {
  if (val == caml_hash_variant("CHARS")) return GTK_DELETE_CHARS; /* `CHARS */
  else if (val == caml_hash_variant("WORD_ENDS")) return GTK_DELETE_WORD_ENDS; /* `WORD_ENDS */
  else if (val == caml_hash_variant("WORDS")) return GTK_DELETE_WORDS; /* `WORDS */
  else if (val == caml_hash_variant("DISPLAY_LINES")) return GTK_DELETE_DISPLAY_LINES; /* `DISPLAY_LINES */
  else if (val == caml_hash_variant("DISPLAY_LINE_ENDS")) return GTK_DELETE_DISPLAY_LINE_ENDS; /* `DISPLAY_LINE_ENDS */
  else if (val == caml_hash_variant("PARAGRAPH_ENDS")) return GTK_DELETE_PARAGRAPH_ENDS; /* `PARAGRAPH_ENDS */
  else if (val == caml_hash_variant("PARAGRAPHS")) return GTK_DELETE_PARAGRAPHS; /* `PARAGRAPHS */
  else if (val == caml_hash_variant("WHITESPACE")) return GTK_DELETE_WHITESPACE; /* `WHITESPACE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkDeleteType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkDialogError to OCaml value */
value Val_GtkDialogError(GtkDialogError val) {
  switch (val) {
    case GTK_DIALOG_ERROR_FAILED: return caml_hash_variant("FAILED"); /* `FAILED */
    case GTK_DIALOG_ERROR_CANCELLED: return caml_hash_variant("CANCELLED"); /* `CANCELLED */
    case GTK_DIALOG_ERROR_DISMISSED: return caml_hash_variant("DISMISSED"); /* `DISMISSED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkDialogError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkDialogError */
GtkDialogError GtkDialogError_val(value val) {
  if (val == caml_hash_variant("FAILED")) return GTK_DIALOG_ERROR_FAILED; /* `FAILED */
  else if (val == caml_hash_variant("CANCELLED")) return GTK_DIALOG_ERROR_CANCELLED; /* `CANCELLED */
  else if (val == caml_hash_variant("DISMISSED")) return GTK_DIALOG_ERROR_DISMISSED; /* `DISMISSED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkDialogError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkDirectionType to OCaml value */
value Val_GtkDirectionType(GtkDirectionType val) {
  switch (val) {
    case GTK_DIR_TAB_FORWARD: return caml_hash_variant("TAB_FORWARD"); /* `TAB_FORWARD */
    case GTK_DIR_TAB_BACKWARD: return caml_hash_variant("TAB_BACKWARD"); /* `TAB_BACKWARD */
    case GTK_DIR_UP: return caml_hash_variant("UP"); /* `UP */
    case GTK_DIR_DOWN: return caml_hash_variant("DOWN"); /* `DOWN */
    case GTK_DIR_LEFT: return caml_hash_variant("LEFT"); /* `LEFT */
    case GTK_DIR_RIGHT: return caml_hash_variant("RIGHT"); /* `RIGHT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkDirectionType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkDirectionType */
GtkDirectionType GtkDirectionType_val(value val) {
  if (val == caml_hash_variant("TAB_FORWARD")) return GTK_DIR_TAB_FORWARD; /* `TAB_FORWARD */
  else if (val == caml_hash_variant("TAB_BACKWARD")) return GTK_DIR_TAB_BACKWARD; /* `TAB_BACKWARD */
  else if (val == caml_hash_variant("UP")) return GTK_DIR_UP; /* `UP */
  else if (val == caml_hash_variant("DOWN")) return GTK_DIR_DOWN; /* `DOWN */
  else if (val == caml_hash_variant("LEFT")) return GTK_DIR_LEFT; /* `LEFT */
  else if (val == caml_hash_variant("RIGHT")) return GTK_DIR_RIGHT; /* `RIGHT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkDirectionType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkEditableProperties to OCaml value */
value Val_GtkEditableProperties(GtkEditableProperties val) {
  switch (val) {
    case GTK_EDITABLE_PROP_TEXT: return caml_hash_variant("PROP_TEXT"); /* `PROP_TEXT */
    case GTK_EDITABLE_PROP_CURSOR_POSITION: return caml_hash_variant("PROP_CURSOR_POSITION"); /* `PROP_CURSOR_POSITION */
    case GTK_EDITABLE_PROP_SELECTION_BOUND: return caml_hash_variant("PROP_SELECTION_BOUND"); /* `PROP_SELECTION_BOUND */
    case GTK_EDITABLE_PROP_EDITABLE: return caml_hash_variant("PROP_EDITABLE"); /* `PROP_EDITABLE */
    case GTK_EDITABLE_PROP_WIDTH_CHARS: return caml_hash_variant("PROP_WIDTH_CHARS"); /* `PROP_WIDTH_CHARS */
    case GTK_EDITABLE_PROP_MAX_WIDTH_CHARS: return caml_hash_variant("PROP_MAX_WIDTH_CHARS"); /* `PROP_MAX_WIDTH_CHARS */
    case GTK_EDITABLE_PROP_XALIGN: return caml_hash_variant("PROP_XALIGN"); /* `PROP_XALIGN */
    case GTK_EDITABLE_PROP_ENABLE_UNDO: return caml_hash_variant("PROP_ENABLE_UNDO"); /* `PROP_ENABLE_UNDO */
    case GTK_EDITABLE_NUM_PROPERTIES: return caml_hash_variant("NUM_PROPERTIES"); /* `NUM_PROPERTIES */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkEditableProperties value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkEditableProperties */
GtkEditableProperties GtkEditableProperties_val(value val) {
  if (val == caml_hash_variant("PROP_TEXT")) return GTK_EDITABLE_PROP_TEXT; /* `PROP_TEXT */
  else if (val == caml_hash_variant("PROP_CURSOR_POSITION")) return GTK_EDITABLE_PROP_CURSOR_POSITION; /* `PROP_CURSOR_POSITION */
  else if (val == caml_hash_variant("PROP_SELECTION_BOUND")) return GTK_EDITABLE_PROP_SELECTION_BOUND; /* `PROP_SELECTION_BOUND */
  else if (val == caml_hash_variant("PROP_EDITABLE")) return GTK_EDITABLE_PROP_EDITABLE; /* `PROP_EDITABLE */
  else if (val == caml_hash_variant("PROP_WIDTH_CHARS")) return GTK_EDITABLE_PROP_WIDTH_CHARS; /* `PROP_WIDTH_CHARS */
  else if (val == caml_hash_variant("PROP_MAX_WIDTH_CHARS")) return GTK_EDITABLE_PROP_MAX_WIDTH_CHARS; /* `PROP_MAX_WIDTH_CHARS */
  else if (val == caml_hash_variant("PROP_XALIGN")) return GTK_EDITABLE_PROP_XALIGN; /* `PROP_XALIGN */
  else if (val == caml_hash_variant("PROP_ENABLE_UNDO")) return GTK_EDITABLE_PROP_ENABLE_UNDO; /* `PROP_ENABLE_UNDO */
  else if (val == caml_hash_variant("NUM_PROPERTIES")) return GTK_EDITABLE_NUM_PROPERTIES; /* `NUM_PROPERTIES */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkEditableProperties tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkEntryIconPosition to OCaml value */
value Val_GtkEntryIconPosition(GtkEntryIconPosition val) {
  switch (val) {
    case GTK_ENTRY_ICON_PRIMARY: return caml_hash_variant("PRIMARY"); /* `PRIMARY */
    case GTK_ENTRY_ICON_SECONDARY: return caml_hash_variant("SECONDARY"); /* `SECONDARY */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkEntryIconPosition value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkEntryIconPosition */
GtkEntryIconPosition GtkEntryIconPosition_val(value val) {
  if (val == caml_hash_variant("PRIMARY")) return GTK_ENTRY_ICON_PRIMARY; /* `PRIMARY */
  else if (val == caml_hash_variant("SECONDARY")) return GTK_ENTRY_ICON_SECONDARY; /* `SECONDARY */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkEntryIconPosition tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkEventSequenceState to OCaml value */
value Val_GtkEventSequenceState(GtkEventSequenceState val) {
  switch (val) {
    case GTK_EVENT_SEQUENCE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_EVENT_SEQUENCE_CLAIMED: return caml_hash_variant("CLAIMED"); /* `CLAIMED */
    case GTK_EVENT_SEQUENCE_DENIED: return caml_hash_variant("DENIED"); /* `DENIED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkEventSequenceState value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkEventSequenceState */
GtkEventSequenceState GtkEventSequenceState_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_EVENT_SEQUENCE_NONE; /* `NONE */
  else if (val == caml_hash_variant("CLAIMED")) return GTK_EVENT_SEQUENCE_CLAIMED; /* `CLAIMED */
  else if (val == caml_hash_variant("DENIED")) return GTK_EVENT_SEQUENCE_DENIED; /* `DENIED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkEventSequenceState tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkFileChooserAction to OCaml value */
value Val_GtkFileChooserAction(GtkFileChooserAction val) {
  switch (val) {
    case GTK_FILE_CHOOSER_ACTION_OPEN: return caml_hash_variant("OPEN"); /* `OPEN */
    case GTK_FILE_CHOOSER_ACTION_SAVE: return caml_hash_variant("SAVE"); /* `SAVE */
    case GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER: return caml_hash_variant("SELECT_FOLDER"); /* `SELECT_FOLDER */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkFileChooserAction value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkFileChooserAction */
GtkFileChooserAction GtkFileChooserAction_val(value val) {
  if (val == caml_hash_variant("OPEN")) return GTK_FILE_CHOOSER_ACTION_OPEN; /* `OPEN */
  else if (val == caml_hash_variant("SAVE")) return GTK_FILE_CHOOSER_ACTION_SAVE; /* `SAVE */
  else if (val == caml_hash_variant("SELECT_FOLDER")) return GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER; /* `SELECT_FOLDER */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkFileChooserAction tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkFileChooserError to OCaml value */
value Val_GtkFileChooserError(GtkFileChooserError val) {
  switch (val) {
    case GTK_FILE_CHOOSER_ERROR_NONEXISTENT: return caml_hash_variant("NONEXISTENT"); /* `NONEXISTENT */
    case GTK_FILE_CHOOSER_ERROR_BAD_FILENAME: return caml_hash_variant("BAD_FILENAME"); /* `BAD_FILENAME */
    case GTK_FILE_CHOOSER_ERROR_ALREADY_EXISTS: return caml_hash_variant("ALREADY_EXISTS"); /* `ALREADY_EXISTS */
    case GTK_FILE_CHOOSER_ERROR_INCOMPLETE_HOSTNAME: return caml_hash_variant("INCOMPLETE_HOSTNAME"); /* `INCOMPLETE_HOSTNAME */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkFileChooserError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkFileChooserError */
GtkFileChooserError GtkFileChooserError_val(value val) {
  if (val == caml_hash_variant("NONEXISTENT")) return GTK_FILE_CHOOSER_ERROR_NONEXISTENT; /* `NONEXISTENT */
  else if (val == caml_hash_variant("BAD_FILENAME")) return GTK_FILE_CHOOSER_ERROR_BAD_FILENAME; /* `BAD_FILENAME */
  else if (val == caml_hash_variant("ALREADY_EXISTS")) return GTK_FILE_CHOOSER_ERROR_ALREADY_EXISTS; /* `ALREADY_EXISTS */
  else if (val == caml_hash_variant("INCOMPLETE_HOSTNAME")) return GTK_FILE_CHOOSER_ERROR_INCOMPLETE_HOSTNAME; /* `INCOMPLETE_HOSTNAME */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkFileChooserError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkFilterChange to OCaml value */
value Val_GtkFilterChange(GtkFilterChange val) {
  switch (val) {
    case GTK_FILTER_CHANGE_DIFFERENT: return caml_hash_variant("DIFFERENT"); /* `DIFFERENT */
    case GTK_FILTER_CHANGE_LESS_STRICT: return caml_hash_variant("LESS_STRICT"); /* `LESS_STRICT */
    case GTK_FILTER_CHANGE_MORE_STRICT: return caml_hash_variant("MORE_STRICT"); /* `MORE_STRICT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkFilterChange value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkFilterChange */
GtkFilterChange GtkFilterChange_val(value val) {
  if (val == caml_hash_variant("DIFFERENT")) return GTK_FILTER_CHANGE_DIFFERENT; /* `DIFFERENT */
  else if (val == caml_hash_variant("LESS_STRICT")) return GTK_FILTER_CHANGE_LESS_STRICT; /* `LESS_STRICT */
  else if (val == caml_hash_variant("MORE_STRICT")) return GTK_FILTER_CHANGE_MORE_STRICT; /* `MORE_STRICT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkFilterChange tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkFilterMatch to OCaml value */
value Val_GtkFilterMatch(GtkFilterMatch val) {
  switch (val) {
    case GTK_FILTER_MATCH_SOME: return caml_hash_variant("SOME"); /* `SOME */
    case GTK_FILTER_MATCH_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_FILTER_MATCH_ALL: return caml_hash_variant("ALL"); /* `ALL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkFilterMatch value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkFilterMatch */
GtkFilterMatch GtkFilterMatch_val(value val) {
  if (val == caml_hash_variant("SOME")) return GTK_FILTER_MATCH_SOME; /* `SOME */
  else if (val == caml_hash_variant("NONE")) return GTK_FILTER_MATCH_NONE; /* `NONE */
  else if (val == caml_hash_variant("ALL")) return GTK_FILTER_MATCH_ALL; /* `ALL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkFilterMatch tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkFontLevel to OCaml value */
value Val_GtkFontLevel(GtkFontLevel val) {
  switch (val) {
    case GTK_FONT_LEVEL_FAMILY: return caml_hash_variant("FAMILY"); /* `FAMILY */
    case GTK_FONT_LEVEL_FACE: return caml_hash_variant("FACE"); /* `FACE */
    case GTK_FONT_LEVEL_FONT: return caml_hash_variant("FONT"); /* `FONT */
    case GTK_FONT_LEVEL_FEATURES: return caml_hash_variant("FEATURES"); /* `FEATURES */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkFontLevel value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkFontLevel */
GtkFontLevel GtkFontLevel_val(value val) {
  if (val == caml_hash_variant("FAMILY")) return GTK_FONT_LEVEL_FAMILY; /* `FAMILY */
  else if (val == caml_hash_variant("FACE")) return GTK_FONT_LEVEL_FACE; /* `FACE */
  else if (val == caml_hash_variant("FONT")) return GTK_FONT_LEVEL_FONT; /* `FONT */
  else if (val == caml_hash_variant("FEATURES")) return GTK_FONT_LEVEL_FEATURES; /* `FEATURES */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkFontLevel tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkGraphicsOffloadEnabled to OCaml value */
value Val_GtkGraphicsOffloadEnabled(GtkGraphicsOffloadEnabled val) {
  switch (val) {
    case GTK_GRAPHICS_OFFLOAD_ENABLED: return caml_hash_variant("ENABLED"); /* `ENABLED */
    case GTK_GRAPHICS_OFFLOAD_DISABLED: return caml_hash_variant("DISABLED"); /* `DISABLED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkGraphicsOffloadEnabled value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkGraphicsOffloadEnabled */
GtkGraphicsOffloadEnabled GtkGraphicsOffloadEnabled_val(value val) {
  if (val == caml_hash_variant("ENABLED")) return GTK_GRAPHICS_OFFLOAD_ENABLED; /* `ENABLED */
  else if (val == caml_hash_variant("DISABLED")) return GTK_GRAPHICS_OFFLOAD_DISABLED; /* `DISABLED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkGraphicsOffloadEnabled tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkIconSize to OCaml value */
value Val_GtkIconSize(GtkIconSize val) {
  switch (val) {
    case GTK_ICON_SIZE_INHERIT: return caml_hash_variant("INHERIT"); /* `INHERIT */
    case GTK_ICON_SIZE_NORMAL: return caml_hash_variant("NORMAL"); /* `NORMAL */
    case GTK_ICON_SIZE_LARGE: return caml_hash_variant("LARGE"); /* `LARGE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkIconSize value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkIconSize */
GtkIconSize GtkIconSize_val(value val) {
  if (val == caml_hash_variant("INHERIT")) return GTK_ICON_SIZE_INHERIT; /* `INHERIT */
  else if (val == caml_hash_variant("NORMAL")) return GTK_ICON_SIZE_NORMAL; /* `NORMAL */
  else if (val == caml_hash_variant("LARGE")) return GTK_ICON_SIZE_LARGE; /* `LARGE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkIconSize tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkIconThemeError to OCaml value */
value Val_GtkIconThemeError(GtkIconThemeError val) {
  switch (val) {
    case GTK_ICON_THEME_NOT_FOUND: return caml_hash_variant("NOT_FOUND"); /* `NOT_FOUND */
    case GTK_ICON_THEME_FAILED: return caml_hash_variant("FAILED"); /* `FAILED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkIconThemeError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkIconThemeError */
GtkIconThemeError GtkIconThemeError_val(value val) {
  if (val == caml_hash_variant("NOT_FOUND")) return GTK_ICON_THEME_NOT_FOUND; /* `NOT_FOUND */
  else if (val == caml_hash_variant("FAILED")) return GTK_ICON_THEME_FAILED; /* `FAILED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkIconThemeError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkIconViewDropPosition to OCaml value */
value Val_GtkIconViewDropPosition(GtkIconViewDropPosition val) {
  switch (val) {
    case GTK_ICON_VIEW_NO_DROP: return caml_hash_variant("NO_DROP"); /* `NO_DROP */
    case GTK_ICON_VIEW_DROP_INTO: return caml_hash_variant("DROP_INTO"); /* `DROP_INTO */
    case GTK_ICON_VIEW_DROP_LEFT: return caml_hash_variant("DROP_LEFT"); /* `DROP_LEFT */
    case GTK_ICON_VIEW_DROP_RIGHT: return caml_hash_variant("DROP_RIGHT"); /* `DROP_RIGHT */
    case GTK_ICON_VIEW_DROP_ABOVE: return caml_hash_variant("DROP_ABOVE"); /* `DROP_ABOVE */
    case GTK_ICON_VIEW_DROP_BELOW: return caml_hash_variant("DROP_BELOW"); /* `DROP_BELOW */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkIconViewDropPosition value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkIconViewDropPosition */
GtkIconViewDropPosition GtkIconViewDropPosition_val(value val) {
  if (val == caml_hash_variant("NO_DROP")) return GTK_ICON_VIEW_NO_DROP; /* `NO_DROP */
  else if (val == caml_hash_variant("DROP_INTO")) return GTK_ICON_VIEW_DROP_INTO; /* `DROP_INTO */
  else if (val == caml_hash_variant("DROP_LEFT")) return GTK_ICON_VIEW_DROP_LEFT; /* `DROP_LEFT */
  else if (val == caml_hash_variant("DROP_RIGHT")) return GTK_ICON_VIEW_DROP_RIGHT; /* `DROP_RIGHT */
  else if (val == caml_hash_variant("DROP_ABOVE")) return GTK_ICON_VIEW_DROP_ABOVE; /* `DROP_ABOVE */
  else if (val == caml_hash_variant("DROP_BELOW")) return GTK_ICON_VIEW_DROP_BELOW; /* `DROP_BELOW */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkIconViewDropPosition tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkImageType to OCaml value */
value Val_GtkImageType(GtkImageType val) {
  switch (val) {
    case GTK_IMAGE_EMPTY: return caml_hash_variant("EMPTY"); /* `EMPTY */
    case GTK_IMAGE_ICON_NAME: return caml_hash_variant("ICON_NAME"); /* `ICON_NAME */
    case GTK_IMAGE_GICON: return caml_hash_variant("GICON"); /* `GICON */
    case GTK_IMAGE_PAINTABLE: return caml_hash_variant("PAINTABLE"); /* `PAINTABLE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkImageType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkImageType */
GtkImageType GtkImageType_val(value val) {
  if (val == caml_hash_variant("EMPTY")) return GTK_IMAGE_EMPTY; /* `EMPTY */
  else if (val == caml_hash_variant("ICON_NAME")) return GTK_IMAGE_ICON_NAME; /* `ICON_NAME */
  else if (val == caml_hash_variant("GICON")) return GTK_IMAGE_GICON; /* `GICON */
  else if (val == caml_hash_variant("PAINTABLE")) return GTK_IMAGE_PAINTABLE; /* `PAINTABLE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkImageType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkInputPurpose to OCaml value */
value Val_GtkInputPurpose(GtkInputPurpose val) {
  switch (val) {
    case GTK_INPUT_PURPOSE_FREE_FORM: return caml_hash_variant("FREE_FORM"); /* `FREE_FORM */
    case GTK_INPUT_PURPOSE_ALPHA: return caml_hash_variant("ALPHA"); /* `ALPHA */
    case GTK_INPUT_PURPOSE_DIGITS: return caml_hash_variant("DIGITS"); /* `DIGITS */
    case GTK_INPUT_PURPOSE_NUMBER: return caml_hash_variant("NUMBER"); /* `NUMBER */
    case GTK_INPUT_PURPOSE_PHONE: return caml_hash_variant("PHONE"); /* `PHONE */
    case GTK_INPUT_PURPOSE_URL: return caml_hash_variant("URL"); /* `URL */
    case GTK_INPUT_PURPOSE_EMAIL: return caml_hash_variant("EMAIL"); /* `EMAIL */
    case GTK_INPUT_PURPOSE_NAME: return caml_hash_variant("NAME"); /* `NAME */
    case GTK_INPUT_PURPOSE_PASSWORD: return caml_hash_variant("PASSWORD"); /* `PASSWORD */
    case GTK_INPUT_PURPOSE_PIN: return caml_hash_variant("PIN"); /* `PIN */
    case GTK_INPUT_PURPOSE_TERMINAL: return caml_hash_variant("TERMINAL"); /* `TERMINAL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkInputPurpose value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkInputPurpose */
GtkInputPurpose GtkInputPurpose_val(value val) {
  if (val == caml_hash_variant("FREE_FORM")) return GTK_INPUT_PURPOSE_FREE_FORM; /* `FREE_FORM */
  else if (val == caml_hash_variant("ALPHA")) return GTK_INPUT_PURPOSE_ALPHA; /* `ALPHA */
  else if (val == caml_hash_variant("DIGITS")) return GTK_INPUT_PURPOSE_DIGITS; /* `DIGITS */
  else if (val == caml_hash_variant("NUMBER")) return GTK_INPUT_PURPOSE_NUMBER; /* `NUMBER */
  else if (val == caml_hash_variant("PHONE")) return GTK_INPUT_PURPOSE_PHONE; /* `PHONE */
  else if (val == caml_hash_variant("URL")) return GTK_INPUT_PURPOSE_URL; /* `URL */
  else if (val == caml_hash_variant("EMAIL")) return GTK_INPUT_PURPOSE_EMAIL; /* `EMAIL */
  else if (val == caml_hash_variant("NAME")) return GTK_INPUT_PURPOSE_NAME; /* `NAME */
  else if (val == caml_hash_variant("PASSWORD")) return GTK_INPUT_PURPOSE_PASSWORD; /* `PASSWORD */
  else if (val == caml_hash_variant("PIN")) return GTK_INPUT_PURPOSE_PIN; /* `PIN */
  else if (val == caml_hash_variant("TERMINAL")) return GTK_INPUT_PURPOSE_TERMINAL; /* `TERMINAL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkInputPurpose tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkInscriptionOverflow to OCaml value */
value Val_GtkInscriptionOverflow(GtkInscriptionOverflow val) {
  switch (val) {
    case GTK_INSCRIPTION_OVERFLOW_CLIP: return caml_hash_variant("CLIP"); /* `CLIP */
    case GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_START: return caml_hash_variant("ELLIPSIZE_START"); /* `ELLIPSIZE_START */
    case GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_MIDDLE: return caml_hash_variant("ELLIPSIZE_MIDDLE"); /* `ELLIPSIZE_MIDDLE */
    case GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_END: return caml_hash_variant("ELLIPSIZE_END"); /* `ELLIPSIZE_END */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkInscriptionOverflow value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkInscriptionOverflow */
GtkInscriptionOverflow GtkInscriptionOverflow_val(value val) {
  if (val == caml_hash_variant("CLIP")) return GTK_INSCRIPTION_OVERFLOW_CLIP; /* `CLIP */
  else if (val == caml_hash_variant("ELLIPSIZE_START")) return GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_START; /* `ELLIPSIZE_START */
  else if (val == caml_hash_variant("ELLIPSIZE_MIDDLE")) return GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_MIDDLE; /* `ELLIPSIZE_MIDDLE */
  else if (val == caml_hash_variant("ELLIPSIZE_END")) return GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_END; /* `ELLIPSIZE_END */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkInscriptionOverflow tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkJustification to OCaml value */
value Val_GtkJustification(GtkJustification val) {
  switch (val) {
    case GTK_JUSTIFY_LEFT: return caml_hash_variant("LEFT"); /* `LEFT */
    case GTK_JUSTIFY_RIGHT: return caml_hash_variant("RIGHT"); /* `RIGHT */
    case GTK_JUSTIFY_CENTER: return caml_hash_variant("CENTER"); /* `CENTER */
    case GTK_JUSTIFY_FILL: return caml_hash_variant("FILL"); /* `FILL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkJustification value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkJustification */
GtkJustification GtkJustification_val(value val) {
  if (val == caml_hash_variant("LEFT")) return GTK_JUSTIFY_LEFT; /* `LEFT */
  else if (val == caml_hash_variant("RIGHT")) return GTK_JUSTIFY_RIGHT; /* `RIGHT */
  else if (val == caml_hash_variant("CENTER")) return GTK_JUSTIFY_CENTER; /* `CENTER */
  else if (val == caml_hash_variant("FILL")) return GTK_JUSTIFY_FILL; /* `FILL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkJustification tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkLevelBarMode to OCaml value */
value Val_GtkLevelBarMode(GtkLevelBarMode val) {
  switch (val) {
    case GTK_LEVEL_BAR_MODE_CONTINUOUS: return caml_hash_variant("CONTINUOUS"); /* `CONTINUOUS */
    case GTK_LEVEL_BAR_MODE_DISCRETE: return caml_hash_variant("DISCRETE"); /* `DISCRETE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkLevelBarMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkLevelBarMode */
GtkLevelBarMode GtkLevelBarMode_val(value val) {
  if (val == caml_hash_variant("CONTINUOUS")) return GTK_LEVEL_BAR_MODE_CONTINUOUS; /* `CONTINUOUS */
  else if (val == caml_hash_variant("DISCRETE")) return GTK_LEVEL_BAR_MODE_DISCRETE; /* `DISCRETE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkLevelBarMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkListTabBehavior to OCaml value */
value Val_GtkListTabBehavior(GtkListTabBehavior val) {
  switch (val) {
    case GTK_LIST_TAB_ALL: return caml_hash_variant("ALL"); /* `ALL */
    case GTK_LIST_TAB_ITEM: return caml_hash_variant("ITEM"); /* `ITEM */
    case GTK_LIST_TAB_CELL: return caml_hash_variant("CELL"); /* `CELL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkListTabBehavior value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkListTabBehavior */
GtkListTabBehavior GtkListTabBehavior_val(value val) {
  if (val == caml_hash_variant("ALL")) return GTK_LIST_TAB_ALL; /* `ALL */
  else if (val == caml_hash_variant("ITEM")) return GTK_LIST_TAB_ITEM; /* `ITEM */
  else if (val == caml_hash_variant("CELL")) return GTK_LIST_TAB_CELL; /* `CELL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkListTabBehavior tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkMessageType to OCaml value */
value Val_GtkMessageType(GtkMessageType val) {
  switch (val) {
    case GTK_MESSAGE_INFO: return caml_hash_variant("INFO"); /* `INFO */
    case GTK_MESSAGE_WARNING: return caml_hash_variant("WARNING"); /* `WARNING */
    case GTK_MESSAGE_QUESTION: return caml_hash_variant("QUESTION"); /* `QUESTION */
    case GTK_MESSAGE_ERROR: return caml_hash_variant("ERROR"); /* `ERROR */
    case GTK_MESSAGE_OTHER: return caml_hash_variant("OTHER"); /* `OTHER */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkMessageType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkMessageType */
GtkMessageType GtkMessageType_val(value val) {
  if (val == caml_hash_variant("INFO")) return GTK_MESSAGE_INFO; /* `INFO */
  else if (val == caml_hash_variant("WARNING")) return GTK_MESSAGE_WARNING; /* `WARNING */
  else if (val == caml_hash_variant("QUESTION")) return GTK_MESSAGE_QUESTION; /* `QUESTION */
  else if (val == caml_hash_variant("ERROR")) return GTK_MESSAGE_ERROR; /* `ERROR */
  else if (val == caml_hash_variant("OTHER")) return GTK_MESSAGE_OTHER; /* `OTHER */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkMessageType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkMovementStep to OCaml value */
value Val_GtkMovementStep(GtkMovementStep val) {
  switch (val) {
    case GTK_MOVEMENT_LOGICAL_POSITIONS: return caml_hash_variant("LOGICAL_POSITIONS"); /* `LOGICAL_POSITIONS */
    case GTK_MOVEMENT_VISUAL_POSITIONS: return caml_hash_variant("VISUAL_POSITIONS"); /* `VISUAL_POSITIONS */
    case GTK_MOVEMENT_WORDS: return caml_hash_variant("WORDS"); /* `WORDS */
    case GTK_MOVEMENT_DISPLAY_LINES: return caml_hash_variant("DISPLAY_LINES"); /* `DISPLAY_LINES */
    case GTK_MOVEMENT_DISPLAY_LINE_ENDS: return caml_hash_variant("DISPLAY_LINE_ENDS"); /* `DISPLAY_LINE_ENDS */
    case GTK_MOVEMENT_PARAGRAPHS: return caml_hash_variant("PARAGRAPHS"); /* `PARAGRAPHS */
    case GTK_MOVEMENT_PARAGRAPH_ENDS: return caml_hash_variant("PARAGRAPH_ENDS"); /* `PARAGRAPH_ENDS */
    case GTK_MOVEMENT_PAGES: return caml_hash_variant("PAGES"); /* `PAGES */
    case GTK_MOVEMENT_BUFFER_ENDS: return caml_hash_variant("BUFFER_ENDS"); /* `BUFFER_ENDS */
    case GTK_MOVEMENT_HORIZONTAL_PAGES: return caml_hash_variant("HORIZONTAL_PAGES"); /* `HORIZONTAL_PAGES */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkMovementStep value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkMovementStep */
GtkMovementStep GtkMovementStep_val(value val) {
  if (val == caml_hash_variant("LOGICAL_POSITIONS")) return GTK_MOVEMENT_LOGICAL_POSITIONS; /* `LOGICAL_POSITIONS */
  else if (val == caml_hash_variant("VISUAL_POSITIONS")) return GTK_MOVEMENT_VISUAL_POSITIONS; /* `VISUAL_POSITIONS */
  else if (val == caml_hash_variant("WORDS")) return GTK_MOVEMENT_WORDS; /* `WORDS */
  else if (val == caml_hash_variant("DISPLAY_LINES")) return GTK_MOVEMENT_DISPLAY_LINES; /* `DISPLAY_LINES */
  else if (val == caml_hash_variant("DISPLAY_LINE_ENDS")) return GTK_MOVEMENT_DISPLAY_LINE_ENDS; /* `DISPLAY_LINE_ENDS */
  else if (val == caml_hash_variant("PARAGRAPHS")) return GTK_MOVEMENT_PARAGRAPHS; /* `PARAGRAPHS */
  else if (val == caml_hash_variant("PARAGRAPH_ENDS")) return GTK_MOVEMENT_PARAGRAPH_ENDS; /* `PARAGRAPH_ENDS */
  else if (val == caml_hash_variant("PAGES")) return GTK_MOVEMENT_PAGES; /* `PAGES */
  else if (val == caml_hash_variant("BUFFER_ENDS")) return GTK_MOVEMENT_BUFFER_ENDS; /* `BUFFER_ENDS */
  else if (val == caml_hash_variant("HORIZONTAL_PAGES")) return GTK_MOVEMENT_HORIZONTAL_PAGES; /* `HORIZONTAL_PAGES */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkMovementStep tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkNaturalWrapMode to OCaml value */
value Val_GtkNaturalWrapMode(GtkNaturalWrapMode val) {
  switch (val) {
    case GTK_NATURAL_WRAP_INHERIT: return caml_hash_variant("INHERIT"); /* `INHERIT */
    case GTK_NATURAL_WRAP_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_NATURAL_WRAP_WORD: return caml_hash_variant("WORD"); /* `WORD */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkNaturalWrapMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkNaturalWrapMode */
GtkNaturalWrapMode GtkNaturalWrapMode_val(value val) {
  if (val == caml_hash_variant("INHERIT")) return GTK_NATURAL_WRAP_INHERIT; /* `INHERIT */
  else if (val == caml_hash_variant("NONE")) return GTK_NATURAL_WRAP_NONE; /* `NONE */
  else if (val == caml_hash_variant("WORD")) return GTK_NATURAL_WRAP_WORD; /* `WORD */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkNaturalWrapMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkNotebookTab to OCaml value */
value Val_GtkNotebookTab(GtkNotebookTab val) {
  switch (val) {
    case GTK_NOTEBOOK_TAB_FIRST: return caml_hash_variant("FIRST"); /* `FIRST */
    case GTK_NOTEBOOK_TAB_LAST: return caml_hash_variant("LAST"); /* `LAST */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkNotebookTab value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkNotebookTab */
GtkNotebookTab GtkNotebookTab_val(value val) {
  if (val == caml_hash_variant("FIRST")) return GTK_NOTEBOOK_TAB_FIRST; /* `FIRST */
  else if (val == caml_hash_variant("LAST")) return GTK_NOTEBOOK_TAB_LAST; /* `LAST */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkNotebookTab tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkNumberUpLayout to OCaml value */
value Val_GtkNumberUpLayout(GtkNumberUpLayout val) {
  switch (val) {
    case GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_TOP_TO_BOTTOM: return caml_hash_variant("LRTB"); /* `LRTB */
    case GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_BOTTOM_TO_TOP: return caml_hash_variant("LRBT"); /* `LRBT */
    case GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_TOP_TO_BOTTOM: return caml_hash_variant("RLTB"); /* `RLTB */
    case GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_BOTTOM_TO_TOP: return caml_hash_variant("RLBT"); /* `RLBT */
    case GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_LEFT_TO_RIGHT: return caml_hash_variant("TBLR"); /* `TBLR */
    case GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_RIGHT_TO_LEFT: return caml_hash_variant("TBRL"); /* `TBRL */
    case GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_LEFT_TO_RIGHT: return caml_hash_variant("BTLR"); /* `BTLR */
    case GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_RIGHT_TO_LEFT: return caml_hash_variant("BTRL"); /* `BTRL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkNumberUpLayout value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkNumberUpLayout */
GtkNumberUpLayout GtkNumberUpLayout_val(value val) {
  if (val == caml_hash_variant("LRTB")) return GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_TOP_TO_BOTTOM; /* `LRTB */
  else if (val == caml_hash_variant("LRBT")) return GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_BOTTOM_TO_TOP; /* `LRBT */
  else if (val == caml_hash_variant("RLTB")) return GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_TOP_TO_BOTTOM; /* `RLTB */
  else if (val == caml_hash_variant("RLBT")) return GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_BOTTOM_TO_TOP; /* `RLBT */
  else if (val == caml_hash_variant("TBLR")) return GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_LEFT_TO_RIGHT; /* `TBLR */
  else if (val == caml_hash_variant("TBRL")) return GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_RIGHT_TO_LEFT; /* `TBRL */
  else if (val == caml_hash_variant("BTLR")) return GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_LEFT_TO_RIGHT; /* `BTLR */
  else if (val == caml_hash_variant("BTRL")) return GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_RIGHT_TO_LEFT; /* `BTRL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkNumberUpLayout tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkOrdering to OCaml value */
value Val_GtkOrdering(GtkOrdering val) {
  switch (val) {
    case GTK_ORDERING_SMALLER: return caml_hash_variant("SMALLER"); /* `SMALLER */
    case GTK_ORDERING_EQUAL: return caml_hash_variant("EQUAL"); /* `EQUAL */
    case GTK_ORDERING_LARGER: return caml_hash_variant("LARGER"); /* `LARGER */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkOrdering value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkOrdering */
GtkOrdering GtkOrdering_val(value val) {
  if (val == caml_hash_variant("SMALLER")) return GTK_ORDERING_SMALLER; /* `SMALLER */
  else if (val == caml_hash_variant("EQUAL")) return GTK_ORDERING_EQUAL; /* `EQUAL */
  else if (val == caml_hash_variant("LARGER")) return GTK_ORDERING_LARGER; /* `LARGER */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkOrdering tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkOrientation to OCaml value */
value Val_GtkOrientation(GtkOrientation val) {
  switch (val) {
    case GTK_ORIENTATION_HORIZONTAL: return caml_hash_variant("HORIZONTAL"); /* `HORIZONTAL */
    case GTK_ORIENTATION_VERTICAL: return caml_hash_variant("VERTICAL"); /* `VERTICAL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkOrientation value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkOrientation */
GtkOrientation GtkOrientation_val(value val) {
  if (val == caml_hash_variant("HORIZONTAL")) return GTK_ORIENTATION_HORIZONTAL; /* `HORIZONTAL */
  else if (val == caml_hash_variant("VERTICAL")) return GTK_ORIENTATION_VERTICAL; /* `VERTICAL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkOrientation tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkOverflow to OCaml value */
value Val_GtkOverflow(GtkOverflow val) {
  switch (val) {
    case GTK_OVERFLOW_VISIBLE: return caml_hash_variant("VISIBLE"); /* `VISIBLE */
    case GTK_OVERFLOW_HIDDEN: return caml_hash_variant("HIDDEN"); /* `HIDDEN */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkOverflow value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkOverflow */
GtkOverflow GtkOverflow_val(value val) {
  if (val == caml_hash_variant("VISIBLE")) return GTK_OVERFLOW_VISIBLE; /* `VISIBLE */
  else if (val == caml_hash_variant("HIDDEN")) return GTK_OVERFLOW_HIDDEN; /* `HIDDEN */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkOverflow tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPackType to OCaml value */
value Val_GtkPackType(GtkPackType val) {
  switch (val) {
    case GTK_PACK_START: return caml_hash_variant("START"); /* `START */
    case GTK_PACK_END: return caml_hash_variant("END"); /* `END */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPackType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPackType */
GtkPackType GtkPackType_val(value val) {
  if (val == caml_hash_variant("START")) return GTK_PACK_START; /* `START */
  else if (val == caml_hash_variant("END")) return GTK_PACK_END; /* `END */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPackType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPadActionType to OCaml value */
value Val_GtkPadActionType(GtkPadActionType val) {
  switch (val) {
    case GTK_PAD_ACTION_BUTTON: return caml_hash_variant("BUTTON"); /* `BUTTON */
    case GTK_PAD_ACTION_RING: return caml_hash_variant("RING"); /* `RING */
    case GTK_PAD_ACTION_STRIP: return caml_hash_variant("STRIP"); /* `STRIP */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPadActionType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPadActionType */
GtkPadActionType GtkPadActionType_val(value val) {
  if (val == caml_hash_variant("BUTTON")) return GTK_PAD_ACTION_BUTTON; /* `BUTTON */
  else if (val == caml_hash_variant("RING")) return GTK_PAD_ACTION_RING; /* `RING */
  else if (val == caml_hash_variant("STRIP")) return GTK_PAD_ACTION_STRIP; /* `STRIP */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPadActionType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPageOrientation to OCaml value */
value Val_GtkPageOrientation(GtkPageOrientation val) {
  switch (val) {
    case GTK_PAGE_ORIENTATION_PORTRAIT: return caml_hash_variant("PORTRAIT"); /* `PORTRAIT */
    case GTK_PAGE_ORIENTATION_LANDSCAPE: return caml_hash_variant("LANDSCAPE"); /* `LANDSCAPE */
    case GTK_PAGE_ORIENTATION_REVERSE_PORTRAIT: return caml_hash_variant("REVERSE_PORTRAIT"); /* `REVERSE_PORTRAIT */
    case GTK_PAGE_ORIENTATION_REVERSE_LANDSCAPE: return caml_hash_variant("REVERSE_LANDSCAPE"); /* `REVERSE_LANDSCAPE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPageOrientation value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPageOrientation */
GtkPageOrientation GtkPageOrientation_val(value val) {
  if (val == caml_hash_variant("PORTRAIT")) return GTK_PAGE_ORIENTATION_PORTRAIT; /* `PORTRAIT */
  else if (val == caml_hash_variant("LANDSCAPE")) return GTK_PAGE_ORIENTATION_LANDSCAPE; /* `LANDSCAPE */
  else if (val == caml_hash_variant("REVERSE_PORTRAIT")) return GTK_PAGE_ORIENTATION_REVERSE_PORTRAIT; /* `REVERSE_PORTRAIT */
  else if (val == caml_hash_variant("REVERSE_LANDSCAPE")) return GTK_PAGE_ORIENTATION_REVERSE_LANDSCAPE; /* `REVERSE_LANDSCAPE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPageOrientation tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPageSet to OCaml value */
value Val_GtkPageSet(GtkPageSet val) {
  switch (val) {
    case GTK_PAGE_SET_ALL: return caml_hash_variant("ALL"); /* `ALL */
    case GTK_PAGE_SET_EVEN: return caml_hash_variant("EVEN"); /* `EVEN */
    case GTK_PAGE_SET_ODD: return caml_hash_variant("ODD"); /* `ODD */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPageSet value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPageSet */
GtkPageSet GtkPageSet_val(value val) {
  if (val == caml_hash_variant("ALL")) return GTK_PAGE_SET_ALL; /* `ALL */
  else if (val == caml_hash_variant("EVEN")) return GTK_PAGE_SET_EVEN; /* `EVEN */
  else if (val == caml_hash_variant("ODD")) return GTK_PAGE_SET_ODD; /* `ODD */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPageSet tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPanDirection to OCaml value */
value Val_GtkPanDirection(GtkPanDirection val) {
  switch (val) {
    case GTK_PAN_DIRECTION_LEFT: return caml_hash_variant("LEFT"); /* `LEFT */
    case GTK_PAN_DIRECTION_RIGHT: return caml_hash_variant("RIGHT"); /* `RIGHT */
    case GTK_PAN_DIRECTION_UP: return caml_hash_variant("UP"); /* `UP */
    case GTK_PAN_DIRECTION_DOWN: return caml_hash_variant("DOWN"); /* `DOWN */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPanDirection value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPanDirection */
GtkPanDirection GtkPanDirection_val(value val) {
  if (val == caml_hash_variant("LEFT")) return GTK_PAN_DIRECTION_LEFT; /* `LEFT */
  else if (val == caml_hash_variant("RIGHT")) return GTK_PAN_DIRECTION_RIGHT; /* `RIGHT */
  else if (val == caml_hash_variant("UP")) return GTK_PAN_DIRECTION_UP; /* `UP */
  else if (val == caml_hash_variant("DOWN")) return GTK_PAN_DIRECTION_DOWN; /* `DOWN */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPanDirection tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPolicyType to OCaml value */
value Val_GtkPolicyType(GtkPolicyType val) {
  switch (val) {
    case GTK_POLICY_ALWAYS: return caml_hash_variant("ALWAYS"); /* `ALWAYS */
    case GTK_POLICY_AUTOMATIC: return caml_hash_variant("AUTOMATIC"); /* `AUTOMATIC */
    case GTK_POLICY_NEVER: return caml_hash_variant("NEVER"); /* `NEVER */
    case GTK_POLICY_EXTERNAL: return caml_hash_variant("EXTERNAL"); /* `EXTERNAL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPolicyType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPolicyType */
GtkPolicyType GtkPolicyType_val(value val) {
  if (val == caml_hash_variant("ALWAYS")) return GTK_POLICY_ALWAYS; /* `ALWAYS */
  else if (val == caml_hash_variant("AUTOMATIC")) return GTK_POLICY_AUTOMATIC; /* `AUTOMATIC */
  else if (val == caml_hash_variant("NEVER")) return GTK_POLICY_NEVER; /* `NEVER */
  else if (val == caml_hash_variant("EXTERNAL")) return GTK_POLICY_EXTERNAL; /* `EXTERNAL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPolicyType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPositionType to OCaml value */
value Val_GtkPositionType(GtkPositionType val) {
  switch (val) {
    case GTK_POS_LEFT: return caml_hash_variant("LEFT"); /* `LEFT */
    case GTK_POS_RIGHT: return caml_hash_variant("RIGHT"); /* `RIGHT */
    case GTK_POS_TOP: return caml_hash_variant("TOP"); /* `TOP */
    case GTK_POS_BOTTOM: return caml_hash_variant("BOTTOM"); /* `BOTTOM */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPositionType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPositionType */
GtkPositionType GtkPositionType_val(value val) {
  if (val == caml_hash_variant("LEFT")) return GTK_POS_LEFT; /* `LEFT */
  else if (val == caml_hash_variant("RIGHT")) return GTK_POS_RIGHT; /* `RIGHT */
  else if (val == caml_hash_variant("TOP")) return GTK_POS_TOP; /* `TOP */
  else if (val == caml_hash_variant("BOTTOM")) return GTK_POS_BOTTOM; /* `BOTTOM */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPositionType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPrintDuplex to OCaml value */
value Val_GtkPrintDuplex(GtkPrintDuplex val) {
  switch (val) {
    case GTK_PRINT_DUPLEX_SIMPLEX: return caml_hash_variant("SIMPLEX"); /* `SIMPLEX */
    case GTK_PRINT_DUPLEX_HORIZONTAL: return caml_hash_variant("HORIZONTAL"); /* `HORIZONTAL */
    case GTK_PRINT_DUPLEX_VERTICAL: return caml_hash_variant("VERTICAL"); /* `VERTICAL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPrintDuplex value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPrintDuplex */
GtkPrintDuplex GtkPrintDuplex_val(value val) {
  if (val == caml_hash_variant("SIMPLEX")) return GTK_PRINT_DUPLEX_SIMPLEX; /* `SIMPLEX */
  else if (val == caml_hash_variant("HORIZONTAL")) return GTK_PRINT_DUPLEX_HORIZONTAL; /* `HORIZONTAL */
  else if (val == caml_hash_variant("VERTICAL")) return GTK_PRINT_DUPLEX_VERTICAL; /* `VERTICAL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPrintDuplex tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPrintError to OCaml value */
value Val_GtkPrintError(GtkPrintError val) {
  switch (val) {
    case GTK_PRINT_ERROR_GENERAL: return caml_hash_variant("GENERAL"); /* `GENERAL */
    case GTK_PRINT_ERROR_INTERNAL_ERROR: return caml_hash_variant("INTERNAL_ERROR"); /* `INTERNAL_ERROR */
    case GTK_PRINT_ERROR_NOMEM: return caml_hash_variant("NOMEM"); /* `NOMEM */
    case GTK_PRINT_ERROR_INVALID_FILE: return caml_hash_variant("INVALID_FILE"); /* `INVALID_FILE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPrintError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPrintError */
GtkPrintError GtkPrintError_val(value val) {
  if (val == caml_hash_variant("GENERAL")) return GTK_PRINT_ERROR_GENERAL; /* `GENERAL */
  else if (val == caml_hash_variant("INTERNAL_ERROR")) return GTK_PRINT_ERROR_INTERNAL_ERROR; /* `INTERNAL_ERROR */
  else if (val == caml_hash_variant("NOMEM")) return GTK_PRINT_ERROR_NOMEM; /* `NOMEM */
  else if (val == caml_hash_variant("INVALID_FILE")) return GTK_PRINT_ERROR_INVALID_FILE; /* `INVALID_FILE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPrintError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPrintOperationAction to OCaml value */
value Val_GtkPrintOperationAction(GtkPrintOperationAction val) {
  switch (val) {
    case GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG: return caml_hash_variant("PRINT_DIALOG"); /* `PRINT_DIALOG */
    case GTK_PRINT_OPERATION_ACTION_PRINT: return caml_hash_variant("PRINT"); /* `PRINT */
    case GTK_PRINT_OPERATION_ACTION_PREVIEW: return caml_hash_variant("PREVIEW"); /* `PREVIEW */
    case GTK_PRINT_OPERATION_ACTION_EXPORT: return caml_hash_variant("EXPORT"); /* `EXPORT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPrintOperationAction value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPrintOperationAction */
GtkPrintOperationAction GtkPrintOperationAction_val(value val) {
  if (val == caml_hash_variant("PRINT_DIALOG")) return GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG; /* `PRINT_DIALOG */
  else if (val == caml_hash_variant("PRINT")) return GTK_PRINT_OPERATION_ACTION_PRINT; /* `PRINT */
  else if (val == caml_hash_variant("PREVIEW")) return GTK_PRINT_OPERATION_ACTION_PREVIEW; /* `PREVIEW */
  else if (val == caml_hash_variant("EXPORT")) return GTK_PRINT_OPERATION_ACTION_EXPORT; /* `EXPORT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPrintOperationAction tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPrintOperationResult to OCaml value */
value Val_GtkPrintOperationResult(GtkPrintOperationResult val) {
  switch (val) {
    case GTK_PRINT_OPERATION_RESULT_ERROR: return caml_hash_variant("ERROR"); /* `ERROR */
    case GTK_PRINT_OPERATION_RESULT_APPLY: return caml_hash_variant("APPLY"); /* `APPLY */
    case GTK_PRINT_OPERATION_RESULT_CANCEL: return caml_hash_variant("CANCEL"); /* `CANCEL */
    case GTK_PRINT_OPERATION_RESULT_IN_PROGRESS: return caml_hash_variant("IN_PROGRESS"); /* `IN_PROGRESS */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPrintOperationResult value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPrintOperationResult */
GtkPrintOperationResult GtkPrintOperationResult_val(value val) {
  if (val == caml_hash_variant("ERROR")) return GTK_PRINT_OPERATION_RESULT_ERROR; /* `ERROR */
  else if (val == caml_hash_variant("APPLY")) return GTK_PRINT_OPERATION_RESULT_APPLY; /* `APPLY */
  else if (val == caml_hash_variant("CANCEL")) return GTK_PRINT_OPERATION_RESULT_CANCEL; /* `CANCEL */
  else if (val == caml_hash_variant("IN_PROGRESS")) return GTK_PRINT_OPERATION_RESULT_IN_PROGRESS; /* `IN_PROGRESS */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPrintOperationResult tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPrintPages to OCaml value */
value Val_GtkPrintPages(GtkPrintPages val) {
  switch (val) {
    case GTK_PRINT_PAGES_ALL: return caml_hash_variant("ALL"); /* `ALL */
    case GTK_PRINT_PAGES_CURRENT: return caml_hash_variant("CURRENT"); /* `CURRENT */
    case GTK_PRINT_PAGES_RANGES: return caml_hash_variant("RANGES"); /* `RANGES */
    case GTK_PRINT_PAGES_SELECTION: return caml_hash_variant("SELECTION"); /* `SELECTION */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPrintPages value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPrintPages */
GtkPrintPages GtkPrintPages_val(value val) {
  if (val == caml_hash_variant("ALL")) return GTK_PRINT_PAGES_ALL; /* `ALL */
  else if (val == caml_hash_variant("CURRENT")) return GTK_PRINT_PAGES_CURRENT; /* `CURRENT */
  else if (val == caml_hash_variant("RANGES")) return GTK_PRINT_PAGES_RANGES; /* `RANGES */
  else if (val == caml_hash_variant("SELECTION")) return GTK_PRINT_PAGES_SELECTION; /* `SELECTION */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPrintPages tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPrintQuality to OCaml value */
value Val_GtkPrintQuality(GtkPrintQuality val) {
  switch (val) {
    case GTK_PRINT_QUALITY_LOW: return caml_hash_variant("LOW"); /* `LOW */
    case GTK_PRINT_QUALITY_NORMAL: return caml_hash_variant("NORMAL"); /* `NORMAL */
    case GTK_PRINT_QUALITY_HIGH: return caml_hash_variant("HIGH"); /* `HIGH */
    case GTK_PRINT_QUALITY_DRAFT: return caml_hash_variant("DRAFT"); /* `DRAFT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPrintQuality value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPrintQuality */
GtkPrintQuality GtkPrintQuality_val(value val) {
  if (val == caml_hash_variant("LOW")) return GTK_PRINT_QUALITY_LOW; /* `LOW */
  else if (val == caml_hash_variant("NORMAL")) return GTK_PRINT_QUALITY_NORMAL; /* `NORMAL */
  else if (val == caml_hash_variant("HIGH")) return GTK_PRINT_QUALITY_HIGH; /* `HIGH */
  else if (val == caml_hash_variant("DRAFT")) return GTK_PRINT_QUALITY_DRAFT; /* `DRAFT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPrintQuality tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPrintStatus to OCaml value */
value Val_GtkPrintStatus(GtkPrintStatus val) {
  switch (val) {
    case GTK_PRINT_STATUS_INITIAL: return caml_hash_variant("INITIAL"); /* `INITIAL */
    case GTK_PRINT_STATUS_PREPARING: return caml_hash_variant("PREPARING"); /* `PREPARING */
    case GTK_PRINT_STATUS_GENERATING_DATA: return caml_hash_variant("GENERATING_DATA"); /* `GENERATING_DATA */
    case GTK_PRINT_STATUS_SENDING_DATA: return caml_hash_variant("SENDING_DATA"); /* `SENDING_DATA */
    case GTK_PRINT_STATUS_PENDING: return caml_hash_variant("PENDING"); /* `PENDING */
    case GTK_PRINT_STATUS_PENDING_ISSUE: return caml_hash_variant("PENDING_ISSUE"); /* `PENDING_ISSUE */
    case GTK_PRINT_STATUS_PRINTING: return caml_hash_variant("PRINTING"); /* `PRINTING */
    case GTK_PRINT_STATUS_FINISHED: return caml_hash_variant("FINISHED"); /* `FINISHED */
    case GTK_PRINT_STATUS_FINISHED_ABORTED: return caml_hash_variant("FINISHED_ABORTED"); /* `FINISHED_ABORTED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPrintStatus value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPrintStatus */
GtkPrintStatus GtkPrintStatus_val(value val) {
  if (val == caml_hash_variant("INITIAL")) return GTK_PRINT_STATUS_INITIAL; /* `INITIAL */
  else if (val == caml_hash_variant("PREPARING")) return GTK_PRINT_STATUS_PREPARING; /* `PREPARING */
  else if (val == caml_hash_variant("GENERATING_DATA")) return GTK_PRINT_STATUS_GENERATING_DATA; /* `GENERATING_DATA */
  else if (val == caml_hash_variant("SENDING_DATA")) return GTK_PRINT_STATUS_SENDING_DATA; /* `SENDING_DATA */
  else if (val == caml_hash_variant("PENDING")) return GTK_PRINT_STATUS_PENDING; /* `PENDING */
  else if (val == caml_hash_variant("PENDING_ISSUE")) return GTK_PRINT_STATUS_PENDING_ISSUE; /* `PENDING_ISSUE */
  else if (val == caml_hash_variant("PRINTING")) return GTK_PRINT_STATUS_PRINTING; /* `PRINTING */
  else if (val == caml_hash_variant("FINISHED")) return GTK_PRINT_STATUS_FINISHED; /* `FINISHED */
  else if (val == caml_hash_variant("FINISHED_ABORTED")) return GTK_PRINT_STATUS_FINISHED_ABORTED; /* `FINISHED_ABORTED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPrintStatus tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPropagationLimit to OCaml value */
value Val_GtkPropagationLimit(GtkPropagationLimit val) {
  switch (val) {
    case GTK_LIMIT_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_LIMIT_SAME_NATIVE: return caml_hash_variant("SAME_NATIVE"); /* `SAME_NATIVE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPropagationLimit value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPropagationLimit */
GtkPropagationLimit GtkPropagationLimit_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_LIMIT_NONE; /* `NONE */
  else if (val == caml_hash_variant("SAME_NATIVE")) return GTK_LIMIT_SAME_NATIVE; /* `SAME_NATIVE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPropagationLimit tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkPropagationPhase to OCaml value */
value Val_GtkPropagationPhase(GtkPropagationPhase val) {
  switch (val) {
    case GTK_PHASE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_PHASE_CAPTURE: return caml_hash_variant("CAPTURE"); /* `CAPTURE */
    case GTK_PHASE_BUBBLE: return caml_hash_variant("BUBBLE"); /* `BUBBLE */
    case GTK_PHASE_TARGET: return caml_hash_variant("TARGET"); /* `TARGET */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkPropagationPhase value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkPropagationPhase */
GtkPropagationPhase GtkPropagationPhase_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_PHASE_NONE; /* `NONE */
  else if (val == caml_hash_variant("CAPTURE")) return GTK_PHASE_CAPTURE; /* `CAPTURE */
  else if (val == caml_hash_variant("BUBBLE")) return GTK_PHASE_BUBBLE; /* `BUBBLE */
  else if (val == caml_hash_variant("TARGET")) return GTK_PHASE_TARGET; /* `TARGET */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkPropagationPhase tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkRecentManagerError to OCaml value */
value Val_GtkRecentManagerError(GtkRecentManagerError val) {
  switch (val) {
    case GTK_RECENT_MANAGER_ERROR_NOT_FOUND: return caml_hash_variant("NOT_FOUND"); /* `NOT_FOUND */
    case GTK_RECENT_MANAGER_ERROR_INVALID_URI: return caml_hash_variant("INVALID_URI"); /* `INVALID_URI */
    case GTK_RECENT_MANAGER_ERROR_INVALID_ENCODING: return caml_hash_variant("INVALID_ENCODING"); /* `INVALID_ENCODING */
    case GTK_RECENT_MANAGER_ERROR_NOT_REGISTERED: return caml_hash_variant("NOT_REGISTERED"); /* `NOT_REGISTERED */
    case GTK_RECENT_MANAGER_ERROR_READ: return caml_hash_variant("READ"); /* `READ */
    case GTK_RECENT_MANAGER_ERROR_WRITE: return caml_hash_variant("WRITE"); /* `WRITE */
    case GTK_RECENT_MANAGER_ERROR_UNKNOWN: return caml_hash_variant("UNKNOWN"); /* `UNKNOWN */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkRecentManagerError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkRecentManagerError */
GtkRecentManagerError GtkRecentManagerError_val(value val) {
  if (val == caml_hash_variant("NOT_FOUND")) return GTK_RECENT_MANAGER_ERROR_NOT_FOUND; /* `NOT_FOUND */
  else if (val == caml_hash_variant("INVALID_URI")) return GTK_RECENT_MANAGER_ERROR_INVALID_URI; /* `INVALID_URI */
  else if (val == caml_hash_variant("INVALID_ENCODING")) return GTK_RECENT_MANAGER_ERROR_INVALID_ENCODING; /* `INVALID_ENCODING */
  else if (val == caml_hash_variant("NOT_REGISTERED")) return GTK_RECENT_MANAGER_ERROR_NOT_REGISTERED; /* `NOT_REGISTERED */
  else if (val == caml_hash_variant("READ")) return GTK_RECENT_MANAGER_ERROR_READ; /* `READ */
  else if (val == caml_hash_variant("WRITE")) return GTK_RECENT_MANAGER_ERROR_WRITE; /* `WRITE */
  else if (val == caml_hash_variant("UNKNOWN")) return GTK_RECENT_MANAGER_ERROR_UNKNOWN; /* `UNKNOWN */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkRecentManagerError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkResponseType to OCaml value */
value Val_GtkResponseType(GtkResponseType val) {
  switch (val) {
    case GTK_RESPONSE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_RESPONSE_REJECT: return caml_hash_variant("REJECT"); /* `REJECT */
    case GTK_RESPONSE_ACCEPT: return caml_hash_variant("ACCEPT"); /* `ACCEPT */
    case GTK_RESPONSE_DELETE_EVENT: return caml_hash_variant("DELETE_EVENT"); /* `DELETE_EVENT */
    case GTK_RESPONSE_OK: return caml_hash_variant("OK"); /* `OK */
    case GTK_RESPONSE_CANCEL: return caml_hash_variant("CANCEL"); /* `CANCEL */
    case GTK_RESPONSE_CLOSE: return caml_hash_variant("CLOSE"); /* `CLOSE */
    case GTK_RESPONSE_YES: return caml_hash_variant("YES"); /* `YES */
    case GTK_RESPONSE_NO: return caml_hash_variant("NO"); /* `NO */
    case GTK_RESPONSE_APPLY: return caml_hash_variant("APPLY"); /* `APPLY */
    case GTK_RESPONSE_HELP: return caml_hash_variant("HELP"); /* `HELP */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkResponseType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkResponseType */
GtkResponseType GtkResponseType_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_RESPONSE_NONE; /* `NONE */
  else if (val == caml_hash_variant("REJECT")) return GTK_RESPONSE_REJECT; /* `REJECT */
  else if (val == caml_hash_variant("ACCEPT")) return GTK_RESPONSE_ACCEPT; /* `ACCEPT */
  else if (val == caml_hash_variant("DELETE_EVENT")) return GTK_RESPONSE_DELETE_EVENT; /* `DELETE_EVENT */
  else if (val == caml_hash_variant("OK")) return GTK_RESPONSE_OK; /* `OK */
  else if (val == caml_hash_variant("CANCEL")) return GTK_RESPONSE_CANCEL; /* `CANCEL */
  else if (val == caml_hash_variant("CLOSE")) return GTK_RESPONSE_CLOSE; /* `CLOSE */
  else if (val == caml_hash_variant("YES")) return GTK_RESPONSE_YES; /* `YES */
  else if (val == caml_hash_variant("NO")) return GTK_RESPONSE_NO; /* `NO */
  else if (val == caml_hash_variant("APPLY")) return GTK_RESPONSE_APPLY; /* `APPLY */
  else if (val == caml_hash_variant("HELP")) return GTK_RESPONSE_HELP; /* `HELP */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkResponseType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkRevealerTransitionType to OCaml value */
value Val_GtkRevealerTransitionType(GtkRevealerTransitionType val) {
  switch (val) {
    case GTK_REVEALER_TRANSITION_TYPE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_REVEALER_TRANSITION_TYPE_CROSSFADE: return caml_hash_variant("CROSSFADE"); /* `CROSSFADE */
    case GTK_REVEALER_TRANSITION_TYPE_SLIDE_RIGHT: return caml_hash_variant("SLIDE_RIGHT"); /* `SLIDE_RIGHT */
    case GTK_REVEALER_TRANSITION_TYPE_SLIDE_LEFT: return caml_hash_variant("SLIDE_LEFT"); /* `SLIDE_LEFT */
    case GTK_REVEALER_TRANSITION_TYPE_SLIDE_UP: return caml_hash_variant("SLIDE_UP"); /* `SLIDE_UP */
    case GTK_REVEALER_TRANSITION_TYPE_SLIDE_DOWN: return caml_hash_variant("SLIDE_DOWN"); /* `SLIDE_DOWN */
    case GTK_REVEALER_TRANSITION_TYPE_SWING_RIGHT: return caml_hash_variant("SWING_RIGHT"); /* `SWING_RIGHT */
    case GTK_REVEALER_TRANSITION_TYPE_SWING_LEFT: return caml_hash_variant("SWING_LEFT"); /* `SWING_LEFT */
    case GTK_REVEALER_TRANSITION_TYPE_SWING_UP: return caml_hash_variant("SWING_UP"); /* `SWING_UP */
    case GTK_REVEALER_TRANSITION_TYPE_SWING_DOWN: return caml_hash_variant("SWING_DOWN"); /* `SWING_DOWN */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkRevealerTransitionType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkRevealerTransitionType */
GtkRevealerTransitionType GtkRevealerTransitionType_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_REVEALER_TRANSITION_TYPE_NONE; /* `NONE */
  else if (val == caml_hash_variant("CROSSFADE")) return GTK_REVEALER_TRANSITION_TYPE_CROSSFADE; /* `CROSSFADE */
  else if (val == caml_hash_variant("SLIDE_RIGHT")) return GTK_REVEALER_TRANSITION_TYPE_SLIDE_RIGHT; /* `SLIDE_RIGHT */
  else if (val == caml_hash_variant("SLIDE_LEFT")) return GTK_REVEALER_TRANSITION_TYPE_SLIDE_LEFT; /* `SLIDE_LEFT */
  else if (val == caml_hash_variant("SLIDE_UP")) return GTK_REVEALER_TRANSITION_TYPE_SLIDE_UP; /* `SLIDE_UP */
  else if (val == caml_hash_variant("SLIDE_DOWN")) return GTK_REVEALER_TRANSITION_TYPE_SLIDE_DOWN; /* `SLIDE_DOWN */
  else if (val == caml_hash_variant("SWING_RIGHT")) return GTK_REVEALER_TRANSITION_TYPE_SWING_RIGHT; /* `SWING_RIGHT */
  else if (val == caml_hash_variant("SWING_LEFT")) return GTK_REVEALER_TRANSITION_TYPE_SWING_LEFT; /* `SWING_LEFT */
  else if (val == caml_hash_variant("SWING_UP")) return GTK_REVEALER_TRANSITION_TYPE_SWING_UP; /* `SWING_UP */
  else if (val == caml_hash_variant("SWING_DOWN")) return GTK_REVEALER_TRANSITION_TYPE_SWING_DOWN; /* `SWING_DOWN */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkRevealerTransitionType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkScrollStep to OCaml value */
value Val_GtkScrollStep(GtkScrollStep val) {
  switch (val) {
    case GTK_SCROLL_STEPS: return caml_hash_variant("STEPS"); /* `STEPS */
    case GTK_SCROLL_PAGES: return caml_hash_variant("PAGES"); /* `PAGES */
    case GTK_SCROLL_ENDS: return caml_hash_variant("ENDS"); /* `ENDS */
    case GTK_SCROLL_HORIZONTAL_STEPS: return caml_hash_variant("HORIZONTAL_STEPS"); /* `HORIZONTAL_STEPS */
    case GTK_SCROLL_HORIZONTAL_PAGES: return caml_hash_variant("HORIZONTAL_PAGES"); /* `HORIZONTAL_PAGES */
    case GTK_SCROLL_HORIZONTAL_ENDS: return caml_hash_variant("HORIZONTAL_ENDS"); /* `HORIZONTAL_ENDS */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkScrollStep value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkScrollStep */
GtkScrollStep GtkScrollStep_val(value val) {
  if (val == caml_hash_variant("STEPS")) return GTK_SCROLL_STEPS; /* `STEPS */
  else if (val == caml_hash_variant("PAGES")) return GTK_SCROLL_PAGES; /* `PAGES */
  else if (val == caml_hash_variant("ENDS")) return GTK_SCROLL_ENDS; /* `ENDS */
  else if (val == caml_hash_variant("HORIZONTAL_STEPS")) return GTK_SCROLL_HORIZONTAL_STEPS; /* `HORIZONTAL_STEPS */
  else if (val == caml_hash_variant("HORIZONTAL_PAGES")) return GTK_SCROLL_HORIZONTAL_PAGES; /* `HORIZONTAL_PAGES */
  else if (val == caml_hash_variant("HORIZONTAL_ENDS")) return GTK_SCROLL_HORIZONTAL_ENDS; /* `HORIZONTAL_ENDS */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkScrollStep tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkScrollType to OCaml value */
value Val_GtkScrollType(GtkScrollType val) {
  switch (val) {
    case GTK_SCROLL_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_SCROLL_JUMP: return caml_hash_variant("JUMP"); /* `JUMP */
    case GTK_SCROLL_STEP_BACKWARD: return caml_hash_variant("STEP_BACKWARD"); /* `STEP_BACKWARD */
    case GTK_SCROLL_STEP_FORWARD: return caml_hash_variant("STEP_FORWARD"); /* `STEP_FORWARD */
    case GTK_SCROLL_PAGE_BACKWARD: return caml_hash_variant("PAGE_BACKWARD"); /* `PAGE_BACKWARD */
    case GTK_SCROLL_PAGE_FORWARD: return caml_hash_variant("PAGE_FORWARD"); /* `PAGE_FORWARD */
    case GTK_SCROLL_STEP_UP: return caml_hash_variant("STEP_UP"); /* `STEP_UP */
    case GTK_SCROLL_STEP_DOWN: return caml_hash_variant("STEP_DOWN"); /* `STEP_DOWN */
    case GTK_SCROLL_PAGE_UP: return caml_hash_variant("PAGE_UP"); /* `PAGE_UP */
    case GTK_SCROLL_PAGE_DOWN: return caml_hash_variant("PAGE_DOWN"); /* `PAGE_DOWN */
    case GTK_SCROLL_STEP_LEFT: return caml_hash_variant("STEP_LEFT"); /* `STEP_LEFT */
    case GTK_SCROLL_STEP_RIGHT: return caml_hash_variant("STEP_RIGHT"); /* `STEP_RIGHT */
    case GTK_SCROLL_PAGE_LEFT: return caml_hash_variant("PAGE_LEFT"); /* `PAGE_LEFT */
    case GTK_SCROLL_PAGE_RIGHT: return caml_hash_variant("PAGE_RIGHT"); /* `PAGE_RIGHT */
    case GTK_SCROLL_START: return caml_hash_variant("START"); /* `START */
    case GTK_SCROLL_END: return caml_hash_variant("END"); /* `END */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkScrollType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkScrollType */
GtkScrollType GtkScrollType_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_SCROLL_NONE; /* `NONE */
  else if (val == caml_hash_variant("JUMP")) return GTK_SCROLL_JUMP; /* `JUMP */
  else if (val == caml_hash_variant("STEP_BACKWARD")) return GTK_SCROLL_STEP_BACKWARD; /* `STEP_BACKWARD */
  else if (val == caml_hash_variant("STEP_FORWARD")) return GTK_SCROLL_STEP_FORWARD; /* `STEP_FORWARD */
  else if (val == caml_hash_variant("PAGE_BACKWARD")) return GTK_SCROLL_PAGE_BACKWARD; /* `PAGE_BACKWARD */
  else if (val == caml_hash_variant("PAGE_FORWARD")) return GTK_SCROLL_PAGE_FORWARD; /* `PAGE_FORWARD */
  else if (val == caml_hash_variant("STEP_UP")) return GTK_SCROLL_STEP_UP; /* `STEP_UP */
  else if (val == caml_hash_variant("STEP_DOWN")) return GTK_SCROLL_STEP_DOWN; /* `STEP_DOWN */
  else if (val == caml_hash_variant("PAGE_UP")) return GTK_SCROLL_PAGE_UP; /* `PAGE_UP */
  else if (val == caml_hash_variant("PAGE_DOWN")) return GTK_SCROLL_PAGE_DOWN; /* `PAGE_DOWN */
  else if (val == caml_hash_variant("STEP_LEFT")) return GTK_SCROLL_STEP_LEFT; /* `STEP_LEFT */
  else if (val == caml_hash_variant("STEP_RIGHT")) return GTK_SCROLL_STEP_RIGHT; /* `STEP_RIGHT */
  else if (val == caml_hash_variant("PAGE_LEFT")) return GTK_SCROLL_PAGE_LEFT; /* `PAGE_LEFT */
  else if (val == caml_hash_variant("PAGE_RIGHT")) return GTK_SCROLL_PAGE_RIGHT; /* `PAGE_RIGHT */
  else if (val == caml_hash_variant("START")) return GTK_SCROLL_START; /* `START */
  else if (val == caml_hash_variant("END")) return GTK_SCROLL_END; /* `END */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkScrollType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkScrollablePolicy to OCaml value */
value Val_GtkScrollablePolicy(GtkScrollablePolicy val) {
  switch (val) {
    case GTK_SCROLL_MINIMUM: return caml_hash_variant("MINIMUM"); /* `MINIMUM */
    case GTK_SCROLL_NATURAL: return caml_hash_variant("NATURAL"); /* `NATURAL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkScrollablePolicy value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkScrollablePolicy */
GtkScrollablePolicy GtkScrollablePolicy_val(value val) {
  if (val == caml_hash_variant("MINIMUM")) return GTK_SCROLL_MINIMUM; /* `MINIMUM */
  else if (val == caml_hash_variant("NATURAL")) return GTK_SCROLL_NATURAL; /* `NATURAL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkScrollablePolicy tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkSelectionMode to OCaml value */
value Val_GtkSelectionMode(GtkSelectionMode val) {
  switch (val) {
    case GTK_SELECTION_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_SELECTION_SINGLE: return caml_hash_variant("SINGLE"); /* `SINGLE */
    case GTK_SELECTION_BROWSE: return caml_hash_variant("BROWSE"); /* `BROWSE */
    case GTK_SELECTION_MULTIPLE: return caml_hash_variant("MULTIPLE"); /* `MULTIPLE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkSelectionMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkSelectionMode */
GtkSelectionMode GtkSelectionMode_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_SELECTION_NONE; /* `NONE */
  else if (val == caml_hash_variant("SINGLE")) return GTK_SELECTION_SINGLE; /* `SINGLE */
  else if (val == caml_hash_variant("BROWSE")) return GTK_SELECTION_BROWSE; /* `BROWSE */
  else if (val == caml_hash_variant("MULTIPLE")) return GTK_SELECTION_MULTIPLE; /* `MULTIPLE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkSelectionMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkSensitivityType to OCaml value */
value Val_GtkSensitivityType(GtkSensitivityType val) {
  switch (val) {
    case GTK_SENSITIVITY_AUTO: return caml_hash_variant("AUTO"); /* `AUTO */
    case GTK_SENSITIVITY_ON: return caml_hash_variant("ON"); /* `ON */
    case GTK_SENSITIVITY_OFF: return caml_hash_variant("OFF"); /* `OFF */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkSensitivityType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkSensitivityType */
GtkSensitivityType GtkSensitivityType_val(value val) {
  if (val == caml_hash_variant("AUTO")) return GTK_SENSITIVITY_AUTO; /* `AUTO */
  else if (val == caml_hash_variant("ON")) return GTK_SENSITIVITY_ON; /* `ON */
  else if (val == caml_hash_variant("OFF")) return GTK_SENSITIVITY_OFF; /* `OFF */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkSensitivityType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkShortcutScope to OCaml value */
value Val_GtkShortcutScope(GtkShortcutScope val) {
  switch (val) {
    case GTK_SHORTCUT_SCOPE_LOCAL: return caml_hash_variant("LOCAL"); /* `LOCAL */
    case GTK_SHORTCUT_SCOPE_MANAGED: return caml_hash_variant("MANAGED"); /* `MANAGED */
    case GTK_SHORTCUT_SCOPE_GLOBAL: return caml_hash_variant("GLOBAL"); /* `GLOBAL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkShortcutScope value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkShortcutScope */
GtkShortcutScope GtkShortcutScope_val(value val) {
  if (val == caml_hash_variant("LOCAL")) return GTK_SHORTCUT_SCOPE_LOCAL; /* `LOCAL */
  else if (val == caml_hash_variant("MANAGED")) return GTK_SHORTCUT_SCOPE_MANAGED; /* `MANAGED */
  else if (val == caml_hash_variant("GLOBAL")) return GTK_SHORTCUT_SCOPE_GLOBAL; /* `GLOBAL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkShortcutScope tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkShortcutType to OCaml value */
value Val_GtkShortcutType(GtkShortcutType val) {
  switch (val) {
    case GTK_SHORTCUT_ACCELERATOR: return caml_hash_variant("ACCELERATOR"); /* `ACCELERATOR */
    case GTK_SHORTCUT_GESTURE_PINCH: return caml_hash_variant("GESTURE_PINCH"); /* `GESTURE_PINCH */
    case GTK_SHORTCUT_GESTURE_STRETCH: return caml_hash_variant("GESTURE_STRETCH"); /* `GESTURE_STRETCH */
    case GTK_SHORTCUT_GESTURE_ROTATE_CLOCKWISE: return caml_hash_variant("GESTURE_ROTATE_CLOCKWISE"); /* `GESTURE_ROTATE_CLOCKWISE */
    case GTK_SHORTCUT_GESTURE_ROTATE_COUNTERCLOCKWISE: return caml_hash_variant("GESTURE_ROTATE_COUNTERCLOCKWISE"); /* `GESTURE_ROTATE_COUNTERCLOCKWISE */
    case GTK_SHORTCUT_GESTURE_TWO_FINGER_SWIPE_LEFT: return caml_hash_variant("GESTURE_TWO_FINGER_SWIPE_LEFT"); /* `GESTURE_TWO_FINGER_SWIPE_LEFT */
    case GTK_SHORTCUT_GESTURE_TWO_FINGER_SWIPE_RIGHT: return caml_hash_variant("GESTURE_TWO_FINGER_SWIPE_RIGHT"); /* `GESTURE_TWO_FINGER_SWIPE_RIGHT */
    case GTK_SHORTCUT_GESTURE: return caml_hash_variant("GESTURE"); /* `GESTURE */
    case GTK_SHORTCUT_GESTURE_SWIPE_LEFT: return caml_hash_variant("GESTURE_SWIPE_LEFT"); /* `GESTURE_SWIPE_LEFT */
    case GTK_SHORTCUT_GESTURE_SWIPE_RIGHT: return caml_hash_variant("GESTURE_SWIPE_RIGHT"); /* `GESTURE_SWIPE_RIGHT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkShortcutType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkShortcutType */
GtkShortcutType GtkShortcutType_val(value val) {
  if (val == caml_hash_variant("ACCELERATOR")) return GTK_SHORTCUT_ACCELERATOR; /* `ACCELERATOR */
  else if (val == caml_hash_variant("GESTURE_PINCH")) return GTK_SHORTCUT_GESTURE_PINCH; /* `GESTURE_PINCH */
  else if (val == caml_hash_variant("GESTURE_STRETCH")) return GTK_SHORTCUT_GESTURE_STRETCH; /* `GESTURE_STRETCH */
  else if (val == caml_hash_variant("GESTURE_ROTATE_CLOCKWISE")) return GTK_SHORTCUT_GESTURE_ROTATE_CLOCKWISE; /* `GESTURE_ROTATE_CLOCKWISE */
  else if (val == caml_hash_variant("GESTURE_ROTATE_COUNTERCLOCKWISE")) return GTK_SHORTCUT_GESTURE_ROTATE_COUNTERCLOCKWISE; /* `GESTURE_ROTATE_COUNTERCLOCKWISE */
  else if (val == caml_hash_variant("GESTURE_TWO_FINGER_SWIPE_LEFT")) return GTK_SHORTCUT_GESTURE_TWO_FINGER_SWIPE_LEFT; /* `GESTURE_TWO_FINGER_SWIPE_LEFT */
  else if (val == caml_hash_variant("GESTURE_TWO_FINGER_SWIPE_RIGHT")) return GTK_SHORTCUT_GESTURE_TWO_FINGER_SWIPE_RIGHT; /* `GESTURE_TWO_FINGER_SWIPE_RIGHT */
  else if (val == caml_hash_variant("GESTURE")) return GTK_SHORTCUT_GESTURE; /* `GESTURE */
  else if (val == caml_hash_variant("GESTURE_SWIPE_LEFT")) return GTK_SHORTCUT_GESTURE_SWIPE_LEFT; /* `GESTURE_SWIPE_LEFT */
  else if (val == caml_hash_variant("GESTURE_SWIPE_RIGHT")) return GTK_SHORTCUT_GESTURE_SWIPE_RIGHT; /* `GESTURE_SWIPE_RIGHT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkShortcutType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkSizeGroupMode to OCaml value */
value Val_GtkSizeGroupMode(GtkSizeGroupMode val) {
  switch (val) {
    case GTK_SIZE_GROUP_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_SIZE_GROUP_HORIZONTAL: return caml_hash_variant("HORIZONTAL"); /* `HORIZONTAL */
    case GTK_SIZE_GROUP_VERTICAL: return caml_hash_variant("VERTICAL"); /* `VERTICAL */
    case GTK_SIZE_GROUP_BOTH: return caml_hash_variant("BOTH"); /* `BOTH */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkSizeGroupMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkSizeGroupMode */
GtkSizeGroupMode GtkSizeGroupMode_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_SIZE_GROUP_NONE; /* `NONE */
  else if (val == caml_hash_variant("HORIZONTAL")) return GTK_SIZE_GROUP_HORIZONTAL; /* `HORIZONTAL */
  else if (val == caml_hash_variant("VERTICAL")) return GTK_SIZE_GROUP_VERTICAL; /* `VERTICAL */
  else if (val == caml_hash_variant("BOTH")) return GTK_SIZE_GROUP_BOTH; /* `BOTH */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkSizeGroupMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkSizeRequestMode to OCaml value */
value Val_GtkSizeRequestMode(GtkSizeRequestMode val) {
  switch (val) {
    case GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH: return caml_hash_variant("HEIGHT_FOR_WIDTH"); /* `HEIGHT_FOR_WIDTH */
    case GTK_SIZE_REQUEST_WIDTH_FOR_HEIGHT: return caml_hash_variant("WIDTH_FOR_HEIGHT"); /* `WIDTH_FOR_HEIGHT */
    case GTK_SIZE_REQUEST_CONSTANT_SIZE: return caml_hash_variant("CONSTANT_SIZE"); /* `CONSTANT_SIZE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkSizeRequestMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkSizeRequestMode */
GtkSizeRequestMode GtkSizeRequestMode_val(value val) {
  if (val == caml_hash_variant("HEIGHT_FOR_WIDTH")) return GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH; /* `HEIGHT_FOR_WIDTH */
  else if (val == caml_hash_variant("WIDTH_FOR_HEIGHT")) return GTK_SIZE_REQUEST_WIDTH_FOR_HEIGHT; /* `WIDTH_FOR_HEIGHT */
  else if (val == caml_hash_variant("CONSTANT_SIZE")) return GTK_SIZE_REQUEST_CONSTANT_SIZE; /* `CONSTANT_SIZE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkSizeRequestMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkSortType to OCaml value */
value Val_GtkSortType(GtkSortType val) {
  switch (val) {
    case GTK_SORT_ASCENDING: return caml_hash_variant("ASCENDING"); /* `ASCENDING */
    case GTK_SORT_DESCENDING: return caml_hash_variant("DESCENDING"); /* `DESCENDING */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkSortType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkSortType */
GtkSortType GtkSortType_val(value val) {
  if (val == caml_hash_variant("ASCENDING")) return GTK_SORT_ASCENDING; /* `ASCENDING */
  else if (val == caml_hash_variant("DESCENDING")) return GTK_SORT_DESCENDING; /* `DESCENDING */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkSortType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkSorterChange to OCaml value */
value Val_GtkSorterChange(GtkSorterChange val) {
  switch (val) {
    case GTK_SORTER_CHANGE_DIFFERENT: return caml_hash_variant("DIFFERENT"); /* `DIFFERENT */
    case GTK_SORTER_CHANGE_INVERTED: return caml_hash_variant("INVERTED"); /* `INVERTED */
    case GTK_SORTER_CHANGE_LESS_STRICT: return caml_hash_variant("LESS_STRICT"); /* `LESS_STRICT */
    case GTK_SORTER_CHANGE_MORE_STRICT: return caml_hash_variant("MORE_STRICT"); /* `MORE_STRICT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkSorterChange value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkSorterChange */
GtkSorterChange GtkSorterChange_val(value val) {
  if (val == caml_hash_variant("DIFFERENT")) return GTK_SORTER_CHANGE_DIFFERENT; /* `DIFFERENT */
  else if (val == caml_hash_variant("INVERTED")) return GTK_SORTER_CHANGE_INVERTED; /* `INVERTED */
  else if (val == caml_hash_variant("LESS_STRICT")) return GTK_SORTER_CHANGE_LESS_STRICT; /* `LESS_STRICT */
  else if (val == caml_hash_variant("MORE_STRICT")) return GTK_SORTER_CHANGE_MORE_STRICT; /* `MORE_STRICT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkSorterChange tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkSorterOrder to OCaml value */
value Val_GtkSorterOrder(GtkSorterOrder val) {
  switch (val) {
    case GTK_SORTER_ORDER_PARTIAL: return caml_hash_variant("PARTIAL"); /* `PARTIAL */
    case GTK_SORTER_ORDER_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_SORTER_ORDER_TOTAL: return caml_hash_variant("TOTAL"); /* `TOTAL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkSorterOrder value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkSorterOrder */
GtkSorterOrder GtkSorterOrder_val(value val) {
  if (val == caml_hash_variant("PARTIAL")) return GTK_SORTER_ORDER_PARTIAL; /* `PARTIAL */
  else if (val == caml_hash_variant("NONE")) return GTK_SORTER_ORDER_NONE; /* `NONE */
  else if (val == caml_hash_variant("TOTAL")) return GTK_SORTER_ORDER_TOTAL; /* `TOTAL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkSorterOrder tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkSpinButtonUpdatePolicy to OCaml value */
value Val_GtkSpinButtonUpdatePolicy(GtkSpinButtonUpdatePolicy val) {
  switch (val) {
    case GTK_UPDATE_ALWAYS: return caml_hash_variant("ALWAYS"); /* `ALWAYS */
    case GTK_UPDATE_IF_VALID: return caml_hash_variant("IF_VALID"); /* `IF_VALID */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkSpinButtonUpdatePolicy value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkSpinButtonUpdatePolicy */
GtkSpinButtonUpdatePolicy GtkSpinButtonUpdatePolicy_val(value val) {
  if (val == caml_hash_variant("ALWAYS")) return GTK_UPDATE_ALWAYS; /* `ALWAYS */
  else if (val == caml_hash_variant("IF_VALID")) return GTK_UPDATE_IF_VALID; /* `IF_VALID */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkSpinButtonUpdatePolicy tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkSpinType to OCaml value */
value Val_GtkSpinType(GtkSpinType val) {
  switch (val) {
    case GTK_SPIN_STEP_FORWARD: return caml_hash_variant("STEP_FORWARD"); /* `STEP_FORWARD */
    case GTK_SPIN_STEP_BACKWARD: return caml_hash_variant("STEP_BACKWARD"); /* `STEP_BACKWARD */
    case GTK_SPIN_PAGE_FORWARD: return caml_hash_variant("PAGE_FORWARD"); /* `PAGE_FORWARD */
    case GTK_SPIN_PAGE_BACKWARD: return caml_hash_variant("PAGE_BACKWARD"); /* `PAGE_BACKWARD */
    case GTK_SPIN_HOME: return caml_hash_variant("HOME"); /* `HOME */
    case GTK_SPIN_END: return caml_hash_variant("END"); /* `END */
    case GTK_SPIN_USER_DEFINED: return caml_hash_variant("USER_DEFINED"); /* `USER_DEFINED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkSpinType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkSpinType */
GtkSpinType GtkSpinType_val(value val) {
  if (val == caml_hash_variant("STEP_FORWARD")) return GTK_SPIN_STEP_FORWARD; /* `STEP_FORWARD */
  else if (val == caml_hash_variant("STEP_BACKWARD")) return GTK_SPIN_STEP_BACKWARD; /* `STEP_BACKWARD */
  else if (val == caml_hash_variant("PAGE_FORWARD")) return GTK_SPIN_PAGE_FORWARD; /* `PAGE_FORWARD */
  else if (val == caml_hash_variant("PAGE_BACKWARD")) return GTK_SPIN_PAGE_BACKWARD; /* `PAGE_BACKWARD */
  else if (val == caml_hash_variant("HOME")) return GTK_SPIN_HOME; /* `HOME */
  else if (val == caml_hash_variant("END")) return GTK_SPIN_END; /* `END */
  else if (val == caml_hash_variant("USER_DEFINED")) return GTK_SPIN_USER_DEFINED; /* `USER_DEFINED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkSpinType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkStackTransitionType to OCaml value */
value Val_GtkStackTransitionType(GtkStackTransitionType val) {
  switch (val) {
    case GTK_STACK_TRANSITION_TYPE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_STACK_TRANSITION_TYPE_CROSSFADE: return caml_hash_variant("CROSSFADE"); /* `CROSSFADE */
    case GTK_STACK_TRANSITION_TYPE_SLIDE_RIGHT: return caml_hash_variant("SLIDE_RIGHT"); /* `SLIDE_RIGHT */
    case GTK_STACK_TRANSITION_TYPE_SLIDE_LEFT: return caml_hash_variant("SLIDE_LEFT"); /* `SLIDE_LEFT */
    case GTK_STACK_TRANSITION_TYPE_SLIDE_UP: return caml_hash_variant("SLIDE_UP"); /* `SLIDE_UP */
    case GTK_STACK_TRANSITION_TYPE_SLIDE_DOWN: return caml_hash_variant("SLIDE_DOWN"); /* `SLIDE_DOWN */
    case GTK_STACK_TRANSITION_TYPE_SLIDE_LEFT_RIGHT: return caml_hash_variant("SLIDE_LEFT_RIGHT"); /* `SLIDE_LEFT_RIGHT */
    case GTK_STACK_TRANSITION_TYPE_SLIDE_UP_DOWN: return caml_hash_variant("SLIDE_UP_DOWN"); /* `SLIDE_UP_DOWN */
    case GTK_STACK_TRANSITION_TYPE_OVER_UP: return caml_hash_variant("OVER_UP"); /* `OVER_UP */
    case GTK_STACK_TRANSITION_TYPE_OVER_DOWN: return caml_hash_variant("OVER_DOWN"); /* `OVER_DOWN */
    case GTK_STACK_TRANSITION_TYPE_OVER_LEFT: return caml_hash_variant("OVER_LEFT"); /* `OVER_LEFT */
    case GTK_STACK_TRANSITION_TYPE_OVER_RIGHT: return caml_hash_variant("OVER_RIGHT"); /* `OVER_RIGHT */
    case GTK_STACK_TRANSITION_TYPE_UNDER_UP: return caml_hash_variant("UNDER_UP"); /* `UNDER_UP */
    case GTK_STACK_TRANSITION_TYPE_UNDER_DOWN: return caml_hash_variant("UNDER_DOWN"); /* `UNDER_DOWN */
    case GTK_STACK_TRANSITION_TYPE_UNDER_LEFT: return caml_hash_variant("UNDER_LEFT"); /* `UNDER_LEFT */
    case GTK_STACK_TRANSITION_TYPE_UNDER_RIGHT: return caml_hash_variant("UNDER_RIGHT"); /* `UNDER_RIGHT */
    case GTK_STACK_TRANSITION_TYPE_OVER_UP_DOWN: return caml_hash_variant("OVER_UP_DOWN"); /* `OVER_UP_DOWN */
    case GTK_STACK_TRANSITION_TYPE_OVER_DOWN_UP: return caml_hash_variant("OVER_DOWN_UP"); /* `OVER_DOWN_UP */
    case GTK_STACK_TRANSITION_TYPE_OVER_LEFT_RIGHT: return caml_hash_variant("OVER_LEFT_RIGHT"); /* `OVER_LEFT_RIGHT */
    case GTK_STACK_TRANSITION_TYPE_OVER_RIGHT_LEFT: return caml_hash_variant("OVER_RIGHT_LEFT"); /* `OVER_RIGHT_LEFT */
    case GTK_STACK_TRANSITION_TYPE_ROTATE_LEFT: return caml_hash_variant("ROTATE_LEFT"); /* `ROTATE_LEFT */
    case GTK_STACK_TRANSITION_TYPE_ROTATE_RIGHT: return caml_hash_variant("ROTATE_RIGHT"); /* `ROTATE_RIGHT */
    case GTK_STACK_TRANSITION_TYPE_ROTATE_LEFT_RIGHT: return caml_hash_variant("ROTATE_LEFT_RIGHT"); /* `ROTATE_LEFT_RIGHT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkStackTransitionType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkStackTransitionType */
GtkStackTransitionType GtkStackTransitionType_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_STACK_TRANSITION_TYPE_NONE; /* `NONE */
  else if (val == caml_hash_variant("CROSSFADE")) return GTK_STACK_TRANSITION_TYPE_CROSSFADE; /* `CROSSFADE */
  else if (val == caml_hash_variant("SLIDE_RIGHT")) return GTK_STACK_TRANSITION_TYPE_SLIDE_RIGHT; /* `SLIDE_RIGHT */
  else if (val == caml_hash_variant("SLIDE_LEFT")) return GTK_STACK_TRANSITION_TYPE_SLIDE_LEFT; /* `SLIDE_LEFT */
  else if (val == caml_hash_variant("SLIDE_UP")) return GTK_STACK_TRANSITION_TYPE_SLIDE_UP; /* `SLIDE_UP */
  else if (val == caml_hash_variant("SLIDE_DOWN")) return GTK_STACK_TRANSITION_TYPE_SLIDE_DOWN; /* `SLIDE_DOWN */
  else if (val == caml_hash_variant("SLIDE_LEFT_RIGHT")) return GTK_STACK_TRANSITION_TYPE_SLIDE_LEFT_RIGHT; /* `SLIDE_LEFT_RIGHT */
  else if (val == caml_hash_variant("SLIDE_UP_DOWN")) return GTK_STACK_TRANSITION_TYPE_SLIDE_UP_DOWN; /* `SLIDE_UP_DOWN */
  else if (val == caml_hash_variant("OVER_UP")) return GTK_STACK_TRANSITION_TYPE_OVER_UP; /* `OVER_UP */
  else if (val == caml_hash_variant("OVER_DOWN")) return GTK_STACK_TRANSITION_TYPE_OVER_DOWN; /* `OVER_DOWN */
  else if (val == caml_hash_variant("OVER_LEFT")) return GTK_STACK_TRANSITION_TYPE_OVER_LEFT; /* `OVER_LEFT */
  else if (val == caml_hash_variant("OVER_RIGHT")) return GTK_STACK_TRANSITION_TYPE_OVER_RIGHT; /* `OVER_RIGHT */
  else if (val == caml_hash_variant("UNDER_UP")) return GTK_STACK_TRANSITION_TYPE_UNDER_UP; /* `UNDER_UP */
  else if (val == caml_hash_variant("UNDER_DOWN")) return GTK_STACK_TRANSITION_TYPE_UNDER_DOWN; /* `UNDER_DOWN */
  else if (val == caml_hash_variant("UNDER_LEFT")) return GTK_STACK_TRANSITION_TYPE_UNDER_LEFT; /* `UNDER_LEFT */
  else if (val == caml_hash_variant("UNDER_RIGHT")) return GTK_STACK_TRANSITION_TYPE_UNDER_RIGHT; /* `UNDER_RIGHT */
  else if (val == caml_hash_variant("OVER_UP_DOWN")) return GTK_STACK_TRANSITION_TYPE_OVER_UP_DOWN; /* `OVER_UP_DOWN */
  else if (val == caml_hash_variant("OVER_DOWN_UP")) return GTK_STACK_TRANSITION_TYPE_OVER_DOWN_UP; /* `OVER_DOWN_UP */
  else if (val == caml_hash_variant("OVER_LEFT_RIGHT")) return GTK_STACK_TRANSITION_TYPE_OVER_LEFT_RIGHT; /* `OVER_LEFT_RIGHT */
  else if (val == caml_hash_variant("OVER_RIGHT_LEFT")) return GTK_STACK_TRANSITION_TYPE_OVER_RIGHT_LEFT; /* `OVER_RIGHT_LEFT */
  else if (val == caml_hash_variant("ROTATE_LEFT")) return GTK_STACK_TRANSITION_TYPE_ROTATE_LEFT; /* `ROTATE_LEFT */
  else if (val == caml_hash_variant("ROTATE_RIGHT")) return GTK_STACK_TRANSITION_TYPE_ROTATE_RIGHT; /* `ROTATE_RIGHT */
  else if (val == caml_hash_variant("ROTATE_LEFT_RIGHT")) return GTK_STACK_TRANSITION_TYPE_ROTATE_LEFT_RIGHT; /* `ROTATE_LEFT_RIGHT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkStackTransitionType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkStringFilterMatchMode to OCaml value */
value Val_GtkStringFilterMatchMode(GtkStringFilterMatchMode val) {
  switch (val) {
    case GTK_STRING_FILTER_MATCH_MODE_EXACT: return caml_hash_variant("EXACT"); /* `EXACT */
    case GTK_STRING_FILTER_MATCH_MODE_SUBSTRING: return caml_hash_variant("SUBSTRING"); /* `SUBSTRING */
    case GTK_STRING_FILTER_MATCH_MODE_PREFIX: return caml_hash_variant("PREFIX"); /* `PREFIX */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkStringFilterMatchMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkStringFilterMatchMode */
GtkStringFilterMatchMode GtkStringFilterMatchMode_val(value val) {
  if (val == caml_hash_variant("EXACT")) return GTK_STRING_FILTER_MATCH_MODE_EXACT; /* `EXACT */
  else if (val == caml_hash_variant("SUBSTRING")) return GTK_STRING_FILTER_MATCH_MODE_SUBSTRING; /* `SUBSTRING */
  else if (val == caml_hash_variant("PREFIX")) return GTK_STRING_FILTER_MATCH_MODE_PREFIX; /* `PREFIX */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkStringFilterMatchMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkSymbolicColor to OCaml value */
value Val_GtkSymbolicColor(GtkSymbolicColor val) {
  switch (val) {
    case GTK_SYMBOLIC_COLOR_FOREGROUND: return caml_hash_variant("FOREGROUND"); /* `FOREGROUND */
    case GTK_SYMBOLIC_COLOR_ERROR: return caml_hash_variant("ERROR"); /* `ERROR */
    case GTK_SYMBOLIC_COLOR_WARNING: return caml_hash_variant("WARNING"); /* `WARNING */
    case GTK_SYMBOLIC_COLOR_SUCCESS: return caml_hash_variant("SUCCESS"); /* `SUCCESS */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkSymbolicColor value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkSymbolicColor */
GtkSymbolicColor GtkSymbolicColor_val(value val) {
  if (val == caml_hash_variant("FOREGROUND")) return GTK_SYMBOLIC_COLOR_FOREGROUND; /* `FOREGROUND */
  else if (val == caml_hash_variant("ERROR")) return GTK_SYMBOLIC_COLOR_ERROR; /* `ERROR */
  else if (val == caml_hash_variant("WARNING")) return GTK_SYMBOLIC_COLOR_WARNING; /* `WARNING */
  else if (val == caml_hash_variant("SUCCESS")) return GTK_SYMBOLIC_COLOR_SUCCESS; /* `SUCCESS */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkSymbolicColor tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkSystemSetting to OCaml value */
value Val_GtkSystemSetting(GtkSystemSetting val) {
  switch (val) {
    case GTK_SYSTEM_SETTING_DPI: return caml_hash_variant("DPI"); /* `DPI */
    case GTK_SYSTEM_SETTING_FONT_NAME: return caml_hash_variant("FONT_NAME"); /* `FONT_NAME */
    case GTK_SYSTEM_SETTING_FONT_CONFIG: return caml_hash_variant("FONT_CONFIG"); /* `FONT_CONFIG */
    case GTK_SYSTEM_SETTING_DISPLAY: return caml_hash_variant("DISPLAY"); /* `DISPLAY */
    case GTK_SYSTEM_SETTING_ICON_THEME: return caml_hash_variant("ICON_THEME"); /* `ICON_THEME */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkSystemSetting value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkSystemSetting */
GtkSystemSetting GtkSystemSetting_val(value val) {
  if (val == caml_hash_variant("DPI")) return GTK_SYSTEM_SETTING_DPI; /* `DPI */
  else if (val == caml_hash_variant("FONT_NAME")) return GTK_SYSTEM_SETTING_FONT_NAME; /* `FONT_NAME */
  else if (val == caml_hash_variant("FONT_CONFIG")) return GTK_SYSTEM_SETTING_FONT_CONFIG; /* `FONT_CONFIG */
  else if (val == caml_hash_variant("DISPLAY")) return GTK_SYSTEM_SETTING_DISPLAY; /* `DISPLAY */
  else if (val == caml_hash_variant("ICON_THEME")) return GTK_SYSTEM_SETTING_ICON_THEME; /* `ICON_THEME */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkSystemSetting tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkTextDirection to OCaml value */
value Val_GtkTextDirection(GtkTextDirection val) {
  switch (val) {
    case GTK_TEXT_DIR_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_TEXT_DIR_LTR: return caml_hash_variant("LTR"); /* `LTR */
    case GTK_TEXT_DIR_RTL: return caml_hash_variant("RTL"); /* `RTL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkTextDirection value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkTextDirection */
GtkTextDirection GtkTextDirection_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_TEXT_DIR_NONE; /* `NONE */
  else if (val == caml_hash_variant("LTR")) return GTK_TEXT_DIR_LTR; /* `LTR */
  else if (val == caml_hash_variant("RTL")) return GTK_TEXT_DIR_RTL; /* `RTL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkTextDirection tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkTextExtendSelection to OCaml value */
value Val_GtkTextExtendSelection(GtkTextExtendSelection val) {
  switch (val) {
    case GTK_TEXT_EXTEND_SELECTION_WORD: return caml_hash_variant("WORD"); /* `WORD */
    case GTK_TEXT_EXTEND_SELECTION_LINE: return caml_hash_variant("LINE"); /* `LINE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkTextExtendSelection value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkTextExtendSelection */
GtkTextExtendSelection GtkTextExtendSelection_val(value val) {
  if (val == caml_hash_variant("WORD")) return GTK_TEXT_EXTEND_SELECTION_WORD; /* `WORD */
  else if (val == caml_hash_variant("LINE")) return GTK_TEXT_EXTEND_SELECTION_LINE; /* `LINE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkTextExtendSelection tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkTextViewLayer to OCaml value */
value Val_GtkTextViewLayer(GtkTextViewLayer val) {
  switch (val) {
    case GTK_TEXT_VIEW_LAYER_BELOW_TEXT: return caml_hash_variant("BELOW_TEXT"); /* `BELOW_TEXT */
    case GTK_TEXT_VIEW_LAYER_ABOVE_TEXT: return caml_hash_variant("ABOVE_TEXT"); /* `ABOVE_TEXT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkTextViewLayer value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkTextViewLayer */
GtkTextViewLayer GtkTextViewLayer_val(value val) {
  if (val == caml_hash_variant("BELOW_TEXT")) return GTK_TEXT_VIEW_LAYER_BELOW_TEXT; /* `BELOW_TEXT */
  else if (val == caml_hash_variant("ABOVE_TEXT")) return GTK_TEXT_VIEW_LAYER_ABOVE_TEXT; /* `ABOVE_TEXT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkTextViewLayer tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkTextWindowType to OCaml value */
value Val_GtkTextWindowType(GtkTextWindowType val) {
  switch (val) {
    case GTK_TEXT_WINDOW_WIDGET: return caml_hash_variant("WIDGET"); /* `WIDGET */
    case GTK_TEXT_WINDOW_TEXT: return caml_hash_variant("TEXT"); /* `TEXT */
    case GTK_TEXT_WINDOW_LEFT: return caml_hash_variant("LEFT"); /* `LEFT */
    case GTK_TEXT_WINDOW_RIGHT: return caml_hash_variant("RIGHT"); /* `RIGHT */
    case GTK_TEXT_WINDOW_TOP: return caml_hash_variant("TOP"); /* `TOP */
    case GTK_TEXT_WINDOW_BOTTOM: return caml_hash_variant("BOTTOM"); /* `BOTTOM */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkTextWindowType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkTextWindowType */
GtkTextWindowType GtkTextWindowType_val(value val) {
  if (val == caml_hash_variant("WIDGET")) return GTK_TEXT_WINDOW_WIDGET; /* `WIDGET */
  else if (val == caml_hash_variant("TEXT")) return GTK_TEXT_WINDOW_TEXT; /* `TEXT */
  else if (val == caml_hash_variant("LEFT")) return GTK_TEXT_WINDOW_LEFT; /* `LEFT */
  else if (val == caml_hash_variant("RIGHT")) return GTK_TEXT_WINDOW_RIGHT; /* `RIGHT */
  else if (val == caml_hash_variant("TOP")) return GTK_TEXT_WINDOW_TOP; /* `TOP */
  else if (val == caml_hash_variant("BOTTOM")) return GTK_TEXT_WINDOW_BOTTOM; /* `BOTTOM */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkTextWindowType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkTreeViewColumnSizing to OCaml value */
value Val_GtkTreeViewColumnSizing(GtkTreeViewColumnSizing val) {
  switch (val) {
    case GTK_TREE_VIEW_COLUMN_GROW_ONLY: return caml_hash_variant("GROW_ONLY"); /* `GROW_ONLY */
    case GTK_TREE_VIEW_COLUMN_AUTOSIZE: return caml_hash_variant("AUTOSIZE"); /* `AUTOSIZE */
    case GTK_TREE_VIEW_COLUMN_FIXED: return caml_hash_variant("FIXED"); /* `FIXED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkTreeViewColumnSizing value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkTreeViewColumnSizing */
GtkTreeViewColumnSizing GtkTreeViewColumnSizing_val(value val) {
  if (val == caml_hash_variant("GROW_ONLY")) return GTK_TREE_VIEW_COLUMN_GROW_ONLY; /* `GROW_ONLY */
  else if (val == caml_hash_variant("AUTOSIZE")) return GTK_TREE_VIEW_COLUMN_AUTOSIZE; /* `AUTOSIZE */
  else if (val == caml_hash_variant("FIXED")) return GTK_TREE_VIEW_COLUMN_FIXED; /* `FIXED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkTreeViewColumnSizing tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkTreeViewDropPosition to OCaml value */
value Val_GtkTreeViewDropPosition(GtkTreeViewDropPosition val) {
  switch (val) {
    case GTK_TREE_VIEW_DROP_BEFORE: return caml_hash_variant("BEFORE"); /* `BEFORE */
    case GTK_TREE_VIEW_DROP_AFTER: return caml_hash_variant("AFTER"); /* `AFTER */
    case GTK_TREE_VIEW_DROP_INTO_OR_BEFORE: return caml_hash_variant("INTO_OR_BEFORE"); /* `INTO_OR_BEFORE */
    case GTK_TREE_VIEW_DROP_INTO_OR_AFTER: return caml_hash_variant("INTO_OR_AFTER"); /* `INTO_OR_AFTER */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkTreeViewDropPosition value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkTreeViewDropPosition */
GtkTreeViewDropPosition GtkTreeViewDropPosition_val(value val) {
  if (val == caml_hash_variant("BEFORE")) return GTK_TREE_VIEW_DROP_BEFORE; /* `BEFORE */
  else if (val == caml_hash_variant("AFTER")) return GTK_TREE_VIEW_DROP_AFTER; /* `AFTER */
  else if (val == caml_hash_variant("INTO_OR_BEFORE")) return GTK_TREE_VIEW_DROP_INTO_OR_BEFORE; /* `INTO_OR_BEFORE */
  else if (val == caml_hash_variant("INTO_OR_AFTER")) return GTK_TREE_VIEW_DROP_INTO_OR_AFTER; /* `INTO_OR_AFTER */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkTreeViewDropPosition tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkTreeViewGridLines to OCaml value */
value Val_GtkTreeViewGridLines(GtkTreeViewGridLines val) {
  switch (val) {
    case GTK_TREE_VIEW_GRID_LINES_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_TREE_VIEW_GRID_LINES_HORIZONTAL: return caml_hash_variant("HORIZONTAL"); /* `HORIZONTAL */
    case GTK_TREE_VIEW_GRID_LINES_VERTICAL: return caml_hash_variant("VERTICAL"); /* `VERTICAL */
    case GTK_TREE_VIEW_GRID_LINES_BOTH: return caml_hash_variant("BOTH"); /* `BOTH */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkTreeViewGridLines value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkTreeViewGridLines */
GtkTreeViewGridLines GtkTreeViewGridLines_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_TREE_VIEW_GRID_LINES_NONE; /* `NONE */
  else if (val == caml_hash_variant("HORIZONTAL")) return GTK_TREE_VIEW_GRID_LINES_HORIZONTAL; /* `HORIZONTAL */
  else if (val == caml_hash_variant("VERTICAL")) return GTK_TREE_VIEW_GRID_LINES_VERTICAL; /* `VERTICAL */
  else if (val == caml_hash_variant("BOTH")) return GTK_TREE_VIEW_GRID_LINES_BOTH; /* `BOTH */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkTreeViewGridLines tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkUnit to OCaml value */
value Val_GtkUnit(GtkUnit val) {
  switch (val) {
    case GTK_UNIT_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_UNIT_POINTS: return caml_hash_variant("POINTS"); /* `POINTS */
    case GTK_UNIT_INCH: return caml_hash_variant("INCH"); /* `INCH */
    case GTK_UNIT_MM: return caml_hash_variant("MM"); /* `MM */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkUnit value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkUnit */
GtkUnit GtkUnit_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_UNIT_NONE; /* `NONE */
  else if (val == caml_hash_variant("POINTS")) return GTK_UNIT_POINTS; /* `POINTS */
  else if (val == caml_hash_variant("INCH")) return GTK_UNIT_INCH; /* `INCH */
  else if (val == caml_hash_variant("MM")) return GTK_UNIT_MM; /* `MM */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkUnit tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkWrapMode to OCaml value */
value Val_GtkWrapMode(GtkWrapMode val) {
  switch (val) {
    case GTK_WRAP_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GTK_WRAP_CHAR: return caml_hash_variant("CHAR"); /* `CHAR */
    case GTK_WRAP_WORD: return caml_hash_variant("WORD"); /* `WORD */
    case GTK_WRAP_WORD_CHAR: return caml_hash_variant("WORD_CHAR"); /* `WORD_CHAR */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GtkWrapMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GtkWrapMode */
GtkWrapMode GtkWrapMode_val(value val) {
  if (val == caml_hash_variant("NONE")) return GTK_WRAP_NONE; /* `NONE */
  else if (val == caml_hash_variant("CHAR")) return GTK_WRAP_CHAR; /* `CHAR */
  else if (val == caml_hash_variant("WORD")) return GTK_WRAP_WORD; /* `WORD */
  else if (val == caml_hash_variant("WORD_CHAR")) return GTK_WRAP_WORD_CHAR; /* `WORD_CHAR */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GtkWrapMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GtkApplicationInhibitFlags to OCaml flag list */
value Val_GtkApplicationInhibitFlags(GtkApplicationInhibitFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GTK_APPLICATION_INHIBIT_LOGOUT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("LOGOUT"))); /* `LOGOUT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_APPLICATION_INHIBIT_SWITCH) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SWITCH"))); /* `SWITCH */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_APPLICATION_INHIBIT_SUSPEND) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SUSPEND"))); /* `SUSPEND */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_APPLICATION_INHIBIT_IDLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("IDLE"))); /* `IDLE */
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
    if (tag == caml_hash_variant("LOGOUT")) result |= GTK_APPLICATION_INHIBIT_LOGOUT; /* `LOGOUT */
    else if (tag == caml_hash_variant("SWITCH")) result |= GTK_APPLICATION_INHIBIT_SWITCH; /* `SWITCH */
    else if (tag == caml_hash_variant("SUSPEND")) result |= GTK_APPLICATION_INHIBIT_SUSPEND; /* `SUSPEND */
    else if (tag == caml_hash_variant("IDLE")) result |= GTK_APPLICATION_INHIBIT_IDLE; /* `IDLE */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("SWAPPED"))); /* `SWAPPED */
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
    if (tag == caml_hash_variant("SWAPPED")) result |= GTK_BUILDER_CLOSURE_SWAPPED; /* `SWAPPED */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("SELECTED"))); /* `SELECTED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_CELL_RENDERER_PRELIT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PRELIT"))); /* `PRELIT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_CELL_RENDERER_INSENSITIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("INSENSITIVE"))); /* `INSENSITIVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_CELL_RENDERER_SORTED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SORTED"))); /* `SORTED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_CELL_RENDERER_FOCUSED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FOCUSED"))); /* `FOCUSED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_CELL_RENDERER_EXPANDABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("EXPANDABLE"))); /* `EXPANDABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_CELL_RENDERER_EXPANDED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("EXPANDED"))); /* `EXPANDED */
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
    if (tag == caml_hash_variant("SELECTED")) result |= GTK_CELL_RENDERER_SELECTED; /* `SELECTED */
    else if (tag == caml_hash_variant("PRELIT")) result |= GTK_CELL_RENDERER_PRELIT; /* `PRELIT */
    else if (tag == caml_hash_variant("INSENSITIVE")) result |= GTK_CELL_RENDERER_INSENSITIVE; /* `INSENSITIVE */
    else if (tag == caml_hash_variant("SORTED")) result |= GTK_CELL_RENDERER_SORTED; /* `SORTED */
    else if (tag == caml_hash_variant("FOCUSED")) result |= GTK_CELL_RENDERER_FOCUSED; /* `FOCUSED */
    else if (tag == caml_hash_variant("EXPANDABLE")) result |= GTK_CELL_RENDERER_EXPANDABLE; /* `EXPANDABLE */
    else if (tag == caml_hash_variant("EXPANDED")) result |= GTK_CELL_RENDERER_EXPANDED; /* `EXPANDED */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("TEXT"))); /* `TEXT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_TREE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("TREE"))); /* `TREE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_KEYBINDINGS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("KEYBINDINGS"))); /* `KEYBINDINGS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_MODULES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("MODULES"))); /* `MODULES */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_GEOMETRY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("GEOMETRY"))); /* `GEOMETRY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_ICONTHEME) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ICONTHEME"))); /* `ICONTHEME */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_PRINTING) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PRINTING"))); /* `PRINTING */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_BUILDER) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BUILDER"))); /* `BUILDER */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_SIZE_REQUEST) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SIZE_REQUEST"))); /* `SIZE_REQUEST */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_NO_CSS_CACHE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_CSS_CACHE"))); /* `NO_CSS_CACHE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_INTERACTIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("INTERACTIVE"))); /* `INTERACTIVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_ACTIONS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ACTIONS"))); /* `ACTIONS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_LAYOUT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("LAYOUT"))); /* `LAYOUT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_SNAPSHOT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SNAPSHOT"))); /* `SNAPSHOT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_CONSTRAINTS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CONSTRAINTS"))); /* `CONSTRAINTS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_BUILDER_OBJECTS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BUILDER_OBJECTS"))); /* `BUILDER_OBJECTS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_A11Y) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("A11Y"))); /* `A11Y */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_ICONFALLBACK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ICONFALLBACK"))); /* `ICONFALLBACK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DEBUG_INVERT_TEXT_DIR) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("INVERT_TEXT_DIR"))); /* `INVERT_TEXT_DIR */
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
    if (tag == caml_hash_variant("TEXT")) result |= GTK_DEBUG_TEXT; /* `TEXT */
    else if (tag == caml_hash_variant("TREE")) result |= GTK_DEBUG_TREE; /* `TREE */
    else if (tag == caml_hash_variant("KEYBINDINGS")) result |= GTK_DEBUG_KEYBINDINGS; /* `KEYBINDINGS */
    else if (tag == caml_hash_variant("MODULES")) result |= GTK_DEBUG_MODULES; /* `MODULES */
    else if (tag == caml_hash_variant("GEOMETRY")) result |= GTK_DEBUG_GEOMETRY; /* `GEOMETRY */
    else if (tag == caml_hash_variant("ICONTHEME")) result |= GTK_DEBUG_ICONTHEME; /* `ICONTHEME */
    else if (tag == caml_hash_variant("PRINTING")) result |= GTK_DEBUG_PRINTING; /* `PRINTING */
    else if (tag == caml_hash_variant("BUILDER")) result |= GTK_DEBUG_BUILDER; /* `BUILDER */
    else if (tag == caml_hash_variant("SIZE_REQUEST")) result |= GTK_DEBUG_SIZE_REQUEST; /* `SIZE_REQUEST */
    else if (tag == caml_hash_variant("NO_CSS_CACHE")) result |= GTK_DEBUG_NO_CSS_CACHE; /* `NO_CSS_CACHE */
    else if (tag == caml_hash_variant("INTERACTIVE")) result |= GTK_DEBUG_INTERACTIVE; /* `INTERACTIVE */
    else if (tag == caml_hash_variant("ACTIONS")) result |= GTK_DEBUG_ACTIONS; /* `ACTIONS */
    else if (tag == caml_hash_variant("LAYOUT")) result |= GTK_DEBUG_LAYOUT; /* `LAYOUT */
    else if (tag == caml_hash_variant("SNAPSHOT")) result |= GTK_DEBUG_SNAPSHOT; /* `SNAPSHOT */
    else if (tag == caml_hash_variant("CONSTRAINTS")) result |= GTK_DEBUG_CONSTRAINTS; /* `CONSTRAINTS */
    else if (tag == caml_hash_variant("BUILDER_OBJECTS")) result |= GTK_DEBUG_BUILDER_OBJECTS; /* `BUILDER_OBJECTS */
    else if (tag == caml_hash_variant("A11Y")) result |= GTK_DEBUG_A11Y; /* `A11Y */
    else if (tag == caml_hash_variant("ICONFALLBACK")) result |= GTK_DEBUG_ICONFALLBACK; /* `ICONFALLBACK */
    else if (tag == caml_hash_variant("INVERT_TEXT_DIR")) result |= GTK_DEBUG_INVERT_TEXT_DIR; /* `INVERT_TEXT_DIR */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("MODAL"))); /* `MODAL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DIALOG_DESTROY_WITH_PARENT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DESTROY_WITH_PARENT"))); /* `DESTROY_WITH_PARENT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_DIALOG_USE_HEADER_BAR) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("USE_HEADER_BAR"))); /* `USE_HEADER_BAR */
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
    if (tag == caml_hash_variant("MODAL")) result |= GTK_DIALOG_MODAL; /* `MODAL */
    else if (tag == caml_hash_variant("DESTROY_WITH_PARENT")) result |= GTK_DIALOG_DESTROY_WITH_PARENT; /* `DESTROY_WITH_PARENT */
    else if (tag == caml_hash_variant("USE_HEADER_BAR")) result |= GTK_DIALOG_USE_HEADER_BAR; /* `USE_HEADER_BAR */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_EVENT_CONTROLLER_SCROLL_VERTICAL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("VERTICAL"))); /* `VERTICAL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("HORIZONTAL"))); /* `HORIZONTAL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_EVENT_CONTROLLER_SCROLL_DISCRETE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DISCRETE"))); /* `DISCRETE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_EVENT_CONTROLLER_SCROLL_KINETIC) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("KINETIC"))); /* `KINETIC */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BOTH_AXES"))); /* `BOTH_AXES */
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
    if (tag == caml_hash_variant("NONE")) result |= GTK_EVENT_CONTROLLER_SCROLL_NONE; /* `NONE */
    else if (tag == caml_hash_variant("VERTICAL")) result |= GTK_EVENT_CONTROLLER_SCROLL_VERTICAL; /* `VERTICAL */
    else if (tag == caml_hash_variant("HORIZONTAL")) result |= GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL; /* `HORIZONTAL */
    else if (tag == caml_hash_variant("DISCRETE")) result |= GTK_EVENT_CONTROLLER_SCROLL_DISCRETE; /* `DISCRETE */
    else if (tag == caml_hash_variant("KINETIC")) result |= GTK_EVENT_CONTROLLER_SCROLL_KINETIC; /* `KINETIC */
    else if (tag == caml_hash_variant("BOTH_AXES")) result |= GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES; /* `BOTH_AXES */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("FAMILY"))); /* `FAMILY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_FONT_CHOOSER_LEVEL_STYLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("STYLE"))); /* `STYLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_FONT_CHOOSER_LEVEL_SIZE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SIZE"))); /* `SIZE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_FONT_CHOOSER_LEVEL_VARIATIONS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("VARIATIONS"))); /* `VARIATIONS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_FONT_CHOOSER_LEVEL_FEATURES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FEATURES"))); /* `FEATURES */
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
    if (tag == caml_hash_variant("FAMILY")) result |= GTK_FONT_CHOOSER_LEVEL_FAMILY; /* `FAMILY */
    else if (tag == caml_hash_variant("STYLE")) result |= GTK_FONT_CHOOSER_LEVEL_STYLE; /* `STYLE */
    else if (tag == caml_hash_variant("SIZE")) result |= GTK_FONT_CHOOSER_LEVEL_SIZE; /* `SIZE */
    else if (tag == caml_hash_variant("VARIATIONS")) result |= GTK_FONT_CHOOSER_LEVEL_VARIATIONS; /* `VARIATIONS */
    else if (tag == caml_hash_variant("FEATURES")) result |= GTK_FONT_CHOOSER_LEVEL_FEATURES; /* `FEATURES */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("FORCE_REGULAR"))); /* `FORCE_REGULAR */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_ICON_LOOKUP_FORCE_SYMBOLIC) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FORCE_SYMBOLIC"))); /* `FORCE_SYMBOLIC */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_ICON_LOOKUP_PRELOAD) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PRELOAD"))); /* `PRELOAD */
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
    if (tag == caml_hash_variant("FORCE_REGULAR")) result |= GTK_ICON_LOOKUP_FORCE_REGULAR; /* `FORCE_REGULAR */
    else if (tag == caml_hash_variant("FORCE_SYMBOLIC")) result |= GTK_ICON_LOOKUP_FORCE_SYMBOLIC; /* `FORCE_SYMBOLIC */
    else if (tag == caml_hash_variant("PRELOAD")) result |= GTK_ICON_LOOKUP_PRELOAD; /* `PRELOAD */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_SPELLCHECK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SPELLCHECK"))); /* `SPELLCHECK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_NO_SPELLCHECK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_SPELLCHECK"))); /* `NO_SPELLCHECK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_WORD_COMPLETION) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("WORD_COMPLETION"))); /* `WORD_COMPLETION */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_LOWERCASE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("LOWERCASE"))); /* `LOWERCASE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_UPPERCASE_CHARS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("UPPERCASE_CHARS"))); /* `UPPERCASE_CHARS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_UPPERCASE_WORDS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("UPPERCASE_WORDS"))); /* `UPPERCASE_WORDS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_UPPERCASE_SENTENCES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("UPPERCASE_SENTENCES"))); /* `UPPERCASE_SENTENCES */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_INHIBIT_OSK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("INHIBIT_OSK"))); /* `INHIBIT_OSK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_VERTICAL_WRITING) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("VERTICAL_WRITING"))); /* `VERTICAL_WRITING */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_EMOJI) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("EMOJI"))); /* `EMOJI */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_NO_EMOJI) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_EMOJI"))); /* `NO_EMOJI */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_INPUT_HINT_PRIVATE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PRIVATE"))); /* `PRIVATE */
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
    if (tag == caml_hash_variant("NONE")) result |= GTK_INPUT_HINT_NONE; /* `NONE */
    else if (tag == caml_hash_variant("SPELLCHECK")) result |= GTK_INPUT_HINT_SPELLCHECK; /* `SPELLCHECK */
    else if (tag == caml_hash_variant("NO_SPELLCHECK")) result |= GTK_INPUT_HINT_NO_SPELLCHECK; /* `NO_SPELLCHECK */
    else if (tag == caml_hash_variant("WORD_COMPLETION")) result |= GTK_INPUT_HINT_WORD_COMPLETION; /* `WORD_COMPLETION */
    else if (tag == caml_hash_variant("LOWERCASE")) result |= GTK_INPUT_HINT_LOWERCASE; /* `LOWERCASE */
    else if (tag == caml_hash_variant("UPPERCASE_CHARS")) result |= GTK_INPUT_HINT_UPPERCASE_CHARS; /* `UPPERCASE_CHARS */
    else if (tag == caml_hash_variant("UPPERCASE_WORDS")) result |= GTK_INPUT_HINT_UPPERCASE_WORDS; /* `UPPERCASE_WORDS */
    else if (tag == caml_hash_variant("UPPERCASE_SENTENCES")) result |= GTK_INPUT_HINT_UPPERCASE_SENTENCES; /* `UPPERCASE_SENTENCES */
    else if (tag == caml_hash_variant("INHIBIT_OSK")) result |= GTK_INPUT_HINT_INHIBIT_OSK; /* `INHIBIT_OSK */
    else if (tag == caml_hash_variant("VERTICAL_WRITING")) result |= GTK_INPUT_HINT_VERTICAL_WRITING; /* `VERTICAL_WRITING */
    else if (tag == caml_hash_variant("EMOJI")) result |= GTK_INPUT_HINT_EMOJI; /* `EMOJI */
    else if (tag == caml_hash_variant("NO_EMOJI")) result |= GTK_INPUT_HINT_NO_EMOJI; /* `NO_EMOJI */
    else if (tag == caml_hash_variant("PRIVATE")) result |= GTK_INPUT_HINT_PRIVATE; /* `PRIVATE */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_LIST_SCROLL_FOCUS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FOCUS"))); /* `FOCUS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_LIST_SCROLL_SELECT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SELECT"))); /* `SELECT */
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
    if (tag == caml_hash_variant("NONE")) result |= GTK_LIST_SCROLL_NONE; /* `NONE */
    else if (tag == caml_hash_variant("FOCUS")) result |= GTK_LIST_SCROLL_FOCUS; /* `FOCUS */
    else if (tag == caml_hash_variant("SELECT")) result |= GTK_LIST_SCROLL_SELECT; /* `SELECT */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("DEFAULT"))); /* `DEFAULT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_PICK_INSENSITIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("INSENSITIVE"))); /* `INSENSITIVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_PICK_NON_TARGETABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NON_TARGETABLE"))); /* `NON_TARGETABLE */
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
    if (tag == caml_hash_variant("DEFAULT")) result |= GTK_PICK_DEFAULT; /* `DEFAULT */
    else if (tag == caml_hash_variant("INSENSITIVE")) result |= GTK_PICK_INSENSITIVE; /* `INSENSITIVE */
    else if (tag == caml_hash_variant("NON_TARGETABLE")) result |= GTK_PICK_NON_TARGETABLE; /* `NON_TARGETABLE */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("SLIDING"))); /* `SLIDING */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_POPOVER_MENU_NESTED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NESTED"))); /* `NESTED */
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
    if (tag == caml_hash_variant("SLIDING")) result |= GTK_POPOVER_MENU_SLIDING; /* `SLIDING */
    else if (tag == caml_hash_variant("NESTED")) result |= GTK_POPOVER_MENU_NESTED; /* `NESTED */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("EXCLUSIVE"))); /* `EXCLUSIVE */
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
    if (tag == caml_hash_variant("EXCLUSIVE")) result |= GTK_SHORTCUT_ACTION_EXCLUSIVE; /* `EXCLUSIVE */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("NORMAL"))); /* `NORMAL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_ACTIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ACTIVE"))); /* `ACTIVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_PRELIGHT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PRELIGHT"))); /* `PRELIGHT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_SELECTED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SELECTED"))); /* `SELECTED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_INSENSITIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("INSENSITIVE"))); /* `INSENSITIVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_INCONSISTENT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("INCONSISTENT"))); /* `INCONSISTENT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_FOCUSED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FOCUSED"))); /* `FOCUSED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_BACKDROP) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BACKDROP"))); /* `BACKDROP */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_DIR_LTR) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DIR_LTR"))); /* `DIR_LTR */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_DIR_RTL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DIR_RTL"))); /* `DIR_RTL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_LINK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("LINK"))); /* `LINK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_VISITED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("VISITED"))); /* `VISITED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_CHECKED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CHECKED"))); /* `CHECKED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_DROP_ACTIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DROP_ACTIVE"))); /* `DROP_ACTIVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_FOCUS_VISIBLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FOCUS_VISIBLE"))); /* `FOCUS_VISIBLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STATE_FLAG_FOCUS_WITHIN) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FOCUS_WITHIN"))); /* `FOCUS_WITHIN */
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
    if (tag == caml_hash_variant("NORMAL")) result |= GTK_STATE_FLAG_NORMAL; /* `NORMAL */
    else if (tag == caml_hash_variant("ACTIVE")) result |= GTK_STATE_FLAG_ACTIVE; /* `ACTIVE */
    else if (tag == caml_hash_variant("PRELIGHT")) result |= GTK_STATE_FLAG_PRELIGHT; /* `PRELIGHT */
    else if (tag == caml_hash_variant("SELECTED")) result |= GTK_STATE_FLAG_SELECTED; /* `SELECTED */
    else if (tag == caml_hash_variant("INSENSITIVE")) result |= GTK_STATE_FLAG_INSENSITIVE; /* `INSENSITIVE */
    else if (tag == caml_hash_variant("INCONSISTENT")) result |= GTK_STATE_FLAG_INCONSISTENT; /* `INCONSISTENT */
    else if (tag == caml_hash_variant("FOCUSED")) result |= GTK_STATE_FLAG_FOCUSED; /* `FOCUSED */
    else if (tag == caml_hash_variant("BACKDROP")) result |= GTK_STATE_FLAG_BACKDROP; /* `BACKDROP */
    else if (tag == caml_hash_variant("DIR_LTR")) result |= GTK_STATE_FLAG_DIR_LTR; /* `DIR_LTR */
    else if (tag == caml_hash_variant("DIR_RTL")) result |= GTK_STATE_FLAG_DIR_RTL; /* `DIR_RTL */
    else if (tag == caml_hash_variant("LINK")) result |= GTK_STATE_FLAG_LINK; /* `LINK */
    else if (tag == caml_hash_variant("VISITED")) result |= GTK_STATE_FLAG_VISITED; /* `VISITED */
    else if (tag == caml_hash_variant("CHECKED")) result |= GTK_STATE_FLAG_CHECKED; /* `CHECKED */
    else if (tag == caml_hash_variant("DROP_ACTIVE")) result |= GTK_STATE_FLAG_DROP_ACTIVE; /* `DROP_ACTIVE */
    else if (tag == caml_hash_variant("FOCUS_VISIBLE")) result |= GTK_STATE_FLAG_FOCUS_VISIBLE; /* `FOCUS_VISIBLE */
    else if (tag == caml_hash_variant("FOCUS_WITHIN")) result |= GTK_STATE_FLAG_FOCUS_WITHIN; /* `FOCUS_WITHIN */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STYLE_CONTEXT_PRINT_RECURSE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("RECURSE"))); /* `RECURSE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STYLE_CONTEXT_PRINT_SHOW_STYLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SHOW_STYLE"))); /* `SHOW_STYLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_STYLE_CONTEXT_PRINT_SHOW_CHANGE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SHOW_CHANGE"))); /* `SHOW_CHANGE */
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
    if (tag == caml_hash_variant("NONE")) result |= GTK_STYLE_CONTEXT_PRINT_NONE; /* `NONE */
    else if (tag == caml_hash_variant("RECURSE")) result |= GTK_STYLE_CONTEXT_PRINT_RECURSE; /* `RECURSE */
    else if (tag == caml_hash_variant("SHOW_STYLE")) result |= GTK_STYLE_CONTEXT_PRINT_SHOW_STYLE; /* `SHOW_STYLE */
    else if (tag == caml_hash_variant("SHOW_CHANGE")) result |= GTK_STYLE_CONTEXT_PRINT_SHOW_CHANGE; /* `SHOW_CHANGE */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("VISIBLE_ONLY"))); /* `VISIBLE_ONLY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_TEXT_SEARCH_TEXT_ONLY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("TEXT_ONLY"))); /* `TEXT_ONLY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_TEXT_SEARCH_CASE_INSENSITIVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CASE_INSENSITIVE"))); /* `CASE_INSENSITIVE */
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
    if (tag == caml_hash_variant("VISIBLE_ONLY")) result |= GTK_TEXT_SEARCH_VISIBLE_ONLY; /* `VISIBLE_ONLY */
    else if (tag == caml_hash_variant("TEXT_ONLY")) result |= GTK_TEXT_SEARCH_TEXT_ONLY; /* `TEXT_ONLY */
    else if (tag == caml_hash_variant("CASE_INSENSITIVE")) result |= GTK_TEXT_SEARCH_CASE_INSENSITIVE; /* `CASE_INSENSITIVE */
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
    Store_field(cons, 0, Val_int(caml_hash_variant("ITERS_PERSIST"))); /* `ITERS_PERSIST */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GTK_TREE_MODEL_LIST_ONLY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("LIST_ONLY"))); /* `LIST_ONLY */
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
    if (tag == caml_hash_variant("ITERS_PERSIST")) result |= GTK_TREE_MODEL_ITERS_PERSIST; /* `ITERS_PERSIST */
    else if (tag == caml_hash_variant("LIST_ONLY")) result |= GTK_TREE_MODEL_LIST_ONLY; /* `LIST_ONLY */
    list = Field(list, 1);
  }
  return result;
}

