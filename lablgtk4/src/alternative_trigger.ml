(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AlternativeTrigger *)

type t = Gtk.widget

(** Create a new AlternativeTrigger *)
external new_ : Gtk.widget -> Gtk.widget -> t = "ml_gtk_alternative_trigger_new"

(* Properties *)

(** Gets the second of the two alternative triggers that may
trigger @self.

[method@Gtk.AlternativeTrigger.get_first] will return
the other one. *)
external get_second : t -> Gtk.widget = "ml_gtk_alternative_trigger_get_second"

(** Gets the first of the two alternative triggers that may
trigger @self.

[method@Gtk.AlternativeTrigger.get_second] will return
the other one. *)
external get_first : t -> Gtk.widget = "ml_gtk_alternative_trigger_get_first"

