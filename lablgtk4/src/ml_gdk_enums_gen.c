/* GENERATED CODE - DO NOT EDIT */
/* Gdk enum/bitfield converters */

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <gdk/gdk.h>

/* Convert GdkAxisUse to OCaml value */
value Val_GdkAxisUse(GdkAxisUse val) {
  switch (val) {
    case GDK_AXIS_IGNORE: return Val_int(384874010); /* `IGNORE */
    case GDK_AXIS_X: return Val_int(955083746); /* `X */
    case GDK_AXIS_Y: return Val_int(933026350); /* `Y */
    case GDK_AXIS_DELTA_X: return Val_int(73776336); /* `DELTA_X */
    case GDK_AXIS_DELTA_Y: return Val_int(592538848); /* `DELTA_Y */
    case GDK_AXIS_PRESSURE: return Val_int(985619202); /* `PRESSURE */
    case GDK_AXIS_XTILT: return Val_int(695861910); /* `XTILT */
    case GDK_AXIS_YTILT: return Val_int(27734781); /* `YTILT */
    case GDK_AXIS_WHEEL: return Val_int(821227771); /* `WHEEL */
    case GDK_AXIS_DISTANCE: return Val_int(514724911); /* `DISTANCE */
    case GDK_AXIS_ROTATION: return Val_int(181583443); /* `ROTATION */
    case GDK_AXIS_SLIDER: return Val_int(32742794); /* `SLIDER */
    case GDK_AXIS_LAST: return Val_int(82545625); /* `LAST */
    default: return Val_int(384874010); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkAxisUse */
GdkAxisUse GdkAxisUse_val(value val) {
  int tag = Int_val(val);
  if (tag == 384874010) return GDK_AXIS_IGNORE; /* `IGNORE */
  else if (tag == 955083746) return GDK_AXIS_X; /* `X */
  else if (tag == 933026350) return GDK_AXIS_Y; /* `Y */
  else if (tag == 73776336) return GDK_AXIS_DELTA_X; /* `DELTA_X */
  else if (tag == 592538848) return GDK_AXIS_DELTA_Y; /* `DELTA_Y */
  else if (tag == 985619202) return GDK_AXIS_PRESSURE; /* `PRESSURE */
  else if (tag == 695861910) return GDK_AXIS_XTILT; /* `XTILT */
  else if (tag == 27734781) return GDK_AXIS_YTILT; /* `YTILT */
  else if (tag == 821227771) return GDK_AXIS_WHEEL; /* `WHEEL */
  else if (tag == 514724911) return GDK_AXIS_DISTANCE; /* `DISTANCE */
  else if (tag == 181583443) return GDK_AXIS_ROTATION; /* `ROTATION */
  else if (tag == 32742794) return GDK_AXIS_SLIDER; /* `SLIDER */
  else if (tag == 82545625) return GDK_AXIS_LAST; /* `LAST */
  else return GDK_AXIS_IGNORE; /* fallback to first value */
}

/* Convert GdkCrossingMode to OCaml value */
value Val_GdkCrossingMode(GdkCrossingMode val) {
  switch (val) {
    case GDK_CROSSING_NORMAL: return Val_int(888717969); /* `NORMAL */
    case GDK_CROSSING_GRAB: return Val_int(197379187); /* `GRAB */
    case GDK_CROSSING_UNGRAB: return Val_int(649820998); /* `UNGRAB */
    case GDK_CROSSING_GTK_GRAB: return Val_int(600175866); /* `GTK_GRAB */
    case GDK_CROSSING_GTK_UNGRAB: return Val_int(1029940220); /* `GTK_UNGRAB */
    case GDK_CROSSING_STATE_CHANGED: return Val_int(458248227); /* `STATE_CHANGED */
    case GDK_CROSSING_TOUCH_BEGIN: return Val_int(150893568); /* `TOUCH_BEGIN */
    case GDK_CROSSING_TOUCH_END: return Val_int(157751964); /* `TOUCH_END */
    case GDK_CROSSING_DEVICE_SWITCH: return Val_int(534443920); /* `DEVICE_SWITCH */
    default: return Val_int(888717969); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkCrossingMode */
GdkCrossingMode GdkCrossingMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 888717969) return GDK_CROSSING_NORMAL; /* `NORMAL */
  else if (tag == 197379187) return GDK_CROSSING_GRAB; /* `GRAB */
  else if (tag == 649820998) return GDK_CROSSING_UNGRAB; /* `UNGRAB */
  else if (tag == 600175866) return GDK_CROSSING_GTK_GRAB; /* `GTK_GRAB */
  else if (tag == 1029940220) return GDK_CROSSING_GTK_UNGRAB; /* `GTK_UNGRAB */
  else if (tag == 458248227) return GDK_CROSSING_STATE_CHANGED; /* `STATE_CHANGED */
  else if (tag == 150893568) return GDK_CROSSING_TOUCH_BEGIN; /* `TOUCH_BEGIN */
  else if (tag == 157751964) return GDK_CROSSING_TOUCH_END; /* `TOUCH_END */
  else if (tag == 534443920) return GDK_CROSSING_DEVICE_SWITCH; /* `DEVICE_SWITCH */
  else return GDK_CROSSING_NORMAL; /* fallback to first value */
}

/* Convert GdkDevicePadFeature to OCaml value */
value Val_GdkDevicePadFeature(GdkDevicePadFeature val) {
  switch (val) {
    case GDK_DEVICE_PAD_FEATURE_BUTTON: return Val_int(536988399); /* `BUTTON */
    case GDK_DEVICE_PAD_FEATURE_RING: return Val_int(696651259); /* `RING */
    case GDK_DEVICE_PAD_FEATURE_STRIP: return Val_int(491817462); /* `STRIP */
    default: return Val_int(536988399); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkDevicePadFeature */
GdkDevicePadFeature GdkDevicePadFeature_val(value val) {
  int tag = Int_val(val);
  if (tag == 536988399) return GDK_DEVICE_PAD_FEATURE_BUTTON; /* `BUTTON */
  else if (tag == 696651259) return GDK_DEVICE_PAD_FEATURE_RING; /* `RING */
  else if (tag == 491817462) return GDK_DEVICE_PAD_FEATURE_STRIP; /* `STRIP */
  else return GDK_DEVICE_PAD_FEATURE_BUTTON; /* fallback to first value */
}

/* Convert GdkDeviceToolType to OCaml value */
value Val_GdkDeviceToolType(GdkDeviceToolType val) {
  switch (val) {
    case GDK_DEVICE_TOOL_TYPE_UNKNOWN: return Val_int(140725159); /* `UNKNOWN */
    case GDK_DEVICE_TOOL_TYPE_PEN: return Val_int(367329078); /* `PEN */
    case GDK_DEVICE_TOOL_TYPE_ERASER: return Val_int(69393224); /* `ERASER */
    case GDK_DEVICE_TOOL_TYPE_BRUSH: return Val_int(766970263); /* `BRUSH */
    case GDK_DEVICE_TOOL_TYPE_PENCIL: return Val_int(621049398); /* `PENCIL */
    case GDK_DEVICE_TOOL_TYPE_AIRBRUSH: return Val_int(973380933); /* `AIRBRUSH */
    case GDK_DEVICE_TOOL_TYPE_MOUSE: return Val_int(59343045); /* `MOUSE */
    case GDK_DEVICE_TOOL_TYPE_LENS: return Val_int(845677050); /* `LENS */
    default: return Val_int(140725159); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkDeviceToolType */
GdkDeviceToolType GdkDeviceToolType_val(value val) {
  int tag = Int_val(val);
  if (tag == 140725159) return GDK_DEVICE_TOOL_TYPE_UNKNOWN; /* `UNKNOWN */
  else if (tag == 367329078) return GDK_DEVICE_TOOL_TYPE_PEN; /* `PEN */
  else if (tag == 69393224) return GDK_DEVICE_TOOL_TYPE_ERASER; /* `ERASER */
  else if (tag == 766970263) return GDK_DEVICE_TOOL_TYPE_BRUSH; /* `BRUSH */
  else if (tag == 621049398) return GDK_DEVICE_TOOL_TYPE_PENCIL; /* `PENCIL */
  else if (tag == 973380933) return GDK_DEVICE_TOOL_TYPE_AIRBRUSH; /* `AIRBRUSH */
  else if (tag == 59343045) return GDK_DEVICE_TOOL_TYPE_MOUSE; /* `MOUSE */
  else if (tag == 845677050) return GDK_DEVICE_TOOL_TYPE_LENS; /* `LENS */
  else return GDK_DEVICE_TOOL_TYPE_UNKNOWN; /* fallback to first value */
}

/* Convert GdkDmabufError to OCaml value */
value Val_GdkDmabufError(GdkDmabufError val) {
  switch (val) {
    case GDK_DMABUF_ERROR_NOT_AVAILABLE: return Val_int(752838034); /* `NOT_AVAILABLE */
    case GDK_DMABUF_ERROR_UNSUPPORTED_FORMAT: return Val_int(28206193); /* `UNSUPPORTED_FORMAT */
    case GDK_DMABUF_ERROR_CREATION_FAILED: return Val_int(406534395); /* `CREATION_FAILED */
    default: return Val_int(752838034); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkDmabufError */
GdkDmabufError GdkDmabufError_val(value val) {
  int tag = Int_val(val);
  if (tag == 752838034) return GDK_DMABUF_ERROR_NOT_AVAILABLE; /* `NOT_AVAILABLE */
  else if (tag == 28206193) return GDK_DMABUF_ERROR_UNSUPPORTED_FORMAT; /* `UNSUPPORTED_FORMAT */
  else if (tag == 406534395) return GDK_DMABUF_ERROR_CREATION_FAILED; /* `CREATION_FAILED */
  else return GDK_DMABUF_ERROR_NOT_AVAILABLE; /* fallback to first value */
}

/* Convert GdkDragCancelReason to OCaml value */
value Val_GdkDragCancelReason(GdkDragCancelReason val) {
  switch (val) {
    case GDK_DRAG_CANCEL_NO_TARGET: return Val_int(969811048); /* `NO_TARGET */
    case GDK_DRAG_CANCEL_USER_CANCELLED: return Val_int(32825181); /* `USER_CANCELLED */
    case GDK_DRAG_CANCEL_ERROR: return Val_int(1064539868); /* `ERROR */
    default: return Val_int(969811048); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkDragCancelReason */
GdkDragCancelReason GdkDragCancelReason_val(value val) {
  int tag = Int_val(val);
  if (tag == 969811048) return GDK_DRAG_CANCEL_NO_TARGET; /* `NO_TARGET */
  else if (tag == 32825181) return GDK_DRAG_CANCEL_USER_CANCELLED; /* `USER_CANCELLED */
  else if (tag == 1064539868) return GDK_DRAG_CANCEL_ERROR; /* `ERROR */
  else return GDK_DRAG_CANCEL_NO_TARGET; /* fallback to first value */
}

/* Convert GdkEventType to OCaml value */
value Val_GdkEventType(GdkEventType val) {
  switch (val) {
    case GDK_DELETE: return Val_int(338964210); /* `DELETE */
    case GDK_MOTION_NOTIFY: return Val_int(71507961); /* `MOTION_NOTIFY */
    case GDK_BUTTON_PRESS: return Val_int(819710564); /* `BUTTON_PRESS */
    case GDK_BUTTON_RELEASE: return Val_int(399224429); /* `BUTTON_RELEASE */
    case GDK_KEY_PRESS: return Val_int(26397303); /* `KEY_PRESS */
    case GDK_KEY_RELEASE: return Val_int(701199335); /* `KEY_RELEASE */
    case GDK_ENTER_NOTIFY: return Val_int(49058966); /* `ENTER_NOTIFY */
    case GDK_LEAVE_NOTIFY: return Val_int(808600665); /* `LEAVE_NOTIFY */
    case GDK_FOCUS_CHANGE: return Val_int(126748464); /* `FOCUS_CHANGE */
    case GDK_PROXIMITY_IN: return Val_int(426190184); /* `PROXIMITY_IN */
    case GDK_PROXIMITY_OUT: return Val_int(184063595); /* `PROXIMITY_OUT */
    case GDK_DRAG_ENTER: return Val_int(45793944); /* `DRAG_ENTER */
    case GDK_DRAG_LEAVE: return Val_int(5072629); /* `DRAG_LEAVE */
    case GDK_DRAG_MOTION: return Val_int(827558236); /* `DRAG_MOTION */
    case GDK_DROP_START: return Val_int(768618356); /* `DROP_START */
    case GDK_SCROLL: return Val_int(260376123); /* `SCROLL */
    case GDK_GRAB_BROKEN: return Val_int(696775512); /* `GRAB_BROKEN */
    case GDK_TOUCH_BEGIN: return Val_int(150893568); /* `TOUCH_BEGIN */
    case GDK_TOUCH_UPDATE: return Val_int(1770130); /* `TOUCH_UPDATE */
    case GDK_TOUCH_END: return Val_int(157751964); /* `TOUCH_END */
    case GDK_TOUCH_CANCEL: return Val_int(987825380); /* `TOUCH_CANCEL */
    case GDK_TOUCHPAD_SWIPE: return Val_int(798662073); /* `TOUCHPAD_SWIPE */
    case GDK_TOUCHPAD_PINCH: return Val_int(195090186); /* `TOUCHPAD_PINCH */
    case GDK_PAD_BUTTON_PRESS: return Val_int(741424127); /* `PAD_BUTTON_PRESS */
    case GDK_PAD_BUTTON_RELEASE: return Val_int(591206593); /* `PAD_BUTTON_RELEASE */
    case GDK_PAD_RING: return Val_int(718537981); /* `PAD_RING */
    case GDK_PAD_STRIP: return Val_int(536025669); /* `PAD_STRIP */
    case GDK_PAD_GROUP_MODE: return Val_int(820113604); /* `PAD_GROUP_MODE */
    case GDK_TOUCHPAD_HOLD: return Val_int(618205576); /* `TOUCHPAD_HOLD */
    case GDK_EVENT_LAST: return Val_int(346627513); /* `EVENT_LAST */
    default: return Val_int(338964210); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkEventType */
GdkEventType GdkEventType_val(value val) {
  int tag = Int_val(val);
  if (tag == 338964210) return GDK_DELETE; /* `DELETE */
  else if (tag == 71507961) return GDK_MOTION_NOTIFY; /* `MOTION_NOTIFY */
  else if (tag == 819710564) return GDK_BUTTON_PRESS; /* `BUTTON_PRESS */
  else if (tag == 399224429) return GDK_BUTTON_RELEASE; /* `BUTTON_RELEASE */
  else if (tag == 26397303) return GDK_KEY_PRESS; /* `KEY_PRESS */
  else if (tag == 701199335) return GDK_KEY_RELEASE; /* `KEY_RELEASE */
  else if (tag == 49058966) return GDK_ENTER_NOTIFY; /* `ENTER_NOTIFY */
  else if (tag == 808600665) return GDK_LEAVE_NOTIFY; /* `LEAVE_NOTIFY */
  else if (tag == 126748464) return GDK_FOCUS_CHANGE; /* `FOCUS_CHANGE */
  else if (tag == 426190184) return GDK_PROXIMITY_IN; /* `PROXIMITY_IN */
  else if (tag == 184063595) return GDK_PROXIMITY_OUT; /* `PROXIMITY_OUT */
  else if (tag == 45793944) return GDK_DRAG_ENTER; /* `DRAG_ENTER */
  else if (tag == 5072629) return GDK_DRAG_LEAVE; /* `DRAG_LEAVE */
  else if (tag == 827558236) return GDK_DRAG_MOTION; /* `DRAG_MOTION */
  else if (tag == 768618356) return GDK_DROP_START; /* `DROP_START */
  else if (tag == 260376123) return GDK_SCROLL; /* `SCROLL */
  else if (tag == 696775512) return GDK_GRAB_BROKEN; /* `GRAB_BROKEN */
  else if (tag == 150893568) return GDK_TOUCH_BEGIN; /* `TOUCH_BEGIN */
  else if (tag == 1770130) return GDK_TOUCH_UPDATE; /* `TOUCH_UPDATE */
  else if (tag == 157751964) return GDK_TOUCH_END; /* `TOUCH_END */
  else if (tag == 987825380) return GDK_TOUCH_CANCEL; /* `TOUCH_CANCEL */
  else if (tag == 798662073) return GDK_TOUCHPAD_SWIPE; /* `TOUCHPAD_SWIPE */
  else if (tag == 195090186) return GDK_TOUCHPAD_PINCH; /* `TOUCHPAD_PINCH */
  else if (tag == 741424127) return GDK_PAD_BUTTON_PRESS; /* `PAD_BUTTON_PRESS */
  else if (tag == 591206593) return GDK_PAD_BUTTON_RELEASE; /* `PAD_BUTTON_RELEASE */
  else if (tag == 718537981) return GDK_PAD_RING; /* `PAD_RING */
  else if (tag == 536025669) return GDK_PAD_STRIP; /* `PAD_STRIP */
  else if (tag == 820113604) return GDK_PAD_GROUP_MODE; /* `PAD_GROUP_MODE */
  else if (tag == 618205576) return GDK_TOUCHPAD_HOLD; /* `TOUCHPAD_HOLD */
  else if (tag == 346627513) return GDK_EVENT_LAST; /* `EVENT_LAST */
  else return GDK_DELETE; /* fallback to first value */
}

/* Convert GdkFullscreenMode to OCaml value */
value Val_GdkFullscreenMode(GdkFullscreenMode val) {
  switch (val) {
    case GDK_FULLSCREEN_ON_CURRENT_MONITOR: return Val_int(161341488); /* `CURRENT_MONITOR */
    case GDK_FULLSCREEN_ON_ALL_MONITORS: return Val_int(384446162); /* `ALL_MONITORS */
    default: return Val_int(161341488); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkFullscreenMode */
GdkFullscreenMode GdkFullscreenMode_val(value val) {
  int tag = Int_val(val);
  if (tag == 161341488) return GDK_FULLSCREEN_ON_CURRENT_MONITOR; /* `CURRENT_MONITOR */
  else if (tag == 384446162) return GDK_FULLSCREEN_ON_ALL_MONITORS; /* `ALL_MONITORS */
  else return GDK_FULLSCREEN_ON_CURRENT_MONITOR; /* fallback to first value */
}

/* Convert GdkGLError to OCaml value */
value Val_GdkGLError(GdkGLError val) {
  switch (val) {
    case GDK_GL_ERROR_NOT_AVAILABLE: return Val_int(752838034); /* `NOT_AVAILABLE */
    case GDK_GL_ERROR_UNSUPPORTED_FORMAT: return Val_int(28206193); /* `UNSUPPORTED_FORMAT */
    case GDK_GL_ERROR_UNSUPPORTED_PROFILE: return Val_int(774127821); /* `UNSUPPORTED_PROFILE */
    case GDK_GL_ERROR_COMPILATION_FAILED: return Val_int(387857439); /* `COMPILATION_FAILED */
    case GDK_GL_ERROR_LINK_FAILED: return Val_int(417487118); /* `LINK_FAILED */
    default: return Val_int(752838034); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkGLError */
GdkGLError GdkGLError_val(value val) {
  int tag = Int_val(val);
  if (tag == 752838034) return GDK_GL_ERROR_NOT_AVAILABLE; /* `NOT_AVAILABLE */
  else if (tag == 28206193) return GDK_GL_ERROR_UNSUPPORTED_FORMAT; /* `UNSUPPORTED_FORMAT */
  else if (tag == 774127821) return GDK_GL_ERROR_UNSUPPORTED_PROFILE; /* `UNSUPPORTED_PROFILE */
  else if (tag == 387857439) return GDK_GL_ERROR_COMPILATION_FAILED; /* `COMPILATION_FAILED */
  else if (tag == 417487118) return GDK_GL_ERROR_LINK_FAILED; /* `LINK_FAILED */
  else return GDK_GL_ERROR_NOT_AVAILABLE; /* fallback to first value */
}

/* Convert GdkGravity to OCaml value */
value Val_GdkGravity(GdkGravity val) {
  switch (val) {
    case GDK_GRAVITY_NORTH_WEST: return Val_int(1032057702); /* `NORTH_WEST */
    case GDK_GRAVITY_NORTH: return Val_int(632341845); /* `NORTH */
    case GDK_GRAVITY_NORTH_EAST: return Val_int(935745565); /* `NORTH_EAST */
    case GDK_GRAVITY_WEST: return Val_int(385862739); /* `WEST */
    case GDK_GRAVITY_CENTER: return Val_int(428864253); /* `CENTER */
    case GDK_GRAVITY_EAST: return Val_int(1069568433); /* `EAST */
    case GDK_GRAVITY_SOUTH_WEST: return Val_int(1045879175); /* `SOUTH_WEST */
    case GDK_GRAVITY_SOUTH: return Val_int(799707224); /* `SOUTH */
    case GDK_GRAVITY_SOUTH_EAST: return Val_int(558652977); /* `SOUTH_EAST */
    case GDK_GRAVITY_STATIC: return Val_int(4224176); /* `STATIC */
    default: return Val_int(1032057702); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkGravity */
GdkGravity GdkGravity_val(value val) {
  int tag = Int_val(val);
  if (tag == 1032057702) return GDK_GRAVITY_NORTH_WEST; /* `NORTH_WEST */
  else if (tag == 632341845) return GDK_GRAVITY_NORTH; /* `NORTH */
  else if (tag == 935745565) return GDK_GRAVITY_NORTH_EAST; /* `NORTH_EAST */
  else if (tag == 385862739) return GDK_GRAVITY_WEST; /* `WEST */
  else if (tag == 428864253) return GDK_GRAVITY_CENTER; /* `CENTER */
  else if (tag == 1069568433) return GDK_GRAVITY_EAST; /* `EAST */
  else if (tag == 1045879175) return GDK_GRAVITY_SOUTH_WEST; /* `SOUTH_WEST */
  else if (tag == 799707224) return GDK_GRAVITY_SOUTH; /* `SOUTH */
  else if (tag == 558652977) return GDK_GRAVITY_SOUTH_EAST; /* `SOUTH_EAST */
  else if (tag == 4224176) return GDK_GRAVITY_STATIC; /* `STATIC */
  else return GDK_GRAVITY_NORTH_WEST; /* fallback to first value */
}

/* Convert GdkInputSource to OCaml value */
value Val_GdkInputSource(GdkInputSource val) {
  switch (val) {
    case GDK_SOURCE_MOUSE: return Val_int(59343045); /* `MOUSE */
    case GDK_SOURCE_PEN: return Val_int(367329078); /* `PEN */
    case GDK_SOURCE_KEYBOARD: return Val_int(414857422); /* `KEYBOARD */
    case GDK_SOURCE_TOUCHSCREEN: return Val_int(430579827); /* `TOUCHSCREEN */
    case GDK_SOURCE_TOUCHPAD: return Val_int(505988342); /* `TOUCHPAD */
    case GDK_SOURCE_TRACKPOINT: return Val_int(356307968); /* `TRACKPOINT */
    case GDK_SOURCE_TABLET_PAD: return Val_int(501079449); /* `TABLET_PAD */
    default: return Val_int(59343045); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkInputSource */
GdkInputSource GdkInputSource_val(value val) {
  int tag = Int_val(val);
  if (tag == 59343045) return GDK_SOURCE_MOUSE; /* `MOUSE */
  else if (tag == 367329078) return GDK_SOURCE_PEN; /* `PEN */
  else if (tag == 414857422) return GDK_SOURCE_KEYBOARD; /* `KEYBOARD */
  else if (tag == 430579827) return GDK_SOURCE_TOUCHSCREEN; /* `TOUCHSCREEN */
  else if (tag == 505988342) return GDK_SOURCE_TOUCHPAD; /* `TOUCHPAD */
  else if (tag == 356307968) return GDK_SOURCE_TRACKPOINT; /* `TRACKPOINT */
  else if (tag == 501079449) return GDK_SOURCE_TABLET_PAD; /* `TABLET_PAD */
  else return GDK_SOURCE_MOUSE; /* fallback to first value */
}

/* Convert GdkKeyMatch to OCaml value */
value Val_GdkKeyMatch(GdkKeyMatch val) {
  switch (val) {
    case GDK_KEY_MATCH_NONE: return Val_int(37469934); /* `NONE */
    case GDK_KEY_MATCH_PARTIAL: return Val_int(543851302); /* `PARTIAL */
    case GDK_KEY_MATCH_EXACT: return Val_int(863737765); /* `EXACT */
    default: return Val_int(37469934); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkKeyMatch */
GdkKeyMatch GdkKeyMatch_val(value val) {
  int tag = Int_val(val);
  if (tag == 37469934) return GDK_KEY_MATCH_NONE; /* `NONE */
  else if (tag == 543851302) return GDK_KEY_MATCH_PARTIAL; /* `PARTIAL */
  else if (tag == 863737765) return GDK_KEY_MATCH_EXACT; /* `EXACT */
  else return GDK_KEY_MATCH_NONE; /* fallback to first value */
}

/* Convert GdkMemoryFormat to OCaml value */
value Val_GdkMemoryFormat(GdkMemoryFormat val) {
  switch (val) {
    case GDK_MEMORY_B8G8R8A8_PREMULTIPLIED: return Val_int(610196268); /* `B8G8R8A8_PREMULTIPLIED */
    case GDK_MEMORY_A8R8G8B8_PREMULTIPLIED: return Val_int(443036804); /* `A8R8G8B8_PREMULTIPLIED */
    case GDK_MEMORY_R8G8B8A8_PREMULTIPLIED: return Val_int(261717203); /* `R8G8B8A8_PREMULTIPLIED */
    case GDK_MEMORY_B8G8R8A8: return Val_int(813547973); /* `B8G8R8A8 */
    case GDK_MEMORY_A8R8G8B8: return Val_int(337840789); /* `A8R8G8B8 */
    case GDK_MEMORY_R8G8B8A8: return Val_int(346210036); /* `R8G8B8A8 */
    case GDK_MEMORY_A8B8G8R8: return Val_int(169173743); /* `A8B8G8R8 */
    case GDK_MEMORY_R8G8B8: return Val_int(133068326); /* `R8G8B8 */
    case GDK_MEMORY_B8G8R8: return Val_int(819815504); /* `B8G8R8 */
    case GDK_MEMORY_R16G16B16: return Val_int(1064474433); /* `R16G16B16 */
    case GDK_MEMORY_R16G16B16A16_PREMULTIPLIED: return Val_int(370450877); /* `R16G16B16A16_PREMULTIPLIED */
    case GDK_MEMORY_R16G16B16A16: return Val_int(839780954); /* `R16G16B16A16 */
    case GDK_MEMORY_R16G16B16_FLOAT: return Val_int(742578004); /* `R16G16B16_FLOAT */
    case GDK_MEMORY_R16G16B16A16_FLOAT_PREMULTIPLIED: return Val_int(47499900); /* `R16G16B16A16_FLOAT_PREMULTIPLIED */
    case GDK_MEMORY_R16G16B16A16_FLOAT: return Val_int(69593675); /* `R16G16B16A16_FLOAT */
    case GDK_MEMORY_R32G32B32_FLOAT: return Val_int(985660060); /* `R32G32B32_FLOAT */
    case GDK_MEMORY_R32G32B32A32_FLOAT_PREMULTIPLIED: return Val_int(864210672); /* `R32G32B32A32_FLOAT_PREMULTIPLIED */
    case GDK_MEMORY_R32G32B32A32_FLOAT: return Val_int(757230786); /* `R32G32B32A32_FLOAT */
    case GDK_MEMORY_G8A8_PREMULTIPLIED: return Val_int(850099773); /* `G8A8_PREMULTIPLIED */
    case GDK_MEMORY_G8A8: return Val_int(640057976); /* `G8A8 */
    case GDK_MEMORY_G8: return Val_int(74821239); /* `G8 */
    case GDK_MEMORY_G16A16_PREMULTIPLIED: return Val_int(818605861); /* `G16A16_PREMULTIPLIED */
    case GDK_MEMORY_G16A16: return Val_int(1041109381); /* `G16A16 */
    case GDK_MEMORY_G16: return Val_int(531254812); /* `G16 */
    case GDK_MEMORY_A8: return Val_int(726044365); /* `A8 */
    case GDK_MEMORY_A16: return Val_int(156713430); /* `A16 */
    case GDK_MEMORY_A16_FLOAT: return Val_int(446301087); /* `A16_FLOAT */
    case GDK_MEMORY_A32_FLOAT: return Val_int(140472866); /* `A32_FLOAT */
    case GDK_MEMORY_A8B8G8R8_PREMULTIPLIED: return Val_int(973517216); /* `A8B8G8R8_PREMULTIPLIED */
    case GDK_MEMORY_B8G8R8X8: return Val_int(802695858); /* `B8G8R8X8 */
    case GDK_MEMORY_X8R8G8B8: return Val_int(1017329152); /* `X8R8G8B8 */
    case GDK_MEMORY_R8G8B8X8: return Val_int(123883468); /* `R8G8B8X8 */
    case GDK_MEMORY_X8B8G8R8: return Val_int(1046290482); /* `X8B8G8R8 */
    case GDK_MEMORY_N_FORMATS: return Val_int(492659456); /* `N_FORMATS */
    default: return Val_int(610196268); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkMemoryFormat */
GdkMemoryFormat GdkMemoryFormat_val(value val) {
  int tag = Int_val(val);
  if (tag == 610196268) return GDK_MEMORY_B8G8R8A8_PREMULTIPLIED; /* `B8G8R8A8_PREMULTIPLIED */
  else if (tag == 443036804) return GDK_MEMORY_A8R8G8B8_PREMULTIPLIED; /* `A8R8G8B8_PREMULTIPLIED */
  else if (tag == 261717203) return GDK_MEMORY_R8G8B8A8_PREMULTIPLIED; /* `R8G8B8A8_PREMULTIPLIED */
  else if (tag == 813547973) return GDK_MEMORY_B8G8R8A8; /* `B8G8R8A8 */
  else if (tag == 337840789) return GDK_MEMORY_A8R8G8B8; /* `A8R8G8B8 */
  else if (tag == 346210036) return GDK_MEMORY_R8G8B8A8; /* `R8G8B8A8 */
  else if (tag == 169173743) return GDK_MEMORY_A8B8G8R8; /* `A8B8G8R8 */
  else if (tag == 133068326) return GDK_MEMORY_R8G8B8; /* `R8G8B8 */
  else if (tag == 819815504) return GDK_MEMORY_B8G8R8; /* `B8G8R8 */
  else if (tag == 1064474433) return GDK_MEMORY_R16G16B16; /* `R16G16B16 */
  else if (tag == 370450877) return GDK_MEMORY_R16G16B16A16_PREMULTIPLIED; /* `R16G16B16A16_PREMULTIPLIED */
  else if (tag == 839780954) return GDK_MEMORY_R16G16B16A16; /* `R16G16B16A16 */
  else if (tag == 742578004) return GDK_MEMORY_R16G16B16_FLOAT; /* `R16G16B16_FLOAT */
  else if (tag == 47499900) return GDK_MEMORY_R16G16B16A16_FLOAT_PREMULTIPLIED; /* `R16G16B16A16_FLOAT_PREMULTIPLIED */
  else if (tag == 69593675) return GDK_MEMORY_R16G16B16A16_FLOAT; /* `R16G16B16A16_FLOAT */
  else if (tag == 985660060) return GDK_MEMORY_R32G32B32_FLOAT; /* `R32G32B32_FLOAT */
  else if (tag == 864210672) return GDK_MEMORY_R32G32B32A32_FLOAT_PREMULTIPLIED; /* `R32G32B32A32_FLOAT_PREMULTIPLIED */
  else if (tag == 757230786) return GDK_MEMORY_R32G32B32A32_FLOAT; /* `R32G32B32A32_FLOAT */
  else if (tag == 850099773) return GDK_MEMORY_G8A8_PREMULTIPLIED; /* `G8A8_PREMULTIPLIED */
  else if (tag == 640057976) return GDK_MEMORY_G8A8; /* `G8A8 */
  else if (tag == 74821239) return GDK_MEMORY_G8; /* `G8 */
  else if (tag == 818605861) return GDK_MEMORY_G16A16_PREMULTIPLIED; /* `G16A16_PREMULTIPLIED */
  else if (tag == 1041109381) return GDK_MEMORY_G16A16; /* `G16A16 */
  else if (tag == 531254812) return GDK_MEMORY_G16; /* `G16 */
  else if (tag == 726044365) return GDK_MEMORY_A8; /* `A8 */
  else if (tag == 156713430) return GDK_MEMORY_A16; /* `A16 */
  else if (tag == 446301087) return GDK_MEMORY_A16_FLOAT; /* `A16_FLOAT */
  else if (tag == 140472866) return GDK_MEMORY_A32_FLOAT; /* `A32_FLOAT */
  else if (tag == 973517216) return GDK_MEMORY_A8B8G8R8_PREMULTIPLIED; /* `A8B8G8R8_PREMULTIPLIED */
  else if (tag == 802695858) return GDK_MEMORY_B8G8R8X8; /* `B8G8R8X8 */
  else if (tag == 1017329152) return GDK_MEMORY_X8R8G8B8; /* `X8R8G8B8 */
  else if (tag == 123883468) return GDK_MEMORY_R8G8B8X8; /* `R8G8B8X8 */
  else if (tag == 1046290482) return GDK_MEMORY_X8B8G8R8; /* `X8B8G8R8 */
  else if (tag == 492659456) return GDK_MEMORY_N_FORMATS; /* `N_FORMATS */
  else return GDK_MEMORY_B8G8R8A8_PREMULTIPLIED; /* fallback to first value */
}

/* Convert GdkNotifyType to OCaml value */
value Val_GdkNotifyType(GdkNotifyType val) {
  switch (val) {
    case GDK_NOTIFY_ANCESTOR: return Val_int(529988059); /* `ANCESTOR */
    case GDK_NOTIFY_VIRTUAL: return Val_int(705815671); /* `VIRTUAL */
    case GDK_NOTIFY_INFERIOR: return Val_int(946295056); /* `INFERIOR */
    case GDK_NOTIFY_NONLINEAR: return Val_int(429950093); /* `NONLINEAR */
    case GDK_NOTIFY_NONLINEAR_VIRTUAL: return Val_int(338092069); /* `NONLINEAR_VIRTUAL */
    case GDK_NOTIFY_UNKNOWN: return Val_int(140725159); /* `UNKNOWN */
    default: return Val_int(529988059); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkNotifyType */
GdkNotifyType GdkNotifyType_val(value val) {
  int tag = Int_val(val);
  if (tag == 529988059) return GDK_NOTIFY_ANCESTOR; /* `ANCESTOR */
  else if (tag == 705815671) return GDK_NOTIFY_VIRTUAL; /* `VIRTUAL */
  else if (tag == 946295056) return GDK_NOTIFY_INFERIOR; /* `INFERIOR */
  else if (tag == 429950093) return GDK_NOTIFY_NONLINEAR; /* `NONLINEAR */
  else if (tag == 338092069) return GDK_NOTIFY_NONLINEAR_VIRTUAL; /* `NONLINEAR_VIRTUAL */
  else if (tag == 140725159) return GDK_NOTIFY_UNKNOWN; /* `UNKNOWN */
  else return GDK_NOTIFY_ANCESTOR; /* fallback to first value */
}

/* Convert GdkScrollDirection to OCaml value */
value Val_GdkScrollDirection(GdkScrollDirection val) {
  switch (val) {
    case GDK_SCROLL_UP: return Val_int(160130855); /* `UP */
    case GDK_SCROLL_DOWN: return Val_int(878985997); /* `DOWN */
    case GDK_SCROLL_LEFT: return Val_int(28713888); /* `LEFT */
    case GDK_SCROLL_RIGHT: return Val_int(961111566); /* `RIGHT */
    case GDK_SCROLL_SMOOTH: return Val_int(895107002); /* `SMOOTH */
    default: return Val_int(160130855); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkScrollDirection */
GdkScrollDirection GdkScrollDirection_val(value val) {
  int tag = Int_val(val);
  if (tag == 160130855) return GDK_SCROLL_UP; /* `UP */
  else if (tag == 878985997) return GDK_SCROLL_DOWN; /* `DOWN */
  else if (tag == 28713888) return GDK_SCROLL_LEFT; /* `LEFT */
  else if (tag == 961111566) return GDK_SCROLL_RIGHT; /* `RIGHT */
  else if (tag == 895107002) return GDK_SCROLL_SMOOTH; /* `SMOOTH */
  else return GDK_SCROLL_UP; /* fallback to first value */
}

/* Convert GdkScrollUnit to OCaml value */
value Val_GdkScrollUnit(GdkScrollUnit val) {
  switch (val) {
    case GDK_SCROLL_UNIT_WHEEL: return Val_int(821227771); /* `WHEEL */
    case GDK_SCROLL_UNIT_SURFACE: return Val_int(214880393); /* `SURFACE */
    default: return Val_int(821227771); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkScrollUnit */
GdkScrollUnit GdkScrollUnit_val(value val) {
  int tag = Int_val(val);
  if (tag == 821227771) return GDK_SCROLL_UNIT_WHEEL; /* `WHEEL */
  else if (tag == 214880393) return GDK_SCROLL_UNIT_SURFACE; /* `SURFACE */
  else return GDK_SCROLL_UNIT_WHEEL; /* fallback to first value */
}

/* Convert GdkSubpixelLayout to OCaml value */
value Val_GdkSubpixelLayout(GdkSubpixelLayout val) {
  switch (val) {
    case GDK_SUBPIXEL_LAYOUT_UNKNOWN: return Val_int(140725159); /* `UNKNOWN */
    case GDK_SUBPIXEL_LAYOUT_NONE: return Val_int(37469934); /* `NONE */
    case GDK_SUBPIXEL_LAYOUT_HORIZONTAL_RGB: return Val_int(695546151); /* `HORIZONTAL_RGB */
    case GDK_SUBPIXEL_LAYOUT_HORIZONTAL_BGR: return Val_int(147628158); /* `HORIZONTAL_BGR */
    case GDK_SUBPIXEL_LAYOUT_VERTICAL_RGB: return Val_int(258632798); /* `VERTICAL_RGB */
    case GDK_SUBPIXEL_LAYOUT_VERTICAL_BGR: return Val_int(966592789); /* `VERTICAL_BGR */
    default: return Val_int(140725159); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkSubpixelLayout */
GdkSubpixelLayout GdkSubpixelLayout_val(value val) {
  int tag = Int_val(val);
  if (tag == 140725159) return GDK_SUBPIXEL_LAYOUT_UNKNOWN; /* `UNKNOWN */
  else if (tag == 37469934) return GDK_SUBPIXEL_LAYOUT_NONE; /* `NONE */
  else if (tag == 695546151) return GDK_SUBPIXEL_LAYOUT_HORIZONTAL_RGB; /* `HORIZONTAL_RGB */
  else if (tag == 147628158) return GDK_SUBPIXEL_LAYOUT_HORIZONTAL_BGR; /* `HORIZONTAL_BGR */
  else if (tag == 258632798) return GDK_SUBPIXEL_LAYOUT_VERTICAL_RGB; /* `VERTICAL_RGB */
  else if (tag == 966592789) return GDK_SUBPIXEL_LAYOUT_VERTICAL_BGR; /* `VERTICAL_BGR */
  else return GDK_SUBPIXEL_LAYOUT_UNKNOWN; /* fallback to first value */
}

/* Convert GdkSurfaceEdge to OCaml value */
value Val_GdkSurfaceEdge(GdkSurfaceEdge val) {
  switch (val) {
    case GDK_SURFACE_EDGE_NORTH_WEST: return Val_int(1032057702); /* `NORTH_WEST */
    case GDK_SURFACE_EDGE_NORTH: return Val_int(632341845); /* `NORTH */
    case GDK_SURFACE_EDGE_NORTH_EAST: return Val_int(935745565); /* `NORTH_EAST */
    case GDK_SURFACE_EDGE_WEST: return Val_int(385862739); /* `WEST */
    case GDK_SURFACE_EDGE_EAST: return Val_int(1069568433); /* `EAST */
    case GDK_SURFACE_EDGE_SOUTH_WEST: return Val_int(1045879175); /* `SOUTH_WEST */
    case GDK_SURFACE_EDGE_SOUTH: return Val_int(799707224); /* `SOUTH */
    case GDK_SURFACE_EDGE_SOUTH_EAST: return Val_int(558652977); /* `SOUTH_EAST */
    default: return Val_int(1032057702); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkSurfaceEdge */
GdkSurfaceEdge GdkSurfaceEdge_val(value val) {
  int tag = Int_val(val);
  if (tag == 1032057702) return GDK_SURFACE_EDGE_NORTH_WEST; /* `NORTH_WEST */
  else if (tag == 632341845) return GDK_SURFACE_EDGE_NORTH; /* `NORTH */
  else if (tag == 935745565) return GDK_SURFACE_EDGE_NORTH_EAST; /* `NORTH_EAST */
  else if (tag == 385862739) return GDK_SURFACE_EDGE_WEST; /* `WEST */
  else if (tag == 1069568433) return GDK_SURFACE_EDGE_EAST; /* `EAST */
  else if (tag == 1045879175) return GDK_SURFACE_EDGE_SOUTH_WEST; /* `SOUTH_WEST */
  else if (tag == 799707224) return GDK_SURFACE_EDGE_SOUTH; /* `SOUTH */
  else if (tag == 558652977) return GDK_SURFACE_EDGE_SOUTH_EAST; /* `SOUTH_EAST */
  else return GDK_SURFACE_EDGE_NORTH_WEST; /* fallback to first value */
}

/* Convert GdkTextureError to OCaml value */
value Val_GdkTextureError(GdkTextureError val) {
  switch (val) {
    case GDK_TEXTURE_ERROR_TOO_LARGE: return Val_int(612562384); /* `TOO_LARGE */
    case GDK_TEXTURE_ERROR_CORRUPT_IMAGE: return Val_int(357133844); /* `CORRUPT_IMAGE */
    case GDK_TEXTURE_ERROR_UNSUPPORTED_CONTENT: return Val_int(523455912); /* `UNSUPPORTED_CONTENT */
    case GDK_TEXTURE_ERROR_UNSUPPORTED_FORMAT: return Val_int(28206193); /* `UNSUPPORTED_FORMAT */
    default: return Val_int(612562384); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkTextureError */
GdkTextureError GdkTextureError_val(value val) {
  int tag = Int_val(val);
  if (tag == 612562384) return GDK_TEXTURE_ERROR_TOO_LARGE; /* `TOO_LARGE */
  else if (tag == 357133844) return GDK_TEXTURE_ERROR_CORRUPT_IMAGE; /* `CORRUPT_IMAGE */
  else if (tag == 523455912) return GDK_TEXTURE_ERROR_UNSUPPORTED_CONTENT; /* `UNSUPPORTED_CONTENT */
  else if (tag == 28206193) return GDK_TEXTURE_ERROR_UNSUPPORTED_FORMAT; /* `UNSUPPORTED_FORMAT */
  else return GDK_TEXTURE_ERROR_TOO_LARGE; /* fallback to first value */
}

/* Convert GdkTitlebarGesture to OCaml value */
value Val_GdkTitlebarGesture(GdkTitlebarGesture val) {
  switch (val) {
    case GDK_TITLEBAR_GESTURE_DOUBLE_CLICK: return Val_int(1024125221); /* `DOUBLE_CLICK */
    case GDK_TITLEBAR_GESTURE_RIGHT_CLICK: return Val_int(73529339); /* `RIGHT_CLICK */
    case GDK_TITLEBAR_GESTURE_MIDDLE_CLICK: return Val_int(944842652); /* `MIDDLE_CLICK */
    default: return Val_int(1024125221); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkTitlebarGesture */
GdkTitlebarGesture GdkTitlebarGesture_val(value val) {
  int tag = Int_val(val);
  if (tag == 1024125221) return GDK_TITLEBAR_GESTURE_DOUBLE_CLICK; /* `DOUBLE_CLICK */
  else if (tag == 73529339) return GDK_TITLEBAR_GESTURE_RIGHT_CLICK; /* `RIGHT_CLICK */
  else if (tag == 944842652) return GDK_TITLEBAR_GESTURE_MIDDLE_CLICK; /* `MIDDLE_CLICK */
  else return GDK_TITLEBAR_GESTURE_DOUBLE_CLICK; /* fallback to first value */
}

/* Convert GdkTouchpadGesturePhase to OCaml value */
value Val_GdkTouchpadGesturePhase(GdkTouchpadGesturePhase val) {
  switch (val) {
    case GDK_TOUCHPAD_GESTURE_PHASE_BEGIN: return Val_int(890468887); /* `BEGIN */
    case GDK_TOUCHPAD_GESTURE_PHASE_UPDATE: return Val_int(139728055); /* `UPDATE */
    case GDK_TOUCHPAD_GESTURE_PHASE_END: return Val_int(735747473); /* `END */
    case GDK_TOUCHPAD_GESTURE_PHASE_CANCEL: return Val_int(809667861); /* `CANCEL */
    default: return Val_int(890468887); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkTouchpadGesturePhase */
GdkTouchpadGesturePhase GdkTouchpadGesturePhase_val(value val) {
  int tag = Int_val(val);
  if (tag == 890468887) return GDK_TOUCHPAD_GESTURE_PHASE_BEGIN; /* `BEGIN */
  else if (tag == 139728055) return GDK_TOUCHPAD_GESTURE_PHASE_UPDATE; /* `UPDATE */
  else if (tag == 735747473) return GDK_TOUCHPAD_GESTURE_PHASE_END; /* `END */
  else if (tag == 809667861) return GDK_TOUCHPAD_GESTURE_PHASE_CANCEL; /* `CANCEL */
  else return GDK_TOUCHPAD_GESTURE_PHASE_BEGIN; /* fallback to first value */
}

/* Convert GdkVulkanError to OCaml value */
value Val_GdkVulkanError(GdkVulkanError val) {
  switch (val) {
    case GDK_VULKAN_ERROR_UNSUPPORTED: return Val_int(217661174); /* `UNSUPPORTED */
    case GDK_VULKAN_ERROR_NOT_AVAILABLE: return Val_int(752838034); /* `NOT_AVAILABLE */
    default: return Val_int(217661174); /* fallback to first variant */
  }
}

/* Convert OCaml value to GdkVulkanError */
GdkVulkanError GdkVulkanError_val(value val) {
  int tag = Int_val(val);
  if (tag == 217661174) return GDK_VULKAN_ERROR_UNSUPPORTED; /* `UNSUPPORTED */
  else if (tag == 752838034) return GDK_VULKAN_ERROR_NOT_AVAILABLE; /* `NOT_AVAILABLE */
  else return GDK_VULKAN_ERROR_UNSUPPORTED; /* fallback to first value */
}

/* Convert GdkAnchorHints to OCaml flag list */
value Val_GdkAnchorHints(GdkAnchorHints flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GDK_ANCHOR_FLIP_X) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(351199843)); /* `FLIP_X */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_FLIP_Y) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(187706437)); /* `FLIP_Y */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_SLIDE_X) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(752064634)); /* `SLIDE_X */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_SLIDE_Y) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(643195136)); /* `SLIDE_Y */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_RESIZE_X) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(363557731)); /* `RESIZE_X */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_RESIZE_Y) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(128209067)); /* `RESIZE_Y */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_FLIP) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(555366453)); /* `FLIP */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_SLIDE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(562043938)); /* `SLIDE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ANCHOR_RESIZE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(310690795)); /* `RESIZE */
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
    if (tag == 351199843) result |= GDK_ANCHOR_FLIP_X; /* `FLIP_X */
    else if (tag == 187706437) result |= GDK_ANCHOR_FLIP_Y; /* `FLIP_Y */
    else if (tag == 752064634) result |= GDK_ANCHOR_SLIDE_X; /* `SLIDE_X */
    else if (tag == 643195136) result |= GDK_ANCHOR_SLIDE_Y; /* `SLIDE_Y */
    else if (tag == 363557731) result |= GDK_ANCHOR_RESIZE_X; /* `RESIZE_X */
    else if (tag == 128209067) result |= GDK_ANCHOR_RESIZE_Y; /* `RESIZE_Y */
    else if (tag == 555366453) result |= GDK_ANCHOR_FLIP; /* `FLIP */
    else if (tag == 562043938) result |= GDK_ANCHOR_SLIDE; /* `SLIDE */
    else if (tag == 310690795) result |= GDK_ANCHOR_RESIZE; /* `RESIZE */
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
    Store_field(cons, 0, Val_int(955083746)); /* `X */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_Y) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(933026350)); /* `Y */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_DELTA_X) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(73776336)); /* `DELTA_X */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_DELTA_Y) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(592538848)); /* `DELTA_Y */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_PRESSURE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(985619202)); /* `PRESSURE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_XTILT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(695861910)); /* `XTILT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_YTILT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(27734781)); /* `YTILT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_WHEEL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(821227771)); /* `WHEEL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_DISTANCE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(514724911)); /* `DISTANCE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_ROTATION) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(181583443)); /* `ROTATION */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_AXIS_FLAG_SLIDER) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(32742794)); /* `SLIDER */
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
    if (tag == 955083746) result |= GDK_AXIS_FLAG_X; /* `X */
    else if (tag == 933026350) result |= GDK_AXIS_FLAG_Y; /* `Y */
    else if (tag == 73776336) result |= GDK_AXIS_FLAG_DELTA_X; /* `DELTA_X */
    else if (tag == 592538848) result |= GDK_AXIS_FLAG_DELTA_Y; /* `DELTA_Y */
    else if (tag == 985619202) result |= GDK_AXIS_FLAG_PRESSURE; /* `PRESSURE */
    else if (tag == 695861910) result |= GDK_AXIS_FLAG_XTILT; /* `XTILT */
    else if (tag == 27734781) result |= GDK_AXIS_FLAG_YTILT; /* `YTILT */
    else if (tag == 821227771) result |= GDK_AXIS_FLAG_WHEEL; /* `WHEEL */
    else if (tag == 514724911) result |= GDK_AXIS_FLAG_DISTANCE; /* `DISTANCE */
    else if (tag == 181583443) result |= GDK_AXIS_FLAG_ROTATION; /* `ROTATION */
    else if (tag == 32742794) result |= GDK_AXIS_FLAG_SLIDER; /* `SLIDER */
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
    Store_field(cons, 0, Val_int(975536266)); /* `COPY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ACTION_MOVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(263902277)); /* `MOVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ACTION_LINK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(869638750)); /* `LINK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ACTION_ASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(910332021)); /* `ASK */
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
    if (tag == 975536266) result |= GDK_ACTION_COPY; /* `COPY */
    else if (tag == 263902277) result |= GDK_ACTION_MOVE; /* `MOVE */
    else if (tag == 869638750) result |= GDK_ACTION_LINK; /* `LINK */
    else if (tag == 910332021) result |= GDK_ACTION_ASK; /* `ASK */
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
    Store_field(cons, 0, Val_int(37469934)); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_FRAME_CLOCK_PHASE_FLUSH_EVENTS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(492419355)); /* `FLUSH_EVENTS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_FRAME_CLOCK_PHASE_BEFORE_PAINT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(316361880)); /* `BEFORE_PAINT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_FRAME_CLOCK_PHASE_UPDATE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(139728055)); /* `UPDATE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_FRAME_CLOCK_PHASE_LAYOUT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(666518986)); /* `LAYOUT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_FRAME_CLOCK_PHASE_PAINT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(9076380)); /* `PAINT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_FRAME_CLOCK_PHASE_RESUME_EVENTS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(131294097)); /* `RESUME_EVENTS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_FRAME_CLOCK_PHASE_AFTER_PAINT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(357564346)); /* `AFTER_PAINT */
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
    if (tag == 37469934) result |= GDK_FRAME_CLOCK_PHASE_NONE; /* `NONE */
    else if (tag == 492419355) result |= GDK_FRAME_CLOCK_PHASE_FLUSH_EVENTS; /* `FLUSH_EVENTS */
    else if (tag == 316361880) result |= GDK_FRAME_CLOCK_PHASE_BEFORE_PAINT; /* `BEFORE_PAINT */
    else if (tag == 139728055) result |= GDK_FRAME_CLOCK_PHASE_UPDATE; /* `UPDATE */
    else if (tag == 666518986) result |= GDK_FRAME_CLOCK_PHASE_LAYOUT; /* `LAYOUT */
    else if (tag == 9076380) result |= GDK_FRAME_CLOCK_PHASE_PAINT; /* `PAINT */
    else if (tag == 131294097) result |= GDK_FRAME_CLOCK_PHASE_RESUME_EVENTS; /* `RESUME_EVENTS */
    else if (tag == 357564346) result |= GDK_FRAME_CLOCK_PHASE_AFTER_PAINT; /* `AFTER_PAINT */
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
    Store_field(cons, 0, Val_int(833833007)); /* `GL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_GL_API_GLES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(878331014)); /* `GLES */
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
    if (tag == 833833007) result |= GDK_GL_API_GL; /* `GL */
    else if (tag == 878331014) result |= GDK_GL_API_GLES; /* `GLES */
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
    Store_field(cons, 0, Val_int(150307798)); /* `NO_MODIFIER_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SHIFT_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(542835378)); /* `SHIFT_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_LOCK_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(379156849)); /* `LOCK_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_CONTROL_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(865148937)); /* `CONTROL_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_ALT_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(372094854)); /* `ALT_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_BUTTON1_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(793459756)); /* `BUTTON1_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_BUTTON2_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1050678955)); /* `BUTTON2_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_BUTTON3_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(654195983)); /* `BUTTON3_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_BUTTON4_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(54794692)); /* `BUTTON4_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_BUTTON5_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1036970296)); /* `BUTTON5_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SUPER_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(588483180)); /* `SUPER_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_HYPER_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(66815660)); /* `HYPER_MASK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_META_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(177993795)); /* `META_MASK */
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
    if (tag == 150307798) result |= GDK_NO_MODIFIER_MASK; /* `NO_MODIFIER_MASK */
    else if (tag == 542835378) result |= GDK_SHIFT_MASK; /* `SHIFT_MASK */
    else if (tag == 379156849) result |= GDK_LOCK_MASK; /* `LOCK_MASK */
    else if (tag == 865148937) result |= GDK_CONTROL_MASK; /* `CONTROL_MASK */
    else if (tag == 372094854) result |= GDK_ALT_MASK; /* `ALT_MASK */
    else if (tag == 793459756) result |= GDK_BUTTON1_MASK; /* `BUTTON1_MASK */
    else if (tag == 1050678955) result |= GDK_BUTTON2_MASK; /* `BUTTON2_MASK */
    else if (tag == 654195983) result |= GDK_BUTTON3_MASK; /* `BUTTON3_MASK */
    else if (tag == 54794692) result |= GDK_BUTTON4_MASK; /* `BUTTON4_MASK */
    else if (tag == 1036970296) result |= GDK_BUTTON5_MASK; /* `BUTTON5_MASK */
    else if (tag == 588483180) result |= GDK_SUPER_MASK; /* `SUPER_MASK */
    else if (tag == 66815660) result |= GDK_HYPER_MASK; /* `HYPER_MASK */
    else if (tag == 177993795) result |= GDK_META_MASK; /* `META_MASK */
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
    Store_field(cons, 0, Val_int(583873574)); /* `SIZE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_PAINTABLE_STATIC_CONTENTS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(195045146)); /* `CONTENTS */
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
    if (tag == 583873574) result |= GDK_PAINTABLE_STATIC_SIZE; /* `SIZE */
    else if (tag == 195045146) result |= GDK_PAINTABLE_STATIC_CONTENTS; /* `CONTENTS */
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
    Store_field(cons, 0, Val_int(37469934)); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SEAT_CAPABILITY_POINTER) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(810814156)); /* `POINTER */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SEAT_CAPABILITY_TOUCH) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(706861047)); /* `TOUCH */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SEAT_CAPABILITY_TABLET_STYLUS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(281176756)); /* `TABLET_STYLUS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SEAT_CAPABILITY_KEYBOARD) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(414857422)); /* `KEYBOARD */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SEAT_CAPABILITY_TABLET_PAD) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(501079449)); /* `TABLET_PAD */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SEAT_CAPABILITY_ALL_POINTING) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(592486643)); /* `ALL_POINTING */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_SEAT_CAPABILITY_ALL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(96450141)); /* `ALL */
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
    if (tag == 37469934) result |= GDK_SEAT_CAPABILITY_NONE; /* `NONE */
    else if (tag == 810814156) result |= GDK_SEAT_CAPABILITY_POINTER; /* `POINTER */
    else if (tag == 706861047) result |= GDK_SEAT_CAPABILITY_TOUCH; /* `TOUCH */
    else if (tag == 281176756) result |= GDK_SEAT_CAPABILITY_TABLET_STYLUS; /* `TABLET_STYLUS */
    else if (tag == 414857422) result |= GDK_SEAT_CAPABILITY_KEYBOARD; /* `KEYBOARD */
    else if (tag == 501079449) result |= GDK_SEAT_CAPABILITY_TABLET_PAD; /* `TABLET_PAD */
    else if (tag == 592486643) result |= GDK_SEAT_CAPABILITY_ALL_POINTING; /* `ALL_POINTING */
    else if (tag == 96450141) result |= GDK_SEAT_CAPABILITY_ALL; /* `ALL */
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
    Store_field(cons, 0, Val_int(594101550)); /* `MINIMIZED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_MAXIMIZED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(711986207)); /* `MAXIMIZED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_STICKY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(175237035)); /* `STICKY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_FULLSCREEN) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(595577527)); /* `FULLSCREEN */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_ABOVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(505397855)); /* `ABOVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_BELOW) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(297501939)); /* `BELOW */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_FOCUSED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(759380304)); /* `FOCUSED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_TILED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(376942538)); /* `TILED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_TOP_TILED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(839874291)); /* `TOP_TILED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_TOP_RESIZABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(289979465)); /* `TOP_RESIZABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_RIGHT_TILED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1056434738)); /* `RIGHT_TILED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_RIGHT_RESIZABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(417027511)); /* `RIGHT_RESIZABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_BOTTOM_TILED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1050873149)); /* `BOTTOM_TILED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_BOTTOM_RESIZABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(669858202)); /* `BOTTOM_RESIZABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_LEFT_TILED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(77393939)); /* `LEFT_TILED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_LEFT_RESIZABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(934026838)); /* `LEFT_RESIZABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_TOPLEVEL_STATE_SUSPENDED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(1069706996)); /* `SUSPENDED */
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
    if (tag == 594101550) result |= GDK_TOPLEVEL_STATE_MINIMIZED; /* `MINIMIZED */
    else if (tag == 711986207) result |= GDK_TOPLEVEL_STATE_MAXIMIZED; /* `MAXIMIZED */
    else if (tag == 175237035) result |= GDK_TOPLEVEL_STATE_STICKY; /* `STICKY */
    else if (tag == 595577527) result |= GDK_TOPLEVEL_STATE_FULLSCREEN; /* `FULLSCREEN */
    else if (tag == 505397855) result |= GDK_TOPLEVEL_STATE_ABOVE; /* `ABOVE */
    else if (tag == 297501939) result |= GDK_TOPLEVEL_STATE_BELOW; /* `BELOW */
    else if (tag == 759380304) result |= GDK_TOPLEVEL_STATE_FOCUSED; /* `FOCUSED */
    else if (tag == 376942538) result |= GDK_TOPLEVEL_STATE_TILED; /* `TILED */
    else if (tag == 839874291) result |= GDK_TOPLEVEL_STATE_TOP_TILED; /* `TOP_TILED */
    else if (tag == 289979465) result |= GDK_TOPLEVEL_STATE_TOP_RESIZABLE; /* `TOP_RESIZABLE */
    else if (tag == 1056434738) result |= GDK_TOPLEVEL_STATE_RIGHT_TILED; /* `RIGHT_TILED */
    else if (tag == 417027511) result |= GDK_TOPLEVEL_STATE_RIGHT_RESIZABLE; /* `RIGHT_RESIZABLE */
    else if (tag == 1050873149) result |= GDK_TOPLEVEL_STATE_BOTTOM_TILED; /* `BOTTOM_TILED */
    else if (tag == 669858202) result |= GDK_TOPLEVEL_STATE_BOTTOM_RESIZABLE; /* `BOTTOM_RESIZABLE */
    else if (tag == 77393939) result |= GDK_TOPLEVEL_STATE_LEFT_TILED; /* `LEFT_TILED */
    else if (tag == 934026838) result |= GDK_TOPLEVEL_STATE_LEFT_RESIZABLE; /* `LEFT_RESIZABLE */
    else if (tag == 1069706996) result |= GDK_TOPLEVEL_STATE_SUSPENDED; /* `SUSPENDED */
    list = Field(list, 1);
  }
  return result;
}

