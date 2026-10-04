(* GENERATED CODE - DO NOT EDIT *)
(* Gdk Enumeration and Bitfield Types *)

(* AxisUse - enumeration *)
type axisuse = [
  | `IGNORE (** the axis is ignored. *)
  | `X (** the axis is used as the x axis. *)
  | `Y (** the axis is used as the y axis. *)
  | `DELTA_X (** the axis is used as the scroll x delta *)
  | `DELTA_Y (** the axis is used as the scroll y delta *)
  | `PRESSURE (** the axis is used for pressure information. *)
  | `XTILT (** the axis is used for x tilt information. *)
  | `YTILT (** the axis is used for y tilt information. *)
  | `WHEEL (** the axis is used for wheel information. *)
  | `DISTANCE (** the axis is used for pen/tablet distance information *)
  | `ROTATION (** the axis is used for pen rotation information *)
  | `SLIDER (** the axis is used for pen slider information *)
  | `LAST (** a constant equal to the numerically highest axis value. *)
]

val axisuse_of_int : int -> axisuse
val axisuse_to_int : axisuse -> int

(* CicpRange - enumeration *)
type cicprange = [
  | `NARROW (** The values use the range of 16-235 (for Y) and 16-240 for u and v. *)
  | `FULL (** The values use the full range. *)
]

val cicprange_of_int : int -> cicprange
val cicprange_to_int : cicprange -> int

(* CrossingMode - enumeration *)
type crossingmode = [
  | `NORMAL (** crossing because of pointer motion. *)
  | `GRAB (** crossing because a grab is activated. *)
  | `UNGRAB (** crossing because a grab is deactivated. *)
  | `GTK_GRAB (** crossing because a GTK grab is activated. *)
  | `GTK_UNGRAB (** crossing because a GTK grab is deactivated. *)
  | `STATE_CHANGED (** crossing because a GTK widget changed
state (e.g. sensitivity). *)
  | `TOUCH_BEGIN (** crossing because a touch sequence has begun,
this event is synthetic as the pointer might have not left the surface. *)
  | `TOUCH_END (** crossing because a touch sequence has ended,
this event is synthetic as the pointer might have not left the surface. *)
  | `DEVICE_SWITCH (** crossing because of a device switch (i.e.
a mouse taking control of the pointer after a touch device), this event
is synthetic as the pointer didn’t leave the surface. *)
]

val crossingmode_of_int : int -> crossingmode
val crossingmode_to_int : crossingmode -> int

(* DevicePadFeature - enumeration *)
type devicepadfeature = [
  | `BUTTON (** a button *)
  | `RING (** a ring-shaped interactive area *)
  | `STRIP (** a straight interactive area *)
]

val devicepadfeature_of_int : int -> devicepadfeature
val devicepadfeature_to_int : devicepadfeature -> int

(* DeviceToolType - enumeration *)
type devicetooltype = [
  | `UNKNOWN (** Tool is of an unknown type. *)
  | `PEN (** Tool is a standard tablet stylus. *)
  | `ERASER (** Tool is standard tablet eraser. *)
  | `BRUSH (** Tool is a brush stylus. *)
  | `PENCIL (** Tool is a pencil stylus. *)
  | `AIRBRUSH (** Tool is an airbrush stylus. *)
  | `MOUSE (** Tool is a mouse. *)
  | `LENS (** Tool is a lens cursor. *)
]

val devicetooltype_of_int : int -> devicetooltype
val devicetooltype_to_int : devicetooltype -> int

(* DmabufError - enumeration *)
type dmabuferror = [
  | `NOT_AVAILABLE (** Dmabuf support is not available, because the OS
is not Linux, or it was explicitly disabled at compile- or runtime *)
  | `UNSUPPORTED_FORMAT (** The requested format is not supported *)
  | `CREATION_FAILED (** GTK failed to create the resource for other
reasons *)
]

val dmabuferror_of_int : int -> dmabuferror
val dmabuferror_to_int : dmabuferror -> int

