(* GENERATED CODE - DO NOT EDIT *)
(* Gdk Enumeration and Bitfield Converters *)

type axisuse =
  [ `IGNORE
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
  | `LAST ]

let axisuse_of_int n =
  match n with
  | 0 -> `IGNORE
  | 1 -> `X
  | 2 -> `Y
  | 3 -> `DELTA_X
  | 4 -> `DELTA_Y
  | 5 -> `PRESSURE
  | 6 -> `XTILT
  | 7 -> `YTILT
  | 8 -> `WHEEL
  | 9 -> `DISTANCE
  | 10 -> `ROTATION
  | 11 -> `SLIDER
  | 12 -> `LAST
  | n -> failwith (Printf.sprintf "AxisUse: unknown int %d" n)

let axisuse_to_int v =
  match v with
  | `IGNORE -> 0
  | `X -> 1
  | `Y -> 2
  | `DELTA_X -> 3
  | `DELTA_Y -> 4
  | `PRESSURE -> 5
  | `XTILT -> 6
  | `YTILT -> 7
  | `WHEEL -> 8
  | `DISTANCE -> 9
  | `ROTATION -> 10
  | `SLIDER -> 11
  | `LAST -> 12

type crossingmode =
  [ `NORMAL
  | `GRAB
  | `UNGRAB
  | `GTK_GRAB
  | `GTK_UNGRAB
  | `STATE_CHANGED
  | `TOUCH_BEGIN
  | `TOUCH_END
  | `DEVICE_SWITCH ]

let crossingmode_of_int n =
  match n with
  | 0 -> `NORMAL
  | 1 -> `GRAB
  | 2 -> `UNGRAB
  | 3 -> `GTK_GRAB
  | 4 -> `GTK_UNGRAB
  | 5 -> `STATE_CHANGED
  | 6 -> `TOUCH_BEGIN
  | 7 -> `TOUCH_END
  | 8 -> `DEVICE_SWITCH
  | n -> failwith (Printf.sprintf "CrossingMode: unknown int %d" n)

let crossingmode_to_int v =
  match v with
  | `NORMAL -> 0
  | `GRAB -> 1
  | `UNGRAB -> 2
  | `GTK_GRAB -> 3
  | `GTK_UNGRAB -> 4
  | `STATE_CHANGED -> 5
  | `TOUCH_BEGIN -> 6
  | `TOUCH_END -> 7
  | `DEVICE_SWITCH -> 8

type devicepadfeature = [ `BUTTON | `RING | `STRIP ]

let devicepadfeature_of_int n =
  match n with
  | 0 -> `BUTTON
  | 1 -> `RING
  | 2 -> `STRIP
  | n -> failwith (Printf.sprintf "DevicePadFeature: unknown int %d" n)

let devicepadfeature_to_int v =
  match v with `BUTTON -> 0 | `RING -> 1 | `STRIP -> 2

type devicetooltype =
  [ `UNKNOWN | `PEN | `ERASER | `BRUSH | `PENCIL | `AIRBRUSH | `MOUSE | `LENS ]

let devicetooltype_of_int n =
  match n with
  | 0 -> `UNKNOWN
  | 1 -> `PEN
  | 2 -> `ERASER
  | 3 -> `BRUSH
  | 4 -> `PENCIL
  | 5 -> `AIRBRUSH
  | 6 -> `MOUSE
  | 7 -> `LENS
  | n -> failwith (Printf.sprintf "DeviceToolType: unknown int %d" n)

let devicetooltype_to_int v =
  match v with
  | `UNKNOWN -> 0
  | `PEN -> 1
  | `ERASER -> 2
  | `BRUSH -> 3
  | `PENCIL -> 4
  | `AIRBRUSH -> 5
  | `MOUSE -> 6
  | `LENS -> 7

type dmabuferror = [ `NOT_AVAILABLE | `UNSUPPORTED_FORMAT | `CREATION_FAILED ]

let dmabuferror_of_int n =
  match n with
  | 0 -> `NOT_AVAILABLE
  | 1 -> `UNSUPPORTED_FORMAT
  | 2 -> `CREATION_FAILED
  | n -> failwith (Printf.sprintf "DmabufError: unknown int %d" n)

let dmabuferror_to_int v =
  match v with
  | `NOT_AVAILABLE -> 0
  | `UNSUPPORTED_FORMAT -> 1
  | `CREATION_FAILED -> 2

type dragcancelreason = [ `NO_TARGET | `USER_CANCELLED | `ERROR ]

