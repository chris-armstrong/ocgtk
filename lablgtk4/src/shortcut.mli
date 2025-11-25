(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Shortcut *)

type t = Gtk.widget

(** Create a new Shortcut *)
external new_ : Gtk.widget option -> Gtk.widget option -> t = "ml_gtk_shortcut_new"

(** Create a new Shortcut *)
external new_with_arguments : Gtk.widget option -> Gtk.widget option -> string option -> unit -> t = "ml_gtk_shortcut_new_with_arguments"

(* Properties *)

(** Sets the new trigger for @self to be @trigger. *)
external set_trigger : t -> Gtk.widget option -> unit = "ml_gtk_shortcut_set_trigger"

(** Sets the new action for @self to be @action. *)
external set_action : t -> Gtk.widget option -> unit = "ml_gtk_shortcut_set_action"

(** Gets the trigger used to trigger @self. *)
external get_trigger : t -> Gtk.widget = "ml_gtk_shortcut_get_trigger"

(** Gets the action that is activated by this shortcut. *)
external get_action : t -> Gtk.widget = "ml_gtk_shortcut_get_action"