(* DragCancelReason - enumeration *)
type dragcancelreason = [
  | `NO_TARGET (** There is no suitable drop target. *)
  | `USER_CANCELLED (** Drag cancelled by the user *)
  | `ERROR (** Unspecified error. *)
]

val dragcancelreason_of_int : int -> dragcancelreason
val dragcancelreason_to_int : dragcancelreason -> int

(* EventType - enumeration *)
type eventtype = [
  | `DELETE (** the window manager has requested that the toplevel surface be
hidden or destroyed, usually when the user clicks on a special icon in the
title bar. *)
  | `MOTION_NOTIFY (** the pointer (usually a mouse) has moved. *)
  | `BUTTON_PRESS (** a mouse button has been pressed. *)
  | `BUTTON_RELEASE (** a mouse button has been released. *)
  | `KEY_PRESS (** a key has been pressed. *)
  | `KEY_RELEASE (** a key has been released. *)
  | `ENTER_NOTIFY (** the pointer has entered the surface. *)
  | `LEAVE_NOTIFY (** the pointer has left the surface. *)
  | `FOCUS_CHANGE (** the keyboard focus has entered or left the surface. *)
  | `PROXIMITY_IN (** an input device has moved into contact with a sensing
surface (e.g. a touchscreen or graphics tablet). *)
  | `PROXIMITY_OUT (** an input device has moved out of contact with a sensing
surface. *)
  | `DRAG_ENTER (** the mouse has entered the surface while a drag is in progress. *)
  | `DRAG_LEAVE (** the mouse has left the surface while a drag is in progress. *)
  | `DRAG_MOTION (** the mouse has moved in the surface while a drag is in
progress. *)
  | `DROP_START (** a drop operation onto the surface has started. *)
  | `SCROLL (** the scroll wheel was turned *)
  | `GRAB_BROKEN (** a pointer or keyboard grab was broken. *)
  | `TOUCH_BEGIN (** A new touch event sequence has just started. *)
  | `TOUCH_UPDATE (** A touch event sequence has been updated. *)
  | `TOUCH_END (** A touch event sequence has finished. *)
  | `TOUCH_CANCEL (** A touch event sequence has been canceled. *)
  | `TOUCHPAD_SWIPE (** A touchpad swipe gesture event, the current state
is determined by its phase field. *)
  | `TOUCHPAD_PINCH (** A touchpad pinch gesture event, the current state
is determined by its phase field. *)
  | `PAD_BUTTON_PRESS (** A tablet pad button press event. *)
  | `PAD_BUTTON_RELEASE (** A tablet pad button release event. *)
  | `PAD_RING [@ocaml.doc "A tablet pad axis event from a \"ring\"."]
  | `PAD_STRIP [@ocaml.doc "A tablet pad axis event from a \"strip\"."]
  | `PAD_GROUP_MODE (** A tablet pad group mode change. *)
  | `TOUCHPAD_HOLD (** A touchpad hold gesture event, the current state is determined by its phase
field. *)
  | `PAD_DIAL [@ocaml.doc "A tablet pad axis event from a \"dial\"."]
  | `EVENT_LAST (** marks the end of the GdkEventType enumeration. *)
]

val eventtype_of_int : int -> eventtype
val eventtype_to_int : eventtype -> int

(* FullscreenMode - enumeration *)
type fullscreenmode = [
  | `CURRENT_MONITOR (** Fullscreen on current monitor only. *)
  | `ALL_MONITORS (** Span across all monitors when fullscreen. *)
]

val fullscreenmode_of_int : int -> fullscreenmode
val fullscreenmode_to_int : fullscreenmode -> int

