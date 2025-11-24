(* GENERATED CODE - DO NOT EDIT *)
(* Widget: KeyvalTrigger *)

type t = Gtk.Widget.t

(** Create a new KeyvalTrigger *)
external new_ : int -> Gdk.modifiertype -> t = "ml_gtk_keyval_trigger_new"

(* Properties *)

(** Get property: keyval *)
external get_keyval : t -> int = "ml_gtk_keyval_trigger_get_keyval"

external get_modifiers : t -> Gdk.modifiertype = "ml_gtk_keyval_trigger_get_modifiers"

