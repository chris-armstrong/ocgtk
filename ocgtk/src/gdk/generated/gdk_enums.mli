(* GENERATED CODE - DO NOT EDIT *)
(* Gdk Enumeration and Bitfield Types *)

(* AxisUse - enumeration *)
type axisuse = [
  (** the axis is ignored. *)
  | `IGNORE
  (** the axis is used as the x axis. *)
  | `X
  (** the axis is used as the y axis. *)
  | `Y
  (** the axis is used as the scroll x delta *)
  | `DELTA_X
  (** the axis is used as the scroll y delta *)
  | `DELTA_Y
  (** the axis is used for pressure information. *)
  | `PRESSURE
  (** the axis is used for x tilt information. *)
  | `XTILT
  (** the axis is used for y tilt information. *)
  | `YTILT
  (** the axis is used for wheel information. *)
  | `WHEEL
  (** the axis is used for pen/tablet distance information *)
  | `DISTANCE
  (** the axis is used for pen rotation information *)
  | `ROTATION
  (** the axis is used for pen slider information *)
  | `SLIDER
  (** a constant equal to the numerically highest axis value. *)
  | `LAST
]

(* CrossingMode - enumeration *)
type crossingmode = [
  (** crossing because of pointer motion. *)
  | `NORMAL
  (** crossing because a grab is activated. *)
  | `GRAB
  (** crossing because a grab is deactivated. *)
  | `UNGRAB
  (** crossing because a GTK grab is activated. *)
  | `GTK_GRAB
  (** crossing because a GTK grab is deactivated. *)
  | `GTK_UNGRAB
  (** crossing because a GTK widget changed
  state (e.g. sensitivity). *)
  | `STATE_CHANGED
  (** crossing because a touch sequence has begun,
  this event is synthetic as the pointer might have not left the surface. *)
  | `TOUCH_BEGIN
  (** crossing because a touch sequence has ended,
  this event is synthetic as the pointer might have not left the surface. *)
  | `TOUCH_END
  (** crossing because of a device switch (i.e.
  a mouse taking control of the pointer after a touch device), this event
  is synthetic as the pointer didn’t leave the surface. *)
  | `DEVICE_SWITCH
]

(* DevicePadFeature - enumeration *)
type devicepadfeature = [
  (** a button *)
  | `BUTTON
  (** a ring-shaped interactive area *)
  | `RING
  (** a straight interactive area *)
  | `STRIP
]

(* DeviceToolType - enumeration *)
type devicetooltype = [
  (** Tool is of an unknown type. *)
  | `UNKNOWN
  (** Tool is a standard tablet stylus. *)
  | `PEN
  (** Tool is standard tablet eraser. *)
  | `ERASER
  (** Tool is a brush stylus. *)
  | `BRUSH
  (** Tool is a pencil stylus. *)
  | `PENCIL
  (** Tool is an airbrush stylus. *)
  | `AIRBRUSH
  (** Tool is a mouse. *)
  | `MOUSE
  (** Tool is a lens cursor. *)
  | `LENS
]

(* DmabufError - enumeration *)
type dmabuferror = [
  (** Dmabuf support is not available, because the OS
  is not Linux, or it was explicitly disabled at compile- or runtime *)
  | `NOT_AVAILABLE
  (** The requested format is not supported *)
  | `UNSUPPORTED_FORMAT
  (** GTK failed to create the resource for other
  reasons *)
  | `CREATION_FAILED
]