(* GLError - enumeration *)
type glerror = [
  | `NOT_AVAILABLE (** OpenGL support is not available *)
  | `UNSUPPORTED_FORMAT (** The requested visual format is not supported *)
  | `UNSUPPORTED_PROFILE (** The requested profile is not supported *)
  | `COMPILATION_FAILED (** The shader compilation failed *)
  | `LINK_FAILED (** The shader linking failed *)
]

val glerror_of_int : int -> glerror
val glerror_to_int : glerror -> int

(* Gravity - enumeration *)
type gravity = [
  | `NORTH_WEST (** the reference point is at the top left corner. *)
  | `NORTH (** the reference point is in the middle of the top edge. *)
  | `NORTH_EAST (** the reference point is at the top right corner. *)
  | `WEST (** the reference point is at the middle of the left edge. *)
  | `CENTER (** the reference point is at the center of the surface. *)
  | `EAST (** the reference point is at the middle of the right edge. *)
  | `SOUTH_WEST (** the reference point is at the lower left corner. *)
  | `SOUTH (** the reference point is at the middle of the lower edge. *)
  | `SOUTH_EAST (** the reference point is at the lower right corner. *)
  | `STATIC (** the reference point is at the top left corner of the
surface itself, ignoring window manager decorations. *)
]

val gravity_of_int : int -> gravity
val gravity_to_int : gravity -> int

(* InputSource - enumeration *)
type inputsource = [
  | `MOUSE (** the device is a mouse. (This will be reported for the core
pointer, even if it is something else, such as a trackball.) *)
  | `PEN (** the device is a stylus of a graphics tablet or similar device. *)
  | `KEYBOARD (** the device is a keyboard. *)
  | `TOUCHSCREEN (** the device is a direct-input touch device, such
as a touchscreen or tablet *)
  | `TOUCHPAD (** the device is an indirect touch device, such
as a touchpad *)
  | `TRACKPOINT (** the device is a trackpoint *)
  | `TABLET_PAD [@ocaml.doc "the device is a \"pad\", a collection of buttons,
rings and strips found in drawing tablets"]
]

val inputsource_of_int : int -> inputsource
val inputsource_to_int : inputsource -> int

(* KeyMatch - enumeration *)
type keymatch = [
  | `NONE (** The key event does not match *)
  | `PARTIAL (** The key event matches if keyboard state
(specifically, the currently active group) is ignored *)
  | `EXACT (** The key event matches *)
]

val keymatch_of_int : int -> keymatch
val keymatch_to_int : keymatch -> int

(* MemoryFormat - enumeration *)
type memoryformat = [
  | `B8G8R8A8_PREMULTIPLIED (** 4 bytes; for blue, green, red, alpha.
The color values are premultiplied with the alpha value. *)
  | `A8R8G8B8_PREMULTIPLIED (** 4 bytes; for alpha, red, green, blue.
The color values are premultiplied with the alpha value. *)
  | `R8G8B8A8_PREMULTIPLIED (** 4 bytes; for red, green, blue, alpha
The color values are premultiplied with the alpha value. *)
  | `B8G8R8A8 (** 4 bytes; for blue, green, red, alpha. *)
  | `A8R8G8B8 (** 4 bytes; for alpha, red, green, blue. *)
  | `R8G8B8A8 (** 4 bytes; for red, green, blue, alpha. *)
  | `A8B8G8R8 (** 4 bytes; for alpha, blue, green, red. *)
  | `R8G8B8 (** 3 bytes; for red, green, blue. The data is opaque. *)
  | `B8G8R8 (** 3 bytes; for blue, green, red. The data is opaque. *)
  | `R16G16B16 (** 3 guint16 values; for red, green, blue. *)
  | `R16G16B16A16_PREMULTIPLIED (** 4 guint16 values; for red, green, blue, alpha. The color values are
premultiplied with the alpha value. *)
  | `R16G16B16A16 (** 4 guint16 values; for red, green, blue, alpha. *)
  | `R16G16B16_FLOAT (** 3 half-float values; for red, green, blue. The data is opaque. *)
  | `R16G16B16A16_FLOAT_PREMULTIPLIED (** 4 half-float values; for red, green, blue and alpha. The color values are
premultiplied with the alpha value. *)
  | `R16G16B16A16_FLOAT (** 4 half-float values; for red, green, blue and alpha. *)
  | `R32G32B32_FLOAT (** 3 float values; for red, green, blue. *)
  | `R32G32B32A32_FLOAT_PREMULTIPLIED (** 4 float values; for red, green, blue and alpha. The color values are
premultiplied with the alpha value. *)
  | `R32G32B32A32_FLOAT (** 4 float values; for red, green, blue and alpha. *)
  | `G8A8_PREMULTIPLIED (** 2 bytes; for grayscale, alpha. The color values are premultiplied with the
alpha value. *)
  | `G8A8 (** 2 bytes; for grayscale, alpha. *)
  | `G8 (** One byte; for grayscale. The data is opaque. *)
  | `G16A16_PREMULTIPLIED (** 2 guint16 values; for grayscale, alpha. The color values are premultiplied
with the alpha value. *)
  | `G16A16 (** 2 guint16 values; for grayscale, alpha. *)
  | `G16 (** One guint16 value; for grayscale. The data is opaque. *)
  | `A8 (** One byte; for alpha. *)
  | `A16 (** One guint16 value; for alpha. *)
  | `A16_FLOAT (** One half-float value; for alpha. *)
  | `A32_FLOAT (** One float value; for alpha. *)
  | `A8B8G8R8_PREMULTIPLIED (** 4 bytes; for alpha, blue, green, red, The color values are premultiplied with
the alpha value. *)
  | `B8G8R8X8 (** 4 bytes; for blue, green, red, unused. *)
  | `X8R8G8B8 (** 4 bytes; for unused, red, green, blue. *)
  | `R8G8B8X8 (** 4 bytes; for red, green, blue, unused. *)
  | `X8B8G8R8 (** 4 bytes; for unused, blue, green, red. *)
  | `G8_B8R8_420 [@ocaml.doc "Multiplane format with 2 planes.

The first plane contains the first channel, usually containing
luma values.
The second plane with interleaved chroma values, Cb followed by Cr.
Subsampled in both the X and Y direction.

Commonly known by the fourcc \"NV12\"."]
  | `G8_R8B8_420 [@ocaml.doc "Multiplane format with 2 planes.

The first plane contains the first channel, usually containing
luma values.
The second plane with interleaved chroma values, Cr followed by Cb.
Subsampled in both the X and Y direction.

Commonly known by the fourcc \"NV21\"."]
  | `G8_B8R8_422 [@ocaml.doc "Multiplane format with 2 planes.

The first plane contains the first channel, usually containing
luma values.
The second plane with interleaved chroma values, Cb followed by Cr.
Subsampled in the X direction.

Commonly known by the fourcc \"NV16\"."]
  | `G8_R8B8_422 [@ocaml.doc "Multiplane format with 2 planes.

The first plane contains the first channel, usually containing
luma values.
The second plane with interleaved chroma values, Cr followed by Cb.
Subsampled in the X direction.

Commonly known by the fourcc \"NV61\"."]
  | `G8_B8R8_444 [@ocaml.doc "Multiplane format with 2 planes.

The first plane contains the first channel, usually containing
luma values.
The second plane with interleaved chroma values, Cb followed by Cr.
This format is not subsampled.

Commonly known by the fourcc \"NV24\"."]
  | `G8_R8B8_444 [@ocaml.doc "Multiplane format with 2 planes.

The first plane contains the first channel, usually containing
luma values.
The second plane with interleaved chroma values, Cr followed by Cb.
This format is not subsampled.

Commonly known by the fourcc \"NV42\"."]
  | `G10X6_B10X6R10X6_420 [@ocaml.doc "Multiplane format with 2 planes.

Each channel is a 16 bit integer, but only the highest 10 bits are used.

The first plane contains the first channel, usually containing
luma values.
The second plane with interleaved chroma values, Cr followed by Cb.
This format is not subsampled.

Commonly known by the fourcc \"P010\"."]
  | `G12X4_B12X4R12X4_420 [@ocaml.doc "Multiplane format with 2 planes.

Each channel is a 16 bit integer, but only the highest 10 bits are used.

The first plane contains the first channel, usually containing
luma values.
The second plane with interleaved chroma values, Cr followed by Cb.
This format is not subsampled.

Commonly known by the fourcc \"P012\"."]
  | `G16_B16R16_420 [@ocaml.doc "Multiplane format with 2 planes.

Each channel is a 16 bit integer.

The first plane contains the first channel, usually containing
luma values.
The second plane with interleaved chroma values, Cr followed by Cb.
This format is not subsampled.

Commonly known by the fourcc \"P016\"."]
  | `G8_B8_R8_410 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 8 bit integer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the first chroma chanel.
Subsampled in both the X and Y direction with 4:1 ratio. It is
mapped into the 3rd channel.

The third plane usually contains the second chroma channel.
Subsampled in both the X and Y direction with 4:1 ratio. It is
mapped into the 1st channel.

Commonly known by the fourcc \"YUV410\"."]
  | `G8_R8_B8_410 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 8 bit integer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the second chroma chanel.
Subsampled in both the X and Y direction with 4:1 ratio. It is
mapped into the 1st channel.

The third plane usually contains the first chroma channel.
Subsampled in both the X and Y direction with 4:1 ratio. It is
mapped into the 3rd channel.

Commonly known by the fourcc \"YVU410\"."]
  | `G8_B8_R8_411 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 8 bit integer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the first chroma chanel.
Subsampled in the X direction with 4:1 ratio. It is
mapped into the 3rd channel.

The third plane usually contains the second chroma channel.
Subsampled in the X direction with 4:1 ratio. It is
mapped into the 1st channel.

Commonly known by the fourcc \"YUV411\"."]
  | `G8_R8_B8_411 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 8 bit integer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the second chroma chanel.
Subsampled in the X direction with 4:1 ratio. It is
mapped into the 1st channel.

The third plane usually contains the first chroma channel.
Subsampled in the X direction with 4:1 ratio. It is
mapped into the 3rd channel.

Commonly known by the fourcc \"YVU411\"."]
  | `G8_B8_R8_420 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 8 bit integer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the first chroma chanel.