let dragcancelreason_of_int n =
  match n with
  | 0 -> `NO_TARGET
  | 1 -> `USER_CANCELLED
  | 2 -> `ERROR
  | n -> failwith (Printf.sprintf "DragCancelReason: unknown int %d" n)

let dragcancelreason_to_int v =
  match v with `NO_TARGET -> 0 | `USER_CANCELLED -> 1 | `ERROR -> 2

type eventtype =
  [ `DELETE
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
  | `EVENT_LAST ]

let eventtype_of_int n =
  match n with
  | 0 -> `DELETE
  | 1 -> `MOTION_NOTIFY
  | 2 -> `BUTTON_PRESS
  | 3 -> `BUTTON_RELEASE
  | 4 -> `KEY_PRESS
  | 5 -> `KEY_RELEASE
  | 6 -> `ENTER_NOTIFY
  | 7 -> `LEAVE_NOTIFY
  | 8 -> `FOCUS_CHANGE
  | 9 -> `PROXIMITY_IN
  | 10 -> `PROXIMITY_OUT
  | 11 -> `DRAG_ENTER
  | 12 -> `DRAG_LEAVE
  | 13 -> `DRAG_MOTION
  | 14 -> `DROP_START
  | 15 -> `SCROLL
  | 16 -> `GRAB_BROKEN
  | 17 -> `TOUCH_BEGIN
  | 18 -> `TOUCH_UPDATE
  | 19 -> `TOUCH_END
  | 20 -> `TOUCH_CANCEL
  | 21 -> `TOUCHPAD_SWIPE
  | 22 -> `TOUCHPAD_PINCH
  | 23 -> `PAD_BUTTON_PRESS
  | 24 -> `PAD_BUTTON_RELEASE
  | 25 -> `PAD_RING
  | 26 -> `PAD_STRIP
  | 27 -> `PAD_GROUP_MODE
  | 28 -> `TOUCHPAD_HOLD
  | 29 -> `EVENT_LAST
  | n -> failwith (Printf.sprintf "EventType: unknown int %d" n)

let eventtype_to_int v =
  match v with
  | `DELETE -> 0
  | `MOTION_NOTIFY -> 1
  | `BUTTON_PRESS -> 2
  | `BUTTON_RELEASE -> 3
  | `KEY_PRESS -> 4
  | `KEY_RELEASE -> 5
  | `ENTER_NOTIFY -> 6
  | `LEAVE_NOTIFY -> 7
  | `FOCUS_CHANGE -> 8
  | `PROXIMITY_IN -> 9
  | `PROXIMITY_OUT -> 10
  | `DRAG_ENTER -> 11
  | `DRAG_LEAVE -> 12
  | `DRAG_MOTION -> 13
  | `DROP_START -> 14
  | `SCROLL -> 15
  | `GRAB_BROKEN -> 16
  | `TOUCH_BEGIN -> 17
  | `TOUCH_UPDATE -> 18
  | `TOUCH_END -> 19
  | `TOUCH_CANCEL -> 20
  | `TOUCHPAD_SWIPE -> 21
  | `TOUCHPAD_PINCH -> 22
  | `PAD_BUTTON_PRESS -> 23
  | `PAD_BUTTON_RELEASE -> 24
  | `PAD_RING -> 25
  | `PAD_STRIP -> 26
  | `PAD_GROUP_MODE -> 27
  | `TOUCHPAD_HOLD -> 28
  | `EVENT_LAST -> 29

type fullscreenmode = [ `CURRENT_MONITOR | `ALL_MONITORS ]

let fullscreenmode_of_int n =
  match n with
  | 0 -> `CURRENT_MONITOR
  | 1 -> `ALL_MONITORS
  | n -> failwith (Printf.sprintf "FullscreenMode: unknown int %d" n)

let fullscreenmode_to_int v =
  match v with `CURRENT_MONITOR -> 0 | `ALL_MONITORS -> 1

