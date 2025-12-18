(* GENERATED CODE - DO NOT EDIT *)
(* Widget: WindowControls *)

type t = [`window_controls | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new WindowControls *)
external new_ : Gtk_enums.packtype -> t = "ml_gtk_window_controls_new"

(* Properties *)

(** Get property: decoration-layout *)
external get_decoration_layout : t -> string = "ml_gtk_window_controls_get_decoration_layout"

(** Set property: decoration-layout *)
external set_decoration_layout : t -> string -> unit = "ml_gtk_window_controls_set_decoration_layout"

(** Get property: empty *)
external get_empty : t -> bool = "ml_gtk_window_controls_get_empty"

(** Determines which part of decoration layout the `GtkWindowControls` uses.

See [property@Gtk.WindowControls:decoration-layout]. *)
external set_side : t -> Gtk_enums.packtype -> unit = "ml_gtk_window_controls_set_side"

(** Gets the side to which this `GtkWindowControls` instance belongs. *)
external get_side : t -> Gtk_enums.packtype = "ml_gtk_window_controls_get_side"

