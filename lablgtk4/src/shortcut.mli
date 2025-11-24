(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Shortcut *)

type t = Gtk.widget

(** Create a new Shortcut *)
external new_ : Gtk.widget option -> Gtk.widget option -> t = "ml_gtk_shortcut_new"

(** Create a new Shortcut *)
external new_with_arguments : Gtk.widget option -> Gtk.widget option -> string option -> unit -> t = "ml_gtk_shortcut_new_with_arguments"

(* Properties *)

external set_trigger : t -> Gtk.widget option -> unit = "ml_gtk_shortcut_set_trigger"

external set_action : t -> Gtk.widget option -> unit = "ml_gtk_shortcut_set_action"

external get_trigger : t -> Gtk.widget = "ml_gtk_shortcut_get_trigger"

external get_action : t -> Gtk.widget = "ml_gtk_shortcut_get_action"