type glerror =
  [ `NOT_AVAILABLE
  | `UNSUPPORTED_FORMAT
  | `UNSUPPORTED_PROFILE
  | `COMPILATION_FAILED
  | `LINK_FAILED ]

let glerror_of_int n =
  match n with
  | 0 -> `NOT_AVAILABLE
  | 1 -> `UNSUPPORTED_FORMAT
  | 2 -> `UNSUPPORTED_PROFILE
  | 3 -> `COMPILATION_FAILED
  | 4 -> `LINK_FAILED
  | n -> failwith (Printf.sprintf "GLError: unknown int %d" n)

let glerror_to_int v =
  match v with
  | `NOT_AVAILABLE -> 0
  | `UNSUPPORTED_FORMAT -> 1
  | `UNSUPPORTED_PROFILE -> 2
  | `COMPILATION_FAILED -> 3
  | `LINK_FAILED -> 4

type gravity =
  [ `NORTH_WEST
  | `NORTH
  | `NORTH_EAST
  | `WEST
  | `CENTER
  | `EAST
  | `SOUTH_WEST
  | `SOUTH
  | `SOUTH_EAST
  | `STATIC ]

let gravity_of_int n =
  match n with
  | 1 -> `NORTH_WEST
  | 2 -> `NORTH
  | 3 -> `NORTH_EAST
  | 4 -> `WEST
  | 5 -> `CENTER
  | 6 -> `EAST
  | 7 -> `SOUTH_WEST
  | 8 -> `SOUTH
  | 9 -> `SOUTH_EAST
  | 10 -> `STATIC
  | n -> failwith (Printf.sprintf "Gravity: unknown int %d" n)

let gravity_to_int v =
  match v with
  | `NORTH_WEST -> 1
  | `NORTH -> 2
  | `NORTH_EAST -> 3
  | `WEST -> 4
  | `CENTER -> 5
  | `EAST -> 6
  | `SOUTH_WEST -> 7
  | `SOUTH -> 8
  | `SOUTH_EAST -> 9
  | `STATIC -> 10

type inputsource =
  [ `MOUSE
  | `PEN
  | `KEYBOARD
  | `TOUCHSCREEN
  | `TOUCHPAD
  | `TRACKPOINT
  | `TABLET_PAD ]

let inputsource_of_int n =
  match n with
  | 0 -> `MOUSE
  | 1 -> `PEN
  | 2 -> `KEYBOARD
  | 3 -> `TOUCHSCREEN
  | 4 -> `TOUCHPAD
  | 5 -> `TRACKPOINT
  | 6 -> `TABLET_PAD
  | n -> failwith (Printf.sprintf "InputSource: unknown int %d" n)

let inputsource_to_int v =
  match v with
  | `MOUSE -> 0
  | `PEN -> 1
  | `KEYBOARD -> 2
  | `TOUCHSCREEN -> 3
  | `TOUCHPAD -> 4
  | `TRACKPOINT -> 5
  | `TABLET_PAD -> 6