(* DragCancelReason - enumeration *)
type dragcancelreason = [
  (** There is no suitable drop target. *)
  | `NO_TARGET
  (** Drag cancelled by the user *)
  | `USER_CANCELLED
  (** Unspecified error. *)
  | `ERROR
]

(* EventType - enumeration *)
type eventtype = [
  (** the window manager has requested that the toplevel surface be
  hidden or destroyed, usually when the user clicks on a special icon in the
  title bar. *)
  | `DELETE
  (** the pointer (usually a mouse) has moved. *)
  | `MOTION_NOTIFY
  (** a mouse button has been pressed. *)
  | `BUTTON_PRESS
  (** a mouse button has been released. *)
  | `BUTTON_RELEASE
  (** a key has been pressed. *)
  | `KEY_PRESS
  (** a key has been released. *)
  | `KEY_RELEASE
  (** the pointer has entered the surface. *)
  | `ENTER_NOTIFY
  (** the pointer has left the surface. *)
  | `LEAVE_NOTIFY
  (** the keyboard focus has entered or left the surface. *)
  | `FOCUS_CHANGE
  (** an input device has moved into contact with a sensing
  surface (e.g. a touchscreen or graphics tablet). *)
  | `PROXIMITY_IN
  (** an input device has moved out of contact with a sensing
  surface. *)
  | `PROXIMITY_OUT
  (** the mouse has entered the surface while a drag is in progress. *)
  | `DRAG_ENTER
  (** the mouse has left the surface while a drag is in progress. *)
  | `DRAG_LEAVE
  (** the mouse has moved in the surface while a drag is in
  progress. *)
  | `DRAG_MOTION
  (** a drop operation onto the surface has started. *)
  | `DROP_START
  (** the scroll wheel was turned *)
  | `SCROLL
  (** a pointer or keyboard grab was broken. *)
  | `GRAB_BROKEN
  (** A new touch event sequence has just started. *)
  | `TOUCH_BEGIN
  (** A touch event sequence has been updated. *)
  | `TOUCH_UPDATE
  (** A touch event sequence has finished. *)
  | `TOUCH_END
  (** A touch event sequence has been canceled. *)
  | `TOUCH_CANCEL
  (** A touchpad swipe gesture event, the current state
  is determined by its phase field. *)
  | `TOUCHPAD_SWIPE
  (** A touchpad pinch gesture event, the current state
  is determined by its phase field. *)
  | `TOUCHPAD_PINCH
  (** A tablet pad button press event. *)
  | `PAD_BUTTON_PRESS
  (** A tablet pad button release event. *)
  | `PAD_BUTTON_RELEASE
  (** A tablet pad axis event from a "ring". *)
  | `PAD_RING
  (** A tablet pad axis event from a "strip". *)
  | `PAD_STRIP
  (** A tablet pad group mode change. *)
  | `PAD_GROUP_MODE
  (** A touchpad hold gesture event, the current state is determined by its phase
field. *)
  | `TOUCHPAD_HOLD
  (** marks the end of the GdkEventType enumeration. *)
  | `EVENT_LAST
]

(* FullscreenMode - enumeration *)
type fullscreenmode = [
  (** Fullscreen on current monitor only. *)
  | `CURRENT_MONITOR
  (** Span across all monitors when fullscreen. *)
  | `ALL_MONITORS
]

(* GLError - enumeration *)
type glerror = [
  (** OpenGL support is not available *)
  | `NOT_AVAILABLE
  (** The requested visual format is not supported *)
  | `UNSUPPORTED_FORMAT
  (** The requested profile is not supported *)
  | `UNSUPPORTED_PROFILE
  (** The shader compilation failed *)
  | `COMPILATION_FAILED
  (** The shader linking failed *)
  | `LINK_FAILED
]

(* Gravity - enumeration *)
type gravity = [
  (** the reference point is at the top left corner. *)
  | `NORTH_WEST
  (** the reference point is in the middle of the top edge. *)
  | `NORTH
  (** the reference point is at the top right corner. *)
  | `NORTH_EAST
  (** the reference point is at the middle of the left edge. *)
  | `WEST
  (** the reference point is at the center of the surface. *)
  | `CENTER
  (** the reference point is at the middle of the right edge. *)
  | `EAST
  (** the reference point is at the lower left corner. *)
  | `SOUTH_WEST
  (** the reference point is at the middle of the lower edge. *)
  | `SOUTH
  (** the reference point is at the lower right corner. *)
  | `SOUTH_EAST
  (** the reference point is at the top left corner of the
 surface itself, ignoring window manager decorations. *)
  | `STATIC
]

(* InputSource - enumeration *)
type inputsource = [
  (** the device is a mouse. (This will be reported for the core
  pointer, even if it is something else, such as a trackball.) *)
  | `MOUSE
  (** the device is a stylus of a graphics tablet or similar device. *)
  | `PEN
  (** the device is a keyboard. *)
  | `KEYBOARD
  (** the device is a direct-input touch device, such
  as a touchscreen or tablet *)
  | `TOUCHSCREEN
  (** the device is an indirect touch device, such
  as a touchpad *)
  | `TOUCHPAD
  (** the device is a trackpoint *)
  | `TRACKPOINT
  (** the device is a "pad", a collection of buttons,
  rings and strips found in drawing tablets *)
  | `TABLET_PAD
]

(* KeyMatch - enumeration *)
type keymatch = [
  (** The key event does not match *)
  | `NONE
  (** The key event matches if keyboard state
  (specifically, the currently active group) is ignored *)
  | `PARTIAL
  (** The key event matches *)
  | `EXACT
]

