(** GTK4 Widget Base Module *)

(** Core widget type *)
type widget = [`widget] Gobject.obj

(** Widget-related types *)
type requisition = { width : int; height : int }
type allocation = { x : int; y : int; width : int; height : int }

(** Align type - to be defined in enums *)
(* For now, using a simple variant *)
type align = [
  | `FILL
  | `START
  | `END
  | `CENTER
  | `BASELINE
]

(** Size request mode *)
type size_request_mode = [
  | `HEIGHT_FOR_WIDTH
  | `WIDTH_FOR_HEIGHT
  | `CONSTANT_SIZE
]

(** State flags *)
type state_flags = [
  | `NORMAL
  | `ACTIVE
  | `PRELIGHT
  | `SELECTED
  | `INSENSITIVE
  | `INCONSISTENT
  | `FOCUSED
  | `BACKDROP
  | `DIR_LTR
  | `DIR_RTL
  | `LINK
  | `VISITED
  | `CHECKED
  | `DROP_ACTIVE
]

(** Orientation type *)
type orientation = [
  | `HORIZONTAL
  | `VERTICAL
]

(** Baseline position *)
type baseline_position = [
  | `TOP
  | `CENTER
  | `BOTTOM
]

(** Position type for side/position specification *)
type position_type = [
  | `LEFT
  | `RIGHT
  | `TOP
  | `BOTTOM
]

(** Stack transition type *)
type stack_transition_type = [
  | `NONE
  | `CROSSFADE
  | `SLIDE_RIGHT
  | `SLIDE_LEFT
  | `SLIDE_UP
  | `SLIDE_DOWN
  | `SLIDE_LEFT_RIGHT
  | `SLIDE_UP_DOWN
  | `OVER_UP
  | `OVER_DOWN
  | `OVER_LEFT
  | `OVER_RIGHT
  | `UNDER_UP
  | `UNDER_DOWN
  | `UNDER_LEFT
  | `UNDER_RIGHT
  | `OVER_UP_DOWN
  | `OVER_DOWN_UP
  | `OVER_LEFT_RIGHT
  | `OVER_RIGHT_LEFT
  | `ROTATE_LEFT
  | `ROTATE_RIGHT
  | `ROTATE_LEFT_RIGHT
]