type keymatch = [ `NONE | `PARTIAL | `EXACT ]

let keymatch_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `PARTIAL
  | 2 -> `EXACT
  | n -> failwith (Printf.sprintf "KeyMatch: unknown int %d" n)

let keymatch_to_int v = match v with `NONE -> 0 | `PARTIAL -> 1 | `EXACT -> 2

type memoryformat =
  [ `B8G8R8A8_PREMULTIPLIED
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
  | `N_FORMATS ]

let memoryformat_of_int n =
  match n with
  | 0 -> `B8G8R8A8_PREMULTIPLIED
  | 1 -> `A8R8G8B8_PREMULTIPLIED
  | 2 -> `R8G8B8A8_PREMULTIPLIED
  | 3 -> `B8G8R8A8
  | 4 -> `A8R8G8B8
  | 5 -> `R8G8B8A8
  | 6 -> `A8B8G8R8
  | 7 -> `R8G8B8
  | 8 -> `B8G8R8
  | 9 -> `R16G16B16
  | 10 -> `R16G16B16A16_PREMULTIPLIED
  | 11 -> `R16G16B16A16
  | 12 -> `R16G16B16_FLOAT
  | 13 -> `R16G16B16A16_FLOAT_PREMULTIPLIED
  | 14 -> `R16G16B16A16_FLOAT
  | 15 -> `R32G32B32_FLOAT
  | 16 -> `R32G32B32A32_FLOAT_PREMULTIPLIED
  | 17 -> `R32G32B32A32_FLOAT
  | 18 -> `G8A8_PREMULTIPLIED
  | 19 -> `G8A8
  | 20 -> `G8
  | 21 -> `G16A16_PREMULTIPLIED
  | 22 -> `G16A16
  | 23 -> `G16
  | 24 -> `A8
  | 25 -> `A16
  | 26 -> `A16_FLOAT
  | 27 -> `A32_FLOAT
  | 28 -> `A8B8G8R8_PREMULTIPLIED
  | 29 -> `B8G8R8X8
  | 30 -> `X8R8G8B8
  | 31 -> `R8G8B8X8
  | 32 -> `X8B8G8R8
  | 33 -> `N_FORMATS
  | n -> failwith (Printf.sprintf "MemoryFormat: unknown int %d" n)

let memoryformat_to_int v =
  match v with
  | `B8G8R8A8_PREMULTIPLIED -> 0
  | `A8R8G8B8_PREMULTIPLIED -> 1
  | `R8G8B8A8_PREMULTIPLIED -> 2
  | `B8G8R8A8 -> 3
  | `A8R8G8B8 -> 4
  | `R8G8B8A8 -> 5
  | `A8B8G8R8 -> 6
  | `R8G8B8 -> 7
  | `B8G8R8 -> 8
  | `R16G16B16 -> 9
  | `R16G16B16A16_PREMULTIPLIED -> 10
  | `R16G16B16A16 -> 11
  | `R16G16B16_FLOAT -> 12
  | `R16G16B16A16_FLOAT_PREMULTIPLIED -> 13
  | `R16G16B16A16_FLOAT -> 14
  | `R32G32B32_FLOAT -> 15
  | `R32G32B32A32_FLOAT_PREMULTIPLIED -> 16
  | `R32G32B32A32_FLOAT -> 17
  | `G8A8_PREMULTIPLIED -> 18
  | `G8A8 -> 19
  | `G8 -> 20
  | `G16A16_PREMULTIPLIED -> 21
  | `G16A16 -> 22
  | `G16 -> 23
  | `A8 -> 24
  | `A16 -> 25
  | `A16_FLOAT -> 26
  | `A32_FLOAT -> 27
  | `A8B8G8R8_PREMULTIPLIED -> 28
  | `B8G8R8X8 -> 29
  | `X8R8G8B8 -> 30
  | `R8G8B8X8 -> 31
  | `X8B8G8R8 -> 32
  | `N_FORMATS -> 33

type notifytype =
  [ `ANCESTOR
  | `VIRTUAL
  | `INFERIOR
  | `NONLINEAR
  | `NONLINEAR_VIRTUAL
  | `UNKNOWN ]

let notifytype_of_int n =
  match n with
  | 0 -> `ANCESTOR
  | 1 -> `VIRTUAL
  | 2 -> `INFERIOR
  | 3 -> `NONLINEAR
  | 4 -> `NONLINEAR_VIRTUAL
  | 5 -> `UNKNOWN
  | n -> failwith (Printf.sprintf "NotifyType: unknown int %d" n)

let notifytype_to_int v =
  match v with
  | `ANCESTOR -> 0
  | `VIRTUAL -> 1
  | `INFERIOR -> 2
  | `NONLINEAR -> 3
  | `NONLINEAR_VIRTUAL -> 4
  | `UNKNOWN -> 5

type scrolldirection = [ `UP | `DOWN | `LEFT | `RIGHT | `SMOOTH ]

let scrolldirection_of_int n =
  match n with
  | 0 -> `UP
  | 1 -> `DOWN
  | 2 -> `LEFT
  | 3 -> `RIGHT
  | 4 -> `SMOOTH
  | n -> failwith (Printf.sprintf "ScrollDirection: unknown int %d" n)

let scrolldirection_to_int v =
  match v with `UP -> 0 | `DOWN -> 1 | `LEFT -> 2 | `RIGHT -> 3 | `SMOOTH -> 4

type scrollunit = [ `WHEEL | `SURFACE ]

let scrollunit_of_int n =
  match n with
  | 0 -> `WHEEL
  | 1 -> `SURFACE
  | n -> failwith (Printf.sprintf "ScrollUnit: unknown int %d" n)

let scrollunit_to_int v = match v with `WHEEL -> 0 | `SURFACE -> 1

type subpixellayout =
  [ `UNKNOWN
  | `NONE
  | `HORIZONTAL_RGB
  | `HORIZONTAL_BGR
  | `VERTICAL_RGB
  | `VERTICAL_BGR ]

let subpixellayout_of_int n =
  match n with
  | 0 -> `UNKNOWN
  | 1 -> `NONE
  | 2 -> `HORIZONTAL_RGB
  | 3 -> `HORIZONTAL_BGR
  | 4 -> `VERTICAL_RGB
  | 5 -> `VERTICAL_BGR
  | n -> failwith (Printf.sprintf "SubpixelLayout: unknown int %d" n)

let subpixellayout_to_int v =
  match v with
  | `UNKNOWN -> 0
  | `NONE -> 1
  | `HORIZONTAL_RGB -> 2
  | `HORIZONTAL_BGR -> 3
  | `VERTICAL_RGB -> 4
  | `VERTICAL_BGR -> 5

type surfaceedge =
  [ `NORTH_WEST
  | `NORTH
  | `NORTH_EAST
  | `WEST
  | `EAST
  | `SOUTH_WEST
  | `SOUTH
  | `SOUTH_EAST ]

let surfaceedge_of_int n =
  match n with
  | 0 -> `NORTH_WEST
  | 1 -> `NORTH
  | 2 -> `NORTH_EAST
  | 3 -> `WEST
  | 4 -> `EAST
  | 5 -> `SOUTH_WEST
  | 6 -> `SOUTH
  | 7 -> `SOUTH_EAST
  | n -> failwith (Printf.sprintf "SurfaceEdge: unknown int %d" n)

let surfaceedge_to_int v =
  match v with
  | `NORTH_WEST -> 0
  | `NORTH -> 1
  | `NORTH_EAST -> 2
  | `WEST -> 3
  | `EAST -> 4
  | `SOUTH_WEST -> 5
  | `SOUTH -> 6
  | `SOUTH_EAST -> 7

type textureerror =
  [ `TOO_LARGE | `CORRUPT_IMAGE | `UNSUPPORTED_CONTENT | `UNSUPPORTED_FORMAT ]

let textureerror_of_int n =
  match n with
  | 0 -> `TOO_LARGE
  | 1 -> `CORRUPT_IMAGE
  | 2 -> `UNSUPPORTED_CONTENT
  | 3 -> `UNSUPPORTED_FORMAT
  | n -> failwith (Printf.sprintf "TextureError: unknown int %d" n)

let textureerror_to_int v =
  match v with
  | `TOO_LARGE -> 0
  | `CORRUPT_IMAGE -> 1
  | `UNSUPPORTED_CONTENT -> 2
  | `UNSUPPORTED_FORMAT -> 3

type titlebargesture = [ `DOUBLE_CLICK | `RIGHT_CLICK | `MIDDLE_CLICK ]

let titlebargesture_of_int n =
  match n with
  | 1 -> `DOUBLE_CLICK
  | 2 -> `RIGHT_CLICK
  | 3 -> `MIDDLE_CLICK
  | n -> failwith (Printf.sprintf "TitlebarGesture: unknown int %d" n)

let titlebargesture_to_int v =
  match v with `DOUBLE_CLICK -> 1 | `RIGHT_CLICK -> 2 | `MIDDLE_CLICK -> 3

type touchpadgesturephase = [ `BEGIN | `UPDATE | `END | `CANCEL ]

let touchpadgesturephase_of_int n =
  match n with
  | 0 -> `BEGIN
  | 1 -> `UPDATE
  | 2 -> `END
  | 3 -> `CANCEL
  | n -> failwith (Printf.sprintf "TouchpadGesturePhase: unknown int %d" n)

let touchpadgesturephase_to_int v =
  match v with `BEGIN -> 0 | `UPDATE -> 1 | `END -> 2 | `CANCEL -> 3

type vulkanerror = [ `UNSUPPORTED | `NOT_AVAILABLE ]

let vulkanerror_of_int n =
  match n with
  | 0 -> `UNSUPPORTED
  | 1 -> `NOT_AVAILABLE
  | n -> failwith (Printf.sprintf "VulkanError: unknown int %d" n)

let vulkanerror_to_int v =
  match v with `UNSUPPORTED -> 0 | `NOT_AVAILABLE -> 1

type anchorhints_flag =
  [ `FLIP_X
  | `FLIP_Y
  | `SLIDE_X
  | `SLIDE_Y
  | `RESIZE_X
  | `RESIZE_Y
  | `FLIP
  | `SLIDE
  | `RESIZE ]

type anchorhints = anchorhints_flag list

let anchorhints_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `FLIP_X :: acc else acc in
  let acc = if flags land 2 <> 0 then `FLIP_Y :: acc else acc in
  let acc = if flags land 4 <> 0 then `SLIDE_X :: acc else acc in
  let acc = if flags land 8 <> 0 then `SLIDE_Y :: acc else acc in
  let acc = if flags land 16 <> 0 then `RESIZE_X :: acc else acc in
  let acc = if flags land 32 <> 0 then `RESIZE_Y :: acc else acc in
  let acc = if flags land 3 <> 0 then `FLIP :: acc else acc in
  let acc = if flags land 12 <> 0 then `SLIDE :: acc else acc in
  let acc = if flags land 48 <> 0 then `RESIZE :: acc else acc in
  acc

let anchorhints_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `FLIP_X -> acc lor 1
      | `FLIP_Y -> acc lor 2
      | `SLIDE_X -> acc lor 4
      | `SLIDE_Y -> acc lor 8
      | `RESIZE_X -> acc lor 16
      | `RESIZE_Y -> acc lor 32
      | `FLIP -> acc lor 3
      | `SLIDE -> acc lor 12
      | `RESIZE -> acc lor 48)
    0 flags

type axisflags_flag =
  [ `X
  | `Y
  | `DELTA_X
  | `DELTA_Y
  | `PRESSURE
  | `XTILT
  | `YTILT
  | `WHEEL
  | `DISTANCE
  | `ROTATION
  | `SLIDER ]

type axisflags = axisflags_flag list

let axisflags_of_int flags =
  let acc = [] in
  let acc = if flags land 2 <> 0 then `X :: acc else acc in
  let acc = if flags land 4 <> 0 then `Y :: acc else acc in
  let acc = if flags land 8 <> 0 then `DELTA_X :: acc else acc in
  let acc = if flags land 16 <> 0 then `DELTA_Y :: acc else acc in
  let acc = if flags land 32 <> 0 then `PRESSURE :: acc else acc in
  let acc = if flags land 64 <> 0 then `XTILT :: acc else acc in
  let acc = if flags land 128 <> 0 then `YTILT :: acc else acc in
  let acc = if flags land 256 <> 0 then `WHEEL :: acc else acc in
  let acc = if flags land 512 <> 0 then `DISTANCE :: acc else acc in
  let acc = if flags land 1024 <> 0 then `ROTATION :: acc else acc in
  let acc = if flags land 2048 <> 0 then `SLIDER :: acc else acc in
  acc

let axisflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `X -> acc lor 2
      | `Y -> acc lor 4
      | `DELTA_X -> acc lor 8
      | `DELTA_Y -> acc lor 16
      | `PRESSURE -> acc lor 32
      | `XTILT -> acc lor 64
      | `YTILT -> acc lor 128
      | `WHEEL -> acc lor 256
      | `DISTANCE -> acc lor 512
      | `ROTATION -> acc lor 1024
      | `SLIDER -> acc lor 2048)
    0 flags