(* MemoryFormat - enumeration *)
type memoryformat = [
  (** 4 bytes; for blue, green, red, alpha.
  The color values are premultiplied with the alpha value. *)
  | `B8G8R8A8_PREMULTIPLIED
  (** 4 bytes; for alpha, red, green, blue.
  The color values are premultiplied with the alpha value. *)
  | `A8R8G8B8_PREMULTIPLIED
  (** 4 bytes; for red, green, blue, alpha
  The color values are premultiplied with the alpha value. *)
  | `R8G8B8A8_PREMULTIPLIED
  (** 4 bytes; for blue, green, red, alpha. *)
  | `B8G8R8A8
  (** 4 bytes; for alpha, red, green, blue. *)
  | `A8R8G8B8
  (** 4 bytes; for red, green, blue, alpha. *)
  | `R8G8B8A8
  (** 4 bytes; for alpha, blue, green, red. *)
  | `A8B8G8R8
  (** 3 bytes; for red, green, blue. The data is opaque. *)
  | `R8G8B8
  (** 3 bytes; for blue, green, red. The data is opaque. *)
  | `B8G8R8
  (** 3 guint16 values; for red, green, blue. *)
  | `R16G16B16
  (** 4 guint16 values; for red, green, blue, alpha. The color values are
premultiplied with the alpha value. *)
  | `R16G16B16A16_PREMULTIPLIED
  (** 4 guint16 values; for red, green, blue, alpha. *)
  | `R16G16B16A16
  (** 3 half-float values; for red, green, blue. The data is opaque. *)
  | `R16G16B16_FLOAT
  (** 4 half-float values; for red, green, blue and alpha. The color values are
premultiplied with the alpha value. *)
  | `R16G16B16A16_FLOAT_PREMULTIPLIED
  (** 4 half-float values; for red, green, blue and alpha. *)
  | `R16G16B16A16_FLOAT
  (** 3 float values; for red, green, blue. *)
  | `R32G32B32_FLOAT
  (** 4 float values; for red, green, blue and alpha. The color values are
premultiplied with the alpha value. *)
  | `R32G32B32A32_FLOAT_PREMULTIPLIED
  (** 4 float values; for red, green, blue and alpha. *)
  | `R32G32B32A32_FLOAT
  (** 2 bytes; for grayscale, alpha. The color values are premultiplied with the
alpha value. *)
  | `G8A8_PREMULTIPLIED
  (** 2 bytes; for grayscale, alpha. *)
  | `G8A8
  (** One byte; for grayscale. The data is opaque. *)
  | `G8
  (** 2 guint16 values; for grayscale, alpha. The color values are premultiplied
with the alpha value. *)
  | `G16A16_PREMULTIPLIED
  (** 2 guint16 values; for grayscale, alpha. *)
  | `G16A16
  (** One guint16 value; for grayscale. The data is opaque. *)
  | `G16
  (** One byte; for alpha. *)
  | `A8
  (** One guint16 value; for alpha. *)
  | `A16
  (** One half-float value; for alpha. *)
  | `A16_FLOAT
  (** One float value; for alpha. *)
  | `A32_FLOAT
  (** 4 bytes; for alpha, blue, green, red, The color values are premultiplied with
the alpha value. *)
  | `A8B8G8R8_PREMULTIPLIED
  (** 4 bytes; for blue, green, red, unused. *)
  | `B8G8R8X8
  (** 4 bytes; for unused, red, green, blue. *)
  | `X8R8G8B8
  (** 4 bytes; for red, green, blue, unused. *)
  | `R8G8B8X8
  (** 4 bytes; for unused, blue, green, red. *)
  | `X8B8G8R8
  (** The number of formats. This value will change as
  more formats get added, so do not rely on its concrete integer. *)
  | `N_FORMATS
]

(* NotifyType - enumeration *)
type notifytype = [
  (** the surface is entered from an ancestor or
  left towards an ancestor. *)
  | `ANCESTOR
  (** the pointer moves between an ancestor and an
  inferior of the surface. *)
  | `VIRTUAL
  (** the surface is entered from an inferior or
  left towards an inferior. *)
  | `INFERIOR
  (** the surface is entered from or left towards
  a surface which is neither an ancestor nor an inferior. *)
  | `NONLINEAR
  (** the pointer moves between two surfaces
  which are not ancestors of each other and the surface is part of
  the ancestor chain between one of these surfaces and their least
  common ancestor. *)
  | `NONLINEAR_VIRTUAL
  (** an unknown type of enter/leave event occurred. *)
  | `UNKNOWN
]