Subsampled in both the X and Y direction. It is mapped into the
3rd channel.

The third plane usually contains the second chroma channel.
Subsampled in both the X and Y direction. It is mapped into the
1st channel.

Commonly known by the fourcc \"YUV420\"."]
  | `G8_R8_B8_420 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 8 bit integer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the second chroma chanel.
Subsampled in both the X and Y direction. It is mapped into the
1st channel.

The third plane usually contains the first chroma channel.
Subsampled in both the X and Y direction. It is mapped into the
3rd channel.

Commonly known by the fourcc \"YVU420\"."]
  | `G8_B8_R8_422 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 8 bit integer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the first chroma chanel.
Subsampled in the X direction. It is mapped into the 3rd channel.

The third plane usually contains the second chroma channel.
Subsampled in the X direction. It is mapped into the 1st channel.

Commonly known by the fourcc \"YUV422\"."]
  | `G8_R8_B8_422 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 8 bit integer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the second chroma chanel.
Subsampled in the X direction. It is mapped into the 1st channel.

The third plane usually contains the first chroma channel.
Subsampled in the X direction. It is mapped into the 3rd channel.

Commonly known by the fourcc \"YVU422\"."]
  | `G8_B8_R8_444 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 8 bit integer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the first chroma chanel. It is
mapped into the 3rd channel.

