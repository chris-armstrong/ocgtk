/* GENERATED CODE - DO NOT EDIT */
/* Gdk enum/bitfield converters */

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <glib.h>
#include <gdk/gdk.h>
/* Convert GdkAxisUse to OCaml value */
value Val_GdkAxisUse(GdkAxisUse val) {
  switch (val) {
    case GDK_AXIS_IGNORE: return caml_hash_variant("IGNORE"); /* `IGNORE */
    case GDK_AXIS_X: return caml_hash_variant("X"); /* `X */
    case GDK_AXIS_Y: return caml_hash_variant("Y"); /* `Y */
    case GDK_AXIS_DELTA_X: return caml_hash_variant("DELTA_X"); /* `DELTA_X */
    case GDK_AXIS_DELTA_Y: return caml_hash_variant("DELTA_Y"); /* `DELTA_Y */
    case GDK_AXIS_PRESSURE: return caml_hash_variant("PRESSURE"); /* `PRESSURE */
    case GDK_AXIS_XTILT: return caml_hash_variant("XTILT"); /* `XTILT */
    case GDK_AXIS_YTILT: return caml_hash_variant("YTILT"); /* `YTILT */
    case GDK_AXIS_WHEEL: return caml_hash_variant("WHEEL"); /* `WHEEL */
    case GDK_AXIS_DISTANCE: return caml_hash_variant("DISTANCE"); /* `DISTANCE */
    case GDK_AXIS_ROTATION: return caml_hash_variant("ROTATION"); /* `ROTATION */
    case GDK_AXIS_SLIDER: return caml_hash_variant("SLIDER"); /* `SLIDER */
    case GDK_AXIS_LAST: return caml_hash_variant("LAST"); /* `LAST */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkAxisUse value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkAxisUse */
GdkAxisUse GdkAxisUse_val(value val) {
  if (val == caml_hash_variant("IGNORE")) return GDK_AXIS_IGNORE; /* `IGNORE */
  else if (val == caml_hash_variant("X")) return GDK_AXIS_X; /* `X */
  else if (val == caml_hash_variant("Y")) return GDK_AXIS_Y; /* `Y */
  else if (val == caml_hash_variant("DELTA_X")) return GDK_AXIS_DELTA_X; /* `DELTA_X */
  else if (val == caml_hash_variant("DELTA_Y")) return GDK_AXIS_DELTA_Y; /* `DELTA_Y */
  else if (val == caml_hash_variant("PRESSURE")) return GDK_AXIS_PRESSURE; /* `PRESSURE */
  else if (val == caml_hash_variant("XTILT")) return GDK_AXIS_XTILT; /* `XTILT */
  else if (val == caml_hash_variant("YTILT")) return GDK_AXIS_YTILT; /* `YTILT */
  else if (val == caml_hash_variant("WHEEL")) return GDK_AXIS_WHEEL; /* `WHEEL */
  else if (val == caml_hash_variant("DISTANCE")) return GDK_AXIS_DISTANCE; /* `DISTANCE */
  else if (val == caml_hash_variant("ROTATION")) return GDK_AXIS_ROTATION; /* `ROTATION */
  else if (val == caml_hash_variant("SLIDER")) return GDK_AXIS_SLIDER; /* `SLIDER */
  else if (val == caml_hash_variant("LAST")) return GDK_AXIS_LAST; /* `LAST */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkAxisUse tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkCrossingMode to OCaml value */
value Val_GdkCrossingMode(GdkCrossingMode val) {
  switch (val) {
    case GDK_CROSSING_NORMAL: return caml_hash_variant("NORMAL"); /* `NORMAL */
    case GDK_CROSSING_GRAB: return caml_hash_variant("GRAB"); /* `GRAB */
    case GDK_CROSSING_UNGRAB: return caml_hash_variant("UNGRAB"); /* `UNGRAB */
    case GDK_CROSSING_GTK_GRAB: return caml_hash_variant("GTK_GRAB"); /* `GTK_GRAB */
    case GDK_CROSSING_GTK_UNGRAB: return caml_hash_variant("GTK_UNGRAB"); /* `GTK_UNGRAB */
    case GDK_CROSSING_STATE_CHANGED: return caml_hash_variant("STATE_CHANGED"); /* `STATE_CHANGED */
    case GDK_CROSSING_TOUCH_BEGIN: return caml_hash_variant("TOUCH_BEGIN"); /* `TOUCH_BEGIN */
    case GDK_CROSSING_TOUCH_END: return caml_hash_variant("TOUCH_END"); /* `TOUCH_END */
    case GDK_CROSSING_DEVICE_SWITCH: return caml_hash_variant("DEVICE_SWITCH"); /* `DEVICE_SWITCH */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkCrossingMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkCrossingMode */
GdkCrossingMode GdkCrossingMode_val(value val) {
  if (val == caml_hash_variant("NORMAL")) return GDK_CROSSING_NORMAL; /* `NORMAL */
  else if (val == caml_hash_variant("GRAB")) return GDK_CROSSING_GRAB; /* `GRAB */
  else if (val == caml_hash_variant("UNGRAB")) return GDK_CROSSING_UNGRAB; /* `UNGRAB */
  else if (val == caml_hash_variant("GTK_GRAB")) return GDK_CROSSING_GTK_GRAB; /* `GTK_GRAB */
  else if (val == caml_hash_variant("GTK_UNGRAB")) return GDK_CROSSING_GTK_UNGRAB; /* `GTK_UNGRAB */
  else if (val == caml_hash_variant("STATE_CHANGED")) return GDK_CROSSING_STATE_CHANGED; /* `STATE_CHANGED */
  else if (val == caml_hash_variant("TOUCH_BEGIN")) return GDK_CROSSING_TOUCH_BEGIN; /* `TOUCH_BEGIN */
  else if (val == caml_hash_variant("TOUCH_END")) return GDK_CROSSING_TOUCH_END; /* `TOUCH_END */
  else if (val == caml_hash_variant("DEVICE_SWITCH")) return GDK_CROSSING_DEVICE_SWITCH; /* `DEVICE_SWITCH */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkCrossingMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkDevicePadFeature to OCaml value */
value Val_GdkDevicePadFeature(GdkDevicePadFeature val) {
  switch (val) {
    case GDK_DEVICE_PAD_FEATURE_BUTTON: return caml_hash_variant("BUTTON"); /* `BUTTON */
    case GDK_DEVICE_PAD_FEATURE_RING: return caml_hash_variant("RING"); /* `RING */
    case GDK_DEVICE_PAD_FEATURE_STRIP: return caml_hash_variant("STRIP"); /* `STRIP */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkDevicePadFeature value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkDevicePadFeature */
GdkDevicePadFeature GdkDevicePadFeature_val(value val) {
  if (val == caml_hash_variant("BUTTON")) return GDK_DEVICE_PAD_FEATURE_BUTTON; /* `BUTTON */
  else if (val == caml_hash_variant("RING")) return GDK_DEVICE_PAD_FEATURE_RING; /* `RING */
  else if (val == caml_hash_variant("STRIP")) return GDK_DEVICE_PAD_FEATURE_STRIP; /* `STRIP */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkDevicePadFeature tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkDeviceToolType to OCaml value */
value Val_GdkDeviceToolType(GdkDeviceToolType val) {
  switch (val) {
    case GDK_DEVICE_TOOL_TYPE_UNKNOWN: return caml_hash_variant("UNKNOWN"); /* `UNKNOWN */
    case GDK_DEVICE_TOOL_TYPE_PEN: return caml_hash_variant("PEN"); /* `PEN */
    case GDK_DEVICE_TOOL_TYPE_ERASER: return caml_hash_variant("ERASER"); /* `ERASER */
    case GDK_DEVICE_TOOL_TYPE_BRUSH: return caml_hash_variant("BRUSH"); /* `BRUSH */
    case GDK_DEVICE_TOOL_TYPE_PENCIL: return caml_hash_variant("PENCIL"); /* `PENCIL */
    case GDK_DEVICE_TOOL_TYPE_AIRBRUSH: return caml_hash_variant("AIRBRUSH"); /* `AIRBRUSH */
    case GDK_DEVICE_TOOL_TYPE_MOUSE: return caml_hash_variant("MOUSE"); /* `MOUSE */
    case GDK_DEVICE_TOOL_TYPE_LENS: return caml_hash_variant("LENS"); /* `LENS */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkDeviceToolType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkDeviceToolType */
GdkDeviceToolType GdkDeviceToolType_val(value val) {
  if (val == caml_hash_variant("UNKNOWN")) return GDK_DEVICE_TOOL_TYPE_UNKNOWN; /* `UNKNOWN */
  else if (val == caml_hash_variant("PEN")) return GDK_DEVICE_TOOL_TYPE_PEN; /* `PEN */
  else if (val == caml_hash_variant("ERASER")) return GDK_DEVICE_TOOL_TYPE_ERASER; /* `ERASER */
  else if (val == caml_hash_variant("BRUSH")) return GDK_DEVICE_TOOL_TYPE_BRUSH; /* `BRUSH */
  else if (val == caml_hash_variant("PENCIL")) return GDK_DEVICE_TOOL_TYPE_PENCIL; /* `PENCIL */
  else if (val == caml_hash_variant("AIRBRUSH")) return GDK_DEVICE_TOOL_TYPE_AIRBRUSH; /* `AIRBRUSH */
  else if (val == caml_hash_variant("MOUSE")) return GDK_DEVICE_TOOL_TYPE_MOUSE; /* `MOUSE */
  else if (val == caml_hash_variant("LENS")) return GDK_DEVICE_TOOL_TYPE_LENS; /* `LENS */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkDeviceToolType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkDmabufError to OCaml value */
value Val_GdkDmabufError(GdkDmabufError val) {
  switch (val) {
    case GDK_DMABUF_ERROR_NOT_AVAILABLE: return caml_hash_variant("NOT_AVAILABLE"); /* `NOT_AVAILABLE */
    case GDK_DMABUF_ERROR_UNSUPPORTED_FORMAT: return caml_hash_variant("UNSUPPORTED_FORMAT"); /* `UNSUPPORTED_FORMAT */
    case GDK_DMABUF_ERROR_CREATION_FAILED: return caml_hash_variant("CREATION_FAILED"); /* `CREATION_FAILED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkDmabufError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkDmabufError */
GdkDmabufError GdkDmabufError_val(value val) {
  if (val == caml_hash_variant("NOT_AVAILABLE")) return GDK_DMABUF_ERROR_NOT_AVAILABLE; /* `NOT_AVAILABLE */
  else if (val == caml_hash_variant("UNSUPPORTED_FORMAT")) return GDK_DMABUF_ERROR_UNSUPPORTED_FORMAT; /* `UNSUPPORTED_FORMAT */
  else if (val == caml_hash_variant("CREATION_FAILED")) return GDK_DMABUF_ERROR_CREATION_FAILED; /* `CREATION_FAILED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkDmabufError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkDragCancelReason to OCaml value */
value Val_GdkDragCancelReason(GdkDragCancelReason val) {
  switch (val) {
    case GDK_DRAG_CANCEL_NO_TARGET: return caml_hash_variant("NO_TARGET"); /* `NO_TARGET */
    case GDK_DRAG_CANCEL_USER_CANCELLED: return caml_hash_variant("USER_CANCELLED"); /* `USER_CANCELLED */
    case GDK_DRAG_CANCEL_ERROR: return caml_hash_variant("ERROR"); /* `ERROR */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkDragCancelReason value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkDragCancelReason */
GdkDragCancelReason GdkDragCancelReason_val(value val) {
  if (val == caml_hash_variant("NO_TARGET")) return GDK_DRAG_CANCEL_NO_TARGET; /* `NO_TARGET */
  else if (val == caml_hash_variant("USER_CANCELLED")) return GDK_DRAG_CANCEL_USER_CANCELLED; /* `USER_CANCELLED */
  else if (val == caml_hash_variant("ERROR")) return GDK_DRAG_CANCEL_ERROR; /* `ERROR */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkDragCancelReason tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkEventType to OCaml value */
value Val_GdkEventType(GdkEventType val) {
  switch (val) {
    case GDK_DELETE: return caml_hash_variant("DELETE"); /* `DELETE */
    case GDK_MOTION_NOTIFY: return caml_hash_variant("MOTION_NOTIFY"); /* `MOTION_NOTIFY */
    case GDK_BUTTON_PRESS: return caml_hash_variant("BUTTON_PRESS"); /* `BUTTON_PRESS */
    case GDK_BUTTON_RELEASE: return caml_hash_variant("BUTTON_RELEASE"); /* `BUTTON_RELEASE */
    case GDK_KEY_PRESS: return caml_hash_variant("KEY_PRESS"); /* `KEY_PRESS */
    case GDK_KEY_RELEASE: return caml_hash_variant("KEY_RELEASE"); /* `KEY_RELEASE */
    case GDK_ENTER_NOTIFY: return caml_hash_variant("ENTER_NOTIFY"); /* `ENTER_NOTIFY */
    case GDK_LEAVE_NOTIFY: return caml_hash_variant("LEAVE_NOTIFY"); /* `LEAVE_NOTIFY */
    case GDK_FOCUS_CHANGE: return caml_hash_variant("FOCUS_CHANGE"); /* `FOCUS_CHANGE */
    case GDK_PROXIMITY_IN: return caml_hash_variant("PROXIMITY_IN"); /* `PROXIMITY_IN */
    case GDK_PROXIMITY_OUT: return caml_hash_variant("PROXIMITY_OUT"); /* `PROXIMITY_OUT */
    case GDK_DRAG_ENTER: return caml_hash_variant("DRAG_ENTER"); /* `DRAG_ENTER */
    case GDK_DRAG_LEAVE: return caml_hash_variant("DRAG_LEAVE"); /* `DRAG_LEAVE */
    case GDK_DRAG_MOTION: return caml_hash_variant("DRAG_MOTION"); /* `DRAG_MOTION */
    case GDK_DROP_START: return caml_hash_variant("DROP_START"); /* `DROP_START */
    case GDK_SCROLL: return caml_hash_variant("SCROLL"); /* `SCROLL */
    case GDK_GRAB_BROKEN: return caml_hash_variant("GRAB_BROKEN"); /* `GRAB_BROKEN */
    case GDK_TOUCH_BEGIN: return caml_hash_variant("TOUCH_BEGIN"); /* `TOUCH_BEGIN */
    case GDK_TOUCH_UPDATE: return caml_hash_variant("TOUCH_UPDATE"); /* `TOUCH_UPDATE */
    case GDK_TOUCH_END: return caml_hash_variant("TOUCH_END"); /* `TOUCH_END */
    case GDK_TOUCH_CANCEL: return caml_hash_variant("TOUCH_CANCEL"); /* `TOUCH_CANCEL */
    case GDK_TOUCHPAD_SWIPE: return caml_hash_variant("TOUCHPAD_SWIPE"); /* `TOUCHPAD_SWIPE */
    case GDK_TOUCHPAD_PINCH: return caml_hash_variant("TOUCHPAD_PINCH"); /* `TOUCHPAD_PINCH */
    case GDK_PAD_BUTTON_PRESS: return caml_hash_variant("PAD_BUTTON_PRESS"); /* `PAD_BUTTON_PRESS */
    case GDK_PAD_BUTTON_RELEASE: return caml_hash_variant("PAD_BUTTON_RELEASE"); /* `PAD_BUTTON_RELEASE */
    case GDK_PAD_RING: return caml_hash_variant("PAD_RING"); /* `PAD_RING */
    case GDK_PAD_STRIP: return caml_hash_variant("PAD_STRIP"); /* `PAD_STRIP */
    case GDK_PAD_GROUP_MODE: return caml_hash_variant("PAD_GROUP_MODE"); /* `PAD_GROUP_MODE */
    case GDK_TOUCHPAD_HOLD: return caml_hash_variant("TOUCHPAD_HOLD"); /* `TOUCHPAD_HOLD */
    case GDK_EVENT_LAST: return caml_hash_variant("EVENT_LAST"); /* `EVENT_LAST */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkEventType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkEventType */
GdkEventType GdkEventType_val(value val) {
  if (val == caml_hash_variant("DELETE")) return GDK_DELETE; /* `DELETE */
  else if (val == caml_hash_variant("MOTION_NOTIFY")) return GDK_MOTION_NOTIFY; /* `MOTION_NOTIFY */
  else if (val == caml_hash_variant("BUTTON_PRESS")) return GDK_BUTTON_PRESS; /* `BUTTON_PRESS */
  else if (val == caml_hash_variant("BUTTON_RELEASE")) return GDK_BUTTON_RELEASE; /* `BUTTON_RELEASE */
  else if (val == caml_hash_variant("KEY_PRESS")) return GDK_KEY_PRESS; /* `KEY_PRESS */
  else if (val == caml_hash_variant("KEY_RELEASE")) return GDK_KEY_RELEASE; /* `KEY_RELEASE */
  else if (val == caml_hash_variant("ENTER_NOTIFY")) return GDK_ENTER_NOTIFY; /* `ENTER_NOTIFY */
  else if (val == caml_hash_variant("LEAVE_NOTIFY")) return GDK_LEAVE_NOTIFY; /* `LEAVE_NOTIFY */
  else if (val == caml_hash_variant("FOCUS_CHANGE")) return GDK_FOCUS_CHANGE; /* `FOCUS_CHANGE */
  else if (val == caml_hash_variant("PROXIMITY_IN")) return GDK_PROXIMITY_IN; /* `PROXIMITY_IN */
  else if (val == caml_hash_variant("PROXIMITY_OUT")) return GDK_PROXIMITY_OUT; /* `PROXIMITY_OUT */
  else if (val == caml_hash_variant("DRAG_ENTER")) return GDK_DRAG_ENTER; /* `DRAG_ENTER */
  else if (val == caml_hash_variant("DRAG_LEAVE")) return GDK_DRAG_LEAVE; /* `DRAG_LEAVE */
  else if (val == caml_hash_variant("DRAG_MOTION")) return GDK_DRAG_MOTION; /* `DRAG_MOTION */
  else if (val == caml_hash_variant("DROP_START")) return GDK_DROP_START; /* `DROP_START */
  else if (val == caml_hash_variant("SCROLL")) return GDK_SCROLL; /* `SCROLL */
  else if (val == caml_hash_variant("GRAB_BROKEN")) return GDK_GRAB_BROKEN; /* `GRAB_BROKEN */
  else if (val == caml_hash_variant("TOUCH_BEGIN")) return GDK_TOUCH_BEGIN; /* `TOUCH_BEGIN */
  else if (val == caml_hash_variant("TOUCH_UPDATE")) return GDK_TOUCH_UPDATE; /* `TOUCH_UPDATE */
  else if (val == caml_hash_variant("TOUCH_END")) return GDK_TOUCH_END; /* `TOUCH_END */
  else if (val == caml_hash_variant("TOUCH_CANCEL")) return GDK_TOUCH_CANCEL; /* `TOUCH_CANCEL */
  else if (val == caml_hash_variant("TOUCHPAD_SWIPE")) return GDK_TOUCHPAD_SWIPE; /* `TOUCHPAD_SWIPE */
  else if (val == caml_hash_variant("TOUCHPAD_PINCH")) return GDK_TOUCHPAD_PINCH; /* `TOUCHPAD_PINCH */
  else if (val == caml_hash_variant("PAD_BUTTON_PRESS")) return GDK_PAD_BUTTON_PRESS; /* `PAD_BUTTON_PRESS */
  else if (val == caml_hash_variant("PAD_BUTTON_RELEASE")) return GDK_PAD_BUTTON_RELEASE; /* `PAD_BUTTON_RELEASE */
  else if (val == caml_hash_variant("PAD_RING")) return GDK_PAD_RING; /* `PAD_RING */
  else if (val == caml_hash_variant("PAD_STRIP")) return GDK_PAD_STRIP; /* `PAD_STRIP */
  else if (val == caml_hash_variant("PAD_GROUP_MODE")) return GDK_PAD_GROUP_MODE; /* `PAD_GROUP_MODE */
  else if (val == caml_hash_variant("TOUCHPAD_HOLD")) return GDK_TOUCHPAD_HOLD; /* `TOUCHPAD_HOLD */
  else if (val == caml_hash_variant("EVENT_LAST")) return GDK_EVENT_LAST; /* `EVENT_LAST */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkEventType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkFullscreenMode to OCaml value */
value Val_GdkFullscreenMode(GdkFullscreenMode val) {
  switch (val) {
    case GDK_FULLSCREEN_ON_CURRENT_MONITOR: return caml_hash_variant("CURRENT_MONITOR"); /* `CURRENT_MONITOR */
    case GDK_FULLSCREEN_ON_ALL_MONITORS: return caml_hash_variant("ALL_MONITORS"); /* `ALL_MONITORS */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkFullscreenMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkFullscreenMode */
GdkFullscreenMode GdkFullscreenMode_val(value val) {
  if (val == caml_hash_variant("CURRENT_MONITOR")) return GDK_FULLSCREEN_ON_CURRENT_MONITOR; /* `CURRENT_MONITOR */
  else if (val == caml_hash_variant("ALL_MONITORS")) return GDK_FULLSCREEN_ON_ALL_MONITORS; /* `ALL_MONITORS */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkFullscreenMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkGLError to OCaml value */
value Val_GdkGLError(GdkGLError val) {
  switch (val) {
    case GDK_GL_ERROR_NOT_AVAILABLE: return caml_hash_variant("NOT_AVAILABLE"); /* `NOT_AVAILABLE */
    case GDK_GL_ERROR_UNSUPPORTED_FORMAT: return caml_hash_variant("UNSUPPORTED_FORMAT"); /* `UNSUPPORTED_FORMAT */
    case GDK_GL_ERROR_UNSUPPORTED_PROFILE: return caml_hash_variant("UNSUPPORTED_PROFILE"); /* `UNSUPPORTED_PROFILE */
    case GDK_GL_ERROR_COMPILATION_FAILED: return caml_hash_variant("COMPILATION_FAILED"); /* `COMPILATION_FAILED */
    case GDK_GL_ERROR_LINK_FAILED: return caml_hash_variant("LINK_FAILED"); /* `LINK_FAILED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkGLError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkGLError */
GdkGLError GdkGLError_val(value val) {
  if (val == caml_hash_variant("NOT_AVAILABLE")) return GDK_GL_ERROR_NOT_AVAILABLE; /* `NOT_AVAILABLE */
  else if (val == caml_hash_variant("UNSUPPORTED_FORMAT")) return GDK_GL_ERROR_UNSUPPORTED_FORMAT; /* `UNSUPPORTED_FORMAT */
  else if (val == caml_hash_variant("UNSUPPORTED_PROFILE")) return GDK_GL_ERROR_UNSUPPORTED_PROFILE; /* `UNSUPPORTED_PROFILE */
  else if (val == caml_hash_variant("COMPILATION_FAILED")) return GDK_GL_ERROR_COMPILATION_FAILED; /* `COMPILATION_FAILED */
  else if (val == caml_hash_variant("LINK_FAILED")) return GDK_GL_ERROR_LINK_FAILED; /* `LINK_FAILED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkGLError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkGravity to OCaml value */
value Val_GdkGravity(GdkGravity val) {
  switch (val) {
    case GDK_GRAVITY_NORTH_WEST: return caml_hash_variant("NORTH_WEST"); /* `NORTH_WEST */
    case GDK_GRAVITY_NORTH: return caml_hash_variant("NORTH"); /* `NORTH */
    case GDK_GRAVITY_NORTH_EAST: return caml_hash_variant("NORTH_EAST"); /* `NORTH_EAST */
    case GDK_GRAVITY_WEST: return caml_hash_variant("WEST"); /* `WEST */
    case GDK_GRAVITY_CENTER: return caml_hash_variant("CENTER"); /* `CENTER */
    case GDK_GRAVITY_EAST: return caml_hash_variant("EAST"); /* `EAST */
    case GDK_GRAVITY_SOUTH_WEST: return caml_hash_variant("SOUTH_WEST"); /* `SOUTH_WEST */
    case GDK_GRAVITY_SOUTH: return caml_hash_variant("SOUTH"); /* `SOUTH */
    case GDK_GRAVITY_SOUTH_EAST: return caml_hash_variant("SOUTH_EAST"); /* `SOUTH_EAST */
    case GDK_GRAVITY_STATIC: return caml_hash_variant("STATIC"); /* `STATIC */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkGravity value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkGravity */
GdkGravity GdkGravity_val(value val) {
  if (val == caml_hash_variant("NORTH_WEST")) return GDK_GRAVITY_NORTH_WEST; /* `NORTH_WEST */
  else if (val == caml_hash_variant("NORTH")) return GDK_GRAVITY_NORTH; /* `NORTH */
  else if (val == caml_hash_variant("NORTH_EAST")) return GDK_GRAVITY_NORTH_EAST; /* `NORTH_EAST */
  else if (val == caml_hash_variant("WEST")) return GDK_GRAVITY_WEST; /* `WEST */
  else if (val == caml_hash_variant("CENTER")) return GDK_GRAVITY_CENTER; /* `CENTER */
  else if (val == caml_hash_variant("EAST")) return GDK_GRAVITY_EAST; /* `EAST */
  else if (val == caml_hash_variant("SOUTH_WEST")) return GDK_GRAVITY_SOUTH_WEST; /* `SOUTH_WEST */
  else if (val == caml_hash_variant("SOUTH")) return GDK_GRAVITY_SOUTH; /* `SOUTH */
  else if (val == caml_hash_variant("SOUTH_EAST")) return GDK_GRAVITY_SOUTH_EAST; /* `SOUTH_EAST */
  else if (val == caml_hash_variant("STATIC")) return GDK_GRAVITY_STATIC; /* `STATIC */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkGravity tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkInputSource to OCaml value */
value Val_GdkInputSource(GdkInputSource val) {
  switch (val) {
    case GDK_SOURCE_MOUSE: return caml_hash_variant("MOUSE"); /* `MOUSE */
    case GDK_SOURCE_PEN: return caml_hash_variant("PEN"); /* `PEN */
    case GDK_SOURCE_KEYBOARD: return caml_hash_variant("KEYBOARD"); /* `KEYBOARD */
    case GDK_SOURCE_TOUCHSCREEN: return caml_hash_variant("TOUCHSCREEN"); /* `TOUCHSCREEN */
    case GDK_SOURCE_TOUCHPAD: return caml_hash_variant("TOUCHPAD"); /* `TOUCHPAD */
    case GDK_SOURCE_TRACKPOINT: return caml_hash_variant("TRACKPOINT"); /* `TRACKPOINT */
    case GDK_SOURCE_TABLET_PAD: return caml_hash_variant("TABLET_PAD"); /* `TABLET_PAD */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkInputSource value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkInputSource */
GdkInputSource GdkInputSource_val(value val) {
  if (val == caml_hash_variant("MOUSE")) return GDK_SOURCE_MOUSE; /* `MOUSE */
  else if (val == caml_hash_variant("PEN")) return GDK_SOURCE_PEN; /* `PEN */
  else if (val == caml_hash_variant("KEYBOARD")) return GDK_SOURCE_KEYBOARD; /* `KEYBOARD */
  else if (val == caml_hash_variant("TOUCHSCREEN")) return GDK_SOURCE_TOUCHSCREEN; /* `TOUCHSCREEN */
  else if (val == caml_hash_variant("TOUCHPAD")) return GDK_SOURCE_TOUCHPAD; /* `TOUCHPAD */
  else if (val == caml_hash_variant("TRACKPOINT")) return GDK_SOURCE_TRACKPOINT; /* `TRACKPOINT */
  else if (val == caml_hash_variant("TABLET_PAD")) return GDK_SOURCE_TABLET_PAD; /* `TABLET_PAD */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkInputSource tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkKeyMatch to OCaml value */
value Val_GdkKeyMatch(GdkKeyMatch val) {
  switch (val) {
    case GDK_KEY_MATCH_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GDK_KEY_MATCH_PARTIAL: return caml_hash_variant("PARTIAL"); /* `PARTIAL */
    case GDK_KEY_MATCH_EXACT: return caml_hash_variant("EXACT"); /* `EXACT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkKeyMatch value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkKeyMatch */
GdkKeyMatch GdkKeyMatch_val(value val) {
  if (val == caml_hash_variant("NONE")) return GDK_KEY_MATCH_NONE; /* `NONE */
  else if (val == caml_hash_variant("PARTIAL")) return GDK_KEY_MATCH_PARTIAL; /* `PARTIAL */
  else if (val == caml_hash_variant("EXACT")) return GDK_KEY_MATCH_EXACT; /* `EXACT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkKeyMatch tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkMemoryFormat to OCaml value */
value Val_GdkMemoryFormat(GdkMemoryFormat val) {
  switch (val) {
    case GDK_MEMORY_B8G8R8A8_PREMULTIPLIED: return caml_hash_variant("B8G8R8A8_PREMULTIPLIED"); /* `B8G8R8A8_PREMULTIPLIED */
    case GDK_MEMORY_A8R8G8B8_PREMULTIPLIED: return caml_hash_variant("A8R8G8B8_PREMULTIPLIED"); /* `A8R8G8B8_PREMULTIPLIED */
    case GDK_MEMORY_R8G8B8A8_PREMULTIPLIED: return caml_hash_variant("R8G8B8A8_PREMULTIPLIED"); /* `R8G8B8A8_PREMULTIPLIED */
    case GDK_MEMORY_B8G8R8A8: return caml_hash_variant("B8G8R8A8"); /* `B8G8R8A8 */
    case GDK_MEMORY_A8R8G8B8: return caml_hash_variant("A8R8G8B8"); /* `A8R8G8B8 */
    case GDK_MEMORY_R8G8B8A8: return caml_hash_variant("R8G8B8A8"); /* `R8G8B8A8 */
    case GDK_MEMORY_A8B8G8R8: return caml_hash_variant("A8B8G8R8"); /* `A8B8G8R8 */
    case GDK_MEMORY_R8G8B8: return caml_hash_variant("R8G8B8"); /* `R8G8B8 */
    case GDK_MEMORY_B8G8R8: return caml_hash_variant("B8G8R8"); /* `B8G8R8 */
    case GDK_MEMORY_R16G16B16: return caml_hash_variant("R16G16B16"); /* `R16G16B16 */
    case GDK_MEMORY_R16G16B16A16_PREMULTIPLIED: return caml_hash_variant("R16G16B16A16_PREMULTIPLIED"); /* `R16G16B16A16_PREMULTIPLIED */
    case GDK_MEMORY_R16G16B16A16: return caml_hash_variant("R16G16B16A16"); /* `R16G16B16A16 */
    case GDK_MEMORY_R16G16B16_FLOAT: return caml_hash_variant("R16G16B16_FLOAT"); /* `R16G16B16_FLOAT */
    case GDK_MEMORY_R16G16B16A16_FLOAT_PREMULTIPLIED: return caml_hash_variant("R16G16B16A16_FLOAT_PREMULTIPLIED"); /* `R16G16B16A16_FLOAT_PREMULTIPLIED */
    case GDK_MEMORY_R16G16B16A16_FLOAT: return caml_hash_variant("R16G16B16A16_FLOAT"); /* `R16G16B16A16_FLOAT */
    case GDK_MEMORY_R32G32B32_FLOAT: return caml_hash_variant("R32G32B32_FLOAT"); /* `R32G32B32_FLOAT */
    case GDK_MEMORY_R32G32B32A32_FLOAT_PREMULTIPLIED: return caml_hash_variant("R32G32B32A32_FLOAT_PREMULTIPLIED"); /* `R32G32B32A32_FLOAT_PREMULTIPLIED */
    case GDK_MEMORY_R32G32B32A32_FLOAT: return caml_hash_variant("R32G32B32A32_FLOAT"); /* `R32G32B32A32_FLOAT */
    case GDK_MEMORY_G8A8_PREMULTIPLIED: return caml_hash_variant("G8A8_PREMULTIPLIED"); /* `G8A8_PREMULTIPLIED */
    case GDK_MEMORY_G8A8: return caml_hash_variant("G8A8"); /* `G8A8 */
    case GDK_MEMORY_G8: return caml_hash_variant("G8"); /* `G8 */
    case GDK_MEMORY_G16A16_PREMULTIPLIED: return caml_hash_variant("G16A16_PREMULTIPLIED"); /* `G16A16_PREMULTIPLIED */
    case GDK_MEMORY_G16A16: return caml_hash_variant("G16A16"); /* `G16A16 */
    case GDK_MEMORY_G16: return caml_hash_variant("G16"); /* `G16 */
    case GDK_MEMORY_A8: return caml_hash_variant("A8"); /* `A8 */
    case GDK_MEMORY_A16: return caml_hash_variant("A16"); /* `A16 */
    case GDK_MEMORY_A16_FLOAT: return caml_hash_variant("A16_FLOAT"); /* `A16_FLOAT */
    case GDK_MEMORY_A32_FLOAT: return caml_hash_variant("A32_FLOAT"); /* `A32_FLOAT */
    case GDK_MEMORY_A8B8G8R8_PREMULTIPLIED: return caml_hash_variant("A8B8G8R8_PREMULTIPLIED"); /* `A8B8G8R8_PREMULTIPLIED */
    case GDK_MEMORY_B8G8R8X8: return caml_hash_variant("B8G8R8X8"); /* `B8G8R8X8 */
    case GDK_MEMORY_X8R8G8B8: return caml_hash_variant("X8R8G8B8"); /* `X8R8G8B8 */
    case GDK_MEMORY_R8G8B8X8: return caml_hash_variant("R8G8B8X8"); /* `R8G8B8X8 */
    case GDK_MEMORY_X8B8G8R8: return caml_hash_variant("X8B8G8R8"); /* `X8B8G8R8 */
    case GDK_MEMORY_N_FORMATS: return caml_hash_variant("N_FORMATS"); /* `N_FORMATS */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkMemoryFormat value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkMemoryFormat */
GdkMemoryFormat GdkMemoryFormat_val(value val) {
  if (val == caml_hash_variant("B8G8R8A8_PREMULTIPLIED")) return GDK_MEMORY_B8G8R8A8_PREMULTIPLIED; /* `B8G8R8A8_PREMULTIPLIED */
  else if (val == caml_hash_variant("A8R8G8B8_PREMULTIPLIED")) return GDK_MEMORY_A8R8G8B8_PREMULTIPLIED; /* `A8R8G8B8_PREMULTIPLIED */
  else if (val == caml_hash_variant("R8G8B8A8_PREMULTIPLIED")) return GDK_MEMORY_R8G8B8A8_PREMULTIPLIED; /* `R8G8B8A8_PREMULTIPLIED */
  else if (val == caml_hash_variant("B8G8R8A8")) return GDK_MEMORY_B8G8R8A8; /* `B8G8R8A8 */
  else if (val == caml_hash_variant("A8R8G8B8")) return GDK_MEMORY_A8R8G8B8; /* `A8R8G8B8 */
  else if (val == caml_hash_variant("R8G8B8A8")) return GDK_MEMORY_R8G8B8A8; /* `R8G8B8A8 */
  else if (val == caml_hash_variant("A8B8G8R8")) return GDK_MEMORY_A8B8G8R8; /* `A8B8G8R8 */
  else if (val == caml_hash_variant("R8G8B8")) return GDK_MEMORY_R8G8B8; /* `R8G8B8 */
  else if (val == caml_hash_variant("B8G8R8")) return GDK_MEMORY_B8G8R8; /* `B8G8R8 */
  else if (val == caml_hash_variant("R16G16B16")) return GDK_MEMORY_R16G16B16; /* `R16G16B16 */
  else if (val == caml_hash_variant("R16G16B16A16_PREMULTIPLIED")) return GDK_MEMORY_R16G16B16A16_PREMULTIPLIED; /* `R16G16B16A16_PREMULTIPLIED */
  else if (val == caml_hash_variant("R16G16B16A16")) return GDK_MEMORY_R16G16B16A16; /* `R16G16B16A16 */
  else if (val == caml_hash_variant("R16G16B16_FLOAT")) return GDK_MEMORY_R16G16B16_FLOAT; /* `R16G16B16_FLOAT */
  else if (val == caml_hash_variant("R16G16B16A16_FLOAT_PREMULTIPLIED")) return GDK_MEMORY_R16G16B16A16_FLOAT_PREMULTIPLIED; /* `R16G16B16A16_FLOAT_PREMULTIPLIED */
  else if (val == caml_hash_variant("R16G16B16A16_FLOAT")) return GDK_MEMORY_R16G16B16A16_FLOAT; /* `R16G16B16A16_FLOAT */
  else if (val == caml_hash_variant("R32G32B32_FLOAT")) return GDK_MEMORY_R32G32B32_FLOAT; /* `R32G32B32_FLOAT */
  else if (val == caml_hash_variant("R32G32B32A32_FLOAT_PREMULTIPLIED")) return GDK_MEMORY_R32G32B32A32_FLOAT_PREMULTIPLIED; /* `R32G32B32A32_FLOAT_PREMULTIPLIED */
  else if (val == caml_hash_variant("R32G32B32A32_FLOAT")) return GDK_MEMORY_R32G32B32A32_FLOAT; /* `R32G32B32A32_FLOAT */
  else if (val == caml_hash_variant("G8A8_PREMULTIPLIED")) return GDK_MEMORY_G8A8_PREMULTIPLIED; /* `G8A8_PREMULTIPLIED */
  else if (val == caml_hash_variant("G8A8")) return GDK_MEMORY_G8A8; /* `G8A8 */
  else if (val == caml_hash_variant("G8")) return GDK_MEMORY_G8; /* `G8 */
  else if (val == caml_hash_variant("G16A16_PREMULTIPLIED")) return GDK_MEMORY_G16A16_PREMULTIPLIED; /* `G16A16_PREMULTIPLIED */
  else if (val == caml_hash_variant("G16A16")) return GDK_MEMORY_G16A16; /* `G16A16 */
  else if (val == caml_hash_variant("G16")) return GDK_MEMORY_G16; /* `G16 */
  else if (val == caml_hash_variant("A8")) return GDK_MEMORY_A8; /* `A8 */
  else if (val == caml_hash_variant("A16")) return GDK_MEMORY_A16; /* `A16 */
  else if (val == caml_hash_variant("A16_FLOAT")) return GDK_MEMORY_A16_FLOAT; /* `A16_FLOAT */
  else if (val == caml_hash_variant("A32_FLOAT")) return GDK_MEMORY_A32_FLOAT; /* `A32_FLOAT */
  else if (val == caml_hash_variant("A8B8G8R8_PREMULTIPLIED")) return GDK_MEMORY_A8B8G8R8_PREMULTIPLIED; /* `A8B8G8R8_PREMULTIPLIED */
  else if (val == caml_hash_variant("B8G8R8X8")) return GDK_MEMORY_B8G8R8X8; /* `B8G8R8X8 */
  else if (val == caml_hash_variant("X8R8G8B8")) return GDK_MEMORY_X8R8G8B8; /* `X8R8G8B8 */
  else if (val == caml_hash_variant("R8G8B8X8")) return GDK_MEMORY_R8G8B8X8; /* `R8G8B8X8 */
  else if (val == caml_hash_variant("X8B8G8R8")) return GDK_MEMORY_X8B8G8R8; /* `X8B8G8R8 */
  else if (val == caml_hash_variant("N_FORMATS")) return GDK_MEMORY_N_FORMATS; /* `N_FORMATS */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkMemoryFormat tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkNotifyType to OCaml value */
value Val_GdkNotifyType(GdkNotifyType val) {
  switch (val) {
    case GDK_NOTIFY_ANCESTOR: return caml_hash_variant("ANCESTOR"); /* `ANCESTOR */
    case GDK_NOTIFY_VIRTUAL: return caml_hash_variant("VIRTUAL"); /* `VIRTUAL */
    case GDK_NOTIFY_INFERIOR: return caml_hash_variant("INFERIOR"); /* `INFERIOR */
    case GDK_NOTIFY_NONLINEAR: return caml_hash_variant("NONLINEAR"); /* `NONLINEAR */
    case GDK_NOTIFY_NONLINEAR_VIRTUAL: return caml_hash_variant("NONLINEAR_VIRTUAL"); /* `NONLINEAR_VIRTUAL */
    case GDK_NOTIFY_UNKNOWN: return caml_hash_variant("UNKNOWN"); /* `UNKNOWN */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkNotifyType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkNotifyType */
GdkNotifyType GdkNotifyType_val(value val) {
  if (val == caml_hash_variant("ANCESTOR")) return GDK_NOTIFY_ANCESTOR; /* `ANCESTOR */
  else if (val == caml_hash_variant("VIRTUAL")) return GDK_NOTIFY_VIRTUAL; /* `VIRTUAL */
  else if (val == caml_hash_variant("INFERIOR")) return GDK_NOTIFY_INFERIOR; /* `INFERIOR */
  else if (val == caml_hash_variant("NONLINEAR")) return GDK_NOTIFY_NONLINEAR; /* `NONLINEAR */
  else if (val == caml_hash_variant("NONLINEAR_VIRTUAL")) return GDK_NOTIFY_NONLINEAR_VIRTUAL; /* `NONLINEAR_VIRTUAL */
  else if (val == caml_hash_variant("UNKNOWN")) return GDK_NOTIFY_UNKNOWN; /* `UNKNOWN */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkNotifyType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkScrollDirection to OCaml value */
value Val_GdkScrollDirection(GdkScrollDirection val) {
  switch (val) {
    case GDK_SCROLL_UP: return caml_hash_variant("UP"); /* `UP */
    case GDK_SCROLL_DOWN: return caml_hash_variant("DOWN"); /* `DOWN */
    case GDK_SCROLL_LEFT: return caml_hash_variant("LEFT"); /* `LEFT */
    case GDK_SCROLL_RIGHT: return caml_hash_variant("RIGHT"); /* `RIGHT */
    case GDK_SCROLL_SMOOTH: return caml_hash_variant("SMOOTH"); /* `SMOOTH */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkScrollDirection value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkScrollDirection */
GdkScrollDirection GdkScrollDirection_val(value val) {
  if (val == caml_hash_variant("UP")) return GDK_SCROLL_UP; /* `UP */
  else if (val == caml_hash_variant("DOWN")) return GDK_SCROLL_DOWN; /* `DOWN */
  else if (val == caml_hash_variant("LEFT")) return GDK_SCROLL_LEFT; /* `LEFT */
  else if (val == caml_hash_variant("RIGHT")) return GDK_SCROLL_RIGHT; /* `RIGHT */
  else if (val == caml_hash_variant("SMOOTH")) return GDK_SCROLL_SMOOTH; /* `SMOOTH */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkScrollDirection tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkScrollUnit to OCaml value */
value Val_GdkScrollUnit(GdkScrollUnit val) {
  switch (val) {
    case GDK_SCROLL_UNIT_WHEEL: return caml_hash_variant("WHEEL"); /* `WHEEL */
    case GDK_SCROLL_UNIT_SURFACE: return caml_hash_variant("SURFACE"); /* `SURFACE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkScrollUnit value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkScrollUnit */
GdkScrollUnit GdkScrollUnit_val(value val) {
  if (val == caml_hash_variant("WHEEL")) return GDK_SCROLL_UNIT_WHEEL; /* `WHEEL */
  else if (val == caml_hash_variant("SURFACE")) return GDK_SCROLL_UNIT_SURFACE; /* `SURFACE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkScrollUnit tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkSubpixelLayout to OCaml value */
value Val_GdkSubpixelLayout(GdkSubpixelLayout val) {
  switch (val) {
    case GDK_SUBPIXEL_LAYOUT_UNKNOWN: return caml_hash_variant("UNKNOWN"); /* `UNKNOWN */
    case GDK_SUBPIXEL_LAYOUT_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GDK_SUBPIXEL_LAYOUT_HORIZONTAL_RGB: return caml_hash_variant("HORIZONTAL_RGB"); /* `HORIZONTAL_RGB */
    case GDK_SUBPIXEL_LAYOUT_HORIZONTAL_BGR: return caml_hash_variant("HORIZONTAL_BGR"); /* `HORIZONTAL_BGR */
    case GDK_SUBPIXEL_LAYOUT_VERTICAL_RGB: return caml_hash_variant("VERTICAL_RGB"); /* `VERTICAL_RGB */
    case GDK_SUBPIXEL_LAYOUT_VERTICAL_BGR: return caml_hash_variant("VERTICAL_BGR"); /* `VERTICAL_BGR */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkSubpixelLayout value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkSubpixelLayout */
GdkSubpixelLayout GdkSubpixelLayout_val(value val) {
  if (val == caml_hash_variant("UNKNOWN")) return GDK_SUBPIXEL_LAYOUT_UNKNOWN; /* `UNKNOWN */
  else if (val == caml_hash_variant("NONE")) return GDK_SUBPIXEL_LAYOUT_NONE; /* `NONE */
  else if (val == caml_hash_variant("HORIZONTAL_RGB")) return GDK_SUBPIXEL_LAYOUT_HORIZONTAL_RGB; /* `HORIZONTAL_RGB */
  else if (val == caml_hash_variant("HORIZONTAL_BGR")) return GDK_SUBPIXEL_LAYOUT_HORIZONTAL_BGR; /* `HORIZONTAL_BGR */
  else if (val == caml_hash_variant("VERTICAL_RGB")) return GDK_SUBPIXEL_LAYOUT_VERTICAL_RGB; /* `VERTICAL_RGB */
  else if (val == caml_hash_variant("VERTICAL_BGR")) return GDK_SUBPIXEL_LAYOUT_VERTICAL_BGR; /* `VERTICAL_BGR */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkSubpixelLayout tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkSurfaceEdge to OCaml value */
value Val_GdkSurfaceEdge(GdkSurfaceEdge val) {
  switch (val) {
    case GDK_SURFACE_EDGE_NORTH_WEST: return caml_hash_variant("NORTH_WEST"); /* `NORTH_WEST */
    case GDK_SURFACE_EDGE_NORTH: return caml_hash_variant("NORTH"); /* `NORTH */
    case GDK_SURFACE_EDGE_NORTH_EAST: return caml_hash_variant("NORTH_EAST"); /* `NORTH_EAST */
    case GDK_SURFACE_EDGE_WEST: return caml_hash_variant("WEST"); /* `WEST */
    case GDK_SURFACE_EDGE_EAST: return caml_hash_variant("EAST"); /* `EAST */
    case GDK_SURFACE_EDGE_SOUTH_WEST: return caml_hash_variant("SOUTH_WEST"); /* `SOUTH_WEST */
    case GDK_SURFACE_EDGE_SOUTH: return caml_hash_variant("SOUTH"); /* `SOUTH */
    case GDK_SURFACE_EDGE_SOUTH_EAST: return caml_hash_variant("SOUTH_EAST"); /* `SOUTH_EAST */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkSurfaceEdge value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkSurfaceEdge */
GdkSurfaceEdge GdkSurfaceEdge_val(value val) {
  if (val == caml_hash_variant("NORTH_WEST")) return GDK_SURFACE_EDGE_NORTH_WEST; /* `NORTH_WEST */
  else if (val == caml_hash_variant("NORTH")) return GDK_SURFACE_EDGE_NORTH; /* `NORTH */
  else if (val == caml_hash_variant("NORTH_EAST")) return GDK_SURFACE_EDGE_NORTH_EAST; /* `NORTH_EAST */
  else if (val == caml_hash_variant("WEST")) return GDK_SURFACE_EDGE_WEST; /* `WEST */
  else if (val == caml_hash_variant("EAST")) return GDK_SURFACE_EDGE_EAST; /* `EAST */
  else if (val == caml_hash_variant("SOUTH_WEST")) return GDK_SURFACE_EDGE_SOUTH_WEST; /* `SOUTH_WEST */
  else if (val == caml_hash_variant("SOUTH")) return GDK_SURFACE_EDGE_SOUTH; /* `SOUTH */
  else if (val == caml_hash_variant("SOUTH_EAST")) return GDK_SURFACE_EDGE_SOUTH_EAST; /* `SOUTH_EAST */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkSurfaceEdge tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkTextureError to OCaml value */
value Val_GdkTextureError(GdkTextureError val) {
  switch (val) {
    case GDK_TEXTURE_ERROR_TOO_LARGE: return caml_hash_variant("TOO_LARGE"); /* `TOO_LARGE */
    case GDK_TEXTURE_ERROR_CORRUPT_IMAGE: return caml_hash_variant("CORRUPT_IMAGE"); /* `CORRUPT_IMAGE */
    case GDK_TEXTURE_ERROR_UNSUPPORTED_CONTENT: return caml_hash_variant("UNSUPPORTED_CONTENT"); /* `UNSUPPORTED_CONTENT */
    case GDK_TEXTURE_ERROR_UNSUPPORTED_FORMAT: return caml_hash_variant("UNSUPPORTED_FORMAT"); /* `UNSUPPORTED_FORMAT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkTextureError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkTextureError */
GdkTextureError GdkTextureError_val(value val) {
  if (val == caml_hash_variant("TOO_LARGE")) return GDK_TEXTURE_ERROR_TOO_LARGE; /* `TOO_LARGE */
  else if (val == caml_hash_variant("CORRUPT_IMAGE")) return GDK_TEXTURE_ERROR_CORRUPT_IMAGE; /* `CORRUPT_IMAGE */
  else if (val == caml_hash_variant("UNSUPPORTED_CONTENT")) return GDK_TEXTURE_ERROR_UNSUPPORTED_CONTENT; /* `UNSUPPORTED_CONTENT */
  else if (val == caml_hash_variant("UNSUPPORTED_FORMAT")) return GDK_TEXTURE_ERROR_UNSUPPORTED_FORMAT; /* `UNSUPPORTED_FORMAT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkTextureError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkTitlebarGesture to OCaml value */
value Val_GdkTitlebarGesture(GdkTitlebarGesture val) {
  switch (val) {
    case GDK_TITLEBAR_GESTURE_DOUBLE_CLICK: return caml_hash_variant("DOUBLE_CLICK"); /* `DOUBLE_CLICK */
    case GDK_TITLEBAR_GESTURE_RIGHT_CLICK: return caml_hash_variant("RIGHT_CLICK"); /* `RIGHT_CLICK */
    case GDK_TITLEBAR_GESTURE_MIDDLE_CLICK: return caml_hash_variant("MIDDLE_CLICK"); /* `MIDDLE_CLICK */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkTitlebarGesture value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkTitlebarGesture */
GdkTitlebarGesture GdkTitlebarGesture_val(value val) {
  if (val == caml_hash_variant("DOUBLE_CLICK")) return GDK_TITLEBAR_GESTURE_DOUBLE_CLICK; /* `DOUBLE_CLICK */
  else if (val == caml_hash_variant("RIGHT_CLICK")) return GDK_TITLEBAR_GESTURE_RIGHT_CLICK; /* `RIGHT_CLICK */
  else if (val == caml_hash_variant("MIDDLE_CLICK")) return GDK_TITLEBAR_GESTURE_MIDDLE_CLICK; /* `MIDDLE_CLICK */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkTitlebarGesture tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkTouchpadGesturePhase to OCaml value */
value Val_GdkTouchpadGesturePhase(GdkTouchpadGesturePhase val) {
  switch (val) {
    case GDK_TOUCHPAD_GESTURE_PHASE_BEGIN: return caml_hash_variant("BEGIN"); /* `BEGIN */
    case GDK_TOUCHPAD_GESTURE_PHASE_UPDATE: return caml_hash_variant("UPDATE"); /* `UPDATE */
    case GDK_TOUCHPAD_GESTURE_PHASE_END: return caml_hash_variant("END"); /* `END */
    case GDK_TOUCHPAD_GESTURE_PHASE_CANCEL: return caml_hash_variant("CANCEL"); /* `CANCEL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkTouchpadGesturePhase value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkTouchpadGesturePhase */
GdkTouchpadGesturePhase GdkTouchpadGesturePhase_val(value val) {
  if (val == caml_hash_variant("BEGIN")) return GDK_TOUCHPAD_GESTURE_PHASE_BEGIN; /* `BEGIN */
  else if (val == caml_hash_variant("UPDATE")) return GDK_TOUCHPAD_GESTURE_PHASE_UPDATE; /* `UPDATE */
  else if (val == caml_hash_variant("END")) return GDK_TOUCHPAD_GESTURE_PHASE_END; /* `END */
  else if (val == caml_hash_variant("CANCEL")) return GDK_TOUCHPAD_GESTURE_PHASE_CANCEL; /* `CANCEL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkTouchpadGesturePhase tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkVulkanError to OCaml value */
value Val_GdkVulkanError(GdkVulkanError val) {
  switch (val) {
    case GDK_VULKAN_ERROR_UNSUPPORTED: return caml_hash_variant("UNSUPPORTED"); /* `UNSUPPORTED */
    case GDK_VULKAN_ERROR_NOT_AVAILABLE: return caml_hash_variant("NOT_AVAILABLE"); /* `NOT_AVAILABLE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkVulkanError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkVulkanError */
GdkVulkanError GdkVulkanError_val(value val) {
  if (val == caml_hash_variant("UNSUPPORTED")) return GDK_VULKAN_ERROR_UNSUPPORTED; /* `UNSUPPORTED */
  else if (val == caml_hash_variant("NOT_AVAILABLE")) return GDK_VULKAN_ERROR_NOT_AVAILABLE; /* `NOT_AVAILABLE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkVulkanError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkAnchorHints to OCaml flag list */
value Val_GdkAnchorHints(GdkAnchorHints flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GDK_ANCHOR_FLIP_X) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FLIP_X"))); /* `FLIP_X */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_FLIP_Y) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FLIP_Y"))); /* `FLIP_Y */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_SLIDE_X) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SLIDE_X"))); /* `SLIDE_X */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_SLIDE_Y) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SLIDE_Y"))); /* `SLIDE_Y */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_RESIZE_X) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("RESIZE_X"))); /* `RESIZE_X */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_RESIZE_Y) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("RESIZE_Y"))); /* `RESIZE_Y */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_FLIP) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FLIP"))); /* `FLIP */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_SLIDE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SLIDE"))); /* `SLIDE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_RESIZE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("RESIZE"))); /* `RESIZE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GdkAnchorHints */
GdkAnchorHints GdkAnchorHints_val(value list) {
  GdkAnchorHints result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("FLIP_X")) result |= GDK_ANCHOR_FLIP_X; /* `FLIP_X */
    else if (tag == caml_hash_variant("FLIP_Y")) result |= GDK_ANCHOR_FLIP_Y; /* `FLIP_Y */
    else if (tag == caml_hash_variant("SLIDE_X")) result |= GDK_ANCHOR_SLIDE_X; /* `SLIDE_X */
    else if (tag == caml_hash_variant("SLIDE_Y")) result |= GDK_ANCHOR_SLIDE_Y; /* `SLIDE_Y */
    else if (tag == caml_hash_variant("RESIZE_X")) result |= GDK_ANCHOR_RESIZE_X; /* `RESIZE_X */
    else if (tag == caml_hash_variant("RESIZE_Y")) result |= GDK_ANCHOR_RESIZE_Y; /* `RESIZE_Y */
    else if (tag == caml_hash_variant("FLIP")) result |= GDK_ANCHOR_FLIP; /* `FLIP */
    else if (tag == caml_hash_variant("SLIDE")) result |= GDK_ANCHOR_SLIDE; /* `SLIDE */
    else if (tag == caml_hash_variant("RESIZE")) result |= GDK_ANCHOR_RESIZE; /* `RESIZE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GdkAxisFlags to OCaml flag list */
value Val_GdkAxisFlags(GdkAxisFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GDK_AXIS_FLAG_X) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("X"))); /* `X */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_Y) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("Y"))); /* `Y */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_DELTA_X) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DELTA_X"))); /* `DELTA_X */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_DELTA_Y) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DELTA_Y"))); /* `DELTA_Y */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_PRESSURE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PRESSURE"))); /* `PRESSURE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_XTILT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("XTILT"))); /* `XTILT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_YTILT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("YTILT"))); /* `YTILT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_WHEEL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("WHEEL"))); /* `WHEEL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_DISTANCE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DISTANCE"))); /* `DISTANCE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_ROTATION) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ROTATION"))); /* `ROTATION */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_SLIDER) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SLIDER"))); /* `SLIDER */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GdkAxisFlags */
GdkAxisFlags GdkAxisFlags_val(value list) {
  GdkAxisFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("X")) result |= GDK_AXIS_FLAG_X; /* `X */
    else if (tag == caml_hash_variant("Y")) result |= GDK_AXIS_FLAG_Y; /* `Y */
    else if (tag == caml_hash_variant("DELTA_X")) result |= GDK_AXIS_FLAG_DELTA_X; /* `DELTA_X */
    else if (tag == caml_hash_variant("DELTA_Y")) result |= GDK_AXIS_FLAG_DELTA_Y; /* `DELTA_Y */
    else if (tag == caml_hash_variant("PRESSURE")) result |= GDK_AXIS_FLAG_PRESSURE; /* `PRESSURE */
    else if (tag == caml_hash_variant("XTILT")) result |= GDK_AXIS_FLAG_XTILT; /* `XTILT */
    else if (tag == caml_hash_variant("YTILT")) result |= GDK_AXIS_FLAG_YTILT; /* `YTILT */
    else if (tag == caml_hash_variant("WHEEL")) result |= GDK_AXIS_FLAG_WHEEL; /* `WHEEL */
    else if (tag == caml_hash_variant("DISTANCE")) result |= GDK_AXIS_FLAG_DISTANCE; /* `DISTANCE */
    else if (tag == caml_hash_variant("ROTATION")) result |= GDK_AXIS_FLAG_ROTATION; /* `ROTATION */
    else if (tag == caml_hash_variant("SLIDER")) result |= GDK_AXIS_FLAG_SLIDER; /* `SLIDER */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GdkDragAction to OCaml flag list */
value Val_GdkDragAction(GdkDragAction flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GDK_ACTION_COPY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("COPY"))); /* `COPY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ACTION_MOVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("MOVE"))); /* `MOVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ACTION_LINK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("LINK"))); /* `LINK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ACTION_ASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ASK"))); /* `ASK */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GdkDragAction */
GdkDragAction GdkDragAction_val(value list) {
  GdkDragAction result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("COPY")) result |= GDK_ACTION_COPY; /* `COPY */
    else if (tag == caml_hash_variant("MOVE")) result |= GDK_ACTION_MOVE; /* `MOVE */
    else if (tag == caml_hash_variant("LINK")) result |= GDK_ACTION_LINK; /* `LINK */
    else if (tag == caml_hash_variant("ASK")) result |= GDK_ACTION_ASK; /* `ASK */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GdkFrameClockPhase to OCaml flag list */
value Val_GdkFrameClockPhase(GdkFrameClockPhase flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GDK_FRAME_CLOCK_PHASE_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_FRAME_CLOCK_PHASE_FLUSH_EVENTS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FLUSH_EVENTS"))); /* `FLUSH_EVENTS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_FRAME_CLOCK_PHASE_BEFORE_PAINT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BEFORE_PAINT"))); /* `BEFORE_PAINT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_FRAME_CLOCK_PHASE_UPDATE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("UPDATE"))); /* `UPDATE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_FRAME_CLOCK_PHASE_LAYOUT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("LAYOUT"))); /* `LAYOUT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_FRAME_CLOCK_PHASE_PAINT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PAINT"))); /* `PAINT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_FRAME_CLOCK_PHASE_RESUME_EVENTS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("RESUME_EVENTS"))); /* `RESUME_EVENTS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_FRAME_CLOCK_PHASE_AFTER_PAINT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("AFTER_PAINT"))); /* `AFTER_PAINT */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GdkFrameClockPhase */
GdkFrameClockPhase GdkFrameClockPhase_val(value list) {
  GdkFrameClockPhase result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= GDK_FRAME_CLOCK_PHASE_NONE; /* `NONE */
    else if (tag == caml_hash_variant("FLUSH_EVENTS")) result |= GDK_FRAME_CLOCK_PHASE_FLUSH_EVENTS; /* `FLUSH_EVENTS */
    else if (tag == caml_hash_variant("BEFORE_PAINT")) result |= GDK_FRAME_CLOCK_PHASE_BEFORE_PAINT; /* `BEFORE_PAINT */
    else if (tag == caml_hash_variant("UPDATE")) result |= GDK_FRAME_CLOCK_PHASE_UPDATE; /* `UPDATE */
    else if (tag == caml_hash_variant("LAYOUT")) result |= GDK_FRAME_CLOCK_PHASE_LAYOUT; /* `LAYOUT */
    else if (tag == caml_hash_variant("PAINT")) result |= GDK_FRAME_CLOCK_PHASE_PAINT; /* `PAINT */
    else if (tag == caml_hash_variant("RESUME_EVENTS")) result |= GDK_FRAME_CLOCK_PHASE_RESUME_EVENTS; /* `RESUME_EVENTS */
    else if (tag == caml_hash_variant("AFTER_PAINT")) result |= GDK_FRAME_CLOCK_PHASE_AFTER_PAINT; /* `AFTER_PAINT */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GdkGLAPI to OCaml flag list */
value Val_GdkGLAPI(GdkGLAPI flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GDK_GL_API_GL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("GL"))); /* `GL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_GL_API_GLES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("GLES"))); /* `GLES */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GdkGLAPI */
GdkGLAPI GdkGLAPI_val(value list) {
  GdkGLAPI result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("GL")) result |= GDK_GL_API_GL; /* `GL */
    else if (tag == caml_hash_variant("GLES")) result |= GDK_GL_API_GLES; /* `GLES */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GdkModifierType to OCaml flag list */
value Val_GdkModifierType(GdkModifierType flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GDK_NO_MODIFIER_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_MODIFIER_MASK"))); /* `NO_MODIFIER_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SHIFT_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SHIFT_MASK"))); /* `SHIFT_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_LOCK_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("LOCK_MASK"))); /* `LOCK_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_CONTROL_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CONTROL_MASK"))); /* `CONTROL_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ALT_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ALT_MASK"))); /* `ALT_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_BUTTON1_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BUTTON1_MASK"))); /* `BUTTON1_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_BUTTON2_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BUTTON2_MASK"))); /* `BUTTON2_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_BUTTON3_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BUTTON3_MASK"))); /* `BUTTON3_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_BUTTON4_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BUTTON4_MASK"))); /* `BUTTON4_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_BUTTON5_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BUTTON5_MASK"))); /* `BUTTON5_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SUPER_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SUPER_MASK"))); /* `SUPER_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_HYPER_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("HYPER_MASK"))); /* `HYPER_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_META_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("META_MASK"))); /* `META_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GdkModifierType */
GdkModifierType GdkModifierType_val(value list) {
  GdkModifierType result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NO_MODIFIER_MASK")) result |= GDK_NO_MODIFIER_MASK; /* `NO_MODIFIER_MASK */
    else if (tag == caml_hash_variant("SHIFT_MASK")) result |= GDK_SHIFT_MASK; /* `SHIFT_MASK */
    else if (tag == caml_hash_variant("LOCK_MASK")) result |= GDK_LOCK_MASK; /* `LOCK_MASK */
    else if (tag == caml_hash_variant("CONTROL_MASK")) result |= GDK_CONTROL_MASK; /* `CONTROL_MASK */
    else if (tag == caml_hash_variant("ALT_MASK")) result |= GDK_ALT_MASK; /* `ALT_MASK */
    else if (tag == caml_hash_variant("BUTTON1_MASK")) result |= GDK_BUTTON1_MASK; /* `BUTTON1_MASK */
    else if (tag == caml_hash_variant("BUTTON2_MASK")) result |= GDK_BUTTON2_MASK; /* `BUTTON2_MASK */
    else if (tag == caml_hash_variant("BUTTON3_MASK")) result |= GDK_BUTTON3_MASK; /* `BUTTON3_MASK */
    else if (tag == caml_hash_variant("BUTTON4_MASK")) result |= GDK_BUTTON4_MASK; /* `BUTTON4_MASK */
    else if (tag == caml_hash_variant("BUTTON5_MASK")) result |= GDK_BUTTON5_MASK; /* `BUTTON5_MASK */
    else if (tag == caml_hash_variant("SUPER_MASK")) result |= GDK_SUPER_MASK; /* `SUPER_MASK */
    else if (tag == caml_hash_variant("HYPER_MASK")) result |= GDK_HYPER_MASK; /* `HYPER_MASK */
    else if (tag == caml_hash_variant("META_MASK")) result |= GDK_META_MASK; /* `META_MASK */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GdkPaintableFlags to OCaml flag list */
value Val_GdkPaintableFlags(GdkPaintableFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GDK_PAINTABLE_STATIC_SIZE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SIZE"))); /* `SIZE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_PAINTABLE_STATIC_CONTENTS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CONTENTS"))); /* `CONTENTS */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GdkPaintableFlags */
GdkPaintableFlags GdkPaintableFlags_val(value list) {
  GdkPaintableFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("SIZE")) result |= GDK_PAINTABLE_STATIC_SIZE; /* `SIZE */
    else if (tag == caml_hash_variant("CONTENTS")) result |= GDK_PAINTABLE_STATIC_CONTENTS; /* `CONTENTS */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GdkSeatCapabilities to OCaml flag list */
value Val_GdkSeatCapabilities(GdkSeatCapabilities flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GDK_SEAT_CAPABILITY_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SEAT_CAPABILITY_POINTER) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("POINTER"))); /* `POINTER */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SEAT_CAPABILITY_TOUCH) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("TOUCH"))); /* `TOUCH */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SEAT_CAPABILITY_TABLET_STYLUS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("TABLET_STYLUS"))); /* `TABLET_STYLUS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SEAT_CAPABILITY_KEYBOARD) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("KEYBOARD"))); /* `KEYBOARD */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SEAT_CAPABILITY_TABLET_PAD) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("TABLET_PAD"))); /* `TABLET_PAD */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SEAT_CAPABILITY_ALL_POINTING) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ALL_POINTING"))); /* `ALL_POINTING */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SEAT_CAPABILITY_ALL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ALL"))); /* `ALL */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GdkSeatCapabilities */
GdkSeatCapabilities GdkSeatCapabilities_val(value list) {
  GdkSeatCapabilities result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= GDK_SEAT_CAPABILITY_NONE; /* `NONE */
    else if (tag == caml_hash_variant("POINTER")) result |= GDK_SEAT_CAPABILITY_POINTER; /* `POINTER */
    else if (tag == caml_hash_variant("TOUCH")) result |= GDK_SEAT_CAPABILITY_TOUCH; /* `TOUCH */
    else if (tag == caml_hash_variant("TABLET_STYLUS")) result |= GDK_SEAT_CAPABILITY_TABLET_STYLUS; /* `TABLET_STYLUS */
    else if (tag == caml_hash_variant("KEYBOARD")) result |= GDK_SEAT_CAPABILITY_KEYBOARD; /* `KEYBOARD */
    else if (tag == caml_hash_variant("TABLET_PAD")) result |= GDK_SEAT_CAPABILITY_TABLET_PAD; /* `TABLET_PAD */
    else if (tag == caml_hash_variant("ALL_POINTING")) result |= GDK_SEAT_CAPABILITY_ALL_POINTING; /* `ALL_POINTING */
    else if (tag == caml_hash_variant("ALL")) result |= GDK_SEAT_CAPABILITY_ALL; /* `ALL */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GdkToplevelState to OCaml flag list */
value Val_GdkToplevelState(GdkToplevelState flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GDK_TOPLEVEL_STATE_MINIMIZED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("MINIMIZED"))); /* `MINIMIZED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_MAXIMIZED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("MAXIMIZED"))); /* `MAXIMIZED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_STICKY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("STICKY"))); /* `STICKY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_FULLSCREEN) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FULLSCREEN"))); /* `FULLSCREEN */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_ABOVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ABOVE"))); /* `ABOVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_BELOW) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BELOW"))); /* `BELOW */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_FOCUSED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FOCUSED"))); /* `FOCUSED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_TILED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("TILED"))); /* `TILED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_TOP_TILED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("TOP_TILED"))); /* `TOP_TILED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_TOP_RESIZABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("TOP_RESIZABLE"))); /* `TOP_RESIZABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_RIGHT_TILED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("RIGHT_TILED"))); /* `RIGHT_TILED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_RIGHT_RESIZABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("RIGHT_RESIZABLE"))); /* `RIGHT_RESIZABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_BOTTOM_TILED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BOTTOM_TILED"))); /* `BOTTOM_TILED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_BOTTOM_RESIZABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BOTTOM_RESIZABLE"))); /* `BOTTOM_RESIZABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_LEFT_TILED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("LEFT_TILED"))); /* `LEFT_TILED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_LEFT_RESIZABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("LEFT_RESIZABLE"))); /* `LEFT_RESIZABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_SUSPENDED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SUSPENDED"))); /* `SUSPENDED */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GdkToplevelState */
GdkToplevelState GdkToplevelState_val(value list) {
  GdkToplevelState result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("MINIMIZED")) result |= GDK_TOPLEVEL_STATE_MINIMIZED; /* `MINIMIZED */
    else if (tag == caml_hash_variant("MAXIMIZED")) result |= GDK_TOPLEVEL_STATE_MAXIMIZED; /* `MAXIMIZED */
    else if (tag == caml_hash_variant("STICKY")) result |= GDK_TOPLEVEL_STATE_STICKY; /* `STICKY */
    else if (tag == caml_hash_variant("FULLSCREEN")) result |= GDK_TOPLEVEL_STATE_FULLSCREEN; /* `FULLSCREEN */
    else if (tag == caml_hash_variant("ABOVE")) result |= GDK_TOPLEVEL_STATE_ABOVE; /* `ABOVE */
    else if (tag == caml_hash_variant("BELOW")) result |= GDK_TOPLEVEL_STATE_BELOW; /* `BELOW */
    else if (tag == caml_hash_variant("FOCUSED")) result |= GDK_TOPLEVEL_STATE_FOCUSED; /* `FOCUSED */
    else if (tag == caml_hash_variant("TILED")) result |= GDK_TOPLEVEL_STATE_TILED; /* `TILED */
    else if (tag == caml_hash_variant("TOP_TILED")) result |= GDK_TOPLEVEL_STATE_TOP_TILED; /* `TOP_TILED */
    else if (tag == caml_hash_variant("TOP_RESIZABLE")) result |= GDK_TOPLEVEL_STATE_TOP_RESIZABLE; /* `TOP_RESIZABLE */
    else if (tag == caml_hash_variant("RIGHT_TILED")) result |= GDK_TOPLEVEL_STATE_RIGHT_TILED; /* `RIGHT_TILED */
    else if (tag == caml_hash_variant("RIGHT_RESIZABLE")) result |= GDK_TOPLEVEL_STATE_RIGHT_RESIZABLE; /* `RIGHT_RESIZABLE */
    else if (tag == caml_hash_variant("BOTTOM_TILED")) result |= GDK_TOPLEVEL_STATE_BOTTOM_TILED; /* `BOTTOM_TILED */
    else if (tag == caml_hash_variant("BOTTOM_RESIZABLE")) result |= GDK_TOPLEVEL_STATE_BOTTOM_RESIZABLE; /* `BOTTOM_RESIZABLE */
    else if (tag == caml_hash_variant("LEFT_TILED")) result |= GDK_TOPLEVEL_STATE_LEFT_TILED; /* `LEFT_TILED */
    else if (tag == caml_hash_variant("LEFT_RESIZABLE")) result |= GDK_TOPLEVEL_STATE_LEFT_RESIZABLE; /* `LEFT_RESIZABLE */
    else if (tag == caml_hash_variant("SUSPENDED")) result |= GDK_TOPLEVEL_STATE_SUSPENDED; /* `SUSPENDED */
    list = Field(list, 1);
  }
  return result;
}

