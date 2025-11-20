(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Shortcut *)

type t = Gtk.Widget.t

(** Create a new Shortcut *)
external new_ : Gtk.Widget.t option -> Gtk.Widget.t option -> t = "ml_gtk_shortcut_new"

(** Create a new Shortcut *)
external new_with_arguments : Gtk.Widget.t option -> Gtk.Widget.t option -> string option -> unit -> t = "ml_gtk_shortcut_new_with_arguments"

(* Properties *)

external set_trigger : t -> Gtk.Widget.t option -> unit = "ml_gtk_shortcut_set_trigger"

external set_arguments : t -> unit -> unit = "ml_gtk_shortcut_set_arguments"

external set_action : t -> Gtk.Widget.t option -> unit = "ml_gtk_shortcut_set_action"

external get_trigger : t -> Gtk.Widget.t = "ml_gtk_shortcut_get_trigger"

external get_action : t -> Gtk.Widget.t = "ml_gtk_shortcut_get_action"