(* ScrollDirection - enumeration *)
type scrolldirection = [
  (** the surface is scrolled up. *)
  | `UP
  (** the surface is scrolled down. *)
  | `DOWN
  (** the surface is scrolled to the left. *)
  | `LEFT
  (** the surface is scrolled to the right. *)
  | `RIGHT
  (** the scrolling is determined by the delta values
  in scroll events. See gdk_scroll_event_get_deltas() *)
  | `SMOOTH
]

(* ScrollUnit - enumeration *)
type scrollunit = [
  (** The delta is in number of wheel clicks. *)
  | `WHEEL
  (** The delta is in surface pixels to scroll directly
  on screen. *)
  | `SURFACE
]

(* SubpixelLayout - enumeration *)
type subpixellayout = [
  (** The layout is not known *)
  | `UNKNOWN
  (** Not organized in this way *)
  | `NONE
  (** The layout is horizontal, the order is RGB *)
  | `HORIZONTAL_RGB
  (** The layout is horizontal, the order is BGR *)
  | `HORIZONTAL_BGR
  (** The layout is vertical, the order is RGB *)
  | `VERTICAL_RGB
  (** The layout is vertical, the order is BGR *)
  | `VERTICAL_BGR
]

(* SurfaceEdge - enumeration *)
type surfaceedge = [
  (** the top left corner. *)
  | `NORTH_WEST
  (** the top edge. *)
  | `NORTH
  (** the top right corner. *)
  | `NORTH_EAST
  (** the left edge. *)
  | `WEST
  (** the right edge. *)
  | `EAST
  (** the lower left corner. *)
  | `SOUTH_WEST
  (** the lower edge. *)
  | `SOUTH
  (** the lower right corner. *)
  | `SOUTH_EAST
]

(* TextureError - enumeration *)
type textureerror = [
  (** Not enough memory to handle this image *)
  | `TOO_LARGE
  (** The image data appears corrupted *)
  | `CORRUPT_IMAGE
  (** The image contains features
  that cannot be loaded *)
  | `UNSUPPORTED_CONTENT
  (** The image format is not supported *)
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
  (** The gesture has begun. *)
  | `BEGIN
  (** The gesture has been updated. *)
  | `UPDATE
  (** The gesture was finished, changes
  should be permanently applied. *)
  | `END
  (** The gesture was cancelled, all
  changes should be undone. *)
  | `CANCEL
]

(* VulkanError - enumeration *)
type vulkanerror = [
  (** Vulkan is not supported on this backend or has not been
  compiled in. *)
  | `UNSUPPORTED
  (** Vulkan support is not available on this Surface *)
  | `NOT_AVAILABLE
]

(* AnchorHints - bitfield/flags *)
type anchorhints_flag = [
  (** allow flipping anchors horizontally *)
  | `FLIP_X
  (** allow flipping anchors vertically *)
  | `FLIP_Y
  (** allow sliding surface horizontally *)
  | `SLIDE_X
  (** allow sliding surface vertically *)
  | `SLIDE_Y
  (** allow resizing surface horizontally *)
  | `RESIZE_X
  (** allow resizing surface vertically *)
  | `RESIZE_Y
  (** allow flipping anchors on both axes *)
  | `FLIP
  (** allow sliding surface on both axes *)
  | `SLIDE
  (** allow resizing surface on both axes *)
  | `RESIZE
]

type anchorhints = anchorhints_flag list

(* AxisFlags - bitfield/flags *)
type axisflags_flag = [
  (** X axis is present *)
  | `X
  (** Y axis is present *)
  | `Y
  (** Scroll X delta axis is present *)
  | `DELTA_X
  (** Scroll Y delta axis is present *)
  | `DELTA_Y
  (** Pressure axis is present *)
  | `PRESSURE
  (** X tilt axis is present *)
  | `XTILT
  (** Y tilt axis is present *)
  | `YTILT
  (** Wheel axis is present *)
  | `WHEEL
  (** Distance axis is present *)
  | `DISTANCE
  (** Z-axis rotation is present *)
  | `ROTATION
  (** Slider axis is present *)
  | `SLIDER
]

type axisflags = axisflags_flag list

(* DragAction - bitfield/flags *)
type dragaction_flag = [
  (** Copy the data. *)
  | `COPY
  (** Move the data, i.e. first copy it, then delete
  it from the source using the DELETE target of the X selection protocol. *)
  | `MOVE
  (** Add a link to the data. Note that this is only
  useful if source and destination agree on what it means, and is not
  supported on all platforms. *)
  | `LINK
  (** Ask the user what to do with the data. *)
  | `ASK
]

type dragaction = dragaction_flag list

