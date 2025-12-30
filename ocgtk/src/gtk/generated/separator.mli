(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Separator *)

type t = [`separator | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Separator *)
external new_ : Gtk_enums.orientation -> t = "ml_gtk_separator_new"

(* Methods *)