type dragaction_flag = [ `COPY | `MOVE | `LINK | `ASK ]
type dragaction = dragaction_flag list

let dragaction_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `COPY :: acc else acc in
  let acc = if flags land 2 <> 0 then `MOVE :: acc else acc in
  let acc = if flags land 4 <> 0 then `LINK :: acc else acc in
  let acc = if flags land 8 <> 0 then `ASK :: acc else acc in
  acc

let dragaction_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `COPY -> acc lor 1
      | `MOVE -> acc lor 2
      | `LINK -> acc lor 4
      | `ASK -> acc lor 8)
    0 flags

type frameclockphase_flag =
  [ `NONE
  | `FLUSH_EVENTS
  | `BEFORE_PAINT
  | `UPDATE
  | `LAYOUT
  | `PAINT
  | `RESUME_EVENTS
  | `AFTER_PAINT ]

type frameclockphase = frameclockphase_flag list

let frameclockphase_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `FLUSH_EVENTS :: acc else acc in
  let acc = if flags land 2 <> 0 then `BEFORE_PAINT :: acc else acc in
  let acc = if flags land 4 <> 0 then `UPDATE :: acc else acc in
  let acc = if flags land 8 <> 0 then `LAYOUT :: acc else acc in
  let acc = if flags land 16 <> 0 then `PAINT :: acc else acc in
  let acc = if flags land 32 <> 0 then `RESUME_EVENTS :: acc else acc in
  let acc = if flags land 64 <> 0 then `AFTER_PAINT :: acc else acc in
  acc

let frameclockphase_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `FLUSH_EVENTS -> acc lor 1
      | `BEFORE_PAINT -> acc lor 2
      | `UPDATE -> acc lor 4
      | `LAYOUT -> acc lor 8
      | `PAINT -> acc lor 16
      | `RESUME_EVENTS -> acc lor 32
      | `AFTER_PAINT -> acc lor 64)
    0 flags