The third plane usually contains the second chroma channel. It is
mapped into the 1st channel.

Commonly known by the fourcc \"YUV444\"."]
  | `G8_R8_B8_444 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 8 bit integer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the second chroma chanel.
Subsampled in the X direction. It is mapped into the 1st channel.

The third plane usually contains the first chroma channel.
Subsampled in the X direction. It is mapped into the 3rd channel.

Commonly known by the fourcc \"YVU444\"."]
  | `G8B8G8R8_422 [@ocaml.doc "Packed format with subsampled channels.

Each channel is a 8 bit integer. The red and blue/chroma channels
are subsampled and interleaved with the green/luma channel.

Each block contains 2 pixels, so the width must be a multiple of
2.

Commonly known by the fourcc \"YUYV\"."]
  | `G8R8G8B8_422 [@ocaml.doc "Packed format with subsampled channels.

Each channel is a 8 bit integer. The red and blue/chroma channels
are subsampled and interleaved with the green/luma channel.

Each block contains 2 pixels, so the width must be a multiple of
2.

Commonly known by the fourcc \"YVYU\"."]
  | `R8G8B8G8_422 [@ocaml.doc "Packed format with subsampled channels.

Each channel is a 8 bit integer. The red and blue/chroma channels
are subsampled and interleaved with the green/luma channel.

Each block contains 2 pixels, so the width must be a multiple of
2.

Commonly known by the fourcc \"VYUY\"."]
  | `B8G8R8G8_422 [@ocaml.doc "Packed format with subsampled channels.

Each channel is a 8 bit integer. The red and blue/chroma channels
are subsampled and interleaved with the green/luma channel.

Each block contains 2 pixels, so the width must be a multiple of
2.

Commonly known by the fourcc \"UYVY\"."]
  | `X6G10_X6B10_X6R10_420 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 16 bit integer.

Only the 10 lower bits are used. The remaining ones must be set to 0 by the
producer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the first chroma chanel.
Subsampled in both the X and Y direction. It is mapped into the
3rd channel.

The third plane usually contains the second chroma channel.
Subsampled in both the X and Y direction. It is mapped into the
1st channel.

Commonly known by the fourcc \"S010\"."]
  | `X6G10_X6B10_X6R10_422 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 16 bit integer.

Only the 10 lower bits are used. The remaining ones must be set to 0 by the
producer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the first chroma chanel.
Subsampled in the X direction. It is mapped into the 3rd channel.

The third plane usually contains the second chroma channel.
Subsampled in the X direction. It is mapped into the 1st channel.

Commonly known by the fourcc \"S210\"."]
  | `X6G10_X6B10_X6R10_444 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 16 bit integer.

Only the 10 lower bits are used. The remaining ones must be set to 0 by the
producer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the first chroma chanel. It is
mapped into the 3rd channel.

The third plane usually contains the second chroma channel. It is
mapped into the 1st channel.

Commonly known by the fourcc \"S410\"."]
  | `X4G12_X4B12_X4R12_420 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 16 bit integer.

Only the 12 lower bits are used. The remaining ones must be set to 0 by the
producer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the first chroma chanel.
Subsampled in both the X and Y direction. It is mapped into the
3rd channel.

The third plane usually contains the second chroma channel.
Subsampled in both the X and Y direction. It is mapped into the
1st channel.

Commonly known by the fourcc \"S012\"."]
  | `X4G12_X4B12_X4R12_422 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 16 bit integer.

Only the 12 lower bits are used. The remaining ones must be set to 0 by the
producer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the first chroma chanel.
Subsampled in the X direction. It is mapped into the 3rd channel.

The third plane usually contains the second chroma channel.
Subsampled in the X direction. It is mapped into the 1st channel.

Commonly known by the fourcc \"S212\"."]
  | `X4G12_X4B12_X4R12_444 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 16 bit integer.

Only the 12 lower bits are used. The remaining ones must be set to 0 by the
producer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the first chroma chanel. It is
mapped into the 3rd channel.

The third plane usually contains the second chroma channel. It is
mapped into the 1st channel.

Commonly known by the fourcc \"S412\"."]
  | `G16_B16_R16_420 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 16 bit integer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the first chroma chanel.
Subsampled in both the X and Y direction. It is mapped into the
3rd channel.

The third plane usually contains the second chroma channel.
Subsampled in both the X and Y direction. It is mapped into the
1st channel.

