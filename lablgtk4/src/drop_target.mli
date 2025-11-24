(* GENERATED CODE - DO NOT EDIT *)
(* Widget: DropTarget *)

type t = Gtk.Widget.t

(** Create a new DropTarget *)
external new_ : unit -> Gdk.dragaction -> t = "ml_gtk_drop_target_new"

(* Properties *)

(** Get property: preload *)
external get_preload : t -> bool = "ml_gtk_drop_target_get_preload"

(** Set property: preload *)
external set_preload : t -> bool -> unit = "ml_gtk_drop_target_set_preload"

external set_actions : t -> Gdk.dragaction -> unit = "ml_gtk_drop_target_set_actions"

external reject : t -> unit = "ml_gtk_drop_target_reject"

external get_actions : t -> Gdk.dragaction = "ml_gtk_drop_target_get_actions"