type glapi_flag = [ `GL | `GLES ]
type glapi = glapi_flag list

let glapi_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `GL :: acc else acc in
  let acc = if flags land 2 <> 0 then `GLES :: acc else acc in
  acc

let glapi_to_int flags =
  List.fold_left
    (fun acc flag -> match flag with `GL -> acc lor 1 | `GLES -> acc lor 2)
    0 flags

type modifiertype_flag =
  [ `NO_MODIFIER_MASK
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
  | `META_MASK ]

type modifiertype = modifiertype_flag list

let modifiertype_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NO_MODIFIER_MASK :: acc else acc in
  let acc = if flags land 1 <> 0 then `SHIFT_MASK :: acc else acc in
  let acc = if flags land 2 <> 0 then `LOCK_MASK :: acc else acc in
  let acc = if flags land 4 <> 0 then `CONTROL_MASK :: acc else acc in
  let acc = if flags land 8 <> 0 then `ALT_MASK :: acc else acc in
  let acc = if flags land 256 <> 0 then `BUTTON1_MASK :: acc else acc in
  let acc = if flags land 512 <> 0 then `BUTTON2_MASK :: acc else acc in
  let acc = if flags land 1024 <> 0 then `BUTTON3_MASK :: acc else acc in
  let acc = if flags land 2048 <> 0 then `BUTTON4_MASK :: acc else acc in
  let acc = if flags land 4096 <> 0 then `BUTTON5_MASK :: acc else acc in
  let acc = if flags land 67108864 <> 0 then `SUPER_MASK :: acc else acc in
  let acc = if flags land 134217728 <> 0 then `HYPER_MASK :: acc else acc in
  let acc = if flags land 268435456 <> 0 then `META_MASK :: acc else acc in
  acc