Commonly known by the fourcc \"S016\"."]
  | `G16_B16_R16_422 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 16 bit integer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the first chroma chanel.
Subsampled in the X direction. It is mapped into the 3rd channel.

The third plane usually contains the second chroma channel.
Subsampled in the X direction. It is mapped into the 1st channel.

Commonly known by the fourcc \"S216\"."]
  | `G16_B16_R16_444 [@ocaml.doc "Multiplane format with 3 planes.

Each channel is a 16 bit integer.

The first plane usually contains the luma channel. It is mapped
into the 2nd channel.

The second plane usually contains the first chroma chanel. It is
mapped into the 3rd channel.

The third plane usually contains the second chroma channel. It is
mapped into the 1st channel.

Commonly known by the fourcc \"S416\"."]
  | `N_FORMATS (** The number of formats. This value will change as
more formats get added, so do not rely on its concrete integer. *)
]

val memoryformat_of_int : int -> memoryformat
val memoryformat_to_int : memoryformat -> int

(* NotifyType - enumeration *)
type notifytype = [
  | `ANCESTOR (** the surface is entered from an ancestor or
left towards an ancestor. *)
  | `VIRTUAL (** the pointer moves between an ancestor and an
inferior of the surface. *)
  | `INFERIOR (** the surface is entered from an inferior or
left towards an inferior. *)
  | `NONLINEAR (** the surface is entered from or left towards
a surface which is neither an ancestor nor an inferior. *)
  | `NONLINEAR_VIRTUAL (** the pointer moves between two surfaces
which are not ancestors of each other and the surface is part of
the ancestor chain between one of these surfaces and their least
common ancestor. *)
  | `UNKNOWN (** an unknown type of enter/leave event occurred. *)
]

val notifytype_of_int : int -> notifytype
val notifytype_to_int : notifytype -> int

(* ScrollDirection - enumeration *)
type scrolldirection = [
  | `UP (** the surface is scrolled up. *)
  | `DOWN (** the surface is scrolled down. *)
  | `LEFT (** the surface is scrolled to the left. *)
  | `RIGHT (** the surface is scrolled to the right. *)
  | `SMOOTH (** the scrolling is determined by the delta values
in scroll events. See gdk_scroll_event_get_deltas() *)
]

val scrolldirection_of_int : int -> scrolldirection
val scrolldirection_to_int : scrolldirection -> int

(* ScrollRelativeDirection - enumeration *)
type scrollrelativedirection = [
  | `IDENTICAL (** Physical motion and event motion are the same *)
  | `INVERTED (** Physical motion is inverted relative to event motion *)
  | `UNKNOWN (** Relative motion is unknown on this device or backend *)
]

val scrollrelativedirection_of_int : int -> scrollrelativedirection
val scrollrelativedirection_to_int : scrollrelativedirection -> int

(* ScrollUnit - enumeration *)
type scrollunit = [
  | `WHEEL (** The delta is in number of wheel clicks. *)
  | `SURFACE (** The delta is in surface pixels to scroll directly
on screen. *)
]

val scrollunit_of_int : int -> scrollunit
val scrollunit_to_int : scrollunit -> int

(* SubpixelLayout - enumeration *)
type subpixellayout = [
  | `UNKNOWN (** The layout is not known *)
  | `NONE (** Not organized in this way *)
  | `HORIZONTAL_RGB (** The layout is horizontal, the order is RGB *)
  | `HORIZONTAL_BGR (** The layout is horizontal, the order is BGR *)
  | `VERTICAL_RGB (** The layout is vertical, the order is RGB *)
  | `VERTICAL_BGR (** The layout is vertical, the order is BGR *)
]

val subpixellayout_of_int : int -> subpixellayout
val subpixellayout_to_int : subpixellayout -> int

(* SurfaceEdge - enumeration *)
type surfaceedge = [
  | `NORTH_WEST (** the top left corner. *)
  | `NORTH (** the top edge. *)
  | `NORTH_EAST (** the top right corner. *)
  | `WEST (** the left edge. *)
  | `EAST (** the right edge. *)
  | `SOUTH_WEST (** the lower left corner. *)
  | `SOUTH (** the lower edge. *)
  | `SOUTH_EAST (** the lower right corner. *)
]

val surfaceedge_of_int : int -> surfaceedge
val surfaceedge_to_int : surfaceedge -> int

(* TextureError - enumeration *)
type textureerror = [
  | `TOO_LARGE (** Not enough memory to handle this image *)
  | `CORRUPT_IMAGE (** The image data appears corrupted *)
  | `UNSUPPORTED_CONTENT (** The image contains features
that cannot be loaded *)
  | `UNSUPPORTED_FORMAT (** The image format is not supported *)
]

val textureerror_of_int : int -> textureerror
val textureerror_to_int : textureerror -> int

(* TitlebarGesture - enumeration *)
type titlebargesture = [
  | `DOUBLE_CLICK (** double click gesture *)
  | `RIGHT_CLICK (** right click gesture *)
  | `MIDDLE_CLICK (** middle click gesture *)
]