(* FrameClockPhase - bitfield/flags *)
type frameclockphase_flag = [
  (** no phase *)
  | `NONE
  (** corresponds to GdkFrameClock::flush-events. Should not be handled by applications. *)
  | `FLUSH_EVENTS
  (** corresponds to GdkFrameClock::before-paint. Should not be handled by applications. *)
  | `BEFORE_PAINT
  (** corresponds to GdkFrameClock::update. *)
  | `UPDATE
  (** corresponds to GdkFrameClock::layout. Should not be handled by applications. *)
  | `LAYOUT
  (** corresponds to GdkFrameClock::paint. *)
  | `PAINT
  (** corresponds to GdkFrameClock::resume-events. Should not be handled by applications. *)
  | `RESUME_EVENTS
  (** corresponds to GdkFrameClock::after-paint. Should not be handled by applications. *)
  | `AFTER_PAINT
]

type frameclockphase = frameclockphase_flag list

(* GLAPI - bitfield/flags *)
type glapi_flag = [
  (** The OpenGL API *)
  | `GL
  (** The OpenGL ES API *)
  | `GLES
]

type glapi = glapi_flag list

(* ModifierType - bitfield/flags *)
type modifiertype_flag = [
  (** No modifier. *)
  | `NO_MODIFIER_MASK
  (** the Shift key. *)
  | `SHIFT_MASK
  (** a Lock key (depending on the modifier mapping of the
 X server this may either be CapsLock or ShiftLock). *)
  | `LOCK_MASK
  (** the Control key. *)
  | `CONTROL_MASK
  (** the fourth modifier key (it depends on the modifier
 mapping of the X server which key is interpreted as this modifier, but
 normally it is the Alt key). *)
  | `ALT_MASK
  (** the first mouse button. *)
  | `BUTTON1_MASK
  (** the second mouse button. *)
  | `BUTTON2_MASK
  (** the third mouse button. *)
  | `BUTTON3_MASK
  (** the fourth mouse button. *)
  | `BUTTON4_MASK
  (** the fifth mouse button. *)
  | `BUTTON5_MASK
  (** the Super modifier *)
  | `SUPER_MASK
  (** the Hyper modifier *)
  | `HYPER_MASK
  (** the Meta modifier *)
  | `META_MASK
]

type modifiertype = modifiertype_flag list

(* PaintableFlags - bitfield/flags *)
type paintableflags_flag = [
  (** The size is immutable.
  The [signal@Gdk.Paintable::invalidate-size] signal will never be
  emitted. *)
  | `SIZE
  (** The content is immutable.
  The [signal@Gdk.Paintable::invalidate-contents] signal will never be
  emitted. *)
  | `CONTENTS
]

type paintableflags = paintableflags_flag list

(* SeatCapabilities - bitfield/flags *)
type seatcapabilities_flag = [
  (** No input capabilities *)
  | `NONE
  (** The seat has a pointer (e.g. mouse) *)
  | `POINTER
  (** The seat has touchscreen(s) attached *)
  | `TOUCH
  (** The seat has drawing tablet(s) attached *)
  | `TABLET_STYLUS
  (** The seat has keyboard(s) attached *)
  | `KEYBOARD
  (** The seat has drawing tablet pad(s) attached *)
  | `TABLET_PAD
  (** The union of all pointing capabilities *)
  | `ALL_POINTING
  (** The union of all capabilities *)
  | `ALL
]

type seatcapabilities = seatcapabilities_flag list

(* ToplevelState - bitfield/flags *)
type toplevelstate_flag = [
  (** the surface is minimized *)
  | `MINIMIZED
  (** the surface is maximized *)
  | `MAXIMIZED
  (** the surface is sticky *)
  | `STICKY
  (** the surface is maximized without decorations *)
  | `FULLSCREEN
  (** the surface is kept above other surfaces *)
  | `ABOVE
  (** the surface is kept below other surfaces *)
  | `BELOW
  (** the surface is presented as focused (with active decorations) *)
  | `FOCUSED
  (** the surface is in a tiled state *)
  | `TILED
  (** whether the top edge is tiled *)
  | `TOP_TILED
  (** whether the top edge is resizable *)
  | `TOP_RESIZABLE
  (** whether the right edge is tiled *)
  | `RIGHT_TILED
  (** whether the right edge is resizable *)
  | `RIGHT_RESIZABLE
  (** whether the bottom edge is tiled *)
  | `BOTTOM_TILED
  (** whether the bottom edge is resizable *)
  | `BOTTOM_RESIZABLE
  (** whether the left edge is tiled *)
  | `LEFT_TILED
  (** whether the left edge is resizable *)
  | `LEFT_RESIZABLE
  (** the surface is not visible to the user *)
  | `SUSPENDED
]

type toplevelstate = toplevelstate_flag list