let modifiertype_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NO_MODIFIER_MASK -> acc lor 0
      | `SHIFT_MASK -> acc lor 1
      | `LOCK_MASK -> acc lor 2
      | `CONTROL_MASK -> acc lor 4
      | `ALT_MASK -> acc lor 8
      | `BUTTON1_MASK -> acc lor 256
      | `BUTTON2_MASK -> acc lor 512
      | `BUTTON3_MASK -> acc lor 1024
      | `BUTTON4_MASK -> acc lor 2048
      | `BUTTON5_MASK -> acc lor 4096
      | `SUPER_MASK -> acc lor 67108864
      | `HYPER_MASK -> acc lor 134217728
      | `META_MASK -> acc lor 268435456)
    0 flags

type paintableflags_flag = [ `SIZE | `CONTENTS ]
type paintableflags = paintableflags_flag list

let paintableflags_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `SIZE :: acc else acc in
  let acc = if flags land 2 <> 0 then `CONTENTS :: acc else acc in
  acc

let paintableflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with `SIZE -> acc lor 1 | `CONTENTS -> acc lor 2)
    0 flags

type seatcapabilities_flag =
  [ `NONE
  | `POINTER
  | `TOUCH
  | `TABLET_STYLUS
  | `KEYBOARD
  | `TABLET_PAD
  | `ALL_POINTING
  | `ALL ]

