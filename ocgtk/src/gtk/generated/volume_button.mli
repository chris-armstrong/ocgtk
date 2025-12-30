(* GENERATED CODE - DO NOT EDIT *)
(* Widget: VolumeButton *)

type t = [`volume_button | `scale_button | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new VolumeButton *)
external new_ : unit -> t = "ml_gtk_volume_button_new"

(* Methods *)
(* Properties *)

(** Get property: use-symbolic *)
external get_use_symbolic : t -> bool = "ml_gtk_volume_button_get_use_symbolic"

(** Set property: use-symbolic *)
external set_use_symbolic : t -> bool -> unit = "ml_gtk_volume_button_set_use_symbolic"

