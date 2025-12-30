(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ListBase *)

type t = [`list_base | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(* Methods *)
(* Properties *)

(** Get property: orientation *)
external get_orientation : t -> Gtk_enums.orientation = "ml_gtk_list_base_get_orientation"

(** Set property: orientation *)
external set_orientation : t -> Gtk_enums.orientation -> unit = "ml_gtk_list_base_set_orientation"

