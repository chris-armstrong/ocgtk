(* GTK4 Stack Container - Manually Created *)

type t = [`stack | `widget] Gobject.obj

(** {2 External C bindings} *)

external create : unit -> t = "ml_gtk_stack_new"
external add_named_impl : t -> Gtk.widget -> string -> unit = "ml_gtk_stack_add_named"
external add_titled_impl : t -> Gtk.widget -> string -> string -> unit = "ml_gtk_stack_add_titled"
external add_child : t -> Gtk.widget -> unit = "ml_gtk_stack_add_child"
external remove : t -> Gtk.widget -> unit = "ml_gtk_stack_remove"
external get_visible_child : t -> Gtk.widget option = "ml_gtk_stack_get_visible_child"
external set_visible_child : t -> Gtk.widget -> unit = "ml_gtk_stack_set_visible_child"
external set_visible_child_name : t -> string -> unit = "ml_gtk_stack_set_visible_child_name"
external get_visible_child_name : t -> string option = "ml_gtk_stack_get_visible_child_name"
external set_transition_type_impl : t -> int -> unit = "ml_gtk_stack_set_transition_type"
external get_transition_type_impl : t -> int = "ml_gtk_stack_get_transition_type"
external set_transition_duration : t -> int -> unit = "ml_gtk_stack_set_transition_duration"
external get_transition_duration : t -> int = "ml_gtk_stack_get_transition_duration"

(** {2 Helper functions} *)

let stack_transition_type_to_int : Gtk.stack_transition_type -> int = function
  | `NONE -> 0
  | `CROSSFADE -> 1
  | `SLIDE_RIGHT -> 2
  | `SLIDE_LEFT -> 3
  | `SLIDE_UP -> 4
  | `SLIDE_DOWN -> 5
  | `SLIDE_LEFT_RIGHT -> 6
  | `SLIDE_UP_DOWN -> 7
  | `OVER_UP -> 8
  | `OVER_DOWN -> 9
  | `OVER_LEFT -> 10
  | `OVER_RIGHT -> 11
  | `UNDER_UP -> 12
  | `UNDER_DOWN -> 13
  | `UNDER_LEFT -> 14
  | `UNDER_RIGHT -> 15
  | `OVER_UP_DOWN -> 16
  | `OVER_DOWN_UP -> 17
  | `OVER_LEFT_RIGHT -> 18
  | `OVER_RIGHT_LEFT -> 19
  | `ROTATE_LEFT -> 20
  | `ROTATE_RIGHT -> 21
  | `ROTATE_LEFT_RIGHT -> 22

let int_to_stack_transition_type : int -> Gtk.stack_transition_type = function
  | 0 -> `NONE
  | 1 -> `CROSSFADE
  | 2 -> `SLIDE_RIGHT
  | 3 -> `SLIDE_LEFT
  | 4 -> `SLIDE_UP
  | 5 -> `SLIDE_DOWN
  | 6 -> `SLIDE_LEFT_RIGHT
  | 7 -> `SLIDE_UP_DOWN
  | 8 -> `OVER_UP
  | 9 -> `OVER_DOWN
  | 10 -> `OVER_LEFT
  | 11 -> `OVER_RIGHT
  | 12 -> `UNDER_UP
  | 13 -> `UNDER_DOWN
  | 14 -> `UNDER_LEFT
  | 15 -> `UNDER_RIGHT
  | 16 -> `OVER_UP_DOWN
  | 17 -> `OVER_DOWN_UP
  | 18 -> `OVER_LEFT_RIGHT
  | 19 -> `OVER_RIGHT_LEFT
  | 20 -> `ROTATE_LEFT
  | 21 -> `ROTATE_RIGHT
  | 22 -> `ROTATE_LEFT_RIGHT
  | _ -> `NONE

(** {2 Wrapped functions} *)

let add_named stack ~child ~name =
  add_named_impl stack child name

let add_titled stack ~child ~name ~title =
  add_titled_impl stack child name title

let set_transition_type stack (tt : Gtk.stack_transition_type) =
  set_transition_type_impl stack (stack_transition_type_to_int tt)

let get_transition_type stack : Gtk.stack_transition_type =
  int_to_stack_transition_type (get_transition_type_impl stack)

let as_widget (stack : t) : Gtk.widget = Obj.magic stack
