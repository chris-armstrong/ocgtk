(* GENERATED CODE - DO NOT EDIT *)
(* Widget: DragIcon *)

type t = [`drag_icon | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(* Properties *)

(** Sets the widget to display as the drag icon. *)
external set_child : t -> Gtk.widget option -> unit = "ml_gtk_drag_icon_set_child"

(** Gets the widget currently used as drag icon. *)
external get_child : t -> Gtk.widget option = "ml_gtk_drag_icon_get_child"

