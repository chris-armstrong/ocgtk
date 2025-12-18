(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Switch *)

type t = [`switch | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Switch *)
external new_ : unit -> t = "ml_gtk_switch_new"

(* Properties *)

(** Get property: active *)
external get_active : t -> bool = "ml_gtk_switch_get_active"

(** Set property: active *)
external set_active : t -> bool -> unit = "ml_gtk_switch_set_active"

(** Get property: state *)
external get_state : t -> bool = "ml_gtk_switch_get_state"

(** Set property: state *)
external set_state : t -> bool -> unit = "ml_gtk_switch_set_state"

