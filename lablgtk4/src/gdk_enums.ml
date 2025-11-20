(* GENERATED CODE - DO NOT EDIT *)
(* Gdk Enumeration and Bitfield Types *)

(* AxisUse - enumeration *)
type axisuse = [
  | `IGNORE
  | `X
  | `Y
  | `DELTA_X
  | `DELTA_Y
  | `PRESSURE
  | `XTILT
  | `YTILT
  | `WHEEL
  | `DISTANCE
  | `ROTATION
  | `SLIDER
  | `LAST
]

(* CrossingMode - enumeration *)
type crossingmode = [
  | `NORMAL
  | `GRAB
  | `UNGRAB
  | `GTK_GRAB
  | `GTK_UNGRAB
  | `STATE_CHANGED
  | `TOUCH_BEGIN
  | `TOUCH_END
  | `DEVICE_SWITCH
]

(* DevicePadFeature - enumeration *)
type devicepadfeature = [
  | `BUTTON
  | `RING
  | `STRIP
]

(* DeviceToolType - enumeration *)
type devicetooltype = [
  | `UNKNOWN
  | `PEN
  | `ERASER
  | `BRUSH
  | `PENCIL
  | `AIRBRUSH
  | `MOUSE
  | `LENS
]

(* DmabufError - enumeration *)
type dmabuferror = [
  | `NOT_AVAILABLE
  | `UNSUPPORTED_FORMAT
  | `CREATION_FAILED
]

(* DragCancelReason - enumeration *)
type dragcancelreason = [
  | `NO_TARGET
  | `USER_CANCELLED
  | `ERROR
]

(* EventType - enumeration *)
type eventtype = [
  | `DELETE
  | `MOTION_NOTIFY
  | `BUTTON_PRESS
  | `BUTTON_RELEASE
  | `KEY_PRESS
  | `KEY_RELEASE
  | `ENTER_NOTIFY
  | `LEAVE_NOTIFY
  | `FOCUS_CHANGE
  | `PROXIMITY_IN
  | `PROXIMITY_OUT
  | `DRAG_ENTER
  | `DRAG_LEAVE
  | `DRAG_MOTION
  | `DROP_START
  | `SCROLL
  | `GRAB_BROKEN
  | `TOUCH_BEGIN
  | `TOUCH_UPDATE
  | `TOUCH_END
  | `TOUCH_CANCEL
  | `TOUCHPAD_SWIPE
  | `TOUCHPAD_PINCH
  | `PAD_BUTTON_PRESS
  | `PAD_BUTTON_RELEASE
  | `PAD_RING
  | `PAD_STRIP
  | `PAD_GROUP_MODE
  | `TOUCHPAD_HOLD
  | `EVENT_LAST
]

(* FullscreenMode - enumeration *)
type fullscreenmode = [
  | `CURRENT_MONITOR
  | `ALL_MONITORS
]

(* GLError - enumeration *)
type glerror = [
  | `NOT_AVAILABLE
  | `UNSUPPORTED_FORMAT
  | `UNSUPPORTED_PROFILE
  | `COMPILATION_FAILED
  | `LINK_FAILED
]

(* Gravity - enumeration *)
type gravity = [
  | `NORTH_WEST
  | `NORTH
  | `NORTH_EAST
  | `WEST
  | `CENTER
  | `EAST
  | `SOUTH_WEST
  | `SOUTH
  | `SOUTH_EAST
  | `STATIC
]

(* InputSource - enumeration *)
type inputsource = [
  | `MOUSE
  | `PEN
  | `KEYBOARD
  | `TOUCHSCREEN
  | `TOUCHPAD
  | `TRACKPOINT
  | `TABLET_PAD
]

(* KeyMatch - enumeration *)
type keymatch = [
  | `NONE
  | `PARTIAL
  | `EXACT
]

(* MemoryFormat - enumeration *)
type memoryformat = [
  | `B8G8R8A8_PREMULTIPLIED
  | `A8R8G8B8_PREMULTIPLIED
  | `R8G8B8A8_PREMULTIPLIED
  | `B8G8R8A8
  | `A8R8G8B8
  | `R8G8B8A8
  | `A8B8G8R8
  | `R8G8B8
  | `B8G8R8
  | `R16G16B16
  | `R16G16B16A16_PREMULTIPLIED
  | `R16G16B16A16
  | `R16G16B16_FLOAT
  | `R16G16B16A16_FLOAT_PREMULTIPLIED
  | `R16G16B16A16_FLOAT
  | `R32G32B32_FLOAT
  | `R32G32B32A32_FLOAT_PREMULTIPLIED
  | `R32G32B32A32_FLOAT
  | `G8A8_PREMULTIPLIED
  | `G8A8
  | `G8
  | `G16A16_PREMULTIPLIED
  | `G16A16
  | `G16
  | `A8
  | `A16
  | `A16_FLOAT
  | `A32_FLOAT
  | `A8B8G8R8_PREMULTIPLIED
  | `B8G8R8X8
  | `X8R8G8B8
  | `R8G8B8X8
  | `X8B8G8R8
  | `N_FORMATS
]

