(* GENERATED CODE - DO NOT EDIT *)
(* Widget: WindowControls *)

type t = [`window_controls | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new WindowControls *)
external new_ : Gtk_enums.packtype -> t = "ml_gtk_window_controls_new"

(* Properties *)

(** Determines which part of decoration layout the `GtkWindowControls` uses.

See [property@Gtk.WindowControls:decoration-layout]. *)
external set_side : t -> Gtk_enums.packtype -> unit = "ml_gtk_window_controls_set_side"

(** Sets the decoration layout for the title buttons.

This overrides the [property@Gtk.Settings:gtk-decoration-layout]
setting.

The format of the string is button names, separated by commas.
A colon separates the buttons that should appear on the left
from those on the right. Recognized button names are minimize,
maximize, close and icon (the window icon).

For example, “icon:minimize,maximize,close” specifies a icon
on the left, and minimize, maximize and close buttons on the right.

If [property@Gtk.WindowControls:side] value is @GTK_PACK_START, @self
will display the part before the colon, otherwise after that. *)
external set_decoration_layout : t -> string option -> unit = "ml_gtk_window_controls_set_decoration_layout"

(** Gets the side to which this `GtkWindowControls` instance belongs. *)
external get_side : t -> Gtk_enums.packtype = "ml_gtk_window_controls_get_side"

(** Gets whether the widget has any window buttons. *)
external get_empty : t -> bool = "ml_gtk_window_controls_get_empty"

(** Gets the decoration layout of this `GtkWindowControls`. *)
external get_decoration_layout : t -> string = "ml_gtk_window_controls_get_decoration_layout"