val titlebargesture_of_int : int -> titlebargesture
val titlebargesture_to_int : titlebargesture -> int

(* TouchpadGesturePhase - enumeration *)
type touchpadgesturephase = [
  | `BEGIN (** The gesture has begun. *)
  | `UPDATE (** The gesture has been updated. *)
  | `END (** The gesture was finished, changes
should be permanently applied. *)
  | `CANCEL (** The gesture was cancelled, all
changes should be undone. *)
]

val touchpadgesturephase_of_int : int -> touchpadgesturephase
val touchpadgesturephase_to_int : touchpadgesturephase -> int

(* VulkanError - enumeration *)
type vulkanerror = [
  | `UNSUPPORTED (** Vulkan is not supported on this backend or has not been
compiled in. *)
  | `NOT_AVAILABLE (** Vulkan support is not available on this Surface *)
]

val vulkanerror_of_int : int -> vulkanerror
val vulkanerror_to_int : vulkanerror -> int

(* AnchorHints - bitfield/flags *)
type anchorhints_flag = [
  | `FLIP_X (** allow flipping anchors horizontally *)
  | `FLIP_Y (** allow flipping anchors vertically *)
  | `SLIDE_X (** allow sliding surface horizontally *)
  | `SLIDE_Y (** allow sliding surface vertically *)
  | `RESIZE_X (** allow resizing surface horizontally *)
  | `RESIZE_Y (** allow resizing surface vertically *)
  | `FLIP (** allow flipping anchors on both axes *)
  | `SLIDE (** allow sliding surface on both axes *)
  | `RESIZE (** allow resizing surface on both axes *)
]

type anchorhints = anchorhints_flag list

val anchorhints_of_int : int -> anchorhints
val anchorhints_to_int : anchorhints -> int

(* AxisFlags - bitfield/flags *)
type axisflags_flag = [
  | `X (** X axis is present *)
  | `Y (** Y axis is present *)
  | `DELTA_X (** Scroll X delta axis is present *)
  | `DELTA_Y (** Scroll Y delta axis is present *)
  | `PRESSURE (** Pressure axis is present *)
  | `XTILT (** X tilt axis is present *)
  | `YTILT (** Y tilt axis is present *)
  | `WHEEL (** Wheel axis is present *)
  | `DISTANCE (** Distance axis is present *)
  | `ROTATION (** Z-axis rotation is present *)
  | `SLIDER (** Slider axis is present *)
]

type axisflags = axisflags_flag list

val axisflags_of_int : int -> axisflags
val axisflags_to_int : axisflags -> int

(* DragAction - bitfield/flags *)
type dragaction_flag = [
  | `NONE (** No action. *)
  | `COPY (** Copy the data. *)
  | `MOVE (** Move the data, i.e. first copy it, then delete
it from the source using the DELETE target of the X selection protocol. *)
  | `LINK (** Add a link to the data. Note that this is only
useful if source and destination agree on what it means, and is not
supported on all platforms. *)
  | `ASK (** Ask the user what to do with the data. *)
]

type dragaction = dragaction_flag list

val dragaction_of_int : int -> dragaction
val dragaction_to_int : dragaction -> int

(* FrameClockPhase - bitfield/flags *)
type frameclockphase_flag = [
  | `NONE (** no phase *)
  | `FLUSH_EVENTS (** corresponds to GdkFrameClock::flush-events. Should not be handled by applications. *)
  | `BEFORE_PAINT (** corresponds to GdkFrameClock::before-paint. Should not be handled by applications. *)
  | `UPDATE (** corresponds to GdkFrameClock::update. *)
  | `LAYOUT (** corresponds to GdkFrameClock::layout. Should not be handled by applications. *)
  | `PAINT (** corresponds to GdkFrameClock::paint. *)
  | `RESUME_EVENTS (** corresponds to GdkFrameClock::resume-events. Should not be handled by applications. *)
  | `AFTER_PAINT (** corresponds to GdkFrameClock::after-paint. Should not be handled by applications. *)
]

type frameclockphase = frameclockphase_flag list

val frameclockphase_of_int : int -> frameclockphase
val frameclockphase_to_int : frameclockphase -> int

(* GLAPI - bitfield/flags *)
type glapi_flag = [
  | `GL (** The OpenGL API *)
  | `GLES (** The OpenGL ES API *)
]

type glapi = glapi_flag list

val glapi_of_int : int -> glapi
val glapi_to_int : glapi -> int

(* ModifierType - bitfield/flags *)
type modifiertype_flag = [
  | `NO_MODIFIER_MASK (** No modifier. *)
  | `SHIFT_MASK (** the Shift key. *)
  | `LOCK_MASK (** a Lock key (depending on the Windowing System configuration,
this may either be <kbd>CapsLock</kbd> or <kbd>ShiftLock</kbd>). *)
  | `CONTROL_MASK (** the Control key. *)
  | `ALT_MASK (** the fourth modifier key (it depends on the Windowing System
configuration which key is interpreted as this modifier, but normally it
is the <kbd>Alt</kbd> key). *)
  | `BUTTON1_MASK (** the first mouse button. *)
  | `BUTTON2_MASK (** the second mouse button. *)
  | `BUTTON3_MASK (** the third mouse button. *)
  | `BUTTON4_MASK (** the fourth mouse button. *)
  | `BUTTON5_MASK (** the fifth mouse button. *)
  | `SUPER_MASK (** the Super modifier. *)
  | `HYPER_MASK (** the Hyper modifier. *)
  | `META_MASK (** the Meta modifier. Maps to Command on macOS. *)
]