(* NotifyType - enumeration *)
type notifytype = [
  | `ANCESTOR
  | `VIRTUAL
  | `INFERIOR
  | `NONLINEAR
  | `NONLINEAR_VIRTUAL
  | `UNKNOWN
]

(* ScrollDirection - enumeration *)
type scrolldirection = [
  | `UP
  | `DOWN
  | `LEFT
  | `RIGHT
  | `SMOOTH
]

(* ScrollUnit - enumeration *)
type scrollunit = [
  | `WHEEL
  | `SURFACE
]

(* SubpixelLayout - enumeration *)
type subpixellayout = [
  | `UNKNOWN
  | `NONE
  | `HORIZONTAL_RGB
  | `HORIZONTAL_BGR
  | `VERTICAL_RGB
  | `VERTICAL_BGR
]

(* SurfaceEdge - enumeration *)
type surfaceedge = [
  | `NORTH_WEST
  | `NORTH
  | `NORTH_EAST
  | `WEST
  | `EAST
  | `SOUTH_WEST
  | `SOUTH
  | `SOUTH_EAST
]

(* TextureError - enumeration *)
type textureerror = [
  | `TOO_LARGE
  | `CORRUPT_IMAGE
  | `UNSUPPORTED_CONTENT
  | `UNSUPPORTED_FORMAT
]

(* TitlebarGesture - enumeration *)
type titlebargesture = [
  | `DOUBLE_CLICK
  | `RIGHT_CLICK
  | `MIDDLE_CLICK
]

(* TouchpadGesturePhase - enumeration *)
type touchpadgesturephase = [
  | `BEGIN
  | `UPDATE
  | `END
  | `CANCEL
]

(* VulkanError - enumeration *)
type vulkanerror = [
  | `UNSUPPORTED
  | `NOT_AVAILABLE
]

(* AnchorHints - bitfield/flags *)
type anchorhints_flag = [
  | `FLIP_X
  | `FLIP_Y
  | `SLIDE_X
  | `SLIDE_Y
  | `RESIZE_X
  | `RESIZE_Y
  | `FLIP
  | `SLIDE
  | `RESIZE
]

type anchorhints = anchorhints_flag list

(* AxisFlags - bitfield/flags *)
type axisflags_flag = [
  | `X
  | `Y
  | `DELTA_X
  | `DELTA_Y
  | `PRESSURE
  | `XTILT
  | `YTILT
  | `WHEEL
  | `DISTANCE
  | `ROTATION
  | `SLIDER
]

type axisflags = axisflags_flag list

(* DragAction - bitfield/flags *)
type dragaction_flag = [
  | `COPY
  | `MOVE
  | `LINK
  | `ASK
]

type dragaction = dragaction_flag list

(* FrameClockPhase - bitfield/flags *)
type frameclockphase_flag = [
  | `NONE
  | `FLUSH_EVENTS
  | `BEFORE_PAINT
  | `UPDATE
  | `LAYOUT
  | `PAINT
  | `RESUME_EVENTS
  | `AFTER_PAINT
]

type frameclockphase = frameclockphase_flag list

(* GLAPI - bitfield/flags *)
type glapi_flag = [
  | `GL
  | `GLES
]

type glapi = glapi_flag list

(* ModifierType - bitfield/flags *)
type modifiertype_flag = [
  | `NO_MODIFIER_MASK
  | `SHIFT_MASK
  | `LOCK_MASK
  | `CONTROL_MASK
  | `ALT_MASK
  | `BUTTON1_MASK
  | `BUTTON2_MASK
  | `BUTTON3_MASK
  | `BUTTON4_MASK
  | `BUTTON5_MASK
  | `SUPER_MASK
  | `HYPER_MASK
  | `META_MASK
]

type modifiertype = modifiertype_flag list

(* PaintableFlags - bitfield/flags *)
type paintableflags_flag = [
  | `SIZE
  | `CONTENTS
]

type paintableflags = paintableflags_flag list

(* SeatCapabilities - bitfield/flags *)
type seatcapabilities_flag = [
  | `NONE
  | `POINTER
  | `TOUCH
  | `TABLET_STYLUS
  | `KEYBOARD
  | `TABLET_PAD
  | `ALL_POINTING
  | `ALL
]

type seatcapabilities = seatcapabilities_flag list

(* ToplevelState - bitfield/flags *)
type toplevelstate_flag = [
  | `MINIMIZED
  | `MAXIMIZED
  | `STICKY
  | `FULLSCREEN
  | `ABOVE
  | `BELOW
  | `FOCUSED
  | `TILED
  | `TOP_TILED
  | `TOP_RESIZABLE
  | `RIGHT_TILED
  | `RIGHT_RESIZABLE
  | `BOTTOM_TILED
  | `BOTTOM_RESIZABLE
  | `LEFT_TILED
  | `LEFT_RESIZABLE
  | `SUSPENDED
]

type toplevelstate = toplevelstate_flag list
