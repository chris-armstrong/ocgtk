(* GENERATED CODE - DO NOT EDIT *)
(* Widget: DragSource *)

type t = Gtk.Widget.t

(** Create a new DragSource *)
external new_ : unit -> t = "ml_gtk_drag_source_new"

(* Properties *)

external set_icon : t -> unit -> int -> int -> unit = "ml_gtk_drag_source_set_icon"

external set_content : t -> unit -> unit = "ml_gtk_drag_source_set_content"

external set_actions : t -> Gdk.dragaction -> unit = "ml_gtk_drag_source_set_actions"

external get_actions : t -> Gdk.dragaction = "ml_gtk_drag_source_get_actions"

external drag_cancel : t -> unit = "ml_gtk_drag_source_drag_cancel"