type seatcapabilities = seatcapabilities_flag list

let seatcapabilities_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `POINTER :: acc else acc in
  let acc = if flags land 2 <> 0 then `TOUCH :: acc else acc in
  let acc = if flags land 4 <> 0 then `TABLET_STYLUS :: acc else acc in
  let acc = if flags land 8 <> 0 then `KEYBOARD :: acc else acc in
  let acc = if flags land 16 <> 0 then `TABLET_PAD :: acc else acc in
  let acc = if flags land 7 <> 0 then `ALL_POINTING :: acc else acc in
  let acc = if flags land 31 <> 0 then `ALL :: acc else acc in
  acc

let seatcapabilities_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `POINTER -> acc lor 1
      | `TOUCH -> acc lor 2
      | `TABLET_STYLUS -> acc lor 4
      | `KEYBOARD -> acc lor 8
      | `TABLET_PAD -> acc lor 16
      | `ALL_POINTING -> acc lor 7
      | `ALL -> acc lor 31)
    0 flags

type toplevelstate_flag =
  [ `MINIMIZED
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
  | `SUSPENDED ]

type toplevelstate = toplevelstate_flag list

let toplevelstate_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `MINIMIZED :: acc else acc in
  let acc = if flags land 2 <> 0 then `MAXIMIZED :: acc else acc in
  let acc = if flags land 4 <> 0 then `STICKY :: acc else acc in
  let acc = if flags land 8 <> 0 then `FULLSCREEN :: acc else acc in
  let acc = if flags land 16 <> 0 then `ABOVE :: acc else acc in
  let acc = if flags land 32 <> 0 then `BELOW :: acc else acc in
  let acc = if flags land 64 <> 0 then `FOCUSED :: acc else acc in
  let acc = if flags land 128 <> 0 then `TILED :: acc else acc in
  let acc = if flags land 256 <> 0 then `TOP_TILED :: acc else acc in
  let acc = if flags land 512 <> 0 then `TOP_RESIZABLE :: acc else acc in
  let acc = if flags land 1024 <> 0 then `RIGHT_TILED :: acc else acc in
  let acc = if flags land 2048 <> 0 then `RIGHT_RESIZABLE :: acc else acc in
  let acc = if flags land 4096 <> 0 then `BOTTOM_TILED :: acc else acc in
  let acc = if flags land 8192 <> 0 then `BOTTOM_RESIZABLE :: acc else acc in
  let acc = if flags land 16384 <> 0 then `LEFT_TILED :: acc else acc in
  let acc = if flags land 32768 <> 0 then `LEFT_RESIZABLE :: acc else acc in
  let acc = if flags land 65536 <> 0 then `SUSPENDED :: acc else acc in
  acc

let toplevelstate_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `MINIMIZED -> acc lor 1
      | `MAXIMIZED -> acc lor 2
      | `STICKY -> acc lor 4
      | `FULLSCREEN -> acc lor 8
      | `ABOVE -> acc lor 16
      | `BELOW -> acc lor 32
      | `FOCUSED -> acc lor 64
      | `TILED -> acc lor 128
      | `TOP_TILED -> acc lor 256
      | `TOP_RESIZABLE -> acc lor 512
      | `RIGHT_TILED -> acc lor 1024
      | `RIGHT_RESIZABLE -> acc lor 2048
      | `BOTTOM_TILED -> acc lor 4096
      | `BOTTOM_RESIZABLE -> acc lor 8192
      | `LEFT_TILED -> acc lor 16384
      | `LEFT_RESIZABLE -> acc lor 32768
      | `SUSPENDED -> acc lor 65536)
    0 flags
