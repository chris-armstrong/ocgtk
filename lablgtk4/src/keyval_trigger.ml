(* GENERATED CODE - DO NOT EDIT *)
(* Widget: KeyvalTrigger *)

type t = Gtk.widget

(** Create a new KeyvalTrigger *)
external new_ : int -> Gdk.modifiertype -> t = "ml_gtk_keyval_trigger_new"

(* Properties *)

(** Gets the modifiers that must be present to succeed
triggering @self. *)
external get_modifiers : t -> Gdk.modifiertype = "ml_gtk_keyval_trigger_get_modifiers"

(** Gets the keyval that must be pressed to succeed
triggering @self. *)
external get_keyval : t -> int = "ml_gtk_keyval_trigger_get_keyval"