type modifiertype = modifiertype_flag list

val modifiertype_of_int : int -> modifiertype
val modifiertype_to_int : modifiertype -> int

(* PaintableFlags - bitfield/flags *)
type paintableflags_flag = [
  | `SIZE (** The size is immutable.
The [Gdk.Paintable::invalidate-size] signal will never be
emitted. *)
  | `CONTENTS (** The content is immutable.
The [Gdk.Paintable::invalidate-contents] signal will never be
emitted. *)
]

type paintableflags = paintableflags_flag list

val paintableflags_of_int : int -> paintableflags
val paintableflags_to_int : paintableflags -> int

(* SeatCapabilities - bitfield/flags *)
type seatcapabilities_flag = [
  | `NONE (** No input capabilities *)
  | `POINTER (** The seat has a pointer (e.g. mouse) *)
  | `TOUCH (** The seat has touchscreen(s) attached *)
  | `TABLET_STYLUS (** The seat has drawing tablet(s) attached *)
  | `KEYBOARD (** The seat has keyboard(s) attached *)
  | `TABLET_PAD (** The seat has drawing tablet pad(s) attached *)
  | `ALL_POINTING (** The union of all pointing capabilities *)
  | `ALL (** The union of all capabilities *)
]

type seatcapabilities = seatcapabilities_flag list

val seatcapabilities_of_int : int -> seatcapabilities
val seatcapabilities_to_int : seatcapabilities -> int

(* ToplevelCapabilities - bitfield/flags *)
type toplevelcapabilities_flag = [
  | `EDGE_CONSTRAINTS (** Whether tiled window states are supported. *)
  | `INHIBIT_SHORTCUTS (** Whether inhibiting system shortcuts is supported.
See [Gdk.Toplevel.inhibit_system_shortcuts]. *)
  | `TITLEBAR_GESTURES (** Whether titlebar gestures are supported.
See [Gdk.Toplevel.titlebar_gesture]. *)
  | `WINDOW_MENU (** Whether showing the window menu is supported.
See [Gdk.Toplevel.show_window_menu]. *)
  | `MAXIMIZE (** Whether the toplevel can be maximized. *)
  | `FULLSCREEN (** Whether the toplevel can be made fullscreen. *)
  | `MINIMIZE (** Whether the toplevel can be minimized.
See [Gdk.Toplevel.minimize]. *)
  | `LOWER (** Whether the toplevel can be lowered.
See [Gdk.Toplevel.lower]. *)
]

type toplevelcapabilities = toplevelcapabilities_flag list

val toplevelcapabilities_of_int : int -> toplevelcapabilities
val toplevelcapabilities_to_int : toplevelcapabilities -> int

(* ToplevelState - bitfield/flags *)
type toplevelstate_flag = [
  | `MINIMIZED (** the surface is minimized *)
  | `MAXIMIZED (** the surface is maximized *)
  | `STICKY (** the surface is sticky *)
  | `FULLSCREEN (** the surface is maximized without decorations *)
  | `ABOVE (** the surface is kept above other surfaces *)
  | `BELOW (** the surface is kept below other surfaces *)
  | `FOCUSED (** the surface is presented as focused (with active decorations) *)
  | `TILED (** the surface is in a tiled state *)
  | `TOP_TILED (** whether the top edge is tiled *)
  | `TOP_RESIZABLE (** whether the top edge is resizable *)
  | `RIGHT_TILED (** whether the right edge is tiled *)
  | `RIGHT_RESIZABLE (** whether the right edge is resizable *)
  | `BOTTOM_TILED (** whether the bottom edge is tiled *)
  | `BOTTOM_RESIZABLE (** whether the bottom edge is resizable *)
  | `LEFT_TILED (** whether the left edge is tiled *)
  | `LEFT_RESIZABLE (** whether the left edge is resizable *)
  | `SUSPENDED (** The surface is not visible to the user. *)
]

type toplevelstate = toplevelstate_flag list

val toplevelstate_of_int : int -> toplevelstate
val toplevelstate_to_int : toplevelstate -> int

